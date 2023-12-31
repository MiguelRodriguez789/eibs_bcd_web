<html>
<head> 
<title>Mantenimiento de Reformas Documento Constitutivo</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import ="datapro.eibs.master.Util" %>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id= "msgMTRef" class= "datapro.eibs.beans.ECU000004Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" 	class= "datapro.eibs.beans.UserPos"  		scope="session"/>

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

<SCRIPT type="text/javascript">
  
  function goAction(opt) {
    
    if (opt == "C") { 
    	document.forms[0].SCREEN.value = 40;   
		document.forms[0].submit();
  	} 
  }
  
</SCRIPT>

</head>
<body>

<H3 align="center">Sistema de Bastanteo - Mantenimiento de Reformas Documento Constitutivo<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="bastanteo_reforms_maint,ECU0000"></H3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.bastanteo.JSECU0000">
 
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="43">
   
  <table class="tableinfo">
   <tr> 
   <td>
    <TABLE cellspacing=0 cellpadding=2 width="100%" border="0">    
			<TR>
				<TD nowrap width="40%">
					<DIV align="right">C&oacute;digo de Cliente :</DIV>
				</TD>
				<TD nowrap width="60%">
					<INPUT type="text" name="E04CURCUN" size="10" maxlength="9" value="<%= userPO.getHeader16() %>" readonly> 
				</TD>
			</TR>
			<TR>
				<TD nowrap width="40%">
					<DIV align="right">Nombre o Denominaci&oacute;n Social :</DIV>
				</TD>
				<TD nowrap width="60%">
					<INPUT type="text" name="E04CUSNA1" size="40" maxlength="35" value="<%= userPO.getHeader17() %>" readonly>  
				</TD>
			</TR>
			<TR> 
		  		<TD nowrap width="40%"> 
		     		<DIV align="right">Fecha de la Reforma: </DIV>        
		  		</TD>
      	  		<TD nowrap width="60%"> 
      	   			<INPUT type="text" name="E04CURRD1" readonly size="3" maxlength="2" value="<%= msgMTRef.getE04CURRD1() %>">
	      			<INPUT type="text" name="E04CURRD2" readonly size="3" maxlength="2" value="<%= msgMTRef.getE04CURRD2() %>">
	      			<INPUT type="text" name="E04CURRD3" readonly size="5" maxlength="4" value="<%= msgMTRef.getE04CURRD3() %>">
	     		 </TD>     
 		</TABLE>
 	  </td>
   </tr>
   </table>
   <h4></h4>
   <table class="tableinfo">	
   <tr> 
   <td>
    <table cellspacing=0 cellpadding=2 width="100%" border="0">
    	<tr id=trdark> 
	      <td nowrap >
				<div align="right">N&uacute;mero de Registro Mercantil: </div>
		  </td>
		  <td nowrap>
				<input type="text" name="E04CURRMC" size="3" maxlength="2" value="<%= msgMTRef.getE04CURRMC() %>"> 
		  </td>
     	</tr>
     	<tr id=trclear> 
		  <td> 
		     <div align="right">Fecha de Registro: </div>        
		  </td>
      	  <td nowrap> 
      	    <input type="text" name="E04CURRE1" size="3" maxlength="2" value="<%= msgMTRef.getE04CURRE1() %>">
	      	<input type="text" name="E04CURRE2" size="3" maxlength="2" value="<%= msgMTRef.getE04CURRE2() %>">
	      	<input type="text" name="E04CURRE3" size="5" maxlength="4" value="<%= msgMTRef.getE04CURRE3() %>">
	      	<a href="javascript:DatePicker(document.forms[0].E04CURRE1,document.forms[0].E04CURRE2,document.forms[0].E04CURRE3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" title=". . ." align="bottom" border="0" ></a>
      	  </td>     
      	</tr>
     	<tr id=trdark> 
	      <td nowrap >
				<div align="right">Circunscripci&oacute;n: </div>
		  </td>
		  <td nowrap>
				<input type="text" name="E04CURCIR" size="45" maxlength="40" value="<%= msgMTRef.getE04CURCIR() %>"> 
		  </td>
     	</tr>    
      	<tr id=trclear> 
	      <td nowrap >
				<div align="right">N&uacute;mero de Documento: </div>
		  </td>
		  <td nowrap>
				<input type="text" name="E04CURDOC" size="9" maxlength="7" value="<%= msgMTRef.getE04CURDOC() %>"> 
		  </td>
     	</tr>
     	<tr id=trdark> 
	      <td nowrap >
				<div align="right">Tomo: </div>
		  </td>
		  <td nowrap>
				<input type="text" name="E04CURTOM" size="10" maxlength="8" value="<%= msgMTRef.getE04CURTOM() %>"> 
		  </td>
     	</tr>
     	<tr id=trclear> 
	      <td nowrap >
				<div align="right">N&uacute;mero de Expediente: </div>
		  </td>
		  <td nowrap>
			<input type="text" name="E04CUREXP" size="15" maxlength="12" value="<%= msgMTRef.getE04CUREXP() %>" readonly> 
		  </td>
     	</tr>
     	<tr id=trdark> 
		  <td nowrap> 
		     <div align="right">C&oacute;digo de Materia : </div>        
		  </td>
      	  <td nowrap> 
      	    <input type="text" name="E04CURCOD" size="5" maxlength="4" value="<%= msgMTRef.getE04CURCOD() %>" readonly >
      	    <input type="text" name="E04CURCON" size="40" maxlength="35" value="<%= msgMTRef.getE04CURCON() %>" readonly >
      	  </td>     
      	</tr>
     </table>
    </td>
   </tr>

  </table>
  <h4>Observaciones</h4>
 
  <table class="tableinfo">
      <tr > 
        <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
          <tr id="trdark"> 
            <td nowrap width="100%"> 
              <input type="text" name="E04CUROBS" size="90" maxlength="80" value="<%= msgMTRef.getE04CUROBS().trim()%>">
            </td>
          </tr>
          <tr id="teclear"> 
            <td nowrap width="100%">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="100%">
            </td>
          </tr>
          <tr id="teclear"> 
            <td nowrap width="100%">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="100%">
            </td>
          </tr>
        </table>
      </tr>
  </table>
  
  <p align="center"> 
    <input id="EIBSBTN" type="submit" name="Submit" value="Enviar">
    <input id="EIBSBTN" type="button" name="Submit" value="Cancelar" onclick="goAction('C')">
  </p>
  
</form>
</body>
</html>
