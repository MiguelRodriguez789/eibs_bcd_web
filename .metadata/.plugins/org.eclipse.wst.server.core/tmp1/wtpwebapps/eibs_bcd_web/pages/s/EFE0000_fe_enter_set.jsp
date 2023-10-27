<html>
<head>
<title>Front Office Input</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBSTreasury.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
 	function Sendet(){
   		if (!document.forms[0].CUNCOD.value == '') {
			document.forms[0].CUSTOMER.value = document.forms[0].CUNCOD.value;
   		}
 		document.forms[0].Submit();
	}
</SCRIPT>

</head>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "custList" class= "datapro.eibs.beans.JBList"   scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />

<%
	String client = currClient != null ? currClient.getE01CUSCUN() : ""; 
	String name = currClient != null ? currClient.getE01CUSNA1().trim() : ""; 
%>

<body bgcolor="#FFFFFF">
<H3 align="center"> Tesorer&iacute;a - L&iacute;mites Diarios
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="fe_enter_set, EFE0000"></H3>

<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0000">
<input type=HIDDEN name="SCREEN" value="200">
<input type=HIDDEN name="E01FESTYP">
  <input type="hidden" name="E01FESREF" size="9" maxlength="9">
  <input type="hidden" name="INPTOPT" value="102">
  <center>
    <table class="tableinfo" >
      <tr id="trdark"> 
        <td> 
          <div align="center">Cliente : 
            <input type="text" name="CUNCOD" size="9" maxlength="9" value="<%= client %>">
            <input type="text" name="CUNDSC" size="60" maxlength="45" value="<%= name %>">
            <a href="javascript:GetCustomerDescId('CUNCOD','CUNDSC','')">
            	<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a></div>
        </td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
      <tr bgcolor="#FFFFFF">
        <td width="33%">&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td width="33%"> 
  <div align="center"> 
	        <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>        </td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td> </td>
      </tr>
    </table>

  </center>
 
 
  <table  id=cfTable class="tableinfo" height="55%">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="98%">
            <TBODY> 
            <TR id="trdark"> 
              <TH align="CENTER" nowrap width="10%" ></TH>
              <TH align="CENTER" nowrap width="20%">N&uacute;mero</TH>
              <TH align="LEFT" nowrap width="50%">Nombres</TH>
              <TH align="CENTER" nowrap width="20%">Id</TH>
            </TR>
            </TBODY> 
          </TABLE>
		    <div id="dataDiv1" style="height:400px; overflow:auto;">  
            <TABLE id="dataTable"  style="font-size:7pt">
               <%
                custList.initRow();
                int k=1;
                while (custList.getNextRow()) {
                    if (custList.getFlag().equals("")) {
                    		out.println(custList.getRecord());
                    k++;
                    }        
                }
            %>
            </TABLE>
            </DIV>
            </TD>
        </TR>
        
    
</table>
      
  
<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT type="text/javascript">
            showErrors();
     </SCRIPT>
  <%
 }
%> <b>
  <input type=HIDDEN name="totalRow" value="1">
  </b>
<SCRIPT type="text/javascript">
     document.forms[0].totalRow.value="11";
     function resizeDoc() {
       	adjustEquTables(getElement('headTable'),getElement('dataTable'), getElement('dataDiv1'),1,false);
     }
     showChecked("CUSTOMER");
     resizeDoc();
     window.onresize = resizeDoc;

</SCRIPT>
</form>
</body>
</html>
