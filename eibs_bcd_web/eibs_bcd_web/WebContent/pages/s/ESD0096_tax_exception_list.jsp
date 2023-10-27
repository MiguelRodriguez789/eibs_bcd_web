<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import = "java.io.*,java.net.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*" %>

<html>
<head>
<title>Excepcion de Impuestos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "hdList" class= "datapro.eibs.beans.ESD009601Message"  scope="session" />
<jsp:useBean id= "dtList" class= "datapro.eibs.beans.ESD009602Message"  scope="session" />
<jsp:useBean id= "ESD009602List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">


function goNew() {
	document.forms[0].SCREEN.value="3";
	document.forms[0].submit();
}

function goMaintenance() {
	isCheck();
	if ( !ok ) {
		alert("Realizar alguna seleccion!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="5";
	document.forms[0].submit();
}

function goInquiry() {
	isCheck();
	if ( !ok ) {
		alert("Realizar alguna seleccion!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="6";
	document.forms[0].submit();
}

function goDelete() {
	isCheck();
	if ( !ok ) {
		alert("Realizar alguna seleccion!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="7";
	document.forms[0].submit();
}

function isCheck() {
	var formLength= document.forms[0].elements.length;
   	ok = false;
	for(n=0;n<formLength;n++) {
     	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "CODE") {
			if (document.forms[0].elements[n].checked == true) {
     		   var values = document.forms[0].elements[n].value.split('|');
			   getElement("E02TXEATY").value = values[0];
			   getElement("E02TXETYP").value = values[1];
			   getElement("E02TXETTP").value = values[2];
			   getElement("E02TXEACC").value = values[3];

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
   out.println("<SCRIPT> initMenu(); </SCRIPT>");

%> 
<h3 align="center">Excepciones de Impuestos

<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="tax_exception_list.jsp, ESD0096"></h3>
<hr size="4">
 <FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.taxes.JSESD0096" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
    <INPUT TYPE=HIDDEN NAME="E02TXEATY" VALUE="">
    <INPUT TYPE=HIDDEN NAME="E02TXETYP" VALUE="">
    <INPUT TYPE=HIDDEN NAME="E02TXETTP" VALUE="">
    <INPUT TYPE=HIDDEN NAME="E02TXEACC" VALUE="">

  </p>
  
<table  class="tableinfo">
   <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
         <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
            <tr id="trdark"> 
               <td nowrap width="10%" > 
                  <div align="right"><b>Cliente :</b></div>
               </td>
               <td nowrap width="30%"> 
                  <div align="left">
                     <input type="text" name="E01CUSCUN" size="9" maxlength="9" readonly value="<%= hdList.getE01CUSCUN().trim()%>">
                  </div>
               </td>
               <td nowrap width="10%"> 
                  <div align="left">
                  </div>
               </td>
               <td nowrap width="10%"> 
                  <div align="left">
                  </div>
               </td>
               <td nowrap width="10%" > 
                  <div align="right"><b>Nombre :</b></div>
               </td>
               <td nowrap width="30%"> 
                  <div align="left">
                     <font face="Arial">
                        <font size="2">
                           <input type="text" name="E01CUSNA1" size="45" maxlength="45" readonly value="<%= hdList.getE01CUSNA1().trim()%>">
                        </font>
                     </font>
                  </div>
               </td>
            </tr>
            <tr id="trclear"> 
               <td nowrap width="15%"> 
                  <div align="right"><b>Tipo Legal :</b></div>
               </td>
               <td nowrap width="25%"> 
                  <div align="left">
                     <input type="text" name="D01CUSLGT" size="45" maxlength="45" readonly value="<%= hdList.getD01CUSLGT().trim()%>">
                  </div>
               </td>
               <td nowrap width="10%"> 
                  <div align="right"></div>
               </td>
               <td nowrap width="10%"> 
                  <div align="left">
                  </div>
               </td>
               <td nowrap width="15%"> 
                  <div align="right"><b>Estado : </b></div>
               </td>
               <td nowrap width="25%"> 
                  <div align="left"><b><input type="text" name="D01CUSSTS" size="45" maxlength="45" readonly value="<%= hdList.getD01CUSSTS().trim()%>"></b>
                  </div>
               </td>
            </tr>
            <tr id="trdark"> 
               <td nowrap width="15%"> 
                  <div align="right"><b>ID :</b></div>
               </td>
               <td nowrap width="25%"> 
                  <div align="left">
           	         <b><%=hdList.getE01CUSPID().trim()%> - <%=hdList.getE01CUSTID().trim()%> - <%= hdList.getE01CUSIDN().trim()%></b> 
                  </div>
               </td>
               <td nowrap width="10%"> 
                  <div align="right"></div>
               </td>
               <td nowrap width="10%"> 
                  <div align="left">
                  </div>
               </td>
               <td nowrap width="15%"> 
                  <div align="right"><b></b></div>
               </td>
               <td nowrap width="25%"> 
               </td>
            </tr>

         </table>
      </td>
   </tr>
</table>
   
<TABLE class="tbenter"> 
   <TR>
		<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:goNew()"><b>Crear</b></a>
		</TD>
		<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:goMaintenance()"><b>Modificar</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:goInquiry()"><b>Consultar</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:goDelete()"><b>Eliminar</b></a>
      	</TD>
	  	<TD align="CENTER" class="TDBKG" width="20%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE>


<%
   if ( ESD009602List.getNoResult() ) {
%>
<TABLE class="tbenter" width=100% height=30%">
   <TR>
      <TD>         
         <div align="center"> <h4 style="text-align:center"> No hay Registros Activos</h4></div>
      </TD>
   </TR>
</TABLE>

<%
   }
   else
   {
%>   

<table  class="tableinfo" width="100%">
   <TR id=trdark> 
      <td NOWRAP align="center" width="5%"><B>Sel</B></td>
	  <td NOWRAP align="center" width="5%"><B>Tipo Producto</B></td>
	  <td NOWRAP align="center" width="10%"><B>Tipo de Impuesto</B></td>
	  <td NOWRAP align="center" width="10%"><B>Impuesto</B></td>
	  <td NOWRAP align="center" width="20%"><B>Cuenta/Contrato</B></td>
	  <td NOWRAP align="center" width="25%"><B>Norma</B></td>
	  <td NOWRAP align="center" width="25%"><B>Concepto</B></td>
   </TR>
   
   <%
      int i = 0;
      ESD009602List.initRow();    
      while (ESD009602List.getNextRow()) {
      ESD009602Message msgList = (ESD009602Message) ESD009602List.getRecord(); 
   %>  
   <TR>          
   <td NOWRAP align="center" width="5%"><INPUT type="radio" name="CODE" value="<%= msgList.getE02TXEATY() %>|<%= msgList.getE02TXETYP() %>|<%= msgList.getE02TXETTP() %>|<%= msgList.getE02TXEACC() %>"></td>
   <td NOWRAP align="center" width="5%" ><%= msgList.getE02TXEATY() %> </td>
   <td NOWRAP align="center" width="10%" ><%= msgList.getE02TXETYP() %></td>
   <td NOWRAP align="center" width="10%" ><%= msgList.getE02TXETTP() %></td>
   <td NOWRAP align="left" width="20%" ><%= msgList.getE02TXEACC() %></td>
   <td NOWRAP align="left" width="25%" ><%= msgList.getD02TXETYE() %></td>
   <td NOWRAP align="left" width="25%" ><%= msgList.getE02TXEDSC() %></td>

</TR>																					
   <% 
      i++; 
      } 
   %>
      
</table>

<SCRIPT Language="javascript">
	document.forms[0].TOTROWS.value = <%= i%>;
	document.forms[0].NEXTROWS.value = <%= ESD009602List.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= ESD009602List.getFirstRec()%>;
</SCRIPT>


<%      
   }
%> 
 




</form>
</body>
</html>
