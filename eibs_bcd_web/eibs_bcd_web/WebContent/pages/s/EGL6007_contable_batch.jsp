<html>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<meta http-equiv="Refresh" CONTENT="5;url='<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEGL6007?SCREEN=0001'">
<head>
<title>Batch </title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

</head>

<body>

 
<h3 align="center">Confirmacion </h3>
<hr size="4">

  <table width="100%" height="100%" border="1" bordercolor="#000000">
    <tr > 
      <td> 
        <table width="100%" height="100%">
          <tr> 
             <td colspan=2><h4 style="text-align=center">La informacion ha sido procesado satisfactoriamente.<br>
                  Por favor espere para completar el proceso... </h4>
             </td> 
          </tr>
        </table>
      </td>
    </tr>
  </table>

</body>
</html>







