<html>
<head>
<title>Treasury - Incomplete Deals</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EWD0325Help" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "trOption" class= "datapro.eibs.beans.TrOption"  scope="session" />

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script type="text/javascript">
  function goAction(op) {

        if(op==1){
		 document.forms[0].opt.value = 1;
        }  
		else if(op==2){
		 document.forms[0].opt.value = 2;
        }  
		if(op==3){
		 document.forms[0].opt.value = 3;
        }  
		document.forms[0].submit();

  }

</SCRIPT>  

<script type="text/javascript">
  function getValor(Reference,Dealer,Type) {

    document.forms[0].ref.value = Reference;
	document.forms[0].dealer.value = Dealer;
	document.forms[0].typ.value = Type;
    
  }

</SCRIPT>  

<script type="text/javascript">
</script>
</head>

<BODY>
<% 
 
String sTitle = "Incomplete Deals";
try {
   sTitle = trOption.getHeader2();
} catch (Exception e) {
   sTitle = "Incomplete Deals";
}   
if (sTitle == null) sTitle = "Incomplete Deals";

%>

<h3 align="center"><%= sTitle%><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="inc_deals.jsp,EWD0325S"></h3>
<hr size="4">
  <form>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%> 
    
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="2">
  <INPUT TYPE=HIDDEN NAME="opt">
  <input type=HIDDEN name="ref">
  <input type=HIDDEN name="dealer">
  <input type=HIDDEN name="typ">
  <%
	if ( EWD0325Help.getNoResult() ) {
 %> 
  <TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
        
      <div align="center"> 
          <p><font size="3"><b> Por favor, seleccione una de las siguientes opciones</b></font></p>
          <table class="tbenter" width="100%">
            <tr> 
              <td CLASS="TDBKG" align=CENTER> <a href="javascript:goAction(1)" >Nuevo</a></td>
              <td CLASS="TDBKG" align=CENTER> <a href="<%=request.getContextPath()%>/pages/background.jsp" onClick="self.close()" >Salir</a></td>
            </tr>
          </table>
          <p>&nbsp; </p>
        </div>
      </TD></TR>
   		</TABLE>
  <%   		
	}
	else {
%> 
  <p> 
  <table class="tbenter" width="100%">
    <tr> 
      <td CLASS="TDBKG" align=CENTER> <a href="javascript:goAction(1)" >Nuevo</a></td>
      <td CLASS="TDBKG" align=CENTER> <a href="javascript:goAction(2)" >Modificar</a> 
      </td>
      <td CLASS="TDBKG" align=CENTER><a href="javascript:goAction(3)" >Borrar</a></td>
      <td CLASS="TDBKG" align=CENTER> <a href="<%=request.getContextPath()%>/pages/background.jsp" onClick="self.close()" >Borrar</a></td>
    </tr>
  </table>
  <center>
    <table class="tableinfo">
      <tr id="trclear"> 
        <th align=CENTER nowrap >&nbsp;</th>
        <th align=CENTER nowrap > 
          <div align="center">Reference</div>
        </th>
        <th align=CENTER nowrap > 
          <div align="center">Type</div>
        </th>
        <th align=CENTER nowrap > 
          <div align="center">Action <br>
            Taken</div>
        </th>
        <th align=CENTER nowrap > 
          <div align="center">Currency</div>
        </th>
        <th align=CENTER nowrap >Amount</th>
        <th align=CENTER nowrap > 
          <div align="center">Dealer<br>
            ID</div>
        </th>
      </tr>
      <tr> <%
                EWD0325Help.initRow();
                while (EWD0325Help.getNextRow()) {
                 
                    		out.println(EWD0325Help.getRecord());
                    
                }
              %> </tr>
    </table>
  </center>
  <%
     }   
  %> 
 
</form>
</body>
</html>
