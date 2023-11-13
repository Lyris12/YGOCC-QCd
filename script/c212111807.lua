--created by Slick
--Kronologistic Fault Hunter
local s,id,o=GetID()
function s.initial_effect(c)
	--1 Tuner + 1+ non-Tuner monsters, including at least 1 Drive Monster If this card is Synchro Summoned: Destroy 1 card your opponent controls for every Engaged Monster. Unaffected by the effects of Drive Monsters, except your "Kronologistic" monsters. Unaffected by your opponent's card effects that do not target it. Once per turn (Quick Effect): You can reduce the Energy of all Engaged Monsters to 0, then destroy 1 card your opponent controls for each. Neither player can activate Drive Effects in response to the activations of this card's effects.
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
