<cfif NOT IsDefined("Operation")>
  <cfset Operation="view">
</cfif>
<cfIf NOT IsDefined("drug_id")>
  <cfset DrugID = 0>
<cfelse>
  <cfset DrugID = drug_id>
</cfif>
<cfif Operation is "add">
  <cfstoredproc procedure="pkg_drug.ap_add_drug_dosages"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
  <cfprocparam type="in" dbvarname="drugid" value="#DrugID#" cfsqltype="cf_sql_integer">
  <cfprocparam type="out" dbvarname="drugdosageid" variable="drug_dosage_id" cfsqltype="cf_sql_integer">
  <cfprocparam type="in" dbvarname="formid" value="#form_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="frequencyid" value="#frequency_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="speciesid" value="#species_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="breedid" value="#breed_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="quantityin" value="#quantity#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="routeid" value="#route_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="frequencyqty" value="#frequency_quantity#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="indicationin" value="#indication#" cfsqltype="cf_sql_varchar">
  </cfstoredproc>
<cfElseIf Operation is "update">
  <cfstoredproc procedure="pkg_drug.ap_update_drug_dosages"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
  <cfprocparam type="in" dbvarname="drugid" value="#DrugID#" cfsqltype="cf_sql_integer">
  <cfprocparam type="in" dbvarname="drugdosageid" value="#drug_dosage_id#" cfsqltype="cf_sql_integer">
  <cfprocparam type="in" dbvarname="formid" value="#form_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="frequencyid" value="#frequency_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="speciesid" value="#species_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="breedid" value="#breed_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="quantityin" value="#quantity#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="routeid" value="#route_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="frequencyqty" value="#frequency_quantity#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="indicationin" value="#indication#" cfsqltype="cf_sql_varchar">
  </cfstoredproc>
<cfelseif Operation is "Delete">
  <cfstoredproc procedure="pkg_drug.ap_delete_drug_dosages"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
  <cfprocparam type="in" dbvarname="drugid" value="#DrugID#" cfsqltype="cf_sql_integer">
  <cfprocparam type="in" dbvarname="drugdosageid" value="#drug_dosage_id#" cfsqltype="cf_sql_integer">
  </cfstoredproc>
</cfif>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE></TITLE>
<!--#set var="ua" value="$HTTP_USER_AGENT" -->
<!--#if expr="$ua = /.*MSIE/" -->
<link href="../css//clf1_ie.css" rel="STYLESHEET" type="text/css"><!--#else -->
<link href="../css//clf1_ns.css" rel="STYLESHEET" type="text/css"><!--#endif -->
<META Http-Equiv="Pragma" Content="no-cache">
</HEAD>
<BODY marginheight="0" marginwidth="0" leftmargin="5" topmargin="0" bgcolor="#c0c0c0">
<form action="drugdosage.cfm" name="detail" id="detail" method="post" target="">
<cfif session.drug_role gt 0>
<table align="left" width="100%"  height = "20" border="0" cellspacing="0" cellspadding="0">
	<tr bgcolor="#408080">
	    <cfoutput>
  	    <td width="10%" style="font:10; color:F8CC30;">#strLBLRoute#</td>
  	    <td width="8%" style="font:10; color:F8CC30;"><b>#strLBLQuantity#</b></td>
  	    <td width="10%" style="font:10; color:F8CC30;">#strLBLForm#</td>
  	    <td width="8%" style="font:10; color:F8CC30;">#strLBLQuantity#</td>
  	    <td width="10%" style="font:10; color:F8CC30;">#strLBLFrequency#</td>
  	    <td width="15%" style="font:10; color:F8CC30;">#strLBLSpecies#</td>
  	    <td width="15%" style="font:10; color:F8CC30;">#strLBLBreed#</td>
  	    <td width="16%" style="font:10; color:F8CC30;">#strLBLIndication#</td>
		<td width="8%"  style="font:10; color:F8CC30;">Action</td>
		<td></td>
  		</cfoutput>
    </tr>
    	<cfstoredproc procedure="pkg_select.ap_select_drug_dosages"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
	    <cfprocparam type="in" dbvarname="drugid" value="#DrugID#" cfsqltype="cf_sql_integer">
	    <cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
    	<cfprocresult name="rs">
	    </cfstoredproc>
 		<cfset txtColor="c0c0c0">
		<cfset row=0>
		<cfoutput query="rs">
		    <cfset row=row+1>
		    <cfif txtColor is "c0c0c0">
	    	  <cfset txtColor="c9c9c9">
		    <cfelse>
		      <cfset txtColor="c0c0c0">
	    	</cfif>
			<tr align="right"  valign="top" bgcolor=#txtColor# onMouseOver="this.bgColor='##408080'; document.all.delimg#row#.src='../images/delhl.bmp'; document.all.editimg#row#.src='../images/edithl.bmp';" onMouseOut="this.bgColor='#txtColor#'; document.all.delimg#row#.src='../images/del.bmp'; document.all.editimg#row#.src='../images/edit.bmp';">
				<td width="10%" align="left" style="font:10px">#rs.routename#</td>
				<td width="8%" align="left" style="font:10px">#rs.quantity#</td>
				<td width="10%" align="left" style="font:10px">#rs.formname#</td>
				<td width="8%" align="left" style="font:10px">#rs.frequency_quantity#</td>
				<td width="10%" align="left" style="font:10px">#rs.frequencyname#</td>
				<td width="15%" align="left" style="font:10px">#rs.speciesname#</td>
				<td width="15%" align="left" style="font:10px">#rs.breedname#</td>
				<td width="16%" align="left" style="font:10px">#rs.indication#</td>
				<td width="8%" align="center" style="font:13px">
				    <cfif session.drug_role gt 1>
	 	  		    <A HREF="##" STYLE="color:navy;" onclick="SendToParent('#rs.drug_dosage_id#','#rs.form_id#','#rs.frequency_id#','#rs.route_id#','#rs.species_id#','#rs.breed_id#','#rs.quantity#','#rs.frequency_quantity#',document.detail.desc#row#.value);"><img src="../Images/edit.bmp" name="editimg#row#" border="0"></a>&nbsp; 
	      			<A HREF="##" STYLE="color:navy;" onclick="var dodelete=window.confirm('#strAlertDeleteMe#'); if(dodelete) window.location='#SCRIPT_NAME#?Operation=Delete&drug_id=#DrugID#&drug_dosage_id=#drug_dosage_id#';"><img src="../Images/del.bmp" name="delimg#row#" border="0"></a>
					</cfif>
				</td>
				<td><input type="hidden" name="desc#row#" value="#rs.indication#"></td>
			</tr>
		</cfoutput>
	<tr>
	    <cfoutput>
		<td><input type="hidden" name="Operation" value="add"></td>
		<td><input type="hidden" name="drug_id" value="#DrugID#"></td>
		<td><input type="hidden" name="drug_dosage_id"></td>
		<td><input type="hidden" name="form_id"></td>
		<td><input type="hidden" name="frequency_id"></td>
		<td><input type="hidden" name="route_id"></td>
		<td><input type="hidden" name="species_id"></td>
		<td><input type="hidden" name="breed_id"></td>
		<td><input type="hidden" name="quantity"></td>
		<td><input type="hidden" name="frequency_quantity"></td>
		<td><input type="hidden" name="indication"></td>
		</cfoutput>
	</tr>
</table>
</cfif>
</form>
<script language=javascript>
  parent.window.frmdrug.form_id.value = '';
  parent.window.frmdrug.frequency_id.value = '';
  parent.window.frmdrug.route_id.value = '';
  parent.window.frmdrug.species_id.value = '';
  parent.window.frmdrug.breed_id.length = 0;
  parent.window.frmdrug.breed_id.value = '';
  parent.window.frmdrug.quantity.value = '';
  parent.window.frmdrug.frequency_quantity.value = '';
  parent.window.frmdrug.indication.value = '';
  
  function SendToParent(drug_dosage_id,form_id,frequency_id,route_id,species_id,breed_id,quantity,frequency_quantity,indication)
  {
    document.detail.Operation.value = "update";
	document.detail.drug_dosage_id.value = drug_dosage_id;
	parent.window.frmdrug.form_id.value = form_id;
	parent.window.frmdrug.frequency_id.value = frequency_id;
	parent.window.frmdrug.route_id.value = route_id;
	parent.window.frmdrug.species_id.value = species_id;
	parent.window.LoadBreed(species_id);
	parent.window.frmdrug.breed_id.value = breed_id;
	parent.window.frmdrug.quantity.value = quantity;
	parent.window.frmdrug.frequency_quantity.value = frequency_quantity;
	parent.window.frmdrug.indication.value = indication;
  }
</script>
</body>
</html>