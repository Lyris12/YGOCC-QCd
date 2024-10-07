--created by Seth
--Great London Police Inspector Melvin
local s,id,o = GetID()
function s.initial_effect(c)
	c:EnableReviveLimit()
	--mat=1 "Great London" monster
	aux.AddLinkProcedure(c,s.lfilter,1,1)
	--You can only use 1 "Great London Police Inspector Melvin" effect per turn, and only once that turn.
	--During the Main Phase, when your opponent activates a card or effect by sending a card(s) from their hand to the GY (Quick Effect): You can declare 1 card type (Monster, Spell or Trap); reveal the top card of your Deck, and if you do, and its type matches the declared type, negate that card or effect, and if you do that, it is placed face-up in your Spell/Trap Zone as a Continuous Spell. While it's face-up in your Spell/Trap Zone, it's name becomes "Great London Clue - Prisoner".
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
	--During the Main Phase (Quick Effect): You can banish 1 "Great London Clue" card you control; activate 1 "Great London Clue" card directly from your Deck or GY. You can only use 1 "Great London Police Inspector Melvin" effect per turn, and only once that turn.
	local tp = c:GetControler()
	local e = Effect.CreateEffect(c)
	e:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e:SetCode(EVENT_PHASE_START+PHASE_DRAW)
	e:SetCountLimit(1,5001+EFFECT_COUNT_CODE_DUEL)
	e:SetProperty(EFFECT_FLAG_IGNORE_IMMUNE)
	e:SetOperation(function()
		local tk = Duel.CreateToken(tp,5000)
		Duel.SendtoDeck(tk,nil,SEQ_DECKBOTTOM,REASON_RULE)
		local ef = Effect.CreateEffect(tk)
		tk:RegisterEffect(ef,true)
		c5000.ops(ef,tp)
	end)
	Duel.RegisterEffect(e,tp)
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
	if chk==0 then return Duel.GetFieldGroupCount(tp,LOCATION_DECK,0)>0 end
end
function s.disop()
	
end
