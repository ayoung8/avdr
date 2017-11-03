<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>
</title>
</head>
<body>
<cfif session.language is 1>
  <cfset session.language=2>
<cfelse>
  <cfset session.language=1>
</cfif>
<script language="JavaScript">
  window.close();
</script>
</body>
</html>