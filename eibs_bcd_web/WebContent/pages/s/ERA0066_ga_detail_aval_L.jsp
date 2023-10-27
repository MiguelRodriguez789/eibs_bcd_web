<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Información Detalle de Avales de la Nación</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="gaDetail" class= "datapro.eibs.beans.ERA006601Message"  scope="session"/>
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
	if (gaDetail.getE01R05TYP().equals("L")) {
		type_aval ="Aval de la Nación";
	}
	if (gaDetail.getE01R05TYP().equals("M")) {
		type_aval ="Otros Avales";
	}
%>

<SCRIPT type="text/javascript">

function initPage(){
	document.forms[0].E01R05COM.value = "<%=gaDetail.getE01R05COM().trim()%>";
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
%> <%=type_aval %> - Nuevo Aval
<%
	} else {
%>
<%
	if (iopecod.equals("0005")) {
%><%=type_aval %> - Modificación Aval
<%
	} else {
%>
<%
	if (iopecod.equals("0006")) {
%><%=type_aval %> - Borrar Aval
<%
	} else {
%>
<%
	if (iopecod.equals("0004")) {
%><%=type_aval %> - Consulta Aval
<%
	}
			}
		}
	}
%>

<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ga_detail_aval_L.jsp, ERA0066"></h3> 
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0050" >
<input type=HIDDEN name="E01ROCBNK" value="<%=gaDetail.getE01R05BNK().trim()%>" readonly>                 
<input type=HIDDEN name="E01R05BNK" value="<%=gaDetail.getE01R05BNK().trim()%>" readonly>                 
<input type=HIDDEN name="E01ROCREF" value="<%=gaDetail.getE01R05REF().trim()%>" readonly>                 
<input type=HIDDEN name="EREF" value="<%=gaDetail.getE01R05REF().trim()%>" readonly>                 
<input type=HIDDEN name="SEQBIEN" value="<%=gaDetail.getE01R05SEQ().trim()%>" readonly>                 
<input type=HIDDEN name="IOPECOD" value="<%=iopecod%>"> 
<input type=HIDDEN name="OPECOD" value="<%=oopecod%>"> 
<input type=HIDDEN name="E01R05PRD" value="<%=gaDetail.getE01R05PRD().trim()%>" readonly>
<input type=HIDDEN name="D01R05PRD" value="<%=gaDetail.getD01R05PRD().trim()%>" readonly>
<input type=HIDDEN name="E01R05TYP" value="<%=gaDetail.getE01R05TYP().trim()%>" readonly>
<input type=HIDDEN name="D01R05TYP" value="<%=gaDetail.getD01R05TYP().trim()%>" readonly>
<input type=HIDDEN name="POLIZA" value="" readonly>
<INPUT TYPE=HIDDEN NAME="SCREEN" ID="SCREEN" VALUE="204">
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
                <input type="text" name="E01R05CUN" readonly size="11" maxlength="9" value="<%=gaDetail.getE01R05CUN().trim()%>">
              </div>
            </td>
            <td nowrap> 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="E01R05NA1" id="E01R05NA1" readonly size="60" maxlength="45" value="<%=gaDetail.getE01R05NA1().trim().equals("") ? curname
					: gaDetail.getE01R05NA1().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap > 
              <div align="right"><b>No. Referencia : </b></div>
            </td>
            <td nowrap>
              <input type="text" name="E01R05REF" id="E01R04REF" size="14" maxlength="12" value="<%=gaDetail.getE01R05REF().trim()%>" readonly>
            </td> 
            <td nowrap> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap> 
              <div align="left">
               <input type="text" name="E01R05CCY" id="E01R05CCY" size="4" maxlength="3" value="<%=gaDetail.getE01R05CCY().trim()%>" readonly> 
              </div>
            </td>
           </tr>
          <tr id="trdark">             
            <td nowrap> 
              <div align="right"><b>Producto :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="PRODUCT" size="38" value="<%=gaDetail.getE01R05PRD().trim()%> - <%=gaDetail.getD01R05PRD().trim()%>" readonly>                 
              </div>
            </td>
            <td nowrap> 
              <div align="right"><b>Tipo de Garantía :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="TYPE" size="38" value="<%=gaDetail.getE01R05TYP().trim()%> - <%=gaDetail.getD01R05TYP().trim()%>" readonly>                 
              </div>
            </td>
          </tr>
          <tr id="trclear">             
            <td nowrap> 
              <div align="right"><b>Secuencia Bien :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="E01R05SEQ" size="4" maxlength="4" value="<%=gaDetail.getE01R05SEQ().trim()%>" readonly> 
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

  <h4>Informaci&oacute;n Detalle del Aval</h4>
      
  <table class="tableinfo" width="100%">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">

          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Resolución : </div>
            </td>
            <td nowrap >
				<div <% if (gaDetail.getF01R05INC().equals("Y")) out.print("class=\"txtchanged\""); %>>
                <input type="hidden" name="E01R05INC" value="<%=gaDetail.getE01R05INC()%>">
                <input type="radio" name="CE01R05INC" value="C" onClick="document.forms[0].E01R05INC.value='C'"
			  <%if (gaDetail.getE01R05INC().equals("C"))
				out.print("checked");%> <%=disabled1%>>
                Copia
                <input type="radio" name="CE01R05INC" value="O" onClick="document.forms[0].E01R05INC.value='O'"
			  <%if (gaDetail.getE01R05INC().equals("O"))
				out.print("checked");%> <%=disabled1%>>
                Original
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
				</div>
            </td>
            <td nowrap> 
              <div align="right">Monto que Garantiza : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R05MGA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" required="true" readonly="<%=b_read_only1%>" modified="F01R05MGA"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Fecha de Expedición : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R05FSY" fn_month="E01R05FSM" fn_day="E01R05FSD" required="true" readonly="<%=b_read_only1%>" modified="F01R05FSY;F01R05FSM;F01R05FSD"/>
            </td>
            <td nowrap >
              <div align="right">Fecha de Vencimiento : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R05FVY" fn_month="E01R05FVM" fn_day="E01R05FVD" required="true" readonly="<%=b_read_only1%>" modified="F01R05FVY;F01R05FVM;F01R05FVD"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Número de Resolución : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01R05NRS" size="28" maxlength="25" value="<%= gaDetail.getE01R05NRS().trim()%>" <%=read_only1%> <% if (gaDetail.getF01R05NRS().equals("Y")) out.print("class=\"txtchanged\"");%>>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
            <td nowrap >
              <div align="right">Carta Aval : </div>
            </td>
            <td nowrap >
				<div <% if (gaDetail.getF01R05CAV().equals("Y")) out.print("class=\"txtchanged\""); %>>
                <input type="hidden" name="E01R05CAV" value="<%=gaDetail.getE01R05INC()%>">
                <input type="radio" name="CE01R05CAV" value="C" onClick="document.forms[0].E01R05CAV.value='C'"
			  <%if (gaDetail.getE01R05CAV().equals("C"))
				out.print("checked");%> <%=disabled1%>>
                Copia
                <input type="radio" name="CE01R05CAV" value="O" onClick="document.forms[0].E01R05CAV.value='O'"
			  <%if (gaDetail.getE01R05CAV().equals("O"))
				out.print("checked");%> <%=disabled1%>>
                Original
				</div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Número de Carta Aval : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01R05NCA" size="28" maxlength="25" value="<%= gaDetail.getE01R05NCA().trim()%>" <%=read_only1%> <% if (gaDetail.getF01R05NCA().equals("Y")) out.print("class=\"txtchanged\"");%>>
            </td>
            <td nowrap> 
              <div align="right">Fecha de la Carta  : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R05FCY" fn_month="E01R05FCM" fn_day="E01R05FCD" required="true" readonly="<%=b_read_only1%>" modified="F01R05FCY;F01R05FCM;F01R05FCD"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Valor Carta Aval : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R05MCA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" required="false" readonly="<%=b_read_only1%>" modified="F01R05MCA"/>
            </td>
            <td nowrap> 
            </td>
            <td nowrap >
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap > 
              <div align="right">Comentarios : </div>
            </td>
            <td nowrap colspan=3>
				<TEXTAREA name="E01R05COM" rows="5" cols="55" onKeyDown="limitText(this.form.E01R05COM,200);"
				onKeyUp="limitText(this.form.E01R05COM,200);" <%=disabled1%> <% if (gaDetail.getF01R05COM().equals("Y")) out.print("class=\"txtchanged\"");%>>
				<%=gaDetail.getE01R05COM().trim() %>
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