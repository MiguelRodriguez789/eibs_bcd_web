<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Maestro de Interfaces</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<jsp:useBean id="intDetails" class="datapro.eibs.beans.EDD400001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

</head>
<body>
<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
%>
<H3 align="center">Maestro de Compañias (Pensiones/Nómina/FMH) <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="interface_maintenance.jsp, EDD4000"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDD4000" id="form1">
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
              <div align="left"> 
                <input type="text" name="E01DDCBNK" size="3" maxlength="2"  value="<%= intDetails.getE01DDCBNK().trim()%>" >
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Código de Compañia :</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
                <input type="text" name="E01DDCCIA" size="4"  maxlength="3" value="<%= intDetails.getE01DDCCIA().trim()%>">
                </font></font></font></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Informaci&oacute;n de la Compañia</h4>  

			<table class="tableinfo">
				<tr bordercolor="#FFFFFF">
					<td nowrap width="184">
				<tr id="trdark">
					<td nowrap width="29%">
					<div align="right">Número de Cliente :</div>
					</td>
					<td nowrap width="34%"><input type="text" name="E01DDCCUN"
						maxlength="9" size="10"
						value="<%= intDetails.getE01DDCCUN().trim()%>"></td>
					<td nowrap width="20%">
					<div align="right">Número de Lote :</div>
					</td>
					<td nowrap width="18%"><input type="text" name="E01DDCBTH"
						maxlength="5" size="6"
						value="<%= intDetails.getE01DDCBTH().trim()%>"></td>

				</tr>
				<tr id="trclear">
					<td nowrap width="29%">
					<div align="right">Número de Empleados :</div>
					</td>
					<td nowrap width="34%"><input type="text" name="E01DDCEMP"
						maxlength="5" size="7"
						value="<%= intDetails.getE01DDCEMP().trim()%>"></td>
					<td nowrap width="20%">
					<div align="right">Fecha de Afiliación :</div>
					</td>
					<td nowrap width="18%">
						<eibsinput:date name="intDetails" fn_year="E01DDCAFY" fn_month="E01DDCAFM" fn_day="E01DDCAFD" />
				</tr>

			</table>


  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
    <tr> 
      <td nowrap width="737">
		<table cellpadding=2 cellspacing=0 width="100%" border="0">
			<tr id="trdark">
				<td nowrap width="187">
				<div align="center">Descripcion</div>
				</td>
				<td nowrap width="59">
				<div align="center">Banco</div>
				</td>
				<td nowrap width="92">
				<div align="center">Sucursal</div>
				</td>
				<td nowrap width="87">
				<div align="center">Moneda</div>
				</td>
				<td nowrap width="162">
				<div align="center">Cuenta Contable</div>
				</td>
				<td nowrap width="150">
				<div align="center">Cuenta</div>
				</td>
			</tr>
			<tr id="trclear">
				<td nowrap width="187">
				<div align="right">Cuenta de Débito :</div>
				</td>

				<td nowrap width="59">
				<div align="center"><input type="text" readonly name="E01DDCDBK" id="E01DDCDBK"
					size="2" maxlength="2"
					value="<%= intDetails.getE01DDCDBK().trim()%>"></div>
				</td>

				<td nowrap width="92">
				<div align="center"><input type="text" readonly name="E01DDCDBR"
					size="4" maxlength="4"
					value="<%= intDetails.getE01DDCDBR().trim()%>">
				</div>
				</td>

				<td nowrap width="87">
				<div align="center"><input type="text" readonly name="E01DDCDCY"
					size="3" maxlength="3"
					value="<%= intDetails.getE01DDCDCY().trim()%>" >
				</div>
				</td>

				<td nowrap width="162">
				<div align="center"><input type="text" readonly name="E01DDCDGL"
					size="18" maxlength="16"
					value="<%= intDetails.getE01DDCDGL().trim()%>">
				</div>
				</td>

				<td nowrap width="150">
				<div align="center"><input type="text" name="E01DDCDAC" size="12"
					maxlength="12" value="<%= intDetails.getE01DDCDAC().trim()%>"
					class="context-menu-help" onmousedown="init(accountHelp,this.name,document.getElementById('E01DDCDBK').value,'','','','RT')">
				</div>
				</td>
			</tr>

			<tr id="trdark">
				<td nowrap width="187">
				<div align="right">Cuenta de Crédito :</div>
				</td>

				<td nowrap width="59">
				<div align="center"><input type="text" readonly name="E01DDCCBK"
					size="2" maxlength="2"
					value="<%= intDetails.getE01DDCCBK().trim()%>"></div>
				</td>

				<td nowrap width="92">
				<div align="center"><input type="text" readonly name="E01DDCCBR"
					size="4" maxlength="4"
					value="<%= intDetails.getE01DDCCBR().trim()%>">
				</div>
				</td>

				<td nowrap width="87">
				<div align="center"><input type="text" readonly name="E01DDCCCY"
					size="3" maxlength="3"
					value="<%= intDetails.getE01DDCCCY().trim()%>">
				</div>
				</td>

				<td nowrap width="162">
				<div align="center"><input type="text" readonly name="E01DDCCGL"
					size="18" maxlength="16"
					value="<%= intDetails.getE01DDCCGL().trim()%>">
				</div>
				</td>

				<td nowrap width="150">
				<div align="center"><input type="text" name="E01DDCCAC" size="12"
					maxlength="12" value="<%= intDetails.getE01DDCCAC().trim()%>"
					class="context-menu-help" 
					onmousedown="init(accountHelp,this.name,document.getElementById('E01DDCCBK').value,'','','','RT')">
				</div>
				</td>
			</tr>

			<tr id="trclear">
				<td nowrap width="187">
				<div align="right">Cuenta de Cobro de Comisión :</div>
				</td>

				<td nowrap width="59">
				<div align="center"><input type="text" readonly name="E01DDCRBK" id="E01DDCRBK"
					size="2" maxlength="2"
					value="<%= intDetails.getE01DDCRBK().trim()%>"></div>
				</td>

				<td nowrap width="92">
				<div align="center"><input type="text" readonly name="E01DDCRBR"
					size="4" maxlength="4"
					value="<%= intDetails.getE01DDCRBR().trim()%>">
				</div>
				</td>

				<td nowrap width="87">
				<div align="center"><input type="text" readonly name="E01DDCRCY"
					size="3" maxlength="3"
					value="<%= intDetails.getE01DDCRCY().trim()%>">
				</div>
				</td>

				<td nowrap width="162">
				<div align="center"><input type="text" readonly name="E01DDCRGL"
					size="18" maxlength="16"
					value="<%= intDetails.getE01DDCRGL().trim()%>">
				</div>
				</td>

				<td nowrap width="150">
				<div align="center"><input type="text" name="E01DDCRAC" size="12"
					maxlength="12" value="<%= intDetails.getE01DDCRAC().trim()%>"
					class="context-menu-help" onmousedown="init(accountHelp,this.name,document.getElementById('E01DDCRBK').value,'','','','RT')">
				</div>
				</td>
			</tr>

			<tr id="trdark">
				<td nowrap width="187">
				<div align="right">Cuenta de Disponibilidad :</div>
				</td>

				<td nowrap width="59">
				<div align="center"><input type="text" readonly name="E01DDCTBK" id="E01DDCTBK"
					size="2" maxlength="2"
					value="<%= intDetails.getE01DDCTBK().trim()%>"></div>
				</td>

				<td nowrap width="92">
				<div align="center"><input type="text" readonly name="E01DDCTBR"
					size="4" maxlength="4"
					value="<%= intDetails.getE01DDCTBR().trim()%>">
				</div>
				</td>

				<td nowrap width="87">
				<div align="center"><input type="text" readonly name="E01DDCTCY"
					size="3" maxlength="3"
					value="<%= intDetails.getE01DDCTCY().trim()%>">
				</div>
				</td>

				<td nowrap width="162">
				<div align="center"><input type="text" readonly name="E01DDCTGL"
					size="18" maxlength="16"
					value="<%= intDetails.getE01DDCTGL().trim()%>">
				</div>
				</td>

				<td nowrap width="150">
				<div align="center"><input type="text" name="E01DDCTAC" size="12"
					maxlength="12" value="<%= intDetails.getE01DDCTAC().trim()%>"
					class="context-menu-help" onmousedown="init(accountHelp,this.name,focument.getElementById('E01DDCTBK').value,'','','','RT')">
				</div>
				</td>
			</tr>
		</table>
		</td>
  </table>
  <br>
          <div align="center"> 
            <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
          </div>
  </form>
</body>
</html>
