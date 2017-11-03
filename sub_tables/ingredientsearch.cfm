<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<cfoutput>
<title>#strLBLIngredientTitle#</title>     
<META Http-Equiv="Pragma" Content="no-cache">
</HEAD>
<FRAMESET ROWS="35%,65%" frameborder=no>   
  <FRAME SRC="ingredientadd.cfm?name=#name#" name="AddFrame" scrolling=no>
  <FRAME SRC="ingredientresult.cfm?name=#name#" NAME="SearchFrame" frameborder=no scrolling=yes>
</FRAMESET><noframes></noframes>
</cfoutput>
</HTML>