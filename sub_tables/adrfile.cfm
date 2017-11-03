<html>
<head>
<cfoutput>
<title>#strLBLGetFile#</title>
</cfoutput>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<cfif Not IsDefined("operation")>
	<cfset operation = "">
</cfif>
<BODY bgcolor="#C0C0C0">
<form name="upload" action="adrfile.cfm" enctype="multipart/form-data" method="post">
<cfif operation is "Upload">
	<cffile action="readbinary" variable="strFile" file="#filename#">
	<cfset MyCLOB = toBase64(strFile)>
	<cfif desc is "">
		<cfset descin = name>
	<cfelse>
		<cfset descin = desc>
	</cfif>
    <cfstoredproc procedure="pkg_adr.ap_add_reaction_document"  datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
    <cfprocparam type="in" dbvarname="reactionid" value="#reaction_id#" cfsqltype="cf_sql_integer">
    <cfprocparam type="in" dbvarname="descin" value="#descin#" cfsqltype="cf_sql_varchar">
  	<cfprocparam type="in" dbvarname="fname" value="#name#" cfsqltype="cf_sql_varchar">
  	<cfprocparam type="in" dbvarname="docdetail" value="#MyCLOB#" cfsqltype="cf_sql_longvarchar">
  	</cfstoredproc>
	<cfoutput>
	<script language="JavaScript"> 
		opener.Tab11Frame.location='adrdocument.cfm?reaction_id=#reaction_id#';
		window.close();
	</script>
	</cfoutput>
<cfelse>
	<cfoutput>
	<TABLE BORDER=0>
		<tr><td>#strLBLTabDocument#:</td>
			<td><INPUT TYPE=FILE SIZE=50 NAME="filename" onBlur="document.upload.name.value=this.value;"></td></tr>
		<tr><td>Description:</td>
			<td><input type="text" size=50 maxlength="255" name="desc"></td></tr>
		<tr><td colspan="2"><input type="submit" name="attach" value="#strLBLAttach#">&nbsp;
							<input type="button" name="close" value="#strLBLCancel#" onClick="window.close();"></td></tr>
		<tr><td><input type="hidden" name="reaction_id" value="#reaction_id#">
				<input type="hidden" name="operation" value="Upload"></td>
			<td><input type="hidden" name="name"></td></tr>
	</TABLE>
	</cfoutput>
</cfif>	
</form>
</body>
<script language="JavaScript">
  if (document.upload.filename + "" != "undefined")
    document.upload.filename.focus();
</script>
</html>
