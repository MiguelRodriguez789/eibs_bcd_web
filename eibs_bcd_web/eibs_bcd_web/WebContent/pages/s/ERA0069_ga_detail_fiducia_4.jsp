<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Información Detalle de Fiducia</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="gaDetail" class= "datapro.eibs.beans.ERA006901Message"  scope="session"/>
<jsp:useBean id="gaUserFld" class= "datapro.eibs.beans.ERA007201Message"  scope="session"/>
<jsp:useBean id="gaConfFld" class= "datapro.eibs.beans.ERA007601Message"  scope="session"/>
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
	if (gaDetail.getE01R07TYP().equals("4")) {
		type_aval = "Fiducia Administración y Fuente de Pago";
	}
%>

<SCRIPT type="text/javascript">

function initPage(){
	document.forms[0].E01R07COM.value = "<%=gaDetail.getE01R07COM().trim()%>";
	document.forms[0].E01R07DBC.value = "<%=gaDetail.getE01R07DBC().trim()%>";
	document.forms[0].E01R07DBF.value = "<%=gaDetail.getE01R07DBF().trim()%>";
	document.forms[0].E01R07DIG.value = "<%=gaDetail.getE01R07DIG().trim()%>";
	if ("<%=gaDetail.getE01R07ING()%>" == "N"){
		hideInf('DivInf', true);
	}else{
		hideInf('DivInf', false);
	}
	if ("<%=gaDetail.getE01R07INP()%>" == "N"){
		hideInf('DivPag', true);
	}else{
		hideInf('DivPag', false);
	}
	if ("<%=gaDetail.getE01R07CFP()%>" == "N"){
		hideInf('DivCer', true);
	}else{
		hideInf('DivCer', false);
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

function hideInf(fld, value){
 	if (value) {
   		fld.style.display = 'none';
   	} else{
   		fld.style.display = 'block';
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

<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ga_detail_fiducia_4.jsp, ERA0069"></h3> 
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0050" >
<input type=HIDDEN name="E01ROCBNK" value="<%=gaDetail.getE01R07BNK().trim()%>" >                 
<input type=HIDDEN name="E01R07BNK" value="<%=gaDetail.getE01R07BNK().trim()%>" >                 
<input type=HIDDEN name="E01ROCREF" value="<%=gaDetail.getE01R07REF().trim()%>" >                 
<input type=HIDDEN name="REF" value="<%=gaDetail.getE01R07REF().trim()%>" >                 
<input type=HIDDEN name="SEQBIEN" value="<%=gaDetail.getE01R07SEQ().trim()%>" >                 
<input type=HIDDEN name="IOPECOD" value="<%=iopecod%>"> 
<input type=HIDDEN name="OPECOD" value="<%=oopecod%>"> 
<input type=HIDDEN name="E01R07PRD" value="<%=gaDetail.getE01R07PRD().trim()%>" >
<input type=HIDDEN name="D01R07PRD" value="<%=gaDetail.getD01R07PRD().trim()%>" >
<input type=HIDDEN name="E01R07TYP" value="<%=gaDetail.getE01R07TYP().trim()%>" >
<input type=HIDDEN name="D01R07TYP" value="<%=gaDetail.getD01R07TYP().trim()%>" >
<input type=HIDDEN name="E01ROCRGK" value="<%=gaDetail.getH01FLGWK1().trim()%>" >   
<input type=HIDDEN name="POLIZA" value="" >
<INPUT TYPE=HIDDEN NAME="SCREEN" ID="SCREEN" VALUE="207">
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
                <input type="text" name="E01R07CUN" readonly size="11" maxlength="9" value="<%=gaDetail.getE01R07CUN().trim()%>">
              </div>
            </td>
            <td nowrap> 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="E01R07NA1" id="E01R07NA1" readonly size="60" maxlength="45" value="<%=gaDetail.getE01R07NA1().trim().equals("") ? curname
					: gaDetail.getE01R07NA1().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap > 
              <div align="right"><b>No. Referencia : </b></div>
            </td>
            <td nowrap>
              <input type="text" name="E01R07REF" id="E01R07REF" size="14" maxlength="12" value="<%=gaDetail.getE01R07REF().trim()%>" readonly>
            </td> 
            <td nowrap> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap> 
              <div align="left">
               <input type="text" name="E01R07CCY" id="E01R07CCY" size="4" maxlength="3" value="<%=gaDetail.getE01R07CCY().trim()%>" readonly> 
              </div>
            </td>
           </tr>
          <tr id="trdark">             
            <td nowrap> 
              <div align="right"><b>Producto :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="PRODUCT" size="38" value="<%=gaDetail.getE01R07PRD().trim()%> - <%=gaDetail.getD01R07PRD().trim()%>" readonly>                 
              </div>
            </td>
            <td nowrap> 
              <div align="right"><b>Tipo de Garantía :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="TYPE" size="38" value="<%=gaDetail.getE01R07TYP().trim()%> - <%=gaDetail.getD01R07TYP().trim()%>" readonly>                 
              </div>
            </td>
          </tr>
          <tr id="trclear">             
            <td nowrap> 
              <div align="right"><b>Secuencia Bien :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="E01R07SEQ" size="4" maxlength="4" value="<%=gaDetail.getE01R07SEQ().trim()%>" readonly> 
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

  <h4>Informaci&oacute;n Detalle Fiducia Administración y Fuente de Pago</h4>
      
  <table class="tableinfo" width="100%">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap colspan=4> 
				<B>Memorando Jurídico</B>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Fecha de Expedición : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R07FCY" fn_month="E01R07FCM" fn_day="E01R07FCD" required="true" readonly="<%=b_read_only1%>" modified="F01R07FCY;F01R07FCM;F01R07FCD"/>
            </td>
            <td nowrap >
              <div align="right">Monto : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R07MFI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" required="true" readonly="<%=b_read_only1%>" modified="F01R07MFI"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap > 
              <div align="right">Descripción de la Fiducia : </div>
            </td>
            <td nowrap colspan=4>
				<TEXTAREA name="E01R07DBF" rows="2" cols="100" onKeyDown="limitText(this.form.E01R07DBF,200);"
				onKeyUp="limitText(this.form.E01R07DBF,200);" <%=disabled1%> <% if (gaDetail.getF01R07DBF().equals("Y")) out.print("class=\"txtchanged\"");%>>
				<%=gaDetail.getE01R07DBF().trim() %>
			    </TEXTAREA>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap colspan=4> 
				<B>Contrato</B>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Fecha de Suscripción : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R07FSY" fn_month="E01R07FSM" fn_day="E01R07FSD" required="true" readonly="<%=b_read_only1%>" modified="F01R07FSY;F01R07FSM;F01R07FSD"/>
            </td>
            <td nowrap >
              <div align="right">Fecha de Vencimiento : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R07FVY" fn_month="E01R07FVM" fn_day="E01R07FVD" required="true" readonly="<%=b_read_only1%>" modified="F01R07FVY;F01R07FVM;F01R07FVD"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Fiduciaria : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01R07FIE" size="55" maxlength="50" value="<%=gaDetail.getE01R07FIE().trim()%>" <%=read_only1%> <% if (gaDetail.getF01R07FIE().equals("Y")) out.print("class=\"txtchanged\"");%>>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
            <td nowrap >
              <div align="right">Fideicomitente : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01R07FCO" size="55" maxlength="50" value="<%=gaDetail.getE01R07FCO().trim()%>" <%=read_only1%> <% if (gaDetail.getF01R07FCO().equals("Y")) out.print("class=\"txtchanged\"");%>>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
             <div align="right">Valor Contrato : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R07MCO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" required="true" readonly="<%=b_read_only1%>" modified="F01R07MCO"/>
            </td>
            <td nowrap >
            </td>
            <td nowrap >
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap colspan=4> 
				<B>Activos Subyacentes</B>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Certificado de Fuente de Pago : </div>
            </td>
            <td nowrap >
            	<div <% if (gaDetail.getF01R07CFP().equals("Y")) out.print("class=\"txtchanged\""); %>>
                <input type="hidden" name="E01R07CFP" value="<%=gaDetail.getE01R07CFP()%>">
                <input type="radio" name="CE01R07CFP" value="S" onClick="document.forms[0].E01R07CFP.value='S'"
			  <%if (gaDetail.getE01R07CFP().equals("S"))
				out.print("checked");%> <%=disabled1%> onChange="hideInf('DivCer',false)" onBlur="hideInf('DivCer',false)">
                Si
                <input type="radio" name="CE01R07CFP" value="N" onClick="document.forms[0].E01R07CFP.value='N'"
			  <%if (gaDetail.getE01R07CFP().equals("N"))
				out.print("checked");%> <%=disabled1%> onChange="hideInf('DivCer',true)" onBlur="hideInf('DivCer',true)">
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
	<div id="DivCer" style="display:''">
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Número de Certificado : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01R07NES" size="38" maxlength="35" value="<%=gaDetail.getE01R07NES().trim()%>" <%=read_only1%> <% if (gaDetail.getF01R07NES().equals("Y")) out.print("class=\"txtchanged\"");%>>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
            <td nowrap >
            </td>
            <td nowrap >
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
             <div align="right">Valor Activos : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R07MCE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" required="true" readonly="<%=b_read_only1%>" modified="F01R07MCE"/>
            </td>
            <td nowrap >
             <div align="right">Fecha de emisión : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R07FEY" fn_month="E01R07FEM" fn_day="E01R07FED" required="true" readonly="<%=b_read_only1%>" modified="F01R07FEY;F01R07FEM;F01R07FED"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap > 
              <div align="right">Descripción : </div>
            </td>
            <td nowrap colspan=4>
				<TEXTAREA name="E01R07DBC" rows="2" cols="100" onKeyDown="limitText(this.form.E01R07DBC,200);"
				onKeyUp="limitText(this.form.E01R07DBC,200);" <%=disabled1%> <% if (gaDetail.getF01R07DBC().equals("Y")) out.print("class=\"txtchanged\"");%>>
				<%=gaDetail.getE01R07DBC().trim() %>
			    </TEXTAREA>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
          </tr>
		</table>
	</div>          
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap colspan=4> 
				<B>Informe de Gestión</B>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Hay Informe de Gestión : </div>
            </td>
            <td nowrap >
	            <div <% if (gaDetail.getF01R07ING().equals("Y")) out.print("class=\"txtchanged\""); %>>
                <input type="hidden" name="E01R07ING" value="<%=gaDetail.getE01R07ING()%>">
                <input type="radio" name="CE01R07ING" value="S" onClick="document.forms[0].E01R07ING.value='S'"
			  <%if (gaDetail.getE01R07ING().equals("S"))
				out.print("checked");%> <%=disabled1%> onChange="hideInf('DivInf',false)" onBlur="hideInf('DivInf',false)">
                Si
                <input type="radio" name="CE01R07ING" value="N" onClick="document.forms[0].E01R07ING.value='N'"
			  <%if (gaDetail.getE01R07ING().equals("N"))
				out.print("checked");%> <%=disabled1%> onChange="hideInf('DivInf',true)" onBlur="hideInf('DivInf',true)">
                No
                </div>
            </td>
            <td nowrap >
            </td>
            <td nowrap >
            </td>
          </tr>
	</table>
	<div id="DivInf" style="display:''">
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Fecha del Ultimo Reporte : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R07URY" fn_month="E01R07URM" fn_day="E01R07URD" required="false" readonly="<%=b_read_only1%>" modified="F01R07URY;F01R07URM;F01R07URD"/>
            </td>
            <td nowrap >
              <div align="right">Período : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01R07PER" size="50" maxlength="50" value="<%=gaDetail.getE01R07PER().trim()%>" <%=read_only1%> <% if (gaDetail.getF01R07PER().equals("Y")) out.print("class=\"txtchanged\"");%>>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
             <div align="right">Valor Patrimonio : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R07VPT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" required="false" readonly="<%=b_read_only1%>" modified="F01R07VPT"/>
            </td>
            <td nowrap >
              <div align="right"></div>
            </td>
            <td nowrap >
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Valor Garantía : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R07MGA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" required="false" readonly="<%=b_read_only1%>" modified="F01R07MGA"/>
            </td>
            <td nowrap >
            </td>
            <td nowrap >
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap > 
              <div align="right">Descripción : </div>
            </td>
            <td nowrap colspan=4>
				<TEXTAREA name="E01R07DIG" rows="2" cols="100" onKeyDown="limitText(this.form.E01R07DIG,200);"
				onKeyUp="limitText(this.form.E01R07DIG,200);" <%=disabled1%> <% if (gaDetail.getF01R07DIG().equals("Y")) out.print("class=\"txtchanged\"");%>>
				<%=gaDetail.getE01R07DIG().trim() %>
			    </TEXTAREA>
            </td>
          </tr>
		</table>
	</div>          
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap colspan=4> 
				<B>Información Pagaré</B>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Hay Información de Pagaré : </div>
            </td>
            <td nowrap >
	            <div <% if (gaDetail.getF01R07INP().equals("Y")) out.print("class=\"txtchanged\""); %>>
                <input type="hidden" name="E01R07INP" value="<%=gaDetail.getE01R07INP()%>">
                <input type="radio" name="CE01R07INP" value="S" onClick="document.forms[0].E01R07INP.value='S'"
			  <%if (gaDetail.getE01R07INP().equals("S"))
				out.print("checked");%> <%=disabled1%> onChange="hideInf('DivPag',false)" onBlur="hideInf('DivPag',false)">
                Si
                <input type="radio" name="CE01R07INP" value="N" onClick="document.forms[0].E01R07INP.value='N'"
			  <%if (gaDetail.getE01R07INP().equals("N"))
				out.print("checked");%> <%=disabled1%> onChange="hideInf('DivPag',true)" onBlur="hideInf('DivPag',true)">
                No
                </div>
            </td>
            <td nowrap >
            </td>
            <td nowrap >
            </td>
          </tr>
	</table>
	<div id="DivPag" style="display:''">
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Numero de Pagaré : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01R07NPA" size="28" maxlength="25" value="<%=gaDetail.getE01R07NPA().trim()%>" <%=read_only1%> <% if (gaDetail.getF01R07NPA().equals("Y")) out.print("class=\"txtchanged\"");%>>
            </td>
            <td nowrap >
              <div align="right">Valor Obligación : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R07AVA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" required="false" readonly="<%=b_read_only1%>" modified="F01R07AVA"/>
            </td>
          </tr>
		</table>
	</div>          
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap > 
              <div align="right">Comentarios : </div>
            </td>
            <td nowrap colspan=4>
				<TEXTAREA name="E01R07COM" rows="2" cols="100" onKeyDown="limitText(this.form.E01R07COM,200);"
				onKeyUp="limitText(this.form.E01R07COM,200);" <%=disabled1%> <% if (gaDetail.getF01R07COM().equals("Y")) out.print("class=\"txtchanged\"");%>>
				<%=gaDetail.getE01R07COM().trim() %>
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
				if (b_warning == true) {
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