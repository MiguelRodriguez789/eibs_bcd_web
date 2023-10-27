<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@ page import="com.datapro.eibs.constants.HelpTypes" %>


<html>
<head>
<title>Información Detalle de Garantías</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="gaDetail" class= "datapro.eibs.beans.ERA006001Message"  scope="session"/>
<jsp:useBean id="gaUserFld" class= "datapro.eibs.beans.ERA007201Message"  scope="session"/>
<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id="ERA006203Help" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="gaListIns" class="datapro.eibs.beans.JBListRec" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
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
	String iopecod = gaDetail != null ? gaDetail.getH01OPECOD().trim() : "";
	String itype = gaDetail != null ? gaDetail.getE01R01TYP().trim() : "";
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
    String country = "05";    	
%>

<SCRIPT Language="Javascript">

function initPage(){
	document.forms[0].E01R01COM.value = "<%=gaDetail.getE01R01COM().trim()%>";
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
    document.forms[0].SCREEN.value = 101;
	document.forms[0].submit();
}

function getParams(idx,poliza){
	document.forms[0].POLIZA.value = poliza;
}

function goReturn(){
	document.forms[0].SCREEN.value="200";
	document.forms[0].submit();
}

</script>

<%
	if (!userPO.getPurpose().equals("NEW")) {
%>
<SCRIPT Language="Javascript">
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
<h3 align="center">
<%
if (itype.equals("B")) {
%>
<%

	if (iopecod.equals("0001")) {
%>Garant&iacute;as Detalle Bienes Inmuebles - Nuevo Bien
<%
	} else {
%>
<%
	if (iopecod.equals("0005")) {
%>Garant&iacute;as Detalle Bienes Inmuebles - Modificación Bien
<%
	} else {
%>
<%
	if (iopecod.equals("0006")) {
%>Garant&iacute;as Detalle Bienes Inmuebles - Borrar Bien
<%
	} else {
%>
<%
	if (iopecod.equals("0004")) {
%>Garant&iacute;as Detalle Bienes Inmuebles - Consulta Bien
<%
	}
			}
		}
	}
%>
<%} %>
<%
if (itype.equals("T")) {
%>
<%

	if (iopecod.equals("0001")) {
%>Garant&iacute;as Detalle Leasing Inmobiliario - Nuevo Bien
<%
	} else {
%>
<%
	if (iopecod.equals("0005")) {
%>Garant&iacute;as Detalle Leasing Inmobiliario - Modificación Bien
<%
	} else {
%>
<%
	if (iopecod.equals("0006")) {
%>Garant&iacute;as Detalle Leasing Inmobiliario - Borrar Bien
<%
	} else {
%>
<%
	if (iopecod.equals("0004")) {
%>Garant&iacute;as Detalle Leasing Inmobiliario - Consulta Bien
<%
	}
	}
	}
	}
%>
<%} %>
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ERA0060_ga_detail_realstate.jsp,ERA0060"></h3> 
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0050" >
<input type=HIDDEN name="E01R01BNK" value="<%=gaDetail.getE01R01BNK().trim()%>" readonly>                 
<input type=HIDDEN name="E01ROCBNK" value="<%=gaDetail.getE01R01BNK().trim()%>" readonly>                 
<input type=HIDDEN name="E01ROCREF" value="<%=gaDetail.getE01R01REF().trim()%>" readonly>                 
<input type=HIDDEN name="SEQBIEN" value="<%=gaDetail.getE01R01SEQ().trim()%>" readonly>                 
<input type=HIDDEN name="IOPECOD" value="<%=iopecod%>"> 
<input type=HIDDEN name="OPECOD" value="<%=oopecod%>"> 
<input type=HIDDEN name="E01R01PRD" value="<%=gaDetail.getE01R01PRD().trim()%>" readonly>                 
<input type=HIDDEN name="D01R01PRD" value="<%=gaDetail.getD01R01PRD().trim()%>" readonly>                 
<input type=HIDDEN name="E01R01TYP" value="<%=gaDetail.getE01R01TYP().trim()%>" readonly>                 
<input type=HIDDEN name="D01R01TYP" value="<%=gaDetail.getE01R01TYP().trim()%>" readonly>                 
<input type=HIDDEN name="POLIZA" value="" readonly>                 
<INPUT TYPE=HIDDEN NAME="SCREEN" ID="SCREEN" VALUE="201">
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
                <input type="text" name="E01R01CUN" readonly size="11" maxlength="9" value="<%=gaDetail.getE01R01CUN().trim()%>">
              </div>
            </td>
            <td nowrap> 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="E01R01NA1" id="E01R01NA1" readonly size="60" maxlength="45" value="<%=gaDetail.getE01R01NA1().trim().equals("") ? curname
					: gaDetail.getE01R01NA1().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap > 
              <div align="right"><b>No. Referencia : </b></div>
            </td>
            <td nowrap>
              <input type="text" name="E01R01REF" id="E01R01REF" size="14" maxlength="12" value="<%=gaDetail.getE01R01REF().trim()%>" readonly>
            </td> 
            <td nowrap> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap> 
              <div align="left">
               <input type="text" name="E01R01CCY" id="E01R01CCY" size="4" maxlength="3" value="<%=gaDetail.getE01R01CCY().trim()%>" readonly> 
              </div>
            </td>
           </tr>
          <tr id="trdark">             
            <td nowrap> 
              <div align="right"><b>Producto :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="PRODUCT" size="38" value="<%=gaDetail.getE01R01PRD().trim()%> - <%=gaDetail.getD01R01PRD().trim()%>" readonly>                 
              </div>
            </td>
            <td nowrap> 
              <div align="right"><b>Tipo de Garantía :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="TYPE" size="38" value="<%=gaDetail.getE01R01TYP().trim()%> - <%=gaDetail.getD01R01TYP().trim()%>" readonly>                 
              </div>
            </td>
          </tr>
          <tr id="trclear">             
            <td nowrap> 
              <div align="right"><b>Secuencia Bien :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="E01R01SEQ" size="4" maxlength="4" value="<%=gaDetail.getE01R01SEQ().trim()%>" readonly> 
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

  <h4>Informaci&oacute;n Detalle del Bien</h4>
      
  <table class="tableinfo" width="100%">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">

          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >Respalda Cartera Hipotecaria :
            </td>
            <td nowrap >
                <input type="hidden" name="E01R01RCH" value="<%=gaDetail.getE01R01RCH()%>">
                <input type="radio" name="CE01R01RCH" value="S" onClick="document.forms[0].E01R01RCH.value='S'"
			  <%if (gaDetail.getE01R01RCH().equals("S"))
				out.print("checked");%> <%=disabled1%>>
                Si
                <input type="radio" name="CE01R01RCH" value="N" onClick="document.forms[0].E01R01RCH.value='N'"
			  <%if (gaDetail.getE01R01RCH().equals("N"))
				out.print("checked");%> <%=disabled1%>>
                No
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
            <td nowrap> 
            </td>
            <td nowrap >
            </td>
<%-- 
            <td nowrap> 
              <div align="right">Estatus : </div>
            </td>
            <td nowrap >
              <INPUT type="text" name="E01R01STS" size="2" maxlength="1" value="<%=gaDetail.getE01R01STS().trim()%>" <%=read_only1%>>
              <INPUT type="text" name="D01R01STS" size="30" maxlength="30" value="<%=gaDetail.getD01R01STS().trim()%>" readonly>
            </td>
            <td nowrap >
              <div align="right">Respalda Cartera Hipotecaria : </div>
            </td>
--%>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Estudio de Títulos : </div>
            </td>
            <td nowrap >
                <input type="hidden" name="E01R01ETT" value="<%=gaDetail.getE01R01ETT()%>">
                <input type="radio" name="CE01R01ETT" id="CE01R01ETT" value="S" onClick="document.forms[0].E01R01ETT.value='S'"
			  <%if (gaDetail.getE01R01ETT().equals("S"))
				out.print("checked");%> <%=disabled1%> >
                Si
                <input type="radio" name="CE01R01ETT" value="N" onClick="document.forms[0].E01R01ETT.value='N'"
			  <%if (gaDetail.getE01R01ETT().equals("N"))
				out.print("checked");%> <%=disabled1%>>
                No
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
            <td nowrap >
              <div align="right">Fecha Estudio de Títulos : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R01FTY" fn_month="E01R01FTM" fn_day="E01R01FTD" required="true" readonly="<%=b_read_only1%>"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Estudio Elaborado por  : </div>
            </td>
            <td nowrap >

				<input type="text" name="E01R01EES" size="5" maxlength="4" value="<%=gaDetail.getE01R01EES().trim()%>" <%=read_only1%> />
 				<%
 					if (b_read_only1 == false) {
 				%>
	              <a href="javascript:GetCodeDescCNOFC('E01R01EES','E01DPCO','YQ')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>
				<%
					}
					;
				%>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
               <eibsinput:text name="gaDetail" property="E01DPCO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT %>" readonly="true"/>

            </td>
            <td nowrap >
<%-- 
              <div align="right">Certificado Tradición/Libertad : </div>
--%>
            </td>
            <td nowrap >
<%-- 
                <input type="hidden" name="E01R01CTL" value="<%=gaDetail.getE01R01CTL()%>">
                <input type="radio" name="CE01R01CTL" value="S" onClick="document.forms[0].E01R01CTL.value='S'"
			  <%if (gaDetail.getE01R01CTL().equals("S"))
				out.print("checked");%> <%=disabled1%>>
                Si
                <input type="radio" name="CE01R01CTL" value="N" onClick="document.forms[0].E01R01CTL.value='N'"
			  <%if (gaDetail.getE01R01CTL().equals("N"))
				out.print("checked");%> <%=disabled1%>>
                No
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
--%>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Fecha Exped. Certif. Trad./Libertad  : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R01FCY" fn_month="E01R01FCM" fn_day="E01R01FCD" required="true" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap >
              <div align="right">Fecha Vencimiento Certif. Trad./Libertad: </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R01FVY" fn_month="E01R01FVM" fn_day="E01R01FVD" required="true" readonly="<%=b_read_only1%>"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Número de Matricula Inmob.: </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R01NMT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT%>" required="true" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap> 
            </td>
            <td nowrap >
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Oficina Registro Público : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R01ORP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT%>" required="true" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap >
              <div align="right">Fecha Registro Público : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R01FRY" fn_month="E01R01FRM" fn_day="E01R01FRD" required="true" readonly="<%=b_read_only1%>"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Departamento de Registro Público : </div>
            </td>
            <td nowrap >
				<input type="text" name="E01R01DPR" size="5" maxlength="4" value="<%=gaDetail.getE01R01DPR().trim()%>" <%=read_only1%> />
 				<%
 					if (b_read_only1 == false) {
 				%>
              			<a href="javascript:Get2FilterCodes('E01R01DPR','D01R01DPR','27','','')">
							<img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0">
						</a>
				<%
					}
					;
				%>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
               <eibsinput:text name="gaDetail" property="D01R01DPR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT %>" readonly="true"/>
            </td>
            <td nowrap >
              <div align="right">Ciudad de Registro Público : </div>
            </td>
            <td nowrap >
				<input type="text" name="E01R01CCR" size="6" maxlength="5" value="<%=gaDetail.getE01R01CCR().trim()%>" <%=read_only1%> />
 				<%
 					if (b_read_only1 == false) {
 				%>
              			<a href="javascript:Get2FilterCodes('E01R01CCR','D01R01CCR','84',' ',document.forms[0].E01R01DPR.value)">
							<img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0">
						</a>
				<%
					}
					;
				%>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
				<input type="text" name="D01R01CCR" size="30" maxlength="30" value="<%=gaDetail.getD01R01CCR().trim()%>" readonly>
            </td>
          </tr>

          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Número de Escritura : </div>
            </td>
            <td nowrap >
              <INPUT type="text" name="E01R01NES" size="28" maxlength="25" value="<%=gaDetail.getE01R01NES().trim()%>" <%=read_only1%>>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
            <td nowrap >
              <div align="right">Fecha de la Escritura : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R01FEY" fn_month="E01R01FEM" fn_day="E01R01FED" required="true" readonly="<%=b_read_only1%>"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Número de Notaria : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R01NNO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" required="true" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap >
              <div align="right">Departamento de la Notaría : </div>
            </td>
            <td nowrap >
				<input type="text" name="E01R01DPN" size="5" maxlength="4" value="<%=gaDetail.getE01R01DPN().trim()%>" required="true" <%=read_only1%> />
 				<%
 					if (b_read_only1 == false) {
 				%>
              			<a href="javascript:Get2FilterCodes('E01R01DPN','D01R01DPN','27','','')">
							<img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0">
						</a>
				<%
					}
					;
				%>
               <eibsinput:text name="gaDetail" property="D01R01DPN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Ciudad de la Notaría : </div>
            </td>
            <td nowrap >
				<input type="text" name="E01R01CTN" size="6" maxlength="5" value="<%=gaDetail.getE01R01CTN().trim()%>" required="true" <%=read_only1%> />
 				<%
 					if (b_read_only1 == false) {
 				%>
              			<a href="javascript:Get2FilterCodes('E01R01CTN','D01R01CTN','84',' ',document.forms[0].E01R01DPN.value)">
							<img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0">
						</a>
				<%
					}
					;
				%>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
				<input type="text" name="D01R01CTN" size="30" maxlength="30" value="<%=gaDetail.getD01R01CTN().trim()%>" readonly>
            </td>
            <td nowrap >
              <div align="right">Grado Hipoteca : </div>
            </td>
            <td nowrap >
              <INPUT type="text" name="E01R01GHI" size="2" maxlength="3" value="<%=gaDetail.getE01R01GHI().trim()%>"  onKeyPress="enterInteger()"  <%=read_only1%>>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Monto de la Hipoteca : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R01MHI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" required="true" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap >
              <div align="right">Tipo de Bien : </div>
            </td>
            <td nowrap >
				<%
					if (b_read_only1 == false) {
				%>
               <eibsinput:cnofc name="gaDetail" flag="2N" property="E01R01TBN" fn_description="D01R01TBN" required="true"/>
				<%
					} else {
						;
				%>
			   <eibsinput:text name="gaDetail" property="E01R01TBN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="<%=b_read_only1%>" />
				<%
					}
					;
				%>
               <eibsinput:text name="gaDetail" property="D01R01TBN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap colspan=4> 
				<h4>Dirección Inmueble </h4>
            </td>
          </tr>

    <tr bordercolor="#FFFFFF"> 
      <td nowrap colspan=4> 
		<table cellspacing="0" width="100%" border="0">
          <tr id="trclear"> 
            <td nowrap width="40%"> 
		  <jsp:include page="ESD0080_address_template_basic_colombia_coll.jsp" flush="true" >				
		  <jsp:param name="title" value="Dirección" /> 
		  <jsp:param name="messageName" value="gaDetail" />
		  <jsp:param name="readOnly" value="<%=b_read_only1%>" /> 
		  <jsp:param name="suffix" value="E01R01" />
		  <jsp:param name="basic" value="false" />
		  </jsp:include>     

<%-- 
        <% if (country.equals("05")) { //Colombia %>
		  <jsp:include page="ESD0080_address_template_basic_colombia.jsp" flush="true" >				
		  <jsp:param name="title" value="Dirección" /> 
		  <jsp:param name="messageName" value="gaDetail" />
		  <jsp:param name="readOnly" value="<%=b_read_only1%>" /> 
		  <jsp:param name="suffix" value="E01R01" />
		  <jsp:param name="basic" value="false" />
		  </jsp:include>     
	    <% } else { %>

	      <% String pageName = "ESD4000_address_template_country" + country + ".jsp"; %>
		  <jsp:include page="<%= pageName %>" flush="true">
	      <jsp:param name="readOnly" value="<%=b_read_only1%>" />
		  </jsp:include>
	    
	    <% } %>         
--%>
  		    </td> 
          </tr> 

        </table>
      </td>
    </tr>


<%-- 
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Departamento del Inmueble : </div>
            </td>
            <td nowrap >
 				<%
 					if (b_read_only1 == false) {
 				%>
               <eibsinput:cnofc name="gaDetail" flag="27" property="E01R01DPI" fn_description="D01R01DPI" required="true"/>
				<%
					} else {
						;
				%>
			   <eibsinput:text name="gaDetail" property="E01R01DPI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" required="true" readonly="<%=b_read_only1%>" />
				<%
					}
					;
				%>
               <eibsinput:text name="gaDetail" property="D01R01DPI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT %>" readonly="true"/>
            </td>
            <td nowrap >
              <div align="right">Ciudad del Inmueble : </div>
            </td>
            <td nowrap >
				<input type="text" name="E01R01CTI" size="6" maxlength="5" value="<%=gaDetail.getE01R01CTI().trim()%>" <%=read_only1%> />
 				<%
  					if (b_read_only1 == false) {
  				%>
              			<a href="javascript:Get2FilterCodes('E01R01CTI','D01R01CTI','84',' ',document.forms[0].E01R01DPI.value)">
							<img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0">
						</a>
				<%
					}
					;
				%>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
				<input type="text" name="D01R01CTI" size="30" maxlength="30" value="<%=gaDetail.getD01R01CTI().trim()%>" readonly>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Dirección del Inmueble : </div>
            </td>
            <td nowrap colspan=3>
				<input type="text" name="E01R01DII" size="100" maxlength="105" value="<%=gaDetail.getE01R01DII().trim()%>" <%=read_only1%>>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
          </tr>
--%>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Vereda : </div>
            </td>
            <td nowrap >
				<input type="text" name="E01R01VEI" size="50" maxlength="50" value="<%=gaDetail.getE01R01VEI().trim()%>" <%=read_only1%>>
            </td>
            <td nowrap >
              <div align="right">Estrato Inmueble : </div>
            </td>
            <td nowrap >

				<%
					if (b_read_only1 == false) {
				%>
               <eibsinput:cnofc name="gaDetail" flag="GN" property="E01R01ESI" fn_description="D01R01ESI" required="true"/>
				<%
					} else {
						;
				%>
			   <eibsinput:text name="gaDetail" property="E01R01ESI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="<%=b_read_only1%>" />
				<%
					}
					;
				%>
               <eibsinput:text name="gaDetail" property="D01R01ESI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT %>" readonly="true"/>
		   </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Ubicación : </div>
            </td>
            <td nowrap >
                <input type="hidden" name="E01R01CTL" value="<%=gaDetail.getE01R01CTL()%>">
                <input type="radio" name="CE01R01CTL" id="CE01R01CTL" value="U" onClick="document.forms[0].E01R01CTL.value='U'"
			  <%if (gaDetail.getE01R01CTL().equals("U"))
				out.print("checked");%> <%=disabled1%> >
                Urbano
                <input type="radio" name="CE01R01CTL" value="R" onClick="document.forms[0].E01R01CTL.value='R'"
			  <%if (gaDetail.getE01R01CTL().equals("R"))
				out.print("checked");%> <%=disabled1%>>
                Rural
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
            <td nowrap >
            </td>
            <td nowrap >
            </td>
          </tr>
          
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap colspan=4> 
				<h4>Avalúo</h4>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Póliza de Seguros : </div>
            </td>
            <td nowrap >
                <input type="hidden" name="E01R01PLS" value="<%=gaDetail.getE01R01PLS()%>">
                <input type="radio" name="CE01R01PLS" value="S" onClick="document.forms[0].E01R01PLS.value='S'"
			  <%if (gaDetail.getE01R01PLS().equals("S"))
				out.print("checked");%> <%=disabled1%>>
                Si
                <input type="radio" name="CE01R01PLS" value="N" onClick="document.forms[0].E01R01PLS.value='N'"
			  <%if (gaDetail.getE01R01PLS().equals("N"))
				out.print("checked");%> <%=disabled1%>>
                No
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
            <td nowrap >
              <div align="right">Avalúos o Facturas : </div>
            </td>
            <td nowrap >
                <input type="hidden" name="E01R01AVF" value="<%=gaDetail.getE01R01AVF()%>">
                <input type="radio" name="CE01R01AVF" value="N" onClick="document.forms[0].E01R01AVF.value='N'"
			  <%if (gaDetail.getE01R01AVF().equals("N"))
				out.print("checked");%> <%=disabled1%>>
                No presentadas
                <input type="radio" name="CE01R01AVF" value="C" onClick="document.forms[0].E01R01AVF.value='C'"
			  <%if (gaDetail.getE01R01AVF().equals("C"))
				out.print("checked");%> <%=disabled1%>>
                Presentadas Copias
                <input type="radio" name="CE01R01AVF" value="O" onClick="document.forms[0].E01R01AVF.value='O'"
			  <%if (gaDetail.getE01R01AVF().equals("O"))
				out.print("checked");%> <%=disabled1%>>
                Presentadas Originales
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Fecha Elaboración Avalúo  : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R01FAY" fn_month="E01R01FAM" fn_day="E01R01FAD" required="true" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap >
              <div align="right">Fecha Vencimiento Avalúo : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R01VAY" fn_month="E01R01VAM" fn_day="E01R01VAD" required="false" readonly="true"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Area Total en Metros Cuadrados : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R01ATM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE%>" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap >
              <div align="right">Area Construida en Metros Cuadrados  : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R01ACM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE%>" readonly="<%=b_read_only1%>"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Valor Area Construida : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R01VAC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="<%=b_read_only1%>" required="true"/>
            </td>
            <td nowrap> 
<%--
              <div align="right">Valor Area Total : </div>
--%>
            </td>
            <td nowrap >
<%--
             <eibsinput:text name="gaDetail" property="E01R01VAT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="<%=b_read_only1%>"/>
--%>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Código Destinación del Inmueble : </div>
            </td>
            <td nowrap >
				<%
					if (b_read_only1 == false) {
				%>
               <eibsinput:cnofc name="gaDetail" flag="GO" property="E01R01CDB" fn_description="D01R01CDB" required="true"/>
				<%
					} else {
						;
				%>
			   <eibsinput:text name="gaDetail" property="E01R01CDB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" required="true" readonly="<%=b_read_only1%>" />
				<%
					}
					;
				%>
               <eibsinput:text name="gaDetail" property="D01R01CDB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT %>" readonly="true"/>
            </td>
            <td nowrap >
              <div align="right">Valor Avalúo Comercial : </div>
            </td>
            <td nowrap >
             <eibsinput:text	name="gaDetail" property="E01R01ACO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" required="true" readonly="<%=b_read_only1%>"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Valor Avalúo Catastral : </div>
            </td>
            <td nowrap >
             <eibsinput:text	name="gaDetail" property="E01R01ACA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" required="true" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap >
              <div align="right">Avalúo Realizado por : </div>
            </td>
            <td nowrap >
				<%
					if (b_read_only1 == false) {
				%>
               <eibsinput:cnofc name="gaDetail" flag="GU" property="E01R01AIN" fn_description="E01R01ARP" required="true"/>
				<%
					} else {
						;
				%>
			   <eibsinput:text name="gaDetail" property="E01R01AIN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" required="true" readonly="<%=b_read_only1%>" />
				<%
					}
					;
				%>
               <eibsinput:text name="gaDetail" property="E01R01ARP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap > 
              <div align="right">Comentarios : </div>
            </td>
            <td nowrap colspan=3>
				<TEXTAREA name="E01R01COM" rows="5" cols="55" value="" onKeyDown="limitText(this.form.E01R01COM,200);"
				onKeyUp="limitText(this.form.E01R01COM,200);" <%=disabled1%> >
			    </TEXTAREA>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Status Antiguedad  : </div>
            </td>
            <td nowrap >
                <input type="hidden" name="E01R01STA" value="<%=gaDetail.getE01R01STA()%>">
                <input type="radio" name="CE01R01STA" value=N" onClick="document.forms[0].E01R01STA.value='N'"
			  <%if (gaDetail.getE01R01STA().equals("N"))
				out.print("checked");%> <%=disabled1%>>
                Nuevo
                <input type="radio" name="CE01R01STA" value="U" onClick="document.forms[0].E01R01STA.value='U'"
			  <%if (gaDetail.getE01R01STA().equals("U"))
				out.print("checked");%> <%=disabled1%>>
                Usado
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
            <td nowrap >
              <div align="right"> </div>
            </td>
            <td nowrap >
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Código Fecha Pago Impuesto Predial : </div>
            </td>
            <td nowrap >
               <eibsinput:text name="gaDetail" property="E01R01GTE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="<%=b_read_only1%>"/>
<%-- 
				<%
					if (b_read_only1 == false) {
				%>
               <eibsinput:cnofc name="gaDetail" flag="GP" property="E01R01GTE" fn_description="D01R01GTE" required="false"/>
				<%
					} else {
						;
				%>
			   <eibsinput:text name="gaDetail" property="E01R01GTE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" required="false" readonly="<%=b_read_only1%>" />
				<%
					}
					;
				%>
               <eibsinput:text name="gaDetail" property="D01R01GTE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT %>" readonly="true"/>
--%>
            </td>
            <td nowrap >
              <div align="right"> </div>
            </td>
            <td nowrap >
            </td>
          </tr>


         </table>
      </td>
    </tr>
  </table>
  <table cellspacing="0" width="100%" border="0">
<%-- 
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap colspan=4> 
				<h4>Campos de Usuario</h4>
            </td>
          </tr>
--%>
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


<%
if (!gaDetail.getE01R01SEQ().equals("999")){
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
				|| iopecod.equals("0001") || iopecod.equals("0007")) {
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
  <SCRIPT Language="Javascript">
	
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
<SCRIPT language="JavaScript">
</SCRIPT>

 </html>