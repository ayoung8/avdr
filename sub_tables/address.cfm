<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE></TITLE>
<!--#set var="ua" value="$HTTP_USER_AGENT" -->
<!--#if expr="$ua = /.*MSIE/" -->
<link href="../css//clf1_ie.css" rel="STYLESHEET" type="text/css"><!--#else -->
<link href="../css//clf1_ns.css" rel="STYLESHEET" type="text/css"><!--#endif -->
<META Http-Equiv="Pragma" Content="no-cache">
</HEAD>
<BODY marginheight="0" marginwidth="0" leftmargin="5" topmargin="0" bgcolor="#c0c0c0">
<cfstoredproc procedure="pkg_select.ap_select_address"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
<cfprocparam type="in" dbvarname="partyid" value="#party_id#" cfsqltype="cf_sql_varchar">
<cfprocparam type="in" dbvarname="typeid" value="2" cfsqltype="cf_sql_integer">
<cfprocresult name="rs">
</cfstoredproc>
<cfoutput query="rs">
#rs.address1#
<br>
#rs.address2#
<br>
#rs.address3#
<br>
#rs.address4#
<br>
#rs.address5#
</cfoutput>
</body>
</html>