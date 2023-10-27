<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html> 
<head>
<title>Mantenimiento de Stock Chequera/Talonario Universal</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "msgMT" class= "datapro.eibs.beans.ECH020501Message"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script type="text/javascript">

function capturar(){
	
	var valor="";
	var medio=document.getElementsByName("medio");
	for(var i=0;i<medio.length;i++)
        {
            if(medio[i].checked){
                valor=medio[i].value;
                break;
             }
        }
	document.forms[0].E01CHLFL1.value=valor;

}

</script>

<%    
  	msgMT.setE01CHLBNK(msgMT.getE01CHLBNK());
%>

</head>
<body>

<H3 align="center">Mantenimiento de Stock Chequera/Talonario Universal
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="stock_checks_enter,ECH0205">
</H3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECH0205" onsubmit="capturar()">
   
 <p> 
 	<INPUT TYPE=HIDDEN NAME="E01CHLFL1" VALUE="">
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
  </p>
<%int row = 0; %>
  <table class="tableinfo">
   <tr> 
   <td>
    <table cellspacing=0 cellpadding=2 width="100%" border="0">    

     <tr id="<%= (row % 2 == 1) ? "trclear" : "trdark" %><%row++;%>"> 
      <td nowrap width="50%"> 
        <div align="right">Banco : </div>
      </td>
      <td nowrap colspan=2> 
        <input type="text" name="E01CHLBNK" size="3" maxlength="2" value="<%=msgMT.getE01CHLBNK()%>" onKeypress="enterInteger(event)">
      </td>
     </tr>

     <tr id="<%= (row % 2 == 1) ? "trclear" : "trdark" %><%row++;%>"> 
      <td nowrap width="50%"> 
        <div align="right">Oficina : </div>
      </td>
      <td nowrap colspan=2> 
        <input type="text" name="E01CHLBRN" size="5" maxlength="4" onKeypress="enterInteger(event)">
        <a href="javascript:GetBranch('E01CHLBRN',document.forms[0].E01CHLBNK.value)">
        <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
      </td>
     </tr> 
     
    </table>
    </td>
   </tr>
  </table>
  
<!--   <H4>Medio transaccional</H4> -->
<!--   <table class="tableinfo"> -->
<!--   	<tr bordercolor="#FFFFFF">  -->
<!--   		<td nowrap width="50%"> -->
<!--   		<table cellspacing="0" cellpadding="2" width="100%" border="0"> -->

<%--           <tr id="<%= (row % 2 == 1) ? "trclear" : "trdark" %><%row++;%>">   --%>
<!--             <td nowrap align="center">  -->
<!--               <input type="radio" name="medio" value="C" checked="checked"> -->
<!--               Chequera Universal  -->
<!--               <input type="radio" name="medio" value="T" > -->
<!-- 			  Talonario -->
<!--             </td> -->
<!--           </tr> -->
<!-- 		</table> -->
<!--   		</td> -->
<!--   	</tr> -->
<!--   </table> -->
  
  <br>
          <div align="center"> 
            <input id="EIBSBTN" type=submit name="Submit" value="Enviar" onclick="">
          </div>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT Language="Javascript">
            showErrors();
     </SCRIPT>
 <%
 }
%>
</form>
</body>
</html>
