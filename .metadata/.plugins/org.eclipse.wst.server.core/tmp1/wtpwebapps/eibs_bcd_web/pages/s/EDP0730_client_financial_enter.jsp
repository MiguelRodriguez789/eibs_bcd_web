<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css"> 
<TITLE>Información Financiera</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id= "optList" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "cnofcP4" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "ses0730" class= "datapro.eibs.beans.EDP073001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos"	scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp">
<%
	String option = "";
	if (userPO.getOption().equals(" ")) {
	  option = "1";
    }
%>

<script type="text/javascript">
	
</script>

</HEAD>


<body bgcolor="#FFFFFF">

<script type="text/javascript">

function goCancel() {

	if (document.forms[0].RETORNO.value != "null" && document.forms[0].RETORNO.value !=  "") {
	window.location.href=  webapp +"<%=userPO.getHeader11()%>";
	} else {
	   	window.location.href="<%=request.getContextPath()%>/pages/background.jsp";
	}

//	window.location.href="<%=request.getContextPath()%>/pages/background.jsp";
// document.forms[0].submit(); 
	  		  
}


</script>

<h3 align="center">Propuesta de Crédito - Información Financiera de Clientes<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="client_financial_enter,EDP0730"></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.creditproposal.JSEDP0730" >
  <CENTER>
    <p><INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
    <p><INPUT TYPE=HIDDEN NAME="TITULO" VALUE="">
    <p><INPUT TYPE=HIDDEN NAME="PARAM" VALUE="">
    <p><INPUT type=HIDDEN NAME="RETORNO" value="<%=userPO.getHeader11()%>" >
    <p><INPUT type=HIDDEN NAME="OPT" value="<%=option%>" >
    
    </p>
    <table cellspacing="0" cellpadding="2" class="tbenter"  border=0  width=70% align="center" >
      <tr valign="middle"> 
        <td nowrap colspan="2" align="middle" >&nbsp;</td>
      </tr>	  
      <tr valign="middle"> 
        <td nowrap width=40% align="right" >
          N&uacute;mero de Cliente : 
        </td>
        <td nowrap width=40% align="left"> 
            <input type=TEXT name="E01IFMCUN" size=10 maxlength=9 onKeypress="enterInteger(event)">
            <a href="javascript:GetCustomerDescId('E01IFMCUN','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absmiddle" border="0" ></a> 
        </td>
      </tr>
      <tr valign="middle"> 
        <td nowrap width=40% align="right" > 
          Fecha corte: 
        </td>
        <td nowrap width=40% align="left">  
        	<eibsinput:date name="ses0730" fn_month="E01IFMFEM" fn_day="E01IFMFED" fn_year="E01IFMFEY" />
        </td>
      </tr>
      <tr valign="middle"> 
        <td nowrap width=40% align="right" > 
          Formato de Balance : 
        </td>
        <td nowrap width=40% align="left">  
            <select name="E01IFMCFO">
             	<%
                optList.initRow();
                while (optList.getNextRow()) {
                    if (optList.getFlag().equals("")) {
                    		out.println(optList.getRecord());
                    }        
                }                 
    			%> 
            </select>
        </td>
      </tr>
      
      
      <tr> 
        <td nowrap colspan="2" valign="middle" height="200">

		  <div align="center"> 
       			<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onclick="goConfirm()"> 
        </td>
      </tr>
      <tr> 
        <td nowrap colspan="2" valign="middle">&nbsp;</td>
      </tr>
    </table>
  </CENTER>
</FORM>
<script type="text/javascript">
  document.forms[0].E01IFMCUN.focus();
  document.forms[0].E01IFMCUN.select();

function goConfirm() {

	var selectedItem = document.forms[0].E01IFMCFO.selectedIndex;
	var selectedText = document.forms[0].E01IFMCFO.options[selectedItem].text;
	document.forms[0].TITULO.value = selectedText;
	document.forms[0].submit();
}

</script>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT type="text/javascript">;
            showErrors();
     </SCRIPT>
 <%
 }
%>
</BODY>
</HTML>
 