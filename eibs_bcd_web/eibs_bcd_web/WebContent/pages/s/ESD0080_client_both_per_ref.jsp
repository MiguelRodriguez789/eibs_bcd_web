<html>
<head>
<title>Referencias Personales</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</head>

<jsp:useBean id= "perRef" class= "datapro.eibs.beans.ESD000004Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
 
 

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/CrossBrowserFunctions.js"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/Address.js"> </SCRIPT>


<SCRIPT type="text/javascript">

     <% 
   if ( userPO.getOption().equals("CLIENT_P") ) {
   %>
		builtNewMenu(client_personal_opt);
  <%      
   }
   else
   {
   %>
		builtNewMenu(client_corp_opt);
   <%
   }
   %>

</SCRIPT>

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
<h3 align="center">Referencias Personales<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_both_per_ref, ESD0080"></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="44">
   

<table class="tableinfo">
  <tr > 
    <td> 
      <table cellspacing="0" cellpadding="2" class="tbhead" width="100%"   align="center">
        <tr>
            <td nowrap width="10%" align="right"> Cliente: 
               </td>
          <td nowrap width="12%" align="left">
      			<%= userPO.getHeader1()%>
          </td>
            <td nowrap width="6%" align="right">ID:  
            </td>
          <td nowrap width="14%" align="left">
      			<%= userPO.getHeader2()%>
          </td>
            <td nowrap width="8%" align="right"> Nombre: 
               </td>
          <td nowrap width="50%"align="left">
      			<%= userPO.getHeader3()%>
          </td>
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
  for ( int i=1; i<=bene_amount; i++ ) {
    if ( i == 10 ) {
      name = "A"; 
    }
    else {
      name = i + "";
    }
    
    out.println("<table class=\"tbenter\" border=\"0\" width=\"100%\">");
    out.println("<tr>");
    
    switch ( i ) {
        case 1 :     
%> 
 <td align="left"><h4>Primera</h4></td>
<%          
           break;
        case 2 : 
%> 
 <td align="left"><h4>Segunda</h4></td>
<%          
           break;
        case 3 : 
%> 
<td align="left"><h4>Tercera</h4></td>
<%          
           break;
        case 4 : 
%> 
<td align="left"><h4>Cuarta</h4></td>
<%          
           break;
        case 5 : 
%> 
<td align="left"><h4>Quinta</h4></td>
<%          
           break;
        case 6 : 
%> 
<td align="left"><h4>Sexta</h4></td>
<%          
           break;
        case 7 : 
%> 
<td align="left"><h4>Séptima</h4></td>
<%          
           break;
        case 8 : 
%> 
<td align="left"><h4>Octava</h4></td>
<%          
           break;
        case 9 : 
%> 
<td align="left"><h4>Novena</h4></td>
<%          
           break;
        case 10 : 
%> 
<td align="left"><h4>Décima</h4></td>
<%          
           break;
     }
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
  

            
   <tr bordercolor="#FFFFFF"> 
      <td nowrap >
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="center">

         <tr id="trdark"> 
           <td width="42%" nowrap> 
              <div align="right">Número de Cliente : </div>
           </td>
           <td width="58%" nowrap> 
             <input type="text" name="E<%= name %>4RCN" maxlength="09" size="10" value="<%= perRef.getField("E" + name + "4RCN").getString().trim()%>">
             <a href="javascript:GetCustomerDetails2('E<%=name%>4RCN','E<%=name%>4MA1','E<%=name%>4BNI','','','E<%=name%>4CTR','E<%=name%>4STE','E<%=name%>4UC2','E<%=name%>4MUN','E<%=name%>4CTY','E<%=name%>4PAR','E<%=name%>4ZPC','E<%=name%>4MA2','E<%=name%>4NM4','E<%=name%>4NM5','E<%=name%>4N32','E<%=name%>4N33','E<%=name%>4NME','E<%=name%>4POB','','','','','E<%=name%>4HPN')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a>	
           </td>
        </tr>

         <tr id="trclear"> 
            <td nowrap width="42%"> 
              <div align="right">Nombre :</div>
            </td>
            <td nowrap width="58%"> 
              <input type="text" name="E<%= name %>4MA1" maxlength="60" size="65" value="<%= perRef.getField("E" + name + "4MA1").getString().trim()%>">
            </td>
          </tr>
         <tr> 


          <%--
            <td nowrap width="42%"> 
              <div align="right">Direcci&oacute;n 
                :</div>
            </td>
            <td nowrap width="58%"> 
              <input type="text" name="E<%= name %>4MA2" maxlength="35" size="36" value="<%= perRef.getField("E" + name + "4MA2").getString().trim()%>">
            </td>
          </tr>
         <tr id="trdark"> 
            <td nowrap width="42%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="58%"> 
              <input type="text" name="E<%= name %>4MA3" maxlength="35" size="36" value="<%= perRef.getField("E" + name + "4MA3").getString().trim()%>">
            </td>
          </tr>
         <tr> 
            <td nowrap width="42%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="58%"> 
              <input type="text" name="E<%= name %>4MA4" maxlength="35" size="36" value="<%= perRef.getField("E" + name + "4MA4").getString().trim()%>">
            </td>
          </tr>
         <%if(currUser.getE01INT().equals("18")){%> 
           <tr id="trdark"> 
            <td nowrap width="42%"> 
              <div align="right">C&oacute;digo de Ciudad 
                :</div>
            </td>
            <td nowrap width="58%"> 
              <input type="text" name="E<%= name %>4TID" maxlength="5" size="4" value="<%= perRef.getField("E" + name + "4TID").getString().trim()%>">
              <a href="javascript:GetCodeCNOFC('E<%= name %>4TID','84')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>	
            </td>
          </tr>
         <tr> 
            <td nowrap width="42%"> 
              <div align="right">Comuna :</div>
            </td>
            <td nowrap width="58%"> 
              <input type="text" name="E<%= name %>4PID" maxlength="5" size="4" value="<%= perRef.getField("E" + name + "4PID").getString().trim()%>">
              <a href="javascript:GetCodeCNOFC('E<%= name %>4PID','80')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
            </td>
          </tr>
		 <%} else {%>

         <tr id="trdark"> 
            <td nowrap width="42%"> 
              <div align="right">Ciudad :</div>
            </td>
            <td nowrap width="58%"> 
              <input type="text" name="E<%= name %>4CTY" maxlength="30" size="31" value="<%= perRef.getField("E" + name + "4CTY").getString().trim()%>">
            </td>
          </tr>
         <tr> 
            <td nowrap width="42%"> 
              <div align="right">Estado :</div>
            </td>
            <td nowrap width="58%"> 
              <input type="text" name="E<%= name %>4STE" maxlength="4" size="5" value="<%= perRef.getField("E" + name + "4STE").getString().trim()%>">
              <a href="javascript:GetCodeCNOFC('E<%= name %>4STE','27')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></a>	
            </td>
          </tr>
        <%}%>
         <tr id="trdark"> 
            <td nowrap width="42%"> 
              <div align="right">Pa&iacute;s :</div>
            </td>
            <td nowrap width="58%"> 
              <input type="text" name="E<%= name %>4CTR" maxlength="20" size="21" value="<%= perRef.getField("E" + name + "4CTR").getString().trim()%>">
            </td>
          </tr>
         <tr> 
            <td nowrap width="42%"> 
              <div align="right">Apartado Postal :</div>
            </td>
            <td nowrap width="58%"> 
              <input type="text" name="E<%= name %>4POB" maxlength="10" size="11" value="<%= perRef.getField("E" + name + "4POB").getString().trim()%>">
            </td>
          </tr>
         <tr id="trdark"> 
            <td nowrap width="42%"> 
              <div align="right">C&oacute;digo Postal 
                :</div>
            </td>
            <td nowrap width="58%"> 
              <input type="text" name="E<%= name %>4ZPC" maxlength="15" size="16" value="<%= perRef.getField("E" + name + "4ZPC").getString().trim()%>">
            </td>
          </tr>
       --%>
          
		<%	if( perRef.getH04SCR().equals("07")){%> 	
			<jsp:include page="ESD0080_address_template_basic_panama.jsp" flush="true">
				<jsp:param name="suffix" value='<%="E"+name+"4"%>' />
				<jsp:param name="title" value="Direcci&oacute;n" />
				<jsp:param name="messageName" value="perRef" />
				<jsp:param name="readOnly" value="false" />
				<jsp:param name="basic" value="false" />
			</jsp:include>
	
		<%} else if( perRef.getH04SCR().equals("03")) {%> 
           <jsp:include page="ESD0080_address_template_simple_venezuela.jsp"  flush="true">
	          <jsp:param name="index" value="<%=name%>" />
	          <jsp:param name="title" value="Direccion" />
	          <jsp:param name="messageName" value="perRef" />
              <jsp:param name="addressType" value="S" />
              <jsp:param name="readOnly"  value="false" />
           </jsp:include>
	
		<%} else if( perRef.getH04SCR().equals("18")){%> 	
			<jsp:include page="ESD0080_address_template_simple_chile.jsp" flush="true">
		          <jsp:param name="index" value="<%=name%>" />
		          <jsp:param name="title" value="Direccion" />
		          <jsp:param name="messageName" value="perRef" />
	              <jsp:param name="addressType" value="S" />
	              <jsp:param name="readOnly"  value="false" />
			</jsp:include>
           
         <%} else { %>
           <jsp:include page="ESD0080_address_template_simple_generic.jsp"  flush="true">
	          <jsp:param name="index" value="<%=name%>" />
	          <jsp:param name="title" value="Direccion" />
	          <jsp:param name="messageName" value="perRef" />
              <jsp:param name="addressType" value="S" />
              <jsp:param name="readOnly"  value="false" />
           </jsp:include>

		<%} %>   
         

         <tr> 
            <td nowrap width="42%"> 
              <div align="right">Tel&eacute;fono :</div>
            </td>
            <td nowrap width="58%"> 
              <input type="text" name="E<%= name %>4HPN" maxlength="15" size="16" value="<%= perRef.getField("E" + name + "4HPN").getString().trim()%>">
            </td>
          </tr>
          <%if( !perRef.getH04SCR().equals("07") ){ %>          
          <tr id="trdark"> 
            <td width="42%" nowrap> 
              <div align="right">Identificaci&oacute;n :</div>
            </td>
            <td width="58%" nowrap> 
              <input type="text" name="E<%= name %>4BNI" maxlength="25" size="26" value="<%= perRef.getField("E" + name + "4BNI").getString().trim()%>">
              </td>
          </tr>
          
          <tr id="trclear">
            <td width="42%" > 
              <div align="right">Tipo :</div>
            </td>
            <td width="58%" nowrap > 
              <input type="text" name="E<%= name %>4TID" value="<%= perRef.getField("E" + name + "4TID").getString().trim()%>" size="5" maxlength="4">
              <a href="javascript:GetCodeCNOFC('E<%= name %>4TID','34')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>	
              </td>
          </tr>
          <tr id="trdark"> 
            <td width="42%" > 
              <div align="right">Expedido En :</div>
            </td>
            <td width="58%" nowrap> 
              <input type="text" name="E<%= name %>4PID" size="5" maxlength="4" value="<%= perRef.getField("E" + name + "4PID").getString().trim()%>">
              <a href="javascript:GetCodeCNOFC('E<%= name %>4PID','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
              </td>
          </tr>
           <tr id="trclear"> 
             <td nowrap width="42%"> 
               <div align="right">Parentesco :</div>
             </td>
             <td nowrap width="58%">
               <input type="text" name="E<%= name %>4RTL" maxlength="5" size="4" value="<%= perRef.getField("E" + name + "4RTL").getString().trim()%>">
                <a href="javascript:GetCodeCNOFC('E<%= name %>4RTL','9W')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
             </td>
           </tr>
		<% } %>
          
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
  <div align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>
  <p>&nbsp;
</form>
</body>
</html>
