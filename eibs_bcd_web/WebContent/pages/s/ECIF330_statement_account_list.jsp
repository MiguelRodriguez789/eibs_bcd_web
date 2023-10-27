<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Consulta de Cartolas</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<%@ page import = "datapro.eibs.master.Util,datapro.eibs.beans.*" %>

<jsp:useBean id="stmlist" class="datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="header" class="datapro.eibs.beans.ECIF33001Message" scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
 
 var reason = "";

 function showInqStatementPrint(refpath) {
   var formLength = document.forms[0].elements.length;
   var refnum = " ";
   
   for (n=0;n<formLength;n++) {
      	var element = document.forms[0].elements[n];
      	var elementName= element.name;
      	var elementValue= element.value;
      	if (elementName == "REFPATH" && elementValue == refpath) {
      			if (element.disabled == "") { 
      				document.forms[0].elements[n].click(); 
      			} else { 
      				document.forms[0].TRANSREFNUM.value = ""; 
      			}	
        		break;
      	}
   }
   page = "${pageContext.request.contextPath}/servlet/datapro.eibs.approval.JSEPR1080A?SCREEN=100&REFNUM="+refnum;
   CenterWindow(page,600,500,2);
 }

</SCRIPT>

</head>

<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>


<h3 align="center">Consulta de Cartolas<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="statement_account_list, ECIF330"></h3>
<hr size="4">
<p>&nbsp;</p>

<form method="post">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  <table class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellspacing="0" cellpadding="2" width="100%" class="tbhead" align="center">
          <tr id=trdark> 
            <td nowrap width="10%" align="right"> 
              <div align="right">Cliente : </div>
            </td>
            <td nowrap width="10%" align="left"> <%=header.getE01ACMCUN()%> </td>
            <td nowrap width="10%" align="right"> 
              <div align="right">Nombre : </div>
            </td>
            <td nowrap width="30%"align="left"> <%= header.getE01CUSNA1()%> </td>
            <td nowrap width="10%" align="right"> 
              <div align="right">Identificacion : </div>
            </td>
            <td nowrap width="30%" align="left"> <%= header.getE01CUSIDE()%> </td>
          </tr>
          <tr id=trclear> 
            <td nowrap width="10%" align="right"> Cuenta : </td>
            <td nowrap width="10%" align="left"> <%= header.getE01ACMACC()%> </td>
            <td nowrap width="10%" align="right"> 
              <div align="right">Producto : </div>
            </td>
            <td nowrap width="30%" align="left"> 
            	<div> 
            	 <%=header.getE01ACMPRO()%> - 
            	 <%=header.getE01DSCPRO()%> 
                </div>  
            </td>
            <td nowrap width="10%" align="right"> 
              <div align="right">Oficial Cuenta : </div>
            </td>
            <td nowrap width="30%" align="left"> 
            	<div> 
            	 <%=header.getE01ACMOFC()%> - 
            	 <%=header.getE01DSCOFC()%> 
                </div>  
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <BR>
  <% if (stmlist.getNoResult()) {%>
      <h3 align=center>No existen Estados de Cuenta para esta Cuenta</h3>
  <% } else { %>
  
  <table class="tableinfo">
    <tr > 
      <td nowrap>
        <table id="headTable" style="width: 100%">
		    <tr id="trdark">  
		      <th align="center" nowrap>Numero</TH>
		      <th align="center" nowrap>Fecha <br> Emision</TH>
		      <th align="center" nowrap>Nro <br> Impresion</TH>
		      <th align="center" nowrap>Forma <br> Envio</TH>
		      <th align="center" nowrap>Path</TH>
		    </TR>
		</table>  
   		<div id="dataDiv1" class="scbarcolor" style="padding:0">
    		<table id="dataTable"  >
               <%          		
          		stmlist.initRow();
   		  		while (stmlist.getNextRow()) {
          			ECIF33002Message message = (ECIF33002Message) stmlist.getRecord();
          		%>    		
          			  <tr> 
				         <td nowrap align="center"> <a HREF="javascript:showInqStatementPrint('<%= message.getE02STHPTH()%>')"> <%= message.getE02STHNUM()%> </a></td>
				         <td nowrap align="center"> <a HREF="javascript:showInqStatementPrint('<%= message.getE02STHPTH()%>')"> <%= Util.formatCustomDate(currUser.getE01DTF(), message.getE02STHRDM(), message.getE02STHRDD(), message.getE02STHRDY()) %> </a></td>	
				         <td nowrap align="center"> <a HREF="javascript:showInqStatementPrint('<%= message.getE02STHPTH()%>')"> <%= message.getE02STHPRN()%> </a></td>
				         <td nowrap align="center"> <a HREF="javascript:showInqStatementPrint('<%= message.getE02STHPTH()%>')"> <%= message.getE02STHSTV()%> </a></td>
				         <td nowrap align="left"> <a HREF="javascript:showInqStatementPrint('<%= message.getE02STHPTH()%>')"> <%= message.getE02STHPTH()%> </a></td>
				     </tr>
				 <%
          		   }         
                %>         
		     </table>   
  		</div>	
          		 
      </td>
    </tr>
  </table>
  <% } %>

  <SCRIPT type="text/javascript">
    function resizeDoc() {
            	adjustEquTables(getElement('headTable'),getElement('dataTable'), getElement('dataDiv1'),1,false);
    }
  	resizeDoc();
  	window.onresize=resizeDoc;
  </SCRIPT>
  
  </form>
</body>
</html>
