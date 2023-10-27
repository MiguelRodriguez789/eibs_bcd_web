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

<SCRIPT type="text/javascript">

<%
	if(userPO.getOption().equals("RT")){
%>
	builtNewMenu(rt_a_opt);
<%
	}
	else if(userPO.getOption().equals("SV")){
%>
	builtNewMenu(sv_a_opt);
<%
	} 
%>

</SCRIPT>

</head>

<body  bgcolor="#FFFFFF">

 <% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
  
    out.println("<SCRIPT> initMenu(); </SCRIPT>");

%>

<h3 align="center">Representantes Legales<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_ap_legal_rep.jsp, EDD1000"></h3>
<hr size="4">
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDD0000" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="24">  
<p>
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" readonly name="E04CUN" size="10" maxlength="9"  value="<%= userPO.getCusNum().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" readonly name="E04NA1" size="45" maxlength="45"  value="<%= userPO.getCusName().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" readonly name="E04CUN" size="13" maxlength="12" value="<%= userPO.getAccNum().trim()%>" >
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" readonly name="E04CCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" >
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" readonly name="E04PRO" size="4" maxlength="4"  value="<%= userPO.getProdCode().trim()%>">
                </b> </div>
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
  for ( int i=1; i<=legalRep_amount; i++ ) {
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
<table>
<tr>
 <td align="left"><h4>Primero</h4></td>
</tr>
</table>
<%          
           break;
        case 2 : 
%> 
<table>
<tr>
 <td align="left"><h4>Segundo</h4></td>
</tr>
</table>
<%          
           break;
        case 3 : 
%> 
<table>
<tr>
<td align="left"><h4>Tercero</h4></td>
</tr>
</table>
<%          
           break;
        case 4 : 
%> 
<table>
<tr>
<td align="left"><h4>Cuarto</h4></td>
</tr>
</table>
<%          
           break;
        case 5 : 
%> 
<table>
<tr>
<td align="left"><h4>Quinto</h4></td>
</tr>
</table>
<%          
           break;
        case 6 : 
%> 
<table>
<tr>
<td align="left"><h4>Sexto</h4></td>
</tr>
</table>
<%          
           break;
        case 7 : 
%> 
<table>
<tr>
<td align="left"><h4>Séptimo</h4></td>
</tr>
</table>
<%          
           break;
        case 8 : 
%> 
<table>
<tr>
<td align="left"><h4>Octavo</h4></td>
</tr>
</table>
<%          
           break;
        case 9 : 
%> 
<table>
<tr>
<td align="left"><h4>Noveno</h4></td>
</tr>
</table>
<%          
           break;
        case 10 : 
%> 
<table>
<tr>
<td align="left"><h4>Décimo</h4></td>
</tr>
</table>
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

  <table id="mainTable<%= name %>" class="tableinfo" >
    <tr bgcolor="#FFFFFF" bordercolor="#FFFFFF"> 
      <td> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" title="TB_legalRepFICIARY_CORP" bgcolor="#FFFFFF" bordercolor="#FFFFFF" align="center">
          <tr id="trdark"> 
           <td width="42%" nowrap> 
              <div align="right">Número de Cliente : </div>
           </td>
           <td width="58%" nowrap> 
             <input type="text" readonly name="E<%= name %>4RCN" maxlength="12" size="12" value="<%= legalRep.getField("E" + name + "4RCN").getString().trim()%>">
           </td>
          </tr>          
          <tr id="trclear"> 
            <td width="42%" nowrap> 
              <div align="right">Nombre Legal :</div>
            </td>
            <td nowrap width="58%"> 
              <input type="text" readonly name="E<%= name %>4MA1" maxlength="45" size="46" value="<%= legalRep.getField("E" + name + "4MA1").getString().trim()%>">
              </td>
          </tr>
		<%	if( legalRep.getH04SCR().equals("07")){%> 	
		 <tr>
		 	<td colspan="2">
			<jsp:include page="ESD0080_address_template_basic_panama.jsp" flush="true">
				<jsp:param name="suffix" value='<%="E"+name+"4"%>' />
				<jsp:param name="title" value="Direcci&oacute;n" />
				<jsp:param name="messageName" value="legalRep" />
				<jsp:param name="readOnly" value="true" />
				<jsp:param name="basic" value="false" />
			</jsp:include>
			</td>
		 </tr>	
		<%} else if( legalRep.getH04SCR().equals("03")) {%> 

           <jsp:include page="ESD0080_address_template_simple_venezuela.jsp"  flush="true">
	          <jsp:param name="index" value="<%=name%>" />
	          <jsp:param name="messageName" value="legalRep" />
              <jsp:param name="addressType" value="S" />
              <jsp:param name="readOnly"  value="true" />
           </jsp:include>
	
		<%} else if( legalRep.getH04SCR().equals("18")){%> 	
			<jsp:include page="ESD0080_address_template_simple_chile.jsp" flush="true">
		          <jsp:param name="index" value="<%=name%>" />
		          <jsp:param name="messageName" value="legalRep" />
	              <jsp:param name="addressType" value="S" />
	              <jsp:param name="readOnly"  value="true" />
			</jsp:include>
           
         <%} else { %>
           <jsp:include page="ESD0080_address_template_simple_generic.jsp"  flush="true">
	          <jsp:param name="index" value="<%=name%>" />
	          <jsp:param name="messageName" value="legalRep" />
              <jsp:param name="addressType" value="S" />
              <jsp:param name="readOnly"  value="true" />
           </jsp:include>

		<%} %>   
             
          <tr id="trdark"> 
            <td width="42%" nowrap> 
              <div align="right">Nacionalidad :</div>
            </td>
            <td width="58%" nowrap> 
              <input type="text" readonly name="E<%= name %>4BNC" maxlength="4" size="5" value="<%= legalRep.getField("E" + name + "4BNC").getString().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="42%" nowrap> 
              <div align="right">Cargo :</div>
            </td>
            <td width="58%" nowrap> 
              <input type="text" readonly name="E<%= name %>4CAR" maxlength="35" size="36" value="<%= legalRep.getField("E" + name + "4CAR").getString().trim()%>">
              </td>
          </tr>
          <tr id="trdark"> 
            <td width="42%" nowrap> 
              <div align="right">Fecha :</div>
            </td>
            <td width="58%" nowrap> 
              <input type="text" readonly name="E<%= name %>4DT1" maxlength="2" size="2" value="<%= legalRep.getField("E" + name + "4DT1").getString().trim()%>">
              <input type="text" readonly name="E<%= name %>4DT2" maxlength="2" size="2" value="<%= legalRep.getField("E" + name + "4DT2").getString().trim()%>">
              <input type="text" readonly name="E<%= name %>4DT3" maxlength="4" size="5" value="<%= legalRep.getField("E" + name + "4DT3").getString().trim()%>">
              </td>
          </tr>
          <tr id="trclear"> 
            <td width="42%" nowrap > 
              <div align="right">Profesi&oacute;n/Ocupaci&oacute;n :</div>
            </td>
            <td width="58%" nowrap > 
              <p> 
                <input type="text" readonly name="E<%= name %>4MLC" value="<%= legalRep.getField("E" + name + "4MLC").getString().trim()%>" size="5" maxlength="4">
              </p>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="42%" nowrap> 
              <div align="right">En Calidad de :</div>
            </td>
            <td width="58%" nowrap> 
              <input type="text" readonly name="E<%= name %>4INC" maxlength="4" size="5" value="<%= legalRep.getField("E" + name + "4INC").getString().trim()%>">
              </td>
          </tr>
          <tr id="trclear"> 
            <td width="42%" nowrap > 
              <div align="right">Estado Civil :</div>
            </td>
            <td width="58%" nowrap > 
              <input type="text" readonly  name="E<%= name %>4BMS" size="25" maxlength="30" 
				  value="<% if (legalRep.getField("E" + name + "4BMS").getString().equals("1")) out.print("Casado(a)");
							else if (legalRep.getField("E" + name + "4BMS").getString().equals("2")) out.print("Soltero(a)");
							else if (legalRep.getField("E" + name + "4BMS").getString().equals("3")) out.print("Divorciado(a)");
							else if (legalRep.getField("E" + name + "4BMS").getString().equals("4")) out.print("Viudo(a)");
							else if (legalRep.getField("E" + name + "4BMS").getString().equals("5")) out.print("Otros");
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
				  value="<% if (legalRep.getField("E" + name + "4BSX").getString().equals("F")) out.print("Femenino");
							else if (legalRep.getField("E" + name + "4BSX").getString().equals("M")) out.print("Masculino");
						    else out.print("");%>" 
				>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="42%" nowrap> 
              <div align="right">Teléfono :</div>
            </td>
            <td width="58%" nowrap> 
              <input type="text" readonly name="E<%= name %>4HPN" maxlength="15" size="16" value="<%= legalRep.getField("E" + name + "4HPN").getString().trim()%>">
              </td>
          </tr>
          
    <%if( !legalRep.getH04SCR().equals("07") ){%> 
          <tr id="trdark"> 
            <td width="42%" nowrap> 
              <div align="right">Identificación :</div>
            </td>
            <td width="58%" nowrap> 
              <input type="text" readonly name="E<%= name %>4BNI" maxlength="25" size="26" value="<%= legalRep.getField("E" + name + "4BNI").getString().trim()%>">
              </td>
          </tr>
          <tr id="trclear">
            <%if(currUser.getE01INT().equals("18")){%> 
            <td width="42%" > 
              <div align="right">Código de Ciudad :</div>
            </td>
            <%} else {%>
            <td width="42%" > 
              <div align="right">Tipo :</div>
            </td>
            <%}%> 
            
            <td width="58%" nowrap > 
              <input type="text" readonly name="E<%= name %>4TID" value="<%= legalRep.getField("E" + name + "4TID").getString().trim()%>" size="5" maxlength="4">
              
              </td>
          </tr>
          <tr id="trdark"> 
            <%if(currUser.getE01INT().equals("18")){%> 
            <td width="42%" > 
              <div align="right">Comuna :</div>
            </td>
            <%} else {%>
            <td width="42%" > 
              <div align="right">País :</div>
            </td>
            <%}%>
             
            <td width="58%" nowrap> 
              <input type="text" readonly  name="E<%= name %>4PID" size="5" maxlength="4" value="<%= legalRep.getField("E" + name + "4PID").getString().trim()%>">
              </td>
          </tr>
		<% } %>
        </table>
        

  </table>
 <%
  }
%>
</div>
<SCRIPT type="text/javascript">
   getElement('dataDiv').style.height=  getElement('mainTable1').offsetTop + getElement("mainTable1").offsetHeight +"";
</SCRIPT>
  
  
    </form>
</body>
</html>
