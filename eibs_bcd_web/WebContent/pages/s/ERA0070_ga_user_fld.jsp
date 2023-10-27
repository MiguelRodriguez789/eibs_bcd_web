<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<html>
<head>
<title>Detalle Definición Campos de Usuario</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "gaDetail" class= "datapro.eibs.beans.ERA007001Message"  scope="session"/>
<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "collList" class= "datapro.eibs.beans.JBObjList"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>


<%
	boolean b_read_only1 = false;
	String read_only1 = "";
	String disabled1 = "";
	
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
	if (userPO.getPurpose().equals("INQUIRY")) {
		b_read_only1 = true;
		read_only1 = "readonly";
		disabled1 = "disabled";
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
	int row;
	try {
		row = Integer.parseInt(request.getParameter("ROW"));
	} catch (Exception e) {
		row = -1;
	}
%>

<H3 align="center">Definición Campos de Usuario
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ga_user_fld.jsp, ERA0070"></H3> 
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0070" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" ID="SCREEN" VALUE="202">
  <input type=HIDDEN name="IOPECOD" value="<%=iopecod%>"> 
  <input type=HIDDEN name="OPECOD" value="<%=oopecod%>"> 
  <input type=hidden name="ROW" value="<%=row%>">
  <input type=hidden name="E01TBLTYP" value="<%=gaDetail.getE01TBLTYP().trim()%>" >                 
  <input type=hidden name="E01TBLCDE" value="<%=gaDetail.getE01TBLCDE().trim()%>" >                 
  
<%
	String readonly = row >= 0 ? "readonly" : "";
%>
                        
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
           <tr id="trdark">             
            <td nowrap> 
              <div align="right"><b>Producto :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="PRODUCT" size="38" value="<%=gaDetail.getE01TBLCDE().trim()%> - <%=gaDetail.getD01TBLCDE().trim()%>" readonly>                 
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
  
  <div>
   <h4>Definición Campos de Usuario para este Producto</h4>
   <table class="tableinfo">
    <tr > 
      <td nowrap>
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark" <%row++;%>"> 
            <td nowrap width="25%" align="center">
                 <h4>Tipo de Campo</h4>
            </td>
            <td nowrap width="25%"  align="center"> 
                 <h4>Etiqueta</h4>
            </td>
            <td nowrap width="25%" align="center">
				<h4>Obligatorio</h4>
            </td>
            <td nowrap width="25%" align="center"> 
				<h4>Campo</h4>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap  >
                 <div align="right">Campo 1. 50 Caracteres Alfanuméricos :</div>
            </td>
            <td nowrap> 
              	<eibsinput:text name="gaDetail" property="E01TBLLB1" size="40" readonly="<%=b_read_only1%>" style="text-transform: none;"/>
            </td>
            <td nowrap align="left">
				<input type="radio" name="E01TBLCK1" value="1" <%if(gaDetail.getE01TBLCK1().equals("1")) out.print("checked");%> <%=disabled1%>>
				Sí 
				<input type="radio" name="E01TBLCK1" value="0" <%if(gaDetail.getE01TBLCK1().equals("0")) out.print("checked");%> <%=disabled1%>>
    			No
            </td>
            <td nowrap> 
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap  >
                 <div align="right">Campo 2. 50 Caracteres Alfanuméricos :</div>
            </td>
            <td nowrap> 
              	<eibsinput:text name="gaDetail" property="E01TBLLB2" size="40" readonly="<%=b_read_only1%>" style="text-transform: none;"/>
            </td>
            <td nowrap align="left">
				<input type="radio" name="E01TBLCK2" value="1" <%if(gaDetail.getE01TBLCK2().equals("1")) out.print("checked");%> <%=disabled1%>>
				Sí 
				<input type="radio" name="E01TBLCK2" value="0" <%if(gaDetail.getE01TBLCK2().equals("0")) out.print("checked");%> <%=disabled1%>>
    			No
            </td>
            <td nowrap> 
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap  >
                 <div align="right">Campo 3. 17.2 Monto numérico :</div>
            </td>
            <td nowrap> 
              	<eibsinput:text name="gaDetail" property="E01TBLLB3" size="40" readonly="<%=b_read_only1%>" style="text-transform: none;"/>
            </td>
            <td nowrap align="left">
				<input type="radio" name="E01TBLCK3" value="1" <%if(gaDetail.getE01TBLCK3().equals("1")) out.print("checked");%> <%=disabled1%>>
				Sí 
				<input type="radio" name="E01TBLCK3" value="0" <%if(gaDetail.getE01TBLCK3().equals("0")) out.print("checked");%> <%=disabled1%>>
    			No
            </td>
            <td nowrap> 
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap  >
                 <div align="right">Campo 4. 17.2 Monto numérico :</div>
            </td>
            <td nowrap> 
              	<eibsinput:text name="gaDetail" property="E01TBLLB4" size="40" readonly="<%=b_read_only1%>" style="text-transform: none;"/>
            </td>
            <td nowrap align="left">
				<input type="radio" name="E01TBLCK4" value="1" <%if(gaDetail.getE01TBLCK4().equals("1")) out.print("checked");%> <%=disabled1%>>
				Sí 
				<input type="radio" name="E01TBLCK4" value="0" <%if(gaDetail.getE01TBLCK4().equals("0")) out.print("checked");%> <%=disabled1%>>
    			No
            </td>
            <td nowrap> 
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap  >
                 <div align="right">Campo 5. 2 Codigo de Tabla :</div>
            </td>
            <td nowrap> 
              	<eibsinput:text name="gaDetail" property="E01TBLLB5" size="40" readonly="<%=b_read_only1%>" style="text-transform: none;"/>
            </td>
            <td nowrap align="left">
				<input type="radio" name="E01TBLCK5" value="1" <%if(gaDetail.getE01TBLCK5().equals("1")) out.print("checked");%> <%=disabled1%>>
				Sí 
				<input type="radio" name="E01TBLCK5" value="0" <%if(gaDetail.getE01TBLCK5().equals("0")) out.print("checked");%> <%=disabled1%>>
    			No
            </td>
            <td nowrap> 
				<input type="text" id="E01TBLTB1" name="E01TBLTB1" maxlength="2" size="3" 
					value="<%= gaDetail.getE01TBLTB1() %>" class="txtright" readonly onchange="updateField5()">
				<a id="linkHelp" href="javascript:GetCNOFTables('E01TBLTB1','D01TBLTB1')">
				<img src="<%= request.getContextPath() %>/images/1b.gif" align="bottom" border="0"/></a>
                 <INPUT type="text" readonly name="D01TBLTB1" size="35"  value="<%=gaDetail.getD01TBLTB1().trim()%>" readonly>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap  >
                 <div align="right">Campo 6. 2 Codigo de Tabla :</div>
            </td>
            <td nowrap> 
              	<eibsinput:text name="gaDetail" property="E01TBLLB6" size="40" readonly="<%=b_read_only1%>" style="text-transform: none;"/>
            </td>
            <td nowrap align="left">
				<input type="radio" name="E01TBLCK6" value="1" <%if(gaDetail.getE01TBLCK6().equals("1")) out.print("checked");%> <%=disabled1%>>
				Sí 
				<input type="radio" name="E01TBLCK6" value="0" <%if(gaDetail.getE01TBLCK6().equals("0")) out.print("checked");%> <%=disabled1%>>
    			No
            </td>
            <td nowrap> 
				<input type="text" id="E01TBLTB2" name="E01TBLTB2" maxlength="2" size="3" 
					value="<%= gaDetail.getE01TBLTB2() %>" class="txtright" readonly onchange="updateField6()">
				<a id="linkHelp" href="javascript:GetCNOFTables('E01TBLTB2','D01TBLTB2')">
				<img src="<%= request.getContextPath() %>/images/1b.gif" align="bottom" border="0"/></a>
                 <INPUT type="text" readonly name="D01TBLTB2" size="35" value="<%=gaDetail.getD01TBLTB2().trim()%>" readonly>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap  >
                 <div align="right">Campo 7. Fecha :</div>
            </td>
            <td nowrap> 
              	<eibsinput:text name="gaDetail" property="E01TBLLB7" size="40" readonly="<%=b_read_only1%>" style="text-transform: none;"/>
            </td>
            <td nowrap>
				<input type="radio" name="E01TBLCK7" value="1" <%if(gaDetail.getE01TBLCK7().equals("1")) out.print("checked");%> <%=disabled1%>>
				Sí 
				<input type="radio" name="E01TBLCK7" value="0" <%if(gaDetail.getE01TBLCK7().equals("0")) out.print("checked");%> <%=disabled1%>>
    			No
            </td>
            <td nowrap> 
                 <INPUT type="text" readonly name="E01FLDUS71" size="3" maxlength="2" value="" readonly>
                 <INPUT type="text" readonly name="E01FLDUS72" size="3" maxlength="2" value="" readonly >
                 <INPUT type="text" readonly name="E01FLDUS73" size="5" maxlength="4" value="" readonly>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap  >
                 <div align="right">Campo 8. Fecha :</div>
            </td>
            <td nowrap> 
              	<eibsinput:text name="gaDetail" property="E01TBLLB8" size="40" readonly="<%=b_read_only1%>" style="text-transform: none;"/>
            </td>
            <td nowrap align="left">
				<input type="radio" name="E01TBLCK8" value="1" <%if(gaDetail.getE01TBLCK8().equals("1")) out.print("checked");%> <%=disabled1%>>
				Sí 
				<input type="radio" name="E01TBLCK8" value="0" <%if(gaDetail.getE01TBLCK8().equals("0")) out.print("checked");%> <%=disabled1%>>
    			No
            </td>
            <td nowrap> 
                 <INPUT type="text" readonly name="E01FLDUS81" size="3" maxlength="2" value="" readonly> 
                 <INPUT type="text" readonly name="E01FLDUS82" size="3" maxlength="2" value="" readonly>
                 <INPUT type="text" readonly name="E01FLDUS83" size="5" maxlength="4" value="" readonly>
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
		} else {
	%>
		<INPUT id="EIBSBTN" type="button" name="Cancel" value="Cancelar" onclick="top.close()">
	<%
		}
	%>
	</td>
    </tr>

  </table>
  
</form>

<script type="text/javascript">
	function updateField5() {
		getElement("E01TBLLB5").value = getElement("D01TBLTB1").value;
	}
	function updateField6() {
		getElement("E01TBLLB6").value = getElement("D01TBLTB2").value;
	}
</script>

</body>
</html>
