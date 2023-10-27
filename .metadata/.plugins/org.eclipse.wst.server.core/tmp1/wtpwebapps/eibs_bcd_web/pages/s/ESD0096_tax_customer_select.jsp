<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Excepcion de Impuestos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">

function CheckACC(){

	if(document.forms[0].E01CUSCUM.value.length < 1){
		alert("Por favor entre un número de cuenta o número de identificación");
		document.forms[0].E01CUSCUM.value='';
		document.forms[0].E01CUSCUM.focus();
	} else {
	 	document.forms[0].submit();
		}
}

</SCRIPT>
</head>



<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />


<body bgcolor="#FFFFFF">


<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
	 out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<h3 align="center">Excepcion de Impuestos
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="tax_customer_select.jsp , ESD0096"> 
</h3><hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.taxes.JSESD0096" >
  <p> 
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
 <input type="hidden" name="E01CUSCUM" value='E01CUSCUN'>


  </p>



  <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0" bordercolor="#000000">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr><td>&nbsp;</td></tr>
		   <tr><td>&nbsp;</td></tr>
		    <tr><td>&nbsp;</td></tr>
			 <tr><td>&nbsp;</td></tr>
		  <tr> 
            <td nowrap width="50%"> 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="50%"> 
                <input type="text" name="E01CUSCUN" size="10" maxlength="9">
                <a href="javascript:GetCustomer('E01CUSCUN')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" ></a>
            </td>
          </tr>

    <tr>
      <td nowrap align="center">  
      </td>
    </tr>




        </table>
      </td>
    </tr>
  </table>

    	  <div align="center"> 
   		   <input id="EIBSBTN" type=button name="Submit" OnClick="CheckACC()" value="Enviar">
    	  </div>




<script language="JavaScript">
  document.forms[0].E01CUSCUM.focus();
  document.forms[0].E01CUSCUM.select();
</script>

</form>
</body>
</html>
