<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>

<html>
<head>
<title>Services Charges List</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "ccList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

function closeEnter(){
      getElement("enterACC").style.visibility="hidden";
}

function ShowEnterCod() {	 
	 var y=event.clientY + document.body.scrollTop;
     var x=event.clientX + document.body.scrollLeft;
	 cancelBub();
	 getElement("enterACC").style.pixelTop=y;
     getElement("enterACC").style.pixelLeft=x;
     getElement("enterACC").style.visibility="visible";	 
}

function goAction(op) {
    document.getElementById("opt").value = op;
    document.forms[0].submit();
}

function goDelete() {
	var ok = true;
	ok = confirm("Esta usted seguro de querer borrarla?");
	if (ok) {
	    document.getElementById("SCREEN").value = "9";
	    document.forms[0].submit();
    }
}

function setInfo(bnk, stn, aty) {
    document.getElementById("STN").value = stn;
    document.getElementById("BNK").value = bnk;
    document.getElementById("ATY").value = aty;
}

function cancelBub(){
  event.cancelBubble = true;
}

document.onclick= closeEnter;

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
<h3 align="center">Tabla de Comisiones y Gastos de Cartas de Créditos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="sc_list.jsp, ELC0600"></h3>

<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0600">

  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="3">
  <INPUT TYPE=HIDDEN NAME="opt" id="opt" VALUE="">
  <INPUT TYPE=HIDDEN NAME="BNK" id="BNK" VALUE="">
  <INPUT TYPE=HIDDEN NAME="STN" id="STN" VALUE="">
  <INPUT TYPE=HIDDEN NAME="ATY" id="ATY" VALUE="">
  <INPUT TYPE=HIDDEN NAME="actRow" id="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="E01RLCBNK" id="E01RLCBNK" VALUE="<%=request.getParameter("E01RLCBNK")%>">
  <INPUT TYPE=HIDDEN NAME="E01RLCATY" id="E01RLCATY" VALUE="<%=request.getParameter("E01RLCATY")%>">  
  <INPUT TYPE=HIDDEN NAME="totalRow" id="totalRow" VALUE="0">
  <div id="enterACC" style="position:absolute; visibility:hidden; left:25px; top:-50px; z-index:3; filter:progid:DXImageTransform.Microsoft.Fade(duration=1.0,overlap=1.0)" onClick="cancelBub()"> 
    <table id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
      <tr id="trdark"> 
        <td align=CENTER width="18%"> 
          <div align="right"><b>Banco :</b></div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" name="NEWBNK" id="NEWBNK" size="3" maxlength="2" value="<%=request.getParameter("E01RLCBNK")%>">
          </div>
        </td>
      </tr>
     
      <tr id="trclear"> 
        <td nowrap  > 
	              <div align="right"><b>Tipo de Producto :</b> </div>
	            </td>
	            <td nowrap  > 
		             	<input type="text" name="NEWATY" id="NEWATY"  size=5 maxlength="4" value="<%=request.getParameter("E01RLCATY")%>" readonly>
	            </td>
      </tr>
      <tr id="trdark"> 
        <td align=CENTER width="18%"> 
          <div align="right"><b>Número de Tabla :</b></div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" name="NEWSTN" id="NEWSTN" size="3" maxlength="2" onkeypress="enterInteger(event)">
          </div>
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
      <div align="center"> <h4 style="text-align:center"><B>No hay resultados para su b&uacute;squeda</B>. <br>Oprima Nueva para Crearla</h4> 
      </div>
      </TD></TR>
   	</TABLE>
   	<TABLE class="tbenter">
    <TR>
      <TD ALIGN=CENTER class="TDBKG" width="50%">
   		<a href="javascript:goAction('N')"><b>Nueva</b></a>
   		</TD>      
      <TD ALIGN=CENTER class="TDBKG" width="50%">
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
			<TD align="CENTER" class="TDBKG" width="25%">
			<DIV align="center" style="cursor: hand" onclick="ShowEnterCod()"><A>Nueva</A>
			</DIV>
			</TD>
			<TD align="CENTER" class="TDBKG" width="27%"><A
				href="javascript:goAction('M')">Modificar</A></TD>
			<TD align="CENTER" class="TDBKG" width="24%"><A
				href="javascript:goDelete()">Borrar</A></TD>
			<TD align="CENTER" class="TDBKG" width="24%"><A
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
		      <TH ALIGN=CENTER  nowrap width="10%">Número de <br>Tabla</TH>
		      <TH ALIGN=CENTER  nowrap width="15%">Moneda de <br>Tarifa</TH>
		      <TH ALIGN=CENTER  nowrap width="15%">Moneda de<br> Cuenta</TH>      
		      <TH ALIGN=CENTER  nowrap width="45%">Descripción</TH>
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
               ELC060001Message msgList = (ELC060001Message) ccList.getRecord();		
               if (firstTime) {
	               	chk = "checked";
	               	firstTime = false;
               } else {
               		chk = "";
                }	 
       %>             
		<tr id="dataTable<%= ccList.getCurrentRow() %>">
			<td nowrap align="center" width="5%"><input type="radio" id="ROW1" name="ROW1" value="<%=ccList.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= ccList.getCurrentRow() %>)" onClick="setInfo('<%= msgList.getE01RLCBNK()%>', '<%= msgList.getE01RLCTAR() %>', '<%= msgList.getE01RLCATY() %>')" /></td>
          <td NOWRAP align="center" width="10%">
          	<%=Util.formatCell(msgList.getE01RLCBNK())%>
		  </td>		  
		  <td NOWRAP align="center" width="10%">
			<%=Util.formatCell(msgList.getE01RLCTAR())%>
		  </td>		  
		  <td NOWRAP align="center" width="15%">
          	<%=Util.formatCell(msgList.getE01RLCTCY())%>
		  </td>
		  <td NOWRAP align="center" width="15%">
          	<%=Util.formatCell(msgList.getE01RLCACY())%>
		  </td>
		  <td NOWRAP align="left" width="45%">
          	<%=Util.formatCell(msgList.getE01RLCDSC())%>
		  </td>
		</TR>
		
        <% k++; } %>
         
             </table>
             </div>
             </td>
             </tr>
</table>
  
  <SCRIPT type="text/javascript">     
  	document.getElementById("totalRow").value="<%= k %>";
	 showChecked("ROW1");     
  </SCRIPT> 
<% } %> 
</form>
</body>
</html>
