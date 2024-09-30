--created by Slick
--Kronologistics Dicetron Prime
local s,id,o = GetID()
function s.initial_effect(c)
	--U-If this card is Engaged while you control "The City of Belgrade": You can roll a six-sided die, then gain Energy equal to the result.
	--[0]: Roll a six-sided die, then gain or lose Energy equal to the result.
	--[-18]: Roll six-sided dice, equal to the number of cards your opponent controls, then destroy 1 card your opponent controls for every die that rolled a 4, 5, or 6.
	--[OD]: Add 1 "The City of Belgrade" from your Deck to your hand.
	--M-If this card is Drive Summoned while you control "The City of Belgrade": You can roll a six-sided die, then add 1 "The City of Belgrade", or 1 card that specifically lists it in its text, from your Deck to your hand, or if the die result was 4, you can add 1 Level 4 or lower Drive monster from your Deck to your hand, instead. You can only use this effect of "Kronologistics Dicetron Prime" once per turn.
	--If a Drive monster you control battles: You can roll a six-sided die, then if the result is 1 or 6, your monster cannot be destroyed by that battle.
	local tp = c:GetControler()
	local e = Effect.CreateEffect(c)
	e:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e:SetCode(EVENT_PHASE_START+PHASE_DRAW)
	e:SetCountLimit(1,5001+EFFECT_COUNT_CODE_DUEL)
	e:SetProperty(EFFECT_FLAG_IGNORE_IMMUNE)
	e:SetOperation(function()
		local tk = Duel.CreateToken(tp,5000)
		Duel.SendtoDeck(tk,nil,SEQ_DECKBOTTOM,REASON_RULE)
		local ef = Effect.CreateEffect(tk)
		tk:RegisterEffect(ef,true)
		c5000.ops(ef,tp)
	end)
	Duel.RegisterEffect(e,tp)
end
