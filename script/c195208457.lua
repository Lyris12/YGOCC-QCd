--created by Seth
--Great London Streets
local s,id,o=GetID()
function s.initial_effect(c)
	--You can declare 1 card type (Monster, Spell or Trap); reveal the top card of your Deck, and if you do, and its type matches the declared type, Special Summon 1 "Great London" monster from your Deck. When your "Great London" monster declares an attack: You can activate 1 "Great London Clue" card from your hand or Deck. If this face-up card leaves the field: Choose 1 "Great London" card from your Deck and place it on top of your Deck. You can only use each effect of "Great London Streets" once per turn.
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
