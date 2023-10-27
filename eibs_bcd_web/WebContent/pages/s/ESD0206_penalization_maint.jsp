<html>
<head>
<title>Formatos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="penalDet" class="datapro.eibs.beans.ESD020601Message"  scope="session" />

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

<script type="text/javascript">

function goConfirm() {
      ok = confirm("Esta seguro que desea crear/modificar este registro?");
	  if (ok) 
      {

// begin test
//          page= "${pageContext.request.contextPath}/pages/s/ESD0206_format_test.jsp"
//			CenterWindow(page,600,500,4);
// end test

	       document.forms[0].SCREEN.value="600";
	       document.forms[0].submit();
      }  
}

function goCancel() {

document.forms[0].SCREEN.value="100";
document.forms[0].submit(); 
	  		  
}

</script>

<H3 align="center">Parámetros de Penalización Money Market<br>Mantenimiento<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="penalization_maint.jsp, ESD0206"></H3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0206" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
  <h4>Rangos de Saldo Promedio Mensual</h4>  
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="20%"> 
             	<div align="right">Desde :</div>
            </td>
          </tr>
          </table>
      </td>
    </tr>
  </table>
  <h4>Cheques Girados en el Mes</h4>
<TABLE class="tableinfo">
	<TBODY>
		<TR bordercolor="#FFFFFF">
			<TD nowrap>
			<TABLE cellspacing="0" cellpadding="2" width="100%" border="0">
				<TBODY>
					<TR id="trdark">
						<TD nowrap width="20%">
							<DIV align="right">Hasta 3 Cheques :</DIV>
						</TD>
					</TR>
					<TR id="trclear">
						<TD nowrap width="20%">
							<DIV align="right">Hasta 9 Cheques :</DIV>
						</TD>
					</TR>
					<TR id="trdark">
						<TD nowrap width="20%">
							<DIV align="right">12 Cheques o más :</DIV>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
			</TD>
		</TR>
	</TBODY>
</TABLE>
<div align="center"> 
	        <input id="EIBSBTN" type="button" name="Submit" value="Enviar" onclick="goConfirm()"> 
            <INPUT id="EIBSBTN" type="button" name="Cancel" value="Cancelar" onclick="goCancel()">
	</div>
          
          <script type="text/javascript">
  		  
 		  
  		  </script>
          
  </form>
</body>
</html>
