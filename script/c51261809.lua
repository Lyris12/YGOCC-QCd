--created by Zarc
--Elflair - Iro, Enraged Dark Elf
local s,id,o=GetID()
function s.initial_effect(c)
	--2+ "Elflair" monsters including 1 DARK monster Once per turn: You can destroy as many Continuous Spell cards on the field as possible, then inflict 500 damage to your opponent for each Continuous Spell card destroyed. Each time a "Elflair" monster(s) is Normal or Special Summoned to a zone(s) this card points to, place 1 Elflair Counter on this card. This card gains 100 ATK for each Elflair Counter on your field.
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
