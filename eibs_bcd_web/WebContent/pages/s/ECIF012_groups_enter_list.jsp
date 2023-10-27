<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import = "datapro.eibs.beans.*" %>
<html>
<head>
<title>Grupos Económicos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ECIF01201Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script language="Javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script language="JavaScript">


function goAction(op) {
 var delok= false;
 var page="";
 page = "<%=request.getContextPath()%>/pages/s/ECIF012_groups_total.jsp?ROW=" + document.forms[0].ROW.value;
 CenterWindow(page,600,470,2);
}      


function getParameters(tablecode,tablename,idxRow,cusnum) {
    document.forms[0].ROW.value = "" + idxRow;
	document.forms[0].TABLECODE.value = tablecode;
	document.forms[0].TABLENAME.value = tablename;  
	document.forms[0].CUSTOMER.value = cusnum;

}


</SCRIPT>  

</head>

<BODY>
<h3 align="center">Consulta por Posición de Relaciones<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="groups_enter_list.jsp, ECIF012"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF012" >
<p> 
  <input type=HIDDEN name="SCREEN" value="200">
  <input type=HIDDEN name="totalRow" value="0">
  <input type=HIDDEN name="opt">
  <input type=HIDDEN name="TABLECODE" value=" " >   
  <input type=HIDDEN name="TABLENAME" value=" " >   
  <input type=HIDDEN NAME="ROW" VALUE="0">
  <input type=HIDDEN NAME="CUSTOMER" VALUE="">
</p>

<p><%	if ( ECIF01201Help.getNoResult() ) { %></p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
  <TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>No hay resultados para su b&uacute;squeda. </b></p>
          <p>&nbsp;</p>
        </div>
	  </TD>
	</TR>
    </TABLE>
	
<% } else { %>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }
%> 
<p> 

          
<table class="tbenter" width=100% align=center>
  <tr> 
    <td class=TDBKG width="50%"> 
      <div align="center"><a href="javascript:goAction(2)"><b>Resumen</b></a></div>
    </td>
    <td class=TDBKG width="50%"> 
      <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
    </td>
  </tr>
</table>
   
<br>
<TABLE  id="mainTable" class="tableinfo" ALIGN=CENTER style="width:'95%'">
 			   <TR> 
   			     <TD NOWRAP width="100%" >
  				<TABLE id="headTable" >
  				   <TR id="trdark">  
            		<th align=CENTER nowrap width="5%">&nbsp;</th>
            		<th align=CENTER nowrap width="10%">Código</th>
            		<th align=CENTER nowrap width="17%">Descripción</th>
            		<th align=CENTER nowrap width="17%">A Favor del Banco</th>
            		<th align=CENTER nowrap width="17%">A Favor del Cliente</th>
            		<th align=CENTER nowrap width="17%">Contingencia Neta</th>
            		<th align=CENTER nowrap width="17%">Disponible Linea Crédito</th>
       			   </TR>
       			</TABLE>
  
   			    <div id="dataDiv1" class="scbarcolor">
    				<table id="dataTable" > 
          <%
  	         int row;
			 try{row = Integer.parseInt(request.getParameter("ROW"));}catch(Exception e){row = 0;}

                ECIF01201Help.initRow();
				boolean firstTime = true;
				String chk = "";
        		while (ECIF01201Help.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
                  ECIF01201Message msgList = (ECIF01201Message) ECIF01201Help.getRecord();
       
		 %>
		 	<tr> 
            <td NOWRAP  align=CENTER width="5%">
                <INPUT TYPE="radio" NAME="EXTCHG" VALUE="<%= ECIF01201Help.getCurrentRow() %>" <% if (ECIF01201Help.getCurrentRow() == row) out.print("checked"); %> 
                onClick="javascript:getParameters('<%= msgList.getE01GEMGRP() %>','<%= msgList.getE01GEMNA1() %>','<%= ECIF01201Help.getCurrentRow() %>','<%= msgList.getE01GEMMST() %>');">
            </td>
            <td NOWRAP  align=CENTER width="10%"><%= msgList.getE01GEMGRP() %> - <%= msgList.getE01GEMMST() %></td>
            <td NOWRAP  align=LEFT width="17%"><%= msgList.getE01GEMNA1() %></td>
            <td NOWRAP  align=RIGHT width="17%"><%= msgList.getE01TOTASS() %></td>
            <td NOWRAP  align=RIGHT width="17%"><%= msgList.getE01TOTLIA() %></td>
            <td NOWRAP  align=RIGHT width="17%"><%= msgList.getE01TOTCTG() %></td>
            <td NOWRAP  align=RIGHT width="17%"><%= msgList.getE01LNEAVA() %></td>
          </tr>
          <%
                }
              %>
			 </table>
   			</div>
   			</TD>
   		      </TR>	
		    </TABLE>

	  
    				 
<SCRIPT language="JavaScript">
		showChecked("CURRCODE");
		function resizeDoc() {
   		 	divResize();
   		    adjustEquTables(headTable, dataTable, dataDiv1,1,false);
      		}
		resizeDoc();   			
   		window.onresize=resizeDoc;        
</SCRIPT>

<%}%>
</form>
</body>
</html>
