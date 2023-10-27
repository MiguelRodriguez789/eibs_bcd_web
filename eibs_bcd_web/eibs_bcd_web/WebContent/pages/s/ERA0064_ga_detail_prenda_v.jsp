<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Información Detalle de Garantías Prenda Vehículos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="gaDetail" class= "datapro.eibs.beans.ERA006401Message"  scope="session"/>
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
<script src="<%=request.getContextPath()%>/pages/s/javascripts/jquery.jsp"> </script>

<%
	boolean b_read_only1 = false;
%>
<%
	String read_only1 = "";
%>
<%
	String disabled1 = "";
%>
<%
	String client = currClient != null ? currClient.getE01CUSCUN() : "";
	String curname = currClient != null ? currClient.getE01CUSNA1()
			.trim() : "";
	String iopecod = gaDetail != null ? gaDetail.getH01OPECOD().trim()
			: "";
	String oopecod = "";
	if (iopecod.equals("0005")) {
		oopecod = "0002";
	}
	if (iopecod.equals("0001")) {
		oopecod = "0002";
	}
	if (iopecod.equals("0002")) {
		oopecod = "0002";
	}
	if (iopecod.equals("0006")) {
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
	document.forms[0].E01R03COM.value = "<%=gaDetail.getE01R03COM().trim()%>";
	document.forms[0].E01R03CIT.value = "<%=gaDetail.getE01R03CIT().trim()%>";
	if ("<%=gaDetail.getE01R03EST()%>" == "N"){
		hideVused('VNew','VUsed', false);
	}else{
		hideVused('VNew','VUsed', true);
	}
}

function changeFld(valueFld,fld){
	document.forms[0].E01R03VFN.value = valueFld;
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
<%--
	document.getElementById("btnA1").removeAttribute("href");
	document.getElementById("btnA1").style.color = "grey";
	document.getElementById("btnA2").removeAttribute("href");
	document.getElementById("btnA2").style.color = "grey";
	document.getElementById("btnA3").removeAttribute("href");
	document.getElementById("btnA3").style.color = "grey";
	document.getElementById("btnA4").removeAttribute("href");
	document.getElementById("btnA4").style.color = "grey";
	document.body.style.cursor='wait';
--%>
   switch (op) {
            //adicion
    case 1 :{    
	         document.forms[0].OPECOD.value = "0001";
	         document.forms[0].SCREEN.value = 111;
            }
            break;
            //modificacion
    case 2 :{
	         document.forms[0].OPECOD.value = "0005";
	         document.forms[0].SCREEN.value = 111;
            }
            break;
    case 3 :{
            //borrar
	         document.forms[0].OPECOD.value = "0006";
	         document.forms[0].SCREEN.value = 111;
            }
            break;
    case 4 :{
            //consultar
	         document.forms[0].OPECOD.value = "0004";
	         document.forms[0].SCREEN.value = 111;
            }
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
    document.forms[0].SCREEN.value = 102;
	document.forms[0].submit();
}

function getParams(idx,poliza){
	document.forms[0].POLIZA.value = poliza;
}

function showVUsed(obj){
   if (obj.checked) VUsed.style.display=""; else {
    VUsed.style.display="none";
   }
}

function hideVused(fld, fld2, value){
 if (value) {
   eval(fld+".style.display='none'");
   eval(fld2+".style.display=''");
   } else{
   eval(fld+".style.display=''");
   eval(fld2+".style.display='none'");
   }
}

function goReturn(){
	document.forms[0].SCREEN.value="200";
	document.forms[0].submit();
}

</script>

<%
	if (!userPO.getPurpose().equals("NEW")) {
%>
<SCRIPT type="text/javascript">
//MENU AQUI   

    
</SCRIPT>
<%
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
%>Garant&iacute;as Detalle Prenda Vehículo - Nuevo Bien
<%
	} else {
%>
<%
	if (iopecod.equals("0005")) {
%>Garant&iacute;as Detalle Prenda Vehículo - Modificación Bien
<%
	} else {
%>
<%
	if (iopecod.equals("0006")) {
%>Garant&iacute;as Detalle Prenda Vehículo - Borrar Bien
<%
	} else {
%>
<%
	if (iopecod.equals("0004")) {
%>Garant&iacute;as Detalle Prenda Vehículo - Consulta Bien
<%
	}
			}
		}
	}
%>

<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ERA0064_ga_detail_prenda_v.jsp,ERA0064"></h3> 
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0050" >
<input type=HIDDEN name="E01ROCBNK" value="<%=gaDetail.getE01R03BNK().trim()%>" >                 
<input type=HIDDEN name="E01ROCREF" value="<%=gaDetail.getE01R03REF().trim()%>" >                 
<input type=HIDDEN name="SEQBIEN" value="<%=gaDetail.getE01R03SEQ().trim()%>" >                 
<input type=HIDDEN name="IOPECOD" value="<%=iopecod%>"> 
<input type=HIDDEN name="OPECOD" value="<%=oopecod%>"> 
<input type=HIDDEN name="E01R03PRD" value="<%=gaDetail.getE01R03PRD().trim()%>" >                 
<input type=HIDDEN name="D01R03PRD" value="<%=gaDetail.getD01R03PRD().trim()%>" >                 
<input type=HIDDEN name="E01R03TYP" value="<%=gaDetail.getE01R03TYP().trim()%>" >                 
<input type=HIDDEN name="D01R03TYP" value="<%=gaDetail.getD01R03TYP().trim()%>" >                 
<input type=HIDDEN name="E01R03MGA" value="<%=gaDetail.getE01R03MGA().trim()%>" >                 
<input type=HIDDEN name="POLIZA" value="" >   
<input type=HIDDEN name="E01R03VFN" value="<%=gaDetail.getE01R03VFN().trim()%>" >   
<input type=HIDDEN name="E01R03FG1" value="<%=gaDetail.getE01R03FG1().trim()%>" >   
<input type=HIDDEN name="E01ROCRGK" value="<%=gaDetail.getE01R03FG1().trim()%>" >   
<INPUT TYPE=HIDDEN NAME="SCREEN" ID="SCREEN" VALUE="202">
<input type=HIDDEN name="PURPOSE" value="<%= userPO.getPurpose()%>"> 
                                        
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
                <input type="text" name="E01R03CUN" readonly size="11" maxlength="9" value="<%=gaDetail.getE01R03CUN().trim()%>">
              </div>
            </td>
            <td nowrap> 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="E01R03NA1" id="E01R03NA1" readonly size="60" maxlength="45" value="<%=gaDetail.getE01R03NA1().trim().equals("") ? curname
					: gaDetail.getE01R03NA1().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap > 
              <div align="right"><b>No. Referencia : </b></div>
            </td>
            <td nowrap>
              <input type="text" name="E01R03REF" id="E01R03REF" size="14" maxlength="12" value="<%=gaDetail.getE01R03REF().trim()%>" readonly>
            </td> 
            <td nowrap> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap> 
              <div align="left">
               <input type="text" name="E01R03CCY" id="E01R03CCY" size="4" maxlength="3" value="<%=gaDetail.getE01R03CCY().trim()%>" readonly> 
              </div>
            </td>
           </tr>
          <tr id="trdark">             
            <td nowrap> 
              <div align="right"><b>Producto :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="PRODUCT" size="38" value="<%=gaDetail.getE01R03PRD().trim()%> - <%=gaDetail.getD01R03PRD().trim()%>" readonly>                 
              </div>
            </td>
            <td nowrap> 
              <div align="right"><b>Tipo de Garantía :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="TYPE" size="38" value="<%=gaDetail.getE01R03TYP().trim()%> - <%=gaDetail.getD01R03TYP().trim()%>" readonly>                 
              </div>
            </td>
          </tr>
          <tr id="trclear">             
            <td nowrap> 
              <div align="right"><b>Secuencia Bien :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="E01R03SEQ" size="4" maxlength="4" value="<%=gaDetail.getE01R03SEQ().trim()%>" readonly> 
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

  <h4>Informaci&oacute;n Detalle de la Prenda Vehículo</h4>
      
  <table class="tableinfo" width="100%">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">

          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Información del Contrato : </div>
            </td>
            <td nowrap >
                <input type="hidden" name="E01R03INC" value="<%=gaDetail.getE01R03INC()%>">
                <input type="radio" name="CE01R03INC" value="O" onClick="document.forms[0].E01R03INC.value='O'"
			  <%if (gaDetail.getE01R03INC().equals("O"))
				out.print("checked");%> <%=disabled1%>>
                Original
                <input type="radio" name="CE01R03INC" value="C" onClick="document.forms[0].E01R03INC.value='C'"
			  <%if (gaDetail.getE01R03INC().equals("C"))
				out.print("checked");%> <%=disabled1%>>
                Copia
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
            <td nowrap> 
              <div align="right">Monto de la Garantía : </div>
            </td>
            <td nowrap >
              	<b><%=gaDetail.getE01R03MGA().trim()%></b>
<%-- 
             <eibsinput:text name="gaDetail" property="E01R03MGA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" required="true" readonly="<%=b_read_only1%>"/>
--%>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Fecha de Suscripción  : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R03FSY" fn_month="E01R03FSM" fn_day="E01R03FSD" required="true" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap >
              <div align="right">Fecha de Vencimiento: </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R03FVY" fn_month="E01R03FVM" fn_day="E01R03FVD" readonly="<%=b_read_only1%>"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
            </td>
            <td nowrap >
            </td>
            <td nowrap >
            </td>
            <td nowrap >
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Clase de Vehículo : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R03CLV" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT%>" required="true" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap >
              <div align="right">Marca de Vehículo : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R03MRV" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT%>" required="true" readonly="<%=b_read_only1%>"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Servicio : </div>
            </td>
            <td nowrap >
               <div align="left"> 
                  <select name="E01R03SRV">
                    <option value=" " <% if (!(gaDetail.getE01R03SRV().equals("1")||gaDetail.getE01R03SRV().equals("2"))) out.print("selected"); %>> 
                     </option>
                     <option value="1" <% if (gaDetail.getE01R03SRV().equals("1")) out.print("selected"); %> <%=disabled1%>>Particular</option>
                     <option value="2" <% if (gaDetail.getE01R03SRV().equals("2")) out.print("selected"); %> <%=disabled1%>>Público</option>
                   </select>
	               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
                </div>
            </td>
            <td nowrap >
            </td>
            <td nowrap >
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Departamento Matrícula : </div>
            </td>
            <td nowrap >
				<input type="text" name="E01R03DMT" size="5" maxlength="4" value="<%=gaDetail.getE01R03DMT().trim()%>" required="true" <%=read_only1%> />
 				<%
 					if (b_read_only1 == false) {
 				%>
              			<a href="javascript:Get2FilterCodes('E01R03DMT','D01R03DMT','27',' ','')">
							<img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0">
						</a>
				<%
					}
					;
				%>
               <eibsinput:text name="gaDetail" property="D01R03DMT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT %>" readonly="true"/>
            </td>
            <td nowrap >
              <div align="right">Ciudad de Matrícula : </div>
            </td>
            <td nowrap >
				<input type="text" name="E01R03CMT" size="6" maxlength="5" value="<%=gaDetail.getE01R03CMT().trim()%>" required="true" <%=read_only1%> />
 				<%
 					if (b_read_only1 == false) {
 				%>
              			<a href="javascript:Get2FilterCodes('E01R03CMT','D01R03CMT','84',' ',document.forms[0].E01R03DMT.value)">
							<img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0">
						</a>
				<%
					}
					;
				%>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
				<input type="text" name="D01R03CMT" size="30" maxlength="30" value="<%=gaDetail.getD01R03CMT().trim()%>" readonly>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Número de Motor : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R03MTN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT%>" required="true" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap >
              <div align="right">Línea de Vehículo : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R03LIN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT%>" required="true" readonly="<%=b_read_only1%>"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Modelo : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R03MOD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_YEAR%>" required="true" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap >
            </td>
            <td nowrap >
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Placa del Vehículo : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R03PLC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_SWIFT_ID%>" required="true" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap >
              <div align="right">Color del Vehículo : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R03COL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT%>" required="true" readonly="<%=b_read_only1%>"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Cilindraje : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R03CIL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PO_BOX%>" required="true" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap >
              <div align="right">Número de Chasis : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R03CHS" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT%>" required="true" readonly="<%=b_read_only1%>"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Estado : </div>
            </td>
            <td nowrap >
                <input type="hidden" name="E01R03EST" value="<%=gaDetail.getE01R03EST()%>">
                <input type="radio" name="CE01R03EST" value="N" onClick="document.forms[0].E01R03EST.value='N'"
			  <%if (gaDetail.getE01R03EST().equals("N"))
				out.print("checked");%> <%=disabled1%> onChange="hideVused('VNew','VUsed',false)" onBlur="hideVused('VNew','VUsed',false)" >
                Nuevo
                <input type="radio" name="CE01R03EST" value="U" onClick="document.forms[0].E01R03EST.value='U'"
			  <%if (gaDetail.getE01R03EST().equals("U"))
				out.print("checked");%> <%=disabled1%> onChange="hideVused('VNew','VUsed',true)" onBlur="hideVused('VNew','VUsed',true)" >
                Usado
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
            <td nowrap >
            </td>
            <td nowrap >
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap colspan=4> 
				<h4></h4>
            </td>
          </tr>
	</table>
<div id="VNew" style="display:''">
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap colspan=4> 
				<B>Informaci&oacute;n Vehículo Nuevo</B>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Valor Factura : </div>
            </td>
            <td nowrap >
             <input type="text" name="E01R03VFNN" size="17" maxlength="15" value="<%=gaDetail.getE01R03VFN().trim()%>" <%=read_only1%> onchange="changeFld(document.forms[0].E01R03VFNN.value,'E01R03VFN');">
             <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
            <td nowrap >
              <div align="right">Número de Factura : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R03NFN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" required="true" readonly="<%=b_read_only1%>"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Fecha Expedición Factura : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R03FFY" fn_month="E01R03FFM" fn_day="E01R03FFD" required="true" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap >
              <div align="right">Expedida por : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R03FEX" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" required="true" readonly="<%=b_read_only1%>"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap colspan=4> 
				<h4></h4>
            </td>
          </tr>
	</table>
</div>
<div id="VUsed" style="display:'none'">
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap colspan=4> 
				<B>Informaci&oacute;n Vehículo Usado</B>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Tiene Avalúo : </div>
            </td>
            <td nowrap >
                <input type="hidden" name="E01R03AVU" value="<%=gaDetail.getE01R03AVU()%>">
                <input type="radio" name="CE01R03AVU" value="S" onClick="document.forms[0].E01R03AVU.value='S'"
			  <%if (gaDetail.getE01R03AVU().equals("S"))
				out.print("checked");%> <%=disabled1%>>
                Si
                <input type="radio" name="CE01R03AVU" value="N" onClick="document.forms[0].E01R03AVU.value='N'"
			  <%if (gaDetail.getE01R03AVU().equals("N"))
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
              <div align="right">Valor Factura  : </div>
            </td>
            <td nowrap >
             <input type="text" name="E01R03VFNU" size="17" maxlength="15" value="<%=gaDetail.getE01R03VFN().trim()%>" <%=read_only1%> onchange="changeFld(document.forms[0].E01R03VFNU.value,'E01R03VFN');">
            </td>
            <td nowrap >
            </td>
            <td nowrap >
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap > 
              <div align="right">Comentarios : </div>
            </td>
            <td nowrap colspan=3>
				<TEXTAREA name="E01R03COM" rows="5" cols="55" value="" onKeyDown="limitText(this.form.E01R03COM,200);"
				onKeyUp="limitText(this.form.E01R03COM,200);" <%=disabled1%> >
			    </TEXTAREA>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap colspan=4> 
				<B>Inspección Técnico-Mecanica</B>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Inspección Técnico-Mecanica : </div>
            </td>
            <td nowrap >
                <input type="hidden" name="E01R03ITM" value="<%=gaDetail.getE01R03ITM()%>">
                <input type="radio" name="CE01R03ITM" value="C" onClick="document.forms[0].E01R03ITM.value='C'"
			  <%if (gaDetail.getE01R03ITM().equals("C"))
				out.print("checked");%> <%=disabled1%>>
                Concesionario
                <input type="radio" name="CE01R03ITM" value="P" onClick="document.forms[0].E01R03ITM.value='P'"
			  <%if (gaDetail.getE01R03ITM().equals("P"))
				out.print("checked");%> <%=disabled1%>>
                Particular
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
            <td nowrap >
              <div align="right">Fecha Inspección Técnico-Mecanica : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R03FIY" fn_month="E01R03FIM" fn_day="E01R03FID" required="true" readonly="<%=b_read_only1%>"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap > 
              <div align="right">Observaciones Inspección Técnico-Mecanica : </div>
            </td>
            <td nowrap colspan=3>
				<TEXTAREA name="E01R03CIT" rows="5" cols="55" value="" onKeyDown="limitText(this.form.E01R03CIT,200);"
				onKeyUp="limitText(this.form.E01R03CIT,200);" <%=disabled1%> >
			    </TEXTAREA>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Certificado SIJIN : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R03CSI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CARD_NUMBER%>" required="true" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap >
            </td>
            <td nowrap >
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap colspan=4> 
				<B>Avalúo Comercial</B>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Fecha Elaboración Avalúo  : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R03FEY" fn_month="E01R03FEM" fn_day="E01R03FED" required="true" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap >
              <div align="right">Fecha de Vencimiento Avalúo : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R03VAY" fn_month="E01R03VAM" fn_day="E01R03VAD" required="true" readonly="<%=b_read_only1%>"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Avalúo Elaborado Por : </div>
            </td>
            <td nowrap >
 				<%
 					if (b_read_only1 == false) {
 				%>
               <eibsinput:cnofc name="gaDetail" flag="GX" property="E01R03CAV" fn_description="E01R03AUP" required="true" />
				<%
					} else {
						;
				%>
			   <eibsinput:text name="gaDetail" property="E01R03CAV" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" required="true" readonly="<%=b_read_only1%>" />
				<%
					}
					;
				%>
             <eibsinput:text name="gaDetail" property="E01R03AUP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" required="false" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap> 
              <div align="right">Valor Avalúo : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R03VCO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" required="true" readonly="<%=b_read_only1%>"/>
            </td>
          </tr>
	</table>
	</div>          
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap colspan=4> 
				<B>Información Propietario</B>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Tarjeta de Propiedad : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R03TPR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CARD_NUMBER%>" required="true" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap> 
              <div align="right">Fecha Registro Tarjeta Propiedad  : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R03FRY" fn_month="E01R03FRM" fn_day="E01R03FRD" required="true" readonly="<%=b_read_only1%>"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap colspan=4> 
				<B>Información FASECOLDA</B>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Código FASECOLDA : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R03CFA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PO_BOX%>" required="true" readonly="<%=b_read_only1%>"/>
             <a href="javascript:GetFasec('E01R03MFA','E01R03CFA','E01R03LFA','E01R03AFA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0"></a> 
            </td>
            <td nowrap >
              <div align="right">Marca FASECOLDA : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R03MFA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT%>" required="false" readonly="true"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">línea/Clase FASECOLDA : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R03LFA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT%>" required="false" readonly="true"/>
            </td>
            <td nowrap >
              <div align="right">Fecha Proceso Avalúo FASECOLDA : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R03FAY" fn_month="E01R03FAM" fn_day="E01R03FAD" readonly="true"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Avalúo Fasecolda : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R03AFA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" required="false" readonly="true"/>
            </td>
            <td nowrap >
            </td>
            <td nowrap >
            </td>
<%-- 
            <td nowrap >
              <div align="right">Fecha Proximo Avalúo FASECOLDA : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R03VAY" fn_month="E01R03VAM" fn_day="E01R03VAD" readonly="true"/>
            </td>
--%>
          </tr>
    <%if (gaDetail.getE01R03FG1().equals("Y")){%>

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
  
	<%};%>

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
      </td>
    </tr>
  </table>


<%
if (!gaDetail.getE01R03SEQ().equals("999")){
	if (gaListIns.getNoResult()) {
%>
<h3>Seguros Asociados a la Garantía</h3>
<TABLE class="tbenter" height="20%">
	<TR>
		<TD ALIGN=CENTER VALIGN=MIDDLE>
		<H4 style="text-align: center">No existe ningún seguro asociado a la garantía.
		</h4>
		</TD>
	</TR>
	<tr>
		<%
			if (b_read_only1 == false) {
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
<h3>Seguros Relacionados a esta Garantía</h3>
	<TABLE id="mainTableF" class="tableinfo">
			<TR>
				<TD nowrap valign="top" width="100%">

					<table class="tbenter" width=100% align=center>
					<tr>
					<%
						if (b_read_only1 == false) {
					%>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goActionA(1)" id="btnA1"><b>Adicionar </b></a></div>
					</td>
					<%
						}
					%>
					<%
						if (b_read_only1 == false) {
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
					</table>

					<TABLE id="headTable1" >
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

			<div id="dataDiv1" class="scbarcolor">
				<table id="dataTable1" >
			<%
				boolean firstTime = true;
					String gaChk = "";
					gaListIns.initRow();
					int i = 0;
					ERA006203Help.initRow();

					while (gaListIns.getNextRow()) {
						if (gaListIns.getFlag().equals("")) {
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



  <table width="100%">		
	<%
				if (b_read_only1 == false) {
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
		<td width="50%" align="center" colspan="1">
		<INPUT id="EIBSBTN" type="button" name="Cancel" value="Cancelar" onclick="goReturn()">
		</td>
		<td width="50%" align="center" colspan="2">
	<%
		if (iopecod.equals("0005") || iopecod.equals("0006")
				|| iopecod.equals("0001")) {
		if (oopecod.equals("0003")){
	%>
	  	<input class="EIBSBTN" id="EIBSBTN" type=submit name="Submit" value="Borrar">

	<%
		} else {
	%>

	  	<input class="EIBSBTN" id="EIBSBTN" type=submit name="Submit" value="Enviar">
	<%
		}
		} else {
	%>
	<%
		}
	%>
	</td>
	</tr>
  </table>	
<SCRIPT type="text/javascript">
	
   function waitSimulate() {
     document.body.style.cursor = "wait";
   }
   document.forms[0].onsubmit= waitSimulate;

   function resizeDoc() {
//       adjustEquTables(headTable2, dataTable2, dataDiv2,0,false);
//       adjustEquTables(headTable3, dataTable3, dataDiv3,0,false);
	if (document.all["dataTable1"]!=null) {
	   adjustEquTables(headTable1, dataTable1, dataDiv1,1,false);
	}
   }
	resizeDoc();
    window.onresize=resizeDoc;
    window.resize=resizeDoc;
	 showChecked("COLLCOD");
//     initPage();
</SCRIPT>



  </FORM>
 </BODY>

 </html>