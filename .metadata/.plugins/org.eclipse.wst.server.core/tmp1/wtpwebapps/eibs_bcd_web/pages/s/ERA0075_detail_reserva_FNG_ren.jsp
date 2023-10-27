<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Renovacion/Prorroga de Reservas de Garantías FNG</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="gaDetail" class= "datapro.eibs.beans.ERA007501Message"  scope="session"/>
<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id="gaListIns" class="datapro.eibs.beans.JBListRec" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<%
	boolean b_read_only1 = false;
%>
<%
	String read_only1 = "";
%>
<%
	String disabled1 = "";
	String type_aval = "";
%>
<%
	String client = currClient != null ? currClient.getE01CUSCUN() : "";
	String curname = currClient != null ? currClient.getE01CUSNA1()
			.trim() : "";
	String iopecod = gaDetail != null ? gaDetail.getH01OPECOD().trim()
			: "";
	String oopecod = "";
	if (iopecod.equals("0007")) {
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
	if (iopecod.equals("0003") || iopecod.equals("0007") || iopecod.equals("0006")) {
		read_only1 = "readonly";
		b_read_only1 = true;
		disabled1 = "disabled";
	}
	if (userPO.getPurpose().equals("APPROVAL")) {
		read_only1 = "readonly";
		b_read_only1 = true;
		disabled1 = "disabled";
		iopecod = "0005";
	}
	if (userPO.getPurpose().equals("MAINTENANCE")) {
		iopecod = "0008";
		read_only1 = "";
		b_read_only1 = false;
		disabled1 = "";
	}
%>

<%
	if (!userPO.getPurpose().equals("NEW")) {
%>
<SCRIPT type="text/javascript">
    builtNewMenu(reser_M_opt);
    initMenu();
</SCRIPT>
<%
	}
%> 


<SCRIPT type="text/javascript">

function initPage(){
	document.forms[0].E01RESCOM.value = "<%=gaDetail.getE01RESCOM().trim()%>";

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
	function goExit() {
  		window.location.href="<%=request.getContextPath()%>/pages/background.jsp";
  	}  

function goHistMnt() {
	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESS0240?SCREEN=400&TYPE=W";
	CenterNamedWindow(page,'Information',1200,500,2);
}


</script>

</head>
<body>
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
%> Nuevo
<%
	} else {
%>
<%
	if (iopecod.equals("0008")) {
%> Renovacion/Prorroga Reservas FNG
<%
	} else {
%>
<%
	if (iopecod.equals("0006")) {
%> Borrar
<%
	} else {
%>
<%
	if (iopecod.equals("0005")) {
%> Consulta Renovacion/Prorroga Reservas FNG
<%
	}
			}
		}
	}
%>

<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ERA0075_detail_reserva_FNG_ren.jsp,ERA0075"></h3> 
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0075" >
<input type=HIDDEN name="E01RESBNK" value="<%=gaDetail.getE01RESBNK().trim()%>" readonly>                 
<input type=HIDDEN name="IOPECOD" value="<%=iopecod%>"> 
<input type=HIDDEN name="OPECOD" value="0008"> 
<INPUT TYPE=HIDDEN NAME="SCREEN" ID="SCREEN" VALUE="202">
<input type=HIDDEN name="PURPOSE" value="<%= userPO.getPurpose()%>">
<input type=HIDDEN name="AccNum" value="<%= userPO.getAccNum()%>">
<input type="hidden" name="E01RESPRR" value="P">
<input type="hidden" name="E01RESMPR" value="<%=gaDetail.getE01RESMPR().trim()%>">
                                        
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap> 
              <div align="right"><b>Número de Reserva : </b></div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01RESNRE" readonly size="14" maxlength="12" value="<%=gaDetail.getE01RESNRE().trim()%>" <% if (gaDetail.getF01RESNRE().equals("Y")) out.print("class=\"txtchanged\"");%>>
              </div>
            </td>
            <td nowrap> 
              <div align="right"><b>Garantia Asignada : </b></div>
            </td>
            <td nowrap> 
                <input type="text" name="E01RESNGA" readonly size="14" maxlength="12" value="<%=gaDetail.getE01RESNGA().trim()%>" <% if (gaDetail.getF01RESNGA().equals("Y")) out.print("class=\"txtchanged\"");%>>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap> 
              <div align="right"><b>Cliente : </b></div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <%
                 	if (gaDetail.getE01RESEST().equals("N")) {
                 %>  
                <input type="text" name="E01RESCUN" id="E01RESCUN" size="11" maxlength="9" value="<%=gaDetail.getE01RESCUN().trim().equals("0") ? client
						: gaDetail.getE01RESCUN().trim()%>" <% if (gaDetail.getF01RESCUN().equals("Y")) out.print("class=\"txtchanged\"");%>>
                <a href="javascript:GetCustomerDetails2('E01RESCUN','E01CUSNA1','E01CUSIDN','D01CUSTID')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
                <%
                	} else {
                %> 
                <input type="text" name="E01RESCUN" readonly size="11" maxlength="9" value="<%=gaDetail.getE01RESCUN().trim()%>" <% if (gaDetail.getF01RESCUN().equals("Y")) out.print("class=\"txtchanged\"");%>>
              	<%
              		}
              	%>

              </div>
            </td>
            <td nowrap> 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="E01CUSNA1" id="E01CUSNA1" readonly size="60" maxlength="45" value="<%=gaDetail.getE01CUSNA1().trim().equals("") ? curname
					: gaDetail.getE01CUSNA1().trim()%>" <% if (gaDetail.getF01CUSNA1().equals("Y")) out.print("class=\"txtchanged\"");%>>
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap > 
              <div align="right"><b>Tipo de Identificación : </b></div>
            </td>
            <td nowrap>
              <input type="text" name="D01CUSTID" id="D01CUSTID" size="4" maxlength="4" value="<%=gaDetail.getD01CUSTID().trim()%>" readonly >
            </td> 
            <td nowrap> 
              <div align="right"><b>Número : </b></div>
            </td>
            <td nowrap> 
              <div align="left">
               <input type="text" name="E01CUSIDN" id="E01CUSIDN" size="20" maxlength="20" value="<%=gaDetail.getE01CUSIDN().trim()%>" readonly> 
              </div>
            </td>
           </tr>
        </table>
      </td>
    </tr>
  </table>

  <h4>Informaci&oacute;n de la Reserva</h4>
      
  <table class="tableinfo" width="100%">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Fecha de Solicitud Reserva : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01RESFSY" fn_month="E01RESFSM" fn_day="E01RESFSD" readonly="true" modified="F01RESFSY;F01RESFSM;F01RESFSD"/>
            </td>
            <td nowrap> 
              <div align="right">Fecha Aprobación Reserva : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01RESFAY" fn_month="E01RESFAM" fn_day="E01RESFAD" readonly="true" modified="F01RESFAY;F01RESFAM;F01RESFAD"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Oficina Intermediaria :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01RESBRN" id="E01RESBRN" size="5" maxlength="4" value="<%= gaDetail.getE01RESBRN().trim()%>" readonly <% if (gaDetail.getF01RESBRN().equals("Y")) out.print("class=\"txtchanged\"");%>>
             	<eibsinput:text name="gaDetail" property="D01RESBRN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/>
            </td>
            <td nowrap >
            </td>
            <td nowrap >
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Monto de la Reserva : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01RESMRE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" modified="F01RESMRE"/>
            </td>
            <td nowrap> 
              <div align="right">Moneda : </div>
            </td>
            <td nowrap >
 			   <eibsinput:help name="gaDetail" property="E01RESCCY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>"fn_param_one="E01RESCCY" fn_param_two="document.forms[0].E01RESBNK.value" readonly="true" />
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Destino : </div>
            </td>
            <td nowrap >
 				<%
 					if (b_read_only1 == false) {
 				%>
               <eibsinput:cnofc name="gaDetail" flag="X9" property="E01RESDRE" fn_description="D01RESDRE" readonly="true"/>
				<%
					} else {
						;
				%>
			   <eibsinput:text name="gaDetail" property="E01RESDRE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="true" modified="F01RESDRE"/>
				<%
					}
					;
				%>
               <eibsinput:text name="gaDetail" property="D01RESDRE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT %>" readonly="true" modified="F01RESDRE"/>
            </td>
            <td nowrap >
              <div align="right">Producto del FNG : </div>
            </td>
            <td nowrap >
			   <eibsinput:text name="gaDetail" property="E01RESPFN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="true" />
               <eibsinput:text name="gaDetail" property="D01RESPFN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">% de Cobertura : </div>
            </td>
            <td nowrap >
              	<input type="text" name="E01RESPCO" size="8" maxlength="7" value="<%=gaDetail.getE01RESPCO().trim()%>" readonly>
            </td>
            <td nowrap >
            </td>
            <td nowrap >
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Codigo de Actividad Economica : </div>
            </td>
            <td nowrap >
				<%
					if (b_read_only1 == false) {
				%>
               <eibsinput:cnofc name="gaDetail" flag="12" property="E01RESCAC" fn_description="D01RESCAC" readonly="true" />
				<%
					} else {
						;
				%>
			   <eibsinput:text name="gaDetail" property="E01RESCAC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="true" modified="F01RESCAC"/>
				<%
					}
					;
				%>
               <eibsinput:text name="gaDetail" property="D01RESCAC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT %>" readonly="true" modified="F01RESCAC"/>
            </td>
            <td nowrap >
              <div align="right">Nivel de Activos : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01RESNAC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" modified="F01RESNAC"/>
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
               <eibsinput:cnofc name="gaDetail" flag="9U" property="E01RESTCA" fn_description="D01RESTCA" readonly="true"/>
				<%
					} else {
						;
				%>
			   <eibsinput:text name="gaDetail" property="E01RESTCA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="true" modified="F01RESTCA"/>
				<%
					}
					;
				%>
               <eibsinput:text name="gaDetail" property="D01RESTCA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT %>" readonly="true" modified="F01RESTCA"/>
            </td>
            <td nowrap >
              <div align="right">Calificación de Riesgo : </div>
            </td>
            <td nowrap >
				<%
					if (b_read_only1 == false) {
				%>
               <eibsinput:cnofc name="gaDetail" flag="9V" property="E01RESCCR" fn_description="D01RESCCR" readonly="true"/>
				<%
					} else {
						;
				%>
			   <eibsinput:text name="gaDetail" property="E01RESCCR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="true" modified="F01RESCCR"/>
				<%
					}
					;
				%>
               <eibsinput:text name="gaDetail" property="D01RESCCR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT %>" readonly="true" modified="F01RESCCR"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Número de Reserva Anterior : </div>
            </td>
            <td nowrap >
                <input type="text" name="E01RESNRA" size="14" maxlength="12" value="<%= gaDetail.getE01RESNRA().trim()%>" readonly <% if (gaDetail.getF01RESNRA().equals("Y")) out.print("class=\"txtchanged\"");%>>
            </td>
            <td nowrap >
            </td>
            <td nowrap >
            </td>
          </tr>
	</table>
	<div id="DCdt" style="display:''">
      <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap colspan=4> 
				<B>Información para Prorrogar/Renovar</B>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Número de la Obligación : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01RCLACA" id="E01RCLACA" size="14" maxlength="12" value="<%=gaDetail.getE01RCLACA().trim()%>" readonly>
            </td>
            <td nowrap >
              <div align="right">Descripción de la Obligación : </div> 
            </td>
            <td nowrap >
              <input type="text" name="D01RCLACA" id="D01RCLACA" size="50" maxlength="50" value="<%=gaDetail.getD01RCLACA().trim()%>" readonly>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Valor Desembolso de la Garantia : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01RCLAMT" id="E01RCLAMT" size="15" maxlength="15" value="<%=gaDetail.getE01RCLAMT().trim()%>" readonly>
            </td>
            <td nowrap >
              <div align="right">Saldo Actual de la Obligación : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01RCLBPE" id="E01RCLBPE" size="15" maxlength="15" value="<%=gaDetail.getE01RCLBPE().trim()%>" readonly>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Nueva Fecha de Vencimiento : </div>
            </td>
            <td nowrap >
 				<eibsinput:date name="gaDetail" fn_year="E01RESNVY" fn_month="E01RESNVM" fn_day="E01RESNVD" required="true" readonly="<%=b_read_only1%>" modified="F01RESNVY;F01RESNVM;F01RESNVD"/>
            </td>
            <td nowrap >
<%-- 
              <div align="right">Nuevo Porcentaje de Cobertura : </div>
--%>
            </td>
            <td nowrap >
<%-- 
              	<input type="text" name="E01RESNPC" size="8" maxlength="7" value="<%=gaDetail.getE01RESNPC().trim()%>" <%=read_only1%> onKeyPress="enterDecimal(event,2)">
				<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
--%>
            </td>
          </tr>
<%--
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Prórroga : </div>
            </td>
            <td nowrap> 
              <div align="right">Valor de la Prórroga : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01RESMPR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" required="true" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap >
                <input type="radio" name="CE01RESPRR" value="R" onClick="document.forms[0].E01RESPRR.value='R'"
			  <%if (gaDetail.getE01RESPRR().equals("R"))
				out.print("checked");%> <%=disabled1%>>
                Renovación
                <input type="radio" name="CE01RESPRR" value="P" onClick="document.forms[0].E01RESPRR.value='P'"
			  <%if (gaDetail.getE01RESPRR().equals("P"))
				out.print("checked");%> <%=disabled1%>>
                Prórroga
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
          </tr>
--%>
	  </table>
	</div>
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Comentarios : </div>
            </td>
            <td nowrap >
				<TEXTAREA name="E01RESCOM" rows="5" cols="55" value="" onKeyDown="limitText(this.form.E01RESCOM,200);"
				onKeyUp="limitText(this.form.E01RESCOM,200);" <%=disabled1%> <% if (gaDetail.getF01RESCOM().equals("Y")) out.print("class=\"txtchanged\"");%>>
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
  <table cellspacing=0 cellpadding=2 width="100%" border="0">
 </table>

  <table width="100%">		
	<%
				if (read_only1 == "X") {
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
		if (iopecod.equals("0008") || iopecod.equals("0004")
				|| iopecod.equals("0003")) {
		if (iopecod.equals("0003")){
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
		<INPUT id="EIBSBTN" type="button" name="Cancel" value="Cancelar" onclick="goExit()">
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
   document.forms[0].E01RESNVD.focus();

//   initPage();
</SCRIPT>



  </FORM>
 </BODY>
<SCRIPT type="text/javascript">
</SCRIPT>

 </html>