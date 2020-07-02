--Epochborn Scoundrel - Aervin
function c51615310.initial_effect(c)
	c:EnableReviveLimit()
	--mat=1 Level 2 or lower "Epochborn" monster
	aux.AddLinkProcedure(c,cid.mfilter,1,1)
	--When this card is Link Summoned: You can target 1 Level 3 or higher "Epochborn" monster in your GY; Special Summon it.
	local e3=Effect.CreateEffect(c)
	e3:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_O)
	e3:SetCode(EVENT_SPSUMMON_SUCCESS)
	e3:SetProperty(EFFECT_FLAG_DAMAGE_STEP+EFFECT_FLAG_CARD_TARGET)
	e3:SetCategory(CATEGORY_SPECIAL_SUMMON)
	e3:SetCondition(function(e) return e:GetHandler():IsSummonType(SUMMON_TYPE_LINK) end)
	e3:SetTarget(cid.target)
	e3:SetOperation(cid.operation)
	c:RegisterEffect(e3)
	--Monsters Special Summoned from the Extra Deck this card points to cannot activate their effects, also their effects are negated.
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_FIELD)
	e1:SetCode(EFFECT_CANNOT_TRIGGER)
	e1:SetRange(LOCATION_MZONE)
	e1:SetProperty(EFFECT_FLAG_PLAYER_TARGET)
	e1:SetTargetRange(LOCATION_MZONE,LOCATION_MZONE)
	e1:SetTarget(cid.limtg)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_FIELD)
	e2:SetCode(EFFECT_DISABLE)
	e2:SetRange(LOCATION_MZONE)
	e2:SetTargetRange(LOCATION_MZONE,LOCATION_MZONE)
	e2:SetTarget(cid.limtg)
	c:RegisterEffect(e2)
	--You can only Special Summon 1 "Epochborn Scoundrel - Aervin" per turn.
	c:SetSPSummonOnce(id)
end
function cid.mfilter(c)
	return c:IsLevelBelow(2) and c:IsSetCard(0xcfd)
end
function cid.filter(c,e,tp)
	return c:IsLevelAbove(3) c:IsSetCard(0xcfd) and c:IsCanBeSpecialSummoned(e,0,tp,false,false)
end
function cid.target(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	if chkc then return chkc:IsLocation(LOCATION_GRAVE) and chkc:IsControler(tp) and cid.filter(chkc,e,tp) end
	if chk==0 then return Duel.GetLocationCount(tp,LOCATION_MZONE)>0
		and Duel.IsExistingTarget(cid.filter,tp,LOCATION_GRAVE,0,1,nil,e,tp) end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_SPSUMMON)
	Duel.SetOperationInfo(0,CATEGORY_SPECIAL_SUMMON,Duel.SelectTarget(tp,cid.filter,tp,LOCATION_GRAVE,0,1,1,nil,e,tp),1,0,0)
end
function cid.operation(e,tp,eg,ep,ev,re,r,rp)
	local tc=Duel.GetFirstTarget()
	if tc:IsRelateToEffect(e) then Duel.SpecialSummon(tc,0,tp,tp,false,false,POS_FACEUP) end
end
function cid.limtg(e,c)
	return e:GetHandler():GetLinkedGroup():IsContains(c) and c:GetSummonLocation()==LOCATION_EXTRA
end
