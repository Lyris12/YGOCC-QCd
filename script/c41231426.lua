--created by Jake
--Disgraceful Battle at Dawn
local s,id,o=GetID()
function s.initial_effect(c)
	--Discard 1 "Dawn Blader" monster; destroy all non-Warrior Special Summoned monsters your opponent controls with more ATK than the ATK of the discarded monster. For this card's activation, you apply either (or both) corresponding effects. ● If your opponent controls a Warrior monster, then you can treat the discarded monster as if they were discarded by the effect of a "Dawn Blader" monster. ● If you control no monsters, you can activate this card from your hand. You can only activate 1 "Disgraceful Battle at Dawn" per turn.
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
