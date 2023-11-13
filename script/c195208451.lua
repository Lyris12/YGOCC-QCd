--created by Seth
--Great London Evil Professor Jack
local s,id,o=GetID()
function s.initial_effect(c)
	--During the Main Phase (Quick Effect): You can destroy 1 "Great London Clue" card you control and 1 card on the field. You can declare 1 card type (Monster, Spell or Trap); reveal the top card of your Deck, and if you do, and its type matches the declared type, add 1 "Great London Clue" card from your Deck to your hand. At the start of the Damage Step, if this card attacks a monster while you control 3 or more "Great London Clue" cards: Destroy that monster, and if you do, inflict 500 damage to your opponent. You can only use each effect of "Great London Evil Professor Jack" once per turn.
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
