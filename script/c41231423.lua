--created by Jake
--Dawn Blader - Soldier of Snowdust
local s,id,o=GetID()
function s.initial_effect(c)
	--U-During each of your End Phases: Discard 1 card or destroy this card. Once per turn (Quick Effect): You can target 1 "Dawn Blader" monster you control; this turn, that target cannot be destroyed by card effects.
	--M-If this card is Normal or Special Summoned: You can add 1 Spell/Trap card that specifically lists a "Dawn Blader" monster in it's card text from your Deck to your hand. If this card is discarded by the effect of, or to activate the effect of, a "Dawn Blader" monster: You can place this card in your Pendulum Zone. You can only use each effect of "Dawn Blades - Soldier of Snowdust" once per turn.
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
