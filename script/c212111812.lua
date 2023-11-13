--created by Slick
--Kronologistical Nightmare
local s,id,o=GetID()
function s.initial_effect(c)
	--Banish Drive Monsters with different Levels from your hand, face-up field, and/or GY, then destroy an equal number of cards your opponent controls. If "The Spirit of Belgrade" is banished or sent to your GY by an opponent's card effect, while this card is in your GY: You can banish this card from your GY, then target any number of your banished Drive Monsters; shuffle them into the Deck. You can only activate 1 effect of "Kronologistical Nightmare" per turn, and only once that turn.
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
