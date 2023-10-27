<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="datapro.eibs.beans.EDL080002Message"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%><html>
<%@ page import = "datapro.eibs.master.Util" %>

<head>
<title>Consulta Descuento de Documentos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<jsp:useBean id="dftBasic" class="datapro.eibs.beans.EDL080001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "lstAcceptors" class= "datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id= "lstDocuments" class= "datapro.eibs.beans.JBObjList"  scope="session" />

<SCRIPT type="text/javascript">

builtNewMenu(dft_a_opt);
initMenu();

</SCRIPT>

</head>
<body >
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }
if (userPO.getPurpose().equals("MAINTENANCE")){
 out.println("<SCRIPT>  initMenu(); </SCRIPT>");}

  String DEAIPD, DEAPPD;
  String E01FLGDED, E01FLGREF,E01FLGPAY,E01FLGCOL,E01DEACLF;
  boolean isDEAIPDNum = true;
  boolean isDEAPPDNum = true;
  //DEAIPD = lnBasic.getE01DEAIPD().trim();
  //DEAPPD = lnBasic.getE01DEAPPD().trim();
  //E01FLGDED = lnBasic.getE01FLGDED().trim();
  //E01FLGREF = lnBasic.getE01FLGREF().trim();
  //E01FLGPAY = lnBasic.getE01FLGPAY().trim();
  //E01FLGCOL = lnBasic.getE01FLGCOL().trim();
  //E01DEACLF = lnBasic.getE01DEACLF().trim();
  
  String genFlag = "";
  try {
      genFlag = request.getParameter("generic").trim();
      if (genFlag == null) genFlag = "";
  } catch (Exception e) {
    //genFlag = lnBasic.getE01DEACLF().trim();
  }
	
  String strBlank = "";

%> 
<h3 align="center"> <%= dftBasic.getE01DSCPRO().trim() %> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0800" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" ID="SCREEN" VALUE="502">
  <INPUT TYPE=HIDDEN NAME="ACTION" ID="ACTION" VALUE="F">
  <INPUT TYPE=HIDDEN NAME="E01DEABNK" ID="E01DEABNK" value="<%= dftBasic.getE01DEABNK() %>">
  <input type=HIDDEN name="E01DEATYP" id="E01DEATYP" value="<%= dftBasic.getE01DEATYP() %>">
  <input type=hidden name="GRP" id="GRP" value="0">

  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left">
                <input type="text" name="E01DEACUN" id="E01DEACUN" size="10" maxlength="9" value="<%= dftBasic.getE01DEACUN() %>" readonly>
                </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" name="E01CUSNA1" size="45" maxlength="45" value="<%= dftBasic.getE01CUSNA1() %>" readonly>
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
<%            
			  String strNroAcc = dftBasic.getE01DEAACC();
              if (dftBasic.getE01DEAACC().equals("999999999999")) {
              	strNroAcc = "NUEVA CUENTA";	  
              }
%>
                <input type="hidden" name="E01DEAACC" size="13" maxlength="12" value="<%= dftBasic.getE01DEAACC()  %>">
                <input type="text" name="E01DEAACCDSC" size="13" maxlength="12" value="<%= strNroAcc  %>" readonly>              

              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY" id="E01DEACCY" size="4" maxlength="3" value="<%= dftBasic.getE01DEACCY() %>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
                <input type="text" name="E01DEAPRO" id="E01DEAPRO" size="4" maxlength="4" value="<%= dftBasic.getE01DEAPRO() %>" readonly>
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Información B&aacute;sica</h4> 
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Fecha de Apertura:</div>
            </td>
            <td nowrap width="23%"> 
             <eibsinput:date name="dftBasic" fn_year="E01DEAODY" fn_month="E01DEAODM" fn_day="E01DEAODD"  readonly="true" />
             
            </td>
            <td nowrap width="25%"> 
              <div align="right">Monto Original :</div>
            </td>
            <td nowrap width="27%">
		<input type="text" name="E01DEAOAM" <% if (dftBasic.getF01DEAOAM().equals("Y")) out.print("class=\"txtchanged\""); %> size="15" maxlength="15" value="<%= dftBasic.getE01DEAOAM() %>" readonly>
              </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Tipo de Tasa Flotante:</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEAFTB" <% if (dftBasic.getF01DEAFTB().equals("Y")) out.print("class=\"txtchanged\""); %> size="2" maxlength="2" value="<%= dftBasic.getE01DEAFTB() %>" readonly> <select name="E01DEAFTY" disabled>
                            <OPTION value=" " <% if (!(dftBasic.getE01DEAFTY().equals("FP") ||dftBasic.getE01DEAFTY().equals("FS"))) out.print("selected"); %>=""></OPTION>
                            <OPTION value="FP" <% if (dftBasic.getE01DEAFTY().equals("FP")) out.print("selected"); %>="">FP</OPTION>
                            <OPTION value="FS" <% if (dftBasic.getE01DEAFTY().equals("FS")) out.print("selected"); %>="">FS</OPTION>
                        </select>
              <input type="text" name="E01FLTRTE" <% if (dftBasic.getF01FLTRTE().equals("Y")) out.print("class=\"txtchanged\""); %> size="9" maxlength="9" value="<%= dftBasic.getE01FLTRTE() %>" readonly>
            </td>
            <td nowrap width="25%" > 
              <div align="right">Tasa de Inter&eacute;s/Spread :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01DEARTE" <% if (dftBasic.getF01DEARTE().equals("Y")) out.print("class=\"txtchanged\""); %> size="10" maxlength="9" value="<%= dftBasic.getE01DEARTE() %>" readonly> </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Tasa / Cargo por Mora:</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEAPEI" <% if (dftBasic.getF01DEAPEI().equals("Y")) out.print("class=\"txtchanged\""); %> size="8" maxlength="7" value="<%= dftBasic.getE01DEAPEI() %>"  readonly>
              <input type="text" name="E01DEAPIF" <% if (dftBasic.getF01DEAPIF().equals("Y")) out.print("class=\"txtchanged\""); %> size="2" maxlength="1" value="<%= dftBasic.getE01DEAPIF() %>"  readonly> </td>
            <td nowrap width="25%" > 
              <div align="right">Tipo de Documento:</div>
            </td>
            <td nowrap width="23%" >
				<select name="E01DEARET" disabled>
                            <OPTION value=" " <% if (dftBasic.getE01DEARET().trim().equals(""))  out.print("selected"); %>=""></OPTION>
                            <OPTION value="1" <% if (dftBasic.getE01DEARET().equals("1"))  out.print("selected"); %>="">Giros o Letras</OPTION>
                            <OPTION value="2" <% if (dftBasic.getE01DEARET().equals("2")) out.print("selected"); %>="">Conformes</OPTION>
                            <OPTION value="3" <% if (dftBasic.getE01DEARET().equals("3")) out.print("selected"); %>="">Facturas</OPTION>
                            <OPTION value="4" <% if (dftBasic.getE01DEARET().equals("4")) out.print("selected"); %>="">Cheques</OPTION>
                            <OPTION value="5" <% if (dftBasic.getE01DEARET().equals("5")) out.print("selected"); %>="">Cupones MasterCard</OPTION>
           		</select>
              </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Línea de Cr&eacute;dito :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEACMC" <% if (dftBasic.getF01DEACMC().equals("Y")) out.print("class=\"txtchanged\""); %> size="9" maxlength="9" value="<%= dftBasic.getE01DEACMC() %>"  readonly>
              <input type="text" name="E01DEACMN" <% if (dftBasic.getF01DEACMN().equals("Y")) out.print("class=\"txtchanged\""); %> size="4" maxlength="4" value="<%= dftBasic.getE01DEACMN() %>"  readonly> </td>
            <td nowrap width="25%" > 
              <div align="right">Centro de Costo : </div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01DEACCN" <% if (dftBasic.getF01DEACCN().equals("Y")) out.print("class=\"txtchanged\""); %> size="8" maxlength="8" value="<%= dftBasic.getE01DEACCN() %>" readonly> </td>
          </tr>
          
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Retención de Impuestos:</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEAWHF" <% if (dftBasic.getF01DEAWHF().equals("Y")) out.print("class=\"txtchanged\""); %> size="2" maxlength="1" value="<%= dftBasic.getE01DEAWHF() %>" readonly> </td>
            <td nowrap width="25%" > 
              <div align="right">Dirección de Correo:</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01DEAMLA" <% if (dftBasic.getF01DEAMLA().equals("Y")) out.print("class=\"txtchanged\""); %> size="2" maxlength="2" value="<%= dftBasic.getE01DEAMLA() %>" readonly> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Comisionista :</div>
           </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEABRK" <% if (dftBasic.getF01DEABRK().equals("Y")) out.print("class=\"txtchanged\""); %> size="4" maxlength="3" value="<%= dftBasic.getE01DEABRK() %>" readonly> </td>
            <td nowrap width="25%" > 
              <div align="right">Porcentaje de Comisión :</div>
            </td>
            <td nowrap width="27%" > 
		<input type="text" name="E01DEABCP" <% if (dftBasic.getF01DEABCP().equals("Y")) out.print("class=\"txtchanged\""); %> size="10" maxlength="9" value="<%= dftBasic.getE01DEABCP() %>"  readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">N&uacute;mero Referencia:</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01DEAREF" <% if (dftBasic.getF01DEAREF().equals("Y")) out.print("class=\"txtchanged\""); %> size="12" maxlength="12" value="<%= dftBasic.getE01DEAREF() %>" readonly>
            </td>
           <td nowrap width="25%" >
              <div align="right">Banco/Oficina :</div>
            </td>
            <td nowrap width="27%" > 
            <input type="text" id="E01DEABNK" name="E01DEABNK" size="3" maxlength="2" value="<%= dftBasic.getE01DEABNK() %>" readonly >
            <input type="text" id="E01DEABRN" name="E01DEABRN" size="5" maxlength="4" value="<%= dftBasic.getE01DEABRN() %>" readonly>
            </td>
          </tr>
          
          <%if (!userPO.getPurpose().equals("MAINTENANCE")){%> 
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Tipo de Inter&eacute;s:</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEAICT" <% if (userPO.getPurpose().equals("MAINTENANCE") && dftBasic.getF01DEAICT().equals("Y")) out.print("class=\"txtchanged\""); %> size="2" maxlength="1" value="<%= dftBasic.getE01DEAICT() %>" readonly>
              </td>
            <td nowrap width="25%" > 
              <div align="right">Período Base :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01DEABAS" <% if (userPO.getPurpose().equals("MAINTENANCE") && dftBasic.getF01DEABAS().equals("Y")) out.print("class=\"txtchanged\""); %> size="4" maxlength="3" value="<%= dftBasic.getE01DEABAS() %>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Cálculo de Inter&eacute;s Normal:</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEAIFL" <% if (userPO.getPurpose().equals("MAINTENANCE") && dftBasic.getF01DEAIFL().equals("Y")) out.print("class=\"txtchanged\""); %> size="2" maxlength="1" value="<%= dftBasic.getE01DEAIFL() %>" readonly> </td>
            <td nowrap width="25%" > 
              <div align="right">Cálculo de Inter&eacute;s Mora:</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01DEAPCL" <% if (userPO.getPurpose().equals("MAINTENANCE") && dftBasic.getF01DEAPCL().equals("Y")) out.print("class=\"txtchanged\""); %> size="2" maxlength="1" value="<%= dftBasic.getE01DEAPCL() %>"  readonly>
              </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Tabla Cargos :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEATLN" <% if (userPO.getPurpose().equals("MAINTENANCE") && dftBasic.getF01DEATLN().equals("Y")) out.print("class=\"txtchanged\""); %> size="3" maxlength="2" value="<%= dftBasic.getE01DEATLN() %>" readonly> </td>
            <td nowrap width="25%" > 
              <div align="right">Período de Gracia:</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01DEAGPD" <% if (userPO.getPurpose().equals("MAINTENANCE") && dftBasic.getF01DEAGPD().equals("Y")) out.print("class=\"txtchanged\""); %> size="3" maxlength="2" value="<%= dftBasic.getE01DEAGPD() %>"  readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Tabla Tasas:</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEARTB" <% if (userPO.getPurpose().equals("MAINTENANCE") && dftBasic.getF01DEARTB().equals("Y")) out.print("class=\"txtchanged\""); %> size="3" maxlength="2" value="<%= dftBasic.getE01DEARTB() %>" readonly> </td>
            <td nowrap width="25%" > 
              <div align="right">Porcentaje de Retención :</div>
            </td>
            <td nowrap width="27%" >
            <input type="text" name="E01DEAPRP" <% if (userPO.getPurpose().equals("MAINTENANCE") && dftBasic.getF01DEAPRP().equals("Y")) out.print("class=\"txtchanged\""); %> size="10" maxlength="9" value="<%= dftBasic.getE01DEAPRP() %>" readonly> </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Porcentaje de Comisión :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEAROR" <% if (userPO.getPurpose().equals("MAINTENANCE") && dftBasic.getF01DEAROR().equals("Y")) out.print("class=\"txtchanged\""); %> size="10" maxlength="9" value="<%= dftBasic.getE01DEAROR() %>" readonly> </td>
           <td nowrap width="25%" > 
              <div align="right">Cobro del FECI :</div>
            </td>
            <td nowrap width="27%" >
            	<input type="hidden" name="E01DEATX2" id="E01DEATX2" value="<%= dftBasic.getE01DEATX2() %>">
            	<input type="radio" name="CE01DEATX2" value="F" disabled
            <%if(dftBasic.getE01DEATX2().equals("F")) out.print("checked");%> > Si 
	              <input type="radio" name="CE01DEATX2" value="N"  disabled
	        <%if(!dftBasic.getE01DEATX2().equals("F")) out.print("checked");%> > No
	        <% if (userPO.getPurpose().equals("MAINTENANCE") && dftBasic.getE01DEATX2().equals("Y")) out.print("class=\"txtchanged\""); %> 
            </td>  
          </tr>
          <%}%> 
        </table>
      </td>
    </tr>
  </table>

<h4>Cuenta de Pago</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="33%"> 
              <div align="center">Concepto</div>
            </td>
            <td nowrap width="15%"> 
              <div align="center">Banco</div>
            </td>
            <td nowrap width="22%"> 
              <div align="center">Sucursal</div>
            </td>
            <td nowrap> 
              <div align="center">Moneda </div>
            </td>
            <td nowrap> 
              <div align="center">Referencia</div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="33%" > 
              <div align="center" > 
                <input type="text" name="E01PAGOPE" id="E01PAGOPE" value="<%= dftBasic.getE01PAGOPE() %>" size="3" maxlength="3" readonly>
                <input type="hidden" name="E01PAGGLN" id="E01PAGGLN" value="<%= dftBasic.getE01PAGGLN() %>">
                <input type="text" name="E01PAGCON" id="E01PAGCON" size="45" maxlength="45" readonly value="<%= dftBasic.getE01PAGCON() %>" >
			  </div>
            </td>
            <td nowrap width="15%" > 
              <div align="center"> 
                <input type="text" name="E01PAGBNK" id="E01PAGBNK" <% if (dftBasic.getF01PAGBNK().equals("Y")) out.print("class=\"txtchanged\""); %> size="2" maxlength="2" value="<%= dftBasic.getE01PAGBNK() %>" readonly>
              </div>
            </td>
            <td nowrap width="22%" > 
              <div align="center"> 
                <input type="text" name="E01PAGBRN" id="E01PAGBRN" <% if (dftBasic.getF01PAGBRN().equals("Y")) out.print("class=\"txtchanged\""); %> size="4" maxlength="4" value="<%= dftBasic.getE01PAGBRN() %>" readonly>
			  </div>
            </td>
            <td nowrap width="14%" > 
              <div align="center"> 
                <input type="text" name="E01PAGCCY" id="E01PAGCCY" <% if (dftBasic.getF01PAGCCY().equals("Y")) out.print("class=\"txtchanged\""); %> size="3" maxlength="3" value="<%= dftBasic.getE01PAGCCY() %>" readonly>
			</div>
            </td>
            <td nowrap width="16%" > 
              <div align="center"> 
                <input type="text" name="E01PAGACC" id="E01PAGACC" <% if (dftBasic.getF01PAGACC().equals("Y")) out.print("class=\"txtchanged\""); %> size="12" maxlength="12"  value="<%= dftBasic.getE01PAGACC() %>" readonly>
			  </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="33%" >&nbsp;</td>
            <td nowrap width="15%" >&nbsp;</td>
            <td nowrap width="22%" >&nbsp;</td>
            <td nowrap width="14%" >&nbsp;</td>
            <td nowrap width="16%" >&nbsp;</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="33%" >Autorización Sobregiro : <input type="text" name="E01DEAODA" <% if (dftBasic.getF01DEAODA().equals("Y")) out.print("class=\"txtchanged\""); %> size="2" maxlength="1" value="<%= dftBasic.getE01DEAODA() %>" readonly> </td>
            <td nowrap width="15%" > 
              <div align="center"> </div>
            </td>
            <td nowrap width="22%" > 
              <div align="right">Autoriza Pagos en Feriados: </div>
            </td>
            <td nowrap colspan="2" > 
              <div align="left">
                <input type="hidden" name="E01DEAHFQ" value="<%= dftBasic.getE01DEAHFQ() %>">
                <input type="radio" name="CE01DEAHFQ" value="1" onClick="document.forms[0].E01DEAHFQ.value='1'"
			  <%if(dftBasic.getE01DEAHFQ().equals("1")) out.print("checked");%> readonly> Si <input type="radio" name="CE01DEAHFQ" value="2" onClick="document.forms[0].E01DEAHFQ.value='2'"
			  <%if(dftBasic.getE01DEAHFQ().equals("2")) out.print("checked");%> readonly>
                No </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

<h4>Deudores</h4>

<TABLE class="tableinfo">
	<tr > 
      <td nowrap>
      	<div>   
      		<table cellpadding="2" cellspacing="0" width="100%" border="0">
      			<tr id="trdark">
					<td colspan="3">
    					<div align="center" >Identificación </div> 
    				</TD>
					<TD nowrap colspan="3">
						<div align="center" >Nombre</div>
					</TD>
					<td colspan="3">
						<div align="center" >Dias Para Ejercer Recursos</div>
					</td>
					<td colspan="5">&nbsp;</td>      			
				</tr>
				<% 
		lstAcceptors.initRow();
		boolean firstTime = true;
		String chk = "";
	     	while (lstAcceptors.getNextRow()) {
         		if (lstAcceptors.getFlag().equals("")) {
         	%>
         		<tr>
					<TD nowrap  colspan="3">
						<div align="center"><INPUT size="26" type="text" name="IDACCEPTOR" value="<%= lstAcceptors.getRecord(0)%>" readonly></div>
					</TD>
					<TD nowrap  colspan="3">
						<div align="center" ><INPUT size="45" type="text" name="NMEACCEPTOR" value="<%= lstAcceptors.getRecord(1)%>" readonly></div>
					</TD>
					<td colspan="3">
						<div align="center" >
							<INPUT size="4" type="text" name="EJERCERREC" value="<%= lstAcceptors.getRecord(5)%>" readonly></div>
					</td>
					<td colspan="5">&nbsp;</td>
         		</tr>
				<%
				lstDocuments.initRow();
				firstTime = true;
				while (lstDocuments.getNextRow()) {
					EDL080002Message doc = (EDL080002Message)lstDocuments.getRecord();
					pageContext.setAttribute("doc", doc);
					if (doc.getE02DLDDID().equals(lstAcceptors.getRecord(0))) {
					    if (firstTime) {
					    	firstTime = false;
				%>

					         <tr id="trdark">
							 <TD>
							 <div align="center">Secuencia</div>
							 </TD>
							 <TD>
							 <div align="center">Refencia</div>
							 </TD>
							 <TD>
							 <div align="center">Vencimiento</div>
							 </TD>
							 <TD>
							 <div align="center">Ejecer Recurso</div>
							 </TD>
							 <TD>
							 <div align="center">Monto Documento</div>
							 </TD>
							 <TD>
							 <div align="center">Monto Negociado</div>
							 </TD>
							 <TD>
							 <div align="center">Tasa</div>
							 </TD>
							<% if (dftBasic.getE01DEARET().equals("4")) {%>
							 	<TD>Cuenta Cheque</TD>
							 	<TD>Numero Cheque</TD>

							<% } else {%>
								 <TD>Cuenta Debito Aut.</TD>
								 <TD>Ruta/Cobro</TD>
							<% } %>
							 <TD>Intereses</TD>
							 <TD>Cargo Mora</TD>
							 <TD>Estado</TD>
							 <TD>Fecha de Pago</TD>
							 </TR> 
					    <% } %>
					    
						<tr id="trclear">
						<TD nowrap>
						<div align="center"><INPUT size="9" type="text" name="NDR" value="<%= doc.getE02DLDNDR()%>" readonly></div>
						</TD>
						<TD nowrap>
						<div align="center"><INPUT size="20" type="text" name="RFN" value="<%= doc.getE02DLDRFN()%>" readonly></div>
						</TD>
						<TD nowrap>
						<div align="center">
						<eibsinput:date name="doc" fn_year="E02DLDMAY" fn_month="E02DLDMAM" fn_day="E02DLDMAD" readonly="true"/></div>
						</TD>
						<TD nowrap>
						<div align="center">
						<eibsinput:date name="doc" fn_year="E02DLDPDY" fn_month="E02DLDPDM" fn_day="E02DLDPDD" readonly="true"/></div>
						</TD>
						<TD nowrap>
						<div align="center"><INPUT size="20" type="text" name="FAM" value="<%= doc.getE02DLDFAM()%>" readonly></div>
						</TD>
						<TD nowrap>
						<div align="center"><INPUT size="20" type="text" name="OAM" value="<%= doc.getE02DLDOAM()%>" readonly></div>
						</TD>
						<TD nowrap>
						<div align="center"><INPUT size="10" type="text" name="ARC" value="<%= doc.getE02DLDARC()%>" readonly></div>
						</TD>
						<% if (dftBasic.getE01DEARET().equals("4")){ %>
							<TD nowrap>
							<div align="center"><INPUT size="12" type="text" name="CTA" value="<%= doc.getE02DLDCTA()%>" readonly></div>
							</TD>						
							<TD nowrap>
							<div align="center"><INPUT size="9" type="text" name="CHQ" value="<%= doc.getE02DLDCHQ()%>" readonly></div>
							</TD>
						<% } else { %>			
							<TD nowrap>
							<div align="center"><INPUT size="12" type="text" name="ACC" value="<%= doc.getE02DLDACC()%>" readonly></div>
							</TD>
							<TD nowrap>
							<div align="center"><INPUT size="6" type="text" name="REW" value="<%= doc.getE02DLDREW()%>" readonly></div>
							</TD>
						<% } %>						
						<TD nowrap>
						<div align="center"><INPUT size="15" type="text" name="INT" value="<%= doc.getE02SALINT()%>" readonly></div>
						</TD>
						<TD nowrap>
						<div align="center"><INPUT size="15" type="text" name="MOR" value="<%= doc.getE02SALMOR()%>" readonly></div>
						</TD>
						<TD nowrap>
						<div align="center"><INPUT size="2" type="text" name="STS" value="<%= doc.getE02DLDRST()%>" readonly></div>
						</TD>
						<TD nowrap>
						<div align="center">
						<eibsinput:date name="doc" fn_year="E02DLDPYY" fn_month="E02DLDPYM" fn_day="E02DLDPYD" readonly="true"/></div>
						</TD>
								
						
						</TR>
					<% } 
					} %>	
				<tr id="trdark">
				<TD>
				</TD>
				<TD>
				</TD>
				<TD>
				</TD>
				<TD>
				</TD>
				<TD>
			    <div align="right">Total :</div>
				</TD>
				<TD>
				<div align="center"><INPUT size="20" type="text" name="TOTACCEPTOR" value="<%= Util.formatCCY(lstAcceptors.getRecord(2))%>" readonly></div>
				</TD>
				<TD>
				</TD>
				<TD>
				</TD>
				<TD>
				<div align="right">Intereses :</div>
				</TD>
				<TD>
				<div align="center"><input size="15" type="text" name="TOTACCEPTOR" value="<%= Util.formatCCY(lstAcceptors.getRecord(3))%>" readonly></div>
				</TD>
				<TD>
				</TD>
				<TD>
				</TD>
				<TD>
				</TD>
				</TR>
				
				
	
			<% 
         	}
       	}
%>
  
   </table>

<p align="center">&nbsp;</p>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td width="33%"> 
        <div align="center"></div>
      </td>
      <td width="34%"> 
        <div align="center">
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
