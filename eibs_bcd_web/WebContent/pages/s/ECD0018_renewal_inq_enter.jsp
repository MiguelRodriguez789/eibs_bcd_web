<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Consulta de Renovación</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id= "msgCD" class= "datapro.eibs.beans.ECD0018DSMessage"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript">
function validate() {
	if (document.forms[0].E01CDPMMD.value == "" ||
		document.forms[0].E01CDPYYD.value == "" ||
		document.forms[0].E01CDPMMF.value == "" ||
		document.forms[0].E01CDPYYF.value == "") {
		alert("Por favor, introduzca el intervalo de fechas completo.");
		return false;
	}
	else {
		return true;
	}
}

function goDetail(){
	document.forms[0].SCREEN.value = 102;
	document.forms[0].submit();
}

function goGeneral(){
	document.forms[0].SCREEN.value = 101;
	document.forms[0].submit();
}

</script>

</head>
<body>
<h3 align="center">Consulta de Renovación
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="renewal_inq_enter.jsp, ECD0018"> 
</h3>
<hr size="4">
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0"); 
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
%> 
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECD0018" onSubmit="return validate();">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="">

  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="trdark"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Agencia : </DIV>
            </TD><TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01CDPSUR" size="4" maxlength="3" value="<%= msgCD.getE01CDPSUR() %>">
                <INPUT type="text" name="D01CDPSUR" size="36" maxlength="35" value="" readonly>
				<A href="javascript:GetBranch('E01CDPSUR','','D01CDPSUR')">
				<IMG src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></A>
              </DIV>
            </TD>
            <td nowrap width="16%" > 
            </td>
            <td nowrap width="20%" > 
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="16%" > 
              <div align="right">Fecha Desde : </div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <INPUT type="text" name="E01CDPMMD" size="3" maxlength="2" value="" onKeyPress="enterInteger(event)">
                <INPUT type="text" name="E01CDPYYD" size="3" maxlength="2" value="" onKeyPress="enterInteger(event)">
                (mes/año)
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right">Fecha Hasta : </div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <INPUT type="text" name="E01CDPMMF" size="3" maxlength="2" value="" onKeyPress="enterInteger(event)">
                <INPUT type="text" name="E01CDPYYF" size="3" maxlength="2" value="" onKeyPress="enterInteger(event)">
                (mes/año)
              </div>
            </td>
          </tr>

         </table>
      </td>
    </tr>
  </table>
  <br>
  <div align="center"> 
		<INPUT id="EIBSBTN" type="button" name="Detail" value="Detalle" onclick="goDetail()">
		<INPUT id="EIBSBTN" type="button" name="General" value="General" onclick="goGeneral()">
  </div>
  </form>
</body>
</html>
