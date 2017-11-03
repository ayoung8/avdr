<cfif NOT IsDefined("Operation")>
  <cfset Operation="view">
</cfif>
<cfif Operation is "add">
  <cfstoredproc procedure="pkg_util.ap_insert_lookup"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
  <cfprocparam type="in" dbvarname="tableid" value="12" cfsqltype="cf_sql_integer">
  <cfprocparam type="in" dbvarname="usedate" value="0" cfsqltype="cf_sql_integer">
  <cfprocparam type="in" dbvarname="value2" value="#txt_english_desc#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="value3" value="#txt_french_desc#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="value4" value="" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="value5" value="" cfsqltype="cf_sql_varchar">
  </cfstoredproc>
  <cfoutput>
  <script language="JavaScript">
    parent.window.SearchFrame.location = 'ingredientresult.cfm?name=#name#';
  </script>
  </cfoutput>
</cfif>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<!--#set var="ua" value="$HTTP_USER_AGENT" -->
<!--#if expr="$ua = /.*MSIE/" -->
<link href="../css//clf1_ie.css" rel="STYLESHEET" type="text/css"><!--#else -->
<link href="../css//clf1_ns.css" rel="STYLESHEET" type="text/css"><!--#endif -->
<META Http-Equiv="Pragma" Content="no-cache">
</HEAD>
<BODY marginheight="0" marginwidth="0" leftmargin="5" topmargin="0" bgcolor="#c0c0c0">
<cfoutput>
<script language="JavaScript">

function Validate()
{
  var userinfo;
  var errmsg = "";

  if (document.detail.txt_english_desc.value.length<1 ||
	  document.detail.txt_french_desc.value.length<1) 
  {
	userinfo='1';
	errmsg += "\n\n #strLBLErrMissing#:";
	if (document.detail.txt_english_desc.value.length<1) {
		errmsg += "\n          * #strLBLEnglishDescription#";
	}
	if (document.detail.txt_french_desc.value.length<1) {
		errmsg += "\n          * #strLBLFrenchDescription# ";
	}
  }
  if (errmsg != "") {
	errmsg ="#strLBLErrProcess#  \n" +
	"______________________________" +
	errmsg + 
	"\n______________________________\n" +
	"\n #strLBLErrPleaseSubmit#";
	alert(errmsg);
	if (userinfo=='1') {
		return false;
	}
  }
}
</script>
<form action="ingredientadd.cfm" name="detail" id="detail" method="post" target="" onsubmit="return Validate();">
<table width="100%">
	<tr>
		<td><b>#strLBLEnglishDescription#</b></td>
		<td><input type="text" maxlength="240" name="txt_english_desc"></td>
	</tr>
	<tr>
		<td><b>#strLBLFrenchDescription#</b></td>
		<td><input type="text" maxlength="240" name="txt_french_desc"></td>
	</tr>
	<tr>
		<td></td>
		<td><input type="submit" value="#strLBLAdd#"></td>
	</tr>
	<tr>
		<td><input type="hidden" name="Operation" value="Add"></td>
		<td><input type="hidden" name="name" value="#name#"></td>
	</tr>
</table>
</form>
</cfoutput>
</body>
</html>