<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Consulta Vigencia Indices Valoración</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id="msgRT" class="datapro.eibs.beans.ERA010101Message"	scope="session" />
<jsp:useBean id= "ERA0101HELP" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

</SCRIPT>  

</head>

<BODY>
<h3 align="center">Consulta Vigencia Indices Valoración
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="101_list.jsp, 101"> 
	 </h3>

<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0030" >
  <p> 
    <input type=HIDDEN name="SCREEN" id="SCREEN" value="800">
    <input type=HIDDEN name="totalRow" id="totalRow" value="0">
    <input type=HIDDEN name="opt" id="opt">
  </p>
  
  <p> 
 <% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%> 

          
  <table class="tbenter" width=100% align=center height="8%">
    <tr> 
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </td>
    </tr>
  </table>
  <br>

 <table  id="mainTable" class="tableinfo" ALIGN=CENTER style="width:'100%'" >
    <tr height="5%"> 
    	<td NOWRAP valign="top" width="100%"> 
        	<table id="headTable" width="100%">
           <tr id="trdark"> 
            		<th align=CENTER nowrap width="15%">Indice</th>
            		<th align=CENTER nowrap width="15%">Periodicidad</th>
            		<th align=CENTER nowrap width="15%">Fecha Ultimo<br>Proceso</th>
            		<th align=CENTER nowrap width="15%">Vigencia<br>Desde</th>
            		<th align=CENTER nowrap width="15%">Vigencia<br>Vencimiento</th>
            		<th align=CENTER nowrap width="15%">Estado</th>
          		</tr>
        	</table>
      	</td>
    </tr>    
    <tr height="95%">    
     <td valign="top">       
	    <div id="dataDiv1" class="scbarcolor" style=" overflow:auto;">
    		<table id="dataTable" width="100%" > 
     	<%
        ERA0101HELP.initRow(); 
		boolean firstTime = true;
		String chk = "";
		String level = "";
		int i = 0;
        while (ERA0101HELP.getNextRow()) {
           datapro.eibs.beans.ERA010101Message msg = (datapro.eibs.beans.ERA010101Message) ERA0101HELP.getRecord();
     	%>               
			<tr>
			<td NOWRAP width="20%"><%=Util.formatCell(msg.getE01INDICE())%></td>
			<td NOWRAP width="20%"><%=Util.formatCell(msg.getE01PERIOD())%></td>
			<td NOWRAP width="20%"><%=Util.formatCell(msg.getE01FECCRE())%></td>
			<td NOWRAP width="20%"><%=Util.formatCell(msg.getE01VIGDES())%></td>
			<td NOWRAP width="20%"><%=Util.formatCell(msg.getE01FECVEN())%></td>
			<td NOWRAP width="20%"><%=Util.formatCell(msg.getE01ESTADO())%></td>
			</tr>
	   	<%i++;}%>   
              </table>
        	</div>
    	</td>
    </tr>
  </table>
     
<SCRIPT type="text/javascript">
     
</SCRIPT>

  </form>

</body>
</html>
