<cfIf NOT IsDefined("business_id")>
  <cfset BusinessID = 0>
<cfelse>
  <cfset BusinessID = business_id>
</cfif>
<cfif NOT IsDefined("business_type")>
  <cfset Operation = "security">
<cfelse>
  <cfset BusinessType = business_type>  
</cfif>
<cfIf Operation is "new_business">
  <cfset strLBLBusinessHeader = strLBLAddBusiness>
  <cfset strLBLBusinessButton = strLBLAddButtonBusiness>
<cfElseIf Operation is "edit_business">
  <cfset strLBLBusinessHeader = strLBLUpdateBusiness>
  <cfset strLBLBusinessButton = strLBLUpdateButtonBusiness>
</cfif>
<cfset strProtect = "">
<cfstoredproc procedure="pkg_select.ap_select_business_header"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
<cfprocparam type="in" dbvarname="businessid" value="#BusinessID#" cfsqltype="cf_sql_integer">
<cfprocresult name="rs">
</cfstoredproc>

<cfif operation is "edit_business" or operation is "new_business">
  <cfoutput query="rs">
    <cfset fldOrgName = rs.organization_name>
    <cfset fldOrgCode = rs.organization_code>
    <cfset fldOrgNumber = rs.business_number>
    <cfset fldLastName = rs.last_name>
    <cfset fldFirstName  = rs.first_name>
    <cfset fldNameTitle = rs.title>
    <cfset fldEmail = rs.email>
	<cfset fldPrefLang = rs.preferred_language>
	<cfset total_phone = rs.total_phone>
	<cfset total_address = rs.total_address>
  </cfoutput>
</cfif>
<html lang="EN">
<head>
<meta name="keywords" content="">
<cfoutput>
<title>#strLBLContact#</title>
</cfoutput>
<!--#set var="ua" value="$HTTP_USER_AGENT" -->
<!--#if expr="$ua = /.*MSIE/" -->
<link href="../css/clf1_ie.css" rel="STYLESHEET" type="text/css"><!--#else -->
<link href="../css/clf1_ns.css" rel="STYLESHEET" type="text/css"><!--#endif -->
<!-- Note to coders: If server does not support Extended SSI, remove the above 4 lines and use only the link to the clf1_ns.css stylesheet. -->
<script language="JavaScript" src="../includes/JavaScript/common.js"></script>
</head>
<body background="../Images/background2.gif">
<SCRIPT LANGUAGE="JavaScript" SRC="../includes/WEBCode/AnchorPosition.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript" SRC="../includes/WEBCode/PopupWindow.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript" SRC="../includes/WEBCode/date.js"></SCRIPT>
<cfinclude template="../includes/WEBCode/CalendarPopup.cfm">
<cfoutput>
<SCRIPT LANGUAGE="JavaScript"> 
var cal1 = new CalendarPopup();

<cfif operation is "edit_business" or operation is "new_business">
function Validate()
{
  var errmsg = "";

  if (document.frmbusiness.Operation.value=='delete') 
  {
   return true;
  }
  else
  {  
  if (document.frmbusiness.loading_phone.value == 1 ||
      document.frmbusiness.loading_address.value == 1) {
	  alert('#strLBLErrLoading#');
	  return false;
  }
  if (document.frmbusiness.business_type.value == 1) {
    if (document.frmbusiness.organization_name.value.length<1) {
	  errmsg += "\n\n #strLBLErrMissing#:";
	  errmsg += "\n          * #strLBLOrgName#";
	}
  }
  else
  { 
	if (document.frmbusiness.last_name.value.length<1 ||
	    document.frmbusiness.first_name.value.length<1 ) {
	  errmsg += "\n\n #strLBLErrMissing#:";
 	  if (document.frmbusiness.last_name.value.length<1) {
		errmsg += "\n          * #strLBLLastName# ";
	  }
 	  if (document.frmbusiness.first_name.value.length<1) {
		errmsg += "\n          * #strLBLFirstName# ";
	  }
    }
  }
  if (errmsg != "") {
	errmsg ="#strLBLErrProcess#  \n" +
	"______________________________" +
	errmsg + 
	"\n______________________________\n" +
	"\n #strLBLErrPleaseSubmit#";
	alert(errmsg);
	return false;
  }
  else
  {
    <cfloop index="currow" from="1" to="#total_address#" step="1">
	document.frmbusiness.address_type_id_#currow#.value = Tab1Frame.detail.address_type_id_#currow#.value;
	document.frmbusiness.address_id_#currow#.value = Tab1Frame.detail.address_id_#currow#.value;
	document.frmbusiness.address_line_1_#currow#.value = Tab1Frame.detail.address_line_1_#currow#.value;	
	document.frmbusiness.address_line_2_#currow#.value = Tab1Frame.detail.address_line_2_#currow#.value;	
	document.frmbusiness.address_line_3_#currow#.value = Tab1Frame.detail.address_line_3_#currow#.value;	
	document.frmbusiness.address_line_4_#currow#.value = Tab1Frame.detail.address_line_4_#currow#.value;	
	document.frmbusiness.address_city_#currow#.value = Tab1Frame.detail.address_city_#currow#.value;	
	document.frmbusiness.address_province_state_#currow#.value = Tab1Frame.detail.address_province_state_#currow#.value;	
	document.frmbusiness.country_id_#currow#.value = Tab1Frame.detail.country_id_#currow#.value;	
	document.frmbusiness.address_postal_code_#currow#.value = Tab1Frame.detail.address_postal_code_#currow#.value;	
	</cfloop>
    <cfloop index="currow" from="1" to="#total_phone#" step="1">
	document.frmbusiness.telephone_type_id_#currow#.value = Tab2Frame.detail.telephone_type_id_#currow#.value;
	document.frmbusiness.telephone_id_#currow#.value = Tab2Frame.detail.telephone_id_#currow#.value;
	document.frmbusiness.telephone_number_#currow#.value = Tab2Frame.detail.telephone_number_#currow#.value;	
	</cfloop>
  }
  }
}

function DoDelete()
{
  input_box=confirm('#strLBLConfirmDeleteBusiness#'); 
  if(input_box==true)
  {
    document.frmbusiness.Operation.value='delete';
	return true;
  }
  else
  {
    return false;
  }
}

function FindName(field,fieldtype) 
{
   var sFeatures="dialogHeight: 300px; dialogWidth: 379px; status: no; help: no; scroll: yes;";
   vValue = window.showModalDialog("businesssearch.cfm?name="+field.value+"&type="+fieldtype.value, "", sFeatures);
   if ((vValue != '') & (vValue  + "" !="undefined"))
   {
     window.location = 'businessparty.cfm?Caller='+document.frmbusiness.caller.value+'&Operation=edit_business&business_id='+vValue+'&business_type='+fieldtype.value;
   }
}

</cfif>
</SCRIPT>
</cfoutput>
<cfif operation is "edit_business" or operation is "new_business">
<cfoutput>
<form name="frmbusiness" action="#SCRIPT_NAME#" method="post" onsubmit="return Validate();">
<table width="100%" border="0" cellspacing="0" cellpadding="0" align="LEFT" valign="TOP" height="100%" background="../Images/background2.gif">
	<tr height="4">
		<td width="2%"></td>
		<td width="90%">
		   	<table width="100%" border="1" cellspacing="0" align="LEFT" cellpading="0" bgcolor="##408080">
	    		<td align="center" width="100%"><font color="##F8CC30"><b>#strLBLBusinessHeader#</b></font></td>
			</table>
		</td>
		<td width="2%"></td>
	</tr>
	<tr valign="top">
		<td width="2%"></td>
		<td width="90%">
			<table align="left" valign="top" width="100%" BGCOLOR="##C0C0C0" border="0">
			    <cfif businesstype is 1>
				<TR>
		          <TD><b>#strLBLOrgName#</b></TD>
		          <TD><input #strProtect# type="text" style="font:8pt" name="organization_name" maxlength="150" value="#fldOrgName#">
					  <A HREF="##" onClick="FindName(document.frmbusiness.organization_name,document.frmbusiness.business_type);"><img src="../images/search_mag.gif" width="21" height="21" border="0" hspace="0" vspace="0" align="absmiddle" name="plus"></A>
				  </TD>
		          <TD>#strLBLOrgCode#</TD>
		          <TD><input #strProtect# type="text" style="font:8pt" name="organization_code" maxlength="20" value="#fldOrgCode#"></TD>
		          <TD>#strLBLOrgNumber#</TD>
		          <TD><input #strProtect# type="text" style="font:8pt" name="business_number" maxlength="25" value="#fldOrgNumber#"></TD>
				</TR>
				<cfelse>
		          <TD><b>#strLBLLastName#</b></TD>
		          <TD><input #strProtect# type="text" style="font:8pt" name="last_name" maxlength="50" value="#fldLastName#">
					  <A HREF="##" onClick="FindName(document.frmbusiness.last_name,document.frmbusiness.business_type);"><img src="../images/search_mag.gif" width="21" height="21" border="0" hspace="0" vspace="0" align="absmiddle" name="plus"></A>
				  </TD>
		          <TD><b>#strLBLFirstName#</b></TD>
		          <TD><input #strProtect# type="text" style="font:8pt" name="first_name" maxlength="50" value="#fldFirstName#"></TD>
		          <TD>#strLBLNameTitle#</TD>
		          <TD><input #strProtect# type="text" style="font:8pt" name="title" maxlength="15" value="#fldNameTitle#"></TD>				
				</cfif>
				<tr>
				  <TD>#strLBLEmail#</TD>
		          <TD><input #strProtect# type="text" style="font:8pt" name="email" maxlength="60" value="#fldEmail#"></TD>
				  <TD><b>#strLBLPreferedLanguage#</b></TD>
		          <TD><select name="preferred_language" style="width=80px;">
						  <option value="E" <cfif fldPrefLang is "E"> selected </cfif>>English</option>
						  <option value="F" <cfif fldPrefLang is "F"> selected </cfif>>French</option>
					  </select></TD>
				</tr>
			</table>
		</td>
		<td width="2%"></td>
	</tr>
	<!-- Include tab back here -->
	<tr>
	 	<td width="2%"></td>
		<td width="90%" bgcolor="##C0C0C0" valign="top">
			<!-- Start Tabs -->
			<TABLE align="left" BORDER="0" CELLSPACING="0" CELLPADDING="0" valign="top">
				<TR>
					<TD>
						<table valign="top" height="20" border="0" cellspacing="0" cellpadding="0" class="TabTableActive" id="Tab1Table" style="background-color: ##408080;font-family: Tahoma; font-size: 10px;">
							<tr>
								<td align="left" valign="top"><IMG SRC="../Images/corner_tl3.gif" WIDTH="4" HEIGHT="4" ALT="" BORDER="0"></td>
								<td>&nbsp;<B><a HREF="##" CLASS="Tab" STYLE="color:##F8F400; font:11" Name="Tab1Label" ONCLICK="ShowDiv('Tab1',this,document.all.Tab1Table)">#strLBLTabAddress#</a></B>&nbsp;</td>
								<td ALIGN="right" VALIGN="top"><IMG SRC="../Images/corner_tR3.gif" WIDTH="4" HEIGHT="4" ALT="" BORDER="0"></td>
							</tr>
						</table>
					</TD>
					<TD>
						<TABLE valign="top" id=Tab2Table BORDER="0" CELLSPACING="0" CELLPADDING="0" CLASS="TabTable" HEIGHT="20" style="background-color: ##336699;font-family: Tahoma; font-size: 10px;">
							<tr>
								<td ALIGN="right" VALIGN="top"><IMG SRC="../images/corner_tl3.gif" WIDTH="4" HEIGHT="4" ALT="" BORDER="0"></td>
								<td>&nbsp;<B><a HREF="##" NAME="Tab2Label" CLASS="Tab" style="color:white; font:11" ONCLICK="ShowDiv('Tab2',this,document.all.Tab2Table)">#strLBLTabTelephone#</a></B>&nbsp;</td>
								<td ALIGN="right" VALIGN="top"><IMG SRC="../images/corner_tr3.gif" WIDTH="4" HEIGHT="4" ALT="" BORDER="0"></td>
							</tr>
						</table>					
					</TD>
					<TD>
						<TABLE valign="top" id=Tab3Table BORDER="0" CELLSPACING="0" CELLPADDING="0" CLASS="TabTable" HEIGHT="20" style="background-color: ##336699;font-family: Tahoma; font-size: 10px;">
							<tr>
								<td ALIGN="right" VALIGN="top"><IMG SRC="../images/corner_tl3.gif" WIDTH="4" HEIGHT="4" ALT="" BORDER="0"></td>
								<td>&nbsp;<B><a HREF="##" NAME="Tab3Label" CLASS="Tab" style="color:white; font:11" ONCLICK="ShowDiv('Tab3',this,document.all.Tab3Table)">#strLBLTabHistory#</a></B>&nbsp;</td>
								<td ALIGN="right" VALIGN="top"><IMG SRC="../images/corner_tr3.gif" WIDTH="4" HEIGHT="4" ALT="" BORDER="0"></td>
							</tr>
						</table>					
					</TD>
				</TR>
			</TABLE>
		</td>
		<td width="2%"></td>
	</tr>
	<tr>
	    <td width="2%"></td>
		<td width="90%" height="100%">
			<!-- End Tabs -->
			<TABLE align="left" WIDTH="100%" BORDER="1" CELLSPACING="0" CELLPADDING="4" BORDERCOLOR="##1F1FC3" BORDERCOLORLIGHT="##408080" BORDERCOLORDARK="##408080" BGCOLOR="##C0C0C0" style="font-family: Tahoma; font-size: 12px;" height="100%">
				<tr>
					<td>
						<!-- Address DIV-->
						<div id="Tab1" style="display:inline;">
							<table width="100%" border="0" cellpadding="1" cellspacing="1" height="100%">
								<tr height="100%">
						 			<td ><iframe src="businessaddress.cfm?business_id=#BusinessID#" name="Tab1Frame" scrolling="Yes" align="LEFT" width="100%" height="100%" id="Tab1Frame" frameborder="Yes" allowtransparency="true"></iframe></td>
								</tr>
							</table>
						</div>
						<!-- Telephone DIV -->
						<div id="Tab2" style="display:none;">
							<table width="100%" border="0" cellpadding="1" cellspacing="1" height="100%">
								<tr height="100%">
						 			<td><iframe src="businessphone.cfm?business_id=#BusinessID#" name="Tab2Frame" scrolling="Yes" align="LEFT" width="100%" height="100%" id="Tab2Frame" frameborder="Yes" allowtransparency="true"></iframe></td>
								</tr>
							</table>
						</div>
						<!-- History DIV -->
						<div id="Tab3" style="display:none;">
							<table width="100%" border="0" cellpadding="1" cellspacing="1" height="100%">
								<tr height="90%">
						 			<td><iframe width="100%" height="100%" name="Tab3Frame" id="Tab3Frame" ALLOWTRANSPARENCY="true" src="businesshistory.cfm?business_id=0" align="left" frameborder="1" scrolling="yes"></iframe></td>
								</tr>
								<tr height="10%">
									<td align="right"><input class="button" type="Button" name="Retrieve" value="#strLBLRetrieve#" onClick="Tab3Frame.location='businesshistory.cfm?business_id=#BusinessID#';"></td>
								</tr>
							</table>	
						</div>
					</td>
				</tr>
			</table>		
		</td>
		<td width="2%"></td>
	</tr>
	<tr valign="top">
	    <td width="2%"></td>
		<td width="90%">
			<table align="left" width="100%" cellspacing="0" cellpadding="0" border="0" height="20">
				<br>
				<td align="right">
			    <cfif Operation is "new_business">
  					<input type="hidden" name="Operation" value="Add">
				<cfelse>
  					<input type="hidden" name="Operation" value="Save">
				</cfif>
				<input type="hidden" name="business_id" value="#BusinessID#">
				<input type="hidden" name="business_type" value="#BusinessType#">
				<input type="hidden" name="total_phone" value="#total_phone#">
				<input type="hidden" name="total_address" value="#total_address#">
				<input type="hidden" name="caller" value="#caller#">
			    <cfloop index="currow" from="1" to="#total_address#" step="1">
				<input type="hidden" name="address_type_id_#currow#">
				<input type="hidden" name="address_id_#currow#">
				<input type="hidden" name="address_line_1_#currow#">
				<input type="hidden" name="address_line_2_#currow#">
				<input type="hidden" name="address_line_3_#currow#">
				<input type="hidden" name="address_line_4_#currow#">
				<input type="hidden" name="address_city_#currow#">
				<input type="hidden" name="address_province_state_#currow#">
				<input type="hidden" name="country_id_#currow#">
				<input type="hidden" name="address_postal_code_#currow#">
				</cfloop>
				<cfloop index="currow" from="1" to="#total_phone#" step="1">
				<input type="hidden" name="telephone_type_id_#currow#">
				<input type="hidden" name="telephone_id_#currow#">
				<input type="hidden" name="telephone_number_#currow#">
				</cfloop>
				<input type="hidden" name="loading_phone" value="1">
				<input type="hidden" name="loading_address" value="1">
				<cfif (Operation is not "new_business")>
					<input class="button" type="submit" name="delete" value="#strLBLDeleteButtonBusiness#" onClick="return DoDelete();">
  				  	&nbsp;
				</cfif>
			  	<input class="button" type="submit" name="ok" value="#strLBLBusinessButton#">
				</td>
			</table>
		</td>
		<td width="2%"></td>
	</tr>
	<tr valign="top" height="100%">
	    <td width="2%"></td>
		<td width="90%"></td>
		<td width="2%"></td>
	</tr>
</table>
</form>
<script language="JavaScript">
  if (window.frmbusiness.last_name + "" != "undefined")
    window.frmbusiness.last_name.focus();
  if (window.frmbusiness.organization_name + "" != "undefined") {
    window.frmbusiness.organization_name.focus();
	}
</script>
</cfoutput>
<cfelseif operation is "security">
   You do not have the security privelege to work with contact.
<cfelseif operation is "Add">
  <cfstoredproc procedure="pkg_util.ap_add_business"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
  <cfif BusinessType is 1>
    <cfprocparam type="in" dbvarname="orgname" value="#organization_name#" cfsqltype="cf_sql_varchar">
    <cfprocparam type="in" dbvarname="orgcode" value="#organization_code#" cfsqltype="cf_sql_varchar">
    <cfprocparam type="in" dbvarname="orgnumber" value="#business_number#" cfsqltype="cf_sql_varchar">
    <cfprocparam type="in" dbvarname="lastname" value="" cfsqltype="cf_sql_varchar">
    <cfprocparam type="in" dbvarname="firstname" value="" cfsqltype="cf_sql_varchar">
    <cfprocparam type="in" dbvarname="nametitle" value="" cfsqltype="cf_sql_varchar">
  <cfelse>
    <cfprocparam type="in" dbvarname="orgname" value="" cfsqltype="cf_sql_varchar">
    <cfprocparam type="in" dbvarname="orgcode" value="" cfsqltype="cf_sql_varchar">
    <cfprocparam type="in" dbvarname="orgnumber" value="" cfsqltype="cf_sql_varchar">
    <cfprocparam type="in" dbvarname="lastname" value="#last_name#" cfsqltype="cf_sql_varchar">
    <cfprocparam type="in" dbvarname="firstname" value="#first_name#" cfsqltype="cf_sql_varchar">
    <cfprocparam type="in" dbvarname="nametitle" value="#title#" cfsqltype="cf_sql_varchar">
  </cfif>
  <cfprocparam type="in" dbvarname="emailin" value="#email#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="preflang" value="#preferred_language#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="typeid" value="#business_type#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="out" dbvarname="businessid" variable="BusinessID" cfsqltype="cf_sql_integer">
  </cfstoredproc>
  <cfloop index="currow" from="1" to="#total_address#" step="1">
	  <cfstoredproc procedure="pkg_util.ap_update_business_address"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
      <cfprocparam type="in" dbvarname="businessid" value="#BusinessID#" cfsqltype="cf_sql_integer">
      <cfprocparam type="in" dbvarname="addresstypeid" value="#Evaluate("address_type_id_" & currow)#" cfsqltype="cf_sql_varchar">
      <cfprocparam type="in" dbvarname="addressid" value="#Evaluate("address_id_" & currow)#" cfsqltype="cf_sql_varchar">
      <cfprocparam type="in" dbvarname="line1" value="#Evaluate("address_line_1_" & currow)#" cfsqltype="cf_sql_varchar">
      <cfprocparam type="in" dbvarname="line2" value="#Evaluate("address_line_2_" & currow)#" cfsqltype="cf_sql_varchar">
      <cfprocparam type="in" dbvarname="line3" value="#Evaluate("address_line_3_" & currow)#" cfsqltype="cf_sql_varchar">
      <cfprocparam type="in" dbvarname="line4" value="#Evaluate("address_line_4_" & currow)#" cfsqltype="cf_sql_varchar">
      <cfprocparam type="in" dbvarname="city" value="#Evaluate("address_city_" & currow)#" cfsqltype="cf_sql_varchar">
      <cfprocparam type="in" dbvarname="prov" value="#Evaluate("address_province_state_" & currow)#" cfsqltype="cf_sql_varchar">
      <cfprocparam type="in" dbvarname="country" value="#Evaluate("country_id_" & currow)#" cfsqltype="cf_sql_varchar">
      <cfprocparam type="in" dbvarname="pcode" value="#Evaluate("address_postal_code_" & currow)#" cfsqltype="cf_sql_varchar">
	  </cfstoredproc>
  </cfloop>
  <cfloop index="currow" from="1" to="#total_phone#" step="1">
	  <cfstoredproc procedure="pkg_util.ap_update_business_phone"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
      <cfprocparam type="in" dbvarname="businessid" value="#BusinessID#" cfsqltype="cf_sql_integer">
      <cfprocparam type="in" dbvarname="telephonetypeid" value="#Evaluate("telephone_type_id_" & currow)#" cfsqltype="cf_sql_varchar">
      <cfprocparam type="in" dbvarname="telephoneid" value="#Evaluate("telephone_id_" & currow)#" cfsqltype="cf_sql_varchar">
      <cfprocparam type="in" dbvarname="telephonenumber" value="#Evaluate("telephone_number_" & currow)#" cfsqltype="cf_sql_varchar">
	  </cfstoredproc>
  </cfloop>
  <cfoutput>
    <script language="JavaScript">
      <cfif BusinessType is 1>
  	    opener.window.RefreshParty(#caller#,'#organization_name#','#BusinessID#');
	  <cfelse>
  	    opener.window.RefreshParty(#caller#,'#last_name#, #first_name#','#BusinessID#');
	  </cfif>
	  window.close();
    </script>
  </cfoutput>
<cfelseif operation is "Save">
  <cfstoredproc procedure="pkg_util.ap_update_business"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
  <cfprocparam type="in" dbvarname="businessid" value="#BusinessID#" cfsqltype="cf_sql_integer">
  <cfif BusinessType is 1>
    <cfprocparam type="in" dbvarname="orgname" value="#organization_name#" cfsqltype="cf_sql_varchar">
    <cfprocparam type="in" dbvarname="orgcode" value="#organization_code#" cfsqltype="cf_sql_varchar">
    <cfprocparam type="in" dbvarname="orgnumber" value="#business_number#" cfsqltype="cf_sql_varchar">
    <cfprocparam type="in" dbvarname="lastname" value="" cfsqltype="cf_sql_varchar">
    <cfprocparam type="in" dbvarname="firstname" value="" cfsqltype="cf_sql_varchar">
    <cfprocparam type="in" dbvarname="nametitle" value="" cfsqltype="cf_sql_varchar">
  <cfelse>
    <cfprocparam type="in" dbvarname="orgname" value="" cfsqltype="cf_sql_varchar">
    <cfprocparam type="in" dbvarname="orgcode" value="" cfsqltype="cf_sql_varchar">
    <cfprocparam type="in" dbvarname="orgnumber" value="" cfsqltype="cf_sql_varchar">
    <cfprocparam type="in" dbvarname="lastname" value="#last_name#" cfsqltype="cf_sql_varchar">
    <cfprocparam type="in" dbvarname="firstname" value="#first_name#" cfsqltype="cf_sql_varchar">
    <cfprocparam type="in" dbvarname="nametitle" value="#title#" cfsqltype="cf_sql_varchar">
  </cfif>
  <cfprocparam type="in" dbvarname="emailin" value="#email#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="preflang" value="#preferred_language#" cfsqltype="cf_sql_varchar">
  <cfprocparam type="in" dbvarname="typeid" value="#business_type#" cfsqltype="cf_sql_varchar">
  </cfstoredproc>
  <cfloop index="currow" from="1" to="#total_address#" step="1">
	  <cfstoredproc procedure="pkg_util.ap_update_business_address"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
      <cfprocparam type="in" dbvarname="businessid" value="#BusinessID#" cfsqltype="cf_sql_integer">
      <cfprocparam type="in" dbvarname="addresstypeid" value="#Evaluate("address_type_id_" & currow)#" cfsqltype="cf_sql_varchar">
      <cfprocparam type="in" dbvarname="addressid" value="#Evaluate("address_id_" & currow)#" cfsqltype="cf_sql_varchar">
      <cfprocparam type="in" dbvarname="line1" value="#Evaluate("address_line_1_" & currow)#" cfsqltype="cf_sql_varchar">
      <cfprocparam type="in" dbvarname="line2" value="#Evaluate("address_line_2_" & currow)#" cfsqltype="cf_sql_varchar">
      <cfprocparam type="in" dbvarname="line3" value="#Evaluate("address_line_3_" & currow)#" cfsqltype="cf_sql_varchar">
      <cfprocparam type="in" dbvarname="line4" value="#Evaluate("address_line_4_" & currow)#" cfsqltype="cf_sql_varchar">
      <cfprocparam type="in" dbvarname="city" value="#Evaluate("address_city_" & currow)#" cfsqltype="cf_sql_varchar">
      <cfprocparam type="in" dbvarname="prov" value="#Evaluate("address_province_state_" & currow)#" cfsqltype="cf_sql_varchar">
      <cfprocparam type="in" dbvarname="country" value="#Evaluate("country_id_" & currow)#" cfsqltype="cf_sql_varchar">
      <cfprocparam type="in" dbvarname="pcode" value="#Evaluate("address_postal_code_" & currow)#" cfsqltype="cf_sql_varchar">
	  </cfstoredproc>
  </cfloop>
  <cfloop index="currow" from="1" to="#total_phone#" step="1">
	  <cfstoredproc procedure="pkg_util.ap_update_business_phone"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
      <cfprocparam type="in" dbvarname="businessid" value="#BusinessID#" cfsqltype="cf_sql_integer">
      <cfprocparam type="in" dbvarname="telephonetypeid" value="#Evaluate("telephone_type_id_" & currow)#" cfsqltype="cf_sql_varchar">
      <cfprocparam type="in" dbvarname="telephoneid" value="#Evaluate("telephone_id_" & currow)#" cfsqltype="cf_sql_varchar">
      <cfprocparam type="in" dbvarname="telephonenumber" value="#Evaluate("telephone_number_" & currow)#" cfsqltype="cf_sql_varchar">
	  </cfstoredproc>
  </cfloop>
  <cfoutput>
    <script language="JavaScript">
      <cfif BusinessType is 1>
  	    opener.window.RefreshParty(#caller#,'#organization_name#','#BusinessID#');
	  <cfelse>
  	    opener.window.RefreshParty(#caller#,'#last_name#, #first_name#','#BusinessID#');
	  </cfif>
	  window.close();
    </script>
  </cfoutput>
<cfelseif operation is "delete">
  <cfstoredproc procedure="pkg_util.ap_delete_business"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
  <cfprocparam type="in" dbvarname="businessid" value="#BusinessID#" cfsqltype="cf_sql_integer">
  <cfprocparam type="out" dbvarname="rc" variable="rc" cfsqltype="cf_sql_integer">
  </cfstoredproc>
  <cfoutput>
  <cfif rc is 0>
    <script language=javascript>
	  alert('#strAlertKeyRef#');
	  window.close();
	</script>
  <cfelse>
    <script language="JavaScript">
      <cfif BusinessType is 1>
  	    opener.window.RefreshParty(#caller#,'#organization_name#','-#BusinessID#');
	  <cfelse>
  	    opener.window.RefreshParty(#caller#,'#last_name#, #first_name#','-#BusinessID#');
	  </cfif>
	  window.close();
    </script>
  </cfif>
  </cfoutput>
</cfif>
</body>
</html>
