<html>
<head>
<title></title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import ="datapro.eibs.master.Util" %>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "msgPart" 	class= "datapro.eibs.beans.ESB011001Message"  	scope="session" />
<jsp:useBean id= "error" 	class= "datapro.eibs.beans.ELEERRMessage"  		scope="session" />
<jsp:useBean id= "userPO" 	class= "datapro.eibs.beans.UserPos"  			scope="session"/>

<SCRIPT type="text/javascript">
	function enable_disable_refNumber(op){
        if (op == 1){   
        	GetDepositNumber('S01SBLDEP','','','D01CUSNA1')
        } else if (op == 2){
        	document.forms[0].S01SBLDEP.value = "";        
        	GetCustomerDescId('S01SBLCUN','D01CUSNA1','')
        }
    }
                
</SCRIPT>
</head>

<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%>
<H3 align="center">B�squeda Consulta de Logs - Caja de Seguridad<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="safe_deposit_visit_search, ESB0020"></H3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.safedeposit.JSESB0020">
 
  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="11">
  
  <%int row = 0; %>
  <table class="tableinfo">
   <tr> 
   <td>
    <table cellspacing=0 cellpadding=2 width="100%" border="0">    
     	
     	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="17%" >
              <div align="right">  Fecha Desde :</div>
            </td>
              <td nowrap > 
                <div align="left"> 
                  <input type="text" name="S01FRDT1" id="S01FRDT1" size="2" maxlength="2" onkeypress="enterInteger(event)">
                  <input type="text" name="S01FRDT2" id="S01FRDT2" size="2" maxlength="2" onkeypress="enterInteger(event)">
                  <input type="text" name="S01FRDT3" id="S01FRDT3" size="5" maxlength="4" onkeypress="enterInteger(event)">
                  <a href="javascript:DatePicker(document.getElementById('S01FRDT1'),document.getElementById('S01FRDT2'),document.getElementById('S01FRDT3'))"><img src="<%=request.getContextPath()%>/images/calendar.gif" title="help" align="middle" border="0"></a> 
                </div>
              </td>
            <td nowrap width="17%" >
				<div align="right">Hasta :</div>
				</td>
              <td nowrap > 
                <div align="left"> 
                  <input type="text" name="S01TODT1" id="S01TODT1" size="2" maxlength="2" onkeypress="enterInteger(event)">
                  <input type="text" name="S01TODT2" id="S01TODT2" size="2" maxlength="2" onkeypress="enterInteger(event)">
                  <input type="text" name="S01TODT3" id="S01TODT3" size="5" maxlength="4" onkeypress="enterInteger(event)">
                  <a href="javascript:DatePicker(document.getElementById('S01TODT1'),document.getElementById('S01TODT2'),document.getElementById('S01TODT3'))">
                  <img src="<%=request.getContextPath()%>/images/calendar.gif" title="help" align="middle" border="0"></a> 
                </div>
              </td>
			</TR>
     	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
	      <td nowrap> 
	        <div align="right">Caja de Seguridad : </div>
	      </td>
				<td nowrap colspan="3">
					<div align="left">
					<input type="text" name="S01SBLDEP" id="S01SBLDEP" size="16"
					maxlength="14"> <a
					href="javascript:enable_disable_refNumber(1)">
					<img src="<%=request.getContextPath()%>/images/1b.gif" title="Help"
					align="bottom" border="0"></a>
					</div>
				</td>
			</tr>
     	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
	      <td nowrap> 
	        <div align="right">Cliente : </div>
	      </td>
				<td nowrap colspan="3">
				<div align="left">
					<input type="hidden" name="S01SBLCUN" id="S01SBLCUN" size="10"	maxlength="10">
					<input type="text" name="D01CUSNA1" id="D01CUSNA1" size="47" maxlength="45" readonly>
					<a href="javascript:enable_disable_refNumber(2)">
					<img src="<%=request.getContextPath()%>/images/1b.gif" title="Help"
					align="bottom" border="0"></a></div>
				</td>
			</TR>
			</table>
    </td>
   </tr>
  </table>
  <br>
  
  <p align="center"> 
    <input id="EIBSBTN" type="submit" name="Submit" value="Buscar">
  </p>
</form>
</body>
</html>
