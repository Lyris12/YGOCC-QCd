--created by LeonDuvall
--Skypiercer ME-262
local s,id,o=GetID()
function s.initial_effect(c)
	c:EnableReviveLimit()
	--mat=2 Level 4 WIND Machine monsters
	aux.AddXyzProcedure(c,s.mfilter,4,2)
	-- Immunity to Targeting/Destroy
	local e0 = Effect.CreateEffect(c)
	e0:SetType(EFFECT_TYPE_SINGLE)
	e0:SetCode(EFFECT_CANNOT_BE_EFFECT_TARGET)
	e0:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e0:SetRange(LOCATION_MZONE)
	e0:SetCondition(s.effcon)
	e0:SetValue(aux.tgoval)
	c:RegisterEffect(e0)
	local e1 = e0:Clone()
	e1:SetCode(EFFECT_INDESTRUCTABLE_EFFECT)
	e1:SetValue(aux.indoval)
	c:RegisterEffect(e1)
	-- Monster effect negation
	local e2 = Effect.CreateEffect(c)
	e2:SetCategory(CATEGORY_POSITION)
	e2:SetType(EFFECT_TYPE_QUICK_O)
	e2:SetCode(EVENT_CHAINING)
	e2:SetRange(LOCATION_MZONE)
	e2:SetCountLimit(1)
	e2:SetCondition(s.negcon)
	e2:SetCost(s.negcost)
	e2:SetTarget(s.negtg)
	e2:SetOperation(s.negop)
	c:RegisterEffect(e2)
end
function s.mfilter(c)
	return c:IsAttribute(ATTRIBUTE_WIND) and c:IsRace(RACE_MACHINE)
end
function s.effcon(e)
	local c = e:GetHandler()
	return c:GetOverlayGroup():IsExists(Card.IsSetCard, 1, nil, 0x3bb)
end
function c511009999.negcon(e,tp,eg,ep,ev,re,r,rp)
	local c = e:GetHandler()
	local rc = re:GetHandler()
	return ep == 1-tp and re:IsActiveType(TYPE_MONSTER)
end
function c511009999.negcost(e,tp,eg,ep,ev,re,r,rp,chk)
	--! From where should the material be detached from?
	if chk == 0 then return Duel.CheckRemoveOverlayCard(tp,1,1,1,REASON_COST) end
	Duel.RemoveOverlayCard(tp,1,1,1,1,REASON_COST)
end
function c511009999.negtg(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	local c=e:GetHandler()
	if chkc then return chkc:IsLocation(LOCATION_MZONE) and chkc:IsControler(1-tp)
	if chk == 0 then return Duel.IsExistingTarget(nil, tp, 0, LOCATION_MZONE, 1, nil) and c:GetFlagEffect(id)==0 end
	Duel.Hint(HINT_SELECTMSG, tp, HINTMSG_TARGET)
	Duel.SelectTarget(tp, nil, tp, 0, LOCATION_MZONE, 1, 1, nil)
	c:RegisterFlagEffect(id,RESET_EVENT+RESETS_STANDARD+RESET_CHAIN,0,1)
end
function s.negop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local tc=Duel.GetFirstTarget()
	if not (tc and tc:IsRelateToEffect(e)) then return end
	local e1 = Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_CANNOT_TRIGGER)
	e1:SetReset(RESET_EVENT + RESETS_STANDARD + RESET_PHASE + PHASE_END)
	tc:RegisterEffect(e1)
	if tc:IsAttackPos() and tc:IsCanChangePosition() then Duel.ChangePosition(tc, POS_FACEUP_DEFENSE) end
	--! Did you mean THIS effect of this card's name?
	local e2 = Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_FIELD)
	e2:SetCode(EFFECT_CANNOT_ACTIVATE)
	e2:SetProperty(EFFECT_FLAG_PLAYER_TARGET)
	e2:SetTargetRange(1, 0)
	e2:SetValue(function(e,ef) return ef:GetHandler():IsOriginalCodeRule(id))
	e2:SetReset(RESET_PHASE + PHASE_END)
	Duel.RegisterEffect(e2, tp)
end
