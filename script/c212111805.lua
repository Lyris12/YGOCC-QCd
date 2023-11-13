--created by Slick
--Kronologistics Centaurea
local s,id,o=GetID()
function s.initial_effect(c)
	--1 Tuner + 1+ non-Tuner monsters, including at least 1 Drive Monster If this card is Synchro Summoned: You can add 1 "Kronologistic" monster or "The City of Belgrade" from your Deck or GY to your hand. If this card you control is used as Synchro Material, you can treat it as a non-Tuner. The Drive Effects of your Engaged "Kronologistic" monster cannot be negated. If you control "The City of Belgrade": You can reduce the Energy of all Engaged monsters to 0, then if your Engaged monster's Energy was reduced to 0 by this effect, draw 2 cards. You can only use this effect of "Kronologistics Centaurea" once per turn.
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
