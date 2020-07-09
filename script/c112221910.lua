--Empation - Jess
function c112221910.initial_effect(c)
	c:EnableReviveLimit()
	--mat=2 "Empation" monsters
	aux.AddLinkProcedure(c,aux.FilterBoolFunction(Card.IsSetCard,0xcda),2,2)
	--You can only control 1 "Empation - Jess".
	c:SetUniqueOnField(1,0,id)
	--You can only use each effect of "Empation - Jess" once per turn.
	--If this card is Link Summoned while you do not control "Dreamer - Alvis": You can Special Summon 1 "Dreamer - Alvis" from your hand or GY.
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_O)
	e2:SetCode(EVENT_SPSUMMON_SUCCESS)
	e2:SetProperty(EFFECT_FLAG_DELAY+EFFECT_FLAG_DAMAGE_STEP)
	e2:SetCategory(CATEGORY_SPECIAL_SUMMON)
	e2:SetCondition(function(e,tp) return e:GetHandler():IsSummonType(SUMMON_TYPE_LINK) and not Duel.IsExistingMatchingCard(aux.AND(Card.IsFaceup,Card.IsCode),tp,LOCATION_ONFIELD,0,1,nil,id-10) end)
	e2:SetTarget(cid.target)
	e2:SetOperation(cid.operation)
	c:RegisterEffect(e2)
	--If "Dreamer - Alvis" is Summoned: You can equip this card and all "Empation" monsters this card points to to 1 "Dreamer - Alvis" you control.
	local e1=Effect.CreateEffect(c)
	e1:SetCondition(function(e,tp,eg) return eg:IsExists(aux.AND(Card.IsFaceup,Card.IsCode),1,nil,id-10) end)
	c:RegisterEffect(e1)
	--"Dreamer - Alvis" equipped with this card is unaffected by your opponent's monster effects.
	local e0=Effect.CreateEffect(c)
	e0:SetType(EFFECT_TYPE_EQUIP)
	e0:SetCode(EFFECT_IMMUNE_EFFECT)
	e0:SetCondition(function(e) return e:GetHandler():GetEquipTarget():IsCode(id-2) end)
	e0:SetValue(function(e,te) return te:IsActiveType(TYPE_MONSTER) and e:GetHandlerPlayer()~=te:GetOwnerPlayer() end)
	c:RegisterEffect(e0)
end
