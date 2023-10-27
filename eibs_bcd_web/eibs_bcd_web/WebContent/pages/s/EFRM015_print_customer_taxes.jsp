<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.1 Transitional//EN">
<%@page import="com.datapro.constants.Entities"%>
<%@page import="datapro.eibs.sockets.*, datapro.eibs.beans.* , datapro.eibs.master.*" %>
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="datapro.eibs.services.ParametersServices"%>
<%@page import="com.datapro.constants.EibsFields"%>
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css"> 

<TITLE>Print Customer Taxes</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "msgRcd" class= "datapro.eibs.beans.EFRM01501Message"  scope="session" />

<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="JavaScript">

function checkInfo(){
	if (getElement("E01CUN").value == "0"){
 		alert("Favor ingresar la informacion solicitada!!!");
 		getElement("E01CUN").focus();
 		return;
 	}
	var acc = getElement("E01CUN").value;
 	var per = getElement("E01PER").value;
 	var url = 
		"<%=request.getContextPath()%>/pages/s/EFRM000_pdf_form.jsp?SCREEN=1&OPE_CODE=DR&APP_CODE=00&ACCOUNT="+acc+"&SEQ="+per;
	getPdfForms(url);
 }


</SCRIPT>

</HEAD>
<body>

<% 
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"campo obligatorio\" align=\"bottom\" border=\"0\" >";
 	int row = 0;
%>

<h3 align="center">Imprimir Declaraci&oacute;n de Renta
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="print_customer_taxes, EFRM015"></h3>

<hr size="4">
 <FORM METHOD="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.reports.JSEFRM015">	
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1">
  
  <table id="tbenter" align="center" style="width:85%" border="1">
    <tr> 
      <td> 
        <table id="tbenter" width="100%" border="0" cellspacing="1" cellpadding="0">
          <tr> 
            <td width="20%" align="left"> </td>
            <td width="30%"> </td>
            <td width="50%" align="left"> </td>
          </tr>
          <tr> 
            <td width="20%" align="right"><B> </B></td>
            <td width="30%"> </td>
            <td width="50%" align="left"><B> </B></td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap >
					<div align="right">Banco : </div>
				</td>
				<td nowrap >
					<input type="text" name="E01BNK" size="3" maxlength="2" value="<%= currUser.getE01UBK() %>" readonly>
				</td>
		  </tr>
		  <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap>
					<div align="right">Cliente : </div>
				</td>
				<td nowrap>
					<input type="text" name="E01CUN" size="10" maxlength="9" value="<%=msgRcd.getE01CUN()%>" onKeypress="enterInteger(event)">
             		<a href="javascript:GetCustomerDescId('E01CUN','E01NA1','')">
                	<img src="<%=request.getContextPath()%>/images/1b.gif" title="Busqueda de Clientes" align="bottom" border="0" ></a>
            		<input type="text" name="E01NA1" size="62" maxlength="60" value="<%= msgRcd.getE01NA1().trim()%>" readonly>
				</td>
		  </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            	<td nowrap>
            		<div align="right">A&ntilde;o Gravable: </div>
            	</td>
            	<td nowrap>
            		<select name="E01PER">
            			<%	int years = currUser.getBigDecimalE01PYN().intValue()+1;
            			//TODO Configure, for now 4 Years
            			for(int i=1; i<years;i++){
            				String year = datapro.eibs.master.Util.formatYear(
            					currUser.getBigDecimalE01RDY().intValue()-i);
	                  		out.print("<option value=\"" + year + "\">" + year + "</option>");
    	            	}
     					%>
     				</select>		
            	</td>
          </tr>
	    </table>
      </td>
    </tr>
  </table>

<p align="center">  
     <input id="EIBSBTN" type="Button" name="Enviar" value="Enviar" onClick="JavaScript:checkInfo()">
     
</p>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %> <SCRIPT language="Javascript">
            showErrors();
     </SCRIPT> 
 <% } %>
 </FORM>
</BODY>
</HTML>
