<!--- Define the application parameters --->
<CFAPPLICATION NAME="AVDR" sessionmanagement="Yes" sessiontimeout="#CreateTimeSpan(0,0,30,0)#" applicationtimeout="#CreateTimeSpan(1,0,0,0)#">
<cfif #FindNoCase("WELCOME.CFM",#SCRIPT_NAME#)# LTE 0>
  <cfif NOT ISDEFINED("session.userid")>
    <cflocation url="welcome.cfm">
	<cfabort>
  <cfelse>
    <cfif session.userid is ''>
		<cflocation url="welcome.cfm">
		<cfabort>
	</cfif>
  </cfif>
</cfif>
<cfinclude template="includes/page_translation.cfm">
<cfset application.pavdrdsn="PVDD">
<cfset application.davdrdsn="DVDD">
