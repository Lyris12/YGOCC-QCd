--created by Slick
--Kronologistics Copper Dragon
local s,id,o=GetID()
function s.initial_effect(c)
	--U-Whenever a monster(s) is Normal or Special Summoned, while this card has less than 8 Energy, this card gains 1 Energy. ▼ [-4]: Target 1 Spell/Trap your opponent controls; destroy it, then if you control a card in your Spell/Trap Zone, destroy 1 Spell/Trap you control. ▼ [-8]: Target 1 Drive or Synchro monster in your GY; Special Summon it.
	--M-(This card is also always treated as a Dragon monster.) If this card is Drive Summoned: You can target 1 card your opponent controls; negate its effects, then destroy it. If this card is used as Synchro or Time Leap Material, and sent to the GY or banished: You can add this card to your hand. You can only use this effect of "Kronologistics Copper Dragon" once per Duel.
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
