--created by Zarc
--Elflair - Defensive Song
local s,id,o=GetID()
function s.initial_effect(c)
	--Neither player can target "Elflair" monsters you control with effects of Special Summoned monsters. You can only use each of the following effects of "Elflair - Defensive Song" once per turn. If you Link Summon an "Elflair" monster: You can declare 1 card name; for the rest of this turn, negate the activated effects and effects on the field of cards with that original name (even if this card leaves the field). When an attack is declared involving your "Elflair" monster: You can discard 1 card to the GY; negate the attack. You can only activate 1 "Elflair - Defensive Song" per turn.
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
