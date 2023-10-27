<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.ESD020501Message"%>

<html>
<head>
<title>TABLAS DE SERVICIOS</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ESD0205Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

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

addEventHandler(document, 'click' , closeHiddenDivNew);

function goAction(op) {

	document.forms[0].SCREEN.value = op;
	if (op == '3') {
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
<h3 align="center">Mantenimiento de Cargos por Servicios y Tasas
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_sel_tables.jsp,ESD0205"></h3>
<hr size="4">
<form name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0205" >
  <input type=HIDDEN name="SCREEN" value="2">
 
  
<div id="hiddenDivNew" class="hiddenDiv">

	<% int row = 0; %>
    <table id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
      
      <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
        <td align=CENTER width="18%"> 
          <div align="right">Banco :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" name="TABLE" size="4" maxlength="2" value="<%= userPO.getHeader1().trim()%>" readonly>
          </div>
        </td>
      </tr>
      
      <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
        <td align=CENTER width="18%"> 
          <div align="right">Tipo de Producto :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" name="TABLE" readonly size="4" maxlength="4" value="<%= userPO.getHeader2().trim()%>" readonly>
          </div>
        </td>
      </tr>
      
      <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
        <td align=CENTER width="18%"> 
          <div align="right">Cliente :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" name="TABLE" readonly size="9" maxlength="9" value="<%= userPO.getHeader3().trim()%>" readonly>
          </div>
        </td>
      </tr>
      
      <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
        <td align=CENTER width="18%"> 
          <div align="right">C&oacute;digo de Tabla :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" id="E01RTETAR" name="E01RTETAR" size="4" maxlength="2">
          </div>
        </td>
      </tr>
      
      <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
        <td align=center nowrap colspan="2"> 
          <input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="javascript:goAction(1)">
        </td>
      </tr>
    </table>
  </div>
  <%
  	if (ESD0205Help.getNoResult()) {
  %>
  <p>&nbsp;</p><TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>No hay resultados para su b&uacute;squeda</b></p>
          <table class="tbenter" width=100% align=center>
           <tr>
            <td class=TDBKG>
                <div id="eibsNew" align="center" style="cursor:pointer"><a><b>Crear</b></a></div>
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
	  	} else {
	  %>
  <%
  	if (!error.getERRNUM().equals("0")) {
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
                <div id="eibsNew" align="center" style="cursor:pointer"><a><b>Crear</b></a></div>
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
  
  <TABLE  id=cfTable class="tableinfo" height="70%">
 <tr height="5%">  
    <td NOWRAP valign="top" width="95%">
        <table id="headTable" width="100%">  
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <th align=CENTER nowrap width="5%">&nbsp;</th>
            <th align=CENTER nowrap width="15%"> 
              <div align="center">Tabla</div>
            </th>
            <th align=CENTER nowrap width="40%"> 
              <div align="left">Descripci&oacute;n</div>
            </th>
            <th align=CENTER nowrap width="20%">Producto</th>
            <th align=CENTER nowrap width="20%"> 
              <div align="center">Moneda</div>
            </th>
           </tr>
        </table>
       </td>
     </tr>

          	<tr  height="100%"> 
          	<td nowrap="nowrap">     
          	<div id="dataDiv1" style="width:100%; height:100%; overflow:auto;">  
			<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">
		<%
          	ESD0205Help.initRow();
          		boolean firstTime = true;
          		String chk = "";
          		while (ESD0205Help.getNextRow()) {
          			if (firstTime) {
          				firstTime = false;
          				chk = "checked";
          			} else {
          				chk = "";
          			}
          			ESD020501Message list = (ESD020501Message) ESD0205Help.getRecord();
          %>
			<tr id="dataTable<%=ESD0205Help.getCurrentRow()%>">
				<td nowrap align="center" width="5%"> <input type="radio" name="key" value="<%=ESD0205Help.getCurrentRow()%>" <%=chk%>
					onClick="highlightRow('dataTable', <%=ESD0205Help.getCurrentRow()%>)" /></td>
				<td nowrap align="center" width="15%"><a
					href="javascript:goAction('2');"><%=list.getE01RTETAR()%></a></td>
				<td nowrap align="left" width="40%"><a
					href="javascript:goAction('2');"><%=list.getE01RTEDSC ()%></a></td>
				<td nowrap align="center" width="20%"><a
					href="javascript:goAction('2');"><%=list.getE01RTEATY()%></a></td>
				<td nowrap align="center" width="20%"><a
					href="javascript:goAction('2');"><%=list.getE01RTECCY()%></a></td>
			</tr>
			<%
				}
			%>
        </table>
        </div>
        </td>
        </tr>
    </table>


  <% }  %>

<SCRIPT type="text/javascript">
    showChecked("key");
	document.getElementById("hiddenDivNew").onclick=cancelBub;
	document.getElementById("eibsNew").onclick=showHiddenDivNew;
  
</SCRIPT>
</form>

</body>
</html>
