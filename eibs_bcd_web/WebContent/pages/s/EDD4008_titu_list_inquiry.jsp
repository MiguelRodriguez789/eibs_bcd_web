<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@page import="com.datapro.constants.EibsFields"%>

<%@page import="datapro.eibs.sockets.MessageRecord"%>
<%@page import="datapro.eibs.beans.EDD400801Message"%>

<html>
<head>
  
<title>Titulares</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EDD400801List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">


    
         <% if ( userPO.getOption().equals("RT") ) { %>
		     builtNewMenu(rt_i_opt);
         <% } else {  %>
		     builtNewMenu(sv_i_opt);
         <% } %>
  
function goInquiry() {
    isCheck();
	if (!ok) {
		alert("Por Favor Seleccione Registro!");
		return;	 
	}
	var row = document.forms[0].actRow.value;
	var pg = "";
	pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD4008?SCREEN=900&ROW="+row;  
	CenterWindow(pg,600,500,2);
}


function isCheck() {
	var formLength= document.forms[0].elements.length;
   	ok = false;
	for(n=0;n<formLength;n++) {
     	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "ROW") {
			if (document.forms[0].elements[n].checked == true) {
			    document.forms[0].actRow.value = document.forms[0].elements[n].value;
				ok = true;
				break;
			}
      	}
    }
}

<%  
 String title = "Titulares";
%>


</SCRIPT>  

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
    out.println("<SCRIPT> initMenu(); </SCRIPT>");
%>

</head>

<BODY>
<h3 align="center"> <%= title %><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="titu_list_inquiry.jsp, EDD4008"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD4008" >
  <p> 
   <input type=HIDDEN name="SCREEN" value="800">
   <input type=HIDDEN name="TOTROWS" value="0">
   <input type=HIDDEN name="opt" value="1">
   <INPUT TYPE=HIDDEN name="actRow" value="0">
   <INPUT TYPE=HIDDEN name="NEXTROWS" value="0">
   <INPUT TYPE=HIDDEN name="CURRROWS" value="0">
   <INPUT TYPE=HIDDEN name="FromRecord" value="0"> 
   <INPUT TYPE=HIDDEN name="num" value="0"> 
  </p>

 <table class="tableinfo">
  <tr > 
    <td nowrap> 
      <table cellspacing="0" cellpadding="2" width="100%" class="tbhead" bgcolor="#FFFFFF" bordercolor="#FFFFFF" align="center">
         <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E04DEACUN" size="9" maxlength="9" readonly value="<%= userPO.getHeader2().trim() %>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E04CUSNA1" size="45" maxlength="45" readonly value="<%= userPO.getHeader3().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E06ACC" size="12" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly >
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda :</b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto :</b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
                <input type="text" name="E04DEAPRO" size="5" maxlength="4" readonly value="<%= userPO.getHeader1().trim()%>">
              </div>
            </td>
          </tr>
      </table>
    </td>
  </tr>
 </table>

 
  <p> 
 <%
	if ( EDD400801List.getNoResult() ) {
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
                    <div align="center"><a href="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000I?SCREEN=31"><b>Regresar</b></a></div>
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
		        <div align="center"><a href="javascript:goInquiry()"><b>Consultar</b></a></div>
              </td>
            </tr>       
     
        
  </table>
   
  <br>
  <table  id=cfTable class="tableinfo">
    <tr > 
      <td NOWRAP valign="top" width="100%"> 
        <table id="headTable" width="100%">
          <tr id="trdark"> 
            <th align=center nowrap width="5%">&nbsp;</th>
            <th align=center nowrap width="10%"> N&uacute;mero Titular</th>
            <th align=center nowrap width="10%"> Cliente</th>
            <th align=center nowrap width="10%"> Nombre</th>
            <th align=center nowrap width="10%"> Tipo Relaci&oacute;n</th>
            <th align=center nowrap width="10%"> Status Registro</th>
          </tr>
          
          <%
    	  int i = 0;
          EDD400801List.initRow();    
          while (EDD400801List.getNextRow()) {
             EDD400801Message msgList = (EDD400801Message) EDD400801List.getRecord();	 
         %>   
             
          
          <tr> 
            
            <td NOWRAP align="center" width="5%">
           	  <INPUT TYPE="radio" name="ROW"  value="<%= msgList.getE01MAN()%>"
           	  	<% if (EDD400801List.getCurrentRow() == 0) out.print(" checked"); %>>
		    </td>
		    <td NOWRAP  align=center width=\"10%\"><%= msgList.getE01MAN() %></td>
            <td NOWRAP  align=center width=\"10%\"><%= msgList.getE01RCN() %></td>
            <td NOWRAP  align=center width=\"10%\"><%= msgList.getE01MA1() %></td>
            <td NOWRAP  align=center width=\"10%\"><%= msgList.getD01UC2() %></td>
            <td NOWRAP  align=center width=\"40%\"><%= msgList.getD01RTY() %></td>
            
          </tr>
          
            <% 
       	       i++; 
              } 
             %> 
        </table>
  </table>
     
<SCRIPT type="text/javascript">
    document.forms[0].TOTROWS.value = <%= i%>;
	document.forms[0].NEXTROWS.value = <%= EDD400801List.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= EDD400801List.getFirstRec()%>;
     
</SCRIPT>

<%}%>
	

  </form>

</body>
</html>
