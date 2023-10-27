<html>

<head>
<title>Representantes Legales</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "legalRep" class= "datapro.eibs.beans.ESD000004Message"  scope="session" />
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

<h3 align="center">Representantes Legales
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_both_legal_rep, ESD0080"></h3>
<hr size="4">

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080" >
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="46">
  

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

 
<table id="mainTable<%= name %>" class="tableinfo" width="100%">
	<tr bgcolor="#FFFFFF" bordercolor="#FFFFFF"> 
      	<td> 
        	<table cellspacing="0" cellpadding="2" width="100%" border="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF" bordercolor="#FFFFFF" align="center">
          		<tr id="trdark"> 
           			<td width="39%" nowrap><div align="right">Número de Cliente : </div></td>
           			<td width="61%" nowrap> 
             			<input type="text" name="E<%= name %>4RCN" maxlength="12" size="12" value="<%= legalRep.getField("E" + name + "4RCN").getString().trim()%>">
             			<a href="javascript:GetCustomerDetails('E<%=name%>4RCN','E<%=name%>4MA1','E<%=name%>4BNI','','','E<%=name%>4MA2','E<%=name%>4MA3','','E<%=name%>4CTY','','E<%=name%>4CTR','E<%=name%>4POB','E<%=name%>4ZPC','','','','','E<%=name%>4HPN')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a>	
           			</td>
          		</tr>         
          		<tr id="trclear"> 
            		<td width="39%" nowrap><div align="right">Nombre Legal :</div></td>
            		<td nowrap width="61%"> 
              			<input type="text" name="E<%= name %>4MA1" maxlength="60" size="65" value="<%= legalRep.getField("E" + name + "4MA1").getString().trim()%>" <%= READ_ONLY_TAG %>>
              		</td>
          		</tr>

				<% if( legalRep.getH04SCR().equals("07")) { %> 	
		 			<tr>
		 				<td colspan="2">
							<jsp:include page="ESD0080_address_template_basic_panama.jsp" flush="true">
								<jsp:param name="suffix" value='<%="E"+name+"4"%>' />
								<jsp:param name="title" value="Direcci&oacute;n" />
								<jsp:param name="messageName" value="legalRep" />
								<jsp:param name="readOnly" value="<%=readonly%>" />
								<jsp:param name="basic" value="false" />
							</jsp:include>
						</td>
		 			</tr>	
		 			
				<% } else if (legalRep.getH04SCR().equals("03")) { %> 
	           				<jsp:include page="ESD0080_address_template_simple_venezuela.jsp"  flush="true">
		          				<jsp:param name="index" value="<%=name%>" />
		          				<jsp:param name="title" value="Direccion" />
		          				<jsp:param name="messageName" value="legalRep" />
	              				<jsp:param name="addressType" value="S" />
	              				<jsp:param name="readOnly"  value="<%=readonly%>" />
	           				</jsp:include>
	
				<%} else if( legalRep.getH04SCR().equals("18")){%> 	
					<jsp:include page="ESD0080_address_template_simple_chile.jsp" flush="true">
				          <jsp:param name="index" value="<%=name%>" />
				          <jsp:param name="title" value="Direccion" />
				          <jsp:param name="messageName" value="legalRep" />
			              <jsp:param name="addressType" value="S" />
			              <jsp:param name="readOnly"  value="false" />
					</jsp:include>

		         <%} else { %>
				           <jsp:include page="ESD0080_address_template_simple_generic.jsp"  flush="true">
					          <jsp:param name="index" value="<%=name%>" />
					          <jsp:param name="title" value="Direccion" />
					          <jsp:param name="messageName" value="legalRep" />
				              <jsp:param name="addressType" value="S" />
				              <jsp:param name="readOnly"  value="<%=readonly%>" />
				           </jsp:include>
				<%} %>   
          		<tr id="trclear"> 
            		<td width="39%" nowrap><div align="right">Nacionalidad :</div></td>
            		<td width="61%" nowrap> 
              			<input type="text" name="E<%= name %>4BNC" maxlength="4" size="5" value="<%= legalRep.getField("E" + name + "4BNC").getString().trim()%>" <%= READ_ONLY_TAG %>>
           				<% if (READ_ONLY_TAG.equals("")) { %>
              			<a href="javascript:GetCodeCNOFC('E<%= name %>4BNC','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"  border="0"></a> 
           				<% } %>
              		</td>
          		</tr>
          		<tr id="trdark"> 
            		<td width="39%" nowrap><div align="right">Cargo :</div></td>
            		<td width="61%" nowrap> 
           				<input type="hidden" name="C<%= name %>4CAR" maxlength="35" size="36" value="">
              			<input type="text" name="E<%= name %>4CAR" maxlength="35" size="36" value="<%= legalRep.getField("E" + name + "4CAR").getString().trim()%>" <%= READ_ONLY_TAG %>>
           				<% if (READ_ONLY_TAG.equals("")) { %>
           					<a href="javascript:GetCodeDescCNOFC('<%= "C" + name %>4CAR', '<%= "E" + name %>4CAR','32')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a> 
           				<% } %>
              		</td>
          		</tr>
          		<tr id="trclear"> 
            		<td width="39%" nowrap><div align="right">Fecha :</div></td>
            		<td width="61%" nowrap> 
		              	<input type="text" name="E<%= name %>4DT1" maxlength="2" size="2" value="<%= legalRep.getField("E" + name + "4DT1").getString().trim()%>" <%= READ_ONLY_TAG %>>
		              	<input type="text" name="E<%= name %>4DT2" maxlength="2" size="2" value="<%= legalRep.getField("E" + name + "4DT2").getString().trim()%>" <%= READ_ONLY_TAG %>>
		              	<input type="text" name="E<%= name %>4DT3" maxlength="4" size="4" value="<%= legalRep.getField("E" + name + "4DT3").getString().trim()%>" <%= READ_ONLY_TAG %>>
              		</td>
          		</tr>
          		<tr id="trdark"> 
            		<td width="39%" nowrap ><div align="right">Profesi&oacute;n/Ocupaci&oacute;n :</div></td>
           	 		<td width="61%" nowrap > 
                		<input type="text" name="E<%= name %>4MLC" value="<%= legalRep.getField("E" + name + "4MLC").getString().trim()%>" size="5" maxlength="4" <%= READ_ONLY_TAG %>>
           				<% if (READ_ONLY_TAG.equals("")) { %>
                		<a href="javascript:GetCodeCNOFC('E<%= name %>4MLC','49')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"  border="0"  ></a>	
           				<% } %>
            		</td>
          		</tr>
          		<tr id="trclear"> 
            		<td width="39%" nowrap><div align="right">En Calidad de :</div></td>
            		<td width="61%" nowrap> 
            		  <input type="text" name="E<%= name %>4INC" value="<%= legalRep.getField("E" + name + "4INC").getString().trim()%>" size="5" maxlength="4" <%= READ_ONLY_TAG %>>
           				<% if (READ_ONLY_TAG.equals("")) { %>
                		<a href="javascript:GetCodeCNOFC('E<%= name %>4INC','33')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"  border="0"  ></a>	
           				<% } %>
            		  	
              			
              		 </td>
          		</tr>
          		<tr id="trdark"> 
            		<td width="39%" nowrap ><div align="right">Estado Civil :</div></td>
            		<td width="61%" nowrap > 
              			<select name="E<%= name %>4BMS" <%= DISABLED_TAG %>>
			                <option value=2 <% if (legalRep.getField("E" + name + "4BMS").getString().equals("2")) out.print("selected"); %>>Casado(a)</option>
			                <option value=1 <% if (legalRep.getField("E" + name + "4BMS").getString().equals("1")) out.print("selected"); %>>Soltero(a)</option>
			                <option value=3 <% if (legalRep.getField("E" + name + "4BMS").getString().equals("3")) out.print("selected"); %>>Divorciado(a)</option>
			                <option value=4 <% if (legalRep.getField("E" + name + "4BMS").getString().equals("4")) out.print("selected"); %>>Viudo(a)</option>
			                <option value=5 <% if (legalRep.getField("E" + name + "4BMS").getString().equals("5")) out.print("selected"); %>>Otros</option>
			                <option value=0 <% if ( !(legalRep.getField("E" + name + "4BMS").getString().equals("1") || legalRep.getField("E" + name + "4BMS").getString().equals("2") || legalRep.getField("E" + name + "4BMS").getString().equals("3") || legalRep.getField("E" + name + "4BMS").getString().equals("4") || legalRep.getField("E" + name + "4BMS").getString().equals("5"))) out.print("selected"); %>></option>
              			</select>
              		</td>
          		</tr>
          		<tr id="trclear"> 
            		<td width="39%" nowrap><div align="right">Sexo :</div></td>
            		<td width="61%" nowrap> 
              			<input type="radio" name="E<%= name %>4BSX" value="F" <% if (legalRep.getField("E" + name + "4BSX").getString().equals("F")) out.print("checked"); %> checked <%= DISABLED_TAG %>>
              			Femenino 
              			<input type="radio" name="E<%= name %>4BSX" value="M" <% if (legalRep.getField("E" + name + "4BSX").getString().equals("M")) out.print("checked"); %> <%= DISABLED_TAG %>>
              			Masculino 
              		</td>
          		</tr>
          		<tr id="trdark"> 
            		<td width="39%" nowrap><div align="right">Tel&eacute;fono :</div></td>
            		<td width="61%" nowrap> 
              			<input type="text" name="E<%= name %>4HPN" maxlength="15" size="16" value="<%= legalRep.getField("E" + name + "4HPN").getString().trim()%>" <%= READ_ONLY_TAG %>>
              		</td>
          		</tr>
    			<% if(!(currUser.getE01INT().equals("06")) && !legalRep.getH04SCR().equals("07") ){ %> 
          		<tr id="trclear"> 
            		<td width="39%" nowrap><div align="right">Identificaci&oacute;n :</div></td>
            		<td width="61%" nowrap> 
              			<input type="text" name="E<%= name %>4BNI" maxlength="25" size="28" value="<%= legalRep.getField("E" + name + "4BNI").getString().trim()%>" <%= READ_ONLY_TAG %>>
              		</td>
          		</tr>         
      	    		<tr id="trdark">
        	   			<td width="39%" ><div align="right">Tipo :</div>
        	   		</td>
            		<td width="61%" nowrap > 
              			<input type="text" name="E<%= name %>4TID" value="<%= legalRep.getField("E" + name + "4TID").getString().trim()%>" size="5" maxlength="4" <%= READ_ONLY_TAG %>>
           				<% if (READ_ONLY_TAG.equals("")) { %>
              					<a href="javascript:GetCodeCNOFC('E<%= name %>4TID','34')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"  border="0" ></a>	
           				<% } %>
              		</td>
          		</tr>
      	    		<tr id="trclear"> 
            			<td width="39%" ><div align="right">Expedido En :</div>
            		</td>
            		<td width="61%" nowrap> 
              			<input type="text" name="E<%= name %>4PID" size="5" maxlength="4" value="<%= legalRep.getField("E" + name + "4PID").getString().trim()%>" <%= READ_ONLY_TAG %>>
           				<% if (READ_ONLY_TAG.equals("")) { %>
              					<a href="javascript:GetCodeCNOFC('E<%= name %>4PID','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"  border="0" ></a> 
           				<% } %>
              		</td>
          		</tr>
          <% } %>
			</table>
      	</td>
    </tr>
</table>
  
<% } %>

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
