<cfif NOT IsDefined("Operation")>
  <cfset Operation="view">
</cfif>
<cfIf NOT IsDefined("drug_id")>
  <cfset DrugID = 0>
<cfelse>
  <cfset DrugID = drug_id>
</cfif>
<cfif Operation is "add">
  <cfstoredproc procedure="pkg_drug.ap_add_drug_ingredient"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
  <cfprocparam type="in" dbvarname="drugid" value="#DrugID#" cfsqltype="cf_sql_integer">
  <cfprocparam type="in" dbvarname="uniqueid" value="#unique_id#" cfsqltype="cf_sql_integer">
  <cfprocparam type="in" dbvarname="ingredienttype" value="#ingredient_type_id#" cfsqltype="cf_sql_integer">
  <cfprocparam type="in" dbvarname="scheduleid" value="#schedule_type_id#" cfsqltype="cf_sql_integer">
  </cfstoredproc>
<cfElseIf Operation is "update">
  <cfstoredproc procedure="pkg_drug.ap_update_drug_ingredient"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
  <cfprocparam type="in" dbvarname="drugid" value="#DrugID#" cfsqltype="cf_sql_integer">
  <cfprocparam type="in" dbvarname="olduniqueid" value="#old_unique_id#" cfsqltype="cf_sql_integer">
  <cfprocparam type="in" dbvarname="newuniqueid" value="#unique_id#" cfsqltype="cf_sql_integer">
  <cfprocparam type="in" dbvarname="ingredienttype" value="#ingredient_type_id#" cfsqltype="cf_sql_integer">
  <cfprocparam type="in" dbvarname="scheduleid" value="#schedule_type_id#" cfsqltype="cf_sql_integer">
  </cfstoredproc>
<cfelseif Operation is "Delete">
  <cfstoredproc procedure="pkg_drug.ap_delete_drug_ingredient"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
  <cfprocparam type="in" dbvarname="drugid" value="#DrugID#" cfsqltype="cf_sql_integer">
  <cfprocparam type="in" dbvarname="uniqueid" value="#unique_id#" cfsqltype="cf_sql_integer">
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
<form action="drugingredient.cfm" name="detail" id="detail" method="post" target="">
<cfif session.drug_role gt 0>
<table align="left" width="100%"  height = "20" border="0" cellspacing="0" cellspadding="0">
	<tr bgcolor="#408080">
	    <cfoutput>
  	    <td width="30%" style="font:10; color:F8CC30;"><b>#strLBLIngredient#</b></td>
  	    <td width="30%" style="font:10; color:F8CC30;"><b>#strLBLType#</b></td>
  	    <td width="30%" style="font:10; color:F8CC30;"><b>#strLBLSchedule#</b></td>
		<td width="10%"  style="font:10; color:F8CC30;">Action</td>
  		</cfoutput>
    </tr>
    	<cfstoredproc procedure="pkg_select.ap_select_drug_ingredient"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
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
				<td width="30%" align="left" style="font:10px">#rs.name#</td>
				<td width="30%" align="left" style="font:10px">#rs.typename#</td>
				<td width="30%" align="left" style="font:10px">#rs.schedulename#</td>
				<td width="10%" align="center" style="font:13px">
				    <cfif session.drug_role gt 1>
	 	  			<A HREF="##" STYLE="color:navy;" onclick="SendToParent('#rs.unique_id#','#rs.ingredient_type_id#','#rs.schedule_type_id#',document.detail.desc#row#.value);"><img src="../Images/edit.bmp" name="editimg#row#" border="0"></a>&nbsp; 
	      			<A HREF="##" STYLE="color:navy;" onclick="var dodelete=window.confirm('#strAlertDeleteMe#'); if(dodelete) window.location='#SCRIPT_NAME#?Operation=Delete&drug_id=#DrugID#&unique_id=#unique_id#';"><img src="../Images/del.bmp" name="delimg#row#" border="0"></A>
					</cfif>
					<input type="hidden" name="desc#row#" value="#rs.name#">
				</td>
			</tr>
		</cfoutput>
	<tr>
	    <cfoutput>
		<td><input type="hidden" name="Operation" value="add"></td>
		<td><input type="hidden" name="drug_id" value="#DrugID#"></td>
		<td><input type="hidden" name="unique_id"></td>
		<td><input type="hidden" name="old_unique_id"></td>
		<td><input type="hidden" name="ingredient_type_id"></td>
		<td><input type="hidden" name="schedule_type_id"></td>
		</cfoutput>
	</tr>
</table>
</cfif>
</form>
<script language=javascript>
  parent.window.frmdrug.ingredient_id.value = '';
  parent.window.frmdrug.ingredient_name.value = '';
  
  function SendToParent(unique_id,ingredient_type_id,schedule_type_id,ingredient_name) 
  {
    document.detail.Operation.value = "update";
    document.detail.old_unique_id.value = unique_id;
    parent.window.frmdrug.ingredient_id.value = unique_id;
    parent.window.frmdrug.ingredient_type_id.value = ingredient_type_id;
    parent.window.frmdrug.schedule_type_id.value = schedule_type_id;
	parent.window.frmdrug.ingredient_name.value = ingredient_name;
  }
</script>
</body>
</html>