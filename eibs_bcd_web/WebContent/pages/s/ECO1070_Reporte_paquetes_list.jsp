<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.ECO107001Message"%>

<HTML>
<HEAD>
<TITLE>Reporte de Paquetes por Fecha</TITLE>
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

<h3 align="center"><font id="vf0">Corpbanca</font>Reporte de Paquetes<font id="vf">xxx</font><font id="vf1">sucursal</font>
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="Reporte_paquetes_list.jsp,ECO1070">
</h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.adhesives.JSECO1070" >
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
  <TABLE  id="mainTable" class="tableinfo" >
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="100%">
			<tr id="trdark">		
	    		<TH ALIGN=CENTER width="10%">NRO. ENVIO</TH>
	    		<TH ALIGN=CENTER width="15%">FECHA TRANS.</TH>
	    		<TH ALIGN=CENTER width="10%">TIPO IMP.</TH>
	    		<TH ALIGN=CENTER width="10%">TIPO HORARIO</TH>
	    		<TH ALIGN=CENTER width="10%">NRO. PAQUETE</TH>
	    		<TH ALIGN=CENTER width="15%">STICKER INCIAL</TH>
	    		<TH ALIGN=CENTER width="15%">STICKER FINAL</TH>
	    		<TH ALIGN=CENTER width="15%">VALOR A PAGAR</TH>
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
        while (mtList.getNextRow()) {
           ECO107001Message msgMT = (ECO107001Message) mtList.getRecord();
     %>     
               
        <TR>
			<TD NOWRAP ALIGN="CENTER" width="10%"><%=Util.formatCell(msgMT.getE01PAQSEQ())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="15%"><%=Util.formatCell(msgMT.getE01PAQFET().substring(6)+"/"+msgMT.getE01PAQFET().substring(4,6)+"/"+msgMT.getE01PAQFET().substring(0,4))%></TD>
			<TD NOWRAP ALIGN="CENTER" width="10%"><%=Util.formatCell(msgMT.getE01PAQTIP())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="10%"><%=Util.formatCell(msgMT.getE01PAQHOR())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="10%"><%=Util.formatCell(msgMT.getE01PAQNUM())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="15%"><%=Util.formatCell(msgMT.getE01PAQSTI())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="15%"><%=Util.formatCell(msgMT.getE01PAQSTF())%></TD>
			<TD NOWRAP ALIGN="right" width="15%"><%=Util.formatCell(msgMT.getE01PAQAMT())%>&nbsp;&nbsp;&nbsp;</TD>
		</TR>    		
    <%}%>    
             </table>
             </div>
             </td>
             </tr>
</table>

     <%
        mtList.initRow(); 
        ECO107001Message msgMT1=null;
        while (mtList.getNextRow()) {
           msgMT1 = (ECO107001Message) mtList.getRecord();          
        }
     %>  

     
<script type="text/javascript">
	document.getElementById("vf0").innerHTML = "<%=Util.formatCell(msgMT1.getE01PAQNAM().toUpperCase())%> <br>";
	document.getElementById("vf").innerHTML = "<br> <%=msgMT1.getE01PAQDDI()%>/<%=msgMT1.getE01PAQMMI()%>/<%=msgMT1.getE01PAQYYI()%> al <%=msgMT1.getE01PAQDDF()%>/<%=msgMT1.getE01PAQMMF()%>/<%=msgMT1.getE01PAQYYF()%>";
	document.getElementById("vf1").innerHTML = "<br>Agencia: <%=Util.formatCell(msgMT1.getE01PAQBRT())%> - <%=Util.formatCell(msgMT1.getE01PAQBRD())%>";
</script>
     
     
     
  <TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
    <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> 
      	<%
      	int pos1 = new Integer(msgMT1.getE01PAQREG()) - 100; //el doble de los mandados
        if ( pos1>=0 ) {
      			
      			 out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.adhesives.JSECO1070?SCREEN=300&E01PAQREG=" + pos1 + "&E01PAQDDI=" + msgMT1.getE01PAQDDI() + "&E01PAQMMI=" + msgMT1.getE01PAQMMI() + "&E01PAQYYI=" + msgMT1.getE01PAQYYI() + "&E01PAQDDF=" + msgMT1.getE01PAQDDF() + "&E01PAQMMF=" + msgMT1.getE01PAQMMF() + "&E01PAQYYF=" + msgMT1.getE01PAQYYF() + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
        }
		%> 
	  </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
        if ( mtList.getShowNext() ) {
      			int pos = new Integer(msgMT1.getE01PAQREG());
      			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.adhesives.JSECO1070?SCREEN=300&E01PAQREG=" + pos + "&E01PAQDDI=" + msgMT1.getE01PAQDDI() + "&E01PAQMMI=" + msgMT1.getE01PAQMMI() + "&E01PAQYYI=" + msgMT1.getE01PAQYYI() + "&E01PAQDDF=" + msgMT1.getE01PAQDDF() + "&E01PAQMMF=" + msgMT1.getE01PAQMMF() + "&E01PAQYYF=" + msgMT1.getE01PAQYYF() + "\" > <img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");

        }
		%> 
	</TD>
	 </TR>
 </TABLE>     
     
     
             
<%}%>


 
</FORM>
</BODY>
</HTML>
