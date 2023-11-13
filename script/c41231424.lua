--created by Jake
--Dawn Blader - Jonah the Prince
local s,id,o=GetID()
function s.initial_effect(c)
	--You can discard this card: Special Summon 1 "Dawn Blader" monster from your GY, except "Dawn Blader - Jonah the Prince", and if you do, treat it as if its been discarded by the effect of a "Dawn Blader" monster effect when it leaves the field. If this card is discarded by the effect of, or to activate the effect of, a "Dawn Blader" monster: You can add 1 "Dawn Blader" monster from your Deck to your hand, except "Dawn Blader - Jonah the Prince". You can only use each effect of "Dawn Blader - Jonah the Prince" once per turn.
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
