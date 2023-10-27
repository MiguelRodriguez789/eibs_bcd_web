<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Cajero</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="brnDetails" class="datapro.eibs.beans.EDD031001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "EDD031001Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />


<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">"); 
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }

    int row = 0;
    String sTitle = "";
    int sValue = 600;
     
   if (request.getParameter("SCREEN") != null){
      sValue = Integer.parseInt(request.getParameter("SCREEN"));
      if (sValue == 600)
        sTitle = "Mantenimiento Cajero";                
      else
       	sTitle = "Nuevo Cajero";                
   } 


%>

<H3 align="center"><%=sTitle%> <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="teller_maintenance.jsp, EDD0310"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.teller.JSEDD0310" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="<%=sValue%>">
  <input type="hidden" id="E01TLMTYP" name="E01TLMTYP" value="<%= brnDetails.getE01TLMTYP().trim()%>" >
  
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Usuario IBSBranch :</b></div>
            </td>
            <td nowrap width="14%"> 
              <div align="left"> 
                <input type="text" name="E01TLMTID" size="11" maxlength="10" value="<%= brnDetails.getE01TLMTID().trim()%>"
					   readonly>
              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="right"><b>Moneda :</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
                <input type="text" name="E01TLMCCY" size="4" maxlength="3" value="<%= brnDetails.getE01TLMCCY().trim()%>" 
					   readonly> 
                </font></font></font></div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nivel Cajero:</b></div>
            </td>
            <td nowrap width="50%"> 
              <div align="left"> 
                <input type="text" name="D01TLMLEV" size="35" maxlength="32" value = "<%= brnDetails.getD01TLMLEV().trim()%>"  readonly>
                <input type="text" name="E01TLMLEV" size="4" maxlength="4" value="<%= brnDetails.getE01TLMLEV().trim()%>" readonly>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <div id="maintenace" style="visibility:visible">
  <h4>Información Cajero</h4>  
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="50%" height="23"> 
              <div align="right">Banco del Cajero :</div>
            </td>
            <td nowrap height="23" width="60%" colspan="3"> 
              <eibsinput:text name="brnDetails" property="E01TLMBNK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK%>"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="50%" height="23"> 
              <div align="right">Sucursal del Cajero :</div>
            </td>
            <td nowrap height="23" width="60%" colspan="3"> 
              <eibsinput:help name="brnDetails" property="E01TLMBRN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH%>" 
          	    	fn_param_one="E01TLMBRN" fn_param_two="document.forms[0].E01TLMBNK.value" />
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
          	<td nowrap width="50%" height="23"> 
              <div align="right">Usuario IBS :</div>
            </td>
            <td nowrap height="23" width="60%" colspan="3">
              	<input type="text"  name="E01TLMUSU" size="28" maxlength="25" value="<%= brnDetails.getE01TLMUSU().trim()%>">          	    	
      			<a href="javascript:GetCustomerDetails3('E01TLMUSU','','','', '', '', '', 'E01TLMBTH')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"  ></a>    	    	
            </td>
          </tr>
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="50%" height="23">
              <% if (brnDetails.getE01TLMSOP().trim().equals("1") || (brnDetails.getE01TLMSOP().trim().equals("5"))) {%>
            		<div align="right">Efectivo Máximo Permitido : </div>
              	<% } else { %>
              		<div align="right">Monto Sobregiro : </div>
              	<%	} %>
            </td>
            <td nowrap height="23" colspan="3"> 
                <eibsinput:text name="brnDetails" property="E01TLMMXC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="50%" height="23"> 
              <% if (brnDetails.getE01TLMSOP().trim().equals("1") || (brnDetails.getE01TLMSOP().trim().equals("5"))) {%>
            		<div align="right">Límite de Retiros en Efectivo :</div>
              	<% } else { %>
              		<div align="right">Monto Retiros : </div>
              	<%	} %> 
            </td>
            <td nowrap height="23" colspan="3"> 
                <eibsinput:text name="brnDetails" property="E01TLMFLW" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="50%" height="23"> 
            	<% if (brnDetails.getE01TLMSOP().trim().equals("1") || (brnDetails.getE01TLMSOP().trim().equals("5"))) {%>
            		<div align="right">Límite de Depósitos Efectivo : </div>
              	<% } else { %>
              		<div align="right">Monto Depósitos : </div>
              	<%	} %> 
            </td>
            <td nowrap height="23" colspan="3"> 
                <eibsinput:text name="brnDetails" property="E01TLMFLD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
            </td>
          </tr>
          <% if (brnDetails.getE01TLMSOP().trim().equals("1") || (brnDetails.getE01TLMSOP().trim().equals("5"))) {%>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="50%" height="23"> 
              <div align="right">Cuenta Contable de Efectivo:</div>
            </td>
            <td nowrap height="23" colspan="3"> 
              <eibsinput:help name="brnDetails" property="E01TLMGLN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER%>" 
          	    	fn_param_one="E01TLMGLN" fn_param_two="document.forms[0].E01TLMBNK.value" fn_param_three="document.forms[0].E01TLMCCY.value"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="50%" height="23"> 
              <div align="right">Cheque ON-US G/L No. (No Retenidos) :</div>
            </td>
            <td nowrap height="23" colspan="3"> 
              <eibsinput:help name="brnDetails" property="E01TLMONG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER%>" 
          	    	fn_param_one="E01TLMONG" fn_param_two="document.forms[0].E01TLMBNK.value" fn_param_three="document.forms[0].E01TLMCCY.value"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="50%" height="23"> 
              <div align="right">Cheque ON-US G/L No. (Con Retenciones) :</div>
            </td>
            <td nowrap height="23" colspan="3"> 
              <eibsinput:help name="brnDetails" property="E01TLMOHG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER%>" 
          	    	fn_param_one="E01TLMOHG" fn_param_two="document.forms[0].E01TLMBNK.value" fn_param_three="document.forms[0].E01TLMCCY.value"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="50%" height="23"> 
              <div align="right">Cuenta Contable Cheque :</div>
            </td>
            <td nowrap height="23" colspan="3"> 
              <eibsinput:help name="brnDetails" property="E01TLMLOG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER%>" 
          	    	fn_param_one="E01TLMLOG" fn_param_two="document.forms[0].E01TLMBNK.value" fn_param_three="document.forms[0].E01TLMCCY.value"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="50%" height="23"> 
              <div align="right">Cuenta Contable de Cheque No Local :</div>
            </td>
            <td nowrap height="23" colspan="3"> 
              <eibsinput:help name="brnDetails" property="E01TLMNLG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER%>" 
          	    	fn_param_one="E01TLMNLG" fn_param_two="document.forms[0].E01TLMBNK.value" fn_param_three="document.forms[0].E01TLMCCY.value"/>
            </td>
          </tr>

          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="50%" height="23"> 
              <div align="right">Numero de Lote Para el Cajero :</div>
            </td>
            <td nowrap height="23" colspan="3"> 
              <input type="text" name="E01TLMBTH" size="6"	
                     maxlength="5" value="<%= brnDetails.getE01TLMBTH().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="50%" height="23"> 
              <div align="right">Numero Centro de Costo Cajero :</div>
            </td>
            <td nowrap height="23" colspan="3"> 
              <eibsinput:help name="brnDetails" property="E01TLMCST" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_COST_CENTER%>" 
          	    	fn_param_one="E01TLMCST" fn_param_two="document.forms[0].E01TLMBNK.value" />
            </td>
          </tr>
          <%}%>   
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="50%" height="23"> 
              <div align="right">Estado Cajero :</div>
            </td>
            <td nowrap height="23" colspan="3"> 
              <select name="E01TLMCLF">
                <option value="P" <% if(brnDetails.getE01TLMCLF().equals("P")) { out.print("selected"); }%>>Pendiente por Completar</option>            
                <option value="A" <% if(brnDetails.getE01TLMCLF().equals("A")) { out.print("selected"); }%>>Activo</option>
                <option value="I" <% if(brnDetails.getE01TLMCLF().equals("I")) { out.print("selected"); }%>>Inactivo</option>
              </select>
            </td>
          </tr>          
       

        </table>
      </td>
    </tr>
  </table>
  </div>  
  
  <br>
<% 	if (userPO.getPurpose().equals("MAINTENANCE") || userPO.getPurpose().equals("NEW")) { %>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    	<tr bgcolor="#FFFFFF"> 
      		<td width="33%" align="center"><input type="checkbox" name="H01FLGWK2" value="1" >Aceptar con Avisos</td>
    	</tr>  
    <table width="100%">		
  	<tr>
  		<td width="100%" align="center"> 
     		<input id="EIBSBTN" type=submit name="Submit" value="Enviar" >
  		</td> 
  	</tr>	   	
 	</table>
<% } %> 
  
  </form>
</body>
</html>
