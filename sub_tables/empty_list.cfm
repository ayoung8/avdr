<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
</head>
<body bgcolor="#408080">
<cfoutput>
  <cfif session.language is 1>
    <table>
	  <tr><td align="CENTER" style="font:16; color:F9E660"><b>WELCOME</b></td></tr>
	  <tr><td><br></td></tr>	  
	  <tr><td style="font:12; color:F9E660">To maintain the Drug information, please use the options under the Drug menu option.</td></tr>
	  <tr><td><br></td></tr>
	  <tr><td style="font:12; color:F9E660">To maintain the Adverse Reaction information, please use the options under the Adverse Reaction menu option.</td></tr>
	  <cfif session.admin_role is 1>
	  <tr><td><br></td></tr>
	  <tr><td style="font:12; color:F9E660">To maintain the systems information, please use the options under the Utilities menu option.</td></tr>
	  </cfif>
	</table>
  <cfelse>	
    <table>
	  <tr><td style="font:16; color:F9E660"><b>Bienvenue</b></td></tr>
	  <tr><td><br></td></tr>
	  <tr><td style="font:12; color:F9E660">Pour maintenir les informations concernant les m�dicaments, utilisez les options sous la rubrique M�dicaments.</td></tr>
	  <tr><td><br></td></tr>
	  <tr><td style="font:12; color:F9E660">Pour maintenir les informations concernant les r�actions adverses, utilisez les options sous la rubrique R�action adverse.</td></tr>
	  <cfif session.admin_role is 1>
	  <tr><td><br></td></tr>
	  <tr><td style="font:12; color:F9E660">Pour maintenir les informations du syst�me, utilisez les options sous la rubrique Outils.</td></tr>
	  </cfif>
	</table>
  </cfif>
</cfoutput>
</body>
</html>
