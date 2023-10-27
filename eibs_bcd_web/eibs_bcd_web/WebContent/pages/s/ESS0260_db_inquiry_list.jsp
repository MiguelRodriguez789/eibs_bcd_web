<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>Consulta de Auditoria</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet" type="text/css" media="screen" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "ESS0260List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script language="Javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/mapstyler.js"></script>
<SCRIPT Language="javascript">
var ok = false;

function goDetail() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un registro!!!");
		return;	 
	}
	CenterWindow('<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESS0260?SCREEN=3&E01MNPREF=' 
	              + getElement("E01MNPREF").value + 
		         '&E01MNPSEC=' + getElement("E01MNPSEC").value ,600,500,2);
}

function goPDF() {
  CenterWindow('<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESS0260?SCREEN=6&E01MNPREF=' 
	              + getElement("E01MNPREF").value + 
		         '&E01MNPSEC=' + getElement("E01MNPSEC").value ,600,500,2)
}

function isCheck() { 
	var formLength= document.forms[0].elements.length;
   	ok = false;
	for(n=0;n<formLength;n++) {
     	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "CODE") {
      		if (document.forms[0].elements[n].checked == true) {
				var I = document.forms[0].elements[n].value.indexOf("|");
				getElement("E01MNPREF").value = document.forms[0].elements[n].value.substr(0,I);
				getElement("E01MNPSEC").value = document.forms[0].elements[n].value.substr(I+1,9);
				ok = true;
        		break;
			}
      	}
    }

}

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

<h3 align="center">Consulta de Auditoria sobre operaciones en e-IBS<br>
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="denial_list.jsp, ESS0260">
</h3>
<hr size="3">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESS0260">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="3">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">
  
  <INPUT TYPE=HIDDEN NAME="E01MNPREF" VALUE="">
  <INPUT TYPE=HIDDEN NAME="E01MNPSEC" VALUE="">
  <INPUT TYPE=HIDDEN name="SEARCHCDE" value="<%= userPO.getHeader21() %>">
  <INPUT TYPE=HIDDEN name="SEARCHTYPE" value="">
  <INPUT TYPE=HIDDEN name="E01TYP" value="">
  <INPUT TYPE=HIDDEN name="E01REQTYP" value="<%= userPO.getHeader1().trim() %>">
  <INPUT TYPE=HIDDEN name="E01REQORD" value="<%= userPO.getHeader2().trim() %>">

  <INPUT TYPE=HIDDEN name="E01REQDFD" value="<%= userPO.getHeader4().trim() %>">
  <INPUT TYPE=HIDDEN name="E01REQDFM" value="<%= userPO.getHeader5().trim() %>">
  <INPUT TYPE=HIDDEN name="E01REQDFY" value="<%= userPO.getHeader6().trim() %>">
  <INPUT TYPE=HIDDEN name="E01REQDTD" value="<%= userPO.getHeader7().trim() %>">
  <INPUT TYPE=HIDDEN name="E01REQDTM" value="<%= userPO.getHeader8().trim() %>">
  <INPUT TYPE=HIDDEN name="E01REQDTY" value="<%= userPO.getHeader9().trim() %>">
 
<TABLE class="tbenter" width="100%"> 
	<TR>
		<TD align="right" width="34%"></TD>
		<TD align="right" width="33%"><B><U>Criterio de Búsqueda</U></B></TD>
	  	<TD align="CENTER" width="33%"></TD>	  	
	</TR>
	<TR>
		<TD align="CENTER" width="34%"></TD>
		<TD align="right" width="33%"><B>Producto IBS :</B></TD>
		<TD align="left" width="33%"><% if (userPO.getHeader1().equals("12")) { 
				out.println("Perfiles de Usuarios e-IBS ") ; 
		        } else if (userPO.getHeader1().equals("1")) { 
				out.println("Clientes " );
				} else if (userPO.getHeader1().equals("2")) { 
				out.println("Cuentas de Detalle " );
				} else if (userPO.getHeader1().equals("3")) { 
				out.println("Certificados de Deposito " );
				} else if (userPO.getHeader1().equals("4")) { 
				out.println("Prestamos " );
				} else if (userPO.getHeader1().equals("5")) { 
				out.println("Papeles Comerciales " );
				} else if (userPO.getHeader1().equals("6")) { 
				out.println("Cartas de Credito " );
				} else if (userPO.getHeader1().equals("7")) { 
				out.println("Beneficiarios, Firmantes, otros " );
				} else if (userPO.getHeader1().equals("8")) { 
				out.println("Cobranzas " );
				} else if (userPO.getHeader1().equals("9")) { 
				out.println("Tarjetas de Credito " ); 
			   } else if (userPO.getHeader1().equals("10")) { 
				out.println("Stop Payments in Retail Acc " ); 
			   } else if (userPO.getHeader1().equals("11")) { 
				out.println("Cuentas Contable " ); 
			   } else if (userPO.getHeader1().equals("99")) { 
				out.println("Otros Productos " ); 
			   }
			   %>  
		</TD>
	</TR>
    <TR>
		<TD align="CENTER" width="34%"></TD>
		<TD align="right" width="33%"><B>Fecha :</B></TD>
		<TD align="left" width="33%">
		<%  out.println("Desde :" + datapro.eibs.master.Util.formatDate(userPO.getHeader6(),userPO.getHeader5(),userPO.getHeader4()));%> 
		<%  out.println("Hasta :" + datapro.eibs.master.Util.formatDate(userPO.getHeader9(),userPO.getHeader8(),userPO.getHeader7()));%> 
		</TD>
	</TR>
	<%if (!userPO.getHeader2().equals("")) {%>
    <TR>
		<TD align="CENTER" width="34%"></TD>
		<TD align="right" width="33%"><B>Selección :</B></TD>
		<TD align="left" width="33%"><% if (userPO.getHeader2().equals("U")) { 
				out.println("Usuario  " + userPO.getHeader21());  	
			   } else if (userPO.getHeader2().equals("N")) { 
			    out.println("Numero Interno  " + userPO.getHeader22());
			   } else if (userPO.getHeader2().equals("O")) { 
			    out.println("Operación  " + userPO.getHeader3());
			   } %>
		</TD>
	</TR>
	<%} %>
</TABLE> 
  
<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" class="TDBKG" width="33%">
			<a href="javascript:goDetail()"><b>Consultar</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="33%">
			<a href="javascript:goPDF()"><b>Lista<br>en PDF</b></a>
      	</TD>
	  	<TD align="CENTER" class="TDBKG" width="34%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE> 

<table  class="tableinfo" width="100%">
  
    <TR id=trdark> 
		<td NOWRAP align="center" width="2%"><B>Sel</B></td>
		<td NOWRAP align="left" width="98%"><B>Número	Interno / Usuario  /  Operación    /   Fecha</B></td>	
	</TR>
  </table>	

<%
	if ( ESS0260List.getNoResult() ) {
%>
 	<TABLE class="tbenter" width=100% height=30%">
 		<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center"> No hay registros que coincidan con su busqueda.</h4> 
      </div>
      </TD></TR>
   	</TABLE>
<%
	}
	else {
%>    

<center>
  <div id="dataDiv1" class="scbarcolor"  style="overflow-Y:scroll;height:400"> 
    <table id="dataTable"  style="font-size:7pt">  
    <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
    <tr id="trclear">
      <div id="container">
		<div id="content">
		<noscript><p><strong>Lo siento, esta pagina necesita JavaScript para funcionar</strong></p></noscript>
		<ul id="sitemap">
      <%
      	int records;
  			if (userPO.getType().equals("N") || userPO.getType().equals("U") )  {
				records = 100; 
    		} else {
    			records = 200;
    		}
      	boolean firstName = true;
      	int i = 0;
      	ESS0260List.initRow();
      	
      	while (ESS0260List.getNextRow()) {
      		datapro.eibs.beans.ESS026001Message msgList = (datapro.eibs.beans.ESS026001Message) ESS0260List.getRecord();
      		// Level 1
      		if (msgList.getE01TYR().trim().equals("H") || msgList.getE01TYR().trim().equals("U")) {
      			if (!firstName) {
   					out.println("</ul>");
   					out.println("</li>");
   				}	 
      			firstName = false;
      %>
      				<li><a href="#">
      						<input type="radio" name="CODE" value="<%= msgList.getE01MNPREF().trim() %>|<%= msgList.getE01MNPSEC().trim()%>">
      					</a>
      						<%=msgList.getE01MNPREF()%> -
      						<%=msgList.getE01MNPSEC()%> 
      						<%=msgList.getE01MNPUSR()%> -
      						<%=msgList.getD01MNPUSR()%> (Operación: 
      						<%=msgList.getE01MNPUSA()%>) (Fecha: 
      						<%=msgList.getE01MNPSDY()%> -
      						<%=msgList.getE01MNPSDM()%> -
      						<%=msgList.getE01MNPSDD()%>) (Programa :
      						<%=msgList.getD01MNPPRG()%>)
      												
      				<ul>	
      <%
       	    } 
       	    // Level 2
      		if (msgList.getE01TYR().trim().equals("D") && !firstName ) {
      %>
      				<li><a href="#">
      						<input type="radio" name="CODE" value="<%= msgList.getE01MNPREF().trim() %>|<%= msgList.getE01MNPSEC().trim()%>">
      					</a>
      						<%=msgList.getE01MNPREF()%> -
      						<%=msgList.getE01MNPSEC()%>
      						<%=msgList.getE01MNPUSR()%> -
      						<%=msgList.getD01MNPUSR()%> (operación: 
      						<%=msgList.getE01MNPUSA()%>) (Fecha: 
      						<%=msgList.getE01MNPSDY()%> -
      						<%=msgList.getE01MNPSDM()%> -
      						<%=msgList.getE01MNPSDD()%>) (Programa :
      						<%=msgList.getD01MNPPRG()%>)
      					
      				</li>	
       	    	<%
       	    }
       	 i++;   
      	}
      	if (!firstName) {
			out.println("</ul>");
			out.println("</li>");
			firstName = false;
      	}
      	%>
      	</ul>
		</div>
		</div>
		</tr>
	</table>
	</table>
  </div>
</center>

  <TABLE  class="tbenter" WIDTH="88%" ALIGN=CENTER>
	<TR>
		<TD WIDTH="50%" ALIGN=LEFT height="25">
       	<% 
    	if ( ESS0260List.getShowPrev() ) {
  			int pos = ESS0260List.getFirstRec() - records;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.security.JSESS0260?SCREEN=2&FromRecord=" + pos + "&SEARCHCDE=" + userPO.getHeader11() + "&SEARCHTYPE=" + userPO.getType() + 
  			"&E01REQTYP=" + userPO.getHeader1() +
  			"&E01REQORD=" + userPO.getHeader2() +
  			"&E01REQFRM=" + userPO.getHeader3() + 
  			"&E01REQDFD=" + userPO.getHeader4() +
  			"&E01REQDFM=" + userPO.getHeader5() +
  			"&E01REQDFY=" + userPO.getHeader6() +
  			"&E01REQDTD=" + userPO.getHeader7() +
  			"&E01REQDTM=" + userPO.getHeader8() +
  			"&E01REQDTY=" + userPO.getHeader9() +
  			
  			 "\" > <img src=\""+request.getContextPath()+"/images/s/Regresar.gif\" border=0></A>");
    	} %>
      	</TD>
 	  	<TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (ESS0260List.getShowNext()) {
  			int pos = ESS0260List.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.security.JSESS0260?SCREEN=2&FromRecord=" + pos + "&SEARCHCDE=" + userPO.getHeader11() + "&SEARCHTYPE=" + userPO.getType() +
  			"&E01REQTYP=" + userPO.getHeader1() + 
  			"&E01REQORD=" + userPO.getHeader2() +
  			"&E01REQFRM=" + userPO.getHeader3() + 
  			"&E01REQDFD=" + userPO.getHeader4() +
  			"&E01REQDFM=" + userPO.getHeader5() +
  			"&E01REQDFY=" + userPO.getHeader6() +
  			"&E01REQDTD=" + userPO.getHeader7() +
  			"&E01REQDTM=" + userPO.getHeader8() +
  			"&E01REQDTY=" + userPO.getHeader9() +
  			
  			 "\" ><img src=\""+request.getContextPath()+"/images/s/Avanzar.gif\" border=0></A>");
	    } %>
  		</TD>
 	</TR>
 </TABLE>

  
<BR>
<SCRIPT Language="javascript">
	document.forms[0].TOTROWS.value = <%= i%>;
	document.forms[0].NEXTROWS.value = <%= ESS0260List.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= ESS0260List.getFirstRec()%>;
</SCRIPT>

<%      
  }
%> 
</form>
</body>
</html>
