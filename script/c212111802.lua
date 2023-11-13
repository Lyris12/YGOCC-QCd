--created by Slick
--Belgrade Security Force
local s,id,o=GetID()
function s.initial_effect(c)
	--U-▲ [+2]: Toss a coin. If the result is Heads, gain 2 Energy. ▼ [-8]: If you control "The City of Belgrade": Target 1 card your opponent controls; its effects are negated, until the end of this turn.
	--M-(This card is always treated as a "Kronologistic" card.) If this card you control is used as Synchro Material, you can treat it as a non-Tuner. If this card is Normal or Drive Summoned: You can target 1 Spell/Trap your opponent controls; destroy it. While you control this Drive Summoned card, the first time each "Kronologistic" monster you control would be destroyed by an opponent's card effect, it is not.
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
