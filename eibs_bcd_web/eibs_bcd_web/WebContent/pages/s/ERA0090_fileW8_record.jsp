<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Archivos de Interface para enviar a Credismart</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id= "recW8" class= "datapro.eibs.beans.ERA009006Message"  scope="session"/>
<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "collList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<%
	boolean b_read_only1 = false;
	boolean b_warning = false;
	boolean b_read_onlyAlw = true;
%>
<%
	String read_only1 = "";
%>
<%
	String disabled1 = "";
	String type_aval = "";
%>
<%
	String read_only_mnt = "readonly style='background-color:#F2F1F1'";
	String client = currClient != null ? currClient.getE01CUSCUN() : "";
	String curname = currClient != null ? currClient.getE01CUSNA1()
			.trim() : "";
	String iopecod = recW8 != null ? recW8.getH06OPECOD().trim() : "";
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
%>

</head>
<BODY>
<script type="text/javascript">
  function goExit(){
     window.location.href="<%=request.getContextPath()%>/pages/background.jsp";

  }


</SCRIPT>  

<h3 align="center">Mantenimiento Registro Tabla Garantias Interface Datos para CREDISMART 
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="fileW8_record,ERA0090"></h3>

<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0090">
  <p> 
    <INPUT TYPE=HIDDEN NAME="CURRENTROW" id="CURRENTROW" VALUE="0"> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="110">
    <input type=HIDDEN name="opt" id="opt" >
	<input type=HIDDEN name="OPECOD" value="<%=oopecod%>"> 
  </p>

<% 
String chk = "";

 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%> 
<%
 	int row = 0;
%>
<table class="tableinfo">
    <tr > 
      <td nowrap> 
      <table cellspacing=0 cellpadding=2 width="100%" border="0">
      <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Número de Item : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="recW8" property="E06RW8ITE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" required="false" readonly="true"/>
            </td>
            <td nowrap >
            </td>
            <td nowrap >
          </td>
      </tr>
       <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Fecha de Corte : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="recW8" property="E06RW8RUN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_COST_CENTER%>" required="false" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap >
              <div align="right">Fecha Constitución : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="recW8" property="E06RW8FCO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_COST_CENTER%>" required="false" readonly="<%=b_read_only1%>"/>
            </td>
       </tr>
       <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Fecha Vencimiento : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="recW8" property="E06RW8FVT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_COST_CENTER%>" required="false" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap >
              <div align="right">Fecha Avalúo : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="recW8" property="E06RW8FVA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_COST_CENTER%>" required="false" readonly="<%=b_read_only1%>"/>
            </td>
       </tr>
       <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Fecha Registro Notaría : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="recW8" property="E06RW8FRE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_COST_CENTER%>" required="false" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap >
              <div align="right">Número Matrícula : </div>
            </td>
            <td nowrap >
              <input type="text" name="E06RW8MAT" size="50" maxlength="50" value="<%=recW8.getE06RW8MAT().trim()%>" <%=read_only1%>><br>
            </td>
       </tr>
       <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Número Folio Matrícula : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="recW8" property="E06RW8FOL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BATCH%>" required="false" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap >
              <div align="right">Número Escritura : </div>
            </td>
            <td nowrap >
              <input type="text" name="E06RW8ESC" size="10" maxlength="9" value="<%=recW8.getE06RW8ESC().trim()%>" <%=read_only1%>><br>
            </td>
       </tr>
       <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Número Notaría : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="recW8" property="E06RW8NOT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BATCH%>" required="false" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap >
              <div align="right">Grado : </div>
            </td>
            <td nowrap >
              <input type="text" name="E06RW8GRA" size="50" maxlength="100" value="<%=recW8.getE06RW8GRA().trim()%>" <%=read_only1%>><br>
            </td>
       </tr>
       <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Límite : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="recW8" property="E06RW8LIM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_FLAG%>" required="false" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap >
              <div align="right">Ciudad : </div>
            </td>
            <td nowrap >
              <input type="text" name="E06RW8CIU" size="50" maxlength="100" value="<%=recW8.getE06RW8CIU().trim()%>" <%=read_only1%>><br>
            </td>
       </tr>
       <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Tenencia : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="recW8" property="E06RW8TEN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_FLAG%>" required="false" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap >
              <div align="right">Tipo de Garantía : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="recW8" property="E06RW8TIP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" required="false" readonly="<%=b_read_only1%>"/>
            </td>
       </tr>
       <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Sub-Tipo de Garantía : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="recW8" property="E06RW8SUB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" required="false" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap >
              <div align="right">Seguro : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="recW8" property="E06RW8SEG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_FLAG%>" required="false" readonly="<%=b_read_only1%>"/>
            </td>
       </tr>
       <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Compañía de Seguros : </div>
            </td>
            <td nowrap >
              <input type="text" name="E06RW8CIA" size="50" maxlength="100" value="<%=recW8.getE06RW8CIA().trim()%>" <%=read_only1%>><br>
            </td>
            <td nowrap >
              <div align="right">Fecha Vencimiento Seguro : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="recW8" property="E06RW8VTS" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_COST_CENTER%>" required="false" readonly="<%=b_read_only1%>"/>
            </td>
       </tr>
       <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Descripción Seguro : </div>
            </td>
            <td nowrap >
              <input type="text" name="E06RW8DES" size="50" maxlength="100" value="<%=recW8.getE06RW8DES().trim()%>" <%=read_only1%>><br>
            </td>
            <td nowrap >
            </td>
            <td nowrap >
            </td>
       </tr>
       <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Estado Garantía : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="recW8" property="E06RW8EST" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PO_BOX%>" required="false" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap >
              <div align="right">Clase Garantía : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="recW8" property="E06RW8CLA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PO_BOX%>" required="false" readonly="<%=b_read_only1%>"/>
            </td>
       </tr>
       <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Cerrada : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="recW8" property="E06RW8CER" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_FLAG%>" required="false" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap >
              <div align="right">FLAG : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="recW8" property="E06RW8FLG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" required="false" readonly="<%=b_read_only1%>"/>
            </td>
       </tr>
       <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Banco Emisor : </div>
            </td>
            <td nowrap >
              <input type="text" name="E06RW8BCO" size="50" maxlength="100" value="<%=recW8.getE06RW8BCO().trim()%>" <%=read_only1%>><br>
            </td>
            <td nowrap >
              <div align="right">Calificación Emisor : </div>
            </td>
            <td nowrap >
              <input type="text" name="E06RW8CAL" size="50" maxlength="50" value="<%=recW8.getE06RW8CAL().trim()%>" <%=read_only1%>><br>
            </td>
       </tr>
       <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Entidad Calificadora : </div>
            </td>
            <td nowrap >
              <input type="text" name="E06RW8ECA" size="50" maxlength="100" value="<%=recW8.getE06RW8ECA().trim()%>" <%=read_only1%>><br>
            </td>
            <td nowrap >
              <div align="right">Moneda : </div>
            </td>
            <td nowrap >
              <input type="text" name="E06RW8MON" size="50" maxlength="50" value="<%=recW8.getE06RW8MON().trim()%>" <%=read_only1%>><br>
            </td>
       </tr>
       <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Valor Original : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="recW8" property="E06RW8VOR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" required="false" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap >
              <div align="right">Tipo de Garantía : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="recW8" property="E06RW8TYP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" required="false" readonly="<%=b_read_only1%>"/>
            </td>
       </tr>
       <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Tipo de Bien : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="recW8" property="E06RW8TBI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" required="false" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap >
              <div align="right">País Emisor : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="recW8" property="E06RW8PAI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" required="false" readonly="<%=b_read_only1%>"/>
            </td>
       </tr>
       <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">ESG ID : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="recW8" property="E06RW8ESG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" required="false" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap >
              <div align="right">Número Cliente Constituyente : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="recW8" property="E06RW8CON" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" required="false" readonly="<%=b_read_only1%>"/>
            </td>
       </tr>



	  </TABLE>
      </td>
    </tr>
</TABLE>
<table class="tableinfo">
	<tr>
		<td width="100%" align="center" colspan="3">
	<%
		if (iopecod.equals("0005") || iopecod.equals("0006")
				|| iopecod.equals("0001")) {
		if (oopecod.equals("0003")){
	%>
	  	<input class="EIBSBTN" id="EIBSBTN" type=submit name="Submit" value="Borrar">

	<%
		} else {
	%>

	  	<input class="EIBSBTN" id="EIBSBTN" type=submit name="Submit" value="Enviar" >
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
 	
<SCRIPT type="text/javascript">
  
</SCRIPT>
  
</form>
</body>
</html>