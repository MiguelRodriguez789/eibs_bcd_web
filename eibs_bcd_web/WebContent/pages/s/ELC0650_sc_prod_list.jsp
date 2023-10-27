<%@page isELIgnored="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<TITLE>Services Charges List</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<%-- CSS/JS --%>
<jsp:include page="include/header.jsp"></jsp:include>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "jbList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<SCRIPT type="text/javascript">

function closeEnter(){
      document.getElementById("enterACC").style.visibility="hidden";
}

function ShowEnterCod() {	 
	 var y=event.clientY + document.body.scrollTop;
     var x=event.clientX + document.body.scrollLeft;
	 cancelBub();
	 getElement("enterACC").style.pixelTop=y;
     getElement("enterACC").style.pixelLeft=x;
     document.getElementById("enterACC").style.visibility="visible";
	 
}

function goNew() {
	document.getElementById("SCREEN").value = "102";
	document.forms[0].submit();
}
function goMaint() {
	document.getElementById("SCREEN").value = "103";
	document.forms[0].submit();
}
function goInquiry() {
	document.getElementById("SCREEN").value = "106";
	document.forms[0].submit();
}

function goDelete() {
	var ok = true;
	ok = confirm("Esta Usted seguro de querer borrarla?");
	if (ok) {
	    document.getElementById("SCREEN").value = "104";
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
<H3 align="center">Tabla de Comisiones y Gastos de Cartas de Créditos<IMG src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="sc_prod_list.jsp, ELC0650"></H3>

<HR size="4">

<FORM method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0650">

  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="3">
  <INPUT TYPE=HIDDEN NAME="opt" id="opt" VALUE="">
  <INPUT TYPE=HIDDEN NAME="BNK" id="BNK" VALUE="">
  <INPUT TYPE=HIDDEN NAME="STN" id="STN" VALUE="">
  <INPUT TYPE=HIDDEN NAME="ATY" id="ATY" VALUE="">
  <INPUT TYPE=HIDDEN NAME="actRow" id="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="E01LCABNK" id="E01LCABNK" VALUE="<%=request.getParameter("E01LCABNK")%>">
  <INPUT TYPE=HIDDEN NAME="E01LCAATY" id="E01LCAATY" VALUE="<%=request.getParameter("E01LCAATY")%>">  
  <INPUT TYPE=HIDDEN NAME="totalRow" id="totalRow" VALUE="0">
  
  <DIV id="enterACC" style="position:absolute; visibility:hidden; left:25px; top:-50px; z-index:3; filter:progid:DXImageTransform.Microsoft.Fade(duration=1.0,overlap=1.0)" onClick="cancelBub()"> 
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
            <INPUT type="text" name="NEWBNK" id="NEWBNK" size="3" maxlength="2" value="<%=request.getParameter("E01LCABNK")%>">
          </DIV>
        </TD>
      </TR>
      <TR id="trclear"> 
        <TD align=CENTER width="18%"> 
          <DIV align="right"><b>Número de Tabla :</b></DIV>
        </TD>
        <TD align=CENTER width="34%"> 
          <DIV align="left"> 
            <INPUT type="text" name="NEWSTN" id="NEWSTN" size="3" maxlength="2" onKeyPress="enterInteger(event)">
          </DIV>
        </TD>
      </TR>
      <TR id="trdark"> 
        <TD nowrap  > 
	              <DIV align="right"><B>Tipo de Producto :</B> </DIV>
	            </TD>
	            <TD nowrap  > 
		             	<INPUT type="text" name="NEWATY"  id="NEWATY"  size=5 maxlength="8" value="<%=request.getParameter("E01LCAATY")%>">
        				<A href="javascript:GetProductRates('NEWATY','LC')"> 
        				<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></A> 
	            </TD>
      </TR>
      
      <TR id="trclear"> 
        <TD align=center nowrap colspan="2"> 
          <INPUT id="EIBSBTN" type=button name="Submit" value="Aceptar" onClick="javascript:goNew()">
        </TD>
      </TR>
      
    </TABLE>
  </DIV>
         
<%	if ( jbList.getNoResult() ) { %>

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
   		<DIV align="center" style="cursor: hand" onClick="ShowEnterCod()"><A>Nueva</A>
			</DIV>
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
<TABLE class="tbenter" width="585">
	<TBODY>
		<TR>
			<%-- <TD align="CENTER" class="TDBKG" width="20%">
			<DIV align="center" style="cursor: hand" onClick="ShowEnterCod()"><A>Nueva</A>
			</DIV>
			</TD>--%>
			<TD align="CENTER" class="TDBKG" width="25%"><A
				href="javascript:goMaint()">Mantenimiento</A></TD>
			<TD align="CENTER" class="TDBKG" width="25%"><A
				href="javascript:goInquiry()">Consulta</A></TD>
			<TD align="CENTER" class="TDBKG" width="25%"><A
				href="javascript:goDelete()">Borrar</A></TD>
			<TD align="CENTER" class="TDBKG" width="25%"><A
				href="<%=request.getContextPath()%>/pages/background.jsp">Salir</A></TD>
		</TR>
	</TBODY>
</TABLE>
</CENTER>
<TABLE  id="mainTable" class="tableinfo">
	<tr height="5%">
		<td NOWRAP valign="top" width="80%">
	  		<TABLE id="headTable" width="100%" >
				<TR id="trdark"> 
			      <TH ALIGN=CENTER  nowrap width="5%"></TH> 
			      <TH ALIGN=CENTER  nowrap width="10%">Banco</TH>
			      <TH ALIGN=CENTER  nowrap width="15%">Tipo de<BR> Cuenta</TH>
			      <TH ALIGN=CENTER  nowrap width="10%">Número de <BR>Tabla</TH>
			      <TH ALIGN=CENTER  nowrap width="10%">Moneda de <BR>Tarifa</TH>
			      <TH ALIGN=CENTER  nowrap width="10%">Moneda de<BR> Cuenta</TH>      
			      <TH ALIGN=CENTER  nowrap width="40%">Descripción</TH>
				</TR>
			</TABLE>
		</td>	
  	</TR>	
			  	<TR height="95%"> 
			    	<TD NOWRAP valign="top" width="80%">
   					<div id="dataDiv1" class="scbarcolor" style="height:200px; overflow:auto;">
    					<table id="dataTable" width="100%">
    <%
          boolean firstTime = true;  
          String chk = "";  
          jbList.initRow(); 
          int k=1;              
          while (jbList.getNextRow()) {
               ELC065001Message msgList = (ELC065001Message) jbList.getRecord();		
               if (firstTime) {
	               	chk = "checked";
	               	firstTime = false;
               } else {
               		chk = "";
                }	 
       %>             
		<tr id="dataTable<%= jbList.getCurrentRow() %>">
			<td nowrap align="center" width="5%"><input type="radio" id="ROW1" name="ROW1" value="<%=jbList.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= jbList.getCurrentRow() %>);setInfo('<%= msgList.getE01LCABNK()%>', '<%= msgList.getE01LCATAR() %>', '<%= msgList.getE01LCAATY() %>');"/></td>
          <TD NOWRAP align=center width="10%">
          	<%=Util.formatCell(msgList.getE01LCABNK())%>
		  </TD>		  
		  <TD NOWRAP align="center" width="15%">
          	<%=Util.formatCell(msgList.getE01LCAATY())%>
		  </TD>
		  <TD NOWRAP align="center" width="10%">
			<%=Util.formatCell(msgList.getE01LCATAR())%>
		  </TD>		  
		  <TD NOWRAP align="center" width="10%">
          	<%=Util.formatCell(msgList.getE01LCATCY())%>
		  </TD>
		  <TD NOWRAP align="center" width="10%">
          	<%=Util.formatCell(msgList.getE01LCAACY())%>
		  </TD>
		  <TD NOWRAP align="center" width="40%">
          	<%=Util.formatCell(msgList.getE01LCADSC())%>
		  </TD>
		</TR>
		
        <% 
        	k++;
         }
         %> 
    					</table>
    				</div>
    			</TD>
    		</TR>
    	</TABLE>						

  <SCRIPT type="text/javascript">     
  	document.getElementById("totalRow").value="<%= k %>";
	 showChecked("ROW1");     
  </SCRIPT> 
<%      
  }
%> 
</FORM>
</BODY>
</HTML>
