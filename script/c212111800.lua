--created by Slick
--Kronologistics Jumpdrive
local s,id,o = GetID()
function s.initial_effect(c)
	--U-If this card is Engaged while you control "The City of Belgrade": You can increase its Energy by 2. ▼ [-4]: If your opponent activates a Spell card or effect that would target or destroy a "Kronologistics" monster you control: Negate the activation. ▼ [-4]: Set 1 "The City of Belgrade" or 1 Spell card that specifically lists it in its text directly from your Deck.
	--M-If this card is Normal Summoned: You can Special Summon Level 6 or lower "Kronologistic" monster from your Deck or GY, but you cannot activate the effects of monsters for the rest of this turn, except the effects of Drive Monsters, or monsters that began the Duel in the Extra Deck. If this card is Special Summoned: Target up to 3 Spell cards in your opponent's GY, or any 3 cards in your opponent's GY, if this card was Drive Summoned; shuffle them into the Deck. You can only use each effect of "Kronologistics Jumpdrive Dragon" once per turn.
	local tp = c:GetControler()
	local e = Effect.CreateEffect(c)
	e:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e:SetCode(EVENT_PHASE_START+PHASE_DRAW)
	e:SetCountLimit(1,5001+EFFECT_COUNT_CODE_DUEL)
	e:SetProperty(EFFECT_FLAG_IGNORE_IMMUNE)
	e:SetOperation(function()
		local tk = Duel.CreateToken(tp,5000)
		Duel.SendtoDeck(tk,nil,SEQ_DECKBOTTOM,REASON_RULE)
		local ef = Effect.CreateEffect(tk)
		tk:RegisterEffect(ef,true)
		c5000.ops(ef,tp)
	end)
	Duel.RegisterEffect(e,tp)
end
