
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html> 
<head>
<title>Cambio de Producto</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id="brnDetails" class="datapro.eibs.beans.ESD090001Message"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript">
function optionClick(op){
	var field01 = document.getElementById("field01");
	var field02 = document.getElementById("field02");
	var field03 = document.getElementById("field03");
	var field04 = document.getElementById("field04");
	var field05 = document.getElementById("field05");
	var field06 = document.getElementById("field06");

	if (op == "P"){
		document.forms[0].E01CHGOBR.value = "";
		document.forms[0].E01OLDBRN.value = "";
		document.forms[0].E01CHGNBR.value = "";
		document.forms[0].E01NEWBRN.value = "";
		document.forms[0].E01CHGOFC.value = "";
		document.forms[0].E01OLDOFN.value = "";
		document.forms[0].E01CHGNFC.value = "";
		document.forms[0].E01NEWOFN.value = "";
		document.forms[0].E01CHGACD.disabled = false;
		document.forms[0].E01MODDSC.disabled = false;
		document.forms[0].E01CHGPRT.disabled = false;
		document.forms[0].E01CHGPRO.disabled = false;
		document.forms[0].E01PRDDSC.disabled = false;
		document.forms[0].E01CHGPRC.disabled = false;
		document.forms[0].E01NEWPRD.disabled = false;
		document.forms[0].E01CHGOBR.disabled = true;
		document.forms[0].E01OLDBRN.disabled = true;
		document.forms[0].E01CHGNBR.disabled = true;
		document.forms[0].E01NEWBRN.disabled = true;
		document.forms[0].E01CHGOFC.disabled = true;
		document.forms[0].E01OLDOFN.disabled = true;
		document.forms[0].E01CHGNFC.disabled = true;
		document.forms[0].E01NEWOFN.disabled = true;
		document.forms[0].E01CHGTYP.value = "2";
		field01.style.display = "";
		field02.style.display = "";
		field03.style.display = "none";
		field04.style.display = "none";
		field05.style.display = "none";
		field06.style.display = "none";
	}
	else if (op == "B"){
		document.forms[0].E01CHGPRO.value = "";
		document.forms[0].E01PRDDSC.value = "";
		document.forms[0].E01CHGPRC.value = "";
		document.forms[0].E01NEWPRD.value = "";
		document.forms[0].E01CHGOFC.value = "";
		document.forms[0].E01OLDOFN.value = "";
		document.forms[0].E01CHGNFC.value = "";
		document.forms[0].E01NEWOFN.value = "";
		document.forms[0].E01CHGACD.disabled = true;
		document.forms[0].E01MODDSC.disabled = true;
		document.forms[0].E01CHGPRT.disabled = true;
		document.forms[0].E01CHGPRO.disabled = true;
		document.forms[0].E01PRDDSC.disabled = true;
		document.forms[0].E01CHGPRC.disabled = true;
		document.forms[0].E01NEWPRD.disabled = true;
		document.forms[0].E01CHGOBR.disabled = false;
		document.forms[0].E01OLDBRN.disabled = false;
		document.forms[0].E01CHGNBR.disabled = false;
		document.forms[0].E01NEWBRN.disabled = false;
		document.forms[0].E01CHGOFC.disabled = true;
		document.forms[0].E01OLDOFN.disabled = true;
		document.forms[0].E01CHGNFC.disabled = true;
		document.forms[0].E01NEWOFN.disabled = true;
		document.forms[0].E01CHGTYP.value = "3";
		field01.style.display = "none";
		field02.style.display = "none";
		field03.style.display = "";
		field04.style.display = "";
		field05.style.display = "none";
		field06.style.display = "none";
	}
	else if (op == "O"){
		document.forms[0].E01CHGPRO.value = "";
		document.forms[0].E01PRDDSC.value = "";
		document.forms[0].E01CHGPRC.value = "";
		document.forms[0].E01NEWPRD.value = "";
		document.forms[0].E01CHGOBR.value = "";
		document.forms[0].E01OLDBRN.value = "";
		document.forms[0].E01CHGNBR.value = "";
		document.forms[0].E01NEWBRN.value = "";
		document.forms[0].E01CHGACD.disabled = true;
		document.forms[0].E01MODDSC.disabled = true;
		document.forms[0].E01CHGPRT.disabled = true;
		document.forms[0].E01CHGPRO.disabled = true;
		document.forms[0].E01PRDDSC.disabled = true;
		document.forms[0].E01CHGPRC.disabled = true;
		document.forms[0].E01NEWPRD.disabled = true;
		document.forms[0].E01CHGOBR.disabled = true;
		document.forms[0].E01OLDBRN.disabled = true;
		document.forms[0].E01CHGNBR.disabled = true;
		document.forms[0].E01NEWBRN.disabled = true;
		document.forms[0].E01CHGOFC.disabled = false;
		document.forms[0].E01OLDOFN.disabled = false;
		document.forms[0].E01CHGNFC.disabled = false;
		document.forms[0].E01NEWOFN.disabled = false;
		document.forms[0].E01CHGTYP.value = "4";
		field01.style.display = "none";
		field02.style.display = "none";
		field03.style.display = "none";
		field04.style.display = "none";
		field05.style.display = "";
		field06.style.display = "";
	}
}

function cancel(){
	document.forms[0].SCREEN.value = 100;
	document.forms[0].submit();
}

</script>

</head>
<body>

 
 <% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
    }
%>
  <h3 align="center">Cambio de Producto<BR>Cambio Masivo<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="product_change_massive.jsp, ESD0900">
  </h3>
  <hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0900" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
  <INPUT TYPE=HIDDEN NAME="CHANGE" VALUE="M">
  <INPUT TYPE=HIDDEN NAME="E01CHGTYP" VALUE="<% if (!brnDetails.getE01CHGTYP().equals("")) { out.print(brnDetails.getE01CHGTYP()); } else { out.print("2"); } %>">
  <INPUT TYPE=HIDDEN NAME="E01CHGACC" VALUE="<%= brnDetails.getE01CHGACC() %>">

  <table class="tableinfo">
      <tr> 
        <td nowrap> 
          <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
            <tr id="trdark"> 
              <td nowrap width="10%"> 
              </td>
              <td nowrap width="15%"> 
                <div align="right">Código de Banco :</div>
              </td>
              <td nowrap width="75%">  
                <input type="text" name="E01CHGBNK" size="3" maxlength="2" value="<%= brnDetails.getE01CHGBNK() %>">
              </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap width="10%"> 
              </td>
              <td nowrap width="15%"> 
                <div align="right">Módulo :</div>
              </td>
              <td nowrap width="75%">  
               	<input type="text" name="E01CHGACD" size="3" maxlength="2" value="<%= brnDetails.getE01CHGACD() %>" <% if (!brnDetails.getE01CHGTYP().equals("2")) { out.print("disabled"); } %>>
	           		<a href="javascript:GetCodeDescCNOFC('E01CHGACD','E01MODDSC','AP')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a>
               	<input type="text" name="E01MODDSC" size="36" maxlength="35" value="<%= brnDetails.getE01MODDSC() %>" <% if (!brnDetails.getE01CHGTYP().equals("2")) { out.print("disabled"); } %>>
              </td>
            </tr>
            <tr id="trdark"> 
              <td nowrap width="10%"> 
              </td>
              <td nowrap width="15%"> 
                <div align="right">Tipo de Producto :</div>
              </td>
              <td nowrap width="75%">  
               	<input type="text" name="E01CHGPRT" size="5" maxlength="4" value="<%= brnDetails.getE01CHGPRT() %>" <% if (!brnDetails.getE01CHGTYP().equals("2")) { out.print("disabled"); } %>>
	           		<a href="javascript:GetProduct('',document.forms[0].E01CHGACD.value,'','','E01CHGPRT')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
              </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap width="10%" rowspan="2" align="right"> 
                <div align="right">
                <input type="radio" name="MASSIVE" value="P" onClick="javascript:optionClick('P')" <% if (brnDetails.getE01CHGTYP().equals("2")) { out.print("checked"); } %> <% if (!brnDetails.getE01CHGTYP().equals("2") && userPO.getPurpose().equals("MAINTENANCE")) { out.print("disabled"); } %>>
                Producto</div>
              </td>
              <td nowrap width="15%"> 
                <div align="right">Producto Actual :</div>
              </td>
              <td nowrap width="75%">  
                <div id="field01">
		 			<eibsinput:help name="brnDetails" property="E01CHGPRO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" 
 		 				fn_param_one="E01CHGPRO" fn_param_two="document.forms[0].E01CHGACD.value" fn_param_three="document.forms[0].E01CHGBNK.value" fn_param_four="E01PRDDSC" />
			        <eibsinput:text name="brnDetails" property="E01PRDDSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
              	</div>
              </td>
            </tr>
            <tr id="trclear">
              <td nowrap width="15%"> 
                <div align="right">Nuevo Producto :</div>
              </td>
              <td nowrap width="75%">  
                <div id="field02">
		 			<eibsinput:help name="brnDetails" property="E01CHGPRC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" 
 		 				fn_param_one="E01CHGPRC" fn_param_two="document.forms[0].E01CHGACD.value" fn_param_three="document.forms[0].E01CHGBNK.value" fn_param_four="E01NEWPRD" />
			        <eibsinput:text name="brnDetails" property="E01NEWPRD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
              	</div>
              </td>
            </tr>
            <tr id="trdark"> 
              <td nowrap width="10%" rowspan="2" align="right"> 
                <div align="right">
                <input type="radio" name="MASSIVE" value="B" onClick="javascript:optionClick('B')" <% if (brnDetails.getE01CHGTYP().equals("3")) { out.print("checked"); } %> <% if (!brnDetails.getE01CHGTYP().equals("3") && userPO.getPurpose().equals("MAINTENANCE")) { out.print("disabled"); } %>>
                Sucursal</div>
              </td>
              <td nowrap width="15%"> 
                <div align="right">Sucursal Anterior :</div>
              </td>
              <td nowrap width="75%">  
                <div id="field03">
	 	 			<eibsinput:help name="brnDetails" property="E01CHGOBR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>" 
	 	 				fn_param_one="E01CHGOBR" fn_param_two="document.forms[0].E01CHGBNK.value"  fn_param_three="E01OLDBRN"  />
			        <eibsinput:text name="brnDetails" property="E01OLDBRN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
              	</div>
              </td>
            </tr>
            <tr id="trdark"> 
              <td nowrap width="15%"> 
                <div align="right">Nueva Sucursal :</div>
              </td>
              <td nowrap width="75%">  
                <div id="field04">
	 	 			<eibsinput:help name="brnDetails" property="E01CHGNBR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>" 
	 	 				fn_param_one="E01CHGNBR" fn_param_two="99"  fn_param_three="E01NEWBRN"  />
			        <eibsinput:text name="brnDetails" property="E01NEWBRN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
              	</div>
              </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap width="10%" rowspan="2" align="right"> 
                <div align="right">
                <input type="radio" name="MASSIVE" value="O" onClick="javascript:optionClick('O')" <% if (brnDetails.getE01CHGTYP().equals("4")) { out.print("checked"); } %> <% if (!brnDetails.getE01CHGTYP().equals("4") && userPO.getPurpose().equals("MAINTENANCE")) { out.print("disabled"); } %>>
                Oficial</div>
              </td>
              <td nowrap width="15%"> 
                <div align="right">Oficial Anterior :</div>
              </td>
              <td nowrap width="75%">  
                <div id="field05">
	                 <eibsinput:cnofc name="brnDetails" property="E01CHGOFC" flag="15" fn_code="E01CHGOFC" fn_description="E01OLDOFN" />
	                 <eibsinput:text property="E01OLDOFN" name="brnDetails" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true"/>
              	</div>
              </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap width="15%"> 
                <div align="right">Nuevo Oficial :</div>
              </td>
              <td nowrap width="75%">  
                <div id="field06">
	                 <eibsinput:cnofc name="brnDetails" property="E01CHGNFC"  flag="15" fn_code="E01CHGNFC" fn_description="E01NEWOFN" />
	                 <eibsinput:text property="E01NEWOFN" name="brnDetails" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true"/>
              	</div>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  <BR>

<SCRIPT type="text/javascript">
	<% if (userPO.getPurpose().equals("NEW")) { %>
		optionClick('P');
	<% } %>
	<% if (brnDetails.getE01CHGTYP().equals("2") && userPO.getPurpose().equals("MAINTENANCE")) { %>
		optionClick('P');
	<% } %>
	<% if (brnDetails.getE01CHGTYP().equals("3") && userPO.getPurpose().equals("MAINTENANCE")) { %>
		optionClick('B');
	<% } %>
	<% if (brnDetails.getE01CHGTYP().equals("4") && userPO.getPurpose().equals("MAINTENANCE")) { %>
		optionClick('O');
	<% } %>
</SCRIPT>
  
<p align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar" >
    <input id="EIBSBTN" type=button name="Cancel" value="Regresar" onClick="javascript:cancel()">
  </p>
      
</form>
</body>
</html>
