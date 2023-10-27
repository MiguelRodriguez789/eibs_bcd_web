<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="datapro.eibs.master.Util" %>
<html>
<head>
<title>Lista de Monitoreo</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="headInfo" class="datapro.eibs.beans.EDL055901Message" scope="session" />
<jsp:useBean id="currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id="EDL055901List" class= "datapro.eibs.beans.JBObjList"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">
<% if ( userPO.getHeader23().equals("G") ||  userPO.getHeader23().equals("V")){ %>
	builtNewMenu(ln_i_1_opt);
<% } else  { %>
	builtNewMenu(ln_i_2_opt);
<% } %>
initMenu();
</SCRIPT>  

<script type="text/javascript">

function goAction(op) {
	getElement("opt").value = op;
	document.forms[0].submit();
}

function showDetail(acc,uqi) {
	var page = '${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSEDL0559?SCREEN=200&E02DEAACC=' + acc + '&E02DEAUQI=' + uqi;
	CenterWindow(page, 900, 600, 2);
}

function showPlan(rzn,uqi) {
	var page = '${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSEDL0900?SCREEN=100&Type=A&Rzn=' + rzn + '&Uqi=' + uqi;
	CenterWindow(page, 900, 600, 2);
}

</SCRIPT>  

</head>

<BODY>

<% 
	if ( !error.getERRNUM().equals("0")  ) {
			out.println("<SCRIPT Language=\"Javascript\">");
			out.println("       showErrors()");
			out.println("</SCRIPT>");
	} 	
%>

<h3 align="center">Hist&oacute;rico Modificaciones / Reestructuraciones<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_modif_list.jsp, EDL0559"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0559" >
	<input type=HIDDEN name="SCREEN" id="SCREEN" value="101">
	<%int row = 0; %>
	<table class="tableinfo" >
		<tr > 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
					<tr id="trdark">
						<td nowrap width="15%" ><div align="right"><b>Cliente :</b></div></td>
						<td nowrap width="10%" > 
							<div align="left">
								<eibsinput:text property="E01HDICUN" name="headInfo" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
							</div>
						</td>
						<td nowrap width="10%" ><div align="right"><b>Nombre :</b> </div></td>
						<td nowrap width="35%"> 
							<div align="left">
								<eibsinput:text property="E01HDINA1" name="headInfo" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/>
							</div>
						</td>
						<td nowrap width="10%"><div align="right"><b>Tipo : </b></div></td>
						<td nowrap width="20%"> 
							<div align="left">
								<eibsinput:text property="E01HDITYP" name="headInfo" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/>
							</div>
						</td>
					</tr>
					<tr id="trdark">
						<td nowrap width="15%"><div align="right"><b>Cuenta :</b></div></td>
						<td nowrap width="10%"> 
							<div align="left"> 
								<eibsinput:text property="E01HDIACC" name="headInfo" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" readonly="true"/>
							</div>
						</td>
						<td nowrap width="10%"><div align="right"><b>Moneda : </b></div></td>
						<td nowrap width="35%"> 
							<div align="left">
								<eibsinput:text property="E01HDICCY" name="headInfo" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true"/>
							</div>
						</td>
						<td nowrap width="10%"><div align="right"><b>Producto : </b></div></td>
						<td nowrap width="20%"> 
							<div align="left">
								<eibsinput:text property="E01HDIPRO" name="headInfo" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/>
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
 </table>
 <br>

	<TABLE  id="mainTable" class="tableinfoList" style="max-height:400px;">
		<tr  height="5%"> 
			<td NOWRAP valign="top" width="100%"> 
				<table id="headTable" width="100%" >
					<tr id="trdark">
						<th align=center nowrap width="25%">Fecha</th>
						<th align=center nowrap width="25%">Proceso</th>
						<th align=center nowrap width="25%">Ver Plan de Pago</th>
						<th align=center nowrap width="25%"></th>
					</tr>
				</table>
			</td>
		</tr>    
		<tr  height="100%">    
			<td nowrap="nowrap">      
				<div id="dataDiv1" style="max-height:400px; overflow:auto;"> 
					<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
					<%
					   EDL055901List.initRow();
					   boolean firstTime = true;
					   String chk = "";
					   while (EDL055901List.getNextRow()) {
					   if (firstTime) {
					     firstTime = false;
					     chk = "checked";
					   } else {
					     chk = "";
					   }
					   datapro.eibs.beans.EDL055901Message msgList = (datapro.eibs.beans.EDL055901Message) EDL055901List.getRecord();
					%>
						<tr id="dataTable<%= EDL055901List.getCurrentRow() %>"> 
							<td nowrap align=center width="25%">
								<a href="javascript:showDetail(<%=msgList.getE01DEAACC().trim()%>,<%=msgList.getE01DEAUQI().trim()%>);">					
								<%= Util.formatCustomDate(currUser.getE01DTF(),msgList.getE01DEALMM(),msgList.getE01DEALMD(),msgList.getE01DEALMY())%>
								</a>
							</td>
							<td nowrap align=center width="25%">
								<a href="javascript:showDetail(<%=msgList.getE01DEAACC().trim()%>,<%=msgList.getE01DEAUQI().trim()%>);">					
								<%= msgList.getE01DEARZN().equals("E") ? "REESTRUCTURACION" : ""%>
								<%= msgList.getE01DEARZN().equals("M") ? "MODIFICACION" : ""%>
								<%= msgList.getE01DEARZN().equals("P") ? "PRORROGA CUOTAS" : ""%>
								<%= msgList.getE01DEARZN().equals("D") ? "DESPLAZAMIENTO" : ""%>
								</a>
							</td>             
							<td nowrap align=center width="25%">
								<a href="javascript:showPlan('<%=msgList.getE01DEARZN().trim()%>',<%=msgList.getE01DEAUQI().trim()%>);">					
								Plan de Pago
								</a>
							</td>             
							<td nowrap align=center width="25%"></td>             
						</tr>
					<% } %>
					</table>
				</div>
			</td>
		</tr>
	</table>
	
	<table class="tbenter" width="98%" align="center"  height="10%">
		<tr>
			<td width="50%" align=left height="25">
			<% 
				 if ( EDL055901List.getShowPrev() ) {
				   int pos = EDL055901List.getFirstRec() - 51;
				   out.print("<A HREF=\"" + request.getContextPath() + "/servlet/datapro.eibs.params.JSEDL0559?SCREEN=201&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
				 }
			%>
			</td>
			<td width="50%" align=right height="25">
			<% 
				 if ( EDL055901List.getShowNext() ) {
				   int pos = EDL055901List.getLastRec();
				   out.print("<A HREF=\"" + request.getContextPath() + "/servlet/datapro.eibs.params.JSEDL0559?SCREEN=201&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
				 }
			%>
			</td>
		</tr>
	</table>

</form>
</body>
</html>
