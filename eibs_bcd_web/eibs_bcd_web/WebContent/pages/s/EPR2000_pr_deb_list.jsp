<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Consulta Cta. Credito</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "prList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

	function setInfo(idx) {
		var table = document.getElementById("dataTable");  
  		for ( var i=2; i < table.rows.length; i++ ) {
       		table.rows[i].className = "trnormal";
    	}
   		table.rows[idx].className = "trhighlight";
   		document.forms[0].actRow.value = idx;    
	}

	function goAction(opt, idx){
		var url = "<%=request.getContextPath()%>/servlet/datapro.eibs.transfer.JSEPR2000?SCREEN=400&opt=" + opt;
    	CenterWindow(url + "&ROW=" + idx, 800, 600, 2);
	}
</SCRIPT>
</head>

<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
	 error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }

%>

<h3 align="center">Consulta de Cuentas Crédito
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="pr_deb_list.jsp, EPR2000"></h3>
<hr size="4">

<form >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="400">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right"><b>Cuenta Crédito : </b></div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E01PRPCAC" size="17" maxlength="9" value="<%= userPO.getAccNum()%>" readonly>
              </div>
            </td>
            
          </tr>
        </table>
      </td>
    </tr>
  </table>
      
<%
	if ( prList.getNoResult() ) {
%>
 	<TABLE class="tbenter" width="100%" height="30%">
 		<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center"> La cuenta seleccionada no posee cuentas de debito apuntandola.</h4>
      </div>
      </TD></TR>
   	</TABLE>
   	
<%
	}
	else {
%>
  
  <BR>
  <TABLE class="tableinfo" id="dataTable">
    <TR id="trdark">
      <TH ALIGN=CENTER  nowrap width="1%" rowspan=2></TH> 
      <TH ALIGN=CENTER  nowrap rowspan=2>No. Ref.</TH>
      <TH ALIGN=CENTER  nowrap rowspan=2>Cta. Debito</TH>
      <TH ALIGN=CENTER  nowrap rowspan=2>Monto</TH>
      <TH ALIGN=CENTER  nowrap rowspan=2>MDA</TH>
      <TH ALIGN=CENTER  nowrap rowspan=2>Frecuencia</TH>
      <TH ALIGN=CENTER  nowrap colspan=2>Ultimo Pago.</TH>
    </TR>
    <TR id="trdark">
      <TH ALIGN=CENTER  nowrap >Fecha</TH>
      <TH ALIGN=CENTER  nowrap >Monto</TH>
    </TR>
    <%
                
          prList.initRow();               
          while (prList.getNextRow()) {
               EPR200002Message msgList = (EPR200002Message) prList.getRecord();			 
                    
       %>             
                    
          <TR>
          <td align="center" nowrap > 
        	<input type="radio" name="ROW" value="<%= prList.getCurrentRow() %>" onClick="setInfo(<%= prList.getCurrentRow() + 2 %>)">
      	  </td>
          <td NOWRAP align=center>
          	<A HREF="javascript:goAction('I', '<%=prList.getCurrentRow()%>')"><%=Util.formatCell(msgList.getE02PRPNUM())%></A>
		  </td>
		  <td NOWRAP >
			<A HREF="javascript:goAction('I', '<%=prList.getCurrentRow()%>')"><%=Util.formatCell(msgList.getE02PRPDAC())%></A>
		  </td>		  
		  <td NOWRAP >
          	<A HREF="javascript:goAction('I', '<%=prList.getCurrentRow()%>')"><%=Util.fcolorCCY(msgList.getE02PRPAMT())%></A>
		  </td>
		  <td NOWRAP >
			<A HREF="javascript:goAction('I', '<%=prList.getCurrentRow()%>')"><%=Util.formatCell(msgList.getE02PRPTCY())%></A>
		  </td>
		  <td NOWRAP ><A HREF="javascript:goAction('I', '<%=prList.getCurrentRow()%>')">
			<% if(msgList.getE02PRPFRQ().equals("D")) out.print("Diario");
                else if(msgList.getE02PRPFRQ().equals("W")) out.print("Semanal");
                else if(msgList.getE02PRPFRQ().equals("M")) out.print("Mensual");
                else if(msgList.getE02PRPFRQ().equals("V")) out.print("Variable");
                else if(msgList.getE02PRPFRQ().equals("2")) out.print("Cada 2 Meses");
                else if(msgList.getE02PRPFRQ().equals("3")) out.print("Cada 3 Meses");%></A>
		  </td>	
		  <td NOWRAP >
          	<A HREF="javascript:goAction('I', '<%=prList.getCurrentRow()%>')">
          		<%=Util.formatDate(msgList.getE02PRPLPD(),msgList.getE02PRPLPM(),msgList.getE02PRPLPY())%>
          	</A>
		  </td>
		  <td NOWRAP align=right>
          	<A HREF="javascript:goAction('I', '<%=prList.getCurrentRow()%>')"><%=Util.fcolorCCY(msgList.getE02PRPLPA())%></A>
		  </td>
		</TR>
        <%        }
              %> 
  </TABLE>
  <SCRIPT type="text/javascript">     
	 radioClick("ROW", 0);          
  </SCRIPT> 
<%      
  }
%> 
</form>
</body>
</html>
