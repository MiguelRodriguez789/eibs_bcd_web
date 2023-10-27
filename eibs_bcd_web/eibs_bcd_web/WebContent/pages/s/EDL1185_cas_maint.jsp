<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@ page import = "datapro.eibs.beans.EDL118501Message" %>

<html>
<head>
<title>Castigo de Créditos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">


<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.js"> </SCRIPT>

<jsp:useBean id="dlCast" class="datapro.eibs.beans.EDL118501Message"  scope="session" />
<jsp:useBean id= "extList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

</head>

<body nowrap>

<SCRIPT type="text/javascript">
   
function showLnsDatesInfo(obj){
	var DATESINFO = document.getElementById('DATESINFO');
	if (obj.checked) DATESINFO.style.display=""; else {
		DATESINFO.style.display="none";
	}
}

function showLnsBalancesInfo(obj){
	var BALINFO = document.getElementById('BALINFO');
	if (obj.checked) BALINFO.style.display=""; else {
		BALINFO.style.display="none";
	}
}

function showLnsRatesInfo(obj){
	var RATESINFO = document.getElementById('RATESINFO');
	if (obj.checked) RATESINFO.style.display=""; else {
		RATESINFO.style.display="none";
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

%>


<h3 align="center">Castigo de Créditos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cas_maint.jsp, EDL1185"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL1185" id="form1">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
  <INPUT TYPE=HIDDEN NAME="OPT" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="E01DLSSEQ" VALUE="99">            
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="20%" > 
              <div align="right"><b>Número de Crédito : </b></div>
            </td>
            <td nowrap width="30%" > 
              <div align="left"> 
                <input type="text" name="E01DEAACC" size="12" maxlength="12" value="<%= dlCast.getE01DEAACC().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="20%" > 
              <div align="right"><b>Cliente : </b></div>
            </td>
            <td nowrap width="5%" > 
              <div align="left"> 
                <input type="text" name="E01DEACUN" size="11" maxlength="9" value="<%= dlCast.getE01DEACUN().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"> 
                <input type="text" name="D01PCMCUN" size="48" maxlength="45" value="<%= dlCast.getD01DEACUN().trim()%>" readonly>
              </div>
            </td>

          </tr>
        </table>
      </td>
    </tr>
  </table>




  <h4> Información Básica</h4> 
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">

          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Fecha de Apertura :</div>
            </td>
            <td nowrap width="23%"> 
				<eibsinput:date name="dlCast" fn_year="E01DEAODY" fn_month="E01DEAODM" fn_day="E01DEAODD" readonly="true"/>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Fecha de Vencimiento :</div>
            </td>
            <td nowrap width="27%"> 
				<eibsinput:date name="dlCast" fn_year="E01DEAMDY" fn_month="E01DEAMDM" fn_day="E01DEAMDD" readonly="true"/>
            </td>
          </tr>



          <tr id="trclear"> 
            <td nowrap width="20%"> 
              <div align="right">Monto Original :</div>
            </td>
            <td nowrap width="35%"> 
              <input type="text" readonly name="E01DEAOAM" size="17" maxlength="15" value="<%= dlCast.getE01DEAOAM().trim()%>">
            </td>
            <td nowrap width="20%" height="37"> 
              <div align="right">Termino :</div>
            </td>
            <td nowrap width="35%" height="37"> 
             <input type="text" readonly name="E01DEATRM" size="4" maxlength="3" value="<%= dlCast.getE01DEATRM().trim()%>">
             <input type="text" readonly name="E01DEATRC" size="10" 
				  value="<% if (dlCast.getE01DEATRC().equals("D")) out.print("D&iacute;a(s)");
							else if (dlCast.getE01DEATRC().equals("M")) out.print("Mes(es)");
							else if (dlCast.getE01DEATRC().equals("Y")) out.print("A&ntilde;o(s)");
							else out.print("");%>" 
				>
            </td>
          </tr>

          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Saldo Principal :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" readonly name="E01DEAPRI" size="17" maxlength="15" value="<%= dlCast.getE01DEAPRI().trim()%>">
            <td nowrap width="25%" >
              <div align="right">Saldo Intereses :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" readonly name="E01DEAMEI" size="17" maxlength="15" value="<%= dlCast.getE01DEAMEI().trim()%>">
            </td>
          </tr>

          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Saldo Interés de Mora :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" readonly name="E01DEAMEM" size="17" maxlength="15" value="<%= dlCast.getE01DEAMEM().trim()%>">
            <td nowrap width="25%" >
              <div align="right">Saldo Otros Conceptos :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" readonly name="E01OTHCHG" size="17" maxlength="15" value="<%= dlCast.getE01OTHCHG().trim()%>">
			</td>
          </tr>

          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Condición del Crédito :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" readonly name="E01DEADLC" size="20" maxlength="18" 
				value="<% if (dlCast.getE01DEADLC().equals("1")) out.print("Vigente");
							else if (dlCast.getE01DEADLC().equals("2")) out.print("Vencido");
							else if (dlCast.getE01DEADLC().equals("3")) out.print("Castigado");
							else if (dlCast.getE01DEADLC().equals("4")) out.print("Litigio");
							else if (dlCast.getE01DEADLC().equals("5")) out.print("Litigio/Castigado");
							else if (dlCast.getE01DEADLC().equals("6")) out.print("En Recuperación");
							else if (dlCast.getE01DEADLC().equals(" ")) out.print("Vigente");
							else out.print("");%>" >

            <td nowrap width="25%" >
              <div align="right"> </div>
            </td>
            <td nowrap width="27%" >
              <div align="right"> </div>
            </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>  

<table class="tbenter">
<tr>
  <TD>   
   <b>                  	</b>
  </TD>
  <TD>
   <b>Información Adicional								</b>    
  </TD>

  <TD>
   <b>Saldos</b><input type="checkbox" name="BALANC" value="" onclick="showLnsBalancesInfo(this)">    
  </TD>
  <TD>
   <b>Tasas</b><input type="checkbox" name="RATE" value="" onclick="showLnsRatesInfo(this)">    
  </TD>
  <TD>
   <b>Fechas</b><input type="checkbox" name="DATE" value="" onclick="showLnsDatesInfo(this)">    
  </TD>


  </tr>
</table>
<table class="tbenter" cellpadding=3>
<tr>
 <TD valign=top>
  <h4>Valores de Castigo </h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="40%"> 
              <div align="right">Capital Adeudado :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text"  readonly name="E01WRKMEP" size="18" maxlength="15" value="<%= dlCast.getE01WRKMEP().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="40%"> 
              <div align="right">Intereses en Cuentas por Cobrar :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text"  readonly name="E01WRKCOB" size="18" maxlength="15" value="<%= dlCast.getE01WRKCOB().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%"> 
              <div align="right">Intereses en Cuentas de Orden :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text"  readonly name="E01WRKORD" size="18" maxlength="15" value="<%= dlCast.getE01WRKORD().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="40%"> 
              <div align="right">Intereses de Mora :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text"  readonly name="E01WRKMOR" size="18" maxlength="15" value="<%= dlCast.getE01WRKMOR().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%"> 
              <div align="right">Cargos por Impuestos :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text"  readonly name="E01WRKIMP" size="18" maxlength="15" value="<%= dlCast.getE01WRKIMP().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="40%"> 
              <div align="right">Cargos por Comisiones :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text"  readonly name="E01WRKCOM" size="18" maxlength="15" value="<%= dlCast.getE01WRKCOM().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%"> 
              <div align="right">Cargos por Deducciones :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text"  readonly name="E01WRKDED" size="18" maxlength="15" value="<%= dlCast.getE01WRKDED().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
<%--           
          <tr id="trclear"> 
            <td nowrap width="40%"> 
              <div align="right">Cargos por I.T.B.M.S. :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text"  readonly name="E01WRKIVA" size="18" maxlength="15" value="<%= dlCast.getE01WRKIVA().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
 --%>          
          <tr id="trclear"> 
            <td nowrap width="40%"> 
              <div align="right">FECI :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text"  readonly name="E01WRKOTH" size="18" maxlength="15" value="<%= dlCast.getE01WRKOTH().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>

         <tr id="trdark"> 
            <td nowrap width="40%"> 
              <div align="right">Deuda Total :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text"  readonly name="E01WRKTOT" size="18" maxlength="15" value="<%= dlCast.getE01WRKTOT().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>

        </table>
       </td>
      </tr>
    </table>
  </TD>


  <TD valign=top>
    <div id="BALINFO" style="display:none">
    <h4>Otros Saldos </h4>
    <table class="tableinfo">
     <tr > 
      <td nowrap>    
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right"> Principal Pagado :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01PRIPYM" size="15" maxlength="15" value="<%= dlCast.getE01PRIPYM().trim()%>" readonly>
            </td>
            <td nowrap > 
              <div align="right">Interes Acumulado :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEAIAL" size="15" maxlength="15" value="<%= dlCast.getE01DEAIAL().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right"> Promedio Principal :</div>
            </td>
            <td nowrap  bordercolor="#FFFFFF" > 
              <input type="text" name="E01DEAAVP" size="15" maxlength="15" value="<%= dlCast.getE01DEAAVP().trim()%>" readonly>
            </td>
            <td nowrap  bordercolor="#FFFFFF" > 
              <div align="right">Inter&eacute;s Pagado :</div>
            </td>
            <td nowrap  bordercolor="#FFFFFF" > 
              <input type="text" name="E01DEAIPL" size="15" maxlength="15" value="<%= dlCast.getE01DEAIPL().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right"> Principal D&iacute;a Ayer :</div>
            </td>
            <td nowrap  bordercolor="#FFFFFF" > 
              <input type="text" name="E01DEAPRI" size="15" maxlength="15" value="<%= dlCast.getE01DEAPRI().trim()%>" readonly>
            </td>
            <td nowrap  bordercolor="#FFFFFF" > 
              <div align="right">Inter&eacute;s de Ayer :</div>
            </td>
            <td nowrap  bordercolor="#FFFFFF" >
              <input type="text" name="E01YESINT" size="15" maxlength="15" value="<%= dlCast.getE01YESINT().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap  >
              <div align="right">Valor Participado : </div>
            </td>
            <td nowrap  bordercolor="#000000" >
              <input type="text" name="E01VALPAR" size="15" maxlength="15" value="<%= dlCast.getE01VALPAR().trim()%>" readonly>
            </td>
            <td nowrap  bordercolor="#000000" >
              <div align="right">Inter&eacute;s Ajustado :</div>
            </td>
            <td nowrap  bordercolor="#000000" >
              <input type="text" name="E01DEAIJL" size="15" maxlength="15" value="<%= dlCast.getE01DEAIJL().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap  > 
              <div align="right">Deducciones Pagadas :</div>
            </td>
            <td nowrap  bordercolor="#000000" > 
              <input type="text" name="E01DEADEL" size="15" maxlength="15" value="<%= dlCast.getE01DEADEL().trim()%>" readonly>
            </td>
            <td nowrap  bordercolor="#000000" > 
              <div align="right">Inter&eacute;s Pagado A&ntilde;o :</div>
            </td>
            <td nowrap  bordercolor="#000000" > 
              <input type="text" name="E01DEAIPY" size="15" maxlength="15" value="<%= dlCast.getE01DEAIPY().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Comisiones Pagadas :</div>
            </td>
            <td nowrap  bordercolor="#000000" height="20"> 
              <input type="text" name="E01DEACPL" size="15" maxlength="15" value="<%= dlCast.getE01DEACPL().trim()%>" readonly>
            </td>
            <td nowrap  bordercolor="#000000" height="20"> 
              <div align="right">Inter&eacute;s Diario :</div>
            </td>
            <td nowrap  bordercolor="#000000" height="20"> 
              <input type="text" name="E01DLYINT" size="15" maxlength="15" value="<%= dlCast.getE01DLYINT().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Impuestos Pagados :</div>
            </td>
            <td nowrap  bordercolor="#000000"> 
              <input type="text" name="E01DEATPL" size="15" maxlength="15" value="<%= dlCast.getE01DEATPL().trim()%>" readonly>
            </td>
            <td nowrap  bordercolor="#000000"> 
              <div align="right">Mora Acumulado :</div>
            </td>
            <td nowrap  bordercolor="#000000">
              <input type="text" name="E01DEAPIA" size="15" maxlength="15" value="<%= dlCast.getE01DEAPIA().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">ITBMS Pagado :</div>
            </td>
            <td nowrap  bordercolor="#000000"> 
              <input type="text" name="E01DEAIVL" size="15" maxlength="15" value="<%= dlCast.getE01DEAIVL().trim()%>" readonly>
            </td>
            <td nowrap  bordercolor="#000000"> 
              <div align="right">Mora Pagada:</div>
            </td>
            <td nowrap  bordercolor="#000000">
              <input type="text" name="E01DEAPIP" size="15" maxlength="15" value="<%= dlCast.getE01DEAPIP().trim()%>" readonly>
            </td>
          </tr>

        </table>
                
      	</td>
      </tr>
  	</table>
   <p>
   </div>
  </TD>

<TR > 
  <TD valign=top>
    <div id="RATESINFO" style="display:none">
    <h4>Tasas </h4>
    <table class="tableinfo">
     <tr > 
      <td nowrap>    
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Tasa Base / Spread Actual : </div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEARTE" size="9" maxlength="9" value="<%= dlCast.getE01DEARTE().trim()%>" readonly>
            </td>
            <td nowrap > 
              <div align="right">Tasa Flotante Actual :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEAFRT" size="9" maxlength="9" value="<%= dlCast.getE01DEAFRT().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Tasa Base / Spread Anterior : </div>
            </td>
            <td nowrap  bordercolor="#FFFFFF" > 
              <input type="text" name="E01DEAPBR" size="9" maxlength="9" value="<%= dlCast.getE01DEAPBR().trim()%>" readonly>
            </td>
            <td nowrap  bordercolor="#FFFFFF" > 
              <div align="right">Tasa Flotante Anterior :</div>
            </td>
            <td nowrap  bordercolor="#FFFFFF" > 
              <input type="text" name="E01DEAPFR" size="9" maxlength="9" value="<%= dlCast.getE01DEAPFR().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Tasa Efectiva : </div>
            </td>
            <td nowrap  bordercolor="#FFFFFF" > 
              <input type="text" name="E01DEASPR" size="9" maxlength="9" value="<%= dlCast.getE01DEASPR().trim()%>" readonly>
            </td>
            <td nowrap  bordercolor="#FFFFFF" > 
              <div align="right">Pr&oacute;xima Tasa Flotante :</div>
            </td>
            <td nowrap  bordercolor="#FFFFFF" > 
              <input type="text" name="E01DEANER" size="9" maxlength="9" value="<%= dlCast.getE01DEANER().trim()%>" readonly>
            </td>
          </tr>

        </table>
                
      	</td>
      </tr>
  	</table>
   <p>
   </div>
  </TD>


  <TD valign=top>
    <div id="DATESINFO" style="display:none">
    <h4>Fechas </h4>
    <table class="tableinfo">
     <tr > 
      <td nowrap>    
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Fecha Valor :</div>
            </td>
            <td nowrap > 
				<eibsinput:date name="dlCast" fn_year="E01DEASDY" fn_month="E01DEASDM" fn_day="E01DEASDD" readonly="true"/>
            </td>
            <td nowrap > 
              <div align="right">Fecha Ultimo Cambio Contable :</div>
            </td>
            <td nowrap > 
				<eibsinput:date name="dlCast" fn_year="E01DEALGY" fn_month="E01DEALGM" fn_day="E01DEALGD" readonly="true"/>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Fecha Ultimo Cambio de Tasa :</div>
            </td>
            <td nowrap > 
				<eibsinput:date name="dlCast" fn_year="E01DEARCY" fn_month="E01DEARCM" fn_day="E01DEARCD" readonly="true"/>
            </td>
            <td nowrap > 
              <div align="right"> Fecha Ultimo Pago Capital :</div>
            </td>
            <td nowrap > 
				<eibsinput:date name="dlCast" fn_year="E01DEALPY" fn_month="E01DEALPM" fn_day="E01DEALPD" readonly="true"/>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Fecha Pr&oacute;ximo Cambio de Tasa :</div>
            </td>
            <td nowrap> 
				<eibsinput:date name="dlCast" fn_year="E01DEANRY" fn_month="E01DEANRM" fn_day="E01DEANRD" readonly="true"/>
            </td>
            <td nowrap > 
              <div align="right">Fecha Ultimo Pago Intereses :</div>
            </td>
            <td nowrap > 
				<eibsinput:date name="dlCast" fn_year="E01DEALIY" fn_month="E01DEALIM" fn_day="E01DEALID" readonly="true"/>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="right">Fecha Ultima Modificaci&oacute;n :</div>
            </td>
            <td nowrap > 
				<eibsinput:date name="dlCast" fn_year="E01DEALMY" fn_month="E01DEALMM" fn_day="E01DEALMD" readonly="true"/>
            </td>
            <td nowrap > 
              <div align="right">Modificado por :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEAUSR" size="15" maxlength="10" value="<%= dlCast.getE01DEAUSR().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Inter&eacute;s Pagado Hasta :</div>
            </td>
            <td nowrap > 
 				<eibsinput:date name="dlCast" fn_year="E01DEAITY" fn_month="E01DEAITM" fn_day="E01DEAITD" readonly="true"/>
            </td>
            <td nowrap > 
              <div align="right">Principal Pagado Hasta :</div>
            </td>
            <td nowrap > 
 				<eibsinput:date name="dlCast" fn_year="E01DEAPTY" fn_month="E01DEAPTM" fn_day="E01DEAPTD" readonly="true"/>
            </td>
          </tr>

        </table>
                
      	</td>
      </tr>
  	</table>
   <p>
   </div>
  </TD>
</tr>


</table>
  


  <p>
  <div align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>
</form>
</body>
</html>
