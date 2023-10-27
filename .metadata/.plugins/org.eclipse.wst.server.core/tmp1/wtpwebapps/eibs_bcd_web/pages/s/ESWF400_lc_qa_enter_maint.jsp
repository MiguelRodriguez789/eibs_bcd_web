<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Preguntas y Respuestas de Carta de Credito</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<LINK Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<% 
	String typ = "", titTypeSing = "Carta de Cr&eacute;dito", titTypePlu = "Cartas de Cr&eacute;dito";
	if (request.getAttribute("typ")!=null)
		typ = (String) request.getAttribute("typ");  
	if (typ.equals("COLL"))
	{
		titTypeSing = "Cobranza";
		titTypePlu = "Cobranzas";
	}
%>

<SCRIPT type="text/javascript">
</SCRIPT>
</HEAD>
<BODY>

<H3 align="center">Preguntas y Respuestas de <%= titTypePlu %> <IMG src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="lc_qa_enter_maint, ESWF400"></H3>
<HR size="4">
<FORM method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESWF400">
    <INPUT TYPE="HIDDEN" NAME="SCREEN" VALUE="6">
    <INPUT TYPE="HIDDEN" NAME="typ" VALUE="<%=typ%>">
    
  <TABLE class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0">
    <TR>
      <TD nowrap width="50%" align="right">Numero de <%= titTypeSing %> : </TD>
      <TD nowrap width="50%">
        <INPUT type="text" name="E01LCOACC" size="13" maxlength="12" onKeypress="enterInteger(event)">
       	<A href="javascript:GetAccount('E01LCOACC','','<%= typ.equals("COLL") ? "CL" : "40" %>','')">
        <IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" ></A>
      </TD>
    </TR>
  </TABLE>
  <br>
          <div align="center">
            <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
          </div>
          
<script type="text/javascript">
  document.forms[0].E01LCOACC.focus();
  document.forms[0].E01LCOACC.select();
</script>
<%
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT type="text/javascript">
            showErrors();
     </SCRIPT>
 <%
 }
%>
</FORM>
<BR>
</BODY>
</HTML>
