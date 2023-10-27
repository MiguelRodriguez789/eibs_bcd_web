<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Información Detalle de Pignoración de Rentas</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="gaDetail" class= "datapro.eibs.beans.ERA007301Message"  scope="session"/>
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
	if (gaDetail.getE01R08TYP().equals("8")) {
		type_aval = "Pignoración de Rentas";
	}
%>

<SCRIPT type="text/javascript">

function initPage(){
	document.forms[0].E01R08RPI.value = "<%=gaDetail.getE01R08RPI().trim()%>";
	document.forms[0].E01R08CEO.value = "<%=gaDetail.getE01R08CEO().trim()%>";
	document.forms[0].E01R08COM.value = "<%=gaDetail.getE01R08COM().trim()%>";
	if ("<%=gaDetail.getE01R08CLR()%>" == "N"){
		hideInf('DivCer', true);
	}else{
		hideInf('DivCer', false);
	}
	if ("<%=gaDetail.getE01R08CID()%>" == "N"){
		hideInf('DivInf', true);
	}else{
		hideInf('DivInf', false);
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
   		fld.style.display = "none";
   	} else{
   		fldstyle.display = "block";
   	}
}

function hidePAdmin(fld, value){
 	if (value) {
   		fld.style.display = "block";
   	} else{
   		fldstyle.display = "none";
   	}
}

 	if (document.forms[0].E01R08CIR.value == "S") {
		hidePAdmin('iCertif', true);
	}else{
		hidePAdmin('iCertif', false);
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

<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ga_detail_pignoracion_8.jsp, ERA0073"></h3> 
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0050" >
<input type=HIDDEN name="E01ROCBNK" value="<%=gaDetail.getE01R08BNK().trim()%>" readonly>                 
<input type=HIDDEN name="E01R08BNK" value="<%=gaDetail.getE01R08BNK().trim()%>" readonly>                 
<input type=HIDDEN name="E01ROCREF" value="<%=gaDetail.getE01R08REF().trim()%>" readonly>                 
<input type=HIDDEN name="SEQBIEN" value="<%=gaDetail.getE01R08SEQ().trim()%>" readonly>                 
<input type=HIDDEN name="IOPECOD" value="<%=iopecod%>"> 
<input type=HIDDEN name="OPECOD" value="<%=oopecod%>"> 
<input type=HIDDEN name="E01R08PRD" value="<%=gaDetail.getE01R08PRD().trim()%>" readonly>
<input type=HIDDEN name="D01R07PRD" value="<%=gaDetail.getD01R08PRD().trim()%>" readonly>
<input type=HIDDEN name="E01R08TYP" value="<%=gaDetail.getE01R08TYP().trim()%>" readonly>
<input type=HIDDEN name="D01R07TYP" value="<%=gaDetail.getD01R08TYP().trim()%>" readonly>
<input type=HIDDEN name="E01ROCRGK" value="<%=gaDetail.getH01FLGWK1().trim()%>" >   
<input type=HIDDEN name="POLIZA" value="" readonly>
<INPUT TYPE=HIDDEN NAME="SCREEN" ID="SCREEN" VALUE="208">
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
                <input type="text" name="E01R08CUN" readonly size="11" maxlength="9" value="<%=gaDetail.getE01R08CUN().trim()%>">
              </div>
            </td>
            <td nowrap> 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="E01R08NA1" id="E01R08NA1" readonly size="60" maxlength="45" value="<%=gaDetail.getE01R08NA1().trim().equals("") ? curname
					: gaDetail.getE01R08NA1().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap > 
              <div align="right"><b>No. Referencia : </b></div>
            </td>
            <td nowrap>
              <input type="text" name="E01R08REF" id="E01R08REF" size="14" maxlength="12" value="<%=gaDetail.getE01R08REF().trim()%>" readonly>
            </td> 
            <td nowrap> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap> 
              <div align="left">
               <input type="text" name="E01R08CUR" id="E01R08CUR" size="4" maxlength="3" value="<%=gaDetail.getE01R08CUR().trim()%>" readonly> 
              </div>
            </td>
           </tr>
          <tr id="trdark">             
            <td nowrap> 
              <div align="right"><b>Producto :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="PRODUCT" size="38" value="<%=gaDetail.getE01R08PRD().trim()%> - <%=gaDetail.getD01R08PRD().trim()%>" readonly>                 
              </div>
            </td>
            <td nowrap> 
              <div align="right"><b>Tipo de Garantía :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="TYPE" size="60" value="<%=gaDetail.getE01R08TYP().trim()%> - <%=gaDetail.getD01R08TYP().trim()%>" readonly>                 
              </div>
            </td>
          </tr>
          <tr id="trclear">             
            <td nowrap> 
              <div align="right"><b>Secuencia Bien :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="E01R08SEQ" size="4" maxlength="4" value="<%=gaDetail.getE01R08SEQ().trim()%>" readonly> 
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

  <h4>Informaci&oacute;n Detalle Pignoración de Rentas</h4>
      
  <table class="tableinfo" width="100%">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Contrato de Empréstito : </div>
            </td>
            <td nowrap >
            	<div <% if (gaDetail.getF01R08CEM().equals("Y")) out.print("class=\"txtchanged\""); %>>
                <input type="hidden" name="E01R08CEM" value="<%=gaDetail.getE01R08CEM()%>">
                <input type="radio" name="CE01R08CEM" value="C" onClick="document.forms[0].E01R08CEM.value='C'"
			  <%if (gaDetail.getE01R08CEM().equals("C"))
				out.print("checked");%> <%=disabled1%>>
                Copia
                <input type="radio" name="CE01R08CEM" value="O" onClick="document.forms[0].E01R08CEM.value='O'"
			  <%if (gaDetail.getE01R08CEM().equals("O"))
				out.print("checked");%> <%=disabled1%>>
                Original
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
				</div>
            </td>
            <td nowrap >
            </td>
            <td nowrap >
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Plazo Tiempo : </div>
            </td>
            <td nowrap >
            		<div>
					<INPUT type="text" name="E01R08TRM" size="5" maxlength="5" value="<%=gaDetail.getE01R08TRM().trim()%>" onKeyPress="enterInteger(event)">
					</div>
					<div <% if (gaDetail.getF01R08PLZ().equals("Y")) out.print("class=\"txtchanged\""); %>>
					<select name="E01R08PLZ">
					<option value=""
						<%if (gaDetail.getE01R08PLZ().equals("")) {
				out.print("selected");
			}%>></option>
					<option value="D"
						<%if (gaDetail.getE01R08PLZ().equals("D")) {
				out.print("selected");
			}%>>Dias</option>
					<option value="M"
						<%if (gaDetail.getE01R08PLZ().equals("M")) {
				out.print("selected");
			}%>>Meses</option>
					<option value="Y"
						<%if (gaDetail.getE01R08PLZ().equals("Y")) {
				out.print("selected");
			}%>>A#os</option>
					</select>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
					</div>
            </td>
            <td nowrap >
              <div align="right">Tasa : </div>
            </td>
            <td nowrap >
            	<div <% if (gaDetail.getF01R08TRT().equals("Y")) out.print("class=\"txtchanged\""); %>>
                <input type="hidden" name="E01R08TRT" value="<%=gaDetail.getE01R08TRT()%>">
                <input type="radio" name="CE01R08TRT" value="C" onClick="document.forms[0].E01R08TRT.value='A'"
			  <%if (gaDetail.getE01R08TRT().equals("A"))
				out.print("checked");%> <%=disabled1%>>
                Anual
                <input type="radio" name="CE01R08TRT" value="M" onClick="document.forms[0].E01R08TRT.value='M'"
			  <%if (gaDetail.getE01R08TRT().equals("M"))
				out.print("checked");%> <%=disabled1%>>
                Mensual
                <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
				</div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Tasa : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R08RTE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE%>" required="true" readonly="<%=b_read_only1%>" modified="F01R08RTE"/>
            </td>
            <td nowrap> 
              <div align="right">Periodos de Gracia : </div>
            </td>
            <td nowrap >
            	<div <% if (gaDetail.getF01R08PGR().equals("Y")) out.print("class=\"txtchanged\""); %>>
                <input type="hidden" name="E01R08PGR" value="<%=gaDetail.getE01R08PGR()%>">
                <input type="radio" name="CE01R08PGR" value="C" onClick="document.forms[0].E01R08PGR.value='S'"
			  <%if (gaDetail.getE01R08PGR().equals("S"))
				out.print("checked");%> <%=disabled1%>>
                Si
                <input type="radio" name="CE01R08PGR" value="N" onClick="document.forms[0].E01R08PGR.value='N'"
			  <%if (gaDetail.getE01R08PGR().equals("N"))
				out.print("checked");%> <%=disabled1%>>
                No
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
				</div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Valor Contrato : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R08MCO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" required="true" readonly="<%=b_read_only1%>" modified="F01R08MCO"/>
            </td>
            <td nowrap >
            </td>
            <td nowrap >
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap valign="top"> 
              <div align="right">Condiciones Especiales de la Operación de Crédito : </div>
            </td>
            <td nowrap colspan=3>
				<TEXTAREA name="E01R08CEO" rows="2" cols="100" onKeyDown="limitText(this.form.E01R08CEO,200);"
				onKeyUp="limitText(this.form.E01R08CEO,200);" <%=disabled1%> <% if (gaDetail.getF01R08CEO().equals("Y")) out.print("class=\"txtchanged\"");%>>
				<%=gaDetail.getE01R08CEO().trim() %>
			    </TEXTAREA>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20" style="vertical-align: top;" > 
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap colspan=4> 
				<B>Datos Específicos Garantía - Pignoración</B>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Porcentaje Pignoración de Renta : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R08PPR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE%>" required="true" readonly="<%=b_read_only1%>" modified="F01R08PPR"/>
            </td>
            <td nowrap >
              <div align="right">Valor Garantía : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R08MGA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" required="true" readonly="<%=b_read_only1%>" modified="F01R08MGA"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap valign="top"> 
              <div align="right">Renta Pignorada : </div>
            </td>
            <td nowrap colspan=3>
				<TEXTAREA name="E01R08RPI" rows="2" cols="100" onKeyDown="limitText(this.form.E01R08RPI,200);"
				onKeyUp="limitText(this.form.E01R08RPI,200);" <%=disabled1%> <% if (gaDetail.getF01R08RPI().equals("Y")) out.print("class=\"txtchanged\"");%>>
				<%=gaDetail.getE01R08RPI().trim() %>
			    </TEXTAREA>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20" style="vertical-align: top;" > 
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Decreto de Nombramiento y/o<br>Acta de Posesión Representante Legal : </div>
            </td>
            <td nowrap >
            	<div <% if (gaDetail.getF01R08DNO().equals("Y")) out.print("class=\"txtchanged\""); %>>
                <input type="hidden" name="E01R08DNO" value="<%=gaDetail.getE01R08DNO()%>">
                <input type="radio" name="CE01R08DNO" value="C" onClick="document.forms[0].E01R08DNO.value='C'"
			  <%if (gaDetail.getE01R08DNO().equals("C"))
				out.print("checked");%> <%=disabled1%> >
                Copia
                <input type="radio" name="CE01R08DNO" value="O" onClick="document.forms[0].E01R08DNO.value='O'"
			  <%if (gaDetail.getE01R08DNO().equals("O"))
				out.print("checked");%> <%=disabled1%> >
                Original
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
				</div>
            </td>
            <td nowrap >
              <div align="right">Decreto - Acta : </div>
            </td>
            <td nowrap >
	            <div <% if (gaDetail.getF01R08DAC().equals("Y")) out.print("class=\"txtchanged\""); %>>
                <input type="hidden" name="E01R08DAC" value="<%=gaDetail.getE01R08DAC()%>">
                <input type="radio" name="CE01R08DAC" value="D" onClick="document.forms[0].E01R08DAC.value='D'"
			  <%if (gaDetail.getE01R08DAC().equals("D"))
				out.print("checked");%> <%=disabled1%> >
                Decreto
                <input type="radio" name="CE01R08DAC" value="A" onClick="document.forms[0].E01R08DAC.value='A'"
			  <%if (gaDetail.getE01R08DAC().equals("A"))
				out.print("checked");%> <%=disabled1%> >
                Acta
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
				</div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
             <div align="right">Número de Decreto y/o<br>Acta Posesión : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01R08NDA" size="28" maxlength="25" value="<%=gaDetail.getE01R08NDA().trim()%>" <%=read_only1%> <% if (gaDetail.getF01R08NDA().equals("Y")) out.print("class=\"txtchanged\"");%>>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
            <td nowrap >
             <div align="right">Fecha del Decreto : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R08FDY" fn_month="E01R08FDM" fn_day="E01R08FDD" required="true" readonly="<%=b_read_only1%>" modified="F01R08FDY;F01R08FDM;F01R08FDD"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
             <div align="right">Nombre del Representante Legal : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01R08RLA" size="50" maxlength="50" value="<%=gaDetail.getE01R08RLA().trim()%>" <%=read_only1%> <% if (gaDetail.getF01R08RLA().equals("Y")) out.print("class=\"txtchanged\"");%>>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
            <td nowrap >
             <div align="right">Cargo : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01R08CRL" size="50" maxlength="50" value="<%=gaDetail.getE01R08CRL().trim()%>" <%=read_only1%> <% if (gaDetail.getF01R08CRL().equals("Y")) out.print("class=\"txtchanged\"");%>>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Creación Entidad : </div>
            </td>
            <td nowrap >
               <div align="left" <% if (gaDetail.getF01R08CRE().equals("Y")) out.print("class=\"txtchanged\""); %>> 
                  <select name="E01R08CRE">
                    <option value=" " <%if (!(gaDetail.getE01R08CRE().equals("L")
					|| gaDetail.getE01R08CRE().equals("D") || gaDetail.getE01R08CRE().equals("C")
					|| gaDetail.getE01R08CRE().equals("R") || gaDetail.getE01R08CRE().equals("O")
					|| gaDetail.getE01R08CRE().equals("A")))
				out.print("selected");%>> 
                     </option>
                     <option value="L" <%if (gaDetail.getE01R08CRE().equals("L"))
				out.print("selected");%> <%=disabled1%>>Ley</option>
                     <option value="D" <%if (gaDetail.getE01R08CRE().equals("D"))
				out.print("selected");%> <%=disabled1%>>Decreto</option>
                     <option value="C" <%if (gaDetail.getE01R08CRE().equals("C"))
				out.print("selected");%> <%=disabled1%>>Constitución</option>
                     <option value="R" <%if (gaDetail.getE01R08CRE().equals("R"))
				out.print("selected");%> <%=disabled1%>>Resolución</option>
                     <option value="O" <%if (gaDetail.getE01R08CRE().equals("O"))
				out.print("selected");%> <%=disabled1%>>Ordenanza</option>
                     <option value="A" <%if (gaDetail.getE01R08CRE().equals("A"))
				out.print("selected");%> <%=disabled1%>>Acuerdo</option>
                   </select>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
                </div>
            </td>
            <td nowrap >
              <div align="right">Certificación Inversión de Recursos : </div>
            </td>
            <td nowrap >
            	<div <% if (gaDetail.getF01R08CIR().equals("Y")) out.print("class=\"txtchanged\""); %>>
                <input type="hidden" name="E01R08CIR" value="<%=gaDetail.getE01R08CIR()%>">
                <input type="radio" name="CE01R08CIR" value="S" onClick="document.forms[0].E01R08CIR.value='S';hidePAdmin('iCertif',true)"
			  <%if (gaDetail.getE01R08CIR().equals("S"))
				out.print("checked");%> <%=disabled1%> onChange="hidePAdmin('iCertif',true)" onBlur="hidePAdmin('iCertif',true)" >
                Si
                <input type="radio" name="CE01R08CIR" value="N" onClick="document.forms[0].E01R08CIR.value='N';hidePAdmin('iCertif',false)"
			  <%if (gaDetail.getE01R08CIR().equals("N"))
				out.print("checked");%> <%=disabled1%> onChange="hidePAdmin('iCertif',false)" onBlur="hidePAdmin('iCertif',false)">
                No
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
				</div>
            </td>
          </tr>
	</table>
	</td>
	</tr>
    <tr > 
      <td nowrap> 
	<div id="iCertif" style="display: block;">
      <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
             <div align="right">Fecha de la Certificación : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R08FCY" fn_month="E01R08FCM" fn_day="E01R08FCD" required="true" readonly="<%=b_read_only1%>" modified="F01R08FCY;F01R08FCM;F01R08FCD"/>
            </td>
            <td nowrap> 
             <div align="right">Quien Expide la Certificación : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01R08CEP" size="50" maxlength="50" value="<%=gaDetail.getE01R08CEP().trim()%>" <%=read_only1%> <% if (gaDetail.getF01R08CEP().equals("Y")) out.print("class=\"txtchanged\"");%>>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Certificación de Registro de la <br>Deuda del Ministerio de Hacienda : </div>
            </td>
            <td nowrap >
            	<div <% if (gaDetail.getF01R08CRD().equals("Y")) out.print("class=\"txtchanged\""); %>>
                <input type="hidden" name="E01R08CRD" value="<%=gaDetail.getE01R08CRD()%>">
                <input type="radio" name="CE01R08CRD" value="C" onClick="document.forms[0].E01R08CRD.value='C'"
			  <%if (gaDetail.getE01R08CRD().equals("C"))
				out.print("checked");%> <%=disabled1%> >
                Copia
                <input type="radio" name="CE01R08CRD" value="O" onClick="document.forms[0].E01R08CRD.value='O'"
			  <%if (gaDetail.getE01R08CRD().equals("O"))
				out.print("checked");%> <%=disabled1%> >
                Original
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
				</div>
            </td>
            <td nowrap >
              <div align="right">Fecha de la Certificación : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R08CMY" fn_month="E01R08CMM" fn_day="E01R08CMD" required="true" readonly="<%=b_read_only1%>" modified="F01R08CMY;F01R08CMM;F01R08CMD"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Número de Registro : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01R08NRM" size="28" maxlength="25" value="<%=gaDetail.getE01R08NRM().trim()%>" <%=read_only1%> <% if (gaDetail.getF01R08NRM().equals("Y")) out.print("class=\"txtchanged\"");%>>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
            <td nowrap >
            </td>
            <td nowrap >
            </td>
          </tr>
		</table>
	</div>    
	</td>
	</tr>
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Certificado de Libertad y Rentas Pignoradas : </div>
            </td>
            <td nowrap >
            	<div <% if (gaDetail.getF01R08CLR().equals("Y")) out.print("class=\"txtchanged\""); %>>
                <input type="hidden" name="E01R08CLR" value="<%=gaDetail.getE01R08CLR()%>">
                <input type="radio" name="CE01R08CLR" value="S" onClick="document.forms[0].E01R08CLR.value='S'"
			  <%if (gaDetail.getE01R08CLR().equals("S"))
				out.print("checked");%> <%=disabled1%> onChange="hideInf('DivCer',false)" onBlur="hideInf('DivCer',false)">
                Si
                <input type="radio" name="CE01R08CLR" value="N" onClick="document.forms[0].E01R08CLR.value='N'"
			  <%if (gaDetail.getE01R08CLR().equals("N"))
				out.print("checked");%> <%=disabled1%> onChange="hideInf('DivCer',true)" onBlur="hideInf('DivCer',true)">
                No
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
				</div>
            </td>
            <td nowrap> 
            </td>
            <td nowrap >
            </td>
          </tr>
	</table>
	</td>
	</tr>
    <tr > 
      <td nowrap> 
	<div id="DivCer" style="display: block;">
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Fecha de Expedición :</div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R08ECY" fn_month="E01R08ECM" fn_day="E01R08ECD" required="true" readonly="<%=b_read_only1%>" modified="F01R08ECY;F01R08ECM;F01R08ECD"/>
            </td>
            <td nowrap >
              <div align="right">Fecha de Vencimiento : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R08VCY" fn_month="E01R08VCM" fn_day="E01R08VCD" required="true" readonly="<%=b_read_only1%>" modified="F01R08VCY;F01R08VCM;F01R08VCD"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
             <div align="right">Quien Expide la Certificación : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01R08CLE" size="50" maxlength="50" value="<%=gaDetail.getE01R08CLE().trim()%>" <%=read_only1%> <% if (gaDetail.getF01R08CLE().equals("Y")) out.print("class=\"txtchanged\"");%>>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
            <td nowrap >
            </td>
            <td nowrap >
            </td>
          </tr>
		</table>
	</div>          
	</td>
	</tr>
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Certificación de Inclusión de la Deuda  <br>en la Presente y Futuras Vigencias Fiscales : </div>
            </td>
            <td nowrap >
            	<div <% if (gaDetail.getF01R08CID().equals("Y")) out.print("class=\"txtchanged\""); %>>
                <input type="hidden" name="E01R08CID" value="<%=gaDetail.getE01R08CID()%>">
                <input type="radio" name="CE01R08CID" value="S" onClick="document.forms[0].E01R08CID.value='S'"
			  <%if (gaDetail.getE01R08CID().equals("S"))
				out.print("checked");%> <%=disabled1%> onChange="hideInf('DivInf',false)" onBlur="hideInf('DivInf',false)">
                Si
                <input type="radio" name="CE01R08CID" value="N" onClick="document.forms[0].E01R08CID.value='N'"
			  <%if (gaDetail.getE01R08CID().equals("N"))
				out.print("checked");%> <%=disabled1%> onChange="hideInf('DivInf',true)" onBlur="hideInf('DivInf',true)">
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
	</td>
	</tr>
    <tr > 
      <td nowrap> 
	<div id="DivInf" style="display:''">
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Fecha de Creación :</div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R08EIY" fn_month="E01R08EIM" fn_day="E01R08EID" required="true" readonly="<%=b_read_only1%>" modified="F01R08EIY;F01R08EIM;F01R08EID"/>
            </td>
            <td nowrap >
              <div align="right">Fecha de Vencimiento : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R08VIY" fn_month="E01R08VIM" fn_day="E01R08VID" required="true" readonly="<%=b_read_only1%>" modified="F01R08VIY;F01R08VIM;F01R08VID"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
             <div align="right">Quien Expide la Certificación : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01R08ECI" size="50" maxlength="50" value="<%=gaDetail.getE01R08ECI().trim()%>" <%=read_only1%> <% if (gaDetail.getF01R08ECI().equals("Y")) out.print("class=\"txtchanged\"");%>>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
            <td nowrap >
            </td>
            <td nowrap >
            </td>
          </tr>
		</table>
	</div>          
	</td>
	</tr>
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap valign="top"> 
              <div align="right">Comentarios : </div>
            </td>
            <td nowrap colspan=3>
				<TEXTAREA name="E01R08COM" rows="2" cols="100" onKeyDown="limitText(this.form.E01R08COM,200);"
				onKeyUp="limitText(this.form.E01R08COM,200);" <%=disabled1%> <% if (gaDetail.getF01R08COM().equals("Y")) out.print("class=\"txtchanged\"");%>>
				<%=gaDetail.getE01R08COM().trim() %>
			    </TEXTAREA>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
             <div align="right">Certificaciones Legales : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01R08CLG" size="50" maxlength="50" value="<%=gaDetail.getE01R08CLG().trim()%>" <%=read_only1%> <% if (gaDetail.getF01R08CLG().equals("Y")) out.print("class=\"txtchanged\"");%>>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
            <td nowrap> 
             <div align="right">Certificado de Cumplimiento Ley 358 : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01R08CCL" size="50" maxlength="50" value="<%=gaDetail.getE01R08CCL().trim()%>" <%=read_only1%> <% if (gaDetail.getF01R08CCL().equals("Y")) out.print("class=\"txtchanged\"");%>>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Fecha :</div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R08CCY" fn_month="E01R08CCM" fn_day="E01R08CCD" required="true" readonly="<%=b_read_only1%>" modified="F01R08CCY;F01R08CCM;F01R08CCD"/>
            </td>
            <td nowrap >
              <div align="right">Quien Expide la Certificación : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01R08ECL" size="50" maxlength="50" value="<%=gaDetail.getE01R08ECL().trim()%>" <%=read_only1%> <% if (gaDetail.getF01R08ECL().equals("Y")) out.print("class=\"txtchanged\"");%>>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
             <div align="right">Autorización de la Asamblea o Consejo : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01R08AAC" size="50" maxlength="50" value="<%=gaDetail.getE01R08AAC().trim()%>" <%=read_only1%> <% if (gaDetail.getF01R08AAC().equals("Y")) out.print("class=\"txtchanged\"");%>>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
            <td nowrap> 
             <div align="right">Fecha : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R08FAY" fn_month="E01R08FAM" fn_day="E01R08FAD" required="true" readonly="<%=b_read_only1%>" modified="F01R08FAY;F01R08FAM;F01R08FAD"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
             <div align="right">Organo que Expide : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01R08OEX" size="50" maxlength="50" value="<%=gaDetail.getE01R08OEX().trim()%>" <%=read_only1%> <% if (gaDetail.getF01R08OEX().equals("Y")) out.print("class=\"txtchanged\"");%>>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
            <td nowrap> 
            </td>
            <td nowrap >
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Lugar:  <%= !currUser.getE01INT().equals("04") ? "Departamento :" : "Estado :" %></div>
            </td>
            <td nowrap >
				<input type="text" name="E01R08DOR" size="5" maxlength="4" value="<%=gaDetail.getE01R08DOR().trim()%>" <%=read_only1%> <% if (gaDetail.getF01R08DOR().equals("Y")) out.print("class=\"txtchanged\"");%>/>
 				<%
 					if (!b_read_only1) {
 						if (!currUser.getE01INT().equals("04")) {
 				%>
              			<a href="javascript:Get2FilterCodes('E01R08DOR','D01R08DOR','27',' ','CO')">
							<img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0">
						</a>
				<%
						} else { 						
 				%>
              			<a href="javascript:Get2FilterCodes('E01R08DOR','D01R08DOR','EM',' ','CO')">
							<img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0">
						</a>
				<%
						}
					}	
				%>
               <eibsinput:text name="gaDetail" property="D01R08DOR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT %>" readonly="true" <% if (gaDetail.getF01R08DOR().equals("Y")) out.print("class=\"txtchanged\"");%>/>
            </td>
            <td nowrap >
              <div align="right">Ciudad : </div>
            </td>
            <td nowrap >
				<input type="text" name="E01R08COR" size="6" maxlength="5" value="<%=gaDetail.getE01R08COR().trim()%>" <%=read_only1%> <% if (gaDetail.getF01R08COR().equals("Y")) out.print("class=\"txtchanged\"");%>/>
 				<%
 					if (!b_read_only1) {
 				%>
              			<a href="javascript:Get2FilterCodes('E01R08COR','D01R08COR','84',' ',document.forms[0].E01R08DOR.value)">
							<img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0">
						</a>
				<%
					}
				%>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
				<input type="text" name="D01R08COR" size="30" maxlength="30" value="<%=gaDetail.getD01R08COR().trim()%>" readonly <% if (gaDetail.getF01R08COR().equals("Y")) out.print("class=\"txtchanged\"");%>>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
             <div align="right">Certificado de Cumplimiento Ministerio de Hacienda : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01R08CCH" size="50" maxlength="50" value="<%=gaDetail.getE01R08CCH().trim()%>" <%=read_only1%> <% if (gaDetail.getF01R08CCH().equals("Y")) out.print("class=\"txtchanged\"");%>>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
            <td nowrap> 
             <div align="right">Fecha : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R08FHY" fn_month="E01R08FHM" fn_day="E01R08FHD" required="true" readonly="<%=b_read_only1%>" modified="F01R08FHY;F01R08FHM;F01R08FHD"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
             <div align="right">Acreditación de Pago o Derecho de Publicación : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01R08ADP" size="50" maxlength="50" value="<%=gaDetail.getE01R08ADP().trim()%>" <%=read_only1%> <% if (gaDetail.getF01R08ADP().equals("Y")) out.print("class=\"txtchanged\"");%>>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
            <td nowrap> 
             <div align="right">Fecha de Expedición : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R08EXY" fn_month="E01R08EXM" fn_day="E01R08EXD" required="true" readonly="<%=b_read_only1%>" modified="F01R08EXY;F01R08EXM;F01R08EXD"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
             <div align="right">Publicación Judicial : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01R08PUJ" size="50" maxlength="50" value="<%=gaDetail.getE01R08PUJ().trim()%>" <%=read_only1%> <% if (gaDetail.getF01R08PUJ().equals("Y")) out.print("class=\"txtchanged\"");%>>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
            <td nowrap> 
            </td>
            <td nowrap >
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

<table width="100%" class="tbenter">		
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
		<td width="100%" align="center" colspan="3">
	<%
		if (iopecod.equals("0005") || iopecod.equals("0006")
				|| iopecod.equals("0001")) {
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
		<INPUT id="EIBSBTN" type="button" name="Cancel" value="Cancelar" onclick="top.close()">
	<%
		}
	%>
	</td>
	</tr>
  </table>	



  </FORM>
 </BODY>

 </html>