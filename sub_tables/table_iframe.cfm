<script language="JavaScript">
  <cfif session.admin_role is 0>
    parent.parent.window.location = '../welcome.cfm';
  </cfif>
</script>
<cfset tableid = session.currenttable>
<cfset usesdate = session.usesdate>
<cfif NOT IsDefined("Operation")>
  <cfset Operation="">
</cfif>
<cfif Operation is "Add/Modify">
  <cfIf add_or_update is "add">
    <cfstoredproc procedure="pkg_util.ap_insert_lookup"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
    <cfprocparam type="in" dbvarname="tableid" value="#tableid#" cfsqltype="cf_sql_integer">
    <cfprocparam type="in" dbvarname="usedate" value="#usesdate#" cfsqltype="cf_sql_integer">
    <cfprocparam type="in" dbvarname="value2" value="#txt_english_desc#" cfsqltype="cf_sql_varchar">
    <cfprocparam type="in" dbvarname="value3" value="#txt_french_desc#" cfsqltype="cf_sql_varchar">
	<cfif usesdate is 1>
      <cfprocparam type="in" dbvarname="value4" value="#txt_start_date#" cfsqltype="cf_sql_varchar">
      <cfprocparam type="in" dbvarname="value5" value="#txt_end_date#" cfsqltype="cf_sql_varchar">
	</cfif>
	<cfif tableid is 3 or tableid is 26 or tableid is 16>
      <cfprocparam type="in" dbvarname="value4" value="#txt_other#" cfsqltype="cf_sql_varchar">
	</cfif>
    </cfstoredproc>
  <cfElse>
    <cfstoredproc procedure="pkg_util.ap_update_lookup"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
    <cfprocparam type="in" dbvarname="tableid" value="#tableid#" cfsqltype="cf_sql_integer">
    <cfprocparam type="in" dbvarname="usedate" value="#usesdate#" cfsqltype="cf_sql_integer">
    <cfprocparam type="in" dbvarname="value1" value="#txt_code#" cfsqltype="cf_sql_integer">
    <cfprocparam type="in" dbvarname="value2" value="#txt_english_desc#" cfsqltype="cf_sql_varchar">
    <cfprocparam type="in" dbvarname="value3" value="#txt_french_desc#" cfsqltype="cf_sql_varchar">
	<cfif usesdate is 1>
      <cfprocparam type="in" dbvarname="value4" value="#txt_start_date#" cfsqltype="cf_sql_varchar">
      <cfprocparam type="in" dbvarname="value5" value="#txt_end_date#" cfsqltype="cf_sql_varchar">
	</cfif>
	<cfif tableid is 3 or tableid is 26 or tableid is 16>
      <cfprocparam type="in" dbvarname="value4" value="#txt_other#" cfsqltype="cf_sql_varchar">
	</cfif>
    </cfstoredproc>
  </cfif>
  <cfoutput>
    <script language="JavaScript">
	  parent.window.table.add_or_update.value='add';
	</script>  
  </cfoutput>
<cfelseif Operation is "Delete">
  <cfstoredproc procedure="pkg_util.ap_delete_lookup"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
  <cfprocparam type="in" dbvarname="tableid" value="#tableid#" cfsqltype="cf_sql_integer">
  <cfprocparam type="in" dbvarname="value1" value="#txt_code#" cfsqltype="cf_sql_integer">
  <cfprocparam type="out" dbvarname="rc" variable="rc" cfsqltype="cf_sql_integer">
  </cfstoredproc>
  <cfoutput>
  <cfif rc is 0>
    <script language=javascript>
	  alert('#strAlertKeyRef#');
	</script>
  <cfelse>
    <script language="JavaScript">
	  parent.window.table.add_or_update.value='add';
	</script>  
  </cfif>
  </cfoutput>
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
<table align="left" width="100%"  height = "20" border="0" cellspacing="0" cellspadding="0">
	<tr bgcolor="#408080">
	    <cfoutput>
  	    <td width="10%" style="font:10; color:F8CC30;"><b>#strLBLCode#</b></td>
        <td width="21%" style="font:10; color:F8CC30;"><b>#strLBLEnglishDescription#</b></td>
  		<td width="21%" style="font:10; color:F8CC30;"><b>#strLBLFrenchDescription#</b></td>
  		<cfif usesDate is 1>
    	  <td width="10%" style="font:10; color:F8CC30;"><b>#strLBLStartDate#</b></td>
          <td width="10%" style="font:10; color:F8CC30;">#strLBLEndDate#</td>
  		</cfif>
		<cfif tableid is 3>
          <td width="10%" style="font:10; color:F8CC30;"><b>#strLBLSpecies#</b></td>
		<cfelseif tableid is 16>
          <td width="10%" style="font:10; color:F8CC30;"><b>#strLBLFoodFlag#</b></td>		
		<cfelseif tableid is 26>
          <td width="10%" style="font:10; color:F8CC30;"><b>#strLBLPersonFlag#</b></td>		
		</cfif>
  		<td width="10%" style="font:10; color:F8CC30;"><b>#strLBLModifiedBy#</b></td>
  		<td width="10%" style="font:10; color:F8CC30;"><b>#strLBLModifiedDate#</b></td>
  		<td width="8%" style="font:10; color:F8CC30;"><b>#strLBLAction#</b></td>
    </tr>
	</cfoutput>
    <cfstoredproc procedure="pkg_select.ap_select_lookup"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
    <cfprocparam type="in" dbvarname="tableid" value="#tableid#" cfsqltype="cf_sql_integer">
    <cfprocparam type="in" dbvarname="language" value="#session.language#" cfsqltype="cf_sql_integer">
    <cfprocresult name="rs">
    </cfstoredproc>
 	<cfset txtColor="c0c0c0">
	<cfset row=0>
	<cfoutput query="rs">
	    <cfset row = row + 1>
	    <cfif txtColor is "c0c0c0">
	      <cfset txtColor="c9c9c9">
	    <cfelse>
	      <cfset txtColor="c0c0c0">
	    </cfif>
		<cfset txt_code=rs.txt_code>
		<cfset txt_english_desc=rs.english_desc>
		<cfset txt_french_desc=rs.french_desc>
		<cfset txt_last_modified_user_id=rs.last_modified_user>
		<cfset txt_last_modified_date=rs.last_modified_date>
		<cfif usesDate is 1>
		  <cfset txt_start_date=rs.start_date>
		  <cfset txt_end_date=rs.end_date>
		</cfif>
		<cfif tableid is 3 or tableid is 26 or tableid is 16>
		  <cfset txt_other=rs.other>
		  <cfset txt_other_code=rs.other_code>
		</cfif>
  <tr align="right"  valign="top" bgcolor=#txtColor# onMouseOver="this.bgColor='##408080'; document.all.delimg#row#.src='../images/delhl.bmp'; document.all.editimg#row#.src='../images/edithl.bmp';" onMouseOut="this.bgColor='#txtColor#'; document.all.delimg#row#.src='../images/del.bmp'; document.all.editimg#row#.src='../images/edit.bmp';">
	<td width="10%" align="left" style="font:10px">#txt_code#</td>
	<td width="21%" align="left" style="font:10px">#txt_english_desc#</td>
	<td width="21%" align="left" style="font:10px">#txt_french_desc#</td>
	<cfif usesDate is 1>
	  <td width="10%" align="left" style="font:10px">#txt_start_date#</td>
	  <td width="10%" align="left" style="font:10px">#txt_end_date#</td>
    </cfif>
	<cfif tableid is 3 or tableid is 26 or tableid is 16>
	  <td width="10%" align="left" style="font:10px">#txt_other#</td>
	</cfif>
	<td width="10%" align="left" style="font:10px">#txt_last_modified_user_id#</td>
	<td width="10%" align="left" style="font:10px">#txt_last_modified_date#</td>																				
	<td width="8%" align="center" style="font:13px">
	 	  <A HREF="##" STYLE="color:navy;" onclick="SendToParent('#txt_code#',desceng#row#.value,descfr#row#.value <cfif usesDate is 1> ,'#txt_start_date#','#txt_end_date#' </cfif> <cfif tableid is 3 or tableid is 26 or tableid is 16> ,'','','#txt_other_code#' </cfif>);"><img src="../Images/edit.bmp" name="editimg#row#" border="0"></a>&nbsp; 
	      <A HREF="##" STYLE="color:navy;" onclick="var dodelete=window.confirm('#strAlertDeleteMe#'); if(dodelete) window.location='#SCRIPT_NAME#?Operation=Delete&txt_code=#txt_code#';"><img src="../Images/del.bmp" name="delimg#row#" border="0"></A></td>
	      <input type="hidden" name="desceng#row#" value="#txt_english_desc#">
	      <input type="hidden" name="descfr#row#" value="#txt_french_desc#"></td>
  </tr>
  </cfoutput>
  <cfoutput>
  <script language=javascript>
	parent.window.table.txt_code.value='';
  	parent.window.table.txt_english_desc.value='';
	parent.window.table.txt_french_desc.value='';
	<cfif usesDate is 1>
	  parent.window.table.txt_start_date.value='1900.01.01';
	  parent.window.table.txt_end_date.value='';
    </cfif>
	<cfif tableid is 3>
	  parent.window.table.txt_other.value='';
	<cfelseif tableid is 16>
	  parent.window.table.txt_other.value='0';
	<cfelseif tableid is 26>
	  parent.window.table.txt_other.value='1';
	</cfif>
    parent.window.table.txt_english_desc.focus();	
	  
	function SendToParent(txt_code, txt_english_desc, txt_french_desc, txt_start_date, txt_end_date, txt_other) 
	{
		parent.window.table.txt_code.value=txt_code;
		parent.window.table.txt_english_desc.value=txt_english_desc;
		parent.window.table.txt_french_desc.value=txt_french_desc;
		<cfif usesDate is 1>
  		  parent.window.table.txt_start_date.value=txt_start_date;
  		  parent.window.table.txt_end_date.value=txt_end_date;
		</cfif>
		<cfif tableid is 3 or tableid is 26 or tableid is 16>
		  parent.window.table.txt_other.value=txt_other;
		</cfif>
		parent.window.table.txt_english_desc.focus();	
		parent.window.table.add_or_update.value='update';
	}
  </script>
  </cfoutput>
</table>
</body>
</html>

