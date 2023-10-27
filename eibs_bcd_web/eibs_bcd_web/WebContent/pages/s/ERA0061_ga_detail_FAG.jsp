<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Información Detalle de Garantias Fondo Agropecuario de Garantías </title>
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
	if (gaDetail.getE01R02TYP().equals("X")) {
		type_aval ="Garantías Fondo Agropecuario de Garantías";
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
   document.forms[0].E01R02NPG.focus();
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

<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ga_detail_FAG.jsp, ERA0061"></h3> 
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

  <h4>Informaci&oacute;n Detalle Garantía FAG</h4>
      
  <table class="tableinfo" width="100%">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Numero de Pagare : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01R02NPG" id="E01R02NPG" size="14" maxlength="12" value="<%=gaDetail.getE01R02NPG().trim()%>" <%=read_only1%> onKeyPress="enterInteger(event)">
            </td>
            <td nowrap> 
              <div align="right">Saldo Redescuento :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01R02SRD" id="E01R02SRD" size="15" maxlength="12" value="<%= gaDetail.getE01R02SRD().trim()%>" readonly>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Fecha Inicial del Credito : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R02FSY" fn_month="E01R02FSM" fn_day="E01R02FSD" required="false" readonly="true" />
            </td>
            <td nowrap> 
              <div align="right">Fecha de Vencimiento : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R02FVY" fn_month="E01R02FVM" fn_day="E01R02FVD" required="false" readonly="true"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Lineas Especiales : </div>
            </td>
            <td nowrap >
 				<%
 					if (!b_read_only1) {
 				%>
               <eibsinput:cnofc name="gaDetail" flag="XK" property="E01R02US1" fn_description="D01R02US1" required="true"  readonly="<%=b_read_only1%>"/>
				<%
					} else {
				%>
			   <eibsinput:text name="gaDetail" property="E01R02US1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" required="true" readonly="<%=b_read_only1%>" />
				<%
					}
				%>
               <eibsinput:text name="gaDetail" property="D01R02US1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT %>" readonly="true"/>
            </td>
            <td nowrap >
            </td>
            <td nowrap >
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Valor Inicial de la Garantia : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R02MIG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" required="true" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap >
              <div align="right">Cuenta   de Cobro : </div>
           </td>
            <td nowrap >
             <INPUT type="text" name="E01R02DCC" size="30" maxlength="30" value="<%=gaDetail.getE01R02DCC().trim()%>" >
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Plazo/Término : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01R02BRN" id="E01R02BRN" size="5" maxlength="4" value="<%=gaDetail.getE01R02BRN().trim()%>" <%=read_only1%> onKeyPress="enterDecimal(event,0)">
			<select name="E01R02CLG">
			<option value=""
			<%if (gaDetail.getE01R02CLG().equals("")) {
			out.print("selected");
			}%>></option>
				<option value="D"
				<%if (gaDetail.getE01R02CLG().equals("D")) {
				out.print("selected");
			}%>>Días</option>
				<option value="M"
				<%if (gaDetail.getE01R02CLG().equals("M")) {
				out.print("selected");
			}%>>Meses</option>
				<option value="Y"
				<%if (gaDetail.getE01R02CLG().equals("Y")) {
				out.print("selected");
			}%>>Años</option>
				</select>
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