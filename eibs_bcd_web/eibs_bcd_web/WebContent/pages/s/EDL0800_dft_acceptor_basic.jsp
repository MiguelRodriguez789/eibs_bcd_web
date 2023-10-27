<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="datapro.eibs.beans.DataAddress"%>
<%@page import="datapro.eibs.services.ParametersServices"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import ="datapro.eibs.master.Util" %>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<html>
<head>
<title>Mantenimiento de Deudores</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/help.js"> </SCRIPT>

<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"> </SCRIPT>


<jsp:useBean id="dftBasic" class="datapro.eibs.beans.EDL080001Message"  scope="session" />

<jsp:useBean id="dftAcceptor" class="datapro.eibs.beans.EDL080003Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<script type="text/javascript">
	$(document).ready(function(){
		readOnlyPage();
		$(":input").css("background-color", "");
		$(":submit, :button, .allowedObj")
			.removeAttr("readonly")
			.css("background-color", "")
			.css("border-style", "")
			.css("display", "")
			.removeAttr("disabled");
		
    	
	});
</script>
</head>
<body >
<% 
 String strBlank = "";
 String strGrp = "";
 try {
       strGrp = request.getParameter("ACTION");
       if (strGrp == null) strGrp = "";
 } catch (Exception e) {
       strGrp = "";
 }

 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }
  
  String DEAIPD, DEAPPD;
  String E01FLGDED, E01FLGREF,E01FLGPAY,E01FLGCOL,E01DEACLF;
  boolean isDEAIPDNum = true;
  boolean isDEAPPDNum = true;
  
  
%>
<%int row = 1; %>  
<h3 align="center">Mantenimiento de Deudores<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="dft_acceptor_basic.jsp,EDL0800"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0800" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="502">
  <INPUT TYPE=HIDDEN NAME="GRP" VALUE="1">
<%
if (strGrp.equals("G")) {
%>
  <INPUT TYPE=HIDDEN NAME="GENDOC" VALUE="1">
  <table class="tableinfo">
       
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left">
                <INPUT type="text" name="E03DEACMC" size="10" maxlength="9" value="<%= userPO.getPorfNum()%>" readonly>
                </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Linea :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left">
                <INPUT type="text" name="E03DEACMN" size="10" maxlength="9" value="<%= userPO.getCreditLineNum()%>" readonly>
                </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2">
                <INPUT type="text" name="E01CUSNA1" size="45" maxlength="45" value="<%= userPO.getCusName() %>" readonly>
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
                <INPUT type="text" name="E01DEAACC" size="13" maxlength="12" value="<%= userPO.getIdentifier() %>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <INPUT type="text" name="E03DEACCY" size="4" maxlength="3" value="<%= userPO.getCurrency() %>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
                <INPUT type="text" name="E01DEAPRO" size="4" maxlength="4" value="<%= userPO.getProdCode() %>" readonly>
                </b> </div>
            </td>
          </tr>
        </table>

<% } else { %>

<INPUT TYPE=HIDDEN NAME="ACTION" VALUE="A">

<% } %>
  <h4>Información Básica</h4> 

  <table cellpadding=2 cellspacing=0 width="100%" border="0" class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tableinfo">
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="28%"> 
              <div align="right">Identificación :</div>
            </td>
            <td nowrap width="72%"> 
              <INPUT type="text" name="E03NUMIDE" size="17" maxlength="15" value="<%= dftAcceptor.getE03NUMIDE() %>" readonly>
               </td>
          </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                <td nowrap="nowrap" width="28%"> 
                  <div align="right">Número de Cliente :</div>
                </td>
                <td nowrap="nowrap" width="72%"> 
                	<eibsinput:text property="E03CUN" name="dftAcceptor" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true"/>
                </td>   
              </tr>
         <% if (userPO.getAccOpt().trim().equals("G") && dftBasic.getE01APAF07().equals("Y") ) { %>
        	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                <td nowrap="nowrap" width="28%"> 
                  <div align="right">Número de Linea de Credito :</div>
                </td>
                <td nowrap="nowrap" width="72%">
					<input type=TEXT name="E03DLDCMN" class="allowedObj" value="" size=5 maxlength=4 onKeypress="enterInteger(event)">
            			<a href="javascript:GetCreditLineDeudor('E03DLDCMN','DEUD',document.forms[0].E03CUN.value,document.forms[0].E03DEACMC.value,document.forms[0].E03DEACMN.value)">
            			<img class="allowedObj" src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0" ></a>
            			<img class="allowedObj" src="<%=request.getContextPath()%>/images/Check.gif" title="Campo Mandatorio" align="bottom" border="0"  >
                </td>   
              </tr>
			<% } %>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                <td nowrap="nowrap" width="28%"> 
                  <div align="right">Primer Nombre :</div>
                </td>
                <td nowrap="nowrap" width="72%"> 
                	<eibsinput:text property="E03FNA" name="dftAcceptor" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR_30 %>" readonly="true"/>
                </td>
              </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                <td nowrap="nowrap" width="28%" > 
                  <div align="right">Segundo Nombre :</div>
                </td>
                <td nowrap="nowrap" width="72%"> 
                	<eibsinput:text property="E03FN2" name="dftAcceptor" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR_30 %>" readonly="true"/>
                </td>
              </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                <td nowrap="nowrap" width="28%"> 
                  <div align="right">Primer Apellido :</div>
                </td>
                <td nowrap="nowrap" width="72%"> 
                	<eibsinput:text property="E03LN1" name="dftAcceptor" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR_30 %>" readonly="true"/>
                </td>
              </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                <td nowrap="nowrap" width="28%"> 
                  <div align="right">Segundo Apellido :</div>
                </td>
                <td nowrap="nowrap" width="72%"> 
                	<eibsinput:text property="E03LN2" name="dftAcceptor" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR_30 %>" readonly="true"/>
                </td>
              </tr>
              
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
                <td nowrap="nowrap" width="28%" > 
                  <div align="right">Nombre Legal :</div>
                </td>
                <td nowrap="nowrap" width="72%"> 
                	<eibsinput:text property="E03NA1" name="dftAcceptor" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" readonly="true"/>
                </td>
              </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                <td nowrap="nowrap" width="28%" > 
                  <div align="right">Nombre Corto :</div>
                </td>
                <td nowrap="nowrap" width="72%"> 
                	<eibsinput:text property="E03SHN" name="dftAcceptor" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME_SHORT %>" readonly="true" />
                </td>
              </tr>   
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>" style="vertical-align: top"> 
            <td nowrap width="28%" > 
              <div align="right">Direcci&oacute;n :</div>
            </td>
            <td nowrap width="72%" > 
                	<eibsinput:text property="E03CUMMA1" name="dftAcceptor" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" /> <br>
                	<eibsinput:text property="E03CUMMA2" name="dftAcceptor" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" /> <br>
                	<eibsinput:text property="E03CUMMA3" name="dftAcceptor" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" /> <br>
                	<eibsinput:text property="E03CUMMA4" name="dftAcceptor" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" /> 
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="28%" > 
              <div align="right">Teléfono :</div>
            </td>
            <td nowrap width="72%" > 
              <INPUT type="text" name="E03CUMHPN" size="17" maxlength="17" value="<%= dftAcceptor.getE03CUMHPN() %>" readonly> </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="28%" > 
              <div align="right">Plaza de Pago:</div>
            </td>
            <td nowrap width="72%" > 
              <INPUT type="text" name="E03DLDPWY" class="allowedObj" size="4" maxlength="4" value="<%= dftAcceptor.getE03DLDPWY()  %>" >
              <a href="javascript:getCodeAcpt('E03DLDPWY','02')"><img  class="allowedObj" src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="28%" > 
              <div align="right">Agente Cobrador:</div>
            </td>
            <td nowrap width="72%" > 
              <INPUT type="text" name="E03DLDREM"  class="allowedObj"size="4" maxlength="4" value="<%= dftAcceptor.getE03DLDREM() %>">
              <a href="javascript:getCodeAcpt('E03DLDREM','01')"><img  class="allowedObj" src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="28%"> 
              <div align="right">Plazo Para Ejercer Recursos:</div>
            </td>
            <td nowrap width="72%"> 
               <input type="text" name="E03CUMNST" class="allowedObj" size="4" maxlength="4" value="<%= dftAcceptor.getE03CUMNST() %>">
               </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
<p align="center">&nbsp; </p>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td width="33%"> 
        <div align="center"></div>
      </td>
      <td width="34%"> 
        <p>
  <div align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>
      </td>
      <td width="33%"> 
        <div align="center"></div>
      </td>
    </tr>
  </table>
  <p align="center">&nbsp; </p>
  </form>
</body>
</html>
