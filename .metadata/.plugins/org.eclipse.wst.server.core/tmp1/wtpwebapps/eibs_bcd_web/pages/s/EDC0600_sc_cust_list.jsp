<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Tablas de Comisiones y Gastos de Cobranzas por Cliente</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "ccList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

function closeHiddenDivNew(){
	setVisibility(document.getElementById("hiddenDivNew"), "hidden");
}

function showHiddenDivNew(evt) {
	var evt = getEvent(evt);
 	
	var hiddenDivNew = document.getElementById("hiddenDivNew");

	var y=evt.clientY + document.body.scrollTop;
	var x=evt.clientX + document.body.scrollLeft;
     
	cancelBub(evt);

	moveElement(hiddenDivNew, y, x);
	setVisibility(hiddenDivNew, "visible");
	 
	document.forms[0].NEWSTN.focus();
}

function goAction(op) {
    document.forms[0].opt.value = op;
    document.forms[0].submit();
}

function goDelete() {
	if (confirm("Esta usted seguro de querer borrarla?")) {
	    document.forms[0].SCREEN.value = "10";
	    document.forms[0].submit();
    }
}

function setInfo(bnk, stn, aty, cun) {
    document.forms[0].BNK.value = bnk;
    document.forms[0].STN.value = stn;
    document.forms[0].ATY.value = aty;
    document.forms[0].CUN.value = cun;
}

addEventHandler(document, 'click', closeHiddenDivNew);

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

<h3 align="center">Tablas de Comisiones y Gastos de Cobranzas por Cliente
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="sc_cust_list.jsp, EDC0600"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDC0600">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="7">
  <INPUT TYPE=HIDDEN NAME="opt" VALUE="">
  <INPUT TYPE=HIDDEN NAME="BNK" VALUE="">
  <INPUT TYPE=HIDDEN NAME="STN" VALUE="">
  <INPUT TYPE=HIDDEN NAME="ATY" VALUE="">
  <INPUT TYPE=HIDDEN NAME="CUN" VALUE="">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="E01RCOBNK" VALUE="<%=request.getParameter("E01RCOBNK")%>">
  <INPUT TYPE=HIDDEN NAME="E01RCOCUN" VALUE="<%=request.getParameter("E01RCOCUN")%>">  
  <INPUT TYPE=HIDDEN NAME="totalRow" VALUE="<%=ccList.size()%>">
  <div id="hiddenDivNew" style="position:absolute; visibility:hidden; left:25px; top:-50px; z-index:3; filter:progid:DXImageTransform.Microsoft.Fade(duration=1.0,overlap=1.0)" onClick="cancelBub()"> 
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
            <input type="text" name="NEWBNK" size="3" maxlength="2" VALUE="<%=request.getParameter("E01RCOBNK")%>">
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
          <div align="right">Número de Ciente :</div>
        </td>
        <td align=left width="34%"> 
          		<INPUT type="text" name="NEWCUN" size="15" maxlength="10" VALUE="<%=request.getParameter("E01RCOCUN")%>"> 
            	<a href="javascript:GetCustomerDescId('NEWCUN','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a> 

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
      <div align="center"> <h4 style="text-align:center"><B>No hay	resultados para su b&uacute;squeda</B>.  <br>Oprima Nueva para Crearla</h4> 
      </div>
      </TD></TR>
   	</TABLE>
   	<TABLE class="tbenter">
    <TR>
      <TD ALIGN=CENTER class="TDBKG" width="50%">
   		<div align="center" style="cursor:hand" onClick="showHiddenDivNew(event)"><a><b>Crear</b></a></div>
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
  
  <TABLE class="tbenter">
    <TR>
      <TD ALIGN=CENTER class="TDBKG" width="25%">
  		<div align="center" style="cursor:hand" onClick="showHiddenDivNew(event)">Crear</div>
      </TD>
      <TD ALIGN=CENTER class="TDBKG" width="25%"><a href="javascript:goAction('M')">Modificar</a>
      </TD>   
      <TD ALIGN=CENTER class="TDBKG" width="25%"><a href="javascript:goDelete()">Borrar</a>
      </TD>               
      <TD ALIGN=CENTER class="TDBKG" width="25%"><a href="<%=request.getContextPath()%>/pages/background.jsp">Salir</a>
      </TD>
    </TR>
  </TABLE>
  <TABLE  id="mainTable" class="tableinfo">
				 <tr height="5%">
					<td NOWRAP valign="top" width="80%">
				  		<TABLE id="headTable" width="100%" >
       					<TR id="trdark">
					      <TH ALIGN=CENTER  nowrap width="5%"></TH> 
					      <TH ALIGN=CENTER  nowrap width="5%">Banco</TH>
					      <TH ALIGN=CENTER  nowrap width="15%">Número de<BR>Cliente</TH>
					      <TH ALIGN=CENTER  nowrap width="15%">Tipo de<BR>Producto</TH>
					      <TH ALIGN=CENTER  nowrap width="10%">Número<BR>Tabla</TH>
					      <TH ALIGN=CENTER  nowrap width="10%">Moneda<BR>Tarifa</TH>
					      <TH ALIGN=CENTER  nowrap width="10%">Moneda<BR>Contable</TH>      
					      <TH ALIGN=CENTER  nowrap width="30%">Descripcion</TH>
		 				</TR>
     				</TABLE>
					</td>	
			  	</TR>	    
			  	<TR height="95%"> 
			    	<TD NOWRAP valign="top" width="80%">
   					<div id="dataDiv1" class="scbarcolor" style="height:400px; overflow:auto;">
    					<table id="dataTable" width="100%">
    <%
          boolean firstTime = true;  
          String chk = "";  
          ccList.initRow(); 
          while (ccList.getNextRow()) {
               EDC060001Message msgList = (EDC060001Message) ccList.getRecord();		
               if (firstTime) {
	               	chk = "checked";
	               	firstTime = false;
               } else {
               		chk = "";
                }	 
       %>             
		<tr id="dataTable<%= ccList.getCurrentRow() %>">
			<td nowrap align="center" width="5%"><input type="radio" name="ROW1" value="<%=ccList.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= ccList.getCurrentRow() %>); setInfo('<%= msgList.getE01RCOBNK()%>', '<%= msgList.getE01RCOTBL() %>', '<%= msgList.getE01RCOATY() %>', '<%= msgList.getE01RCOCUN() %>')"/></td>
          <td NOWRAP align=center width="5%">
          	<%=Util.formatCell(msgList.getE01RCOBNK())%>
		  </td>		  
          <td NOWRAP align=center width="15%">
          	<%=Util.formatCell(msgList.getE01RCOCUN())%>
		  </td>		  
		  <td NOWRAP align=center width="15%">
			<%=Util.formatCell(msgList.getE01RCOATY())%>
		  </td>		  
		  <td NOWRAP align=center width="10%">
			<%=Util.formatCell(msgList.getE01RCOTBL())%>
		  </td>		  
		  <td NOWRAP align=center width="10%">
          	<%=Util.formatCell(msgList.getE01RCOTCY())%>
		  </td>
		  <td NOWRAP align=center width="10%">
          	<%=Util.formatCell(msgList.getE01RCOACY())%>
		  </td>
		  <td NOWRAP align=left width="30%">
          	<%=Util.formatCell(msgList.getE01RCODSC())%>
		  </td>
		</TR>
		
        <% 
         }
         %> 
    					</table>
    				</div>
    			</TD>
    		</TR>
    	</TABLE>						
  <SCRIPT type="text/javascript">     
	 showChecked("ROW1");          
  </SCRIPT> 
<%      
  }
%> 
</form>
</body>
</html>
