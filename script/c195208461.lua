--created by Seth
--Great London Clue - Footprints
local s,id,o=GetID()
function s.initial_effect(c)
	--"Great London" monsters you control gain 300 ATK/DEF for each "Great London Clue" card you control. During your Main Phase: You can shuffle 1 "Great London" card from your hand into the Deck, then add 1 "Great London" card with a different type (Monster, Spell or Trap) from your Deck to your hand. You can only use this effect of "Great London Clue - Footprints" once per turn. You can only control 1 "Great London Clue - Footprints".
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
