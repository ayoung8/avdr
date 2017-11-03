<script language="JavaScript">
  <cfif session.drug_role is 0>
    parent.parent.window.location = '../welcome.cfm';
  </cfif>
</script>
<html>
<head>
<meta name="keywords" content="">
<title></title>
<!--#set var="ua" value="$HTTP_USER_AGENT" -->
<!--#if expr="$ua = /.*MSIE/" -->
<link href="../css/clf1_ie.css" rel="STYLESHEET" type="text/css"><!--#else -->
<link href="../css/clf1_ns.css" rel="STYLESHEET" type="text/css"><!--#endif -->
<!-- Note to coders: If server does not support Extended SSI, remove the above 4 lines and use only the link to the clf1_ns.css stylesheet. -->
</head>
<body>
<cfIf (Operation is not "add_drug") and (Operation is not "search")>
  <cfset Operation="view">
</cfif>
<cfIf Operation is "add_drug" or Operation is "view">
  <cfquery  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#" name="rs_get_drugs">
    select 0 as drug_id, '' as name from dual where 1 = 2
  </cfquery>
</cfif>
<cfIf Operation is "search">
  <cfstoredproc procedure="pkg_select.ap_select_drug"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
  <cfprocparam type="in" dbvarname="drugname" value="#name#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="drugdin" value="#din#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="ingredient" value="#ingredient#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="manufacturer" value="#manufacturer#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="advancedsearch" value="#adv#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
  <cfprocparam type="in" dbvarname="therapeuticclass" value="#class#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="out" dbvarname="success" variable="success" cfsqltype="cf_sql_integer">
  <cfprocparam type="out" dbvarname="totalrow" variable="totalrow" cfsqltype="cf_sql_integer">
  <cfprocresult name="rs_get_drugs">
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
<table width="100%" border="0" cellspacing="4" cellpadding="0" bgcolor="#408080" height="100%">
	<cfoutput>
	<tr valign="top">
		<td colspan="2" style="font:16; color:F9E660" valign="top"><b>#strLBLDrugList#</b><br><br></td>
	</tr>
	<cfif session.drug_role gt 2>
	<tr valign="top">
		<td colspan="2" valign="top" class="txtMenu">
			<a href="drug.cfm?operation=new_drug" target="table_selected" class="menu"><b>#strLBLNewDrug#</b><br><br></a>
		</td>
	</tr>
	</cfif>
	</cfoutput>
	<cfset prevDrug = 0>
	<cfset row = 0>
	<cfset subrow = 0>
	<cfoutput query="rs_get_drugs">
		<cfif prevDrug is rs_get_drugs.drug_id>
			<cfset subrow = subrow + 1>
			<tr>
		  		<td valign="top" class="txtMenu">&nbsp;&nbsp;<a href="adr.cfm?Operation=edit_reaction&reaction_id=#rs_get_drugs.adverse_reaction_id#" target="table_selected" class="menu">#rs_get_drugs.adr#</a></td>
  			</tr>
		<cfelse>
			<cfset row = row + 1>
			<cfif subrow is not 0>
					</table>
				</div></td>
			</tr>
			<cfset subrow = 0>
			</cfif>
			<tr>
			    <cfif rs_get_drugs.adverse_reaction_id gt 0>
				<td><A HREF="##" onClick="if (document.all.sub#row#.style.display=='none') {document.all.sub#row#.style.display='inline'; document.all.plus#row#.src='../images/icon_minus.gif';} 
				     else {document.all.sub#row#.style.display='none'; document.all.plus#row#.src='../images/icon_plus.gif';};">
				     <img src="../images/icon_plus.gif" width="15" height="15" border="0" hspace="0" vspace="0" align="absmiddle" name="plus#row#"></A>
				</td>
				<cfelse>
				<td width="15" height="15"></td>
				</cfif>
				<td><a href="drug.cfm?Operation=edit_drug&drug_id=#rs_get_drugs.drug_id#" target="table_selected" class="menu"><B>#rs_get_drugs.name#</B></a></td>
			</tr>
			<cfif rs_get_drugs.adverse_reaction_id gt 0>
			<cfset subrow = subrow + 1>
			<tr>
				<td width="15"></td>
				<td><div id="sub#row#" style="display:none;">
					<table>
						<tr>
		  					<td valign="top" class="txtMenu">&nbsp;&nbsp;<a href="adr.cfm?Operation=edit_reaction&reaction_id=#rs_get_drugs.adverse_reaction_id#" target="table_selected" class="menu"><B>#rs_get_drugs.adr#</B></a></td>
			  			</tr>
			</cfif>
		</cfif>
		<cfset prevDrug = rs_get_Drugs.drug_id>
    </cfoutput>
	<cfif subrow gt 0>
					</table>
				</div></td>
			</tr>
	</cfif>
	<tr valign="top">
	  <td colspan="2" valign="top" height="100%"> </td>
	</tr>
</table>
</body>
</html>
