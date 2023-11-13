--created by Zarc
--Elflair - Grover, Overgrown Vine King
local s,id,o=GetID()
function s.initial_effect(c)
	--3+ "Elflair" monsters You can only control 1 "Elflair - Grover, Overgrown Vine King". You can banish this card from your GY; banish 1 "Elflair" monster on the field with 2000 or more ATK, and if you do, Special Summon 1 "Elflair" monster from your Extra Deck or GY. You can target 1 face-up monster your opponent controls; return all "Elflair" Link, Fusion, Synchro or Xyz Monsters from your GY to the Extra Deck, and if you do, change that targeted monster's ATK to 0. You can only use this effect of Elflair - Grover, Overgrown Vine King" once per turn.
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
