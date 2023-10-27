<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import="datapro.eibs.master.*,datapro.eibs.beans.*" %>

<HTML>
<HEAD>
<TITLE>Services Charges List</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<LINK Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "jbList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/graphical.js"> </script>

<script type="text/javascript">

function closeHiddenDivNew(){
	setVisibility(getElement("hiddenDivNew"), "hidden");
}

function showHiddenDivNew(evt) {
	evt = getEvent(evt);
 	
	var hiddenDivNew = getElement("hiddenDivNew");

	var y=evt.clientY + document.body.scrollTop;
	var x=evt.clientX + document.body.scrollLeft;
     
	cancelBub(evt);

	moveElement(hiddenDivNew, y, x);
	setVisibility(hiddenDivNew, "visible");
	 
}

function goNew() {
	getElement("SCREEN").value = "102";
	document.forms[0].submit();
}
function goMaint() {
	getElement("SCREEN").value = "103";
	document.forms[0].submit();
}
function goInquiry() {
	getElement("SCREEN").value = "106";
	document.forms[0].submit();
}

function goDelete() {
	if (confirm("Esta Usted seguro de querer borrarla?")) {
	    getElement("SCREEN").value = "104";
	    document.forms[0].submit();
    }
}

function setInfo(bnk, stn, aty) {
    getElement("STN").value = stn;
    getElement("BNK").value = bnk;
    getElement("ATY").value = aty;
}

document.onclick=closeHiddenDivNew;

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
<H3 align="center">Tabla de Comisiones y Gastos de Cartas de Créditos<IMG src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="sc_prod_list.jsp, ELC0600"></H3>

<HR size="4">

<FORM method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0600">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="101">
  <INPUT TYPE=HIDDEN NAME="opt" VALUE="">
  <INPUT TYPE=HIDDEN NAME="BNK" VALUE="">
  <INPUT TYPE=HIDDEN NAME="STN" VALUE="">
  <INPUT TYPE=HIDDEN NAME="ATY" VALUE="">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="E01RLCBNK" VALUE="<%=request.getParameter("E01RLCBNK")%>">
  <INPUT TYPE=HIDDEN NAME="E01RLCATY" VALUE="<%=request.getParameter("E01RLCATY")%>">  
  <INPUT TYPE=HIDDEN NAME="totalRow" VALUE="<%=jbList.size()%>">
  
  <div id="hiddenDivNew" class="hiddenDiv"> 
    <TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
      <TR id="trdark"> 
        <TD align=CENTER width="18%"> 
          <DIV align="right"><b>Banco :</b></DIV>
        </TD>
        <TD align=CENTER width="34%"> 
          <DIV align="left"> 
            <INPUT type="text" name="NEWBNK" size="3" maxlength="2" value="<%=request.getParameter("E01RLCBNK")%>">
          </DIV>
        </TD>
      </TR>

      <TR id="trclear"> 
        <TD nowrap  > 
	              <DIV align="right"><B>Tipo de Producto :</B> </DIV>
	            </TD>
	            <TD nowrap  > 
		             	<INPUT type="text" name="NEWATY"  size=5 maxlength="4" value="<%=request.getParameter("E01RLCATY")%>" readonly>
	            </TD>
      </TR>
      <TR id="trdark"> 
        <TD align=CENTER width="18%"> 
          <DIV align="right"><b>Número de Tabla :</b></DIV>
        </TD>
        <TD align=CENTER width="34%"> 
          <DIV align="left"> 
            <INPUT type="text" name="NEWSTN" size="3" maxlength="2" onKeyPress="enterInteger(event)">
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
		<div id="eibsNew" align="center" style="cursor:pointer"><a><b>Nuevo</b></a></div>
   	  </TD>      
      <TD ALIGN=CENTER class="TDBKG" width="50%">
  		<DIV align="center"><A href="<%=request.getContextPath()%>/pages/background.jsp"><B>Salir</B></A></DIV>
      </TD>
    </TR>
  </TABLE>
<% 	
	} else { 
%>  
  <CENTER>
<TABLE class="tbenter" width="585">
	<TBODY>
		<TR>
			<TD align="CENTER" class="TDBKG" width="20%">
			  <div id="eibsNew" align="center" style="cursor:pointer"><a><b>Nuevo</b></a></div>
			</TD>
			<TD align="CENTER" class="TDBKG" width="20%"><A
				href="javascript:goMaint()">Mantenimiento</A></TD>
			<TD align="CENTER" class="TDBKG" width="20%"><A
				href="javascript:goInquiry()">Consulta</A></TD>
			<TD align="CENTER" class="TDBKG" width="20%"><A
				href="javascript:goDelete()">Eliminar</A></TD>
			<TD align="CENTER" class="TDBKG" width="20%"><A
				href="<%=request.getContextPath()%>/pages/background.jsp">Salir</A></TD>
		</TR>
	</TBODY>
</TABLE>
</CENTER>
  <TABLE  id="mainTable" class="tableinfo">
    <tr> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="100%">
			<tr id="trdark">
		      <TH ALIGN=CENTER  nowrap width="5%"></TH> 
		      <TH ALIGN=CENTER  nowrap width="10%">Banco</TH>
		      <TH ALIGN=CENTER  nowrap width="10%">Número de <BR>Tabla</TH>
		      <TH ALIGN=CENTER  nowrap width="10%">Moneda de <BR>Tarifa</TH>
		      <TH ALIGN=CENTER  nowrap width="10%">Moneda de<BR> Cuenta</TH>      
		      <TH ALIGN=CENTER  nowrap width="55%">Descripción</TH>
			</tr>
		</TABLE>
		<div id="dataDiv1" class="scbarcolor">
		<table id="dataTable">
    <%
          boolean firstTime = true;  
          String chk = "";  
          jbList.initRow(); 
          while (jbList.getNextRow()) {
               ELC060001Message msgList = (ELC060001Message) jbList.getRecord();		
               if (firstTime) {
	               	chk = "checked";
	               	firstTime = false;
               } else {
               		chk = "";
                }	 
       %>             
		<tr>
			<td nowrap align="center" width="5%"><input type="radio" name="ROW1" value="<%=jbList.getCurrentRow()%>" <%=chk%> class="highlight" onClick="setInfo('<%= msgList.getE01RLCBNK()%>', '<%= msgList.getE01RLCTAR() %>', '<%= msgList.getE01RLCATY() %>')"/></td>
          <TD NOWRAP align=center width="10%">
          	<%=Util.formatCell(msgList.getE01RLCBNK())%>
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
		  <TD NOWRAP align="center" width="55%">
          	<%=Util.formatCell(msgList.getE01RLCDSC())%>
		  </TD>
		</TR>
		
        <% 
         }
         %> 
		</table>
		</div>
</table>
<script type="text/javascript">
	radioClick("ROW1", 0);
  	
  	function resizeDoc() {
       adjustEquTables(getElement("headTable"), getElement("dataTable"), getElement("dataDiv1"), 1, false);
  	}
  	resizeDoc();
  	window.onresize = resizeDoc;
</script>

<%
	} 
%>
</FORM>
<script type="text/javascript">
  	getElement("hiddenDivNew").onclick=cancelBub;
  	getElement("eibsNew").onclick=showHiddenDivNew;
</script>

</BODY>
</HTML>
