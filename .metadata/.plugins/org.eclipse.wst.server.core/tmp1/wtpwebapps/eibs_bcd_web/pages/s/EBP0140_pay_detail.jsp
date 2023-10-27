<%@ page import="datapro.eibs.master.Util"%>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Actualización Pago Factura</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="EBP0140Record" class="datapro.eibs.beans.EBP014001Message" scope="session" />
<jsp:useBean id="EBP0140glList"   class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<body>

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBSBillsP.jsp"> </SCRIPT>

<script type="text/javascript">

function goInquiry() {
	bilnum = document.getElementById("E01BPBNUM").value;
    var pg = "";
 	pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0160?SCREEN=3" + "&E01BPBNUM=" + bilnum;
 	CenterWindow(pg,900,600,2);
}

function goExit(){

   	document.forms[0].SCREEN.value = '2';
	document.forms[0].submit();
 }
</SCRIPT>

<%	if (!error.getERRNUM().equals("0")) {
				out.println("<SCRIPT Language=\"Javascript\">");
				error.setERRNUM("0");
				out.println("       showErrors()");
				out.println("</SCRIPT>");
	}
	String read = "";
 	String disabled = "";
	if (EBP0140Record.getE01BPBPTY().equals("F"))  
		{ read = " readonly ";
		  disabled = " disabled"; }	
%>


<h3 align="center"><%if (userPO.getType().equals("V")) {
				out.println("Factura de Proveedor ");
			} else if (userPO.getType().equals("C")) {
				out.println("Factura de Cliente ");
			} else {
				out.println("Factura con Orden de Compra ");
			}
			%> - Actualizar Pago 
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 	name="EIBS_GIF" title="pay_detail.jsp, EBP0140"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0140">
<INPUT TYPE=HIDDEN name="SCREEN" value="6"> 
<INPUT TYPE=HIDDEN name="E01BPBNUM" value="<%= EBP0140Record.getE01BPBNUM()%>">
<INPUT TYPE=HIDDEN name="E01BPBSEQ" value="<%= EBP0140Record.getE01BPBSEQ()%>">
<INPUT TYPE=HIDDEN name="E01BPBPTY" value="<%= EBP0140Record.getE01BPBPTY()%>">
<INPUT TYPE=HIDDEN name="E01REQBNK" value="<%= userPO.getBank() %>"> 
<INPUT TYPE=HIDDEN name="E01REQBRN" value="<%= userPO.getBranch() %>"> 
<INPUT TYPE=HIDDEN name="E01REQTYP" value="<%= userPO.getType() %>"> 
<INPUT TYPE=HIDDEN name="E01REQPVI" value="<%= userPO.getHeader1() %>"> 
<INPUT TYPE=HIDDEN name="E01REQDFM" value="<%= userPO.getHeader2() %>"> 
<INPUT TYPE=HIDDEN name="E01REQDFD" value="<%= userPO.getHeader3() %>"> 
<INPUT TYPE=HIDDEN name="E01REQDFY" value="<%= userPO.getHeader4() %>"> 
<INPUT TYPE=HIDDEN name="E01REQDTM" value="<%= userPO.getHeader5() %>">
<INPUT TYPE=HIDDEN name="E01REQDTD" value="<%= userPO.getHeader6() %>"> 
<INPUT TYPE=HIDDEN name="E01REQDTY" value="<%= userPO.getHeader7() %>"> 
<INPUT TYPE=HIDDEN name="DOCUMENTO" value="<%= userPO.getIdentifier()%>">
<INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
<INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
<INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">

<table class="tableinfo" width="100%">
	<tr bordercolor="#FFFFFF">
		<td nowrap>
		<H5>Información Factura</H5>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trclear">
				<td nowrap width="25%" align="right"><B>Número Interno : </B></td>
				<td nowrap width="25%" align="left">
					<a href="javascript:goInquiry()"><%=EBP0140Record.getE01BPBNUM()%></a> - <%=EBP0140Record.getE01BPBSEQ()%>
				</td>
				<td nowrap width="25%" align="right"><B>Proveedor : </B></td>
				<td nowrap width="25%" align="left"><%=EBP0140Record.getE01BPBCOD()%> <%=EBP0140Record.getE01BPBVCN()%></td>
			</tr>
			<tr id="trclear">
				<td nowrap width="25%" align="right">
				 	<%if (!EBP0140Record.getE01BPBORD().equals("0")) {
						%> 	<B>Documento Origen Obligación : </B> 
					<%}%> 
				<td nowrap width="25%" align="left">
					<%if (!EBP0140Record.getE01BPBORD().equals("0")) {
						%><%=EBP0140Record.getE01BPBORD()%> 
					<%}%>
				</td>
				<td nowrap width="25%" align="right"><B> </B></td>
				<td nowrap width="25%" align="left"></td>
			</tr>
			<tr id="trclear">
				<td nowrap width="25%" align="right"><B>Factura Referencia : </B></td>
				<td nowrap width="25%" align="left"><%=EBP0140Record.getE01BPBBIL()%></td>
				<td nowrap width="25%" align="right"><B>Tipo de Pago : </B></td>
				<td nowrap width="25%" align="left">
					<%if (EBP0140Record.getE01BPBPTY().equals("F"))
						out.print("Monto Fijo");%>
					<%if (EBP0140Record.getE01BPBPTY().equals("V"))
						out.print("Monto Variable");%>
				</td>
			</tr>
			<tr id="trclear">
				<td nowrap width="25%" align="right"><B>Descripción Factura :</B></td>
				<td nowrap width="25%" align="left"><%=EBP0140Record.getE01BPBDSC()%></td>
				<td nowrap width="25%" align="right"><B>Fecha Vencimiento de Pago : </B></td>
				<td nowrap width="25%" align="left">
					<%=datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(), EBP0140Record.getE01BPBPDM(), EBP0140Record.getE01BPBPDD(),
							EBP0140Record.getE01BPBPDY())%>
				</td>
			</tr>
			<tr id="trclear">
				<td nowrap width="20%" align="right"><B>Banco : </B></td>
				<td nowrap width="25%" align="left"><%=EBP0140Record.getE01BPBBNK()%></td>
				<td nowrap width="25%" align="right"><B>Moneda : </B><B></B></td>
				<td nowrap width="25%" align="left"><%=EBP0140Record.getE01BPBCCY()%><B></B></td>
			</tr>
			<tr id="trclear">
				<td nowrap width="25%" align="right"><B>Oficina : </B></td>
				<td nowrap width="25%" align="left"><%=EBP0140Record.getE01BPBBRN()%></td>
				<td nowrap width="25%" align="right"><B><B>Monto Factura : </B></B></td>
				<td nowrap width="25%" align="left"><B></B><%=EBP0140Record.getE01BPBBAM()%></td>
			</tr>
			<tr id="trclear">
				<td nowrap width="25%" align="right"><B>Tipo : </B></td>
				<td nowrap width="25%" align="left"><%=EBP0140Record.getE01BPBTYPD()%>
					<% if (userPO.getType().equals("C") )  { 	
								out.println(EBP0140Record.getE01BPBCUN().trim());
			  		}%>
				</td>
				<td nowrap width="25%" align="right"><B>Via de Pago : </B></td>
				<td nowrap width="25%" align="left">
					<%if (EBP0140Record.getE01BPBPVI().equals("A"))
						out.print("ACH");%>
					<%if (EBP0140Record.getE01BPBPVI().equals("R"))
						out.print("Cuenta de Detalle");%>
					<%if (EBP0140Record.getE01BPBPVI().equals("G"))
						out.print("Cuenta Contable");%>
					<%if (EBP0140Record.getE01BPBPVI().equals("C"))
						out.print("Cheque Oficial");%>
					<%if (EBP0140Record.getE01BPBPVI().equals("S"))
						out.print("Swift");%>
					<%if (EBP0140Record.getE01BPBPVI().equals("F"))
					out.print("Transferencia");%>
				</td>
			</tr>
		</table>

		<BR>

		<h5>Información de Pago</h5>
		<table width="100%" > <tr bordercolor="#FFFFFF"> <td width="100%" nowrap>
			<table class="tableinfo" width="100%">
				<tr id="trdark">
					<td nowrap width="50%" align="right"><B>Fecha : </B></td>
					<td nowrap width="50%" align="left">
	               <eibsinput:date name="EBP0140Record" fn_year="E01BPPPDY" fn_month="E01BPPPDM" fn_day="E01BPPPDD" required="false"/>
				</td>
				</tr>
				<tr id="trclear">
					<td nowrap width="50%" align="right"><B>Monto Total : </B></td>
					<td nowrap width="50%" align="left">
      	    	   <eibsinput:text 	name="EBP0140Record" property="E01BPPAMT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" required="false"/></td>
				</tr>
				<tr id="trdark">
					<td nowrap width="50%" align="right"><B> Via : </B></td>
					<td nowrap width="50%" align="left">
						<SELECT name="E01BPPPVI">
							<OPTION <%= EBP0140Record.getE01BPPPVI().trim().equals("A")?"selected":"" %> value="A">ACH</OPTION>
							<OPTION <%= EBP0140Record.getE01BPPPVI().trim().equals("R")?"selected":"" %> value="R">Cuenta Detalle</OPTION>
							<OPTION <%= EBP0140Record.getE01BPPPVI().trim().equals("G")?"selected":"" %> value="G">Cuenta Contable</OPTION>
							<OPTION <%= EBP0140Record.getE01BPPPVI().trim().equals("C")?"selected":"" %> value="C">Cheque Gerencia</OPTION>
							<OPTION <%= EBP0140Record.getE01BPPPVI().trim().equals("S")?"selected":"" %> value="S">Swift</OPTION>
							<OPTION <%= EBP0140Record.getE01BPPPVI().trim().equals("F")?"selected":"" %> value="F">Transferencia</OPTION>
						</SELECT>
					</td>
				</tr>
				<tr id="trclear">
					<td nowrap width="50%" align="right"><B>Estado : </B></td>
					<td nowrap width="50%" align="left">
						<SELECT name="E01BPPSTS">
							<OPTION <%= EBP0140Record.getE01BPPSTS().trim().equals("W")?"selected":"" %> value="W">Pendiente</OPTION>
							<OPTION <%= EBP0140Record.getE01BPPSTS().trim().equals("C")?"selected":"" %> value="C">Confirmada</OPTION>
							<OPTION <%= EBP0140Record.getE01BPPSTS().trim().equals("R")?"selected":"" %> value="R">Rechazada</OPTION>
						</SELECT>
					</td>
				</tr>
			</table>
	</td></tr></table>
		<BR>
		<h5>Información Contable</h5>
	<table width="100%" > <tr bordercolor="#FFFFFF"> <td width="100%" nowrap> 
		<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trdark">
				<td nowrap width="10%" align="center"><b>Sec</b></td>
				<td nowrap width="10%" align="center"><b>DB/CR</b></td>
				<td nowrap width="10%" align="center"><b>Banco</b></td>
				<td nowrap width="10%" align="center"><b>Agencia</b></td>
				<td nowrap width="10%" align="center"><b>Moneda</b></td>
				<td nowrap width="15%" align="center"><b>Cuenta Contable</b></td>
				<td nowrap width="10%" align="center"><b>Cuenta Detalle</b></td>
				<td nowrap width="10%" align="center"><b>Centro de Costo</b></td>
				<td nowrap width="15%" align="center"><b>Monto</b></td>
			</tr>
		<%
    	  int i = 0;
          EBP0140glList.initRow();    
          while (EBP0140glList.getNextRow()) {
            datapro.eibs.beans.EBP014002Message msgList = (datapro.eibs.beans.EBP014002Message) EBP0140glList.getRecord();	
         %>   
                    
    		<TR id=trclear>
				<td NOWRAP align="center" width="10%" ><%= msgList.getE02BPGSEQ() %>
					<INPUT TYPE=HIDDEN name="E02BPGNUM_<%= i %>" value='<%= msgList.getE02BPGNUM() %>'>
					<INPUT TYPE=HIDDEN name="E02BPGSEQ_<%= i %>" value='<%= msgList.getE02BPGSEQ() %>'>	
					<INPUT TYPE=HIDDEN name="E02BPGTYP_<%= i %>" value='<%= msgList.getE02BPGTYP() %>'>	
				</td>
				<td NOWRAP align="center" width="10%" >
					<INPUT TYPE="text" name="E02BPGDC_<%= i %>" size ="3" maxlength="2" value="<%= msgList.getE02BPGDC() %>" readonly>
				</td>
				<td NOWRAP align="center" width="10%" >
					<INPUT type="text" name="E02BPGBNK_<%= i %>" size="3" maxlength="2" value="<%= msgList.getE02BPGBNK() %>" readonly>
				</td>
				<td NOWRAP align="center" width="10%" >
					<INPUT type="text" name="E02BPGBRN_<%= i %>" size="5" maxlength="4" value="<%= msgList.getE02BPGBRN() %>" readonly>
				</td>
				<td NOWRAP align="center" width="10%" >
					<INPUT type="text" name="E02BPGCCY_<%= i %>" size="4" maxlength="3" value="<%= msgList.getE02BPGCCY() %>" readonly>
				</td>
				<td NOWRAP align="center" width="15%" >
					<INPUT type="text" name="E02BPGGLN_<%= i %>" size="18" maxlength="16" value="<%= msgList.getE02BPGGLN() %>" readonly>
				</td>
				<td NOWRAP align="center" width="10%" >
					<INPUT type="text" name="E02BPGACC_<%= i %>" size="14" maxlength="12" value="<%= msgList.getE02BPGACC() %>" readonly>
				</td>
				<td NOWRAP align="center" width="10%" >
					<INPUT type="text" name="E02BPGCCN_<%= i %>" size="9" maxlength="8"	value="<%= msgList.getE02BPGCCN() %>" readonly>
				</td>
				<td NOWRAP align="center" width="15%" >
					<INPUT type="text" name="E02BPGAMT_<%= i %>" size="20" maxlength="15" onkeypress="enterDecimal()" value="<%= msgList.getE02BPGAMT() %>" 
					<%	if (EBP0140Record.getE01BPBPTY().equals("F")) {
						out.print("readonly");
					}%>> 
				</td>				
			</TR>
       	<% 
       	  i++; 
          }%>
	</table>
</td></tr></table>
<TABLE width="100%">
	<TR>
		<TD width="50%" align="center"><INPUT id="EIBSBTN" type="submit"
			name="Submit" value="Enviar"></TD>
		<TD width="50%" align="center"><INPUT id="EIBSBTN" type="submit"
			name="Exit" value="Salir" onclick="goExit();"></TD>
	</TR>
</TABLE>
<br>

<SCRIPT type="text/javascript"> 
	document.forms[0].TOTROWS.value = <%= i %>;
	document.forms[0].NEXTROWS.value = <%= EBP0140glList.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= EBP0140glList.getFirstRec()%>;
</SCRIPT>
</td>
</tr>
</table>
</form>
</body>
</html>
