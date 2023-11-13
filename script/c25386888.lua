--created by Jake
--Steinitz's En Passant
local s,id,o=GetID()
function s.initial_effect(c)
	--When your opponent Summons a monster in the same column as a "Steinitz" monster(s) you control that has not battled this turn: Destroy that opponent's monster, and if you do, you can move 1 "Steinitz" monster you control to another of your Main Monster Zones. If you control a "Steinitz" monster that is not equipped to a card, you can activate this card from your hand. If this card is in your GY, except the turn it was sent there: You can banish this card from your GY, then target 1 "Steinitz" monster you control; equip 1 Level 4 or lower "Steinitz" monster from your Deck to it. You can only activate this effect of "Steinitz's En Passant" once per turn.
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
