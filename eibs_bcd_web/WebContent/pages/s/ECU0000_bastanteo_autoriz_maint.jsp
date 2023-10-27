<html> 
<head>
<title>Mantenimiento de Autorizaciones Especiales</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import ="datapro.eibs.master.Util" %>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id= "msgMTAut" class= "datapro.eibs.beans.ECU000006Message"  scope="session" />
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
    	document.forms[0].SCREEN.value = 60;   
		document.forms[0].submit();
  	} 
  }
  
</SCRIPT>

</head>
<body>

<H3 align="center">Sistema de Bastanteo - Mantenimiento de Autorizaciones Especiales<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="bastanteo_autoriz_maint,ECU0000"></H3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.bastanteo.JSECU0000">
 
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="63">
  
  <table class="tableinfo">
   <tr> 
   <td>
    <TABLE cellspacing=0 cellpadding=2 width="100%" border="0">    
		<TR>
			<TD nowrap width="40%">
				<DIV align="right">C&oacute;digo de Cliente :</DIV>
			</TD>
			<TD nowrap width="60%">
				<INPUT type="text" name="E06CUACUN" size="10" maxlength="9" value="<%= userPO.getHeader16() %>" readonly> 
			</TD>
		</TR>
		<TR>
			<TD nowrap width="40%">
				<DIV align="right">Nombre o Denominaci&oacute;n Social :</DIV>
			</TD>
			<TD nowrap width="60%">
				<INPUT type="text" name="E06CUSNA1" size="40" maxlength="35" value="<%= userPO.getHeader17() %>" readonly>  
			</TD>
		</TR>
		<% 
 			if (!userPO.getHeader3().equals("Y")  ) {
		%>
		<TR>
			<TD nowrap width="40%">
				<DIV align="right">Integrante :</DIV>
			</TD>
			<TD nowrap width="60%">
				<INPUT type="text" name="E06CUAMAN" size="3" maxlength="2" value="<%= userPO.getHeader18() %>" readonly>
				<INPUT type="text" name="E06CUMMA1" size="40" maxlength="35" value="<%= userPO.getHeader19() %>" readonly> 
			</TD>
		</TR>
		<% } else { %>
		<TR>
			<TD nowrap width="40%">
				<DIV align="right">Apoderado :</DIV>
			</TD>
			<TD nowrap width="60%">
				<INPUT type="text" name="E06CUMMA1" size="40" maxlength="35" value="<%= userPO.getHeader19() %>" readonly> 
			</TD>
		</TR>
		<% } %>
		<% 
 			if (!userPO.getHeader3().equals("Y")  ) {
		%>
		<TR>
			<TD nowrap width="40%">
				<DIV align="right">Cargo :</DIV>
			</TD>
			<TD nowrap width="60%">
				<INPUT type="text" name="E06CUMUC5" size="5" maxlength="4" value="<%= userPO.getHeader20() %>" readonly>
				<INPUT type="text" name="E06CUMUCN" size="40" maxlength="35" value="<%= userPO.getHeader21() %>" readonly> 
			</TD>
		</TR>
		<% } %>
		<TR> 
		  	<TD nowrap width="40%"> 
		     	<DIV align="right">Facultad: </DIV>        
		  	</TD>
      	  	<TD nowrap width="60%"> 
      	    	<INPUT type="text" name="E06CUAFAC" size="5" maxlength="4" value="<%= msgMTAut.getE06CUAFAC() %>" readonly>
      	    	<INPUT type="text" name="E06CUAFAN" size="40" maxlength="35" value="<%= msgMTAut.getE06CUAFAN() %>" readonly >
      	  	</TD>     
      	</TR>
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
		  <td> 
		     <div align="right">Fecha de Recepci&oacute;n: </div>        
		  </td>
      	  <td nowrap> 
      	    <input type="text" name="E06CUARD1" size="3" maxlength="2" value="<%= msgMTAut.getE06CUARD1() %>">
	      	<input type="text" name="E06CUARD2" size="5" maxlength="2" value="<%= msgMTAut.getE06CUARD2() %>">
	      	<input type="text" name="E06CUARD3" size="5" maxlength="4" value="<%= msgMTAut.getE06CUARD3() %>">
	      	<a href="javascript:DatePicker(document.forms[0].E06CUARD1,document.forms[0].E06CUARD2,document.forms[0].E06CUARD3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" title=". . ." align="bottom" border="0" ></a>
      	  </td>     
      	</tr>
     	<tr id=trclear> 
		  <td nowrap> 
		     <div align="right">Abogado Revisor: </div>        
		  </td>
      	  <td nowrap> 
      	    <input type="text" name="E06CUAABO" size="5" maxlength="4" value="<%= msgMTAut.getE06CUAABO() %>">
      	    <input type="text" name="E06CUAABN" size="40" maxlength="35" value="<%= msgMTAut.getE06CUAABN() %>" readonly >
      	    <a href="javascript:GetCodeDescCNOFC('E06CUAABO','E06CUAABN','YQ')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
      	  </td>     
      	</tr>
      	<tr id=trdark> 
          <td> 
             <div align="right">Status de Aprobaci&oacute;n: </div>
          </td>
          <td nowrap >  
             <input type="radio" name="E06CUASTS" value="P" <%if (msgMTAut.getE06CUASTS().equals("P")) out.print("checked"); %>>
              Pendiente 
             <input type="radio" name="E06CUASTS" value="A" <%if (msgMTAut.getE06CUASTS().equals("A")) out.print("checked"); %>>
              Aprobado 
          </td>
        </tr>
    	<tr id=trclear> 
		  <td> 
		     <div align="right">Fecha de Aprobaci&oacute;n: </div>        
		  </td>
      	  <td nowrap> 
      	    <input type="text" name="E06CUAAD1" size="3" maxlength="2" value="<%= msgMTAut.getE06CUAAD1() %>">
	      	<input type="text" name="E06CUAAD2" size="3" maxlength="2" value="<%= msgMTAut.getE06CUAAD2() %>">
	      	<input type="text" name="E06CUAAD3" size="5" maxlength="4" value="<%= msgMTAut.getE06CUAAD3() %>">
	      	<a href="javascript:DatePicker(document.forms[0].E06CUAAD1,document.forms[0].E06CUAAD2,document.forms[0].E06CUAAD3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" title=". . ." align="bottom" border="0" ></a>
	      </td>     
      	</tr>
      	<tr id=trdark> 
          <td> 
             <div align="right">Status de Autorizaci&oacute;n: </div>
          </td>
          <td nowrap >  
             <input type="radio" name="E06CUASTA" value="A" <%if (msgMTAut.getE06CUASTA().equals("A")) out.print("checked"); %>>
              Permanente 
             <input type="radio" name="E06CUASTA" value="T" <%if (msgMTAut.getE06CUASTA().equals("T")) out.print("checked"); %>>
              Temporal 
          </td>
        </tr>
     	<tr id=trclear> 
		  <td> 
		     <div align="right">Fecha de Vencimiento: </div>        
		  </td>
      	  <td nowrap> 
      	    <input type="text" name="E06CUAMA1" size="3" maxlength="2" value="<%= msgMTAut.getE06CUAMA1() %>">
	      	<input type="text" name="E06CUAMA2" size="3" maxlength="2" value="<%= msgMTAut.getE06CUAMA2() %>">
	      	<input type="text" name="E06CUAMA3" size="5" maxlength="4" value="<%= msgMTAut.getE06CUAMA3() %>">
	      	<a href="javascript:DatePicker(document.forms[0].E06CUAMA1,document.forms[0].E06CUAMA2,document.forms[0].E06CUAMA3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" title=". . ." align="bottom" border="0" ></a>
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
              <input type="text" name="E06CUAOBS" size="90" maxlength="80" value="<%= msgMTAut.getE06CUAOBS().trim()%>">
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
