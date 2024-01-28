local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLSTONE)
combat:setParameter(COMBAT_PARAM_BLOCKSHIELD, 1)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:name("small stone check shield")
spell:words("###602")
spell:isAggressive(true)
spell:blockWalls(true)
spell:needLearn(false)
spell:range(7)
spell:needTarget(true)
spell:register()