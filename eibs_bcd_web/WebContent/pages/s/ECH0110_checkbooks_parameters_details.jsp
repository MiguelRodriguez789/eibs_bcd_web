<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Maestro de Agencias</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="checksParam" class="datapro.eibs.beans.ECH011001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
%>


<H3 align="center">Parametros de Control de Chequeras<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="checkbooks_parameters_details.jsp, ECH0110"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSECH0110" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Banco :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> <b> 
                <!-- <input type="text" name="E01CHKBNK" size="3" maxlength="2"  value="<%= checksParam.getE01CHKBNK().trim()%>" readonly> -->
                   <input type="text" name="E01CHKBNK" size="3" maxlength="2"  value="<%= userPO.getBank().trim()%>" readonly>
                </b></div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Moneda :</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><b><font face="Arial"><font face="Arial"><font size="2"> 
               <input type="text" name="E01CHKCCY" size="4"  maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </font></font></font></b></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Tipo de Cuenta:</b></div>
            </td>
            <td nowrap width="20%" > <b> 
              <input type="text" name="E01CHKATY" size="5" maxlength="4"  value="<%= userPO.getType().trim()%>" readonly>
              </b></td>
            <td nowrap width="16%" > 
              <div align="right"><b>Tipo de Chequera :</b></div>
            </td>
            <td nowrap colspan="3" ><b> <!--<a href="javascript:GetCodeCNOFC('E01CHKTCB','36')">-->
              <%if (userPO.getOption().equals("New")){ %>
              <input type="text" size="3" maxlength="2" name="E01CHKTCB" value="<%= checksParam.getE01CHKTCB().trim()%>">
              <a href="javascript:GetCodeDescCNOFC('E01CHKTCB','E01CHKDES','CH')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a>
				<% } else { %>
              <input type="text" size="3" maxlength="2" name="E01CHKTCB" value="<%= checksParam.getE01CHKTCB().trim()%>" readonly>		
			<% } %>
              </b></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Informaci&oacute;n B&aacute;sica</h4>  
  
  <%int row = 0; %>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="16%"> 
              <div align="right">Descripci&oacute;n :</div>
            </td>
            <td nowrap colspan="3"> 
                <eibsinput:text name="checksParam" property="E01CHKDES" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="false"/>
           </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="16%" height="23"> 
              <div align="right">N&uacute;mero de Cheques :</div>
            </td>
            <td nowrap height="23"> 
             <input type="text" name="E01CHKNCK" size="5" maxlength="4" value="<%= checksParam.getE01CHKNCK().trim()%>" onKeypress="enterInteger(event)">
           </td>
            <td nowrap height="23"> 
              <div align="right">Impuesto por Cheque :</div>
            </td>
            <td nowrap height="23">
                   <eibsinput:text name="checksParam" property="E01IMPCHK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
 			</td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="16%" height="19"> 
              <div align="right">Comisi&oacute;n de venta:</div>
            </td>
            <td nowrap height="19" > 
              <input type="text" name="E01CHKUC1" maxlength="4" size="5" value="<%= checksParam.getE01CHKUC1().trim()%>" >
              <a href="javascript:GetCommDef('E01CHKUC1',' ')">
     		  <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
          </td>
          <td nowrap width="16%" height="19"> 
              <div align="right">Cobra Impuesto de Timbre :</div>
            </td>
            <TD nowrap width="28%" height="19">
              <INPUT type="radio" name="E01CHKFL3" value="Y" <%if (!checksParam.getE01CHKFL3().equals("N")) out.print("checked"); %>>
              Si 
              <INPUT type="radio" name="E01CHKFL3" value="N" <%if (checksParam.getE01CHKFL3().equals("N")) out.print("checked"); %>>
              No </TD>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="16%" height="19"> 
              <div align="right">M&eacute;todo Cobro Comisi&oacute;n :</div>
            </td>
            <td nowrap width="28%" height="19">	
              <input type="radio" name="E01CHKFG2" value="1"  <%if (checksParam.getE01CHKFG2().equals("1")) out.print("checked"); %>>Solicitud 
              <input type="radio" name="E01CHKFG2" value="2"  <%if (!checksParam.getE01CHKFG2().equals("1")) out.print("checked");%>>Entrega 
            </td>
            <td nowrap width="16%" height="19"> 
              <div align="right">Reposici&oacute;n Automatica :</div>
            </td>
            <td nowrap width="28%" height="19">
              <input type="radio" name="E01CHKFL1" value="1"  <%if (checksParam.getE01CHKFL1().equals("1")) out.print("checked"); %>>
              Si 
              <input type="radio" name="E01CHKFL1" value="2"  <%if (!checksParam.getE01CHKFL1().equals("1")) out.print("checked"); %>>
              No </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="16%" height="19"> 
              <div align="right">Balance M&iacute;nimo :</div>
            </td>
            <td nowrap height="19" > 
                <eibsinput:text name="checksParam" property="E01CHKMIN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="false"/>
          </td>
           <td nowrap width="16%" height="19"> 
              <div align="right">Cheques Devueltos :</div>
            </td>
            <td nowrap height="19" > 
             <input type="text" name="E01CHKRCO" size="4" maxlength="3" value="<%= checksParam.getE01CHKRCO().trim()%>" onKeypress="enterInteger(event)">
            </td>
          </tr>
         
        </table>
                </table>
  <h4>Informaci&oacute;n Anulaci&oacute;n</h4>  
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="16%" height="19"> 
              <div align="right">Comisi&oacute;n de Anulaci�n :</div>
            </td>
            <td nowrap height="19" > 
              <input type="text" name="E01CHKUC2" maxlength="4" size="5" value="<%= checksParam.getE01CHKUC2().trim()%>" >
              <a href="javascript:GetCommDef('E01CHKUC2',' ')">
     		  <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
          </td>
           <td nowrap width="16%" height="19" align="right">D�as para Anulaci&oacute;n Autom�tica :</td>
           <td nowrap width="28%" height="19">
            <INPUT type="text"	name="E01CHKANM" size="4" maxlength="3"	value="<%= checksParam.getE01CHKANM().trim()%>" onKeypress="enterInteger(event)">
           </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <div align="center">
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>
  </form>
</body>
</html>
