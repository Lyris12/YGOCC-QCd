--created by Swag, coded by XGlitchy30
--Leylah, Shadow of the Dreary Forest
local s,id,o=GetID()
function s.initial_effect(c)
	aux.AddOrigDoubleSidedType(c)
	aux.AddDoubleSidedProc(c,SIDE_REVERSE,id-1,id)
	until the end of your opponent's next turn, this card is unaffected by your opponent's monster effects that do not target it, also it cannot be targeted for attacks, but it does not prevent your opponent from attacking you directly.]]
	local e1=Effect.CreateEffect(c)
	e1:Desc(0)
	e1:SetType(EFFECT_TYPE_SINGLE|EFFECT_TYPE_TRIGGER_O)
	e1:SetProperty(EFFECT_FLAG_DELAY)
	e1:SetCode(EVENT_TRANSFORMED)
	e1:HOPT()
	e1:SetCondition(aux.PreTransformationCheckSuccessSingle)
	e1:SetOperation(s.effop)
	c:RegisterEffect(e1)
	aux.AddPreTransformationCheck(c,e1,id-1)
	local e2=Effect.CreateEffect(c)
	e2:Desc(1)
	e2:SetCategory(CATEGORY_REMOVE)
	e2:SetType(EFFECT_TYPE_QUICK_O)
	e2:SetCode(EVENT_CHAINING)
	e2:SetRange(LOCATION_MZONE)
	e2:HOPT()
	e2:SetCondition(s.condition)
	e2:SetTarget(s.target)
	e2:SetOperation(s.operation)
	c:RegisterEffect(e2)
	aux.AddDreamyDrearyTransformation(c,ARCHE_DREAMY_FOREST)
end
function s.effop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	if c:IsRelateToChain() then
		local rct = Duel.GetTurnPlayer()==tp and 1 or 2
		local e1=Effect.CreateEffect(c)
		e1:SetDescription(STRING_IGNORE_BATTLE_TARGET)
		e1:SetType(EFFECT_TYPE_SINGLE)
		e1:SetProperty(EFFECT_FLAG_CANNOT_DISABLE|EFFECT_FLAG_SINGLE_RANGE|EFFECT_FLAG_SET_AVAILABLE|EFFECT_FLAG_CLIENT_HINT)
		e1:SetCode(EFFECT_IGNORE_BATTLE_TARGET)
		e1:SetRange(LOCATION_MZONE)
		e1:SetReset(RESET_EVENT|RESETS_STANDARD|RESET_PHASE|PHASE_END|RESET_TURN_OPPO,rct)
		e1:SetValue(1)
		c:RegisterEffect(e1)
		local e2=e1:Clone()
		e2:Desc(3)
		e2:SetCode(EFFECT_IMMUNE_EFFECT)
		e2:SetValue(s.immval)
		c:RegisterEffect(e2)
	end
end
function s.immval(e,te)
	if not te:IsActiveType(TYPE_MONSTER) or te:GetOwnerPlayer()~=1-e:GetHandlerPlayer() then return false end
	if not te:IsHasProperty(EFFECT_FLAG_CARD_TARGET) then return true end
	local g=Duel.GetChainInfo(0,CHAININFO_TARGET_CARDS)
	return not g or not g:IsContains(e:GetHandler())
end
function s.condition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetTurnPlayer()==1-tp and rp==1-tp
end
function s.target(e,tp,eg,ep,ev,re,r,rp,chk)
	local rc=re:GetHandler()
	if chk==0 then return rc and rc:IsRelateToChain(ev) and rc:IsAbleToRemove() end
	if re:GetHandler():IsRelateToChain(ev) then
		Duel.SetOperationInfo(0,CATEGORY_REMOVE,eg,1,eg:GetFirst():GetControler(),eg:GetFirst():GetLocation())
	end
	if re:GetActivateLocation()==LOCATION_GRAVE then
		e:SetCategory(e:GetCategory()|CATEGORY_GRAVE_ACTION)
	else
		e:SetCategory(e:GetCategory()&~CATEGORY_GRAVE_ACTION)
	end
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	local rc=re:GetHandler()
	if rc and rc:IsRelateToChain(ev) then
		Duel.Banish(rc)
	end
end
