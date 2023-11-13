--created by Jake
--Dawn Blader - Paladin of Experience
local s,id,o=GetID()
function s.initial_effect(c)
	--1 Warrior Tuner + 1+ non-Tuner monsters When this card is Synchro Summoned: You can discard cards equal to the number of "Dawn Blader" monsters you control; draw cards equal to the number you discarded to activate this effect, -1. If a Warrior monster you control is targeted or destroyed by battle or an opponent's card effect: You can shuffle 1 Warrior monster from your GY to your Deck; draw 1 card, then if that card was a Warrior monster, you can discard 1 card. You can only use each effect of "Dawn Blader - Paladin of Experience" once per turn.
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
