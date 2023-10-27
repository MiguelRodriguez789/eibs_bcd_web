<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Sistema Administración Portafolio</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id="bloombergList" class="datapro.eibs.beans.JBObjList"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
		function goAction(option){
			document.forms[0].SCREEN.value = option;
			document.forms[0].submit();
		}
</SCRIPT>

<%
 if (userPO.getPurpose().equals("M") ) {
%>

   <SCRIPT type="text/javascript">		
      builtNewMenu(inst_basic_opt);
 	  initMenu();
   </SCRIPT>

<%
}
%>
 

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
  <h3>Actualizacion de Producto Bloomberg <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="inv_bloomberg_list.jsp, EIE0050"> 
  </h3>
</div>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0050" >
  <input type="hidden" name="SCREEN"  value="300">

  
<%
	if ( bloombergList.getNoResult() ) {
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
      <TD ALIGN=CENTER class=TDBKG width="35%"> <a href="javascript:goAction(300)" ><b>Mantenimiento</b></a> 
      </TD>
      <TD ALIGN=CENTER class=TDBKG width="35%"> <a href="javascript:goAction(700)" ><b>Borrar</b></a> 
      </TD>
      <TD ALIGN=CENTER class=TDBKG width="30%"> <a href="<%=request.getContextPath()%>/pages/background.jsp" ><b>Salir</b></a> 
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
      <TH ALIGN=CENTER NOWRAP>Código de Instrumento</TH>
      <TH ALIGN=CENTER NOWRAP>Descripción</TH>
      <TH ALIGN=CENTER NOWRAP>Tipo de Producto</TH>
      <TH ALIGN=CENTER NOWRAP>Numero ISIN</TH>
      <TH ALIGN=CENTER NOWRAP>Serie</TH>
      <TH ALIGN=CENTER NOWRAP>Numero CUSIP</TH>
      <TH ALIGN=CENTER NOWRAP>Simbolo</TH>
     </TR>
     <%   
                bloombergList.initRow();
				boolean firstTime = true;
				String chk = "";
                while (bloombergList.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {   
						chk = "";
					}
                 datapro.eibs.beans.EIE005002Message msgList = (datapro.eibs.beans.EIE005002Message) bloombergList.getRecord();

     %>           
                <TR>       
                  <TD NOWRAP ALIGN=CENTER width="10%">  
                      <input type="radio" name="selectedRow" value="<%=bloombergList.getCurrentRow()%>" <%=chk%>>
                  </TD>
                  <TD NOWRAP  ALIGN=CENTER width="10%"><%= msgList.getE02ISIIIC() %></td>  
                  <TD NOWRAP  ALIGN=CENTER width="10%"><%= msgList.getE02ISIDSC() %></td> 
                  <TD NOWRAP  ALIGN=CENTER width="10%"><%= msgList.getE02ISIPTY() %></td> 
                  <TD NOWRAP  ALIGN=left width="10%"><%= msgList.getE02ISINUM() %></td> 
                  <TD NOWRAP  ALIGN=CENTER width="10%"><%= msgList.getE02ISISER() %></td>
                  <TD NOWRAP  ALIGN=CENTER width="10%"><%= msgList.getE02ISICUS() %></td>
                  <TD NOWRAP  ALIGN=RIGHT width="10%"><%= msgList.getE02ISISYM() %></td>   
                  
                </TR>    		
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
        if ( bloombergList.getShowPrev() ) {
      			int pos = bloombergList.getFirstRec() - 13;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.invest.JSEIE0050?SCREEN=100&Pos=" + pos + "\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/s/previous_records.gif\" ></A>");
        }
  %>  
  </TD>
  <TD WIDTH="50%" ALIGN=RIGHT>     
 <%      
        if ( bloombergList.getShowNext() ) {
      			int pos = bloombergList.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.invest.JSEIE0050?SCREEN=100&Pos=" + pos + "\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/s/next_records.gif\" ></A>");
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
