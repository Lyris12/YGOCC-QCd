--Valiant Soul Cardinal Ruler
function c22112910.initial_effect(c)
	c:EnableReviveLimit()
	--mat=2 level 4 "Valiant Soul" monsters
	aux.AddXyzProcedure(c,aux.FilterBoolFunction(Card.IsSetCard,0xa88),4,2)
	--You can only use 1 effect of "Valiant Soul Cardinal Ruler" per turn, and only once that turn.
	--You can detach 1 Material from this card; add 1 "Valiant Soul" card from the GY to your hand.
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_IGNITION)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCountLimit(1,id)
	e1:SetCategory(CATEGORY_TOHAND)
	e1:SetCost(cid.cost)
	e1:SetTarget(cid.sctg)
	e1:SetOperation(cid.scop)
	c:RegisterEffect(e1)
	--(Quick Effect): you can detach 1 Material from this card, then target 1 card on the field; destroy it.
	local e2=Effect.CreateEffect(c)
	e2:SetCategory(CATEGORY_DESTROY)
	e2:SetType(EFFECT_TYPE_QUICK_O)
	e2:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e2:SetCode(EVENT_FREE_CHAIN)
	e2:SetRange(LOCATION_MZONE)
	e2:SetCountLimit(1,id)
	e2:SetHintTiming(0,TIMINGS_CHECK_MONSTER+TIMING_END_PHASE)
	e2:SetCost(c48905153.cost)
	e2:SetTarget(c48905153.destg)
	e2:SetOperation(c48905153.desop)
	c:RegisterEffect(e2)
end
function c19772603.sctg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(aux.AND(Card.IsSetCard,Card.IsAbleToHand),tp,LOCATION_GRAVE,0,1,nil,0xa88) end
	Duel.SetOperationInfo(0,CATEGORY_TOHAND,nil,1,tp,LOCATION_GRAVE)
end
function c19772603.scop(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_ATOHAND)
	local g=Duel.SelectMatchingCard(tp,aux.AND(Card.IsSetCard,Card.IsAbleToHand),tp,LOCATION_GRAVE,0,1,1,nil,0xa88)
	Duel.SendtoHand(g,nil,REASON_EFFECT)
	Duel.ConfirmCards(1-tp,g)
end
function c48905153.cost(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return e:GetHandler():CheckRemoveOverlayCard(tp,1,REASON_COST) end
	e:GetHandler():RemoveOverlayCard(tp,1,1,REASON_COST)
end
function c48905153.destg(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	if chkc then return chkc:IsOnField() end
	if chk==0 then return Duel.IsExistingTarget(nil,tp,LOCATION_ONFIELD,LOCATION_ONFIELD,1,nil) end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_DESTROY)
	local g=Duel.SelectTarget(tp,nil,tp,LOCATION_ONFIELD,LOCATION_ONFIELD,1,1,nil)
	Duel.SetOperationInfo(0,CATEGORY_DESTROY,g,1,0,0)
end
function c48905153.desop(e,tp,eg,ep,ev,re,r,rp)
	local tc=Duel.GetFirstTarget()
	if tc:IsRelateToEffect(e) then Duel.Destroy(tc,REASON_EFFECT) end
end
