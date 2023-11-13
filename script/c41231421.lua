--created by Jake
--Dawn-Eyes Baby Dragon
local s,id,o=GetID()
function s.initial_effect(c)
	--This card is treated as a "Dawn Blader" monster while in the hand. If this card is discarded by the effect of, or to activate the effect of, a "Dawn Blader" monster: You can activate one of the following effects. ● Special Summon 1 "Dawn Blader" monster from your GY, and if you do, you can send 1 "Dawn Blader" monster from your Deck to the GY with a lower Level than the Special Summoned monster, and if you do that, you can treat it as if it was discarded by the effect of a "Dawn Blader" monster. ● Return 1 "Dawn Blader" monster from your GY to your hand, and if you do, you can Special Summon 1 "Dawn Blader" monster from your Deck with the same Level as the returned monster. You can only use the effect of "Dawn-Eyes Baby Dragon" once per turn.
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
