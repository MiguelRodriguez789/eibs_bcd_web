<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Liberación de Garantías</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="gaMant" class= "datapro.eibs.beans.ERA005000Message"  scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />
<jsp:useBean id= "listConst" class= "datapro.eibs.beans.JBListRec"  scope="session" /> 
<jsp:useBean id= "listGarant" class= "datapro.eibs.beans.JBListRec"  scope="session" /> 

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<%
	boolean b_read_only1 = false;
	boolean list_1 = false;
	boolean list_2 = false;
	boolean list_3 = false;
	boolean list_4 = false;
	String read_only1 = "";
	String disabled1 = "";
	String desc_type_coll = "";
	String TablaDepreciar = "";
	String client = currClient != null ? currClient.getE01CUSCUN() : "";
	String curname = currClient != null ? currClient.getE01CUSNA1()
			.trim() : "";
	
	if (userPO.getPurpose().equals("INQUIRY")) {
		b_read_only1 = true;
		read_only1 = "readonly";
		disabled1 = "disabled";
	} else if (userPO.getPurpose().equals("APPROVE")) {
		b_read_only1 = true;
		read_only1 = "readonly";
		disabled1 = "disabled";
	}
	
	if (gaMant.getE01ROCTYP().equals("D")) {
		desc_type_coll = "Otras Prendas";
	} else if (gaMant.getE01ROCTYP().equals("E")) {
		desc_type_coll = "Prenda Establecimiento de Comercio";
	} else if (gaMant.getE01ROCTYP().equals("F")) {
		desc_type_coll = "Prenda Industrial";
	} else if (gaMant.getE01ROCTYP().equals("H")) {
		desc_type_coll = "Actas De Entidades Publicas";
	} else if (gaMant.getE01ROCTYP().equals("I")) {
		desc_type_coll = "Avales Otorgados por Instituciones Financieras";
	} else if (gaMant.getE01ROCTYP().equals("J")) {
		desc_type_coll = "Avales Otorgados por Residentes en el Exterior";
	} else if (gaMant.getE01ROCTYP().equals("K")) {
		desc_type_coll = "Avales Otorgados en Moneda Extranjera por Residentes en el País";
	} else if (gaMant.getE01ROCTYP().equals("L")) {
		desc_type_coll = "Avales de la Nación";
	} else if (gaMant.getE01ROCTYP().equals("M")) {
		desc_type_coll = "Otros Avales";
	} else if (gaMant.getE01ROCTYP().equals("N")) {
		desc_type_coll = "Certificado Garantías";
	} else if (gaMant.getE01ROCTYP().equals("O")) {
		desc_type_coll = "BANCOLDEX";
	} else if (gaMant.getE01ROCTYP().equals("A")) {
		desc_type_coll = "CDT Otras Instituciones";
	} else if (gaMant.getE01ROCTYP().equals("W")) {
		desc_type_coll = "CDT Banco";
	} else if (gaMant.getE01ROCTYP().equals("0")) {
		desc_type_coll = "Bonos de Prenda";
	} else if (gaMant.getE01ROCTYP().equals("U")) {
		desc_type_coll = "Bonos";
	} else if (gaMant.getE01ROCTYP().equals("3")) {
		desc_type_coll = "Fianza Casa Matriz";
	} else if (gaMant.getE01ROCTYP().equals("Z")) {
		desc_type_coll = "Cartas de Crédito Stand By";
	} else if (gaMant.getE01ROCTYP().equals("6")) {
		desc_type_coll = "Finagro";
	} else if (gaMant.getE01ROCTYP().equals("G")) {
		desc_type_coll = "Garantía Carta Nación";
	} else if (gaMant.getE01ROCTYP().equals("2")) {
		desc_type_coll = "Endoso de Factura Cambiaria de Compraventa";
	} else if (gaMant.getE01ROCTYP().equals("C")) {
		desc_type_coll = "Depósito de Dinero en Garantía";
	}
	 
	String[] listAval1 = { "H", "I", "J", "K", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "0", "3", "Z", "6", "G", "2" };
	// Search for element in list
	for (int i = 0; i < listAval1.length; i++) {
		if (listAval1[i].equals(gaMant.getE01ROCTYP())) {
			list_1 = true;
			break;
		}
	}
	String[] listAval2 = { "H", "P", "Q", "R", "S", "T", "3", "Z"};
	// Search for element in list
	for (int i = 0; i < listAval2.length; i++) {
		if (listAval2[i].equals(gaMant.getE01ROCTYP())) {
			list_2 = true;
			break;
		}
	}
	String[] listAval3 = { "H", "I", "J", "K", "N", "O", "0", "U", "3", "G", "6" };
	// Search for element in list
	for (int i = 0; i < listAval3.length; i++) {
		if (listAval3[i].equals(gaMant.getE01ROCTYP())) {
			list_3 = true;
			break;
		}
	}
	String[] listAval4 = { "C", "W", "A" };
	// Search for element in list
	for (int i = 0; i < listAval4.length; i++) {
		if (listAval4[i].equals(gaMant.getE01ROCTYP())) {
			list_4 = true;
			break;
		}
	}
	
	if (userPO.getPurpose().equals("MAINTENANCE")) {
%>
<SCRIPT type="text/javascript">
    builtNewMenu(colla_M_opt);
    initMenu();
</SCRIPT>
<%
	} else if (userPO.getPurpose().equals("INQUIRY")) {
 %>
<SCRIPT type="text/javascript">
    builtNewMenu(colla_i_opt);
    initMenu();
</SCRIPT>
<%
	} else if (userPO.getPurpose().equals("APPROVE")) {
 %>
<SCRIPT type="text/javascript">
   
    builtNewMenu(colla_a_opt);
    initMenu();
</SCRIPT>
<%
	}
%> 

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
<h3 align="center">
Liberación de Garant&iacute;a
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ga_release.jsp, ERA0050"></h3> 
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0050" >
   <INPUT TYPE=HIDDEN NAME="SCREEN" ID="SCREEN" VALUE="750">
  	<INPUT TYPE=HIDDEN NAME="OPECOD" VALUE="0008">
   <input type="hidden" name="E01ROCBNK" id="E01ROCBNK" value="<%=gaMant.getE01ROCBNK().trim()%>" >               
   <input type="hidden" name="E01ROCBRN" id="E01ROCBRN" value="<%=gaMant.getE01ROCBRN().trim()%>" >
   <input type="hidden" name="E01ROCGLN" id="E01ROCGLN" value="<%=gaMant.getE01ROCGLN().trim()%>" >
   <input type="hidden" name="E01ROCTYP" id="E01ROCTYP" value="<%=gaMant.getE01ROCTYP().trim()%>">
   <input type="hidden" name="E01ROCDCC" id="E01ROCDCC" value="<%=gaMant.getE01ROCDCC().trim()%>" >
   <input type="hidden" name="E01ROCSTN" id="E01ROCSTN" value="<%=gaMant.getE01ROCSTN().trim()%>" >
   <input type="hidden" name="E01ROCCNL" id="E01ROCCNL" value="<%=gaMant.getE01ROCCNL().trim()%>" >
   <input type="hidden" name="E01ROCSTY" id="E01ROCSTY" value="<%=gaMant.getE01ROCSTY().trim()%>" >
   <input type="hidden" name="E01ROCSTM" id="E01ROCSTM" value="<%=gaMant.getE01ROCSTM().trim()%>" >
   <input type="hidden" name="E01ROCSTD" id="E01ROCSTD" value="<%=gaMant.getE01ROCSTD().trim()%>" >
   <input type="hidden" name="REF" id="REF" value="<%=gaMant.getE01ROCREF().trim()%>" >
   <input type="hidden" name="DSC" id="DSC" value="" >               
   <input type=HIDDEN name="E01R01SEQ" value=""> 
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
                <input type="text" name="E01ROCCUN" readonly size="11" maxlength="9" value="<%=gaMant.getE01ROCCUN().trim()%>">
              </div>
            </td>
            <td nowrap> 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="E01CUSNA1" id="E01CUSNA1" readonly size="60" maxlength="45" value="<%=gaMant.getE01CUSNA1().trim().equals("") ? curname
					: gaMant.getE01CUSNA1().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap > 
              <div align="right"><b>No. Referencia : </b></div>
            </td>
            <td nowrap>
             <%
             	if (userPO.getPurpose().equals("NEW")) {
             %> 
              <input type="hidden" name="E01ROCREF" id="E01ROCREF" size="14" maxlength="12" value="<%=gaMant.getE01ROCREF().trim()%>">
              <input type="text" name="E01ROCREF" id="TMPREF" size="14" maxlength="12" value="<%if (gaMant.getE01ROCREF().trim().equals("999999999999"))
					out.print("NUEVA CUENTA");
				else
					out.print(gaMant.getE01ROCREF().trim());%>" readonly>
              <%
              	} else {
              %> 
              <input type="text" name="E01ROCREF" id="E01ROCREF" size="14" maxlength="12" value="<%=gaMant.getE01ROCREF().trim()%>" readonly>
              <%
              	}
              %>
            </td> 
            <td nowrap> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap> 
              <div align="left">
               <input type="text" name="E01ROCCCY" id="E01ROCCCY" size="4" maxlength="3" value="<%=gaMant.getE01ROCCCY().trim()%>" readonly> 
              </div>
            </td>
           </tr>
          <tr id="trdark">             
            <td nowrap> 
              <div align="right"><b>Producto :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="PRODUCT" size="38" value="<%=gaMant.getE01ROCPRD().trim()%> - <%=gaMant.getE01ROCDPR().trim()%>" readonly>                 
                <input type="hidden" name="E01ROCPRD" size="4" maxlength="4" value="<%=gaMant.getE01ROCPRD().trim()%>" readonly> 
                <input type="hidden" name="E01ROCDPR" size="30" maxlength="30" value="<%=gaMant.getE01ROCDPR().trim()%>" readonly> 
              </div>
            </td>
            <td nowrap> 
              <div align="right"><b>Tipo de Garantía :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="TYPE" size="38" value="<%=gaMant.getE01ROCTYP().trim()%> - <%=gaMant.getE01ROCDGT().trim()%>" readonly>                 
                <input type="hidden" name="E01ROCCGT" size="4" maxlength="4" value="<%=gaMant.getE01ROCCGT().trim()%>" readonly> 
                <input type="hidden" name="E01ROCDGT" size="30" maxlength="30" value="<%=gaMant.getE01ROCDGT().trim()%>" readonly> 
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

<h4>Información del Acta de Liberación</h4>
<div>
    <table class="tableinfo">
      <tr > 
        <td >
          <table cellspacing="0" cellpadding="2" width="100%" border="0" >

   		  <tr id="trdark"> 
			<td nowrap> 
              <div align="right">Número de Acta :</div>
            </td>
            <td nowrap colspan="3">
               <input type="text" name="E01ROCRF5" size="20" maxlength="22" value="<%=gaMant.getE01ROCRF5().trim()%>" <%=read_only1%>>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
            <td nowrap> 
              <div align="right">Fecha del Acta :</div>
            </td>
            <td nowrap colspan="3">
             <eibsinput:date name="gaMant" fn_year="E01ROCNDY" fn_month="E01ROCNDM" fn_day="E01ROCNDD" readonly="<%=b_read_only1%>"/>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
          </tr>
   		  <tr id="trclear"> 
			<td nowrap> 
              <div align="right">Comité de Aprobación :</div>
            </td>
            <td nowrap colspan="3">
               <input type="text" name="E01ROCUNR" size="30" maxlength="33" value="<%=gaMant.getE01ROCUNR().trim()%>" <%=read_only1%>>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
            <td nowrap> 
              <div align="right">Banca :</div>
            </td>
            <td nowrap colspan="3">
              <input type="text" name="E01ROCSTK" size="4" maxlength="5" value="<%=gaMant.getE01ROCSTK().trim()%>" <%=read_only1%>>
              <%
              	if (read_only1.equals("")) {
              %> 
              <a href="javascript:GetCodeDescCNOFC('E01ROCSTK','D01ROCSTK','S5')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>
			  <%
			  	}
			  %>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
             	<eibsinput:text name="gaMant" property="D01ROCSTK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/>
            </td>
          </tr>
   		  <tr id="trdark"> 
			<td nowrap> 
              <div align="right">Cambiar Estado Contable :</div>
            </td>
            <td nowrap colspan="3">
               <input type="hidden" name="H01FLGWK1" value="<%=gaMant.getH01FLGWK1()%>">
               <input type="radio" name="CH01FLGWK1" value="S" onClick="document.forms[0].H01FLGWK1.value='S'"
			  <%if (gaMant.getH01FLGWK1().equals("R"))
				out.print("checked");%> <%=disabled1%>>
                Cancelar
                <input type="radio" name="CH01FLGWK1" value="N" onClick="document.forms[0].H01FLGWK1.value='N'"
			  <%if (gaMant.getH01FLGWK1().equals("N"))
				out.print("checked");%> <%=disabled1%>>
                Por Utilizar
				<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  >
            </td>
			<td nowrap> 
              <div align="right">Solicitud de Reclamación :</div>
            </td>
            <td nowrap colspan="3">
               <input type="hidden" name="E01ROCFL4" value="<%=gaMant.getE01ROCFL4()%>">
                <input type="radio" name="CE01ROCFL4" value="R" onClick="document.forms[0].E01ROCFL4.value='R'"
			  <%if (gaMant.getE01ROCFL4().equals("R"))
				out.print("checked");%> <%=disabled1%>>
                Sí
                <input type="radio" name="CE01ROCFL4" value="N" onClick="document.forms[0].E01ROCFL4.value='N'"
			  <%if (gaMant.getE01ROCFL4().equals("N"))
				out.print("checked");%> <%=disabled1%>>
                No
            </td>
          </tr>
          </table>
        </td>
      </tr>
    </table>
</div>

  <table width="100%">		
	<tr>
		<td width="100%" align="center" colspan="3">
	<%
	if (!b_read_only1) {
	%>
	  	<input class="EIBSBTN" id="EIBSBTN" type=submit name="Submit" value="Enviar">
	<%
	}else{
	%>
      <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
	<%
	}
	%>
	</td>
	</tr>
  </table>	
  </FORM>
 </BODY>
 </html>