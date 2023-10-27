<!-- saved from url=(0022)http://internet.e-mail -->
<html>
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<%
  String client = currClient != null ? currClient.getE01CUSCUN() : ""; 
 %>


<style>
TH {
  background: #FFFFFF;
}
</style>
<script type="text/javascript">

	function validateSearch(type){
		if (type == "2"){
			return validateIdSearch();
	    } else {
	    	var NameSearch = document.getElementById("NameSearch").value;
	    	if (NameSearch.length < 1) {
				alert("Debe entrar algún criterio de búsqueda");
				return;
			}
	    	return NameSearch;
	    }	
	}
	
	function enter(){
		var NameSearch = validateSearch(getElementChecked("Type").value);
		if (isValidObject(NameSearch)) {
			document.getElementById("NameSearch").value = NameSearch;
	 		document.forms[0].submit();
		}
	}

	function typeClick(value){
  		if (value == "2" || value == "9") {    
			document.getElementById('DIVNAME').style.display='none' ;
			displayIdDivs(true, document.getElementById("COUNTRY").value);
  		} else {
  			displayIdDivs(false);
			document.getElementById('DIVNAME').style.display='block' ;
		    document.getElementById("NameSearch").focus();
  		}

	}

	function enterNameSearch(event) {
		var value = getElementChecked("Type").value;
		if (value == "1" || value == "5") {
			enterInteger(event);
		}
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

<h3 align="center">Posición del Cliente
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cif_client_search.jsp, ECIF010"></h3>
<hr size="4">

 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF010" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="Pos" id="Pos" VALUE="0">
  <table id="TBHELP" align="center" width="100%" height="90%">
    <tr> 
      <td width="10%" height="405">&nbsp;</td>
      <td width="90%" height="505"> 
        <table id="TBHELP" align="center" width="100%" height="60%" border="1">
          <tr> 
            <td> 
              <table id="TBHELP" align="center">
                <tr> 
                  <td width="50%" height="197"> 
                    <table  id="TBHELP" width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <th id="THHELP">Tipo de B&uacute;squeda</th>
                      </tr>
                      <tr> 
                        <td id="THHELP">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td> 
                          <input type="radio" name="Type" id="Type_1" value="1" onclick="typeClick('1')">
                          N&uacute;mero de Cliente</td>
                      </tr>
                      <tr> 
                        <td> 
                          <input type="radio" name="Type" id="Type_2" value="2" onclick="typeClick('2')">
                          Identificaci&oacute;ón </td>
                      </tr>
                      <tr> 
                        <td> 
                          <input type="radio" name="Type" id="Type_3" value="3" onclick="typeClick('3')" checked>
                          Nombre Corto</td>
                      </tr>
                       <%  if (!(currUser.getE01INT().trim().equals("11"))) {%>  
                      <tr> 
                        <td> 
                          <input type="radio" name="Type" id="Type_4" value="4" onclick="typeClick('4')">
                          Nombre Largo</td>
                      </tr>
                       <% }%>
                      <tr> 
                        <td> 
                          <input type="radio" name="Type" id="Type_5" value="5" onclick="typeClick('5')">
                          N&uacute;mero de Cuenta</td>
                      </tr>
                      <tr> 
                        <td> 
                          <input type="radio" name="Type" id="Type_6" value="6" onclick="typeClick('6')">
                          Referencia Nuestra</td>
                      </tr>
                      <tr> 
                        <td> 
                          <input type="radio" name="Type" id="Type_7" value="7" onclick="typeClick('7')">
                          Referencia de otro Banco</td>
                      </tr>
                    </table>
                  </td>

	 <td nowrap width="50%" height="197">
		<div id="DIVNAME" style="position:relative; display:none;">
        <input type="text" name="NameSearch"  id="NameSearch"  size=25 maxlength="30" onkeypress="enterNameSearch(event)">
        &nbsp;&nbsp; 
       </div>
       
		<jsp:include page="ESD0080_client_id_enter_template.jsp">
			<jsp:param name="search" value="false"/>
		</jsp:include>
     </td>

                </tr>
              </table>
            </td>
          </tr>
        </table>
           	<p>
          		<div align="center" > 
            		<input id="EIBSBTN" type=button name="Submit" onClick="enter()" value="Enviar">
          		</div>
  			
      </td>
      <td width="10%" height="405">&nbsp;</td>
    </tr>
  </table>	
</form>
<%
 	if (!client.equals("0") ) { 
%>
		<SCRIPT type="text/javascript">
			clickElement("Type", "1");
			document.getElementById("NameSearch").value = <%= client %>;
     	</SCRIPT>
<%
 	} else {
%>
		<script type="text/javascript">
			clickElement("Type", "3");
		</script>
<%  
	}
%>
</body>
</html>
