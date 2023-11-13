--created by Jake
--Dawn Blader - Swordsman of Flame
local s,id,o=GetID()
function s.initial_effect(c)
	--2 Level 6 Warrior monsters If a monster you control battles: You can detach 1 material; activate one of the following effects. ● That monster gains 600 ATK, and if it does, all other monsters you control gain 500 ATK. These changes last until the end of the Battle Phase. ● Discard 1 "Dawn Blader" monster, and if you do, that monster gains ATK equal to the discarded monster's Level x100 until the end of the Battle Phase. If this card is sent to the GY: You can Special Summon 1 "Dawn Blader" monster from your hand or GY. You can only use each effect of "Dawn Blader - Swordsman of Flame" once per turn.
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
