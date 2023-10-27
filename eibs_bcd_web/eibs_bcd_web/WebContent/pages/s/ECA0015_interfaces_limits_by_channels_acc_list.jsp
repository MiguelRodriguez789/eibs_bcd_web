<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>

<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 



</head>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "msgList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
 
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
 

<SCRIPT type="text/javascript">

<%
if ( userPO.getOption().equals("RT") && userPO.getPurpose().equals("INQUIRY")) {
%>
	builtNewMenu(rt_i_opt);
<%   
}
else if ( userPO.getOption().equals("SV") && userPO.getPurpose().equals("INQUIRY")) {
%>
	builtNewMenu(sv_i_opt);
<%   
}
%>

var ok = false;

function goExit() {
	document.forms[0].SCREEN.value="12";
	<%if(userPO.getOption().equals("SV")){%>
		document.forms[0].SCREEN.value="13";
	<%}%>	
	document.forms[0].submit();
}

function goNew() {
	document.forms[0].SCREEN.value="7";
	document.forms[0].submit();
}

function goProcess() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un Registro!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="8";
	document.forms[0].submit();
}


function goDelete() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccione el Registro a borrar!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="9";
	if (!confirm("Desea borrar el Registro seleccionado?")) {
		return;
	}
	document.forms[0].submit();
} 

function goSearch() {
	if (getElement("SEARCHCDE").value == "") {
		alert("Favor digitar un C�digo para posicionarse en la lista!!!");
		return;
	}
	getElement("SCREEN").value="6";
	document.forms[0].submit();
}

function isCheck() {
	var formLength= document.forms[0].elements.length;
   	ok = false;
	for(n=0;n<formLength;n++) {
     	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "ROW") {
			if (document.forms[0].elements[n].checked == true) {
				ok = true;
        		break;
			}
      	}
    }
}


function setKey(bnk,ccy,cnl,vnd,trn,acc) {

	getElement("E01ILBBNK").value = bnk;
	getElement("E01ILBCCY").value = ccy;
	getElement("E01ILBCNL").value = cnl;
	getElement("E01ILBVND").value = vnd;
	getElement("E01ILBTRN").value = trn;
	getElement("E01ILBACC").value = acc;

}

function doPrint(){
    window.focus();
	if (document.queryCommandSupported("print")) {
		document.execCommand('print', false, null);
    } else {
 		window.print();
	}
	return;
}


</SCRIPT>


<% 
 if ( !error.getERRNUM().equals("0")  ) { 
     out.println("<SCRIPT Language=\"Javascript\">");
	 error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 out.println("<SCRIPT> initMenu(); </SCRIPT>");
%>

<h3 align="center">Limites por Canal<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="interfaces_limits_by_channels_acc_list.jsp, ECA0015"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.interfaces.JSECA0015">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="6">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">
   <INPUT TYPE=HIDDEN NAME="E01ILBBNK" VALUE=" ">
  <INPUT TYPE=HIDDEN NAME="E01ILBCCY" VALUE=" ">
  <INPUT TYPE=HIDDEN NAME="E01ILBCNL" VALUE=" ">
  <INPUT TYPE=HIDDEN NAME="E01ILBVND" VALUE=" ">
  <INPUT TYPE=HIDDEN NAME="E01ILBTRN" VALUE=" ">
  <INPUT TYPE=HIDDEN NAME="E01ILBACC" VALUE="0">
  <INPUT TYPE="HIDDEN" name="SEARCHTYPE" id="SEARCHTYPE" value="<%= userPO.getType() %>">

 <h4>Informaci&oacute;n Basica</h4>
  
 	<table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E01ILBCUM" size="10" maxlength="9" readonly value="<%= userPO.getCusNum().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="D01ILBCUN" size="65" maxlength="50" readonly value="<%= userPO.getCusName().trim()%>">
              </div>
            </td>
          </tr>

          	<tr id="trclear">
				<td nowrap width=13% align="right">Banco : </td>
				<td nowrap width=20% align="left">
					<input type="text" name="E01ILBBNK" size="3" maxlength="2" value="<%= userPO.getBank().trim() %>" readonly>
				</td>
            	<td nowrap width=13% align="right">Moneda : </td>
            	<td nowrap width=20% align="left">
            		<input type="text" name="E01ILBCCY" size="5" maxlength="4" value="<%= userPO.getCurrency().trim() %>" readonly>
       			</td>
				<td nowrap width=14% align="right">Cuenta: </td>
				<td nowrap width=20% align="left"><input type="text" name="E01ILBACC" size="15" maxlength="12" value="<%= userPO.getAccNum().trim() %>" readonly>
				</td>
	  		</tr>

   		</table> 
      </td>  
    </tr>
  </table>

<% 
 if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
%>

<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:goNew()"><b>Crear</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:goProcess()"><b>Modificar</b></a>
      	</TD>
      	<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:doPrint()"><b>Imprimir</b></a>
      	</TD>
      	<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:goDelete()"><b>Borrar</b></a>
      	</TD>
	  	<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:goExit()"><b>Salir</b></a>
	  	</TD>
	  
	</TR>
</TABLE> 

<%      
  } else {
%> 

<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" class="TDBKG" width="50%">
			<a href="javascript:goProcess()"><b>Consultar</b></a>
      	</TD>
     </TR>
</TABLE>  

<%
  }	 
	if ( msgList.getNoResult() ) {
%>
 	<TABLE class="tbenter" width=100% height=30%">
 		<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center"> No hay Registros.</h4></div>
      </TD></TR>
   	</TABLE>
<%
	}
	else {
%>    
    
  <table  class="tableinfo" width="100%">
  
    <TR id=trdark> 
		<td NOWRAP align="center" width="5%"><B>Sel</B></td>
		<td NOWRAP align="center" width="5%"><B>Banco</B></td>
		<TD nowrap align="center" width="20%"><B>Canal</B></TD>
		<TD nowrap align="center" width="15%"><B>Proveedor</B></TD>
		<TD nowrap align="center" width="15%"><B>Transaccion</B></TD>
		<TD nowrap align="center" width="10%"><B>Numero <br> Diario</B></TD>
		<TD nowrap align="center" width="10%"><B>Monto <br> Diario</B></TD>
		<TD nowrap align="center" width="10%"><B>Numero <br> Mensual</B></TD>
		<TD nowrap align="center" width="10%"><B>Monto <br> Mensual</B></TD>
		<TD nowrap align="center" width="10%"><B>Comisiones <br> Exentas</B></TD>
	</TR>
        <%
    	  int i = 0;
          msgList.initRow();    
          while (msgList.getNextRow()) {
            ECA001501Message msgRcd = (ECA001501Message) msgList.getRecord(); 
		%>              
    <TR id=trclear>
    
		<td NOWRAP align="center" width="5%"> 
            <INPUT type="radio" name="ROW" value="<%= msgList.getCurrentRow() %>" onClick="setKey('<%=msgRcd.getE01ILBBNK()%>','<%= msgRcd.getE01ILBCCY() %>','<%= msgRcd.getE01ILBCNL() %>','<%= msgRcd.getE01ILBVND() %>','<%= msgRcd.getE01ILBTRN() %>','<%= msgRcd.getE01ILBACC() %>')">
		</td>
		<td NOWRAP align="center" width="5%"><%= msgRcd.getE01ILBBNK()%></td>
		<td NOWRAP align="left" width="20%" ><%= msgRcd.getE01ILBCNL()%>   <%= msgRcd.getD01ILBCNL()%></td>
		<td NOWRAP align="left" width="15%" ><%= msgRcd.getE01ILBVND()%>   <%= msgRcd.getD01ILBVND()%></td>
		<td NOWRAP align="left" width="15%" ><%= msgRcd.getE01ILBTRN()%>   <%= msgRcd.getD01ILBTRN()%></td>
		<td NOWRAP align="right" width="10%" ><%= msgRcd.getE01ILBTRD()%></td>
		<td NOWRAP align="right" width="10%" ><%= msgRcd.getE01ILBAMD()%></td>
		<td NOWRAP align="right" width="10%" ><%= msgRcd.getE01ILBTRM()%></td>
		<td NOWRAP align="right" width="10%" ><%= msgRcd.getE01ILBAMM()%></td>
		<td NOWRAP align="right" width="10%" ><%= msgRcd.getE01ILBTEX()%></td>
	</TR>
       <% 
       	 i++; 
        } 
       %> 
  </TABLE>
  
  <TABLE  class="tbenter" WIDTH="88%" ALIGN=CENTER>
   	 <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25">
       <% 
		int screen = 6;
		if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
			screen = 1;
		} 
    	if ( msgList.getShowPrev() ) {
  			int pos = msgList.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.interfaces.JSECA0015?SCREEN="+screen + "&RECTYP=" + userPO.getHeader10() + "&FromRecord=" + pos + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (msgList.getShowNext()) {
  			int pos = msgList.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.interfaces.JSECA0015?SCREEN="+screen + "&RECTYP=" + userPO.getHeader10() +"&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
	    } %>
  </TD>
 </TR>
 </TABLE>
  
<BR>
<SCRIPT type="text/javascript">
	document.forms[0].TOTROWS.value = <%= i%>;
	document.forms[0].NEXTROWS.value = <%= msgList.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= msgList.getFirstRec()%>;
</SCRIPT>
<%      
  }
%> 
</form>
</body>
</html>
