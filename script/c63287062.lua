local s,id=GetID()
--Golden Drops
function s.initial_effect(c)
	--Tribute 1 monster with either 1000 ATK or DEF; gain LP equal to that monster's original ATK or DEF, whichever is higher (your choice, if tied).
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetCategory(CATEGORY_RECOVER)
	e1:SetCost(function() e1:SetLabel(1) return true end)
	e1:SetTarget(s.tg)
	e1:SetOperation(s.op)
	c:RegisterEffect(e1)
end
function s.tg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then
		if e:GetLabel()~=1 then return end
		e:SetLabel(0)
		return Duel.CheckReleaseGroup(tp,aux.OR(Card.IsAttack,Card.IsDefense),1,nil,1000)
	end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_RELEASE)
	local tc=Duel.SelectReleaseGroup(tp,aux.OR(Card.IsAttack,Card.IsDefense),1,1,nil,1000):GetFirst()
	local d=math.max(tc:GetAttack(),tc:GetDefense())
	Duel.Release(tc,REASON_COST)
	Duel.SetTargetParam(d)
	Duel.SetTargetPlayer(tp)
	Duel.SetOperationInfo(0,CATEGORY_RECOVER,nil,0,tp,d)
end
function s.op(e,tp,eg,ep,ev,re,r,rp)
	local p,d=Duel.GetChainInfo(0,CHAININFO_TARGET_PLAYER,CHAININFO_TARGET_PARAM)
	Duel.Recover(p,d,REASON_EFFECT)
end
