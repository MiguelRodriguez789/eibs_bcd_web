<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<TITLE>Services Charges List</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<LINK Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "jbList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

function closeEnter(){
      getElement("enterACC").style.visibility="hidden";
}

function ShowEnterCod() {	 
	 var y=event.clientY + document.body.scrollTop;
     var x=event.clientX + document.body.scrollLeft;
	 cancelBub();
	 getElement("enterACC").style.top = y;
     getElement("enterACC").style.left = x;
     getElement("enterACC").style.visibility="visible";
}

function goNew() {
	getElement("SCREEN").value = "202";
	document.forms[0].submit();
}
function goMaint() {
	getElement("SCREEN").value = "203";
	document.forms[0].submit();
}
function goInq() {
	getElement("SCREEN").value = "206";
	document.forms[0].submit();
}
function goDelete() {
	var ok = true;
	ok = confirm("Esta Usted seguro de querer borrarla?");
	if (ok) {
	    getElement("SCREEN").value = "204";
	    document.forms[0].submit();
    }
}

function setInfo(bnk,  cun,stn, aty) {
   getElement("STN").value = stn;
   getElement("BNK").value = bnk;
   getElement("CUN").value = cun;
   getElement("ATY").value = aty;
}

function cancelBub(){
  event.cancelBubble = true;
}

document.onclick= closeEnter;

</SCRIPT>
</HEAD>

<BODY>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
	 error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }

%>

<H3 align="center">Tablas de Comisiones y Gastos de Cartas de Credito<IMG src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="sc_cust_list.jsp, ELC0600"></H3>
<HR size="4">

<FORM method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0600">

  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="201">
  <INPUT TYPE=HIDDEN NAME="opt" id="opt" VALUE="">
  <INPUT TYPE=HIDDEN NAME="BNK" id="BNK" VALUE="">
  <INPUT TYPE=HIDDEN NAME="STN" id="STN" VALUE="">
  <INPUT TYPE=HIDDEN NAME="CUN" id="CUN" VALUE="">
  <INPUT TYPE=HIDDEN NAME="ATY" id="ATY" VALUE="">
  <INPUT TYPE=HIDDEN NAME="E01RLCBNK" id="E01RLCBNK" VALUE="<%=request.getParameter("E01RLCBNK")%>">
  <INPUT TYPE=HIDDEN NAME="E01RLCCUN" id="E01RLCCUN" VALUE="<%=request.getParameter("E01RLCCUN")%>">  
  <INPUT TYPE=HIDDEN NAME="actRow" id="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="totalRow" id="totalRow" VALUE="0">
  
  <DIV id="enterACC" style="position:absolute; visibility:hidden; left:25px; top:-50px; z-index:3; filter:progid:DXImageTransform.Microsoft.Fade(duration=1.0,overlap=1.0)" onClick="cancelBub()"> 
    <TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
      <TR id="trdark"> 
        <TD align=CENTER width="18%"> 
          <DIV align="right">Banco :</DIV>
        </TD>
        <TD align=CENTER width="34%"> 
          <DIV align="left"> 
            <INPUT type="text" name="NEWBNK" size="3" maxlength="2" onkeypress="enterInteger(event)" value="<%=request.getParameter("E01RLCBNK")%>">
          </DIV>
        </TD>
      </TR>
      <TR id="trclear"> 
        <TD nowrap  > 
	              <DIV align="right"><B>Número de Ciente :</B> </DIV>
	            </TD>
	            <TD nowrap  > 
	              	<INPUT type="text" name="NEWCUN" size="10" maxlength="9" value="<%=request.getParameter("E01RLCCUN")%>" readonly>
            		<%--A href="javascript:GetCustomerDescId('NEWCUN','','')">
            		<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0"></A--%> 
	            </TD>
      </TR>

      <TR id="trdark"> 
        <TD align=CENTER width="18%"> 
          <DIV align="right">Número de Tabla :</DIV>
        </TD>
        <TD align=CENTER width="34%"> 
          <DIV align="left"> 
            <INPUT type="text" name="NEWSTN" size="3" maxlength="2" onkeypress="enterInteger(event)">
          </DIV>
        </TD>
      </TR>
      
      <TR id="trclear"> 
        <TD align=center nowrap colspan="2"> 
          <INPUT id="EIBSBTN" type=button name="Submit" value="Aceptar" onClick="javascript:goNew()">
        </TD>
      </TR>
      
    </TABLE>
  </DIV>
         
<%
	if ( jbList.getNoResult() ) {
%>
 	<TABLE class="tbenter" width=100% height=30%">
 		<TR>
      <TD>         
      <DIV align="center"> <H4 style="text-align:center"><B>No hay resultados para su b&uacute;squeda</B>. <BR>Oprima Nueva para Crearla</H4> 
      </DIV>
      </TD></TR>
   	</TABLE>
   	<TABLE class="tbenter">
    <TR>
      <TD ALIGN=CENTER class="TDBKG" width="50%">

   		<DIV align="center" style="cursor:hand" onClick="ShowEnterCod()"><A><B>Nueva</B></A></DIV>
      </TD>      
      <TD ALIGN=CENTER class="TDBKG" width="50%">
  		<DIV align="center"><A href="<%=request.getContextPath()%>/pages/background.jsp"><B>Salir</B></A></DIV>
      </TD>
    </TR>
  </TABLE>
<%
	}
	else {
%>
   <CENTER> 
  <TABLE class="tbenter">
    <TR>
      <TD ALIGN=CENTER class="TDBKG" width="20%">
  	 	<div align="center" style="cursor:hand" onClick="ShowEnterCod()"><A>Nueva</A></div>
      </TD>
      <TD ALIGN=CENTER class="TDBKG" width="20%"><a href="javascript:goInq()">Consultar</a>
      </TD>
      <TD ALIGN=CENTER class="TDBKG" width="20%">
  		<A href="javascript:goMaint()">Modificar</A>
      </TD>   
      <TD ALIGN=CENTER class="TDBKG" width="20%"><A href="javascript:goDelete()">Borrar</A>
      </TD>               
      <TD ALIGN=CENTER class="TDBKG" width="20%"><A href="<%=request.getContextPath()%>/pages/background.jsp">Salir</A>
      </TD>
    </TR>
  </TABLE>
  </CENTER>

  <TABLE  id="mainTable" class="tableinfo">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="98%">
			<tr id="trdark">
		      <TH ALIGN=CENTER  nowrap width="5%"></TH> 
		      <TH ALIGN=CENTER  nowrap width="5%">Banco</TH>
		       <TH ALIGN=CENTER  nowrap width="10%">Número de<BR>Cliente</TH>
               <TH ALIGN=CENTER  nowrap width="10%">Tipo de<BR>Producto</TH>
		      <TH ALIGN=CENTER  nowrap width="10%">Número de <BR>Tabla</TH>
		      <TH ALIGN=CENTER  nowrap width="10%">Moneda de <BR>Tarifa</TH>
		      <TH ALIGN=CENTER  nowrap width="10%">Moneda de<BR> Cuenta</TH>      
		      <TH ALIGN=CENTER  nowrap width="40%">Descripción</TH>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap" valign="top">      
		       <div id="dataDiv1" style="height:400px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="98%">         
  
    <%
          boolean firstTime = true;  
          String chk = "";  
          jbList.initRow(); 
          int k=1;              
          while (jbList.getNextRow()) {
               ELC060001Message msgList = (ELC060001Message) jbList.getRecord();		
               if (firstTime) {
	               	chk = "checked";
	               	firstTime = false;
               } else {
               		chk = "";
                }	 
       %>             
		<tr id="dataTable<%= jbList.getCurrentRow() %>">
			<td nowrap align="center" width="5%"><input type="radio" name="ROW1" value="<%=jbList.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= jbList.getCurrentRow() %>); setInfo('<%= msgList.getE01RLCBNK()%>', '<%=request.getParameter("E01RLCCUN")%>', '<%= msgList.getE01RLCTAR() %>', '<%= msgList.getE01RLCATY() %>')"/></td>
          <TD NOWRAP align=center width="5%">
          	<%=Util.formatCell(msgList.getE01RLCBNK())%>
		  </TD>	
		  <TD NOWRAP align="center" width="10%">
			<%=Util.formatCell(msgList.getE01RLCCUN())%>
		  </TD>	
		  <TD NOWRAP align="center" width="10%">
			<%=Util.formatCell(msgList.getE01RLCATY())%>
		  </TD>		  
		  <TD NOWRAP align="center" width="10%">
			<%=Util.formatCell(msgList.getE01RLCTAR())%>
		  </TD>		  
		  <TD NOWRAP align="center" width="10%">
          	<%=Util.formatCell(msgList.getE01RLCTCY())%>
		  </TD>
		  <TD NOWRAP align="center" width="10%">
          	<%=Util.formatCell(msgList.getE01RLCACY())%>
		  </TD>
		  <TD NOWRAP align="center" width="40%">
          	<%=Util.formatCell(msgList.getE01RLCDSC())%>
		  </TD>
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
	radioClick("ROW1", 0);
  	function resizeDoc() {
       adjustEquTables(getElement("headTable"), getElement("dataTable"), getElement("dataDiv1"), 1, false);
  	}
  	resizeDoc();
  	window.onresize = resizeDoc;
  </SCRIPT> 
<% } %> 

</FORM>
</BODY>
</HTML>
