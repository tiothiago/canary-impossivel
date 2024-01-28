local mType = Game.createMonsterType("Amazon")
local monster = {}

monster.description = "an amazon"
monster.experience = 60
monster.outfit = {
	lookType = 137,
	lookHead = 113,
	lookBody = 120,
	lookLegs = 95,
	lookFeet = 115,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 77
monster.Bestiary = {
	class = "Human",
	race = BESTY_RACE_HUMAN,
	toKill = 500,
	FirstUnlock = 25,
	SecondUnlock = 250,
	CharmsPoints = 15,
	Stars = 2,
	Occurrence = 0,
	Locations = "Venore Amazon Camp, Carlin Amazon Camp, Amazon Tower, east of Carlin, underneath the Fields of Glory, \z
		west of Venore, Oasis Tomb, on the smallest of the Laguna Islands, Foreigner Quarter and Trade Quarter.",
}

monster.health = 110
monster.maxHealth = 110
monster.race = "blood"
monster.corpse = 18042
monster.speed = 86
monster.manaCost = 390
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = true,
	attackable = true,
	hostile = true,
	convinceable = true,
	pushable = false,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 4,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false,
	pet = false,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Yeeee ha!", yell = false },
	{ text = "Your head shall be mine!", yell = false },
	{ text = "Your head will be mine!", yell = false },
}

monster.loot = {

	{ name = "dagger", chance = 80000 },
	{ name = "studded shield", chance = 5000 },
	{ id = 2920, chance = 5000 }, -- torch
	{ name = "sabre", chance = 23000 },

	{ name = "leather armor", chance = 50000 },
	{ id = 3114, chance = 80000, maxCount = 2 }, -- skull
	{ name = "gold coin", chance = 40000, maxCount = 10 },
	{ name = "brown bread", chance = 30000 },
	{ name = "girlish hair decoration", chance = 10000 },
	{ name = "protective charm", chance = 5200 },
	{ name = "crystal necklace", chance = 260 },
	{ name = "small ruby", chance = 130 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -27 },
	{ name = "throwing knife check shield", interval = 1000, chance = 10, minDamage = -20, maxDamage = -30 },
}

monster.defenses = {
	defense = 11,
	armor = 11,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)
