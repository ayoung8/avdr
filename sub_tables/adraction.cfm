<cfif NOT IsDefined("Operation")>
  <cfset Operation="view">
</cfif>
<cfIf NOT IsDefined("reaction_id")>
  <cfset ReactionID = 0>
<cfelse>
  <cfset ReactionID = reaction_id>
</cfif>
<cfif Operation is "add">
  <cfstoredproc procedure="pkg_adr.ap_add_reaction_action"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
  <cfprocparam type="in" dbvarname="reactionid" value="#ReactionID#" cfsqltype="cf_sql_integer">
  <cfprocparam type="out" dbvarname="actionid" variable="action_id" cfsqltype="cf_sql_integer">
  <cfprocparam type="out" dbvarname="notesid" variable="notes_id" cfsqltype="cf_sql_integer">
  <cfprocparam type="in" dbvarname="correctionid" value="#corrective_action_id#" cfsqltype="cf_sql_integer">
  <cfprocparam type="in" dbvarname="correctiondate" value="#correction_date#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="countryid" value="#country_id#" cfsqltype="cf_sql_integer">
  <cfprocparam type="in" dbvarname="notesdesc" value="#action_description#" cfsqltype="cf_sql_varchar">
  </cfstoredproc>
<cfElseIf Operation is "update">
  <cfstoredproc procedure="pkg_adr.ap_update_reaction_action"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
  <cfprocparam type="in" dbvarname="reactionid" value="#ReactionID#" cfsqltype="cf_sql_integer">
  <cfprocparam type="in" dbvarname="actionid" value="#action_id#" cfsqltype="cf_sql_integer">
  <cfprocparam type="in" dbvarname="notesid" value="#notes_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="correctionid" value="#corrective_action_id#" cfsqltype="cf_sql_integer">
  <cfprocparam type="in" dbvarname="correctiondate" value="#correction_date#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="countryid" value="#country_id#" cfsqltype="cf_sql_integer">
  <cfprocparam type="in" dbvarname="notesdesc" value="#action_description#" cfsqltype="cf_sql_varchar">
  </cfstoredproc>
<cfelseif Operation is "Delete">
  <cfstoredproc procedure="pkg_adr.ap_delete_reaction_action"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
  <cfprocparam type="in" dbvarname="reactionid" value="#ReactionID#" cfsqltype="cf_sql_integer">
  <cfprocparam type="in" dbvarname="actionid" value="#action_id#" cfsqltype="cf_sql_integer">
  <cfprocparam type="in" dbvarname="notesid" value="#notes_id#" cfsqltype="cf_sql_integer">
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
<form action="adraction.cfm" name="detail" id="detail" method="post" target="">
<cfif session.adverse_role gt 0>
<table align="left" width="100%"  height = "20" border="0" cellspacing="0" cellspadding="0">
	<tr bgcolor="#408080">
	    <cfoutput>
  	    <td width="10%" style="font:10; color:F8CC30;"><b>#strLBLCountryID#</b></td>
  	    <td width="10%" style="font:10; color:F8CC30;"><b>#strLBLCorrectAction#</b></td>
  	    <td width="8%" style="font:10; color:F8CC30;"><b>#strLBLDate#</b></td>
  	    <td width="64%" style="font:10; color:F8CC30;"><b>#strLBLNotesDesc#</b></td>
		<td width="8%"  style="font:10; color:F8CC30;">Action</td>
		<td></td>
  		</cfoutput>
    </tr>
    	<cfstoredproc procedure="pkg_select.ap_select_reaction_action"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
	    <cfprocparam type="in" dbvarname="reactionid" value="#ReactionID#" cfsqltype="cf_sql_integer">
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
				<td width="10%" align="left" style="font:10px">#rs.country#</td>
				<td width="10%" align="left" style="font:10px">#rs.correction#</td>
				<td width="8%" align="left" style="font:10px">#rs.correction_date#</td>
				<td width="64%" align="left" style="font:10px">#rs.notes#</td>
				<td width="8%" align="center" style="font:13px">
				    <cfif session.adverse_role gt 1 and session.evaluator_role is 1>
	 	  		    <A HREF="##" STYLE="color:navy;" onclick="SendToParent('#rs.action_id#','#rs.notes_id#','#rs.country_id#','#rs.corrective_action_id#','#rs.correction_date#',document.detail.desc#row#.value);"><img src="../Images/edit.bmp" name="editimg#row#" border="0"></a>&nbsp; 
	      			<A HREF="##" STYLE="color:navy;" onclick="var dodelete=window.confirm('#strAlertDeleteMe#'); if(dodelete) window.location='#SCRIPT_NAME#?Operation=Delete&reaction_id=#ReactionID#&notes_id=#rs.notes_id#&action_id=#rs.action_id#';"><img src="../Images/del.bmp" name="delimg#row#" border="0"></A>
					</cfif>
				</td>
				<td><input type="hidden" name="desc#row#" value="#rs.notes#"></td>
			</tr>
		</cfoutput>
	<tr>
	    <cfoutput>
		<td><input type="hidden" name="Operation" value="add"></td>
		<td><input type="hidden" name="reaction_id" value="#ReactionID#"></td>
		<td><input type="hidden" name="notes_id"></td>
		<td><input type="hidden" name="country_id"></td>
		<td><input type="hidden" name="corrective_action_id"></td>
		<td><input type="hidden" name="correction_date"></td>
		<td><input type="hidden" name="action_id"></td>
		<td><input type="hidden" name="action_description"></td>
		</cfoutput>
	</tr>
</table>
</cfif>
</form>
<script language=javascript>
  parent.window.frmreaction.action_description.value = '';
  parent.window.frmreaction.correction_date.value = '';
  
  function SendToParent(action_id,notes_id,country_id,corrective_action_id,correction_date,action_description) 
  {
    document.detail.Operation.value = "update";
	document.detail.notes_id.value = notes_id;
	document.detail.action_id.value = action_id;
	parent.window.frmreaction.country_id.value = country_id;
	parent.window.frmreaction.corrective_action_id.value = corrective_action_id;
	parent.window.frmreaction.correction_date.value = correction_date;
	parent.window.frmreaction.action_description.value = action_description;
  }
</script>
</body>
</html>