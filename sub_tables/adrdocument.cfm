<cfif NOT IsDefined("Operation")>
  <cfset Operation="view">
</cfif>
<cfIf NOT IsDefined("reaction_id")>
  <cfset ReactionID = 0>
<cfelse>
  <cfset ReactionID = reaction_id>
</cfif>
<cfif Operation is "Delete">
  <cfstoredproc procedure="pkg_adr.ap_delete_reaction_document"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
  <cfprocparam type="in" dbvarname="reactionid" value="#ReactionID#" cfsqltype="cf_sql_integer">
  <cfprocparam type="in" dbvarname="documentid" value="#document_id#" cfsqltype="cf_sql_integer">
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
<form action="adrdocument.cfm" name="detail" id="detail" method="post" target="">
<cfif session.adverse_role gt 0>
<table align="left" width="100%"  height = "20" border="0" cellspacing="0" cellspadding="0">
	<tr bgcolor="#408080">
	    <cfoutput>
  	    <td width="92%" style="font:10; color:F8CC30;"><b>#strLBLTabDocument#</b></td>
		<td width="8%"  style="font:10; color:F8CC30;">Action</td>
		<td></td>
  		</cfoutput>
    </tr>
    	<cfstoredproc procedure="pkg_select.ap_select_reaction_document"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
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
			<tr align="right"  valign="top" bgcolor=#txtColor# onMouseOver="this.bgColor='##408080'; document.all.delimg#row#.src='../images/delhl.bmp'; document.all.viewimg#row#.src='../images/viewhl.bmp';" onMouseOut="this.bgColor='#txtColor#'; document.all.delimg#row#.src='../images/del.bmp'; document.all.viewimg#row#.src='../images/view.bmp';">
				<td width="92%" align="left" style="font:10px">#rs.document_desc#</td>
				<td width="8%" align="center" style="font:13px">
				    <cfif session.adverse_role gt 1>
	 	  		    <A HREF="##" STYLE="color:navy;" onclick="window.open('adrdisplaydoc.cfm?reaction_id=#ReactionID#&document_id=#rs.document_id#','Document','resizable=yes, scrollbars=yes, width=700,height=400,left='+((screen.width - 700) / 2)+',top='+((screen.height - 400) / 2));"><img src="../images/view.bmp" name="viewimg#row#" border="0"></a>&nbsp;
	      			<A HREF="##" STYLE="color:navy;" onclick="var dodelete=window.confirm('#strAlertDeleteMe#'); if(dodelete) window.location='#SCRIPT_NAME#?Operation=Delete&reaction_id=#ReactionID#&document_id=#rs.document_id#';"><img src="../Images/del.bmp" name="delimg#row#" border="0"></A>
					</cfif>
				</td>
			</tr>
		</cfoutput>
	<tr>
	    <cfoutput>
		<td><input type="hidden" name="Operation" value="add"></td>
		<td><input type="hidden" name="reaction_id" value="#ReactionID#"></td>
		<td><input type="hidden" name="document_id"></td>
		</cfoutput>
	</tr>
</table>
</cfif>
</form>
</body>
</html>