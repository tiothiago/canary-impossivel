local mType = Game.createMonsterType("Yeti")
local monster = {}

monster.description = "a yeti"
monster.experience = 460
monster.outfit = {
	lookType = 110,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 110
monster.Bestiary = {
	class = "Mammal",
	race = BESTY_RACE_MAMMAL,
	toKill = 5,
	FirstUnlock = 2,
	SecondUnlock = 3,
	CharmsPoints = 50,
	Stars = 3,
	Occurrence = 3,
	Locations = "Folda, Chyllfroest, Isle of Merriment."
	}

monster.health = 950
monster.maxHealth = 950
monster.race = "blood"
monster.corpse = 6038
monster.speed = 125
monster.manaCost = 0

monster.changeTarget = {
	interval = 1000,
	chance = 5
}

monster.strategiesTarget = {
	nearest = 70,
	damage = 30,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false,
	pet = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Yooodelaaahooohooo", yell = false},
	{text = "Yooodelaaaheehee", yell = false}
}

monster.loot = {
	{id = 2992, chance = 50000, maxCount = 22},
	{name = "gold coin", chance = 60000, maxCount = 610},
	{name = "gold coin", chance = 30000, maxCount = 20},
	{name = "bunnyslippers", chance = 100},
	{name = "meat", chance = 75000, maxCount = 4},
	{name = "ham", chance = 35000, maxCount = 6},
	{id = 5940, chance = 500} -- wolf tooth chain
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 79, attack = 53},
	{name ="snow ball check shield", interval = 2000, chance = 15, minDamage = -170, maxDamage = -200},
	{name ="combat", interval = 2000, chance = 12, type = COMBAT_ENERGYDAMAGE, minDamage = -120, maxDamage = -210, length = 3, spread = 3, effect = CONST_ME_POFF, target = false}
}

monster.defenses = {
	defense = 43,
	armor = 28
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
