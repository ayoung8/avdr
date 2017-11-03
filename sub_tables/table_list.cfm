<script language="JavaScript">
  <cfif session.admin_role is 0>
    parent.parent.window.location = '../welcome.cfm';
  </cfif>
</script>
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
<cfstoredproc procedure="pkg_select.ap_select_table"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
<cfprocresult name="rs_get_tables">
</cfstoredproc>
<table width="100%" cellpadding="0" cellspacing="0" border="0" height="100%">
	<tr>	
		<td width="15%" height="100%" align="left" valign="top" bgcolor="#408080">
			<table bgcolor=#408080" width="123px" border="0" cellspacing="0" cellpadding="0" align="left" valign="top">
				<tr>
					<td>
						<table width="100%" border="0" cellspacing="0" cellpadding="4" align="left" bgcolor=#408080 valign="top">
						    <cfoutput>
							<tr>
								<td style="font:16; color:F9E660"><b>#strLBLTablesList#</b></td>
							</tr>
							</cfoutput>
							<cfoutput query="rs_get_tables">
							<cfif session.language is 1>
							<tr>
								<td class="txtMenu" valign="top"><a href="table.cfm?TID=#table_id#&TName=#EngTableName#&Dates=#UseDates#" target="table_selected" class="menu">#EngTableName#</a></td>
							</tr>
							<cfelse>
							<tr>
								<td class="txtMenu" valign="top"><a href="table.cfm?TID=#table_id#&TName=#FrTableName#&Dates=#UseDates#" target="table_selected" class="menu">#FrTableName#</a></td>
							</tr>
							</cfif>
							</cfoutput>
							<tr valign="top">
							    <td valign="top" height="100%"> </td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</body>
</html>
