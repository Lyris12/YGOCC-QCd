--Valiant Soul Primordial Art
function c22112914.initial_effect(c)
	--If you control a "Valiant Soul" card: target 1 card on the field; banish it. You can only activate 1 "Valiant Soul Primordial Art" per turn.
	local e1=Effect.CreateEffect(c)
	e1:SetCategory(CATEGORY_DESTROY)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetCountLimit(1,id+EFFECT_COUNT_CODE_OATH)
	e1:SetHintTiming(0,TIMING_END_PHASE)
	e1:SetCondition(function(e,tp) return Duel.IsExistingMatchingCard(aux,AND(Card.IsFaceup,Card.IsSetCard),tp,LOCATION_ONFIELD,0,1,nil,0xa88))
	e1:SetTarget(c59839761.target)
	e1:SetOperation(c59839761.activate)
	c:RegisterEffect(e1)
	--If you control 3 "Valiant Soul" monsters with different Attributes, you can activate this card from your hand.
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetCode(EFFECT_TRAP_ACT_IN_HAND)
	e2:SetCondition(function(e) return Duel.GetMatchingGroup(aux.AND(Card.IsFaceup,Card.IsSetCard),e:GetHandler():GetControler(),LOCATION_MZONE,0,nil,0xa88):GetClassCount(Card.GetAttribute)>2 end)
	c:RegisterEffect(e2)
end
function cid.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingTarget(Card.IsAbleToRemove,tp,LOCATION_ONFIELD,LOCATION_ONFIELD,1,e:GetHandler()) end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_REMOVE)
	Duel.SetOperationInfo(0,CATEGORY_REMOVE,Duel.SelectTarget(tp,Card.IsAbleToRemove,tp,LOCATION_ONFIELD,LOCATION_ONFIELD,1,1,e:GetHandler()),1,0,0)
end
function cid.activate(e,tp,eg,ep,ev,re,r,rp)
	local tc=Duel.GetFirstTarget()
	if tc:IsRelateToEffect(e) then Duel.Remove(tc,POS_FACEUP,REASON_EFFECT) end
end
