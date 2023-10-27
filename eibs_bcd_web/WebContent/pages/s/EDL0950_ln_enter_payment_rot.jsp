<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="datapro.eibs.master.Util" %>
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Pago de Cupo Rotativo</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

function CheckNum(){
  if(isNaN(document.forms[0].E01DEAACC.value)||(document.forms[0].E01DEAACC.value.length < 1)){
    alert("Debe ingresar un número de Prestamo valido");
    document.forms[0].E01DEAACC.value='';
    document.forms[0].E01DEAACC.focus();
    return false;
  } else {
    return true;
  }
}

function goAction() {
		
		if (getElement("H01FLGWK1").value == ('2')) {
			getElement("SCREEN").value = "600";	
			document.forms[0].submit();
		} else {	
			getElement("SCREEN").value = "610";
			document.forms[0].submit();	
		}			
    }

function excType() {
	getElement("SEARCH").value = 'L2';
	
	if (getElement("H01FLGWK1").value == ('2')) {
		getElement("SEARCH").value = 'L3';
	} else {
		getElement("H01FLGWK1").value = '1';
		getElement("SEARCH").value = 'L2';
	}
}

</SCRIPT>
</head>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>
<jsp:useBean id= "lnCancel" class= "datapro.eibs.beans.EDL095001Message"  scope="session" />

<body bgcolor="#FFFFFF">

<% String client = currClient != null ? currClient.getE01CUSCUN() : ""; %>

<h3 align="center">Pago de Cupo Rotativo<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_enter_payment_rot, EDL0950"></h3>

<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0950" onsubmit="return(CheckNum())">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
  <INPUT TYPE=HIDDEN NAME="SEARCH" VALUE="L2">

  <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0" bordercolor="#000000">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr><td>&nbsp;</td></tr>
          <tr><td>&nbsp;</td></tr>
          <tr><td>&nbsp;</td></tr>
          <tr><td>&nbsp;</td></tr>
          <tr >
			<td align="right" width="50%" nowrap>Seleccione :&nbsp;</td>
			<td width="50%" valign="top">
			<SELECT name="H01FLGWK1" onchange="excType();">
				<OPTION value="1" <%if (lnCancel.getH01FLGWK1().equals("1")) { out.print("selected"); }%>>N&uacute;mero de Cupo </OPTION>
				<OPTION value="2" <%if (lnCancel.getH01FLGWK1().equals("2")) { out.print("selected"); }%>>N&uacute;mero de Utilizaci&oacute;n </OPTION>
			</SELECT>
			</td>
			</tr> 
          
          <tr> 
            <td nowrap width="50%"> 
              <div align="right">Ingrese el N&uacute;mero :</div>
            </td>
           
            <td nowrap width="50%"> 
              <input type="text" name="E01DEAACC" size="13" maxlength="12" onKeypress="enterInteger(event)" <%if(!error.getERWRNG().equals("Y") ){ %>  onchange="submitForm();" <% } %>> 
              <a href="javascript:GetAccount('E01DEAACC','',document.forms[0].SEARCH.value,'<%= client %>')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
            </td>
          
          </tr>
         
        </table>
      </td>
    </tr>
  </table>
  
  <% if(error.getERWRNG().equals("Y") ){ %>
  <h4 style="text-align:center">
    <input type="checkbox" name="H01FLGWK2" value="A" <%if (lnCancel.getH01FLGWK2().equals("A")) { out.print("checked"); }%>>Aceptar con Advertencias</h4>
  <% } %>    
  <div align="center"> 
    <input id="EIBSBTN" type="button" name="Submit" value="Enviar" OnClick="goAction();">
  </div>

  <script type="text/javascript">
    document.forms[0].E01DEAACC.focus();
    document.forms[0].E01DEAACC.select();
    excType();    
  </script>
  <% 
     if ( !error.getERRNUM().equals("0")  ) {
       error.setERRNUM("0");
  %>
  <SCRIPT type="text/javascript">;
    showErrors();
  </SCRIPT>
  <% } %>
</form>
</body>

<script type="text/javascript">
function submitForm(){
	goAction(); 
  document.forms[0].submit();
}
</script>

</html>
