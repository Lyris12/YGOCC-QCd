--created by Seth
--Great London Detective Polan
local s,id,o=GetID()
function s.initial_effect(c)
	--During the Main Phase, if this card is in your hand (Quick Effect): You can declare 1 card type (Monster, Spell or Trap); reveal the top card of your Deck, and if you do, Special Summon this card if it is a card of that type. If this card is Normal or Special Summoned: Choose 1 "Great London" card from your Deck and place it on top of your Deck. You can declare 1 card type (Monster, Spell, or Trap); reveal the top card of your Deck, and if you do, add it to your hand if it is a card of that type. At the start of the Damage Step, if this card attacks a monster while you control at least 3 "Great London Clue" cards: Destroy that monster, and if you do, it cannot activate its effects during this Battle Phase. You can only use each effect of "Great London Detective Polan" once per turn.
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
