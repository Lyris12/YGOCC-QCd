--created by Swag, coded by Lyris
local cid,id=GetID()
function cid.initial_effect(c)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetCountLimit(1,id)
	e1:SetTarget(cid.target)
	e1:SetOperation(cid.activate)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_IGNITION)
	e2:SetRange(LOCATION_GRAVE)
	e2:SetCountLimit(1,id+100)
	e2:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e2:SetCategory(CATEGORY_TOHAND)
	e2:SetCondition(aux.exccon)
	e2:SetCost(aux.bfgcost)
	e2:SetTarget(cid.tg)
	e2:SetOperation(cid.operation)
	c:RegisterEffect(e2)
end
function cid.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsPlayerCanDiscardDeck(tp,1) end
	Duel.SetOperationInfo(0,CATEGORY_TOGRAVE,nil,0,tp,LOCATION_DECK)
end
function cid.filter(c)
	return c:IsLevelAbove(5) and c:IsRace(RACE_ZOMBIE) and c:IsType(TYPE_MONSTER) and c:IsAbleToGrave()
end
function cid.activate(e,tp,eg,ep,ev,re,r,rp)
	if not Duel.IsPlayerCanDiscardDeck(tp,1) then return end
	local g=Duel.GetDecktopGroup(tp,3)
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_ATOHAND)
	local sg=g:FilterSelect(tp,cid.filter,1,1,nil)
	Duel.SendtoGrave(sg,REASON_EFFECT)
	Duel.ShuffleDeck(tp)
end
function cid.tg(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	if chkc then return chkc:IsLocation(LOCATION_GRAVE) and chkc:IsControler(tp) and chkc:IsSetCard(0xd78) and chkc:IsAbleToHand() end
	if chk==0 then return Duel.IsExistingTarget(aux.AND(Card.IsSetCard,Card.IsAbleToHand),tp,LOCATION_GRAVE,0,1,e:GetHandler(),0xd78) end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_ATOHAND)
	Duel.SetOperationInfo(0,CATEGORY_TOHAND,Duel.SelectTarget(tp,aux.AND(Card.IsSetCard,Card.IsAbleToHand),tp,LOCATION_GRAVE,0,1,1,nil),1,0,0)
end
function cid.operation(e,tp,eg,ep,ev,re,r,rp)
	local tc=Duel.GetFirstTarget()
	if tc:IsRelateToEffect(e) then Duel.SendtoHand(tc,nil,REASON_EFFECT) end
end