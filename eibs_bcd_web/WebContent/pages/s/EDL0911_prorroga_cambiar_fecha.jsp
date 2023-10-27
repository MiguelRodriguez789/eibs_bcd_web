<%@page import = "datapro.eibs.master.Util" %>
<%@page import="datapro.eibs.beans.EDL091102Message"%>
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="java.util.ArrayList"%>

<HTML>
<HEAD>
<TITLE>Fechas para Desplazar</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/jquery/themes/smoothness/jquery-ui.css"/> 

<jsp:useBean id="header" class="datapro.eibs.beans.EDL091101Message"  scope="session" />
<jsp:useBean id="Datelist" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="newDate" class="java.util.ArrayList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery-ui-1.10.4.min.js"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/plugins/datepicker/jquery.datepicker.js"> </script>

<script type="text/javascript">

function checkDates(){ 
	var elements = 	document.getElementById("dataTable").getElementsByTagName("tr").length;
	for (var i=0; i< elements.length; i++) {
		if(getElement("datepicker"+i).value == "" || getElement("datepicker"+i).value == null){
			return false;
			break;
		}		
	}
	return true;
}

function goSend() {
	if(checkDates()){
		document.forms[0].submit();
	} else {
		alert("Hay una Fecha que está en blanco. Por favor, seleccione una fecha.");
	}
}

function showDeatil(row) {
	showPage("EDL0911_ln_plan_de_pago_det.jsp?Row=" + row);
}

function cerrarVentana(){
	window.open('','_parent','');
	window.close(); 
}

$(function() {
	$( ".datepicker" ).datepicker({ 
		dateFormat: "dd-mm-yy", 
		changeYear: true,
		changeMonth: true, 
		defaultDate: new Date(<%= currUser.getE01RDY()%>, <%= currUser.getE01RDM()%>-1, <%= currUser.getE01RDD()%>), 
		minDate:  new Date(<%= currUser.getE01RDY()%>, <%= currUser.getE01RDM()%>-1, <%= currUser.getE01RDD()%>), 
		showOn: "button", 
		buttonImage: "<%=request.getContextPath()%>/images/calendar.gif"   
		<%if(header.getE01DEAHFQ().equals("1")) out.print(",beforeShowDay: $.datepicker.noWeekends"); %>		 	
		});
	<%if(header.getE01DEAHFQ().equals("1")){%>
	 $(".datepicker").focus(function () {
			$(".ui-datepicker-week-end").hide();
	 });
	 $(".datepicker").blur(function () {
				$(".ui-datepicker-week-end").hide();
	 });
	 <%}%>   		
});

</script>

</HEAD>

<%
	String title = "";
	if (userPO.getHeader21().trim().equals("1")){ 
		title = "Pr&oacute;rroga por Cuotas";
	} else if (userPO.getHeader21().trim().equals("2")){
		title = "Pr&oacute;rroga por Desplazamiento en " + userPO.getHeader22().trim()+ " meses";
	} else if (userPO.getHeader21().trim().equals("3")){
		title = "Pr&oacute;rroga por Fecha";
	} else {
		title = "Pr&oacute;rroga";
	}
%>

<BODY>

<%
	if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
%>	

<h3 align="center" style="width: 95%"><%=title%>
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="prorroga_cambiar_fecha.jsp,EDL0911"> 
</h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0911" >
	<input TYPE=HIDDEN name="SCREEN" id="SCREEN" value="200">
	<input TYPE=HIDDEN name="E01DLCIGF" id=E01DLCIGF value="<%=header.getE01DLCIGF().trim()%>">
	
	<table class="tableinfo">
		<tr > 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
					<tr id="trdark">
						<td nowrap width="15%" ><div align="right"><b>Cliente :</b></div></td>
						<td nowrap width="10%" > 
							<div align="left">
								<eibsinput:text property="E01DEACUN" name="header" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
							</div>
						</td>
						<td nowrap width="10%" ><div align="right"><b>Nombre :</b> </div></td>
						<td nowrap width="35%"> 
							<div align="left">
								<eibsinput:text property="E01CUSNA1" name="header" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/>
							</div>
						</td>
						<td nowrap width="10%"><div align="right"><b>Tipo : </b></div></td>
						<td nowrap width="20%"> 
							<div align="left">
								<eibsinput:text property="E01DEATYP" name="header" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/>
							</div>
						</td>
					</tr>
					<tr id="trdark">
						<td nowrap width="15%"><div align="right"><b>Cuenta :</b></div></td>
						<td nowrap width="10%"> 
							<div align="left"> 
								<input type="text" name="E01DEAACC" size="14" maxlength="12"  readonly value="<% if (header.getE01DEAACC().trim().equals("999999999999")) out.print("NUEVA CUENTA"); else out.print(header.getE01DEAACC().trim()); %>">
							</div>
						</td>
						<td nowrap width="10%"><div align="right"><b>Moneda : </b></div></td>
						<td nowrap width="35%"> 
							<div align="left">
								<eibsinput:text property="E01DEACCY" name="header" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true"/>
							</div>
						</td>
						<td nowrap width="10%"><div align="right"><b>Producto : </b></div></td>
						<td nowrap width="20%"> 
							<div align="left">
								<eibsinput:text property="E01DEAPRO" name="header" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/>
							</div>
						</td>
					</tr>
			<%if ((!header.getE01DEACNV().equals("")) && (!header.getE01DSCCNV().equals(""))) { %>
					<tr id="trdark"> 
						<td nowrap width="15%" ><div align="right"><b>Convenio : </b></div></td>
						<td nowrap width="85%" colspan="5"> 
							<div align="left"> 
								<eibsinput:text property="E01DEACNV" name="header" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/>
								<eibsinput:text property="E01DSCCNV" name="header" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/>
							</div>
						</td>
					</tr>
			<% }%>
				</table>
			</td>
		</tr>
	</table>

	<%int row = 0; %>
	<h4>Fechas para Desplazar</h4>
	<TABLE class="tableinfo" align="center" style="max-height:400px;width:98%" >
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
			<TH ALIGN=CENTER nowrap width="25%" >Nro<br>Cuota</TH>
			<TH ALIGN=CENTER nowrap width="25%" >Fecha <br>a Pagar (Previo)</TH>
			<TH ALIGN=CENTER nowrap width="25%" >Cuota<br>Total</TH>
			<TH ALIGN=CENTER nowrap width="25%" ><b>Fecha <br>a Pagar (Nueva)</b></TH>
		</TR>
		<tr  height="100%">    
			<td nowrap="nowrap" colspan="8">       
				<div id="dataDiv1"  style="max-height:400px; overflow:auto; border: 0px;"> 
					<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
					<%
						int i = 0;
						int meses = Integer.parseInt(userPO.getHeader22().trim());			
						int maxdys = 0;
						String d1 = ""; String d2 = ""; String d3 = ""; String v1 = ""; String v2 = ""; String v3 = ""; String sq = "";
						int s1 = 0; int s2 = 0; int s3 = 0;
						String DTEDSC = "";
						System.out.println(newDate);		
						Datelist.initRow();
						while (Datelist.getNextRow()) {
							EDL091102Message plan = (EDL091102Message) Datelist.getRecord();
							if (!newDate.isEmpty()){
								DTEDSC = String.valueOf(newDate.get(i));
							}
							i++;
							if (Datelist.getCurrentRow() < 10) sq = "0"+Datelist.getCurrentRow(); else sq = ""+Datelist.getCurrentRow();
							if (currUser.getE01DTF().equals("DMY")) {
								d1 = "E01NEWD"+sq; d2 = "E01NEWM"+sq; d3 = "E01NEWY"+sq;
								s1 = 2; s2 = 2; s3 = 4;
							} else if(currUser.getE01DTF().equals("MDY")) {
								d1 = "E01NEWM"+sq; d2 = "E01NEWD"+sq; d3 = "E01NEWY"+sq;
								s1 = 2; s2 = 2; s3 = 4;
							} else {
								d1 = "E01NEWY"+sq; d2 = "E01NEWM"+sq; d3 = "E01NEWD"+sq;
								s1 = 4; s2 = 2; s3 = 2;
							}
						%> 
						<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
							<td nowrap align="center" width="24%">
								<a href="javascript:showDeatil(<%=Datelist.getCurrentRow()%>)"><%=plan.getE02DLPPNU()%></a>
							</td>
							<td nowrap align="center" width="24%">
								<a href="javascript:showDeatil(<%=Datelist.getCurrentRow()%>)"><%=Util.formatCustomDate(currUser.getE01DTF(),plan.getE02DLPPDM(),plan.getE02DLPPDD(),plan.getE02DLPPDY())%></a>
							</td>
							<td nowrap align="center" width="24%">
								<a href="javascript:showDeatil(<%=Datelist.getCurrentRow()%>)"><%=plan.getE02DLPTOT()%></a>
							</td>	
							<td nowrap align="right" width="24%" class="txtright">
								<div align="left" >
									<%if (userPO.getHeader21().trim().equals("1")){%>
									<!--  
									<input type="text" name="E02NEWDT<Datelist.getCurrentRow()>" <if("0".equals(String.valueOf(Datelist.getCurrentRow()))) out.println("class=\"datepicker\"");> id="datepicker<Datelist.getCurrentRow()>" value="<DTEDSC>" readonly onclick="setAllDates();">
									-->
									<input type="text" id="<%=d1%>" name="<%=d1%>" size="<%=s1+1%>" maxlength="<%=s1%>" value="0" class="txtright" onkeypress=" enterInteger(event)" readonly />
									<input type="text" id="<%=d2%>" name="<%=d2%>" size="<%=s2+1%>" maxlength="<%=s2%>" value="0" class="txtright" onkeypress=" enterInteger(event)" readonly />
									<input type="text" id="<%=d3%>" name="<%=d3%>" size="<%=s3+1%>" maxlength="<%=s3%>" value="0" class="txtright" onkeypress=" enterInteger(event)" readonly />
									<a id="linkHelp" href="javascript:DatePicker(document.forms[0].<%=d1%>,document.forms[0].<%=d2%>,document.forms[0].<%=d3%>)"><img src="<%=request.getContextPath()%>/images/calendar.gif" title="" style="vertical-align: bottom;" border="0"/></a>
									<img src="/eibs_bcd/images/Check.gif" align="bottom" border="0"/> 
									<%}%>
									<%--
									<%if (userPO.getHeader21().trim().equals("2")){
									     int dd = Integer.parseInt(plan.getE02DLPPDD());
									     int mm = Integer.parseInt(plan.getE02DLPPDM());
									     int yy = Integer.parseInt(plan.getE02DLPPDY());
									     mm = mm + meses;
									     if (mm > 12) {
									       mm = mm - 12;
									       yy = yy + 1;
									     }
									     switch (mm){
									      case 2: maxdys=28; break;
									      case 4:
									      case 6:
									      case 9:
									      case 11:maxdys=30; break;
									      default: maxdys=31;
									     }
									     if (dd>maxdys) { dd=maxdys; }
									     plan.setE02NEWDDD(Integer.toString(dd));
									     plan.setE02NEWMMM(Integer.toString(mm));
									     plan.setE02NEWYYY(Integer.toString(yy));
									     if (currUser.getE01DTF().equals("DMY")) {
									       v1 = Integer.toString(dd); v2 = Integer.toString(mm); v3 = Integer.toString(yy); 
									     } else if(currUser.getE01DTF().equals("MDY")) {
									       v1 = Integer.toString(mm); v2 = Integer.toString(dd); v3 = Integer.toString(yy);
									     } else {
									       v1 = Integer.toString(yy); v2 = Integer.toString(mm); v3 = Integer.toString(dd);
									     }
									%>
									--%>
									<%if (userPO.getHeader21().trim().equals("2")){
									     int dd = Integer.parseInt(plan.getE02NEWDDD());
									     int mm = Integer.parseInt(plan.getE02NEWMMM());
									     int yy = Integer.parseInt(plan.getE02NEWYYY());
									     if (currUser.getE01DTF().equals("DMY")) {
									       v1 = Integer.toString(dd); v2 = Integer.toString(mm); v3 = Integer.toString(yy); 
									     } else if(currUser.getE01DTF().equals("MDY")) {
									       v1 = Integer.toString(mm); v2 = Integer.toString(dd); v3 = Integer.toString(yy);
									     } else {
									       v1 = Integer.toString(yy); v2 = Integer.toString(mm); v3 = Integer.toString(dd);
									     }
									%>
									<input type="text" id="<%=d1%>" name="<%=d1%>" size="<%=s1+1%>" maxlength="<%=s1%>" value="<%=v1%>" class="txtright" readonly />
									<input type="text" id="<%=d2%>" name="<%=d2%>" size="<%=s2+1%>" maxlength="<%=s2%>" value="<%=v2%>" class="txtright" readonly />
									<input type="text" id="<%=d3%>" name="<%=d3%>" size="<%=s3+1%>" maxlength="<%=s3%>" value="<%=v3%>" class="txtright" readonly />
									<%}%>
									<%if (userPO.getHeader21().trim().equals("3")){
									     int dd = Integer.parseInt(header.getE01NEWDDD());
									     int mm = Integer.parseInt(header.getE01NEWMMM());
									     int yy = Integer.parseInt(header.getE01NEWYYY());
									     plan.setE02NEWDDD(Integer.toString(dd));
									     plan.setE02NEWMMM(Integer.toString(mm));
									     plan.setE02NEWYYY(Integer.toString(yy));
									     if (currUser.getE01DTF().equals("DMY")) {
									       v1 = Integer.toString(dd); v2 = Integer.toString(mm); v3 = Integer.toString(yy); 
									     } else if(currUser.getE01DTF().equals("MDY")) {
									       v1 = Integer.toString(mm); v2 = Integer.toString(dd); v3 = Integer.toString(yy);
									     } else {
									       v1 = Integer.toString(yy); v2 = Integer.toString(mm); v3 = Integer.toString(dd);
									     }
									%>
									<input type="text" id="<%=d1%>" name="<%=d1%>" size="<%=s1+1%>" maxlength="<%=s1%>" value="<%=v1%>" class="txtright" />
									<input type="text" id="<%=d2%>" name="<%=d2%>" size="<%=s2+1%>" maxlength="<%=s2%>" value="<%=v2%>" class="txtright" />
									<input type="text" id="<%=d3%>" name="<%=d3%>" size="<%=s3+1%>" maxlength="<%=s3%>" value="<%=v3%>" class="txtright" />
									<%}%>

								</div>
							</td>
						</tr>
				<%   } %> 
					</table>
				</div>
			</td>
		</tr>
	</table>
	<br>
	<div align="center"> 
		<input id="EIBSBTN" type=button name="Submit" OnClick="goSend()" value="Enviar">
		<input id="EIBSBTN" type="button" name="Cancel" value="Cancelar" onclick="javascript:cerrarVentana()">
	</div>
</form>

<% if ("S".equals(request.getAttribute("ACT"))) { %>
<script type="text/javascript">
	window.opener.location.href =  '<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0911?SCREEN=150&E01DEAACC=<%=userPO.getAccNum()%>&E01DLCIGF=<%=userPO.getHeader19()%>&E01TIPPRG=<%=userPO.getHeader21()%>&E01NUMMES=<%=userPO.getHeader22()%>&H01FLGWK1=<%=userPO.getHeader17()%>&H01FLGWK2=<%=userPO.getHeader23()%>&H01FLGWK3=<%=userPO.getHeader20()%>&E01NEWMMM=<%=header.getE01NEWMMM()%>&E01NEWDDD=<%=header.getE01NEWDDD()%>&E01NEWYYY=<%=header.getE01NEWYYY()%>&E01EXTMES=<%=userPO.getHeader18()%>';	   	   
	cerrarVentana();	  
</script>
<% } %>  

<script type="text/javascript">
function setAllDates(){
	alert('setAllDates()');
	for (var i=1; i<document.getElementById("dataTable").getElementsByTagName("tr").length; i++) {
		getElement("datepicker"+i).value = getElement("datepicker0").value;
	}
	alert('setAllDates[]');
}
</script>
</BODY>
</HTML>
