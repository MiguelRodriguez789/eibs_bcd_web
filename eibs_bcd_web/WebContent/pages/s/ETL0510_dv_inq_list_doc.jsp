<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<HTML>
<HEAD>
<TITLE>
Lista de Documentos Varios
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</HEAD>

<jsp:useBean id= "dvList" class= "datapro.eibs.beans.JBList"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<BODY>


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/sortTables.js"> </SCRIPT>


<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%> 

<FORM>
<%
	if ( dvList.getNoResult() ) {
%>
 		<TABLE class="tbenter" width=100% height=100%>
 		<TR>
      <TD> 
        
      <div align="center"> <font size="3"><b> No hay datos que correspondan con su criterio de busqueda</b></font> 
      </div>
      </TD></TR>
   		</TABLE>
<%
	}
	else {
%>

  <h3 align="center">
  <% if (userPO.getOption().equals("3"))
  		 out.print("Consulta de Orden de Pago");
 	 else if (userPO.getOption().equals("4")) 	 
 	   		 out.print("Consulta de Cheques de Terceros");
 	 else if (userPO.getOption().equals("1")) 
		 	 out.print("Aprobación de Cheques Oficiales");
	 else if (userPO.getOption().equals("OF")) 
		 	 out.print("Consulta de Cheques Oficiales");		 	 	 
  	 else out.print("Consulta de Documentos Varios");
  %>
  <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="dv_inq_list_doc.jsp,ETL0510"> 
  </h3>
  <hr size="4">
  <p>&nbsp;</p>
  <TABLE class="tableinfo sortable">
    <TR id ="trdark"> 
      <TH ALIGN=CENTER  nowrap width="6%">Referencia</TH>
      <%if(userPO.getOption().equals("OF")){ %>
      	<TH ALIGN=CENTER  nowrap width="6%">Cheque</TH>
      <%} %>
      <TH ALIGN=CENTER  nowrap width="6%">Moneda</TH>
      <TH ALIGN=CENTER  nowrap width="6%">Sucursal</TH>
      <TH ALIGN=RIGHT  nowrap width="10%">Monto</TH>
      <TH ALIGN=CENTER  nowrap width="9%"> 
        <div align="center">Estado</div>
      </TH>
       <th align=CENTER  nowrap width="5%"> 
        <div align="center">Forma</div>
      </th>
      <TH ALIGN=CENTER  nowrap width="8%"> 
        <div align="center">Emitido</div>
      </TH>
      <TH ALIGN=CENTER  nowrap width="50%"> 
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
  <TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>
<%
        if ( dvList.getShowPrev() ) {
      			int pos = dvList.getFirstRec() - 51;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSETL0510?SCREEN=400&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
        }
%> 
	</TD>
 	<TD WIDTH="50%" ALIGN=RIGHT>
<%       
        if ( dvList.getShowNext() ) {
      			int pos = dvList.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSETL0510?SCREEN=400&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
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
