<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EDL011001Message"%>

<html>
<head>
<title>TABLAS DE SERVICIOS</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EDL0110FHelp" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/graphical.js"> </SCRIPT>

<script type="text/javascript">

function closeHiddenDivNew(){
	setVisibility(getElement("hiddenDivNew"), "hidden");
}

function showHiddenDivNew(evt) {
	evt = (evt) ? evt : ((window.event) ? window.event : "");
 	
	var hiddenDivNew = getElement("hiddenDivNew");

	var y=evt.clientY + document.body.scrollTop;
	var x=evt.clientX + document.body.scrollLeft;
     
	cancelBub(evt);

	moveElement(hiddenDivNew, y, x);
	setVisibility(hiddenDivNew, "visible");
	 
}

addEventHandler(document, 'click', closeHiddenDivNew);

function goAction(op) {

	document.forms[0].SCREEN.value = op;
	if (op == '30') {
    	if (confirm("Desea eliminar este registro seleccionado?")) {
			document.forms[0].submit();		
    	}
  	} else {
		document.forms[0].submit();		
	}
  
}

</SCRIPT>  

</head>

<BODY>
<h3 align="center">Tasas Flotantes
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_sel_tables, EDL0110F" ></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0110F" >
  <input type=HIDDEN name="SCREEN" value="2">  
  
  <%
	if ( EDL0110FHelp.getNoResult() ) {
 %>
  <p>&nbsp;</p><TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>No hay resultados para su b&uacute;squeda</b></p>
          <%int row = 0; %>
          <table class="tbenter" width=100% align=center>
           <tr>
           <% if( !"1".equals( currUser.getH01WK1() ) ){ %>
            <td class=TDBKG>
                <div  align="center"><a href="javascript:goAction(10)"><b>Crear</b></a></div>
           </td>
           <% } %>
            <td class=TDBKG>
              <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
            </td>
           </tr>
         </table>
	  </div>

	  </TD>
	</TR>
    </TABLE>
	
  <%  
		}
	else {
%> <% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%> 
  <p> 

          
  <table class="tbenter" width=100% align=center>
    <tr> 
      <% if( "1".equals( currUser.getH01WK1() ) ){ %>
	      <td class=TDBKG width="25%"> 
	        <div align="center"><a href="javascript:goAction(20)"><b>Consultar</b></a></div>
	      </td>     
      <% } else { %>

	      <td class=TDBKG width="25%"> 
			<div  align="center"><a href="javascript:goAction(10)"><b>Crear</b></a></div>
	      </td>
	      <td class=TDBKG width="25%"> 
	        <div align="center"><a href="javascript:goAction(20)"><b>Modificar</b></a></div>
	      </td>
	      <td class=TDBKG width="25%"> 
	        <div align="center"><a href="javascript:goAction(30)"><b>Borrar</b></a></div>
	      </td>
	      <td class=TDBKG width="25%"> 
	        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
	      </td>
      <% } %>


    </tr>
  </table>
  
   
  <br>
<%int row = 0; %>
<TABLE id=cfTable class="tableinfo" height="70%">

 	<tr height="5%">  
    <td NOWRAP valign="top" width="95%">
        <table id="headTable" width="100%">
           <tr id="trdark"> 
			<th align=CENTER nowrap width="2%">&nbsp;</th>
			<th align=CENTER nowrap width="5%">
				<div align="center">Tabla</div>
			</th>
			<th align=CENTER nowrap width="20%">
				<div align="center">Descripci&oacute;n</div>
			</th>
			<th align=CENTER nowrap width="10%">
				<div align="center">Tipo</div>
			</th>
			<th align=CENTER nowrap width="10%">
				<div align="center">Modo</div>
			</th>
			<th align=CENTER nowrap width="5%">
				<div align="center">Freq.</div>
			</th>
			<th align=CENTER nowrap width="5%">
				<div align="center">Base</div>
			</th>
			<th align=CENTER nowrap width="10%">
				<div align="center">Tasa<br>
				Primaria</div>
			</th>
			<th align=CENTER nowrap width="10%">
				<div align="center">Tasa<br>
			     Secundaria</div>
			</th>
			<th align=CENTER nowrap width="10%">
				<div align="center">Tasa Efectiva<br>
			     Anual</div>
			</th>
			<th align=CENTER nowrap width="10%">
				<div align="center">Fecha</div>
			</th>
			<th align=CENTER nowrap width="10%">
				<div align="center">Status</div>
			</th>
		</tr>
        </table>
       </td>
     </tr>
	 
          	<tr  height="95%"> 
          	<td nowrap="nowrap">     
          	<div id="dataDiv1" style="height:100%; overflow:auto;">   
			<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">
        <%
                EDL0110FHelp.initRow();
				boolean firstTime = true;
          		String chk = "";
                while (EDL0110FHelp.getNextRow()) {
                 if (firstTime) {
          				firstTime = false;
          				chk = "checked";
          			} else {
          				chk = "";
          			}  
          			EDL011001Message list = (EDL011001Message) EDL0110FHelp.getRecord();
          %>
          <tr id="dataTable<%=EDL0110FHelp.getCurrentRow()%>">
            	<td nowrap align="center" width="2%"> <input type="radio" name="key" value="<%=EDL0110FHelp.getCurrentRow()%>" <%=chk%>
					class="highlight" onClick="highlightRow('dataTable', <%=EDL0110FHelp.getCurrentRow()%>)" /></td>
				<td nowrap align="center" width="5%"><a
					href="javascript:goAction('20');"><%=list.getE01PRRTBL()%></a></td>
				<td nowrap align="left" width="19%"><a
					href="javascript:goAction('20');"><%=list.getE01PRRNME()%></a></td>
				<%if (list.getE01PRRTYP().equals("1")) { %>
					<td nowrap align="left" width="10%"><a href="javascript:goAction('2');">&nbsp;&nbsp;Efectiva</a></td>
				<%} else if (list.getE01PRRTYP().equals("2")) { %>
					<td nowrap align="left" width="10%"><a href="javascript:goAction('2');">&nbsp;&nbsp;Conversion</a></td>
				<%} else { %>					
					<td nowrap align="left" width="10%"><a href="javascript:goAction('2');">&nbsp;&nbsp;Nominal</a></td>
				<% } %>
				<%if (list.getE01PRRMOD().equals("P")) { %>
					<td nowrap align="left" width="10%"><a href="javascript:goAction('2');">&nbsp;&nbsp;Anticipado</a></td>
				<% } else if (list.getE01PRRMOD().equals("S")) { %>
					<td nowrap align="left" width="10%"><a href="javascript:goAction('2');">&nbsp;&nbsp;Vencido</a></td>
				<%} else { %>					
					<td nowrap align="left" width="10%"><a href="javascript:goAction('2');">&nbsp;&nbsp; </a></td>
				<% } %>
				<td nowrap align="right" width="5%"><a
				href="javascript:goAction('20');"><%=list.getE01PRRPER()%></a></td>
				<td nowrap align="right" width="5%"><a
				href="javascript:goAction('20');"><%=list.getE01PRRBAS()%></a></td>
				<td nowrap align="right" width="10%"><a
				href="javascript:goAction('20');"><%=list.getE01PRRPRT()%></a></td>
				<td nowrap align="right" width="10%"><a
					href="javascript:goAction('20');"><%=list.getE01PRRSRT()%></a></td>		
				<td nowrap align="right" width="10%"><a
					href="javascript:goAction('20');"><%=list.getE01PRRTEA()%></a></td>				
				<td nowrap align="center" width="10%"><a href="javascript:goAction('20');">
					<%=Util.formatCustomDate(currUser.getE01DTF(),
											 list.getBigDecimalE01PRREFM().intValue(),
											 list.getBigDecimalE01PRREFD().intValue(),
											 list.getBigDecimalE01PRREFY().intValue()) %>
				</a></td>
				<td nowrap align="center" width="10%"><a
					href="javascript:goAction('20');"><%=list.getE01DSCRTY()%></a></td>				
			</tr>
			<%
				}
			 %>
		
</TABLE>
</div>
</td>
</tr>
</table>
<% } %>

<SCRIPT type="text/javascript">
  
  	showChecked("key");
 	getElement("hiddenDivNew").onclick=cancelBub;
	getElement("eibsNew").onclick=showHiddenDivNew;
  
</SCRIPT>
</form>

</body>
</html>
