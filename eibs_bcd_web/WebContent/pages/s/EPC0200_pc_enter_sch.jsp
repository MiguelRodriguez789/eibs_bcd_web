<html>
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />


<style>
TH {
  background: #FFFFFF;
}
</style>
<script type="text/javascript">
function enter(){
var FromRecord = 0
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

 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEPC0200" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="100">
  <INPUT TYPE=HIDDEN NAME="Pos" VALUE="0">
  <table id="TBHELP" align="center" width="100%" height="90%">
    <tr> 
      <td width="10%" height="405">&nbsp;</td>
      <td width="80%" height="405"> 
        <table id="TBHELP" align="center" width="100%" height="60%" border="1">
          <tr> 
            <td> 
              <table id="TBHELP" align="center">
                <tr> 
                  <td width="50%" height="197"> 
                    <table  id="TBHELP" width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <th id="THHELP">Selección de Consolidación Por</th>
                      </tr>
                      <tr> 
                        <td id="THHELP">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td> 
                          <input type="radio" name="Type" value="1" checked>
                          Status</td>
                      </tr>
                      <tr> 
                        <td> 
                          <input type="radio" name="Type" value="2">
                          Oficial</td>
                      </tr>
                      <tr> 
                        <td> 
                          <input type="radio" name="Type" value="3">
                          Oficina</td>
                      </tr>
                      <tr> 
                        <td> 
                          <input type="radio" name="Type" value="4">
                          Producto</td>
                      </tr>
                      <tr> 
                        <td> 
                          <input type="radio" name="Type" value="5">
                          Moneda</td>
                      </tr>
                      <tr> 
                        <td> 
                          <input type="radio" name="Type" value="6">
                          Tipo de Vivienda</td>
                      </tr>
                      <tr> 
                        <td> 
                          <input type="radio" name="Type" value="7">
                          Tipo de Proyecto</td>
                      </tr>
                      <tr> 
                        <td> 
                          <input type="radio" name="Type" value="8">
                          Tipo de Obra</td>
                      </tr>
                      <tr> 
                        <td> 
                          <input type="radio" name="Type" value="9">
                          Destino de Fondos</td>
                      </tr>
                      <tr> 
                      <td> 
                          <input type="radio" name="Type" value="10">
                          Sicri</td>
                      </tr>
                      <tr> 
                        <td> 
                          <input type="radio" name="Type" value="11">
                          Codigo de Industria</td>
                      </tr>
                      <tr> 
                      <td> 
                          <input type="radio" name="Type" value="12">
                          Pais de Riesgo</td>
                      </tr>
                      <tr> 
                      <td> 
                          <input type="radio" name="Type" value="13">
                          Origen de Fondos</td>
                      </tr>
                      <tr> 
                      <td> 
                          <input type="radio" name="Type" value="14">
                          Centro de Costo</td>
                      </tr>

                    </table>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
          		<div align="center"> 
            		<input id="EIBSBTN" type=button name="Submit" OnClick="enter()" value="Enviar">
          		</div>
      </td>
      <td width="10%" height="405">&nbsp;</td>
    </tr>
  </table>	
</form>
</body>
</html>
