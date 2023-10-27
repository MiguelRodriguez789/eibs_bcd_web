<%@ page import = "datapro.eibs.master.Util" %> 
<html>
<head>
<title>Tasas I.T.E.</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "msgList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">



function goAction(opt) {
    if (opt == "N") {
		document.forms[0].SCREEN.value = '11';
  		document.forms[0].submit();			
	} else if (opt == "M") { 
		document.forms[0].SCREEN.value = '12';
  		document.forms[0].submit();
	} else if (opt == "D") {
      		ok = confirm("Are you sure you want to delete this record?");
		document.forms[0].SCREEN.value = '14';
	  	if (ok) document.forms[0].submit();
  	}
}

function getParameters(y,m,d) {

	document.forms[0].E01MXIFIY.value = y;
	document.forms[0].E01MXIFIM.value = m;
	document.forms[0].E01MXIFID.value = d;
  
}

</SCRIPT>  

</head>

<BODY>
<h3 align="center">Tabla de Tasas I.T.E.<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ite_rates_list.jsp, ELC0410"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0410" >
  <p> 
    <input type=HIDDEN name="SCREEN" value="100">
    <input type=HIDDEN name="totalRow" value="0">
    <input type=HIDDEN name="opt" value="1">
    <input type=HIDDEN name="E01MXIFIY" value="">
    <input type=HIDDEN name="E01MXIFIM" value="">
    <input type=HIDDEN name="E01MXIFID" value="">
  </p>
  
  <p> 
    <%
	if ( msgList.getNoResult() ) {
 %>
  </p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>No hay resultados para su b&uacute;squeda</b></p>
          <table class="tbenter" width=100% align=center>
            <tr> 
              <td class=TDBKG width="30%"> 
                <div align="center" style="cursor:pointer" onClick="goAction('N')"><a><b>Crear</b></a></div>
              </td>
              <td class=TDBKG width="30%"> 
                <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
              </td>
            </tr>
          </table>
          <p>&nbsp;</p>
          
        </div>

	  </TD>
	</TR>
    </TABLE>
	
  <%  
		}
	else {
%> <% 
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
      <td class=TDBKG width="30%"> 
        <div align="center" style="cursor:pointer" onClick="goAction('N')"><a><b>Crear</b></a></div>
      </td>
      <td class=TDBKG width="30%"> 
        <div align="center"><a href="javascript:goAction('M')"><b>Modificar</b></a></div>
      </td>
      <td class=TDBKG width="30%"> 
        <div align="center"><a href="javascript:goAction('D')"><b>Borrar</b></a></div>
      </td>      
      <td class=TDBKG width="30%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.htm"><b>Salir</b></a></div>
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
            		<th align=CENTER nowrap width="25%">Fecha Inicial</th>
            		<th align=CENTER nowrap width="20%"> Tasa Mensual </th>
            		<th align=CENTER nowrap width="25%"> Tasa Anual </th>
            		<th align=CENTER nowrap width="25%"> Períodos </th>
          			   </TR>
       			</TABLE>
  
   			    <div id="dataDiv1" class="scbarcolor">
    				<table id="dataTable" > 
          <%
                msgList.initRow();
                while (msgList.getNextRow()) {
                 
                  datapro.eibs.beans.ELC041001Message msgPart = (datapro.eibs.beans.ELC041001Message) msgList.getRecord();
		 %>
		 	<tr> 
            <td NOWRAP  align=CENTER width="5%"> 
              <input type="radio" name="CURRENTROW" value="<%= msgList.getCurrentRow() %>"
			  onClick="getParameters('<%= msgPart.getE01MXIFIY() %>','<%= msgPart.getE01MXIFIM() %>','<%= msgPart.getE01MXIFID() %>')">
            </td>
            <td NOWRAP  align=CENTER width="25%"><%= Util.formatDate(msgPart.getE01MXIFID(),msgPart.getE01MXIFIM(),msgPart.getE01MXIFIY()) %></td>
            <td NOWRAP  align="center" width="20%"><%= msgPart.getE01MXIRTE() %></td>
            <td NOWRAP  align="center" width="25%"><%= msgPart.getE01MXITAM() %></td>
            <td NOWRAP  align="center" width="25%"><%= msgPart.getE01MXIMNP() %></td>
          </tr>
          <%
                }
              %>
			 </table>
   			</div>
   			</TD>
   		      </TR>	
		    </TABLE>

	  
    				 
  <SCRIPT type="text/javascript">
     radioClick("CURRENTROW",0);
  </SCRIPT>
  <SCRIPT type="text/javascript">
			
			function resizeDoc() {
      		 	divResize();
     		    adjustEquTables(
     		    	getElement("headTable"),
     		    	getElement("dataTable"),
     		    	getElement("dataDiv1"),1,false);
      		}
	 		resizeDoc();   			
     		window.onresize=resizeDoc;        
     </SCRIPT>
  
     


<%}%>


  </form>

</body>
</html>
