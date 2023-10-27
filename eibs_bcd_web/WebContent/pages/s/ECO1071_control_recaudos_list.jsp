<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.ECO107101Message"%>

<HTML>
<HEAD>
<TITLE>Control de Recaudos Impuestos Distritales</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "mtList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
function goAction() {
    document.forms[0].submit();	
}
</SCRIPT>

</HEAD>
<BODY>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors();");
     out.println("</SCRIPT>");
 } 
%>

<h3 align="center">Control de Recaudos
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="Reporte_paquetes_list.jsp,ECO1071">
</h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.adhesives.JSECO1071" >
 <INPUT TYPE=HIDDEN NAME="CURRENTROW" VALUE="0">
 <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="300">

<%if ( mtList.getNoResult() ) {%> 
  <TABLE class="tbenter" width=100% height=40%>
   	<TR>
      <TD> 
        <div align="center"> 
          <p>
            <b>No hay movimientos de Reporte de paquetes para su seleccion de fechas</b>
          </p>          
        </div>
      </TD>
     </TR>
   </TABLE>
<%} else {%>  

     <%
        mtList.initRow(); 
        ECO107101Message msgMT2=null;
        if (mtList.getNextRow()) {
           msgMT2 = (ECO107101Message) mtList.getRecord();          
        }
     %>
    
<table width="100%" border="0" bordercolor="white" bgcolor="white" background="white" cellpadding="0" cellspacing="0">
	<tr>		
   		<TD ALIGN="left" width="25%" style="font-size: small;font-weight: bold;" bgcolor="white">
   			&nbsp;&nbsp;PLANILLA RESUMEN
   		</TD>
   		<TD ALIGN="left" width="50%" style="font-size: small;font-weight: bold;" bgcolor="white">
   			CONTROL RECAUDOS DE IMPUESTOS DISTRITALES
   		</TD>
   		<TD ALIGN="right" width="25%" style="font-size:small;font-weight: bold;" bgcolor="white">
   			 CODIGO BANCO 06&nbsp;&nbsp; 		
   		</TD>
	</tr>
</table>
<table width="100%" border="1" cellpadding="0" cellspacing="0">
	<tr>		
   		<TD ALIGN="left" width="30%" height="35px">
   			&nbsp;&nbsp;NOMBRE OFICINA<br>
   			&nbsp;&nbsp;&nbsp;&nbsp;<%=Util.formatCell(msgMT2.getE01PAQBRD())%>
   		</TD>
   		<TD ALIGN="left" width="35%" height="35px">
   			&nbsp;&nbsp;CODIGO<br>
   			&nbsp;&nbsp;&nbsp;&nbsp;<%=Util.formatCell(msgMT2.getE01PAQBRN())%>
   		</TD>
   		<TD ALIGN="left" width="35%" height="35px">
   			&nbsp;&nbsp;CIUDAD O MUNICIPIO (Nombre Completo)<br>
   			&nbsp;&nbsp;&nbsp;&nbsp;<%=Util.formatCell(msgMT2.getE01PAQCTY())%>   		
   		</TD>
	</tr>
	<tr>		
   		<TD ALIGN="left" height="35px">
   			&nbsp;&nbsp;PAQUETE NUMERO<br>
   			&nbsp;&nbsp;&nbsp;&nbsp;<%=Util.formatCell(msgMT2.getE01PAQNUM())%>
   		</TD>
   		<TD ALIGN="left" height="35px">
   			&nbsp;&nbsp;HORARIO<br>
   			&nbsp;&nbsp;&nbsp;&nbsp;
   			<% String cadena="";
   			if ("N".equals(msgMT2.getE01PAQHOR())){
   				cadena="NORMAL";
   			}else if ("E".equals(msgMT2.getE01PAQHOR())){
   				cadena="EXTENDIDO";
   			}
   			%>
   			<%=Util.formatCell(cadena)%>
   			</TD>
   		<TD ALIGN="left" height="35px">
   			&nbsp;&nbsp;FECHA RECEP. RECAUDOS<br>
   			&nbsp;&nbsp;&nbsp;&nbsp;<%=msgMT2.getE01PAQDDI()%>/<%=msgMT2.getE01PAQMMI()%>/<%=msgMT2.getE01PAQYYI()%>
   		</TD>
	</tr>		
</table>    
  <TABLE  id="mainTable" class="tableinfo" >
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="100%">
			<tr id="trdark">		
	    		<TH ALIGN=CENTER width="35%">TIPO IMPUESTO</TH>
	    		<TH ALIGN=CENTER width="10%">CDO<br>RCDO<br>BCO</TH>
	    		<TH ALIGN=CENTER width="10%">CDO<br>DDI</TH>
	    		<TH ALIGN=CENTER width="10%">MARQUE CON X</TH>
	    		<TH ALIGN=CENTER width="15%">CANT. FORMULARIOS</TH>
	    		<TH ALIGN=CENTER width="20%">SUMATORIA CASILLA TOTAL PAGOS $</TH>

			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" > 
		       <table id="dataTable" cellspacing="2" cellpadding="2" border="0" width="100%">         
     <%
        mtList.initRow(); 
         ECO107101Message msgMT = null;
        while (mtList.getNextRow()) {
           msgMT = (ECO107101Message) mtList.getRecord();
     %>     
               
        <TR>			
			<TD NOWRAP ALIGN="left" width="35%"><%=Util.formatCell(msgMT.getE01PAQDSI())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="10%"><%=Util.formatCell(msgMT.getE01PAQREC())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="10%"><%=Util.formatCell(msgMT.getE01PAQCOD())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="10%">X</TD>
			<TD NOWRAP ALIGN="CENTER" width="15%"><%=Util.formatCell(msgMT.getE01PAQQTY())%></TD>
			<TD NOWRAP ALIGN="right" width=20%"><%=Util.formatCell(msgMT.getE01PAQAMT())%>&nbsp;&nbsp;&nbsp;</TD>
		</TR>    		
    <%}%>    
             </table>
             </div>
             </td>
             </tr>
</table>

<table width="100%" border="1" cellpadding="0" cellspacing="0">
	<tr>		
   		<TD ALIGN=CENTER width="30%" height="25px">&nbsp;</TD>
   		<TD ALIGN="right" width="35%" height="25px">NUMERO PRIMER FORMULARIO PAQUETE&nbsp;&nbsp;</TD>
   		<TD ALIGN="left" width="35%" height="25px">&nbsp;&nbsp;<%=Util.formatCell(msgMT.getE01PAQSTI())%></TD>
	</tr>
	<tr>		
   		<TD ALIGN="left" height="25px">&nbsp;&nbsp;CANTIDAD DE FORMULARIOS</TD>
   		<TD ALIGN="right" height="25px">NUMERO ULTIMO FORMULARIO PAQUETE&nbsp;&nbsp;</TD>
   		<TD ALIGN="left" height="25px">&nbsp;&nbsp;<%=Util.formatCell(msgMT.getE01PAQSTF())%></TD>
	</tr>
	<tr>		
   		<TD ALIGN="left" height="25px">&nbsp;&nbsp;&nbsp;&nbsp;<%=Util.formatCell(msgMT.getE01PAQQTT())%></TD>
   		<TD ALIGN="right" height="25px">SUMATORIA CASILLA TOTAL DE PAGOS$&nbsp;&nbsp;</TD>
   		<TD ALIGN="left" height="25px">&nbsp;&nbsp;<%=Util.formatCell(msgMT.getE01PAQATT())%></TD>
	</tr>		
</table>        
     
             
<%}%>


 
</FORM>
</BODY>
</HTML>
