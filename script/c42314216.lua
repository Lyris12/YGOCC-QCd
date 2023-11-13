--created by Jake
--Dawn-Eyes Armageddon Dragon
local s,id,o=GetID()
function s.initial_effect(c)
	--2 Level 6 Dragon and/or Warrior monsters (This card is also always treated as a "Dawn Blader" Warrior monster.) You can also Xyz Summon this card by using a "Dawn Blader" Xyz monster you control as the Xyz Material. (Transfer its materials to this card.) Cannot be used as Xyz Material. This card's maximum number of attacks each Battle Phase is equal to the number of materials attached to it. Once per turn: You can detach 1 material from this card; destroy all face-down Spell/Trap cards on the field, and if you do, both players discard 1 card. Neither player can activate face-down cards in response to this effect. You can only use the effect of "Dawn-Eyes Armageddon Dragon" once per turn.
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
