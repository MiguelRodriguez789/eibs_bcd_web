<html>
<head>
<title>Untitled Document</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
 
 
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/CrossBrowserFunctions.js"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/Address.js"> </SCRIPT>


<jsp:useBean id= "stockHolder" class= "datapro.eibs.beans.ESD000004Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />


<SCRIPT type="text/javascript">

   builtNewMenu(client_inq_corp_opt);

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
<h3 align="center">Accionistas  <img src="<%=request.getContextPath()%>/images/e_ibs.gif"  align="left" name="EIBS_GIF" title="cleint_corp_stock_holder, ESD0080"></h3>
<hr size="4">

 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080" >
 <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="14">

<p>
<table class="tableinfo">
  <tr > 
    <td> 
      <table cellspacing="0" cellpadding="2" width="100%" class="tbhead"   align="center">
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
 <td align="left"><h4>Primero</h4></td>
<%          
           break;
        case 2 : 
%> 
 <td align="left"><h4>Segundo</h4></td>
<%          
           break;
        case 3 : 
%> 
<td align="left"><h4>Tercero</h4></td>
<%          
           break;
        case 4 : 
%> 
<td align="left"><h4>Cuarto</h4></td>
<%          
           break;
        case 5 : 
%> 
<td align="left"><h4>Quinto</h4></td>
<%          
           break;
        case 6 : 
%> 
<td align="left"><h4>Sexto</h4></td>
<%          
           break;
        case 7 : 
%> 
<td align="left"><h4>Séptimo</h4></td>
<%          
           break;
        case 8 : 
%> 
<td align="left"><h4>Octavo</h4></td>
<%          
           break;
        case 9 : 
%> 
<td align="left"><h4>Noveno</h4></td>
<%          
           break;
        case 10 : 
%> 
<td align="left"><h4>Décimo</h4></td>
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
    <tr bgcolor="#FFFFFF" bordercolor="#FFFFFF"> 
      <td> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" name="TB_BENEFICIARY_CORP" bgcolor="#FFFFFF" bordercolor="#FFFFFF" bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF"  align="center">
           <tr id="trclear"> 
           <td width="42%" nowrap> 
              <div align="right">Número de Cliente : </div>
           </td>
           <td width="58%" nowrap> 
             <input type="text" readonly name="E<%= name %>4RCN" maxlength="9" size="10" value="<%= stockHolder.getField("E" + name + "4RCN").getString().trim()%>">
           </td>
          </tr>
          <tr id="trdark"> 
            <td width="42%" nowrap> 
              <div align="right">Nombre del Accionista :</div>
            </td>
            <td nowrap width="58%"> 
              <input type="text" readonly name="E<%= name %>4MA1" maxlength="60" size="65" value="<%= stockHolder.getField("E" + name + "4MA1").getString().trim()%>">
              </td>
          </tr>

          
          <%--
          <tr id="trclear"> 
            <td width="42%" nowrap> 
              <div align="right">Dirección :</div>
            </td>
            <td width="58%" nowrap> 
              <input type="text" readonly name="E<%= name %>4MA2" maxlength="35" size="36" value="<%= stockHolder.getField("E" + name + "4MA2").getString().trim()%>">
              </td>
          </tr>
          <tr id="trdark"> 
            <td width="42%" nowrap> 
              <div align="right"></div>
            </td>
            <td width="58%" nowrap> 
              <input type="text" readonly name="E<%= name %>4MA3" maxlength="35" size="36" value="<%= stockHolder.getField("E" + name + "4MA3").getString().trim()%>">
              </td>
          </tr>
          <%if(!currUser.getE01INT().equals("18")){%>
          <tr id="trclear"> 
            <td width="42%" nowrap> 
              <div align="right">Ciudad :</div>
            </td>
            <td width="58%" nowrap> 
              <input type="text" readonly name="E<%= name %>4CTY" maxlength="30" size="31" value="<%= stockHolder.getField("E" + name + "4CTY").getString().trim()%>">
              </td>
          </tr>
          <tr id="trdark"> 
            <td width="42%" nowrap> 
              <div align="right">Estado :</div>
            </td>
            <td width="58%" nowrap> 
              <input type="text" readonly name="E<%= name %>4STE" maxlength="4" size="5" value="<%= stockHolder.getField("E" + name + "4STE").getString().trim()%>">
            </td>
          </tr>
          <%}%>
          <tr id="trclear"> 
            <td width="42%" nowrap> 
              <div align="right">País :</div>
            </td>
            <td width="58%" nowrap> 
              <input type="text" readonly name="E<%= name %>4CTR" maxlength="20" size="21" value="<%= stockHolder.getField("E" + name + "4CTR").getString().trim()%>">
              </td>
          </tr>
          <tr id="trdark"> 
            <td width="42%" nowrap> 
              <div align="right">Apartado Postal :</div>
            </td>
            <td width="58%" nowrap> 
              <input type="text" readonly name="E<%= name %>4POB" maxlength="10" size="11" value="<%= stockHolder.getField("E" + name + "4POB").getString().trim()%>">
              </td>
          </tr>
          <tr id="trclear"> 
            <td width="42%" nowrap> 
              <div align="right">Código Postal : </div>
            </td>
            <td width="58%" nowrap> 
              <input type="text" readonly name="E<%= name %>4ZPC" maxlength="15" size="16" value="<%= stockHolder.getField("E" + name + "4ZPC").getString().trim()%>">
              </td>
          </tr>
          --%>
         
		<%	if( stockHolder.getH04SCR().equals("07")){%> 	
		 <tr>
		 	<td colspan="2">
			<jsp:include page="ESD0080_address_template_basic_panama.jsp" flush="true">
				<jsp:param name="suffix" value='<%="E"+name+"4"%>' />
				<jsp:param name="title" value="Direcci&oacute;n" />
				<jsp:param name="messageName" value="stockHolder" />
				<jsp:param name="readOnly" value="true" />
				<jsp:param name="basic" value="false" />
			</jsp:include>
			</td>
		 </tr>	

		<%} else if( stockHolder.getH04SCR().equals("03")) {%> 
           <jsp:include page="ESD0080_address_template_simple_venezuela.jsp"  flush="true">
	          <jsp:param name="index" value="<%=name%>" />
	          <jsp:param name="title" value="Direccion" />
	          <jsp:param name="messageName" value="stockHolder" />
              <jsp:param name="addressType" value="S" />
              <jsp:param name="readOnly"  value="true" />
           </jsp:include>
	
		<%} else if( stockHolder.getH04SCR().equals("18")){%> 	
			<jsp:include page="ESD0080_address_template_simple_chile.jsp" flush="true">
		          <jsp:param name="index" value="<%=name%>" />
		          <jsp:param name="title" value="Direccion" />
		          <jsp:param name="messageName" value="stockHolder" />
	              <jsp:param name="addressType" value="S" />
	              <jsp:param name="readOnly"  value="true" />
			</jsp:include>
           
         <%} else { %>
           <jsp:include page="ESD0080_address_template_simple_generic.jsp"  flush="true">
	          <jsp:param name="index" value="<%=name%>" />
	          <jsp:param name="title" value="Direccion" />
	          <jsp:param name="messageName" value="stockHolder" />
              <jsp:param name="addressType" value="S" />
              <jsp:param name="readOnly"  value="true" />
           </jsp:include>

		<%} %>   
         
          <tr id="trdark"> 
            <td width="42%" nowrap> 
              <div align="right">Nacionalidad :</div>
            </td>
            <td width="58%" nowrap> 
              <input type="text" readonly name="E<%= name %>4BNC" maxlength="4" size="5" value="<%= stockHolder.getField("E" + name + "4BNC").getString().trim()%>">
            </td>
          </tr>
        

 

          <tr id="trclear"> 
            <td width="42%" nowrap> 
              <div align="right">Cargo :</div>
            </td>
            <td width="58%" nowrap> 
              <input type="text" readonly name="E<%= name %>4CAR" maxlength="35" size="36" value="<%= stockHolder.getField("E" + name + "4CAR").getString().trim()%>">
              </td>
          </tr>
          <tr id="trdark"> 
            <td width="42%" nowrap> 
              <div align="right">Fecha :</div>
            </td>
            <td width="58%" nowrap> 
              <input type="text" readonly name="E<%= name %>4D21" maxlength="2" size="2" value="<%= stockHolder.getField("E" + name + "4D21").getString().trim()%>">
              <input type="text" readonly name="E<%= name %>4D22" maxlength="2" size="2" value="<%= stockHolder.getField("E" + name + "4D22").getString().trim()%>">
              <input type="text" readonly name="E<%= name %>4D23" maxlength="4" size="4" value="<%= stockHolder.getField("E" + name + "4D23").getString().trim()%>">
              </td>
          </tr>
          <tr id="trclear"> 
            <td width="42%" nowrap > 
              <div align="right">Profesi&oacute;n/Ocupaci&oacute;n :</div>
            </td>
            <td width="58%" nowrap > 
              <p> 
                <input type="text" readonly name="E<%= name %>4MLC" value="<%= stockHolder.getField("E" + name + "4MLC").getString().trim()%>" size="5" maxlength="4">
              </p>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="42%" nowrap> 
              <div align="right">En Calidad de :</div>
            </td>
            <td width="58%" nowrap> 
              <input type="text" readonly name="D<%= name %>4INC" maxlength="45" size="46" value="<%= stockHolder.getField("D" + name + "4INC").getString().trim()%>">
              </td>
          </tr>
          <tr id="trclear"> 
            <td width="42%" nowrap > 
              <div align="right">Estado Civil :</div>
            </td>
            <td width="58%" nowrap > 
              <input type="text" readonly  name="E<%= name %>4BMS" size="25" maxlength="30" 
				  value="<% if (stockHolder.getField("E" + name + "4BMS").getString().equals("1")) out.print("Casado(a)");
							else if (stockHolder.getField("E" + name + "4BMS").getString().equals("2")) out.print("Soltero(a)");
							else if (stockHolder.getField("E" + name + "4BMS").getString().equals("3")) out.print("Divorciado(a)");
							else if (stockHolder.getField("E" + name + "4BMS").getString().equals("4")) out.print("Viudo(a)");
							else if (stockHolder.getField("E" + name + "4BMS").getString().equals("5")) out.print("Otros");
						    else out.print("");%>" 
				>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="42%" nowrap> 
              <div align="right">Sexo :</div>
            </td>
            <td width="58%" nowrap> 
              <input type="text" readonly  name="E<%= name %>4BSX" size="20" maxlength="25" 
				  value="<% if (stockHolder.getField("E" + name + "4BSX").getString().equals("F")) out.print("Femenino");
							else if (stockHolder.getField("E" + name + "4BSX").getString().equals("M")) out.print("Masculino");
						    else out.print("");%>" 
				>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="42%" nowrap> 
              <div align="right">Teléfono :</div>
            </td>
            <td width="58%" nowrap> 
              <input type="text" readonly name="E<%= name %>4HPN" maxlength="15" size="16" value="<%= stockHolder.getField("E" + name + "4HPN").getString().trim()%>">
              </td>
          </tr>
          
          <%if( !stockHolder.getH04SCR().equals("07") ){ %>           
          <tr id="trdark"> 
            <td width="42%" nowrap> 
              <div align="right">Identificación :</div>
            </td>
            <td width="58%" nowrap> 
              <input type="text" readonly name="E<%= name %>4BNI" maxlength="25" size="26" value="<%= stockHolder.getField("E" + name + "4BNI").getString().trim()%>">
              </td>
          </tr>
          <tr id="trclear"> 
            <td width="42%" > 
              <div align="right">Tipo :</div>
            </td>
            
            <td width="58%" nowrap > 
              <input type="text" name="E<%= name %>4TID" readonly value="<%= stockHolder.getField("E" + name + "4TID").getString().trim()%>" size="5" maxlength="4">
              </td>
          </tr>
          <tr id="trdark"> 
            <td width="42%" nowrap>
              <div align="right">Expedido en :</div>
            </td>
            <td width="58%" nowrap> 
              <input type="text" readonly name="E<%= name %>4PID" size="5" maxlength="4" value="<%= stockHolder.getField("E" + name + "4PID").getString().trim()%>">
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

 
</form>
</body>
</html>
