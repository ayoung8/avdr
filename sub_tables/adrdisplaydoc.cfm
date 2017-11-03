<cfquery name="getdoc" datasource="#application.avdrdsn#" username="#session.userid#" password="#session.password#">
  select document_detail as c, Upper(document_type) as d
  from drug_adverse_reaction_document
  where adverse_reaction_id = #reaction_id#
    and document_id = #document_id#
</cfquery>
<cfoutput query="getdoc">
	<cfset MyCLOB = c>
	<cffile action="write" file="c:\CFusionMX\wwwroot\avdr\temp\avdrtemp.#d#" output="#toBinary(MyCLOB)#">
	<cfif 1 is 1>
		<cfif D is "PDF">
			<cfcontent type="application/pdf" file="c:\CFusionMX\wwwroot\avdr\temp\avdrtemp.#d#" deletefile="yes">
		<cfelseif D is "XLS">
			<cfcontent type="application/msexcel" file="c:\CFusionMX\wwwroot\avdr\temp\avdrtemp.#d#" deletefile="yes">
		<cfelseif D is "DOC">
			<cfcontent type="application/msword" file="c:\CFusionMX\wwwroot\avdr\temp\avdrtemp.#d#" deletefile="yes">
		<cfelseif D is "RTF">
			<cfcontent type="application/rtf" file="c:\CFusionMX\wwwroot\avdr\temp\avdrtemp.#d#" deletefile="yes">
		<cfelseif D is "GIF">
			<cfcontent type="image/gif" file="c:\CFusionMX\wwwroot\avdr\temp\avdrtemp.#d#" deletefile="yes">
		<cfelseif D is "JPEG" or D is "JPG">
			<cfcontent type="image/jpeg" file="c:\CFusionMX\wwwroot\avdr\temp\avdrtemp.#d#" deletefile="yes">
		<cfelseif D is "TIFF" or D is "TIF">
			<cfcontent type="image/tiff" file="c:\CFusionMX\wwwroot\avdr\temp\avdrtemp.#d#" deletefile="yes">
		<cfelseif #Mid(D,1,3)# is "HTM">
			<cfcontent type="text/html" file="c:\CFusionMX\wwwroot\avdr\temp\avdrtemp.#d#" deletefile="yes">
		<cfelseif D is "TXT">
			<cfcontent type="text/plain" file="c:\CFusionMX\wwwroot\avdr\temp\avdrtemp.#d#" deletefile="yes">
		<cfelse>
			<cflocation url="temp/avdrtemp.#d#">		
		</cfif>
	<cfelse>
		<cflocation url="temp/avdrtemp.#d#">	
	</cfif>	
</cfoutput>
