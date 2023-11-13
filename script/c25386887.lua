--created by Jake
--Steinitz's Promotion
local s,id,o=GetID()
function s.initial_effect(c)
	--Banish 1 "Steinitz" monster you control or in your GY; apply either (or both consecutively) corresponding effects. ● Special Summon 1 "Steinitz" monster from your hand or Deck with a different name than the banished monster, and if you do, that monster does not have to activate its' effects during the End Phase. ● If your opponent controls 2+ Special Summoned monsters, you can equip 1 "Steinitz" monster from your Deck or GY to a monster you control. You can only activate 1 "Steinitz's Promotion" per turn.
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
