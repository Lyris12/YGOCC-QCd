--created by Jake, coded by Lyris
--Essence Synthesizer
local s,id,o=GetID()
function s.initial_effect(c)
	c:EnableReviveLimit()
	aux.AddLinkProcedure(c,nil,2,2,s.mchk)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_FIELD)
	e1:SetCode(EFFECT_UPDATE_ATTACK)
	e1:SetRange(LOCATION_MZONE)
	e1:SetTargetRange(LOCATION_MZONE,LOCATION_MZONE)
	e1:SetValue(s.aval)
	c:RegisterEffect(e1)
	local e2=e1:Clone()
	e2:SetCode(EFFECT_UPDATE_DEFENSE)
	e2:SetValue(s.dval)
	c:RegisterEffect(e2)
	local e3=Effect.CreateEffect(c)
	e3:SetType(EFFECT_TYPE_QUICK_O)
	e3:SetCode(EVENT_SPSUMMON_SUCCESS)
	e3:SetRange(LOCATION_MZONE)
	e3:HOPT()
	e3:SetProperty(EFFECT_FLAG_CARD_TARGET+EFFECT_FLAG_DELAY)
	e3:SetCategory(CATEGORY_DISABLE+CATEGORY_ATKCHANGE+CATEGORY_DEFCHANGE)
	e3:SetCondition()
	e3:SetTarget()
	e3:SetOperation()
	c:RegisterEffect(e3)
end
function s.mfilter(c)
	return c:IsPositive() or c:IsNegative()
end
function s.mchk(g)
	return g:IsExists(s.mfilter,1,nil)
end
function s.aval(e,c)
	local a=c:GetBaseAttack()
	if not c:IsDefenseAbove(0) then return math.ceil(a/2) end
	local d=c:GetBaseDefense()
	return a>d and -math.ceil(math.min(a,d)/2) or 0
end
function s.dval(e,c)
	local a,d=c:GetBaseAttack(),c:GetBaseDefense()
	return c:IsDefenseAbove(0) and d>a and -math.ceil(math.min(a,d)/2) or 0
end
