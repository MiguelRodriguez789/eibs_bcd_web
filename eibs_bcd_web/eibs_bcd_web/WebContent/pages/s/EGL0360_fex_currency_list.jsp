<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EGL036001Message"%>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>TABLAS DE SERVICIOS</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EGL0360Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

function goAction(op) {

	document.forms[0].opt.value = op;
	if (op == '3') {
    	if (confirm("Desea eliminar este registro seleccionado?")) {
			document.forms[0].submit();		
    	}
    }else{
		document.forms[0].submit();
		}
}

function closeHiddenDivNew(){
	setVisibility(document.getElementById("hiddenDivNew"), "hidden");
}

function showHiddenDivNew(evt) {
	evt = (evt) ? evt : ((window.event) ? window.event : "");
 	
	var hiddenDivNew = document.getElementById("hiddenDivNew");

	var y=evt.clientY + document.body.scrollTop;
	var x=evt.clientX + document.body.scrollLeft;
     
	cancelBub(evt);

	moveElement(hiddenDivNew, y, x);
	setVisibility(hiddenDivNew, "visible");
	 
}

addEventHandler(document, 'click', closeHiddenDivNew);

</SCRIPT>  

</head>

<BODY>
<h3 align="center">Mantenimiento Referencias Moneda Extranjera<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="fex_currency_list.jsp,EGL0360"> 
<hr size="4">
<form name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEGL0360" >
  <input type=HIDDEN name="SCREEN" value="2">
  <input type=HIDDEN name="opt" value="1">
  <input type=HIDDEN name="totalRow" value="0">
  <input type=HIDDEN name="CCY" value="">
  <input type=HIDDEN name="BNK" value="">
  <%
	if ( EGL0360Help.getNoResult() ) {
 %>
  
  <TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>No hay resultados para su b&uacute;squeda</b></p>
          <table class="tbenter" width=100% align=center>
           <tr>
            <td class=TDBKG>
                <div align="center" style="cursor:hand" ><a href="javascript:goAction(1)"><b>Crear</b></a></div>
              </td>
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
      <td class=TDBKG width="25%"> 
        <div align="center" style="cursor:hand" ><a href="javascript:goAction(1)"><b>Crear</b></a></div>
      </td>
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction(2)"><b>Modificar</b></a></div>
      </td>
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction(3)"><b>Borrar</b></a></div>
      </td>
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </td>
    </tr>
  </table>
   
  <br>
  
  <%int row = 0; %>
  <table  id=cfTable class="tableinfo" height="70%">
   
 	<tr height="5%">  
    <td NOWRAP valign="top" width="95%">
        <table id="headTable" width="100%">
           <tr id="trdark"> 
            <th align=center nowrap width="5%">&nbsp;</th>
            <th align=center nowrap width="10%"> Moneda </th>
            <th align=left nowrap width="25%"> Descripci&oacute;n</th>
            <th align=right nowrap width="15%">Tasa</th>
            <th align=center nowrap width="15%">Operacion</th>
            <th align=right nowrap width="5%">Decimales</th>
            <th align=center nowrap width="10%">Nombre</th>
            <th align=left nowrap width="10%">Referencia</th>
            <th align=center nowrap width="5%">Contabilidad</th>
          </tr>
        </table>
       </td>
     </tr>
          
          	<tr  height="100%"> 
          	<td nowrap="nowrap">     
          	<div id="dataDiv1" style="width:100%; height:100%; overflow:auto;">  
			<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">
		<%
                EGL0360Help.initRow();
				boolean firstTime = true;
				String chk = "";
        		while (EGL0360Help.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
					EGL036001Message msgList= (EGL036001Message) EGL0360Help.getRecord();
           %>
				<tr id="dataTable<%= EGL0360Help.getCurrentRow() %>">
						
					<td nowrap  ALIGN=center width="5%"><input type="radio" name="CURRCODE" value="<%= EGL0360Help.getCurrentRow() %>" <%=chk%> onClick="highlightRow('dataTable', <%= EGL0360Help.getCurrentRow() %>)"></td>
					<td nowrap  ALIGN=center width="10%"><a href="javascript:goAction('2');"><%= msgList.getE01RATCCY() %></a></td>
					<td nowrap  ALIGN=left width="25%"><a href="javascript:goAction('2');"><%= msgList.getE01RATDSC() %></a></td>
					<td nowrap  ALIGN=right width="15%"><a href="javascript:goAction('2');"><%= msgList.getE01RATEXR() %></a></td>
					<% if (msgList.getE01RATMUD().equals("M")) {%>
					<td nowrap  ALIGN=center width="15%"><a href="javascript:goAction('2');">MULTIPLICA</a></td>	
					<% } else { %>
					<td nowrap  ALIGN=center width="15%"><a href="javascript:goAction('2');">DIVIDE</a></td>	
					<% } %>
					<td nowrap  ALIGN=center width="5%"><a href="javascript:goAction('2');"><%= msgList.getE01RATDCP() %></a></td>
					<td nowrap  ALIGN=left width="10%"><a href="javascript:goAction('2');"><%= msgList.getE01RATCYA() %></a></td>
					<td nowrap  ALIGN=left width="10%"><a href="javascript:goAction('2');"><%= msgList.getE01RATRNM() %></a></td>
					<% if (msgList.getE01RATACF().equals("N")) {%>
					<td nowrap  ALIGN=center width="5%"><a href="javascript:goAction('2');">NO</a></td>	
					<% } else { %>
					<td nowrap  ALIGN=center width="5%"><a href="javascript:goAction('2');"></a></td>	
					<% } %>
				</tr>
		 <%
		 	}
		  %>  
        </table>
        </div>
        </tr>
    </table>
 
  <% } %>

</form>
</h3>

<SCRIPT type="text/javascript">
  
  showChecked("CURRCODE");
  document.getElementById("hiddenDivNew").onclick=cancelBub;
document.getElementById("eibsNew").onclick=showHiddenDivNew; 
  
</SCRIPT>



</body>
</html>
