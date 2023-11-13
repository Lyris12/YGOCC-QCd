--created by Seth
--Great London Criminal Masterminds
local s,id,o=GetID()
function s.initial_effect(c)
	--2+ Level 4 "Great London" monsters "Great London" monsters you control cannot be destroyed by battle. During the Main Phase (Quick Effect): You can detach 1 material from this card; Choose up to 5 cards from your Deck, then place them on top of your Deck in any order. When your opponent would Special Summon a monster(s) (Quick Effect): You can declare 1 card type (Monster, Spell or Trap); reveal the top card of your Deck, and if you do, and its type matches the declared type, negate that effect. At the start of the Damage Step, if this card battles a monster while you control 3 or more "Great London Clue" cards: Destroy that monster, then inflict 1000 damage to your opponent. You can only use each effect of "Great London Criminal Masterminds" once per turn.
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
