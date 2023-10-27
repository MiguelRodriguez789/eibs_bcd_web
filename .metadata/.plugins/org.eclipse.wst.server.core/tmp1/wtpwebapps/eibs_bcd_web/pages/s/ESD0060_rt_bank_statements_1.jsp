<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import = "java.io.*,java.net.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*" %>

<html>
<head>
<title>Parametros Extractos Cuentas Corrientes/Ahorros</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id= "rtExtra" class= "datapro.eibs.beans.ESD006001Message"  scope="session" />
<jsp:useBean id= "ESD006002List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">



function goNew() {
	document.forms[0].SCREEN.value="502";
	document.forms[0].submit();
}

function goProcess() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un código!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="504";
	document.forms[0].submit();
}

function goInqury() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un código!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="505";
	document.forms[0].submit();
}

function goDelete() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un código!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="506";
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
			   getElement("E02DDSTYP").value = values[0];
			   getElement("E02ACMATY").value = values[1];
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
<h3 align="center">Parámetros Extractos Cuentas 

<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_bank_statements_1.jsp, ESD0060"></h3>
<hr size="4">
 <FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0031" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="502">
    <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
    <INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
    <INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">

    <INPUT TYPE=HIDDEN NAME="E02DDSTYP" value="E02DDSTYP">
    <INPUT TYPE=HIDDEN NAME="E02ACMATY" value="E02ACMATY">
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
                     <input type="text" name="E01DDSCUN" size="9" maxlength="9" readonly value="<%= rtExtra.getE01DDSCUN().trim()%>">
                  </div>
               </td>
               <td nowrap width="10%" > 
                  <div align="right"><b>Nombre :</b></div>
               </td>
               <td nowrap width="30%"> 
                  <div align="left">
                     <font face="Arial">
                        <font size="2">
                           <input type="text" name="D01CUSNA1" size="45" maxlength="45" readonly value="<%= rtExtra.getD01CUSNA1().trim()%>">
                        </font>
                     </font>
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
            </tr>
            <tr id="trdark"> 
               <td nowrap width="15%"> 
                  <div align="right"><b>Cuenta :</b></div>
               </td>
               <td nowrap width="30%"> 
                  <div align="left">
                     <input type="text" name="E01DDSACC" size="12" maxlength="12" readonly value="<%= rtExtra.getE01DDSACC().trim()%>">
                  </div>
               </td>
               <td nowrap width="15%"> 
                  <div align="right"><b>Moneda : </b></div>
               </td>
               <td nowrap width="30%"> 
                  <div align="left">
                     <b><input type="text" name="E01DDSCCY" size="3" maxlength="3" readonly value="<%= rtExtra.getE01DDSCCY().trim()%>"></b>
                  </div>
               </td>
               <td nowrap width="10%"> 
                  <div align="right"><b>Producto : </b></div>
               </td>
               <td nowrap width="10%"> 
                  <div align="left"><b><input type="text" name="E01ACMPRO" size="4" maxlength="4" readonly value="<%= rtExtra.getE01ACMPRO().trim()%>"></b>
                  </div>
               </td>
            </tr>
         </table>
      </td>
   </tr>
</table>

  
<TABLE class="tbenter"> 
   <TR>
		<TD align="CENTER" class="TDBKG" width="25%">
			<a href="javascript:goNew()"><b>Crear</b></a>
		</TD>
		<TD align="CENTER" class="TDBKG" width="25%">
			<a href="javascript:goProcess()"><b>Modificar</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="25%">
			<a href="javascript:goDelete()"><b>Borrar</b></a>
		</TD>
	  	<TD align="CENTER" class="TDBKG" width="25%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE>



<%
   if ( ESD006002List.getNoResult() ) {
%>
<TABLE class="tbenter" width=100% height=30%">
   <TR>
      <TD>         
         <div align="center"> <h4 style="text-align:center"> No Se Encontraron Registros Activos</h4></div>
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
      <td NOWRAP align="center" width="10%"><B>Opcion</B></td>
	  <td NOWRAP align="center" width="15%"><B>Tipo</B></td>
	  <td NOWRAP align="center" width="75%"><B>Descripcion</B></td>
  </TR>
   
   <%
      int i = 0;
      ESD006002List.initRow();    
      while (ESD006002List.getNextRow()) {
      ESD006002Message msgList = (ESD006002Message) ESD006002List.getRecord(); 
   %>  
   <TR>          
   <td NOWRAP align="center" width="10%"><INPUT type="radio" name="CODE" value="<%= msgList.getE02DDSTYP() %>|<%= msgList.getE02ACMATY() %>"></td>
   <td NOWRAP align="left" width="15%" ><%= msgList.getE02DDSTYP() %> </td>
   <td NOWRAP align="left" width="75%" ><%= msgList.getD02DDSDSC() %></td>
</TR>																					
   <% 
      i++; 
      } 
   %>
      
</table>

  <TABLE  class="tbenter" WIDTH="88%" ALIGN=CENTER>
   	 <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> <%
    	if ( ESD006002List.getShowPrev() ) {
  			int pos = ESD006002List.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.params.JSESD0031?SCREEN=501&FromRecord=" + pos + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    } %>     
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> <%       
    	if (ESD006002List.getShowNext()) {
  			int pos = ESD006002List.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.params.JSESD0031?SCREEN=501&FromRecord=" + pos +  "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
	    } %>

  </TD>
 </TR>
 </TABLE>


<SCRIPT type="text/javascript">
	document.forms[0].TOTROWS.value = <%= i%>;
	document.forms[0].NEXTROWS.value = <%= ESD006002List.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= ESD006002List.getFirstRec()%>;
</SCRIPT>


<%      
   }
%> 
 




</form>
</body>
</html>
