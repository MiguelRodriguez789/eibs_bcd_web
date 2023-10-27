<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<html>
<head>
<title>Devolucion Recibida - Canje</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css"rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/jquery/themes/smoothness/jquery-ui.css"/> 

<jsp:useBean id="msgRcd" class= "datapro.eibs.beans.EDD096101Message"  scope="session"  />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"></SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"></SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/jquery.jsp"> </script>
<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"></script>
<script src="<%=request.getContextPath()%>/jquery/markChangedFields.jsp?MSGOBJ=msgRcd"> </script>

<SCRIPT type="text/javascript">

<%int row = 0; %>

<%
	String read = "";
 	String disabled = "";
 	boolean readOnly = false;
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"Campo Obligatorio\" align=\"bottom\" border=\"0\" >";
 	String help = "<img src=\"" + request.getContextPath() + "/images/1b.gif\" title=\"Ayuda\" align=\"bottom\" border=\"0\" >";
 	if (!(userPO.getPurpose().equals("NEW"))) 
		{ read = " readonly ";
		  disabled = " disabled"; 
		  mandatory = "";
		  readOnly = true;
	}	
 	boolean isInquiry = (userPO.getPurpose().equals("INQUIRY") || userPO.getPurpose().equals("APPROVAL"));
 	boolean isReadOnly =isInquiry;
 	String readMnt = (userPO.getPurpose().equals("NEW")?"":" readonly");
 	boolean readMntB = (userPO.getPurpose().equals("NEW")?false:true);
 	String disabledMnt = (userPO.getPurpose().equals("NEW")?"":" disabled");
 	if (isInquiry) {
 	  help = "";
 	}
%>

	
function goAction(op) {
	document.forms[0].SCREEN.value = op;
	submitForm();
}
</SCRIPT>


</head>
<body>
	<%
		if (!error.getERRNUM().equals("0")) {
			error.setERRNUM("0");
			out.println("<SCRIPT Language=\"Javascript\">");
			out.println("       showErrors()");
			out.println("</SCRIPT>");
		}
  out.println("<SCRIPT> initMenu(); </SCRIPT>");		
	%>
	<div align="center">
		<h3>
			Devolucion Recibida<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cleaning_dr.jsp,EDD0961">
		</h3>
	</div>
	
<hr size="4">
	<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.cleaning.JSEDD0961">
	<h4>Informaci&oacute;n B&aacute;sica</h4>
	<input type="hidden" name="SCREEN" value="12">

	<table class="tableinfo">
		<tr>
			<td nowrap>
				<table cellpadding=2 cellspacing=0 width="100%" border="0">
            		<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
						<TD nowrap width="25%">
							<DIV align="right">Banco / Moneda:</DIV>
						</TD>
						<TD nowrap width="25%">
							<INPUT type="text" name="E01CANBNK" id="E01CANBNK" size="2" maxlength="2" value="<%=msgRcd.getE01CANBNK().trim()%>" readonly>
							<INPUT type="text" name="E01CANCCY" size="4" maxlength="3" value="<%=msgRcd.getE01CANCCY().trim()%>" readonly>
						</TD>
						<td nowrap width="25%" align="right">Banco del Cheque :</td>
						<TD nowrap width="25%">
							<INPUT type="text" name="E01CANCOM" size="5" maxlength="4" value="<%=msgRcd.getE01CANCOM().trim()%>"  readonly>
                        	<input type="text" name="D01CANCOM" size="47" maxlength="45" value="<%= msgRcd.getD01CANCOM().trim()%>" readonly>
						</td>
					</tr>
                	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
						<TD nowrap width="25%" align="right">Cheque Numero : </TD>
						<TD nowrap width="25%">
							<INPUT type="text" name="E01CANCKN" size="13" maxlength="11" value="<%=msgRcd.getE01CANCKN().trim()%>" onkeypress="enterInteger(event)" readonly>
						</TD>
						<TD nowrap width="25%" align="right">Digito Verificacion <br> posicion 46 : </TD>
						<TD nowrap width="25%">
							<INPUT type="text" name="E01CANDIG" size="3" maxlength="1" value="<%=msgRcd.getE01CANDIG().trim()%>" readonly>
 					</tr>
					<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
						<TD nowrap width="25%" align="right">Cuenta del Cheque : </TD>
						<TD nowrap width="25%">
							<INPUT type="text" name="E01CANACK" size="18" maxlength="16" value="<%=msgRcd.getE01CANACK().trim()%>" onkeypress="enterInteger(event)" readonly>
          				<td nowrap width="25%" align="right">Centro de Canje :</td>
						<TD nowrap width="25%">
							<INPUT type="text" name="E01CANCCA" size="5" maxlength="4" value="<%=msgRcd.getE01CANCCA().trim()%>"  readonly>
						</td>
 					</tr>
					<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
						<td nowrap width="25%" align="right">Valor :</td>
						<TD nowrap width="25%">
							<INPUT type="text" name="E01CANAMT" size="18" maxlength="15" value="<%=msgRcd.getE01CANAMT().trim()%>" onkeypress="enterInteger(event)" readonly>
						</td>
 						<td nowrap width="25%" align="right"></td>
						<TD nowrap width="25%">
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

<h4>Devoluci&oacute;n Recibida</h4>
	<table class="tableinfo">
		<tr>
			<td nowrap>
				<table cellpadding=2 cellspacing=0 width="100%" border="0">
					<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
          				<td nowrap width="25%" align="right">Oficina :</td>
						<TD nowrap width="25%">
                        	<eibsinput:help name="msgRcd" property="E01CANBRN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH%>" required="true" fn_param_one="E01CANBRN" fn_param_two="document.getElementById('E01CANBNK').value" fn_param_three="D01CANBRN"/>
              				<eibsinput:text name="msgRcd" property="D01CANBRN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
						</td>
						<td nowrap width="25%">
							<div align="right">Ruta :</div>
						</td>
						<td nowrap width="25%">
							<INPUT type="text" name="E01CANRUT" size="5" maxlength="4" value="<%=msgRcd.getE01CANRUT().trim()%>"  readonly>
                        	<a href="javascript:GetCodeDescCNOFC('E01CANRUT','D01CANRUT','89')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
                        	<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"> 
                        	<input type="text" name="D01CANRUT" size="47" maxlength="45" value="<%= msgRcd.getD01CANRUT().trim()%>" readonly>
						</td>
 					</tr>
					<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
						<td nowrap width="25%" align="right">Multiples Pagos :</td>
						<TD nowrap width="25%">
							<INPUT type="radio" name="E01CANMCH" value="Y" <%if (msgRcd.getE01CANMCH().equals("Y")) out.print("checked");%>>Si 
							<INPUT type="radio" name="E01CANMCH" value="N" <%if (msgRcd.getE01CANMCH().equals("N")) out.print("checked");%>>No
						</td>
						<td nowrap width="25%">
							<div align="right">Cuenta en que se deposita :</div>
						</td>
						<TD nowrap width="25%">
							<div align="left">
								<input type="text" name="E01CANACP" size="12" maxlength="12" value="<%=msgRcd.getE01CANACP()%>" /> 
								<a href="javascript:GetAccountCustomer('E01CANACP',document.forms[0].E01CANBNK.value,'','','')">
								<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" ></a>
							</div>
						</td>
 					</tr>
					<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
						<td nowrap width="25%">
							<div align="right">Cuenta Contable  :</div>
						</td>
						<TD nowrap width="25%">
							<div align="left">
                    			<eibsinput:text name="msgRcd" property="E01CANGLN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" />
                				<a href="javascript:GetLedger('E01CANGLN',document.forms[0].E01CANBNK.value,document.forms[0].E01CANCCY.value,'')">
                				<img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" border="0" ></a>
							</div>
						</td>
						<td nowrap width="25%">
							<div align="right">Fecha Deposito :</div>
						</td>
						<TD nowrap width="25%">
							<eibsinput:date name="msgRcd" fn_year="E01CANDYY" fn_month="E01CANDMM" fn_day="E01CANDDD" />
						</td>
					</tr>
          			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
						<td nowrap width="25%">
							<div align="right">Causal 1:</div>
						</td>
						<td nowrap width="25%">
          					<input type="text" name="E01CANCA1" id="E01CANCA1" size="5" maxlength="4" value="<%=msgRcd.getE01CANCA1()%>" readonly>
          					<a href="javascript:GetCasualTable('E01CANCA1','D01CANCA1')">
          					<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"  ></a>
          					<input type="text" name="D01CANCA1" size="47" maxlength="45" value="<%= msgRcd.getD01CANCA1().trim()%>" readonly>
						</td>
						<td nowrap width="25%">
							<div align="right">Causal 2:</div>
						</td>
						<td nowrap width="25%">
          					<input type="text" name="E01CANCA2" id="E01CANCA2" size="5" maxlength="4" value="<%=msgRcd.getE01CANCA2()%>" readonly>
          					<a href="javascript:GetCasualTable('E01CANCA2','D01CANCA2')">
          					<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"  ></a>
          					<input type="text" name="D01CANCA2" size="47" maxlength="45" value="<%= msgRcd.getD01CANCA2().trim()%>" readonly>
						</td>
					</tr>
          			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
						<td nowrap width="25%">
							<div align="right">Causal 3:</div>
						</td>
						<td nowrap width="25%">
          					<input type="text" name="E01CANCA3" id="E01CANCA3" size="5" maxlength="4" value="<%=msgRcd.getE01CANCA3()%>" readonly>
          					<a href="javascript:GetCasualTable('E01CANCA3','D01CANCA3')">
          					<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"  ></a>
          					<input type="text" name="D01CANCA3" size="47" maxlength="45" value="<%= msgRcd.getD01CANCA3().trim()%>" readonly>
						</td>
						<td nowrap width="25%">
							<div align="right">Causal 4:</div>
						</td>
						<td nowrap width="25%">
          					<input type="text" name="E01CANCA4" id="E01CANCA4" size="5" maxlength="4" value="<%=msgRcd.getE01CANCA4()%>" readonly>
          					<a href="javascript:GetCasualTable('E01CANCA4','D01CANCA4')">
          					<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"  ></a>
          					<input type="text" name="D01CANCA4" size="47" maxlength="45" value="<%= msgRcd.getD01CANCA4().trim()%>" readonly>
						</td>
					</tr>
          			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
						<td nowrap width="25%" align="right">Codigo Cubierta  :
					</td>
					<td nowrap width="25%">
                  		<input type="text" name="E01CANCDR" size="12" maxlength="12" value="<%=msgRcd.getE01CANCDR()%>" />
                  		<a href="javascript:GetCov('E01CANCDR')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0"  ></a>
					</td>
						<td nowrap width="25%">
							<div align="right"></div>
						</td>
						<TD nowrap width="25%">
							<div align="left">
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

	<table width="100%">		
    	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
  			<td width="50%">
  				<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
  		  			<div align="center"> 
     					<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="goAction(12);">
     	  			</div>	
     	  		<%}%>
  			</td>
  			<td width="50%">
  		  		<div align="center"> 
     				<input id="EIBSBTN" type="button" name="Exit" value="Salir" onClick="goAction(1);">
     	  		</div>	
  			</td>
  		</tr>	
  	</table>	

</form>
	
</body>
</html>
