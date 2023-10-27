<%@ taglib uri="/WEB-INF/display.tld" prefix="display" %>
<!DOCTYPE HTML PUBLIC "-/W3C/DTD HTML 3.2 FINAL/EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META NAME="Author" CONTENT="Datapro">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<TITLE>Internet Banking System</TITLE>

</HEAD>

<BODY topmargin="0" leftmargin="0">

<FORM>
<INPUT TYPE=HIDDEN NAME="ENTITYID" VALUE="">

<BR>

<table cellpadding=0 cellspacing=0 border=0 width=550 style="border-collapse: collapse" bgcolor="#FFFFFF">
    <tr>
<td>
<display:table width="550" name="selectcards" property="list" scope="session">
  <display:column property="SERIAL" align="center"  title="serial"/>
</display:table> 
</td>
</tr>
</table>

<BR>

<table border=0 CELLSPACING=0 CELLPADDING=0 WIDTH=550>
    <TR>
    <TD WIDTH=100% ALIGN=CENTER><input class="DIBSBTN" type=button value="Imprimir" ></TD>
  </TR>    
</TABLE>

</FORM>
</BODY>
</HTML>
 