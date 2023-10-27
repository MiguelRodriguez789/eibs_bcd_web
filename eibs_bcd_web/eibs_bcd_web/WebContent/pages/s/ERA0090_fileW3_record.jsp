<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Archivos de Interface para enviar a Credismart</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id= "recW3" class= "datapro.eibs.beans.ERA009003Message"  scope="session"/>
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
	String iopecod = recW3 != null ? recW3.getH03OPECOD().trim()
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

<h3 align="center">Mantenimiento Registro Tabla Garantizados para Interface a CREDISMART 
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="file_listW1,ERA0090"></h3>

<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0090">
  <p> 
    <INPUT TYPE=HIDDEN NAME="CURRENTROW" id="CURRENTROW" VALUE="0"> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="106">
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
             <eibsinput:text name="recW3" property="E03RW3REF" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" required="false" readonly="true"/>
            </td>
            <td nowrap >
            </td>
            <td nowrap >
          </td>
      </tr>
       <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Número Identificación : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="recW3" property="E03RW3NIT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER%>" required="false" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap >
              <div align="right">Tipo de Identificación : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="recW3" property="E03RW3TIP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PO_BOX%>" required="false" readonly="<%=b_read_only1%>"/>
           </td>
       </tr>
       <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Cliente Relacionado : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="recW3" property="E03RW3RCN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER%>" required="false" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap >
              <div align="right">Empleado : </div>
            </td>
            <td nowrap >
                  <select name="E03RW3EMP">
                    <option value=" " <%if (!(recW3.getE03RW3EMP().equals("1")
					|| recW3.getE03RW3EMP().equals("0")))
				out.print("selected");%>> 
                     </option>
                     <option value="1" <%if (recW3.getE03RW3EMP().equals("1"))
				out.print("selected");%> <%=disabled1%>>SI</option>
                     <option value="0" <%if (recW3.getE03RW3EMP().equals("0"))
				out.print("selected");%> <%=disabled1%>>NO</option>
                   </select>
           </td>
       </tr>
       <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">%Participación : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="recW3" property="E03RW3PAR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" required="false" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap >
              <div align="right">Centro de Costo: </div>
            </td>
            <td nowrap >
             <eibsinput:text name="recW3" property="E03RW3CEN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY%>" required="false" readonly="<%=b_read_only1%>"/>
           </td>
       </tr>
       <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Es Principal : </div>
            </td>
            <td nowrap >
                  <select name="E03RW3PAL">
                    <option value=" " <%if (!(recW3.getE03RW3PAL().equals("1")
					|| recW3.getE03RW3PAL().equals("0")))
				out.print("selected");%>> 
                     </option>
                     <option value="1" <%if (recW3.getE03RW3PAL().equals("1"))
				out.print("selected");%> <%=disabled1%>>SI</option>
                     <option value="0" <%if (recW3.getE03RW3PAL().equals("0"))
				out.print("selected");%> <%=disabled1%>>NO</option>
                   </select>
            </td>
            <td nowrap >
              <div align="right">Fecha Ultimo Cierre : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="recW3" property="E03RW3EOD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_COST_CENTER%>" required="false" readonly="<%=b_read_only1%>"/>
            </td>
       </tr>
       <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Vlr. de Deuda No Cubierta : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="recW3" property="E03RW3DEU" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" required="false" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap >
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