<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>Activos Fijos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

</head>
<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%>
<h3 align="center">Apertura Activos Fijos / Amortizaciones
	<img  src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="fix_enter_new.jsp, EFIX000"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.amort.JSEFIX000" >
  <input type=HIDDEN name="SCREEN" value="200">

<center>
  <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0">
    <tr> 
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td nowrap width="50%"> 
        <div align="right">Banco : </div>
      </td>
      <td nowrap width="50%"> 
        <input type="text" name="E01FIXBNK" size="3" maxlength="2" onKeypress="enterInteger(event)" value="<%= userPO.getBank().trim()%>">
        <img src="<%=request.getContextPath()%>/images/Check.gif" align="bottom" border="0"/>
      </td>
    </tr>
    <tr>
      <td nowrap width="50%">
        <div align="right">Agencia :</div>
      </td>
      <td nowrap width="50%">
        <input type="text" name="E01FIXBRN" size="5" maxlength="4" onKeyPress="enterInteger(event)" value="<%= userPO.getBranch().trim()%>">
		<a href="javascript:GetBranch('E01FIXBRN',document.forms[0].E01FIXBNK.value)">
			<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="middle" border="0" ></a> 
        <img src="<%=request.getContextPath()%>/images/Check.gif" align="bottom" border="0"/>
      </td>
    </tr>
    <tr> 
      <td nowrap width="50%"> 
         <div align="right">Clasificación :</div>
      </td>
      <td nowrap width="50%"> 
         <input type="text" name="E01FIXCLS" size="6" maxlength="5">
	  	 <a href="javascript:GetAct('E01FIXCLS', 'E01CLSDSC')">
	  	 	<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a>
         <input type="text" name="E01CLSDSC" size="42" maxlength="30" value="" readonly>
        <img src="<%=request.getContextPath()%>/images/Check.gif" align="bottom" border="0"/>
      </td>
    </tr>
  </table>


  <br>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td width="33%">
 <div align="center"> 
	      <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>      </td>
    </tr>
  </table>
</center>  
  </form>
</body>
</html>
