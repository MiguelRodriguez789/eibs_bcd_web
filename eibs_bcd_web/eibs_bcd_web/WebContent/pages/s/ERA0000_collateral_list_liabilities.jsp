<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Operaciones Garantizadas</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "clList" class= "datapro.eibs.beans.JBList"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

</head>

<BODY> <!--// onload="MM_preloadImages('<%=request.getContextPath()%>/images/s/exit_over.gif','<%=request.getContextPath()%>/images/s/inquiry_over.gif')"-->


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
<%
if (userPO.getPurpose().equals("INQUIRY")){
%>

<%
if ( userPO.getOption().equals("RT") ) {
%>
	 builtNewMenu(rt_i_opt);
<%   
}
else if ( userPO.getOption().equals("SV") ) {
%>
	 builtNewMenu(sv_i_opt);
<%   
}
else if (userPO.getOption().equals("CD")){
%>
	 builtNewMenu(cd_i_opt);
<%   
}
else if (userPO.getOption().equals("LN")){
%>
	 builtNewMenu(ln_i_1_opt);
<%
} else {
	
%>
	 builtNewMenu(colla_i_opt);
<%
}
} else if (userPO.getPurpose().equals("APPROVE")) {
%>
	 builtNewMenu(colla_a_opt);
<%
}
%>

</SCRIPT>

<%
   if (userPO.getPurpose().equals("INQUIRY")
   		|| userPO.getPurpose().equals("APPROVE")){ 
   out.println("<SCRIPT> initMenu(); </SCRIPT>");}
%> 

<h3 align="center">Operaciones Garantizadas<</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0000" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
<INPUT TYPE=HIDDEN NAME="opt" VALUE="1">

<%
	if ( clList.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
        <div align="center">
        		<font size="3"><b>
        				No hay resultados que correspondan a su criterio de b�squeda 
        		</b></font>
        	</div>
      </TD></TR>
   		</TABLE>
<%   		
	}
	else {
%>
  <table class="tableinfo">
    <tr > 
      <td nowrap>
        
      <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
        <tr id="trdark"> 
          <TD ALIGN=RIGHT WIDTH=12%> Cuenta : </TD >
          <TD ALIGN=LEFT WIDTH=12%><%= userPO.getAccNum() %> </TD>
          <TD ALIGN=LEFT WIDTH=11%> 
            <div align="right">Moneda : </div>
          </TD>
          <TD ALIGN=LEFT WIDTH=5%><%= userPO.getCurrency() %></TD>
          <TD ALIGN=LEFT WIDTH=21%> 
            <div align="right">Tipo de Cuenta : </div>
          </TD>
          <TD ALIGN=LEFT WIDTH=8%><%= userPO.getHeader5() %></TD>
          <TD ALIGN=LEFT WIDTH=15%> 
            <div align="right">Producto : </div>
          </TD>
          <TD ALIGN=LEFT WIDTH=16%><%= userPO.getHeader6() %></TD>
        </TR>
        <tr id="trdark"> 
          <TD ALIGN=RIGHT WIDTH=12%>Valor M�ximo a Garantizar : </TD>
          <TD ALIGN=LEFT WIDTH=12%><%= userPO.getHeader7() %></TD>
          <TD ALIGN=LEFT WIDTH=11%>&nbsp;</TD>
          <TD ALIGN=LEFT WIDTH=5%>&nbsp;</TD>
          <TD ALIGN=LEFT colspan="2"> 
              <div align="right">Saldo Remanente : </div>
          </TD>
          <TD ALIGN=LEFT colspan="2"><%= userPO.getHeader8() %></TD>
        </TR>
      </TABLE>
	  </TD>
    </TR>
  </TABLE>
<h4></h4>
  
  <TABLE class="tableinfo">
    <TR id="trdark"> 
      <TH ALIGN=CENTER>Cuenta</TH>
      <TH ALIGN=CENTER>Tipo</TH>
      <TH ALIGN=CENTER>Moneda</TH>
      <TH ALIGN=CENTER>Monto</TH>
      <TH ALIGN=CENTER>Garant&iacute;a de<br>
        esta Cuenta</TH>
      <TH ALIGN=CENTER>Otras Garant�as</TH>
      <TH ALIGN=CENTER>Saldo a Garantizar</TH>
    </TR>
    <%
                clList.initRow();
                while (clList.getNextRow()) {
                    if (clList.getFlag().equals("")) {
                    		out.println(clList.getRecord());
                    }
                }
    %> 
  </TABLE>

<%
  }
%>

  </form>
  <% if (!userPO.getPurpose().equals("INQUIRY") && !userPO.getPurpose().equals("APPROVE")){ %>
  <script type="text/javascript">
	$('a').removeAttr('HREF');
  </script>
  <%}%>
</body>
</html>
