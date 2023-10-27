<html>
<head>
<title>Confirmación de Borrar Registro</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<SCRIPT type="text/javascript">
 function finish(){
	document.forms[0].submit();
}
 setTimeout("finish();", 5000);
</SCRIPT>
 
</head>

<body>

  <h3 align="center">Confirmación  <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_corp_confirm, ESD0080" ></h3>
  <hr size="4">
  <FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEUT0120?SCREEN=100">
   <table width="100%" height="100%" border="1" bordercolor="#000000">
    <tr > 
      <td> 
        <table width="100%" height="100%">
          <tr> 
            <td align=center>
			  		El usuario <b><%=" "+currUser.getE01NME()%></b> se ha borrado el registro dentro del sistema.
            </td>
          </tr>
        </table>
      </td>
    </tr>
   </table>
</FORM>
</body>
</html>
