<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import = "java.io.*,java.net.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*" %>

<html>
<head>
<title>Impuesto NIIF 9</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EDL1540List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">


function goAction() {
	document.forms[0].SCREEN.value="39";
	document.forms[0].submit();
}


function goNew() {
	document.forms[0].SCREEN.value="41";
	document.forms[0].submit();
}

function goMaintenance() {
	isCheck();
	if ( !ok ) {
		alert("Realizar alguna seleccion!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="42";
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
	document.forms[0].SCREEN.value="44";
	if (confirm("Desea eliminar este registro seleccionado?")) {
		document.forms[0].submit();		
    }

}

function isCheck() 
{
	var formLength= document.forms[0].elements.length;
   	ok = false;
	for(n=0;n<formLength;n++) 
	{
     	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "ROW") 
      	{
			if (document.forms[0].elements[n].checked == true) 
			{
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
<h3 align="center">Impuesto NIIF 9

<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="tariff_list.jsp, EDL1540"></h3>
<hr size="4">
 <FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.misc.JSEDL1540" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="42">
   </p>
  
<table  class="tableinfo">
   <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
         <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
            <tr id="trdark"> 
               <td nowrap width="10%" > 
                  <div align="right"><b>Banco</b></div>
               </td>
               <td nowrap width="30%"> 
                  <div align="left">
                     <input type="text" name="BANK" size="4" maxlength="4" readonly value="<%= userPO.getBank().trim()%>">
                  </div>
               </td>
               <td nowrap width="10%" > 
                  <div align="right"><b>Año :</b></div>
               </td>
               <td nowrap width="30%"> 
                  <div align="left">
                     <input type="text" name="YEAR" size="4" maxlength="4" readonly value="<%= userPO.getHeader1().trim()%>">
                  </div>
               </td>               
			   <td nowrap width="10%" > 
                </td>
               <td nowrap width="30%"> 
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
			<a href="javascript:goDelete()"><b>Borrar</b></a>
      	</TD>
	  	<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:goAction()"><b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE>


<%
   if ( EDL1540List.getNoResult() ) {
%>
<TABLE class="tbenter" width=100% height=30%">
   <TR>
      <TD>         
         <div align="center"> <h4 style="text-align:center"> No hay Registros.</h4></div>
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
      <td NOWRAP align="center" width="20%"><B>Sel</B></td>
	  <td NOWRAP align="center" width="30%"><B>Mes</B></td>
	  <td NOWRAP align="center" width="50%"><B>Vr Tarifa</B></td>
   </TR>
   
   <%
      int i = 0;
      EDL1540List.initRow();    
      while (EDL1540List.getNextRow()) {
      EDL154003Message msgList = (EDL154003Message) EDL1540List.getRecord(); 
   %>  
   <TR> 
    <td NOWRAP  align=CENTER width="10%"> 
       <INPUT TYPE="radio" name="ROW"  value="<%= EDL1540List.getCurrentRow()%>" >
    </td>         
   <td NOWRAP align="center" width="30%" ><%= msgList.getE03VDM() %> </td>
   <td NOWRAP align="center" width="50%" ><%= msgList.getE03PRC() %></td>

</TR>																					
   <% 
      i++; 
      } 
   %>
      
</table>

<SCRIPT Language="javascript">
	document.forms[0].TOTROWS.value = <%= i%>;
	document.forms[0].NEXTROWS.value = <%= EDL1540List.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= EDL1540List.getFirstRec()%>;
</SCRIPT>


<%      
   }
%> 
 




</form>
</body>
</html>
