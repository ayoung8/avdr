<script language="JavaScript">
  <cfif session.drug_role is 0>
    parent.parent.window.location = '../welcome.cfm';
  </cfif>
</script>
<html lang="EN">
<head>
<meta name="keywords" content="">
<title></title>
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

function Validate()
{
  var userinfo;
  var errmsg = "";

  if (document.frmdrug.Operation.value=='delete') 
  {
   return true;
  }
  else
  {  
  if (document.frmdrug.drug_din.value.length<1 ||
	  document.frmdrug.drug_brand_name.value.length<1 ||
	  document.frmdrug.drug_type_id.value.length<1) 
  {
	userinfo='1';
	errmsg = "\n\n #strLBLErrMissing#:";
	if (document.frmdrug.drug_din.value.length<1) {
		errmsg += "\n          * #strLBLDrugDIN#";
	}
	if (document.frmdrug.drug_brand_name.value.length<1) {
		errmsg += "\n          * #strLBLDrugBrand# ";
	}
	if (document.frmdrug.drug_type_id.value.length<1) {
		errmsg += "\n          * #strLBLDrugType# ";
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
  else
    return true;
  }
}

function DoDelete()
{
  input_box=confirm('#strLBLConfirmDelete#'); 
  if(input_box==true)
  {
    document.frmdrug.Operation.value='delete';
	document.frmdrug.submit();
	return true;
  }
  else
  {
    return false;
  }
}

function SubmitForm_Ingredient()
{
    if (document.frmdrug.drug_id.value == 0) {
	  if (Validate() == false) 
	    return false
	  else
	    SubmitDRUG('add','SubmitForm_Ingredient()');
	}
	else
	{	
    if (document.frmdrug.ingredient_id.value.length < 1 ||
	    document.frmdrug.ingredient_type_id.value.length < 1 ||
		document.frmdrug.schedule_type_id.value.length < 1)
	{
	    alert('#strErrMandatory#');
		return false;
	}
	else
	{
		Tab1Frame.detail.drug_id.value = document.frmdrug.drug_id.value;
        Tab1Frame.detail.unique_id.value = document.frmdrug.ingredient_id.value;
		Tab1Frame.detail.ingredient_type_id.value = document.frmdrug.ingredient_type_id.value;
		Tab1Frame.detail.schedule_type_id.value = document.frmdrug.schedule_type_id.value;
    	Tab1Frame.detail.submit();
		return true;
	}
	}
}

function SubmitForm_Dosages()
{
    if (document.frmdrug.drug_id.value == 0) {
	  if (Validate() == false) 
	    return false
	  else
	    SubmitDRUG('add','SubmitForm_Dosages()');
	}
	else
	{	
    if (document.frmdrug.quantity.value.length < 1)
	{
	    alert('#strErrQty#');
		return false;
	}
	else
	{
		Tab2Frame.detail.drug_id.value = document.frmdrug.drug_id.value;
		Tab2Frame.detail.form_id.value = document.frmdrug.form_id.value;
    	Tab2Frame.detail.frequency_id.value = document.frmdrug.frequency_id.value;
    	Tab2Frame.detail.species_id.value = document.frmdrug.species_id.value;
    	Tab2Frame.detail.breed_id.value = document.frmdrug.breed_id.value;
    	Tab2Frame.detail.quantity.value = document.frmdrug.quantity.value;
    	Tab2Frame.detail.frequency_quantity.value = document.frmdrug.frequency_quantity.value;
    	Tab2Frame.detail.route_id.value = document.frmdrug.route_id.value;
    	Tab2Frame.detail.indication.value = document.frmdrug.indication.value;
    	Tab2Frame.detail.submit();
		return true;
	}
	}
}

function SubmitForm_Risks()
{
    if (document.frmdrug.drug_id.value == 0) {
	  if (Validate() == false) 
	    return false
	  else
	    SubmitDRUG('add','SubmitForm_Risks()');
	}
	else
	{	
    if (document.frmdrug.risk_description.value.length < 1)
	{
	    alert('#strErrDesc#');
		return false;
	}
	else
	{
		Tab5Frame.detail.drug_id.value = document.frmdrug.drug_id.value;
		Tab5Frame.detail.risk_type_id.value = document.frmdrug.risk_type_id.value;
        Tab5Frame.detail.risk_description.value = document.frmdrug.risk_description.value;
        Tab5Frame.detail.submit();
  	    return true;
	}
	}
}

function SubmitForm_Notes()
{
    if (document.frmdrug.drug_id.value == 0) {
	  if (Validate() == false) 
	    return false
	  else
	    SubmitDRUG('add','SubmitForm_Notes()');
	}
	else
	{	
    if (document.frmdrug.notes_description.value.length < 1)
	{
	    alert('#strErrDesc#');
		return false;
	}
	else
	{
		Tab6Frame.detail.drug_id.value = document.frmdrug.drug_id.value;
		Tab6Frame.detail.notes_severity_type_id.value = document.frmdrug.notes_severity_type_id.value;
		Tab6Frame.detail.notes_type_id.value = document.frmdrug.notes_type_id.value;
        Tab6Frame.detail.notes_description.value = document.frmdrug.notes_description.value;
        Tab6Frame.detail.submit();
  	    return true;
	}
	}
}

function LoadBreed(selected) {
  document.frmdrug.breed_id.length = 0;
  var optionName = new Option('','',false,false);
  var length = document.frmdrug.breed_id.length;
  document.frmdrug.breed_id.options[length] = optionName;
  for (var i=0; i < document.frmdrug.breedlist.length; i++) {
    if (document.frmdrug.breedlist.options[i].value == selected) {
	  optionText = document.frmdrug.breedlist.options[i].text;
	  var myArray = optionText.split('.');
      var optionName = new Option(myArray[1],myArray[0],false,false);
      var length = document.frmdrug.breed_id.length;
      document.frmdrug.breed_id.options[length] = optionName;
	}
  }
}

function OpenFindIngredient()
{
   var sFeatures="dialogHeight: 300px; dialogWidth: 379px; status: no; help: no; scroll: yes;";
   vValue = window.showModalDialog("ingredientsearch.cfm?name="+document.frmdrug.ingredient_name.value, "", sFeatures);
   if ((vValue != '') & (vValue  + "" !="undefined"))
   {
     document.frmdrug.ingredient_id.value = vValue.substr(0,vValue.indexOf('.'));
     document.frmdrug.ingredient_name.value = vValue.substr(vValue.indexOf('.') + 1,100000);
   }
   else
   {
     document.frmdrug.ingredient_id.value = '';
	 document.frmdrug.ingredient_name.value = '';
   }
}

function GetBusiness(field,typeid,callerpgm)
{
  if (field.value.length < 1) 
    wName=window.open('businessparty.cfm?caller='+callerpgm+'&Operation=new_business&business_id=0&business_type='+typeid, 'wName' ,'resizable=yes, scrollbars=yes, width=800,height=500,top='+((screen.height - 500) / 2)+',left='+((screen.width - 800) / 2))
  else	
    wName=window.open('businessparty.cfm?caller='+callerpgm+'&Operation=edit_business&business_id='+field.value +'&business_type='+typeid, 'wName' ,'resizable=yes, scrollbars=yes, width=800,height=500,top='+((screen.height - 500) / 2)+',left='+((screen.width - 800) / 2))
}

function RefreshParty(field,newname,newid) {
  if (field.value.length < 1) {
    var optionName = new Option(newname,newid,false,false);
    var length = field.length;
    field.options[length] = optionName;
	field.value = newid;
  }
  else {
    if (newid < 0) {
      for (var i=0; i < field.length; i++) {
        if (field.options[i].value == newid * -1) 
	      field.remove(i);
	  }
	  field.value = '';
	}
	else
	{
      for (var i=0; i < field.length; i++) {
        if (field.options[i].value == newid) 
	      field.options[i].text = newname;
	  }
    }
  }
}

function SubmitDRUG(mode,caller) {
	DRUGFrame.detail.drug_din.value = document.frmdrug.drug_din.value;
	DRUGFrame.detail.drug_brand_name.value = document.frmdrug.drug_brand_name.value;
	DRUGFrame.detail.drug_generic_name.value = document.frmdrug.drug_generic_name.value;
	DRUGFrame.detail.party_id.value = document.frmdrug.party_id.value;
	DRUGFrame.detail.latest_vdd_assessment.value = document.frmdrug.latest_vdd_assessment.value;
	DRUGFrame.detail.drug_type_id.value = document.frmdrug.drug_type_id.value;
	DRUGFrame.detail.file_number.value = document.frmdrug.file_number.value;
	DRUGFrame.detail.form_type_id.value = document.frmdrug.form_type_id.value;
	DRUGFrame.detail.therapeutic_use_type_id.value = document.frmdrug.therapeutic_use_type_id.value;
	DRUGFrame.detail.strength_id.value = document.frmdrug.strength_id.value;
	DRUGFrame.detail.drug_id.value = document.frmdrug.drug_id.value;
	DRUGFrame.detail.Operation.value = mode;
	DRUGFrame.detail.Caller.value = caller;
	DRUGFrame.detail.submit();
}

function SetModeUpdate() {
  document.frmdrug.ok.value = '#strLBLUpdateButton#';
  document.frmdrug.header.value = '#strLBLUpdateDrug#';
  document.frmdrug.Operation.value = 'Save';
  document.frmdrug.deletebutton.style.visibility = "visible";
  alert('#strLBLRecordAdded#');
}

</SCRIPT>
</cfoutput>
<cfIf Operation is "new_drug">
  <cfif session.drug_role lt 3>
    <cfset Operation = "security">
  </cfif>
</cfif>
<cfIf NOT IsDefined("drug_id")>
  <cfset DrugID = 0>
<cfelse>
  <cfset DrugID = drug_id>
</cfif>
<cfIf Operation is "new_drug">
  <cfset strLBLDrugHeader = strLBLAddDrug>
  <cfset strLBLDrugButton = strLBLAddButton>
  <cfset strProtect = "">
  <cfstoredproc procedure="pkg_select.ap_select_drug_header"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
  <cfprocparam type="in" dbvarname="drugid" value="#DrugID#" cfsqltype="cf_sql_integer">
  <cfprocresult name="rs">
  </cfstoredproc>
<cfElseIf Operation is "edit_drug">
  <cfset strLBLDrugHeader = strLBLUpdateDrug>
  <cfif session.drug_role is 0>
    <cfset Operation = "security">
  <cfelseif session.drug_role is 1> 
    <cfset strProtect = "disabled">
    <cfset strLBLDrugHeader = strLBLViewDrug>
  <cfelse>
    <cfset strProtect = "">
  </cfif>
  <cfset strLBLDrugButton = strLBLUpdateButton>
  <cfstoredproc procedure="pkg_select.ap_select_drug_header"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
  <cfprocparam type="in" dbvarname="drugid" value="#DrugID#" cfsqltype="cf_sql_integer">
  <cfprocresult name="rs">
  </cfstoredproc>
</cfif>

<cfIf Operation is "new_drug" or Operation is "edit_drug">
  <cfoutput query="rs">
    <cfset fldDrugDIN = rs.drug_din>
    <cfset fldBrandName = rs.drug_brand_name>
    <cfset fldGenericName = rs.drug_generic_name>
    <cfset fldPartyId = rs.party_id>
    <cfset fldVDDAssessment = rs.vdd_assessment>
    <cfset fldDrugType = rs.drug_type_id>
    <cfset fldFileNumber = rs.file_number>
	<cfset fldFormType = rs.form_type_id>
	<cfset fldUsage = rs.therapeutic_use_id>
	<cfset fldStrength = rs.strength_id>
  </cfoutput>
</cfif>

<cfif operation is "edit_drug" or operation is "new_drug">
<cfoutput>
<form name="frmdrug" action="#SCRIPT_NAME#" method="post" onsubmit="return Validate();">
<table width="100%" border="0" cellspacing="0" cellpadding="0" align="LEFT" valign="TOP" height="100%" background="../Images/background2.gif">
	<tr height="4">
		<td width="5%"></td>
		<td width="90%">
		   	<table width="100%" border="1" cellspacing="0" align="LEFT" cellpading="0" bgcolor="##408080">
	    		<td align="center" width="100%"><font color="##F8CC30"><b><input size="100%" style="font:8pt; background-color:##408080; color: ##F8CC30; border: none; font-weight: bold; text-align: center;" readonly type="text" name="header" value="#strLBLDrugHeader#"></b></font></td>
			</table>
		</td>
		<td width="5%"></td>
	</tr>
	<tr valign="top">
		<td width="5%"></td>
		<td width="90%">
			<table align="left" valign="top" width="100%" BGCOLOR="##C0C0C0" border="0">
		        <TR>
		          <TD><b>#strLBLDrugBrand#</b></TD>
		          <TD><input #strProtect# type="text" style="font:8pt" name="drug_brand_name" maxlength="50" value="#fldBrandName#"></TD>
		          <TD><b>#strLBLDrugDIN#</b></TD>
		          <TD><input #strProtect# type="text" style="font:8pt" name="drug_din" maxlength="15"  value="#fldDrugDIN#"></TD>
		          <TD><b>#strLBLDrugType#</b></TD>
		          <TD><select #strProtect# name="drug_type_id" style="font:8pt; width=150px;">
				      <option></option>
					  </cfoutput>
                      <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
                      <cfprocparam type="in" dbvarname="listid" value="1" cfsqltype="cf_sql_integer">
                      <cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
                      <cfprocresult name="drop_down_list">
                      </cfstoredproc>
                      <cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#" <cfif drop_down_list.DDL_Value is fldDrugType> selected </cfif>>#drop_down_list.DDL_Desc#</option></cfoutput>						  
					  <cfoutput>
					  </select></TD>
				</TR>
				<TR>
		          <TD>#strLBLDrugCommon#</TD>
		          <TD><input #strProtect# type="text" style="font:8pt" name="drug_generic_name" maxlength="50"  value="#fldGenericName#"></TD>
				  <td>#srtLBLFileNo#</td>
				  <td><input #strProtect# type="text" style="font:8pt" name="file_number" size="20" maxlength="20"  value="#fldFileNumber#"></td>
		          <TD>#strLBLForm#</TD>
		          <TD><select #strProtect# name="form_type_id" style="font:8pt; width=150px;">
				      <option></option>
					  </cfoutput>
                      <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
                      <cfprocparam type="in" dbvarname="listid" value="32" cfsqltype="cf_sql_integer">
                      <cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
                      <cfprocresult name="drop_down_list">
                      </cfstoredproc>
                      <cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#" <cfif drop_down_list.DDL_Value is fldFormType> selected </cfif>>#drop_down_list.DDL_Desc#</option></cfoutput>						  
					  <cfoutput>
					  </select></TD>
				</TR>
				<TR>
		          <TD>#strLBLManufacturer#</TD>
		          <TD colspan="3"><select #strProtect# name="party_id" style="font:8pt; width=250px;">
				      <option></option>
					  </cfoutput>
                      <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
                      <cfprocparam type="in" dbvarname="listid" value="2" cfsqltype="cf_sql_integer">
                      <cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
                      <cfprocresult name="drop_down_list">
                      </cfstoredproc>
                      <cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#" <cfif drop_down_list.DDL_Value is fldPartyId> selected </cfif>>#drop_down_list.DDL_Desc#</option></cfoutput>						  
					  <cfoutput>
					  </select>
					  <cfif strProtect is not "disabled"><A HREF="##" onClick="GetBusiness(document.frmdrug.party_id,1,'opener.window.frmdrug.party_id');"><img src="../images/plus.bmp" width="21" height="21" border="0" hspace="0" vspace="0" align="absmiddle" name="plus"></A></cfif>
				  </TD>
		          <TD>#strLBLStrength#</TD>
		          <TD><select #strProtect# name="strength_id" style="font:8pt; width=150px;">
				      <option></option>
					  </cfoutput>
                      <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
                      <cfprocparam type="in" dbvarname="listid" value="5" cfsqltype="cf_sql_integer">
                      <cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
                      <cfprocresult name="drop_down_list">
                      </cfstoredproc>
                      <cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#" <cfif drop_down_list.DDL_Value is fldStrength> selected </cfif>>#drop_down_list.DDL_Desc#</option></cfoutput>						  
					  <cfoutput>
					  </select></TD>
				</TR>
				<tr>
		          <td colspan="3" align="right">#strLBLVDDDate#</td>
 				  <td><input #strProtect# value="#fldVDDAssessment#" type="Text" size="10" style="font:8pt" name="latest_vdd_assessment" maxlength="10" onblur="javascript:ValidDate(trim(document.frmdrug.latest_vdd_assessment.value),document.frmdrug.latest_vdd_assessment);"><cfif strProtect is not "disabled"><A HREF="##" onClick="cal1.select(document.frmdrug.latest_vdd_assessment,'anchor1','yyyy.MM.dd'); return false;" NAME="anchor1" ID="anchor1"><img src="../images/Calendar.gif" width="21" height="21" border="0" hspace="0" vspace="0" align="absmiddle"></A></cfif></td>
		          <TD>#strLBLTherapeutic#</TD>
		          <TD><select #strProtect# name="therapeutic_use_type_id" style="font:8pt; width=150px;">
				      <option></option>
					  </cfoutput>
                      <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
                      <cfprocparam type="in" dbvarname="listid" value="11" cfsqltype="cf_sql_integer">
                      <cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
                      <cfprocresult name="drop_down_list">
                      </cfstoredproc>
                      <cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#" <cfif drop_down_list.DDL_Value is fldUsage> selected </cfif>>#drop_down_list.DDL_Desc#</option></cfoutput>						  
					  <cfoutput>
					  </select></TD>
				</tr>
			</table>
		</td>
		<td width="5%"></td>
	</tr>
	<!-- Include tab back here -->
	<tr>
	 	<td width="5%"></td>
		<td width="90%" bgcolor="##C0C0C0" valign="top">
			<!-- Start Tabs -->
			<TABLE align="left" BORDER="0" CELLSPACING="0" CELLPADDING="0" valign="top">
				<TR>
					<TD>
						<table valign="top" height="20" border="0" cellspacing="0" cellpadding="0" class="TabTableActive" id="Tab1Table" style="background-color: ##408080;font-family: Tahoma; font-size: 10px;">
							<tr>
								<td align="left" valign="top"><IMG SRC="../Images/corner_tl3.gif" WIDTH="4" HEIGHT="4" ALT="" BORDER="0"></td>
								<td>&nbsp;<B><a HREF="##" CLASS="Tab" STYLE="color:##F8F400; font:11" Name="Tab1Label" ONCLICK="ShowDiv('Tab1',this,document.all.Tab1Table)">#strLBLTabIngredient#</a></B>&nbsp;</td>
								<td ALIGN="right" VALIGN="top"><IMG SRC="../Images/corner_tR3.gif" WIDTH="4" HEIGHT="4" ALT="" BORDER="0"></td>
							</tr>
						</table>
					</TD>
					<TD>
						<TABLE valign="top" id=Tab2Table BORDER="0" CELLSPACING="0" CELLPADDING="0" CLASS="TabTable" HEIGHT="20" style="background-color: ##336699;font-family: Tahoma; font-size: 10px;">
							<tr>
								<td ALIGN="right" VALIGN="top"><IMG SRC="../images/corner_tl3.gif" WIDTH="4" HEIGHT="4" ALT="" BORDER="0"></td>
								<td>&nbsp;<B><a HREF="##" NAME="Tab2Label" CLASS="Tab" style="color:white; font:11" ONCLICK="ShowDiv('Tab2',this,document.all.Tab2Table)">#strLBLTabDosage#</a></B>&nbsp;</td>
								<td ALIGN="right" VALIGN="top"><IMG SRC="../images/corner_tr3.gif" WIDTH="4" HEIGHT="4" ALT="" BORDER="0"></td>
							</tr>
						</table>					
					</TD>
					<td>
						<TABLE valign="top" id=Tab5Table BORDER="0" CELLSPACING="0" CELLPADDING="0" CLASS="TabTable" HEIGHT="20" style="background-color: ##336699;font-family: Tahoma; font-size: 10px;">
							<tr>
								<td ALIGN="right" VALIGN="top"><IMG SRC="../images/corner_tl3.gif" WIDTH="4" HEIGHT="4" ALT="" BORDER="0"></td>
								<td>&nbsp;<B><a HREF="##" NAME="Tab5Label" CLASS="Tab" style="color:white; font:11" ONCLICK="ShowDiv('Tab5',this,document.all.Tab5Table)">#strLBLTabRisk#</a></B>&nbsp;</td>
								<td ALIGN="right" VALIGN="top"><IMG SRC="../images/corner_tr3.gif" WIDTH="4" HEIGHT="4" ALT="" BORDER="0"></td>
							</tr>
						</table>					
					</td>
					<td>
						<TABLE valign="top" id=Tab6Table BORDER="0" CELLSPACING="0" CELLPADDING="0" CLASS="TabTable" HEIGHT="20" style="background-color: ##336699;font-family: Tahoma; font-size: 10px;">
							<tr>
								<td ALIGN="right" VALIGN="top"><IMG SRC="../images/corner_tl3.gif" WIDTH="4" HEIGHT="4" ALT="" BORDER="0"></td>
								<td>&nbsp;<B><a HREF="##" NAME="Tab6Label" CLASS="Tab" style="color:white; font:11" ONCLICK="ShowDiv('Tab6',this,document.all.Tab6Table)">#strLBLTabNote#</a></B>&nbsp;</td>
								<td ALIGN="right" VALIGN="top"><IMG SRC="../images/corner_tr3.gif" WIDTH="4" HEIGHT="4" ALT="" BORDER="0"></td>
							</tr>
						</table>					
					</td>
					<td>
						<TABLE valign="top" id=Tab7Table BORDER="0" CELLSPACING="0" CELLPADDING="0" CLASS="TabTable" HEIGHT="20" style="background-color: ##336699;font-family: Tahoma; font-size: 10px;">
							<tr>
								<td ALIGN="right" VALIGN="top"><IMG SRC="../images/corner_tl3.gif" WIDTH="4" HEIGHT="4" ALT="" BORDER="0"></td>
								<td>&nbsp;<B><a HREF="##" NAME="Tab7Label" CLASS="Tab" style="color:white; font:11" ONCLICK="ShowDiv('Tab7',this,document.all.Tab7Table)">#strLBLTabHistory#</a></B>&nbsp;</td>
								<td ALIGN="right" VALIGN="top"><IMG SRC="../images/corner_tr3.gif" WIDTH="4" HEIGHT="4" ALT="" BORDER="0"></td>
							</tr>
						</table>					
					</td>
				</TR>
			</TABLE>
		</td>
		<td width="5%"></td>
	</tr>
	<tr>
	    <td width="5%"></td>
		<td width="90%" height="100%">
			<!-- End Tabs -->
			<TABLE align="left" WIDTH="100%" BORDER="1" CELLSPACING="0" CELLPADDING="4" BORDERCOLOR="##1F1FC3" BORDERCOLORLIGHT="##408080" BORDERCOLORDARK="##408080" BGCOLOR="##C0C0C0" style="font-family: Tahoma; font-size: 12px;" height="100%">
				<tr>
					<td>
						<!-- Ingredient DIV-->
						<div id="Tab1" style="display:inline;">
							<table width="100%" border="0" cellpadding="1" cellspacing="1" height="100%">
								<tr height="90%">
						 			<td colspan="4"><iframe src="drugingredient.cfm?drug_id=#DrugID#" name="Tab1Frame" scrolling="Yes" align="LEFT" width="100%" height="100%" id="Tab1Frame" frameborder="Yes" allowtransparency="true"></iframe></td>
								</tr>
								<tr>
									<td><b>#strLBLIngredient#</b></td>
									<td><b>#strLBLType#</b></td>
									<td><b>#strLBLSchedule#</b></td>
								</tr>
								<tr height="10%">
									<td><input #strProtect# type="text" name="ingredient_name" maxlength="240" onBlur="OpenFindIngredient();">
									    <input type="hidden" name="ingredient_id"></TD>
									<td><select #strProtect# name="ingredient_type_id" style="font:8pt; width=150px;">									    
									    </cfoutput>
					                    <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
                      					<cfprocparam type="in" dbvarname="listid" value="33" cfsqltype="cf_sql_integer">
                      					<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
                      					<cfprocresult name="drop_down_list">
                      					</cfstoredproc>
                      					<cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#">#drop_down_list.DDL_Desc#</option></cfoutput>						  
										<cfoutput>
		   								</select></TD>
									<td><select #strProtect# name="schedule_type_id" style="font:8pt; width=150px;">									    
									    </cfoutput>
					                    <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
                      					<cfprocparam type="in" dbvarname="listid" value="34" cfsqltype="cf_sql_integer">
                      					<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
                      					<cfprocresult name="drop_down_list">
                      					</cfstoredproc>
                      					<cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#">#drop_down_list.DDL_Desc#</option></cfoutput>						  
										<cfoutput>
		   								</select></TD>
									<td align="center" ><cfif session.drug_role gt 1><input type="button" value="#strLbLAddModify#" class="button" onclick="return SubmitForm_Ingredient()"></cfif></td>
								</tr>
							</table>
						</div>
						<!-- Dosages DIV -->
						<div id="Tab2" style="display:none;">
							<table width="100%" border="0" cellpadding="1" cellspacing="1" height="100%">
								<tr height="80%">
						 			<td colspan="7"><iframe src="drugdosage.cfm?drug_id=#DrugID#" name="Tab2Frame" scrolling="Yes" align="LEFT" width="100%" height="100%" id="Tab2Frame" frameborder="Yes" allowtransparency="true"></iframe></td>
								</tr>
								<tr>
									<td width="20%">#strLBLRoute#</td>								    
									<td width="10%"><b>#strLBLQuantity#</b></td>
									<td width="20%">#strLBLForm#</td>
									<td width="10%">#strLBLQuantity#</td>
									<td width="20%">#strLBLFrequency#</td>
									<td width="20%">#strLBLSpecies# / #strLBLBreed#</td>
									<td>&nbsp;</td>
								</tr>	
								<tr valign="TOP" height="10%">
									<td width="20%"><select #strProtect# name="route_id" style="font:8pt; width:100px;">	
									    <option></option>								    
									    </cfoutput>
					                    <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
                      					<cfprocparam type="in" dbvarname="listid" value="4" cfsqltype="cf_sql_integer">
                      					<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
                      					<cfprocresult name="drop_down_list">
                      					</cfstoredproc>
                      					<cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#">#drop_down_list.DDL_Desc#</option></cfoutput>						  
										<cfoutput>
		   								</select></TD>
									<td width="10%"><input style="font:8pt;" type="Text" name="quantity" align="RIGHT" size="3" maxlength="10" #strprotect# onblur="isNumber(this,9999);"></td>
									<td width="20%"><select #strProtect# name="form_id" style="font:8pt; width:100px;">	
									    <option></option>								    
									    </cfoutput>
					                    <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
                      					<cfprocparam type="in" dbvarname="listid" value="9" cfsqltype="cf_sql_integer">
                      					<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
                      					<cfprocresult name="drop_down_list">
                      					</cfstoredproc>
                      					<cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#">#drop_down_list.DDL_Desc#</option></cfoutput>						  
										<cfoutput>
		   								</select></TD>
									<td width="10%"><input style="font:8pt;" type="Text" name="frequency_quantity" align="RIGHT" size="3" maxlength="10" #strprotect# onblur="isNumber(this,9999);"></td>
									<td width="20%"><select #strProtect# name="frequency_id" style="font:8pt; width:100px;">									    
									    <option></option>								    
									    </cfoutput>
					                    <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
                      					<cfprocparam type="in" dbvarname="listid" value="10" cfsqltype="cf_sql_integer">
                      					<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
                      					<cfprocresult name="drop_down_list">
                      					</cfstoredproc>
                      					<cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#">#drop_down_list.DDL_Desc#</option></cfoutput>						  
										<cfoutput>
		   								</select></TD>
									<td width="20%"><select #strProtect# name="species_id" style="font:8pt; width:100px;" onChange="LoadBreed(document.frmdrug.species_id.options[document.frmdrug.species_id.selectedIndex].value);">									    
									    <option></option>								    
									    </cfoutput>
					                    <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
                      					<cfprocparam type="in" dbvarname="listid" value="12" cfsqltype="cf_sql_integer">
                      					<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
                      					<cfprocresult name="drop_down_list">
                      					</cfstoredproc>
                      					<cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#">#drop_down_list.DDL_Desc#</option></cfoutput>						  
										<cfoutput>
		   								</select></td>
									<td align="center"><cfif session.drug_role gt 1><input type="button" value="#strLbLAddModify#" class="button" onclick="return SubmitForm_Dosages()"></cfif></td>
								</tr>
								<tr>
									<td>#strLBLIndication#</td>
									<td colspan="4"><input style="font:8pt;" type="Text" name="indication" size="57" maxlength="240" #strprotect# ></td>
									<td><select #strProtect# name="breed_id" style="font:8pt;width:100px;">									    
									    <option></option>								    
		   								</select></TD>									
								</tr>
							</table>
						</div>
						<!-- Risks DIV -->
						<div id="Tab5" style="display:none;">
							<table width="100%" border="0" cellpadding="1" cellspacing="1" height="100%">
								<tr height="80%">
						 			<td colspan="3"><iframe src="drugrisks.cfm?drug_id=#DrugID#" name="Tab5Frame" scrolling="Yes" align="LEFT" width="100%" height="100%" id="Tab5Frame" frameborder="Yes" allowtransparency="true"></iframe></td>
								</tr>
								<tr>
									<td><b>#strLBLRiskType#</b></td>
									<td><b>#strLBLRiskDesc#</b></td>
									<td></td>
								</tr>
								<tr height="20%">
									<td><select #strProtect# name="risk_type_id" style="font:8pt; width=200px;">									    
									    </cfoutput>
					                    <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
                      					<cfprocparam type="in" dbvarname="listid" value="6" cfsqltype="cf_sql_integer">
                      					<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
                      					<cfprocresult name="drop_down_list">
                      					</cfstoredproc>
                      					<cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#">#drop_down_list.DDL_Desc#</option></cfoutput>						  
										<cfoutput>
		   								</select></TD>
									<td><textarea #strProtect# cols="30" rows="3" name="risk_description" style="font:8pt" onKeyDown="textCounter(document.frmdrug.risk_description,3990)" onKeyUp="textCounter(document.frmdrug.risk_description,3990)"></textarea></TD>
									<td align="center" ><cfif session.drug_role gt 1><input type="button" value="#strLbLAddModify#" class="button" onclick="return SubmitForm_Risks()"></cfif></td>
								</tr>
							</table>
						</div>
						<!-- Notes DIV -->
						<div id="Tab6" style="display:none;">
							<table width="100%" border="0" cellpadding="1" cellspacing="1" height="100%">
								<tr height="80%">
						 			<td colspan="3"><iframe src="drugnote.cfm?drug_id=#DrugID#" name="Tab6Frame" scrolling="Yes" align="LEFT" width="100%" height="100%" id="Tab6Frame" frameborder="Yes" allowtransparency="true"></iframe></td>
								</tr>
								<tr>
									<td><b>#strLBLNotesType#</b><br>
									    <b>#strLBLNotesSeverity#</b></td>
									<td><b>#strLBLNotesDesc#</b></td>
									<td></td>
								</tr>
								<tr height="20%">
									<td><select #strProtect# name="notes_type_id" style="font:8pt; width=200px;">									    
									    </cfoutput>
					                    <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
                      					<cfprocparam type="in" dbvarname="listid" value="7" cfsqltype="cf_sql_integer">
                      					<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
                      					<cfprocresult name="drop_down_list">
                      					</cfstoredproc>
                      					<cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#">#drop_down_list.DDL_Desc#</option></cfoutput>						  
										<cfoutput>
		   								</select><br>
									    <select #strProtect# name="notes_severity_type_id" style="font:8pt; width=200px;">									    
									    </cfoutput>
					                    <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
                      					<cfprocparam type="in" dbvarname="listid" value="8" cfsqltype="cf_sql_integer">
                      					<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
                      					<cfprocresult name="drop_down_list">
                      					</cfstoredproc>
                      					<cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#">#drop_down_list.DDL_Desc#</option></cfoutput>						  
										<cfoutput>
		   								</select></TD>
									<td><textarea #strProtect# cols="30" rows="3" name="notes_description" style="font:8pt" onKeyDown="textCounter(document.frmdrug.notes_description,3990)" onKeyUp="textCounter(document.frmdrug.notes_description,3990)"></textarea></TD>
									<td align="center" ><cfif session.drug_role gt 1><input type="button" value="#strLbLAddModify#" class="button" onclick="return SubmitForm_Notes()"></cfif></td>
								</tr>
							</table>
						</div>
						<!-- History DIV -->
						<div id="Tab7" style="display:none;">
							<table width="100%" border="0" cellpadding="1" cellspacing="1" height="100%">
								<tr height="90%">
						 			<td><iframe width="100%" height="100%" name="Tab7Frame" id="Tab7Frame" ALLOWTRANSPARENCY="true" src="drughistory.cfm?drug_id=0" align="left" frameborder="1" scrolling="yes"></iframe></td>
								</tr>
								<tr height="10%">
									<td align="right"><input class="button" type="Button" name="Retrieve" value="#strLBLRetrieve#" onClick="Tab7Frame.location='drughistory.cfm?drug_id=#DrugID#';"></td>
								</tr>
							</table>	
						</div>
					</td>
				</tr>
			</table>		
		</td>
		<td width="5%"></td>
	</tr>
	<tr valign="top">
	    <td width="5%"></td>
		<td width="90%">
			<table align="left" width="100%" cellspacing="0" cellpadding="0" border="0" height="20">
				<br>
				<td align="right">
			    <cfif Operation is "new_drug">
  					<input type="hidden" name="Operation" value="Add">
				<cfelse>
  					<input type="hidden" name="Operation" value="Save">
				</cfif>
				<select style="visibility:hidden" name="breedlist">
			    </cfoutput>
				<cfif Operation is "edit_drug">										
                <cfstoredproc procedure="pkg_select.ap_select_dropdownlist"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
				<cfprocparam type="in" dbvarname="listid" value="13" cfsqltype="cf_sql_integer">
				<cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
				<cfprocresult name="drop_down_list">
				</cfstoredproc>
				<cfoutput query="drop_down_list"><option value="#drop_down_list.DDL_Value#">#drop_down_list.DDL_Desc#</option></cfoutput>						  
				</cfif>
				<cfoutput>
				</select>
				<input type="hidden" name="drug_id" value="#DrugID#">
				<iframe width="0" height="0" name="DRUGFrame" id="DRUGFrame" src="drugprocess.cfm?Operation=none" style="visibility:hidden;"></iframe>
				<cfif Operation is not "new_drug">
					<input type="button" class="button" name="printbutton" value="#strLBLPrintButton#" onClick="parent.openReport('drugreport.cfm?drug_id=#DrugID#','wName','700','400');">
  				  	&nbsp;&nbsp;
				</cfif>
				<cfif (strProtect is not "disabled") and session.drug_role is 4>					
					<input class="button" type="button" name="deletebutton" value="#strLBLDeleteButton#" <cfif Operation is "new_drug">style="visibility:hidden;"</cfif> onClick="return DoDelete();">
  				  	&nbsp;&nbsp;
				</cfif>
				<cfif strProtect is not "disabled">
				  	<input class="button" type="button" name="ok" value="#strLBLDrugButton#" onClick="if (Validate()) {SubmitDRUG(document.frmdrug.Operation.value,'');};">
				</cfif>
				</td>
			</table>
		</td>
		<td width="5%"></td>
	</tr>
	<tr valign="top" height="100%">
	    <td width="5%"></td>
		<td width="90%"></td>
		<td width="5%"></td>
	</tr>
</table>
</cfoutput>
</form>
<script language="JavaScript">
  if (window.frmdrug + "" != "undefined") {
    if (window.frmdrug.drug_brand_name + "" != "undefined")
      if (window.frmdrug.drug_brand_name.disabled == false)
        window.frmdrug.drug_brand_name.focus();
    if (screen.width >= 1024)
      {
	    if (window.frmdrug.risk_description + "" != "undefined")
          window.frmdrug.risk_description.cols = 50;
	    if (window.frmdrug.notes_description + "" != "undefined")
  	      window.frmdrug.notes_description.cols = 50;
	  }
  }	  
</script>
<cfelseif operation is "security">
   You do not have the security privelege to add a new drug.
<cfelseif operation is "delete">
  <cfstoredproc procedure="pkg_drug.ap_delete_drug"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
  <cfprocparam type="in" dbvarname="drugid" value="#DrugID#" cfsqltype="cf_sql_integer">
  <cfprocparam type="out" dbvarname="rc" variable="rc" cfsqltype="cf_sql_integer">
  </cfstoredproc>
  <cfoutput>
  <cfif rc is 0>
    <script language=javascript>
	  alert('#strAlertKeyRef#');
	</script>
  <cfelse>
    <script language="JavaScript">
	  parent.window.location.reload();
    </script>
  </cfif>
  </cfoutput>
</cfif>
</body>
</html>
