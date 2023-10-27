<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Archivos de Interface para enviar a Credismart</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id= "recW1" class= "datapro.eibs.beans.ERA009002Message"  scope="session"/>
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
	String iopecod = recW1 != null ? recW1.getH02OPECOD().trim()
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
%>

</head>
<BODY>
<script type="text/javascript">
  function goExit(){
     window.location.href="<%=request.getContextPath()%>/pages/background.jsp";

  }


</SCRIPT>  

<h3 align="center">Mantenimiento Registro Tabla Garantía Mensual para Interface a CREDISMART 
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="file_listW1,ERA0090"></h3>

<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0090">
  <p> 
    <INPUT TYPE=HIDDEN NAME="CURRENTROW" id="CURRENTROW" VALUE="0"> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="102">
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
              <div align="right">Número de Garantía : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="recW1" property="E02RW1REF" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" required="false" readonly="true"/>
            </td>
            <td nowrap >
            </td>
            <td nowrap >
          </td>
      </tr>
      <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Garantía Abierta/Cerrada : </div>
            </td>
            <td nowrap >
                  <select name="E02RW1CER">
                    <option value=" " <%if (!(recW1.getE02RW1CER().equals("1")
					|| recW1.getE02RW1CER().equals("0")))
				out.print("selected");%>> 
                     </option>
                     <option value="1" <%if (recW1.getE02RW1CER().equals("1"))
				out.print("selected");%> <%=disabled1%>>Cerrada</option>
                     <option value="0" <%if (recW1.getE02RW1CER().equals("0"))
				out.print("selected");%> <%=disabled1%>>Abierta</option>
                   </select>
            </td>
            <td nowrap >
              <div align="right">Código Interno Tipo de Garantía : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="recW1" property="E02RW1ITG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_FLAG%>" required="false" readonly="<%=b_read_only1%>"/>
<%-- 
                  <select name="E02RW1CER">
                    <option value=" " <%if (!(recW1.getE02RW1ITG().equals("1")
					|| recW1.getE02RW1ITG().equals("2") || recW1.getE02RW1ITG().equals("3") || recW1.getE02RW1ITG().equals("4")
					|| recW1.getE02RW1ITG().equals("5") || recW1.getE02RW1ITG().equals("6") || recW1.getE02RW1ITG().equals("7")
					|| recW1.getE02RW1ITG().equals("8") || recW1.getE02RW1ITG().equals("9") || recW1.getE02RW1ITG().equals("10")
					|| recW1.getE02RW1ITG().equals("11") || recW1.getE02RW1ITG().equals("12") || recW1.getE02RW1ITG().equals("13")
					|| recW1.getE02RW1ITG().equals("14") || recW1.getE02RW1ITG().equals("15") || recW1.getE02RW1ITG().equals("16")
					|| recW1.getE02RW1ITG().equals("17") || recW1.getE02RW1ITG().equals("18") || recW1.getE02RW1ITG().equals("19")
					|| recW1.getE02RW1ITG().equals("20")))
				out.print("selected");%>> 
                     </option>
                     <option value="1" <%if (recW1.getE02RW1ITG().equals("1"))
				out.print("selected");%> <%=disabled1%>>1 Hipoteca</option>
                     <option value="2" <%if (recW1.getE02RW1ITG().equals("2"))
				out.print("selected");%> <%=disabled1%>>2 Avales de la Nacion</option>
                     <option value="3" <%if (recW1.getE02RW1ITG().equals("3"))
				out.print("selected");%> <%=disabled1%>>3 Otros Avales</option>
                     <option value="4" <%if (recW1.getE02RW1ITG().equals("4"))
				out.print("selected");%> <%=disabled1%>>4 Cartas de Credito Stand By</option>
                     <option value="5" <%if (recW1.getE02RW1ITG().equals("5"))
				out.print("selected");%> <%=disabled1%>>5 Fondo Nacional de Garantias</option>
                     <option value="6" <%if (recW1.getE02RW1ITG().equals("6"))
				out.print("selected");%> <%=disabled1%>>6 Fiducia Administracion y Fuente de Pago</option>
                     <option value="7" <%if (recW1.getE02RW1ITG().equals("7"))
				out.print("selected");%> <%=disabled1%>>7 Fianza Casa Matriz</option>
                     <option value="8" <%if (recW1.getE02RW1ITG().equals("8"))
				out.print("selected");%> <%=disabled1%>>8 Fiducia en Garantia</option>
                     <option value="9" <%if (recW1.getE02RW1ITG().equals("9"))
				out.print("selected");%> <%=disabled1%>>9 Pignoracion de Rentas</option>
                     <option value="10" <%if (recW1.getE02RW1ITG().equals("10"))
				out.print("selected");%> <%=disabled1%>>10 Prenda Acciones</option>
                     <option value="11" <%if (recW1.getE02RW1ITG().equals("11"))
				out.print("selected");%> <%=disabled1%>>11 Otros Titulos Valores</option>
                     <option value="12" <%if (recW1.getE02RW1ITG().equals("12"))
				out.print("selected");%> <%=disabled1%>>12 Bonos de Prenda</option>
                     <option value="13" <%if (recW1.getE02RW1ITG().equals("13"))
				out.print("selected");%> <%=disabled1%>>13 Prenda Establecimiento de Comercio</option>
                     <option value="14" <%if (recW1.getE02RW1ITG().equals("14"))
				out.print("selected");%> <%=disabled1%>>14 Prenda Industrial</option>
                     <option value="15" <%if (recW1.getE02RW1ITG().equals("15"))
				out.print("selected");%> <%=disabled1%>>15 Prenda Vehiculo</option>
                     <option value="16" <%if (recW1.getE02RW1ITG().equals("16"))
				out.print("selected");%> <%=disabled1%>>16 Prenda CDT Otros Bancos</option>
                     <option value="17" <%if (recW1.getE02RW1ITG().equals("17"))
				out.print("selected");%> <%=disabled1%>>17 Cesion de Derechos Economicos</option>
                     <option value="18" <%if (recW1.getE02RW1ITG().equals("18"))
				out.print("selected");%> <%=disabled1%>>18 CDT Banco de Credito</option>
                     <option value="19" <%if (recW1.getE02RW1ITG().equals("19"))
				out.print("selected");%> <%=disabled1%>>19 Endoso de Factura Cambiaria de Compraventa</option>
                     <option value="20" <%if (recW1.getE02RW1ITG().equals("20"))
				out.print("selected");%> <%=disabled1%>>20 Deposito de Dinero en Garantia</option>
                   </select>
--%>
            </td>
       </tr>
       <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Moneda : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="recW1" property="E02RW1MON" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY%>" required="false" readonly="<%=b_read_only1%>"/>
<%--             
                  <select name="E02RW1MON">
                    <option value=" " <%if (!(recW1.getE02RW1MON().equals("1")
					|| recW1.getE02RW1MON().equals("2")))
				out.print("selected");%>> 
                     </option>
                     <option value="1" <%if (recW1.getE02RW1MON().equals("1"))
				out.print("selected");%> <%=disabled1%>>COP</option>
                     <option value="2" <%if (recW1.getE02RW1MON().equals("2"))
				out.print("selected");%> <%=disabled1%>>USD</option>
                   </select>
--%>
            </td>
            <td nowrap >
              <div align="right">Valor Garantía : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="recW1" property="E02RW1VAL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" required="false" readonly="<%=b_read_only1%>"/>
           </td>
       </tr>
       <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Vencida : </div>
            </td>
            <td nowrap >
                  <select name="E02RW1VEN">
                    <option value=" " <%if (!(recW1.getE02RW1VEN().equals("1")
					|| recW1.getE02RW1VEN().equals("0")))
				out.print("selected");%>> 
                     </option>
                     <option value="1" <%if (recW1.getE02RW1VEN().equals("1"))
				out.print("selected");%> <%=disabled1%>>SI</option>
                     <option value="0" <%if (recW1.getE02RW1VEN().equals("0"))
				out.print("selected");%> <%=disabled1%>>NO</option>
                   </select>
            </td>
            <td nowrap >
              <div align="right">Fecha de Vencimiento de la Garantía : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="recW1" property="E02RW1FVE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_COST_CENTER%>" required="false" readonly="<%=b_read_only1%>"/>
           </td>
       </tr>
       <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Idónea : </div>
            </td>
            <td nowrap >
                  <select name="E02RW1IDO">
                    <option value=" " <%if (!(recW1.getE02RW1IDO().equals("1")
					|| recW1.getE02RW1IDO().equals("0")))
				out.print("selected");%>> 
                     </option>
                     <option value="1" <%if (recW1.getE02RW1IDO().equals("1"))
				out.print("selected");%> <%=disabled1%>>SI</option>
                     <option value="0" <%if (recW1.getE02RW1IDO().equals("0"))
				out.print("selected");%> <%=disabled1%>>NO</option>
                   </select>
            </td>
            <td nowrap >
              <div align="right">Admisible : </div>
            </td>
            <td nowrap >
                  <select name="E02RW1ADM">
                    <option value=" " <%if (!(recW1.getE02RW1ADM().equals("1")
					|| recW1.getE02RW1ADM().equals("0")))
				out.print("selected");%>> 
                     </option>
                     <option value="1" <%if (recW1.getE02RW1ADM().equals("1"))
				out.print("selected");%> <%=disabled1%>>SI</option>
                     <option value="0" <%if (recW1.getE02RW1ADM().equals("0"))
				out.print("selected");%> <%=disabled1%>>NO</option>
                   </select>
           </td>
       </tr>
       <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Tenencia : </div>
            </td>
            <td nowrap >
                  <select name="E02RW1TEN">
                    <option value=" " <%if (!(recW1.getE02RW1TEN().equals("1")
					|| recW1.getE02RW1TEN().equals("0")))
				out.print("selected");%>> 
                     </option>
                     <option value="1" <%if (recW1.getE02RW1TEN().equals("1"))
				out.print("selected");%> <%=disabled1%>>SI</option>
                     <option value="0" <%if (recW1.getE02RW1TEN().equals("0"))
				out.print("selected");%> <%=disabled1%>>NO</option>
                   </select>
            </td>
            <td nowrap >
              <div align="right">% Cobertura : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="recW1" property="E02RW1PGA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" required="false" readonly="<%=b_read_only1%>"/>
           </td>
       </tr>
       <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Código de Estado Garantía : </div>
            </td>
            <td nowrap >
                  <select name="E02RW1ESG">
                    <option value=" " <%if (!(recW1.getE02RW1ESG().equals("1")
					|| recW1.getE02RW1ESG().equals("2")|| recW1.getE02RW1ESG().equals("3")|| recW1.getE02RW1ESG().equals("4")))
				out.print("selected");%>> 
                     </option>
                     <option value="1" <%if (recW1.getE02RW1ESG().equals("1"))
				out.print("selected");%> <%=disabled1%>>Utilizada</option>
                     <option value="2" <%if (recW1.getE02RW1ESG().equals("2"))
				out.print("selected");%> <%=disabled1%>>Por Utilizar</option>
                     <option value="3" <%if (recW1.getE02RW1ESG().equals("3"))
				out.print("selected");%> <%=disabled1%>>Por Cancelar</option>
                     <option value="4" <%if (recW1.getE02RW1ESG().equals("4"))
				out.print("selected");%> <%=disabled1%>>Castigadas</option>
                   </select>
            </td>
            <td nowrap >
              <div align="right">Estado Transaccional Garantía : </div>
            </td>
            <td nowrap >
                  <select name="E02RW1EGT">
                    <option value=" " <%if (!(recW1.getE02RW1EGT().equals("1")
					|| recW1.getE02RW1EGT().equals("2")|| recW1.getE02RW1EGT().equals("3")|| recW1.getE02RW1EGT().equals("4")))
				out.print("selected");%>> 
                     </option>
                     <option value="1" <%if (recW1.getE02RW1EGT().equals("1"))
				out.print("selected");%> <%=disabled1%>>1</option>
                     <option value="2" <%if (recW1.getE02RW1EGT().equals("2"))
				out.print("selected");%> <%=disabled1%>>2r</option>
                     <option value="3" <%if (recW1.getE02RW1EGT().equals("3"))
				out.print("selected");%> <%=disabled1%>>3</option>
                     <option value="4" <%if (recW1.getE02RW1EGT().equals("4"))
				out.print("selected");%> <%=disabled1%>>4</option>
                   </select>
           </td>
       </tr>
       <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Banca : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="recW1" property="E02RW1BAN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR_40%>" required="false" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap >
              <div align="right">Reestructurado : </div>
            </td>
            <td nowrap >
                  <select name="E02RW1RES">
                    <option value=" " <%if (!(recW1.getE02RW1RES().equals("1")
					|| recW1.getE02RW1RES().equals("0")))
				out.print("selected");%>> 
                     </option>
                     <option value="1" <%if (recW1.getE02RW1RES().equals("1"))
				out.print("selected");%> <%=disabled1%>>SI</option>
                     <option value="0" <%if (recW1.getE02RW1RES().equals("0"))
				out.print("selected");%> <%=disabled1%>>NO</option>
                   </select>
           </td>
       </tr>
       <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Valor Anterior de la Garantía : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="recW1" property="E02RW1VAN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" required="false" readonly="<%=b_read_only1%>"/>
           </td>
            <td nowrap >
              <div align="right">Valor TRM USD : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="recW1" property="E02RW1TRM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE%>" required="false" readonly="<%=b_read_only1%>"/>
            </td>
       </tr>
       <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Detalle Garantía Completo : </div>
            </td>
            <td nowrap >
                  <select name="E02RW1SIN">
                    <option value=" " <%if (!(recW1.getE02RW1SIN().equals("1")
					|| recW1.getE02RW1SIN().equals("0")))
				out.print("selected");%>> 
                     </option>
                     <option value="1" <%if (recW1.getE02RW1SIN().equals("1"))
				out.print("selected");%> <%=disabled1%>>SI</option>
                     <option value="0" <%if (recW1.getE02RW1SIN().equals("0"))
				out.print("selected");%> <%=disabled1%>>NO</option>
                   </select>
            </td>
            <td nowrap >
              <div align="right">Número de Cliente : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="recW1" property="E02RW1CUN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER%>" required="false" readonly="<%=b_read_only1%>"/>
           </td>
       </tr>
       <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Fecha Ultimo Cierre : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="recW1" property="E02RW1EOD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_COST_CENTER%>" required="false" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap >
              <div align="right">Respalda Hipoteca : </div>
            </td>
            <td nowrap >
                  <select name="E02RW1HIP">
                    <option value=" " <%if (!(recW1.getE02RW1HIP().equals("1")
					|| recW1.getE02RW1HIP().equals("0")))
				out.print("selected");%>> 
                     </option>
                     <option value="1" <%if (recW1.getE02RW1HIP().equals("1"))
				out.print("selected");%> <%=disabled1%>>SI</option>
                     <option value="0" <%if (recW1.getE02RW1HIP().equals("0"))
				out.print("selected");%> <%=disabled1%>>NO</option>
                   </select>
           </td>
       </tr>
      <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Código Identificador : </div>
            </td>
            <td nowrap >
                  <select name="E02RW1TGR">
                    <option value=" " <%if (!(recW1.getE02RW1TGR().equals("G")
					|| recW1.getE02RW1TGR().equals("F") || recW1.getE02RW1TGR().equals("H")))
				out.print("selected");%>> 
                     </option>
                     <option value="G" <%if (recW1.getE02RW1TGR().equals("G"))
				out.print("selected");%> <%=disabled1%>>G</option>
                     <option value="F" <%if (recW1.getE02RW1TGR().equals("F"))
				out.print("selected");%> <%=disabled1%>>F</option>
                     <option value="H" <%if (recW1.getE02RW1TGR().equals("H"))
				out.print("selected");%> <%=disabled1%>>H</option>
                   </select>
            </td>
            <td nowrap> 
            </td>
            <td nowrap >
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