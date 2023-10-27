<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>Treasury - Line of Credit</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet" type="text/css" media="screen" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "custList" class= "datapro.eibs.beans.JBObjList"   scope="session"/>
<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />

<%
	String client = currClient != null ? currClient.getE01CUSCUN() : ""; 
	String name = currClient != null ? currClient.getE01CUSNA1() : ""; 
%>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBSTreasury.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">
var ok = false;
 
function goProcess() {
  if(document.forms[0].R01TRECUN.value == ""){
	var formLength= document.forms[0].elements.length;
	for(n=0;n<formLength;n++) {
   		var elementName= document.forms[0].elements[n].name;
   		if(elementName == "CUSTOMER") {
			if (document.forms[0].elements[n].checked == true) {
				document.forms[0].R01TRECUN.value = document.forms[0].elements[n].value;
				break;
			}
   		}
   	}
  }
  if(document.forms[0].R01TRECUN.value == "") {
  	alert("Favor Seleccionar un Cliente!!!");
	return;	 
  }
  document.forms[0].SCREEN.value = "42";
  document.forms[0].submit();
  document.forms[0].Submit.disabled = true;
}


</SCRIPT>

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

<H3 align="center">Tesorería - Lineas de Credito (TRS)
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="line_credit.jsp, ETR0000">
</h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.treasury.JSETR0000">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="42">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">
  
  <center>
    <table id="dataTable" cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
	  <tr id="trintro"> 
        <td> 
          <div align="right">Cliente : </div>
        </td>
        <td >
            <input type="text" name="R01TRECUN" size="10" maxlength="9">
            <input type="text" name="CUNDSC" size="50" maxlength="45">
            <a href="javascript:GetCustomerDescId('R01TRECUN','CUNDSC','')">
            <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="bottom" border="0" ></a>
        </td>
      </tr>
    </table>
  </center>

<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
      <tr bgcolor="#FFFFFF"> 
        <td width="100%"> 
  			<div align="center"> 
	        	<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="goProcess()">
  			</div>        
  		</td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td> </td>
      </tr>
</table>

<center>
    <table  id="mainTable" class="tableinfo" width="100%">
      <tr> 
        <td nowrap valign="top" height="60" width="100%"> 
          <table id="headTable" width="100%">
            <tbody> 
            <tr id="trintrot"> 
              <th align="CENTER" nowrap >Sel</th>
              <th align="LEFT" nowrap >Número</th>
              <th align="LEFT" nowrap >Nombre</th>
              <th align="CENTER" nowrap >Identificación</th>
            </tr>
            </tbody> 
          </table>
          <div id="dataDiv2" class="scbarcolor"  style="overflow-Y:scroll;height:250" > 
            <table id="dataTable1"  style="font-size:7pt" width="100%">
              <%
                custList.initRow();
                int k = 0;
                while (custList.getNextRow()) {

                	datapro.eibs.beans.ETR000002Message msgList = (datapro.eibs.beans.ETR000002Message) custList.getRecord();
					if (msgList.getE02INDOPE().equals("*")) {
						break;
					}
					%>	
						<tr>
							<td nowrap align="center" >	 
        						<input type="radio" name="CUSTOMER" value="<%=msgList.getE02TRECUN()%>" >
        					</td> 
        					<td nowrap align="center" >
        						<%= msgList.getE02TRECUN()%>
        					</td>
        					<td nowrap align="left" >
        						<%= msgList.getE02TRENA1()%>
        					</td>
        					<td nowrap align="left" >
        						<%= msgList.getE02TREIDN()%>
        					</td>
						</tr>
					<%
                	}
	            %>
            </table>
          </div>
        </td>
      </tr>
    </table>
  </center>
      
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

     resizeDoc();
     window.onresize = resizeDoc;

</SCRIPT>

</form>
</body>
</html>