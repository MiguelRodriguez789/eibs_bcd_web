<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Registro al Sistema IVR</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "msgIVR" class= "datapro.eibs.beans.ECL0000DSMessage"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript">
function fillId() {
	var id = document.forms[0].E01CCLIDN.value;
	var idt = id.substring(0,1);
	document.forms[0].E01CCLIDT.value = idt;
	var idn = id.substring(1,9);
	document.forms[0].E01CCLIDN.value = idn;
}
</script>

</head>
<body >
<h3 align="center">Registro al Sistema IVR<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ivr_registry.jsp, ECL0000"> 
</h3>
<hr size="4">
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     //error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
%> 
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.misc.JSECL0000R" onSubmit="fillId()">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">

  <h4>Información del Cliente</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right">Identificación del Cliente :</div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
              	<input type="text" name="E01CCLIDT" size="2" maxlength="1" value="<%= msgIVR.getE01CCLIDT().trim()%>" readonly>
              	<input type="text" name="E01CCLIDN" size="10" maxlength="9" value="<%= msgIVR.getE01CCLIDN().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%" > 
            </td>
            <td nowrap colspan="3"> 
            </td>
          </tr>    
          <tr id="trclear"> 
            <td nowrap width="16%" > 
              <div align="right">Número de Cliente :</div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E01CCLCUN" size="10" maxlength="9" value="<%= msgIVR.getE01CCLCUN().trim()%>" readonly>
			   <a href="javascript:GetCustomerDetails('E01CCLCUN','E01CCLNA1','E01CCLIDN','','','','','','','','','','','','','','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a>
			  </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right">Nombre del Cliente :</div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E01CCLNA1" size="36" maxlength="35" value="<%= msgIVR.getE01CCLNA1().trim()%>" readonly>
              </div>
            </td>
          </tr>            
        </table>
      </td>
    </tr>
  </table>
  <h4>Información del PIN</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
			<TD nowrap width="16%">
				<DIV align="right">Número de PIN :</DIV>
			</TD>
			<TD nowrap width="20%">
				<DIV align="left">
					<INPUT type="text" name="E01CCLNEW" size="5" maxlength="4" value="<%= msgIVR.getE01CCLNEW().trim()%>">
				</DIV>
			</TD>
          </tr>            
        </table>
      </td>
    </tr>
  </table>
<BR>
<DIV align="center">
	<INPUT type="submit" name="EIBSBTNOK" id="EIBSBTN" value="Enviar">
</DIV>
</form>
</body>
</html>
