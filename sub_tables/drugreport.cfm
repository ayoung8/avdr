<html lang="EN">
<head>
<meta name="keywords" content="">
<cfoutput>
<title>#strLBLReportDrug#</title>
</cfoutput>
<!--#set var="ua" value="$HTTP_USER_AGENT" -->
<!--#if expr="$ua = /.*MSIE/" -->
<link href="../css/clf1_ie.css" rel="STYLESHEET" type="text/css"><!--#else -->
<link href="../css/clf1_ns.css" rel="STYLESHEET" type="text/css"><!--#endif -->
<!-- Note to coders: If server does not support Extended SSI, remove the above 4 lines and use only the link to the clf1_ns.css stylesheet. -->
</head>
<body background="../Images/background2.gif">
<cfIf NOT IsDefined("drug_id")>
  <cfset DrugID = 0>
<cfelse>
  <cfset DrugID = drug_id>
</cfif>
<cfstoredproc procedure="pkg_select.ap_report_drug"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
<cfprocparam type="in" dbvarname="drugid" value="#DrugID#" cfsqltype="cf_sql_integer">
<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
<cfprocresult name="rs">
</cfstoredproc>
<cfoutput query="rs">
    <cfset fldDrugDIN = rs.drug_din>
    <cfset fldBrandName = rs.drug_brand_name>
    <cfset fldGenericName = rs.drug_generic_name>
    <cfset fldPartyId = rs.party_id>
    <cfset fldVDDAssessment = rs.latest_vdd_assessment>
    <cfset fldDrugType = rs.drug_type_id>
    <cfset fldFileNumber = rs.file_number>
	<cfset fldFormType = rs.form_type_id>
	<cfset fldUsage = rs.therapeutic_use_id>
	<cfset fldStrength = rs.strength_id>
</cfoutput>
<cfoutput>
<table width="100%" border="0" cellspacing="0" cellpadding="0" align="LEFT" valign="TOP" height="100%">
	<tr>
	    <td width="5%"></td>
		<td width="90%">&nbsp;</td>
	    <td width="5%"></td>
	</tr>
	<tr>
		<td width="5%"></td>
		<td width="90%" align="right"><input type="button" name="printbutton" value="#strLBLPrintButton#" onClick="window.print();"></td>
		<td width="5%"></td>
	</tr>
	<tr>
	    <td width="5%"></td>
		<td width="90%">&nbsp;</td>
	    <td width="5%"></td>
	</tr>
	<tr height="4">
		<td width="5%"></td>
		<td width="90%">
		   	<table width="100%" border="1" cellspacing="0" align="LEFT" cellpading="0" bgcolor="##408080">
	    		<td align="center" width="100%"><font color="##F8CC30"><b>#strLBLReportDrug#</b></font></td>
			</table>
		</td>
		<td width="5%"></td>
	</tr>
	<tr valign="top">
		<td width="5%"></td>
		<td width="90%">
			<table align="left" valign="top" width="100%" border="0">
		        <TR>
		          <TD width="15%">#strLBLDrugBrand#</TD>
		          <TD width="25%">#fldBrandName#</TD>
		          <TD width="10%">#strLBLDrugDIN#</TD>
		          <TD width="20%">#fldDrugDIN#</TD>
		          <TD width="10%">#strLBLDrugType#</TD>
		          <TD width="20%">#fldDrugType#</td>
				</TR>
				<TR>
		          <TD>#strLBLDrugCommon#</TD>
		          <TD>#fldGenericName#</TD>
				  <td>#srtLBLFileNo#</td>
				  <td>#fldFileNumber#</td>
		          <TD>#strLBLForm#</TD>
		          <TD>#fldFormType#</TD>
				</TR>
				<TR>
		          <TD>#strLBLManufacturer#</TD>
		          <TD colspan="3">#fldPartyID#</TD>
		          <TD>#strLBLStrength#</TD>
		          <TD>#fldStrength#</TD>
				</TR>
				<tr>
		          <td colspan="3" align="right">#strLBLVDDDate#</td>
 				  <td>#fldVDDAssessment#</td>
		          <TD>#strLBLTherapeutic#</TD>
		          <TD>#fldUsage#</TD>
				</tr>
			</table>
		</td>
		<td width="5%"></td>
	</tr>
	<tr>
	    <td width="5%"></td>
		<td width="90%">&nbsp;</td>
	    <td width="5%"></td>
	</tr>
	<tr>
	    <td width="5%"></td>
		<td width="90%"><b>#strLBLTabIngredient#</b></td>
	    <td width="5%"></td>
	</tr>
	<tr>
	    <td width="5%"></td>
		<td width="90%">
			<table align="left" width="100%" border="0" cellspacing="0" cellspadding="0">
				<tr bgcolor="##408080">
					<td width="40%" style="font:10; color:F8CC30;">#strLBLIngredient#</td>
					<td width="30%" style="font:10; color:F8CC30;">#strLBLType#</td>
					<td width="30%" style="font:10; color:F8CC30;">#strLBLSchedule#</td>
				</tr>
					</cfoutput>
					<cfstoredproc procedure="pkg_select.ap_select_drug_ingredient"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
					<cfprocparam type="in" dbvarname="drugid" value="#DrugID#" cfsqltype="cf_sql_integer">
					<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
					<cfprocresult name="rs">
					</cfstoredproc>
					<cfoutput query="rs">
						<tr align="right"  valign="top">
							<td width="40%" align="left" style="font:10px">#rs.name#</td>
							<td width="30%" align="left" style="font:10px">#rs.typename#</td>
							<td width="30%" align="left" style="font:10px">#rs.schedulename#</td>
						</tr>
					</cfoutput>
					<cfoutput>
			</table>
		<td>
		<td width="5%"></td>
	</tr>
	<tr>
	    <td width="5%"></td>
		<td width="90%" >&nbsp;</td>
	    <td width="5%"></td>
	</tr>
	<tr>
	    <td width="5%"></td>
		<td width="90%">&nbsp;</td>
	    <td width="5%"></td>
	</tr>
	<tr>
	    <td width="5%"></td>
		<td width="90%" ><b>#strLBLTabDosage#</b></td>
	    <td width="5%"></td>
	</tr>
	<tr>
	    <td width="5%"></td>
		<td width="90%">
			<table align="left" width="100%"  height = "20" border="0" cellspacing="0" cellspadding="0">
				<tr bgcolor="##408080">
					<td width="14%" style="font:10; color:F8CC30;">#strLBLRoute#</td>
					<td width="8%" style="font:10; color:F8CC30;">#strLBLQuantity#</td>
					<td width="14%" style="font:10; color:F8CC30;">#strLBLForm#</td>
					<td width="8%" style="font:10; color:F8CC30;">#strLBLQuantity#</td>
					<td width="10%" style="font:10; color:F8CC30;">#strLBLFrequency#</td>
					<td width="15%" style="font:10; color:F8CC30;">#strLBLSpecies#</td>
					<td width="15%" style="font:10; color:F8CC30;">#strLBLBreed#</td>
					<td width="16%" style="font:10; color:F8CC30;">#strLBLIndication#</td>
					</cfoutput>
				</tr>
					<cfstoredproc procedure="pkg_select.ap_select_drug_dosages"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
					<cfprocparam type="in" dbvarname="drugid" value="#DrugID#" cfsqltype="cf_sql_integer">
					<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
					<cfprocresult name="rs">
					</cfstoredproc>
					<cfoutput query="rs">
						<tr align="right"  valign="top" >
							<td width="14%" align="left" style="font:10px">#rs.routename#</td>
							<td width="8%" align="left" style="font:10px">#rs.quantity#</td>
							<td width="14%" align="left" style="font:10px">#rs.formname#</td>
							<td width="8%" align="left" style="font:10px">#rs.frequency_quantity#</td>
							<td width="10%" align="left" style="font:10px">#rs.frequencyname#</td>
							<td width="15%" align="left" style="font:10px">#rs.speciesname#</td>
							<td width="15%" align="left" style="font:10px">#rs.breedname#</td>
							<td width="16%" align="left" style="font:10px">#rs.indication#</td>
						</tr>
					</cfoutput>
			</table>
		<td>
		<td width="5%"></td>
	</tr>
	<cfoutput>
	<tr>
	    <td width="5%"></td>
		<td width="90%" >&nbsp;</td>
	    <td width="5%"></td>
	</tr>
	<tr>
	    <td width="5%"></td>
		<td width="90%" >&nbsp;</td>
	    <td width="5%"></td>
	</tr>
	<tr>
	    <td width="5%"></td>
		<td width="90%" ><b>#strLBLTabRisk#</b></td>
	    <td width="5%"></td>
	</tr>
	<tr>
	    <td width="5%"></td>
		<td width="90%">
			<table align="left" width="100%"  height = "20" border="0" cellspacing="0" cellspadding="0">
				<tr bgcolor="##408080">
					<td width="10%" style="font:10; color:F8CC30;">#strLBLRiskType#</td>
					<td width="90%" style="font:10; color:F8CC30;">#strLBLRiskDesc#</td>
					</cfoutput>
				</tr>
					<cfstoredproc procedure="pkg_select.ap_select_drug_risks"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
					<cfprocparam type="in" dbvarname="drugid" value="#DrugID#" cfsqltype="cf_sql_integer">
					<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
					<cfprocresult name="rs">
					</cfstoredproc>
					<cfoutput query="rs">
						<tr align="right"  valign="top">
							<td width="10%" align="left" style="font:10px">#rs.name#</td>
							<td width="90%" align="left" style="font:10px">#rs.risk_description#</td>
						</tr>
					</cfoutput>
			</table>
		<td>
		<td width="5%"></td>
	</tr>
	<cfoutput>
	<tr>
	    <td width="5%"></td>
		<td width="90%"  >&nbsp;</td>
	    <td width="5%"></td>
	</tr>
	<tr>
	    <td width="5%"></td>
		<td width="90%" >&nbsp;</td>
	    <td width="5%"></td>
	</tr>
	<tr>
	    <td width="5%"></td>
		<td width="90%" ><b>#strLBLTabNote#</b></td>
	    <td width="5%"></td>
	</tr>
	<tr>
	    <td width="5%"></td>
		<td width="90%">
			<table align="left" width="100%"  height = "20" border="0" cellspacing="0" cellspadding="0">
				<tr bgcolor="##408080">
					<td width="10%" style="font:10; color:F8CC30;">#strLBLNotesType#</td>
					<td width="10%" style="font:10; color:F8CC30;">#strLBLNotesSeverity#</td>
					<td width="80%" style="font:10; color:F8CC30;">#strLBLNotesDesc#</td>
					</cfoutput>
				</tr>
					<cfstoredproc procedure="pkg_select.ap_select_drug_notes"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
					<cfprocparam type="in" dbvarname="drugid" value="#DrugID#" cfsqltype="cf_sql_integer">
					<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
					<cfprocresult name="rs">
					</cfstoredproc>
					<cfoutput query="rs">
						<tr align="right"  valign="top" >
							<td width="10%" align="left" style="font:10px">#rs.name1#</td>
							<td width="10%" align="left" style="font:10px">#rs.name2#</td>
							<td width="80%" align="left" style="font:10px">#rs.notes#</td>
						</tr>
					</cfoutput>
			</table>
		<td>
		<td width="5%"></td>
	</tr>
	<tr valign="top" height="4">
	    <td width="5%"></td>
		<td width="90%" ></td>
		<td width="5%"></td>
	</tr>
	<tr>
	    <td width="5%"></td>
		<td width="90%">&nbsp;</td>
	    <td width="5%"></td>
	</tr>
	<cfoutput>
	<tr height="100%" valign="top">
		<td width="5%"></td>
		<td width="90%" align="right"><input type="button" name="printbutton" value="#strLBLPrintButton#" onClick="window.print();"></td>
		<td width="5%"></td>
	</tr>
	</cfoutput>
</table>
</body>
</html>
