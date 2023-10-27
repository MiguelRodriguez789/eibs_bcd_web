<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="datapro.eibs.beans.EGL081001Message"%>
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
<jsp:useBean id= "stGLBal" class="datapro.eibs.beans.EGL081002Message"  scope="session" />
<jsp:useBean id= "glList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "glHeader" class= "datapro.eibs.beans.JBStatementHeader"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<BODY>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

function PrintPreview() {

  <% 
  int iniPos = glList.getFirstRec() - 1;
  out.println("var pos = " + iniPos + ";");
  %>
	var pg = '<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSEGL0810?SCREEN=3&Pos=' + pos;
	CenterWindow(pg,720,500,2);

}

</SCRIPT>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%> 

<FORM>
<%
	if ( glList.getNoResult() ) {
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

  <h3 align="center">Consulta de Transacciones de Cuentas Reconciliables<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="st_list_fp.jsp,EGL0810"> 
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
              <input type="text" name="E02GLMBRN" size="4" readonly maxlength="3" value="<%= userPO.getBranch().trim()%>" >
              <input type="text" name="E02GLMCCY" size="4" readonly maxlength="3" value="<%= userPO.getCurrency().trim()%>" >
              <input type="text" name="E02GLMGLN" size="20" readonly maxlength="16" value="<%= userPO.getAccNum().trim()%>" >
              <input type="text" name="E02GLMACC" size="20" readonly maxlength="16" value="<%= userPO.getIdentifier().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%" > 
              <div align="right">Descripci&oacute;n : </div>
            </td>
            <td nowrap width="70%" > 
              <div align="left"> 
                <input type="text" name="E02GLMDSC" size="40" readonly maxlength="35" value="<%= stGLBal.getE02GLMDSC().trim()%>" >
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4 align="left">Transacciones</h4>
  <TABLE id=cfTable class="tableinfo">
    <TR id=trdark> 
      <TH ALIGN=CENTER width="10%" nowrap>Fecha Proceso</TH>
	  <TH ALIGN=CENTER width="10%" nowrap>Fecha Valor</TH>
	  <TH ALIGN=CENTER width="10%" nowrap>Lote</TH>
      <TH ALIGN=CENTER width="10%" nowrap>TC</TH>
      <TH ALIGN=CENTER width="30%" nowrap>Descripci&oacute;n </TH>
      <TH ALIGN=CENTER width="15%" nowrap>D&eacute;bito</TH>
      <TH ALIGN=CENTER width="15%" nowrap>Cr&eacute;dito</TH>
      <TH ALIGN=CENTER width="15%" nowrap>Balance</TH>
    </TR>
    <%
                glList.initRow();
                while (glList.getNextRow()) {
					EGL081001Message msgList = (EGL081001Message)glList.getRecord();
					if (msgList.getE01TRADCC().equals("0")) {
						glHeader.setDebits(glHeader.getDebits().add(msgList.getBigDecimalE01TRAAMT()));
					} else if (msgList.getE01TRADCC().equals("5")) {
						glHeader.setCredits(glHeader.getCredits().add(msgList.getBigDecimalE01TRAAMT()));
					}
					glHeader.setCalculatedBalance(glHeader.getStartingBalance().add(glHeader.getSumTotal()));
	%> 
	<TR>
		<TD NOWRAP ALIGN="center"><%= Util.formatDate(msgList.getE01DATE11(), msgList.getE01DATE12(), msgList.getE01DATE13())%></TD>
		<TD NOWRAP ALIGN="center"><%= Util.formatDate(msgList.getE01DATE21(), msgList.getE01DATE22(), msgList.getE01DATE23())%></TD>
		<TD NOWRAP ALIGN="center"><%= Util.formatCell(msgList.getE01TRABTH()) %></TD>
		<TD NOWRAP ALIGN="center"><%= Util.formatCell(msgList.getE01TRACDE()) %></TD>
		<TD NOWRAP ALIGN="left"><%= Util.formatCell(msgList.getE01TRANAR()) %></TD>
		<TD NOWRAP ALIGN="right""><%= msgList.getE01TRADCC().equals("0") ? Util.fcolorCCY(msgList.getE01TRAAMT()) : "&nbsp;" %></TD>
		<TD NOWRAP ALIGN="right"><%= msgList.getE01TRADCC().equals("5") ? Util.fcolorCCY(msgList.getE01TRAAMT()) : "&nbsp;" %></TD>
		<TD NOWRAP ALIGN="right""><%= Util.fcolorCCY(glHeader.getCalculatedBalance().toPlainString()) %></TD>
	</TR>
			<%
				}
            %>
  </TABLE>
    
  <BR>
  
  <TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>
  <%
        if ( glList.getShowPrev() ) {
      			int pos = glList.getFirstRec() - 51;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSEGL0810?SCREEN=0&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
        }
 %> 
   </TD>
 	<TD WIDTH="50%" ALIGN=RIGHT>
 <%      
        if ( glList.getShowNext() ) {
      			int pos = glList.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSEGL0810?SCREEN=1&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
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
