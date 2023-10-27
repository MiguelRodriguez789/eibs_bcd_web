<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<html>
<head>
<title>Clientes Exonerados del Reporte de Transacciones en Efectivo</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css"> 
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "ESD9010List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script language="Javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">
var ok = false;

function goSearch() {
	if (getElement("SEARCHCDE").value == "0") {
		alert("Por Favor digite el código o el parcial del Código para Iniciar la Lista!!!");
		return;	 
	}
	<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){%>
			getElement("SCREEN").value="1";
	<% } else { %>
			getElement("SCREEN").value="6";
	<% }%>
	document.forms[0].submit();
}

function goNew() {
	getElement("SCREEN").value="2";
	document.forms[0].submit();
}

function goProcess() {
	isCheck();
	if ( !ok ) {
		alert("Seleccione un Código");
		return;	 
	}
	getElement("SCREEN").value="3";
	document.forms[0].submit();
}

function goDelete() {
	isCheck();
	if ( !ok ) {
		alert("Seleccione un Código para Borrar");
		return;	 
	}
	getElement("SCREEN").value="4";
	if (!confirm("Esta seguro que desea borrar este registro?")) {
		return;
	}
	document.forms[0].submit();
} 

function isCheck() {
	var formLength= document.forms[0].elements.length;
   	ok = false;
	for(n=0;n<formLength;n++) {
     	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "CODE") {
			if (document.forms[0].elements[n].checked == true) {
				var I = document.forms[0].elements[n].value.indexOf("|");
				getElement("E01CUECUN").value = document.forms[0].elements[n].value.substr(0,I);
				getElement("E01CUEEXY").value = document.forms[0].elements[n].value.substr(I+1,4);
				getElement("E01CUEEXM").value = document.forms[0].elements[n].value.substr(I+6,2);
				getElement("E01CUEEXD").value = document.forms[0].elements[n].value.substr(I+8,2);
				ok = true;
        		break;
			}
      	}
    }
}

function stopRKey(evt) {
  var evt = (evt) ? evt : ((event) ? event : null);
  var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null);
  if ((evt.keyCode == 13) && (node.type=="text"))  {return false;}
}

document.onkeypress = stopRKey; 

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

<h3 align="center">Clientes Exonerados del Reporte de Transacciones en Efectivo<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="exonerated_client_list.jsp, ESD9010"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD9010">

  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="6">
  <INPUT TYPE=HIDDEN NAME="actRow" id="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" id=TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" id="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" id="CURRROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="E01CUECUN" id="E01CUECUN" VALUE="">
  <INPUT TYPE=HIDDEN NAME="E01CUEEXY" id="E01CUEEXY" VALUE="">
  <INPUT TYPE=HIDDEN NAME="E01CUEEXM" id="E01CUEEXM" VALUE="">
  <INPUT TYPE=HIDDEN NAME="E01CUEEXD" id="E01CUEEXD" VALUE="">
<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){ %>

<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" class="TDBKG" width="25%">
			<a href="javascript:goNew()"><b>Crear</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="25%">
			<a href="javascript:goProcess()"><b>Actualizar</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="25%">
			<a href="javascript:goDelete()"><b>Borrar</b></a>
		</TD>
	  	<TD align="CENTER" class="TDBKG" width="25%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE> 

<% } else { %> 

<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" class="TDBKG" width="50%">
			<a href="javascript:goProcess()"><b>Consultar</b></a>
      	</TD>
	  	<TD align="CENTER" class="TDBKG" width="50%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE> 


<% } if ( ESD9010List.getNoResult() ) { %>
 	<TABLE class="tbenter" width=100% height=30%">
 		<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center">No hay Clientes Exonerados</h4> 
      </div>
      </TD></TR>
   	</TABLE>
<% } else { %>    
    
<TABLE id="mainTable" class="tableinfo" style="height:400px; ">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="100%">
			<tr id="trdark">
				<th NOWRAP align="center" width="5%"><B>&nbsp;</B></th>
				<th NOWRAP align="center" width="15%"><B>Código Cliente</B>
					<table border="0">
						<tr id="trdark">
							<td nowrap>
								<INPUT type="text" name="SEARCHCDE" id="SEARCHCDE" size="11" maxlength="10" value="<%= userPO.getCusNum() %>">
								<IMG src="<%=request.getContextPath()%>/images/ico5.gif" onclick="goSearch()" width="15" height="11" title="Posicionarse a partir de...">
						 		<A href="javascript:GetCustomerDescId('SEARCHCDE','','')">
									<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0">
								</A>
							</td>
						</tr>
					</table>
				</th>
				<th NOWRAP align="center" width="20%"><B>Nombre del Cliente</B></th>
				<th NOWRAP align="center" width="15%"><B>Fecha Exoneración</B></th>
				<th NOWRAP align="center" width="10%"><B>Estado <br>Exoneración</B></th>
				<th NOWRAP align="center" width="30%"><B>Observaciones</B></th>	
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:400px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
         <%
    	  int i = 0;
		  boolean firstTime = true;
		  String chk = "";
          ESD9010List.initRow();    
          while (ESD9010List.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
            ESD901001Message msgList = (ESD901001Message) ESD9010List.getRecord();
		%>              
	<tr id="dataTable<%= ESD9010List.getCurrentRow() %>">
		<td nowrap align="center" width="5%"><input type="radio" id="CODE" name="CODE" value="<%=ESD9010List.getCurrentRow()%>; <%= msgList.getE01CUECUN() %>|<%= msgList.getE01CUEEXY()%>|<%= msgList.getE01CUEEXM()%>|<%= msgList.getE01CUEEXD()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= ESD9010List.getCurrentRow() %>)"/></td>
		<td NOWRAP align="center" width="15%" ><%= msgList.getE01CUECUN() %></td>
		<td NOWRAP align="left" width="20%" ><%= msgList.getD01CUECUN() %></td>
		<td NOWRAP align="center" width="15%" ><%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),
																			msgList.getBigDecimalE01CUEEXM().intValue(),
																			msgList.getBigDecimalE01CUEEXD().intValue(),
																			msgList.getBigDecimalE01CUEEXY().intValue())%></td>
		<td NOWRAP align="center" width="10%" ><%= msgList.getE01CUESTS().equals("A")?"Activo":"Suspendido"  %></td>
		<td NOWRAP align="center" width="30%" ><%= msgList.getE01CUENR1() %></td>
	</TR>
       <% 
       	 i++; 
        } 
       %> 
              </table>
              </div>
              </td>
              </tr>
  </table>

  <TABLE  class="tbenter" WIDTH="88%" ALIGN=CENTER>
   	 <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25">
       <%
		int screen = 6;
		if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
			screen = 1;
		} 
    	if ( ESD9010List.getShowPrev() ) {
  			int pos = ESD9010List.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSESD9010?SCREEN="+screen+"&FromRecord=" + pos + "&SEARCHCDE=" + userPO.getCusNum() + "\" > <img src=\""+request.getContextPath()+"/images/s/Regresar.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (ESD9010List.getShowNext()) {
  			int pos = ESD9010List.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSESD9010?SCREEN="+screen+"&FromRecord=" + pos + "&SEARCHCDE=" + userPO.getCusNum() + "\" ><img src=\""+request.getContextPath()+"/images/s/Avanzar.gif\" border=0></A>");
	    } %>
  </TD>
 </TR>
 </TABLE>
  
<BR>
<SCRIPT Language="javascript">
	showChecked("CODE");
	getElement("TOTROWS").value = <%= i%>;
	getElement("NEXTROWS").value = <%= ESD9010List.getLastRec()%>;
	getElement("CURRROWS").value = <%= ESD9010List.getFirstRec()%>;
</SCRIPT>
<%      
  }
%> 
</form>
</body>
</html>
