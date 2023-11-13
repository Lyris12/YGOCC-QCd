--created by Jake
--Dawn-Eyes Royal Dragon
local s,id,o=GetID()
function s.initial_effect(c)
	--1 "Dawn-Eyes" monster + 2 Warrior monsters (This card is also always treated as a "Dawn Blader" Warrior monster.) Must first be Fusion Summoned. If this card is Fusion Summoned: You can target 1 "Dawn Blader" monster in your GY; add it to your hand, and if you do, send 1 "Dawn Blader" monster from your Deck to the GY whose Level is lower than the target. You can only use this effect of "Dawn-Eyes Royal Dragon" once per turn. Once per turn: You can discard 1 card; until the end of this turn, if a Warrior monster you control battles an opponent's Defense Position monster, inflict double piercing damage to your opponent.
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
