<cfif NOT IsDefined("Operation")>
  <cfset Operation="view">
</cfif>
<cfIf NOT IsDefined("reaction_id")>
  <cfset ReactionID = 0>
<cfelse>
  <cfset ReactionID = reaction_id>
</cfif>
<cfif Operation is "add">
  <cfstoredproc procedure="pkg_adr.ap_add_reaction_drug"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
  <cfprocparam type="in" dbvarname="reactionid" value="#ReactionID#" cfsqltype="cf_sql_integer">
  <cfprocparam type="in" dbvarname="drugid" value="#drug_id#" cfsqltype="cf_sql_integer">
  <cfprocparam type="in" dbvarname="lotnumber" value="#drug_lot_number#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="expdate" value="#drug_expiration_date#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="strengthid" value="#drug_strength_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="formid" value="#drug_form_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="routeid" value="#drug_route_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="unitbody" value="#drug_unit_per_body_weight#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="frequencyid" value="#drug_frequency_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="dur_month" value="#drug_dur_month#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="dur_day" value="#drug_dur_day#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="dur_hour" value="#drug_dur_hour#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="firstdate" value="#drug_first_administered_on#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="lastdate" value="#drug_last_administered_on#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="adminid" value="#drug_admin_business_party_type_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="usedlabel" value="#drug_used_as_per_label_flag#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="quantityin" value="#drug_quantity#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="frequencyqty" value="#drug_frequency_quantity#" cfsqltype="cf_sql_varchar">
  </cfstoredproc>
<cfElseIf Operation is "update">
  <cfstoredproc procedure="pkg_adr.ap_update_reaction_drug"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
  <cfprocparam type="in" dbvarname="reactionid" value="#ReactionID#" cfsqltype="cf_sql_integer">
  <cfprocparam type="in" dbvarname="drugid" value="#drug_id#" cfsqltype="cf_sql_integer">
  <cfprocparam type="in" dbvarname="olddrugid" value="#old_drug_id#" cfsqltype="cf_sql_integer">
  <cfprocparam type="in" dbvarname="lotnumber" value="#drug_lot_number#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="expdate" value="#drug_expiration_date#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="strengthid" value="#drug_strength_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="formid" value="#drug_form_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="routeid" value="#drug_route_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="unitbody" value="#drug_unit_per_body_weight#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="frequencyid" value="#drug_frequency_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="dur_month" value="#drug_dur_month#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="dur_day" value="#drug_dur_day#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="dur_hour" value="#drug_dur_hour#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="firstdate" value="#drug_first_administered_on#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="lastdate" value="#drug_last_administered_on#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="adminid" value="#drug_admin_business_party_type_id#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="usedlabel" value="#drug_used_as_per_label_flag#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="quantityin" value="#drug_quantity#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="frequencyqty" value="#drug_frequency_quantity#" cfsqltype="cf_sql_varchar">
  </cfstoredproc>
<cfelseif Operation is "Delete">
  <cfstoredproc procedure="pkg_adr.ap_delete_reaction_drug"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
  <cfprocparam type="in" dbvarname="reactionid" value="#ReactionID#" cfsqltype="cf_sql_integer">
  <cfprocparam type="in" dbvarname="drugid" value="#drug_id#" cfsqltype="cf_sql_integer">
  </cfstoredproc>
</cfif>

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
<form action="adrdrug.cfm" name="detail" id="detail" method="post" target="">
<cfif session.adverse_role gt 0>
<table align="left" width="100%"  height = "20" border="0" cellspacing="0" cellspadding="0">
	<tr bgcolor="#408080">
	    <cfoutput>
		<td width="18%" style="font:10; color:F8CC30;"><b>#strLBLDrug#</b></td>
		<td width="18%" style="font:10; color:F8CC30;">#strLBLRoute#</td>								    
		<td width="10%" style="font:10; color:F8CC30;">#strLBLQuantity#</td>
		<td width="18%" style="font:10; color:F8CC30;">#strLBLForm#</td>
		<td width="10%" style="font:10; color:F8CC30;">#strLBLQuantity#</td>
		<td width="18%" style="font:10; color:F8CC30;">#strLBLFrequency#</td>
		<td width="8%"  style="font:10; color:F8CC30;">Action</td>
  		</cfoutput>
    </tr>
    	<cfstoredproc procedure="pkg_select.ap_select_reaction_drug"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
	    <cfprocparam type="in" dbvarname="reactionid" value="#ReactionID#" cfsqltype="cf_sql_integer">
	    <cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
    	<cfprocresult name="rs">
	    </cfstoredproc>
 		<cfset txtColor="c0c0c0">
		<cfset row=0>
		<cfoutput query="rs">
		    <cfset row=row+1>
		    <cfif txtColor is "c0c0c0">
	    	  <cfset txtColor="c9c9c9">
		    <cfelse>
		      <cfset txtColor="c0c0c0">
	    	</cfif>
			<tr align="right"  valign="top" bgcolor="#txtColor#" onMouseOver="this.bgColor='##408080'; document.all.delimg#row#.src='../images/delhl.bmp'; document.all.editimg#row#.src='../images/edithl.bmp';" onMouseOut="this.bgColor='#txtColor#'; document.all.delimg#row#.src='../images/del.bmp'; document.all.editimg#row#.src='../images/edit.bmp';">
				<td width="18%" align="left" style="font:10px">#rs.drugname#</td>
				<td width="18%" align="left" style="font:10px">#rs.routename#</td>
				<td width="10%" align="left" style="font:10px">#rs.quantity#</td>
				<td width="18%" align="left" style="font:10px">#rs.formname#</td>
				<td width="10%" align="left" style="font:10px">#rs.frequency_quantity#</td>
				<td width="18%" align="left" style="font:10px">#rs.frequencyname#</td>
				<td width="8%" align="center" style="font:13px">
				    <cfif session.adverse_role gt 1>
	 	  		    <A HREF="##" STYLE="color:navy;" onclick="SendToParent('#rs.drug_id#','#rs.expiration_date#','#rs.strength_id#','#rs.form_id#',
					'#rs.route_id#','#rs.frequency_id#','#rs.dur_month#','#rs.dur_day#','#rs.dur_hour#','#rs.first_administered_on#',
					'#rs.last_administered_on#','#rs.admin_business_party_type_id#','#rs.used_as_per_label_flag#',
					'#rs.quantity#','#rs.frequency_quantity#',document.detail.desclot#row#.value,document.detail.descunit#row#.value);"><img src="../Images/edit.bmp" name="editimg#row#" border="0"></a>&nbsp; 
	      			<A HREF="##" STYLE="color:navy;" onclick="var dodelete=window.confirm('#strAlertDeleteMe#'); if(dodelete) window.location='#SCRIPT_NAME#?Operation=Delete&reaction_id=#ReactionID#&drug_id=#rs.drug_id#';"><img src="../Images/del.bmp" name="delimg#row#" border="0"></A>
					</cfif>
					<input type="hidden" name="desclot#row#" value="#rs.lot_number#">
					<input type="hidden" name="descunit#row#" value="#rs.unit_per_body_weight#"></td>
			</tr>
			<tr bgcolor=#txtColor#>
				<td colspan="6">
					<table border="1" width="100%">
						<tr>
							<td align="right">#strLBLDuration# :</td>
							<td>#rs.dur_month#m - #rs.dur_day#d - #rs.dur_hour#h</td>
							<td align="right">#strLBLStart# :</td>
							<td>#rs.first_administered_on#</td>
							<td align="right">#strLBLEnd# :</td>
							<td>#rs.last_administered_on#</td>
						</tr>
						<tr>
							<td align="right">#strLBLAdminBy# :</td>
							<TD>#rs.typename#</td>
							<td align="right">#strLBLLabel# :</td>
							<td>#rs.labelname#</td>
							<td align="right">#strLBLStrength# :</td>
							<td>#rs.strengthname#</td>
						</tr>
						<tr>
							<td align="right">#strLBLUnitBody# :</td>
							<TD>#rs.unit_per_body_weight#</td>
							<td align="right">#strLBLLot# :</td>
							<TD>#rs.lot_number#</td>
							<td align="right">#strLBLExpire# :</td>
							<td>#rs.expiration_date#</td>											
						</tr>
					</table>
				</td>
				<td>&nbsp;</td>
			</tr>
		</cfoutput>
	<tr>
	    <cfoutput>
		<td colspan="7"><input type="hidden" name="Operation" value="add">
		<input type="hidden" name="reaction_id" value="#ReactionID#">
		<input type="hidden" name="drug_id">
		<input type="hidden" name="old_drug_id">
		<input type="hidden" name="drug_lot_number">
		<input type="hidden" name="drug_expiration_date">
		<input type="hidden" name="drug_strength_id">
		<input type="hidden" name="drug_form_id">
		<input type="hidden" name="drug_route_id">
		<input type="hidden" name="drug_unit_per_body_weight">
		<input type="hidden" name="drug_frequency_id">
		<input type="hidden" name="drug_dur_month">
		<input type="hidden" name="drug_dur_day">
		<input type="hidden" name="drug_dur_hour">
		<input type="hidden" name="drug_first_administered_on">
		<input type="hidden" name="drug_last_administered_on">
		<input type="hidden" name="drug_admin_business_party_type_id">
		<input type="hidden" name="drug_used_as_per_label_flag">
		<input type="hidden" name="drug_quantity">
		<input type="hidden" name="drug_frequency_quantity"></td>
		</cfoutput>
	</tr>
</table>
</cfif>
</form>
<script language=javascript>
  parent.window.frmreaction.drug_id.value = '';
  parent.window.frmreaction.drug_expiration_date.value = '';
  parent.window.frmreaction.drug_strength_id.value = '';
  parent.window.frmreaction.drug_form_id.value = '';
  parent.window.frmreaction.drug_route_id.value = '';
  parent.window.frmreaction.drug_frequency_id.value = '';
  parent.window.frmreaction.drug_dur_month.value = '';
  parent.window.frmreaction.drug_dur_day.value = '';
  parent.window.frmreaction.drug_dur_hour.value = '';
  parent.window.frmreaction.drug_first_administered_on.value = '';
  parent.window.frmreaction.drug_last_administered_on.value = '';
  parent.window.frmreaction.drug_admin_business_party_type_id.value = '';
  parent.window.frmreaction.drug_used_as_per_label_flag.value = '';
  parent.window.frmreaction.drug_quantity.value = '';
  parent.window.frmreaction.drug_frequency_quantity.value = '';
  parent.window.frmreaction.drug_lot_number.value = '';
  parent.window.frmreaction.drug_unit_per_body_weight.value = '';
  
  function SendToParent(drugid,expiration_date,strength_id,form_id,route_id,
                        frequency_id,dur_month,dur_day,dur_hour,firstdate, lastdate,
						admintype, usedflag, qty, freqqty, lotnumber, unitperbody) 
  {
    document.detail.Operation.value = "update";
    document.detail.old_drug_id.value = drugid;
	parent.window.frmreaction.drug_id.value = drugid;
	parent.window.frmreaction.drug_expiration_date.value = expiration_date;
	parent.window.frmreaction.drug_strength_id.value = strength_id;
	parent.window.frmreaction.drug_form_id.value = form_id;
	parent.window.frmreaction.drug_route_id.value = route_id;
	parent.window.frmreaction.drug_frequency_id.value = frequency_id;
	parent.window.frmreaction.drug_dur_month.value = dur_month;
	parent.window.frmreaction.drug_dur_day.value = dur_day;
	parent.window.frmreaction.drug_dur_hour.value = dur_hour;
	parent.window.frmreaction.drug_first_administered_on.value = firstdate;
	parent.window.frmreaction.drug_last_administered_on.value = lastdate;
	parent.window.frmreaction.drug_admin_business_party_type_id.value = admintype;
	parent.window.frmreaction.drug_used_as_per_label_flag.value = usedflag;
	parent.window.frmreaction.drug_quantity.value = qty;
	parent.window.frmreaction.drug_frequency_quantity.value = freqqty;
	parent.window.frmreaction.drug_lot_number.value = lotnumber;
	parent.window.frmreaction.drug_unit_per_body_weight.value = unitperbody;
  }
</script>
</body>
</html>