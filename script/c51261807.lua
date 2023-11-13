--created by Zarc
--Elflair - Nihilis, Enhanced Elf Sorcerer
local s,id,o=GetID()
function s.initial_effect(c)
	--1 "Elflair" monster You cannot Special Summon monsters, except "Elflair" monsters. You can target 1 of your "Elflair" monsters that is banished or in your GY; Special Summon it to your zone that 2 or more "Elflair" Link Monsters point to. You can only use this effect of "Elflair - Nihilis, Enhanced Elf Sorcerer" once per turn. You can only Special Summon "Elflair - Nihilis, Enhanced Elf Sorcerer(s)" once per turn.
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
