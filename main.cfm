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
<script language="JavaScript">
 if (screen.width < 1024)
  document.writeln('<table width="100%" cellpadding="0" cellspacing="0" border="0" height="84%">');
 else
  document.writeln('<table width="100%" cellpadding="0" cellspacing="0" border="0" height="88%">'); 
</script>
	<tr valign="top">	
		<td width="17%" height="100%" valign="TOP"><iframe width="100%" height="100%" name="table_list" id="table_list" allowtransparency="true" src="sub_tables/empty_list.cfm" align="left" frameborder="0" scrolling="Yes"></iframe></td>
		<td width="83%" height="100%" valign="top"><iframe width="100%" height="100%" name="table_selected" id="table_selected" ALLOWTRANSPARENCY="true" src="sub_tables/empty.cfm" align="left" frameborder="0" scrolling="no"></iframe></td>
	</tr>
</table>
</body>
</html>