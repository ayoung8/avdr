<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<title></title>
<!--#set var="ua" value="$HTTP_USER_AGENT" -->
<!--#if expr="$ua = /.*MSIE/" -->
<link href="../css//clf1_ie.css" rel="STYLESHEET" type="text/css"><!--#else -->
<link href="../css//clf1_ns.css" rel="STYLESHEET" type="text/css"><!--#endif -->
<META Http-Equiv="Pragma" Content="no-cache">
</HEAD>
<BODY marginheight="0" marginwidth="0" leftmargin="5" topmargin="0" bgcolor="#c0c0c0">
<table align="left" width="100%" border="1" cellspacing="0" cellspadding="0">
	<tr bgcolor="#408080">
		<cfoutput>
		<td width="90%" style="font:10; color:F8CC30;">#strLBLIngredient#</td>
		<td width="10%"  style="font:10; color:F8CC30;">Action</td>
		</cfoutput>
	</tr>
	<cfstoredproc procedure="pkg_select.ap_select_ingredient"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
	<cfprocparam type="in" dbvarname="name" value="#name#" cfsqltype="cf_sql_varchar">
	<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
	<cfprocresult name="rs">
	</cfstoredproc>
	<cfset txtColor="c0c0c0">
	<cfset row=0>
	<cfoutput query="rs">
		<cfset row = row + 1>
		<cfif txtColor is "c0c0c0">
		  <cfset txtColor="c9c9c9">
		<cfelse>
		  <cfset txtColor="c0c0c0">
		</cfif>
		<tr align="right"  valign="top" bgcolor=#txtColor#>
			<td width="90%" align="left" style="font:10px">#rs.ingredient_name#</td>
			<td width="10%" align="center" style="font:25px">
			<A HREF="##" onclick="window.returnValue=window.desc#row#.value; window.close();">
			<img src="../Images/select.bmp" border="0"></A>
			<input type="hidden" name="desc#row#" value="#rs.ingredient_id#.#rs.ingredient_name#"></td>
		</tr>
	</cfoutput>
</table>
<cfif row is 1>
<script language="JavaScript">
  window.returnValue =  window.desc1.value;
  window.close();
</script>
</cfif>
</body>
</html>