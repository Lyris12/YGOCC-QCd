--created by Seth
--Great London Doctor Dan
local s,id,o=GetID()
function s.initial_effect(c)
	--During the Main Phase, if you control a "Great London" monster (Quick Effect): You can Special Summon this card from your hand. If this card is Special Summoned: You can choose 1 "Great London" card from your Deck and place it on top of your Deck. You can declare 1 card type (Monster, Spell or Trap); reveal the top card of your Deck, and if you do, and its type matches the declared type, Special Summon 1 "Great London" monster from your GY. At the start of the Damage Step, if this card attacks a monster while you control 3 or more "Great London Clue" cards: Destroy that monster, and if you do, draw 1 card. You can only use each effect of "Great London Doctor Dan" once per turn.
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
