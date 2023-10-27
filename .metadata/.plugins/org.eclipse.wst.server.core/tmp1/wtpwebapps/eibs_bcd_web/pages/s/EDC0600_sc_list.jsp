<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Tablas de Comisiones y Gastos de Cobranzas</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "ccList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

function closeEnter(){
      enterACC.style.visibility="hidden";
}

function ShowEnterCod() {	 
	 var y=event.clientY + document.body.scrollTop;
     var x=event.clientX + document.body.scrollLeft;
	 cancelBub();
	 eval('enterACC.style.pixelTop=' + y);
     eval('enterACC.style.pixelLeft=' + x);
     enterACC.style.visibility="visible";
}

function goAction(op) {
    getElement("opt").value = op;
    document.forms[0].submit();
}

function goDelete() {
	var ok = true;
	ok = confirm("Esta usted seguro de querer borrarla?");
	if (ok) {
	    getElement("SCREEN").value = "9";
	    document.forms[0].submit();
    }
}

function setInfo(bnk, stn, aty) {
    getElement("STN").value = stn;
    getElement("BNK").value = bnk;
    getElement("ATY").value = aty;
}

function cancelBub(){
  event.cancelBubble = true;
}

addEventHandler(document, 'click', closeEnter);

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

<h3 align="center">Tabla de Comisiones y Gastos de Cobranzas<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="sc_list.jsp, EDC0600"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDC0600">

  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="3">
  <INPUT TYPE=HIDDEN NAME="opt" id="opt" VALUE="">
  <INPUT TYPE=HIDDEN NAME="BNK" id="BNK" VALUE="">
  <INPUT TYPE=HIDDEN NAME="STN" id="STN" VALUE="">
  <INPUT TYPE=HIDDEN NAME="ATY" id="ATY" VALUE="">
  <INPUT TYPE=HIDDEN NAME="actRow" id="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="E01RCOBNK" id="E01RCOBNK" VALUE="<%=request.getParameter("E01RCOBNK")%>">
  <INPUT TYPE=HIDDEN NAME="E01RCOATY" id="E01RCOATY" VALUE="<%=request.getParameter("E01RCOATY")%>">  
  <INPUT TYPE=HIDDEN NAME="totalRow"id="totalRow"  VALUE="0">
  
  <div id="enterACC" style="position:absolute; visibility:hidden; left:25px; top:-50px; z-index:3; filter:progid:DXImageTransform.Microsoft.Fade(duration=1.0,overlap=1.0)" onClick="cancelBub()"> 
    <table id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
      <tr id="trdark"> 
        <td align=CENTER width="18%"> 
          <div align="right">Banco :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" name="NEWBNK" size="3" maxlength="2" value="<%=request.getParameter("E01RCOBNK")%>">
          </div>
        </td>
      </tr>
      <tr id="trclear"> 
        <td align=CENTER width="18%"> 
          <div align="right">Número de Tabla :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" name="NEWSTN" size="3" maxlength="2" onkeypress="enterInteger(event)">
          </div>
        </td>
      </tr>
      <tr id="trdark"> 
        <td align=CENTER width="18%"> 
          <div align="right">Tipo de Producto :</div>
        </td>
        <td nowrap  > 
			<input type="text" name="NEWATY"  size=5 maxlength="8" value="<%=request.getParameter("E01RCOATY")%>">
        	<a href="javascript:GetProductRates('NEWATY','DC')"> 
        	<img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a> 
	    </td>
      </tr>
      
      <tr id="trclear"> 
        <td align=center nowrap colspan="2"> 
          <input id="EIBSBTN" type=button name="Submit" value="Aceptar" onClick="javascript:goAction('N')">
        </td>
      </tr>
      
    </table>
  </div>
         
<%
	if ( ccList.getNoResult() ) {
%>
 	<TABLE class="tbenter" width=100% height=30%">
 		<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center"> <B>No hay	resultados para su b&uacute;squeda</B>.  <br>Oprima Nueva para Crearla</h4> 
      </div>
      </TD></TR>
   	</TABLE>
   	<TABLE class="tbenter">
    <TR>
      <TD ALIGN=CENTER class="TDBKG" width="50%" height="29">
      <DIV align="center" style="cursor: hand" onclick="ShowEnterCod()"><A>Crear</A>
			</DIV>
   		
      </TD>      
      <TD ALIGN=CENTER class="TDBKG" width="50%" height="29">
  		<div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </TD>
    </TR>
  </TABLE>
<%
	}
	else {
%>
  <CENTER>
<TABLE class="tbenter" width="585">
	<TBODY>
		<TR>
			<TD align="CENTER" class="TDBKG" width="20%">
			<DIV align="center" style="cursor: hand" onclick="ShowEnterCod()"><A>Crear</A>
			</DIV>
			</TD>
			<TD align="CENTER" class="TDBKG" width="20%"><A
				href="javascript:goAction('M')">Modificar</A></TD>
			<TD align="CENTER" class="TDBKG" width="20%"><A
				href="javascript:goAction('I')">Consultar</A></TD>
			<TD align="CENTER" class="TDBKG" width="20%"><A
				href="javascript:goDelete()">Borrar</A></TD>
			<TD align="CENTER" class="TDBKG" width="20%"><A
				href="<%=request.getContextPath()%>/pages/background.jsp">Salir</A></TD>
		</TR>
	</TBODY>
</TABLE>
</CENTER>

  <TABLE  id="mainTable" class="tableinfo">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="98%">
			<tr id="trdark">
		      <TH ALIGN=CENTER  nowrap width="5%"></TH> 
		      <TH ALIGN=CENTER  nowrap width="10%">Banco</TH>
		      <TH ALIGN=CENTER  nowrap width="20%">Tipo de<BR>Producto</TH>
		      <TH ALIGN=CENTER  nowrap width="10%">Número<br>de Tabla</TH>
		      <TH ALIGN=CENTER  nowrap width="15%">Moneda<br>de Tarifa</TH>
		      <TH ALIGN=CENTER  nowrap width="15%">Moneda<br>de Cuenta</TH>      
		      <TH ALIGN=CENTER  nowrap width="25%">Descripción</TH>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:400px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
    <%
          boolean firstTime = true;  
          String chk = "";  
          ccList.initRow(); 
          int k=1;              
          while (ccList.getNextRow()) {
               if (firstTime) {
	               	chk = "checked";
	               	firstTime = false;
               } else {
               		chk = "";
                }	 
			EDC060001Message msgList = (EDC060001Message) ccList.getRecord();	
       %>             
		<tr id="dataTable<%= ccList.getCurrentRow() %>">
			<td nowrap align="center" width="5%"><input type="radio" id="ROW1" name="ROW1" value="<%=ccList.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= ccList.getCurrentRow() %>); setInfo('<%= msgList.getE01RCOBNK()%>', '<%= msgList.getE01RCOTBL() %>', '<%= msgList.getE01RCOATY() %>')"/></td>
          <td NOWRAP align=center width="10%">
          	<%=Util.formatCell(msgList.getE01RCOBNK())%>
		  </td>		  
		  <td NOWRAP align=center width="20%">
			<%=Util.formatCell(msgList.getE01RCOATY())%>
		  </td>		  
		  <td NOWRAP align="center" width="10%">
			<%=Util.formatCell(msgList.getE01RCOTBL())%>
		  </td>		  
		  <td NOWRAP align="center" width="15%">
          	<%=Util.formatCell(msgList.getE01RCOTCY())%>
		  </td>
		  <td NOWRAP align="center" width="15%">
          	<%=Util.formatCell(msgList.getE01RCOACY())%>
		  </td>
		  <td NOWRAP align="left" width="25%">
          	<%=Util.formatCell(msgList.getE01RCODSC())%>
		  </td>
		</TR>
		
        <% 
        	k++;
         }
         %> 
             </table>
             </div>
             </td>
             </tr>
</table>

  <SCRIPT type="text/javascript">     
  	getElement("totalRow").value="<%= k %>";
	 showChecked("ROW1");          
  </SCRIPT> 
<%      
  }
%> 
</form>
</body>
</html>
