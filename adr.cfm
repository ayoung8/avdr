<script language="JavaScript">
  <cfif session.adverse_role is 0>
    parent.parent.window.location = '../welcome.cfm';
  </cfif>
</script>
<html lang="EN">
<head>
<meta name="keywords" content="">
<title></title>
<!--#set var="ua" value="$HTTP_USER_AGENT" -->
<!--#if expr="$ua = /.*MSIE/" -->
<link href="../css/clf1_ie.css" rel="STYLESHEET" type="text/css"><!--#else -->
<link href="../css/clf1_ns.css" rel="STYLESHEET" type="text/css"><!--#endif -->
<!-- Note to coders: If server does not support Extended SSI, remove the above 4 lines and use only the link to the clf1_ns.css stylesheet. -->
<script language="JavaScript" src="../includes/JavaScript/common.js"></script>
</head>
<body background="../Images/background2.gif">
<SCRIPT LANGUAGE="JavaScript" SRC="../includes/WEBCode/AnchorPosition.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript" SRC="../includes/WEBCode/PopupWindow.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript" SRC="../includes/WEBCode/date.js"></SCRIPT>
<cfinclude template="../includes/WEBCode/CalendarPopup.cfm">
<cfoutput>
<SCRIPT LANGUAGE="JavaScript"> 
var cal1 = new CalendarPopup();

function CheckAge(formfield,fldLength)
{
  formfield.value = formfield.value.toUpperCase();
  if (formfield.value.indexOf('M') > 0 ) {
    formfield.value = formfield.value.substring(0,formfield.value.indexOf('M'));
	if (isNumber(formfield,fldLength) == true) {
	  formfield.value = formfield.value / 12;
	}
	else {
	  return false;
	}
  }
  else {
    return isNumber(formfield,fldLength);
  }
}

function Validate()
{
  var errmsg = "";

  if (document.frmreaction.Operation.value=='delete') 
  {
	return true;
  }
  else
  {  
	  if (document.frmreaction.date_received.value.length<1 ||
		  document.frmreaction.animal_owner_id.value.length<1 ||
		  document.frmreaction.sender_business_party_type_id.value.length<1 ||
		  document.frmreaction.origin_country_id.value.length<1 ||
		  document.frmreaction.assigned_user_id.value.length<1 ||
		  document.frmreaction.number_of_animals_exposed.value.length<1 ||
		  document.frmreaction.number_of_animals_affected.value.length<1 ||
		  document.frmreaction.species_id.value.length<1 ||
		  document.frmreaction.breed_id.value.length<1 ||
		  document.frmreaction.production_type_id.value.length<1 ||
		  document.frmreaction.physiological_status_id.value.length<1 ||
		  document.frmreaction.health_status_id.value.length<1 ||
		  document.frmreaction.treatment_usage_type_id.value.length<1 )
	  {
		errmsg += "\n\n #strLBLErrMissing#:";
		if (document.frmreaction.date_received.value.length<1) {
			errmsg += "\n          * #strLBLDateRecd#";
		}
		if (document.frmreaction.animal_owner_id.value.length<1) {
			errmsg += "\n          * #strLBLOwner# ";
		}
		if (document.frmreaction.sender_business_party_type_id.value.length<1) {
			errmsg += "\n          * #strLBLSender# ";
		}
		if (document.frmreaction.origin_country_id.value.length<1) {
			errmsg += "\n          * #strLBLCountry# ";
		}
		if (document.frmreaction.assigned_user_id.value.length<1) {
			errmsg += "\n          * #strLBLAssignedTo# ";
		}
		if (document.frmreaction.number_of_animals_exposed.value.length<1) {
			errmsg += "\n          * #strLBLAnimalExposed# ";
		}
		if (document.frmreaction.number_of_animals_affected.value.length<1) {
			errmsg += "\n          * #strLBLAnimalAffected# ";
		}
		if (document.frmreaction.species_id.value.length<1) {
			errmsg += "\n          * #strLBLSpecies# ";
		}
		if (document.frmreaction.breed_id.value.length<1) {
			errmsg += "\n          * #strLBLBreed# ";
		}
		if (document.frmreaction.production_type_id.value.length<1) {
			errmsg += "\n          * #strLBLProduction# ";
		}
		if (document.frmreaction.physiological_status_id.value.length<1) {
			errmsg += "\n          * #strLBLPhysiological# ";
		}
		if (document.frmreaction.health_status_id.value.length<1) {
			errmsg += "\n          * #strLBLHealth# ";
		}
		if (document.frmreaction.treatment_usage_type_id.value.length<1) {
			errmsg += "\n          * #strLBLReason# ";
		}
	  }
	  if (errmsg != "") {
		errmsg ="#strLBLErrProcess#  \n" +
		"______________________________" +
		errmsg + 
		"\n______________________________\n" +
		"\n #strLBLErrPleaseSubmit#";
		alert(errmsg);
		return false;
	  }
	  else {
		if (window.frmreaction.weight_type.value == "R") {
		  if ((window.frmreaction.weight_end.value / 1) < (window.frmreaction.weight.value / 1) ) {
			 alert('#strErrWeight#');
			 return false;
		  }
		}
   		if (document.frmreaction.age_type.value == "R") {
		  if ((document.frmreaction.age_end.value / 1) < (document.frmreaction.age.value / 1)) {
			 alert('#strErrAge#');
			 return false;
		  }
		}
	    return true;
	  }
  }
}

function DoDelete()
{
  input_box=confirm('#strLBLConfirmDeleteADR#'); 
  if(input_box==true)
  {
    document.frmreaction.Operation.value='delete';
	document.frmreaction.submit();
	return true;
  }
  else
  {
    return false;
  }
}

function LoadBreed(selected) {
  document.frmreaction.breed_id.length = 0;
  var optionName = new Option('','',false,false);
  var length = document.frmreaction.breed_id.length;
  document.frmreaction.breed_id.options[length] = optionName;
  for (var i=0; i < document.frmreaction.breedlist.length; i++) {
    if (document.frmreaction.breedlist.options[i].value == selected) {
	  optionText = document.frmreaction.breedlist.options[i].text;
	  var myArray = optionText.split('.');
      var optionName = new Option(myArray[1],myArray[0],false,false);
      var length = document.frmreaction.breed_id.length;
      document.frmreaction.breed_id.options[length] = optionName;
	}
  }
}

function CheckType() {
   if (window.frmreaction.age_type.value == 'R')
   {
     window.frmreaction.age_end.disabled = false;
	 window.frmreaction.age_end.style.visibility = "visible";
   }
   else
   {
     window.frmreaction.age_end.value = "";
     window.frmreaction.age_end.disabled = true;
     window.frmreaction.age_end.style.visibility = "hidden";
    }
   if (window.frmreaction.weight_type.value == 'R')
   {
     window.frmreaction.weight_end.disabled = false;
	 window.frmreaction.weight_end.style.visibility = "visible";
   }
   else
   {
     window.frmreaction.weight_end.value = "";
     window.frmreaction.weight_end.disabled = true;
     window.frmreaction.weight_end.style.visibility = "hidden";
    }
  }
 
function CheckTreatment() {
   if (window.frmreaction.treatment_discontinued_flag.value != '1')
   {
     window.frmreaction.adr_resolved_flag.disabled = true;
	 window.frmreaction.adr_resolved_flag.style.visibility = "hidden";
     window.frmreaction.adr_resolved_flag.value = "";
     window.frmreaction.adr_reappear_flag.disabled = true;
	 window.frmreaction.adr_reappear_flag.style.visibility = "hidden";
     window.frmreaction.adr_reappear_flag.value = "";
   }
   else
   {
     window.frmreaction.adr_resolved_flag.disabled = false;
	 window.frmreaction.adr_resolved_flag.style.visibility = "visible";
     if (window.frmreaction.adr_resolved_flag.value != '1')
     {
       window.frmreaction.adr_reappear_flag.disabled = true;
	   window.frmreaction.adr_reappear_flag.style.visibility = "hidden";
       window.frmreaction.adr_reappear_flag.value = "";
     }
	 else
	 {
       window.frmreaction.adr_reappear_flag.disabled = false;
	   window.frmreaction.adr_reappear_flag.style.visibility = "visible";
	 }
    }
  }

function CheckPrevious() {
   if (window.frmreaction.previous_treatment_flag.value != '1')
   {
     window.frmreaction.prv_hour.disabled = true;
	 window.frmreaction.prv_hour.style.visibility = "hidden";
	 window.frmreaction.prv_hour.value = "";
     window.frmreaction.prv_month.disabled = true;
	 window.frmreaction.prv_month.style.visibility = "hidden";
     window.frmreaction.prv_month.value = "";
     window.frmreaction.prv_day.disabled = true;
	 window.frmreaction.prv_day.style.visibility = "hidden";
     window.frmreaction.prv_day.value = "";
     window.frmreaction.previous_treatment_date.disabled = true;
	 window.frmreaction.previous_treatment_date.visibility = "hidden";
     window.frmreaction.previous_treatment_date.value = "";
   }
   else
   {
     window.frmreaction.previous_treatment_date.disabled = false;
	 window.frmreaction.previous_treatment_date.style.visibility = "visible";
     window.frmreaction.prv_hour.disabled = false;
	 window.frmreaction.prv_hour.style.visibility = "visible";
     window.frmreaction.prv_month.disabled = false;
	 window.frmreaction.prv_month.style.visibility = "visible";
     window.frmreaction.prv_day.disabled = false;
	 window.frmreaction.prv_day.style.visibility = "visible";
    }
  }

function SubmitForm_Notes()
{
    if (document.frmreaction.reaction_id.value == 0) {
	  if (Validate() == false) 
	    return false
	  else
	    SubmitADR('add','SubmitForm_Notes()');
	}
	else
	{	
    if (document.frmreaction.notes_description.value.length < 1)
	{
	    alert('#strErrDesc#');
		return false;
	}
	else
	{
		Tab6Frame.detail.reaction_id.value = document.frmreaction.reaction_id.value;
		Tab6Frame.detail.notes_severity_type_id.value = document.frmreaction.notes_severity_type_id.value;
		Tab6Frame.detail.notes_type_id.value = document.frmreaction.notes_type_id.value;
        Tab6Frame.detail.notes_description.value = document.frmreaction.notes_description.value;
        Tab6Frame.detail.submit();
  	    return true;
	}
	}
}

function SubmitForm_Keyword()
{
    if (document.frmreaction.reaction_id.value == 0) {
	  if (Validate() == false) 
	    return false
	  else
	    SubmitADR('add','SubmitForm_Keyword()');
	}
	else
	{	
    if (document.frmreaction.keyword.value.length < 1)
    {
        alert('#strErrDesc#');
	    return false;
    }
    else
    {
		Tab8Frame.detail.reaction_id.value = document.frmreaction.reaction_id.value;
	    Tab8Frame.detail.keyword.value = document.frmreaction.keyword.value;
        Tab8Frame.detail.submit();
        return true;
    }
	}
}

function SubmitForm_Vet()
{
    if (document.frmreaction.reaction_id.value == 0) {
	  if (Validate() == false) 
	    return false
	  else
	    SubmitADR('add','SubmitForm_Vet()');
	}
	else
	{	
    if (document.frmreaction.vet_id.value.length < 1)
	{
	    alert('#strErrVet#');
		return false;
	}
	else
	{
		Tab9Frame.detail.reaction_id.value = document.frmreaction.reaction_id.value;
		Tab9Frame.detail.vet_id.value = document.frmreaction.vet_id.value;
        Tab9Frame.detail.submit();
  	    return true;
	}
	}
}

function SubmitForm_System()
{
    if (document.frmreaction.reaction_id.value == 0) {
	  if (Validate() == false) 
	    return false
	  else
	    SubmitADR('add','SubmitForm_System()');
	}
	else
	{	
    if (document.frmreaction.animal_system_id.value.length < 1)
	{
	    alert('#strErrSystem#');
		return false;
	}
	else
	{
		Tab10Frame.detail.reaction_id.value = document.frmreaction.reaction_id.value;
		Tab10Frame.detail.animal_system_id.value = document.frmreaction.animal_system_id.value;
        Tab10Frame.detail.submit();
  	    return true;
	}
	}
}

function SubmitForm_Actions()
{
    if (document.frmreaction.reaction_id.value == 0) {
	  if (Validate() == false) 
	    return false
	  else
	    SubmitADR('add','SubmitForm_Actions()');
	}
	else
	{	
    if (document.frmreaction.country_id.value.length < 1 ||
	    document.frmreaction.corrective_action_id.value.length < 1)
	{
	    alert('#strErrAction#');
		return false;
	}
	else
	{
		Tab5Frame.detail.reaction_id.value = document.frmreaction.reaction_id.value;
		Tab5Frame.detail.country_id.value = document.frmreaction.country_id.value;
		Tab5Frame.detail.corrective_action_id.value = document.frmreaction.corrective_action_id.value;
		Tab5Frame.detail.correction_date.value = document.frmreaction.correction_date.value;
		Tab5Frame.detail.action_description.value = document.frmreaction.action_description.value;
        Tab5Frame.detail.submit();
        return true;
	}
	}
}

function SubmitForm_Drug()
{
    var ok = "1";
	
    if (document.frmreaction.reaction_id.value == 0) {
	  if (Validate() == false) 
	    return false
	  else
	    SubmitADR('add','SubmitForm_Drug()');
	}
	else
	{	
    if (document.frmreaction.drug_id.value.length < 1 )
	{
	    alert('#strErrMandatory#');
		ok = "0";
		return false;
	}
	if (document.frmreaction.drug_last_administered_on.value != "") {
		if (document.frmreaction.drug_last_administered_on.value < document.frmreaction.drug_first_administered_on.value)
	    {
		   alert('#strErrDateAdmin#');
		   ok = "0";
	  	   return false;
	  	}
        }
	if (ok == "1") {
		Tab2Frame.detail.reaction_id.value = document.frmreaction.reaction_id.value;
		Tab2Frame.detail.drug_id.value = document.frmreaction.drug_id.value;
		Tab2Frame.detail.drug_lot_number.value = document.frmreaction.drug_lot_number.value;
		Tab2Frame.detail.drug_expiration_date.value = document.frmreaction.drug_expiration_date.value;
		Tab2Frame.detail.drug_strength_id.value = document.frmreaction.drug_strength_id.value;
  		Tab2Frame.detail.drug_form_id.value = document.frmreaction.drug_form_id.value;
		Tab2Frame.detail.drug_route_id.value = document.frmreaction.drug_route_id.value;
		Tab2Frame.detail.drug_unit_per_body_weight.value = document.frmreaction.drug_unit_per_body_weight.value;
		Tab2Frame.detail.drug_frequency_id.value = document.frmreaction.drug_frequency_id.value;
		Tab2Frame.detail.drug_dur_month.value = document.frmreaction.drug_dur_month.value;
		Tab2Frame.detail.drug_dur_day.value = document.frmreaction.drug_dur_day.value;
		Tab2Frame.detail.drug_dur_hour.value = document.frmreaction.drug_dur_hour.value;
		Tab2Frame.detail.drug_first_administered_on.value = document.frmreaction.drug_first_administered_on.value;
		Tab2Frame.detail.drug_last_administered_on.value = document.frmreaction.drug_last_administered_on.value;
		Tab2Frame.detail.drug_admin_business_party_type_id.value = document.frmreaction.drug_admin_business_party_type_id.value;
		Tab2Frame.detail.drug_used_as_per_label_flag.value = document.frmreaction.drug_used_as_per_label_flag.value;
		Tab2Frame.detail.drug_quantity.value = document.frmreaction.drug_quantity.value;
		Tab2Frame.detail.drug_frequency_quantity.value = document.frmreaction.drug_frequency_quantity.value;
        Tab2Frame.detail.submit();
  	    return true;
	}
	}
}

function SubmitADR(mode,caller) {
	ADRFrame.detail.dar_number.value = document.frmreaction.dar_number.value;
	ADRFrame.detail.date_received.value = document.frmreaction.date_received.value;
	ADRFrame.detail.assigned_user_id.value = document.frmreaction.assigned_user_id.value;
	ADRFrame.detail.origin_country_id.value = document.frmreaction.origin_country_id.value;
	ADRFrame.detail.animal_owner_id.value = document.frmreaction.animal_owner_id.value;
	ADRFrame.detail.sender_business_party_type_id.value = document.frmreaction.sender_business_party_type_id.value;
	ADRFrame.detail.sender_report_number.value = document.frmreaction.sender_report_number.value;
	ADRFrame.detail.sender_report_date.value = document.frmreaction.sender_report_date.value;
	ADRFrame.detail.dar_file.value = document.frmreaction.dar_file.value;
	ADRFrame.detail.number_of_animals_exposed.value = document.frmreaction.number_of_animals_exposed.value;
	ADRFrame.detail.number_of_animals_affected.value = document.frmreaction.number_of_animals_affected.value;
	ADRFrame.detail.number_of_dead_animals.value = document.frmreaction.number_of_dead_animals.value;
	ADRFrame.detail.species_id.value = document.frmreaction.species_id.value;
	ADRFrame.detail.breed_id.value = document.frmreaction.breed_id.value;
	ADRFrame.detail.mixed_flag.value = document.frmreaction.mixed_flag.value;
	ADRFrame.detail.production_type_id.value = document.frmreaction.production_type_id.value;
	ADRFrame.detail.gender.value = document.frmreaction.gender.value;
	ADRFrame.detail.physiological_status_id.value = document.frmreaction.physiological_status_id.value;
	ADRFrame.detail.weight.value = document.frmreaction.weight.value;
	ADRFrame.detail.weight_end.value = document.frmreaction.weight_end.value;
	ADRFrame.detail.weight_type.value = document.frmreaction.weight_type.value;
	ADRFrame.detail.age.value = document.frmreaction.age.value;
	ADRFrame.detail.age_end.value = document.frmreaction.age_end.value;
	ADRFrame.detail.age_type.value = document.frmreaction.age_type.value;
	ADRFrame.detail.health_status_id.value = document.frmreaction.health_status_id.value;
	ADRFrame.detail.treatment_usage_type_id.value = document.frmreaction.treatment_usage_type_id.value;
	ADRFrame.detail.concurrent_problem_flag.value = document.frmreaction.concurrent_problem_flag.value;
	ADRFrame.detail.date_of_onset.value = document.frmreaction.date_of_onset.value;
	ADRFrame.detail.trt_month.value = document.frmreaction.trt_month.value;
	ADRFrame.detail.trt_day.value = document.frmreaction.trt_day.value;
	ADRFrame.detail.trt_hour.value = document.frmreaction.trt_hour.value;
	ADRFrame.detail.severity_id.value = document.frmreaction.severity_id.value;
	ADRFrame.detail.treatment_of_adr_flag.value = document.frmreaction.treatment_of_adr_flag.value;
	ADRFrame.detail.treatment_outcome_type_id.value = document.frmreaction.treatment_outcome_type_id.value;
	ADRFrame.detail.concurrent_therapy_flag.value = document.frmreaction.concurrent_therapy_flag.value;
	ADRFrame.detail.treatment_discontinued_flag.value = document.frmreaction.treatment_discontinued_flag.value;
	ADRFrame.detail.adr_resolved_flag.value = document.frmreaction.adr_resolved_flag.value;
	ADRFrame.detail.adr_reappear_flag.value = document.frmreaction.adr_reappear_flag.value;
	ADRFrame.detail.previous_treatment_flag.value = document.frmreaction.previous_treatment_flag.value;
	ADRFrame.detail.previous_treatment_date.value = document.frmreaction.previous_treatment_date.value;
	ADRFrame.detail.previous_reaction_flag.value = document.frmreaction.previous_reaction_flag.value;
	ADRFrame.detail.prv_month.value = document.frmreaction.prv_month.value;
	ADRFrame.detail.prv_day.value = document.frmreaction.prv_day.value;
	ADRFrame.detail.prv_hour.value = document.frmreaction.prv_hour.value;
	ADRFrame.detail.classification_type_id.value = document.frmreaction.classification_type_id.value;
	ADRFrame.detail.assessing_vet_user_id.value = document.frmreaction.assessing_vet_user_id.value;
	ADRFrame.detail.vet_cause.value = document.frmreaction.vet_cause.value;
	ADRFrame.detail.vdd_cause.value = document.frmreaction.vdd_cause.value;
	ADRFrame.detail.man_cause.value = document.frmreaction.man_cause.value;
	ADRFrame.detail.corrective_action_flag.value = document.frmreaction.corrective_action_flag.value;
	ADRFrame.detail.submission_affected_flag.value = document.frmreaction.submission_affected_flag.value;
	ADRFrame.detail.other_contacted_flag.value = document.frmreaction.other_contacted_flag.value;
	ADRFrame.detail.reaction_id.value = document.frmreaction.reaction_id.value;
	ADRFrame.detail.Operation.value = mode;
	ADRFrame.detail.Caller.value = caller;
	ADRFrame.detail.submit();
}

function GetBusiness(field,typeid,callerpgm)
{
  if (field.value.length < 1) 
    wName=window.open('businessparty.cfm?caller='+callerpgm+'&Operation=new_business&business_id=0&business_type='+typeid, 'wName' ,'resizable=yes, scrollbars=yes, width=800,height=500,top='+((screen.height - 500) / 2)+',left='+((screen.width - 800) / 2))
  else	
    wName=window.open('businessparty.cfm?caller='+callerpgm+'&Operation=edit_business&business_id='+field.value +'&business_type='+typeid, 'wName' ,'resizable=yes, scrollbars=yes, width=800,height=500,top='+((screen.height - 500) / 2)+',left='+((screen.width - 800) / 2));
}

function SetModeUpdate() {
  document.frmreaction.ok.value = '#strLBLUpdateButtonADR#';
  document.frmreaction.header.value = '#strLBLUpdateReaction#';
  document.frmreaction.key.value = document.frmreaction.reaction_id.value;
  document.frmreaction.Operation.value = 'Save';
  document.frmreaction.deletebutton.style.visibility = "visible";
  document.frmreaction.attachbutton.style.visibility = "visible";
  alert('#strLBLRecordAdded#');
}

function RefreshParty(field,newname,newid) {
  if (field.value.length < 1) {
    var optionName = new Option(newname,newid,false,false);
    var length = field.length;
    field.options[length] = optionName;
	field.value = newid;
  }
  else {
    if (newid < 0) {
      for (var i=0; i < field.length; i++) {
        if (field.options[i].value == newid * -1) 
	      field.remove(i);
	  }
	  field.value = '';
	}
	else
	{
      for (var i=0; i < field.length; i++) {
        if (field.options[i].value == newid) 
	      field.options[i].text = newname;
	  }
    }
  }
  FrameAddress.location='address.cfm?party_id='+document.frmreaction.animal_owner_id.value;
}

function GetFile()
{
  coordinates = getAnchorWindowPosition("loadpos");
  wName = window.open("adrfile.cfm?reaction_id="+document.frmreaction.reaction_id.value,"","toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,alwaysRaised,dependent,titlebar=no,width=520,height=110,screenX="+(coordinates.x - 400)+",left="+(coordinates.x - 400)+",screenY="+(coordinates.y-150)+",top="+(coordinates.y-150))
  wName.window.focus();
}

</SCRIPT>
</cfoutput>
<cfIf Operation is "new_reaction">
  <cfif session.adverse_role lt 3>
    <cfset Operation = "security">
  </cfif>
</cfif>
<cfIf NOT IsDefined("reaction_id")>
  <cfset ReactionID = 0>
<cfelse>
  <cfset ReactionID = reaction_id>
</cfif>
<cfIf Operation is "new_reaction">
  <cfset strLBLReactionHeader = strLBLAddReaction>
  <cfset strLBLReactionButton = strLBLAddButtonADR>
  <cfset strProtect = "">
  <cfif session.evaluator_role is 1>
    <cfset strProtectEvaluator = "">
  <cfelse>
    <cfset strProtectEvaluator = "disabled">
  </cfif>
  <cfstoredproc procedure="pkg_select.ap_select_reaction_header"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
  <cfprocparam type="in" dbvarname="reactionid" value="#ReactionID#" cfsqltype="cf_sql_integer">
  <cfprocresult name="rs">
  </cfstoredproc>
<cfElseIf Operation is "edit_reaction">
  <cfset strLBLReactionHeader = strLBLUpdateReaction>
  <cfif session.adverse_role is 0>
    <cfset Operation = "security">
  <cfelseif session.adverse_role is 1> 
    <cfset strProtect = "disabled">
	<cfset strProtectEvaluator = "disabled">
    <cfset strLBLReactionHeader = strLBLViewReaction>
  <cfelse>
    <cfset strProtect = "">
    <cfif session.evaluator_role is 1>
      <cfset strProtectEvaluator = "">
    <cfelse>
      <cfset strProtectEvaluator = "disabled">
    </cfif>
  </cfif>
  <cfset strLBLReactionButton = strLBLUpdateButtonADR>
  <cfstoredproc procedure="pkg_select.ap_select_reaction_header"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
  <cfprocparam type="in" dbvarname="reactionid" value="#ReactionID#" cfsqltype="cf_sql_integer">
  <cfprocresult name="rs">
  </cfstoredproc>
</cfif>

<cfIf Operation is "new_reaction" or Operation is "edit_reaction">
  <cfoutput query="rs">
    <cfset fldDarNumber = rs.dar_number>
	<cfset fldDateReceived = rs.date_received>
	<cfset fldAssignedUser = rs.assigned_user_id>
	<cfset fldOrigin = rs.origin_country_id>
	<cfset fldAnimalOwner = rs.animal_owner_party_id>
	<cfset fldSender = rs.sender_business_party_type_id>
	<cfset fldSenderReportNo = rs.sender_report_number>
	<cfset fldSenderDate = rs.sender_report_date>
	<cfset fldDarFile = rs.dar_file>
	<cfset fldAnimalExposed = rs.number_of_animals_exposed>
	<cfset fldAnimalAffected = rs.number_of_animals_affected>
	<cfset fldAnimalDead = rs.number_of_dead_animals>
	<cfset fldSpeciesID = rs.species_id>
	<cfset fldBreedID = rs.breed_id>
	<cfset fldMixed = rs.mixed_flag>
	<cfset fldProductionType = rs.production_type_id>
	<cfset fldGender = rs.gender>
	<cfset fldPhysiological = rs.physiological_status_id>
	<cfset fldWeight = rs.weight>
	<cfset fldWeightEnd = rs.weight_end>
	<cfset fldWeightType = rs.weight_type>
	<cfset fldAge = rs.age>
	<cfset fldAgeEnd = rs.age_end>
	<cfset fldAgeType = rs.age_type>
	<cfset fldHealth = rs.health_status_id>
	<cfset fldReason = rs.treatment_usage_type_id>
	<cfset fldConcurrent = rs.concurrent_problem_flag>
	<cfset fldOnset = rs.date_of_onset>
	<cfset fldTrtMonth = rs.trt_month>
	<cfset fldTrtDay = rs.trt_day>
	<cfset fldTrtHour = rs.trt_hour>
	<cfset fldSeverity = rs.severity_id>
	<cfset fldOutcome = rs.treatment_outcome_type_id>
	<cfset fldTreatment = rs.treatment_of_adr_flag>
	<cfset fldPrvMonth = rs.prv_month>
	<cfset fldPrvDay = rs.prv_day>
	<cfset fldPrvHour = rs.prv_hour>
	<cfset fldPrevious = rs.previous_reaction_flag>
	<cfset fldTherapy = rs.concurrent_therapy_flag>
	<cfset fldStop = rs.treatment_discontinued_flag>
	<cfset fldPrvTrt = rs.previous_treatment_flag>
	<cfset fldPrvDate = rs.previous_treatment_date>
	<cfset fldResolved = rs.adr_resolved_flag>
	<cfset fldReappear = rs.adr_reappear_flag>
	<cfset fldVetCause = rs.vet_cause>
	<cfset fldVDDCause = rs.vdd_cause>
	<cfset fldManufacturerCause = rs.manufacturer_cause>
	<cfset fldADRClass = rs.classification_type_id>
	<cfset fldAssessVet = rs.assessing_vet_user_id>
	<cfset fldCorrectiveAction = rs.corrective_action_flag>
	<cfset fldSubmission = rs.submission_affected_flag>
	<cfset fldOther = rs.other_contacted_flag>
  </cfoutput>
</cfif>

<cfif operation is "edit_reaction" or operation is "new_reaction">
<cfoutput>
<form name="frmreaction" action="#SCRIPT_NAME#" method="post" onsubmit="return Validate();">
<table width="100%" border="0" cellspacing="0" cellpadding="0" align="LEFT" valign="TOP" height="100%" background="../Images/background2.gif">
	<tr height="4">
		<td width="5%"></td>
		<td width="90%">
		   	<table width="100%" border="1" cellspacing="0" align="LEFT" cellpading="0" bgcolor="##408080">
	    		<td align="center" width="85%"><font color="##F8CC30"><b><input size="100%" style="font:8pt; background-color:##408080; color: ##F8CC30; border: none; font-weight: bold; text-align: center;" readonly type="text" name="header" value="#strLBLReactionHeader#"></b></font></td>
				<td align="right" width="15%"><font color="##F8CC30"><b>#strLBLID#: <input style="font:8pt; background-color:##408080; color: ##F8CC30; border: none; font-weight: bold; " size="5" readonly type="text" name="key" value="#ReactionID#"></b></font></td>
			</table>
		</td>
		<td width="5%"></td>
	</tr>
	<tr valign="top">
		<td width="5%"></td>
		<td width="90%">
			<table align="left" valign="top" width="100%" BGCOLOR="##C0C0C0" border="0">
		        <TR>
				  <td>
					  <table align="left" valign="top" width="100%" BGCOLOR="##C0C0C0" border="0">
						  <TR>
		    			      <TD><b>#strLBLDateRecd#</b></TD>
			 				  <td><input #strProtect# value="#fldDateReceived#" type="Text" size="10" style="font:8pt" name="date_received" maxlength="10" onblur="javascript:ValidDate(trim(document.frmreaction.date_received.value),document.frmreaction.date_received);"><cfif strProtect is not "disabled"><A HREF="##" onClick="cal1.select(document.frmreaction.date_received,'anchor1','yyyy.MM.dd'); return false;" NAME="anchor1" ID="anchor1"><img src="../images/Calendar.gif" width="21" height="21" border="0" hspace="0" vspace="0" align="absmiddle"></A></cfif></td>
							  <td><b>#strLBLCountry#</b></td>
							  <td><select #strProtect# name="origin_country_id" style="font:8pt; width=130px;">									    
								  </cfoutput>
								  <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
            			          <cfprocparam type="in" dbvarname="listid" value="15" cfsqltype="cf_sql_integer">
			                      <cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
            			          <cfprocresult name="drop_down_list">
			                      </cfstoredproc>
            			          <cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#" <cfif drop_down_list.DDL_Value is fldOrigin> selected </cfif>>#drop_down_list.DDL_Desc#</option></cfoutput>						  
								  <cfoutput>
		   						  </select></TD>
						  </tr>
						  <tr>
   							  <TD><b>#strLBLSender#</b></TD>
							  <TD><select #strProtect# name="sender_business_party_type_id" style="font:8pt; width=130px;">
								  </cfoutput>
            			          <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
			                      <cfprocparam type="in" dbvarname="listid" value="17" cfsqltype="cf_sql_integer">
            			          <cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
			                      <cfprocresult name="drop_down_list">
            			          </cfstoredproc>
			                      <cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#" <cfif drop_down_list.DDL_Value is fldSender> selected </cfif>>#drop_down_list.DDL_Desc#</option></cfoutput>						  
								  <cfoutput>
								  </select></TD>
					          <TD><b>#strLBLAssignedTo#</b></TD>
		    			      <TD><select #strProtect# name="assigned_user_id" style="font:8pt; width=130px;">
								  </cfoutput>
            			          <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
			                      <cfprocparam type="in" dbvarname="listid" value="14" cfsqltype="cf_sql_integer">
            			          <cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
			                      <cfprocresult name="drop_down_list">
            			          </cfstoredproc>
			                      <cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#" <cfif drop_down_list.DDL_Value is fldAssignedUser> selected </cfif>>#drop_down_list.DDL_Desc#</option></cfoutput>						  
								  <cfoutput>
								  </select></TD>
						  </tr>
						  <tr>
					          <TD>#strLBLSenderReportNo#</td>
					          <td><input #strProtect# type="text" style="font:8pt" name="sender_report_number" maxlength="10" value="#fldSenderReportNo#"></td>
		    			      <TD>#strLBLDarNo#</TD>
					          <TD><input #strProtect# type="text" style="font:8pt" name="dar_number" maxlength="10" value="#fldDarNumber#"></TD>
						  </tr>
						  <tr>
		    			      <td>#strLBLSenderDate#</td>
			 				  <td><input #strProtect# value="#fldSenderDate#" type="Text" size="10" style="font:8pt" name="sender_report_date" maxlength="10" onblur="javascript:ValidDate(trim(document.frmreaction.sender_report_date.value),document.frmreaction.sender_report_date);"><cfif strProtect is not "disabled"><A HREF="##" onClick="cal1.select(document.frmreaction.sender_report_date,'anchor2','yyyy.MM.dd'); return false;" NAME="anchor2" ID="anchor2"><img src="../images/Calendar.gif" width="21" height="21" border="0" hspace="0" vspace="0" align="absmiddle"></A></cfif></td>
		    			      <TD>#strLBLDarFile#</TD>
					          <TD><input #strProtect# type="text" style="font:8pt" name="dar_file" maxlength="20" value="#fldDarFile#"></TD>
						  </tr>
					  </table>
				  </td>
				  <td valign="top">
					  <table align="left" valign="top" width="100%" BGCOLOR="##C0C0C0" border="2">
						  <tr valign="top">
			   				  <TD valign="top"><b>#strLBLOwner#</b>&nbsp;
							  	  <select #strProtect# name="animal_owner_id" style="font:8pt; width=150px;" onChange="FrameAddress.location='address.cfm?party_id='+animal_owner_id.value;">
								  <option></option>
								  </cfoutput>
            			          <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
			                      <cfprocparam type="in" dbvarname="listid" value="16" cfsqltype="cf_sql_integer">
            			          <cfprocparam type="in" dbvarname="language" value="#fldAnimalOwner#" cfsqltype="cf_sql_varchar">
			                      <cfprocresult name="drop_down_list">
            			          </cfstoredproc>
			                      <cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#" <cfif drop_down_list.DDL_Value is fldAnimalOwner> selected </cfif>>#drop_down_list.DDL_Desc#</option></cfoutput>						  
								  <cfoutput>
								  </select>
								  <cfif strProtect is not "disabled"><A HREF="##" onClick="GetBusiness(document.frmreaction.animal_owner_id,2,'opener.window.frmreaction.animal_owner_id');"><img src="../images/plus.bmp" width="21" height="21" border="0" hspace="0" vspace="0" align="absmiddle" name="plus"></A></cfif>
							  </TD>
						  </tr>
						  <script language="JavaScript">
							  if (screen.width >= 1024)
							    document.writeln('<tr height="80">')
							  else
							    document.writeln('<tr height="60">');
  						  </script>
							  <td valign="top"><iframe src="address.cfm?party_id=#fldAnimalOwner#" name="FrameAddress" scrolling="Yes" align="LEFT" width="100%" height="100%" id="FrameAddress" frameborder="No" allowtransparency="true"></iframe></td>  
						  </tr>
					  </table>
				  </td>
			</table>
		</td>
		<td width="5%"></td>
	</tr>
	<!-- Include tab back here -->
	<tr>
	 	<td width="5%"></td>
		<td width="90%" bgcolor="##C0C0C0" valign="top">
			<!-- Start Tabs -->
			<TABLE align="left" BORDER="0" CELLSPACING="0" CELLPADDING="0" valign="top">
				<TR>
					<TD>
						<table valign="top" height="20" border="0" cellspacing="0" cellpadding="0" class="TabTableActive" id="Tab1Table" style="background-color: ##408080;font-family: Tahoma; font-size: 10px;">
							<tr>
								<td align="left" valign="top"><IMG SRC="../Images/corner_tl3.gif" WIDTH="4" HEIGHT="4" ALT="" BORDER="0"></td>
								<td>&nbsp;<B><a HREF="##" CLASS="Tab" STYLE="color:##F8F400; font:11" Name="Tab1Label" ONCLICK="ShowDiv('Tab1',this,document.all.Tab1Table)">#strLBLTabAnimal#</a></B>&nbsp;</td>
								<td ALIGN="right" VALIGN="top"><IMG SRC="../Images/corner_tR3.gif" WIDTH="4" HEIGHT="4" ALT="" BORDER="0"></td>
							</tr>
						</table>
					</TD>
					<TD>
						<TABLE valign="top" id=Tab3Table BORDER="0" CELLSPACING="0" CELLPADDING="0" CLASS="TabTable" HEIGHT="20" style="background-color: ##336699;font-family: Tahoma; font-size: 10px;">
							<tr>
								<td ALIGN="right" VALIGN="top"><IMG SRC="../images/corner_tl3.gif" WIDTH="4" HEIGHT="4" ALT="" BORDER="0"></td>
								<td>&nbsp;<B><a HREF="##" NAME="Tab3Label" CLASS="Tab" style="color:white; font:11" ONCLICK="ShowDiv('Tab3',this,document.all.Tab3Table)">#strLBLTabADR#</a></B>&nbsp;</td>
								<td ALIGN="right" VALIGN="top"><IMG SRC="../images/corner_tr3.gif" WIDTH="4" HEIGHT="4" ALT="" BORDER="0"></td>
							</tr>
						</table>					
					</TD>
					<TD>
						<TABLE valign="top" id=Tab2Table BORDER="0" CELLSPACING="0" CELLPADDING="0" CLASS="TabTable" HEIGHT="20" style="background-color: ##336699;font-family: Tahoma; font-size: 10px;">
							<tr>
								<td ALIGN="right" VALIGN="top"><IMG SRC="../images/corner_tl3.gif" WIDTH="4" HEIGHT="4" ALT="" BORDER="0"></td>
								<td>&nbsp;<B><a HREF="##" NAME="Tab2Label" CLASS="Tab" style="color:white; font:11" ONCLICK="ShowDiv('Tab2',this,document.all.Tab2Table)">#strLBLTabDrugData#</a></B>&nbsp;</td>
								<td ALIGN="right" VALIGN="top"><IMG SRC="../images/corner_tr3.gif" WIDTH="4" HEIGHT="4" ALT="" BORDER="0"></td>
							</tr>
						</table>					
					</TD>
					<TD>
						<TABLE valign="top" id=Tab10Table BORDER="0" CELLSPACING="0" CELLPADDING="0" CLASS="TabTable" HEIGHT="20" style="background-color: ##336699;font-family: Tahoma; font-size: 10px;">
							<tr>
								<td ALIGN="right" VALIGN="top"><IMG SRC="../images/corner_tl3.gif" WIDTH="4" HEIGHT="4" ALT="" BORDER="0"></td>
								<td>&nbsp;<B><a HREF="##" NAME="Tab10Label" CLASS="Tab" style="color:white; font:11" ONCLICK="ShowDiv('Tab10',this,document.all.Tab10Table)">#strLBLTabSystem#</a></B>&nbsp;</td>
								<td ALIGN="right" VALIGN="top"><IMG SRC="../images/corner_tr3.gif" WIDTH="4" HEIGHT="4" ALT="" BORDER="0"></td>
							</tr>
						</table>					
					</TD>
					<TD>
						<TABLE valign="top" id=Tab9Table BORDER="0" CELLSPACING="0" CELLPADDING="0" CLASS="TabTable" HEIGHT="20" style="background-color: ##336699;font-family: Tahoma; font-size: 10px;">
							<tr>
								<td ALIGN="right" VALIGN="top"><IMG SRC="../images/corner_tl3.gif" WIDTH="4" HEIGHT="4" ALT="" BORDER="0"></td>
								<td>&nbsp;<B><a HREF="##" NAME="Tab9Label" CLASS="Tab" style="color:white; font:11" ONCLICK="ShowDiv('Tab9',this,document.all.Tab9Table)">#strLBLTabVet#</a></B>&nbsp;</td>
								<td ALIGN="right" VALIGN="top"><IMG SRC="../images/corner_tr3.gif" WIDTH="4" HEIGHT="4" ALT="" BORDER="0"></td>
							</tr>
						</table>					
					</TD>
					<td>
						<TABLE valign="top" id=Tab4Table BORDER="0" CELLSPACING="0" CELLPADDING="0" CLASS="TabTable" HEIGHT="20" style="background-color: ##336699;font-family: Tahoma; font-size: 10px;">
							<tr>
								<td ALIGN="right" VALIGN="top"><IMG SRC="../images/corner_tl3.gif" WIDTH="4" HEIGHT="4" ALT="" BORDER="0"></td>
								<td>&nbsp;<B><a HREF="##" NAME="Tab4Label" CLASS="Tab" style="color:white; font:11" ONCLICK="ShowDiv('Tab4',this,document.all.Tab4Table)">#strLBLTabAssessment#</a></B>&nbsp;</td>
								<td ALIGN="right" VALIGN="top"><IMG SRC="../images/corner_tr3.gif" WIDTH="4" HEIGHT="4" ALT="" BORDER="0"></td>
							</tr>
						</table>					
					</td>
					<td>
						<TABLE valign="top" id=Tab5Table BORDER="0" CELLSPACING="0" CELLPADDING="0" CLASS="TabTable" HEIGHT="20" style="background-color: ##336699;font-family: Tahoma; font-size: 10px;">
							<tr>
								<td ALIGN="right" VALIGN="top"><IMG SRC="../images/corner_tl3.gif" WIDTH="4" HEIGHT="4" ALT="" BORDER="0"></td>
								<td>&nbsp;<B><a HREF="##" NAME="Tab5Label" CLASS="Tab" style="color:white; font:11" ONCLICK="ShowDiv('Tab5',this,document.all.Tab5Table)">#strLBLTabAction#</a></B>&nbsp;</td>
								<td ALIGN="right" VALIGN="top"><IMG SRC="../images/corner_tr3.gif" WIDTH="4" HEIGHT="4" ALT="" BORDER="0"></td>
							</tr>
						</table>					
					</td>
					<td>
						<TABLE valign="top" id=Tab8Table BORDER="0" CELLSPACING="0" CELLPADDING="0" CLASS="TabTable" HEIGHT="20" style="background-color: ##336699;font-family: Tahoma; font-size: 10px;">
							<tr>
								<td ALIGN="right" VALIGN="top"><IMG SRC="../images/corner_tl3.gif" WIDTH="4" HEIGHT="4" ALT="" BORDER="0"></td>
								<td>&nbsp;<B><a HREF="##" NAME="Tab8Label" CLASS="Tab" style="color:white; font:11" ONCLICK="ShowDiv('Tab8',this,document.all.Tab8Table)">#strLBLTabKeyword#</a></B>&nbsp;</td>
								<td ALIGN="right" VALIGN="top"><IMG SRC="../images/corner_tr3.gif" WIDTH="4" HEIGHT="4" ALT="" BORDER="0"></td>
							</tr>
						</table>					
					</td>
					<td>
						<TABLE valign="top" id=Tab6Table BORDER="0" CELLSPACING="0" CELLPADDING="0" CLASS="TabTable" HEIGHT="20" style="background-color: ##336699;font-family: Tahoma; font-size: 10px;">
							<tr>
								<td ALIGN="right" VALIGN="top"><IMG SRC="../images/corner_tl3.gif" WIDTH="4" HEIGHT="4" ALT="" BORDER="0"></td>
								<td>&nbsp;<B><a HREF="##" NAME="Tab6Label" CLASS="Tab" style="color:white; font:11" ONCLICK="ShowDiv('Tab6',this,document.all.Tab6Table)">#strLBLTabNote#</a></B>&nbsp;</td>
								<td ALIGN="right" VALIGN="top"><IMG SRC="../images/corner_tr3.gif" WIDTH="4" HEIGHT="4" ALT="" BORDER="0"></td>
							</tr>
						</table>					
					</td>
					<td>
						<TABLE valign="top" id=Tab11Table BORDER="0" CELLSPACING="0" CELLPADDING="0" CLASS="TabTable" HEIGHT="20" style="background-color: ##336699;font-family: Tahoma; font-size: 10px;">
							<tr>
								<td ALIGN="right" VALIGN="top"><IMG SRC="../images/corner_tl3.gif" WIDTH="4" HEIGHT="4" ALT="" BORDER="0"></td>
								<td>&nbsp;<B><a HREF="##" NAME="Tab11Label" CLASS="Tab" style="color:white; font:11" ONCLICK="ShowDiv('Tab11',this,document.all.Tab11Table)">#strLBLTabDocument#</a></B>&nbsp;</td>
								<td ALIGN="right" VALIGN="top"><IMG SRC="../images/corner_tr3.gif" WIDTH="4" HEIGHT="4" ALT="" BORDER="0"></td>
							</tr>
						</table>					
					</td>
					<td>
						<TABLE valign="top" id=Tab7Table BORDER="0" CELLSPACING="0" CELLPADDING="0" CLASS="TabTable" HEIGHT="20" style="background-color: ##336699;font-family: Tahoma; font-size: 10px;">
							<tr>
								<td ALIGN="right" VALIGN="top"><IMG SRC="../images/corner_tl3.gif" WIDTH="4" HEIGHT="4" ALT="" BORDER="0"></td>
								<td>&nbsp;<B><a HREF="##" NAME="Tab7Label" CLASS="Tab" style="color:white; font:11" ONCLICK="ShowDiv('Tab7',this,document.all.Tab7Table)">#strLBLTabHistory#</a></B>&nbsp;</td>
								<td ALIGN="right" VALIGN="top"><IMG SRC="../images/corner_tr3.gif" WIDTH="4" HEIGHT="4" ALT="" BORDER="0"></td>
							</tr>
						</table>					
					</td>
				</TR>
			</TABLE>
		</td>
		<td width="5%"></td>
	</tr>
	<tr>
	    <td width="5%"></td>
		<td width="90%" height="100%">
			<!-- End Tabs -->
			<TABLE align="left" WIDTH="100%" BORDER="1" CELLSPACING="0" CELLPADDING="4" BORDERCOLOR="##1F1FC3" BORDERCOLORLIGHT="##408080" BORDERCOLORDARK="##408080" BGCOLOR="##C0C0C0" style="font-family: Tahoma; font-size: 12px;" height="100%">
				<tr>
					<td valign="top">
						<!-- Animal DIV-->
						<div id="Tab1" style="display:inline;">
							<table width="100%" border="0" cellpadding="1" cellspacing="1">
								<tr>
									<td><b>#strLBLAnimalExposed#</b></td>
						            <TD><input name="number_of_animals_exposed" type="text" style="font:8pt" value="#fldAnimalExposed#" size="5" maxlength="7" #strProtect# onblur="isNumber(this,9999999);"></TD>
									<Td></Td>
								    <td><b>#strLBLSpecies#</b></td>
									<td colspan="2"><select #strProtect# name="species_id" style="font:8pt; width:200px;" onChange="LoadBreed(document.frmreaction.species_id.options[document.frmreaction.species_id.selectedIndex].value);">									    
									    <option></option>
									    </cfoutput>
					                    <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
                      					<cfprocparam type="in" dbvarname="listid" value="12" cfsqltype="cf_sql_integer">
                      					<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
                      					<cfprocresult name="drop_down_list">
                      					</cfstoredproc>
                      					<cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#"  <cfif drop_down_list.DDL_Value is fldSpeciesID> selected </cfif>>#drop_down_list.DDL_Desc#</option></cfoutput>						  
										<cfoutput>
		   								</select></td>
								</tr>
								<tr>
									<td><b>#strLBLAnimalAffected#</b></td>
						            <TD><input #strProtect# type="text" style="font:8pt" name="number_of_animals_affected" maxlength="7" size="5" value="#fldAnimalAffected#" onblur="isNumber(this,9999999);"></TD>
									<td></td>
									<td><b>#strLBLBreed#</b></td>
									<td colspan="2"><select #strProtect# name="breed_id" style="font:8pt;width:200px;">									    
		   								</select></td>
								</tr>
								<tr>
									<td>#strLBLAnimalDead#</td>
						            <TD><input #strProtect# type="text" style="font:8pt" name="number_of_dead_animals" maxlength="7" size="5" value="#fldAnimalDead#" onblur="isNumber(this,9999999);"></TD>
									<td></td>
									<td><b>#strLBLMixed#</b></td>
									<td colspan="2"><select #strProtect# name="mixed_flag" style="font:8pt; width:50px;">									    
									    </cfoutput>
					                    <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
                      					<cfprocparam type="in" dbvarname="listid" value="18" cfsqltype="cf_sql_integer">
                      					<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
                      					<cfprocresult name="drop_down_list">
                      					</cfstoredproc>
                      					<cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#"  <cfif drop_down_list.DDL_Value is fldMixed> selected </cfif>>#drop_down_list.DDL_Desc#</option></cfoutput>						  
										<cfoutput>
		   								</select>&nbsp;<b>#strLBLGender#</b>&nbsp;
									    <select #strProtect# name="gender" style="font:8pt; width:91px;" >									    
									    </cfoutput>
					                    <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
                      					<cfprocparam type="in" dbvarname="listid" value="20" cfsqltype="cf_sql_integer">
                      					<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
                      					<cfprocresult name="drop_down_list">
                      					</cfstoredproc>
                      					<cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#"  <cfif drop_down_list.DDL_Value is fldGender> selected </cfif>>#drop_down_list.DDL_Desc#</option></cfoutput>						  
										<cfoutput>
		   								</select></td>
								</tr>
							</table>
							<script language="JavaScript">
							  if (screen.width >= 1024)
							    document.writeln('<br><br>');
							</script>
							<table width="100%" border="0" cellpadding="1" cellspacing="1" height="100%">
								<tr>
									<td><b>#strLBLProduction#</b></td>
									<td><select #strProtect# name="production_type_id" style="font:8pt; width:100px;" >									    
									    </cfoutput>
					                    <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
                      					<cfprocparam type="in" dbvarname="listid" value="19" cfsqltype="cf_sql_integer">
                      					<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
                      					<cfprocresult name="drop_down_list">
                      					</cfstoredproc>
                      					<cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#"  <cfif drop_down_list.DDL_Value is fldProductionType> selected </cfif>>#drop_down_list.DDL_Desc#</option></cfoutput>						  
										<cfoutput>
		   								</select></td>
									<td>#strLBLWeight#</td>
						            <td><input #strProtect# type="text" style="font:8pt" name="weight" maxlength="6" size="5" value="#fldWeight#" onblur="isNumber(this,999999);">&nbsp;
									 - &nbsp;
						            <input #strProtect# type="text" style="font:8pt;visibility:hidden;" name="weight_end" maxlength="6" size="5" value="#fldWeightEnd#" onblur="isNumber(this,999999);">&nbsp;
									#strLBLType#&nbsp;
									<select #strProtect# name="weight_type" style="font:8pt; width:80px;" onChange="CheckType();">									    
									    </cfoutput>
					                    <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
                      					<cfprocparam type="in" dbvarname="listid" value="22" cfsqltype="cf_sql_integer">
                      					<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
                      					<cfprocresult name="drop_down_list">
                      					</cfstoredproc>
                      					<cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#"  <cfif drop_down_list.DDL_Value is fldWeightType> selected </cfif>>#drop_down_list.DDL_Desc#</option></cfoutput>						  
										<cfoutput>
		   								</select></td>
								</tr>
								<tr>
									<td><b>#strLBLPhysiological#</b></td>
									<td><select #strProtect# name="physiological_status_id" style="font:8pt; width:100px;" >									    
									    </cfoutput>
					                    <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
                      					<cfprocparam type="in" dbvarname="listid" value="21" cfsqltype="cf_sql_integer">
                      					<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
                      					<cfprocresult name="drop_down_list">
                      					</cfstoredproc>
                      					<cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#"  <cfif drop_down_list.DDL_Value is fldPhysiological> selected </cfif>>#drop_down_list.DDL_Desc#</option></cfoutput>						  
										<cfoutput>
		   								</select></td>
									<td>#strLBLAge#</td>
						            <td><input #strProtect# type="text" style="font:8pt" name="age" maxlength="6" size="5" value="#fldAge#" onblur="CheckAge(this,999);">&nbsp;
									 - &nbsp;
						            <input #strProtect# type="text" style="font:8pt;visibility:hidden;" name="age_end" maxlength="6" size="5" value="#fldAgeEnd#" onblur="CheckAge(this,999);">&nbsp;
									#strLBLType#&nbsp;
									<select #strProtect# name="age_type" style="font:8pt; width:80px;" onChange="CheckType();">									    
									    </cfoutput>
					                    <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
                      					<cfprocparam type="in" dbvarname="listid" value="22" cfsqltype="cf_sql_integer">
                      					<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
                      					<cfprocresult name="drop_down_list">
                      					</cfstoredproc>
                      					<cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#"  <cfif drop_down_list.DDL_Value is fldAgeType> selected </cfif>>#drop_down_list.DDL_Desc#</option></cfoutput>						  
										<cfoutput>
		   								</select></td>
								</tr>
								<tr>
									<td><b>#strLBLHealth#</b></td>
									<td><select #strProtect# name="health_status_id" style="font:8pt; width:100px;" >									    
									    </cfoutput>
					                    <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
                      					<cfprocparam type="in" dbvarname="listid" value="23" cfsqltype="cf_sql_integer">
                      					<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
                      					<cfprocresult name="drop_down_list">
                      					</cfstoredproc>
                      					<cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#"  <cfif drop_down_list.DDL_Value is fldHealth> selected </cfif>>#drop_down_list.DDL_Desc#</option></cfoutput>						  
										<cfoutput>
		   								</select></td>
									<td><b>#strLBLReason#</b></td>
									<td><select #strProtect# name="treatment_usage_type_id" style="font:8pt; width:100px;" >									    
									    </cfoutput>
					                    <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
                      					<cfprocparam type="in" dbvarname="listid" value="24" cfsqltype="cf_sql_integer">
                      					<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
                      					<cfprocresult name="drop_down_list">
                      					</cfstoredproc>
                      					<cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#"  <cfif drop_down_list.DDL_Value is fldReason> selected </cfif>>#drop_down_list.DDL_Desc#</option></cfoutput>						  
										<cfoutput>
		   								</select>&nbsp;&nbsp;
									    <b>#strLBLConcurrent#</b>&nbsp;
									    <select #strProtect# name="concurrent_problem_flag" style="font:8pt; width:40px;" >									    
									    </cfoutput>
					                    <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
                      					<cfprocparam type="in" dbvarname="listid" value="18" cfsqltype="cf_sql_integer">
                      					<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
                      					<cfprocresult name="drop_down_list">
                      					</cfstoredproc>
                      					<cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#"  <cfif drop_down_list.DDL_Value is fldConcurrent> selected </cfif>>#drop_down_list.DDL_Desc#</option></cfoutput>						  
										<cfoutput>
		   								</select></td>
								</tr>
								<tr height="100%">
									<td height="100%" colspan="4">&nbsp;</td>
								</tr>
							</table>
						</div>
						<!-- ADR DIV -->
						<div id="Tab3" style="display:none;">
							<table width="100%" border="0" cellpadding="1" cellspacing="1" height="100%">
								<tr>
								    <td>#strLBLOnset#</td>
	  			 				    <td><input #strProtect# value="#fldOnset#" type="Text" size="10" style="font:8pt" name="date_of_onset" maxlength="10" onblur="javascript:ValidDate(trim(document.frmreaction.date_of_onset.value),document.frmreaction.date_of_onset);"><cfif strProtect is not "disabled"><A HREF="##" onClick="cal1.select(document.frmreaction.date_of_onset,'anchor5','yyyy.MM.dd'); return false;" NAME="anchor5" ID="anchor5"><img src="../images/Calendar.gif" width="21" height="21" border="0" hspace="0" vspace="0" align="absmiddle"></A></cfif></td>
									<td>#strLBLDurationAdr#</td>
						            <TD><input name="trt_month" type="text" style="font:8pt" value="#fldTrtMonth#" size="2" maxlength="3" #strProtect# onblur="isNumber(this,999);">m
                                        <input name="trt_day" type="text" style="font:8pt" value="#fldTrtDay#" size="1" maxlength="3" #strProtect# onblur="isNumber(this,999);">d
                                        <input name="trt_hour" type="text" style="font:8pt" value="#fldTrtHour#" size="1" maxlength="3" #strProtect# onblur="isNumber(this,999);">h</td>										
								    <td>#strLBLSeverity#</td>
									<td><select #strProtect# name="severity_id" style="font:8pt; width:150px;" >
										<option></option>
								  		</cfoutput>
					                    <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
                      					<cfprocparam type="in" dbvarname="listid" value="26" cfsqltype="cf_sql_integer">
                      					<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
                      					<cfprocresult name="drop_down_list">
                      					</cfstoredproc>
                      					<cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#"  <cfif drop_down_list.DDL_Value is fldSeverity> selected </cfif>>#drop_down_list.DDL_Desc#</option></cfoutput>						  
								  		<cfoutput>
		   								</select></td>
								</tr>
								<tr>
								    <td>#strLBLTreatmentAdr#</td>
									<td><select #strProtect# name="treatment_of_adr_flag" style="font:8pt; width:40px;" >									    
									    <option></option>
								  		</cfoutput>
					                    <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
                      					<cfprocparam type="in" dbvarname="listid" value="18" cfsqltype="cf_sql_integer">
                      					<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
                      					<cfprocresult name="drop_down_list">
                      					</cfstoredproc>
                      					<cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#"  <cfif drop_down_list.DDL_Value is fldTreatment> selected </cfif>>#drop_down_list.DDL_Desc#</option></cfoutput>						  
								  		<cfoutput>
		   								</select></td>
								    <td>#strLBLOutcome#</td>
									<td><select #strProtect# name="treatment_outcome_type_id" style="font:8pt; width:150px;" >
										<option></option>
								  		</cfoutput>
					                    <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
                      					<cfprocparam type="in" dbvarname="listid" value="27" cfsqltype="cf_sql_integer">
                      					<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
                      					<cfprocresult name="drop_down_list">
                      					</cfstoredproc>
                      					<cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#"  <cfif drop_down_list.DDL_Value is fldOutcome> selected </cfif>>#drop_down_list.DDL_Desc#</option></cfoutput>						  
								  		<cfoutput>
		   								</select></td>
									<td colspan="2">#strLBLTherapy#
									    <select #strProtect# name="concurrent_therapy_flag" style="font:8pt; width:40px;" >									    
									    <option></option>
								  		</cfoutput>
					                    <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
                      					<cfprocparam type="in" dbvarname="listid" value="18" cfsqltype="cf_sql_integer">
                      					<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
                      					<cfprocresult name="drop_down_list">
                      					</cfstoredproc>
                      					<cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#"  <cfif drop_down_list.DDL_Value is fldTherapy> selected </cfif>>#drop_down_list.DDL_Desc#</option></cfoutput>						  
								  		<cfoutput>
		   								</select></td>
								</tr>
								<tr>
									<td>#strLBLStop#</td>
									<td colspan="5"><select #strProtect# name="treatment_discontinued_flag" style="font:8pt; width:40px;" onChange="CheckTreatment();">									    
									    <option></option>
								  		</cfoutput>
					                    <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
                      					<cfprocparam type="in" dbvarname="listid" value="18" cfsqltype="cf_sql_integer">
                      					<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
                      					<cfprocresult name="drop_down_list">
                      					</cfstoredproc>
                      					<cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#"  <cfif drop_down_list.DDL_Value is fldStop> selected </cfif>>#drop_down_list.DDL_Desc#</option></cfoutput>						  
								  		<cfoutput>
		   								</select>
										&nbsp;#strLBLResolved#&nbsp;
										<select #strProtect# name="adr_resolved_flag" style="font:8pt; width:40px; visibility:hidden;" onChange="CheckTreatment();">									    
									    <option></option>
								  		</cfoutput>
					                    <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
                      					<cfprocparam type="in" dbvarname="listid" value="18" cfsqltype="cf_sql_integer">
                      					<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
                      					<cfprocresult name="drop_down_list">
                      					</cfstoredproc>
                      					<cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#"  <cfif drop_down_list.DDL_Value is fldResolved> selected </cfif>>#drop_down_list.DDL_Desc#</option></cfoutput>						  
								  		<cfoutput>
		   								</select>										
										&nbsp;#strLBLReappear#&nbsp;
										<select #strProtect# name="adr_reappear_flag" style="font:8pt; width:40px; visibility:hidden;" >									    
									    <option></option>
								  		</cfoutput>
					                    <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
                      					<cfprocparam type="in" dbvarname="listid" value="18" cfsqltype="cf_sql_integer">
                      					<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
                      					<cfprocresult name="drop_down_list">
                      					</cfstoredproc>
                      					<cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#"  <cfif drop_down_list.DDL_Value is fldReappear> selected </cfif>>#drop_down_list.DDL_Desc#</option></cfoutput>						  
								  		<cfoutput>
		   								</select>										
									</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
								</tr>
								<tr>
								    <td>#strLBLPrevTrt#</td>
									<td><select #strProtect# name="previous_treatment_flag" style="font:8pt; width:40px;" onChange="CheckPrevious();" >									    
									    <option></option>
								  		</cfoutput>
					                    <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
                      					<cfprocparam type="in" dbvarname="listid" value="18" cfsqltype="cf_sql_integer">
                      					<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
                      					<cfprocresult name="drop_down_list">
                      					</cfstoredproc>
                      					<cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#"  <cfif drop_down_list.DDL_Value is fldPrvTrt> selected </cfif>>#drop_down_list.DDL_Desc#</option></cfoutput>						  
								  		<cfoutput>
		   								</select></td>
									<td>#strLBLPrevDate#</td>
	  			 				    <td><input #strProtect# value="#fldPrvDate#" type="Text" size="10" style="font:8pt;visibility:hidden;" name="previous_treatment_date" maxlength="10" onblur="javascript:ValidDate(trim(document.frmreaction.previous_treatment_date.value),document.frmreaction.previous_treatment_date);"><cfif strProtect is not "disabled"><A  HREF="##" onClick="if (previous_treatment_flag.value == '1') {cal1.select(document.frmreaction.previous_treatment_date,'anchor6','yyyy.MM.dd'); return false;};" NAME="anchor6" ID="anchor6"><img src="../images/Calendar.gif" width="21" height="21" border="0" hspace="0" vspace="0" align="absmiddle"></A></cfif></td>
									<td>#strLBLDurationAdr#</td>
						            <TD><input name="prv_month" type="text" style="font:8pt;visibility:hidden;" value="#fldPrvMonth#" size="2" maxlength="3" #strProtect# onblur="isNumber(this,999);">m
                                        <input name="prv_day" type="text" style="font:8pt;visibility:hidden;" value="#fldPrvDay#" size="1" maxlength="3" #strProtect# onblur="isNumber(this,999);">d
                                        <input name="prv_hour" type="text" style="font:8pt;visibility:hidden;" value="#fldPrvHour#" size="1" maxlength="3" #strProtect# onblur="isNumber(this,999);">h</td>
								</tr>
								<tr>
								    <td>#strLBLPrevious#</td>
									<td><select #strProtect# name="previous_reaction_flag" style="font:8pt; width:40px;" >									    
									    <option></option>
								  		</cfoutput>
					                    <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
                      					<cfprocparam type="in" dbvarname="listid" value="18" cfsqltype="cf_sql_integer">
                      					<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
                      					<cfprocresult name="drop_down_list">
                      					</cfstoredproc>
                      					<cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#"  <cfif drop_down_list.DDL_Value is fldPrevious> selected </cfif>>#drop_down_list.DDL_Desc#</option></cfoutput>						  
								  		<cfoutput>
		   								</select></td>
								</tr>
								<tr height="100%">
									<td height="100%" colspan="4">&nbsp;</td>
								</tr>
							</table>
						</div>
						<!-- Drug Data DIV -->
						<div id="Tab2" style="display:none;">
							<table width="100%" border="0" cellpadding="1" cellspacing="1" height="100%">
								<tr height="100%">
						 			<td colspan="7"><iframe src="adrdrug.cfm?reaction_id=#ReactionID#" name="Tab2Frame" scrolling="Yes" align="LEFT" width="100%" height="100%" id="Tab2Frame" frameborder="Yes" allowtransparency="true"></iframe></td>
								</tr>
								<tr>
									<td width="20%"><b>#strLBLDrug#</b></td>
									<td width="20%">#strLBLRoute#</td>								    
									<td width="10%">#strLBLQuantity#</td>
									<td width="20%">#strLBLForm#</td>
									<td width="10%">#strLBLQuantity#</td>
									<td width="20%">#strLBLFrequency#</td>
									<td>&nbsp;</td>
								</tr>	
								<tr valign="TOP">
									<td width="20%"><select #strProtect# name="drug_id" style="font:8pt; width:100px;">	
									    <option></option>								    
									    </cfoutput>
					                    <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
                      					<cfprocparam type="in" dbvarname="listid" value="35" cfsqltype="cf_sql_integer">
                      					<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
                      					<cfprocresult name="drop_down_list">
                      					</cfstoredproc>
                      					<cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#">#drop_down_list.DDL_Desc#</option></cfoutput>						  
										<cfoutput>
		   								</select></TD>
									<td width="20%"><select #strProtect# name="drug_route_id" style="font:8pt; width:100px;">	
									    <option></option>								    
									    </cfoutput>
					                    <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
                      					<cfprocparam type="in" dbvarname="listid" value="4" cfsqltype="cf_sql_integer">
                      					<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
                      					<cfprocresult name="drop_down_list">
                      					</cfstoredproc>
                      					<cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#">#drop_down_list.DDL_Desc#</option></cfoutput>						  
										<cfoutput>
		   								</select></TD>
									<td width="10%"><input style="font:8pt;" type="Text" name="drug_quantity" align="RIGHT" size="3" maxlength="10" #strprotect# onblur="isNumber(this,9999);"></td>
									<td width="20%"><select #strProtect# name="drug_form_id" style="font:8pt; width:100px;">	
									    <option></option>								    
									    </cfoutput>
					                    <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
                      					<cfprocparam type="in" dbvarname="listid" value="9" cfsqltype="cf_sql_integer">
                      					<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
                      					<cfprocresult name="drop_down_list">
                      					</cfstoredproc>
                      					<cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#">#drop_down_list.DDL_Desc#</option></cfoutput>						  
										<cfoutput>
		   								</select></TD>
									<td width="10%"><input style="font:8pt;" type="Text" name="drug_frequency_quantity" align="RIGHT" size="3" maxlength="10" #strprotect# onblur="isNumber(this,9999);"></td>
									<td width="20%"><select #strProtect# name="drug_frequency_id" style="font:8pt; width:100px;">									    
									    <option></option>								    
									    </cfoutput>
					                    <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
                      					<cfprocparam type="in" dbvarname="listid" value="10" cfsqltype="cf_sql_integer">
                      					<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
                      					<cfprocresult name="drop_down_list">
                      					</cfstoredproc>
                      					<cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#">#drop_down_list.DDL_Desc#</option></cfoutput>						  
										<cfoutput>
		   								</select></TD>
									<td align="center" ><cfif session.adverse_role gt 1><input type="button" value="#strLbLAddModify#" class="button" onclick="return SubmitForm_Drug()"></cfif></td>
								</tr>
								<tr>
								   <td colspan="7">
									<table width="100%" border="0" cellpadding="1" cellspacing="1">
										<tr>
											<td>#strLBLDuration#</td>
											<TD><input name="drug_dur_month" type="text" style="font:8pt" size="1" maxlength="3" #strProtect# onblur="isNumber(this,999);">m
												<input name="drug_dur_day" type="text" style="font:8pt" size="1" maxlength="3" #strProtect# onblur="isNumber(this,999);">d
												<input name="drug_dur_hour" type="text" style="font:8pt" size="1" maxlength="3" #strProtect# onblur="isNumber(this,999);">h</td>										
											<td>#strLBLStart#</td>
											<td><input #strProtect# type="Text" style="font:8pt" size="7" name="drug_first_administered_on" maxlength="10" onblur="javascript:ValidDate(trim(document.frmreaction.drug_first_administered_on.value),document.frmreaction.drug_first_administered_on);"><cfif strProtect is not "disabled"><A HREF="##" onClick="cal1.select(document.frmreaction.drug_first_administered_on,'anchor10','yyyy.MM.dd'); return false;" NAME="anchor10" ID="anchor10"><img src="../images/Calendar.gif" width="21" height="21" border="0" hspace="0" vspace="0" align="absmiddle"></A></cfif></td>
											<td>#strLBLEnd#</td>
											<td><input #strProtect# type="Text" style="font:8pt" size="7" name="drug_last_administered_on" maxlength="10" onblur="javascript:ValidDate(trim(document.frmreaction.drug_last_administered_on.value),document.frmreaction.drug_last_administered_on);"><cfif strProtect is not "disabled"><A HREF="##" onClick="cal1.select(document.frmreaction.drug_last_administered_on,'anchor11','yyyy.MM.dd'); return false;" NAME="anchor11" ID="anchor11"><img src="../images/Calendar.gif" width="21" height="21" border="0" hspace="0" vspace="0" align="absmiddle"></A></cfif></td>
										</tr>
										<tr>
											<td>#strLBLAdminBy#</td>
											<TD><select #strProtect# name="drug_admin_business_party_type_id" style="font:8pt; width:140px;">
												<option></option>
												</cfoutput>
												<cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
												<cfprocparam type="in" dbvarname="listid" value="17" cfsqltype="cf_sql_integer">
												<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
												<cfprocresult name="drop_down_list">
												</cfstoredproc>
												<cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#">#drop_down_list.DDL_Desc#</option></cfoutput>						  
												<cfoutput>
												</select></TD>
											<td>#strLBLLabel#</td>
											<td><select #strProtect# name="drug_used_as_per_label_flag" style="font:8pt;width:40px;" >
												<option></option>
												</cfoutput>
												<cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
												<cfprocparam type="in" dbvarname="listid" value="18" cfsqltype="cf_sql_integer">
												<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
												<cfprocresult name="drop_down_list">
												</cfstoredproc>
												<cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#"  >#drop_down_list.DDL_Desc#</option></cfoutput>						  
												<cfoutput>
												</select></td>
											<td>#strLBLStrength#</td>
											<td><select #strProtect# name="drug_strength_id" style="font:8pt;width:80px;" >									    
												<option></option>
												</cfoutput>
												<cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
												<cfprocparam type="in" dbvarname="listid" value="5" cfsqltype="cf_sql_integer">
												<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
												<cfprocresult name="drop_down_list">
												</cfstoredproc>
												<cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#" >#drop_down_list.DDL_Desc#</option></cfoutput>						  
												<cfoutput>
												</select></td>
										</tr>
										<tr>
											<td>#strLBLUnitBody#</td>
											<TD><input name="drug_unit_per_body_weight" type="text" size="22" style="font:8pt" maxlength="10" #strProtect#></td>
											<td>#strLBLLot#</td>
											<TD><input name="drug_lot_number" type="text" size="8" style="font:8pt" maxlength="20" #strProtect#></td>
											<td>#strLBLExpire#</td>
											<td><input #strProtect# type="Text" size="7" style="font:8pt" name="drug_expiration_date" maxlength="10" onblur="javascript:ValidDate(trim(document.frmreaction.drug_expiration_date.value),document.frmreaction.drug_expiration_date);"><cfif strProtect is not "disabled"><A HREF="##" onClick="cal1.select(document.frmreaction.drug_expiration_date,'anchor12','yyyy.MM.dd'); return false;" NAME="anchor12" ID="anchor1"><img src="../images/Calendar.gif" width="21" height="21" border="0" hspace="0" vspace="0" align="absmiddle"></A></cfif></td>											
										</tr>
 									</table>
								   </td>
								</tr>
							</table>
						</div>
						<!-- System DIV -->
						<div id="Tab10" style="display:none;">
							<table width="100%" border="0" cellpadding="1" cellspacing="1" height="100%">
								<tr height="100%">
						 			<td colspan="3"><iframe src="adrsystem.cfm?reaction_id=#ReactionID#" name="Tab10Frame" scrolling="Yes" align="LEFT" width="100%" height="100%" id="Tab10Frame" frameborder="Yes" allowtransparency="true"></iframe></td>
								</tr>
								<tr>
									<td><b>#strLBLSystem#</b></td>
									<td>
							    	<select #strProtect# name="animal_system_id" style="font:8pt;width:350px;">
								    </cfoutput>
    	       			            <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
			                        <cfprocparam type="in" dbvarname="listid" value="30" cfsqltype="cf_sql_integer">
            			            <cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
			                        <cfprocresult name="drop_down_list">
            			            </cfstoredproc>
			                        <cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#">#drop_down_list.DDL_Desc#</option></cfoutput>						  
								    <cfoutput>
								    </select></TD>
									<td align="center" ><cfif session.adverse_role gt 1><input type="button" value="#strLbLAddModify#" class="button" onclick="return SubmitForm_System()"></cfif></td>
								</tr>
							</table>
						</div>
						<!-- Vet DIV -->
						<div id="Tab9" style="display:none;">
							<table width="100%" border="0" cellpadding="1" cellspacing="1" height="100%">
								<tr height="100%">
						 			<td colspan="3"><iframe src="adrvet.cfm?reaction_id=#ReactionID#" name="Tab9Frame" scrolling="Yes" align="LEFT" width="100%" height="100%" id="Tab9Frame" frameborder="Yes" allowtransparency="true"></iframe></td>
								</tr>
								<tr>
									<td><b>#strLBLVet#</b></td>
									<td><select #strProtect# name="vet_id" style="font:8pt; width:250px;">	
									    <option></option>								    
									    </cfoutput>
					                    <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
                      					<cfprocparam type="in" dbvarname="listid" value="25" cfsqltype="cf_sql_integer">
                      					<cfprocparam type="in" dbvarname="language" value="#ReactionID#" cfsqltype="cf_sql_integer">
                      					<cfprocresult name="drop_down_list">
                      					</cfstoredproc>
                      					<cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#">#drop_down_list.DDL_Desc#</option></cfoutput>						  
										<cfoutput>
		   								</select>
										<cfif strProtect is not "disabled"><A HREF="##" onClick="GetBusiness(document.frmreaction.vet_id,3,'opener.window.frmreaction.vet_id');"><img src="../images/plus.bmp" width="21" height="21" border="0" hspace="0" vspace="0" align="absmiddle" name="plus"></A></cfif>
									</TD>
									<td align="center" ><cfif session.adverse_role gt 1><input type="button" value="#strLbLAddModify#" class="button" onclick="return SubmitForm_Vet()"></cfif></td>
								</tr>
							</table>
						</div>
						<!-- Assessment DIV -->
						<div id="Tab4" style="display:none;">
							<table width="100%" border="0" cellpadding="1" cellspacing="1">
								<tr>
									<td>#strLBLADRClassification#</td>
							  		<TD><select #strProtectEvaluator# name="classification_type_id" style="font:8pt; width=163px;">
										<option></option>
								  		</cfoutput>
            			          		<cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
			                      		<cfprocparam type="in" dbvarname="listid" value="28" cfsqltype="cf_sql_integer">
            			          		<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
			                      		<cfprocresult name="drop_down_list">
            			          		</cfstoredproc>
			                      		<cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#" <cfif drop_down_list.DDL_Value is fldADRClass> selected </cfif>>#drop_down_list.DDL_Desc#</option></cfoutput>						  
								  		<cfoutput>
								  		</select></TD>
									<td colspan="2">#strLBLEvaluator#
							  		    <select #strProtectEvaluator# name="assessing_vet_user_id" style="font:8pt; width=163px;">
										<option></option>
								  		</cfoutput>
            			          		<cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
			                      		<cfprocparam type="in" dbvarname="listid" value="36" cfsqltype="cf_sql_integer">
            			          		<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
			                      		<cfprocresult name="drop_down_list">
            			          		</cfstoredproc>
			                      		<cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#" <cfif drop_down_list.DDL_Value is fldAssessVet> selected </cfif>>#drop_down_list.DDL_Desc#</option></cfoutput>						  
								  		<cfoutput>
								  		</select></TD>
								</tr>
								<tr>
									<td colspan="4">&nbsp;</td>
								</tr>
								<tr>
									<td colspan="4"><b><i>#strLBLCauseTitle#</i></b></td>
								</tr>
								<tr>
									<td>#strLBLAttendingVet#</td>
							  		<TD><select #strProtectEvaluator# name="vet_cause" style="font:8pt; width=163px;">
										<option></option>
								  		</cfoutput>
            			          		<cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
			                      		<cfprocparam type="in" dbvarname="listid" value="29" cfsqltype="cf_sql_integer">
            			          		<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
			                      		<cfprocresult name="drop_down_list">
            			          		</cfstoredproc>
			                      		<cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#" <cfif drop_down_list.DDL_Value is fldVetCause> selected </cfif>>#drop_down_list.DDL_Desc#</option></cfoutput>						  
								  		<cfoutput>
								  		</select></TD>
									<td>#strLBLCorrectiveAction#</td>
									<td><select #strProtectEvaluator# name="corrective_action_flag" style="font:8pt; width:40px;">									    
									    <option></option>
								  		</cfoutput>
					                    <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
                      					<cfprocparam type="in" dbvarname="listid" value="18" cfsqltype="cf_sql_integer">
                      					<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
                      					<cfprocresult name="drop_down_list">
                      					</cfstoredproc>
                      					<cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#"  <cfif drop_down_list.DDL_Value is fldCorrectiveAction> selected </cfif>>#drop_down_list.DDL_Desc#</option></cfoutput>						  
								  		<cfoutput>
		   								</select>										
									</td>
								</tr>
								<tr>
									<td>#strLBLManufacturer#</td>
							  		<TD><select #strProtectEvaluator# name="man_cause" style="font:8pt; width=163px;">
										<option></option>
								  		</cfoutput>
            			          		<cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
			                      		<cfprocparam type="in" dbvarname="listid" value="29" cfsqltype="cf_sql_integer">
            			          		<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
			                      		<cfprocresult name="drop_down_list">
            			          		</cfstoredproc>
			                      		<cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#" <cfif drop_down_list.DDL_Value is fldManufacturerCause> selected </cfif>>#drop_down_list.DDL_Desc#</option></cfoutput>						  
								  		<cfoutput>
								  		</select></TD>
									<td>#strLBLSubmission#</td>
									<td><select #strProtectEvaluator# name="submission_affected_flag" style="font:8pt; width:40px;">									    
									    <option></option>
								  		</cfoutput>
					                    <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
                      					<cfprocparam type="in" dbvarname="listid" value="18" cfsqltype="cf_sql_integer">
                      					<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
                      					<cfprocresult name="drop_down_list">
                      					</cfstoredproc>
                      					<cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#"  <cfif drop_down_list.DDL_Value is fldSubmission> selected </cfif>>#drop_down_list.DDL_Desc#</option></cfoutput>						  
								  		<cfoutput>
		   								</select>										
									</td>
								</tr>
								<tr>
									<td>#strLBLVDD#</td>
							  		<TD><select #strProtectEvaluator# name="vdd_cause" style="font:8pt; width=163px;">
										<option></option>
								  		</cfoutput>
            			          		<cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
			                      		<cfprocparam type="in" dbvarname="listid" value="29" cfsqltype="cf_sql_integer">
            			          		<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
			                      		<cfprocresult name="drop_down_list">
            			          		</cfstoredproc>
			                      		<cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#" <cfif drop_down_list.DDL_Value is fldVDDCause> selected </cfif>>#drop_down_list.DDL_Desc#</option></cfoutput>						  
								  		<cfoutput>
								  		</select></TD>
									<td>#strLBLOther#</td>
									<td><select #strProtectEvaluator# name="other_contacted_flag" style="font:8pt; width:40px;">									    
									    <option></option>
								  		</cfoutput>
					                    <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
                      					<cfprocparam type="in" dbvarname="listid" value="18" cfsqltype="cf_sql_integer">
                      					<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
                      					<cfprocresult name="drop_down_list">
                      					</cfstoredproc>
                      					<cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#"  <cfif drop_down_list.DDL_Value is fldOther> selected </cfif>>#drop_down_list.DDL_Desc#</option></cfoutput>						  
								  		<cfoutput>
		   								</select>										
									</td>
								</tr>
								<tr height="100%">
									<td height="100%" colspan="4">&nbsp;</td>
								</tr>
							</table>
						</div>
						<!-- Regulatory DIV -->
						<div id="Tab5" style="display:none;">
							<table width="100%" border="0" cellpadding="1" cellspacing="1" height="100%">
								<tr height="80%">
						 			<td colspan="5"><iframe src="adraction.cfm?reaction_id=#ReactionID#" name="Tab5Frame" scrolling="Yes" align="LEFT" width="100%" height="100%" id="Tab5Frame" frameborder="Yes" allowtransparency="true"></iframe></td>
								</tr>
								<tr>
									<td><b>#strLBLCountryID#</b></td>
									<td><b>#strLBLCorrectAction#</b></td>
									<td>#strLBLDate#</td>
									<td>#strLBLNotesDesc#</td>
								</tr>
								<tr height="20%">
									<td>
							    	<select #strProtectEvaluator# name="country_id" style="font:8pt;width:150px;">
								    </cfoutput>
    	       			            <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
			                        <cfprocparam type="in" dbvarname="listid" value="15" cfsqltype="cf_sql_integer">
            			            <cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
			                        <cfprocresult name="drop_down_list">
            			            </cfstoredproc>
			                        <cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#">#drop_down_list.DDL_Desc#</option></cfoutput>						  
								    <cfoutput>
								    </select></TD>
									<td>
							    	<select #strProtectEvaluator# name="corrective_action_id" style="font:8pt;width:150px;">
								    </cfoutput>
    	       			            <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
			                        <cfprocparam type="in" dbvarname="listid" value="31" cfsqltype="cf_sql_integer">
            			            <cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
			                        <cfprocresult name="drop_down_list">
            			            </cfstoredproc>
			                        <cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#">#drop_down_list.DDL_Desc#</option></cfoutput>						  
								    <cfoutput>
								    </select></TD>
	  			 				    <td><input #strProtectEvaluator#  type="Text" size="10" style="font:8pt" name="correction_date" maxlength="10" onblur="javascript:ValidDate(trim(document.frmreaction.correction_date.value),document.frmreaction.correction_date);"><cfif strProtect is not "disabled"><A HREF="##" onClick="cal1.select(document.frmreaction.correction_date,'anchor7','yyyy.MM.dd'); return false;" NAME="anchor7" ID="anchor1"><img src="../images/Calendar.gif" width="21" height="21" border="0" hspace="0" vspace="0" align="absmiddle"></A></cfif></td>
									<td><textarea #strProtectEvaluator# cols="20" rows="3" name="action_description" style="font:8pt" onKeyDown="textCounter(document.frmreaction.action_description,3990)" onKeyUp="textCounter(document.frmreaction.notes_description,3990)"></textarea></TD>
									<td align="center" ><cfif session.adverse_role gt 1 and session.evaluator_role is 1><input type="button" value="#strLbLAddModify#" class="button" onclick="return SubmitForm_Actions()"></cfif></td>
								</tr>
							</table>
						</div>
						<!-- Keyword DIV -->
						<div id="Tab8" style="display:none;">
							<table width="100%" border="0" cellpadding="1" cellspacing="1" height="100%">
								<tr height="100%">
						 			<td colspan="3"><iframe src="adrkeyword.cfm?reaction_id=#ReactionID#" name="Tab8Frame" scrolling="Yes" align="LEFT" width="100%" height="100%" id="Tab8Frame" frameborder="Yes" allowtransparency="true"></iframe></td>
								</tr>
								<tr>
									<td><b>#strLBLKeyword#</b></td>
									<td><input #strProtect# name="keyword" type="text" maxlength="50" size="50"></td>
									<td align="center" ><cfif session.adverse_role gt 1><input type="button" value="#strLbLAddModify#" class="button" onclick="return SubmitForm_Keyword()"></cfif></td>
								</tr>
							</table>
						</div>
						<!-- Notes DIV -->
						<div id="Tab6" style="display:none;">
							<table width="100%" border="0" cellpadding="1" cellspacing="1" height="100%">
								<tr height="80%">
						 			<td colspan="3"><iframe src="adrnote.cfm?reaction_id=#ReactionID#" name="Tab6Frame" scrolling="Yes" align="LEFT" width="100%" height="100%" id="Tab6Frame" frameborder="Yes" allowtransparency="true"></iframe></td>
								</tr>
								<tr>
									<td><b>#strLBLNotesType#</b><br>
									    <b>#strLBLNotesSeverity#</b></td>
									<td><b>#strLBLNotesDesc#</b></td>
									<td></td>
								</tr>
								<tr height="20%">
									<td><select #strProtect# name="notes_type_id" style="font:8pt; width=200px;">									    
									    </cfoutput>
					                    <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
                      					<cfprocparam type="in" dbvarname="listid" value="7" cfsqltype="cf_sql_integer">
                      					<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
                      					<cfprocresult name="drop_down_list">
                      					</cfstoredproc>
                      					<cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#">#drop_down_list.DDL_Desc#</option></cfoutput>						  
										<cfoutput>
		   								</select><br>
									    <select #strProtect# name="notes_severity_type_id" style="font:8pt; width=200px;">									    
									    </cfoutput>
					                    <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
                      					<cfprocparam type="in" dbvarname="listid" value="8" cfsqltype="cf_sql_integer">
                      					<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
                      					<cfprocresult name="drop_down_list">
                      					</cfstoredproc>
                      					<cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#">#drop_down_list.DDL_Desc#</option></cfoutput>						  
										<cfoutput>
		   								</select></TD>
									<td><textarea #strProtect# cols="35" rows="3" name="notes_description" style="font:8pt" onKeyDown="textCounter(document.frmreaction.notes_description,3990)" onKeyUp="textCounter(document.frmreaction.notes_description,3990)"></textarea></TD>
									<td align="center" ><cfif session.adverse_role gt 1><input type="button" value="#strLbLAddModify#" class="button" onclick="return SubmitForm_Notes()"></cfif></td>
								</tr>
							</table>
						</div>
						<!-- Document DIV -->
						<div id="Tab11" style="display:none;">
							<table width="100%" border="0" cellpadding="1" cellspacing="1" height="100%">
								<tr height="90%">
						 			<td><iframe width="100%" height="100%" name="Tab11Frame" id="Tab11Frame" ALLOWTRANSPARENCY="true" src="adrdocument.cfm?reaction_id=#ReactionID#" align="left" frameborder="1" scrolling="yes"></iframe></td>
								</tr>
								<tr height="10%">
									<td align="right"><input class="button" type="Button" name="attachbutton" value="#strLBLAttach#" #strProtect#  <cfif Operation is "new_reaction">style="visibility:hidden;"</cfif> onClick="GetFile();"><A name="loadpos"></a></td>
								</tr>
							</table>	
						</div>
						<!-- History DIV -->
						<div id="Tab7" style="display:none;">
							<table width="100%" border="0" cellpadding="1" cellspacing="1" height="100%">
								<tr height="90%">
						 			<td><iframe width="100%" height="100%" name="Tab7Frame" id="Tab7Frame" ALLOWTRANSPARENCY="true" src="adrhistory.cfm?reaction_id=0" align="left" frameborder="1" scrolling="yes"></iframe></td>
								</tr>
								<tr height="10%">
									<td align="right"><input class="button" type="Button" name="Retrieve" value="#strLBLRetrieve#" onClick="Tab7Frame.location='adrhistory.cfm?reaction_id=#ReactionID#';"></td>
								</tr>
							</table>	
						</div>
					</td>
				</tr>
			</table>		
		</td>
		<td width="5%"></td>
	</tr>
	<tr valign="top">
		<td width="5%"></td>
	    <td width="90%">
			<table align="left" width="100%" cellspacing="0" cellpadding="0" border="0" height="20">
				<script language="JavaScript">
				  if (screen.width >= 1024)
				    document.writeln('<tr><td><br></td><tr>');
				</script>
				<tr>
				<td align="right">
				<cfif Operation is not "new_reaction">
					<input type="button" class="button" name="printbutton" value="#strLBLPrintButton#" onClick="parent.openReport('adrreport.cfm?reaction_id=#ReactionID#','wName','700','400');">
  				  	&nbsp;&nbsp;
				</cfif>
				<cfif (strProtect is not "disabled") and session.adverse_role is 4>					
					<input class="button" type="button" name="deletebutton" value="#strLBLDeleteButtonADR#" <cfif Operation is "new_reaction">style="visibility:hidden;"</cfif> onClick="return DoDelete();">
  				  	&nbsp;&nbsp;
				</cfif>
				<cfif strProtect is not "disabled">
				  	<input class="button" type="button" name="ok" value="#strLBLReactionButton#" onClick="if (Validate()) {SubmitADR(document.frmreaction.Operation.value,'');};">
				</cfif>
				</td>
				</tr>
				<tr>
				<td align="right">
			    <cfif Operation is "new_reaction">
  					<input type="hidden" name="Operation" value="Add">
				<cfelse>
  					<input type="hidden" name="Operation" value="Save">
				</cfif>
				<select style="visibility:hidden" name="breedlist">
			    </cfoutput>
                <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
				<cfprocparam type="in" dbvarname="listid" value="13" cfsqltype="cf_sql_integer">
				<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
				<cfprocresult name="drop_down_list">
				</cfstoredproc>
				<cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#">#drop_down_list.DDL_Desc#</option></cfoutput>						  
				<cfoutput>
				</select>
				<input type="hidden" name="reaction_id" value="#ReactionID#">
				<input type="hidden" name="return_org_name">
				<input type="hidden" name="return_party_id">
				<iframe style="visibility:hidden;" width="0" height="0" name="ADRFrame" id="ADRFrame" src="adrprocess.cfm?Operation=none" ></iframe>
				</td>
				</tr>
			</table>
		</td>
		<td width="5%"></td>
	</tr>
	<tr valign="top" height="100%">
	    <td width="5%"></td>
		<td width="90%"></td>
		<td width="5%"></td>
	</tr>
</table>
</cfoutput>
</form>
<script language="JavaScript">
 CheckType();
 CheckTreatment();
 CheckPrevious();
 if (window.frmreaction.date_received.disabled == false)
   window.frmreaction.date_received.focus();
 if (window.frmreaction.species_id.value > 0)
 {
   LoadBreed(window.frmreaction.species_id.value);
   <cfoutput>
   window.frmreaction.breed_id.value = '#fldBreedID#';
   </cfoutput>
 }
 if (screen.width < 1024)
   if (window.frmreaction.action_description + "" != "undefined")
     window.frmreaction.action_description.cols = 10;
</script>
<cfelseif operation is "security">
   You do not have the security privelege to add a new adverse reaction.
<cfelseif operation is "delete">
  <cfstoredproc procedure="pkg_adr.ap_delete_reaction"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
  <cfprocparam type="in" dbvarname="reactionid" value="#ReactionID#" cfsqltype="cf_sql_integer">
  <cfprocparam type="out" dbvarname="rc" variable="rc" cfsqltype="cf_sql_integer">
  </cfstoredproc>
  <cfoutput>
  <cfif rc is 0>
    <script language=javascript>
	  alert('#strAlertKeyRef#');
	</script>
  <cfelse>
    <script language="JavaScript">
	  parent.window.location.reload();
    </script>
  </cfif>
  </cfoutput>
</cfif>
</body>
</html>