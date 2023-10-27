<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Comisiones-Definición de Canales</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id= "ESD0203msg" class= "datapro.eibs.beans.ESD020303Message"  scope="session"/>
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<META name="GENERATOR" content="IBM WebSphere Studio">


<script type="text/javascript">

function CheckAcc(){

	if(document.forms[0].E03DDHBNK.value.length < 1){
		alert("Ingrese un código de Banco válido");
		document.forms[0].E03DDHBNK.value='';
		document.forms[0].E03DDHBNK.focus();
	}
	else {
		document.forms[0].submit();
	
	}

}

</SCRIPT>  



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
  <h3 align="center">Comisiones-Definición de Canales<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_channel_sel.jsp, ESD0203"></H3>
  <hr size="4">
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0203" >
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="301">
 	<INPUT TYPE=HIDDEN NAME="SEARCHC" VALUE="">

  <table class="tableinfo">
    <tr> 
      <td valign="middle" align="center" height=33 width="49%"> 
        <div align="right">Banco : </div>
      </td>
      <td valign="middle" align="center" height=33 width="51%"> 
        <div align="left"> 
          <input type="text" name="E03DDHBNK"  size=3 maxlength="2" value="01">
        </div>
      </td>
    </tr>
  </table>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
          <tr bgcolor="#FFFFFF"> 
            <td width="33%"> 
              <div align="center"> 
                <input id="EIBSBTN" type=submit name="Submit" value="Enviar" onClick="javascript:CheckAcc()">
              </div>
            </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td> 
              <div align="center"> </div>
            </td>
          </tr>
        </table>
              
</form>
</body>
</html>
