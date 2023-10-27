<!DOCTYPE HTML>
<%@ page import="com.datapro.eibs.constants.ISOCodes"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import="datapro.eibs.master.Util"%>
<html>
<head>
<title>Cuentas</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css"rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/jquery/themes/smoothness/jquery-ui.css"/> 
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id= "msgRcd" class= "datapro.eibs.beans.EIE001101Message"   scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"   scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"></SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"></SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/jquery.jsp"> </script>
<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"></script>
<script src="<%=request.getContextPath()%>/jquery/markChangedFields.jsp?MSGOBJ=cusPort"> </script>

<SCRIPT type="text/javascript">
<%
	String read = "";
 	String disabled = "";
 	boolean readOnly = false;
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"Campo Obligatorio\" align=\"bottom\" border=\"0\" >";
 	String help = "<img src=\"" + request.getContextPath() + "/images/1b.gif\" title=\"Ayuda\" align=\"bottom\" border=\"0\" >";
 	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) 
		{ read = " readonly ";
		  disabled = " disabled"; 
		  mandatory = "";
		  readOnly = true;
	}	
 	boolean isInquiry = (userPO.getPurpose().equals("INQUIRY") || userPO.getPurpose().equals("APPROVAL"));
 	boolean isReadOnly = isInquiry;
 	String readMnt = (userPO.getPurpose().equals("NEW")?"":" readonly");
 	boolean readMntB = (userPO.getPurpose().equals("NEW")?false:true);
 	String disabledMnt = (userPO.getPurpose().equals("NEW")?"":" disabled");
 	if (isInquiry) {
 	  help = "";
 	}
%>
	
<%if (userPO.getPurpose().equals("MAINTENANCE")) {%>
	builtNewMenu(cus_m_port_opt);
<%} else if (userPO.getPurpose().equals("INQUIRY")) {%>
	builtNewMenu(cus_i_port_opt);
<%} else if (userPO.getPurpose().equals("APPROVAL")) {%>
	builtNewMenu(cus_a_port_opt);
<%}%>
<%if (!userPO.getPurpose().equals("NEW")) {%>
  initMenu();
<%}%>  

function goAction(op) {
	document.forms[0].SCREEN.value = op;
	submitForm();
}
	 
function switchVal(obj) {
  if (obj.checked) obj.value="Y"; else obj.value="N";
}
</SCRIPT>

</head>

<body >

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
%>

<h3 align="center">Cuentas Transaccionales<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="inv_port_acc, EIE0010"></h3>
<hr size="4">
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0010" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="15">  

  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" align="right"><b>Cliente :</b></td>
            <td nowrap width="20%"  align="left"> 
                <input type="text" name="E01PCACUN" size="9" maxlength="9" value="<%= msgRcd.getE01PCACUN().trim()%>" readonly>
            </td>
            <td nowrap width="16%" align="right"><b>Nombre :</b></td>
            <td nowrap align="left"> 
                <input type="text" name="E01CUSNA1" size="45" maxlength="45" value="<%= msgRcd.getE01CUSNA1().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap align="right"><b>Portafolio :</b></td>
            <td nowrap align="left"> 
                <input type="text" name="E01PCANUM" size="12" maxlength="12" value="<%= msgRcd.getE01PCANUM().trim()%>" readonly>
            </td>
            <td nowrap align="right"><b>Descripción : </b></td>
            <td nowrap align="left"> 
                <input type="text" name="E01PRFDSC" size="35" maxlength="35" value="<%= msgRcd.getE01PRFDSC().trim()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Cuentas Transaccionales</h4>
  <table class="tableinfo">
    <tr>  
      <td> 
        <table cellspacing="2" cellpadding="2" width="100%" border="0" align="center">
          <tr id="trdark"> 
            <th nowrap align="center">Cuenta</th>
            <th nowrap align="center">Moneda</th>
            <th nowrap align="center">Saldo</th>
            <th width="1%" nowrap align="center">Borrar</th>
          </tr>
<%  
  String name;
  for ( int i=1; i<=10; i++ ) {
    if ( i == 10 ) name = "0"; else name = i + "";       
%>  
          <tr id="trclear"> 
            <td nowrap align="center">
             <% if(msgRcd.getField("E01PCAAC" + name).getString().trim().equals("0") || msgRcd.getField("E01ERRFL" + name).getString().trim().equals("Y")) { %>  
			 <a href="javascript:showRetAccountInq(document.forms[0].E01PCAAC<%= name %>.value)">
			 <img src="<%=request.getContextPath()%>/images/1aquire.gif" title="click for account inquiry" align="bottom" border="0" > </a>
			  <a href="javascript:showRetAccountHolders(document.forms[0].E01PCAAC<%= name %>.value)">
			  <img src="<%=request.getContextPath()%>/images/accountholder.gif" title="click for account holders" align="bottom" border="0" > </a>
              <input type="text" name="E01PCAAC<%= name %>" maxlength="12" size="12" value="<%= msgRcd.getField("E01PCAAC" + name).getString().trim()%>">
              <a href="javascript:GetAccount('E01PCAAC<%= name %>','','RA','')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0"></a> 
              <% } else { %> <a href="javascript:showRetAccountInq(document.forms[0].E01PCAAC<%= name %>.value)"><img src="<%=request.getContextPath()%>/images/1aquire.gif" title="click for account inquiry" align="bottom" border="0" > 
              </a> <a href="javascript:showRetAccountHolders(document.forms[0].E01PCAAC<%= name %>.value)">
              <img src="<%=request.getContextPath()%>/images/accountholder.gif" title="click for account holders" align="bottom" border="0" ></a> 
              <input type="text" name="E01PCAAC<%= name %>" maxlength="12" size="12" value="<%= msgRcd.getField("E01PCAAC" + name).getString().trim()%>" readonly>            
              <a href="javascript:void(0)"><%=mandatory%></a> 
             <% } %>
            </td>
            <td nowrap align="center"> 
              <input type="text" name="E01PCACY<%= name %>" maxlength="3" size="3" value="<%= msgRcd.getField("E01PCACY" + name).getString().trim()%>" readonly>           
            </td>
            <td nowrap align="center"> 
              <input type="text" class="txtright" name="E01MNBAL<%= name %>" maxlength="17" size="17" value="<%= msgRcd.getField("E01MNBAL" + name).getString()%>" readonly>
            </td>
            <td nowrap align="center">
             <% if(!(msgRcd.getField("E01PCAAC" + name).getString().trim().equals("0") || msgRcd.getField("E01ERRFL" + name).getString().trim().equals("Y"))) { %>                        
                <input type="checkbox" name="E01PCADL<%= name %>" onClick="switchVal(this)" value="<%= msgRcd.getField("E01PCADL" + name).getString().trim()%>" <% if(msgRcd.getField("E01PCADL" + name).getString().trim().equals("Y")) out.print("checked");%> >             
             <% } %>
            </td>
          </tr>                    
<%
  }
%>		  
        </table>        
      </td>
    </tr>
  </table>
  
		<%if (!isInquiry) {%>
		<p align="center">
			<input class="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="goAction(15);"><BR>
		</p>
		<%}%>
		<%if (isInquiry) {%>
			<script>readOnlyPage();</script>
		<% } %>
</form>
</body>
</html>
