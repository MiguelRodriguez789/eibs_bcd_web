<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import="java.io.*,java.net.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*"%>

<html>
<head>
<title>Cuentas de Ahorro</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="svBasic" class="datapro.eibs.beans.EDD009801Message" scope="session" /> 
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<SCRIPT type="text/javascript">

function cancel() {
	getElement("SCREEN").value = 1;
	document.forms[0].submit();
}
 	
</SCRIPT>


</head>
<body>
<SCRIPT type="text/javascript">


//  Process according with user selection
 function goAction(op) {
	
   	switch (op){
	// Validate & Write 
  	case 1:  {
    	document.forms[0].APPROVAL.value = 'N';
       	break;
        }
	// Validate and Approve
	case 2:  {
 		document.forms[0].APPROVAL.value = 'Y';
       	break;
		}
	}
	document.forms[0].submit();
 }

 
</SCRIPT>

<%
		if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	    }
	    out.println("<SCRIPT> initMenu(); </SCRIPT>");

	    boolean protect = JSEIBSProp.getProtectedBNKBRN();
	    String blocked = "";
	    if (!currUser.getE01AUT().equals("B")) {
		blocked = "readonly disabled";
	    }
%>
<H3 align="center">Ingreso Cargos que Afectan el Acumulado Cta de Ahorro para Cobro de GMF <img
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" title="cv_basic.jsp, EDD0098"></H3>
<hr size="4">
<form method="post"
	action="<%=request.getContextPath()%>/servlet/datapro.eibs.taxes.JSEDD0098">
<INPUT TYPE=HIDDEN NAME="SCREEN"    VALUE="3"> 
<INPUT TYPE=HIDDEN NAME="INQOPT" value="N">
<INPUT TYPE=HIDDEN NAME="E01ACMATY" VALUE="<%=svBasic.getE01ACMATY().trim()%>"> 
<INPUT TYPE=HIDDEN NAME="E01ACMACD" VALUE="<%=svBasic.getE01ACMACD().trim()%>"> 
<INPUT TYPE=HIDDEN NAME="APPROVAL"  VALUE="N">

<table class="tableinfo">
	<tr bordercolor="#FFFFFF">
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0"
			class="tbhead">
			<tr id="trdark">
				<td nowrap width="16%">
				<div align="right"><b>Cliente :</b></div>
				</td>
				<td nowrap width="20%">
				<div align="left"><input type="text" name="E01ACMCUN" id="E01ACMCUN"
					size="10" maxlength="9" value="<%=svBasic.getE01ACMCUN().trim()%>" readonly></div>
				</td>
				<td nowrap width="16%">
				<div align="right"><b>Nombre :</b></div>
				</td>
				<td nowrap colspan="3">
				<div align="left"><font face="Arial"><font face="Arial"><font
					size="2"> <input type="text" name="E01CUSNA1" size="45"
					maxlength="45" value="<%=svBasic.getE01CUSNA1().trim()%>" readonly>
				</font></font></font></div>
				</td>
			</tr>
			<tr id="trdark">
				<td nowrap width="16%">
				<div align="right"><b>Cuenta :</b></div>
				</td>
				<td nowrap width="20%">
				<div align="left"><input type="text" name="E01ACMACC"
					size="13" maxlength="12"
					value="<%=svBasic.getE01ACMACC().trim()%>" readonly></div>
				</td>
				<td nowrap width="16%">
				<div align="right"><b>Moneda : </b></div>
				</td>
				<td nowrap width="16%">
				<div align="left"><b> <input type="text" name="E01DEACCY"
					size="3" maxlength="3" value="<%=svBasic.getE01ACMCCY().trim()%>"
					readonly> </b></div>
				</td>
				<td nowrap width="16%">
				<div align="right"><b>Producto : </b></div>
				</td>
				<td nowrap width="16%">
				<div align="left"><b> <input type="text" name="E01ACMPRO"
					size="4" maxlength="4" value="<%=svBasic.getE01ACMPRO().trim()%>" readonly>
				</b></div>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<H4>Datos B&aacute;sicos de la Operaci&oacute;n</H4>
<table class="tableinfo">
	<tr bordercolor="#FFFFFF">
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trclear">
				<td nowrap width="29%">
				<div align="right">Subtitulo de Cuenta:</div>
				</td>
				<td nowrap width="19%"><input type="text" name="E01ACMNME"
					size="60" maxlength="80" readonly
					value="<%=svBasic.getE01ACMNME().trim()%>"></td>
            <td nowrap width="26%"> 
              <div align="right"> </div>
            </td>
            <td nowrap width="26%"> 
              <div align="right"> </div>
            </td>
					
					<!--
				<td nowrap width="26%">
				<div align="right">C&oacute;digo Referencial:</div>
				</td>
				<td nowrap width="26%"><select name="E01ACMRCD">
					<option value=" "
						<%if (!(svBasic.getE01ACMRCD().equals("D")
		    || svBasic.getE01ACMRCD().equals("C") || svBasic
		    .getE01ACMRCD().equals("A")))
		out.print("selected");%>></option>
					<option value="D"
						<%if (svBasic.getE01ACMRCD().equals("D"))
		out.print("selected");%>>D&eacute;bitos</option>
					<option value="C"
						<%if (svBasic.getE01ACMRCD().equals("C"))
		out.print("selected");%>>Cr&eacute;ditos</option>
					<option value="A"
						<%if (svBasic.getE01ACMRCD().equals("A"))
		out.print("selected");%>>Ambos</option>
				</select></td>
			-->
			</tr>
			<tr id="trdark">
				<td nowrap width="29%">
				   <div align="right">Fecha de Apertura:</div>
				</td>
                <td width="19%" align="left">
                   <eibsinput:date name="svBasic" fn_year="E01ACMOPY" fn_month="E01ACMOPM" fn_day="E01ACMOPD" readonly="true" /> 
                  
               </td>
				<td nowrap width="26%">
				<div align="right">Fecha de Ingreso:</div>
				</td>
                <td width="26%" align="left">
                   <eibsinput:date name="svBasic" fn_year="E01ACMSUY" fn_month="E01ACMSUM" fn_day="E01ACMSUD" readonly="true" /> 
                  
               </td>
			</tr>
			<tr id="trclear">


				<td nowrap width="29%" height="19">
				<div align="right">Banco/Sucursal :</div>
				</td>
				<td nowrap>
				<%
				if (!protect && svBasic.getH01FLGMAS().equals("N")) {
				%> <input
					type="text" name="E01ACMBNK" size="2" maxlength="2"
					value="<%=svBasic.getE01ACMBNK().trim()%>"> <input
					type="text" name="E01ACMBRN" size="5" maxlength="4"
					value="<%=svBasic.getE01ACMBRN().trim()%>"> <a
					href="javascript:GetBranch('E01ACMBRN','')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"
					align="bottom" border="0"></a> <%
 } else {
 %> <input type="text"
					name="E01ACMBNK" size="2" maxlength="2"
					value="<%=svBasic.getE01ACMBNK().trim()%>" readonly> <input
					type="text" name="E01ACMBRN" size="5" maxlength="4"
					value="<%=svBasic.getE01ACMBRN().trim()%>" readonly> <%
 }
 %>
				</td>


			</tr>

		</table>
		</td>
	</tr>
</table>



<H4>Ingreso Impuesto GMF</H4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
       <td nowrap> 
         <table cellspacing="0" cellpadding="2" width="100%" border="0">
           <tr id="trdark"> 
            <% if (currUser.getE01INT().equals("05")) {%> 
			   <tr id="trclear">
				<td nowrap width="25%">
				<div align="right">Valor del Impuesto:</div>
				</td>
				<td nowrap width="25%">
					<input type="text" name="E01ACMAMA" size="18" maxlength="16" value="<%=svBasic.getE01ACMAMA().trim()%>"  onKeypress="enterDecimal(event, 2)">
					<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0">
				</td>
				<td nowrap width="25%">
				<div align="right">D/C:</div>
				<td nowrap width="25%">
				<input type="text" name="E01ACMDCC" size="2" maxlength="1" value="<%=svBasic.getE01ACMDCC().trim()%>"  >
				<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0">
				</td>												
				<td nowrap width="25%">
				<div align="right">Descripcion:</div>
				<td nowrap width="25%">
				<input type="text" name="E01ACMTDS" size="61" maxlength="60" value="<%=svBasic.getE01ACMTDS().trim()%>"  >
				<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0">
				</td>
			</tr>              
			              
            <%}%> 
            
               
          
        </table>
      </td>
    </tr>
</table>

 
  <table class="tbenter" >
	<tr > 
	  <td width="25%"></td> 
	  <td width="25%" align="center"><input id="EIBSBTN" type=submit name="Submit" value="Enviar"></td>
	  <td width="25%" align="center"><input id="EIBSBTN" type="button" name="Cancel" value="Cancelar" onclick="cancel()"></td>
	  <td width="25%"></td>
    </tr>
  </table>

</form>
</body>


</html>
 
