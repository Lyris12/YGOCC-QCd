--created by Slick
--Decibelgradation
local s,id,o=GetID()
function s.initial_effect(c)
	--When your opponent activates a Spell/Trap Card, or monster effect, while you control a monster that was Fusion, Synchro, Xyz, Link, Bigbang, or Time Leap Summoned by using a Drive monster as material: Negate the activation, and if you do, destroy that card. During the End Phase, if you control "Kronologistic Fault Hunter", while this card is in your GY: You can Set this card, but banish it when it leaves the field. You can only use this effect of "Decibelgradation" once per turn.
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
