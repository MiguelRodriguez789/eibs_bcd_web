<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Cupos Contraparte</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<META name="GENERATOR" content="IBM WebSphere Studio">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id= "recLogs" class= "datapro.eibs.beans.EDL054802Message"  scope="session"/>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

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
<h3 align="center">Consulta de Reservas<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_enter_sel_reserva.jsp,EDL0548"> 
</h3>
<hr size="4">

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0548" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="215">
  
  <p>&nbsp;</p>
  <p>&nbsp;</p>
   <table class="tableinfo">
   <tr> 
   <td>
    <table cellspacing=0 cellpadding=2 width="100%" border="0">    
     <tr> 
      <td nowrap width="40%"> 
        <div align="right">Ingrese la Identificaci&oacute;n : </div>
      </td>
      <td nowrap colspan=2> 
       <input type=TEXT name="E02CTLIDN"  value="<%= recLogs.getE02CTLIDN()%>" size=20 maxlength=20 > 
      </td>
     </tr>
     <tr> 
      <td nowrap width="40%"> 
        <div align="right">Ingrese el N&uacute;mero de Reserva : </div>
      </td>
      <td nowrap colspan=2> 
       <input type=TEXT name="E02CTLSEQ" value="<%= recLogs.getE02CTLSEQ()%>" size=10 maxlength=9 onKeypress="enterInteger(event)"> 
     
      </td>
     </tr>
     <tr > 
      <td>         
      </td>
      <td><div align="left">Desde </div>
      </td>
      <td><div align="left">Hasta </div>
      </td>
     </tr>
     <tr > 
      <td> 
         <div align="right">Fecha de Reserva : </div>        
      </td>
      <td nowrap> 
      	<eibsinput:date name="recLogs" fn_month="E02CTLOPM" fn_day="E02CTLOPD" fn_year="E02CTLOPY" />
      </td>
      <td nowrap> 
      	<eibsinput:date name="recLogs" fn_month="E02CTLUCM" fn_day="E02CTLUCD" fn_year="E02CTLUCY" />
      </td>
      </tr>
     </table>
    </td>
   </tr>
  </table>
 
  <p>&nbsp;</p>
  <p>&nbsp;</p>

    <div id="DIVSUBMIT" align="center">
      <input id="EIBSBTN" type="submit" name="Submit" value="Enviar">
    </div>
   
</form>
</body>
</html>
