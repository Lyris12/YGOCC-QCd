--created by Jake
--No Survivors
local s,id,o = GetID()
function s.initial_effect(c)
	--2 DARK monsters Must be Fusion Summoned. If this card is Fusion Summoned during your turn: Destroy all cards on the field. If there are no other cards in this cards column, your opponent cannot activate cards or effects in response to this cards effect. If exactly 2 cards on the field (and no other cards) are destroyed by a card effect while this card is already in your GY: You can target 1 face-up monster your opponent controls; during the next players End Phase, destroy that monster, and if you do, inflict damage to both players equal to that targets original ATK. You cannot conduct your Battle Phase during the turn you activate the effects of "No Survivors". You can only use each effect of "No Survivors" once per turn.
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
