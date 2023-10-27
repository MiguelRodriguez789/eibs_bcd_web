<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<html>
<head> 
<title>Gestion de Cobranzas</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "msgMT" class= "datapro.eibs.beans.ECB004001Message"  scope="session" />
<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />

<%
	String client = currClient != null ? currClient.getE01CUSCUN() : ""; 
%>

<script type="text/javascript">
	function checkNum(){
		var lnVisible = document.getElementById("FLDACC").style.visibility;
	
		if (lnVisible == "visible") {
			var accNum = document.forms[0].H01GCMACC.value;
		
			if (!isNumeric(accNum)) {
				alert("Debe ingresar un número de Prestamo valido");
				document.forms[0].H01GCMACC.value = '';
				document.forms[0].H01GCMACC.focus();
			} else {
				document.forms[0].submit();
			}
		} else {
  			document.forms[0].submit();
		}
	}

	function typeClick(value) {
  		document.getElementById("FLDACC").style.visibility = "hidden";	
  		document.getElementById("FLDCOD").style.visibility = "hidden";	
  		document.getElementById("FLDDAT").style.visibility = "hidden";	
  		var fs = parseInt(value);
  		switch(fs){
	     case 1:
	       document.getElementById("FLDACC").style.visibility = "visible";	
	       break;
	     case 2:
	       document.getElementById("FLDCOD").style.visibility = "visible";	
	       break;
	     case 3:
	       document.getElementById("FLDDAT").style.visibility = "visible";	
	       break;
	  	}    
	}
   
</script>

</head>
<body onload="typeClick('1')">

<H3 align="center">Consulta Gestion de Cobranzas<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="gestion_enter_inq,ECB0040"></H3>
<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECB0040">
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
  </p>

    <table id="TBHELP" cellspacing=0 cellpadding=2  border="0" align="center">    
     	
        <tr > 
          <td    align="right">Busqueda Por : </td> 
		  <td nowrap > 
		     <div align="left"><INPUT TYPE=RADIO NAME="TIPO" onclick="typeClick('1')"  checked="checked" VALUE="1">Ingrese el Número del Préstamo : </div>        
		  </td>
      	  <td nowrap>
      	     <DIV id="FLDACC"> 
      	       <input type="text" name="H01GCMACC" size="13" maxlength="12" value="<%= msgMT.getH01GCMACC()%>" onkeypress="enterInteger(event)">
      	       <a href="javascript:GetAccount('H01GCMACC','','10','<%= client %>')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
      	    </DIV>
      	  </td>
      	</tr>

        <tr > 
          <td></td>
		  <td nowrap > 
		     <div align="left"><INPUT TYPE=RADIO NAME="TIPO" onclick="typeClick('2')" VALUE="2">Ingrese el Código de Cobrador : </div>        
		  </td>
      	  <td nowrap> 
      	    <DIV ID="FLDCOD">
      	      <input type="text" name="H01GCMCOD" size="5" maxlength="4" value="<%= msgMT.getH01GCMCOD()%>">
      	      <a href="javascript:GetCodeCNOFC('H01GCMCOD','Y9')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
      	    </DIV>
      	  </td>
      	</tr>

        <tr >
          <td></td> 
		  <td nowrap > 
		     <div align="left"><INPUT TYPE=RADIO NAME="TIPO" onclick="typeClick('3')" VALUE="3">Ingrese Rango de Fechas - Desde : </div>        
		  </td>
      	  <td nowrap>
      	     <DIV ID="FLDDAT"> 
      	     	<eibsinput:date name="msgMT" fn_month="H01GCMFGM" fn_day="H01GCMFGD" fn_year="H01GCMFGY" />
              &nbsp; Hasta : &nbsp; 
      	     	<eibsinput:date name="msgMT" fn_month="H01GCMTGM" fn_day="H01GCMTGD" fn_year="H01GCMTGY" />
             </DIV>      	 
      	  </td>
      	</tr>
      	
     </table>

  
  <p align="center"> 
    <input id="EIBSBTN" type="button" name="Submit" value="Enviar" onclick="checkNum()">
  </p>
  
	<script type="text/javascript">
	  document.forms[0].H01GCMACC.focus();
	</script>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT type="text/javascript">
            showErrors();
     </SCRIPT>
 <%
 }
%>
</form>
</body>
</html>
