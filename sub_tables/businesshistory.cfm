<cfIf NOT IsDefined("business_id")>
  <cfset BusinessID = 0>
<cfelse>
  <cfset BusinessID = business_id>  
</cfif>
<html lang="EN">
<head>
<meta name="keywords" content="">
<title></title>
<!--#set var="ua" value="$HTTP_USER_AGENT" -->
<!--#if expr="$ua = /.*MSIE/" -->
<link href="../css/clf1_ie.css" rel="STYLESHEET" type="text/css"><!--#else -->
<link href="../css/clf1_ns.css" rel="STYLESHEET" type="text/css"><!--#endif -->
<!-- Note to coders: If server does not support Extended SSI, remove the above 4 lines and use only the link to the clf1_ns.css stylesheet. -->
</head>
<script language="JavaScript" src="../includes/javascript/common.js"></script>
<body>
<form action="" name="detail" id="detail" method="post">
<table cellpadding="0" cellspacing="0" border="0" width="100%" BGCOLOR="#C0C0C0" height="100%">
    <tr valign="middle" align="center" bgcolor="#336699" style="color:white">
	<cfoutput>
		<td width="18%">Date</td>
		<td width="18%">#strLBLHisUser#</td>
		<td width="100%">Action</td>
	</cfoutput>
    </tr>
    <cfstoredproc procedure="pkg_select.ap_select_business_history"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
    <cfprocparam type="in" dbvarname="BusinessID" value="#BusinessID#" cfsqltype="cf_sql_integer">
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
	    <tr valign="top" bgcolor=#txtColor#>
			 <td>#rs.audit_date#</td>
			 <td>#rs.audit_user#</td>
			 <td>#rs.audit_detail#<cfif audit_action is 'U'><BR>#rs.audit_old#<BR>#rs.audit_new#</cfif></td>
		</tr>
	</cfoutput>
	<tr valign="top" bgcolor="White" height="100%">
		<td>&nbsp;</td>
		<td></td>
		<td></td>
	</tr>
</table>
</form>
</body>
</html>
