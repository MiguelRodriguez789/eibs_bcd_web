<%@ page import ="datapro.eibs.master.Util" %>
<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<%@ page import = "java.io.*,java.net.*,datapro.eibs.sockets.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*" %>
<META name="GENERATOR" content="IBM WebSphere Studio">
<TITLE>Mantenimiento de Garantías</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id="gaList" class="datapro.eibs.beans.JBListRec" scope="session" />
<jsp:useBean id="gaCodeList" class="datapro.eibs.beans.JBListRec" scope="session" />
<jsp:useBean id="gaCodeListR" class="datapro.eibs.beans.JBListRec" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="beanListM" class="datapro.eibs.beans.EDP072501Message"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="EDP072501Help"  class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="EDP072501HelpD" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="EDP072501HelpR" class="datapro.eibs.beans.JBObjList" scope="session" />
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<%
	String disabled1 = "";
	// si la propuesta esta en modo de consulta deshabilita asignacion de garantias a la propuesta
	if (userPO.getHeader16().equals("5")) {
	  disabled1 = "disabled";
    }
%>
<SCRIPT type="text/javascript">
	builtNewMenu(pc_optionGaran);


function callInfF() {
var customer = document.forms[0].IDAVAL.value;    
    	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.creditproposal.JSEDP0730?SCREEN=200&E01IFMCUN="+ customer;
    	CenterWindow(page,600,600,2);

}
function setItemInfo1(idx,param2,param3){
	document.forms[0].REF2.value = "";
	document.forms[0].REF.value = param2;
	var actTab= document.forms[0].CCOD.value;
	getParamsD1(idx);
}
function setItemInfo2(idx,param2,param3){
	document.forms[0].REF.value = "";
	document.forms[0].REF2.value = param2;
	document.forms[0].IDAVAL.value = param2;
	document.forms[0].E01ROCREF.value = param2;
	var actTab= document.forms[0].CCOD.value;
	getParamsD1(idx);
}
function setItemInfo(idx,SEQ,IDAVAL){
	var actTab= document.forms[0].CCOD.value;
	document.forms[0].IDAVAL.value = IDAVAL;
	getParamsD(SEQ);
}
function closeEnterACC(){
   	  enterACC.filters[0].apply();
      enterACC.style.visibility="hidden";
      enterACC.filters[0].Play();
}
function cancelBub(){
  event.cancelBubble = true;
}
function ShowEnterAcc() {	 
	 var y=event.clientY + document.body.scrollTop - enterACC.clientHeight;
     var x=event.clientX + document.body.scrollLeft - (enterACC.clientWidth/2);
	 cancelBub();
	 eval('enterACC.style.pixelTop=' + y);
     eval('enterACC.style.pixelLeft=' + x);
	 enterACC.filters[0].apply();
     enterACC.style.visibility="visible";
     enterACC.filters[0].Play();
	 document.forms[0].accnum.focus();
}
function goNew(){
   <%boolean autoNum = true;
try {
	autoNum = JSEIBSProp.getAutoNumCOLL();
} catch (Exception e) {
}
if (!autoNum) {%>
	  ShowEnterAcc();
   <%} else {%>
	  document.forms[0].submit();
   <%}%>
}
function goSubmit(){
  document.forms[0].submit();
}
function goAction(op) {
	switch (op) {
	case  1: 
		CUSNUM = document.forms[0].E01DPCCUN.value;
		roccgt = document.forms[0].E01ROCCGT.value;
		REFERE = document.forms[0].E01DPCNPR.value;
<%--    page = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0050?SCREEN=400&CUSNUM="+ CUSNUM+"&REFERE="+REFERE; --%>
		page = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0711?TYPE=91&CUSNUM="+ CUSNUM+"&REFERE="+REFERE;
		CenterNamedWindow(page,'Information', 980, 700,2);
			break; 
	case  2: 
		CUSNUM = "<%= userPO.getCusNum()%>"
		roccgt = document.forms[0].E01ROCCGT.value;
		seq = document.forms[0].SEQ.value;
		REFERE = document.forms[0].E01DPCNPR.value;
		page = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0050?SCREEN=100&CUSNUM="+ CUSNUM+"&REFERE="+REFERE+"&E01ROCFI1="+seq;
		CenterWindow(page,980,700,2);
			break;   
	case  3:
		if(!document.forms[0].REF.value == ""){
			CUSNUM = "<%= userPO.getCusNum()%>"
			REFERE = document.forms[0].E01DPCNPR.value;
			REF = document.forms[0].REF.value;
			page = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0050?SCREEN=600&CUSNUM="+ CUSNUM+"&REFERE="+REFERE+"&REFNUM="+REF;
    		CenterNamedWindow(page,'Information', 980, 700,2);
		}
	   break;   
	case  4: 
		if(!document.forms[0].REF.value == ""){
			CUSNUM = "<%= userPO.getCusNum()%>"
			REFERE = document.forms[0].E01DPCNPR.value;
			REF = document.forms[0].REF.value; 
			page = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0050?SCREEN=1&PURPOSE=INQUIRY&CUSNUM="+ CUSNUM+"&REF4rmPROP="+REF;
    		CenterWindow(page,980,700,2);;
		}
		break;   
	case  5: 
		if(!document.forms[0].REF.value == ""){
			CUSNUM = "<%= userPO.getCusNum()%>"
			REFERE = document.forms[0].E01DPCNPR.value;
			REF = document.forms[0].REF.value;
			page = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0050?SCREEN=1&PURPOSE=MAINTENANCE&CUSNUM="+ CUSNUM+"&REF4rmPROP="+REF;
    		CenterWindow(page,980,700,2);;
		}
		break;   
	case  6: document.forms[0].opt.value = op;
	       document.forms[0].SCREEN.value = 300;
	       document.forms[0].submit();
		break; 
	case  7: document.forms[0].opt.value = op;
	       	document.forms[0].SCREEN.value = 320;
	       	document.forms[0].submit();
			break;   
	case  8: ok = confirm("Esta seguro que desea eliminar el registro seleccionado?");
	  		if (ok) 
	       {
	       	document.forms[0].opt.value = op;
	       	document.forms[0].SCREEN.value = 330;
	       	document.forms[0].submit();
	       }
			break;   
	case  9:
		 document.forms[0].opt.value = op;
	     	document.forms[0].SCREEN.value = 320;
	       document.forms[0].submit();
			break;   
	case  10: 
			if(!document.forms[0].REF2.value == ""){
			CUSNUM = "<%= userPO.getCusNum()%>"
			REFERE = document.forms[0].E01DPCNPR.value;
			REF = document.forms[0].REF2.value;
			page = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0050?SCREEN=1&PURPOSE=INQUIRY&CUSNUM="+ CUSNUM+"&REF4rmPROP="+REF;
    		CenterWindow(page,980,700,2);
    		}
			break;   
	case  11: 
		if(!document.forms[0].REF2.value == ""){
		   document.forms[0].opt.value = op;
	       document.forms[0].SCREEN.value = 510;
			document.forms[0].E01ROCREF.value = document.forms[0].IDAVAL.value;
	       document.forms[0].submit();
//			CUSNUM = "<%= userPO.getCusNum()%>"
//			REFERE = document.forms[0].E01DPCNPR.value;
//			REF = document.forms[0].REF2.value;
//			page = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0050?SCREEN=200&CUSNUM="+ CUSNUM+"&REFERE="+REFERE+"&REF="+REF;
 //  			CenterWindow(page,600,600,2);;
		}
		break;   
	}
}
function getParams(currrow,SEQ,TYP,DES,CUS) {
	document.forms[0].CURRENTROW.value = currrow;
	document.forms[0].SEQ.value = SEQ;
	document.forms[0].TYP.value = TYP;
	document.forms[0].DES.value = DES;
	document.forms[0].CUS.value = CUS;
}
function getParamsD1(SEQ,GARibs) {
	document.forms[0].SEQD.value = SEQ;
	document.forms[0].GARibs.value = GARibs;
}
function getParamsD(SEQ) {
	document.forms[0].SEQD.value = SEQ;
}
function goCancel() {
document.forms[0].SCREEN.value="100";
document.forms[0].submit(); 
}
function callDocs() {
var NPR = document.forms[0].E01DPCNPR.value;
var WARR = document.forms[0].TYP.value;
    	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.creditproposal.JSEDP0737?SCREEN=100&E01PLTNPR="+NPR+"&E01PLTPRO="+WARR;
    	CenterWindow(page,950,600,2);
}
function callGuard() {
if (("<%=userPO.getHeader21()%>" == "5")) {
    	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.creditproposal.JSEDP0725?SCREEN=200&NPR="+ <%=userPO.getHeader4()%>
    														+"&CUN="
        													+ <%=userPO.getCusNum()%>
        													+"&NAM="
        													+ "<%=userPO.getCusName()%>"
        													+"&opt=5";
    	CenterNamedWindow(page,'Information',650,500,2);
	}else{
    	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.creditproposal.JSEDP0725?SCREEN=200&NPR="+ <%=userPO.getHeader4()%>
    														+"&CUN="
        													+ <%=userPO.getCusNum()%>
        													+"&NAM="
        													+ "<%=userPO.getCusName()%>"
        													+"&opt=2";
    	CenterNamedWindow(page,'Information',650,500,2);
}
}
</SCRIPT>
</HEAD>
<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }
    out.println("<SCRIPT> initMenu(); </SCRIPT>");
%> 
<h3 align="center">Garant&iacute;as por Propuesta de Credito</h3>
<hr>
<FORM name="form1" METHOD="post"
	action="<%=request.getContextPath()%>/servlet/datapro.eibs.creditproposal.JSEDP0725">
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="100"> 
	<INPUT TYPE=HIDDEN NAME="CCOD" VALUE=""> 
	<INPUT TYPE=HIDDEN NAME="ICOD" VALUE=""> 
	<INPUT TYPE=HIDDEN NAME="ROW" VALUE="0"> 
	<input type=HIDDEN name="SEQ" value=""> 
	<input type=HIDDEN name="SEQD" value=""> 
	<input type=HIDDEN name="GARibs" value="">
	<input type=HIDDEN name="TYP" value=""> 
	<input type=HIDDEN name="DES" value=""> 
	<INPUT TYPE=HIDDEN NAME="CURRENTROW" VALUE="0"> 
	<input type=HIDDEN name="opt">
	<input type=HIDDEN name="CUS" value=""> 
	<input type=HIDDEN name="IDAVAL" value=""> 
	<input type=HIDDEN name="E01ROCCGT" value=""> 
	<input type=HIDDEN name="REF" value=""> 
	<input type=HIDDEN name="REF2" value=""> 
	<input type=HIDDEN name="E01ROCREF" value=""> 
<div id="enterACC"
	style="position: absolute; visibility: hidden; left: 25px; top: -50px; z-index: 3; filter: BlendTrans(duration=1)"
	onclick="cancelBub()">
<TABLE id=tbhelp
	style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-color: #0b23b5; border-style: solid solid solid solid; filter: progid : DXImageTransform . Microsoft . dropshadow(OffX=3, OffY=3, Color='gray', Positive='true')">
	<TR>
		<TD ALIGN=right nowrap>Introduzca el Número de Cuenta : <input
			type="text" maxlength=12 size=12 name="accnum"
			onKeyPress="enterInteger()" value=""></TD>
		<TD ALIGN=Left nowrap><a href="javascript:goSubmit()"><img
			name="Image1" border="0"
			src="<%=request.getContextPath()%>/images/s/applicar_on.gif"></a></TD>
	</TR>
</TABLE>
</div>
   <TABLE id="headTable" width="100%" cellpading=0 cellspacing=0>
    <tr id="trdark"> 
      <td align="right"  >
         <b>Cliente :</b>
      </td>
      <td nowrap > 
         <input type="text" name="E01DPCCUN" size="12" readonly value="<%= userPO.getCusNum()%>">
      </td>
      <td align="right"  >
         <b>Nombre :</b>
      </td>
      <td nowrap colspan=3> 
         <input type="text" name="E01CUSNA1" size="45" readonly value="<%=userPO.getCusName()%>">
      </td>         
    </tr> 
    <tr id="trdark"> 
      <td align="right"  >
         <b>Nro. Propuesta :</b>
      </td>
      <td nowrap > 
         <input type="text" name="E01DPCNPR" size="15" readonly value="<%=userPO.getHeader4()%>">
      </td>
      <td nowrap align="right">
      </td>
      <td nowrap colspan=3> 
      </td>
    </tr> 
  </table> 
<TABLE id="mainTable" class="tableinfo">
			<TR>
				<TD nowrap valign="top" width="100%">
				<h3>Nuevas Garantías Presentadas</h3>
				<table class="tbenter" width=100% align=center>
				 	  <tr>
						<% if(!userPO.getHeader16().equals("5")){%>
						<td class=TDBKG width="25%">
							<div align="center"><a href="javascript:goAction(1)"><b>Nueva</b></a></div>
						</td>
						<%}%>
						<% if(userPO.getHeader16().equals("x")){%>
						<td class=TDBKG width="25%">
							<div align="center"><a href="javascript:goAction(4)"><b>Consultar</b></a></div>
						</td>
						<%}%>
						<% if(!userPO.getHeader16().equals("5")){%>
						<td class=TDBKG width="25%">
							<div align="center"><a href="javascript:goAction(5)"><b>Modificar</b></a></div>
						</td>
						<% if(userPO.getHeader16().equals("x")){%>
						<td class=TDBKG width="25%">
							<div align="center"><a href="javascript:goAction(3)"><b>Borrar</b></a></div>
						</td>
						<%}%>
						<td class=TDBKG width="25%">
							<div align="center"><a href="javascript:goAction(6)"><b>Actualizar Asignación a Ppta.</b></a></div>
						</td>
						<%}%>
				  	  </tr>
				</table>
				<TABLE id="headTable1">
					<TBODY>
						<TR id="trdark">
							<TH align="CENTER" nowrap>Sel</TH>
							<TH align="CENTER" nowrap>Asignar<br>a Prop.</TH>
							<TH align="CENTER" nowrap>Cuenta</TH>
							<TH align="CENTER" nowrap>Tipo</TH>
							<TH align="CENTER" nowrap>Valor</TH>
							<TH align="CENTER" nowrap>Id.Propietario</TH>
							<TH align="CENTER" nowrap>Nombre</TH>
						</TR>
					</TBODY>
				</TABLE>
				<DIV id="dataDiv1" class="scbarcolor">
				<TABLE id="dataTable">
		<%
		boolean firstTime = true;
		int k = 0;
		String gaChk_R = "";
		gaCodeListR.initRow();
		EDP072501HelpR.initRow();
		while (gaCodeListR.getNextRow()) {
		gaChk_R = (firstTime) ? "checked" : "";
		firstTime = false;
		EDP072501HelpR.getNextRow();
		datapro.eibs.beans.EDP072501Message msgList =
			(datapro.eibs.beans.EDP072501Message) EDP072501HelpR.getRecord();
			  if (msgList.getE01DPCAPC().equals("P")) {
			%>
					<TBODY>
						<TR>
							<TD ALIGN=Left NOWRAP>
									<input type="radio" name="COLLITEMR" 
									value="<%=EDP072501HelpR.getCurrentRow()%>" <%=gaChk_R%> 
									onClick="setItemInfo1(this.value, 
									'<%= msgList.getE01ROCREF().trim()%>',
									'<%= msgList.getE01ROCTYP().trim()%>');">
							</TD>
							<TD align="CENTER" nowrap>
								<input type=HIDDEN name="E01ROCREFN<%=k%>" value="<%= msgList.getE01ROCREF().trim()%>"> 
								<input type="checkbox" <%=disabled1%> name="E01DPCCOUN<%=k%>" value="Y" <%if (gaCodeListR.getRecord(9).equals("Y")){out.print(" checked");}; %>/>
							</TD>
							<TD align="CENTER" nowrap>
								<DIV nowrap="">			
									<A href="javascript:radioClick('COLLITEMR',<%=k%>)" >
									<%=gaCodeListR.getRecord(0)%></A>	
								</DIV>
							</TD>
							<TD align="LEFT" nowrap>
							<DIV nowrap="">
								<A href="javascript:radioClick('COLLITEMR',<%=k%>)">
								<%=gaCodeListR.getRecord(1)%></A></DIV>
							</TD>
							<TD align="LEFT" nowrap>
							<DIV nowrap=""><A
								href="javascript:radioClick('COLLITEMR',<%=k%>)"><%=gaCodeListR.getRecord(2)%></A></DIV>
							</TD>
							<TD align="LEFT" nowrap>
							<DIV nowrap=""><A
								href="javascript:radioClick('COLLITEMR',<%=k%>)"><%=gaCodeListR.getRecord(3)%></A></DIV>
							</TD>
							<TD align="LEFT" nowrap>
							<DIV nowrap=""><A
								href="javascript:radioClick('COLLITEMR',<%=k%>)"><%=gaCodeListR.getRecord(4)%></A></DIV>
							</TD>
						</TR>
						<%k++;
						};
					}%>
					</TBODY>
				</TABLE>
				</DIV>
				</TD>

			</TR>
</TABLE>
<TR>

<TABLE id=tabDESC class="tbenter">
	<TR>
		<TD ALIGN=RIGHT width="15%" nowrap></TD>
		<TD ALIGN=LEFT>
		</TD>
		<TD ALIGN=RIGHT width="45%" nowrap>
			</TD>
		<TD ALIGN=LEFT>
		</TD>
	</TR>
</TABLE>

<%--                                --%> 

</TR>
<BR>
<TR>
	<TABLE id="mainTable" class="tableinfo">
		<TBODY>
			<TR>
				<TD nowrap valign="top" width="100%">
				<H3>Garantías Constituidas</H3>
				<table class="tbenter" width=100% align=center>
				 	  <tr>
						<% if(userPO.getHeader16().equals("x")){%>
						<td class=TDBKG width="50%">
							<div align="center">
								<a href="javascript:goAction(11)"><b>Copiar a la Propuesta</b></a>
							</div>
						</td>
						<% } %>
						<td class=TDBKG width="100%">
							<div align="center"><a href="javascript:goAction(10)"><b>Consultar</b></a></div>
						</td>
				  	  </tr>
					</table>
				
				<TABLE id="headTable3">
					<TBODY>
						<TR id="trdark">
							<TH align="CENTER" nowrap>Sel</TH>
							<TH align="CENTER" nowrap>Asignar<br>a Prop.</TH>
							<TH align="CENTER" nowrap>Cuenta</TH>
							<TH align="CENTER" nowrap>Tipo</TH>
							<TH align="CENTER" nowrap>Valor</TH>
							<TH align="CENTER" nowrap>Id.Propietario</TH>
							<TH align="CENTER" nowrap>Nombre</TH>
							<TH align="CENTER" nowrap>Prestamo</TH>
<%-- 
							<TH align="CENTER" nowrap>Propuesta</TH>
--%>
						</TR>
					</TBODY>
				</TABLE>

				<DIV id="dataDiv3" class="scbarcolor">

				<TABLE id="dataTableRoc">
		<%k = 0;
		firstTime = true;
		gaChk_R = "";
		gaCodeListR.initRow();
		EDP072501HelpR.initRow();
		while (gaCodeListR.getNextRow()) {
		gaChk_R = (firstTime) ? "checked" : "";
		firstTime = false;
		EDP072501HelpR.getNextRow();
		datapro.eibs.beans.EDP072501Message msgList =
			(datapro.eibs.beans.EDP072501Message) EDP072501HelpR.getRecord();
			  if (msgList.getE01DPCAPC().equals("")) {
			%>
					<TBODY>
						<TR>
							<TD ALIGN=Left NOWRAP>
									<input type="radio" name="COLLITEMR" 
									value="<%=EDP072501HelpR.getCurrentRow()%>" <%=gaChk_R%> 
									onClick="setItemInfo2(this.value, 
									'<%= msgList.getE01ROCREF().trim()%>',
									'<%= msgList.getE01ROCTYP().trim()%>');">
							</TD>
							<TD align="CENTER" nowrap>
								<input type=HIDDEN name="E01ROCREFP<%=k%>" value="<%= msgList.getE01ROCREF().trim()%>"> 
								<input type="checkbox" <%=disabled1%> name="E01DPCCOUP<%=k%>" value="Y" <%if (gaCodeListR.getRecord(9).equals("Y")){out.print(" checked");}; %>/>
							</TD>
							</TD>
							<TD align="CENTER" nowrap>
								<DIV nowrap="">			
									<A href="javascript:radioClick('COLLITEMR',<%=k%>)" >
									<%=gaCodeListR.getRecord(0)%></A>	
								</DIV>
							</TD>
							<TD align="LEFT" nowrap>
							<DIV nowrap="">
								<A href="javascript:radioClick('COLLITEMR',<%=k%>)">
								<%=gaCodeListR.getRecord(1)%></A></DIV>
							</TD>
							<TD align="LEFT" nowrap>
							<DIV nowrap=""><A
								href="javascript:radioClick('COLLITEMR',<%=k%>)"><%=gaCodeListR.getRecord(2)%></A></DIV>
							</TD>
							<TD align="LEFT" nowrap>
							<DIV nowrap=""><A
								href="javascript:radioClick('COLLITEMR',<%=k%>)"><%=gaCodeListR.getRecord(3)%></A></DIV>
							</TD>
							<TD align="LEFT" nowrap>
							<DIV nowrap=""><A
								href="javascript:radioClick('COLLITEMR',<%=k%>)"><%=gaCodeListR.getRecord(4)%></A></DIV>
							</TD>
							<TD align="LEFT" nowrap>
							<DIV nowrap=""><A
								href="javascript:radioClick('COLLITEMR',<%=k%>)"><%=msgList.getE01DPCSTN().trim()%></A></DIV>
							</TD>
<%-- 
							<TD align="LEFT" nowrap>
							<DIV nowrap=""><A
								href="javascript:radioClick('COLLITEMR',<%=k%>)"><%=msgList.getE01DPCOFN().trim()%></A></DIV>
							</TD>
--%>
						</TR>
						<%k++;
						};
					}%>
					</TBODY>
				</TABLE>
				</DIV>
				</TD>

			</TR>
		</TBODY>
	</TABLE>


	<%if (!error.getERRNUM().equals("0")) {
	error.setERRNUM("0");
	out.println("<SCRIPT Language=\"Javascript\">");
	out.println("       showErrors()");
	out.println("</SCRIPT>");
	int row;
	String code = "";
	String flag = "";
	try {
		row = Integer.parseInt(request.getParameter("ROW"));
	} catch (Exception e) {
		row = 0;
	}
	gaList.setCurrentRow(row);
	flag = gaList.getFlag();
	code = gaList.getRecord(1);%>
	<SCRIPT type="text/javascript">
     var collLen = document.forms[0].elements("COLLCOD").length;
     var colItm = document.forms[0].elements("COLLITEM<%=flag%>");
     var itemLen = colItm.length; 
     for(var i=0; i < collLen;i++) {
       if (document.forms[0].COLLCOD[i].value == "<%=flag%>") {
         document.forms[0].COLLCOD[i].checked = true;
         break;
       }
     }
     for(var i=0; i<itemLen;i++) {
       if (colItm[i].value == "<%=code%>") {
         colItm[i].checked = true;
         break;
       }
     }
   </SCRIPT>
	<%}
%>
	<SCRIPT type="text/javascript">

     function resizeDoc() {
      var actvTb = document.forms[0].CCOD.value;
      var dataT = getElement("dataTableactTab");
      var dataR = getElement("dataTableRoc");
      var data = getElement("dataTable");
       adjustEquTables( getElement("headTable1"), data, getElement("dataDiv1"),1,false);
       adjustEquTables( getElement("headTable3"), dataR, getElement("dataDiv3"),1,false);
      }
	 showChecked("COLLCOD");
	 showChecked("COLLITEM");
     resizeDoc();
     window.onresize=resizeDoc;
//     setItemInfo();
	 showChecked("COLLITEMR");
</SCRIPT>

</TR>
</FORM>
</BODY>
</HTML>
