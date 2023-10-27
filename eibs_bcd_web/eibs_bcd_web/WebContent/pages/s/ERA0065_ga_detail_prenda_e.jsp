<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Informaci�n Detalle de Otras Prendas</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="gaDetail" class= "datapro.eibs.beans.ERA006501Message"  scope="session"/>
<jsp:useBean id="gaUserFld" class= "datapro.eibs.beans.ERA007201Message"  scope="session"/>
<jsp:useBean id="gaConfFld" class= "datapro.eibs.beans.ERA007601Message"  scope="session"/>
<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id="ERA006203Help" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="gaListIns" class="datapro.eibs.beans.JBListRec" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<%
	boolean b_read_only1 = false;
	String read_only1 = "";
	String disabled1 = "";
	String client = currClient != null ? currClient.getE01CUSCUN() : "";
	String curname = currClient != null ? currClient.getE01CUSNA1()
			.trim() : "";
	String iopecod = gaDetail != null ? gaDetail.getH01OPECOD().trim()
			: "";
	String oopecod = "";
	if (iopecod.equals("0005")) {
		oopecod = "0002";
	} else if (iopecod.equals("0001")) {
		oopecod = "0002";
	} else if (iopecod.equals("0002")) {
		oopecod = "0002";
	} else if (iopecod.equals("0006")) {
		oopecod = "0003";
	}
	//PROTEGER CAMPOS PARA CONSULTA Y BORRADO
	if (iopecod.equals("0004") || iopecod.equals("0006")) {
		read_only1 = "readonly";
		b_read_only1 = true;
		disabled1 = "disabled";
	}
%>

<SCRIPT type="text/javascript">

function initPage(){
	document.forms[0].E01R04COM.value = "<%=gaDetail.getE01R04COM().trim()%>";
	document.forms[0].E01R04DSP.value = "<%=gaDetail.getE01R04DSP().trim()%>";
}

function limitText(limitField, limitNum) {
	if (limitField.value.length > limitNum + 1) { 
		if (document.forms[0].LAN.value == 'S') {
			alert('L�mite de texto excedido');
		} else {
			alert('L�mite de texto excedido');
		}	
	}	
	if (limitField.value.length > limitNum) {
		limitField.value = limitField.value.substring(0, limitNum);
	}
}
function goActionA(op) {
   switch (op) {
            //adicion
    case 1 :    
         document.forms[0].OPECOD.value = "0001";
         document.forms[0].SCREEN.value = 111;
         break;
           //modificacion
    case 2 :
	    document.forms[0].OPECOD.value = "0005";
	    document.forms[0].SCREEN.value = 111;
        break;
    case 3 :
        //borrar
       document.forms[0].OPECOD.value = "0006";
       document.forms[0].SCREEN.value = 111;
       break;
    case 4 :
       //consultar
       document.forms[0].OPECOD.value = "0004";
       document.forms[0].SCREEN.value = 111;
       break;
    default : 
            break;
    }
	var SCREEN = document.forms[0].SCREEN.value;
	var OPECOD = document.forms[0].OPECOD.value;
	var E01ROCBNK = document.forms[0].E01ROCBNK.value;
	var E01ROCREF = document.forms[0].E01ROCREF.value;
	var SEQBIEN = document.forms[0].SEQBIEN.value;
	var POLIZA = document.forms[0].POLIZA.value;
	var PURPOSE = document.forms[0].PURPOSE.value;
	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0050?SCREEN="+SCREEN+"&OPECOD="+OPECOD+"&E01ROCBNK="+E01ROCBNK+"&E01ROCREF="+E01ROCREF+"&SEQBIEN="+SEQBIEN+"&POLIZA="+POLIZA+"&PURPOSE="+PURPOSE;
	CenterWindow(page,1200,600,2);
 }

function goRefreshIns() {
    document.forms[0].OPECOD.value = "0005";
    document.forms[0].SCREEN.value = 203;
	document.forms[0].submit();
}

function goRefresh() {
    document.forms[0].SCREEN.value = 200;
	document.forms[0].submit();
}

function getParams(idx,poliza){
	document.forms[0].POLIZA.value = poliza;
}

function goReturn(){
	document.forms[0].SCREEN.value="200";
	document.forms[0].submit();
}

   function waitSimulate() {
     document.body.style.cursor = "wait";
   }
   document.forms[0].onsubmit= waitSimulate;
</script>

<%
	if (!userPO.getPurpose().equals("NEW")) {
	}
%> 

</head>

<body onload=javascript:initPage()>
<%
	if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
%> 
<%
 	int row = 0;
 %>
<h3 align="center"><%
	if (iopecod.equals("0001")) {
%>Garant&iacute;as Detalle Prenda Establecimiento de Comercio - Nuevo Bien
<%
	} else if (iopecod.equals("0005")) {
%>Garant&iacute;as Detalle Prenda Establecimiento de Comercio - Modificaci�n Bien
<%
	} else if (iopecod.equals("0006")) {
%>Garant&iacute;as Detalle Prenda Establecimiento de Comercio - Borrar Bien
<%
	} else if (iopecod.equals("0004")) {
%>Garant&iacute;as Detalle Prenda Establecimiento de Comercio - Consulta Bien
<%
	}
%>

<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ga_detail_prenda_e.jsp, ERA0065"></h3> 
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0050" >
<input type=HIDDEN name="E01ROCBNK" value="<%=gaDetail.getE01R04BNK().trim()%>" >                 
<input type=HIDDEN name="E01ROCREF" value="<%=gaDetail.getE01R04REF().trim()%>" >                 
<input type=HIDDEN name="REF" value="<%=gaDetail.getE01R04REF().trim()%>" >                 
<input type=HIDDEN name="SEQBIEN" value="<%=gaDetail.getE01R04SEQ().trim()%>" >                 
<input type=HIDDEN name="IOPECOD" value="<%=iopecod%>"> 
<input type=HIDDEN name="OPECOD" value="<%=oopecod%>"> 
<input type=HIDDEN name="E01R04PRD" value="<%=gaDetail.getE01R04PRD().trim()%>" >
<input type=HIDDEN name="D01R04PRD" value="<%=gaDetail.getD01R04PRD().trim()%>" >
<input type=HIDDEN name="E01R04TYP" value="<%=gaDetail.getE01R04TYP().trim()%>" >
<input type=HIDDEN name="D01R04TYP" value="<%=gaDetail.getD01R04TYP().trim()%>" >
<input type=HIDDEN name="POLIZA" value="" readonly>
<INPUT TYPE=HIDDEN NAME="SCREEN" ID="SCREEN" VALUE="203">
<input type=HIDDEN name="PURPOSE" value="<%= userPO.getPurpose()%>">
<input type=HIDDEN name="E01ROCRGK" value="<%=gaDetail.getH01FLGWK1().trim()%>" >   
                                        
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap> 
              <div align="right"><b>Cliente : </b></div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01R04CUN" readonly size="11" maxlength="9" value="<%=gaDetail.getE01R04CUN().trim()%>">
              </div>
            </td>
            <td nowrap> 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="E01R04NA1" id="E01R04NA1" readonly size="60" maxlength="45" value="<%=gaDetail.getE01R04NA1().trim().equals("") ? curname
					: gaDetail.getE01R04NA1().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap > 
              <div align="right"><b>No. Referencia : </b></div>
            </td>
            <td nowrap>
              <input type="text" name="E01R04REF" id="E01R04REF" size="14" maxlength="12" value="<%=gaDetail.getE01R04REF().trim()%>" readonly>
            </td> 
            <td nowrap> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap> 
              <div align="left">
               <input type="text" name="E01R04CCY" id="E01R04CCY" size="4" maxlength="3" value="<%=gaDetail.getE01R04CCY().trim()%>" readonly> 
              </div>
            </td>
           </tr>
          <tr id="trdark">             
            <td nowrap> 
              <div align="right"><b>Producto :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="PRODUCT" size="38" value="<%=gaDetail.getE01R04PRD().trim()%> - <%=gaDetail.getD01R04PRD().trim()%>" readonly>                 
              </div>
            </td>
            <td nowrap> 
              <div align="right"><b>Tipo de Garant�a :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="TYPE" size="60" value="<%=gaDetail.getE01R04TYP().trim()%> - <%=gaDetail.getD01R04TYP().trim()%>" readonly>                 
              </div>
            </td>
          </tr>
          <tr id="trclear">             
            <td nowrap> 
              <div align="right"><b>Secuencia Bien :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="E01R04SEQ" size="4" maxlength="4" value="<%=gaDetail.getE01R04SEQ().trim()%>" readonly> 
              </div>
            </td>
            <td nowrap> 
            </td>
            <td nowrap> 
              <div align="left">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <h4>Informaci&oacute;n Detalle Prenda Establecimiento de Comercio</h4>
      
  <table class="tableinfo" width="100%">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
        	<td nowrap colspan="4"><B>Contrato de Prenda Sobre Establecimiento de Comercio</B></td>
          </tr>	
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Certificado del Revisor Fiscal sobre Propiedad : </div>
            </td>
            <td nowrap >
                <input type="hidden" name="E01R04ICR" value="<%=gaDetail.getE01R04ICR()%>">
                <input type="radio" name="CE01R04ICR" value="S" onClick="document.forms[0].E01R04ICR.value='S'"
			  <%if (gaDetail.getE01R04ICR().equals("S"))
				out.print("checked");%> <%=disabled1%>>
                Si
                <input type="radio" name="CE01R04ICR" value="N" onClick="document.forms[0].E01R04ICR.value='N'"
			  <%if (gaDetail.getE01R04ICR().equals("N"))
				out.print("checked");%> <%=disabled1%>>
                No
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
            <td nowrap> 
              <div align="right">Descripci�n :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01R04CRF" size="55" maxlength="50" value="<%= gaDetail.getE01R04CRF().trim()%>" <%=read_only1%>>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Fecha de Suscripci�n : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R04FSY" fn_month="E01R04FSM" fn_day="E01R04FSD" required="true" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap >
              <div align="right">Fecha de Vencimiento: </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R04FVY" fn_month="E01R04FVM" fn_day="E01R04FVD" required="true" readonly="<%=b_read_only1%>"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap valign="top"> 
              <div align="right">Descripci�n Objeto : </div>
            </td>
            <td nowrap colspan=3>
				<TEXTAREA name="E01R04DSP" rows="3" cols="70" onKeyDown="limitText(this.form.E01R04DSP,200);"
				onKeyUp="limitText(this.form.E01R04DSP,200);" <%=disabled1%> ><%=gaDetail.getE01R04DSP().trim()%>
			    </TEXTAREA>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Valor : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R04MGA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" required="true" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap> 
            </td>
            <td nowrap >
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right"><B>Certificado de Camara de Comercio : </B></div>
            </td>
            <td nowrap >
                <input type="hidden" name="E01R04CCC" value="<%=gaDetail.getE01R04CCC()%>">
                <input type="radio" name="CE01R04CCC" value="S" onClick="document.forms[0].E01R04CCC.value='S'"
			  <%if (gaDetail.getE01R04CCC().equals("S"))
				out.print("checked");%> <%=disabled1%>>
                Si
                <input type="radio" name="CE01R04CCC" value="N" onClick="document.forms[0].E01R04CCC.value='N'"
			  <%if (gaDetail.getE01R04CCC().equals("N"))
				out.print("checked");%> <%=disabled1%>>
                No
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
            <td nowrap >
            </td>
            <td nowrap >
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Fecha de Expedici�n : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R04FCY" fn_month="E01R04FCM" fn_day="E01R04FCD" required="true" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap >
              <div align="right">Facultades : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01R04RPC" size="55" maxlength="50" value="<%= gaDetail.getE01R04RPC().trim()%>" <%=read_only1%>>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap colspan=4> 
				<B>Aval�o</B>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Aval�o o Factura de Compra/Venta : </div>
            </td>
            <td nowrap >
                <input type="hidden" name="E01R04AVF" value="<%=gaDetail.getE01R04AVF()%>">
                <input type="radio" name="CE01R04AVF" value="C" onClick="document.forms[0].E01R04AVF.value='C'"
			  <%if (gaDetail.getE01R04AVF().equals("C"))
				out.print("checked");%> <%=disabled1%>>
                Copia
                <input type="radio" name="CE01R04AVF" value="O" onClick="document.forms[0].E01R04AVF.value='O'"
			  <%if (gaDetail.getE01R04AVF().equals("O"))
				out.print("checked");%> <%=disabled1%>>
                Original
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
            <td nowrap >
            </td>
            <td nowrap >
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Fecha de Expedici�n : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R04FEY" fn_month="E01R04FEM" fn_day="E01R04FED" required="true" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap >
              <div align="right">Fecha de Vencimiento : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R04VAY" fn_month="E01R04VAM" fn_day="E01R04VAD" required="true" readonly="<%=b_read_only1%>"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Valor Comercial  : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R04VCO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" required="true" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap >
              <div align="right">Aval�o Expedido Por : </div>
            </td>
            <td nowrap >
				<%
					if (!b_read_only1) {
				%>
               <eibsinput:cnofc name="gaDetail" flag="GX" property="E01R04TRL" fn_description="D01R04TRL" required="true"/>
				<%
					} else {
				%>
			   <eibsinput:text name="gaDetail" property="E01R04TRL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" required="true" readonly="<%=b_read_only1%>" />
				<%
					}
				%>
               <eibsinput:text name="gaDetail" property="D01R04TRL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap valign="top"> 
              <div align="right">Comentarios : </div>
            </td>
            <td nowrap colspan=3>
				<TEXTAREA name="E01R04COM" rows="5" cols="55" onKeyDown="limitText(this.form.E01R04COM,200);"
				onKeyUp="limitText(this.form.E01R04COM,200);" <%=disabled1%> ><%=gaDetail.getE01R04COM().trim() %>
			    </TEXTAREA>
            </td>
          </tr>
         </table>
      </td>
    </tr>
  </table>
<%
    if (gaDetail.getH01FLGWK1().equals("Y")){
%>
	<br>
  	<h4>Campos de Confecamara</h4>
	<table cellspacing="0" width="100%" border="0">
    	<tr bordercolor="#FFFFFF"> 
      		<td nowrap colspan=4> 
				<table cellspacing="0" width="100%" border="0">
          			<tr id="trclear"> 
            			<td nowrap width="40%"> 
		  					<jsp:include page="ERA0076_ga_confecamaras_template.jsp" flush="true" >				
		  					<jsp:param name="title" value="Informaci�n Confecamaras" /> 
		  					<jsp:param name="messageName" value="gaConfFld" />
		  					<jsp:param name="readOnly" value="<%=b_read_only1%>" /> 
		  					<jsp:param name="basic" value="false" />
		  					</jsp:include>     
  		    			</td> 
          			</tr> 
        		</table>
      		</td>
    	</tr>
  </table>
  
<%	}	
	if (userPO.getSource().equals("Y")) { 
%>
	<br>
  	<h4>Campos Din�micos</h4>
	<table cellspacing="0" width="100%" border="0">
    	<tr bordercolor="#FFFFFF"> 
      	<td nowrap colspan=4> 
			<table cellspacing="0" width="100%" border="0">
          		<tr id="trclear"> 
            		<td nowrap width="40%"> 
					  <jsp:include page="ERA0072_ga_user_template.jsp" flush="true" >				
					  <jsp:param name="title" value="Campos de Usuario" /> 
					  <jsp:param name="messageName" value="gaUserFld" />
					  <jsp:param name="readOnly" value="<%=b_read_only1%>" /> 
					  <jsp:param name="suffix" value="E01EXT" />
					  <jsp:param name="basic" value="false" />
					  </jsp:include>     
  		    		</td> 
          		</tr> 
        	</table>
      	</td>
    	</tr>
	</table>
  
<%	} 	

if (!gaDetail.getE01R04SEQ().equals("999")){
  if (gaDetail.getH01FLGWK3().equals("S") 
		  || (gaDetail.getH01FLGWK3().equals("Y")) ) {
	if (ERA006203Help.getNoResult()) {
%>
<h3>Seguros Asociados a la Garant�a</h3>
<TABLE class="tbenter" height="20%">
	<TR>
		<TD ALIGN=CENTER VALIGN=MIDDLE>
		<H4 style="text-align: center">No existe ning�n seguro asociado a la garant�a.
		</h4>
		</TD>
	</TR>
	<tr>
		<%
			if (!b_read_only1) {
		%>
		<td class=TDBKG width="20%">
		<div align="center"><a href="javascript:goActionA(1)" id="btn3"><b>Crear Seguro para este Bien</b></a></div>
		</td>
		<%
			}
		%>
	</tr>
</TABLE>
<%
	} else {
%>
<h3>Seguros Relacionados a esta Garant�a</h3>
	<TABLE id="mainTableF" class="tableinfo">
			<TR>
				<TD nowrap valign="top" width="100%">

					<table class="tbenter" width=100% align=center>
					<tr>
					<%
						if (!b_read_only1) {
					%>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goActionA(1)" id="btnA1"><b>Adicionar </b></a></div>
					</td>
					<%
						}
					%>
					<%
						if (!b_read_only1) {
					%>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goActionA(2)" id="btnA2"><b>Modificar</b></a></div>
					</td>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goActionA(3)" id="btnA3"><b>Borrar</b></a></div>
					</td>
					<%
						}
					%>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goActionA(4)" id="btnA4"><b>Consultar </b></a></div>
					</td>
					</tr>
					</table>

					<TABLE id="headTableF" >
					<TBODY>
				<tr id="trdark">
					<TH ALIGN=CENTER NOWRAP></TH>
					<TH ALIGN=CENTER NOWRAP>Compa&ntilde;&iacute;a</TH>
					<TH ALIGN=CENTER NOWRAP>Nombre</TH>
					<TH ALIGN=CENTER NOWRAP>N&uacute;mero<BR>P&oacute;liza</TH>
					<TH ALIGN=CENTER NOWRAP>Moneda</TH>
					<TH ALIGN=CENTER NOWRAP>Monto</TH>
				</tr>
			</TBODY>
			</TABLE>

			<div id="dataDivF" class="scbarcolor">
				<table id="dataTableF" >
			<%
				boolean firstTime = true;
					String gaChk = "";
					gaListIns.initRow();
					int i = 0;
					ERA006203Help.initRow();

					while (ERA006203Help.getNextRow()) {
							gaChk = (firstTime) ? "checked" : "";
							firstTime = false;
							ERA006203Help.getNextRow();
							datapro.eibs.beans.ERA006203Message msgList = (datapro.eibs.beans.ERA006203Message) ERA006203Help
									.getRecord();
			%>
			<TBODY>

				<TR>
					<TD ALIGN=LEFT NOWRAP width="5%"><input type="radio"
						name="COLLCOD" value="<%=ERA006203Help.getCurrentRow()%>"
						onClick="getParams(this.value,'<%=msgList.getE03ROCCIN()%>')"
						<%=gaChk%>></TD>
					<TD ALIGN=CENTER NOWRAP><%=Util.formatCell(msgList.getE03ROCICN())%></TD>
					<TD ALIGN=CENTER NOWRAP><%=Util.formatCell(msgList.getE03ROCICM())%></TD>
					<TD ALIGN=CENTER NOWRAP><%=Util.formatCell(msgList.getE03ROCCIN())%></TD>
					<TD ALIGN=CENTER NOWRAP><%=Util.formatCell(msgList.getE03ROCICY())%></TD>
					<TD ALIGN=CENTER NOWRAP><%=Util.fcolorCCY(msgList.getE03ROCIPA())%></TD>
				</TR>
			</TBODY>
			<%
						i++;
					}
			%>
			</table>
			</DIV>
			</TD>
			</TR>

	</TABLE>

<%
	}
}	
%>
<SCRIPT type="text/javascript">
	showChecked("COLLCOD");
   function resizeDoc() {
		if (isValidObject(document.getElementById("headTableF"))) {
			adjustEquTables(document.getElementById("headTableF"), document.getElementById("dataTableF"), document.getElementById("dataDivF"), 1, false);
		}
   }
	resizeDoc();
    window.onresize = resizeDoc;
	
</SCRIPT>

<%	
}
%>



  <table width="100%" class="tbenter">		
	<%
				if (!b_read_only1) {
			%>
	<tr>
		<td width="100%" align="center" colspan="3">
			<input type="checkbox" name="H01FLGMAS" value="A" <%if (gaDetail.getH01FLGMAS().trim().equals("A"))
					out.print(" checked");%>>
			Aceptar con Informaci�n Parcial
		</td>
	</tr>
	<%
		}
	%>
	<tr>
		<td align="center">
		<INPUT id="EIBSBTN" type="button" name="Cancel" value="Cancelar" onclick="goReturn()">
		</td>
	<%
		if (iopecod.equals("0005") || iopecod.equals("0006")
				|| iopecod.equals("0001")) {
	%>	
		<td align="center" >
	<%
		if (oopecod.equals("0003")){
	%>
	  	<input class="EIBSBTN" id="EIBSBTN" type=submit name="Submit" value="Borrar">

	<%
		} else {
	%>

	  	<input class="EIBSBTN" id="EIBSBTN" type=submit name="Submit" value="Enviar">
	<%
		}
	%>
		</td>
	<%
		}
	%>
	</tr>
  </table>	


  </FORM>
 </BODY>

 </html>