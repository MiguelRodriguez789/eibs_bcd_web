<html>
<head>
<title>Back Office</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ESWF0200Help" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">
  function goAction(op) {

		  if(document.forms[0].dealer.value == '' && op==2){
             alert("A valid transaction must be selected"); 
             return; 
          }
         
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
</head>

<BODY onLoad="">
<h3 align="center">Listado - Formatos Libres<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="sel.jsp,ESWF200"></h3>
<hr size="4">
<%
	if ( ESWF0200Help.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
      <div align="center"> <b> No hay resultados que correspondan con su criterio 
        de b&uacute;squeda</b></div>
      </TD></TR>
   		</TABLE>
<%  
		}
	else {
%>	
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
  <input type=HIDDEN name="REFERENCE">
  <input type=HIDDEN name="FORMAT">
  <input type=HIDDEN name="USERID">
  <input type=HIDDEN name="totalRow" value="0">
  <p> 
  <TABLE  id="mainTable" class="tableinfo">
 <TR > 
    <TD NOWRAP valign="top" width="100%" >
        <table id="headTable" width="100%" >
          <tr id="trdark"> 
           
            <th align=CENTER nowrap width="10%">Formato</th>
            <th align=CENTER nowrap width="20%"> 
              <div align="center">Identificaci&oacute;n Swift </div>
            </th>
            <th align=CENTER nowrap width="30%">Referencia</th>
            <th align=CENTER nowrap width="20%"> 
              <div align="center">Fecha</div>
            </th>
            <th align=CENTER nowrap width="20%">Identific. Usuario</th>
          </tr>
        </table>
     <div id="dataDiv1" class="scbarcolor" >
    <table id="dataTable" > 
		<%
                ESWF0200Help.initRow();
				int k=1;
                while (ESWF0200Help.getNextRow()) {
                 
                  out.println(ESWF0200Help.getRecord());
                  k++;   
                }
              %> 
    </table>
   </div>
 </Table>
<SCRIPT type="text/javascript">
     document.forms[0].totalRow.value="<%= k %>";
     function resizeDoc() {
       divResize(false);
	   adjustEquTables(getElement('headTable'), getElement('dataTable'), getElement('dataDiv1'), 1, false);
      }

     resizeDoc();
    
     window.onresize=resizeDoc;
     
</SCRIPT>
  </form>
<%}%>
</body>
</html>
