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
    <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
	<cfprocparam type="in" dbvarname="listid" value="15" cfsqltype="cf_sql_integer">
	<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
	<cfprocresult name="drop_down_list">
	</cfstoredproc>
	<cfset strDDValue = ''>
	<cfoutput query="drop_down_list">
	  <cfset strDDValue = strDDValue & '<option value="' & #drop_down_list.DDL_Value# & '">' & #drop_down_list.DDL_Desc# & '</option> '>
    </cfoutput>						  
    <cfstoredproc procedure="pkg_select.ap_select_business_address"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
    <cfprocparam type="in" dbvarname="BusinessID" value="#BusinessID#" cfsqltype="cf_sql_integer">
    <cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
   	<cfprocresult name="rs">
    </cfstoredproc>
	<cfset row=0>
	<cfoutput query="rs">
		<cfset row = row + 1>
	    <tr valign="top">
			<td><b>#rs.name#</b><input type="hidden" name="address_type_id_#row#" value="#rs.address_type_id#">
				         <input type="hidden" name="address_id_#row#" value="#rs.address_id#"></td>
			<td></td>
		</tr>
		<tr>
			<td>#strLBLAddress#</td>
			<td colspan="3"><input type="text" name="address_line_1_#row#"  size="87%" maxlength="40" value="#rs.address_line_1#"></td>
		</tr>
		<tr>
			<td></td>
			<td colspan="3"><input type="text" name="address_line_2_#row#" size="87%" maxlength="40" value="#rs.address_line_2#"></td>
		</tr>
		<tr>
			<td></td>
			<td colspan="3"><input type="text" name="address_line_3_#row#" size="87%" maxlength="40" value="#rs.address_line_3#"></td>
		</tr>
		<tr>
			<td></td>
			<td colspan="3"><input type="text" name="address_line_4_#row#" size="87%" maxlength="40" value="#rs.address_line_4#"></td>
		</tr>
		<tr>
			<td>#strLBLCity#</td>
			<td><input type="text" name="address_city_#row#" maxlength="40" value="#rs.address_city#"></td>
			<td>#strLBLProvince#</td>
			<td><input type="text" name="address_province_state_#row#" maxlength="40" value="#rs.address_province_state#"></td>
		</tr>
		<tr>
			<td>#strLBLCountryID#</td>
			<td><select name="country_id_#row#" style="font:8pt; width=200px;">
			    #strDDValue#									    
				</select></TD>
			<td>#strLBLPostalCode#</td>
			<td><input type="text" name="address_postal_code_#row#" maxlength="10" value="#rs.address_postal_code#"></td>
		</tr>
		<tr>
			<td colspan="5">&nbsp;</td>
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
  parent.window.frmbusiness.loading_address.value = 0;
</script>
</body>
</html>
