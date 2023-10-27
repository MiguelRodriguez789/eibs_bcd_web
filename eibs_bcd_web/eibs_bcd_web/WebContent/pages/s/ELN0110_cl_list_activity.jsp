<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<HTML>
<HEAD>
<TITLE>Lista de Clientes</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "clList" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "header" class= "datapro.eibs.beans.ELN011002Message"  scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
</HEAD>

<BODY>
<%@ page import = "datapro.eibs.master.Util" %>

<h3 align="center">Actividad de Lineas de Cr&eacute;dito<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cl_list_activity.jsp,ELN0110"></h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.credit.JSELN0110" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="8">

<%
	if ( clList.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
        <div align="center">
        		<font size="3"><b>
        				No hay resultados que correspondan a su criterio de búsqueda 
        		</b></font>
        	</div>
      </TD></TR>
   		</TABLE>
  <%   		
	}
	else {
%> 
  <table class="tableinfo">
    <tr id="trdark"> 
      <td align=RIGHT width="21%"> Cliente : </td>
      <td align=LEFT width="7%" > 
        <div align="left"><%= Util.formatCell(header.getE02LNECUN()) %> </div>
      </td>
      <td align=LEFT width="8%" > 
        <div align="right">Linea :</div>
      </td>
      <td align=LEFT width="7%" > 
        <div align="left"><%= Util.formatCell(header.getE02LNENUM()) %></div>
      </td>
      <td align=LEFT width="16%" > 
        <div align="right">Nombre : </div>
      </td>
      <td align=LEFT colspan="2" > 
        <div align="left"><%= Util.formatCell(header.getE02CUSNA1()) %></div>
      </td>
    </tr>
    <tr id="trdark"> 
      <td align=RIGHT width=21%> 
        <div align="right"> Vencimiento : </div>
      </td>
      <td align=LEFT colspan="4"> 
        <div align="left"><%= Util.formatCustomDate(currUser.getE01DTF(),
        		header.getBigDecimalE02LNEMTM().intValue(),
        		header.getBigDecimalE02LNEMTD().intValue(),
        		header.getBigDecimalE02LNEMTY().intValue()) %></div>
        <div align="right"> </div>
      </td>
      <td align=LEFT width="23%"> 
        <div align="right">Importe Original :</div>
      </td>
      <td align=LEFT width=18%> 
        <div align="right"><%= Util.fcolorCCY(header.getE02LNEAMN()) %></div>
      </td>
    </tr>
    <tr id="trdark"> 
      <td align=RIGHT width=21%> 
        <div align="right"> Moneda : </div>
      </td >
      <td align=LEFT colspan="4"> 
        <div align="left"><%= Util.formatCell(header.getE02LNECCY()) %></div>
        <div align="right"> </div>
      </td>
      <td align=LEFT width="23%"> 
        <div align="right">Reasignaci&oacute;n :</div>
      </td>
      <td align=LEFT width=18%> 
        <div align="right"><%= Util.fcolorCCY(header.getE02LNEREA()) %></div>
      </td>
    </tr>
    <tr id="trdark"> 
      <td align=RIGHT width=21%> 
        <div align="right">Tipo de L&iacute;nea : </div>
      </td >
      <td align=LEFT colspan="4"> 
        <div align="left"><%= Util.formatCell(header.getE02LNETYL()) %></div>
        <div align="right"> </div>
      </td>
      <td align=LEFT width="23%"> 
        <div align="right">Importe Utilizado :</div>
      </td>
      <td align=LEFT width=18%> 
        <div align="right"><%= Util.fcolorCCY(header.getE02USEAMT()) %></div>
      </td>
    </tr>
    <tr id="trdark"> 
      <td align=RIGHT width=21%> 
        <div align="right">Categor&iacute;a : </div>
      </td>
      <td align=LEFT colspan="4"> 
        <div align="left"><%= Util.formatCell(header.getE02LNECAT()) %></div>
        <div align="right"> </div>
      </td>
      <td align=LEFT width="23%"> 
        <div align="right">Importe Disponible :</div>
      </td>
      <td align=LEFT width=18%> 
        <div align="right"><%= Util.fcolorCCY(header.getE02AVAILA()) %></div>
      </td>
    </tr>
    <tr id="trdark"> 
      <td align=RIGHT width=21% height="34"> 
        <div align="right"></div>
      </td>
      <td align=LEFT colspan="4" height="34"> 
        <div align="left"></div>
        <div align="right"> </div>
      </td>
      <td align=LEFT width="23%" height="34"> 
        <div align="right">Vencimiento del D&iacute;a :</div>
      </td>
      <td align=LEFT width=18% height="34"> 
        <div align="right"><%= Util.fcolorCCY(header.getE02LNETMA()) %></div>
      </td>
    </tr>
  </table>
  <h4></h4>
  
<TABLE class="tableinfo">
  <TR> 
    <TH ALIGN=CENTER>Número de <br> Contrato</TH>
    <TH ALIGN=CENTER>Fecha de<br>
      Apertura</TH>
    <TH ALIGN=CENTER>Fecha de<br>
      Vencimiento</TH>
    <TH ALIGN=CENTER>MDA</TH>
    <TH ALIGN=CENTER>Importe<br>Equivalente</TH>
    <TH ALIGN=CENTER>Tipo de <br>
      Cuenta</TH>
    <TH ALIGN=CENTER>Utilización <br>
      por Tipo</TH>
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
<BR>
  
  <TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>
  
      <%
        if ( clList.getShowPrev() ) {
      			int pos = clList.getFirstRec() - 51;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.credit.JSELN0110?SCREEN=7&Pos=" + pos + "\"><img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
        }
      %> 
      	</TD>
 			<TD WIDTH="50%" ALIGN=RIGHT>
 	    <% 
        if ( clList.getShowNext() ) {
      			int pos = clList.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.credit.JSELN0110?SCREEN=7&Pos=" + pos + "\"><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
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
