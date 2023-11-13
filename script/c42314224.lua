--created by Jake
--Dawn Blader - The Golden Shadow
local s,id,o=GetID()
function s.initial_effect(c)
	--3+ "Dawn Blader" monsters If this card is Link Summoned: You can target up to 3 Warrior monsters in your GY; equip them to this card. Once per turn (Quick Effect): You can send 1 card equipped to this card to the GY; all monsters you control gain 200 ATK for each card in your hand until the end of this turn, then, if the card you sent was a "Dawn Blader" monster, you can treat it as if it was discarded. Once, while this card is face-up on the field: If a monster(s) is Special Summoned to a zone this card points to: You can target that monster(s); equip them to this card. You can only use each effect of "Dawn Blader - The Golden Shadow" once per turn.
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
