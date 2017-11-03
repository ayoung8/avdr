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
    <cfstoredproc procedure="pkg_select.ap_select_business_phone"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
    <cfprocparam type="in" dbvarname="BusinessID" value="#BusinessID#" cfsqltype="cf_sql_integer">
    <cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
   	<cfprocresult name="rs">
    </cfstoredproc>
	<cfset row=0>
	<cfoutput query="rs">
		<cfset row = row + 1>
	    <tr valign="top">
			<td>#rs.name#<input type="hidden" name="telephone_type_id_#row#" value="#rs.telephone_type_id#">
						 <input type="hidden" name="telephone_id_#row#" value="#rs.telephone_id#"></td>
			<td><input type="text" name="telephone_number_#row#" maxlength="20" value="#rs.telephone_number#"></td>
		</tr>
	</cfoutput>
	<cfoutput>
	<tr valign="top" bgcolor="##C0C0C0" height="100%">
		<td>&nbsp;</td>
		<td></td>
	</tr>
	</cfoutput>
</table>
</form>
<script language="JavaScript">
  parent.window.frmbusiness.loading_phone.value = 0;
</script>
</body>
</html>
