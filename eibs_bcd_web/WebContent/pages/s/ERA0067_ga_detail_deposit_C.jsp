<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Información Detalle de Depósito de Dinero en Garantía</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="gaDetail" class= "datapro.eibs.beans.ERA006701Message"  scope="session"/>
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
	if (gaDetail.getE01R06TYP().equals("C")) {
		type_aval ="Depósito de Dinero en Garantía";
	}
%>

<SCRIPT type="text/javascript">

function initPage(){
	document.forms[0].E01R06COM.value = "<%=gaDetail.getE01R06COM().trim()%>";
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
%> <%=type_aval %> - Nueva Garantía
<%
	} else if (iopecod.equals("0005")) {
%><%=type_aval %> - Modificación Garantía
<%
	} else if (iopecod.equals("0006")) {
%><%=type_aval %> - Borrar Garantía
<%
	} else if (iopecod.equals("0004")) {
%><%=type_aval %> - Consulta Garantía
<%
	}
%>

<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ga_detail_deposit_C.jsp, ERA0067"></h3> 
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0050" >
<input type=HIDDEN name="E01ROCBNK" value="<%=gaDetail.getE01R06BNK().trim()%>" readonly>                 
<input type=HIDDEN name="E01R06BNK" value="<%=gaDetail.getE01R06BNK().trim()%>" readonly>                 
<input type=HIDDEN name="E01ROCREF" value="<%=gaDetail.getE01R06REF().trim()%>" readonly>                 
<input type=HIDDEN name="REF" value="<%=gaDetail.getE01R06REF().trim()%>" readonly>                 
<input type=HIDDEN name="SEQBIEN" value="<%=gaDetail.getE01R06SEQ().trim()%>" readonly>                 
<input type=HIDDEN name="IOPECOD" value="<%=iopecod%>"> 
<input type=HIDDEN name="OPECOD" value="<%=oopecod%>"> 
<input type=HIDDEN name="E01R06PRD" value="<%=gaDetail.getE01R06PRD().trim()%>" readonly>
<input type=HIDDEN name="D01R06PRD" value="<%=gaDetail.getD01R06PRD().trim()%>" readonly>
<input type=HIDDEN name="E01R06TYP" value="<%=gaDetail.getE01R06TYP().trim()%>" readonly>
<input type=HIDDEN name="D01R06TYP" value="<%=gaDetail.getD01R06TYP().trim()%>" readonly>
<input type=HIDDEN name="E01ROCRGK" value="<%=gaDetail.getH01FLGWK1().trim()%>" >   
<input type=HIDDEN name="POLIZA" value="" readonly>
<INPUT TYPE=HIDDEN NAME="SCREEN" ID="SCREEN" VALUE="205">
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
                <input type="text" name="E01R06CUN" readonly size="11" maxlength="9" value="<%=gaDetail.getE01R06CUN().trim()%>">
              </div>
            </td>
            <td nowrap> 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="E01R06NA1" id="E01R06NA1" readonly size="60" maxlength="45" value="<%=gaDetail.getE01R06NA1().trim().equals("") ? curname
					: gaDetail.getE01R06NA1().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap > 
              <div align="right"><b>No. Referencia : </b></div>
            </td>
            <td nowrap>
              <input type="text" name="E01R06REF" id="E01R06REF" size="14" maxlength="12" value="<%=gaDetail.getE01R06REF().trim()%>" readonly>
            </td> 
            <td nowrap> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap> 
              <div align="left">
               <input type="text" name="E01R06CCY" id="E01R06CCY" size="4" maxlength="3" value="<%=gaDetail.getE01R06CCY().trim()%>" readonly> 
              </div>
            </td>
           </tr>
          <tr id="trdark">             
            <td nowrap> 
              <div align="right"><b>Producto :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="PRODUCT" size="38" value="<%=gaDetail.getE01R06PRD().trim()%> - <%=gaDetail.getD01R06PRD().trim()%>" readonly>                 
              </div>
            </td>
            <td nowrap> 
              <div align="right"><b>Tipo de Garantía :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="TYPE" size="38" value="<%=gaDetail.getE01R06TYP().trim()%> - <%=gaDetail.getD01R06TYP().trim()%>" readonly>                 
              </div>
            </td>
          </tr>
          <tr id="trclear">             
            <td nowrap> 
              <div align="right"><b>Secuencia Bien :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="E01R05SEQ" size="4" maxlength="4" value="<%=gaDetail.getE01R06SEQ().trim()%>" readonly> 
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

  <h4>Informaci&oacute;n Detalle Depósito de Dinero en Garantía</h4>
      
  <table class="tableinfo" width="100%">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap colspan=4> 
				<B>Instrucciones de Depósito en Garantía</B>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Suscrito por : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01R06SUS" size="55" maxlength="50" value="<%= gaDetail.getE01R06SUS().trim()%>" <%=read_only1%> <% if (gaDetail.getF01R06SUS().equals("Y")) out.print("class=\"txtchanged\"");%>>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
            <td nowrap> 
            </td>
            <td nowrap >
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Fecha de Suscripción : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R06FSY" fn_month="E01R06FSM" fn_day="E01R06FSD" required="true" readonly="<%=b_read_only1%>" modified="F01R06FSY;F01R06FSM;F01R06FSD"/>
            </td>
            <td nowrap >
            </td>
            <td nowrap >
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Número de la Cuenta : </div>
            </td>
            <td nowrap >
                <input type="text" name="E01R06ACC" size="16" maxlength="16" value="<%= gaDetail.getE01R06ACC().trim()%>" <% if (gaDetail.getF01R06ACC().equals("Y")) out.print("class=\"txtchanged\"");%>>
		        <a href="javascript:GetAccount('E01R06ACC','','RT','<%=gaDetail.getE01R06CUN().trim()%>')">
		        <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>     
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
            <td nowrap> 
              <div align="right">Valor : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R06MGA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" required="true" readonly="<%=b_read_only1%>" modified="F01R06MGA"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Certificado de Camara de Comercio : </div>
            </td>
            <td nowrap >
				<div <% if (gaDetail.getF01R06CCC().equals("Y")) out.print("class=\"txtchanged\""); %>>
                <input type="hidden" name="E01R06CCC" value="<%=gaDetail.getE01R06CCC()%>">
                <input type="radio" name="CE01R06CCC" value="S" onClick="document.forms[0].E01R06CCC.value='S'"
			  <%if (gaDetail.getE01R06CCC().equals("S"))
				out.print("checked");%> <%=disabled1%>>
                Si
                <input type="radio" name="CE01R06CCC" value="N" onClick="document.forms[0].E01R06CCC.value='N'"
			  <%if (gaDetail.getE01R06CCC().equals("N"))
				out.print("checked");%> <%=disabled1%>>
                No
				</div>
            </td>
            <td nowrap >
             <div align="right">Motivo : </div>
            </td>
            <td nowrap >
 				<%
 					if (!b_read_only1) {
 				%>
               <eibsinput:cnofc name="gaDetail" flag="51" property="E01R06MOT" fn_description="D01R06MOT" required="true"  readonly="<%=b_read_only1%>"/>
				<%
					} else {
				%>
			   <eibsinput:text name="gaDetail" property="E01R06MOT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" required="true" readonly="<%=b_read_only1%>" modified="F01R06MOT"/>
				<%
					}
				%>
               <eibsinput:text name="gaDetail" property="D01R06MOT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT %>" readonly="true" modified="F01R06MOT"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap colspan=4> 
				<B>Informe de la Cuenta</B>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Producto : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01R06CPR" size="6" maxlength="4" value="<%= gaDetail.getE01R06CPR().trim()%>" readonly <% if (gaDetail.getF01R06CPR().equals("Y")) out.print("class=\"txtchanged\"");%>>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
              <input type="text" name="D01R06CPR" size="30" maxlength="30" value="<%= gaDetail.getD01R06CPR().trim()%>" <%=read_only1%> <% if (gaDetail.getF01R06CPR().equals("Y")) out.print("class=\"txtchanged\"");%>>
            </td>
            <td nowrap >
              <div align="right">Fecha de Corte : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R06FCY" fn_month="E01R06FCM" fn_day="E01R06FCD" required="false" readonly="<%=b_read_only1%>" modified="F01R06FCY;F01R06FCM;F01R06FCD"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Saldo Cuenta : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R06BLC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" required="false" readonly="true" modified="F01R06BLC"/>
            </td>
            <td nowrap >
            </td>
            <td nowrap >
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap colspan=4> 
				<B>Documentos Anexos</B>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Contrato de Depósito en Garantía : </div>
            </td>
            <td nowrap >
				<div <% if (gaDetail.getF01R06CDG().equals("Y")) out.print("class=\"txtchanged\""); %>>
                <input type="hidden" name="E01R06CDG" value="<%=gaDetail.getE01R06CDG()%>">
                <input type="radio" name="CE01R06CDG" value="C" onClick="document.forms[0].E01R06CDG.value='C'"
			  <%if (gaDetail.getE01R06CDG().equals("C"))
				out.print("checked");%> <%=disabled1%>>
                Copia
                <input type="radio" name="CE01R06CDG" value="O" onClick="document.forms[0].E01R06CDG.value='O'"
			  <%if (gaDetail.getE01R06CDG().equals("O"))
				out.print("checked");%> <%=disabled1%>>
                Original
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
				</div>
            </td>
            <td nowrap> 
              <div align="right">Documentos Adicionales : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01R06DOA" size="55" maxlength="50" value="<%= gaDetail.getE01R06DOA().trim()%>" <%=read_only1%> <% if (gaDetail.getF01R06DOA().equals("Y")) out.print("class=\"txtchanged\"");%>>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap > 
              <div align="right">Observaciones : </div>
            </td>
            <td nowrap colspan=3>
				<TEXTAREA name="E01R06COM" rows="5" cols="55" onKeyDown="limitText(this.form.E01R06COM,200);"
				onKeyUp="limitText(this.form.E01R06COM,200);" <%=disabled1%> <% if (gaDetail.getF01R06COM().equals("Y")) out.print("class=\"txtchanged\"");%>>
				<%=gaDetail.getE01R06COM().trim() %>
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