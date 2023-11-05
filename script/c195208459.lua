--created by Seth
--Great London Clue - Bloody Footprints
local s,id,o=GetID()
function s.initial_effect(c)
	c:RegisterSetCardString("Great London")
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_FREE_CHAIN)
	c:RegisterEffect(e1)
	--"Great London" monsters you control cannot be destroyed by battle.
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_FIELD)
	e2:SetCode(EFFECT_INDESTRUCTABLE_BATTLE)
	e2:SetRange(LOCATION_SZONE)
	e2:SetTargetRange(LOCATION_MZONE,0)
	e2:SetTarget(aux.TargetBoolFunction(Card.IsSetCard,"Great London"))
	c:RegisterEffect(e2)
	--You can declare 1 card type (Monster, Spell or Trap); reveal the top card of your Deck, and if you do, and its type matches the declared type, destroy 1 card on the field. You can only use this effect of "Great London Clue - Bloody Footprints" once per turn.
	local e3=Effect.CreateEffect(c)b
	e3:SetType(EFFECT_TYPE_IGNITION)
	e3:SetRange(LOCATION_SZONE)
	e3:HOPT()
	e3:SetCategory(CATEGORY_DESTROY)
	e3:SetTarget(s.destg)
	e3:SetOperation(s.desop)
	c:RegisterEffect(e3)
end
function s.destg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.GetFieldGroupCount(tp,LOCATION_DECK,0)>0
		and Duel.GetFieldGroupCount(tp,LOCATION_ONFIELD,LOCATION_ONFIELD)>0 end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_CARDTYPE)
	Duel.SetTargetParam(Duel.AnnounceType(tp))
end
function s.desop(e,tp,eg,ep,ev,re,r,rp)
	if Duel.GetFieldGroupCount(tp,LOCATION_DECK,0)<1 then return end
	Duel.ConfirmDecktop(tp,1)
	local tc=Duel.GetDecktopGroup(tp,1):GetFirst()
	local op=Duel.GetChainInfo(0,CHAININFO_TARGET_PARAM)
	local g=Duel.GetFieldGroup(tp,LOCATION_ONFIELD,LOCATION_ONFIELD)
	if tc:IsType(1<<op) and #g>0 then
		Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_DESTROY)
		local sg=g:Select(tp,1,1,nil)
		Duel.HintSelection(g)
		Duel.Destroy(g,REASON_EFFECT)
	end
end
