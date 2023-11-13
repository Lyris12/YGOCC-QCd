--created by Jake
--Dawn-Eyes Miracle Dragon
local s,id,o=GetID()
function s.initial_effect(c)
	--1 LIGHT Tuner + 1+ non-Tuner Warrior monsters (This card is also always treated as a "Dawn Blader" Warrior monster.) If this card is Synchro Summoned by using a "Dawn Blader" monster as Synchro Material: Destroy all non-Warrior-Type monsters your opponent controls. When your opponent activates a card or effect that would destroy a card(s) on the field: You can shuffle 2 "Dawn Blader" monsters from your GY into your Deck, and if you do, negate that effect.
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
