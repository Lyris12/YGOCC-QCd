--created by Jake
--Dawn Blader - Paladin of Youth
local s,id,o=GetID()
function s.initial_effect(c)
	--If this card is discarded by the effect of, or to activate the effect of, a "Dawn Blader" monster: You can send 1 "Dawn Blader" monster from your hand or Deck to the GY, and if you do, treat it as if its been discarded. If you discard a "Dawn Blader" monster(s) while this card is already in your GY: You can Special Summon it, and if you do, you can make it a Tuner. You can only use each effect of "Dawn Blader - Paladin of Youth" once per turn.
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
