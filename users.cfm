<cfif IsDefined("mode")>
  <cfset strMode = mode>
  <cfif strMode is 1>
    <cfset strSource = "sub_tables/userprofile.cfm?operation=edit_profile&user_id=" & session.userid>
    <cfset strScrolling="no">
  <cfelse>
    <cfset strSource = "sub_tables/userprofile.cfm?operation=new_user">
    <cfset strScrolling="yes">
  </cfif>
<cfelse>
  <cfset strMode = 1>  
  <cfset strSource = "sub_tables/userprofile.cfm?operation=edit_profile&user_id=" & session.userid>
  <cfset strScrolling="no">
</cfif>
<html lang="EN">
<head>
<meta name="keywords" content="">
<title>
</title>
<!--#set var="ua" value="$HTTP_USER_AGENT" -->
<!--#if expr="$ua = /.*MSIE/" -->
<link href="css/clf1_ie.css" rel="STYLESHEET" type="text/css"><!--#else -->
<link href="css/clf1_ns.css" rel="STYLESHEET" type="text/css"><!--#endif -->
<!-- Note to coders: If server does not support Extended SSI, remove the above 4 lines and use only the link to the clf1_ns.css stylesheet. -->
</head>
<body>
<cfinclude template="includes/page_header.cfm">
<script language="JavaScript">
 if (screen.width < 1024)
  document.writeln('<table width="100%" cellpadding="0" cellspacing="0" border="0" height="84%">');
 else
  document.writeln('<table width="100%" cellpadding="0" cellspacing="0" border="0" height="88%">'); 
</script>
	<tr valign="top">	
	    <cfoutput>
		<td width="17%" height="100%" valign="top"><iframe width="100%" height="100%" name="table_list" id="table_list" ALLOWTRANSPARENCY="true" src="sub_tables/user_list.cfm?mode=#strMode#" align="left" frameborder="0" scrolling="#strScrolling#"></iframe></td>
		<td width="83%" height="100%" valign="top"><iframe width="100%" height="100%" name="table_selected" id="table_selected" ALLOWTRANSPARENCY="true" src="#strSource#" align="left" frameborder="0" scrolling="Auto"></iframe></td>
        </cfoutput>
	</tr>
</table>
</body>
</html>
