<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import = "java.io.*,java.net.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*" %>

<html>
<head>
<title>Mensajes de Alerta</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id= "rtInst" class= "datapro.eibs.beans.ESD005001Message"  scope="session" />
<jsp:useBean id= "spInst" class= "datapro.eibs.beans.ESD005003Message"  scope="session" />
<jsp:useBean id= "ESD005001List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

<% if(userPO.getPurpose().equals("INQUIRY")) {%>
   <% if ( userPO.getOption().equals("RT") ) {%>
         builtNewMenu(rt_i_opt);
     <%}else if ( userPO.getOption().equals("SV") ) {%>
	            builtNewMenu(sv_i_opt);
     <%}else if ( userPO.getOption().equals("LN") ) {%>
   		        <%if ( userPO.getHeader23().equals("G") ||  userPO.getHeader23().equals("V")){ %>
	                 builtNewMenu(ln_i_1_opt);
                <% } else  { %>
	                 builtNewMenu(ln_i_2_opt);
                <% } %>
     <%}else if ( userPO.getOption().equals("CD") ) {%>
	            builtNewMenu(cd_i_opt);
	            initMenu();
     <%}else if ( userPO.getOption().equals("C1") ) {%>
   		        <%if ( userPO.getCusType().equals("1") ){ %>
	                 builtNewMenu(client_inq_corp_opt);
                <% } else  { %>
	                 builtNewMenu(client_inq_personal_opt);
                <% } %>
     <%}%>
<%}%>      




function goNew() {
	document.forms[0].SCREEN.value="2";
	document.forms[0].submit();
}

function goProcess() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un código!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="4";
	document.forms[0].submit();
}

function goInquiry() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un código!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="5";
	document.forms[0].submit();
}


function isCheck() {
	var formLength= document.forms[0].elements.length;
   	ok = false;
	for(n=0;n<formLength;n++) {
     	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "CODE") {
			if (document.forms[0].elements[n].checked == true) {
				getElement("E01WNMNME").value = document.forms[0].elements[n].value;
				getElement("E01WNMSEQ").value = document.forms[0].elements[n].value;		
				ok = true;
        		break;
			}
      	}
    }
}

function goExpiredMessages() {
	document.forms[0].SCREEN.value="50";
	document.forms[0].submit();
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
<h3 align="center">Mensajes de Alerta
<%	if(userPO.getOption().equals("RA")){%>
	 Cuentas Corrientes
	 <%}else if(userPO.getOption().equals("SV")){%>
	 Cuentas de Ahorro
	<%}else if(userPO.getOption().equals("CD")){%>
	 Depositos a Plazo
	<%}else if(userPO.getOption().equals("LN")){%>
	 Prestamos
	<%}else if(userPO.getOption().equals("C1")){%>
	 Clientes
	<%}%>

<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_alert_messages_1.jsp, ESD0050"></h3>
<hr size="4">
 <FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.alerts.JSESD0050" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="22">
    <INPUT TYPE=HIDDEN NAME="E01WNMNME" VALUE="">
    <INPUT TYPE=HIDDEN NAME="E01WNMSEQ" VALUE="">
  </p>
  
<table  class="tableinfo">
   <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
         <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
            <tr id="trdark"> 
               <td nowrap width="10%" > 
                  <div align="right"><b>Cliente :</b></div>
               </td>
               <td nowrap width="10%"> 
                  <div align="left">
                     <input type="text" name="E01WNMCUN" size="9" maxlength="9" readonly value="<%= spInst.getE03WNMCUN().trim()%>">
                  </div>
               </td>
               <td nowrap width="10%" > 
                  <div align="right"><b>Nombre :</b></div>
               </td>
               <td nowrap width="40%"> 
                  <div align="left">
                     <font face="Arial">
                        <font size="2">
                           <input type="text" name="E01WNMNA1" size="45" maxlength="45" readonly value="<%= spInst.getE03WNMCUM().trim()%>">
                        </font>
                     </font>
                  </div>
               </td>
               <td nowrap width="10%"> 
                  <div align="left">
                  </div>
               </td>
               <td nowrap width="20%"> 
                  <div align="left">
                  </div>
               </td>
            </tr>
            <% if (!userPO.getOption().equals("C1")){%>
            <tr id="trdark"> 
               <td nowrap width="10%"> 
                  <div align="right"><b>Cuenta :</b></div>
               </td>
               <td nowrap width="10%"> 
                  <div align="left">
                     <input type="text" name="E01WNMACC" size="12" maxlength="12" readonly value="<%= spInst.getE03WNMACC().trim()%>">
                  </div>
               </td>
               <td nowrap width="10%"> 
                  <div align="right"><b>Moneda : </b></div>
               </td>
               <td nowrap width="40%"> 
                  <div align="left">
                     <b><input type="text" name="E01WNMCCY" size="3" maxlength="3" readonly value="<%= spInst.getE03WNMCCY().trim()%>" ></b>
                  </div>
               </td>
               <td nowrap width="10%"> 
                  <div align="right"><b>Producto : </b></div>
               </td>
               <td nowrap width="20%"> 
                  <div align="left"><b><input type="text" name="E01WNMPRO" size="4" maxlength="4" readonly value="<%= spInst.getE03WNMPRO().trim()%>"></b>
                  </div>
               </td>
            </tr>
            <%}%>
         </table>
      </td>
   </tr>
</table>


<% if ( ESD005001List.getNoResult() ) { %>
<% if (!userPO.getPurpose().equals("INQUIRY")) { %>
<TABLE class="tbenter"> 
   <TR>
		<TD align="CENTER" class="TDBKG" width="25%">
			<a href="javascript:goNew()"><b>Crear</b></a>
		</TD>
	  	<TD align="CENTER" class="TDBKG" width="25%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE>
<% } %>

<TABLE class="tbenter" width=100% height=30%">
   <TR>
      <TD>         
         <div align="center"> <h4 style="text-align:center"> No hay Mensajes Registrados</h4></div>
      </TD>
   </TR>
</TABLE>

<% } else { %>   


<% if(userPO.getPurpose().equals("INQUIRY")) { %>
<TABLE class="tbenter"> 
   <TR>
		<TD align="CENTER" class="TDBKG" width="35%">
			<a href="javascript:goInquiry()"><b>Consultar</b></a>
		</TD>
		<TD align="CENTER" class="TDBKG" width="35%">
			<a href="javascript:goExpiredMessages()"><b>Mensajes Vencidos</b></a>
		</TD>		
	  	<TD align="CENTER" class="TDBKG" width="30%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE>

<% }else{ %> 
  
<TABLE class="tbenter"> 
   <TR>
		<TD align="CENTER" class="TDBKG" width="25%">
			<a href="javascript:goNew()"><b>Crear</b></a>
		</TD>
		<TD align="CENTER" class="TDBKG" width="24%">
			<a href="javascript:goProcess()"><b>Modificar</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="25%">
			<a href="javascript:goExpiredMessages()"><b>Mensajes Vencidos</b></a>
		</TD>	      	
	  	<TD align="CENTER" class="TDBKG" width="25%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE>


<% } %>

<table  class="tableinfo" width="100%">
   <TR id=trdark> 
      <td NOWRAP align="center" width="5%"><B>Sel</B></td>
	  <td NOWRAP align="center" width="10%"><B>Tipo</B></td>
	  <td NOWRAP align="center" width="30%"><B>Resumen</B></td>
	  <td NOWRAP align="center" width="35%"><B>Motivo</B></td>
	  <td NOWRAP align="center" width="10%"><B>Estado</B></td>
	  <td nowrap align="center" width="10%"><B>Vencimiento</B></td>
   </TR>
   
   <%
      int i = 0;
      ESD005001List.initRow();    
      while (ESD005001List.getNextRow()) {
      ESD005001Message msgList = (ESD005001Message) ESD005001List.getRecord(); 
   %>  
   <TR>          
   <td NOWRAP align="center" width="5%"><INPUT type="radio" name="CODE" value="<%= msgList.getE01WNMSEQ() %>"></td>
   <%String tipo = "";
   	if (msgList.getE01WNMTYP().equals("3")){
   		tipo = "Informativo";
   	}else if (msgList.getE01WNMTYP().equals("1")){
   		tipo = "Restrictivo";
   	}else{
   		tipo = "Autorizado";
   	} 
   %>
   <td NOWRAP align="left" width="10%" ><%=tipo %> </td>
   <td NOWRAP align="left" width="30%" ><%= msgList.getE01WNMDSC() %></td>
   <td NOWRAP align="left" width="30%" ><%= msgList.getE01WNMMOD() %></td>
   <td NOWRAP align="left" width="10%" ><%= msgList.getE01WNMSTD() %></td>
   <td NOWRAP align="left" width="10%" ><%=datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),
  																					msgList.getBigDecimalE01WNMFVM().intValue(),
  																					msgList.getBigDecimalE01WNMFVD().intValue(),
  																					msgList.getBigDecimalE01WNMFVY().intValue())%>
   </td></TR>																					
   <% 
      i++; 
      } 
   %>
      
</table>

<SCRIPT type="text/javascript">
	document.forms[0].TOTROWS.value = <%= i%>;
	document.forms[0].NEXTROWS.value = <%= ESD005001List.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= ESD005001List.getFirstRec()%>;
</SCRIPT>


<%      
   }
%> 
 




</form>
</body>
</html>
