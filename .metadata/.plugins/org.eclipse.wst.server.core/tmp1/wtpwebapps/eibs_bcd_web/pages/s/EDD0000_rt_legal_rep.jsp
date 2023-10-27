<%@page import="java.util.logging.Logger"%>
<%@page import="datapro.eibs.beans.DataAddress"%>
<html>
<head>
<title>Representantes Legales</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id= "legalRep" class= "datapro.eibs.beans.ESD000004Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/CrossBrowserFunctions.js"> </SCRIPT>

<SCRIPT type="text/javascript">

<%
if ( userPO.getOption().equals("RT") ) {
%>
	builtNewMenu(rt_m_opt);
<%   
}
else if ( userPO.getOption().equals("SV") ) {
%>
	builtNewMenu(sv_m_opt);
<%   
}
%>

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
  
    out.println("<SCRIPT> initMenu(); </SCRIPT>");

%>

<h3 align="center">Representantes Legales
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_legal_rep.jsp, EDD0000"></h3>
<hr size="4">

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="48">  

<table  class="tableinfo">
	<tr bordercolor="#FFFFFF"> 
    	<td nowrap> 
        	<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          		<tr id="trdark"> 
            		<td nowrap width="16%" ><div align="right"><b>Cliente :</b></div></td>
            		<td nowrap width="20%" > 
              			<div align="left"><input type="text" name="E02CUN" size="10" maxlength="9" readonly value="<%= userPO.getCusNum().trim()%>"></div>
            		</td>
            		<td nowrap width="16%" ><div align="right"><b>Nombre :</b> </div></td>
            		<td nowrap colspan="3" > 
              			<div align="left"><input type="text" name="E02NA1" size="45" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>"></div>
            		</td>
          		</tr>
          		<tr id="trdark"> 
            		<td nowrap width="16%"><div align="right"><b>Cuenta :</b></div></td>
            		<td nowrap width="20%"> 
              			<div align="left"><input type="text" name="E04ACC" size="13" maxlength="12" value="<%= userPO.getAccNum().trim()%>" readonly></div>
            		</td>
            		<td nowrap width="16%"><div align="right"><b>Moneda : </b></div></td>
            		<td nowrap width="16%"> 
              			<div align="left"><b><input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly></b> </div>
            		</td>
            		<td nowrap width="16%"><div align="right"><b>Producto : </b></div></td>
            		<td nowrap width="16%"> 
              			<div align="left"><b><input type="text" name="E02PRO" size="4" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>"></b> </div>
            		</td>
          		</tr>
        	</table>
      	</td>
	</tr>
</table>

<div id="dataDiv" align="center" style="height:351; overflow-y:scroll; width:90%; padding-left:50; padding-right:10" class="scbarcolor">
<%
	int legalRep_amount = 10;
  	String name;
  	String ctr = "";
  	String readonly = "";
  
  	for ( int i=1; i<=legalRep_amount; i++ ) {
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
           if (legalRep.getE14RCN().equals("0")) {
           		readonly = "false";
           } else {
           		readonly = "true";
           }
           break;
        case 2 : 
%> 
 			<h4 align="left">Segundo</h4>
<%          
           if (legalRep.getE24RCN().equals("0")) {
           		readonly = "false";
           } else {
           		readonly = "true";
           }
           break;
        case 3 : 
%> 
			<h4 align="left">Tercero</h4>
<%          
           if (legalRep.getE34RCN().equals("0")) {
           		readonly = "false";
           } else {
           		readonly = "true";
           }
           break;
        case 4 : 
%> 
			<h4 align="left">Cuarto</h4>
<%          
           if (legalRep.getE44RCN().equals("0")) {
           		readonly = "false";
           } else {
           		readonly = "true";
           }
           break;
        case 5 : 
%> 
			<h4 align="left">Quinto</h4>
<%          
           if (legalRep.getE54RCN().equals("0")) {
           		readonly = "false";
           } else {
           		readonly = "true";
           }
           break;
        case 6 : 
%> 
			<h4 align="left">Sexto</h4>
<%          
           if (legalRep.getE64RCN().equals("0")) {
           		readonly = "false";
           } else {
           		readonly = "true";
           }
           break;
        case 7 : 
%> 
			<h4 align="left">Séptimo</h4>
<%          
           if (legalRep.getE74RCN().equals("0")) {
           		readonly = "false";
           } else {
           		readonly = "true";
           }
           break;
        case 8 : 
%> 
			<h4 align="left">Octavo</h4>
<%          
           if (legalRep.getE84RCN().equals("0")) {
           		readonly = "false";
           } else {
           		readonly = "true";
           }
           break;
        case 9 : 
%> 
			<h4 align="left">Noveno</h4>
<%          
           if (legalRep.getE94RCN().equals("0")) {
           		readonly = "false";
           } else {
           		readonly = "true";
           }
           break;
        case 10 : 
%> 
			<h4 align="left">Décimo</h4>
<%          
           if (legalRep.getEA4RCN().equals("0")) {
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

<table id="mainTable<%= name %>" class="tableinfo" >
	<tr bgcolor="#FFFFFF" bordercolor="#FFFFFF"> 
		<td> 
        	<table cellspacing="0" cellpadding="2" width="100%" border="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF" align="center">
          		<tr id="trdark"> 
            		<td width="13%" nowrap><div align="right">Número de Cliente : </div></td>
            		<td nowrap> 
              			<input type="text" name="E<%= name %>4RCN" maxlength="9" size="10" value="<%= legalRep.getField("E" + name + "4RCN").getString().trim()%>">
			  			<a href="javascript:GetCustomerDetails('E<%= name %>4RCN','E<%= name %>4MA1','E<%= name %>4NME','','','E<%= name %>4MA2','E<%= name %>4MA3','','E<%= name %>4CTY','E<%= name %>4STE','E<%= name %>4CTR','E<%= name %>4POB','E<%= name %>4ZPC','','','','','E<%= name %>4HPN')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
            		</td>
          		</tr>
          		<tr id="trclear"> 
            		<td width="42%" nowrap><div align="right">Nombre Legal :</div></td>
            		<td nowrap width="58%"> 
              			<input type="text" name="E<%= name %>4MA1" maxlength="60" size="65" value="<%= legalRep.getField("E" + name + "4MA1").getString().trim()%>" <%= READ_ONLY_TAG %>>
              		</td>
          		</tr>

				<% 	String pageName = DataAddress.getTemplatePage(legalRep.getH04SCR(), legalRep);
				%>
				<jsp:include page="<%= pageName %>" flush="true">
					<jsp:param name="messageName"  value="legalRep" />
			       	<jsp:param name="readOnly" value="false" />
			       	<jsp:param name="basic" value="false" />
			       	<jsp:param name="simple" value="false" />
					<jsp:param name="suffix" value='<%="E"+name+"4"%>' />
				</jsp:include>

          			<tr id="trdark"> 
            			<td width="42%" nowrap><div align="right">Nacionalidad :</div></td>
            			<td width="58%" nowrap> 
              				<input type="text" name="E<%= name %>4BNC" maxlength="4" size="5" value="<%= legalRep.getField("E" + name + "4BNC").getString().trim()%>" <%= READ_ONLY_TAG %>>
           					
              					<a href="javascript:GetCodeCNOFC('E<%= name %>4BNC','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"  border="0"></a> 
           					
              			</td>
          			</tr>
          			<tr id="trclear"> 
            			<td width="42%" nowrap><div align="right">Cargo :</div></td>
            			<td width="58%" nowrap> 
           				  <input type="hidden" name="C<%= name %>4CAR" maxlength="45" size="46" value="">
              			  <input type="text" name="E<%= name %>4CAR" maxlength="45" size="46" value="<%= legalRep.getField("E" + name + "4CAR").getString().trim()%>" <%= READ_ONLY_TAG %>>
            			 
            			  <a href="javascript:GetCodeDescCNOFC('<%= "C" + name %>4CAR', '<%= "E" + name %>4CAR','32')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></a> 
              		   
              		</td>
          			</tr>
          			<tr id="trdark"> 
            			<td width="42%" nowrap><div align="right">Fecha :</div></td>
            			<td width="58%" nowrap> 
			            	<input type="text" name="E<%= name %>4D21" maxlength="2" size="2" value="<%= legalRep.getField("E" + name + "4D21").getString().trim()%>" <%= READ_ONLY_TAG %>>
			              	<input type="text" name="E<%= name %>4D22" maxlength="2" size="2" value="<%= legalRep.getField("E" + name + "4D22").getString().trim()%>" <%= READ_ONLY_TAG %>>
			              	<input type="text" name="E<%= name %>4D23" maxlength="4" size="5" value="<%= legalRep.getField("E" + name + "4D23").getString().trim()%>" <%= READ_ONLY_TAG %>>
              			</td>
          			</tr>
          			<tr id="trclear"> 
            			<td width="42%" nowrap ><div align="right">Profesi&oacute;n/Ocupaci&oacute;n :</div></td>
            			<td width="58%" nowrap > 
                			<input type="text" name="E<%= name %>4MLC" value="<%= legalRep.getField("E" + name + "4MLC").getString().trim()%>" size="5" maxlength="4" <%= READ_ONLY_TAG %>>
           					
                				<a href="javascript:GetCodeCNOFC('E<%= name %>4MLC','49')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"  border="0"  ></a>	
           					
            			</td>
          			</tr>
          			<tr id="trdark"> 
            			<td width="42%" nowrap><div align="right">En Calidad de :</div></td>
            			<td width="58%" nowrap> 
              				<input type="text" name="E<%= name %>4INC"  maxlength="4" size="5" value="<%= legalRep.getField("E" + name + "4INC").getString().trim()%>" >
              			</td>
          			</tr>
          			<tr id="trclear"> 
            			<td width="42%" nowrap ><div align="right">Estado Civil :</div></td>
            			<td width="58%" nowrap > 
              				<select name="E<%= name %>4BMS" <%= DISABLED_TAG %>>
				                <option value=2 <% if (legalRep.getField("E" + name + "4BMS").getString().equals("2")) out.print("selected"); %>>Casado(a)</option>
				                <option value=1 <% if (legalRep.getField("E" + name + "4BMS").getString().equals("1")) out.print("selected"); %>>Soltero(a)</option>
				                <option value=3 <% if (legalRep.getField("E" + name + "4BMS").getString().equals("3")) out.print("selected"); %>>Divorciado(a)</option>
				                <option value=4 <% if (legalRep.getField("E" + name + "4BMS").getString().equals("4")) out.print("selected"); %>>Viudo(a)</option>
				                <option value=5 <% if (legalRep.getField("E" + name + "4BMS").getString().equals("5")) out.print("selected"); %>>Otro</option>
				                <option value=6 <% if (legalRep.getField("E" + name + "4BMS").getString().equals("6")) out.print("selected"); %>>Union Libre</option>
				                <option value=0 <% if ( !(legalRep.getField("E" + name + "4BMS").getString().equals("1") || legalRep.getField("E" + name + "4BMS").getString().equals("2") || legalRep.getField("E" + name + "4BMS").getString().equals("3") || legalRep.getField("E" + name + "4BMS").getString().equals("4") || legalRep.getField("E" + name + "4BMS").getString().equals("5")|| legalRep.getField("E" + name + "4BMS").getString().equals("6"))) out.print("selected"); %>></option>
              				</select>
              			</td>
          			</tr>
          			<tr id="trdark"> 
            			<td width="42%" nowrap><div align="right">Sexo :</div></td>
            			<td width="58%" nowrap> 
              				<input type="radio" name="E<%= name %>4BSX" value="F" <% if (legalRep.getField("E" + name + "4BSX").getString().equals("F")) out.print("checked"); %> checked <%= DISABLED_TAG %>>
              				Femenino 
              				<input type="radio" name="E<%= name %>4BSX" value="M" <% if (legalRep.getField("E" + name + "4BSX").getString().equals("M")) out.print("checked"); %> <%= DISABLED_TAG %>>
              				Masculino 
              			</td>
          			</tr>
          			<tr id="trclear"> 
            			<td width="42%" nowrap><div align="right">Tel&eacute;fono :</div></td>
            			<td width="58%" nowrap> 
              				<input type="text" name="E<%= name %>4HPN" maxlength="15" size="16" value="<%= legalRep.getField("E" + name + "4HPN").getString().trim()%>" <%= READ_ONLY_TAG %>>
              			</td>
          			</tr>
<%		    if (!(currUser.getE01INT().equals("06"))) { %> 
          	  <tr id="trdark"> 
            	<td width="42%" nowrap><div align="right">Identificaci&oacute;n :</div></td>
            	<td width="58%" nowrap> 
              		<input type="text" name="E<%= name %>4BNI" maxlength="25" size="26" value="<%= legalRep.getField("E" + name + "4BNI").getString().trim()%>" <%= READ_ONLY_TAG %>>
              	</td>
          	  </tr>
            	<tr id="trclear">
           			<td width="42%" ><div align="right">Tipo :</div></td>
            		<td width="58%" nowrap > 
              			<input type="text" name="E<%= name %>4TID" value="<%= legalRep.getField("E" + name + "4TID").getString().trim()%>" size="5" maxlength="4" <%= READ_ONLY_TAG %>>
             					<a href="javascript:GetCodeCNOFC('E<%= name %>4TID','34')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"  border="0" ></a>	
              		</td>
          		</tr>
          		<tr id="trdark"> 
            			<td width="42%" ><div align="right">Expedido en :</div></td>
            		<td width="58%" nowrap> 
              			<input type="text" name="E<%= name %>4PID" size="5" maxlength="4" value="<%= legalRep.getField("E" + name + "4PID").getString().trim()%>" <%= READ_ONLY_TAG %>>
            					<a href="javascript:GetCodeCNOFC('E<%= name %>4PID','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"  border="0" ></a> 
              		</td>
          		</tr>
          		
          		
<%					} %>        
			</table>
		</td>
    </tr>
</table>
  
<% } %>
</div>

<SCRIPT type="text/javascript">
   getElement('dataDiv').style.height=  getElement('mainTable1').offsetTop + getElement("mainTable1").offsetHeight +"";
</SCRIPT>

<div align="center"><input id="EIBSBTN" type=submit name="Submit" value="Enviar"></div>

</form>
</body>
</html>
