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
<jsp:useBean id="deal" class="datapro.eibs.beans.ETR001301Message"  scope="session" />   
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "trOption" class= "datapro.eibs.beans.TrOption"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery-1.10.2.min.js"></script>
 
<script type="text/javascript">
function changeOpe(ope){
	if (ope == 'PU') {
		getElement("E01DLSHEM").value = '0';
		getElement("E01DLSHEM").disabled=true; 
		getElement("E01DLSCUI").disabled=false; 
		getElement("E01DLSCCY").disabled=false;
		getElement("E01DLSRA1").disabled=false;
		getElement("E01DLSPOD").disabled=false;
		getElement("E01DLSMAM").disabled=false;
		getElement("E01DLSMAD").disabled=false;
		getElement("E01DLSMAY").disabled=false;
		getElement("E01DLSLIM").disabled=false;
		getElement("E01DLSLID").disabled=false;
		getElement("E01DLSLIY").disabled=false;
		getElement("E01DLSNIM").disabled=false;
		getElement("E01DLSNID").disabled=false;
		getElement("E01DLSNIY").disabled=false;
		getElement("E01DLSTRM").disabled=false;
		document.forms[0].E01DLSTRC.disabled = false;
		document.forms[0].E01DLSICT.disabled = false;
        document.getElementById("CONTRACT").style.visibility="hidden";
        document.getElementById("CURRENCY").style.visibility="visible";
        document.getElementById("INSTRUMENT").style.visibility="visible";
	} else {
		getElement("E01DLSHEM").disabled=false;
		getElement("E01DLSCUI").disabled=true;
		getElement("E01DLSCCY").disabled=true;
		getElement("E01DLSRA1").disabled=true;
		getElement("E01DLSPOD").disabled=true;
		getElement("E01DLSMAM").disabled=true;
		getElement("E01DLSMAD").disabled=true;
		getElement("E01DLSMAY").disabled=true;
		getElement("E01DLSLIM").disabled=true;
		getElement("E01DLSLID").disabled=true;
		getElement("E01DLSLIY").disabled=true;
		getElement("E01DLSNIM").disabled=true;
		getElement("E01DLSNID").disabled=true;
		getElement("E01DLSNIY").disabled=true;
		getElement("E01DLSTRM").disabled=true;
		document.forms[0].E01DLSTRC.disabled = true; 
		document.forms[0].E01DLSICT.disabled = true;
        document.getElementById("CONTRACT").style.visibility="visible";
        document.getElementById("CURRENCY").style.visibility="hidden";
        document.getElementById("INSTRUMENT").style.visibility="hidden";
	}
}	

 	function goAction(op) {
 		switch (op){
 		// Submit Data
 		case 1:  {
    		document.forms[0].SCREEN.value = '5';
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
        case 5:  {
    		pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.treasury.JSETR0000?SCREEN=1";
			window.location.href=pg;
        	break;
 			}
 		// Default
 		default: {
 			}
		}
	}
	
function getContract(){
  document.forms[0].SCREEN.value = '6'; 
  submitForm(); 
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
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="dealer_slip.jsp,ETR0013"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.treasury.JSETR0013" id="target" >
  <input type="hidden" name="E01DLSCMM"  value="<%= deal.getE01DLSCMM()%>" >
  <input type="hidden" name="E01DLSTYP"  value="<%= userPO.getType()%>" >
  <input type="hidden" name="E01DLSDID"  value="<%= deal.getE01DLSDID()%>" >
  <input type="hidden" name="E01DLSDDM"  value="<%= deal.getE01DLSDDM()%>" >
  <input type="hidden" name="E01DLSDDD"  value="<%= deal.getE01DLSDDD()%>" >
  <input type="hidden" name="E01DLSDDY"  value="<%= deal.getE01DLSDDY()%>" >
  <input type="hidden" name="E01DEADLC"  value="<%= deal.getE01DEADLC()%>" >
  <input type="hidden" name="E01DEABAS"  value="<%= deal.getE01DLSBAS()%>" >
  <input type="hidden" name="INSTNUM" value=" ">
  <input type="hidden" name="INSTDSC" value=" ">
  <input type="hidden" name="SYMBOL"  value=" ">
  <input type="hidden" name="CUSIP"   value=" ">
   

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
					<B>Tipo de Operación</B><br>
              		<SELECT name="E01DLSSBT" onchange="changeOpe(this.value)">
                		<OPTION value="PU" <% if (deal.getE01DLSSBT().equals("PU")) out.print("selected"); %>>Nueva Compra</OPTION>
                		<OPTION value="PA" <% if (deal.getE01DLSSBT().equals("PA")) out.print("selected"); %>>Compra Adicional</OPTION>
                		<OPTION value="SL" <% if (deal.getE01DLSSBT().equals("SL")) out.print("selected"); %>>Venta</OPTION>
              		</SELECT>
              		<%=mandatory %>
            	</td>
            	<td nowrap width="25%" align="left">
					<Div id="CONTRACT">
					 <H5>Número de Contrato<BR>
					 <INPUT type="text" name="E01DLSHEM" size="13" maxlength="12" onblur="getContract()" onkeypress="enterInteger()" value="<%= deal.getE01DLSHEM() %>">
					 <A href="javascript:GetAccount('E01DLSHEM','','IN','')"><%=help%></A>
					</H5>
					<%=mandatory %>
					</Div>
				</td>
          	</tr>
          	<tr id="trdark"> 
            	<td nowrap width="25%" align="right">Código Instrumento :</td>
            	<td nowrap width="15%" align="left"> 
              		<input type="text" name="E01DLSCUI" size="15" maxlength="15" value="<%= deal.getE01DLSCUI()%>">
              		<Div id="INSTRUMENT"> 
              		<a href="javascript:GetInstrumentParams('','','E01DLSCCY','','E01DLSCUI','','E01DLSICT')"><%=help%></a>
              		<%=mandatory %>
              		</Div>
            	</td>
				<TD nowrap width="10%"></TD>
				<td nowrap width="25%" align="right"><label id="lFupc"></label></td>
            	<td nowrap width="25%" align="left">
            	<Div id="DFUPC">
            		<eibsinput:date name="deal" fn_month="E01DLSLIM" fn_day="E01DLSLID" fn_year="E01DLSLIY" readonly="false"/> 
				</Div>	
            	</td>
          	</tr>
          	<tr id="trclear"> 
            	<td nowrap width="25%" align="right">Moneda : </td>
            	<td nowrap width="15%" align="left"> 
	            	<input type="text" name="E01DLSCCY" size="4" maxlength="3" value="<%= deal.getE01DLSCCY().trim()%>" > 
	            	<Div id="CURRENCY"> 
            		<a href="javascript:GetCurrency('E01DLSCCY','')"><%=help%></a>
            		<%=mandatory %>
            		</Div>
				</td>
				<TD nowrap width="10%" align="left">
				</TD>
				<td nowrap width="25%" align="right"><label id="lTasa"></label></td>
            	<td nowrap width="25%" align="left">
            		<Div id="DTASA"> 
              		<input type="text" name="E01DLSRA1" size="18" maxlength="17" value="<%= deal.getE01DLSRA1().trim()%>" > / 
              		<input type="text" name="E01DLSEFTB" size="2" maxlength="2" value="<%= deal.getE01DLSFTB().trim()%>" readonly>
              		<select name="E01DLSFTY" disabled>
                		<option value=" " <% if (!(deal.getE01DLSFTY().equals("FP") ||deal.getE01DLSFTY().equals("FS"))) out.print("selected"); %>></option>
                		<option value="FP" <% if (deal.getE01DLSFTY().equals("FP")) out.print("selected"); %>>Primaria</option>
                		<option value="FS" <% if (deal.getE01DLSFTY().equals("FS")) out.print("selected"); %>>Secundaria</option>
              		</select> 
              		<input type="text" name="E01DLSFRT" size="9" maxlength="9" value="<%= deal.getE01DLSFRT().trim()%>" readonly> 
              		</Div> 
            	</td>
          	</tr>
          	<tr id="trdark"> 
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
              		</Div>
            	</td>
          	</tr>
          	<tr id="trclear"> 
            	<td nowrap width="25%" align="right">Precio :</td>
            	<td nowrap width="15%" align="left"> 
              		<input type="text" name="E01DLSRA3" size="18" maxlength="17" value="<%= deal.getE01DLSRA3().trim()%>"  onKeyPress="enterDecimal(7)">
            	</td>
				<TD nowrap width="10%" align="left"></TD>
				<td nowrap width="25%" align="right"><label id="lMontoN"></label></td>
            	<td nowrap width="25%" align="left"> 
            		<Div id="DMONTON">
              		<input type="text" name="E01DLSAM1" size="15" maxlength="13" value="<%= deal.getE01DLSAM1()%>" onKeyPress="enterDecimal(2)">
              		</Div>
            	</td>
          	</tr>
          	<tr id="trdark"> 
            	<td nowrap width="25%" align="right"><label id="lNa"></label></td>
            	<td nowrap width="15%" align="left">
            		<Div id="DNA"> 
            		<input type="text" name="E01DLSRA4" size="18" maxlength="17" value="<%= deal.getE01DLSRA4().trim()%>" onKeyPress="enterDecimal(7)">
            		</Div>
              	</td>
				<TD nowrap width="10%" align="left">
				</TD>
				<td nowrap width="25%" align="right"><label id="lPrima"></label></td>
            	<td nowrap width="25%" align="left"> 
            		<Div id="DPRIMA">
	              	<input type="text" name="E01DLSPOD" size="15" maxlength="13" value="<%= deal.getE01DLSPOD()%>" readonly>
	              	</Div>
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
				<td nowrap width="25%" align="right"><label id="lFven"></label></td>
            	<td nowrap width="25%" align="left">
            		<Div id="DFVEN">
            		<eibsinput:date name="deal" fn_month="E01DLSMAM" fn_day="E01DLSMAD" fn_year="E01DLSMAY" readonly="false"/> 
            		<%=mandatory %>
              		</Div> 
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
              		<select class="inputs" name="E01DLSICT">
                		<option value=" " <% if (!(deal.getE01DLSICT().equals("1") ||deal.getE01DLSICT().equals("2")||deal.getE01DLSICT().equals("3")||deal.getE01DLSICT().equals("4")||deal.getE01DLSICT().equals("5")||deal.getE01DLSICT().equals("6"))) out.print("selected"); %>></option>
                		<option value="1" <% if (deal.getE01DLSICT().equals("1")) out.print("selected"); %>>Actual/actual (en periodo)</option>
		                <option value="2" <% if (deal.getE01DLSICT().equals("2")) out.print("selected"); %>>Actual/365</option>
		                <option value="3" <% if (deal.getE01DLSICT().equals("3")) out.print("selected"); %>>Actual/365 (366 en bisiesto)</option>
		                <option value="4" <% if (deal.getE01DLSICT().equals("4")) out.print("selected"); %>>Actual/360</option>
		                <option value="5" <% if (deal.getE01DLSICT().equals("5")) out.print("selected"); %>>30/360</option>
		                <option value="6" <% if (deal.getE01DLSICT().equals("6")) out.print("selected"); %>>30E/360</option>
              		</select>
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
            	<td nowrap width="25%" align="right"><label id="lPlazo"></label></td>
            	<td nowrap width="15%" align="left">
            		<Div id="DPLAZO"> 
            		<input type="text" name="E01DLSTRM" size="4" maxlength="3" value="<%= deal.getE01DLSTRM().trim()%>" >
            		<select class="inputs" name="E01DLSTRC">
            		<option value="D" <% if (deal.getE01DLSTRC().equals("D")) out.print("selected"); %>>Día(s)</option>
		           	<option value="M" <% if (deal.getE01DLSTRC().equals("M")) out.print("selected"); %>>Mes(es)</option>
		           	<option value="Y" <% if (deal.getE01DLSTRC().equals("Y")) out.print("selected"); %>>Año(s)</option>
		           	<option value="Q" <% if (deal.getE01DLSTRC().equals("Q")) out.print("selected"); %>>Trimestre(s)</option>
		           	<option value="S" <% if (deal.getE01DLSTRC().equals("S")) out.print("selected"); %>>Semestre(s)</option>
            		</select>
            		</Div>
            	</td>
            </tr>
            <tr id="trdark"> 
            	<td nowrap width="25%" align="right"><label id="fPago"></label></td>
            	<td nowrap width="15%" align="left">
            		<Div id="DFPAGO">
            		<input type="text" name="E01DLSROY" size="5" maxlength="4" value="<%= deal.getE01DLSROY().trim()%>" >
            		<SELECT name="E01DLSODA">
					<OPTION value=" "
						<% if (!(deal.getE01DLSODA().equals("P") ||deal.getE01DLSODA().equals("I")||deal.getE01DLSODA().equals("M") || deal.getE01DLSODA().equals("D") )) out.print("selected"); %>></OPTION>
					<OPTION value="P" <% if (deal.getE01DLSODA().equals("P")) out.print("selected"); %>>Periodos Mensuales(No incluye último día)</OPTION>
					<OPTION value="I" <% if (deal.getE01DLSODA().equals("I")) out.print("selected"); %>>Periodos Mensuales(Incluye último día)</OPTION>
					<OPTION value="M" <% if (deal.getE01DLSODA().equals("M")) out.print("selected"); %>>Mensual(Ultimo Día del Mes)</OPTION>
					<OPTION value="D"<% if (deal.getE01DLSODA().equals("D")) out.print("selected"); %>>	Mensual(Día del mes)</OPTION>
					</SELECT>
            		</Div> 
            	</td>
				<TD nowrap width="10%"></TD>
				<td nowrap width="25%" align="right"><label id="lFnpc"></label></td>
            	<td nowrap width="25%" align="left">
            	<Div id="DFNPC">
            		<eibsinput:date name="deal" fn_month="E01DLSNIM" fn_day="E01DLSNID" fn_year="E01DLSNIY" readonly="false"/> 
				</Div>	
            	</td>
          	</tr>
			<tr id="trclear">
            	<td nowrap width="25%" align="right">Notas :</td>
				<td nowrap width="15%" align="left" colspan=4>
					<input type="text" name="E01DLSOT1" size="70" maxlength="60" value="<%= deal.getE01DLSOT1().trim()%>">
				</td>
			</tr>
          	<tr id="trclear"> 
            	<td nowrap width="25%" align="right"></td>
				<td nowrap width="15%" align="left" colspan=4>
					<input type="text" name="E01DLSOT2" size="70" maxlength="60" value="<%= deal.getE01DLSOT2().trim()%>">
				</td>
			</tr>
          	<tr id="trdark"> 
            	<td nowrap width="25%" align="right">Tesorero :</td>
				<td nowrap width="15%" align="left" colspan=4>
					<%= deal.getE01DLSDID().trim()%> - <%= deal.getD01USRDSC().trim()%></td>
			</tr>
          	<tr id="trclear"> 
            	<td nowrap width="25%" ></td>
				<td nowrap width="15%" align="left" colspan=4></td>
			</tr>
			<% if (deal.getE01DEADLC().equals("B")) { %>
          	<tr id="trclear"> 
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
  		<td width="33%" align="center">
  			<input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goAction(1);">
     	 </td>
  		<td width="33%" align="center">
  			<% if (!deal.getE01DLSACC().toString().equals("0")) { %> 
     		<input id="EIBSBTN" type=button name="Delete" value="Borrar" onClick="goAction(4);">
     		<% } %>
  		</td>
  		<td width="34%" align="center">
     		<input id="EIBSBTN" type=button name="Submit" value="Salir" onClick="goAction(5);">
  		</td>
  	</tr>	
  </table>
<% } %>
  	
	<SCRIPT type="text/javascript">
	changeOpe('<%= deal.getE01DLSSBT().trim()%>');
	<% 	
	if (deal.getE01DEADLC().equals("B")) { %>
		getElement("lFupc").innerHTML = "Fecha de Pago Ultimo Cupón :";
		getElement("lFnpc").innerHTML = "Fecha de Siguiente Cupón :";
 		getElement("lTasa").innerHTML = "Tasa (Fija/Variable) :";
 		getElement("lRendimiento").innerHTML = "Rendimiento :";
 		getElement("lMontoN").innerHTML = "Monto Neto :";
 		getElement("lPrima").innerHTML = "Prima / Descuento :";
 		getElement("lFven").innerHTML = "Fecha de Vencimiento :";
 		getElement("lTci").innerHTML = "Tipo de Cálculo de Interés :";
 		getElement("lPlazo").innerHTML = "Termino :";
 		getElement("fPago").innerHTML = "Frecuencia de Pago Coupón :";
 		getElement("lNa").innerHTML = " ";
 		document.getElementById("DFUPC").style.visibility="visible";
 		document.getElementById("DFNPC").style.visibility="visible";
 		document.getElementById("DTASA").style.visibility="visible";
 		document.getElementById("DRENDIMIENTO").style.visibility="visible";
 		document.getElementById("DMONTON").style.visibility="visible";
 		document.getElementById("DPRIMA").style.visibility="visible";
 		document.getElementById("DFVEN").style.visibility="visible";
 		document.getElementById("DTCI").style.visibility="visible";
 		document.getElementById("DPLAZO").style.visibility="visible";
 		document.getElementById("DFPAGO").style.visibility="visible";
 		document.getElementById("DNA").style.visibility="hidden";
<% 	} else { %>
		getElement("lFupc").innerHTML = " ";
		getElement("lFnpc").innerHTML = " ";
 		getElement("lTasa").innerHTML = " ";
 		getElement("lRendimiento").innerHTML = " ";
 		getElement("lMontoN").innerHTML = " ";
 		getElement("lPrima").innerHTML = " ";
 		getElement("lFven").innerHTML = " ";
 		getElement("lTci").innerHTML = " ";
 		getElement("lPlazo").innerHTML = " ";
 		getElement("fPago").innerHTML = " ";
 		getElement("lNa").innerHTML = "Número de Acciones :";
 		document.getElementById("DFUPC").style.visibility="hidden";
 		document.getElementById("DFNPC").style.visibility="hidden";
 		document.getElementById("DTASA").style.visibility="hidden";
 		document.getElementById("DRENDIMIENTO").style.visibility="hidden";
 		document.getElementById("DMONTON").style.visibility="hidden";
 		document.getElementById("DPRIMA").style.visibility="hidden";
 		document.getElementById("DFVEN").style.visibility="hidden";
 		document.getElementById("DTCI").style.visibility="hidden";
 		document.getElementById("DPLAZO").style.visibility="hidden";
 		document.getElementById("DFPAGO").style.visibility="hidden";
 		document.getElementById("DNA").style.visibility="visible";
 		
<% 	}
	if (deal.getH01SCRCOD().equals("05")) {
%>	
		$("#target :input").prop("disabled", true);
		$("a").removeAttr('href');
<%	} %>	
	</SCRIPT>
 
 </form>
</body>
</html>