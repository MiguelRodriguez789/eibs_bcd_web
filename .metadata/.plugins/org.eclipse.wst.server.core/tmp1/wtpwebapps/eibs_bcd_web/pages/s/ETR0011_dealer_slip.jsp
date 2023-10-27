<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %> 
<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.eibs.constants.HelpTypes"%>
<html>
<head>
<title>Treasury Module</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="base" class="datapro.eibs.beans.ETR000001Message"  scope="session" /> 
<jsp:useBean id="deal" class="datapro.eibs.beans.ETR001101Message"  scope="session" />    
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "trOption" class= "datapro.eibs.beans.TrOption"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery-1.10.2.min.js"></script>
 
<script type="text/javascript">

 	function goAction(op) {
 		switch (op){
 		// Submit Data
 		case 5:  
 		case 6:
 			{
    		document.forms[0].SCREEN.value = op;
    		$("#target :input").prop("disabled", false);
			submitForm();
       		break;
        	}
        // Delete	
        case 4:  {
        	if (!confirm("Desea borrar este Ticket?")) {
				return;
			}
    		document.forms[0].SCREEN.value = '4';
			submitForm();
       		break;
        	}	
        // Exit
        case 1:  {
    		pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.treasury.JSETR0000?SCREEN=1";
			window.location.href=pg;
        	break;
 			}
 		// Default
 		default: {
 			}
		}
	}
	
</SCRIPT>
<% 
 
 if ( !error.getERRNUM().equals("0")  ) {
 	 error.setERRNUM("0");
    out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }
     
 if (deal.getE01DLSACC().toString().equals("0")) {
 	deal.setE01DLSCUN(base.getR01TRECUN());
 	deal.setE01DLSTYP(base.getR01TRETYP());
 	deal.setE01DLSACD(base.getR01TREACD());		
 	deal.setE01DLSPRO(base.getR01TREPRD());	
 	deal.setD01PRDDSC(base.getR01TREPDS());
 	deal.setE01DLSCCY(base.getR01TRECCY());
 	deal.setD01DLSCP1(base.getR01TRENA1());			
 }	
 String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"campo obligatorio\" align=\"bottom\">";  
 String help = "<img src=\"" + request.getContextPath() + "/images/1b.gif\" alt=\"Ayuda\" align=\"bottom\" border=\"0\">"; 
%> 

</head>

<body>

<h3 align="center">
	<% if (deal.getH01SCRCOD().toString().equals("05")) { %>
	CONFIRMACION - 
	<% } %>
	Tesorería - Ingreso de Trade Ticket (Dealer Slip) - <%= userPO.getType()%>- <%= base.getR01TREDSC()%>
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="dealer_slip.jsp,ETR0011"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.treasury.JSETR0011" id="target" >
  <input type="hidden" name="E01DLSCMM"  value="<%= deal.getE01DLSCMM()%>" >
  <input type="hidden" name="E01DLSTYP"  value="<%= userPO.getType()%>" >
  <input type="hidden" name="E01DLSDID"  value="<%= deal.getE01DLSDID()%>" >
  <input type="hidden" name="E01DLSDDM"  value="<%= deal.getE01DLSDDM()%>" >
  <input type="hidden" name="E01DLSDDD"  value="<%= deal.getE01DLSDDD()%>" >
  <input type="hidden" name="E01DLSDDY"  value="<%= deal.getE01DLSDDY()%>" >
  <input type="hidden" name="E01DEADLC"  value="<%= deal.getE01DEADLC()%>" >
  
  <table class="tableinfo" width="100%" >
    <tr id="trclear"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="trclear"> 
            <td nowrap width="15%" align="right"><b>Contraparte :</b></td>
            <td nowrap width="85%" align="left"> 
                <input type="hidden" name="E01DLSCUN"  value="<%= deal.getE01DLSCUN()%>" >  
                <input type="hidden" name="D01DLSCP1"  value="<%= deal.getD01DLSCP1()%>" >
                <%= deal.getE01DLSCUN()%> - <%= deal.getD01DLSCP1()%>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="15%"  align="right"><b>Localización :</b></td>
            <td nowrap width="85%" >
              <input type="hidden" name="D01DLSCP2"  value="<%= deal.getD01DLSCP2()%>" >
              <%= deal.getD01DLSCP2()%> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" align="right">
                <input type=HIDDEN name="SCREEN" value="1">
            </td>
            <td nowrap width="85%" >
              <input type="hidden" name="D01DLSCP3"  value="<%= deal.getD01DLSCP3()%>" >
              <%= deal.getD01DLSCP3()%>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <br>
  <table  class="tableinfo" width="100%">
    <tr > 
     	<td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
       		<tr id="trdark">
				<td nowrap width="25%" align="right"></td>
            	<td nowrap width="15%" align="left"></td>
				<td nowrap width="10%" align="left"></td>
            	<td nowrap width="25%" align="right"></td>
				<td nowrap width="25%" align="right">
					Fecha Pacto : <%= Util.formatDate(deal.getE01DLSDDM(),deal.getE01DLSDDD(),deal.getE01DLSDDY())%>
				</td>
			</tr>
          	<tr id="trclear"> 
            	<td nowrap width="25%" align="right">Número de Tiquete : </td>
            	<td nowrap width="15%" align="left">
            		<INPUT type="text" name="E01DLSACC" size="13" maxlength="12" readonly value="<%= deal.getE01DLSACC() %>">
            	</td>
				<td nowrap width="10%" align="left"> </td>
				<td nowrap width="25%" align="center"> 
					<Div id="DOPE">
					<B>Tipo de Operación : </B><br>
              		<SELECT class="inputs" name="E01DLSSBT" size="1"></SELECT>
              		<%=mandatory %>
              		</Div>
            	</td>
            	<td nowrap width="25%" align="left">
				</td>
          	</tr>
           	<tr id="trdark"> 
            	<td nowrap width="25%" align="right">Moneda : </td>
            	<td nowrap width="15%" align="left"> 
	            	<input type="text" name="E01DLSCCY" size="4" maxlength="3" value="<%= deal.getE01DLSCCY().trim()%>" > 
            		<a href="javascript:GetCurrency('E01DLSCCY','')"><%=help%></a>
            		<%=mandatory %>
				</td>
				<TD nowrap width="10%" align="left">
				</TD>
				<td nowrap width="25%" align="right"><label id="lTasa"></label></td>
            	<td nowrap width="25%" align="left">
            		<Div id="DTASA"> 
              		<input type="text" name="E01DLSRA1" size="18" maxlength="17" value="<%= deal.getE01DLSRA1().trim()%>" >
              		<%=mandatory %>
              		</Div> 
            	</td>
          	</tr>
          	<tr id="trclear"> 
            	<td nowrap width="25%" align="right">Valor Nominal :</td>
            	<td nowrap width="15%" align="left"> 
              		<input type="text" name="E01DLSOAM" size="15" maxlength="13" value="<%= deal.getE01DLSOAM()%>" onKeyPress="enterDecimal(2)">
              		<%=mandatory %>
            	</td>
				<TD nowrap width="10%" align="left"></TD>
				<td nowrap width="25%" align="right"><label id="lRendimiento"></label></td>
            	<td nowrap width="25%" align="left"> 
            		<Div id="DRENDIMIENTO">
              		<input type="text" name="E01DLSRA2" size="18" maxlength="17" value="<%= deal.getE01DLSRA2().trim()%>" >
              		<%=mandatory %>
              		</Div>
            	</td>
          	</tr>
          	<tr id="trdark"> 
            	<td nowrap width="25%" align="right"><label id="lMontoN"></label></td>
            	<td nowrap width="15%" align="left"> 
              		<Div id="DMONTON">
              		<input type="text" name="E01DLSAM1" size="15" maxlength="13" value="<%= deal.getE01DLSAM1()%>" onKeyPress="enterDecimal(2)">
              		</Div>
            	</td>
				<TD nowrap width="10%" align="left"></TD>
				<td nowrap width="25%" align="right"></td>
            	<td nowrap width="25%" align="left"> 
            	</td>
          	</tr>
          	<tr id="trclear"> 
            	<td nowrap width="25%" align="right">Fecha Valor :</td>
            	<td nowrap width="15%" align="left"> 
              		<eibsinput:date name="deal" fn_month="E01DLSVDM" fn_day="E01DLSVDD" fn_year="E01DLSVDY" readonly="false"/>
              		<%=mandatory %> 
				</td>
				<TD nowrap width="10%" align="left">
				</TD>
				<td nowrap width="25%" align="right">Fecha de Vencimiento : </td>
            	<td nowrap width="25%" align="left">
            		<eibsinput:date name="deal" fn_month="E01DLSMAM" fn_day="E01DLSMAD" fn_year="E01DLSMAY" readonly="false"/> 
            		<%=mandatory %>
            	</td>
          	</tr>
          	<tr id="trdark"> 
            	<td nowrap width="25%" align="right"></td>
            	<td nowrap width="15%" align="left"> 
            	</td>
				<TD nowrap width="10%" align="left"></TD>
				<td nowrap width="25%" align="right"><label id="lTci"></label></td>
            	<td nowrap width="25%"> 
            		<Div id="DTCI">
              		<input type="text" readonly name="E01DLSICT" size="2" maxlength="1" value="<%= deal.getE01DLSICT()%>">
              		<input type="text" readonly name="D01DLSICT" size="40" maxlength="35" 
						value="<% if (deal.getE01DLSICT().equals("S")) out.print("Al Vencimiento Calendario");
							else if (deal.getE01DLSICT().equals("M")) out.print("Al Vencimiento Comercial");
							else if (deal.getE01DLSICT().equals("P")) out.print("Prepagados Calendario");
							else if (deal.getE01DLSICT().equals("A")) out.print("Prepagados Comerciales");
							else if (deal.getE01DLSICT().equals("D")) out.print("Descontados Calendario");
							else if (deal.getE01DLSICT().equals("T")) out.print("Descontados Comerciales");
							else if (deal.getE01DLSICT().equals("R")) out.print("Capitalizados(CD's)");
							else if (deal.getE01DLSICT().equals("1")) out.print("Al Vencimiento Calendario");
							else if (deal.getE01DLSICT().equals("2")) out.print("Al Vencimiento Comercial");
							else if (deal.getE01DLSICT().equals("3")) out.print("Prepagados Calendario");
							else if (deal.getE01DLSICT().equals("4")) out.print("Prepagados Comerciales");
							else if (deal.getE01DLSICT().equals("5")) out.print("Descontados Calendario");
							else if (deal.getE01DLSICT().equals("6")) out.print("Descontados Comerciales");
							else if (deal.getE01DLSICT().equals("7")) out.print("Capitalizados (CD's)");
							else if (deal.getE01DLSICT().equals("8")) out.print("Regla 78");
							else out.print("");%>" >
              		</Div>
            	</td>
          	</tr>
			<tr id="trclear"> 
          		<td nowrap width="25%" align="right">Producto :</td>
            	<td nowrap width="15%" align="left"> 
              		<input type="text" name="E01DLSPRO" size="5" maxlength="4" value="<%= deal.getE01DLSPRO().trim() %>">
              		<a href="javascript:GetProductB('E01DLSPRO', 'D01PRDDSC', '<%=deal.getH01SCRCOD().trim()%>', '')"><%=help%></a> 
              		<input type="text" name="D01PRDDSC" size="30" value="<%= deal.getD01PRDDSC().trim() %>" readonly>
            	</td>
            	<td nowrap width="10%" align="left"></TD>	
            	<td nowrap width="25%" align="right">Plazo : </td>
            	<td nowrap width="15%" align="left">
            		<input type="text" name="E01DLSTRM" size="4" maxlength="3" value="<%= deal.getE01DLSTRM().trim()%>" >
            		<select class="inputs" name="E01DLSTRC">
            		<option value="D" <% if (deal.getE01DLSTRC().equals("D")) out.print("selected"); %>>Dia</option>
		           	<option value="M" <% if (deal.getE01DLSTRC().equals("M")) out.print("selected"); %>>Mes</option>
		           	<option value="Y" <% if (deal.getE01DLSTRC().equals("Y")) out.print("selected"); %>>Año</option>
            		</select>
            	</td>
            </tr>
			<tr id="trdark">
            	<td nowrap width="25%" align="right">Notas :</td>
				<td nowrap width="15%" align="left" colspan=4>
					<input type="text" name="E01DLSOT1" size="70" maxlength="60" value="<%= deal.getE01DLSOT1().trim()%>">
				</td>
			</tr>
          	<tr id="trdark"> 
            	<td nowrap width="25%" align="right"></td>
				<td nowrap width="15%" align="left" colspan=4>
					<input type="text" name="E01DLSOT2" size="70" maxlength="60" value="<%= deal.getE01DLSOT2().trim()%>">
				</td>
			</tr>
          	<tr id="trclear"> 
            	<td nowrap width="25%" align="right">Tesorero :</td>
				<td nowrap width="15%" align="left" colspan=4>
					<%= deal.getE01DLSDID().trim()%> - <%= deal.getD01USRDSC().trim()%></td>
			</tr>
			<% if (!deal.getE01DLSACD().equals("FB")) { %>
          	<tr id="trdark"> 
            	<td nowrap width="25%" align="right">Interes :</td>
            	<td nowrap width="15%" align="left">
                	<input type="text" name="E01DLSINT" size="15" maxlength="13" value="<%= deal.getE01DLSINT()%>" readonly>
            	</td>
				<TD nowrap width="10%" align="left"></TD>
				<td nowrap width="25%" align="right">Capital + Interes :</td>
            	<td nowrap width="25%" align="left">
            		<% Double tot =  Double.valueOf(deal.getE01DLSOAM().replaceAll(",","")) + Double.valueOf(deal.getE01DLSINT().replaceAll(",",""));%>
              		<input type="text" name="TOT" size="15" maxlength="15" value="<%= String.format("%,.2f", tot)%>" readonly>
            	</td>
          	</tr>
          	<%} %>
        </table>
      </td>
    </tr>

  </table>
  <br>
  <table  class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table width="100%">
          <tr id="trdark"> 
            <td nowrap>&nbsp;</td>
            <td nowrap  colspan="2"> 
              <div align="center"><b>Monto Límite</b></div>
            </td>
            <td nowrap > 
              <div align="center"><b>Monto Límite <br>Disponible</b></div>
            </td>
            <td nowrap > 
              <div align="center"><b>Monto Límite <br>Final</b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap>Líneas de Crédito</td>
            <td nowrap  colspan="2"> 
              <div align="right"><%= Util.fcolorCCY(deal.getD01LIMAMT())%>:</div>
            </td>
            <td nowrap > 
              <div align="right"><%= Util.fcolorCCY(deal.getD01LIMAVL())%></div>
            </td>
            <td nowrap > 
              <div align="right"><b><%= Util.fcolorCCY(deal.getD01LIMEND())%></b></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <% 	if (!deal.getH01SCRCOD().equals("05")) { %>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td width="33%" align="center"> 
          <input type="checkbox" name="H01FLGWK1" value="1" >Aceptar con Avisos
      </td>
    </tr>
  </table>
  <br>

 <table width="100%">		
  	<tr>
  		<td width="25%" align="center">
  			<input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goAction(5);">
     	 </td>
  		<td width="25%" align="center">
  			<% if (!deal.getE01DLSACC().toString().equals("0")) { %> 
     		<input id="EIBSBTN" type=button name="Delete" value="Borrar" onClick="goAction(4);">
     		<% } %>
  		</td>
  		<td width="25%" align="center">
     		<input id="EIBSBTN" type=button name="Calculate" value="Calcular" onClick="goAction(6);">
  		</td>
  		<td width="34%" align="center">
     		<input id="EIBSBTN" type=button name="Exit" value="Salir" onClick="goAction(1);">
  		</td>
  	</tr>	
  </table>
<% } %>

  </form>
  	
	<SCRIPT type="text/javascript">
	
	tobox = document.forms[0].E01DLSSBT;
  	tobox.options.length = 0;
	document.getElementById("DOPE").style.visibility="visible";
	document.getElementById("DTASA").style.visibility="visible";
	getElement("lTasa").innerHTML = "Tasa : ";
	document.getElementById("DRENDIMIENTO").style.visibility="hidden";
	getElement("lRendimiento").innerHTML = " ";
	document.getElementById("DMONTON").style.visibility="hidden";
	getElement("lMontoN").innerHTML = " ";
	document.getElementById("DTCI").style.visibility="visible";
	getElement("lTci").innerHTML = "Tipo de Calculo de Interes : ";
	
	acd = "<%=deal.getE01DLSACD().trim()%>";
	
	    //   Certificates
	if (acd == "11") {
		tobox.options[tobox.options.length] = new Option(' ',' '<% if (deal.getE01DLSSBT().equals("")) out.print(",true,\'selected\'"); %>);
  		tobox.options[tobox.options.length] = new Option('ACTIVA','PU'<% if (deal.getE01DLSSBT().equals("PU")) out.print(",true,\'selected\'"); %>);
  		tobox.options[tobox.options.length] = new Option('PASIVA','SL'<% if (deal.getE01DLSSBT().equals("SL")) out.print(",true,\'selected\'"); %>);
		}
 	    //   Bonds
 	else if (acd == "12") {
		tobox.options[tobox.options.length] = new Option(' ',' '<% if (deal.getE01DLSSBT().equals("")) out.print(",true,\'selected\'"); %>);
  		tobox.options[tobox.options.length] = new Option('COMPRA','PU'<% if (deal.getE01DLSSBT().equals("PU")) out.print(",true,\'selected\'"); %>);
  		tobox.options[tobox.options.length] = new Option('EMISION','SL'<% if (deal.getE01DLSSBT().equals("SL")) out.print(",true,\'selected\'"); %>);
		}
 	    //   Bank Acceptances	
 	else if (acd == "14") {
		tobox.options[tobox.options.length] = new Option(' ',' '<% if (deal.getE01DLSSBT().equals("")) out.print(",true,\'selected\'"); %>);
  		tobox.options[tobox.options.length] = new Option('VENTA','SL'<% if (deal.getE01DLSSBT().equals("SL")) out.print(",true,\'selected\'"); %>);
 		getElement("lTasa").innerHTML = "Tasa de Descuento : ";
 		getElement("lRendimiento").innerHTML = "Tasa Efectiva : ";
 		document.getElementById("DRENDIMIENTO").style.visibility="visible";
 		document.getElementById("DMONTON").style.visibility="visible";
		getElement("lMontoN").innerHTML = "Monto Neto : ";
		}
	    //   Federal Funds	
 	else if (acd == "15") {
		tobox.options[tobox.options.length] = new Option(' ',' '<% if (deal.getE01DLSSBT().equals("")) out.print(",true,'selected'"); %>);
  		tobox.options[tobox.options.length] = new Option('COMPRA','PU'<% if (deal.getE01DLSSBT().equals("PU")) out.print(",true,\'selected\'"); %>);
  		tobox.options[tobox.options.length] = new Option('VENTA','SL'<% if (deal.getE01DLSSBT().equals("SL")) out.print(",true,\'selected\'"); %>);
		} 
 	    // Default = Financial Blocks
	else {
 		document.getElementById("DOPE").style.visibility="hidden";
 		document.getElementById("DTASA").style.visibility="hidden";
 		getElement("lTasa").innerHTML = " ";
 		document.getElementById("DTCI").style.visibility="hidden";
		getElement("lTci").innerHTML = " ";
		}
		
<% 	
	if (deal.getH01SCRCOD().equals("05")) {
%>	
		$("#target :input").prop("disabled", true);
		$("a").removeAttr('href');
<%	} %>	
	</SCRIPT>
 
</body>
</html>