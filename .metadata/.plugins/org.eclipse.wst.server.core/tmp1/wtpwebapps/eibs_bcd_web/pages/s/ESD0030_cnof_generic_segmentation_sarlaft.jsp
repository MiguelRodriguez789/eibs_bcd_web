<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields" %>

<html>
<head>
<title>Codigos de Referencia</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<SCRIPT >
function finish(){
 self.window.location.href = "<%=request.getContextPath()%>/pages/background.jsp";
}
</SCRIPT>
</head>

<jsp:useBean id="refCodes" class="datapro.eibs.beans.ESD003002Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script >

function chgTipo(p) { 

	JURIDICA.style.display='none';
	NATURAL.style.display='none';
	if (p == '1') {  // Juridica
		JURIDICA.style.display='block';
	} 
	if (p == '2') {  // Natural
		NATURAL.style.display='block';
	}
 }
 
 function cnvN(s) {
	s = s.replace(/,/g,'');
	return parseFloat(s);
}
 function goAction() {
 	
 	var t = getElement("E02CNOF01").value;
 
	if (t != "1") {
		document.forms[0].E02CNOUS2.value = "";
	}
	
	document.forms[0].E02CNALB1.value = document.forms[0].montod1.value;
	document.forms[0].E02CNALB11.value = document.forms[0].montoh1.value;
	document.forms[0].E02CNALB2.value = document.forms[0].montod2.value;
	document.forms[0].E02CNALB12.value = document.forms[0].montoh2.value;
	document.forms[0].E02CNALB3.value = document.forms[0].montod3.value;
	document.forms[0].E02CNALB13.value = document.forms[0].montoh3.value;
	document.forms[0].E02CNALB4.value = document.forms[0].montod4.value;
	document.forms[0].E02CNALB14.value = document.forms[0].montoh4.value;
	document.forms[0].E02CNALB5.value = document.forms[0].montod5.value;
	document.forms[0].E02CNALB15.value = document.forms[0].montoh5.value;
	
	submitForm();
}

function cnvAmt() {
	var amt = cnvN('<%=refCodes.getE02CNALB1()%>');
	document.forms[0].montod1.value = amt.toFixed(0).replace(/\d(?=(\d{3})+\.)/g, '$&,');
	amt = cnvN('<%=refCodes.getE02CNALB11()%>');
	document.forms[0].montoh1.value = amt.toFixed(0).replace(/\d(?=(\d{3})+\.)/g, '$&,');
	amt = cnvN('<%=refCodes.getE02CNALB2()%>');
	document.forms[0].montod2.value = amt.toFixed(0).replace(/\d(?=(\d{3})+\.)/g, '$&,');
	amt = cnvN('<%=refCodes.getE02CNALB12()%>');
	document.forms[0].montoh2.value = amt.toFixed(0).replace(/\d(?=(\d{3})+\.)/g, '$&,');
	amt = cnvN('<%=refCodes.getE02CNALB3()%>');
	document.forms[0].montod3.value = amt.toFixed(0).replace(/\d(?=(\d{3})+\.)/g, '$&,');
	amt = cnvN('<%=refCodes.getE02CNALB13()%>');
	document.forms[0].montoh3.value = amt.toFixed(0).replace(/\d(?=(\d{3})+\.)/g, '$&,');
	amt = cnvN('<%=refCodes.getE02CNALB4()%>');
	document.forms[0].montod4.value = amt.toFixed(0).replace(/\d(?=(\d{3})+\.)/g, '$&,');
	amt = cnvN('<%=refCodes.getE02CNALB14()%>');
	document.forms[0].montoh4.value = amt.toFixed(0).replace(/\d(?=(\d{3})+\.)/g, '$&,');
	amt = cnvN('<%=refCodes.getE02CNALB5()%>');
	document.forms[0].montod5.value = amt.toFixed(0).replace(/\d(?=(\d{3})+\.)/g, '$&,');
	amt = cnvN('<%=refCodes.getE02CNALB15()%>');
	document.forms[0].montoh5.value = amt.toFixed(0).replace(/\d(?=(\d{3})+\.)/g, '$&,');
}

function goFinancial() {
	var screenF = "6";
	pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD1095?SCREEN=" + screenF + "&TYPE=IFG";
  	finWindow = window.open(pg,"finWindow", "width=600,height=700,toolbar=no,scrollbars=yes,resizable=yes");
}
</SCRIPT>

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    boolean readonly = (userPO.getPurpose().equals("NEW")?false:true);
%>
<body>
<H3 align="center">Códigos de Referencia del Sistema - Segmentacion SARLAFT<br> 
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cnof_generic_segmentation_sarlaft.jsp, ESD0030"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0030" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
  <INPUT TYPE=HIDDEN NAME="E02CNOBNK" value="<%= currUser.getE01UBK()%>">
  <INPUT TYPE=HIDDEN NAME="E02CNALB1" VALUE="O">
  <INPUT TYPE=HIDDEN NAME="E02CNALB11" VALUE="O">
  <INPUT TYPE=HIDDEN NAME="E02CNALB2" VALUE="O">
  <INPUT TYPE=HIDDEN NAME="E02CNALB12" VALUE="O">
  <INPUT TYPE=HIDDEN NAME="E02CNALB3" VALUE="O">
  <INPUT TYPE=HIDDEN NAME="E02CNALB13" VALUE="O">
  <INPUT TYPE=HIDDEN NAME="E02CNALB4" VALUE="O">
  <INPUT TYPE=HIDDEN NAME="E02CNALB14" VALUE="O">
  <INPUT TYPE=HIDDEN NAME="E02CNALB5" VALUE="O">
  <INPUT TYPE=HIDDEN NAME="E02CNALB15" VALUE="O">
   
  <% int row = 0;%>
  <h4>Información Básica</h4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
        	<table class="tableinfo" width=100% height=10%>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trdark" %><%row++;%>"> 
            <td nowrap width="16%" align="right">Clasificación : </td>
            <td nowrap align="left"> 
               	<input type="text" name="E02CNOCFL" size="3" maxlength="2" value="<%= refCodes.getE02CNOCFL().trim()%>" readonly >
            </td>
          </tr> 
  
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trdark" %><%row++;%>"> 
            <td nowrap width="16%" align="right">Código : </td>
            <td nowrap align="left">
            	<eibsinput:text name="refCodes" property="E02CNORCD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" required="true" readonly="<%=readonly%>"/>
            	<eibsinput:text name="refCodes" property="E02CNODSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" required="true" readonly="false"/>
            </td>
          </tr> 

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trdark" %><%row++;%>"> 
            <td nowrap width="16%" align="right"> </td>
            <td nowrap align="left">
            </td>
          </tr>
          </table>
          
          <table class="tableinfo" width=100% height=10%>
          <tr id="<%= (row % 2 == 1) ? "trclear" : "trclear" %><%row++;%>">
            <td nowrap width="16%" align="right">Nivel 0 - Tipo : </td>
            <td nowrap align="left">
                <select name="E02CNOF04">
                  <option value=""  <%= refCodes.getE02CNOF04().trim().equals("")?"Selected":"" %>></option>
                  <option value="1" <%= refCodes.getE02CNOF04().trim().equals("1")?"Selected":"" %>>Cliente</option>
                  <option value="2" <%= refCodes.getE02CNOF04().trim().equals("2")?"Selected":"" %>>Prospecto</option>
                </select>
            </td>
          </tr>
          </table>
          <table class="tableinfo" width=100% height=10%>
          <tr id="<%= (row % 2 == 1) ? "trclear" : "trclear" %><%row++;%>">
            <td nowrap width="16%" align="right">Nivel 1 -Tipo Legal : </td>
            <td nowrap align="left">
                <select name="E02CNOF01" onchange="chgTipo(this.value)">
                  <option value=""  <%= refCodes.getE02CNOF01().trim().equals("")?"Selected":"" %>></option>
                  <option value="1" <%= refCodes.getE02CNOF01().trim().equals("1")?"Selected":"" %>>Jurídica</option>
                  <option value="2" <%= refCodes.getE02CNOF01().trim().equals("2")?"Selected":"" %>>Natural</option>
                </select>
            </td>
          </tr>
          </table>
          <table class="tableinfo" width=100% height=10%>
          <tr id="<%= (row % 2 == 1) ? "trclear" : "trclear" %><%row++;%>">
            <td nowrap width="16%" align="right">Nivel 2- Tipo de Vinculación : </td>
            <td nowrap align="left">
            	<select name="E02CNOF03" >
                	<option value=" " <% if (refCodes.getE02CNOF03().equals(" ")) out.print("selected"); %>>No Aplica</option>
                    <option value="1" <% if (refCodes.getE02CNOF03().equals("1")) out.print("selected"); %>>CLIENTE REGULAR</option>
                    <option value="2" <% if (refCodes.getE02CNOF03().equals("2")) out.print("selected"); %>>CONTRAPARTE</option>
                    <option value="3" <% if (refCodes.getE02CNOF03().equals("3")) out.print("selected"); %>>EMPLEADO</option>
                    <option value="7" <% if (refCodes.getE02CNOF03().equals("7")) out.print("selected"); %>>CODEUDOR</option>
                    <option value="9" <% if (refCodes.getE02CNOF03().equals("9")) out.print("selected"); %>>CB</option>
                    <option value="I" <% if (refCodes.getE02CNOF03().equals("I")) out.print("selected"); %>>INTERVINIENTE</option>
                    <option value="T" <% if (refCodes.getE02CNOF03().equals("T")) out.print("selected"); %>>MERCADO SECUNDARIO</option>
                    <option value="E" <% if (refCodes.getE02CNOF03().equals("E")) out.print("selected"); %>>USUARIO</option>
                    <option value="P" <% if (refCodes.getE02CNOF03().equals("P")) out.print("selected"); %>>PROVEEDOR</option>
                    <option value="C" <% if (refCodes.getE02CNOF03().equals("C")) out.print("selected"); %>>CONVENIO</option>
                    <option value="B" <% if (refCodes.getE02CNOF03().equals("B")) out.print("selected"); %>>BANCARIZACION</option>
                    <option value="L" <% if (refCodes.getE02CNOF03().equals("L")) out.print("selected"); %>>LIDER</option>
                    <option value="S" <% if (refCodes.getE02CNOF03().equals("S")) out.print("selected"); %>>CONCESIONARIO</option>
                </select>
            </td>
          </tr>
          </table>
          <div id="NATURAL" style="position:relative; display:none;">
          <table class="tableinfo" width=100% height=10%>
          <tr id="<%= (row % 2 == 1) ? "trclear" : "trclear" %><%row++;%>">
            <td nowrap width="16%" align="right">Nivel 3 - Tiene Empresa  : </td>
            <td nowrap align="left">
            	<select name="E02CNOF05" >
                  <option <%= refCodes.getE02CNOF05().trim().equals("")?"Selected":"" %> value=""  >No Aplica</option>                
                  <option <%= refCodes.getE02CNOF05().trim().equals("Y")?"Selected":"" %> value="Y">SI</option>
                  <option <%= refCodes.getE02CNOF05().trim().equals("N")?"Selected":"" %> value="N">NO</option>
                </select>    
            </td>
          </tr>
          </table>
          </div>
          
          <div id="JURIDICA" style="position:relative; display:none;">
          <table class="tableinfo" width=100% height=10%>
          <tr id="<%= (row % 2 == 1) ? "trclear" : "trclear" %><%row++;%>">
            <td nowrap width="16%" align="right">Nivel 3 - Tipo de Negocio  : </td>
            <td nowrap align="left">
            	<eibsinput:cnofc name="refCodes" property="E02CNOUS2" value="<%=refCodes.getE02CNOUS2()%>" required="true" flag="C7" fn_code="E02CNOUS2" fn_description="E02DSCUS2" />
                <input type="text" name="E02DSCUS2" size="45" value="<%= refCodes.getE02DSCUS2().trim()%>" readonly>    
            </td>
          </tr>
          </table>
          </div>
          <table class="tableinfo" width=100% height=10%>          
          <tr id="<%= (row % 2 == 1) ? "trclear" : "trclear" %><%row++;%>">
            <td nowrap width="16%" align="right">Nivel 4 - Variable Financiera 1 (IFG) : </td>
            <td nowrap align="left">
            	<input type="text" name="E02CNALN1" maxlength="3" size="4" value="<%=refCodes.getE02CNALN1() %>" onKeypress="enterInteger(event)">
            	<a href="javascript:goFinancial()">
            	<img src="<%=request.getContextPath()%>/images/eibs_deducciones.gif" title="Consulta Template Financieros" align="middle" border="0"></a>
            	</a>
            </td>            
          </tr> 
          <tr id="<%= (row % 2 == 1) ? "trclear" : "trclear" %><%row++;%>">
            <td nowrap width="16%" align="right">Rango de Variable Financiera  1: </td>
            <td nowrap align="left">
                Desde <input type="text" name="montod1" maxlength="13" size="20" value="<%=refCodes.getE02CNALB1() %>" onKeypress="enterInteger(event)">
                Hasta <input type="text" name="montoh1" maxlength="13" size="20" value="<%=refCodes.getE02CNALB11() %>" onKeypress="enterInteger(event)">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trclear" : "trclear" %><%row++;%>">
            <td nowrap width="16%" align="right">Nivel 4 - Variable Financiera 2 (IFG) : </td>
            <td nowrap align="left">
            	<input type="text" name="E02CNALN2" maxlength="3" size="4" value="<%=refCodes.getE02CNALN2() %>" onKeypress="enterInteger(event)">
            	<a href="javascript:goFinancial()">
            	<img src="<%=request.getContextPath()%>/images/eibs_deducciones.gif" title="Consulta Template Financieros" align="middle" border="0"></a>
            	</a>
            </td>            
          </tr> 
          <tr id="<%= (row % 2 == 1) ? "trclear" : "trclear" %><%row++;%>">
            <td nowrap width="16%" align="right">Rango de Variable Financiera 2 : </td>
            <td nowrap align="left">
                Desde <input type="text" name="montod2" maxlength="13" size="20" value="<%=refCodes.getE02CNALB2() %>" onKeypress="enterInteger(event)">
                Hasta <input type="text" name="montoh2" maxlength="13" size="20" value="<%=refCodes.getE02CNALB12() %>" onKeypress="enterInteger(event)">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trclear" : "trclear" %><%row++;%>">
            <td nowrap width="16%" align="right">Nivel 4 - Variable Financiera 3 (IFG) : </td>
            <td nowrap align="left">
            	<input type="text" name="E02CNALN3" maxlength="3" size="4" value="<%=refCodes.getE02CNALN3() %>" onKeypress="enterInteger(event)">
            	<a href="javascript:goFinancial()">
            	<img src="<%=request.getContextPath()%>/images/eibs_deducciones.gif" title="Consulta Template Financieros" align="middle" border="0"></a>
            	</a>
            </td>            
          </tr> 
          <tr id="<%= (row % 2 == 1) ? "trclear" : "trclear" %><%row++;%>">
            <td nowrap width="16%" align="right">Rango de Variable Financiera 3 : </td>
            <td nowrap align="left">
                Desde <input type="text" name="montod3" maxlength="13" size="20" value="<%=refCodes.getE02CNALB3() %>" onKeypress="enterInteger(event)">
                Hasta <input type="text" name="montoh3" maxlength="13" size="20" value="<%=refCodes.getE02CNALB13()%>" onKeypress="enterInteger(event)">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trclear" : "trclear" %><%row++;%>">
            <td nowrap width="16%" align="right">Nivel 4 - Variable Financiera 4 (IFG) : </td>
            <td nowrap align="left">
            	<input type="text" name="E02CNALN4" maxlength="3" size="4" value="<%=refCodes.getE02CNALN4() %>" onKeypress="enterInteger(event)">
            	<a href="javascript:goFinancial()">
            	<img src="<%=request.getContextPath()%>/images/eibs_deducciones.gif" title="Consulta Template Financieros" align="middle" border="0"></a>
            	</a>
            </td>            
          </tr> 
          <tr id="<%= (row % 2 == 1) ? "trclear" : "trclear" %><%row++;%>">
            <td nowrap width="16%" align="right">Rango de Variable Financiera 4 : </td>
            <td nowrap align="left">
                Desde <input type="text" name="montod4" maxlength="13" size="20" value="<%=refCodes.getE02CNALB4() %>" onKeypress="enterInteger(event)">
                Hasta <input type="text" name="montoh4" maxlength="13" size="20" value="<%=refCodes.getE02CNALB14() %>" onKeypress="enterInteger(event)">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trclear" : "trclear" %><%row++;%>">
            <td nowrap width="16%" align="right">Nivel 4 - Variable Financiera 5 (IFG) : </td>
            <td nowrap align="left">
            	<input type="text" name="E02CNALN5" maxlength="3" size="4" value="<%=refCodes.getE02CNALN5() %>" onKeypress="enterInteger(event)">
            	<a href="javascript:goFinancial()">
            	<img src="<%=request.getContextPath()%>/images/eibs_deducciones.gif" title="Consulta Template Financieros" align="middle" border="0"></a>
            	</a>
            </td>            
          </tr> 
          <tr id="<%= (row % 2 == 1) ? "trclear" : "trclear" %><%row++;%>">
            <td nowrap width="16%" align="right">Rango de Variable Financiera 5 : </td>
            <td nowrap align="left">
                Desde <input type="text" name="montod5" maxlength="13" size="20" value="<%=refCodes.getE02CNALB5() %>" onKeypress="enterInteger(event)">
                Hasta <input type="text" name="montoh5" maxlength="13" size="20" value="<%=refCodes.getE02CNALB15() %>" onKeypress="enterInteger(event)">
            </td>
          </tr>
          </table>
           
          <table class="tableinfo" width=100% height=10%>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trdark" %><%row++;%>">
            <td nowrap width="16%" align="right">Status : </td>
            <td nowrap align="left">
                <select name="E02CNODCB">
                  <option value="" <%= refCodes.getE02CNODCB().trim().equals("")?"Selected":"" %>>No Aplica</option>
                  <option value="A" <%= refCodes.getE02CNODCB().trim().equals("A")?"Selected":"" %>>Activo</option>
                  <option value="I" <%= refCodes.getE02CNODCB().trim().equals("I")?"Selected":"" %>>Inactivo</option>
                </select>
            </td>
          </tr> 
 		  </table>
        </table> 
      </td>
    </tr>
  </table>
 
  <br>
  
   <h4> </h4>  
      <div align="center">
         <%if(!userPO.getPurpose().equals("INQUIRY")) {%>
            <input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goAction();" >
         <%}%>
         <input id="EIBSBTN" type=button name="finish" value="Salir" onClick="finish();">
   </div>  
 
  </form>
  
</body>
	<SCRIPT language="JavaScript">
		<% 
		if (refCodes.getE02CNOF01().trim().equals("")) refCodes.setE02CNOF01("2"); 
		%>
		chgTipo('<%= refCodes.getE02CNOF01().trim()%>');
		cnvAmt();
	</SCRIPT> 
	<% if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) {%>
		<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"> </script>
	<% } %>
</html>


             


