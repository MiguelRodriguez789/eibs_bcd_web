<html>
<head>
<title>Junta Directiva</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id= "board" class= "datapro.eibs.beans.ESD000004Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/CrossBrowserFunctions.js"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/Address.js"> </SCRIPT>

<SCRIPT type="text/javascript">

   builtNewMenu(client_corp_opt);

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
<h3 align="center">Junta Directiva <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_corp_board, ESD0080" ></h3>
<hr size="4">

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="16">
  

<table class="tableinfo">
	<tr > 
    	<td> 
      		<table cellspacing="0" cellpadding="2" width="100%"  class="tbhead"  align="center">
        		<tr>
             		<td nowrap width="10%" align="right"> Cliente: </td>
          			<td nowrap width="12%" align="left"><%= userPO.getHeader1()%></td>
            		<td nowrap width="6%" align="right">ID:  </td>
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
  	String readonly = "";
  	
  	for ( int i=1; i<=bene_amount; i++ ) {
    	if ( i == 10 ) {
      		name = "A"; 
    	} else {
      		name = i + "";
    	}
    
    out.println("<table class=\"tbenter\" border=\"0\" width=\"100%\">");
    out.println("<tr>");
    out.println("<td>");
    
    switch ( i ) {
        case 1 :     
%> 
 			<h4 align="left">Primero</h4>
<%          
           if (board.getE14RCN().equals("0")) {
           		readonly = "false";
           } else {
           		readonly = "true";
           }
           break;
        case 2 : 
%> 
 			<h4 align="left">Segundo</h4>
<%          
           if (board.getE24RCN().equals("0")) {
           		readonly = "false";
           } else {
           		readonly = "true";
           }
           break;
        case 3 : 
%> 
			<h4 align="left">Tercero</h4>
<%          
           if (board.getE34RCN().equals("0")) {
           		readonly = "false";
           } else {
           		readonly = "true";
           }
           break;
        case 4 : 
%> 
			<h4 align="left">Cuarto</h4>
<%          
           if (board.getE44RCN().equals("0")) {
           		readonly = "false";
           } else {
           		readonly = "true";
           }
           break;
        case 5 : 
%> 
			<h4 align="left">Quinto</h4>
<%          
           if (board.getE54RCN().equals("0")) {
           		readonly = "false";
           } else {
           		readonly = "true";
           }
           break;
        case 6 : 
%> 
			<h4 align="left">Sexto</h4>
<%          
           if (board.getE64RCN().equals("0")) {
           		readonly = "false";
           } else {
           		readonly = "true";
           }
           break;
        case 7 : 
%> 
			<h4 align="left">Séptimo</h4>
<%          
           if (board.getE74RCN().equals("0")) {
           		readonly = "false";
           } else {
           		readonly = "true";
           }
           break;
        case 8 : 
%> 
			<h4 align="left">Octavo</h4>
<%          
           if (board.getE84RCN().equals("0")) {
           		readonly = "false";
           } else {
           		readonly = "true";
           }
           break;
        case 9 : 
%> 
			<h4 align="left">Noveno</h4>
<%          
           if (board.getE94RCN().equals("0")) {
           		readonly = "false";
           } else {
           		readonly = "true";
           }
           break;
        case 10 : 
%> 
			<h4 align="left">Décimo</h4>
<%          
           if (board.getEA4RCN().equals("0")) {
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
        	<table cellspacing="0" cellpadding="2" width="100%" border="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF" align="center">
          		<tr id="trclear"> 
           			<td width="42%" nowrap><div align="right">Número de Cliente : </div></td>
           			<td width="58%" nowrap> 
             			<input type="text" name="E<%= name %>4RCN" maxlength="9" size="10" value="<%= board.getField("E" + name + "4RCN").getString().trim()%>">
             			<a href="javascript:GetCustomerDetails('E<%=name%>4RCN','E<%=name%>4MA1','E<%=name%>4BNI','','','E<%=name%>4MA2','E<%=name%>4MA3','','E<%=name%>4CTY','','E<%=name%>4CTR','E<%=name%>4POB','','','','','','E<%=name%>4HPN')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a>	
           			</td>
          		</tr>
          		<tr id="trdark"> 
            		<td width="42%" nowrap><div align="right">Nombre del Directivo :</div></td>
            		<td nowrap width="58%"> 
              			<input type="text" name="E<%= name %>4MA1" maxlength="60" size="65" value="<%= board.getField("E" + name + "4MA1").getString().trim()%>" <%= READ_ONLY_TAG %>>
              		</td>
          		</tr>
          
			<%	if (board.getH04SCR().equals("07")) { %> 	
					<jsp:include page="ESD0080_address_template_basic_panama.jsp" flush="true">
						<jsp:param name="suffix" value='<%="E"+name+"4"%>' />
						<jsp:param name="title" value="Direcci&oacute;n" />
						<jsp:param name="messageName" value="board" />
						<jsp:param name="readOnly" value="<%=readonly%>" />
						<jsp:param name="basic" value="false" />
					</jsp:include>
	
			<% } else if( board.getH04SCR().equals("03")) { %> 
       				<jsp:include page="ESD0080_address_template_simple_venezuela.jsp"  flush="true">
          				<jsp:param name="index" value="<%=name%>" />
			          	<jsp:param name="title" value="Direccion" />
				        <jsp:param name="messageName" value="board" />
			            <jsp:param name="addressType" value="S" />
			            <jsp:param name="readOnly"  value="<%=readonly%>" />
			       	</jsp:include>
      	
			<%} else if( board.getH04SCR().equals("18")){%> 	
				<jsp:include page="ESD0080_address_template_simple_chile.jsp" flush="true">
			          <jsp:param name="index" value="<%=name%>" />
		    	      <jsp:param name="title" value="Direccion" />
		        	  <jsp:param name="messageName" value="board" />
		              <jsp:param name="addressType" value="S" />
		              <jsp:param name="readOnly"  value="<%=readonly%>" />
				</jsp:include>
           
         	<%		  } else { %>
			           <jsp:include page="ESD0080_address_template_simple_generic.jsp"  flush="true">
				          <jsp:param name="index" value="<%=name%>" />
				          <jsp:param name="title" value="Direccion" />
				          <jsp:param name="messageName" value="board" />
			              <jsp:param name="addressType" value="S" />
			              <jsp:param name="readOnly"  value="<%=readonly%>" />
			           </jsp:include>
			<%		  } %>   
          
          		<tr id="trdark"> 
            		<td width="42%" nowrap><div align="right">Nacionalidad :</div></td>
            		<td width="58%" nowrap> 
              			<input type="text" name="E<%= name %>4BNC" maxlength="4" size="5" value="<%= board.getField("E" + name + "4BNC").getString().trim()%>" <%= READ_ONLY_TAG %>>
           				<% if (READ_ONLY_TAG.equals("")) { %>
              				<a href="javascript:GetCodeCNOFC('E<%= name %>4BNC','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></a> 
           				<% } %>
              		</td>
          		</tr>
          		<tr id="trclear"> 
            		<td width="42%" nowrap><div align="right">Cargo :</div></td>
            		<td width="58%" nowrap> 
              			<input type="hidden" name="C<%= name %>4CAR" maxlength="35" size="36" value="">
              			<input type="text" name="E<%= name %>4CAR" maxlength="35" size="36" value="<%= board.getField("E" + name + "4CAR").getString().trim()%>" >
           				<a href="javascript:GetCodeDescCNOFC('<%= "C" + name %>4CAR','<%= "E" + name %>4CAR','32')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a> 
              		</td>
          		</tr>
          		<tr id="trdark"> 
            		<td width="42%" nowrap><div align="right">Fecha :</div></td>
            		<td width="58%" nowrap> 
              			<input type="text" name="E<%= name %>4D21" maxlength="2" size="2" value="<%= board.getField("E" + name + "4D21").getString().trim()%>" <%= READ_ONLY_TAG %>>
              			<input type="text" name="E<%= name %>4D22" maxlength="2" size="2" value="<%= board.getField("E" + name + "4D22").getString().trim()%>" <%= READ_ONLY_TAG %>>
              			<input type="text" name="E<%= name %>4D23" maxlength="4" size="4" value="<%= board.getField("E" + name + "4D23").getString().trim()%>" <%= READ_ONLY_TAG %>>
              		</td>
          		</tr>
          		<tr id="trclear"> 
            		<td width="42%" nowrap ><div align="right">Profesi&oacute;n/Ocupaci&oacute;n :</div></td>
            		<td width="58%" nowrap > 
                		<input type="text" name="E<%= name %>4MLC" value="<%= board.getField("E" + name + "4MLC").getString().trim()%>" size="5" maxlength="4" <%= READ_ONLY_TAG %>>
           				<% if (READ_ONLY_TAG.equals("")) { %>
	                		<a href="javascript:GetCodeCNOFC('E<%= name %>4MLC','49')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"  ></a>	
           				<% } %>
            		</td>
          		</tr>
          		<tr id="trdark"> 
            		<td width="42%" nowrap><div align="right">En Calidad de :</div></td>
            		<td width="58%" nowrap> 
              			<input type="text" name="E<%= name %>4INC" value="<%= board.getField("E" + name + "4INC").getString().trim()%>" size="5" maxlength="4" <%= READ_ONLY_TAG %>>
                   		<a href="javascript:GetCodeCNOFC('E<%= name %>4INC','33')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"  border="0"  ></a>	
               		</td>
          		</tr>
          		<tr id="trclear"> 
            		<td width="42%" nowrap ><div align="right">Estado Civil :</div></td>
            		<td width="58%" nowrap > 
              			<select name="E<%= name %>4BMS" <%= DISABLED_TAG %>>
                			<option value=2 <% if (board.getField("E" + name + "4BMS").getString().equals("2")) out.print("selected"); %>>Casado(a)</option>
                			<option value=1 <% if (board.getField("E" + name + "4BMS").getString().equals("1")) out.print("selected"); %>>Soltero(a)</option>
                			<option value=3 <% if (board.getField("E" + name + "4BMS").getString().equals("3")) out.print("selected"); %>>Divorciado(a)</option>
                			<option value=4 <% if (board.getField("E" + name + "4BMS").getString().equals("4")) out.print("selected"); %>>Viudo(a)</option>
                			<option value=5 <% if (board.getField("E" + name + "4BMS").getString().equals("5")) out.print("selected"); %>>Otros</option>
                			<option value=0 <% if ( !(board.getField("E" + name + "4BMS").getString().equals("1") || board.getField("E" + name + "4BMS").getString().equals("2") || board.getField("E" + name + "4BMS").getString().equals("3") || board.getField("E" + name + "4BMS").getString().equals("4") || board.getField("E" + name + "4BMS").getString().equals("5"))) out.print("selected"); %>></option>
              			</select>
              		</td>
          		</tr>
          		<tr id="trdark"> 
            		<td width="42%" nowrap><div align="right">Sexo :</div></td>
        			<td width="58%" nowrap> 
          				<input type="radio" name="E<%= name %>4BSX" value="F" <% if (board.getField("E" + name + "4BSX").getString().equals("F")) out.print("checked"); %> checked <%= DISABLED_TAG %>>
          				Femenino 
          				<input type="radio" name="E<%= name %>4BSX" value="M" <% if (board.getField("E" + name + "4BSX").getString().equals("M")) out.print("checked"); %> <%= DISABLED_TAG %>>
          				Masculino 
          			</td>
      			</tr>
      			<tr id="trclear"> 
            		<td width="42%" nowrap><div align="right">Tel&eacute;fono :</div></td>
            		<td width="58%" nowrap> 
              			<input type="text" name="E<%= name %>4HPN" maxlength="15" size="16" value="<%= board.getField("E" + name + "4HPN").getString().trim()%>" <%= READ_ONLY_TAG %>>
              		</td>
          		</tr>
          
          	<% if (!board.getH04SCR().equals("07")) { %>           
          		<tr id="trdark"> 
            		<td width="42%" nowrap><div align="right">Identificaci&oacute;n :</div></td>
            		<td width="58%" nowrap> 
              			<input type="text" name="E<%= name %>4BNI" maxlength="25" size="26" value="<%= board.getField("E" + name + "4BNI").getString().trim()%>" <%= READ_ONLY_TAG %>>
              		</td>
          		</tr>
          		<tr id="trclear">
            		<td width="42%" ><div align="right">Tipo :</div>
            	</td>
            		<td width="58%" nowrap > 
              			<input type="text" name="E<%= name %>4TID" value="<%= board.getField("E" + name + "4TID").getString().trim()%>" size="5" maxlength="4" <%= READ_ONLY_TAG %>>
            <% 	if (READ_ONLY_TAG.equals("")) { %>
              			<a href="javascript:GetCodeCNOFC('E<%= name %>4TID','34')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>	
			<% } %>  
			   		</td>
          		</tr>
          		<tr id="trdark"> 
            		<td width="42%" ><div align="right">Expedido En :</div></td>
            		<td width="58%" nowrap> 
              			<input type="text" name="E<%= name %>4PID" size="5" maxlength="4" value="<%= board.getField("E" + name + "4PID").getString().trim()%>" <%= READ_ONLY_TAG %>>
            <%		if (READ_ONLY_TAG.equals("")) { %>
			  				<a href="javascript:GetCodeCNOFC('E<%= name %>4PID','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
			<%	} 	%> 
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

<div align="center"><input id="EIBSBTN" type=submit name="Submit" value="Enviar"></div>

</form>
</body>
</html>
