--created by Slick
--Kronologistic Paradox
local s,id,o=GetID()
function s.initial_effect(c)
	--Special Summon this card as an Effect Monster (Machine/DARK/Level 8/ATK 2600/DEF 2600). (This card is NOT treated as a Trap.) You can only use 1 of the following effects of "Kronologistic Paradox" once per turn, and only once that turn. If you control "The City of Belgrade" and this card in the Monster Zone (Quick Effect): You can banish 1 Tuner from your hand or field, then send this card to the GY; Special Summon 1 "Kronologistics Tune Duelist" or "Kronologistic Fault Hunter" from your Extra Deck. (This is treated as a Synchro Summon.) You can banish this card from your GY; Special Summon 1 "Kronologistics Tune Duelist", "Kronologistic Fault Hunter", or "The Spirit of Belgrade" from your GY.
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
