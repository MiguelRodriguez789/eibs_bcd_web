<!DOCTYPE html>

<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Entidades Asociadas a Clientes</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset="utf-8">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/jquery/themes/smoothness/jquery-ui.css"/> 

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/calendar.js"> </script>
<script>


</script>

<jsp:useBean id="ESD0086Record" class="datapro.eibs.beans.ESD008601Message" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

</head>
<body>

<script>

<%			boolean isApprovalInquiry = userPO.getPurpose().equals("APPROVAL");
			boolean isInquiry = userPO.getPurpose().equals("INQUIRY");
			boolean isReadOnly = isApprovalInquiry || isInquiry;
			boolean readMnt = (userPO.getPurpose().equals("NEW") ? false : true);
			boolean isCustomer = !ESD0086Record.getField("E01RCN").getString()
					.trim().equals("0");
			String legtyp = (ESD0086Record.getH01LGT().equals("1") ? "JURIDICO"	: "PERSONA");
			String readDsc = (userPO.getPurpose().equals("NEW") ? "" : "readonly");
			String read = "";
			String disabled = "";
			String help = "<img src=\"" + request.getContextPath() + "/images/1b.gif\" title=\"Ayuda\" align=\"bottom\" border=\"0\" style=\"cursor:hand\" >";
			String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"campo obligatorio\" align=\"bottom\" border=\"0\" >";
			String tf = "false";

			if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose()
					.equals("MAINTENANCE"))) {
				read = " readonly ";
				disabled = " disabled";
				tf = "true";
			}
			if (isApprovalInquiry) {%>
		<%if (!ESD0086Record.getH01LGT().equals("1")) {%>
		     builtNewMenu(client_ap_personal_opt);
         <%} else {%> 
		     builtNewMenu(client_ap_corp_opt);
         <%}%>
   <%} else {%>

   <%if (isInquiry) {%>
	    <%if (!ESD0086Record.getH01LGT().equals("1")) {%>
		     builtNewMenu(client_inq_personal_opt);
         <%} else {%>
		     builtNewMenu(client_inq_corp_opt);
         <%}%>	 
   <%} else {%>
         <%if (!ESD0086Record.getH01LGT().equals("1")) {%>
		     builtNewMenu(client_personal_opt);
         <%} else {%>
		     builtNewMenu(client_corp_opt);
         <%}%>
   <%}%> 
   <%}%>  

 
function goAction(op) {
	document.forms[0].SCREEN.value = op;
	if (op == 4) {
		if (!confirm("Desea borrar este registro?")) {
			return;
		}
	}
	submitForm();
}

function chgDateCal(v) {
	getElement("E01RV" + v).value = getElement("E01RVD" + v).value +  '/' + getElement("E01RVM" + v).value + '/' + getElement("E01RVY" + v).value;   
 }	
</SCRIPT>


<%
	int row = 0; 
	if (!error.getERRNUM().equals("0")) {
		out.println("<SCRIPT Language=\"Javascript\">");
		error.setERRNUM("0");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
	out.println("<SCRIPT> initMenu(); </SCRIPT>");
%>

<H3 align="center">Información Adicional de Clientes<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" title="client_add_info.jsp, ESD0086"></H3>
<hr size="4">
<form method="post"
	action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0086">
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5"> 
	<INPUT TYPE=HIDDEN 	NAME="RECTYP" VALUE="<%=userPO.getHeader10()%>"> 
	
<table class="tableinfo" width="100%">
	<tr bordercolor="#FFFFFF"> 
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" class="tbhead"
			bgcolor="#FFFFFF" bordercolor="#FFFFFF" align="center">
			<tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
				<td nowrap width="10%" align="right">Tipo Legal :</td>
				<td nowrap width="20%" align="left"><%=legtyp%></td>
				<td nowrap width="10%" align="right">Estado :</td>
				<td nowrap width="60%" align="left"
					style="color: red; font-size: 12;"><b><%=ESD0086Record.getD01STS().trim()%></b>
				</td>
			</tr>
			<tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
				<td nowrap width="10%" align="right">Código :</td>
				<td nowrap width="20%" align="left"><b><%=ESD0086Record.getH01CUN().trim()%></b></td>
				<td nowrap width="10%" align="right">Nombre Legal :</td>
				<td nowrap width="60%" align="left"><b><%=ESD0086Record.getH01NA1().trim()%></b></td>
			</tr>
			<tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
				<td nowrap width="10%" align="right">ID :</td>
				<td nowrap width="20%" align="left"><b><%=ESD0086Record.getH01PID().trim()%>
				- <%=ESD0086Record.getH01TID().trim()%> - <%=ESD0086Record.getH01IDN().trim()%></b>
				</td>
				<td nowrap width="10%" align="right"></td>
				<td nowrap width="60%" align="left"></td>
			</tr>
		</table>
		</td>
	</tr>
</table>

<table class="tableinfo" width="100%">
	<tr bordercolor="#FFFFFF">
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0"
			class="tbhead">
			<tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
				<td nowrap width="5%" align="right">Consecutivo :</td>
				<td nowrap width="10%" align="left">
					<INPUT type="text" name="E01MAN" size="4" readonly value="<%=ESD0086Record.getE01MAN().trim()%>">
				</td>
				<td nowrap width="5%" align="right">Tipo :</td>
				<td nowrap width="40%" align="left">
					<%=(ESD0086Record.getE01FL2().equals("Y") ? "Obligatorio" : "Opcional") %>
				</td>
				<td nowrap width="5%" align="right"></td>
				<td nowrap width="35%" align="left">
				</td>
			</tr>
			<tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
				<td nowrap width="5%" align="right"></td>
				<td nowrap width="10%" align="left">
					
				</td>
				<td nowrap width="5%" align="right">Descripción : </td>
				<td nowrap width="40%" align="left">
					<INPUT type="text" name="E01DSC" value="<%=ESD0086Record.getE01DSC().trim()%>" size="65" maxlength="60" <%=readDsc%>>
				</td>
				<td nowrap width="5%" align="right"></td>
				<td nowrap width="35%" align="left">
				</td>
			</tr>
		</table>

   <br> 
 
   <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <%
          String[] lbl = {  ESD0086Record.getC01LB1(), ESD0086Record.getC01LB2(), ESD0086Record.getC01LB3(), ESD0086Record.getC01LB4(), ESD0086Record.getC01LB5(),
          					ESD0086Record.getC01LB6(), ESD0086Record.getC01LB7(), ESD0086Record.getC01LB8(), ESD0086Record.getC01LB9(), ESD0086Record.getC01LB10(),
          					ESD0086Record.getC01LB11(), ESD0086Record.getC01LB12(), ESD0086Record.getC01LB13(), ESD0086Record.getC01LB14(), ESD0086Record.getC01LB15(),
          					ESD0086Record.getC01LB16(), ESD0086Record.getC01LB17(), ESD0086Record.getC01LB18(), ESD0086Record.getC01LB19(), ESD0086Record.getC01LB20(),
          					ESD0086Record.getC01LB21(), ESD0086Record.getC01LB22(), ESD0086Record.getC01LB23(), ESD0086Record.getC01LB24(), ESD0086Record.getC01LB25(),
          					ESD0086Record.getC01LB26(), ESD0086Record.getC01LB27(), ESD0086Record.getC01LB28(), ESD0086Record.getC01LB29(), ESD0086Record.getC01LB30()
          				 };
		  String[] typ = {  ESD0086Record.getC01PT1(), ESD0086Record.getC01PT2(), ESD0086Record.getC01PT3(), ESD0086Record.getC01PT4(), ESD0086Record.getC01PT5(),
          					ESD0086Record.getC01PT6(), ESD0086Record.getC01PT7(), ESD0086Record.getC01PT8(), ESD0086Record.getC01PT9(), ESD0086Record.getC01PT10(),
          					ESD0086Record.getC01PT11(), ESD0086Record.getC01PT12(), ESD0086Record.getC01PT13(), ESD0086Record.getC01PT14(), ESD0086Record.getC01PT15(),
          					ESD0086Record.getC01PT16(), ESD0086Record.getC01PT17(), ESD0086Record.getC01PT18(), ESD0086Record.getC01PT19(), ESD0086Record.getC01PT20(),
          					ESD0086Record.getC01PT21(), ESD0086Record.getC01PT22(), ESD0086Record.getC01PT23(), ESD0086Record.getC01PT24(), ESD0086Record.getC01PT5(),
          					ESD0086Record.getC01PT26(), ESD0086Record.getC01PT27(), ESD0086Record.getC01PT28(), ESD0086Record.getC01PT29(), ESD0086Record.getC01PT30()
          			     };
          String[] lng = {  ESD0086Record.getC01LN1(), ESD0086Record.getC01LN2(), ESD0086Record.getC01LN3(), ESD0086Record.getC01LN4(), ESD0086Record.getC01LN5(),
          					ESD0086Record.getC01LN6(), ESD0086Record.getC01LN7(), ESD0086Record.getC01LN8(), ESD0086Record.getC01LN9(), ESD0086Record.getC01LN10(),
          					ESD0086Record.getC01LN11(), ESD0086Record.getC01LN12(), ESD0086Record.getC01LN13(), ESD0086Record.getC01LN14(), ESD0086Record.getC01LN15(),
          					ESD0086Record.getC01LN16(), ESD0086Record.getC01LN17(), ESD0086Record.getC01LN18(), ESD0086Record.getC01LN19(), ESD0086Record.getC01LN20(),
          					ESD0086Record.getC01LN21(), ESD0086Record.getC01LN22(), ESD0086Record.getC01LN23(), ESD0086Record.getC01LN24(), ESD0086Record.getC01LN25(),
          					ESD0086Record.getC01LN26(), ESD0086Record.getC01LN27(), ESD0086Record.getC01LN28(), ESD0086Record.getC01LN29(), ESD0086Record.getC01LN30()
          				 };
          String[] dec = {  ESD0086Record.getC01DE1(), ESD0086Record.getC01DE2(), ESD0086Record.getC01DE3(), ESD0086Record.getC01DE4(), ESD0086Record.getC01DE5(),
          					ESD0086Record.getC01DE6(), ESD0086Record.getC01DE7(), ESD0086Record.getC01DE8(), ESD0086Record.getC01DE9(), ESD0086Record.getC01DE10(),
          					ESD0086Record.getC01DE1(), ESD0086Record.getC01DE2(), ESD0086Record.getC01DE13(), ESD0086Record.getC01DE14(), ESD0086Record.getC01DE15(),
          					ESD0086Record.getC01DE6(), ESD0086Record.getC01DE7(), ESD0086Record.getC01DE18(), ESD0086Record.getC01DE19(), ESD0086Record.getC01DE20(),
          					ESD0086Record.getC01DE1(), ESD0086Record.getC01DE2(), ESD0086Record.getC01DE23(), ESD0086Record.getC01DE24(), ESD0086Record.getC01DE25(),
          					ESD0086Record.getC01DE6(), ESD0086Record.getC01DE7(), ESD0086Record.getC01DE28(), ESD0086Record.getC01DE29(), ESD0086Record.getC01DE30()
          				 };
          String[] vlu = {  ESD0086Record.getE01RV1(), ESD0086Record.getE01RV2(), ESD0086Record.getE01RV3(), ESD0086Record.getE01RV4(), ESD0086Record.getE01RV5(),
          					ESD0086Record.getE01RV6(), ESD0086Record.getE01RV7(), ESD0086Record.getE01RV8(), ESD0086Record.getE01RV9(), ESD0086Record.getE01RV10(),
          					ESD0086Record.getE01RV11(), ESD0086Record.getE01RV12(), ESD0086Record.getE01RV13(), ESD0086Record.getE01RV14(), ESD0086Record.getE01RV15(),
          					ESD0086Record.getE01RV16(), ESD0086Record.getE01RV17(), ESD0086Record.getE01RV18(), ESD0086Record.getE01RV19(), ESD0086Record.getE01RV20(),
          					ESD0086Record.getE01RV21(), ESD0086Record.getE01RV22(), ESD0086Record.getE01RV23(), ESD0086Record.getE01RV24(), ESD0086Record.getE01RV25(),
          					ESD0086Record.getE01RV26(), ESD0086Record.getE01RV27(), ESD0086Record.getE01RV28(), ESD0086Record.getE01RV29(), ESD0086Record.getE01RV30()
          				 };	
          String[] f01 = {  ESD0086Record.getF01RV1(), ESD0086Record.getF01RV2(), ESD0086Record.getF01RV3(), ESD0086Record.getF01RV4(), ESD0086Record.getF01RV5(),
          					ESD0086Record.getF01RV6(), ESD0086Record.getF01RV7(), ESD0086Record.getF01RV8(), ESD0086Record.getF01RV9(), ESD0086Record.getF01RV10(),
          					ESD0086Record.getF01RV11(), ESD0086Record.getF01RV12(), ESD0086Record.getF01RV13(), ESD0086Record.getF01RV14(), ESD0086Record.getF01RV15(),
          					ESD0086Record.getF01RV16(), ESD0086Record.getF01RV17(), ESD0086Record.getF01RV18(), ESD0086Record.getF01RV19(), ESD0086Record.getF01RV20(),
          					ESD0086Record.getF01RV21(), ESD0086Record.getF01RV22(), ESD0086Record.getF01RV23(), ESD0086Record.getF01RV24(), ESD0086Record.getF01RV25(),
          					ESD0086Record.getF01RV26(), ESD0086Record.getF01RV27(), ESD0086Record.getF01RV28(), ESD0086Record.getF01RV29(), ESD0086Record.getF01RV30()
          				 };
          String[] tbl = {  ESD0086Record.getC01CN1(), ESD0086Record.getC01CN2(), ESD0086Record.getC01CN3(), ESD0086Record.getC01CN4(), ESD0086Record.getC01CN5(),
          					ESD0086Record.getC01CN6(), ESD0086Record.getC01CN7(), ESD0086Record.getC01CN8(), ESD0086Record.getC01CN9(), ESD0086Record.getC01CN10(),
          					ESD0086Record.getC01CN11(), ESD0086Record.getC01CN12(), ESD0086Record.getC01CN13(), ESD0086Record.getC01CN14(), ESD0086Record.getC01CN15(),
          					ESD0086Record.getC01CN16(), ESD0086Record.getC01CN17(), ESD0086Record.getC01CN18(), ESD0086Record.getC01CN19(), ESD0086Record.getC01CN20(),
          					ESD0086Record.getC01CN21(), ESD0086Record.getC01CN22(), ESD0086Record.getC01CN23(), ESD0086Record.getC01CN24(), ESD0086Record.getC01CN25(),
          					ESD0086Record.getC01CN26(), ESD0086Record.getC01CN27(), ESD0086Record.getC01CN28(), ESD0086Record.getC01CN29(), ESD0086Record.getC01CN30()
          				 };																				        					 
          int x = 0;
          int y = 1; 
          String dp = "";
          while (y < 31) {
            if (!lbl[x].equals("")) {
             	String v = String.valueOf(y).trim();
             	dp = ":";
             	if (lbl[x].trim().equals("+")) {
             		row++;
             		lbl[x] = "";
             		dp = "";
             	}
          %>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
             <td nowrap width="35%" align="right"><%=lbl[x]%> <%=dp%> </td>
              <td nowrap width="65%" align="left">
              	<div>
              	<% if (typ[x].equals("A")) { %>
              	<INPUT type="text" name="E01RV<%=v%>" size="60" maxlength="<%=lng[x]%>" value="<%=vlu[x]%>" <%=read%>
              	<%=(f01[x].equals("Y"))?"id=\"txtchanged\"":"" %>>
              	<% } %>
              	<% if (typ[x].equals("N")) { %>
              	<INPUT type="text" name="E01RV<%=v%>" size="25" maxlength="<%=lng[x]%>" value="<%=vlu[x]%>" onKeypress="enterDecimal(event, <%=dec[x]%>)" <%=read%>
              	<%=(f01[x].equals("Y"))?"id=\"txtchanged\"":"" %>>
              	<% } %>
              	<% if (typ[x].equals("B")) { %>
              	<INPUT type="text" name="E01RV<%=v%>" size="5" maxlength="<%=lng[x]%>" value="<%=(vlu[x].length()>= 5 ? vlu[x].substring(0 , 5) : vlu[x])%>" onKeypress="enterInteger(event)" <%=read%>
              	<%=(f01[x].equals("Y"))?"id=\"txtchanged\"":"" %>>
              	<A href="javascript:GetBranch('E01RV<%=v%>','<%=currUser.getE01UBK()%>','D01RV<%=v%>')"><%=help%></a>
              	<input type="text" name="D01RV<%=v%>" size="20" value="<%=(vlu[x].length()>= 5 ? vlu[x].substring(5) :"")%>" readonly> 
              	<% } %>
              	<% if (typ[x].equals("C")) { %>
              	<INPUT type="text" name="E01RV<%=v%>" size="11" maxlength="<%=lng[x]%>" value="<%=(vlu[x].length()>= 10 ? vlu[x].substring(0 , 10) : vlu[x])%>" onKeypress="enterInteger(event)" <%=read%>
              	<%=(f01[x].equals("Y"))?"id=\"txtchanged\"":"" %>>
              	<A href="javascript:GetCustomerDescId('E01RV<%=v%>','D01RV<%=v%>','','')"><%=help%></a> 
              	<input type="text" name="D01RV<%=v%>" size="20" value="<%=(vlu[x].length()>= 10 ? vlu[x].substring(10) :"")%>" readonly>
              	<% } %>
              	<% if (typ[x].equals("F")) { %>
              	<INPUT type="text" name="E01RV<%=v%>" value="<%=vlu[x]%>" readonly <%=(f01[x].equals("Y"))?"id=\"txtchanged\"":"" %>>
              	<select class="bear-dates" id="E01RVD<%=v%>" name="E01RVD<%=v%>" <%=disabled%> onchange="chgDateCal('<%=v%>')"></select>
				<select class="bear-months" id="E01RVM<%=v%>" name="E01RVM<%=v%>" <%=disabled%> onchange="chgDateCal('<%=v%>')"></select>
				<select class="bear-years" id="E01RVY<%=v%>" name="E01RVY<%=v%>"  <%=disabled%> onchange="chgDateCal('<%=v%>')"></select>
              	<% } %>
              	<% if (typ[x].equals("S")) { %>
              	<input type="radio" name="E01RV<%=v%>" value="S" <%if (vlu[x].equals("S")) out.print("checked"); %> <%= disabled %> <%=(f01[x].equals("Y"))?"id=\"txtchanged\"":"" %>>
                Si 
                <input type="radio" name="E01RV<%=v%>" value="N" <%if (!vlu[x].equals("S")) out.print("checked"); %> <%= disabled %> <%=(f01[x].equals("Y"))?"id=\"txtchanged\"":"" %>>
                No 
              	<% } %>
              	<% if (typ[x].equals("T")) { %>
              	<INPUT type="text" name="E01RV<%=v%>" size="5" maxlength="<%=lng[x]%>" value="<%=(vlu[x].length()>= 5 ? vlu[x].substring(0 , 5) : vlu[x])%>" <%=read%>
              	<%=(f01[x].equals("Y"))?"id=\"txtchanged\"":"" %>>
              	<A href="javascript:GetCodeDescCNOFC('E01RV<%=v%>','D01RV<%=v%>','<%=tbl[x]%>')"><%=help%></A>
              	<input type="text" name="D01RV<%=v%>" size="20" value="<%=(vlu[x].length()>= 5 ? vlu[x].substring(5) :"")%>" readonly>
              	<% } %>
           	</div>
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

<br>

<table width="100%" border="0" cellspacing="0" cellpadding="0"
	bgcolor="#FFFFFF" bordercolor="#FFFFFF">
	<tr bgcolor="#FFFFFF">
		<td width="33%" align="center"><input type="checkbox" name="H01FLGWK2" value="1">Aceptar con Avisos</td>
	</tr>
</table>
<table width="100%">
	<tr>
		<td width="33%">
		<div align="center">
			<input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goAction(5);" <%=disabled%>>
		</div>
		</td>
		<td width="33%">
		<div align="center">
			<input id="EIBSBTN" type=button name="Delete" value="Borrar" onClick="goAction(4);" <%=disabled%>>
		</div>
		</td>
		<td width="34%">
		<div align="center">
		<%
			int screen = 1;
			if (userPO.getPurpose().equals("INQUIRY")) {
				screen = 8;
			}
			if (userPO.getPurpose().equals("APPROVAL")) {
				screen = 6;
			}
		%> <input id="EIBSBTN" type=submit name="Exit" value="Salir" onClick="goAction(<%=screen%>);"></div>
		</td>
	</tr>
</table>

</form>
</body>

<SCRIPT>
dates('option');
months('option', 'N'); 
//You can change the startYear(1990) and endYear(2017)
years('option', <%=Integer.parseInt(currUser.getE01RDY())-100%>, <%=Integer.parseInt(currUser.getE01RDY())+100%>);
<%	
    x = 0;
    y = 1; 
    String dd = "";
    String mm = "";
    String yy = "";
    while (y < 31) {
      if (!lbl[x].equals("")) {
      	String v = String.valueOf(y).trim();
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
<script src="<%=request.getContextPath()%>/jquery/markChangedFields.jsp?MSGOBJ=ESD0086Record"> </script>
</html>
