<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Información Detalle de Garantías Fondo de Garantías </title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="gaDetail" class= "datapro.eibs.beans.ERA006101Message"  scope="session"/>
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
	boolean b_read_onlyAlw = true;
	String read_only1 = "";
	String disabled1 = "";
	String type_aval = "";
	String read_only_mnt = "readonly style='background-color:#F2F1F1'";
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
	if (gaDetail.getE01R02TYP().equals("Y")) {
		type_aval =gaDetail.getD01R02TYP().trim();
	}
%>

<SCRIPT type="text/javascript">

function initPage(){
	document.forms[0].E01R02COM.value = "<%=gaDetail.getE01R02COM().trim()%>";
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
function goReturn(){
	document.forms[0].SCREEN.value="200";
	document.forms[0].submit();
}

   function waitSimulate() {
     document.body.style.cursor = "wait";
   }
   document.forms[0].onsubmit= waitSimulate;
   document.forms[0].E01R02TRC.focus();
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
	
 	int row = 0;
%>
 
<h3 align="center"><%
	if (iopecod.equals("0001")) {
%> <%=type_aval %> - Nuevo
<%
	} else if (iopecod.equals("0005")) {
%><%=type_aval %> - Modificación
<%
	} else if (iopecod.equals("0006")) {
%><%=type_aval %> - Borrar
<%
	} else if (iopecod.equals("0004")) {
%><%=type_aval %> - Consulta
<%
	}
%>

<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ga_detail_FNG.jsp, ERA0061"></h3> 
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0050" >
<input type=HIDDEN name="E01ROCBNK" value="<%=gaDetail.getE01R02BNK().trim()%>" readonly>                 
<input type=HIDDEN name="E01R02BNK" value="<%=gaDetail.getE01R02BNK().trim()%>" readonly>                 
<input type=HIDDEN name="E01ROCREF" value="<%=gaDetail.getE01R02REF().trim()%>" readonly>                 
<input type=HIDDEN name="REF" value="<%=gaDetail.getE01R02REF().trim()%>" readonly>                 
<input type=HIDDEN name="SEQBIEN" value="<%=gaDetail.getE01R02SEQ().trim()%>" readonly>                 
<input type=HIDDEN name="IOPECOD" value="<%=iopecod%>"> 
<input type=HIDDEN name="OPECOD" value="<%=oopecod%>"> 
<input type=HIDDEN name="E01R02PRD" value="<%=gaDetail.getE01R02PRD().trim()%>" readonly>
<input type=HIDDEN name="D01R02PRD" value="<%=gaDetail.getD01R02PRD().trim()%>" readonly>
<input type=HIDDEN name="E01R02TYP" value="<%=gaDetail.getE01R02TYP().trim()%>" readonly>
<input type=HIDDEN name="D01R02TYP" value="<%=gaDetail.getD01R02TYP().trim()%>" readonly>
<input type=HIDDEN name="E01R02MIG" value="<%=gaDetail.getE01R02MIG().trim()%>" readonly>
<input type=HIDDEN name="E01R02CFG" value="<%=gaDetail.getE01R02CFG().trim()%>" readonly>
<input type=HIDDEN name="POLIZA" value="" readonly>
<INPUT TYPE=HIDDEN NAME="SCREEN" ID="SCREEN" VALUE="210">
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
                <input type="text" name="E01R02CUN" readonly size="11" maxlength="9" value="<%=gaDetail.getE01R02CUN().trim()%>">
              </div>
            </td>
            <td nowrap> 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="E01R02NA1" id="E01R02NA1" readonly size="60" maxlength="45" value="<%=gaDetail.getE01R02NA1().trim().equals("") ? curname
					: gaDetail.getE01R02NA1().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap > 
              <div align="right"><b>No. Referencia : </b></div>
            </td>
            <td nowrap>
              <input type="text" name="E01R02REF" id="E01R02REF" size="14" maxlength="12" value="<%=gaDetail.getE01R02REF().trim()%>" readonly>
            </td> 
            <td nowrap> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap> 
              <div align="left">
               <input type="text" name="E01R02CCY" id="E01R02CCY" size="4" maxlength="3" value="<%=gaDetail.getE01R02CCY().trim()%>" readonly> 
              </div>
            </td>
           </tr>
          <tr id="trdark">             
            <td nowrap> 
              <div align="right"><b>Producto :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="PRODUCT" size="38" value="<%=gaDetail.getE01R02PRD().trim()%> - <%=gaDetail.getD01R02PRD().trim()%>" readonly>                 
              </div>
            </td>
            <td nowrap> 
              <div align="right"><b>Tipo de Garantía :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="TYPE" size="38" value="<%=gaDetail.getE01R02TYP().trim()%> - <%=gaDetail.getD01R02TYP().trim()%>" readonly>                 
              </div>
            </td>
          </tr>
          <tr id="trclear">             
            <td nowrap> 
              <div align="right"><b>Secuencia Bien :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="E01R02SEQ" size="4" maxlength="4" value="<%=gaDetail.getE01R02SEQ().trim()%>" readonly> 
              </div>
            </td>
            <td nowrap> 
              <div align="right"><b>Número de Reserva :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="E01R02NRE" size="14" maxlength="12" value="<%=gaDetail.getE01R02NRE().trim()%>" readonly> 
              </div>
            </td>
          </tr>
          <tr id="trdark">             
            <td nowrap> 
              <div align="right"><b>Fondo de Garantías :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="FONDO" size="38" value="<%=gaDetail.getE01R02CFG().trim()%> - <%=gaDetail.getD01R02CFG().trim()%>" readonly>                 
              </div>
            </td>
            <td nowrap> 
              <div align="right"><b></b> </div>
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

  <h4>Informaci&oacute;n Detalle Fondo de Garantías</h4>
      
  <table class="tableinfo" width="100%">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap colspan=4> 
				<B>Reserva Aprobada :</B>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Tipo ID Ante el Fondo de Garantías : </div>
            </td>
            <td nowrap >
				<%
					if (b_read_only1 == false) {
				%>
               <eibsinput:cnofc name="gaDetail" flag="34" property="E01R02TID" fn_description="D01R02TID" required="true" readonly="true"/>
				<%
					} else {
						;
				%>
			   <eibsinput:text name="gaDetail" property="E01R02TID" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="<%=b_read_only1%>" modified="F01R02TID"/>
				<%
					}
					;
				%>
               <eibsinput:text name="gaDetail" property="D01R02TID" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true" modified="F01R02TID"/>
            </td>
            <td nowrap> 
              <div align="right">Número de Identificación : </div>
            </td>
            <td nowrap >
               <eibsinput:text name="gaDetail" property="E01R02IDF" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT %>" readonly="true" modified="F01R02IDF"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
    		  
   			  <TD nowrap  align="right">
   				Línea Crédito para Control de Cupo
	    	  </TD>
	    	  
              <td nowrap > 
                <input type="text" name="E01R02FCL" size="10" maxlength="9" value="<%= gaDetail.getE01R02FCL().trim()%>" <% if (gaDetail.getF01R02FCL().equals("Y")) out.print("class=\"txtchanged\"");%> readonly>
                <input type="text" name="E01R02FLN" size="5" maxlength="4" value="<%= gaDetail.getE01R02FLN().trim()%>" <% if (gaDetail.getF01R02FLN().equals("Y")) out.print("class=\"txtchanged\"");%> readonly>
              </td>
              
            <td nowrap> 
              <div align="right">Número de Reserva Asignado por el Fondo : </div>
            </td>
            <td nowrap >
               <eibsinput:text name="gaDetail" property="D01R02CCI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT %>" readonly="true"/>
            </td>
		    </tr>    
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Fecha de Solicitud Reserva : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R02FSY" fn_month="E01R02FSM" fn_day="E01R02FSD" required="true" readonly="true" />
            </td>
            <td nowrap> 
              <div align="right">Fecha Aprobación Reserva : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R02FAY" fn_month="E01R02FAM" fn_day="E01R02FAD" required="true" readonly="true"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Monto de la Reserva : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R02MRE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" required="true" readonly="true"/>
            </td>
            <td nowrap> 
              <div align="right">Moneda : </div>
            </td>
            <td nowrap >
 			   <eibsinput:help name="gaDetail" property="E01R02CCY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>"fn_param_one="E01R02CCY" fn_param_two="document.forms[0].E01R02BNK.value" readonly="true" />
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Destinación de Recursos : </div>
            </td>
            <td nowrap >
 				<%
 					if (b_read_only1 == false) {
 				%>
               <eibsinput:cnofc name="gaDetail" flag="X9" property="E01R02DRE" fn_description="D01R02DRE" required="false"  readonly="true"/>
				<%
					} else {
						;
				%>
			   <eibsinput:text name="gaDetail" property="E01R02DRE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" required="true" readonly="true" />
				<%
					}
					;
				%>
               <eibsinput:text name="gaDetail" property="D01R02DRE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT %>" readonly="true"/>
            </td>
            <td nowrap >
              <div align="right">Producto del Fondo : </div>
            </td>
            <td nowrap >

              <input type="text" name="E01R02PFN" size="4" maxlength="5" value="<%=gaDetail.getE01R02PFN().trim()%>" <%=read_only1%>>

 				<%
 					if (b_read_only1 == false) {
 				%>
                <a href="javascript:GetCodeDescRefCNOFC('E01R02PFN','D01R02PFN','','YA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>
				<%
					} else {
						;
				%>
			   <eibsinput:text name="gaDetail" property="E01R02PFN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" required="true" readonly="<%=b_read_only1%>" />
				<%
					}
					;
				%>
               <eibsinput:text name="gaDetail" property="D01R02PFN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Departamento Ubicación : </div>
            </td>
            <td nowrap >
 				<%
 					if (b_read_only1 == false) {
 				%>
               <eibsinput:cnofc name="gaDetail" flag="27" property="E01R02DPT" fn_description="D01R02DPT" required="true" readonly="true"/>
				<%
					} else {
						;
				%>
			   <eibsinput:text name="gaDetail" property="E01R02DPT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" required="true" readonly="<%=b_read_only1%>" />
				<%
					}
					;
				%>
               <eibsinput:text name="gaDetail" property="D01R02DPT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT %>" readonly="true"/>
            </td>
            <td nowrap >
              <div align="right">Ciudad Ubicación :</div>
            </td>
            <td nowrap >
				<input type="text" name="E01R02CTY" size="6" maxlength="5" value="<%=gaDetail.getE01R02CTY().trim()%>" readonly />
 				<%
  					if (b_read_only1 == false) {
  				%>
<%-- 
              			<a href="javascript:Get2FilterCodes('E01R02CTY','D01R02CTY','84',' ',document.forms[0].E01R02DPT.value)">
							<img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0">
						</a>
--%>
				<%
					};
				%>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
				<input type="text" name="D01R02CTY" size="30" maxlength="30" value="<%=gaDetail.getD01R02CTY().trim()%>" readonly>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Oficina Intermediaria :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01R02BRN" id="E01R02BRN" size="5" maxlength="4" value="<%= gaDetail.getE01R02BRN().trim()%>" readonly>
              <%if (read_only1.equals("")) {%> 
<%-- 
              <a href="javascript:GetBranch('E01R02BRN','E01R02BNK','D01R02BRN')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"  ></a>
--%>
			  <%} %>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
             	<eibsinput:text name="gaDetail" property="D01R02BRN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/>
            </td>
            <td nowrap >
            </td>
            <td nowrap >
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Código de Actividad Económica : </div>
            </td>
            <td nowrap >
				<%
					if (b_read_only1 == false) {
				%>
               <eibsinput:cnofc name="gaDetail" flag="S3" property="E01R02CAC" fn_description="D01R02CAC" required="true" readonly="true"/>
				<%
					} else {
						;
				%>
			   <eibsinput:text name="gaDetail" property="E01R02CAC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="true" />
				<%
					}
					;
				%>
               <eibsinput:text name="gaDetail" property="D01R02CAC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT %>" readonly="true"/>
            </td>
            <td nowrap >
              <div align="right">Nível de Activos : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R02NAC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" required="true" readonly="true"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Tipo de Cartera : </div>
            </td>
            <td nowrap >
				<%
					if (b_read_only1 == false) {
				%>
               <eibsinput:cnofc name="gaDetail" flag="9U" property="E01R02TCA" fn_description="D01R02TCA" required="true"  readonly="true"/>
				<%
					} else {
						;
				%>
			   <eibsinput:text name="gaDetail" property="E01R02TCA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="<%=b_read_only1%>" />
				<%
					}
					;
				%>
               <eibsinput:text name="gaDetail" property="D01R02TCA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT %>" readonly="true"/>
            </td>
            <td nowrap >
              <div align="right">Calificación de Riesgo : </div>
            </td>
            <td nowrap >
				<%
					if (b_read_only1 == false) {
				%>
               <eibsinput:cnofc name="gaDetail" flag="9V" property="E01R02CCR" fn_description="D01R02CCR" required="false" readonly="true"/>
				<%
					} else {
						;
				%>
			   <eibsinput:text name="gaDetail" property="E01R02CCR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="true" />
				<%
					}
					;
				%>
               <eibsinput:text name="gaDetail" property="D01R02CCR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap colspan=4> 
				<B>   </B>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Tipo de Recursos :</div>
            </td>
            <td nowrap >
                  <select name="E01R02TRC">
                    <option value=" " <%if (!(gaDetail.getE01R02TRC().equals("R")
					|| gaDetail.getE01R02TRC().equals("P") || gaDetail.getE01R02TRC().equals(" ")))
				out.print("selected");%>> 
                     </option>
                     <option value="R" <%if (gaDetail.getE01R02TRC().equals("R"))
				out.print("selected");%> <%=disabled1%>>Redescuento</option>
                     <option value="P" <%if (gaDetail.getE01R02TRC().equals("P"))
				out.print("selected");%> <%=disabled1%>>Propio</option>
                   </select>
            </td>
            <td nowrap >
            </td>
            <td nowrap >
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Valor del Avalúo del Bien dado en Leasing : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R02MAV" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" required="false" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap >
            </td>
            <td nowrap >
           </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Comentarios : </div>
            </td>
            <td nowrap >
				<TEXTAREA name="E01R02COM" rows="5" cols="55" onKeyDown="limitText(this.form.E01R02COM,200);"
				onKeyUp="limitText(this.form.E01R02COM,200);" <%=disabled1%> ><%=gaDetail.getE01R02COM().trim() %>
			    </TEXTAREA>
            </td>
            <td nowrap >
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
		<td align="center" colspan="1">
		<INPUT id="EIBSBTN" type="button" name="Cancel" value="Cancelar" onclick="goReturn()">
		</td>
	<%
		if (iopecod.equals("0005") 
			|| iopecod.equals("0006")
			|| iopecod.equals("0001")) {
	%>		
		<td align="center">
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