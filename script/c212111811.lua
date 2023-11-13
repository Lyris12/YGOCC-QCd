--created by Slick
--The City of Belgrade
local s,id,o=GetID()
function s.initial_effect(c)
	--When this card is activated: You can add 1 "Kronologistic" Drive monster from your Deck or GY to your hand. You can activate the Drive Effects of Engaged "Kronologistic" Drive monsters as Quick Effects. Engaged Monsters gain the following Drive Effect. ● [0]: If this card's Energy is equal to this card's Level (Quick Effect): You can Special Summon this card from your hand. (This is treated as a Drive Summon.) Once per turn, if you have an Engaged Monster: You can banish 1 Spell/Trap from your GY; increase or decrease its Energy by up to 2. You can only activate 1 "The City of Belgrade" per turn.
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
