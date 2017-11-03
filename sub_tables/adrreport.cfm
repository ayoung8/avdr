<html lang="EN">
<head>
<meta name="keywords" content="">
<cfoutput>
<title>#strLBLReportReaction#</title>
</cfoutput>
<!--#set var="ua" value="$HTTP_USER_AGENT" -->
<!--#if expr="$ua = /.*MSIE/" -->
<link href="../css/clf1_ie.css" rel="STYLESHEET" type="text/css"><!--#else -->
<link href="../css/clf1_ns.css" rel="STYLESHEET" type="text/css"><!--#endif -->
<!-- Note to coders: If server does not support Extended SSI, remove the above 4 lines and use only the link to the clf1_ns.css stylesheet. -->
</head>
<body background="../Images/background2.gif">
<cfIf NOT IsDefined("reaction_id")>
  <cfset ReactionID = 0>
<cfelse>
  <cfset ReactionID = reaction_id>
</cfif>
<cfstoredproc procedure="pkg_select.ap_report_reaction"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
<cfprocparam type="in" dbvarname="reactionid" value="#ReactionID#" cfsqltype="cf_sql_integer">
<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
<cfprocresult name="rs">
</cfstoredproc>
<cfoutput query="rs">
    <cfset fldDarNumber = rs.dar_number>
	<cfset fldDateReceived = rs.date_received>
	<cfset fldAssignedUser = rs.assigned_user_id>
	<cfset fldOrigin = rs.origin_country_id>
	<cfset fldAnimalOwner = rs.animal_owner_party_id>
	<cfset fldSender = rs.sender_business_party_type_id>
	<cfset fldSenderReportNo = rs.sender_report_number>
	<cfset fldSenderDate = rs.sender_report_date>
	<cfset fldDarFile = rs.dar_file>
	<cfset fldAnimalExposed = rs.number_of_animals_exposed>
	<cfset fldAnimalAffected = rs.number_of_animals_affected>
	<cfset fldAnimalDead = rs.number_of_dead_animals>
	<cfset fldSpeciesID = rs.species_id>
	<cfset fldBreedID = rs.breed_id>
	<cfset fldMixed = rs.mixed_flag>
	<cfset fldProductionType = rs.production_type_id>
	<cfset fldGender = rs.gender>
	<cfset fldPhysiological = rs.physiological_status_id>
	<cfset fldWeight = rs.weight>
	<cfset fldWeightEnd = rs.weight_end>
	<cfset fldWeightType = rs.weight_type>
	<cfset fldAge = rs.age>
	<cfset fldAgeEnd = rs.age_end>
	<cfset fldAgeType = rs.age_type>
	<cfset fldHealth = rs.health_status_id>
	<cfset fldReason = rs.treatment_usage_type_id>
	<cfset fldConcurrent = rs.concurrent_problem_flag>
	<cfset fldOnset = rs.date_of_onset>
	<cfset fldTrtMonth = rs.trt_month>
	<cfset fldTrtDay = rs.trt_day>
	<cfset fldTrtHour = rs.trt_hour>
	<cfset fldSeverity = rs.severity_id>
	<cfset fldOutcome = rs.treatment_outcome_type_id>
	<cfset fldTreatment = rs.treatment_of_adr_flag>
	<cfset fldPrvMonth = rs.prv_month>
	<cfset fldPrvDay = rs.prv_day>
	<cfset fldPrvHour = rs.prv_hour>
	<cfset fldPrevious = rs.previous_reaction_flag>
	<cfset fldTherapy = rs.concurrent_therapy_flag>
	<cfset fldStop = rs.treatment_discontinued_flag>
	<cfset fldPrvTrt = rs.previous_treatment_flag>
	<cfset fldPrvDate = rs.previous_treatment_date>
	<cfset fldResolved = rs.adr_resolved_flag>
	<cfset fldReappear = rs.adr_reappear_flag>
	<cfset fldVetCause = rs.vet_cause>
	<cfset fldVDDCause = rs.vdd_cause>
	<cfset fldManufacturerCause = rs.manufacturer_cause>
	<cfset fldADRClass = rs.classification_type_id>
	<cfset fldAssessVet = rs.assessing_vet_user_id>
	<cfset fldCorrectiveAction = rs.corrective_action_flag>
	<cfset fldSubmission = rs.submission_affected_flag>
	<cfset fldOther = rs.other_contacted_flag>
	<cfset fldPartyID = rs.party_id>
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
	    		<td align="center" width="100%"><font color="##F8CC30"><b>#strLBLReportReaction#</b></font></td>
			</table>
		</td>
		<td width="5%"></td>
	</tr>
	<tr valign="top">
		<td width="5%"></td>
		<td width="90%">
			<table align="left" valign="top" width="100%" border="0">
			  <TR>
				  <TD>#strLBLDateRecd#:</TD>
				  <td>#fldDateReceived#</td>
				  <td>#strLBLCountry#:</td>
				  <td>#fldOrigin#</TD>
			  </tr>
			  <tr>
				  <TD>#strLBLSender#:</TD>
				  <TD>#fldSender#</TD>
				  <TD>#strLBLAssignedTo#:</TD>
				  <TD>#fldAssignedUser#</TD>
			  </tr>
			  <tr>
				  <TD>#strLBLSenderReportNo#:</td>
				  <td>#fldSenderReportNo#</td>
				  <TD>#strLBLDarNo#:</TD>
				  <TD>#fldDarNumber#</TD>
			  </tr>
			  <tr>
				  <td>#strLBLSenderDate#:</td>
				  <td>#fldSenderDate#</td>
				  <TD>#strLBLDarFile#:</TD>
				  <TD>#fldDarFile#</TD>
			  </tr>
			</table>
		</td>
		<td width="5%"></td>
	</tr>
	<tr>
		<td width="5%"></td>
		<td width="90%">
			<table align="left" valign="top" width="100%" border="0">
			  <tr valign="top">
				  <TD valign="top">#strLBLOwner#: #fldAnimalOwner#</TD>
			  </tr>
			  <tr>
			  	<td>
			  	</cfoutput>
				<cfstoredproc procedure="pkg_select.ap_select_address"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
				<cfprocparam type="in" dbvarname="partyid" value="#fldPartyID#" cfsqltype="cf_sql_varchar">
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
				</td>
			  </tr>
			  <cfoutput>
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
		<td width="90%">&nbsp;</td>
	    <td width="5%"></td>
	</tr>
	<tr>
	    <td width="5%"></td>
		<td width="90%"><b>#strLBLTabAnimal#</b></td>
	    <td width="5%"></td>
	</tr>
	<tr valign="top">
		<td width="5%"></td>
		<td width="90%">
			<table width="100%" border="0" cellpadding="1" cellspacing="1">
				<tr>
					<td width="25%">#strLBLAnimalExposed#:</td>
					<TD>#fldAnimalExposed#</TD>
					<Td></Td>
					<td>#strLBLSpecies#:</td>
					<td colspan="2">#fldSpeciesID#</td>
				</tr>
				<tr>
					<td>#strLBLAnimalAffected#:</td>
					<TD>#fldAnimalAffected#</TD>
					<td></td>
					<td>#strLBLBreed#:</td>
					<td colspan="2">#fldBreedID#</td>
				</tr>
				<tr>
					<td>#strLBLAnimalDead#:</td>
					<TD>#fldAnimalDead#</TD>
					<td></td>
					<td>#strLBLMixed#:</td>
					<td>#fldMixed#</td>
					<td>#strLBLGender#: #fldGender#</td>
				</tr>
			</table>
			<table width="100%" border="0" cellpadding="1" cellspacing="1">
				<tr>
					<td>#strLBLProduction#:</td>
					<td>#fldProductionType#</td>
					<td>#strLBLWeight#:</td>
					<td>#fldWeight#&nbsp; - &nbsp; #fldWeightEnd#&nbsp;#strLBLType#&nbsp;#fldWeightType#</td>
				</tr>
				<tr>
					<td>#strLBLPhysiological#:</td>
					<td>#fldPhysiological#</td>
					<td>#strLBLAge#:</td>
					<td>#fldAge#&nbsp; - &nbsp; #fldAgeEnd#&nbsp;#strLBLType#&nbsp;#fldAgeType#</td>
				</tr>
				<tr>
					<td>#strLBLHealth#:</td>
					<td>#fldHealth#</td>
					<td>#strLBLReason#:</td>
					<td>#fldReason#&nbsp;&nbsp;#strLBLConcurrent#:&nbsp;#fldConcurrent#</td>
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
		<td width="90%">&nbsp;</td>
	    <td width="5%"></td>
	</tr>
	<tr>
	    <td width="5%"></td>
		<td width="90%"><b>#strLBLTabADR#</b></td>
	    <td width="5%"></td>
	</tr>
	<tr valign="top">
		<td width="5%"></td>
		<td width="90%">
			<table width="100%" border="0" cellpadding="1" cellspacing="1">
				<tr>
					<td>#strLBLOnset#:</td>
					<td>#fldOnset#</td>
					<td>#strLBLDurationAdr#:</td>
					<TD>#fldTrtMonth# m #fldTrtDay# d #fldTrtHour# h</td>										
					<td>#strLBLSeverity#:</td>
					<td>#fldSeverity#</td>
				</tr>
				<tr>
					<td>#strLBLTreatmentAdr#:</td>
					<td>#fldTreatment#</td>
					<td>#strLBLOutcome#:</td>
					<td>#fldOutcome#</td>
					<td colspan="2">#strLBLTherapy#: #fldTherapy#</td>
				</tr>
				<tr>
					<td>#strLBLStop#:</td>
					<td colspan="5">#fldStop#&nbsp;#strLBLResolved#:&nbsp;#fldResolved#							
						&nbsp;#strLBLReappear#:&nbsp;#fldReappear#
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>#strLBLPrevTrt#:</td>
					<td>#fldPrvTrt#</td>
					<td>#strLBLPrevDate#:</td>
					<td>#fldPrvDate#</td>
					<td>#strLBLDurationAdr#:</td>
					<TD>#fldPrvMonth# m #fldPrvDay# d #fldPrvHour# h</td>
				</tr>
				<tr>
					<td>#strLBLPrevious#:</td>
					<td>#fldPrevious#</td>
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
		<td width="90%">&nbsp;</td>
	    <td width="5%"></td>
	</tr>
	<tr>
	    <td width="5%"></td>
		<td width="90%"><b>#strLBLTabDrugData#</b></td>
	    <td width="5%"></td>
	</tr>
	<tr>
	    <td width="5%"></td>
		<td width="90%">
			<table align="left" width="100%" border="0" cellspacing="0" cellspadding="0">
				<tr bgcolor="##408080">
					<td width="26%" style="font:10; color:F8CC30;">#strLBLDrug#</td>
					<td width="18%" style="font:10; color:F8CC30;">#strLBLRoute#</td>								    
					<td width="10%" style="font:10; color:F8CC30;">#strLBLQuantity#</td>
					<td width="18%" style="font:10; color:F8CC30;">#strLBLForm#</td>
					<td width="10%" style="font:10; color:F8CC30;">#strLBLQuantity#</td>
					<td width="18%" style="font:10; color:F8CC30;">#strLBLFrequency#</td>
				</tr>
					</cfoutput>
					<cfstoredproc procedure="pkg_select.ap_select_reaction_drug"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
					<cfprocparam type="in" dbvarname="reactionid" value="#ReactionID#" cfsqltype="cf_sql_integer">
					<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
					<cfprocresult name="rs">
					</cfstoredproc>
					<cfoutput query="rs">
						<tr align="right"  valign="top">
							<td width="26%" align="left" style="font:10px">#rs.drugname#</td>
							<td width="18%" align="left" style="font:10px">#rs.routename#</td>
							<td width="10%" align="left" style="font:10px">#rs.quantity#</td>
							<td width="18%" align="left" style="font:10px">#rs.formname#</td>
							<td width="10%" align="left" style="font:10px">#rs.frequency_quantity#</td>
							<td width="18%" align="left" style="font:10px">#rs.frequencyname#</td>
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
		<td width="90%" ><b>#strLBLTabSystem#</b></td>
	    <td width="5%"></td>
	</tr>
	<tr>
	    <td width="5%"></td>
		<td width="90%">
			<table align="left" width="100%"  height = "20" border="0" cellspacing="0" cellspadding="0">
				<tr bgcolor="##408080">
					<td width="100%" style="font:10; color:F8CC30;">#strLBLSystem#</td>
				</tr>
					</cfoutput>
					<cfstoredproc procedure="pkg_select.ap_select_reaction_system"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
					<cfprocparam type="in" dbvarname="reactionid" value="#ReactionID#" cfsqltype="cf_sql_integer">
					<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
					<cfprocresult name="rs">
					</cfstoredproc>
					<cfoutput query="rs">
						<tr align="right"  valign="top">
							<td width="100%" align="left" style="font:10px">#rs.systemname#</td>
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
		<td width="90%">&nbsp;</td>
	    <td width="5%"></td>
	</tr>
	<tr>
	    <td width="5%"></td>
		<td width="90%" ><b>#strLBLTabVet#</b></td>
	    <td width="5%"></td>
	</tr>
	<tr>
	    <td width="5%"></td>
		<td width="90%">
			<table align="left" width="100%"  height = "20" border="0" cellspacing="0" cellspadding="0">
				<tr bgcolor="##408080">
			  	    <td width="100%" style="font:10; color:F8CC30;">#strLBLVet#</td>
				</tr>
					</cfoutput>
					<cfstoredproc procedure="pkg_select.ap_select_reaction_vet"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
					<cfprocparam type="in" dbvarname="reactionid" value="#ReactionID#" cfsqltype="cf_sql_integer">
					<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
					<cfprocresult name="rs">
					</cfstoredproc>
					<cfoutput query="rs">
						<tr align="right"  valign="top">
							<td width="100%" align="left" style="font:10px">#rs.vet#</td>
						</tr>
					</cfoutput>
			</table>
		<td>
		<td width="5%"></td>
	</tr>
	<cfoutput>
	<tr>
	    <td width="5%"></td>
		<td width="90%">&nbsp;</td>
	    <td width="5%"></td>
	</tr>
	<tr>
	    <td width="5%"></td>
		<td width="90%">&nbsp;</td>
	    <td width="5%"></td>
	</tr>
	<tr>
	    <td width="5%"></td>
		<td width="90%"><b>#strLBLTabAssessment#</b></td>
	    <td width="5%"></td>
	</tr>
	<tr valign="top">
		<td width="5%"></td>
		<td width="90%">
			<table width="100%" border="0" cellpadding="1" cellspacing="1">
				<tr>
					<td>#strLBLADRClassification#:</td>
					<TD>#fldADRClass#</TD>
					<td colspan="2">#strLBLEvaluator#: #fldAssessVet#</TD>
				</tr>
				<tr>
					<td colspan="4">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="4"><b><i>#strLBLCauseTitle#</i></b></td>
				</tr>
				<tr>
					<td>#strLBLAttendingVet#:</td>
					<TD>#fldVetCause#</TD>
					<td>#strLBLCorrectiveAction#:</td>
					<td>#fldCorrectiveAction#</td>
				</tr>
				<tr>
					<td>#strLBLManufacturer#:</td>
					<TD>#fldManufacturerCause#</TD>
					<td>#strLBLSubmission#:</td>
					<td>#fldSubmission#</td>
				</tr>
				<tr>
					<td>#strLBLVDD#:</td>
					<TD>#fldVDDCause#</TD>
					<td>#strLBLOther#:</td>
					<td>#fldOther#</td>
				</tr>
			</table>
		</td>
		<td width="5%"></td>
	</tr>
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
		<td width="90%" ><b>#strLBLTabAction#</b></td>
	    <td width="5%"></td>
	</tr>
	<tr>
	    <td width="5%"></td>
		<td width="90%">
			<table align="left" width="100%"  height = "20" border="0" cellspacing="0" cellspadding="0">
				<tr bgcolor="##408080">
					<td width="14%" style="font:10; color:F8CC30;">#strLBLCountryID#</td>
					<td width="14%" style="font:10; color:F8CC30;">#strLBLCorrectAction#</td>
					<td width="8%" style="font:10; color:F8CC30;">#strLBLDate#</td>
					<td width="64%" style="font:10; color:F8CC30;">#strLBLNotesDesc#</td>
					</cfoutput>
				</tr>
					<cfstoredproc procedure="pkg_select.ap_select_reaction_action"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
					<cfprocparam type="in" dbvarname="reactionid" value="#ReactionID#" cfsqltype="cf_sql_integer">
					<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
					<cfprocresult name="rs">
					</cfstoredproc>
					<cfoutput query="rs">
						<tr align="right"  valign="top">
							<td width="14%" align="left" style="font:10px">#rs.country#</td>
							<td width="14%" align="left" style="font:10px">#rs.correction#</td>
							<td width="8%" align="left" style="font:10px">#rs.correction_date#</td>
							<td width="64%" align="left" style="font:10px">#rs.notes#</td>
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
		<td width="90%" ><b>#strLBLTabKeyword#</b></td>
	    <td width="5%"></td>
	</tr>
	<tr>
	    <td width="5%"></td>
		<td width="90%">
			<table align="left" width="100%"  height = "20" border="0" cellspacing="0" cellspadding="0">
				<tr bgcolor="##408080">
			  	    <td width="100%" style="font:10; color:F8CC30;">#strLBLKeyword#</td>
					</cfoutput>
				</tr>
					<cfstoredproc procedure="pkg_select.ap_select_reaction_keyword"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
					<cfprocparam type="in" dbvarname="reactionid" value="#ReactionID#" cfsqltype="cf_sql_integer">
					<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
					<cfprocresult name="rs">
					</cfstoredproc>
					<cfoutput query="rs">
						<tr align="right"  valign="top">
							<td width="100%" align="left" style="font:10px">#rs.keyword#</td>
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
					<cfstoredproc procedure="pkg_select.ap_select_reaction_notes"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
					<cfprocparam type="in" dbvarname="reactionid" value="#ReactionID#" cfsqltype="cf_sql_integer">
					<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
					<cfprocresult name="rs">
					</cfstoredproc>
					<cfoutput query="rs">
						<tr align="right"  valign="top">
							<td width="10%" align="left" style="font:10px">#rs.name1#</td>
							<td width="10%" align="left" style="font:10px">#rs.name2#</td>
							<td width="80%" align="left" style="font:10px">#rs.notes#</td>
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
		<td width="90%" ><b>#strLBLTabDocument#</b></td>
	    <td width="5%"></td>
	</tr>
	<tr>
	    <td width="5%"></td>
		<td width="90%">
			<table align="left" width="100%"  height = "20" border="0" cellspacing="0" cellspadding="0">
				<tr bgcolor="##408080">
			  	    <td width="100%" style="font:10; color:F8CC30;">#strLBLTabDocument#</td>
					</cfoutput>
				</tr>
					<cfstoredproc procedure="pkg_select.ap_select_reaction_document"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
					<cfprocparam type="in" dbvarname="reactionid" value="#ReactionID#" cfsqltype="cf_sql_integer">
					<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
					<cfprocresult name="rs">
					</cfstoredproc>
					<cfoutput query="rs">
						<tr align="right"  valign="top">
							<td width="100%" align="left" style="font:10px">#rs.document_desc#</td>
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
