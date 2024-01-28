local callback = EventCallback()

function Player:canReceiveLoot()
	return self:getStamina() > 840
end

local itemTable = { "plate armor" }

function containsString(table, searchString)
	for _, value in ipairs(table) do
		if value == searchString then
			return true
		end
	end
	return false
end

local legendaryChance = { 0, 1000 }
local epicChance = { 1001, 5000 }
local rareChance = { 5001, 25000 }
local rolledRarity
local newItem

function callback.monsterOnDropLoot(monster, corpse)
	local player = Player(corpse:getCorpseOwner())
	local factor = 1.0
	local msgSuffix = ""

	if player and player:canReceiveLoot() then
		local lootConfig = player:calculateLootFactor(monster)
		factor = lootConfig.factor
		msgSuffix = lootConfig.msgSuffix
	end

	local mType = monster:getType()

	if not mType then
		logger.warning("monsterOnDropLoot: monster has no type")
		return
	end

	local charm = player and player:getCharmMonsterType(CHARM_GUT)
	local gut = charm and charm:raceId() == mType:raceId()

	local lootTable = mType:generateLootRoll({ factor = factor, gut = gut }, {})
	corpse:addLoot(lootTable)

	local analyzeLoot = corpse:getItems()

	for i, loot in ipairs(analyzeLoot) do
		local itemName = loot:getName():lower()

		if containsString(itemTable, itemName) then
			local rarityRoll = math.random(100000)

			-- Inicializa com uma string vazia para o caso em que rarityRoll é menor que todos os valores de chance
			local rolledRarity = ""
			local rarityEffect
			local rarityEvent = false

			if rarityRoll >= legendaryChance[1] and rarityRoll <= legendaryChance[2] then
				rolledRarity = "legendary"
				rarityEffect = 197
				rarityEvent = true
			elseif rarityRoll >= epicChance[1] and rarityRoll <= epicChance[2] then
				rolledRarity = "epic"
				rarityEffect = 198
				rarityEvent = true
			elseif rarityRoll >= rareChance[1] and rarityRoll <= rareChance[2] then
				rolledRarity = "rare"
				rarityEffect = 199
				rarityEvent = true
			end

			if rarityEvent then
				local position = monster:getPosition()
				loot:remove(1)
				newItem = getItemIdByName(rolledRarity .. " " .. itemName)
				corpse:addItem(newItem, 1)
				addEvent(function()
					position:sendMagicEffect(rarityEffect)
				end, 1)
				rarityEvent = false
			end
		end
	end

	for _, item in ipairs(lootTable) do
		if item.gut then
			msgSuffix = msgSuffix .. " (active charm bonus)"
		end
	end

	local existingSuffix = corpse:getAttribute(ITEM_ATTRIBUTE_LOOTMESSAGE_SUFFIX) or ""
	corpse:setAttribute(ITEM_ATTRIBUTE_LOOTMESSAGE_SUFFIX, existingSuffix .. msgSuffix)

	return true
end

callback:register()
