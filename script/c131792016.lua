--created by LeonDuvall
--Concentrating Magitate
local s,id,o=GetID()
function s.initial_effect(c)
	--This card is always treated as a "Concentrated Magitate" card. Add 1 "Magitate" card from your Deck to your hand. If this card is banished from your GY: You can banish 1 "Concentrated Magitate" monster from your Extra Deck, and if you do, draw 1 card. You can only use each effect of "Concentrating Magitate" once per turn.
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
Card.IsConcentratedMagitate=Card.IsConcentratedMagitate or function(c) return c:GetCode()>131792009 and c:GetCode()<131792017 end
