<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import = "datapro.eibs.beans.EGL042101Message" %>
<%@page import="com.datapro.constants.EibsFields"%>

<%@page import="java.math.BigDecimal"%><HTML>
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
<jsp:useBean id= "bthList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "dataBTH" class= "datapro.eibs.beans.DataNavTotals"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<BODY>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/Ajax.js"></script>

<SCRIPT Language="Javascript">

function PrintPreview() {

  <% 
  int iniPos = bthList.getFirstRec() - 1;
  out.println("var pos = " + iniPos + ";");
  %>
	// var pg = '<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSEGL0421?SCREEN=3&Pos=' + pos;
	// CenterWindow(pg,720,500,2);
	window.print();
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
	if ( bthList.getNoResult() ) {
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
      String ref="";
      String date1="";
	  String date2="";
	  String date3="";
	  String batch="";
      String param="";
      String mtv="";
      String dscmtv="";
      try {
		  ref= request.getParameter("Ref").trim();
		  date1= request.getParameter("Date1").trim();
		  date2= request.getParameter("Date2").trim();
		  date3= request.getParameter("Date3").trim();
		  batch= request.getParameter("Batch").trim();
		  EGL042101Message msgList = (EGL042101Message) bthList.getRecord();
		  mtv=  msgList.getE01TRANID();
		  dscmtv= msgList.getE01CNONID();
		}
      catch(Exception e){
      }
%>
  <h4>Detalle Comprobante Contable</h4>
  <input type="hidden" name="ACR" size="12" maxlength="12" value="<%= ref %>" readonly>
  <table class="tableinfo">
    <tr > 
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap width="16%" > 
              <div align="right"><b>Numero Lote : </b></div>
            </td>
            <td nowrap align="left" width="20%" > 
              <input type="text" name="BTH" size="6" maxlength="5" value="<%= batch%>" readonly>
            </td>
            <td nowrap width="16%"> 
              <div align="right">Fecha Proceso : </div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
               <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(date1),Integer.parseInt(date2),Integer.parseInt(date3))%>       	                          
   			               </div>
            </td>
            <td nowrap width="18%" > 
              <div align="right"><b>Referencia : </b></div>
            </td>
            <td nowrap align="left" width="18%" > 
              <input type="text" name="REF" size="13" maxlength="12" value="<%= ref%>" readonly>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="16%" > 
              <div align="right"><b>Tipo de Pago : </b></div>
            </td>
            <td nowrap align="left" width="20%" > 
              <input type="text" name="MTV" size="6" maxlength="5" value="<%= mtv%>" readonly>
              <input type="text" name="DSCMTV" size="45" maxlength="45" value="<%= dscmtv%>" readonly>
            </td>
            <td nowrap width="16%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
              </div>
            </td>
            <td nowrap width="18%" > 
              <div align="right"><b></b></div>
            </td>
            <td nowrap align="left" width="18%" > 
              
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <TABLE class="tableinfo" style="max-height:300px; overflow: auto;" >
    <TR id=trdark style="width: 100%"> 
      <TH ALIGN=CENTER nowrap width="4%">Bco</TH>
      <TH ALIGN=CENTER nowrap width="4%">Suc.</TH>
      <TH ALIGN=CENTER nowrap width="4%">Mda</TH>
      <TH ALIGN=CENTER nowrap width="15%">Contabilidad </TH>
      <TH ALIGN=CENTER nowrap width="10%">Referencia</TH>
      <TH ALIGN=CENTER nowrap width="5%">Centro<BR>Costos</TH>
	  <TH ALIGN=CENTER nowrap width="5%">CT</TH>
	  <TH ALIGN=CENTER nowrap width="25%">Narrativa</TH>
      <TH ALIGN=CENTER nowrap width="10%"> <div align="center" >D&eacute;bito</div> </TH>
      <TH ALIGN=CENTER nowrap width="10%"> <div align="center" >Cr&eacute;dito</div> </TH>
      <TH ALIGN=CENTER nowrap width="8%">  <div align="center" >Fecha<br>Valor</div> </TH>
   </TR>
		  <tr  height="95%">    
		    <td nowrap="nowrap" colspan="12">      
		       <div id="dataDiv1" style="max-height:300px; overflow:auto; width: 100%"> 
		       <table id="dataTable" class="tableinfolist" style="border: 0" cellspacing="0" cellpadding="1" border="0" width="100%">         
    <%
				BigDecimal debit = new BigDecimal("0");
				BigDecimal credit = new BigDecimal("0");
				String strDebit = "";
				String strCredit = "";

                bthList.initRow();
                while (bthList.getNextRow()) {
             	   EGL042101Message msgList = (EGL042101Message) bthList.getRecord();
				   strDebit = "&nbsp;";
				   strCredit = "&nbsp;";
					if ("0".equals(msgList.getE01TRADCC())) {
						debit = debit.add(msgList.getBigDecimalE01TRAAMT());
						strDebit = Util.fcolorCCY(msgList.getE01TRAAMT());
						strCredit = "&nbsp;";
					} else if ("5".equals(msgList.getE01TRADCC())) {
						credit = credit.add(msgList.getBigDecimalE01TRAAMT());
						strDebit = "&nbsp;";
						strCredit = Util.fcolorCCY(msgList.getE01TRAAMT());
					}  
    %> 
    	<tr>
    		<TD NOWRAP ALIGN="center" width="4%"><%=Util.formatCell(msgList.getE01TRAOBK())%></TD>
			<TD NOWRAP ALIGN="center" width="4%"><%= Util.formatCell(msgList.getE01TRABRN()) %></TD>
			<TD NOWRAP ALIGN="center" width="4%"><%= Util.formatCell(msgList.getE01TRACCY()) %></TD>						
			<TD NOWRAP ALIGN="center" width="15%"><%= Util.formatCell(msgList.getE01TRAGLN()) %></TD> 
			<TD NOWRAP ALIGN="center" width="10%"><%= Util.formatCell(msgList.getE01TRAACC()) %></TD> 
			<TD NOWRAP ALIGN="center" width="5%"><%= Util.formatCell(msgList.getE01TRACCN()) %></TD> 	
			<TD NOWRAP ALIGN="center" width="5%"><%= Util.formatCell(msgList.getE01TRACDE()) %></TD> 
			<TD NOWRAP ALIGN="LEFT" width="25%"><%= Util.formatCell(msgList.getE01TRANAR()) %></TD> 
			<TD NOWRAP ALIGN=RIGHT width="10%"><%= strDebit %></TD> 
			<TD NOWRAP ALIGN=RIGHT width="10%"><%= strCredit %></TD> 
			<TD NOWRAP ALIGN=RIGHT width="8%"><%= Util.formatCustomDate(currUser.getE01DTF(),
																			msgList.getE01TRAVDM(),
																			msgList.getE01TRAVDD(),
																			msgList.getE01TRAVDY())  %></TD> 
    	</tr>
	<%}%>    	
		</table>
		</div>
	  </td>
	</tr>		
  </TABLE>
  <BR>
  <%      
        if (!bthList.getShowNext() ) {
				if (bthList.size() > 0) {
					if (dataBTH.getMaxRow() == 0) {
						dataBTH.addRow(debit.toString(), credit.toString(), "" + bthList.size());
				    } else if (request.getParameter("FlagMov").equals("1")) {
				 	    dataBTH.setIndex(dataBTH.getIndex() + 1); 
				 	    if (dataBTH.getIndex() >= dataBTH.getMaxRow()) { 
				 	    	dataBTH.addRow(debit.toString(), credit.toString(), "" + bthList.size());
				 	    }	
				    }
			    }   
		userPO.setHeader19(Util.fcolorCCY(debit.toString()));
		userPO.setHeader20(Util.fcolorCCY(credit.toString()));
  %>
  <TABLE class="tableinfo" WIDTH="98%" ALIGN=CENTER>
  	<TR id="trdark">
   		<TD WIDTH="33%" ALIGN=LEFT><b>Total Transacciones : </b><%= dataBTH.getTotalTrans()%></TD>
		<TD WIDTH="34%" ALIGN=CENTER><b>Total Débitos : </b><%= Util.fcolorCCY(dataBTH.getTotalDebit())%></TD>
		<TD WIDTH="33%" ALIGN=RIGHT><b>Total Créditos : </b><%= Util.fcolorCCY(dataBTH.getTotalCredit())%></TD>
  	</TR>
  </TABLE>
  <BR>
  <%} %>
  <TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="45%" ALIGN=LEFT>
  <%
        if ( bthList.getShowPrev() ) {
      			int pos = bthList.getFirstRec() - 51;
				param="?SCREEN=1&Pos=" + pos +"&BTH="+batch+"&DT1="+date1+"&DT2="+date2+"&DT3="+date3+"&ACR="+ref+"&FlagMov=0";
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSEGL0421" + param +"\"><img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0 onclick=pagination();></A>");
        }
 %> 
   </TD>
	<%if (bthList.getShowPrev()||bthList.getShowNext()){%>
	  <td width="5%">
	   	<div id="userWait" style="background-color: white;"></div>
	  </td>	
	<%}%>
 	<TD WIDTH="45%" ALIGN=RIGHT>
 <%      
        if ( bthList.getShowNext() ) {
      			int pos = bthList.getLastRec();
				param="?SCREEN=1&Pos=" + pos +"&BTH="+batch+"&DT1="+date1+"&DT2="+date2+"&DT3="+date3+"&ACR="+ref+"&FlagMov=1";
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSEGL0421" + param +"\"><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0 onclick=pagination();></A>");
        }
%>
  	</TD>
 	</TR>
 	</TABLE>

  		<div align="center"> 
    		<input id="EIBSBTN" type=button name="Submit" OnClick="PrintPreview()" value="Imprimir">
  		</div>

  <%
  }
%> 
</FORM>
<script type="text/javascript">
<% if ( bthList.getShowPrev() || bthList.getShowNext() ){%>
function pagination() {
  	callWaiting("userWait", "<%=request.getContextPath()%>/images/throbber.gif", "Esperando");
}
<%}%>
</script>
</BODY>
</HTML>
