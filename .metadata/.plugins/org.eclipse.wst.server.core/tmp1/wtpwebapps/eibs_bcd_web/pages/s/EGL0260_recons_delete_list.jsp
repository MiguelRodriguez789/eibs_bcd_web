<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.Util, datapro.eibs.beans.EGL026001Message" %>
<title>Borra Transacciones de Cuentas Reconciliables</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "EGL0260List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "msg" class= "datapro.eibs.beans.EGL026001Message"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

function goDelete() {
	if (isCheck()) {
		if (confirm("¿ Desea Borrar el o los registros seleccionados ?")) {
			document.getElementById("SCREEN").value = "4";
			document.forms[0].submit();
		}
	} else {
		alert("Por Favor Seleccione un Registro!");
	}
} 

function isCheck() {
	var formLength = document.forms[0].elements.length;
   	var ok = false;
	for (n=0; n<formLength; n++) {
     	var element = document.forms[0].elements[n];
     	if (element.type == "checkbox") {
     		ok = document.forms[0].elements[n].checked;
     		if (ok) break;
     	}
    }
    return ok;
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

<h3 align="center">Borrar Transacciones de Cuentas Reconciliables
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="recons_delete_list.jsp, EGL0260"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEGL0260">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">

  <INPUT TYPE=HIDDEN NAME="E01TRABNK" VALUE="">
  <INPUT TYPE=HIDDEN NAME="E01TRABRN" VALUE="">
  <INPUT TYPE=HIDDEN NAME="E01TRACCY" VALUE="">
  <INPUT TYPE=HIDDEN NAME="E01TRAGLN" VALUE="">
  <INPUT TYPE=HIDDEN NAME="E01TRAACC" VALUE="">
  <INPUT TYPE=HIDDEN NAME="VIA" VALUE="">
  <INPUT TYPE=HIDDEN name="TOTROWS" value="0">
  <INPUT TYPE=HIDDEN name="NEXTROWS" value="0">
  <INPUT TYPE=HIDDEN name="CURRROWS" value="0">
    
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right"><b>C&oacute;digo de Banco : </b></div>
            </td>
            <td nowrap > 
              <input type="text" name="E01TRABNK" size="3" maxlength="2" value="<%= userPO.getBank() %>" readonly="readonly">
            </td>
            <td nowrap > 
              <div align="right"><b>N&uacute;mero de Sucursal : </b></div>
            </td>
            <td nowrap >
              <input type="text" name="E01TRABRN" size="5" maxlength="4" value="<%= userPO.getBranch() %>" readonly="readonly">
            </td>
            <td nowrap >
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap >
              <input type="text" name="E01TRACCY" size="4" maxlength="3" value="<%= userPO.getCurrency() %>" readonly="readonly">
			</td>
          </tr>
          <tr id="trdark">
            <td nowrap width="25%">
              <div align="right"><b>Cuenta Contable : </b></div>
            </td>
            <td nowrap colspan="2">
              <input type="text" name="E01TRAGLN" size="18" maxlength="16" onKeypress="enterInteger(event)" value="<%=userPO.getAccNum() %>" readonly="readonly">
			</td>
            <td nowrap width="25%">
              <div align="right"><b>Numero de Referencia : </b></div>
            </td>
            <td nowrap colspan="2"> 
              <input type="text" name="E01TRAACC" size="13" maxlength="12" onKeypress="enterInteger(event)" value="<%= userPO.getIdentifier() %>" readonly="readonly">
			</td>
          </tr>
          <tr id="trdark">
          </tr>
          <tr id="trdark">
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
<table  class="tbenter" width="100%">
	<tr bordercolor="#FFFFFF"> 
		<td nowrap> 
<%	 
	if ( EGL0260List.getNoResult() ) {
%>
	<TABLE class="tbenter" width="100%"> 
		<TR>
	  		<TD align="center" class="TDBKG" width="50%" nowrap><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></TD>
	  	    <TD align="center" class="TDBKG" width="50%" nowrap><a href="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEGL0260?SCREEN=1"><b>Regresar</b></a></TD>
		</TR>
	</TABLE>
 	<TABLE class="tbenter" width=100% height=30%">
 		<TR>
      		<TD>         
      			<div align="center"> <h4 style="text-align:center">No hay registros que mostrar para ser borrados.</h4> 
      			</div>
      		</TD></TR>
   	</TABLE>
<%
	} else {
%>    
	<TABLE class="tbenter" width="100%"> 
		<TR>
			<TD align="CENTER" class="TDBKG" width="20%"><a href="javascript:goDelete()"><b>Borrar</b></a></TD>
	  		<TD align="CENTER" class="TDBKG" width="20%"><a href="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEGL0260?SCREEN=1"><b>Regresar</b></a></TD>
		</TR>
	</TABLE> 

  <TABLE class="tableinfo" id="dataTable" width="100%">
    <TR id=trdark> 
		<td nowrap align="center" width="2%"><B>Sel</B></td>
		<Td ALIGN=CENTER width="10%" nowrap>Fecha Proceso</Td>
	    <Td ALIGN=CENTER width="10%" nowrap>Fecha Valor</Td>
	    <Td ALIGN=CENTER width="10%" nowrap>Lote</Td>
        <Td ALIGN=CENTER width="10%" nowrap>Codigo</Td>
        <Td ALIGN=CENTER width="10%" nowrap>DC</Td>
        <Td ALIGN=CENTER width="30%" nowrap>Descripci&oacute;n </Td>
        <Td ALIGN=CENTER width="15%" nowrap>Monto</Td>
	</TR>
    
	<%
    	  int i = 0;
          EGL0260List.initRow();    
          while (EGL0260List.getNextRow()) {
            EGL026001Message msgList = (EGL026001Message) EGL0260List.getRecord();
	%>              
    	<TR id=trclear>
			<td NOWRAP align="center" width="2%"><INPUT type="checkbox" name="E01ACT_<%= EGL0260List.getCurrentRow() %>" ></td>
			<td NOWRAP align="center" width="8%" ><FONT color="green"><%= Util.formatDate(msgList.getE01DATE21(),msgList.getE01DATE22(),msgList.getE01DATE23())%></FONT></td>
			<td NOWRAP align="center" width="8%" ><FONT color="green"><%= Util.formatDate(msgList.getE01DATE11(),msgList.getE01DATE12(),msgList.getE01DATE13())%></FONT></td>
			<td NOWRAP align="center" width="8%" ><%= msgList.getE01TRABTH() %></td>
			<td NOWRAP align="center" width="8%" ><%= msgList.getE01TRACDE() %></td>
			<td NOWRAP align="center" width="8%" ><%= msgList.getE01TRADCC() %></td>
			<td NOWRAP align="left" width="15%" ><%= msgList.getE01TRANAR() %></td>
			<td NOWRAP align="left" width="15%" ><%= msgList.getE01TRAAMT() %></td>
		</TR>
	<% 
       	 	i++; 
        } 
    %> 
  </TABLE>
  
<BR>

	<TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
	  <TR>
	  <TD WIDTH="50%" ALIGN=LEFT>
	<%
	        if ( EGL0260List.getShowPrev() ) {
	      			int pos = EGL0260List.getFirstRec() - 51;
	      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSEGL0260?SCREEN=2&Pos=" + pos + "\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/s/previous_records.gif\" ></A>");
	        }
	  %>  
	  </TD>
	  <TD WIDTH="50%" ALIGN=RIGHT>     
	 <%      
	        if ( EGL0260List.getShowNext() ) {
	      			int pos = EGL0260List.getLastRec();
	      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSEGL0260?SCREEN=2&Pos=" + pos + "\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/s/next_records.gif\" ></A>");
	        }
	   %> 
	   </TD>
	 	</TR>
	</TABLE>
<%      
  	}
%> 
		</TD>
	</TR>
</TABLE>
</form>
</body>
</html>
