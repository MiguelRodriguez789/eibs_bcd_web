<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields" %>

<html>
<head>
<title>Parametros de Cheques Oficiales / Orden de Pago</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

</head>

<jsp:useBean id="checksParam" class="datapro.eibs.beans.EOF000001Message"  scope="session" />
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

  
 <% int row = 0;%>

<H3 align="center">Parametros de Control de Cheques<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="of_chk_parameters_details, EOF0000"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEOF0000" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="14">
 
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" >
              <div align="right"><b>Banco :</b></div>
            </td>
            <td nowrap width="20%" ><b>
              <input type="text" name="E01OFCBNK" size="3" maxlength="2"  value="<%= checksParam.getE01OFCBNK().trim()%>" readonly>
              </b></td>
            <td nowrap width="16%" >
              <div align="right"><b>Moneda :</b></div>
            </td>
            <td nowrap colspan="3" >
              <div align="left">
                <input type="text" name="E01OFCCCY" size="4" maxlength="3" value="<%= checksParam.getE01OFCCCY().trim()%>" readonly>
                </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Informaci&oacute;n B&aacute;sica</h4>  
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Formato :</b></div>
            </td>
            <% if (userPO.getPurpose().equals("NEW")){ %>
            <td nowrap width="20%" > 
              <div align="left"> <b> 
                <input type="text" name="E01OFCFTY" size="3" maxlength="2"  value="<%= checksParam.getE01OFCFTY().trim()%>" >
                </b></div>
            </td>
            <% }else{ %>
            <td nowrap width="20%" > 
              <div align="left"> <b> 
                <input type="text" name="E01OFCFTY" readonly size="3" maxlength="2"  value="<%= checksParam.getE01OFCFTY().trim()%>" >
                </b></div>
            </td>
            <% } %>
            <td nowrap width="16%" > 
              <div align="right"><b>Descripci&oacute;n :</b></div>
            </td>
           <% if (userPO.getPurpose().equals("NEW")){ %>
            <td nowrap colspan="3" > 
              <div align="left"><b><font face="Arial"><font face="Arial"><font size="2"> 
                <eibsinput:text name="checksParam" property="E01OFCDSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="false"/>
            </font></font></font></b></div>
            </td>
            <% }else{ %>
            <td nowrap colspan="3" > 
              <div align="left"><b><font face="Arial"><font face="Arial"><font size="2"> 
                <eibsinput:text name="checksParam" property="E01OFCDSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </font></font></font></b></div>
            </td>
            <%} %>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Cuenta Contable Cheques por Imprimir :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
              <eibsinput:help name="checksParam" property="E01OFCXPR"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER%>"
					fn_param_one="E01OFCXPR"
					fn_param_two="document.forms[0].E01OFCBNK.value" fn_param_three="document.forms[0].E01OFCCCY.value" />
            </div>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Cuenta Contable Cheques Impresos :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
              <eibsinput:help name="checksParam" property="E01OFCPRT"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER%>"
					fn_param_one="E01OFCPRT"
					fn_param_two="document.forms[0].E01OFCBNK.value" fn_param_three="document.forms[0].E01OFCCCY.value" />
			</div>		
           </td>
          </tr>
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
           <td nowrap width="25%"> 
              <div align="right">Cuenta Contable Retenciones:</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
              <eibsinput:help name="checksParam" property="E01OFCWTH"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER%>"
					fn_param_one="E01OFCWTH"
					fn_param_two="document.forms[0].E01OFCBNK.value" fn_param_three="document.forms[0].E01OFCCCY.value" />
					</div>
         </td>
            <td nowrap width="25%"> 
              <div align="right">Porcentaje por Retenciones :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
                <eibsinput:text name="checksParam" property="E01OFCWTP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" readonly="false"/>
          </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">N&uacute;mero de D&iacute;as Caducidad Pre-expedición :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
                <eibsinput:text name="checksParam" property="E01OFCVYS" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="3" size="4"/>
              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Tipo de N&uacute;meraci&oacute;n :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
                <input type="text" name="E01OFCNXO" maxlength="1" size="2" value="<%= checksParam.getE01OFCNXO().trim()%>" readonly>
                <a href="javascript:GetCode('E01OFCNXO','STATIC_of_chk_params_num.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Lineas al Final Varios Pagos en 1 Cheque :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
                <eibsinput:text name="checksParam" property="E01OFCPCK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="2" size="3"/>
              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Tipo de Documento :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left">
				<SELECT name="E01BAFDTY">
					<OPTION value="1" <% if(checksParam.getE01BAFDTY().equals("1")) out.print("selected");%>>Cheque de Gerencia</OPTION>
					<OPTION value="3" <% if(checksParam.getE01BAFDTY().equals("3")) out.print("selected");%>>Giro/Orden de Pago</OPTION>
					<OPTION value="4" <% if(checksParam.getE01BAFDTY().equals("4")) out.print("selected");%>>Cheque a Terceros</OPTION>
				</SELECT></div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Cuenta Contable Cheque Inactivo :</div>
            </td>
            <td nowrap width="25%"> 
              <eibsinput:help name="checksParam" property="E01OFCGI1"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER%>"
					fn_param_one="E01OFCGI1"
					fn_param_two="document.forms[0].E01OFCBNK.value" fn_param_three="document.forms[0].E01OFCCCY.value" />
            </td>
            <td nowrap width="25%"> 
              <div align="right">Número de D&iacute;as Cheque Inactivo :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
                 <eibsinput:text name="checksParam" property="E01OFCDI1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Cuenta Contable Cheque Prescrito :</div>
            </td>
            <td nowrap width="25%"> 
              <eibsinput:help name="checksParam" property="E01OFCGI2"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER%>"
					fn_param_one="E01OFCGI2"
					fn_param_two="document.forms[0].E01OFCBNK.value" fn_param_three="document.forms[0].E01OFCCCY.value" />
            </td>
            <td nowrap width="25%"> 
              <div align="right">Número de D&iacute;as Cheque Prescrito :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
 	             <eibsinput:text name="checksParam" property="E01OFCDI2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Tipo de Proceso :</div>
            </td>
            <td nowrap width="25%"> 
             <div align="left">
				<SELECT name="E01OFCPRC">
					<OPTION value="O" <% if(checksParam.getE01OFCPRC().equals("O")) out.print("selected");%>>ONLINE</OPTION>
					<OPTION value="B" <% if(checksParam.getE01OFCPRC().equals("B")) out.print("selected");%>>BATCH/MASIVO</OPTION>
				</SELECT></div>
            </td>          
            <td nowrap width="25%"> 
              <div align="right">Concepto Contable :</div>
            </td>
            <td nowrap width="25%"> 
            <div align="left" > 
            	<input type=text name="E01OFCCON" id="E01OFCCON" value="<%= checksParam.getE01OFCCON().trim()%>" size="3" maxlength="3"> 
            	<input type=HIDDEN name="C01OFCCON" value="<%= checksParam.getC01OFCCON().trim()%>">            	          	
            	<input type="text" name="D01OFCCON" size="25" maxlength="25" readonly value="<%= checksParam.getD01OFCCON().trim()%>"
            	 class="context-menu-help" onmousedown="init(conceptHelp,this.name,document.forms[0].E01OFCBNK.value,'','C01OFCCON','E01OFCCON','OF')">
            </div>       
            </td>
          </tr>          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Forma eIBS :</div>
            </td>
            <td nowrap width="25%">
              <input type="text" name="E01OFCPTH" maxlength="80" size="55" value="<%= checksParam.getE01OFCPTH().trim()%>" >
            </td>
            <td nowrap width="25%"> 
              <div align="right">Código de Comisi&oacute;n :</div>
            </td>
            <td nowrap width="25%">
              <input type="text" name="E01OFCCO1" maxlength="4" size="5" value="<%= checksParam.getE01OFCCO1().trim()%>" >
              <a href="javascript:GetCommDef('E01OFCCO1','D01OFCCO1')">
     		  <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
              <input type="text" name="D01OFCCO1" maxlength="30" size="30" value="<%= checksParam.getD01OFCCO1().trim()%>" readonly >
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
         	 <td nowrap width="25%"> 
            	<div align="right">Tipo Papel Valor :</div>
             </td>
             <td nowrap width="25%"> 
            	<input type="text" name="E01OFCTPV" size="4" maxlength="4" value="<%= checksParam.getE01OFCTPV().trim()%>">
            	<a href="javascript:GetCodeCNOFC('E01OFCTPV','YJ')">
            	<img src="<%=request.getContextPath()%>/images/1b.gif" alt="ayuda" align="bottom" border="0" ></a>
             </td>
             <td nowrap width="25%"> 
            	<div align="right">Subtipo Papel Valor :</div>
             </td>
             <td nowrap width="25%"> 
            	<input type="text" name="E01OFCSPV" size="4" maxlength="4" value="<%= checksParam.getE01OFCSPV().trim()%>">
            	<a href="javascript:GetCodeCNOFC('E01OFCSPV','YI')">
            	<img src="<%=request.getContextPath()%>/images/1b.gif" alt="ayuda" align="bottom" border="0" ></a>
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
