<cfIf NOT IsDefined("reaction_id")>
  <cfset ReactionID = 0>
<cfelse>
  <cfset ReactionID = reaction_id>
</cfif>
<cfif operation is "Add">
  <cfstoredproc procedure="pkg_adr.ap_add_reaction"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
  <cfprocparam type="in" dbvarname="darnumber" value="#dar_number#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="datereceived" value="#date_received#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="assigneduser" value="#assigned_user_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="origin" value="#origin_country_id#" cfsqltype="cf_sql_integer">
  <cfprocparam type="in" dbvarname="animalowner" value="#animal_owner_id#" cfsqltype="cf_sql_integer">
  <cfprocparam type="in" dbvarname="sender" value="#sender_business_party_type_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="senderreportno" value="#sender_report_number#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="senderdate" value="#sender_report_date#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="darfile" value="#dar_file#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="animalexposed" value="#number_of_animals_exposed#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="animalaffected" value="#number_of_animals_affected#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="animaldead" value="#number_of_dead_animals#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="speciesid" value="#species_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="breedid" value="#breed_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="mixed" value="#mixed_flag#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="productiontype" value="#production_type_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="genderid" value="#gender#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="physiological" value="#physiological_status_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="In" dbvarname="weightstart" value="#weight#" cfsqltype="CF_SQL_varchar">
  <cfprocparam type="in" dbvarname="weightend" value="#weight_end#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="weighttype" value="#weight_type#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="In" dbvarname="agestart" value="#age#" cfsqltype="CF_SQL_varchar">
  <cfprocparam type="in" dbvarname="ageend" value="#age_end#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="agetype" value="#age_type#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="health" value="#health_status_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="reason" value="#treatment_usage_type_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="concurrent" value="#concurrent_problem_flag#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="dateonset" value="#date_of_onset#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="trt_month" value="#trt_month#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="trt_day" value="#trt_day#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="trt_hour" value="#trt_hour#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="severityid" value="#severity_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="treatmentflag" value="#treatment_of_adr_flag#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="outcomeid" value="#treatment_outcome_type_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="therapyflag" value="#concurrent_therapy_flag#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="stopflag" value="#treatment_discontinued_flag#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="resolvedflag" value="#adr_resolved_flag#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="reappearflag" value="#adr_reappear_flag#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="prvtrtflag" value="#previous_treatment_flag#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="prvdate" value="#previous_treatment_date#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="prvadrflag" value="#previous_reaction_flag#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="prv_month" value="#prv_month#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="prv_day" value="#prv_day#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="prv_hour" value="#prv_hour#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="classtypeid" value="#classification_type_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="assessvet" value="#assessing_vet_user_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="vetcause" value="#vet_cause#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="vddcause" value="#vdd_cause#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="mancause" value="#man_cause#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="correctiveflag" value="#corrective_action_flag#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="submissionflag" value="#submission_affected_flag#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="otherflag" value="#other_contacted_flag#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="out" dbvarname="reactionid" variable="ReactionID" cfsqltype="cf_sql_integer">
  </cfstoredproc>
  <cfoutput>
  	<script language="JavaScript">
		parent.window.frmreaction.reaction_id.value = #ReactionID#;
		<cfif caller is not ''>
			parent.window.#caller#;
		</cfif>
		parent.window.SetModeUpdate();
	</script>
  </cfoutput>
<cfelseif operation is "Save">
  <cfstoredproc procedure="pkg_adr.ap_update_reaction"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
  <cfprocparam type="in" dbvarname="reactionid" value="#ReactionID#" cfsqltype="cf_sql_integer">
  <cfprocparam type="in" dbvarname="darnumber" value="#dar_number#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="datereceived" value="#date_received#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="assigneduser" value="#assigned_user_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="origin" value="#origin_country_id#" cfsqltype="cf_sql_integer">
  <cfprocparam type="in" dbvarname="animalowner" value="#animal_owner_id#" cfsqltype="cf_sql_integer">
  <cfprocparam type="in" dbvarname="sender" value="#sender_business_party_type_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="senderreportno" value="#sender_report_number#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="senderdate" value="#sender_report_date#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="darfile" value="#dar_file#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="animalexposed" value="#number_of_animals_exposed#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="animalaffected" value="#number_of_animals_affected#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="animaldead" value="#number_of_dead_animals#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="speciesid" value="#species_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="breedid" value="#breed_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="mixed" value="#mixed_flag#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="productiontype" value="#production_type_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="genderid" value="#gender#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="physiological" value="#physiological_status_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="In" dbvarname="weightstart" value="#weight#" cfsqltype="CF_SQL_varchar">
  <cfprocparam type="in" dbvarname="weightend" value="#weight_end#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="weighttype" value="#weight_type#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="In" dbvarname="agestart" value="#age#" cfsqltype="CF_SQL_varchar">
  <cfprocparam type="in" dbvarname="ageend" value="#age_end#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="agetype" value="#age_type#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="health" value="#health_status_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="reason" value="#treatment_usage_type_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="concurrent" value="#concurrent_problem_flag#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="dateonset" value="#date_of_onset#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="trt_month" value="#trt_month#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="trt_day" value="#trt_day#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="trt_hour" value="#trt_hour#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="severityid" value="#severity_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="treatmentflag" value="#treatment_of_adr_flag#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="outcomeid" value="#treatment_outcome_type_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="therapyflag" value="#concurrent_therapy_flag#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="stopflag" value="#treatment_discontinued_flag#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="resolvedflag" value="#adr_resolved_flag#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="reappearflag" value="#adr_reappear_flag#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="prvtrtflag" value="#previous_treatment_flag#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="prvdate" value="#previous_treatment_date#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="prvadrflag" value="#previous_reaction_flag#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="prv_month" value="#prv_month#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="prv_day" value="#prv_day#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="prv_hour" value="#prv_hour#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="classtypeid" value="#classification_type_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="assessvet" value="#assessing_vet_user_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="vetcause" value="#vet_cause#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="vddcause" value="#vdd_cause#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="mancause" value="#man_cause#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="correctiveflag" value="#corrective_action_flag#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="submissionflag" value="#submission_affected_flag#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="otherflag" value="#other_contacted_flag#" cfsqltype="cf_sql_varchar">
  </cfstoredproc>
  <cfoutput>
  	<script language="JavaScript">
	  alert('#strLBLRecordUpdated#');
	</script>
  </cfoutput>
</cfif>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE></TITLE>
<!--#set var="ua" value="$HTTP_USER_AGENT" -->
<!--#if expr="$ua = /.*MSIE/" -->
<META Http-Equiv="Pragma" Content="no-cache">
</HEAD>
<BODY>
<form action="adrprocess.cfm" name="detail" id="detail" method="post" target="">
<input type="hidden" name="dar_number">
<input type="hidden" name="date_received">
<input type="hidden" name="assigned_user_id">
<input type="hidden" name="origin_country_id">
<input type="hidden" name="animal_owner_id">
<input type="hidden" name="sender_business_party_type_id">
<input type="hidden" name="sender_report_number">
<input type="hidden" name="sender_report_date">
<input type="hidden" name="dar_file">
<input type="hidden" name="number_of_animals_exposed">
<input type="hidden" name="number_of_animals_affected">
<input type="hidden" name="number_of_dead_animals">
<input type="hidden" name="species_id">
<input type="hidden" name="breed_id">
<input type="hidden" name="mixed_flag">
<input type="hidden" name="production_type_id">
<input type="hidden" name="gender">
<input type="hidden" name="physiological_status_id">
<input type="hidden" name="weight">
<input type="hidden" name="weight_end">
<input type="hidden" name="weight_type">
<input type="hidden" name="age">
<input type="hidden" name="age_end">
<input type="hidden" name="age_type">
<input type="hidden" name="health_status_id">
<input type="hidden" name="treatment_usage_type_id">
<input type="hidden" name="concurrent_problem_flag">
<input type="hidden" name="date_of_onset">
<input type="hidden" name="trt_month">
<input type="hidden" name="trt_day">
<input type="hidden" name="trt_hour">
<input type="hidden" name="severity_id">
<input type="hidden" name="treatment_of_adr_flag">
<input type="hidden" name="treatment_outcome_type_id">
<input type="hidden" name="concurrent_therapy_flag">
<input type="hidden" name="treatment_discontinued_flag">
<input type="hidden" name="adr_resolved_flag">
<input type="hidden" name="adr_reappear_flag">
<input type="hidden" name="previous_treatment_flag">
<input type="hidden" name="previous_treatment_date">
<input type="hidden" name="previous_reaction_flag">
<input type="hidden" name="prv_month">
<input type="hidden" name="prv_day">
<input type="hidden" name="prv_hour">
<input type="hidden" name="classification_type_id">
<input type="hidden" name="assessing_vet_user_id">
<input type="hidden" name="vet_cause">
<input type="hidden" name="vdd_cause">
<input type="hidden" name="man_cause">
<input type="hidden" name="corrective_action_flag">
<input type="hidden" name="submission_affected_flag">
<input type="hidden" name="other_contacted_flag">
<input type="hidden" name="Caller">
<cfoutput>
<input type="hidden" name="Operation" value="#Operation#">
<input type="hidden" name="reaction_id" value"#ReactionID#">
</cfoutput>
</form>
</body>
</html>