<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Información Detalle de Certificado de Depósito Warrant</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="gaDetail" class= "datapro.eibs.beans.ERA006601Message"  scope="session"/>
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
	type_aval = gaDetail.getD01R05TYP().trim();
%>

<SCRIPT type="text/javascript">

function initPage(){
	document.forms[0].E01R05COA.value = "<%=gaDetail.getE01R05COA().trim()%>";
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
%> <%=type_aval %> - Nuevo
<%
	} else {
%>
<%
	if (iopecod.equals("0005")) {
%><%=type_aval %> - Modificación
<%
	} else {
%>
<%
	if (iopecod.equals("0006")) {
%><%=type_aval %> - Borrar
<%
	} else {
%>
<%
	if (iopecod.equals("0004")) {
%><%=type_aval %> - Consulta
<%
	}
			}
		}
	}
%>

<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ERA0066_ga_detail_aval_H.jsp,ERA0066"></h3> 
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0050" >
<input type=HIDDEN name="E01ROCBNK" value="<%=gaDetail.getE01R05BNK().trim()%>" readonly>                 
<input type=HIDDEN name="E01R05BNK" value="<%=gaDetail.getE01R05BNK().trim()%>" readonly>                 
<input type=HIDDEN name="E01ROCREF" value="<%=gaDetail.getE01R05REF().trim()%>" readonly>                 
<input type=HIDDEN name="REF" value="<%=gaDetail.getE01R05REF().trim()%>" readonly>                 
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
              <input type="text" name="E01R05REF" id="E01R05REF" size="14" maxlength="12" value="<%=gaDetail.getE01R05REF().trim()%>" readonly>
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
            <td nowrap> 
              <div align="right">Fecha de Constitución Bien : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R05FSY" fn_month="E01R05FSM" fn_day="E01R05FSD" required="true" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap >
              <div align="right">Fecha de Vencimiento: </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R05FVY" fn_month="E01R05FVM" fn_day="E01R05FVD" required="true" readonly="<%=b_read_only1%>"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Fecha de Depósito Mercancias : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaDetail" fn_year="E01R05FCY" fn_month="E01R05FCM" fn_day="E01R05FCD" required="true" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap >
            </td>
            <td nowrap >
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Tipo de Documento (Almacenadora) : </div>
            </td>
            <td nowrap >
 				<%
 					if (b_read_only1 == false) {
 				%>
               <eibsinput:cnofc name="gaDetail" flag="GK" property="E01R05TDO" fn_description="D01R05TDO" required="true"  readonly="<%=b_read_only1%>"/>
				<%
					} else {
						;
				%>+	
			   <eibsinput:text name="gaDetail" property="E01R05TDO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" required="true" readonly="<%=b_read_only1%>" />
				<%
					}
					;
				%>
               <eibsinput:text name="gaDetail" property="D01R05TDO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT %>" readonly="true"/>
            </td>
            <td nowrap >
              <div align="right">Número de Documento : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R05NDO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" required="true" readonly="<%=b_read_only1%>"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap > 
              <div align="right">Descripción de la Mercancía : </div>
            </td>
            <td nowrap colspan=3>
				<TEXTAREA name="E01R05COM" rows="5" cols="55" value="" onKeyDown="limitText(this.form.E01R05COM,200);"
				onKeyUp="limitText(this.form.E01R05COM,200);" <%=disabled1%> >
			    </TEXTAREA>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Código de Oficina Contable : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01R05BRN" id="E01R05BRN" size="5" maxlength="4" value="<%= gaDetail.getE01R05BRN().trim()%>" <%=read_only1%>>
              <%if (read_only1.equals("")) {%> 
              <a href="javascript:GetBranch('E01R05BRN','E01ROCBNK','D01R05BRN')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"  ></a>
			  <%} %>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
             	<eibsinput:text name="gaDetail" property="D01R05BRN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/>
            </td>
            <td nowrap >
              <div align="right">Moneda : </div>
            </td>
            <td nowrap >
		      	<input type="text" name="E01R05CCE" size="4" maxlength="3" value="<%=gaDetail.getE01R05CCE()%>" <%=read_only1%>>
        		<a href="javascript:GetCurrency('E01R05CCE',document.forms[0].E01ROCBNK.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Valor Total : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R05MGA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" required="true" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap> 
              <div align="right">Tipo de Relación : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01R05TRL" size="50" maxlength="50" value="<%= gaDetail.getE01R05TRL().trim()%>" <%=read_only1%>>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Tipo de Bien o Mercancía : </div>
            </td>
            <td nowrap >
				<%
 					if (b_read_only1 == false) {
 				%>
               <eibsinput:cnofc name="gaDetail" flag="V3" property="E01R05TBM" fn_description="D01R05TBM" required="true"  readonly="<%=b_read_only1%>"/>
				<%
					} else {
						;
				%>
			   <eibsinput:text name="gaDetail" property="E01R05TBM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" required="true" readonly="<%=b_read_only1%>" />
				<%
					}
					;
				%>
               <eibsinput:text name="gaDetail" property="D01R05TBM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT %>" readonly="true"/>
            </td>
            <td nowrap> 
              <div align="right">Estatus Antiguedad :</div>
            </td>
            <td nowrap >
				<%
 					if (b_read_only1 == false) {
 				%>
               <eibsinput:cnofc name="gaDetail" flag="GR" property="E01R05SAN" fn_description="D01R05SAN" required="true"  readonly="<%=b_read_only1%>"/>
				<%
					} else {
						;
				%>
			   <eibsinput:text name="gaDetail" property="E01R05SAN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" required="true" readonly="<%=b_read_only1%>" />
				<%
					}
					;
				%>
               <eibsinput:text name="gaDetail" property="D01R05SAN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Número de Talón : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R05NTL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" required="false" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap >
              <div align="right">Ubicación Documentos Garantía :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01R05UDB" size="50" maxlength="50" value="<%= gaDetail.getE01R05UDB().trim()%>" <%=read_only1%>>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Identificación/Descripción Bien :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01R05OTP" size="50" maxlength="50" value="<%= gaDetail.getE01R05UDB().trim()%>" <%=read_only1%>>
            </td>
            <td nowrap >
              <div align="right">Tipo de Cobertura : </div>
            </td>
            <td nowrap >
 				<%
 					if (b_read_only1 == false) {
 				%>
               <eibsinput:cnofc name="gaDetail" flag="GI" property="E01R05TCO" fn_description="D01R05TCO" required="true"  readonly="<%=b_read_only1%>"/>
				<%
					} else {
						;
				%>
			   <eibsinput:text name="gaDetail" property="E01R05TCO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" required="true" readonly="<%=b_read_only1%>" />
				<%
					}
					;
				%>
               <eibsinput:text name="gaDetail" property="D01R05TCO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Ubicación Documentos Garantía :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01R05UDG" size="50" maxlength="50" value="<%= gaDetail.getE01R05UDG().trim()%>" <%=read_only1%>>
            </td>
            <td nowrap >
              <div align="right">Identificación Bien : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01R05OTP" size="50" maxlength="50" value="<%= gaDetail.getE01R05OTP().trim()%>" <%=read_only1%>>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Vinculación Operación : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R05VOP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" required="false" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap >
              <div align="right">Vinculación Garantizado : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="gaDetail" property="E01R05VGA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" required="false" readonly="<%=b_read_only1%>"/>
            </td>
          </tr>
         </table>
      </td>
    </tr>
  </table>

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

//     initPage();
</SCRIPT>



  </FORM>
 </BODY>
<SCRIPT type="text/javascript">
</SCRIPT>

 </html>