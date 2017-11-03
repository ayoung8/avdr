<script language="JavaScript">
  <cfif session.adverse_role is 0>
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
<cfIf (Operation is not "add_reaction") and (Operation is not "search")>
  <cfset Operation="view">
</cfif>
<cfIf Operation is "add_reaction">
  <cfquery  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#" name="rs_get_adr">
    select 0 as reaction_id, '' as name from dual where 1 = 2
  </cfquery>
</cfif>
<cfIf Operation is "search">
  <cfstoredproc procedure="pkg_select.ap_select_reaction"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
  <cfprocparam type="in" dbvarname="animalsystem" value="#system#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="reactionid" value="#id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="speciesid" value="#species#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="manufacturer" value="#manufacturer#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="vetname" value="#vet#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="darfile" value="#dar#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="advancedsearch" value="#adv#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
  <cfprocparam type="out" dbvarname="success" variable="success" cfsqltype="cf_sql_integer">
  <cfprocparam type="out" dbvarname="totalrow" variable="totalrow" cfsqltype="cf_sql_integer">
  <cfprocresult name="rs_get_adr">
  </cfstoredproc>
  <cfoutput>
  <cfif success is 0>
	  <script language="JavaScript">
	    alert('#strLBLInvalidQuery#');
	  </script>
  <cfelseif totalrow is 0>
	  <script language="JavaScript">
	    alert('#strLBLNoResults#');
	  </script>
  <cfelseif totalrow gt 250>	  
	  <script language="JavaScript">
	    alert('#strLBLMore250# #totalrow#');
	  </script>
  </cfif>
  </cfoutput>
</cfif>
<table width="100%" border="0" cellspacing="0" cellpadding="4" align="left" bgcolor="#408080" valign="top" height="100%">
	<cfoutput>
	<tr valign="top">
		<td style="font:16; color:F9E660" valign="top"><b>#strLBLADRList#</b><br><br></td>
	</tr>
	<cfif session.adverse_role gt 2>
	<tr valign="top">
		<td valign="top" class="txtMenu">
			<a href="adr.cfm?operation=new_reaction" target="table_selected" class="menu"><b>#strLBLNewReaction#</b><br><br></a>
		</td>
	</tr>
	</cfif>
	</cfoutput>
	<cfoutput query="rs_get_adr">
	     <tr valign="top">
		   <td valign="top" class="txtMenu"><a href="adr.cfm?Operation=edit_reaction&reaction_id=#rs_get_adr.reaction_id#" target="table_selected" class="menu">#rs_get_adr.name# - #rs_get_adr.reaction_id#</a></td>
	     </tr>
    </cfoutput>
	<tr valign="top">
	  <td valign="top" height="100%"> </td>
	</tr>
</table>
</body>
</html>
