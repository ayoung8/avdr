<cfset session.currenttable=TID>
<cfset session.usesdate=Dates>
<cfset tableid=TID>
<cfset strTable=TName>
<cfset strDates=Dates>
<cfoutput>
<script language="JavaScript">
  <cfif session.admin_role is 0>
    parent.window.location = '../welcome.cfm';
  </cfif>
  
  function DoClear()
  {
	  window.table.txt_code.value='';
  	  window.table.txt_english_desc.value='';
	  window.table.txt_french_desc.value='';
	  <cfif strDates is 1 >
	    window.table.txt_start_date.value='1900.01.01';
	    window.table.txt_end_date.value='';
	  </cfif>
	  <cfif tableid is 3>
	    window.table.txt_other.value='';
	  <cfelseif tableid is 16>
	    window.table.txt_other.value='0';	
	  <cfelseif tableid is 26>
	    window.table.txt_other.value='1';	
	  </cfif>
	  window.table.add_or_update.value='add';
      window.table.txt_english_desc.focus();	
   }
</script>
</cfoutput>
<html lang="EN">
<head>
<meta name="keywords" content="">
<title></title>
<!--#set var="ua" value="$HTTP_USER_AGENT" -->
<!--#if expr="$ua = /.*MSIE/" -->
<link href="../css//clf1_ie.css" rel="STYLESHEET" type="text/css"><!--#else -->
<link href="../css//clf1_ns.css" rel="STYLESHEET" type="text/css"><!--#endif -->
<!-- Note to coders: If server does not support Extended SSI, remove the above 4 lines and use only the link to the clf1_ns.css stylesheet. -->

</head>
<SCRIPT LANGUAGE="JavaScript" SRC="../includes/JavaScript/common.js"></SCRIPT>
<cfoutput>
<script language="JavaScript">
function validate(formname)
{
	if (trim(formname.txt_english_desc.value)=="")
	{
		alert('#strAlertEnglishDescription#');
		formname.txt_english_desc.focus();
		return false;
	}
	if (trim(formname.txt_french_desc.value)=="")
	{
		alert('#strAlertFrenchDescription#');
		formname.txt_french_desc.focus();
		return false;
	}	
	<cfif strDates is 1>
	if (trim(formname.txt_start_date.value)=="")
	{
		alert('#strAlertStartDate#');
		formname.txt_start_date.focus();
		return false;
	}
	if (trim(formname.txt_end_date.value)!="")
	{
	  if (formname.txt_start_date.value > formname.txt_end_date.value){
		alert('#strAlertValidRange#');
		formname.txt_start_date.focus();
		formname.txt_start_date.select();
		return false;
	  }
	}
	</cfif>
	<cfif tableid is 3>
	if (trim(formname.txt_other.value)=="")
	{
		alert('#strAlertSpecies#');
		formname.txt_other.focus();
		return false;
	}
	</cfif>
	return true;
}

function SubmitForm(formname)
{
	if (formname.Operation.value == 'Add/Modify')
	{
		formname.target="table_list";
		formname.action="table_iframe.cfm";
	} 
}
</script>
</cfoutput>
<SCRIPT LANGUAGE="JavaScript" SRC="../includes/WEBCode/AnchorPosition.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript" SRC="../includes/WEBCode/PopupWindow.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript" SRC="../includes/WEBCode/date.js"></SCRIPT>
<cfinclude template="../includes/WEBCode/CalendarPopup.cfm">
<SCRIPT LANGUAGE="JavaScript"> 
var cal1 = new CalendarPopup();
</SCRIPT>
<body background="../Images/background2.gif">
<table width="100%" border="0" cellspacing="0" cellpadding="0" background="../Images/background2.gif" height="100%">
  <tr>
    <td width="100%" valign="TOP" align="center" height="100%"><br>
      <cfif (NOT IsDefined("Operation"))>
	    <cfset Operation="">
	  </cfif>
	  <cfif Operation is "">
      <form method='POST' name='table' onsubmit="return SubmitForm(this);">
  	  <table  align="center" width="90%" cellspacing="0" cellpadding="0" border="4" height="90%">
	    <tr bgcolor="#408080">
		  <td VALIGN="top" ALIGN="left"><IMG SRC="../Images/corner_tl2.gif" WIDTH="4" HEIGHT="4" ALT="" BORDER="0"></td>
		  <cfoutput>
		  <td  height="20" align="center" width="25%"><font size="3" color="F8CC30"><b>#strTable#</b></font></td>
          </cfoutput>
		  <td VALIGN="top" ALIGN="right"><IMG SRC="../Images/corner_tr2.gif" WIDTH="4" HEIGHT="4" ALT="" BORDER="0"></td>
		</tr>
		<tr valign="top">
		  <td colspan="3">
		    <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="#408080" bgcolor="c0c0c0" height="100%">
   			  <tr>
				<td align="center" valign="top">
				  <table align="left" width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#C0C0C0" height="100%">
					<tr>
				  	  <td colspan="6" height="100%">
					    <table width="100%" id="POINFO" BORDER="0" CELLSPACING="0" CELLPADDING="0" height="100%">
						  <td>
							<iframe width="100%" height="100%" name="table_list" id="table_list" ALLOWTRANSPARENCY="true" src="../sub_tables/table_iframe.cfm" align="left" frameborder="1" marginheight="0" marginwidth="0"></iframe>
						  </td>
						</table>
					  </td>
					</tr>
					<tr>
					  <td colspan="6" height="15">
						<table align="left" width="100%" border="6" cellspacing="2" cellpadding="1" bgcolor="#C0C0C0"> 
						  <tr>
						    <cfoutput>
							<td width="4%" style="font:10"><b>#strLBLCode#</b></td>
							<td width="38%" style="font:10"><b>#strLBLEnglishDescription#</b></td>
							<td width="38%" style="font:10"><b>#strLBLFrenchDescription#</b></td>
						    <cfif strDates is 1>
	  					      <td width="10%" style="font:10"><b>#strLBLStartDate#</b></td>
							  <td width="10%" style="font:10">#strLBLEndDate#</td>
					        </cfif>
							<cfif tableid is 3>
							  <td width="10%" style="font:10"><b>#strLBLSpecies#</b></td>
							<cfelseif tableid is 16>
							  <td width="10%" style="font:10"><b>#strLBLFoodFlag#</b></td>							
							<cfelseif tableid is 26>
							  <td width="10%" style="font:10"><b>#strLBLPersonFlag#</b></td>							
							</cfif>
                            </cfoutput>
						  </tr>
						  <tr>
							<td><input type="text" size="4%" name="txt_code" style="font:9px; background-color:c0c0c0" readonly></td>
						    <cfif strDates is 1>
							  <td><input type="text" size="36%" name="txt_english_desc"  maxlength="240" style="font:9px"></td>
							  <td><input type="Text" size="36%" name="txt_french_desc"  style="font:9px" maxlength="240"></td>
  							  <td><input type="Text" size="12%" name="txt_start_date" value="1900.01.01" style="font:9px"  maxlength="10" onblur="javascript:ValidDate(trim(document.table.txt_start_date.value),document.table.txt_start_date);"><A HREF="#" onClick="cal1.select(document.table.txt_start_date,'anchor1','yyyy.MM.dd'); return false;" NAME="anchor1" ID="anchor1"><img src="../images/Calendar.gif" width="21" height="21" border="0" hspace="0" vspace="0" align="absmiddle"></A></td>
							  <td><input type="Text" size="12%" name="txt_end_date" style="font:9px" maxlength="10" onblur="javascript:ValidDate(trim(document.table.txt_end_date.value),document.table.txt_end_date);"><A HREF="#" onClick="cal1.select(document.table.txt_end_date,'anchor2','yyyy.MM.dd'); return false;" NAME="anchor2" ID="anchor2"><img src="../images/Calendar.gif" width="21" height="21" border="0" hspace="0" vspace="0" align="absmiddle"></A></td>
							<cfelseif tableid is 3>
							  <td><input type="text" name="txt_english_desc" size="43%" maxlength="240" style="font:9px"></td>
							  <td><input type="Text" name="txt_french_desc" size="43%" style="font:9px" maxlength="240"></td>
							  <cfquery datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#" name="species">
							    select species_id as id,decode(#session.language#,1,species_desc_eng,species_desc_fr) as description
								from species
							  </cfquery>
						      <td><select name="txt_other" style="width: 75pt;"><cfoutput query="species"><option value="#species.id#">#species.description#</option></cfoutput></select></td>
							<cfelseif tableid is 16>  
							  <td><input type="text" name="txt_english_desc" size="43%" maxlength="240" style="font:9px"></td>
							  <td><input type="Text" name="txt_french_desc" size="43%" style="font:9px" maxlength="240"></td>
							  <cfoutput>
							    <td><select name="txt_other" id="txt_other"><option value="1">#strLBLYes#</option><option value="0">#strLBLNo#</option></select></td>
                              </cfoutput>
							<cfelseif tableid is 26>  
							  <td><input type="text" name="txt_english_desc" size="43%" maxlength="240" style="font:9px"></td>
							  <td><input type="Text" name="txt_french_desc" size="43%" style="font:9px" maxlength="240"></td>
							  <cfoutput>
							    <td><select name="txt_other" id="txt_other"><option value="1">#strLBLYes#</option><option value="0">#strLBLNo#</option></select></td>
                              </cfoutput>
							<cfelse>
							  <td><input type="text" name="txt_english_desc" size="48%" maxlength="240" style="font:9px"></td>
							  <td><input type="Text" name="txt_french_desc" size="48%" style="font:9px" maxlength="240"></td>
                            </cfif>
						  </tr>
						</table>
					  </td>
					</tr> 
				    <tr>
					  <td colspan="6" align="right" valign="center" height="30">
						<input type="hidden" name="stop" value="0">
						<input type="hidden" name="add_or_update" value="add">
						<input type="hidden" name="Operation" value="Add/Modify">
						<cfoutput>
						<input class="button" height="10" type="button" name="Clear" value="#strLBLCancel#" onclick="DoClear();">
						<input class="button" height="10" type="submit" name="Add/Modify" value="#strLBLAddModify#" onclick="return validate(table); ">
                        </cfoutput>
					  </td>
					</tr>
				  </table>
				</td>
			  </tr>
			</table>
		  </td>
		</tr>
	  </table>	
      </cfif>	
    </td>
  </tr>
</table>
</body>
</html>
