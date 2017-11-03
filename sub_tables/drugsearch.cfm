<html lang="EN">
<head>
<META Http-Equiv="Pragma" Content="no-cache">
<cfoutput>
<title>#strLBLSearchTitle#</title>
</cfoutput>
<!--#set var="ua" value="$HTTP_USER_AGENT" -->
<!--#if expr="$ua = /.*MSIE/" -->
<link href="../css/clf1_ie.css" rel="STYLESHEET" type="text/css"><!--#else -->
<link href="../css/clf1_ns.css" rel="STYLESHEET" type="text/css"><!--#endif -->
<!-- Note to coders: If server does not support Extended SSI, remove the above 4 lines and use only the link to the clf1_ns.css stylesheet. -->
<script language="JavaScript" src="../includes/JavaScript/common.js"></script>
</head>
<body bgcolor="#C0C0C0">
<cfoutput>
<table cellpadding="0" cellspacing="0" border="0" BGCOLOR="##C0C0C0">
  <tr bgcolor="##C0C0C0">&nbsp;</tr>
  <tr valign="top">
  	<td>#strLBLName#</td>
    <TD><input type="text" style="font:8pt; width=250px;" name="drug_name" maxlength="255"></td>
	<TD>&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr valign="top">
    <TD valign="top">DIN</td>
    <TD><input type="text" style="font:8pt; width=250px;" name="drug_din" maxlength="15"></td>
	<TD>&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr valign="top">
    <TD valign="top">#strLBLManufacturer#</td>
    <TD><input type="text" style="font:8pt; width=250px;" name="party_id" maxlength="255"></td>
	<TD>&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr valign="top">
    <TD valign="top">#strLBLIngredient#</td>
    <TD><input type="text" style="font:8pt; width=250px;" name="ingredient_id" maxlength="255"></td>
	<TD>&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr valign="top">
    <TD valign="top">#strLBLTherapeutic#</td>
	<TD><select name="therapeutic_class" style="font:8pt; width=250px;">
        <option></option>
		</cfoutput>
        <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
        <cfprocparam type="in" dbvarname="listid" value="11" cfsqltype="cf_sql_integer">
        <cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
        <cfprocresult name="drop_down_list">
        </cfstoredproc>
        <cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#">#drop_down_list.DDL_Desc#</option></cfoutput>
		<cfoutput>
		</select></TD>
	<TD>&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td valign="top">&nbsp;</td>
	<td valign="top">&nbsp;</td>
	<td valign="top">&nbsp;</td>
  </tr>		
  <tr valign="top">
    <td valign="top">#strLBLAdvancedSearch#&nbsp;&nbsp;</td>
	<td valign="top"><textarea cols="" rows="6" name="advancedsearch" style="font:8pt; width=250px;"></textarea></td>
	<td valign="top">&nbsp;</td>   
  </tr>
  <tr>
    <td valign="top">&nbsp;</td>
	<td valign="top">&nbsp;</td>
	<td valign="top">&nbsp;</td>
  </tr>		
  <tr>
    <td>&nbsp;</td>
	<td>	
	  <input type="submit" name="OK" value="#strLBLOK#" onClick="returnval='Operation=search&name=' + drug_name.value + '&din=' + drug_din.value + '&ingredient=' + ingredient_id.value + '&manufacturer=' + party_id.value + '&class=' + therapeutic_class.value + '&adv=' + advancedsearch.value; window.returnValue = returnval; window.close();">
      <input type="submit" name="CANCEL" value="#strLBLCancel#" onClick="returnval=''; window.returnValue = returnval; window.close()">
      <input type="button" name="HELP" value="#strLBLMenu5#" onClick="window.open('../#strHelpFile###FindDrug','my_new_window','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,copyhistory=yes,width=400,height=400');">
    </td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td valign="top">&nbsp;</td>
	<td valign="top">&nbsp;</td>
	<td valign="top">&nbsp;</td>
  </tr>		
</table>
</cfoutput>
</body>
</html>
