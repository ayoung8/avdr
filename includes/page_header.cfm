<TABLE width="100%" border="0" cellspacing="0" cellpadding="0">
  <TR>
    <td valign="top"><img src="images/top1.gif" border=0 alt="VADR"></td>
    <td width="100%" align="LEFT" valign="TOP" bgcolor="#E6E6E6" cellspacing="0" cellpadding="0">
	    <cfif session.language is 1>
		   <script language="JavaScript">
  			  if (screen.width < 1024)
		        document.writeln('<img src="images/top-english-800.gif" width="100%" height="36">')
			  else
		        document.writeln('<img src="images/top-english-1024.gif" width="100%" height="36">');
		   </script>
		<cfelse>
		   <script language="JavaScript">
  			  if (screen.width < 1024)
		        document.writeln('<img src="images/top-french-800.gif" width="100%" height="36">')
			  else
		        document.writeln('<img src="images/top-french-1024.gif" width="100%" height="36">');
		   </script>
		</cfif>   
        <cfinclude template="menu.cfm">
	</TD>
  </TR>
</TABLE>