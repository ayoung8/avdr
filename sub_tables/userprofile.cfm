<cfif Not IsDefined("user_id")>
  <cfset user_id = session.userid>
</cfif>
<cfif user_id is "">
  <cfset user_id = session.userid>
</cfif>
<cfif Not IsDefined("Operation")>
  <cfset Operation="edit_profile">
</cfif>
<cfIf session.admin_role is 0>
  <cfset Operation="edit_profile">
</cfif>
<html lang="EN">
<head>
<meta name="keywords" content="">
<title></title>
<!--#set var="ua" value="$HTTP_USER_AGENT" -->
<!--#if expr="$ua = /.*MSIE/" -->
<link href="css/clf1_ie.css" rel="STYLESHEET" type="text/css"><!--#else -->
<link href="css/clf1_ns.css" rel="STYLESHEET" type="text/css"><!--#endif -->
</head>
<SCRIPT LANGUAGE="JavaScript" SRC="../includes/JavaScript/common.js"></SCRIPT>
<cfoutput>
<script language="JavaScript">
function validate(formname,useridvalidate)
{
	if (trim(formname.user_id.value) == '')
	{
		alert("#strLBLErrUserID#");
		formname.user_id.focus();
		return false;
	};
	if (trim(formname.username.value) == '')
	  {
		alert("#strLBLErrUserName#");
		formname.username.focus();
		return false;
	  } ;
	if (useridvalidate == 1)
	{
	  	separator=',';
	  	separator=',';
		My_string=formname.user_ids.value;
		My_array=My_string.split(separator);
	 	for (i=0; i < My_array.length; i++)
		{ 
			if(My_array[i]==formname.user_id.value.toUpperCase())
			{
				alert("#strLBLErrUserIDInUse#");
				formname.user_id.select();
				return false;
			}
		}
	};
	<cfif operation is "edit_profile">
	if(trim(formname.new_password.value)!='')
	{
		if (isNaN(formname.new_password.value.substring(0,1))!=true)
		{
			alert("#strLBLErrLetter#");
			formname.new_password.select();
			return false;
		}
		if (trim(formname.confirm_password.value)=='')
		{
			alert("#strLBLErrConfirm#");
			formname.confirm_password.focus();
			return false;
		}
		
		 if(formname.new_password.value.toUpperCase()!=formname.confirm_password.value.toUpperCase())
		{
			alert("#strLBLErrDoNotMatch#");
			formname.new_password.value='';
			formname.confirm_password.value='';
			formname.new_password.focus();
			return false;
		}
		if(trim(formname.new_password.value).length <6)
		{
			alert("#strLBLErrToShort#");
			formname.new_password.value='';
			formname.confirm_password.value='';
			formname.new_password.focus();
			return false;
		}
		if(formname.old_password.value.toUpperCase()!='#Ucase(Session.password)#')
		{
			alert("#strLBLOldWrong#");
			formname.old_password.value='';
			formname.old_password.focus();
			return false;
		} 
	}
	</cfif>
	return true;
}

function DoDelete()
{
  input_box=confirm('#strLBLConfirmDeleteUser#'); 
  if(input_box==true)
  {
    document.edit_user.Operation.value='deleteuser';
	return true;
  }
  else
  {
    return false;
  }
}
</script>
</cfoutput>
<body background="../images/background2.gif">
<cfif Operation is "new_user">
  <cfstoredproc procedure="pkg_select.ap_select_user"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
  <cfprocparam type="in" dbvarname="userid" value="" cfsqltype="cf_sql_varchar">
  <cfprocresult name="rsUserExists">
  </cfstoredproc>
  <cfoutput>
<form name="new_user" action="#SCRIPT_NAME#" method="post">
<table align="center" width="90%" cellspacing="0" cellpadding="0" border="4" height="20">
	<tr bgcolor="##408080">
	    <td VALIGN="top" ALIGN="left"><IMG SRC="Images/corner_tl2.gif" WIDTH="4" HEIGHT="4" ALT="" BORDER="0"></td>
	    <td  height="20" align="center" width="25%"><font size="3" color="##F8CC30"><b>#strLBLNewUser#</b></font></td>
		<td VALIGN="top" ALIGN="right"><IMG SRC="Images/corner_tr2.gif" WIDTH="4" HEIGHT="4" ALT="" BORDER="0"></td>
	</tr>
	<tr>
		<td colspan = "3">
			<table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="##408080">
				<tr>
					<td bgcolor="c0c0c0">
						<table cellspacing="1" cellpadding="2" border="0" bgcolor="c0c0c0">
							<tr>
								<td width="30%"  style="font:13"><b>#strLBLUserID#</b></td>
								<td><input type="Text" name="user_id" style="width=295px" maxlength="30"></td>
							</tr>							
							<tr>
								<td width="30%"  style="font:13"><b>#strLBLUserName#</b></td>
								<td><input type="Text" name="username" style="width=295px" maxlength="20"></td>
							</tr>	
							<tr>
								<td style="font:13"><b>#strLBLPreferedLanguage#</b></td>
								<td style="font:13"><b>
									<input type="radio" name="Language" value="E" CHECKED>in English
									<input type="radio" name="Language" value="F" >en français
								</b>
								</td>
							</tr>
							<tr>
								<td style="font:13"><b>#strLBLDrugRole#</b></td>
								<td><select name="drug_role" style="width=195px;">
										<cfif session.language is 1>
 										  <option value="0">None</option>
 										  <option value="1">View</option>
										  <option value="2">Update</option>
										  <option value="3">Add/Update</option>
										  <option value="4">Add/Update/Delete</option>
										<cfelse>
 										  <option value="0">Aucun</option>
 										  <option value="1">Visualiser</option>
										  <option value="2">Mise à jour</option>
										  <option value="3">Ajouter / Mise à jour</option>
										  <option value="4">Ajouter / Mise à jour / Supprimer</option>
										</cfif>
									</select></td>
							</tr>					
							<tr>
								<td style="font:13"><b>#strLBLAdverseRole#</b></td>
								<td><select name="adverse_role" style="width=195px;">
										<cfif session.language is 1>
 										  <option value="0">None</option>
 										  <option value="1">View</option>
										  <option value="2">Update</option>
										  <option value="3">Add/Update</option>
										  <option value="4">Add/Update/Delete</option>
										<cfelse>
 										  <option value="0">Aucun</option>
 										  <option value="1">Visualiser</option>
										  <option value="2">Mise à jour</option>
										  <option value="3">Ajouter / Mise à jour</option>
										  <option value="4">Ajouter / Mise à jour / Supprimer</option>
										</cfif>
									</select></td>
							</tr>					
							<tr>
								<td style="font:13"><b>#strLBLEvaluatorRole#</b></td>
								<td><input  type="Checkbox" name="evaluator_role" value="0"
 								     onClick="if (document.new_user.evaluator_role.checked == true) { document.new_user.evaluator_role.value='1';} else {document.new_user.evaluator_role.value='0';};"></td>
							</tr>
							<tr>
								<td style="font:13"><b>#strLBLReportRole#</b></td>
								<td><input  type="Checkbox" name="report_role" value="0"
 								     onClick="if (document.new_user.report_role.checked == true) { document.new_user.report_role.value='1';} else {document.new_user.report_role.value='0';};"></td>
							</tr>
							<tr>
								<td style="font:13"><b>#strLBLAdminRole#</b></td>
								<td><input  type="Checkbox" name="admin_role" value="0"
  								     onClick="if (document.new_user.admin_role.checked == true) { document.new_user.admin_role.value='1';} else {document.new_user.admin_role.value='0';};"></td>
							</tr>
						</table>						
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<table align="center" width="90%" cellspacing="0" cellpadding="0" border="0" height="20">
		<td align="right">
			<input type="hidden" name="Operation" value="add">
			<input class="button" type="submit" name="ok" value="#strLBLAdd#" onclick="return validate(new_user,1);">
		</td>																	
</table>
</cfoutput>
<cfset user_ids="">
<cfoutput query="rsUserExists">
  <cfset user_ids=user_ids & "," & trim(rsUserExists.user_id)>
</cfoutput>
<cfoutput>
	<input type="hidden" name="user_ids" value="#Ucase(user_ids)#">
</cfoutput>
</form>
<script language="JavaScript">
document.new_user.user_id.focus();
</script>
<cfelseif operation is "edit_user" or operation is "edit_profile">
  <cfstoredproc procedure="pkg_select.ap_select_user_detail"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
  <cfprocparam type="in" dbvarname="userid" value="#user_id#" cfsqltype="cf_sql_varchar">
  <cfprocresult name="rs_get_user">
  </cfstoredproc>
  <cfoutput query="rs_get_user">
<form name="edit_user" action="#SCRIPT_NAME#" method="post">
<cfif operation is "edit_user">
  <table align="center" width="90%" cellspacing="0" cellpadding="0" border="4" valign="top">
	<tr bgcolor="##408080">
	    <td VALIGN="top" ALIGN="left"><IMG SRC="..Images/corner_tl2.gif" WIDTH="4" HEIGHT="4" ALT="" BORDER="0"></td>
        <td  height="20" align="center" width="25%"><font size="3" color="##F8CC30"><b>#rs_get_user.user_name#</b></font></td>
		<td VALIGN="top" ALIGN="right"><IMG SRC="..Images/corner_tr2.gif" WIDTH="4" HEIGHT="4" ALT="" BORDER="0"></td>
	</tr>
<cfelse>
  <table align="center" width="90%" cellspacing="0" cellpadding="0" border="0" valign="top">	
</cfif>
	<tr>
		<td colspan="3" valign="top">
			<table width="100%" border="1" cellspacing="0" cellpadding="0" valign="TOP" bordercolor="##408080">
				<tr>
					<td bgcolor="c0c0c0">
						<table cellspacing="1" cellpadding="2" border="0" bgcolor="c0c0c0">
							<tr>
								<td width="30%"  style="font:13"><b>#strLBLUserID#</b></td>
								<td><input type="Text" name="user_id" style="width=295px" style="width=195px" value="#rs_get_user.user_id#" readonly style='background-color:c0c0c0' maxlength="30" ></td>
							</tr>							
							<tr>
								<td width="30%"  style="font:13"><b>#strLBLUserName#</b></td>
								<td><input type="Text" name="username" style="width=295px" value="#rs_get_user.user_name#" maxlength="20"></td>
							</tr>	
							<tr>
								<td style="font:13"><b>#strLBLPreferedLanguage#</b></td>
								<td style="font:13">
									<input type="radio" name="Language" value="E" <cfif rs_get_user.PREFERRED_LANGUAGE is "E"> Checked </cfif>>in English
									<input type="radio" name="Language" value="F" <cfif rs_get_user.preferred_language is "F"> Checked </cfif>>en français
								</td>
							</tr>
							<tr><td colspan="2"><br></td></tr>
							<tr><td colspan="2" align="center" style="border-bottom: solid ##FFCC33 1px"><i>#strLBLSecurity#</i></td></tr>
							<tr>
								<td style="font:13"><b>#strLBLDrugRole#</b></td>
								<td><select name="drug_role" style="width=195px;" <cfif operation is "edit_profile"> disabled </cfif>>
										<cfif session.language is 1>
 										  <option value="0" <cfif rs_get_user.drug_role is 0> selected </cfif>>None</option>
 										  <option value="1" <cfif rs_get_user.drug_role is 1> selected </cfif>>View</option>
										  <option value="2" <cfif rs_get_user.drug_role is 2> selected </cfif>>Update</option>
										  <option value="3" <cfif rs_get_user.drug_role is 3> selected </cfif>>Add/Update</option>
										  <option value="4" <cfif rs_get_user.drug_role is 4> selected </cfif>>Add/Update/Delete</option>
										<cfelse>
 										  <option value="0" <cfif rs_get_user.drug_role is 0> selected </cfif>>Aucun</option>
 										  <option value="1" <cfif rs_get_user.drug_role is 1> selected </cfif>>Visualiser</option>
										  <option value="2" <cfif rs_get_user.drug_role is 2> selected </cfif>>Mise à jour</option>
										  <option value="3" <cfif rs_get_user.drug_role is 3> selected </cfif>>Ajouter / Mise à jour</option>
										  <option value="4" <cfif rs_get_user.drug_role is 4> selected </cfif>>Ajouter / Mise à jour / Supprimer</option>
										</cfif>
									</select></td>
							</tr>					
							<tr>
								<td style="font:13"><b>#strLBLAdverseRole#</b></td>
								<td><select name="adverse_role" style="width=195px;" <cfif operation is "edit_profile"> disabled </cfif>>
										<cfif session.language is 1>
 										  <option value="0" <cfif rs_get_user.adverse_role is 0> selected </cfif>>None</option>
 										  <option value="1" <cfif rs_get_user.adverse_role is 1> selected </cfif>>View</option>
										  <option value="2" <cfif rs_get_user.adverse_role is 2> selected </cfif>>Update</option>
										  <option value="3" <cfif rs_get_user.adverse_role is 3> selected </cfif>>Add/Update</option>
										  <option value="4" <cfif rs_get_user.adverse_role is 4> selected </cfif>>Add/Update/Delete</option>
										<cfelse>
 										  <option value="0" <cfif rs_get_user.adverse_role is 0> selected </cfif>>Aucun</option>
 										  <option value="1" <cfif rs_get_user.adverse_role is 1> selected </cfif>>Visualiser</option>
										  <option value="2" <cfif rs_get_user.adverse_role is 2> selected </cfif>>Mise à jour</option>
										  <option value="3" <cfif rs_get_user.adverse_role is 3> selected </cfif>>Ajouter / Mise à jour</option>
										  <option value="4" <cfif rs_get_user.adverse_role is 4> selected </cfif>>Ajouter / Mise à jour / Supprimer</option>
										</cfif>
									</select></td>
							</tr>					
							<tr>
								<td style="font:13"><b>#strLBLEvaluatorRole#</b></td>
								<td><input  type="Checkbox" name="evaluator_role" value="#rs_get_user.evaluator_role#" <cfif rs_Get_user.evaluator_role is 1>Checked</cfif>
									<cfif operation is "edit_profile">
									  disabled
                                      style='background-color:c0c0c0;'
									</cfif>
 								    onClick="if (document.edit_user.evaluator_role.checked == true) { document.edit_user.evaluator_role.value='1';} else {document.edit_user.evaluator_role.value='0';};"></td>
							</tr>
							<tr>
								<td style="font:13"><b>#strLBLReportRole#</b></td>
								<td><input  type="Checkbox" name="report_role" value="#rs_get_user.report_role#" <cfif rs_Get_user.report_role is 1>Checked</cfif>
									<cfif operation is "edit_profile">
									  disabled
                                      style='background-color:c0c0c0;'
									</cfif>
 								    onClick="if (document.edit_user.report_role.checked == true) { document.edit_user.report_role.value='1';} else {document.edit_user.report_role.value='0';};"></td>
							</tr>
							<tr>
								<td style="font:13"><b>#strLBLAdminRole#</b></td>
								<td><input  type="Checkbox" name="admin_role" value="#rs_get_user.admin_role#" <cfif rs_Get_user.admin_role is 1>Checked</cfif>
									<cfif operation is "edit_profile">
									  disabled
                                      style='background-color:c0c0c0;'
									</cfif>
 								    onClick="if (document.edit_user.admin_role.checked == true) { document.edit_user.admin_role.value='1';} else {document.edit_user.admin_role.value='0';};"></td>								
							</tr>
							<cfif operation is "edit_profile">
							<tr><td colspan="2"><br></td></tr>
							<tr><td colspan="2" align="center" style="border-bottom: solid ##FFCC33 1px"><i>#strLBLPasswordHdr#</i></td></tr>
							<tr>
								<td width="30%"  style="font:13"><b>#strLBLOldPassword#</b></td>
								<td><input type="password" name="old_password" maxlength="30" style="width=295px"></td>
							</tr>							
							<tr>
								<td width="30%"  style="font:13"><b>#strLBLNewPassword#</b></td>
								<td><input type="password" name="new_password" style="width=295px" style="width=195px"  maxlength="30" ></td>
							</tr>							
							<tr>
								<td width="30%"  style="font:13"><b>#strLBLRetypePassword#</b></td>
								<td><input type="password" name="confirm_password" style="width=295px" style="width=195px"  maxlength="30" ></td>
							</tr>		
							</cfif>					
						</table>						
					</td>
				</tr>
			</table>
		</td>
		<cfif operation is "edit_profile">
        <td width="38%" valign="top"><img src="../Images/side_color.jpg"><br>
  	    <input type="hidden" name="Operation" value="updateprofile">
		<input widhth="100%" class="button" type="submit" name="ok" value="#strLBLUpdate#" onclick="return validate(edit_user,0);">
		</td>
		</cfif>
	</tr>
</table>
<cfif operation is "edit_user">
<table align="center" width="90%" cellspacing="0" cellpadding="0" border="0" height="20">
		<td align="right">
  			<input type="hidden" name="Operation" value="updateuser">
	 	    <input class="button" type="submit" name="delete" value="#strLBLDelete#" onclick="return DoDelete();">
			&nbsp;
			<input class="button" type="submit" name="ok" value="#strLBLUpdate#" onclick="return validate(edit_user,0);">
		</td>
</table>
</cfif>
</form>
</cfoutput>
<cfelseif operation is "add" or operation is "updateuser">
  <cfIf Session.userid is not "">
    <cfstoredproc procedure="pkg_util.ap_upd_users"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
    <cfprocparam type="in" dbvarname="userid" value="#user_id#" cfsqltype="cf_sql_varchar">
    <cfprocparam type="in" dbvarname="username" value="#username#" cfsqltype="cf_sql_varchar">
    <cfprocparam type="in" dbvarname="language" value="#Language#" cfsqltype="cf_sql_varchar">
    <cfprocparam type="in" dbvarname="drugrole" value="#drug_role#" cfsqltype="cf_sql_integer">
    <cfprocparam type="in" dbvarname="adverserole" value="#adverse_role#" cfsqltype="cf_sql_integer">
	<cfif Not IsDefined("admin_role")>
      <cfprocparam type="in" dbvarname="adminrole" value="0" cfsqltype="cf_sql_integer">
	<cfelse>
      <cfprocparam type="in" dbvarname="adminrole" value="#admin_role#" cfsqltype="cf_sql_integer">
	</cfif>
	<cfif Not IsDefined("report_role")>
      <cfprocparam type="in" dbvarname="reportrole" value="0" cfsqltype="cf_sql_integer">
	<cfelse>
      <cfprocparam type="in" dbvarname="reportrole" value="#report_role#" cfsqltype="cf_sql_integer">
    </cfif>
	<cfif Not IsDefined("evaluator_role")>
      <cfprocparam type="in" dbvarname="evaluatorrole" value="0" cfsqltype="cf_sql_integer">
	<cfelse>
      <cfprocparam type="in" dbvarname="evaluatorrole" value="#evaluator_role#" cfsqltype="cf_sql_integer">
    </cfif>
    </cfstoredproc>
  </cfif>
<cfelseif operation is "updateprofile">
  <cfIf Session.userid is not "">
    <cfset password=Trim(UCASE(new_password))>
    <cfstoredproc procedure="pkg_util.ap_upd_profile"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
    <cfprocparam type="in" dbvarname="userid" value="#user_id#" cfsqltype="cf_sql_varchar">
    <cfprocparam type="in" dbvarname="username" value="#username#" cfsqltype="cf_sql_varchar">
    <cfprocparam type="in" dbvarname="language" value="#Language#" cfsqltype="cf_sql_varchar">
    </cfstoredproc>
    <cfif password is not "">
	  <cfquery datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
	    alter user #user_id# identified by #password#
	  </cfquery>
	  <cfset session.password = password>
   </cfif>
  </cfif>
<cfelseif operation is "deleteuser">
  <cfIf Session.userid is not "">
    <cfstoredproc procedure="pkg_util.ap_del_users"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
    <cfprocparam type="in" dbvarname="userid" value="#user_id#" cfsqltype="cf_sql_varchar">
    <cfprocparam type="out" dbvarname="rc" variable="rc" cfsqltype="cf_sql_integer">
    </cfstoredproc>
    <cfoutput>
    <cfif rc is not 0>
      <script language=javascript>
	    alert('#strAlertKeyRef#');
	  </script>
    </cfif>
    </cfoutput>
  </cfif>
</cfif>
</body>
<cfif Operation is "updateprofile" and Session.userid is not "">
<cfoutput>
<script language="JavaScript">
  alert('#strLBLProfileUpdate#');
  window.location='userprofile.cfm?Operation=edit_profile&user_id=#Session.userid#';
</script>
</cfoutput>
<cfelseif ((Operation is "add") or (Operation is "updateuser")) and Session.userid is not "">
<cfoutput>
<script language="JavaScript">
  parent.window.table_list.location='user_list.cfm';
  parent.window.table_selected.location='userprofile.cfm?Operation=edit_user&user_id=#user_id#';
</script>
</cfoutput>
<cfelseif operation is "deleteuser" and session.userid is not "">
<cfoutput>
<script language="JavaScript">
  parent.window.table_list.location='user_list.cfm';
  parent.window.table_selected.location='userprofile.cfm?Operation=new_user';
</script>
</cfoutput>
<cfelse>
<cfoutput>
<script language="JavaScript">
  if (window.new_user + "" == "undefined")
    window.edit_user.username.focus()
  else
    window.new_user.user_id.focus();
</script>
</cfoutput>
</cfif>
</html>
