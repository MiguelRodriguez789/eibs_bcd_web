<html>
<head>
<title>Códigos de Referencia</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

$(document).ready(function(){
  	
  	setInterval(showTypeAcd(), 100);
	
	$("#E02ACD").click(function(event){
    	$.get(GetApplicationCode('E02CNOACD','E02DSCUS3')); });
	
	$("#E02CNOACD").on("propertychange change keyup paste click paste", function(){
    showTypeAcd(); })
});
</SCRIPT>

</head>

<jsp:useBean id="refCodes" class="datapro.eibs.beans.ESD003002Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>"); 
    }
    
%>


<H3 align="center">Códigos de Referencias del Sistema - Tipos de Proceso<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cnof_process_type_details.jsp, ESD0030"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0030" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
  <h4>Informaci&oacute;n B&aacute;sica</h4>
  
  <%int row = 0; %>  
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%"> 
              <div align="right">Clasificación :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E02CNOCFL" readonly size="3" maxlength="2" value="<%= refCodes.getE02CNOCFL().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="23"> 
              <div align="right">Código :</div>
            </td>
            <td nowrap height="23"> 
              <div align="left"> 
                <input type="text" name="E02CNORCD" size="6" maxlength="4" value="<%= refCodes.getE02CNORCD().trim()%>">
              </div>
            </td>
          </tr>
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="23"> 
              <div align="right">Descripción :</div>
            </td>
            <td nowrap height="23"> 
              <div align="left"> 
                <input type="text" name="E02CNODSC" size="50" maxlength="45" value="<%= refCodes.getE02CNODSC().trim()%>" >
              </div>
            </td>
          </tr>
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="19"> 
              <div align="right">Chequear Dígito :</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <select name="E02CNOF01">
                  
	              <option value=" " <% if (!(refCodes.getE02CNOF01().equals("0") ||
	              							refCodes.getE02CNOF01().equals("1") ||
	              							refCodes.getE02CNOF01().equals("N"))) out.print("selected"); %>></option>
                  <option value="0" <%if (refCodes.getE02CNOF01().equals("0")) { out.print("selected"); }%>>Módulo 10</option>
                  <option value="1" <%if (refCodes.getE02CNOF01().equals("1")) { out.print("selected"); }%>>Módulo 11</option>
                  <option value="N" <%if (refCodes.getE02CNOF01().equals("N")) { out.print("selected"); }%>>No Aplica</option>
                  
                </select>
              </div>
            </td>
          </tr>
          <%if (refCodes.getE02CNOCFL().equals("04")) {%>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="19"> 
              <div align="right">Destino del Producto:</div>
            </td>
            <td nowrap height="19" align="left"> 
                <select name="E02CNOF04">
	              <option value=" " <% if (!(refCodes.getE02CNOF04().equals("T") ||
	              							refCodes.getE02CNOF04().equals("F") ||
	              							refCodes.getE02CNOF04().equals("G") ||
	              							refCodes.getE02CNOF04().equals("E") ||
	              							refCodes.getE02CNOF04().equals("R") ||
	              							refCodes.getE02CNOF04().equals("A") ||
	              							refCodes.getE02CNOF04().equals("C") ||
	              							refCodes.getE02CNOF04().equals("H") ||
	              							refCodes.getE02CNOF04().equals("I") ||
	              							refCodes.getE02CNOF04().equals("M") ||
	              							refCodes.getE02CNOF04().equals("P") ||
	              							refCodes.getE02CNOF04().equals("N"))) out.print("selected"); %>></option>
                  <option value="T" <%if (refCodes.getE02CNOF04().equals("T")) { out.print("selected"); }%>>Tesorería</option>
                  <option value="F" <%if (refCodes.getE02CNOF04().equals("F")) { out.print("selected"); }%>>Fideicomiso</option>
                  <option value="G" <%if (refCodes.getE02CNOF04().equals("G")) { out.print("selected"); }%>>Factoring</option>
                  <option value="E" <%if (refCodes.getE02CNOF04().equals("E")) { out.print("selected"); }%>>FEM</option>
                  <option value="R" <%if (refCodes.getE02CNOF04().equals("R")) { out.print("selected"); }%>>Terceros</option>
                  <option value="A" <%if (refCodes.getE02CNOF04().equals("A")) { out.print("selected"); }%>>Todos los anteriores</option>
                  <option value=" " <%if (refCodes.getE02CNOF04().equals(" ")) { out.print("selected"); }%>>Prestamos Comercial</option>
                  <option value="C" <%if (refCodes.getE02CNOF04().equals("C")) { out.print("selected"); }%>>Prestamos Consumo</option>
		          <option value="H" <%if (refCodes.getE02CNOF04().equals("H")) { out.print("selected"); }%>>Prestamos Hipotecarios</option>                 
                  <option value="I" <%if (refCodes.getE02CNOF04().equals("I")) { out.print("selected"); }%>>Cupo Rotativo</option>
                  <option value="M" <%if (refCodes.getE02CNOF04().equals("M")) { out.print("selected"); }%>>Prestamos Microcredito</option>
                  <option value="P" <%if (refCodes.getE02CNOF04().equals("P")) { out.print("selected"); }%>>Portafolio</option>
                  <option value="N" <%if (refCodes.getE02CNOF04().equals("N")) { out.print("selected"); }%>>No Aplica</option>
                </select>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="16%" height="19" align="right">Tipo Moneda Transf./Tesorería  : </td>
            <td nowrap height="19" align="left"> 
                <select name="E02CNOCPF">
	              <option value=" " <% if (!(refCodes.getE02CNOCPF().equals("0") ||
	              							refCodes.getE02CNOCPF().equals("1") ||
	              							refCodes.getE02CNOCPF().equals("N"))) out.print("selected"); %>></option>
                  <option value="1" <%if (refCodes.getE02CNOCPF().equals("1")) { out.print("selected"); }%>>Moneda Nacional</option>
                  <option value="2" <%if (refCodes.getE02CNOCPF().equals("2")) { out.print("selected"); }%>>Moneda Extranjera</option>
                  <option value="3" <%if (refCodes.getE02CNOCPF().equals("3")) { out.print("selected"); }%>>Ambas</option>
                </select>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
          	<td nowrap width="16%" height="19" align="right">Tipo de Proceso  : </td>
          	<td nowrap height="19" align="left">
              <input type="text" name="E02CNOACD" size="3" maxlength="2" value="<%= refCodes.getE02CNOACD().trim()%>" id="E02CNOACD" onfocus="showTypeAcd()">
              <input type="text" name="E02DSCUS3" size="40" maxlength="35" value="<%= refCodes.getE02DSCUS3().trim()%>" readonly>
              <a href="#" id="E02ACD">
              <img src="<%=request.getContextPath()%>/images/1b.gif" title="Código de Aplicación" align="bottom" border="0"></a>
			</td>
		  </tr>	 
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
          	<td nowrap width="16%" height="19" align="right">
          	<div id="hiddenDivPLPT">
            Sub Proceso :
            </div>
          	</td>
          	<td nowrap height="19" align="left">
          		<div id="hiddenDivPLP">
          		<select name="E02CNOAPC">
                  <option value=" " <%if (refCodes.getE02CNOAPC().equals(" ")) { out.print("selected"); }%>></option>
                  <option value="B" <%if (refCodes.getE02CNOAPC().equals("B")) { out.print("selected"); }%>>Bonos</option>
                  <option value="A" <%if (refCodes.getE02CNOAPC().equals("A")) { out.print("selected"); }%>>Acciones Comunes</option>
                  <option value="P" <%if (refCodes.getE02CNOAPC().equals("P")) { out.print("selected"); }%>>Acciones Preferentes</option>
                  <option value="F" <%if (refCodes.getE02CNOAPC().equals("F")) { out.print("selected"); }%>>Fondos Mutuos</option>
                </select>
          		</div>
			</td>
		  </tr>	
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">   
            <td nowrap width="16%" height="23" align="right">
            <div id="hiddenDivCCRT">
            Sub Proceso :
            </div> 
            </td>
            <td nowrap height="23" align="left">
            	<div id="hiddenDivCCR">
            		<select name="E02CNOF03">
                  	<option value="N" <%if (refCodes.getE02CNOF03().equals("N")) { out.print("selected"); }%>></option>
                  	<option value="O" <%if (refCodes.getE02CNOF03().equals("O")) { out.print("selected"); }%>>de Importación</option>
                  	<option value="I" <%if (refCodes.getE02CNOF03().equals("I")) { out.print("selected"); }%>>de Exportación</option>
                  	<option value="S" <%if (refCodes.getE02CNOF03().equals("S")) { out.print("selected"); }%>>Standby Emitida</option>
                  	<option value="R" <%if (refCodes.getE02CNOF03().equals("R")) { out.print("selected"); }%>>Standby Recibida</option>
                	</select>
            	</div> 
            </td>
          </tr>  
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">   
            <td nowrap width="16%" height="23" align="right">Código Pantalla Tesorería : </td>
            <td nowrap height="23" align="left"> 
                <input type="text" name="E02CNOSCY" size="4" maxlength="3" value="">
            </td>
          </tr>
          <%}%>
        </table>
      </td>
    </tr>
  </table>
    
<div id="hiddenDivAmort">
  <h4>Información para Amortización</h4>  
  
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="19" align="right">Tipo de Amortizacion : </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <select name="E02CNODCB">
                  <option value="L" <%if (refCodes.getE02CNODCB().equals("L")) { out.print("selected"); }%>>Linea Recta Amortizacion Uniforme</option>
                  <option value="S" <%if (refCodes.getE02CNODCB().equals("S")) { out.print("selected"); }%>>Flat Total En una Fecha Indicada</option>
                  <option value="M" <%if (refCodes.getE02CNODCB().equals("M")) { out.print("selected"); }%>>En Relacion a la Curva de Capital</option>
                  <option value="I" <%if (refCodes.getE02CNODCB().equals("I")) { out.print("selected"); }%>>En Relacion a la Curva de Intereses</option>
                  <option value="P" <%if (refCodes.getE02CNODCB().equals("P")) { out.print("selected"); }%>>En relacion a el Plazo</option>
                </select>
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="19"> 
              <div align="right">Caracteristicas  :</div>
            </td>
            <td nowrap height="19" align="left"> 
                <select name="E02CNOTCF">
                  <option value="D" <%if (refCodes.getE02CNOTCF().equals("D")) { out.print("selected"); }%>>Devengo de Intereses</option>
                  <option value="P" <%if (refCodes.getE02CNOTCF().equals("P")) { out.print("selected"); }%>>Indicador de Productividad</option>
                </select>
            </td>
          </tr>    
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%"> 
              <div align="right">Monto Minimo Amortizar :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E02CNOCHG" size="16" maxlength="15" value="<%= refCodes.getE02CNOCHG().trim()%>">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</div>
  
  <div align="center">
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>
  </form>
    
<SCRIPT type="text/javascript">

function showTypeAcd(){
	var acd = document.getElementById("E02CNOACD");
    acd.value = acd.value.toUpperCase();
	if(acd.value == '92'){
		setVisibility(document.getElementById("hiddenDivAmort"), "visible");
	} else {
		setVisibility(document.getElementById("hiddenDivAmort"), "hidden");	
	}
	if(acd.value == '13'){
		setVisibility(document.getElementById("hiddenDivPLP"), "visible");
		setVisibility(document.getElementById("hiddenDivPLPT"), "visible");
	} else {
		setVisibility(document.getElementById("hiddenDivPLP"), "hidden");
		setVisibility(document.getElementById("hiddenDivPLPT"), "hidden");	
	}
	if(acd.value == '40'){
		setVisibility(document.getElementById("hiddenDivCCR"), "visible");
		setVisibility(document.getElementById("hiddenDivCCRT"), "visible");
	} else {
		setVisibility(document.getElementById("hiddenDivCCR"), "hidden");
		setVisibility(document.getElementById("hiddenDivCCRT"), "hidden");	
	}
}

</SCRIPT>
  
</body>
</html>
