--created by Jake
--Dawn-Eyes Kabuto Dragon
local s,id,o=GetID()
function s.initial_effect(c)
	--2 Warrior monsters (This card is also always treated as a "Dawn Blader" Warrior monster.) If this card is Link Summoned: You can draw cards up to the number of cards this card points to, and if you do, discard 1 card for each, -1. If a "Dawn Blader" monster this card points to is sent to the GY: You can draw 1 card for each "Dawn Blader" monster you control, -1. You can only use each effect of "Dawn-Eyes Kabuto Dragon" once per turn.
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
