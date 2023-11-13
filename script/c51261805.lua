--created by Zarc
--Elflair - Irene, Wellspring Elf Princess
local s,id,o=GetID()
function s.initial_effect(c)
	--2 "Elflair" monsters This card can attack while in face-up Defense Position. If it does, apply its DEF for damage calculation. Must first be Special Summoned (from your Extra Deck) by sending the above cards from either field to the GY. (You do not use "Polymerization".) Once per turn, when a card or effect is activated (Quick Effect): You can remove 1 Elflair counter from anywhere on the field; negate the activation, and if you do, destroy that card, and if you do that, this card gains 1000 DEF.  You can only use this effect of "Elflair - Irene, Wellspring Elf Princess" once per turn.
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
