--created by Seth
--Great London Assassin Amy
local s,id,o=GetID()
function s.initial_effect(c)
	--During the Main Phase (Quick Effect): You can discard this card; choose 1 "Great London" card from your Deck and place it on top of your Deck. You can discard 1 "Great London" card; add 1 "Great London Clue" card from your GY to your hand. At the start of the Damage Step, if this card attacks a monster while you control 3 or more "Great London Clue" cards: Destroy that monster, then you can Special Summon 1 "Great London" monster from your hand in the Defense Position. You can only use each effect of "Great London Assassin Amy" once per turn.
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
