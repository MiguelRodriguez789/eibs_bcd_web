<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Position List</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id="list" class="datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
		function goAction(option, action){
			document.forms[0].E01ACTION.value = action;
			document.forms[0].SCREEN.value = option;
			document.forms[0].submit();
		}
		function setInstrument(value){
			document.forms[0].INSTRUMENT.value=value;
		}
</SCRIPT>


</head>
<body >
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

 
%>

<div align="center"> 
  <h3>Posicion de Inversiones <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="inv_position_detail_list.jsp, EIE0350"> 
  </h3>
</div>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0350" >
  <input type="hidden" name="SCREEN"  value="500">
  <input type="hidden" name="ACCOUNT"  value="">
  <input type="hidden" name="E01ACTION"  value="">

  
<%
	if ( list.getNoResult() ) {
 %>
   	<TABLE class="tbenter" width=100% height=90%>
   		<TR>
           <TD> 
           <div align="center"> <font size="3"><b> No hay resultado que corresponda a su criterio de búsqueda. 
        </b></font> </div>
      </TD></TR>
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

  <TABLE class="tbenter" width="100%">
    <TR> 
      <TD ALIGN=CENTER class=TDBKG width="25%"> <a href="javascript:goAction(500,'B')" ><b>Bloquear</b></a> 
      </TD>
      <TD ALIGN=CENTER class=TDBKG width="25%"> <a href="javascript:goAction(500,'U')" ><b>Desbloquear</b></a> 
      </TD>
      <TD ALIGN=CENTER class=TDBKG width="25%"> <a href="javascript:goAction(300)" ><b>Totales</b></a> 
      </TD>
      <TD ALIGN=CENTER class=TDBKG width="25%"> <a href="<%=request.getContextPath()%>/pages/background.jsp" ><b>Salir</b></a> 
      </TD>
    </TR>
  </TABLE>

<br>
 
 <TABLE id="mainTable" class="tableinfo">      
 <TR> 
     <TD NOWRAP valign="top" width="100%" > 
     <TABLE id="headTable" width="100%">
     <TR id="trdark"> 
      <TH ALIGN=CENTER NOWRAP></TH>
      <TH ALIGN=CENTER NOWRAP>Cuenta</TH>
      <TH ALIGN=CENTER NOWRAP>Nombre</TH>
      <TH ALIGN=CENTER NOWRAP>Estado</TH>
      <TH ALIGN=CENTER NOWRAP>Moneda</TH>
      <TH ALIGN=CENTER NOWRAP>Monto</TH>
      <TH ALIGN=CENTER NOWRAP>Equivalente en M/N</TH>
      <TH ALIGN=CENTER NOWRAP>Vencimiento</TH>
      <TH ALIGN=CENTER NOWRAP>Tasa</TH>

     </TR>
     <%   
                list.initRow();
                while (list.getNextRow()) {

                 datapro.eibs.beans.EIE035001Message msgList = (datapro.eibs.beans.EIE035001Message) list.getRecord();

     %> 
     <% if (msgList.getE01LINTYP().equals("D"))  {%>         
                <TR>       
                  <TD NOWRAP ALIGN=CENTER width="10%">  
                  	<input type="checkbox" id="selectedAcc" name="selectedAcc" value="<%=msgList.getE01DEAACC()%>" >
                  </TD>
                  <TD NOWRAP  ALIGN=CENTER width="10%"><%= msgList.getE01DEAACC() %></td> 
                  <TD NOWRAP  ALIGN=CENTER width="10%"><%= msgList.getE01CUSNME() %></td>
                  <TD NOWRAP  ALIGN=CENTER width="10%">
                  	<% if (msgList.getH01FLGWK1().equals("P") ) { %>
                  		<FONT COLOR="FF1493"><%= msgList.getD01DEAFLY() %></FONT><!-- FF0000 = red -->
                 	<% } else { %> 
                 		<%= msgList.getD01DEAFLY() %>
                 	<% } %>		
                  </td>
                  <TD NOWRAP  ALIGN=CENTER width="10%"><%= msgList.getE01DEACCY() %></td> 
                  <TD NOWRAP  ALIGN=CENTER width="10%"><%= msgList.getE01TOTINS() %></td>
                  <TD NOWRAP  ALIGN=CENTER width="10%"><%= msgList.getE01TOTBCU() %></td>    
                  <TD NOWRAP  ALIGN=CENTER width="10%">
                  	<% if (currUser.getE01DTF().equals("DMY")) { %>
                  		<%=msgList.getE01DEAMAD()%>/<%=msgList.getE01DEAMAM()%>/<%=msgList.getE01DEAMAY()%>
                  	<% } else { %>
                  		<%=msgList.getE01DEAMAM()%>/<%=msgList.getE01DEAMAD()%>/<%=msgList.getE01DEAMAY()%>
                  	<% } %>
                  </td> 
                  <TD NOWRAP  ALIGN=CENTER width="10%"><%= msgList.getE01YIELD() %></td>   
                  
                </TR> 
     <% } else { %>
     			<TR id="trdark">       
                  <TD NOWRAP ALIGN=CENTER width="10%">  
                      <b>TOTAL</b>
                  </TD>
                  <TD NOWRAP  ALIGN=CENTER width="10%"></td> 
                  <TD NOWRAP  ALIGN=CENTER width="10%"><%= msgList.getE01NUMDOC() %></td>
                  <TD NOWRAP  ALIGN=CENTER width="10%"></td>
                  <TD NOWRAP  ALIGN=CENTER width="10%"></td> 
                  <TD NOWRAP  ALIGN=CENTER width="10%"><%= msgList.getE01TOTINS() %></td>
                  <TD NOWRAP  ALIGN=CENTER width="10%"><%= msgList.getE01TOTBCU() %></td>    
                  <TD NOWRAP  ALIGN=CENTER width="10%"></td> 
                  <TD NOWRAP  ALIGN=CENTER width="10%"></td> 
                </TR> 
     <% } %>   		
    <%               
                }
    %> 
   </table>
   </TD>
   
  </TR>	
 </TABLE> 


<BR>
<TABLE class="tbenter" WIDTH="100%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>
<%
        if ( list.getShowPrev() ) {
      			int pos = list.getFirstRec() - 13;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.invest.JSEIE0350?SCREEN=100&Pos=" + pos + "\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/s/previous_records.gif\" ></A>");
        }
  %>  
  </TD>
  <TD WIDTH="50%" ALIGN=RIGHT>     
 <%      
        if ( list.getShowNext() ) {
      			int pos = list.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.invest.JSEIE0350?SCREEN=100&Pos=" + pos + "\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/s/next_records.gif\" ></A>");
        }
   %> 
   </TD>
 	</TR>
 	</TABLE> 
 <%           
  }
%>

 
  </form>
</body>
</html>
