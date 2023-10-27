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

function chgTipo(p, n) { 
	var s = "";
	var c = getElement("E02CNORCD").value;
	if (n == 1) {
	  s = getElement("E02CNOF05").value;
	} else {
	  s = getElement("E02CNOF03").value;
	}  
	
	if ((p == s && p != "")) {
		alert("Variables NO pueden ser iguales");  
		return;
	}
	Edades.style.display='none';
	Montos.style.display='none';
	if (p == "E") {  // Edad
		Edades.style.display='block';
	} else if (p == "I") {   // Información Financiera
		Montos.style.display='block';
	}
	if (s == "E") {  // Edad
		Edades.style.display='block';
	} else if (s == "I") {   // Información Financiera
		Montos.style.display='block';
	}
	var amt = cnvN('<%=refCodes.getE02CNOMXC()%>');
	document.forms[0].sueldod.value = amt.toFixed(0).replace(/\d(?=(\d{3})+\.)/g, '$&,');
	document.forms[0].montod.value = amt.toFixed(0).replace(/\d(?=(\d{3})+\.)/g, '$&,');
	amt = cnvN('<%=refCodes.getE02CNOMNC()%>');
	document.forms[0].sueldoh.value = amt.toFixed(0).replace(/\d(?=(\d{3})+\.)/g, '$&,');
	document.forms[0].montoh.value = amt.toFixed(0).replace(/\d(?=(\d{3})+\.)/g, '$&,');
 }
 
 function cnvN(s) {
	s = s.replace(/,/g,'');
	return parseFloat(s);
}
 function goAction() {
 	var t = getElement("E02CNOF01").value;
 	var p = getElement("E02CNOF03").value;
 	var s = getElement("E02CNOF05").value;
 	if (p == s) {
		alert("Variables NO pueden ser iguales.");
		return;
	}
	if (t != "2") {
		document.forms[0].E02CNOUS3.value = "";
		document.forms[0].E02DSCUS3.value = "No Aplica";
	}
	
	if (p == "I" || s == "I") {
	
		document.forms[0].E02CNOMXC.value = document.forms[0].montod.value;
		document.forms[0].E02CNOMNC.value = document.forms[0].montoh.value;
	}
	
	document.forms[0].submit();
}

function goFinancial() {
	var screenF = "6";
	pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD1095?SCREEN=" + screenF + "&TYPE=IFG";
  	finWindow = window.open(pg,"finWindow", "width=600,height=700,toolbar=no,scrollbars=yes,resizable=yes");
}

function ShowRevolvente(r) {
	     
  		if(r == ('1')){
   			document.getElementById("revolvente").style.display = 'table';
			document.getElementById("norevolvente").style.display = 'none';
   		  } else if(r == ('2')){
  		  	document.getElementById("revolvente").style.display = 'none';
			document.getElementById("norevolvente").style.display = 'table';
  		  	 
  		  } else if(r == ('3')){
  			document.getElementById("revolvente").style.display = 'table';
			document.getElementById("norevolvente").style.display = 'table';
  			 
          } else {
			document.getElementById("revolvente").style.display = 'none';
			document.getElementById("norevolvente").style.display = 'none';
			
		}	
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
<H3 align="center">Códigos de Referencia del Sistema - Segmentacion de Clientes<br> <%= userPO.getSource()%>
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cnof_generic_segmentation_client.jsp, ESD0030"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0030" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
  <INPUT TYPE=HIDDEN NAME="E02CNOBNK" value="<%= currUser.getE01UBK()%>">
  <INPUT TYPE=HIDDEN NAME="E02CNOMXC" VALUE="O">
  <INPUT TYPE=HIDDEN NAME="E02CNOMNC" VALUE="O">
   
  <% int row = 0;%>
  <h4>Información Básica</h4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" align="right">Clasificación : </td>
            <td nowrap align="left"> 
               	<input type="text" name="E02CNOCFL" size="3" maxlength="2" value="<%= refCodes.getE02CNOCFL().trim()%>" readonly >
            </td>
          </tr>  
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" align="right">Código : </td>
            <td nowrap align="left">
            	<eibsinput:text name="refCodes" property="E02CNORCD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" required="true" readonly="<%=readonly%>"/>
            	<eibsinput:text name="refCodes" property="E02CNODSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" required="true" readonly="false"/>
            </td>
          </tr> 
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" align="right"> </td>
            <td nowrap align="left">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="16%" align="right">Tipo Legal : </td>
            <td nowrap align="left">
                <select name="E02CNOF01">
                  <option value=""  <%= refCodes.getE02CNOF01().trim().equals("")?"Selected":"" %>>No Aplica</option>
                  <option value="1" <%= refCodes.getE02CNOF01().trim().equals("1")?"Selected":"" %>>Jurídica</option>
                  <option value="2" <%= refCodes.getE02CNOF01().trim().equals("2")?"Selected":"" %>>Natural</option>
                </select>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="16%" align="right">Fuerza Comercial : </td>
            <td nowrap align="left">
                <eibsinput:cnofc name="refCodes" property="E02CNOUS2" value="<%=refCodes.getE02CNOUS2()%>" required="true" flag="TB" fn_code="E02CNOUS2" fn_description="E02DSCUS2" />
                <input type="text" name="E02DSCUS2" size="45" value="<%= refCodes.getE02DSCUS2().trim()%>" readonly>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="16%" align="right">Ocupación : </td>
            <td nowrap align="left">
                <eibsinput:cnofc name="refCodes" property="E02CNOUS3" value="<%=refCodes.getE02CNOUS3()%>" required="true" flag="C4" fn_code="E02CNOUS3" fn_description="E02DSCUS3" />
                <input type="text" name="E02DSCUS3" size="45" value="<%= refCodes.getE02DSCUS3().trim()%>" readonly>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="16%" align="right">Variable 1: </td>
            <td nowrap align="left">
                <select name="E02CNOF03" onchange="chgTipo(this.value, 1)">
                  <option <%= refCodes.getE02CNOF03().trim().equals("")?"Selected":"" %> value=""  >No Aplica</option>                
                  <option <%= refCodes.getE02CNOF03().trim().equals("E")?"Selected":"" %> value="E"  >Edad</option>
                  <option <%= refCodes.getE02CNOF03().trim().equals("I")?"Selected":"" %> value="I"  >Información Financiera</option>
                </select>
            </td>
          </tr> 
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="16%" align="right">Variable 2: </td>
            <td nowrap align="left">
                <select name="E02CNOF05" onchange="chgTipo(this.value, 2)" >
                  <option <%= refCodes.getE02CNOF05().trim().equals("")?"Selected":"" %> value=""  >No Aplica</option>                
                  <option <%= refCodes.getE02CNOF05().trim().equals("E")?"Selected":"" %> value="E"  >Edad</option>
                  <option <%= refCodes.getE02CNOF05().trim().equals("I")?"Selected":"" %> value="I"  >Información Financiera</option>
                </select>
            </td>
          </tr> 
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="16%" align="right">Nicho a Asignar : </td>
            <td nowrap align="left">
                <eibsinput:cnofc name="refCodes" property="E02CNOUS1" value="<%=refCodes.getE02CNOUS1()%>" required="true" flag="CK" fn_code="E02CNOUS1" fn_description="E02DSCUS1" />
       	        C
            </td>
          </tr> 
         
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="16%" align="right">Status : </td>
            <td nowrap align="left">
                <select name="E02CNODCB">
                  <option value="" <%= refCodes.getE02CNODCB().trim().equals("")?"Selected":"" %>>No Aplica</option>
                  <option value="A" <%= refCodes.getE02CNODCB().trim().equals("A")?"Selected":"" %>>Activo</option>
                  <option value="I" <%= refCodes.getE02CNODCB().trim().equals("I")?"Selected":"" %>>Inactivo</option>
                </select>
            </td>
          </tr> 
 		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="16%" align="right">Cupo Rotativo : </td>
            <td nowrap align="left">
                <select name="E02CNOF06" id="E02CNOF06" onchange="ShowRevolvente(this.value)" >
                  <option value="" <%= refCodes.getE02CNOF06().trim().equals("")?"Selected":"" %> value=""  >No Aplica</option>                
                  <option value="1" <%= refCodes.getE02CNOF06().trim().equals("1")?"Selected":"" %> value="1"  >No Revolvente</option>
                  <option value="2" <%= refCodes.getE02CNOF06().trim().equals("2")?"Selected":"" %> value="2"  >Revolvente</option>
                  <option value="3" <%= refCodes.getE02CNOF06().trim().equals("3")?"Selected":"" %> value="3"  >Ambos</option>
                </select>
           	</td>
          </tr> 
          <table id="revolvente"  class=".tableinfo" style="display: none; height:100%; width: 100%;">
         
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="16%" align="right">Nro.Utilizaciones Revolvente : </td>
            <td nowrap align="left">
               	<input type="text" name="E02CNOMIC" size="4" maxlength="4" value="<%= refCodes.getE02CNOMIC().trim()%>" onKeypress="enterInteger(event)">
           	</td>
           </tr>
         </table>
         <table id="norevolvente"  class=".tableinfo" style="display: none; height:100%; width: 100%;">
          
          	 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="16%" align="right">Nro.Utilizaciones No Revolvente : </td>
            <td nowrap align="left">
               	<input type="text" name="E02CNOMID" size="4" maxlength="4" value="<%= refCodes.getE02CNOMID().trim()%>" onKeypress="enterInteger(event)">
            </td>
          </tr> 
          </table>
        </table> 
      </td>
    </tr>
  </table>
 
  <br>

 
 <div id="Edades" style="position:relative; display:none;">
  	<H4>Rango de Edades</H4>
          <table class="tableinfo" width=100% height=10%>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
               <td nowrap width="16%" align="right">Rango de Edad : </td>
               <td nowrap align="left">
            	Desde <eibsinput:text name="refCodes" property="E02CNOFRP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="4" maxlength="3" required="false" />
                Hasta <eibsinput:text name="refCodes" property="E02CNOPXT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="4" maxlength="3" required="false" />
                Años.  
            	</td>
            </tr>
        </table> 
  </div>
        
  
  <div id="Montos" style="position:relative; display:none;">
  	<H4>Rango de Información Financiera</H4>
        <table class="tableinfo" width=100% height=10%>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="16%" align="right">Montos : </td>
            <td nowrap align="left">
            	Desde <input type="text" name="montod" maxlength="13" size="20" value="<%=refCodes.getE02CNOMXC() %>" onKeypress="enterInteger(event)">
                Hasta <input type="text" name="montoh" maxlength="13" size="20" value="<%=refCodes.getE02CNOMNC() %>" onKeypress="enterInteger(event)">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="16%" align="right">Nro de Secuencia de Estado Financiero General : </td>
            <td nowrap align="left">
            	<input type="text" name="E02CNOBRN" maxlength="3" size="4" value="<%=refCodes.getE02CNOBRN() %>" onKeypress="enterInteger(event)">
            	<a href="javascript:goFinancial()">
            	<img src="<%=request.getContextPath()%>/images/eibs_deducciones.gif" title="Consulta Template Financieros" align="middle" border="0"></a>
            	</a>
            </td>
          </tr>
        </table> 
  </div>     
  
   <h4>&nbsp;</h4>  
      <div align="center">
         <%if(!userPO.getPurpose().equals("INQUIRY")) {%>
            <input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goAction();" >
         <%}%>
         <input id="EIBSBTN" type=button name="Submit" value="Salir" onClick="finish();">
   </div>  
   </form>
    <SCRIPT language="JavaScript">
		chgTipo('<%= refCodes.getE02CNOF03().trim()%>', 1);
		ShowRevolvente(document.getElementById("E02CNOF06").value);
	</SCRIPT> 
</body>
	
	<% if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) {%>
		<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"> </script>
	<% } %>
</html>


             


