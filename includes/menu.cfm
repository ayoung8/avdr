<cfinclude template="menu_functions.cfm">
<cfIf session.Language is 1>
  <cfset strHelp = "Help.html">
<cfElse>
  <cfset strHelp = "helpf.html">
</cfif>
<cfset strScript = #SCRIPT_NAME#>
<cfif IsDefined("Operation")>
	<cfset strAction=Operation>
<cfelse>
	<cfif IsDefined("mode")>
		<cfset strAction=mode>
	<cfelse>
		<cfset strAction="">
	</cfif>
</cfif>
<cfIf #FindNoCase("welcome.cfm",strScript)# GT 0 or #FindNoCase("main.cfm",strAction)# GT 0>
  <cfset strHelp = strHelp & "##HomePage">
<cfElseIf #FindNoCase("drugs.cfm",strScript)# GT 0 and #FindNoCase("add_drug",strAction)# GT 0>
  <cfset strHelp = strHelp & "##NewDrug">
<cfElseIf #FindNoCase("drugs.cfm",strScript)# GT 0 and #FindNoCase("search",strAction)# GT 0>
  <cfset strHelp = strHelp & "##EditDrug">
<cfElseIf #FindNoCase("adrs.cfm",strScript)# GT 0 and #FindNoCase("add_reaction",strAction)# GT 0>
  <cfset strHelp = strHelp & "##NewReaction">
<cfElseIf #FindNoCase("adrs.cfm",strScript)# GT 0 and #FindNoCase("search",strAction)# GT 0>
  <cfset strHelp = strHelp & "##EditReaction">
<cfElseIf #FindNoCase("users.cfm",strScript)# GT 0 and #FindNoCase("1",strAction)# GT 0>
  <cfset strHelp = strHelp & "##MyProfile">
<cfElseIf #FindNoCase("users.cfm",strScript)# GT 0 and #FindNoCase("0",strAction)# GT 0 and session.admin_role is 1>
  <cfset strHelp = strHelp & "##UserMaintenance">
<cfElseIf #FindNoCase("users.cfm",strScript)# GT 0 and #FindNoCase("new_user",strAction)# GT 0>
  <cfset strHelp = strHelp & "##UserMaintenance">
<cfElseIf #FindNoCase("tables.cfm",strScript)# GT 0>
  <cfset strHelp = strHelp & "##TableMaintenance">
</cfif>
<cfoutput>
<script language="JavaScript">
function setLanguage(wName,w,h)
{
  wName=window.open('setLanguage.cfm', wName ,' scrollbars=0, width='+w+',height='+h);
  window.focus();
  window.location.reload();
}

function openReport(theURL,wName,w,h)
{
  wName=window.open(theURL, wName ,'resizable=yes, scrollbars=yes, width='+w+',height='+h+',left='+((screen.width - w) / 2)+',top='+((screen.height - h) / 2));
  wName.window.focus();
}

function verifyexit()
{
  input_box=confirm('#strLBLExit#'); 
  if(input_box==true)
  {
    window.location='welcome.cfm';
  }
}

function openwindow()
{
  window.open("#strHelp#","my_new_window","toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,copyhistory=yes,width=400,height=400")
}

function OpenFindDrug()
{
   var sFeatures="dialogHeight: 300px; dialogWidth: 379px; status: no; help: no; scroll: no;";
   CheckIt();
   vValue = window.showModalDialog("sub_tables/drugsearch.cfm", "", sFeatures);
   if ((vValue != '') & (vValue  + "" !="undefined"))
     {
       parent.window.location = 'drugs.cfm?' + vValue;
     }
}

function OpenFindADR()
{
   var sFeatures="dialogHeight: 325px; dialogWidth: 379px; status: no; help: no; scroll: no;";
   CheckIt();
   vValue = window.showModalDialog("sub_tables/adrsearch.cfm", "", sFeatures);
   if ((vValue != '') & (vValue  + "" !="undefined"))
     {
       parent.window.location = 'adrs.cfm?' + vValue;
     }
}

</script>
<body topmargin=0 marginheight="0" onclick="CheckIt()" onKeyPress="CheckIt()">
<table width="100%" border="0" cellspacing="0" cellpadding="0" >
	<TR>
	    <TD valign="top">
	    		<!-- Begin Menu Table -->
			<table width="100%" cellspacing="2" cellpadding="1" id="menuBar" onselectstart="return false" onClick="processClick()" onMouseOver="doHighlight(event.toElement)" onMouseOut="doCheckOut()" onKeyDown="processKey()">
				<tr>
					<cfif session.drug_role gt 0>
					<td nowrap class="root">#strLBLMenu1#                     
						<table cellspacing=0 cellpadding=0 >
						    <cfif session.drug_role GT 2>
							<tr>
								<td nowrap onClick="window.location='drugs.cfm?Operation=add_drug';" >#strLBLSubMenu1Item1#</td>
							</tr>
                            </cfif>
							<cfif session.drug_role GT 0>
							<tr>
								<td  nowrap onClick="OpenFindDrug();" >#strLBLSubMenu1Item2#</td>
							</tr>
                            </cfif>
						</table>
					</td>
					</cfif>
					<cfif session.adverse_role gt 0 >
					<td nowrap class="root">#strLBLMenu2#
						<table cellspacing=0 cellpadding=0>
						    <cfif session.adverse_role GT 2>
							<tr>
								<td nowrap onClick="window.location='adrs.cfm?Operation=add_reaction';" >#strLBLSubMenu2Item2#</td>
							</tr>
                            </cfif>
							<cfif session.adverse_role gt 0>
							<tr>
								<td  nowrap onClick="OpenFindADR();" >#strLBLSubMenu2Item1#</td>
							</tr>
							</cfif>
						</table>
					</td>
					</cfif>
					<td nowrap class="root">#strLBLMenu3#
						<table cellspacing=0 cellpadding=0>
							<tr>
								<td nowrap onClick="window.location='users.cfm?mode=1';" >#strLBLSubMenu3Item1#</td>
							</tr>
							<cfIf session.admin_role is 1>
							<tr>
								<td nowrap onClick="window.location='users.cfm?mode=0';" >#strLBLSubMenu3Item2#</td>
							</tr>
							<tr>
								<td nowrap onClick="window.location='tables.cfm';" >#strLBLSubMenu3Item3#</td>
							</tr>
							</cfif>
						</table>
					</td>
					<td nowrap class="root" onClick="openwindow()">#strLBLMenu5#</td>
					<td nowrap class="root" onClick="verifyexit();" >#strLBLMenu4#</td>
					<td nowrap class="root" onClick="setLanguage('setL','1','1'); " >#strLBLMenu6#</td>
				</tr>
			</table>
			<!-- End Menu Table -->
		</td>
		<td align="RIGHT" bgcolor="##E6E6E6">#session.userid#@#session.database#</td>
	</tr>
</table>
</body>
</cfoutput>