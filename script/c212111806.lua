--created by Slick
--Kronologistics Tune Duelist
local s,id,o=GetID()
function s.initial_effect(c)
	--1 Tuner + 1+ non-Tuner monsters, including at least 1 Drive Monster While you have an Engaged Monster, this card's Level is equal to the Engaged Monster's Energy, also this card is unaffected by the effects of your opponent's monsters whose Level, Rank, or Future is equal to this card's Level, or the Level of the Engaged Monster. If you do not have an Engaged Monster (Quick Effect): You can reveal 1 Drive Monster in your hand; Engage it. If you have an Engaged Monster (Quick Effect): You can increase or decrease its Energy by up to 3. If a monster(s) whose Level, Rank, or Future is equal to this card's Level, is Special Summoned: You can negate the effects of that monster(s), then shuffle them into the Deck. You can only use each effect of "Kronologistics Tune Duelist" once per turn.
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
