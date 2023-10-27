<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Información Detalle de Cesión de Derechos Económicos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="gaDetail" class= "datapro.eibs.beans.ERA006801Message"  scope="session"/>
<jsp:useBean id="gaUserFld" class= "datapro.eibs.beans.ERA007201Message"  scope="session"/>
<jsp:useBean id="gaConfFld" class= "datapro.eibs.beans.ERA007601Message"  scope="session"/>
<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />
<jsp:useBean id="ERA006203Help" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id="gaListIns" class="datapro.eibs.beans.JBListRec" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<%
	boolean b_read_only1 = false;
	boolean b_warning = false;
	String read_only1 = "";
	String disabled1 = "";
	String type_aval = "";
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
	if (gaDetail.getE01R10TYP().equals("1")) {
		type_aval = "Cesión de Derechos Económicos";
	}
%>

<SCRIPT type="text/javascript">

function initPage(){
	document.forms[0].E01R10CON.value = "<%=gaDetail.getE01R10CON().trim()%>";
	document.forms[0].E01R10COM.value = "<%=gaDetail.getE01R10COM().trim()%>";
 	if (document.forms[0].E01R10INP.value == "S") {
		hidePAdmin('iPagare', true);
	} else {
		hidePAdmin('iPagare', false);
	}
}

function limitText(limitField, limitNum) {
	if (limitField.value.length > limitNum + 1) { 
		if (document.forms[0].LAN.value == 'S') {
			alert('Límite de texto excedido');
		} else {
			alert('Límite de texto excedido');
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
    default : {
            }
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
    document.forms[0].SCREEN.value = 206;
	document.forms[0].submit();
}

function getParams(idx,poliza){
	document.forms[0].POLIZA.value = poliza;
}

function goReturn(){
	document.forms[0].SCREEN.value="200";
	document.forms[0].submit();
}

function hidePAdmin(fld, value){
 	if (value) {
   		fld.style.display = 'blcok';
   	} else {
   		fld.style.display = 'none';
   	}
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

<body onload="initPage()">
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
%> <%=type_aval%> - Nueva Garantía
<%
 	} else if (iopecod.equals("0005")) {
%><%=type_aval%> - Modificación Garantía
<%
	} else if (iopecod.equals("0006")) {
%><%=type_aval%> - Borrar Garantía
<%
	} else if (iopecod.equals("0004")) {
%><%=type_aval%> - Consulta Garantía
<%
	}
%>

<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ga_detail_cesion_1.jsp, ERA0068"></h3> 
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0050" >
<input type=HIDDEN name="E01ROCBNK" value="<%=gaDetail.getE01R10BNK().trim()%>" >                 
<input type=HIDDEN name="E01R10BNK" value="<%=gaDetail.getE01R10BNK().trim()%>" >                 
<input type=HIDDEN name="E01ROCREF" value="<%=gaDetail.getE01R10REF().trim()%>" >                 
<input type=HIDDEN name="REF" value="<%=gaDetail.getE01R10REF().trim()%>" >                 
<input type=HIDDEN name="SEQBIEN" value="<%=gaDetail.getE01R10SEQ().trim()%>" >                 
<input type=HIDDEN name="IOPECOD" value="<%=iopecod%>"> 
<input type=HIDDEN name="OPECOD" value="<%=oopecod%>"> 
<input type=HIDDEN name="E01R10PRD" value="<%=gaDetail.getE01R10PRD().trim()%>" >
<input type=HIDDEN name="D01R10PRD" value="<%=gaDetail.getD01R10PRD().trim()%>" >
<input type=HIDDEN name="E01R10TYP" value="<%=gaDetail.getE01R10TYP().trim()%>" >
<input type=HIDDEN name="D01R10TYP" value="<%=gaDetail.getD01R10TYP().trim()%>" >
<input type=HIDDEN name="E01ROCRGK" value="<%=gaDetail.getH01FLGWK1().trim()%>" >   
<input type=HIDDEN name="POLIZA" value="" >
<INPUT TYPE=HIDDEN NAME="SCREEN" ID="SCREEN" VALUE="206">
<input type=HIDDEN name="PURPOSE" value="<%=userPO.getPurpose()%>">
                                        
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
                <input type="text" name="E01R10CUN" readonly size="11" maxlength="9" value="<%=gaDetail.getE01R10CUN().trim()%>">
              </div>
            </td>
            <td nowrap> 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="E01R10NA1" id="E01R10NA1" readonly size="60" maxlength="45" value="<%=gaDetail.getE01R10NA1().trim().equals("") ? curname
					: gaDetail.getE01R10NA1().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap > 
              <div align="right"><b>No. Referencia : </b></div>
            </td>
            <td nowrap>
              <input type="text" name="E01R10REF" id="E01R10REF" size="14" maxlength="12" value="<%=gaDetail.getE01R10REF().trim()%>" readonly>
            </td> 
            <td nowrap> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap> 
              <div align="left">
               <input type="text" name="E01R10CCY" id="E01R10CCY" size="4" maxlength="3" value="<%=gaDetail.getE01R10CCY().trim()%>" readonly> 
              </div>
            </td>
           </tr>
          <tr id="trdark">             
            <td nowrap> 
              <div align="right"><b>Producto :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="PRODUCT" size="38" value="<%=gaDetail.getE01R10PRD().trim()%> - <%=gaDetail.getD01R10PRD().trim()%>" readonly>                 
              </div>
            </td>
            <td nowrap> 
              <div align="right"><b>Tipo de Garantía :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="TYPE" size="38" value="<%=gaDetail.getE01R10TYP().trim()%> - <%=gaDetail.getD01R10TYP().trim()%>" readonly>                 
              </div>
            </td>
          </tr>
          <tr id="trclear">             
            <td nowrap> 
              <div align="right"><b>Secuencia Bien :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="E01R10SEQ" size="4" maxlength="4" value="<%=gaDetail.getE01R10SEQ().trim()%>" readonly> 
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

  <h4>Informaci&oacute;n Detalle Cesión de Derechos</h4>
      
  <table class="tableinfo" width="100%">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right"><h4>Contrato Cesión Banco y Cliente </h4></div>
            </td>
            <td nowrap >
            </td>
            <td nowrap> 
            </td>
            <td nowrap >
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Contrato Suscrito por : </div>
            </td>
            <td nowrap >
                <input type="text" name="E01R10SUS" size="65" maxlength="60" value="<%=gaDetail.getE01R10SUS().trim()%>" <% if (gaDetail.getF01R10SUS().equals("Y")) out.print("class=\"txtchanged\"");%>>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
            <td nowrap> 
              <div align="right">Fecha de Suscripción : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R10FSY" fn_month="E01R10FSM" fn_day="E01R10FSD" required="true" readonly="<%=b_read_only1%>" modified="F01R10FSY;F01R10FSM;F01R10FSD"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Fecha de Vencimiento : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R10VSY" fn_month="E01R10VSM" fn_day="E01R10VSD" required="true" readonly="<%=b_read_only1%>" modified="F01R10VSY;F01R10VSM;F01R10VSD"/>
            </td>
            <td nowrap >
              <div align="right">Negocio Subyacente : </div>
            </td>
            <td nowrap >
                <input type="text" name="E01R10NSB" size="65" maxlength="60" value="<%=gaDetail.getE01R10NSB().trim()%>" <% if (gaDetail.getF01R10NSB().equals("Y")) out.print("class=\"txtchanged\"");%>>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Periodicidad y/o Fecha Cierta : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R10FPY" fn_month="E01R10FPM" fn_day="E01R10FPD" required="false" readonly="<%=b_read_only1%>" modified="F01R10FPY;F01R10FPM;F01R10FPD"/>
            </td>
            <td nowrap >
              <div align="right">Término Periodicidad y Frecuencia : </div>
            </td>
            <td nowrap >
					<div>
					<INPUT type="text" name="E01R10TRM" size="5" maxlength="5" value="<%=gaDetail.getE01R10TRM().trim()%>" onKeyPress="enterInteger(event)" <% if (gaDetail.getF01R10TRM().equals("Y")) out.print("class=\"txtchanged\"");%>>
					<div <% if (gaDetail.getF01R10PLZ().equals("Y")) out.print("class=\"txtchanged\""); %>>
					<select name="E01R10PLZ">
					<option value=""
						<%if (gaDetail.getE01R10PLZ().equals("")) {
				out.print("selected");
			}%>></option>
					<option value="D"
						<%if (gaDetail.getE01R10PLZ().equals("D")) {
				out.print("selected");
			}%>>Dias</option>
					<option value="M"
						<%if (gaDetail.getE01R10PLZ().equals("M")) {
				out.print("selected");
			}%>>Meses</option>
					<option value="Y"
						<%if (gaDetail.getE01R10PLZ().equals("Y")) {
				out.print("selected");
			}%>>A#os</option>
					</select>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
					</div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
             <div align="right">Valor Cedido : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R10VCD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" required="true" readonly="<%=b_read_only1%>" modified="F01R10VCD"/>
            </td>
            <td nowrap >
            </td>
            <td nowrap >
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Notificación de Cesión de <br>los derechos económicos : </div>
            </td>
            <td nowrap >
				<div <% if (gaDetail.getF01R10NCD().equals("Y")) out.print("class=\"txtchanged\""); %>>
                <input type="hidden" name="E01R10NCD" value="<%=gaDetail.getE01R10NCD()%>">
                <input type="radio" name="CE01R10NCD" value="S" onClick="document.forms[0].E01R10NCD.value='S'"
			  <%if (gaDetail.getE01R10NCD().equals("S"))
				out.print("checked");%> <%=disabled1%>>
                Si
                <input type="radio" name="CE01R10NCD" value="N" onClick="document.forms[0].E01R10NCD.value='N'"
			  <%if (gaDetail.getE01R10NCD().equals("N"))
				out.print("checked");%> <%=disabled1%>>
                No
				</div>
            </td>
            <td nowrap >
              <div align="right">Suscrita por : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01R10NCS" size="60" maxlength="60" value="<%=gaDetail.getE01R10NCS().trim()%>" <%=read_only1%> <% if (gaDetail.getF01R10NCS().equals("Y")) out.print("class=\"txtchanged\"");%>>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Fecha de Expedición : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R10FEY" fn_month="E01R10FEM" fn_day="E01R10FED" required="false" readonly="<%=b_read_only1%>" modified="F01R10FEY;F01R10FEM;F01R10FED"/>
            </td>
            <td nowrap >
              <div align="right">Control de la fuente de pago : </div>
            </td>
            <td nowrap >
				<div <% if (gaDetail.getF01R10CFP().equals("Y")) out.print("class=\"txtchanged\""); %>>
                <input type="hidden" name="E01R10CFP" value="<%=gaDetail.getE01R10CFP()%>">
                <input type="radio" name="CE01R10CFP" value="C" onClick="document.forms[0].E01R10CFP.value='S'"
			  <%if (gaDetail.getE01R10CFP().equals("S"))
				out.print("checked");%> <%=disabled1%>>
                Si
                <input type="radio" name="CE01R10CFP" value="O" onClick="document.forms[0].E01R10CFP.value='N'"
			  <%if (gaDetail.getE01R10CFP().equals("N"))
				out.print("checked");%> <%=disabled1%>>
                No
				</div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap > 
              <div align="right">Comentarios Adicionales : </div>
            </td>
            <td nowrap colspan=3>
				<TEXTAREA name="E01R10CON" rows="5" cols="55" onKeyDown="limitText(this.form.E01R10CON,200);"
				onKeyUp="limitText(this.form.E01R10CON,200);" <%=disabled1%> <% if (gaDetail.getF01R10CON().equals("Y")) out.print("class=\"txtchanged\"");%>>
				<%=gaDetail.getE01R10CON().trim() %>
			    </TEXTAREA>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Información Pagaré : </div>
            </td>
            <td nowrap >
				<div <% if (gaDetail.getF01R10INP().equals("Y")) out.print("class=\"txtchanged\""); %>>
                <input type="hidden" name="E01R10INP" value="<%=gaDetail.getE01R10INP()%>">
                <input type="radio" name="CE01R10INP" value="C" onClick="document.forms[0].E01R10INP.value='S';hidePAdmin('iPagare',true)"
			  <%if (gaDetail.getE01R10INP().equals("S"))
				out.print("checked");%> <%=disabled1%> onChange="hidePAdmin('iPagare',true)" onBlur="hidePAdmin('iPagare',true)" >
                Si
                <input type="radio" name="CE01R10INP" value="O" onClick="document.forms[0].E01R10INP.value='N';hidePAdmin('iPagare',false)"
			  <%if (gaDetail.getE01R10INP().equals("N"))
				out.print("checked");%> <%=disabled1%> onChange="hidePAdmin('iPagare',false)" onBlur="hidePAdmin('iPagare',false)">
                No
				</div>
            </td>
            <td nowrap >
            </td>
            <td nowrap >
            </td>
          </tr>
	</table>

	<div id="iPagare" style="display:''">
      <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Número Pagaré : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01R10NPA" size="28" maxlength="25" value="<%=gaDetail.getE01R10NPA().trim()%>" <%=read_only1%> <% if (gaDetail.getF01R10NPA().equals("Y")) out.print("class=\"txtchanged\"");%>>
            </td>
            <td nowrap> 
             <div align="right">Valor Obligación : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R10VOB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" required="true" readonly="<%=b_read_only1%>" modified="F01R10VOB"/>
            </td>
          </tr>
		</table>
	</div>    
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap colspan=4> 
				<B>Aceptación de Derechos</B>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Suscrita por : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01R10ADS" size="60" maxlength="60" value="<%=gaDetail.getE01R10ADS().trim()%>" <%=read_only1%> <% if (gaDetail.getF01R10ADS().equals("Y")) out.print("class=\"txtchanged\"");%>>
            </td>
            <td nowrap >
              <div align="right">Fecha de Expedición : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R10EAY" fn_month="E01R10EAM" fn_day="E01R10EAD" required="false" readonly="<%=b_read_only1%>" modified="F01R10EAY;F01R10EAM;F01R10EAD"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Camara de Comercio : </div>
            </td>
            <td nowrap >
            	<div <% if (gaDetail.getF01R10CCI().equals("Y")) out.print("class=\"txtchanged\""); %>>
                <input type="hidden" name="E01R10CCI" value="<%=gaDetail.getE01R10CAC()%>">
                <input type="radio" name="CE01R10CCI" value="C" onClick="document.forms[0].E01R10CCI.value='S'"
			  <%if (gaDetail.getE01R10CCI().equals("S"))
				out.print("checked");%> <%=disabled1%>>
                Si
                <input type="radio" name="CE01R10CCI" value="O" onClick="document.forms[0].E01R10CCI.value='N'"
			  <%if (gaDetail.getE01R10CCI().equals("N"))
				out.print("checked");%> <%=disabled1%>>
                No
				</div>
            </td>
            <td nowrap >
            </td>
            <td nowrap >
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap colspan=4> 
				<B>Documentos Anexos a la Fuente de Pago</B>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Comunicación(es) Aceptando Cesión : </div>
            </td>
            <td nowrap >
				<div <% if (gaDetail.getF01R10CAC().equals("Y")) out.print("class=\"txtchanged\""); %>>
                <input type="hidden" name="E01R10CAC" value="<%=gaDetail.getE01R10CAC()%>">
                <input type="radio" name="CE01R10CAC" value="C" onClick="document.forms[0].E01R10CAC.value='C'"
			  <%if (gaDetail.getE01R10CAC().equals("C"))
				out.print("checked");%> <%=disabled1%>>
                Copia
                <input type="radio" name="CE01R10CAC" value="O" onClick="document.forms[0].E01R10CAC.value='O'"
			  <%if (gaDetail.getE01R10CAC().equals("O"))
				out.print("checked");%> <%=disabled1%>>
                Original
				</div>
            </td>
            <td nowrap> 
              <div align="right">Contrato Cedido : </div>
            </td>
            <td nowrap >
            	<div <% if (gaDetail.getF01R10CCD().equals("Y")) out.print("class=\"txtchanged\""); %>>
                <input type="hidden" name="E01R10CCD" value="<%=gaDetail.getE01R10CCD()%>">
                <input type="radio" name="CE01R10CCD" value="C" onClick="document.forms[0].E01R10CCD.value='C'"
			  <%if (gaDetail.getE01R10CCD().equals("C"))
				out.print("checked");%> <%=disabled1%>>
                Copia
                <input type="radio" name="CE01R10CCD" value="O" onClick="document.forms[0].E01R10CCD.value='O'"
			  <%if (gaDetail.getE01R10CCD().equals("O"))
				out.print("checked");%> <%=disabled1%>>
                Original
                </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Camara de Comercio Cedente : </div>
            </td>
            <td nowrap >
            	<div <% if (gaDetail.getF01R10CCC().equals("Y")) out.print("class=\"txtchanged\""); %>>
                <input type="hidden" name="E01R10CCC" value="<%=gaDetail.getE01R10CAC()%>">
                <input type="radio" name="CE01R10CCC" value="C" onClick="document.forms[0].E01R10CCC.value='C'"
			  <%if (gaDetail.getE01R10CCC().equals("C"))
				out.print("checked");%> <%=disabled1%>>
                Copia
                <input type="radio" name="CE01R10CCC" value="O" onClick="document.forms[0].E01R10CCC.value='O'"
			  <%if (gaDetail.getE01R10CCC().equals("O"))
				out.print("checked");%> <%=disabled1%>>
                Original
                </div>
            </td>
            <td nowrap> 
              <div align="right">Camara de Comercio Cedido : </div>
            </td>
            <td nowrap >
            	<div <% if (gaDetail.getF01R10CCE().equals("Y")) out.print("class=\"txtchanged\""); %>>
                <input type="hidden" name="E01R10CCE" value="<%=gaDetail.getE01R10CCE()%>">
                <input type="radio" name="CE01R10CCE" value="C" onClick="document.forms[0].E01R10CCE.value='C'"
			  <%if (gaDetail.getE01R10CCE().equals("C"))
				out.print("checked");%> <%=disabled1%>>
                Copia
                <input type="radio" name="CE01R10CCE" value="O" onClick="document.forms[0].E01R10CCE.value='O'"
			  <%if (gaDetail.getE01R10CCE().equals("O"))
				out.print("checked");%> <%=disabled1%>>
                Original
                </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap > 
              <div align="right">Observaciones : </div>
            </td>
            <td nowrap colspan=3>
				<TEXTAREA name="E01R10COM" rows="5" cols="55" onKeyDown="limitText(this.form.E01R10COM,200);"
				onKeyUp="limitText(this.form.E01R10COM,200);" <%=disabled1%> <% if (gaDetail.getF01R10COM().equals("Y")) out.print("class=\"txtchanged\"");%>>
				<%=gaDetail.getE01R10COM().trim() %>
			    </TEXTAREA>
            </td>
          </tr>
         </table>
		</td>
    </tr>
  </table>
<%
	if (userPO.getOption().equals("Y")) { 
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
		  					<jsp:param name="title" value="Información Confecamaras" /> 
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
  	<h4>Campos Dinámicos</h4>
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
  
<%	} %>	

<table width="100%">		
	<%
				if (b_warning) {
			%>
	<tr>
		<td width="100%" align="center" colspan="3">
			<input type="checkbox" name="H01FLGMAS" value="A" <%if (gaDetail.getH01FLGMAS().trim().equals("A"))
					out.print(" checked");%>>
			Aceptar con Información Parcial
		</td>
	</tr>
	<%
		}
	%>
	<tr>
		<td align="center" >
		<INPUT id="EIBSBTN" type="button" name="Cancel" value="Cancelar" onclick="goReturn()">
		</td>
	<%
		if (iopecod.equals("0005") || iopecod.equals("0006")
				|| iopecod.equals("0001")) {
	%>	
		<td align="center" >
	<%
			if (oopecod.equals("0003")) {
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