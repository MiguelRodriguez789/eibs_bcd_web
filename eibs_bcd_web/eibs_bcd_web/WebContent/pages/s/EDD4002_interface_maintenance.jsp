<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Transacciones en Cuentas de Compa�ias (Pensiones/N�mina/FMH)</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<jsp:useBean id="intDetails" class="datapro.eibs.beans.EDD400201Message"  scope="session" />
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


<H3 align="center">Transacciones en Cuentas de Compa�ias (Pensiones/N�mina/FMH)<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="interface_maintenance.jsp, EDD4002"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDD4002" id="form1">
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
              <div align="right"><b>C�digo de Compa�ia :</b></div>
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
  <h4>Informaci&oacute;n de la Transacci�n</h4>  

			<table class="tableinfo">
				<tr bordercolor="#FFFFFF">
				<tr id="trdark">
					<td nowrap width="35%">
					<div align="right">Valor Transacci�n :</div>
					</td>
					<td nowrap width="34%"><input type="text" name="E01AMOUNT"
						maxlength="9" size="11"
						value="<%= intDetails.getE01AMOUNT().trim()%>"></td>
				</tr>
	    	    <tr id="trclear"> 
					<td nowrap width="20%">
					<div align="right">Fecha Valor :</div>
					</td>
					<td nowrap width="18%">
						<eibsinput:date name="intDetails" fn_year="E01VALDTY" fn_month="E01VALDTM" fn_day="E01VALDTD" readonly="true"/>
					</td>
				</tr>
	    	    <tr id="trdark"> 
    	        <td nowrap width="35%"> 
            	  	<div align="right">Motivo : </div>
            	</td>
            	<td nowrap>  
                	<input type="text" name="E01CNORCD" size="5" maxlength="4" value="<%=intDetails.getE01CNORCD()%>">
					<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0" >
    	        	<A href="javascript:GetCodeCNOFC('E01CNORCD','CN')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></A>
        	        <input type="text" name="E01CNODSC" size="40" maxlength="35" value="<%=intDetails.getE01CNODSC()%>">
				</td>
		        </tr>

	            <tr id="trclear"> 
      		      <td nowrap width="35%" > 
            	  <div align="right">Afectaci�n Contable : </div>
            	  </td>
	              <td nowrap>               
                <select name="E01DEBCRE">
                 	<option value="D" <% if (intDetails.getE01DEBCRE().trim().equals("D")) out.print("selected"); %>>D�bito</option>
                	<option value="C" <% if (intDetails.getE01DEBCRE().trim().equals("C")) out.print("selected"); %>>Cr�dito</option>
                </select>                 
            </td>
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
				<div align="right">Cuenta de Abono :</div>
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
					value="<%= intDetails.getE01DDCDCY().trim()%>">
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
				<div align="right">Cuenta de Cargo :</div>
				</td>

				<td nowrap width="59">
				<div align="center"><input type="text" readonly name="E01DDCCBK" id="E01DDCCBK"
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
					class="context-menu-help" onmousedown="init(accountHelp,this.name,document.getElementById('E01DDCCBK').value,'','','','RT')">
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
