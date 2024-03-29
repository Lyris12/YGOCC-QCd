--created by Walrus
--Voidictator Servant - Rune Priestess
local s,id,o=GetID()
function s.initial_effect(c)
	--This card cannot be used as a material for the Summon of a monster from the Extra Deck while it is on the field. This effect cannot be negated. You can Special Summon this card (from your hand) by sending 2 "Voidictator Rune" Spell/Traps from your hand or field to the GY. If this card is Normal or Special Summoned: You can Set 1 "Voidictator Rune" Spell/Trap directly from your Deck. It can be activated this turn. If this card is banished because of a "Voidictator" card you own: You can either banish 1 Spell/Trap your opponent controls, or add 1 "Voidictator" Spell/Trap from your Deck or GY to your hand. You can only use each effect of "Voidictator Servant - Rune Priestess" once per turn.
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
