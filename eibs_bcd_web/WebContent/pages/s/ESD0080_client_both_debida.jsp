<html>
<head>
<title>Debida Diligencia Figura Publica</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "debida" class= "datapro.eibs.beans.ESD000004Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/CrossBrowserFunctions.js"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/Address.js"> </SCRIPT>


<SCRIPT type="text/javascript">

<% if ( userPO.getOption().equals("CLIENT_P") ) { %>
		builtNewMenu(client_personal_opt);
<% } else { %>
		builtNewMenu(client_corp_opt);
<% } %>

</SCRIPT>

</head>

<body bgcolor="#FFFFFF">

<% 
	if ( !error.getERRNUM().equals("0")  ) {
    	error.setERRNUM("0");
     	out.println("<SCRIPT Language=\"Javascript\">");
     	out.println("       showErrors()");
     	out.println("</SCRIPT>");
 	}
 	
  	if ( !userPO.getPurpose().equals("NEW") ) {
    	out.println("<SCRIPT> initMenu(); </SCRIPT>");
 	}
%>

<h3 align="center">Debida Diligencia Figura P&uacute;blica
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_both_debida, ESD0080"></h3>
<hr size="4">

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080" >
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="68">
  

<table class="tableinfo">
  <tr > 
    <td nowrap> 
      <table cellspacing="0" cellpadding="2" width="100%" class="tbhead"  bordercolor="#FFFFFF" bordercolor="#FFFFFF" bordercolor="#FFFFFF"  align="center">
        <tr>
            <td nowrap width="10%" align="right"> Cliente: </td>
          	<td nowrap width="12%" align="left"><%= userPO.getHeader1()%></td>
            <td nowrap width="6%" align="right">ID: </td>
          	<td nowrap width="14%" align="left"><%= userPO.getHeader2()%></td>
            <td nowrap width="8%" align="right"> Nombre: </td>
          	<td nowrap width="50%"align="left"><%= userPO.getHeader3()%></td>
        </tr>
      </table>
    </td>
  </tr>
</table>

<br>

<div id="dataDiv" align="center" style="height:351; overflow-y:scroll; width:90%; padding-left:50; padding-right:5" class="scbarcolor">
<%
	int bene_amount = 10;
  	String name;
  	String ctr = "";
  	String readonly = "";
  
  	for ( int i=1; i<=bene_amount; i++ ) {
    	if ( i == 10 ) {
      		name = "A"; 
    	} else {
      		name = i + "";
    	}
    
    out.println("<br>");
    out.println("<table class=\"tbenter\" border=\"0\" width=\"100%\">");
    out.println("<tr>");
    out.println("<td>");
    
    switch ( i ) {
        case 1 :     
%> 
 			<h4 align="left">Primero</h4>
<%          
           if (debida.getE14RCN().equals("0")) {
           		readonly = "false";
           } else {
           		readonly = "true";
           }
           break;
        case 2 : 
%> 
 			<h4 align="left">Segundo</h4>
<%          
           if (debida.getE24RCN().equals("0")) {
           		readonly = "false";
           } else {
           		readonly = "true";
           }
           break;
        case 3 : 
%> 
			<h4 align="left">Tercero</h4>
<%          
           if (debida.getE34RCN().equals("0")) {
           		readonly = "false";
           } else {
           		readonly = "true";
           }
           break;
        case 4 : 
%> 
			<h4 align="left">Cuarto</h4>
<%          
           if (debida.getE44RCN().equals("0")) {
           		readonly = "false";
           } else {
           		readonly = "true";
           }
           break;
        case 5 : 
%> 
			<h4 align="left">Quinto</h4>
<%          
           if (debida.getE54RCN().equals("0")) {
           		readonly = "false";
           } else {
           		readonly = "true";
           }
           break;
        case 6 : 
%> 
			<h4 align="left">Sexto</h4>
<%          
           if (debida.getE64RCN().equals("0")) {
           		readonly = "false";
           } else {
           		readonly = "true";
           }
           break;
        case 7 : 
%> 
			<h4 align="left">Séptimo</h4>
<%          
           if (debida.getE74RCN().equals("0")) {
           		readonly = "false";
           } else {
           		readonly = "true";
           }
           break;
        case 8 : 
%> 
			<h4 align="left">Octavo</h4>
<%          
           if (debida.getE84RCN().equals("0")) {
           		readonly = "false";
           } else {
           		readonly = "true";
           }
           break;
        case 9 : 
%> 
			<h4 align="left">Noveno</h4>
<%          
           if (debida.getE94RCN().equals("0")) {
           		readonly = "false";
           } else {
           		readonly = "true";
           }
           break;
        case 10 : 
%> 
			<h4 align="left">Décimo</h4>
<%          
           if (debida.getEA4RCN().equals("0")) {
           		readonly = "false";
           } else {
           		readonly = "true";
           }
           break;
     }
     
    out.println("</td>");

  	String READ_ONLY_TAG = (readonly.equals("true")) ? "readonly" : "";   
  	String DISABLED_TAG = (readonly.equals("true")) ? "disabled" : "";   

  	out.println("<td width=\"30%\" align=\"right\">");
  	out.println("<h4>");
  	out.print("<A href=\"javascript:go(1)\">1</A>,<A href=\"javascript:go(2)\">2</A>,<A href=\"javascript:go(3)\">3</A>,<A href=\"javascript:go(4)\">4</A>,<A href=\"javascript:go(5)\">5</A>,");
  	out.print("<A href=\"javascript:go(6)\">6</A>,<A href=\"javascript:go(7)\">7</A>,<A href=\"javascript:go(8)\">8</A>,<A href=\"javascript:go(9)\">9</A>,<A href=\"javascript:go(10)\">10</A>");
   	out.println("</h4>"); 
  	out.println("</td>");   
  	out.println("</tr>");
  	out.println("</table>"); 
%>

 
<table id="mainTable<%= name %>" class="tableinfo" width="100%">
	<tr bgcolor="#FFFFFF" bordercolor="#FFFFFF"> 
      	<td> 
        	<table cellspacing="0" cellpadding="2" width="100%" border="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF" bordercolor="#FFFFFF" align="center">    
          		<tr id="trclear"> 
            		<td width="42%" nowrap><div align="right">Nombre Completo :</div></td>
            		<td nowrap width="58%"> 
              			<input type="text" name="E<%= name %>4MA1" maxlength="45" size="46" value="<%= debida.getField("E" + name + "4MA1").getString().trim()%>" <%= READ_ONLY_TAG %>>
              			 <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" > 
              		</td>
          		</tr>
          		<tr id="trdark"> 
            		<td width="42%" nowrap><div align="right">Identificaci&oacute;n :</div></td>
            		<td nowrap width="58%"> 
              			<input type="text" name="E<%= name %>4MA2" maxlength="45" size="46" value="<%= debida.getField("E" + name + "4MA2").getString().trim()%>" <%= READ_ONLY_TAG %>>
              			 <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" > 
              		</td>
          		</tr>
          		<tr id="trclear"> 
            		<td width="42%" nowrap><div align="right">Nacionalidad :</div></td>
            		<td width="58%" nowrap> 
              			<input type="text" name="E<%= name %>4BNC" maxlength="4" size="5" value="<%= debida.getField("E" + name + "4BNC").getString().trim()%>" <%= READ_ONLY_TAG %>>
           				<% if (READ_ONLY_TAG.equals("")) { %>
              			<a href="javascript:GetCodeCNOFC('E<%= name %>4BNC','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"  border="0"></a>  
           				<% } %>
           				 <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" > 
              		</td>
          		</tr>
          		<tr id="trdark"> 
            		<td width="42%" nowrap ><div align="right">Tipo Relaci&oacute;n :</div></td>
            		<td width="58%" nowrap > 
              			<select name="E<%= name %>4INC" <%= DISABLED_TAG %>>
			                <option value=P <% if (debida.getField("E" + name + "4INC").getString().equals("P")) out.print("selected"); %>>Figura Pol&iacute;tica</option>
			                <option value=F <% if (debida.getField("E" + name + "4INC").getString().equals("F")) out.print("selected"); %>>Familiar</option>
			                <option value=A <% if (debida.getField("E" + name + "4INC").getString().equals("A")) out.print("selected"); %>>Allegado</optio>
              			</select>
              			 <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" > 
              		</td>
          		</tr>
          		<tr id="trclear"> 
            		<td width="42%" nowrap><div align="right">Cargo P&uacute;blico:</div></td>
            		<td width="58%" nowrap> 
              			<input type="text" name="E<%= name %>4NM3" maxlength="45" size="46" value="<%= debida.getField("E" + name + "4NM3").getString().trim()%>">
              			 <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" > 
              		</td>
          		</tr>
          		<tr id="trdark"> 
            		<td width="42%" nowrap><div align="right">Pa&iacute;s :</div></td>
            		<td width="58%" nowrap> 
              			<input type="text" name="E<%= name %>4STE" maxlength="4" size="5" value="<%= debida.getField("E" + name + "4STE").getString().trim()%>" <%= READ_ONLY_TAG %>>
           				<% if (READ_ONLY_TAG.equals("")) { %>
              			<a href="javascript:GetCodeCNOFC('E<%= name %>4STE','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"  border="0"></a> 
           				<% } %>
           				 <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" > 
              		</td>
          		</tr>
          		
			</table>
      	</td>
    </tr>
</table>
  
<%
  }
%> 

</div>
	<SCRIPT type="text/javascript">
   		getElement('dataDiv').style.height=  getElement('mainTable1').offsetTop + getElement("mainTable1").offsetHeight +"";
   		EventUtils.addEventListener(document.forms[0],'submit',calculateAddress);
	</SCRIPT>

<% if ((userPO.getPurpose().equals("NEW")) || (userPO.getPurpose().equals("MAINTENANCE"))) { %> 
		<br>
        <div align="center"><input id="EIBSBTN" type=submit name="Submit" value="Enviar"></div>
<% } %> 

</form>
</body>
</html>
