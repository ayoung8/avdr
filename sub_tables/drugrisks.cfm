<cfif NOT IsDefined("Operation")>
  <cfset Operation="view">
</cfif>
<cfIf NOT IsDefined("drug_id")>
  <cfset DrugID = 0>
<cfelse>
  <cfset DrugID = drug_id>
</cfif>
<cfif Operation is "add">
  <cfstoredproc procedure="pkg_drug.ap_add_drug_risks"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
  <cfprocparam type="in" dbvarname="drugid" value="#DrugID#" cfsqltype="cf_sql_integer">
  <cfprocparam type="out" dbvarname="riskid" variable="risk_id" cfsqltype="cf_sql_integer">
  <cfprocparam type="in" dbvarname="risktypeid" value="#risk_type_id#" cfsqltype="cf_sql_integer">
  <cfprocparam type="in" dbvarname="riskdesc" value="#risk_description#" cfsqltype="cf_sql_varchar">
  </cfstoredproc>
<cfElseIf Operation is "update">
  <cfstoredproc procedure="pkg_drug.ap_update_drug_risks"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
  <cfprocparam type="in" dbvarname="drugid" value="#DrugID#" cfsqltype="cf_sql_integer">
  <cfprocparam type="in" dbvarname="riskid" value="#risk_id#" cfsqltype="cf_sql_integer">
  <cfprocparam type="in" dbvarname="risktypeid" value="#risk_type_id#" cfsqltype="cf_sql_integer">
  <cfprocparam type="in" dbvarname="riskdesc" value="#risk_description#" cfsqltype="cf_sql_varchar">
  </cfstoredproc>
<cfelseif Operation is "Delete">
  <cfstoredproc procedure="pkg_drug.ap_delete_drug_risks"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
  <cfprocparam type="in" dbvarname="drugid" value="#DrugID#" cfsqltype="cf_sql_integer">
  <cfprocparam type="in" dbvarname="riskid" value="#risk_id#" cfsqltype="cf_sql_integer">
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
<form action="drugrisks.cfm" name="detail" id="detail" method="post" target="">
<cfif session.drug_role gt 0>
<table align="left" width="100%"  height = "20" border="0" cellspacing="0" cellspadding="0">
	<tr bgcolor="#408080">
	    <cfoutput>
  	    <td width="10%" style="font:10; color:F8CC30;"><b>#strLBLRiskType#</b></td>
  	    <td width="82%" style="font:10; color:F8CC30;"><b>#strLBLRiskDesc#</b></td>
		<td width="8%"  style="font:10; color:F8CC30;">Action</td>
		<td></td>
  		</cfoutput>
    </tr>
    	<cfstoredproc procedure="pkg_select.ap_select_drug_risks"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
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
				<td width="10%" align="left" style="font:10px">#rs.name#</td>
				<td width="82%" align="left" style="font:10px">#rs.risk_description#</td>
				<td width="8%" align="center" style="font:13px">
				    <cfif session.drug_role gt 1>
	 	  		    <A HREF="##" STYLE="color:navy;" onclick="SendToParent('#rs.risk_id#','#rs.risk_type_id#',document.detail.desc#row#.value);"><img src="../Images/edit.bmp" name="editimg#row#" border="0"></a>&nbsp; 
	      			<A HREF="##" STYLE="color:navy;" onclick="var dodelete=window.confirm('#strAlertDeleteMe#'); if(dodelete) window.location='#SCRIPT_NAME#?Operation=Delete&drug_id=#DrugID#&risk_id=#risk_id#';"><img src="../Images/del.bmp" name="delimg#row#" border="0"></A>
					</cfif>
				</td>
				<td><input type="hidden" name="desc#row#" value="#rs.risk_description#"></td>
			</tr>
		</cfoutput>
	<tr>
	    <cfoutput>
		<td><input type="hidden" name="Operation" value="add"></td>
		<td><input type="hidden" name="drug_id" value="#DrugID#"></td>
		<td><input type="hidden" name="risk_id"></td>
		<td><input type="hidden" name="risk_type_id"></td>
		<td><input type="hidden" name="risk_description"></td>
		</cfoutput>
	</tr>
</table>
</cfif>
</form>
<script language=javascript>
  parent.window.frmdrug.risk_description.value = '';
  
  function SendToParent(risk_id,risk_type_id,risk_description) 
  {
    document.detail.Operation.value = "update";
	document.detail.risk_id.value = risk_id;
	parent.window.frmdrug.risk_type_id.value = risk_type_id;
	parent.window.frmdrug.risk_description.value = risk_description;
  }
</script>
</body>
</html>