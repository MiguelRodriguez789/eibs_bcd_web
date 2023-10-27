<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@page import="com.datapro.constants.Entities"%> 
<html>
<head>
<title>Mantenimiento Tabla de Seguros</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="cnvObj" class="datapro.eibs.beans.ESG051001Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBSBillsP.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>

<script type="text/javascript">

//  Process according with user selection
 function goAction(op) {
	
   	switch (op){
	//Cancel
	case 1:  {
 		document.forms[0].SCREEN.value = "101";
       	break;
		}
	}
	document.forms[0].submit();
 }
 </script>
</head>

<%
	boolean readOnly=false;
	boolean maintenance=false;
%> 
          
<%
	// Determina si es solo lectura
	if (request.getParameter("readOnly") != null ){
		if (request.getParameter("readOnly").toLowerCase().equals("true")){
			readOnly=true;
		} else {
			readOnly=false;
		}
	}
%>
<body>
<%
	if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
	if (!userPO.getPurpose().equals("NEW")) {
		maintenance = true;
		out.println("<SCRIPT> initMenu(); </SCRIPT>");
	}
%>

<h3 align="center">
<%if (readOnly){ %>
	CONSULTA TABLAS DE SEGUROS
<%} else if (maintenance){ %>
	MANTENIMIENTO TABLAS DE SEGUROS
<%} else { %>
	NUEVO TABLA DE SEGUROS
<%} %>
 <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="TBL_seguros_maintenance.jsp, ESG0510"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESG0510" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
  <input type=HIDDEN name="E01SGTBNK"  value="<%= currUser.getE01UBK().trim()%>">
  <input type=HIDDEN name="H01FLGMAS"  value="<%= cnvObj.getH01FLGMAS().trim()%>">
 
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
             <td nowrap width="10%" align="right"> Codigo Seguro : 
              </td>
             <td nowrap width="10%" align="left">
	  			<eibsinput:text name="cnvObj" property="E01SGTCOD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
             </td>
             <td nowrap width="10%" align="right"> plan : 
               </td>
             <td nowrap width="10%"align="left">
	  			<eibsinput:text name="cnvObj" property="E01SGTPLN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="3" maxlength="2"  readonly="true"/>
             </td>
             <td nowrap width="10%" align="right"> Tipo Seguro : 
               </td>
             <td nowrap width="50%"align="left">
	  			<eibsinput:text name="cnvObj" property="E01DESCRI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/>
             </td>
         </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Informacion Basica </h4>
 <% int row = 0; %>   
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="20%" > 
              <div align="right">Descripcion :</div>
            </td>
            <td width="30%" > 
                 <eibsinput:text property="E01SGTDSC" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="<%=readOnly %>"/>
	        </td>
            <td width="20%" > 
              <div align="right">Estado :</div>
            </td>
            <td width="30%" > 
               <select name="E01SGTSTS" <%=readOnly?"disabled":""%>>
                    <option value=" " <% if (!(cnvObj.getE01SGTSTS().equals("1")||cnvObj.getE01SGTSTS().equals("2"))) out.print("selected"); %>> 
                    </option>
                    <option value="1" <% if (cnvObj.getE01SGTSTS().equals("1")) out.print("selected"); %>>Vigente</option>
                    <option value="2" <% if (cnvObj.getE01SGTSTS().equals("2")) out.print("selected"); %>>No Disponible</option>                   
                  </select>
	        </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="20%" > 
              <div align="right">Moneda/Monto Asegurado :</div>
            </td>
            <td width="30%" > 
 	 			<eibsinput:help name="cnvObj" property="E01SGTCYS" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" fn_param_one="E01SGTCYS" fn_param_two="document.forms[0].E01SGTBNK.value"  required="false" readonly="<%=readOnly %>" />
 		        <eibsinput:text name="cnvObj" property="E01SGTMTS" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEREST %>" readonly="<%=readOnly %>"/>
                <select name="E01SGTMTF" <%=readOnly?"disabled":""%>>
                    <option value=" " <% if (!(cnvObj.getE01SGTMTF().equals("T")||cnvObj.getE01SGTMTF().equals("Y"))) out.print("selected"); %>> 
                    </option>
                    <option value="T" <% if (cnvObj.getE01SGTMTF().equals("T")) out.print("selected"); %>>Total</option>
                    <option value="Y" <% if (cnvObj.getE01SGTMTF().equals("Y")) out.print("selected"); %>>Anual</option>                   
                  </select>
	        </td>
           <td width="20%"> 
              <div align="right">Moneda/Monto Prima :</div>
            </td>
            <td width="30%"> 
 	 			<eibsinput:help name="cnvObj" property="E01SGTCYP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" fn_param_one="E01SGTCYP" fn_param_two="document.forms[0].E01SGTBNK.value"  required="false" readonly="<%=readOnly %>" />
 		        <eibsinput:text name="cnvObj" property="E01SGTMTP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEREST %>" readonly="<%=readOnly %>"/>
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="20%" > 
              <div align="right">Monto Base :</div>
            </td>
            <td width="30%" > 
	              <select name="E01SGTBSE" <%=readOnly ? "disabled" : ""%>>
	                <option value="O" <% if (cnvObj.getE01SGTBSE().equals("O")) out.print("selected"); %>>Monto Original</option>
	                <option value="B" <% if (cnvObj.getE01SGTBSE().equals("B")) out.print("selected"); %>>Saldo Capital</option>
	                <option value="I" <% if (cnvObj.getE01SGTBSE().equals("I")) out.print("selected"); %>>Saldo Teorico</option>
	                <option value="S" <% if (cnvObj.getE01SGTBSE().equals("S")) out.print("selected"); %>>Saldo Insoluto</option>
	                <option value="T" <% if (cnvObj.getE01SGTBSE().equals("T")) out.print("selected"); %>>Total Deuda</option>
	                <option value="C" <% if (cnvObj.getE01SGTBSE().equals("C")) out.print("selected"); %>>Valor Cuota</option>
	                <option value="A" <% if (cnvObj.getE01SGTBSE().equals("A")) out.print("selected"); %>>Valor Area Construida</option>
	               </select>
	        </td>
           <td width="20%"> 
              <div align="right">Factor de Calculo :</div>
            </td>
            <td width="30%"> 
	              <select name="E01SGTFAC" <%=readOnly ? "disabled" : ""%>>
	                <option value="F" <% if (cnvObj.getE01SGTFAC().equals("F")) out.print("selected"); %>>Valor Fijo</option>
	                <option value="P" <% if (cnvObj.getE01SGTFAC().equals("P")) out.print("selected"); %>>Porcentaje</option>
	                <option value="T" <% if (cnvObj.getE01SGTFAC().equals("T")) out.print("selected"); %>>% Plazo Total</option>
	                <option value="1" <% if (cnvObj.getE01SGTFAC().equals("1")) out.print("selected"); %>>Tasa/Periodo</option>
	               </select>
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
           <td width="20%"> 
              <div align="right">Termino del Seguro (meses) :</div>
            </td>
            <td width="30%"> 
 		        <eibsinput:text name="cnvObj" property="E01SGTTRM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="4" maxlength="3"  readonly="<%=readOnly %>"/>
				(999 = Vencimiento Credito)
            </td>
            <td width="20%" > 
              <div align="right">Tabla de Factores :</div>
            </td>
            <td width="30%" >
            	<input type="text" name="E01SGTTBL" size="3" maxlength="2" value="<%= cnvObj.getE01SGTTBL().trim()%>" <%if (readOnly) out.print("readonly"); %>>            
               <%if(!readOnly){ %>
                <a href="javascript:GetTablaFactores('E01SGTTBL','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="middle" border="0"></a>
	           <% } %>	
	        </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="20%" > 
              <div align="right">Plazo Minimo (meses) :</div>
            </td>
            <td width="30%" > 
 		        <eibsinput:text name="cnvObj" property="E01SGTPMI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="4" maxlength="3"  readonly="<%=readOnly %>"/>
	        </td>
           <td width="20%"> 
              <div align="right">Plazo Maximo (meses) :</div>
            </td>
            <td width="30%"> 
 		        <eibsinput:text name="cnvObj" property="E01SGTPMX" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="4" maxlength="3"  readonly="<%=readOnly %>"/>
            </td>
          </tr>	

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="20%" > 
              <div align="right">Dias Mora Maxima :</div>
            </td>
            <td width="30%" > 
 		        <eibsinput:text name="cnvObj" property="E01SGTDMO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="4" maxlength="3"  readonly="<%=readOnly %>"/>
	        </td>
           <td width="20%"> 
              <div align="right">Maximo Insistencias :</div>
            </td>
            <td width="30%"> 
 		        <eibsinput:text name="cnvObj" property="E01SGTAMX" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="4" maxlength="3"  readonly="<%=readOnly %>"/>
            </td>
          </tr>	
 
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="20%" > 
              <div align="right">Primas Mora Maxima :</div>
            </td>
            <td width="30%" > 
 		        <eibsinput:text name="cnvObj" property="E01SGTIMX" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="4" maxlength="3"  readonly="<%=readOnly %>"/>
	        </td>
           <td width="20%"> 
              <div align="right">Beneficiarios :</div>
            </td>
            <td width="30%"> 
              <input type="radio" name="E01SGTBNF" value="Y" <%if (cnvObj.getE01SGTBNF().equals("Y")) out.print("checked"); %> <%if (readOnly) out.print("disabled"); %>>Sí
              <input type="radio" name="E01SGTBNF" value="N" <%if (!cnvObj.getE01SGTBNF().equals("Y")) out.print("checked"); %> <%if (readOnly) out.print("disabled"); %>>No
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="20%" > 
              <div align="right">Periodo Base :</div>
            </td>
            <td width="30%" > 
            	 <select name="E01SGTPBS" <%=readOnly ? "disabled" : ""%>>
	                <option value=" " <% if (cnvObj.getE01SGTPBS().equals(" ")) out.print("selected"); %>>Prestamo</option>
	                <option value="1" <% if (cnvObj.getE01SGTPBS().equals("1")) out.print("selected"); %>>360</option>
	                <option value="2" <% if (cnvObj.getE01SGTPBS().equals("2")) out.print("selected"); %>>365</option>
	             </select> 		       
	        </td>
           <td width="20%"> 
              <div align="right">Funcionalidad Flotante :</div>
            </td>
            <td width="30%"> 
              <input type="radio" name="E01SGTFL1" value="Y" <%if (cnvObj.getE01SGTFL1().equals("Y")) out.print("checked"); %> <%if (readOnly) out.print("disabled"); %>>Sí
              <input type="radio" name="E01SGTFL1" value="N" <%if (!cnvObj.getE01SGTFL1().equals("Y")) out.print("checked"); %> <%if (readOnly) out.print("disabled"); %>>No
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>


   <%if  (!readOnly) { %>
      <div align="center"> 
          <input id="EIBSBTN" type=submit name="Submit" value="Enviar">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="EIBSBTN" type=button name="Cancel" value="Cancelar" onclick="javascript:goAction(1);">
      </div>
    <% } else { %>
      <div align="center"> 
          <input class="EIBSBTN" type=button name="Cancel" value="Cancelar" onclick="javascript:goAction(1);">
      </div>     
    <% } %>  
  </form>
</body>
</HTML>
