<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<SCRIPT LANGUAGE="JavaScript" SRC="includes/JavaScript/common.js"></SCRIPT>
<script language="JavaScript">

if (screen.width < 800)
{  alert('You must use a setting of at least 800x600 with small fonts to use this application.');
   close(window);
}
else if (screen.width < 1024)
   alert('This application was optimized for a screen resolution of 1024x768.  You may want to adjust your screen resolution. Cette application a été optimisée pour une résolution de 1024x768.  Il serait préférable d`ajuster votre résolution.');
   

function SubmitForm(formname)
{
	if (trim(formname.user_id.value) == '')
	{
		alert("Please supply a user id.  SVP tapez votre code d'utilisateur.");
		return false;
	} 
	if (trim(formname.password.value) == '')
	{
		alert("Please supply a password.  SVP tapez votre mot de passe.");
		return false;
	} 	
	document.Login.Operation.value = 'Login';
}
</script>
<html lang="EN">
<head>
	<title>Welcome / Bienvenue</title>
<link href="css/clf1_ie.css" rel="STYLESHEET" type="text/css"><!--#else -->
<link href="css/clf1_ns.css" rel="STYLESHEET" type="text/css"><!--#endif -->
</head>
<body>
<cfif NOT IsDefined("form.Operation")>
  <cfset session.userid="">
  <cfset session.password = "">
  <cfset session.language = 1>
  <cfset session.drug_role = 0>
  <cfset session.adverse_role = 0>
  <cfset session.admin_role = 0>
  <cfset session.report_role = 0>
<cfoutput>
<form action="#SCRIPT_NAME#" method="post" name="Login" onsubmit="return SubmitForm(this);">
</cfoutput>
<table border="0" width="100%" cellspacing="0" cellpadding="0">
<tr valign="top">
  <td valign="top"><img src='images/side_color.jpg'></td>
  <td>
    <table border="0" cellspacing="0" cellpadding="0" align="left">
	  <tr align="right" valign="top">
        <td align="right" valign="top"><img src="Images/hc.gif" width="145" height="21" border="0" alt=""></td>		
	  </tr>
	  <tr>
        <td><br><br></td>		
	  </tr>
	  <tr align="center" valign="top">
			<script language="JavaScript">
  			  if (screen.width < 1024)
			  {
               document.writeln('<td><P align=center><font size="4" color="#408080"><STRONG><b><i>Welcome to the Adverse Veterinary Drug Reaction System<br><br>');
      		   document.writeln('Bienvenue au système des réactions adverses aux médicaments vétérinaires</i></b></STRONG></FONT><br><br><br><br></P>');
			  }
			  else
			  {
               document.writeln('<td><P align=center><font size="5" color="#408080"><STRONG><b><i>Welcome to the Adverse Veterinary Drug Reaction System<br><br>');
      		   document.writeln('Bienvenue au système des réactions adverses aux médicaments vétérinaires</i></b></STRONG></FONT><br><br><br><br></P>');
			  }
			</script>
		</td>
	  </tr>
	  <tr>
	    <td>
 	      <table border="0" cellspacing="0" cellpadding="0" align="center">
            <tr bgcolor="#408080">
	          <td valign="top"><img src="images/corner_tl2.gif" width="4" height="4" border="0" alt=""></td>
	          <td align="center" height="20"><b><font color="#F8CC30">Login / Entrer</font></b></td>
	          <td align="right" valign="top"><img src="images/corner_tr2.gif" width="4" height="4" border="0" alt=""></td>
            </tr>
            <tr>
	          <td colspan="3" align="center">
			    <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor = "#000066" align="center">
		  	      <tr>
    			    <td align="center">
					  <table width="100%" border="0" cellspacing="4" cellpadding="4" bgcolor="Silver" bordercolor="Silver">
						<tr>
							<td style="font:11"><b>User ID/Code d'utilisateur</b></td>
							<td><input type="text" size=30 name="user_id" autocomplete="OFF"></td>
						</tr>
						<tr>
							<td style="font:11"><b>Password/Mot de passe</b></td>
							<td><input type="password" size=30 name="password"></td>	
						</tr>
						<tr>
							<td style="font:11"><b>Database/Base de données</b></td>
							<td><select name="database"><option value="AVDRP">AVDRP</option>
							                            <option value="DAVDR">DAVDR</option>
							    </select></td>	
						</tr>
						<tr>
							<td colspan="2" align="center" height="35" valign="bottom"><input type="submit" name="Login" value="Login / Entrer" class="button"></td>
						</tr>
					  </table>
				    </td>
			      </tr>
		        </table>
		      </td>
	      </tr>
          </table>
          <input type="hidden" name="Operation" value="Login">
	    </td>
	  </tr>
	  <tr>
        <td><br><br><br></td>		
	  </tr>
	  <tr align="right" valign="top">
        <td align="right" valign="top"><img src="Images/canada.gif"></td>		
	  </tr>
	</table>
  </td>
</tr>
</table>
</form>
<cfelse>
  
    <cfif database is "DAVDR">
	  <cfset application.avdrdsn = application.davdrdsn>
	<cfelse>
	  <cfset application.avdrdsn = application.pavdrdsn>
	</cfif>
    <cfstoredproc procedure="pkg_select.ap_verify_user"  datasource="#application.avdrdsn#" username="#form.user_id#" password="#form.password#">
    <cfprocparam type="in" dbvarname="userid" value="#form.user_id#" cfsqltype="cf_sql_varchar">
    <cfprocresult name="verify">
    </cfstoredproc>
	
  <cfset session.userid = #form.user_id#>
  <cfset session.password = #form.password#>
  <cfset session.drug_role = #verify.drug_role#>
  <cfset session.adverse_role = #verify.adverse_role#>
  <cfset session.admin_role = #verify.admin_role#>
  <cfset session.report_role = #verify.report_role#>
  <cfset session.language = #verify.language#>
  <cfset session.database = #form.database#>
  <cfset session.evaluator_role = #verify.evaluator_role#>
  <cflocation url="main.cfm">
</cfif>
<cfif IsDefined("flag")>
  <cfoutput>
    <script language="JavaScript">
	  alert("Invalid userid/password supplied.  Le code d'utilisateur/mot de passe est invalide.");
      if (#session.login_count# > 3)
      {
	    alert("You have exceeded the maximum number of try.  Vous avez excéder le nombre maximal d'essais.");
	    document.Login.user_id.disabled=true;
	    document.Login.password.disabled=true;
	    document.Login.Login.disabled=true;
      }
	</script>
  </cfoutput>
</cfif>
<script language="JavaScript">
  if (document.Login.user_id.disabled == false)
    document.Login.user_id.focus();
  <cfif isDefined("session.login_count")>
    <cfif session.login_count gt 3>
      document.Login.user_id.disabled=true;
      document.Login.password.disabled=true;
      document.Login.Login.disabled=true;
	</cfif>
  </cfif>
</script>
</body>
</html>