<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Banesco - Abonos Masivos, opcion manual (Aprobaci�n)</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">

<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "lnScheme" class= "datapro.eibs.beans.EDL111201Message"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT> 
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
builtHPopUp();

function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }

function CheckACC(){

if ( document.forms[0].E01CNOMID.value.length < 1) {
  alert("Debe entrar un c�digo de empresa v�lido");
  document.forms[0].E01CNOMID.value='';
  document.forms[0].E01CNOMID.focus();
  return false;
}
else {

if ( document.forms[0].E01OFFOPC.value.length < 1) {
//  alert("Debe entrar un concepto v�lido");
//  document.forms[0].E01OFFOPC.value='';
//  document.forms[0].E01OFFOPC.focus();
  return true;
}
else {
  return true;
  }


//  return true;
  }



}

</SCRIPT>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%> 

</head>

<body bgcolor="#FFFFFF">

<h3 align="center">Abonos Masivos, Proceso Manual - Aprobaci�n<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_enter_sch_app,EDL1112"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL1112">
  <p><INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="700"></p>
  <p>&nbsp;</p>
  <table class="tableinfo">
    <tr > 
      <td nowrap height="143"> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="32%"> 
              <div align="right"><b>Compa�ia de Pago :</b></div>
            </td>
            <td nowrap width="3%">&nbsp;</td>
            <td nowrap width="23%"> 
              <div align="left"> 
                <input type="text" name="E01CNOMID" size="7" maxlength="6"  value="<%= userPO.getHeader7()%>">
              <a href="javascript:GetCodeCNOFC('E01CNOMID','2D')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a>	                         </div>
            </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>

	  <div align="center"> 
   		 <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  	  </div>
  
</form>
</body>
</html>
