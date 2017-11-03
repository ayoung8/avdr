<cfset srcLine = "Operation=" & Operation>
<cfif Operation is "add_drug">
  <cfIf session.drug_role gt 2>
    <cfset srcFile = "sub_tables/drug.cfm?operation=new_drug">
  <cfelse>
  	<cfset srcFile = "sub_tables/empty.cfm">
  </cfif>
<cfElseif Operation is "search">
  <cfset srcLine = "Operation=search&name=" & name & '&din=' & din & '&ingredient=' & ingredient & '&manufacturer=' & manufacturer & '&class=' & class & '&adv=' & adv>
  <cfset srcFile = "sub_tables/empty.cfm">
</cfif>
<html lang="EN">
<head>
<meta name="keywords" content="">
<title></title>
<!--#set var="ua" value="$HTTP_USER_AGENT" -->
<!--#if expr="$ua = /.*MSIE/" -->
<link href="css/clf1_ie.css" rel="STYLESHEET" type="text/css"><!--#else -->
<link href="css/clf1_ns.css" rel="STYLESHEET" type="text/css"><!--#endif -->
</head>
<body>
<cfinclude template="includes/page_header.cfm">
<cfoutput>
<script language="JavaScript">
 if (screen.width < 1024)
  document.writeln('<table width="100%" cellpadding="0" cellspacing="0" border="0" height="84%">');
 else
  document.writeln('<table width="100%" cellpadding="0" cellspacing="0" border="0" height="88%">'); 
</script>
	<tr valign="top">	
		<td width="17%" height="100%" valign="top"><iframe width="100%" height="100%" name="table_list" id="table_list" ALLOWTRANSPARENCY="true" src="sub_tables/drug_list.cfm?#srcLine#" align="left" frameborder="0" scrolling="yes"></iframe></td>
		<td width="83%" height="100%" valign="top"><iframe width="100%" height="100%" name="table_selected" id="table_selected" ALLOWTRANSPARENCY="true" src="#srcFile#" align="left" frameborder="0" scrolling="no"></iframe></td>
	</tr>
</table>
</cfoutput>
</body>
</html>