<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util"%>
<HTML>
<HEAD>
<TITLE>
Cheques Oficiales
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id= "dvList" class= "datapro.eibs.beans.JBList"  scope="session"/>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT> 
function setChkDet(bank, branch, currency, amount, check) {
	var form = top.opener.document.forms[0];

	   form['E01OFMBNK'].value = bank;
  	   form['E01OFMBRN'].value = branch;
  	   form['E01OFMCCY'].value = currency;
  	   form['E01OFMMCH'].value = amount;
  	   form['E01OFMNCH'].value = check;
  	   
 	top.close();	
}
</SCRIPT>
</HEAD>
<BODY>




<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%> 

<FORM>
  <h3 align="center">Listado Cheques Oficiales - Orden de No Pago<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="of_chk_list.jsp, ETL0510">   </h3>
  <hr size="4">
<%
	if ( dvList.getNoResult() ) {
%>
 		<TABLE class="tbenter" width=100% height=80%>
 		<TR>
      <TD> 
        
        <div align="center"><b>No hay datos que correspondan con su criterio de busqueda</b> </div>
      </TD></TR>
   		</TABLE>
  <%
	}
	else {
%> 
 
  <BR>
  <TABLE class="tableinfo">
    <TR id="trdark"> 
      <TH ALIGN=CENTER  nowrap width="10%">Cheque</TH>
      <TH ALIGN=CENTER  nowrap width="8%">Moneda</TH>
      <TH ALIGN=CENTER  nowrap width="7%">Sucursal</TH>
      <TH ALIGN=CENTER  nowrap width="9%">Monto</TH>
      <TH ALIGN=CENTER  nowrap width="5%"> 
        <div align="right">Estado</div>
      </TH>
      <TH ALIGN=CENTER  nowrap width="6%"> 
        <div align="center">Emitido</div>
      </TH>
      <TH ALIGN=CENTER  nowrap width="55%"> 
        <div align="center">Beneficiario</div>
      </TH>
    </TR>
    <%
                dvList.initRow();
                while (dvList.getNextRow()) {
                    if (dvList.getFlag().equals("")) {
                    		out.println(dvList.getRecord());
                    }
                }
              %> 
  </TABLE>
  <BR>
  
  <TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>

<%
        if ( dvList.getShowPrev() ) {
      			int pos = dvList.getFirstRec() - 51;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSETL0510?SCREEN=6&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
        }
 %>
 </TD>
 <TD WIDTH="50%" ALIGN=RIGHT>
 <%       
        if ( dvList.getShowNext() ) {
      			int pos = dvList.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSETL0510?SCREEN=6&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
        }
 %>
 </TD>
  </TR>
 </TABLE>
<%        
  }
%> 
</FORM>

</BODY>
</HTML>
