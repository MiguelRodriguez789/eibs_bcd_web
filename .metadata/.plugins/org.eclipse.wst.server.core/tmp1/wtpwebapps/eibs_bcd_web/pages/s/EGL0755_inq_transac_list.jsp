<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<HTML>
<HEAD>
<TITLE>
Estado de Cuentas de Cuentas Contables
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</HEAD>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "glList" class= "datapro.eibs.beans.JBObjList"  scope="session" />

<jsp:useBean id="stGLBal" class="datapro.eibs.beans.EGL075505Message"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<BODY>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>


<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%> 

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.accounting.JSEGL0755">
	  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
	
  <h3 align="center">Consulta de Transacciones de Cuentas Contables<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="inq_transac_list.jsp, EGL0755"> 
  </h3>
  <hr size="4">

  <p>&nbsp;</p>
<table class="tableinfo">
    <tr > 
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap width="30%" > 
              <div align="right"><b>Cuenta Contable : </b></div>
            </td>
            <td nowrap width="70%" > 
              <input type="text" name="E02GLMBNK" size="3" maxlength="2" value="<%= userPO.getBank().trim()%>" readonly>
              <input type="text" name="E02GLMCCY" size="4" readonly maxlength="3" value="<%= userPO.getCurrency().trim()%>" >
              <input type="text" name="E02GLMGLN" size="20" readonly maxlength="16" value="<%= userPO.getGenLedger().trim()%>" >
              <input type="text" name="DESCRIPTION" size="20" readonly maxlength="16" value="<%= userPO.getCusName().trim()%>" >
            </td>
          </tr>         
        </table>
      </td>
    </tr>
  </table>
    <%
	if ( glList.getNoResult() ) {
%>
 		<TABLE class="tbenter" width=100% height=20%>
 		<TR>
      <TD> 
        
      <div align="center"> <font size="3"><b> No hay datos que correspondan con su criterio de busqueda</b></font> 
      </div>
      </TD></TR>
   		</TABLE>
	
	  <div align="center"> 
	    <input id="EIBSBTN" type=submit name="Submit" value="Regresar">
	  </div>
<%
	}
	else {
%>
  <h4 align="left">Transacciones</h4>
  <table id=cfTable class="tableinfo">
    <tr id="trdark"> 
      <th align=CENTER width="53" nowrap>Fecha Valor</th>
	  <TH ALIGN=CENTER width="53" nowrap>Fecha Registro</TH>
      <th align=CENTER width="57" nowrap>Referencia</th>
      <th align=CENTER width="25" nowrap>TC</th>
      <th align=CENTER width="230" nowrap>Descripci&oacute;n </th>
      <th align=CENTER width="36" nowrap> 
        <div align="right">D&eacute;bito</div>
      </th>
      <th align=CENTER width="46" nowrap> 
        <div align="center">Cr&eacute;dito</div>
      </th>
      <th align=CENTER width="57" nowrap> 
  		<div align="center">Saldo Inicial</div>
      </th>
      <th align=CENTER width="57" nowrap> 
  		<div align="center">Saldo Final</div>
      </th>
      <th align=CENTER width="49" nowrap>Lote</th>
      <th align=CENTER width="39" nowrap>Hora</th>
      <th align=CENTER width="50" nowrap>Usuario </th>
      <th align=CENTER width="47" nowrap> 
        <p>Ban Originador</p>
      </th>
      <th align=CENTER width="43" nowrap>Sucursal Originadora</th>
    </tr>
    <%   
    			//initializing the transactions list
                glList.initRow();
                
                //temporal variables to control debits and credits
                java.math.BigDecimal debit = new java.math.BigDecimal("0");
				java.math.BigDecimal credit = new java.math.BigDecimal("0");
				//Formatted debit and credits
				String strDebit = "";
				String strCredit = "";
				
				while (glList.getNextRow()) {
					
                 datapro.eibs.beans.EGL075505Message msgList = (datapro.eibs.beans.EGL075505Message) glList.getRecord();
                 
                 //Controlling debits and credits
                 if (msgList.getE05TRADCC().equals("0")) {
					debit =	debit.add(msgList.getBigDecimalE05TRAAMT());
					strDebit = Util.fcolorCCY(msgList.getE05TRAAMT());
					strCredit = "&nbsp;";
				 } else if (msgList.getE05TRADCC().equals("5")) {
					credit = credit.add(msgList.getBigDecimalE05TRAAMT());
					strDebit = "&nbsp;";
					strCredit =	Util.fcolorCCY(msgList.getE05TRAAMT());
				 }

     %>           
                <TR>       
                  	<TD NOWRAP ALIGN="CENTER"><%=Util.formatDate(
									msgList.getE05DATE11(),
									msgList.getE05DATE12(),
									msgList.getE05DATE13()) %></TD>
					<TD NOWRAP ALIGN="RIGHT"><%=Util.formatCell(msgList.getE05TRAACC())%></TD>
					<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgList.getE05TRAREF())%></TD>
					<TD NOWRAP><%= msgList.getE05TRACDE()%></TD>
					<TD NOWRAP><%= Util.formatCell(msgList.getE05TRANAR())%></TD>
					<TD NOWRAP ALIGN=RIGHT><%=strDebit%></TD>
					<TD NOWRAP ALIGN=RIGHT><%= strCredit%></TD>
					<TD NOWRAP ALIGN=RIGHT><%=Util.fcolorCCY(msgList.getE05BEGBAL())%></TD>
					<TD NOWRAP ALIGN=RIGHT><%=Util.fcolorCCY(msgList.getE05ENDBAL())%></TD>
					<TD NOWRAP ALIGN=RIGHT><%=Util.formatCell(msgList.getE05TRABTH())%></TD>
					<TD NOWRAP ALIGN=CENTER><%= msgList.getE05TRATMS()%></TD>
					<TD NOWRAP><%=Util.formatCell(msgList.getE05TRAUSA())%></TD>
					<TD NOWRAP ALIGN=CENTER><%= Util.formatCell(msgList.getE05TRAOBK())%></TD>
					<TD NOWRAP ALIGN=CENTER><%= Util.formatCell(msgList.getE05TRAOBR())%></TD>
						
                  
                </TR>    		
    <%               
                }
    %> 
  </table>
  <BR>
  
  <TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>
       <%
        if ( glList.getShowPrev() ) {
      			int pos = glList.getFirstRec() - 49;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.accounting.JSEGL0755?SCREEN=1&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
        }
        %> 
            </TD>
 				<TD WIDTH="50%" ALIGN=RIGHT>
        <%
        if ( glList.getShowNext() ) {
      			int pos = glList.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.accounting.JSEGL0755?SCREEN=1&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
        }
        %> 
 </TD>
 </TR>
 </TABLE>      


  <div align="center"> 
	<input id="EIBSBTN" type=submit name="Submit" value="Regresar">
  </div>


  <%
  }
%>
<SCRIPT type="text/javascript">
   var max=cfTable.rows.length;
     for(i= 0; i < max; i++){
      cfTable.rows[i].cells[1].style.display="none";
     }
  </SCRIPT> 
</FORM>

</BODY>
</HTML>
