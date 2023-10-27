


<html> 
<head>
<title>Cambio de Producto</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>


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
  <h3 align="center">Cambio de Producto<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="product_change_enter.jsp, ESD0900"> 
  </h3>
  <hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0900" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="E01CHGTYP" VALUE="">
  <p>&nbsp;</p>
  <table class="tableinfo">
      <tr> 
        <td nowrap> 
          <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
            <tr id="trclear"> 
              <td nowrap width="25%"> 
                <div align="right">Tipo de Cambio :</div>
              </td>
              <td nowrap width="75%">  
                <SELECT name="changeType">
					<OPTION value="A">Cambio Individual en Cuenta</OPTION>
					<OPTION value="M">Cambio Masivo</OPTION>
				</SELECT>
			  </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  <BR>
<p align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar" >
  </p>
      
</form>
</body>
</html>
