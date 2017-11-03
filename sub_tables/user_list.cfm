<html lang="EN">
<head>
<meta name="keywords" content="">
<title>
</title>
<!--#set var="ua" value="$HTTP_USER_AGENT" -->
<!--#if expr="$ua = /.*MSIE/" -->
<link href="../css/clf1_ie.css" rel="STYLESHEET" type="text/css"><!--#else -->
<link href="../css/clf1_ns.css" rel="STYLESHEET" type="text/css"><!--#endif -->
<!-- Note to coders: If server does not support Extended SSI, remove the above 4 lines and use only the link to the clf1_ns.css stylesheet. -->
</head>
<body>
<cfif Not IsDefined("mode")>
  <cfset strMode=0>
<cfelse>
  <cfset strMode=mode>  
</cfif>
<cfif session.admin_role is 0>
  <cfset strMode = 1>
</cfif>
<cfIf strMode is 1>
  <cfset strAccess = "edit_profile">
  <cfstoredproc procedure="pkg_select.ap_select_user"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
  <cfprocparam type="in" dbvarname="userid" value="#session.userid#" cfsqltype="cf_sql_varchar">
  <cfprocresult name="rs_get_users">
  </cfstoredproc>
<cfElse>
  <cfset strAccess = "edit_user">
  <cfstoredproc procedure="pkg_select.ap_select_user"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
  <cfprocparam type="in" dbvarname="userid" value="" cfsqltype="cf_sql_varchar">
  <cfprocresult name="rs_get_users">
  </cfstoredproc>
</cfif>
<table width="100%" border="0" cellspacing="0" cellpadding="4" align="left" bgcolor="#408080" valign="top" height="100%">
    <cfoutput>
    <cfif strMode is 1>
	<tr valign="top">
		<td style="font:16; color:F9E660" valign="top"><b>#strProfile#</b></td>
	</tr>
	<cfelse>
	<tr valign="top">
		<td style="font:16; color:F9E660" valign="top"><b>#strUserList#</b><br><br></td>
	</tr>
	<tr valign="top">
		<td valign="top" class="txtMenu">
			<a href="userprofile.cfm?operation=new_user" target="table_selected" class="menu"><b>#strLBLNewUser#</b><br><br></a>
		</td>
	</tr>
	</cfif>
    </cfoutput>
	<cfoutput query="rs_get_users">
	     <tr valign="top">
		   <td valign="top" class="txtMenu"><a href="userprofile.cfm?operation=#strAccess#&user_id=#rs_get_users.user_id#" target="table_selected" class="menu">#rs_get_users.user_name#</a></td>
	     </tr>
    </cfoutput>
	<tr valign="top">
	  <td valign="top" height="100%"> </td>
	</tr>
</table>
</body>
</html>
