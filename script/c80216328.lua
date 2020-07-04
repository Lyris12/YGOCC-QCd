--One-Eyed Ennigmatrix
function c80216328.initial_effect(c)
	c:EnableReviveLimit()
	--mat=1 "Ennigmat" monster
	aux.AddLinkProcedure(c,aux.FilterBoolFunction(Card.IsSetCard,0xead),1,1)
	--If this card is Link Summoned: You can target 1 "Ennigmat" monster in your GY; attach it to an "Ennigmatrix" Xyz Monster you control, then you can take 1 material from that card and either Special Summon it (if it's a monster) or add it to your hand (if not). You can only use the effect of "One-Eyed Ennigmatrix" once per turn.
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_O)
	e1:SetCode(EVENT_SPSUMMON_SUCCESS)
	e1:SetCountLimit(1,id)
	e1:SetProperty(EFFECT_FLAG_DAMAGE_STEP+EFFECT_FLAG_DELAY+EFFECT_FLAG_CARD_TARGET)
	e1:SetCondition(function(e) return e:GetHandler():IsSummonType(SUMMON_TYPE_LINK) end)
	e1:SetTarget(cid.target)
	e1:SetOperation(cid.operation)
	c:RegisterEffect(e1)
end
function cid.filter(c,tp)
	return c:IsType(TYPE_MONSTER) and c:IsSetCard(0xcfd) and Duel.IsExistingMatchingCard(cid.xfilter,tp,LOCATION_MZONE,0,1,nil) and c:IsCanOverlay()
end
function cid.xfilter(c)
	return c:IsFaceup() and c:IsType(TYPE_XYZ) and c:IsSetCard(0x2ead)
end
function cid.sfilter(c,e,tp)
	if c:IsType(TYPE_SPELL+TYPE_TRAP) then return c:IsAbleToHand() end
	return c:IsCanBeSpecialSummoned(e,0,tp,false,false) and Duel.GetLocationCount(tp,LOCATION_MZONE)>0 
end
function cid.target(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	if chkc then return chkc:IsLocation(LOCATION_GRAVE) and chkc:IsControler(tp) and cid.filter(chkc,tp) end
	if chk==0 then return Duel.IsExistingTarget(cid.filter,tp,LOCATION_GRAVE,0,1,nil,tp) end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_XMATERIAL)
	Duel.SetOperationInfo(0,CATEGORY_LEAVE_GRAVE,Duel.SelectTarget(tp,cid.filter,tp,LOCATION_GRAVE,0,1,1,nil,tp),1,0,0)
end
function cid.operation(e,tp,eg,ep,ev,re,r,rp)
	local tc=Duel.GetFirstTarget()
	if not tc:IsRelateToEffect(e) then return end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_FACEUP)
	local xc=Duel.SelectMatchingCard(tp,cid.xfilter,tp,LOCATION_MZONE,0,1,1,nil):GetFirst()
	if not xc then return end
	Duel.Overlay(xc,tc)
	if not tc:IsLocation(LOCATION_OVERLAY) then return end
	local g=xc:GetOverlayGroup():Filter(cid.sfilter,nil,e,tp)
	if #g>0 and Duel.SelectEffectYesNo(tp,e:GetHandler()) then
		Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_SPSUMMON)
		local sg=g:Select(tp,1,1,nil):GetFirst()
		if sg:IsType(TYPE_SPELL+TYPE_TRAP) then
			Duel.SendtoHand(sg,nil,REASON_EFFECT)
			Duel.ConfirmCards(1-tp,sg)
		else Duel.SpecialSummon(sg,0,tp,tp,false,false,POS_FACEUP) end
	end
end
