local mType = Game.createMonsterType("Lich")
local monster = {}

monster.description = "a lich"
monster.experience = 900
monster.outfit = {
	lookType = 99,
	lookHead = 95,
	lookBody = 116,
	lookLegs = 119,
	lookFeet = 115,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 99
monster.Bestiary = {
	class = "Undead",
	race = BESTY_RACE_UNDEAD,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Ankrahmun Library Tomb, Ancient Ruins Tomb, Oasis Tomb, Mountain Tomb, Drefia, Kharos, \z
		Pits of Inferno, Lich Hell in Ramoa, Cemetery Quarter in Yalahar, underground of Fenrock (on the way to Beregar). \z
		Can also be seen during an undead raid in Darashia or Carlin.",
}

monster.health = 880
monster.maxHealth = 880
monster.race = "undead"
monster.corpse = 6028
monster.speed = 105
monster.manaCost = 0

monster.changeTarget = {
	interval = 1000,
	chance = 3,
}

monster.strategiesTarget = {
	nearest = 80,
	health = 10,
	damage = 10,
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
	canWalkOnFire = true,
	canWalkOnPoison = true,
	pet = false,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.summon = {
	maxSummons = 4,
	summons = {
		{ name = "Bonebeast", chance = 17, interval = 2000, count = 4 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Doomed be the living!", yell = false },
	{ text = "Death awaits all!", yell = false },
	{ text = "Thy living flesh offends me!", yell = false },
	{ text = "Death and Decay!", yell = false },
	{ text = "You will endure agony beyond thy death!", yell = false },
	{ text = "Pain sweet pain!", yell = false },
	{ text = "Come to me my children!", yell = false },
}

monster.loot = {
	{ name = "skull staff", chance = 500 },
	{ name = "castle shield", chance = 200 },
	{ id = 3098, chance = 1000 }, -- ring of healing
	{ id = 3059, chance = 10000 }, -- spellbook
	{ name = "white pearl", chance = 5000 },
	{ name = "black pearl", chance = 6000, maxCount = 3 },
	{ name = "gold coin", chance = 100000, maxCount = 139 },
	{ name = "gold coin", chance = 100000, maxCount = 139 },
	{ name = "small emerald", chance = 2000, maxCount = 3 },
	{ name = "platinum coin", chance = 20000 },
	{ name = "yellow gem", chance = 700 },
	{ name = "platinum amulet", chance = 450 },
	{ name = "mind stone", chance = 350 },
	{ name = "strange helmet", chance = 700 },
	{ name = "ancient shield", chance = 2500 },
	{ name = "blue robe", chance = 150 },
	{ name = "strong mana potion", chance = 7500 },
	{ name = "lightning boots", chance = 200 },
	{ name = "small topaz", chance = 2500, maxCount = 3 },
	{ name = "maxilla maximus", chance = 100 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 40, attack = 40, condition = { type = CONDITION_POISON, totalDamage = 400, interval = 2000 } },
	{ name = "combat", interval = 2000, chance = 4, type = COMBAT_LIFEDRAIN, minDamage = -50, maxDamage = -250, range = 1, effect = CONST_ME_MAGIC_RED, target = true },
	{ name = "combat", interval = 2000, chance = 17, type = COMBAT_LIFEDRAIN, minDamage = -120, maxDamage = -200, radius = 3, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "combat", interval = 2000, chance = 9, type = COMBAT_LIFEDRAIN, minDamage = -100, maxDamage = -200, length = 8, spread = 0, effect = CONST_ME_MAGIC_RED, target = false },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 9, minDamage = -300, maxDamage = -400, length = 8, spread = 3, effect = CONST_ME_HITBYPOISON, target = false },
	-- paralyze
	{ name = "speed", interval = 2000, chance = 15, speedChange = -300, range = 7, effect = CONST_ME_MAGIC_RED, target = false, duration = 30000 },
}

monster.defenses = {
	defense = 60,
	armor = 50,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 80, maxDamage = 150, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
