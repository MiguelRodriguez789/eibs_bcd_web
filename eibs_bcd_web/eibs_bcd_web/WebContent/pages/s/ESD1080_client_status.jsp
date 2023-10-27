<!DOCTYPE HTML">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Customer Status Info</title>

<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset="utf-8">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/jquery/themes/smoothness/jquery-ui.css"/> 

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/calendar.js"> </script>
 


<jsp:useBean id="client" class="datapro.eibs.beans.ESD108001Message"  scope="session" /> 
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

 <script>
$(function() {
$( "#tabs" ).tabs();
});

$(document).ready(function () {
    var currentTabIndex = "0";

    $tab = $("#tabs").tabs({
         activate : function (e, ui) {
            currentTabIndex = ui.newTab.index().toString();
            sessionStorage.setItem('tab-index', currentTabIndex);
         }
    });

    if (sessionStorage.getItem('tab-index') != null) {
        currentTabIndex = sessionStorage.getItem('tab-index');
        console.log(currentTabIndex);
        <%  if ( !error.getERRNUM().equals("0") && error.getERDF01().equals("")) error.setERRNUM("0");  
        	if (error.getERRNUM().equals("0") ) { %>
        	$tab.tabs('option', 'active', currentTabIndex);
        <% } else { %>	
        	$tab.tabs('option', 'active', <%=client.getH01SCR()%>);
        <% } %>
    }
    $('#btn-sub').on('click', function () {
        sessionStorage.setItem("tab-index", currentTabIndex);
    });
});


function chgDateCal(v) {
	getElement("E01RE" + v).value = getElement("E01RVD" + v).value +  '/' + getElement("E01RVM" + v).value + '/' + getElement("E01RVY" + v).value;   
 }	
</script>

</head>
 
<body>

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script >

<% 	if (userPO.getPurpose().equals("INQUIRY")) {
		 if (client.getE01LGT().trim().equals("1")) {%>
			builtNewMenu(client_inq_corp_opt);	
<% 		} else { %>
			builtNewMenu(client_inq_personal_opt);
<% 		} 
	} 	%>
initMenu();
	
function goAction(op) {
	document.forms[0].SCREEN.value = op;
	if (op == 4) {
		if (!confirm("Desea borrar este Mantenimiento?")) {
			return;
		}
		document.forms[0].Delete.disabled = true;
	}
	if (op == 5) {
		document.forms[0].Submit.disabled = true;
	}
	document.forms[0].submit();
}

function goMotivo() {
	var x = [ 'E01RE1', 'E01RE2', 'E01RE3', 'E01RE4', 'E01RE5', 'E01RE6', 'E01RE7', 'E01RE8', 'E01RE9', 'E01RE10'];
    cleanFields(x);
    document.forms[0].VALMOT.value="N";
	goAction(5);
}
 </SCRIPT>  
 

<% 
	int row = 0; 
	if ( !error.getERRNUM().equals("0") && !error.getERDF01().equals("")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
    
    String legtyp = (client.getE01LGT().equals("1")?"JURIDICO":"PERSONA");
    String readNew = (userPO.getPurpose().equals("NEW")?"readonly":"");
	String read = "";
 	String disabled = "";
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"campo obligatorio\" align=\"bottom\" border=\"0\" >";
 	String help = "<img src=\"" + request.getContextPath() + "/images/1b.gif\" title=\"Ayuda\" align=\"bottom\" border=\"0\" style=\"cursor:hand\" >";
 	String tf = "false";
 	Boolean isReadOnly = false;
 	Boolean isNew = false;
 	String mTitle = "Mantenimiento ";
 	
	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) 
		{ read = " readonly ";
		  disabled = " disabled";
		  tf = "true";
		  isReadOnly = true;
		}
		
	if (userPO.getPurpose().equals("INQUIRY") || userPO.getPurpose().equals("APPROVAL")) {
		mTitle = "Consulta ";
	}
%>

<H3 align="center"><%=mTitle%> de Estado de Clientes<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_status.jsp, ESD1080"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD1080">
  
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  <INPUT TYPE=HIDDEN NAME="OPE" VALUE="02">
  <INPUT TYPE=HIDDEN NAME="E01OPE" VALUE="02">
  <INPUT TYPE=HIDDEN NAME="VALMOT" VALUE="Y">

  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="5%" align="right">Tipo Legal : </td>
            <td nowrap width="10%" align="left" > <%=legtyp%>
            	<INPUT TYPE=HIDDEN NAME="E01LGT" VALUE="<%= client.getE01LGT()%>" >
			</td>
            <td nowrap width="5%" align="right">Estado : </td>
			<td nowrap width="40%" align="left" style="color:red;font-size:12;">
				<input type="HIDDEN" name="E01STS" VALUE="<%= client.getE01STS()%>" > 
			  	<% if (client.getE01STS().equals("1")) { out.print("INACTIVO"); }
					  	else if (client.getE01STS().equals("2")) { out.print("ACTIVO");  }
						else if (client.getE01STS().equals("3")) { out.print("BLOQUEADO"); }
						else if (client.getE01STS().equals("4")) { out.print("FALLECIDO"); }
						else { out.print(""); } 
				%>	
				<b><%= client.getD01CRT().trim()%></b>		
			</td>
            <td nowrap width="5%" align="right"></td>
			<td nowrap width="35%" align="center" valign="top">
			</td>
		</tr>
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="5%" align="right">Código :</td>
            <td nowrap width="10%" align="left"> 
                <INPUT type="text" name="E01CUN" size="10" readonly value="<%= client.getE01CUN().trim()%>">
			</td>
            <td nowrap width="5%" align="right">Nombre Legal :</td>
			<td nowrap width="40%" align="left">
				<INPUT type="text" name="E01NM6" size="60" readonly value="<%= client.getE01NM6().trim()%>">
			</td>
            <td nowrap width="5%" align="right">Nombre Corto :</td>
			<td nowrap width="35%" align="left">
				<eibsinput:text name="client" property="E01SHN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="26" required="false" readonly="true" modified="F01SHN"/>
			</td>
		</tr>
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="5%" align="right">Tipo ID : </td>
            <td nowrap width="10%" align="left">
            	<eibsinput:text name="client" property="E01TID" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" required="false" readonly="true" modified="F01TID"/> 
			</td>
            <td nowrap width="5%" align="right"><%= client.getD01TID().trim()%> : </td>
			<td nowrap width="40%" align="left">
				<eibsinput:text name="client" property="E01IDN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" required="false" readonly="true" modified="F01IDN"/>
			</td>
            <td nowrap width="5%" align="right">País Identificación : </td>
			<td nowrap width="35%" align="left">
				<eibsinput:text name="client" property="E01PID" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" required="false" readonly="true" modified="F01PID"/>
				<%= client.getD01PID().trim()%>
			</td>
		</tr>
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="5%" align="right"></td>
            <td nowrap width="10%" align="left"> 
			</td>
            <td nowrap width="5%" align="right"></td> 
			<td nowrap width="40%" align="left">
			</td>
            <td nowrap width="5%" align="right"></td>
			<td nowrap width="35%" align="left">
			</td>
		</tr>
        </table>
     
<div id="tabs">  
	<ul>
    	<li><a href="#tab1">Estado</a></li>
	</ul>


<div id="tab1">  <!-- Informacion de Estado  -->
    
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
        	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap width="15%" align="right">Nuevo Estado : </td>
              <td nowrap width="35%" align="left"> 
                <select name="E01NST" <%= disabled %> <%=(client.getF01STS().equals("Y"))?"id=\"txtchanged\"":"" %>>
                	<option value=" " <% if (!(client.getE01NST().equals("1")||client.getE01NST().equals("2") || client.getE01NST().equals("3") || client.getE01NST().equals("4"))) out.print("selected"); %>></option>
                    <option value="1" <% if (client.getE01NST().equals("1")) out.print("selected"); %>>INACTIVO</option>
                    <option value="2" <% if (client.getE01NST().equals("2")) out.print("selected"); %>>ACTIVO</option>                   
                    <option value="3" <% if (client.getE01NST().equals("3")) out.print("selected"); %>>BLOQUEADO</option>
                    <option value="4" <% if (client.getE01NST().equals("4")) out.print("selected"); %>>FALLECIDO</option> 
                </select>
                <%=mandatory %>
              </td>
              <td nowrap width="15%" align="right"></td>
              <td nowrap width="35%" align="left">
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap width="15%" align="right">Causal :</td>
            	<td nowrap width="35%" align="left">
            	<input type="text" name="E01FC1" size="5" maxlength="4" value="<%= client.getE01FC1().trim()%>" <%=read%>>
            		<% if ( !isReadOnly) {%>
            		<a href="javascript:Get2FilterCodes('E01FC1','D01FC1','FU', '',document.forms[0]['E01NST'].value)" >
              		<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" style="cursor:hand" ></a>
              		<% } %>
              		<%=mandatory %>
            	<input type="text" name="D01FC1" size="20" value="<%= client.getD01FC1().trim()%>" readonly><br>
              </td>
              <td nowrap width="15%" align="right">Motivo de Causal :</td>
              <td nowrap width="35%" align="left">
            	<input type="text" name="E01FC2" size="5" maxlength="4" value="<%= client.getE01FC2().trim()%>" <%=read%> onchange="goMotivo();">
            		<% if ( !isReadOnly) {%>
            		<a href="javascript:Get2FilterCodes('E01FC2','D01FC2','FM', '',document.forms[0]['E01FC1'].value)" >
              		<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" style="cursor:hand" ></a>
              		<% } %>
              		<%=mandatory %>
            	<input type="text" name="D01FC2" size="20" value="<%= client.getD01FC2().trim()%>" readonly> 
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap width="15%" align="right">Comentarios :</td>
              <td nowrap width="35%" align="left">
              	<textarea name="E01RMK" cols="64" rows="4" <%=read%>><%=client.getE01RMK()%></textarea>
              </td>
              <td nowrap width="15%" align="right"></td> 
              <td nowrap width="35%" align="left">
              </td> 
            </tr>
          </table>
        </td>
      </tr>
    </table>
   
   <br> 
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <%
          String[] lbl = {  client.getC01LB1(), client.getC01LB2(), client.getC01LB3(), client.getC01LB4(), client.getC01LB5(),
          					client.getC01LB6(), client.getC01LB7(), client.getC01LB8(), client.getC01LB9(), client.getC01LB0()
          				 };
		  String[] typ = {  client.getC01PT1(), client.getC01PT2(), client.getC01PT3(), client.getC01PT4(), client.getC01PT5(),
          					client.getC01PT6(), client.getC01PT7(), client.getC01PT8(), client.getC01PT9(), client.getC01PT0()
          			     };
          String[] lng = {  client.getC01LN1(), client.getC01LN2(), client.getC01LN3(), client.getC01LN4(), client.getC01LN5(),
          					client.getC01LN6(), client.getC01LN7(), client.getC01LN8(), client.getC01LN9(), client.getC01LN0()
          				 };
          String[] dec = {  client.getC01DE1(), client.getC01DE2(), client.getC01DE3(), client.getC01DE4(), client.getC01DE5(),
          					client.getC01DE6(), client.getC01DE7(), client.getC01DE8(), client.getC01DE9(), client.getC01DE0()
          				 };
          String[] vlu = {  client.getE01RE1(), client.getE01RE2(), client.getE01RE3(), client.getE01RE4(), client.getE01RE5(),
          					client.getE01RE6(), client.getE01RE7(), client.getE01RE8(), client.getE01RE9(), client.getE01REA()
          				 };	
          String[] f01 = {  client.getF01RE1(), client.getF01RE2(), client.getF01RE3(), client.getF01RE4(), client.getF01RE5(),
          					client.getF01RE6(), client.getF01RE7(), client.getF01RE8(), client.getF01RE9(), client.getF01REA()
          				 };
          																				        					 
          int y = 1;
          int x = 0; 
          while (y < 11) {
            if (!lbl[x].equals("")) {
             	String v = String.valueOf(y).trim();
             	if (v == "10") v = "A";
          %>
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
             <td nowrap width="35%" align="right"><%=lbl[x]%> :</td>
              <td nowrap width="65%" align="left">
              	<% if (typ[x].equals("A")) { %>
              	<INPUT type="text" name="E01RE<%=v%>" size="40" maxlength="<%=lng[x]%>" value="<%=vlu[x]%>" <%=read%>
              	<%=(f01[x].equals("Y"))?"id=\"txtchanged\"":"" %>>
              	<% } %>
              	<% if (typ[x].equals("N")) { %>
              	<INPUT type="text" name="E01RE<%=v%>" size="25" maxlength="<%=lng[x]%>" value="<%=vlu[x]%>" onKeypress="enterDecimal(event, <%=dec[x]%>)" <%=read%>
              	<%=(f01[x].equals("Y"))?"id=\"txtchanged\"":"" %>>
              	<% } %>
              	<% if (typ[x].equals("B") || typ[x].equals("C")) { %>
              	<INPUT type="text" name="E01RE<%=v%>" size="11" maxlength="<%=lng[x]%>" value="<%=vlu[x]%>" onKeypress="enterInteger(event)" <%=read%>
              	<%=(f01[x].equals("Y"))?"id=\"txtchanged\"":"" %>>
              	<% } %>
              	<% if (typ[x].equals("F")) { %>
              	<INPUT type="text" name="E01RE<%=v%>" value="<%=vlu[x]%>" readonly <%=(f01[x].equals("Y"))?"id=\"txtchanged\"":"" %>>
              	<select class="bear-dates" id="E01RVD<%=v%>" name="E01RVD<%=v%>" <%=disabled%> onchange="chgDateCal('<%=v%>')"></select>
				<select class="bear-months" id="E01RVM<%=v%>" name="E01RVM<%=v%>" <%=disabled%> onchange="chgDateCal('<%=v%>')"></select>
				<select class="bear-years" id="E01RVY<%=v%>" name="E01RVY<%=v%>"  <%=disabled%> onchange="chgDateCal('<%=v%>')"></select>
              	<% } %>
              	<% if (typ[x].equals("S")) { %>
              	<input type="radio" name="E01RE<%=v%>" value="S" <%if (vlu[x].equals("S")) out.print("checked"); %> <%= disabled %> <%=(f01[x].equals("Y"))?"id=\"txtchanged\"":"" %>>
                Si 
                <input type="radio" name="E01RE<%=v%>" value="N" <%if (!vlu[x].equals("S")) out.print("checked"); %> <%= disabled %> <%=(f01[x].equals("Y"))?"id=\"txtchanged\"":"" %>>
                No 
                <% } %>
                <% if (typ[x].equals("C")) { %>
              	<INPUT type="text" name="E01RE<%=v%>" size="11" maxlength="<%=lng[x]%>" value="<%=vlu[x]%>" onKeypress="enterInteger(event)" <%=read%>
              	<%=(f01[x].equals("Y"))?"id=\"txtchanged\"":"" %>>
              	<% } %>
              	<% if (!isReadOnly && (typ[x].equals("C") || typ[x].equals("B"))){%> 
            		<A href="javascript:GetCustomerDescId('E01RE<%=v%>','','','')"><%=help%></a> 
            	<% } %>
              	<% if (!isReadOnly && typ[x].equals("B")) {%> 
            		<A href="javascript:GetBranch('E01RE<%=v%>','<%=currUser.getE01UBK()%>')"><%=help%></a> 
            	<% } %>
            	
             </td>
          </tr>
          
          <%} 
          	x++; 
          	y++;
          } %>
		</table>
      </td>
    </tr>
  </table>
</div>
    


</div>  <!-- Fin de Tabs  -->

<% 	if (userPO.getPurpose().equals("MAINTENANCE") || userPO.getPurpose().equals("NEW")) { %>

	<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    	<tr bgcolor="#FFFFFF"> 
      		<td width="33%" align="center"><input type="checkbox" name="H01FLGWK2" value="1" >Aceptar con Avisos</td>
    	</tr>
  	</table>    
    
    <table width="100%">		
  	<tr>
  		<td width="33%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goAction(5);" <%= disabled %>>
     	  </div>	
  		</td>
  		<td width="33%"> 
  		  <div align="center"> 
  		  	<% if (!userPO.getPurpose().equals("NEW")) {%>
     		<input id="EIBSBTN" type=button name="Delete" value="Borrar Mnto" onClick="goAction(4);" <%= disabled %>>
     		<% } %>
     	  </div>	
  		</td>
  		<td width="34%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type=submit name="Exit" value="Salir" 
			<% if ( userPO.getPurpose().equals("NEW")) {%>
			    onClick="goAction(1);" 
			<% } else { %>
				onClick="goAction(6);" 
			<% } %>>
     	  </div>	
  		</td>
	</table>
<% } %>
	</td>
  	</tr>	
  </table>	
  
  </form>
</body> 

<SCRIPT>
dates('option');
months('option', 'N'); 
//You can change the startYear(1990) and endYear
years('option', <%=Integer.parseInt(currUser.getE01RDY())-10%>, <%=Integer.parseInt(currUser.getE01RDY())+100%>);
<%	
    x = 0;
    y = 1; 
    String dd = "";
    String mm = "";
    String yy = "";
    while (y < 11) {
      if (!lbl[x].equals("")) {
      	String v = String.valueOf(y).trim();
      	if (v == "10") v = "A";
      	if (typ[x].equals("F")) {
			if (vlu[x].trim().length()== 10) {
    			dd = vlu[x].substring(0,2);
            	mm = vlu[x].substring(3,5);
            	yy = vlu[x].substring(6,10);
            } else {
            	dd = currUser.getE01RDD();
            	mm = currUser.getE01RDM();
            	yy = currUser.getE01RDY();
            }
            %>
            setSelectValue('E01RVD<%=v%>', '<%=dd%>');
            setSelectValue('E01RVM<%=v%>', '<%=mm%>');
            setSelectValue('E01RVY<%=v%>', '<%=yy%>');
            <%
        }
      }
   		x++;
   		y++; 
    }        
 %>          	
</SCRIPT>
<% if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) {%>
<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"> </script>
<% } %>
<script src="<%=request.getContextPath()%>/jquery/markChangedFields.jsp?MSGOBJ=client"> </script>
</html>
