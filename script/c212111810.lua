--created by Slick
--Belgrade Under
local s,id,o=GetID()
function s.initial_effect(c)
	--Add 1 "The City of Belgrade" from your Deck or GY to your hand. If "The City of Belgrade" is in your Field Zone, you can apply this effect instead. ● Add 1 "Kronologistics" Drive Monster from your Deck to your hand, then if you do not currently have an Engaged monster, you can Engage the added Drive Monster. You can only activate 1 "Belgrade Under" per turn. If "The City of Belgrade" would be destroyed by a card effect, you can banish this card from your GY instead.
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
