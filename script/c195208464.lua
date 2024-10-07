--created by Seth
--Great London Police Inspector Melvin
local s,id,o = GetID()
function s.initial_effect(c)
	c:EnableReviveLimit()
	--1 "Great London" monster, except "Great London Police Inspector Melvin"
	aux.AddLinkProcedure(c,s.lfilter,1,1)
	--You can only use 1 "Great London Police Inspector Melvin" effect per turn, and only once that turn.
	--During the Main Phase, when your opponent activates a card or effect by sending a card(s) from their hand to the GY (Quick Effect): You can declare 1 card type (Monster, Spell or Trap); reveal the top card of your Deck, and if you do, and its type matches the declared type, negate that activated effect, and if you do that, place it face-up in your Spell/Trap Zone as a Continuous Spell. While it is face-up in your Spell/Trap Zone, its name becomes "Great London Clue - Prisoner".
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_QUICK_O)
	e1:SetCode(EVENT_CHAINING)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCategory(CATEGORY_DISABLE)
	e1:SHOPT()
	e1:SetCondition(s.discon)
	e1:SetTarget(s.distg)
	e1:SetOperation(s.disop)
	c:RegisterEffect(e1)
	if not s.global_check then
		s.global_check=true
		s[0]=nil
		local ge1=Effect.CreateEffect(c)
		ge1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
		ge1:SetCode(EVENT_TO_GRAVE)
		ge1:SetOperation(s.checkop)
		Duel.RegisterEffect(ge1,0)
	end
	--During the Main Phase (Quick Effect): You can banish 1 "Great London Clue" card you control; activate 1 "Great London Clue" card directly from your Deck or GY.

end
function s.lfilter(c)
	return c:IsSetCard(0xd3f) and not c:IsCode(id)
end
function s.filter(c,tp)
	return c:IsPreviousLocation(LOCATION_HAND) and c:IsPreviousControler(1-tp) and c:IsReason(REASON_COST)
end
function s.checkop(e,tp,eg,ep,ev,re,r,rp)
	local cid=Duel.GetCurrentChain()
	if cid>0 and eg:IsExists(s.filter,1,nil,tp) then s[0]=Duel.GetChainInfo(cid,CHAININFO_CHAIN_ID) end
end
function s.discon(e,tp,eg,ep,ev,re,r,rp)
	local ph=Duel.GetCurrentPhase()
	return (ph==PHASE_MAIN1 or ph==PHASE_MAIN2) and rp==1-tp and Duel.GetChainInfo(0,CHAININFO_CHAIN_ID)==s[0]
		and Duel.IsChainDisablable(ev)
end
function s.distg(e,tp,_,_,_,_,_,_,chk)
	if chk==0 then return Duel.GetFieldGroupCount(tp,LOCATION_DECK,0)>0
		and eg:IsExists(Card.IsAbleToChangeControler,1,nil) and Duel.GetLocationCount(tp,LOCATION_SZONE,tp,LOCATION_REASON_CONTROL)>0 end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_CARDTYPE)
	e:SetLabel(Duel.AnnounceType(tp))
end
function s.disop(e,tp)
	if Duel.GetFieldGroupCount(tp,LOCATION_DECK,0)<1 then return end
	local tc=Duel.GetDecktopGroup(tp,1):GetFirst()
	Duel.ConfirmDecktop(tp,1)
	if not (tc:IsType(1<<e:GetLabel()) and Duel.NegateEffect(ev))
		or Duel.GetLocationCount(tp,LOCATION_SZONE)<1 then return end
	local c=e:GetHandler()
	local ec=eg:GetFirst()
	if ec:IsImmuneToEffect(e) or not Duel.MoveToField(ec,tp,tp,LOCATION_SZONE,POS_FACEUP,true) then return end
	local e1=Effect.CreateEffect(c)
	e1:SetCode(EFFECT_CHANGE_TYPE)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetProperty(EFFECT_FLAG_CANNOT_DISABLE)
	e1:SetReset(RESET_EVENT+RESETS_STANDARD-RESET_TURN_SET)
	e1:SetValue(TYPE_SPELL+TYPE_CONTINUOUS)
	ec:RegisterEffect(e1)
	local e2=e1:Clone()
	e2:SetCode(EFFECT_CHANGE_CODE)
	e2:SetValue(id//10-1)
	e2:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_CONTROL)
	ec:RegisterEffect(e2)
end
