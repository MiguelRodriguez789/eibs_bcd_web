<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EDL030501Message"%>

<html>
<head>
<title>Deducciones y Relaciones entre Prestamos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="cifPos" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

<%
if ( userPO.getHeader23().equals("G") ||  userPO.getHeader23().equals("V")){
%>
	builtNewMenu(ln_i_1_opt);
<%   
}  else  {
   if(!userPO.getHeader22().equals("CreditLines")) {%>
		builtNewMenu(ln_i_2_opt);
		initMenu();
	<%}else{%>
		builtNewMenu(cuplus_inq_opt);
		initMenu();
<% } 
  }
 %>

</SCRIPT>

</head>

<BODY>

<SCRIPT> initMenu(); </SCRIPT>

<h3 align="center">Consulta de Deducciones<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_ded.jsp,EDL0305" width="32" height="32"></h3>
<hr size="4">
  <form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JEDL0305" >
    <INPUT TYPE=HIDDEN NAME="SCREEN" value="2">
	<INPUT TYPE=HIDDEN NAME="CODE" VALUE="">
	<INPUT TYPE=HIDDEN NAME="TYPE" VALUE="">
	<INPUT TYPE=HIDDEN NAME="ACCOUNT" VALUE="">

<%if ( cifPos.getNoResult() ) {%>
<TABLE class="tbenter" width=100% height=100%>
	<TR>
    	<TD> 
        	<div align="center"><font size="3"><b>No hay resultados que correspondan a su criterio de búsqueda</b></font></div>
		</TD>
	</TR>
</TABLE>
<% } else { %> 
  <table align="center" class="tableinfo" style="width: 100%">
    <tr> 
      <td nowrap> 
        <table cellspacing="0"  align="center" cellpadding="2" width="100%" class="tbhead" style="border: 0px">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E02CUN2" size="14" maxlength="9" readonly value="<%= userPO.getHeader2().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E02NA12" size="60" maxlength="45" readonly value="<%= userPO.getHeader3().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E02ACC" size="14" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E02PRO2" size="4" maxlength="4" readonly value="<%= userPO.getHeader1().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

<h4>Deducciones</h4>
<TABLE  id="mainTable" align="center" class="tableinfo" style="height: 400px; width: 100%">
 	<TR height="5%"> 
   		<TD NOWRAP valign="top" width="80%"> 
    		<TABLE id="headTable" width="100%">
    			<TR id="trdark">  
					<TH ALIGN=CENTER width="15%">C&oacute;digo</TH>
					<TH ALIGN=CENTER width="30%">Nombre</TH>
					<TH ALIGN=CENTER width="15%">Tipo</TH>
					<TH ALIGN=CENTER width="10%">Referencia</TH>
					<TH ALIGN=CENTER width="10%">Cobertura</TH>
					<TH ALIGN=CENTER width="10%">Deducci&oacute;n</TH>
					<TH ALIGN=CENTER width="10%">Factor</TH>
				</TR>
			</TABLE>
		</TD>
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:400px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
		<%
          cifPos.initRow();
          while (cifPos.getNextRow()) {
			EDL030501Message msgList = (EDL030501Message) cifPos.getRecord();
    	%> 
          <tr> 
            <td NOWRAP  align="center" width="15%"><a href="javascript:showDeductionDetail('<%= msgList.getE01DLICDE()%>','<%= msgList.getE01DLITYP()%>','<%= msgList.getE01DLIACC()%>')"><%= msgList.getE01DLICDE() %></a></td>
            <td NOWRAP  align="left" width="30%"><a href="javascript:showDeductionDetail('<%= msgList.getE01DLICDE()%>','<%= msgList.getE01DLITYP()%>','<%= msgList.getE01DLIACC()%>')"><%= msgList.getE01DEDNME() %></a></td>
            <td NOWRAP  align="center" width="15%"><a href="javascript:showDeductionDetail('<%= msgList.getE01DLICDE()%>','<%= msgList.getE01DLITYP()%>','<%= msgList.getE01DLIACC()%>')"><%= msgList.getE01DSCTYP() %></a></td>
            <td NOWRAP  align="center" width="10%"><a href="javascript:showDeductionDetail('<%= msgList.getE01DLICDE()%>','<%= msgList.getE01DLITYP()%>','<%= msgList.getE01DLIACC()%>')"><%= msgList.getE01DLIREF() %></a></td>
            <td NOWRAP  align="right" width="10%"><a href="javascript:showDeductionDetail('<%= msgList.getE01DLICDE()%>','<%= msgList.getE01DLITYP()%>','<%= msgList.getE01DLIACC()%>')"><%= msgList.getE01DLIPAM() %></a></td>
            <td NOWRAP  align="right" width="10%"><a href="javascript:showDeductionDetail('<%= msgList.getE01DLICDE()%>','<%= msgList.getE01DLITYP()%>','<%= msgList.getE01DLIACC()%>')"><%= msgList.getE01DLIDPM() %></a></td>
            <td NOWRAP  align="center" width="10%"><a href="javascript:showDeductionDetail('<%= msgList.getE01DLICDE()%>','<%= msgList.getE01DLITYP()%>','<%= msgList.getE01DLIACC()%>')">
            		<%= msgList.getE01DLIFAC().equals("F") ? "VALOR FIJO" : "" %>
					<%= msgList.getE01DLIFAC().equals("P") ? "PORCENTAJE" : "" %>
					<%= msgList.getE01DLIFAC().equals("1") ? "TASA/PLAZO" : "" %>
			</a></td>
          </tr>          
          <%}%>
		</table>
	</div>
</td>
</tr>
</TABLE>
<% } %>
</form>
</body>
</html>
