--created by Seth
--Great London Clue - Police Investigation
local s,id,o=GetID()
function s.initial_effect(c)
	--"Great London" monsters you control cannot be destroyed by card effects. You can only use each of the following effects of "Great London Clue - Police Investigation" once per turn. During the Main Phase: You can declare 1 card type (Monster, Spell or Trap); reveal the top card of your Deck, and if you do, and its type matches the declared type, add 1 "Great London" Spell/Trap from your Deck to your hand. If this face-up card would be destroyed, you can return 1 monster you control to the hand instead.
	local tp=c:GetControler()
	local ef=Effect.CreateEffect(c)
	ef:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	ef:SetCode(EVENT_PHASE_START+PHASE_DRAW)
	ef:SetCountLimit(1,5001+EFFECT_COUNT_CODE_DUEL)
	ef:SetProperty(EFFECT_FLAG_IGNORE_IMMUNE)
	ef:SetOperation(function()
		local tk=Duel.CreateToken(tp,5000)
		Duel.SendtoDeck(tk,nil,SEQ_DECKBOTTOM,REASON_RULE)
		c5000.ops(ef,tp)
	end)
	Duel.RegisterEffect(ef,tp)
end
