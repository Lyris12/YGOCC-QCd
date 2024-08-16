--created by Slick
--The Spirit of Belgrade
local s,id,o = GetID()
function s.initial_effect(c)
	--(This card is always treated as a "Kronologistic" card.) "The City of Belgrade" is face-up on your field or in your GY, and a monster has been Drive Summoned this turn - 1 Drive Monster While "The City of Belgrade" is in your GY, you can also Time Leap Summon this card by using any Level 5 or higher Drive monster you control or "The Spirit of Belgrade". If this card is Time Leap Summoned: You can place 1 "The City of Belgrade" from your Deck or GY face-up in your Field Zone. If "The City of Belgrade" is in your Field Zone, you can apply this effect instead. ● Your opponent selects 1 monster they control. All cards on the field are banished, except the selected monster, this card, and any Field Spells on the field. Cannot be targeted by your opponent's card effects. Cannot be destroyed by battle with a monster that has the same ATK.
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
