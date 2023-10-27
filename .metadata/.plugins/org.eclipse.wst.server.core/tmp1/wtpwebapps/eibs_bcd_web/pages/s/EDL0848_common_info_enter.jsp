<html> 
<head>
<title>Mantenimiento de Datos Comunes</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
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
  <h3 align="center">Mantenimiento de Datos Comunes<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="common_info_enter.jsp, EDL0848"> 
  </h3>
  <hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0848" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
  <table class="tableinfo">
      <tr> 
        <td nowrap> 
          <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
            <tr id="trdark"> 
              	<td nowrap width="25%"> 
                	<div align="right">Clasificación :</div>
              	</td>
              	<td nowrap width="75%">  
                	<SELECT name="E01DLRRTP">
						<OPTION value="01">Agentes Cobradores</OPTION>
						<OPTION value="02">Plazas de Pago</OPTION>
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
