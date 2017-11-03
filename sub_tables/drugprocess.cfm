<cfIf NOT IsDefined("drug_id")>
  <cfset DrugID = 0>
<cfelse>
  <cfset DrugID = drug_id>
</cfif>
<cfif operation is "Add">
  <cfstoredproc procedure="pkg_drug.ap_add_drug"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
  <cfprocparam type="in" dbvarname="drugdin" value="#drug_din#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="drugbrand" value="#drug_brand_name#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="druggeneric" value="#drug_generic_name#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="partyid" value="#party_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="vddassessment" value="#latest_vdd_assessment#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="drugtype" value="#drug_type_id#" cfsqltype="cf_sql_integer">
  <cfprocparam type="in" dbvarname="filenumber" value="#file_number#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="formtypeid" value="#form_type_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="therapeuticuse" value="#therapeutic_use_type_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="strengthid" value="#strength_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="out" dbvarname="drugid" variable="DrugID" cfsqltype="cf_sql_integer">
  </cfstoredproc>
  <cfoutput>
  	<script language="JavaScript">
		parent.window.frmdrug.drug_id.value = #DrugID#;
		<cfif caller is not ''>
			parent.window.#caller#;
		</cfif>
		parent.window.SetModeUpdate();
	</script>
  </cfoutput>
<cfelseif operation is "Save">
  <cfstoredproc procedure="pkg_drug.ap_update_drug"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
  <cfprocparam type="in" dbvarname="drugid" value="#DrugID#" cfsqltype="cf_sql_integer">
  <cfprocparam type="in" dbvarname="drugdin" value="#drug_din#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="drugbrand" value="#drug_brand_name#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="druggeneric" value="#drug_generic_name#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="partyid" value="#party_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="vddassessment" value="#latest_vdd_assessment#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="drugtype" value="#drug_type_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="filenumber" value="#file_number#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="formtypeid" value="#form_type_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="therapeuticuse" value="#therapeutic_use_type_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="strengthid" value="#strength_id#" cfsqltype="cf_sql_varchar">
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
<form action="drugprocess.cfm" name="detail" id="detail" method="post" target="">
<input type="hidden" name="drug_din">
<input type="hidden" name="drug_brand_name">
<input type="hidden" name="drug_generic_name">
<input type="hidden" name="party_id">
<input type="hidden" name="latest_vdd_assessment">
<input type="hidden" name="drug_type_id">
<input type="hidden" name="file_number">
<input type="hidden" name="form_type_id">
<input type="hidden" name="therapeutic_use_type_id">
<input type="hidden" name="strength_id">
<input type="hidden" name="Caller">
<cfoutput>
<input type="hidden" name="Operation" value="#Operation#">
<input type="hidden" name="drug_id" value"#DrugID#">
</cfoutput>
</form>
</body>
</html>