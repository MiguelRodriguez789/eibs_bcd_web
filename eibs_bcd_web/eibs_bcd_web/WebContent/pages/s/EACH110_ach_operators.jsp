<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>ACH Institutions Detail</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</head>

<jsp:useBean id="EACH110Record" class="datapro.eibs.beans.EACH11001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>
 
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script type="text/javascript">
<%
	String read = "";
 	String disabled = "";
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" title=\"Campo Obligatorio\" align=\"bottom\" border=\"0\" >";
 	String helpGL = "oncontextmenu=\"showPopUp(ledgerHelp,this.name,'','','','','')\"";
	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) 
		{ read = " readonly ";
		  disabled = " disabled"; 
		  mandatory = "";
		  helpGL = "";
	}	
 	boolean isInquiry = userPO.getPurpose().equals("INQUIRY");
 	boolean isReadOnly = isInquiry;
 	boolean isOriginator = EACH110Record.getE01ACOTYP().equals("R");  
	boolean isDFI = EACH110Record.getE01ACOTYP().equals("D");  
	boolean isOperator = EACH110Record.getE01ACOTYP().equals("O"); 
%>

builtHPopUp();

function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
	init(opth,field,bank,ccy,field1,field2,opcod);
	showPopupHelp();
}

function chgTipo(p) {

	getElement("E01ACOTYP").value = getElement("ACOTYP").value;
	var acocde = getElement('E01ACOCDE');
	if (acocde.lenght < 9) {
			getElement("E01ACOCDE").value = '000000000';
	}
 	if (p == "O") {
		OPERATOR.style.display='block';
		DFI.style.display='none';
		CIA.style.display='none';
		ORIGINATOR.style.display='none';
		COMM.style.display='block';
		CHARGES.style.display='none';
		NUMBERS.style.display='none';
		getElement("comType").innerHTML = " a cobrar al Cliente :";
	} else if (p == "D") {
		OPERATOR.style.display='none';
		DFI.style.display='block';
		CIA.style.display='none';
		ORIGINATOR.style.display='none';
		COMM.style.display='none';
		CHARGES.style.display='none';
		NUMBERS.style.display='block';
		getElement("comType").innerHTML = " ";
	} else if (p == "R") {
		OPERATOR.style.display='none';
		DFI.style.display='none';
		CIA.style.display='none';
		ORIGINATOR.style.display='block';
		COMM.style.display='block';
		CHARGES.style.display='block';
		NUMBERS.style.display='none';
		getElement("comType").innerHTML = " a cobrar al Originador :";
	} else if (p == "C") {
		OPERATOR.style.display='none';
		DFI.style.display='none';
		CIA.style.display='block';
		ORIGINATOR.style.display='none';		
		COMM.style.display='none';
		CHARGES.style.display='none';
		NUMBERS.style.display='none';
		getElement("comType").innerHTML = " ";
		acocde = getElement('E01ACOCDE');
		if (acocde.value == "000000000") {
			getElement("E01ACOCDE").value = '0000000000';
		}
	}
 }

function goAction(op) {
	document.forms[0].SCREEN.value = op;
	if (op == 4) {
		if (!confirm("Desea borrar este registro?")) {
			return;
		}
		}
	if (op == 5) {
		var acocde = '0000000000';
		var p = getElement('E01ACOTYP').value;
		if (p == "O") {
			acocde = getElement('E01OPE').value;
		} else if (p == "D") {
			acocde = getElement('E01ABA').value + getElement('E01DIG').value;
		} else if (p == "R") {
			acocde = getElement('E01BNK').value + getElement('E01CIAO').value +
				     getElement('E01SRV').value;
		} else if (p == "C") {
			acocde = getElement('E01CIA').value;
		}
		getElement("E01ACOCDE").value = acocde;
	}
	
	document.forms[0].submit();
}

</SCRIPT>  

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
%>  

<H3 align="center">
<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
Mantenimiento de Instituciones ACH
<% } else {%>
Consulta de Instituciones ACH
<% } %>
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ach_operators.jsp, EACH110"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.ach.JSEACH110" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  <INPUT TYPE=HIDDEN NAME="TYPE" VALUE="O">
  <INPUT TYPE=HIDDEN id = "E01ACOCDE" NAME="E01ACOCDE" VALUE="<%= EACH110Record.getE01ACOCDE().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01ACOTYP" VALUE="<%= EACH110Record.getE01ACOTYP().trim()%>">

  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
         <tr id="trdark"> 
         	<td width="10%" align="right">Tipo : </td> 
         	<td width="30%" align="left">  
				<SELECT name="ACOTYP" <%= !(userPO.getPurpose().equals("NEW"))?"Disabled":"" %> onChange="chgTipo(this.value);">
					<OPTION <%= EACH110Record.getE01ACOTYP().trim().equals("O")?"Selected":"" %> value="O">Operador</OPTION>
					<OPTION <%= EACH110Record.getE01ACOTYP().trim().equals("D")?"Selected":"" %> value="D">Institución Financiera</OPTION>
					<OPTION <%= EACH110Record.getE01ACOTYP().trim().equals("C")?"Selected":"" %> value="C">Compañía</OPTION>
					<OPTION <%= EACH110Record.getE01ACOTYP().trim().equals("R")?"Selected":"" %> value="R">Originador</OPTION>
				</SELECT>
            	<%=mandatory %>
			</td>
			<td width="10%" align="right"><%=mandatory %> Código : </td> 
			<td width="50%" align="left">
				<div id="ORIGINATOR" style="position:relative; display:none;">	
	       			<table cellspacing="0" cellpadding="2" width="100%" border="0">       
	         			<tr id="trdark" align="left"> 
       	        			<td nowrap width="10%" colspan=4 align="right">Banco(Ruta) : </td>
               				<td nowrap width="20%">
               					<input type="text" name="E01BNK" size="4" maxlength="3" value="<%= EACH110Record.getE01ACOCDE().length() > 2 ? EACH110Record.getE01ACOCDE().substring(0,3) : "000" %>" <%= !(userPO.getPurpose().equals("NEW"))?" readonly":"" %> onkeypress="enterInteger(event)">
              				</td>
               				<td nowrap width="10%" colspan=4 align="right">Compañía :</td>
               				<td nowrap width="20%">
               					<input type="text" name="E01CIAO" size="6" maxlength="5" value="<%= EACH110Record.getE01ACOCDE().length() > 7 ? EACH110Record.getE01ACOCDE().substring(3,8) : "00000" %>" <%= !(userPO.getPurpose().equals("NEW"))?" readonly":"" %> onkeypress="enterInteger(event)">
               				</td>
               				<td nowrap width="10%" colspan=4 align="right">Servicio :</td>
               				<td nowrap width="20%">
               					<input type="text" name="E01SRV" size="4" maxlength="2" value="<%= EACH110Record.getE01ACOCDE().length() > 8 ? EACH110Record.getE01ACOCDE().substring(8) : "0" %>" <%= !(userPO.getPurpose().equals("NEW"))?" readonly":"" %> onkeypress="enterInteger(event)">
              					<% if (!isReadOnly) { %>
              						<a href="javascript:GetCodeCNOFC('E01SRV','S1')">
              						<img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="middle" border="0" ></a> 
              					<% } %>
               				</td>
           	 			</tr> 
       	  			</table>
       	 		</div>
       	 		<div id="DFI" style="position:relative; display:none;">	
	       			<table cellspacing="0" cellpadding="2" width="100%" border="0">       
	         			<tr id="trdark" align="left"> 
       	        			<td nowrap width="10%" colspan=4 align="right">Banco(Ruta) : </td>
               				<td nowrap width="20%">
               					<input type="text" name="E01ABA" size="9" maxlength="8" value="<%= EACH110Record.getE01ACOCDE().length() > 7 ? EACH110Record.getE01ACOCDE().substring(0,8) : "00000000"%>" <%= !(userPO.getPurpose().equals("NEW"))?" readonly":"" %> onkeypress="enterInteger(event)">
              				</td>
               				<td nowrap width="10%" colspan=4 align="right">Digito Chequeo :</td>
               				<td nowrap width="20%">
               					<input type="text" name="E01DIG" size="2" maxlength="1" value="<%= EACH110Record.getE01ACOCDE().length() > 8 ? EACH110Record.getE01ACOCDE().substring(8,9) : "" %>" <%= !(userPO.getPurpose().equals("NEW"))?" readonly":"" %> onkeypress="enterInteger(event)">
               				</td>
           	 			</tr> 
       	  			</table>
       	 		</div>
       	 		<div id="OPERATOR" style="position:relative; display:noene;">	
	       			<table cellspacing="0" cellpadding="2" width="100%" border="0">       
	         			<tr id="trdark" align="left"> 
               				<td nowrap width="100%">
               					<input type="text" name="E01OPE" size="10" maxlength="9" value="<%= EACH110Record.getE01ACOCDE().trim()%>" <%= !(userPO.getPurpose().equals("NEW"))?" readonly":"" %> onkeypress="enterInteger(event)">
              				</td>
           	 			</tr> 
       	  			</table>
       	 		</div>
       	 		<div id="CIA" style="position:relative; display:none;">	
	       			<table cellspacing="0" cellpadding="2" width="100%" border="0">       
	         			<tr id="trdark" align="left"> 
               				<td nowrap width="100%">
               					<input type="text" name="E01CIA" size="11" maxlength="10" value="<%= EACH110Record.getE01ACOCDE().trim()%>" <%= !(userPO.getPurpose().equals("NEW"))?" readonly":"" %> onkeypress="enterInteger(event)">
              				</td>
           	 			</tr> 
       	  			</table>
       	 		</div>
			</td>			
         </tr>	    
        </table>
      </td>
    </tr>
  </table>

  <h4>Información Básica</h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Cliente / Nombre : </td>
            <td nowrap align="left" width="35%">
            	<INPUT type="text" name="E01ACOCUN" maxlength="9" size="10" <%= read %> value="<%= EACH110Record.getE01ACOCUN().trim()%>">
				<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
					<A href="javascript:GetCustomerDescId('E01ACOCUN','E01ACONME','')">
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0">
					</A>
				<% } %>
            	<INPUT type="text" name="E01ACONME" maxlength="30" size="31" <%= read %> value="<%= EACH110Record.getE01ACONME().trim()%>">
            	<%=mandatory %>
			</td>
            <td nowrap width="15%" align="right">Tipo de Oficina : </td>
            <td nowrap width="35%" align="left"> 
              	<SELECT name="E01ACOOCO" <%= disabled %>>
					<OPTION <%= EACH110Record.getE01ACOOCO().trim().equals("O")?"Selected":"" %> value="O">Principal</OPTION>
					<OPTION <%= EACH110Record.getE01ACOOCO().trim().equals("B")?"Selected":"" %> value="B">Sucursal</OPTION>
				</SELECT>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" align="right">Dirección : </td>
			<td nowrap width="35%" align="left">
                <INPUT type="text" name="E01ACOADD" size="37" maxlength="36" <%= read %> value="<%= EACH110Record.getE01ACOADD().trim()%>">
            </td>
            <td nowrap width="15%" align="right">Estado : </td>
			<td nowrap width="35%" align="left">
                <INPUT type="text" name="E01ACOSTE" maxlength="2" size="3" <%= read %> value="<%= EACH110Record.getE01ACOSTE().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Ciudad : </td>
			<td nowrap width="35%" align="left">
				<INPUT type="text" name="E01ACOCIT" maxlength="15" size="16" <%= read %> value="<%= EACH110Record.getE01ACOCIT().trim()%>">
            </td>
            <td nowrap width="15%" align="right">Código Postal : </td>
			<td nowrap width="35%" align="left"> 
            	 <INPUT type="text" name="E01ACOZIP" maxlength="10" size="11" <%= read %> value="<%= EACH110Record.getE01ACOZIP().trim()%>">
			</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" align="right">Máximo Valor x Tr.: </td>
			<td nowrap width="35%" align="left">
				<INPUT type="text" name="E01ACOAMT" maxlength="17" size="18" <%= read %> value="<%= EACH110Record.getE01ACOAMT().trim()%>" onkeypress="enterDecimal()">
			</td>
            <td nowrap width="15%" align="right">Tipo :</td>
			<td nowrap width="35%" align="left">
				<input type="radio" name="E01ACOUTC" value="L" <%if (EACH110Record.getE01ACOUTC().equals("L")) out.print("checked"); %>>
                Local 
                <input type="radio" name="E01ACOUTC" value="E" <%if (EACH110Record.getE01ACOUTC().equals("E")) out.print("checked"); %>>
                Extranjero
			</td>
          </tr>
        </table> 
      </td>  
    </tr>
  </table>
  
  <div id="COMM" style="position:relative; display:none;">
  <h4>Comisiones <label id="comType"></label></h4>  
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <th nowrap >Descripción</th>
            <th nowrap >Tipo<br>Cargo</th>
            <th nowrap >Monto<br>Cargo</th>
            <th nowrap >Monto<br>Máximo</th>
            <th nowrap >Monto<br>Mínimo</th>
            <th nowrap >Cuenta GL - IBS</th>
          </tr>
          <tr id="trclear"> 
            <td nowrap align="left"><%= EACH110Record.getE01ACOCD1()%></td>
            <td nowrap align="center"> 
	              <select name="E01ACOFA1" <%= disabled %>>
	                <option value=" " <% if (!(EACH110Record.getE01ACOFA1().equals("F") ||EACH110Record.getE01ACOFA1().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (EACH110Record.getE01ACOFA1().equals("F")) out.print("selected"); %>>Monto Fijo</option>
	                <option value="%" <% if (EACH110Record.getE01ACOFA1().equals("%")) out.print("selected"); %>>Porcentaje</option>        
	              </select>                
            </td>
            <td nowrap align="center"> 
              	<input type="text" <%= read %> name="E01ACOVA1" value="<%= EACH110Record.getE01ACOVA1() %>" size="16" maxlength="15" onkeypress="enterDecimal(4)">              
            </td>
            <td nowrap align="center"> 
 				<input type="text" <%= read %> name="E01ACOMI1" value="<%= EACH110Record.getE01ACOMI1() %>" size="16" maxlength="15" onkeypress="enterDecimal()">              
            </td>
            <td nowrap align="center"> 
 				<input type="text" <%= read %> name="E01ACOMA1" value="<%= EACH110Record.getE01ACOMA1() %>" size="16" maxlength="15" onkeypress="enterDecimal()">              
            </td>
              <td nowrap align="center"> 
                <input type="text" <%= read %> name="E01ACOGL1" size="18" maxlength="16" value="<%= EACH110Record.getE01ACOGL1()%>" <%=helpGL%>>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap align="left"><%= EACH110Record.getE01ACOCD2()%></td>
            <td nowrap align="center"> 
	              <select name="E01ACOFA2" <%= disabled %>>
	                <option value=" " <% if (!(EACH110Record.getE01ACOFA2().equals("F") || EACH110Record.getE01ACOFA2().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (EACH110Record.getE01ACOFA2().equals("F")) out.print("selected"); %>>Monto Fijo</option>
	                <option value="%" <% if (EACH110Record.getE01ACOFA2().equals("%")) out.print("selected"); %>>Porcentaje</option>        
	              </select>                
            </td>
            <td nowrap align="center"> 
              	<input type="text" <%= read %> name="E01ACOVA2" value="<%= EACH110Record.getE01ACOVA2() %>" size="16" maxlength="15" onkeypress="enterDecimal(4)">              
            </td>
            <td nowrap align="center"> 
 				<input type="text" <%= read %> name="E01ACOMI2" value="<%= EACH110Record.getE01ACOMI2() %>" size="16" maxlength="15" onkeypress="enterDecimal()">              
            </td>
            <td nowrap align="center"> 
 				<input type="text" <%= read %> name="E01ACOMA2" value="<%= EACH110Record.getE01ACOMA2() %>" size="16" maxlength="15" onkeypress="enterDecimal()">              
            </td>
            <td nowrap align="center"> 
                <input type="text" <%= read %> name="E01ACOGL2" size="18" maxlength="16" value="<%= EACH110Record.getE01ACOGL2()%>" <%=helpGL%>>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap align="left"><%= EACH110Record.getE01ACOCD3()%></td>
            <td nowrap align="center"> 
	              <select name="E01ACOFA3" <%= disabled %>>
	                <option value=" " <% if (!(EACH110Record.getE01ACOFA3().equals("F") ||EACH110Record.getE01ACOFA3().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (EACH110Record.getE01ACOFA3().equals("F")) out.print("selected"); %>>Monto Fijo</option>
	                <option value="%" <% if (EACH110Record.getE01ACOFA3().equals("%")) out.print("selected"); %>>Porcentaje</option>        
	              </select>                
            </td>
            <td nowrap align="center"> 
              	<input type="text" <%= read %> name="E01ACOVA3" value="<%= EACH110Record.getE01ACOVA3() %>" size="16" maxlength="15" onkeypress="enterDecimal(4)">              
            </td>
            <td nowrap align="center"> 
 				<input type="text" <%= read %> name="E01ACOMI3" value="<%= EACH110Record.getE01ACOMI3() %>" size="16" maxlength="15" onkeypress="enterDecimal()">              
            </td>
            <td nowrap align="center"> 
 				<input type="text" <%= read %> name="E01ACOMA3" value="<%= EACH110Record.getE01ACOMA3() %>" size="16" maxlength="15" onkeypress="enterInteger(event)">              
            </td>
            <td nowrap align="center"> 
                <input type="text" <%= read %> name="E01ACOGL3" size="18" maxlength="16" value="<%= EACH110Record.getE01ACOGL3()%>" <%=helpGL%>>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap align="left"><%= EACH110Record.getE01ACOCD4()%></td>
            <td nowrap align="center"> 
	              <select name="E01ACOFA4" <%= disabled %>>
	                <option value=" " <% if (!(EACH110Record.getE01ACOFA4().equals("F") ||EACH110Record.getE01ACOFA4().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (EACH110Record.getE01ACOFA4().equals("F")) out.print("selected"); %>>Monto Fijo</option>
	                <option value="%" <% if (EACH110Record.getE01ACOFA4().equals("%")) out.print("selected"); %>>Porcentaje</option>        
	              </select>                
            </td>
            <td nowrap align="center"> 
              	<input type="text" <%= read %> name="E01ACOVA4" value="<%= EACH110Record.getE01ACOVA4() %>" size="16" maxlength="15" onkeypress="enterDecimal(4)">              
            </td>
            <td nowrap align="center"> 
 				<input type="text" <%= read %> name="E01ACOMI4" value="<%= EACH110Record.getE01ACOMI4() %>" size="16" maxlength="15" onkeypress="enterDecimal()">              
            </td>
            <td nowrap align="center"> 
 				<input type="text" <%= read %> name="E01ACOMA4" value="<%= EACH110Record.getE01ACOMA4() %>" size="16" maxlength="15" onkeypress="enterInteger(event)">              
            </td>
            <td nowrap align="center"> 
                <input type="text" <%= read %> name="E01ACOGL4" size="18" maxlength="16" value="<%= EACH110Record.getE01ACOGL4()%>" <%=helpGL%>>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap align="left"><%= EACH110Record.getE01ACOCD5()%></td>
            <td nowrap align="center"> 
	              <select name="E01ACOFA5" <%= disabled %>>
	                <option value=" " <% if (!(EACH110Record.getE01ACOFA5().equals("F") ||EACH110Record.getE01ACOFA5().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (EACH110Record.getE01ACOFA5().equals("F")) out.print("selected"); %>>Monto Fijo</option>
	                <option value="%" <% if (EACH110Record.getE01ACOFA5().equals("%")) out.print("selected"); %>>Porcentaje</option>        
	              </select>                
            </td>
            <td nowrap align="center"> 
              	<input type="text" <%= read %> name="E01ACOVA5" value="<%= EACH110Record.getE01ACOVA5() %>" size="16" maxlength="15" onkeypress="enterDecimal(4)">              
            </td>
            <td nowrap align="center"> 
 				<input type="text" <%= read %> name="E01ACOMI5" value="<%= EACH110Record.getE01ACOMI5() %>" size="16" maxlength="15" onkeypress="enterDecimal()">              
            </td>
            <td nowrap align="center"> 
 				<input type="text" <%= read %> name="E01ACOMA5" value="<%= EACH110Record.getE01ACOMA5() %>" size="16" maxlength="15" onkeypress="enterDecimal()">              
            </td>
            <td nowrap align="center"> 
                <input type="text" <%= read %> name="E01ACOGL5" size="18" maxlength="16" value="<%= EACH110Record.getE01ACOGL5()%>" <%=helpGL%>>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap align="left"><%= EACH110Record.getE01ACOCD6()%></td>
            <td nowrap align="center"> 
	              <select name="E01ACOFA6" <%= disabled %>>
	                <option value=" " <% if (!(EACH110Record.getE01ACOFA6().equals("F") ||EACH110Record.getE01ACOFA6().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (EACH110Record.getE01ACOFA6().equals("F")) out.print("selected"); %>>Monto Fijo</option>
	                <option value="%" <% if (EACH110Record.getE01ACOFA6().equals("%")) out.print("selected"); %>>Porcentaje</option>        
	              </select>                
            </td>
            <td nowrap align="center"> 
              	<input type="text" <%= read %> name="E01ACOVA6" value="<%= EACH110Record.getE01ACOVA6() %>" size="16" maxlength="15" onkeypress="enterDecimal(4)">              
            </td>
            <td nowrap align="center"> 
 				<input type="text" <%= read %> name="E01ACOMI6" value="<%= EACH110Record.getE01ACOMI6() %>" size="16" maxlength="15" onkeypress="enterDecimal()">              
            </td>
            <td nowrap align="center"> 
 				<input type="text" <%= read %> name="E01ACOMA6" value="<%= EACH110Record.getE01ACOMA6() %>" size="16" maxlength="15" onkeypress="enterDecimal()">              
            </td>
            <td nowrap align="center"> 
                <input type="text" <%= read %> name="E01ACOGL6" size="18" maxlength="16" value="<%= EACH110Record.getE01ACOGL6()%>" <%=helpGL%>>
            </td>
          </tr>
          
          <tr id="trclear"> 
            <td nowrap align="left"><%= EACH110Record.getE01ACOCD7()%></td>
            <td nowrap align="center"> 
	              <select name="E01ACOFA7" <%= disabled %>>
	                <option value=" " <% if (!(EACH110Record.getE01ACOFA7().equals("F") ||EACH110Record.getE01ACOFA7().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (EACH110Record.getE01ACOFA7().equals("F")) out.print("selected"); %>>Monto Fijo</option>
	                <option value="%" <% if (EACH110Record.getE01ACOFA7().equals("%")) out.print("selected"); %>>Porcentaje</option>        
	              </select>                
            </td>
            <td nowrap align="center"> 
              	<input type="text" <%= read %> name="E01ACOVA7" value="<%= EACH110Record.getE01ACOVA7() %>" size="16" maxlength="15" onkeypress="enterDecimal(4)">              
            </td>
            <td nowrap align="center"> 
 				<input type="text" <%= read %> name="E01ACOMI7" value="<%= EACH110Record.getE01ACOMI7() %>" size="16" maxlength="15" onkeypress="enterDecimal()">              
            </td>
            <td nowrap align="center"> 
 				<input type="text" <%= read %> name="E01ACOMA7" value="<%= EACH110Record.getE01ACOMA7() %>" size="16" maxlength="15" onkeypress="enterDecimal()">              
            </td>
            <td nowrap align="center"> 
                <input type="text" <%= read %> name="E01ACOGL7" size="18" maxlength="16" value="<%= EACH110Record.getE01ACOGL7()%>" <%=helpGL%>>
            </td>
          </tr>

          <tr id="trclear"> 
            <td nowrap align="left"><%= EACH110Record.getE01ACOCD8()%></td>
            <td nowrap align="center"> 
	              <select name="E01ACOFA8" <%= disabled %>>
	                <option value=" " <% if (!(EACH110Record.getE01ACOFA8().equals("F") ||EACH110Record.getE01ACOFA8().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (EACH110Record.getE01ACOFA8().equals("F")) out.print("selected"); %>>Monto Fijo</option>
	                <option value="%" <% if (EACH110Record.getE01ACOFA8().equals("%")) out.print("selected"); %>>Porcentaje</option>        
	              </select>                
            </td>
            <td nowrap align="center"> 
              	<input type="text" <%= read %> name="E01ACOVA8" value="<%= EACH110Record.getE01ACOVA8() %>" size="16" maxlength="15" onkeypress="enterDecimal(4)">              
            </td>
            <td nowrap align="center"> 
 				<input type="text" <%= read %> name="E01ACOMI8" value="<%= EACH110Record.getE01ACOMI8() %>" size="16" maxlength="15" onkeypress="enterDecimal()">              
            </td>
            <td nowrap align="center"> 
 				<input type="text" <%= read %> name="E01ACOMA8" value="<%= EACH110Record.getE01ACOMA8() %>" size="16" maxlength="15" onkeypress="enterDecimal()">              
            </td>
            <td nowrap align="center"> 
                <input type="text" <%= read %> name="E01ACOGL8" size="18" maxlength="16" value="<%= EACH110Record.getE01ACOGL8()%>" <%=helpGL%>>
            </td>
          </tr>

          <tr id="trclear"> 
            <td nowrap align="left"><%= EACH110Record.getE01ACOCD9()%></td>
            <td nowrap align="center"> 
	              <select name="E01ACOFA9" <%=disabled%>>
	                <option value=" " <% if (!(EACH110Record.getE01ACOFA9().equals("F") || EACH110Record.getE01ACOFA9().equals("%"))) out.print("selected");%>></option>
	                <option value="F" <% if (EACH110Record.getE01ACOFA9().equals("F")) out.print("selected"); %>>Monto Fijo</option>
	                <option value="%" <% if (EACH110Record.getE01ACOFA9().equals("%")) out.print("selected"); %>>Porcentaje</option>        
	              </select>                
            </td>
            <td nowrap align="center"> 
              	<input type="text" <%= read %> name="E01ACOVA9" value="<%= EACH110Record.getE01ACOVA9() %>" size="16" maxlength="15" onkeypress="enterDecimal(4)">              
            </td>
           <td nowrap align="center"> 
 				<input type="text" <%= read %> name="E01ACOMI9" value="<%= EACH110Record.getE01ACOMI9() %>" size="16" maxlength="15" onkeypress="enterDecimal()">              
            </td>
            <td nowrap align="center"> 
 				<input type="text" <%= read %> name="E01ACOMA9" value="<%= EACH110Record.getE01ACOMA9() %>" size="16" maxlength="15" onkeypress="enterDecimal()">              
            </td>
            <td nowrap align="center"> 
                <input type="text" <%= read %> name="E01ACOGL9" size="18" maxlength="16" value="<%= EACH110Record.getE01ACOGL9()%>" <%=helpGL%>>
            </td>
          </tr>
          
     </table>
    </td>
    </tr>
  </table>
</div>

<div id="CHARGES" style="position:relative; display:none;">
 <h4>Información de Riesgo / Operativa</h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Cta DB de Cargos : </td>
            <td nowrap align="left" width="45%">
            	<INPUT type="text" name="E01ACOOA1" maxlength="16" size="17" <%= read %> value="<%= EACH110Record.getE01ACOOA1().trim() %>">
            	<%if (read== "") { %>
					<A href="javascript:GetAccount('E01ACOOA1','','RT','')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Cuenta de Detalle" align="bottom" border="0">
					</A>	
					<A href="javascript:GetLedger('E01ACOOA1','','','')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Cuenta Contable" border="0" align="top">
					</A>
				<%}%>
				<select name="E01ACOEF1" <%=disabled%>>
	                <option value=" " <% if (!(EACH110Record.getE01ACOEF1().equals("I") || EACH110Record.getE01ACOEF1().equals("M"))) out.print("selected");%>></option>
	                <option value="I" <% if (EACH110Record.getE01ACOEF1().equals("I")) out.print("selected"); %>>Efec. Immediata</option>
	                <option value="M" <% if (EACH110Record.getE01ACOEF1().equals("M")) out.print("selected"); %>>Efec. Mensual</option>        
	            </select>
			</td>
            <td nowrap width="20%" align="right">Monto de Riesgo Total : </td>
            <td nowrap width="20%" align="left"> 
              	<INPUT type="text" name="E01ACORSK" maxlength="17" size="18" <%= read %> value="<%= EACH110Record.getE01ACORSK().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" align="right">Cta DB de Comisiones : </td>
			<td nowrap width="45%" align="left">
                <INPUT type="text" name="E01ACOOA2" size="17" maxlength="16" <%= read %> value="<%= EACH110Record.getE01ACOOA2().trim()%>">
               	<%if (read== "") { %>
					<A href="javascript:GetAccount('E01ACOOA2','','RT','')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Cuenta de Detalle" align="bottom" border="0">
					</A>	
					<A href="javascript:GetLedger('E01ACOOA2','','','')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Cuenta Contable" border="0" align="top">
					</A>
				<%}%>
				<select name="E01ACOEF2" <%=disabled%>>
	                <option value=" " <% if (!(EACH110Record.getE01ACOEF2().equals("I") || EACH110Record.getE01ACOEF2().equals("M"))) out.print("selected");%>></option>
	                <option value="I" <% if (EACH110Record.getE01ACOEF2().equals("I")) out.print("selected"); %>>Efec. Immediata</option>
	                <option value="M" <% if (EACH110Record.getE01ACOEF2().equals("M")) out.print("selected"); %>>Efec. Mensual</option>        
	            </select>
            </td>
            <td nowrap width="20%" align="right">Monto Máximo por TR. en Archivo : </td>
			<td nowrap width="20%" align="left">
                <INPUT type="text" name="E01ACOWAM" maxlength="17" size="18" <%= read %> value="<%= EACH110Record.getE01ACOWAM().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Cta CR Comisiones : </td>
			<td nowrap width="45%" align="left">
				<INPUT type="text" name="E01ACOOA3" maxlength="16" size="17" <%= read %> value="<%= EACH110Record.getE01ACOOA3().trim()%>">
            	<%if (read== "") { %>
					<A href="javascript:GetAccount('E01ACOOA3','','RT','')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Cuenta de Detalle" align="bottom" border="0">
					</A>	
					<A href="javascript:GetLedger('E01ACOOA3','','','')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Cuenta Contable" border="0" align="top">
					</A>
				<%}%>
				<select name="E01ACOEF3" <%=disabled%>>
	                <option value=" " <% if (!(EACH110Record.getE01ACOEF3().equals("I") || EACH110Record.getE01ACOEF3().equals("M"))) out.print("selected");%>></option>
	                <option value="I" <% if (EACH110Record.getE01ACOEF3().equals("I")) out.print("selected"); %>>Efec. Immediata</option>
	                <option value="M" <% if (EACH110Record.getE01ACOEF3().equals("M")) out.print("selected"); %>>Efec. Mensual</option>        
	            </select>
            </td>
            <td nowrap width="20%" align="right">Max. Porcentaje / Días - Riesgo Debito : </td>
			<td nowrap width="20%" align="left"> 
            	 <INPUT type="text" name="E01ACODRP" maxlength="7" size="8" <%= read %> value="<%= EACH110Record.getE01ACODRP().trim()%>"  onkeypress="enterDecimal(3)">
            	 /
            	 <INPUT type="text" name="E01ACODRD" maxlength="5" size="6" <%= read %> value="<%= EACH110Record.getE01ACODRD().trim()%>"  onkeypress="enterInteger(event)">
			</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" align="right"> Generar Archivo de Pago : </td>
			<td nowrap width="45%" align="left">
				<input type="radio" name="E01ACOGPF" value="Y" <%if (EACH110Record.getE01ACOGPF().equals("Y")) out.print("checked"); %>>
                Si
                <input type="radio" name="E01ACOGPF" value="N" <%if (!EACH110Record.getE01ACOGPF().equals("Y")) out.print("checked"); %>>
                No 
			</td>
            <td nowrap width="20%" align="right">Max. Porcentaje / Días - Riesgo Crédito : </td>
            <td nowrap width="20%" align="left">
				<INPUT type="text" name="E01ACOCRP" maxlength="7" size="8" <%= read %> value="<%= EACH110Record.getE01ACOCRP().trim()%>"  onkeypress="enterDecimal(3)">
				/
            	 <INPUT type="text" name="E01ACOCRD" maxlength="5" size="6" <%= read %> value="<%= EACH110Record.getE01ACOCRD().trim()%>"  onkeypress="enterInteger(event)">
			</td>
          </tr>
        </table> 
      </td>  
    </tr>
  </table>
  </div>


  
  <div id="NUMBERS" style="position:relative; display:none;">
  <h4>Parámetros de Numeración de Cuentas</h4>  
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <th nowrap >Producto</th>
            <th nowrap >Long.Mínima</th>
            <th nowrap >Long.Máxima</th>
          </tr>

          <tr id="trclear"> 
            <td nowrap align="center">Cuenta de Ahorros</td>            
            <td nowrap align="center"> 
              	<input type="text" <%= read %> name="E01ACOSLM" value="<%= EACH110Record.getE01ACOSLM() %>" size="3" maxlength="2" onkeypress="enterInteger(event)">              
            </td>
            <td nowrap align="center"> 
              	<input type="text" <%= read %> name="E01ACOSLX" value="<%= EACH110Record.getE01ACOSLX() %>" size="3" maxlength="2" onkeypress="enterInteger(event)">              
            </td>
          </tr>

          <tr id="trdark"> 
            <td nowrap align="center">Cuenta Corriente</td>            
            <td nowrap align="center"> 
              	<input type="text" <%= read %> name="E01ACORLM" value="<%= EACH110Record.getE01ACORLM() %>" size="3" maxlength="2" onkeypress="enterInteger(event)">              
            </td>
            <td nowrap align="center"> 
              	<input type="text" <%= read %> name="E01ACORLX" value="<%= EACH110Record.getE01ACORLX() %>" size="3" maxlength="2" onkeypress="enterInteger(event)">              
            </td>
          </tr>

          <tr id="trclear"> 
            <td nowrap align="center">Préstamos</td>            
            <td nowrap align="center"> 
              	<input type="text" <%= read %> name="E01ACOLLM" value="<%= EACH110Record.getE01ACOLLM() %>" size="3" maxlength="2" onkeypress="enterInteger(event)">              
            </td>
            <td nowrap align="center"> 
              	<input type="text" <%= read %> name="E01ACOLLX" value="<%= EACH110Record.getE01ACOLLX() %>" size="3" maxlength="2" onkeypress="enterInteger(event)">              
            </td>
          </tr>

          <tr id="trdark"> 
            <td nowrap align="center">Cartas de Crédito</td>            
            <td nowrap align="center"> 
              	<input type="text" <%= read %> name="E01ACOCLM" value="<%= EACH110Record.getE01ACOCLM() %>" size="3" maxlength="2" onkeypress="enterInteger(event)">              
            </td>
            <td nowrap align="center"> 
              	<input type="text" <%= read %> name="E01ACOCLX" value="<%= EACH110Record.getE01ACOCLX() %>" size="3" maxlength="2" onkeypress="enterInteger(event)">              
            </td>
          </tr>
          
     </table>
    </td>
    </tr>
  </table>

  <h4>Parámetros de Tarjetas de Crédito</h4>  
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <th nowrap >Tipo de Tarjeta</th>
            <th nowrap >Longitud</th>
            <th nowrap >Primer Dígito</th>
          </tr>

          <tr id="trclear"> 
            <td nowrap align="center"> 
	              <select name="E01ACOTC1" <%= disabled %>>
	                <option value=" " <% if (!(EACH110Record.getE01ACOTC1().equals("A") && EACH110Record.getE01ACOTC1().equals("B")
	                 && EACH110Record.getE01ACOTC1().equals("D") && EACH110Record.getE01ACOTC1().equals("E")
	                 && EACH110Record.getE01ACOTC1().equals("L") && EACH110Record.getE01ACOTC1().equals("M")
	                 && EACH110Record.getE01ACOTC1().equals("V")
	                 )) out.print("selected"); %>> </option>
	                <option value="A" <% if (EACH110Record.getE01ACOTC1().equals("A")) out.print("selected"); %>>American Express</option>
	                <option value="B" <% if (EACH110Record.getE01ACOTC1().equals("B")) out.print("selected"); %>>Bankcard</option>
	                <option value="D" <% if (EACH110Record.getE01ACOTC1().equals("D")) out.print("selected"); %>>Diners</option>        
	                <option value="E" <% if (EACH110Record.getE01ACOTC1().equals("E")) out.print("selected"); %>>Discover</option>
	                <option value="L" <% if (EACH110Record.getE01ACOTC1().equals("L")) out.print("selected"); %>>Laser</option>
	                <option value="M" <% if (EACH110Record.getE01ACOTC1().equals("M")) out.print("selected"); %>>Mastercard</option>
	                <option value="V" <% if (EACH110Record.getE01ACOTC1().equals("V")) out.print("selected"); %>>Visa</option>
	              </select>                
            </td>
            <td nowrap align="center"> 
              	<input type="text" <%= read %> name="E01ACOT1M" value="<%= EACH110Record.getE01ACOT1M() %>" size="3" maxlength="2" onkeypress="enterInteger(event)">              
            </td>
            <td nowrap align="center"> 
              	<input type="text" <%= read %> name="E01ACOT1D" value="<%= EACH110Record.getE01ACOT1D() %>" size="3" maxlength="2" onkeypress="enterInteger(event)">              
            </td>
          </tr>

          <tr id="trdark"> 
            <td nowrap align="center"> 
	              <select name="E01ACOTC2" <%= disabled %>>
	                <option value=" " <% if (!(EACH110Record.getE01ACOTC2().equals("A") || EACH110Record.getE01ACOTC2().equals("B"))) out.print("selected"); %>></option>
	                <option value="A" <% if (EACH110Record.getE01ACOTC2().equals("A")) out.print("selected"); %>>American Express</option>
	                <option value="B" <% if (EACH110Record.getE01ACOTC2().equals("B")) out.print("selected"); %>>Bankcard</option>
	                <option value="D" <% if (EACH110Record.getE01ACOTC2().equals("D")) out.print("selected"); %>>Diners</option>        
	                <option value="E" <% if (EACH110Record.getE01ACOTC2().equals("E")) out.print("selected"); %>>Discover</option>
	                <option value="L" <% if (EACH110Record.getE01ACOTC2().equals("L")) out.print("selected"); %>>Laser</option>
	                <option value="M" <% if (EACH110Record.getE01ACOTC2().equals("M")) out.print("selected"); %>>Mastercard</option>
	                <option value="V" <% if (EACH110Record.getE01ACOTC2().equals("V")) out.print("selected"); %>>Visa</option>
	              </select>                
            </td>
            <td nowrap align="center"> 
              	<input type="text" <%= read %> name="E01ACOT2M" value="<%= EACH110Record.getE01ACOT2M() %>" size="3" maxlength="2" onkeypress="enterInteger(event)">              
            </td>
            <td nowrap align="center"> 
              	<input type="text" <%= read %> name="E01ACOT2D" value="<%= EACH110Record.getE01ACOT2D() %>" size="3" maxlength="2" onkeypress="enterInteger(event)">              
            </td>
          </tr>

          <tr id="trclear"> 
            <td nowrap align="center"> 
	              <select name="E01ACOTC3" <%= disabled %>>
	                <option value=" " <% if (!(EACH110Record.getE01ACOTC3().equals("A") || EACH110Record.getE01ACOTC3().equals("B"))) out.print("selected"); %>></option>
	                <option value="A" <% if (EACH110Record.getE01ACOTC3().equals("A")) out.print("selected"); %>>American Express</option>
	                <option value="B" <% if (EACH110Record.getE01ACOTC3().equals("B")) out.print("selected"); %>>Bankcard</option>
	                <option value="D" <% if (EACH110Record.getE01ACOTC3().equals("D")) out.print("selected"); %>>Diners</option>        
	                <option value="E" <% if (EACH110Record.getE01ACOTC3().equals("E")) out.print("selected"); %>>Discover</option>
	                <option value="L" <% if (EACH110Record.getE01ACOTC3().equals("L")) out.print("selected"); %>>Laser</option>
	                <option value="M" <% if (EACH110Record.getE01ACOTC3().equals("M")) out.print("selected"); %>>Mastercard</option>
	                <option value="V" <% if (EACH110Record.getE01ACOTC3().equals("V")) out.print("selected"); %>>Visa</option>
	              </select>                
            </td>
            <td nowrap align="center"> 
              	<input type="text" <%= read %> name="E01ACOT3M" value="<%= EACH110Record.getE01ACOT3M() %>" size="3" maxlength="2" onkeypress="enterInteger(event)">              
            </td>
            <td nowrap align="center"> 
              	<input type="text" <%= read %> name="E01ACOT3D" value="<%= EACH110Record.getE01ACOT3D() %>" size="3" maxlength="2" onkeypress="enterInteger(event)">              
            </td>
          </tr>

          <tr id="trdark"> 
            <td nowrap align="center"> 
	              <select name="E01ACOTC4" <%= disabled %>>
	                <option value=" " <% if (!(EACH110Record.getE01ACOTC4().equals("A") || EACH110Record.getE01ACOTC4().equals("B"))) out.print("selected"); %>></option>
	                <option value="A" <% if (EACH110Record.getE01ACOTC4().equals("A")) out.print("selected"); %>>American Express</option>
	                <option value="B" <% if (EACH110Record.getE01ACOTC4().equals("B")) out.print("selected"); %>>Bankcard</option>
	                <option value="D" <% if (EACH110Record.getE01ACOTC4().equals("D")) out.print("selected"); %>>Diners</option>        
	                <option value="E" <% if (EACH110Record.getE01ACOTC4().equals("E")) out.print("selected"); %>>Discover</option>
	                <option value="L" <% if (EACH110Record.getE01ACOTC4().equals("L")) out.print("selected"); %>>Laser</option>
	                <option value="M" <% if (EACH110Record.getE01ACOTC4().equals("M")) out.print("selected"); %>>Mastercard</option>
	                <option value="V" <% if (EACH110Record.getE01ACOTC4().equals("V")) out.print("selected"); %>>Visa</option>
	              </select>                
            </td>
            <td nowrap align="center"> 
              	<input type="text" <%= read %> name="E01ACOT4M" value="<%= EACH110Record.getE01ACOT4M() %>" size="3" maxlength="2" onkeypress="enterInteger(event)">              
            </td>
            <td nowrap align="center"> 
              	<input type="text" <%= read %> name="E01ACOT4D" value="<%= EACH110Record.getE01ACOT4D() %>" size="3" maxlength="2" onkeypress="enterInteger(event)">              
            </td>
          </tr>

          
     </table>
    </td>
    </tr>
  </table>


  </div>


    
    <table width="100%">		
  	<tr>
  		<td width="33%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="goAction(5);" <%= disabled %>>
     	  </div>	
  		</td>
  		<td width="33%"> 
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Delete" value="Borrar" onClick="goAction(4);" <%= disabled %>>
     	  </div>	
  		</td>
  		<td width="34%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Exit" value="Salir" 
			<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
			    onClick="goAction(1);" 
			<% } else { %>
				onClick="goAction(6);" 
			<% } %>>
     	  </div>	
  		</td>

  	</tr>	
  </table>	
  
  <h4>Información de Auditoria</h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Usuario Creador : </td>
            <td nowrap align="left" width="35%">
            	<%= EACH110Record.getE01ACOCUS()%>
			</td>
            <td nowrap width="15%" align="right">Usuario último Cambio : </td>
            <td nowrap width="35%" align="left">
            	<%= EACH110Record.getE01ACOMUS()%>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" align="right">Fecha de Proceso - Creación : </td>
			<td nowrap width="35%" align="left">
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(), EACH110Record.getE01ACOCDM(),EACH110Record.getE01ACOCDD(),EACH110Record.getE01ACOCDY())%>
            </td>
            <td nowrap width="15%" align="right">Fecha de Proceso - Cambio : </td>
			<td nowrap width="35%" align="left">
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),EACH110Record.getE01ACORDM(),EACH110Record.getE01ACORDD(),EACH110Record.getE01ACORDY())%>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Fecha / Hora - Creación : </td>
			<td nowrap width="35%" align="left">
				<%= EACH110Record.getE01ACOCTM()%>
            </td>
            <td nowrap width="15%" align="right">Fecha / Hora - Cambio : </td>
			<td nowrap width="35%" align="left"> 
            	<%= EACH110Record.getE01ACOMTM()%>
			</td>
          </tr>
        </table> 
      </td>  
    </tr>
  </table>

  </form>
</body>

	<SCRIPT type="text/javascript">
		chgTipo('<%= EACH110Record.getE01ACOTYP().trim()%>');
	</SCRIPT>


</html>
