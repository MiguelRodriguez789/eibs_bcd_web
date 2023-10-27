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



function goInquiry() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un código!!!");
		return;	 
	}
    nme1 = document.forms[0].E01WNMNME.value;
    acc1 = document.forms[0].E01WNMACC.value;
    acd1 = document.forms[0].E01WNMACD.value;
 	var page = "<%=request.getContextPath()%>/servlet/datapro.eibs.alerts.JSESD0050?SCREEN=6&E01WNMACC="+ acc1 + "&E01WNMACD=" + acd1+ "&E01WNMNME=" + nme1;
    CenterWindow(page, 1000, 300, 2);

}

function showInfo(acc,acd){
   document.forms[0].E01WNMACC.value = acc;
   document.forms[0].E01WNMACD.value = acd;
} 


function isCheck() {
	var formLength= document.forms[0].elements.length;
   	ok = false;
	for(n=0;n<formLength;n++) {
     	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "CODE") {
			if (document.forms[0].elements[n].checked == true) {
				getElement("E01WNMNME").value = document.forms[0].elements[n].value;
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
<h3 align="center">Mensajes de Alerta
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_alert_messages_4.jsp, ESD0050"></h3>
<hr size="4">
 <FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.alerts.JSESD0050" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="22">
    <INPUT TYPE=HIDDEN NAME="E01WNMNME" VALUE="">
    <INPUT TYPE=HIDDEN NAME="E01WNMACC" VALUE="">
    <INPUT TYPE=HIDDEN NAME="E01WNMACD" VALUE="">
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
         </table>
      </td>
   </tr>
</table>

<%
   if ( ESD005001List.getNoResult() ) {
%>
<TABLE class="tbenter" width=100% height=30%">
   <TR>
      <TD>         
         <div align="center"> <h4 style="text-align:center"> No hay Mensajes Activos</h4></div>
      </TD>
   </TR>
</TABLE>

<%
   }
   else
   {
%>   

<TABLE class="tbenter"> 
   <TR>
		<TD align="CENTER" class="TDBKG">
			<a href="javascript:goInquiry()"><b>Consultar</b></a>
		</TD>
	</TR>
</TABLE>


<table  class="tableinfo" width="100%">
   <TR id=trdark> 
      <td NOWRAP align="center" width="2%"><B>Sel</B></td>
	  <td NOWRAP align="center" width="2%"><B>Mod</B></td>
	  <td NOWRAP align="center" width="10%"><B>Cuenta/Cliente</B></td>
	  <td NOWRAP align="center" width="5%"><B>Mensaje</B></td>
	  <td NOWRAP align="center" width="41%"><B>Resumen</B></td>
	  <td NOWRAP align="center" width="20%"><B>Motivo</B></td>
	  <td NOWRAP align="center" width="15%"><B>Estado</B></td>
	  <td nowrap align="center" width="10%"><B>Fecha de Vencimiento</B></td>
   </TR>
   
   <%
      int i = 0;
      ESD005001List.initRow();    
      while (ESD005001List.getNextRow()) {
      ESD005001Message msgList = (ESD005001Message) ESD005001List.getRecord(); 
   %>  
   <TR>          
   <td NOWRAP align="center" width="2%"><INPUT type="radio" name="CODE" value="<%= msgList.getE01WNMNME() %>"  onClick="showInfo('<%= msgList.getE01WNMACC() %>','<%= msgList.getE01WNMACD() %>')"></td>
   <td NOWRAP align="left" width="2%" ><%= msgList.getE01WNMACD() %> </td>
   <td NOWRAP align="left" width="10%" ><%= msgList.getE01WNMACC() %> </td>
   <td NOWRAP align="left" width="5%" ><%= msgList.getE01WNMNME() %> </td>
   <td NOWRAP align="left" width="41%" ><%= msgList.getE01WNMDSC() %></td>
   <td NOWRAP align="left" width="20%" ><%= msgList.getE01WNMMOD() %></td>
   <td NOWRAP align="left" width="15%" ><%= msgList.getE01WNMSTD() %></td>
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



<%      
   }
%> 
 




</form>
</body>
</html>
