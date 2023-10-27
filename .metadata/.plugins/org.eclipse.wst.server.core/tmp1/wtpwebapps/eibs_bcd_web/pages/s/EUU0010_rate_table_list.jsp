<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Tasa Maxima Convencional</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "tbRateList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">

function setInfo(idx){  
  for ( var i=1; i<dataTable.rows.length; i++ ) {
       dataTable.rows[i].className="trnormal";
    }
   dataTable.rows[idx].className="trhighlight";
   document.forms[0].actRow.value = idx;       
}

function goAction(op) {
    var page = "";
    var params ="" 
    
	if (op == "M" || op == "D" || op == "E") { 
    	var row = parseInt(document.forms[0].actRow.value) - 1;   
 		params = "&ROW=" + row; 	
	}
	
	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEUU0010?SCREEN=200&opt=" + op + params;	
	CenterWindow(page,950,500,1); 			 
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

<h3 align="center">Tasa Maxima Convencional<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rate_table_list.jsp, EUU0010"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEUU0010">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
        
<%
	if ( tbRateList.getNoResult() ) {
%>
 	<TABLE class="tbenter" width=100% height=30%">
 		<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center"> No existen Tasas Maxima Convencional <br>Seleccione la opci&oacute;n Crear para adicionar una Tabla</h4> 
      </div>
      </TD></TR>
   	</TABLE>
   	<TABLE class="tbenter">
    <TR>
      <%if (userPO.getPurpose().equals("READONLY")) {%>
		  <TD class="TDBKG" width="50%">&nbsp;</TD>      
      <%} else {%>
	      <TD class="TDBKG" width="50%">
	  		<a href="javascript:goAction('N')">Crear</a>
	      </TD>      
      <%}%>
      <TD class="TDBKG" width="50%">
  		<a href="javascript:checkClose()">Salir</a>
      </TD>
    </TR>
  </TABLE>
<%
	}
	else {
%>
  
  <TABLE class="tbenter">
    <TR>
      <%if (userPO.getPurpose().equals("READONLY")) {%>
	      <TD class="TDBKG" width="25%">
	  		<a href="javascript:goAction('D')">Detalle</a>
	      </TD>      
      <%} else {%>
	      <TD class="TDBKG" width="25%">
	  		<a href="javascript:goAction('N')">Crear</a>
	      </TD>
	      <TD class="TDBKG" width="25%">
	  		<a href="javascript:goAction('M')">Modificar</a>
	      </TD>
	     <TD class="TDBKG" width="25%">
	  		<a href="javascript:goAction('E')">Eliminar</a>
	      </TD>      
      <%}%>
        
      <TD class="TDBKG" width="25%">
  		<a href="javascript:checkClose()">Salir</a>
      </TD>
    </TR>
  </TABLE>
  <TABLE class="tableinfo" id="dataTable">
    <TR id="trdark">
      <TH ALIGN=CENTER  nowrap width="1%"></TH> 
      <TH ALIGN=CENTER  nowrap >Banco</TH>
      <TH ALIGN=CENTER  nowrap >Moneda</TH>
      <TH ALIGN=CENTER  nowrap >Fecha </TH>
      <TH ALIGN=CENTER  nowrap >Plazo </TH>
      <TH ALIGN=CENTER  nowrap >Moneda Monto </TH>   
      <TH ALIGN=CENTER  nowrap >Dias Base </TH>    
    </TR>
    
    <%
                
          tbRateList.initRow();               
          while (tbRateList.getNextRow()) {
               EUU001001Message msgList = (EUU001001Message) tbRateList.getRecord();			 
                    
       %>             
                    
          <TR> 
          <td align="center" nowrap > 
        	<input type="radio" name="ROW" value="<%= tbRateList.getCurrentRow() %>" onClick="setInfo(<%= tbRateList.getCurrentRow() + 1 %>)" <% if (tbRateList.getCurrentRow() == 0) out.print("checked");%>>
      	  </td>  
      	   <td NOWRAP align=center>
          	<%=Util.formatCell(msgList.getE01USUBNK())%>
		  </td>
		  <td NOWRAP align=center>
          	<%=Util.formatCell(msgList.getE01USUCCY())%>
		  </td>
		  <td NOWRAP align=center>
          	<%=Util.formatDate(msgList.getE01USUDDD(),msgList.getE01USUDMM(),msgList.getE01USUDYY())%>
		  </td>
		  <td NOWRAP align=center>
          	<%=Util.formatCell(msgList.getE01USUPZO())%>
		  </td>
		  <td NOWRAP align=center>
          	<%=Util.formatCell(msgList.getE01USURCY())%>
		  </td>	
		  <td NOWRAP align=center>
          	<%=Util.formatCell(msgList.getE01USUBSE())%>
		  </td>		  
		</TR>
        <%        }
              %> 
  </TABLE>
  <SCRIPT language="JavaScript">     
	 showChecked("ROW");          
  </SCRIPT> 
<%      
  }
%> 
</form>
</body>
</html>
