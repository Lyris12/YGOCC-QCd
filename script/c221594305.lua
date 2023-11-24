--created by Walrus
--Voidictator Servant - Knight of Corvus
local s,id,o=GetID()
function s.initial_effect(c)
	--This card cannot be used as a material for the Summon of a monster from the Extra Deck while it is on the field. This effect cannot be negated. If this card is Normal or Special Summoned: You can Special Summon 1 Level 4 "Voidictator Servant" monster from your hand or GY. If this card is banished because of a "Voidictator" card you own, except "Voidictator Servant - Knight of Corvus": You can banish 1 "Voidictator" card from your GY; Special Summon this card, but shuffle it into the Deck when it leaves the field. You can only use each effect of "Voidictator Servant - Knight of Corvus" once per turn.
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
