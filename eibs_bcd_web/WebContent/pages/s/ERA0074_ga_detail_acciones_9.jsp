<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Información Detalle de Prenda Acciones</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="gaDetail" class= "datapro.eibs.beans.ERA007401Message"  scope="session"/>
<jsp:useBean id="gaUserFld" class= "datapro.eibs.beans.ERA007201Message"  scope="session"/>
<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />
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
	if (gaDetail.getE01R09TYP().equals("5")) {
		type_aval = "Fiducia en Garantía";
	}
%>

<SCRIPT type="text/javascript">

function initPage(){
	document.forms[0].E01R09COM.value = "<%=gaDetail.getE01R09COM().trim()%>";
	if ("<%=gaDetail.getE01R09CTE()%>" == "S"){
		hideInf('Div1','Div2', false);
	}else{
		hideInf('Div1','Div2', true);
	}
	if ("<%=gaDetail.getE01R09CPR()%>" == "N"){
		hideDiv('Div3', true);
	}else{
		hideDiv('Div3', false);
	}
	if ("<%=gaDetail.getE01R09CAV()%>" == "N"){
		hideDiv('Div4', true);
	}else{
		hideDiv('Div4', false);
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

function hideInf(fld, fld2, value){
 	if (value) {
   		fld.style.display = 'none';
   		fld2.style.display = 'block';
   	} else {
   		fld.style.display = 'block';
   		fld2.style.display = 'none';
   	}
}

function hideDiv(fld, value){
 	if (value) {
   		fld.style.display = 'none';
		if (fld == "Div4") {
		 document.forms[0].E01R09PVB.value = "";
		 document.forms[0].E01R09CCY.value = "";
		 document.forms[0].E01R09CCM.value = "";
		 document.forms[0].E01R09CCD.value = "";
		 document.forms[0].E01R09VBY.value = "";
		 document.forms[0].E01R09VBM.value = "";
		 document.forms[0].E01R09VBD.value = "";
		 document.forms[0].E01R09MGA.value = "";
		}
   	} else{
   		fld.style.display = 'blcok';
   	}
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
	if (userPO.getPurpose().equals("MAINTENANCE")) {
	} else if (userPO.getPurpose().equals("INQUIRY")) {
	} else if (userPO.getPurpose().equals("APPROVE")) {
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

<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ga_detail_acciones_9.jsp, ERA0074"></h3> 
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0050" >
<input type=HIDDEN name="E01ROCBNK" value="<%=gaDetail.getE01R09BNK().trim()%>" readonly>                 
<input type=HIDDEN name="E01R09BNK" value="<%=gaDetail.getE01R09BNK().trim()%>" readonly>                 
<input type=HIDDEN name="E01ROCREF" value="<%=gaDetail.getE01R09REF().trim()%>" readonly>                 
<input type=HIDDEN name="SEQBIEN" value="<%=gaDetail.getE01R09SEQ().trim()%>" readonly>                 
<input type=HIDDEN name="IOPECOD" value="<%=iopecod%>"> 
<input type=HIDDEN name="OPECOD" value="<%=oopecod%>"> 
<input type=HIDDEN name="E01R09PRD" value="<%=gaDetail.getE01R09PRD().trim()%>" readonly>
<input type=HIDDEN name="D01R09PRD" value="<%=gaDetail.getD01R09PRD().trim()%>" readonly>
<input type=HIDDEN name="E01R09TYP" value="<%=gaDetail.getE01R09TYP().trim()%>" readonly>
<input type=HIDDEN name="D01R09TYP" value="<%=gaDetail.getD01R09TYP().trim()%>" readonly>
<input type=HIDDEN name="POLIZA" value="" readonly>
<INPUT TYPE=HIDDEN NAME="SCREEN" ID="SCREEN" VALUE="209">
<input type=HIDDEN name="PURPOSE" value="<%=userPO.getPurpose()%>">
<input type=HIDDEN name="REF" value="<%=gaDetail.getE01R09REF().trim()%>" readonly>                 
                                        
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
                <input type="text" name="E01R09CUN" readonly size="11" maxlength="9" value="<%=gaDetail.getE01R09CUN().trim()%>">
              </div>
            </td>
            <td nowrap> 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="E01R09NA1" id="E01R09NA1" readonly size="60" maxlength="45" value="<%=gaDetail.getE01R09NA1().trim().equals("") ? curname
					: gaDetail.getE01R09NA1().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap > 
              <div align="right"><b>No. Referencia : </b></div>
            </td>
            <td nowrap>
              <input type="text" name="E01R09REF" id="E01R09REF" size="14" maxlength="12" value="<%=gaDetail.getE01R09REF().trim()%>" readonly>
            </td> 
            <td nowrap> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap> 
              <div align="left">
               <input type="text" name="E01R09CUR" id="E01R09CUR" size="4" maxlength="3" value="<%=gaDetail.getE01R09CUR().trim()%>" readonly> 
              </div>
            </td>
           </tr>
          <tr id="trdark">             
            <td nowrap> 
              <div align="right"><b>Producto :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="PRODUCT" size="38" value="<%=gaDetail.getE01R09PRD().trim()%> - <%=gaDetail.getD01R09PRD().trim()%>" readonly>                 
              </div>
            </td>
            <td nowrap> 
              <div align="right"><b>Tipo de Garantía :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="TYPE" size="38" value="<%=gaDetail.getE01R09TYP().trim()%> - <%=gaDetail.getD01R09TYP().trim()%>" readonly>                 
              </div>
            </td>
          </tr>
          <tr id="trclear">             
            <td nowrap> 
              <div align="right"><b>Secuencia Bien :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="E01R09SEQ" size="4" maxlength="4" value="<%=gaDetail.getE01R09SEQ().trim()%>" readonly> 
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

  <h4>Informaci&oacute;n Detalle Prenda Acciones</h4>
      
<table class="tableinfo" width="100%">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right"><B>Con Tenencia : </B></div>
            </td>
            <td nowrap >
            	<div <% if (gaDetail.getF01R09CTE().equals("Y")) out.print("class=\"txtchanged\""); %>>
                <input type="hidden" name="E01R09CTE" value="<%=gaDetail.getE01R09CTE()%>">
                <input type="radio" name="CE01R09CTE" value="S" onClick="document.forms[0].E01R09CTE.value='S';hideInf('Div1','Div2',false)"
			  <%if (gaDetail.getE01R09CTE().equals("S"))
				out.print("checked");%> <%=disabled1%> onChange="hideInf('Div1','Div2',false)" onBlur="hideInf('Div1','Div2',false)">
                Si
                <input type="radio" name="CE01R09CTE" value="N" onClick="document.forms[0].E01R09CTE.value='N';hideInf('Div1','Div2',true)"
			  <%if (gaDetail.getE01R09CTE().equals("N"))
				out.print("checked");%> <%=disabled1%> onChange="hideInf('Div1','Div2',true)" onBlur="hideInf('Div1','Div2',true)">
                No
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
				</div>
            </td>
            <td nowrap >
            </td>
            <td nowrap >
            </td>
          </tr>
		</table>
		<div id="Div1" style="display:''">
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap colspan=4> 
				<B>Información Acciones (Con Tenencia)</B>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Número de Acciones : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R09QTI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" required="true" readonly="<%=b_read_only1%>" modified="F01R09QTI"/>
            </td>
            <td nowrap >
              <div align="right">Fecha de Expedición : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R09ECY" fn_month="E01R09ECM" fn_day="E01R09ECD" required="true" readonly="<%=b_read_only1%>" modified="F01R09ECY;F01R09ECM;F01R09ECD"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Números de Títulos : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01R09CEP" size="65" maxlength="60" value="<%=gaDetail.getE01R09CEP().trim()%>" <%=read_only1%> <% if (gaDetail.getF01R09CEP().equals("Y")) out.print("class=\"txtchanged\"");%>>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
            <td nowrap >
            </td>
            <td nowrap >
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Endoso : </div>
            </td>
            <td nowrap >
            	<div <% if (gaDetail.getF01R09ENC().equals("Y")) out.print("class=\"txtchanged\""); %>>
                <input type="hidden" name="E01R09ENC" value="<%=gaDetail.getE01R09ENC()%>">
                <input type="radio" name="CE01R09ENC" value="S" onClick="document.forms[0].E01R09ENC.value='S'"
			  <%if (gaDetail.getE01R09ENC().equals("S"))
				out.print("checked");%> <%=disabled1%>>
                Si
                <input type="radio" name="CE01R09ENC" value="N" onClick="document.forms[0].E01R09ENC.value='N'"
			  <%if (gaDetail.getE01R09ENC().equals("N"))
				out.print("checked");%> <%=disabled1%>>
                No
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
				</div>
            </td>
            <td nowrap >
              <div align="right">Emisor : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01R09EMC" size="60" maxlength="60" value="<%=gaDetail.getE01R09EMC().trim()%>" <%=read_only1%> <% if (gaDetail.getF01R09EMC().equals("Y")) out.print("class=\"txtchanged\"");%>>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
          </tr>
		</table>
		</div>

		<div id="Div2" style="display:''">
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap colspan=4> 
				<B>Certificado Prenda Deceval (Sin Tenencia)</B>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Número de Certificado : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01R09NCS" size="28" maxlength="25" value="<%=gaDetail.getE01R09NCS().trim()%>" <%=read_only1%> <% if (gaDetail.getF01R09NCS().equals("Y")) out.print("class=\"txtchanged\"");%>>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
            <td nowrap >
              <div align="right">Número de Acciones : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R09NAS" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" required="true" readonly="<%=b_read_only1%>" modified="F01R09NAS"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Emisor: </div>
            </td>
            <td nowrap >
              <input type="text" name="E01R09EMS" size="60" maxlength="60" value="<%=gaDetail.getE01R09EMS().trim()%>" <%=read_only1%> <% if (gaDetail.getF01R09EMS().equals("Y")) out.print("class=\"txtchanged\"");%>>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
            <td nowrap >
            </td>
            <td nowrap >
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Fecha de Expedición : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R09ESY" fn_month="E01R09ESM" fn_day="E01R09ESD" required="true" readonly="<%=b_read_only1%>" modified="F01R09ESY;F01R09ESM;F01R09ESD"/>
            </td>
            <td nowrap >
              <div align="right">Fecha de Vencimiento : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R09VCY" fn_month="E01R09VCM" fn_day="E01R09VCD" required="true" readonly="<%=b_read_only1%>" modified="F01R09VCY;F01R09VCM;F01R09VCD"/>
            </td>
          </tr>
		</table>
		</div>
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap colspan=4> 
				<B>Información del Emisor</B>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Naturaleza del Emisor : </div>
            </td>
            <td nowrap >
            	<div <% if (gaDetail.getF01R09NEM().equals("Y")) out.print("class=\"txtchanged\""); %>>
                <input type="hidden" name="E01R09NEM" value="<%=gaDetail.getE01R09NEM()%>">
                <input type="radio" name="CE01R09NEM" value="S" onClick="document.forms[0].E01R09NEM.value='S'"
			  <%if (gaDetail.getE01R09NEM().equals("S"))
				out.print("checked");%> <%=disabled1%>>
                Institución Financiera
                <input type="radio" name="CE01R09NEM" value="N" onClick="document.forms[0].E01R09NEM.value='N'"
			  <%if (gaDetail.getE01R09NEM().equals("N"))
				out.print("checked");%> <%=disabled1%>>
                Diferente a Institución Financiera
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
				</div>
            </td>
            <td nowrap >
            </td>
            <td nowrap >
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap colspan=4> 
				<B>Certificado del Valor Intrínseco Revisor Fiscal Emisor</B>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Valor Intrínseco : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R09VIN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" required="true" readonly="<%=b_read_only1%>" modified="F01R09VIN"/>
            </td>
            <td nowrap >
              <div align="right">Revisor Fiscal : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01R09RFS" size="60" maxlength="60" value="<%=gaDetail.getE01R09RFS().trim()%>" <%=read_only1%> <% if (gaDetail.getF01R09RFS().equals("Y")) out.print("class=\"txtchanged\"");%> >
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Fecha de Expedición : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R09EIY" fn_month="E01R09EIM" fn_day="E01R09EID" required="true" readonly="<%=b_read_only1%>" modified="F01R09EIY;F01R09EIM;F01R09EID"/>
            </td>
            <td nowrap >
              <div align="right">Fecha de Vencimiento : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R09VIY" fn_month="E01R09VIM" fn_day="E01R09VID" required="true" readonly="<%=b_read_only1%>" modified="F01R09VIY;F01R09VIM;F01R09VID"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
				<B>Certificado de Promedio Valor de Bolsa de Valores</B>
            </td>
            <td nowrap >
	            <div <% if (gaDetail.getF01R09CAV().equals("Y")) out.print("class=\"txtchanged\""); %>>
                <input type="hidden" name="E01R09CAV" value="<%=gaDetail.getE01R09CAV()%>">
                <input type="radio" name="CE01R09CAV" value="S" onClick="document.forms[0].E01R09CAV.value='S';hideDiv('Div4',false)"
			  <%if (gaDetail.getE01R09CAV().equals("S"))
				out.print("checked");%> <%=disabled1%>  onChange="hideDiv('Div4',false)" onBlur="hideDiv('Div4',false)">
                Si
                <input type="radio" name="CE01R09CAV" value="N" onClick="document.forms[0].E01R09CAV.value='N';hideDiv('Div4',true)"
			  <%if (gaDetail.getE01R09CAV().equals("N"))
				out.print("checked");%> <%=disabled1%>  onChange="hideDiv('Div4',false)" onBlur="hideDiv('Div4',true)">
                No
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
				</div>
            </td>
            <td nowrap >
            </td>
            <td nowrap >
            </td>
          </tr>
	</table>
	<div id="Div4" style="display:''">
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
             <div align="right">Promedio Valor en Bolsa : </div>
            </td>
            <td nowrap >
              	<input type="text" name="E01R09PVB" size="18" maxlength="17" value="<%=gaDetail.getE01R09PVB().trim()%>" class="TXTRIGHT" onKeyPress="enterDecimal(event,5)" <% if (gaDetail.getF01R09PVB().equals("Y")) out.print("class=\"txtchanged\"");%>>
            </td>
            <td nowrap >
            </td>
            <td nowrap >
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Fecha de Creación : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R09CCY" fn_month="E01R09CCM" fn_day="E01R09CCD" required="true" readonly="<%=b_read_only1%>" modified="F01R09CCY;F01R09CCM;F01R09CCD"/>
            </td>
            <td nowrap >
              <div align="right">Fecha de Vencimiento : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R09VBY" fn_month="E01R09VBM" fn_day="E01R09VBD" required="true" readonly="<%=b_read_only1%>" modified="F01R09VBY;F01R09VBM;F01R09VBD"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
             <div align="right">Monto Garantía : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R09MGA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" required="false" readonly="true" modified="F01R09MGA"/>
            </td>
            <td nowrap >
            </td>
            <td nowrap >
            </td>
          </tr>
	</table>
	</div>
	<table>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap colspan=4> 
				<B>Contrato de Prenda</B>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Hay Contrato de Prenda : </div>
            </td>
            <td nowrap >
            	<div <% if (gaDetail.getF01R09CPR().equals("Y")) out.print("class=\"txtchanged\""); %>>
                <input type="hidden" name="E01R09CPR" value="<%=gaDetail.getE01R09CPR()%>">
                <input type="radio" name="CE01R09CPR" value="C" onClick="document.forms[0].E01R09CPR.value='S';hideDiv('Div3',false)"
			  <%if (gaDetail.getE01R09CPR().equals("S"))
				out.print("checked");%> <%=disabled1%> onChange="hideDiv('Div3',false)" onBlur="hideDiv('Div3',false)">
                Si
                <input type="radio" name="CE01R09CPR" value="O" onClick="document.forms[0].E01R09CPR.value='N';hideDiv('Div3',true)"
			  <%if (gaDetail.getE01R09CPR().equals("N"))
				out.print("checked");%> <%=disabled1%> onChange="hideDiv('Div3',true)" onBlur="hideDiv('Div3',true)">
                No
				</div>
            </td>
            <td nowrap >
            </td>
            <td nowrap >
            </td>
          </tr>
	</table>
	<div id="Div3" style="display:''">
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Fecha de Suscripción : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R09FSY" fn_month="E01R09FSM" fn_day="E01R09FSD" required="true" readonly="<%=b_read_only1%>" modified="F01R09FSY;F01R09FSM;F01R09FSD"/>
            </td>
            <td nowrap >
              <div align="right">Fecha de Vencimiento : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R09VPY" fn_month="E01R09VPM" fn_day="E01R09VPD" required="true" readonly="<%=b_read_only1%>" modified="F01R09VPY;F01R09VPM;F01R09VPD"/>
            </td>
          </tr>
		</table>
	</div>          
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap colspan=4> 
				<B>Documentos Anexos</B>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Certificación Registro de Pignoración : </div>
            </td>
            <td nowrap >
            	<div <% if (gaDetail.getE01R09CRP().equals("Y")) out.print("class=\"txtchanged\""); %>>
                <input type="hidden" name="E01R09CRP" value="<%=gaDetail.getE01R09CRP()%>">
                <input type="radio" name="CE01R09CRP" value="C" onClick="document.forms[0].E01R09CRP.value='C'"
			  <%if (gaDetail.getE01R09CRP().equals("C"))
				out.print("checked");%> <%=disabled1%>>
                Copia
                <input type="radio" name="CE01R09CRP" value="O" onClick="document.forms[0].E01R09CRP.value='O'"
			  <%if (gaDetail.getE01R09CRP().equals("O"))
				out.print("checked");%> <%=disabled1%>>
                Original
                </div>
            </td>
            <td nowrap >
              <div align="right">Acta Organos Sociales : </div>
            </td>
            <td nowrap >
            	<div <% if (gaDetail.getF01R09AOS().equals("Y")) out.print("class=\"txtchanged\""); %>>
                <input type="hidden" name="E01R09AOS" value="<%=gaDetail.getE01R09AOS()%>">
                <input type="radio" name="CE01R09AOS" value="C" onClick="document.forms[0].E01R09AOS.value='C'"
			  <%if (gaDetail.getE01R09AOS().equals("C"))
				out.print("checked");%> <%=disabled1%>>
                Copia
                <input type="radio" name="CE01R09AOS" value="O" onClick="document.forms[0].E01R09AOS.value='O'"
			  <%if (gaDetail.getE01R09AOS().equals("O"))
				out.print("checked");%> <%=disabled1%>>
                Original
                </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Certificado de Camara de Comercio : </div>
            </td>
            <td nowrap >
            	<div <% if (gaDetail.getE01R09CCC().equals("Y")) out.print("class=\"txtchanged\""); %>>
                <input type="hidden" name="E01R09CCC" value="<%=gaDetail.getE01R09CCC()%>">
                <input type="radio" name="CE01R09CCC" value="C" onClick="document.forms[0].E01R09CCC.value='C'"
			  <%if (gaDetail.getE01R09CCC().equals("C"))
				out.print("checked");%> <%=disabled1%>>
                Copia
                <input type="radio" name="CE01R09CCC" value="O" onClick="document.forms[0].E01R09CCC.value='O'"
			  <%if (gaDetail.getE01R09CCC().equals("O"))
				out.print("checked");%> <%=disabled1%>>
                Original
                </div>
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
				<TEXTAREA name="E01R09COM" rows="5" cols="55" onKeyDown="limitText(this.form.E01R09COM,200);"
				onKeyUp="limitText(this.form.E01R09COM,200);" <%=disabled1%> <% if (gaDetail.getF01R09COM().equals("Y")) out.print("class=\"txtchanged\"");%>>
				<%=gaDetail.getE01R09COM().trim() %>
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