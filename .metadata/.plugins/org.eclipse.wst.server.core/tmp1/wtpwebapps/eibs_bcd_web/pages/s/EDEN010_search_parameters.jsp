<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields" %>
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css"> 
<TITLE>Listas de Control</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<SCRIPT type="text/javascript" SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

</SCRIPT>
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="msgSrc" class="datapro.eibs.beans.EDEN01001Message"  scope="session" />

</HEAD>

<body>
<%
    if ( !error.getERRNUM().equals("0") && !error.getERDF01().equals("")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"campo obligatorio\" align=\"bottom\" border=\"0\" >";
%>
 <h3 align="center">Parámetros Listas de Control<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="search_parameters.jsp, EDEN010" width="32" height="32" ></h3>
<hr size="4">
 <FORM METHOD="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.ofac.JSEDEN010">	
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
    <INPUT TYPE=HIDDEN NAME="DSC" VALUE="">
    
  <table class="tableinfo">
   <tr> 
   <td>
    <table cellspacing=0 cellpadding=2 width="100%" border="0"> 
 
        <tr id=trdark> 
	      <td nowrap width="50%" align="right">Tipo de Búsqueda :</td>
		  <td nowrap width="50%" >
              <input type="radio" name="E01SRCHTP" value="S"  <%if(msgSrc.getE01SRCHTP().equals("S")) out.print("checked");%>>Suena a 
              <input type="radio" name="E01SRCHTP" value="W"  <%if(msgSrc.getE01SRCHTP().equals("W")) out.print("checked");%>>Palabra		  
		  </td>
		</tr>  
		 <tr id=trclear> 
	      <td nowrap width="50%" align="right">Número de Palabras / Sonidos  Mínimo para marcar como coincidencia :</td>
		  <td nowrap width="50%" > General :
 			<input type="text" name="E01NROWOR" size="3" maxlength="2" value="<%= msgSrc.getE01NROWOR().trim()%>" onkeypress="enterInteger(event)"> Jurídica :
 			<input type="text" name="E01NROWOJ" size="3" maxlength="2" value="<%= msgSrc.getE01NROWOJ().trim()%>" onkeypress="enterInteger(event)"> Natural : 
 			<input type="text" name="E01NROWOP" size="3" maxlength="2" value="<%= msgSrc.getE01NROWOP().trim()%>" onkeypress="enterInteger(event)">	
 		  </td>
		</tr>  
        <tr id=trdark>  
	      <td nowrap width="50%" align="right">Número de Coincidencias a mostrar :</td>
		  <td nowrap width="50%" >
		  	<input type="text" name="E01NROMAT" size="3" maxlength="2" value="<%= msgSrc.getE01NROMAT().trim()%>" onkeypress="enterInteger(event)">
		  </td>
		</tr>  		  
        <tr id=trclear> 
	      <td nowrap width="50%" align="right">Incluir búsqueda por Identificación :</td>
		  <td nowrap width="50%" >
              <input type="radio" name="E01INCIDN" value="Y"  <%if(msgSrc.getE01INCIDN().equals("Y")) out.print("checked");%>>Si 
              <input type="radio" name="E01INCIDN" value="N"  <%if(msgSrc.getE01INCIDN().equals("N")) out.print("checked");%>>No		  
		  </td>
		</tr>  		  
		<tr id=trdark> 
	      <td nowrap width="50%" align="right">Fuente Externa Por Defecto :</td>
		  <td nowrap width="50%" >
              <eibsinput:cnofc name="msgSrc" property="E01DFTEXS" value="<%= msgSrc.getE01DFTEXS() %>"  maxlength="4" required="true" flag="DB" fn_code="E01DFTEXS" fn_description="" readonly="false" />		  
		  </td>
		</tr>
		<tr id=trclear> 
	      <td nowrap width="50%" align="right">Fuente Interna Por Defecto :</td>
		  <td nowrap width="50%" >
              <eibsinput:cnofc name="msgSrc" property="E01DFTINS" value="<%= msgSrc.getE01DFTINS() %>"  maxlength="4" required="true" flag="DB" fn_code="E01DFTINS" fn_description="" readonly="false" />		  
		  </td>
		</tr>
		<tr id=trdark> 
	      <td nowrap width="50%" align="right">Causal para Bloqueo Automático :</td>
		  <td nowrap width="50%" >
              <eibsinput:cnofc name="msgSrc" property="E01RSNBLK" value="<%= msgSrc.getE01RSNBLK() %>"  maxlength="4" required="true" flag="FU" fn_code="E01RSNBLK" fn_description="" readonly="false" />		  
		  </td>
		</tr>
		<tr id=trclear> 
	      <td nowrap width="50%" align="right">Motivo para Bloqueo Automático :</td>
		  <td nowrap width="50%" >
              <input type="text" name="E01MTVBLK" size="5" maxlength="4" value="<%= msgSrc.getE01MTVBLK().trim()%>" >
            		<a href="javascript:Get2FilterCodes('E01MTVBLK','','FM', '',document.forms[0]['E01RSNBLK'].value)" >
              		<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" style="cursor:hand" ></a>
              		<%=mandatory %>		  
		  </td>
		</tr>    
 	  </table>
    </td>
   </tr>
  </table>
	<p align="center"> 
	  <input id="EIBSBTN" type="submit" name="Submit" value="Enviar" > 
 	</p>
 
<H4>Fuentes que Producen Bloqueo Automático</H4>   
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <%
          String[] vlu = {  msgSrc.getE01SRCBL1(), msgSrc.getE01SRCBL2(), msgSrc.getE01SRCBL3(), msgSrc.getE01SRCBL4(), msgSrc.getE01SRCBL5(),
          					msgSrc.getE01SRCBL6(), msgSrc.getE01SRCBL7(), msgSrc.getE01SRCBL8(), msgSrc.getE01SRCBL9(), msgSrc.getE01SRCBL10(),
          					msgSrc.getE01SRCBL11(), msgSrc.getE01SRCBL12(), msgSrc.getE01SRCBL13(), msgSrc.getE01SRCBL14(), msgSrc.getE01SRCBL15(),
          					msgSrc.getE01SRCBL16(), msgSrc.getE01SRCBL17(), msgSrc.getE01SRCBL18(), msgSrc.getE01SRCBL19(), msgSrc.getE01SRCBL20()
          				 };	
          int row = 1;
          int x = 0; 
          while (x <= 18) {
          int v1 = x + 1;
          int v2 = x + 2;
          String l1 = "E01SRCBL" + v1;
          String l2 = "E01SRCBL" + v2;  
          %>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %>"> 
             <td nowrap width="25%" align="right">Fuente <%=v1%> :</td>
              <td nowrap width="25%" align="left">
              	<INPUT type="text" name="<%=l1%>" size="5" maxlength="4" value="<%=vlu[x]%>">
              	<a href="javascript:GetCodeDescCNOFC('<%=l1%>',' ','DB')" >
			    <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a> 
             </td>
             <td nowrap width="25%" align="right">Fuente <%=v2%> :</td>
              <td nowrap width="25%" align="left">
              	<INPUT type="text" name="<%=l2%>" size="5" maxlength="4" value="<%=vlu[x+1]%>">
              	<a href="javascript:GetCodeDescCNOFC('<%=l2%>',' ','DB')" >
			    <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a> 
             </td>
          </tr>
          <%
          	row++; 
          	x = x + 2; 
          	}
          %>
		</table>
	</td>
</tr>
</table>
	
<br>		

<script type="text/javascript">
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
</BODY>
</HTML>
 