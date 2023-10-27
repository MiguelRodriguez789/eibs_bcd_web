<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.datapro.constants.EibsFields"%>
	
<%@ page import = "datapro.eibs.master.Util, datapro.eibs.beans.ERC004002Message, datapro.eibs.beans.ERC004003Message" %>	
	
<html>
<head>
<title>Reconciliacion Bancos</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/Ajax.js"> </SCRIPT>

<style type="text/css"> 
	input { 
         text-align:right; 
    } 
</style> 

</head>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "msg" class= "datapro.eibs.beans.ERC004001Message"  scope="session" />
<jsp:useBean id= "ibsList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "carList" class= "datapro.eibs.beans.JBObjList"  scope="session" />

<body>

<script type="text/javascript">
	
	function sort(order, type) {
  	    document.getElementById("IBS_TOTAL_DT").value = "0.00";
  	    document.getElementById("CAR_TOTAL_DT").value = "0.00";
  	    document.getElementById("IBS_TOTAL_CT").value = "0.00";
  	    document.getElementById("CAR_TOTAL_CT").value = "0.00";
		var url = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSERC0040?SCREEN=300&orderBy=" + order + "&type=" + type;
		GetXMLResponse(url, tableCallback, false);
	}
	
	function validate() {
  	    var debitibs = document.getElementById("IBS_TOTAL_DT").value;
  	    var debitcar = document.getElementById("CAR_TOTAL_DT").value;
  	    var creditibs = document.getElementById("IBS_TOTAL_CT").value;
  	    var creditcar = document.getElementById("CAR_TOTAL_CT").value;
	
		return (debitibs == creditcar) && (creditibs == debitcar);
	}
	
  	function goAction() {
  	    var itemsibs = "";
  	    var itemscar = "";
  	    var countibs = 0;
  	    var countcar = 0;
  		var form = document.forms[0];
		var formLength = form.elements.length;
    	for (n=0; n<formLength; n++) {
    		var elemt = form.elements[n];
      		if (elemt.type == 'checkbox') {
				if (elemt.checked) {
					if (elemt.name == 'rowcar') {
						itemscar += "&rowcar=" + elemt.value;
						countcar++;
					} else if (elemt.name == 'rowibs') {
						itemsibs += "&rowibs=" + elemt.value;
						countibs++;
					}
            	}	
    		}
		}
		if (countcar == 0 && countibs == 0) {
			alert("Error. No hay transacciones seleccionadas.");
		} else if (confirm("Usted ha seleccionado " + countcar + " transaccion(es) de Cartola y " + countibs + " transaccion(es) del IBS. \n\r ¿Desea usted continuar con esta selección?")) {
			if (validate()) {
				document.forms[0].action.value += itemscar + itemsibs;  
				document.forms[0].submit();
			} else {
				alert("Error. Los totales de las transacciones seleccionadas no son iguales.");
			}
		}
  	}
  	
  	function update(obj) {
  		var url = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSERC0040";
  		var screen = "";
  		if (obj.name == 'rowibs') {
  			screen = obj.checked ? "500" : "501"
			url += "?SCREEN=" + screen + "&row=" + obj.value + "&debit=" + document.getElementById("IBS_TOTAL_DT").value + "&credit=" + document.getElementById("IBS_TOTAL_CT").value;
			GetXMLResponse(url, divCallback, false);
  		} else if (obj.name == 'rowcar') {
  			screen = obj.checked ? "600" : "601"
			url += "?SCREEN=" + screen + "&row=" + obj.value + "&debit=" + document.getElementById("CAR_TOTAL_DT").value + "&credit=" + document.getElementById("CAR_TOTAL_CT").value;
			GetXMLResponse(url, divCallback, false);
  		}
  	}
  	
</script>

<H3 align="center">Reconciliación de Bancos Manual
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rcbank_list_selection, ERC0040"></H3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSERC0040">
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="400">

<table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr>
             <td nowrap width="20%" align="right"> Codigo Banco : </td>
             <td nowrap width="30%" align="left"><%= msg.getE01BRMEID().trim() %></td>
             <td nowrap width="20%" align="right"> Nombre : </td>
             <td nowrap width="30%"align="left"><%= msg.getE01CUSNA1().trim() %></td>
         </tr>
          <tr>
             <td nowrap width="20%" align="right"> Cuenta Banco : </td>
             <td nowrap width="30%" align="left"><%= msg.getE01BRMCTA().trim() %></td>
             <td nowrap width="20%" align="right"> Cuenta IBS : </td>
             <td nowrap width="30%"align="left"><%= msg.getE01BRMACC().trim() %></td>
         </tr>
        </table>
      </td>
    </tr>
</table>
	
  	<table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0">
  		<tr>
  			<th width="50%" align="center"><b>Transaciones de Cartola</b></th>
  			<th width="50%" align="center"><b>Transaciones del IBS</b></th>
  		</tr>
  		<tr>
  			<td width="50%">
				<table id="headTable1" class="tbhead" cellspacing=0 cellpadding=2 width="100%" border="0">
					<tr id="trdark">
						<th align="center" width="5%">&nbsp;</th>
						<th align="center" width="19*%"><a href="javascript:sort('date', 'car')">Fecha</a></th>
						<th align="center" width="19%"><a href="javascript:sort('reference', 'car')">Referencia</a></th>
						<th align="center" width="19%"><a href="javascript:sort('code', 'car')">Código</a></th>
						<th align="center" width="19%"><a href="javascript:sort('debit', 'car')">Débito</a></th>
						<th align="center" width="19%"><a href="javascript:sort('credit', 'car')">Crédito</a></th>
					</tr>
				</table>
  			</td>
  			<td width="50%">
				<table id="headTable2" class="tbhead" cellspacing=0 cellpadding=2 width="100%" border="0">
					<tr id="trdark">
						<th align="center" width="5%">&nbsp;</th>
						<th align="center" width="19%"><a href="javascript:sort('date', 'ibs')">Fecha</a></th>
						<th align="center" width="19%"><a href="javascript:sort('reference', 'ibs')">Referencia</a></th>
						<th align="center" width="19%"><a href="javascript:sort('code', 'ibs')">Código</a></th>
						<th align="center" width="19%"><a href="javascript:sort('debit', 'ibs')">Débito</a></th>
						<th align="center" width="19%"><a href="javascript:sort('credit', 'ibs')">Crédito</a></th>
					</tr>
				</table>
  			</td>
  		</tr>
  		<tr>
  			<td width="50%" align="center" valign="top">
  				<table  id="dataTable1" class="tableinfo" ALIGN=CENTER style="width:'100%'">
					<tr>    
						<td NOWRAP width="100%">
							 <div id="dataDiv1" class="scbarcolor" style="width:100%; height:300px; overflow:auto;">  
							 	<table id="car" width="100%">      
<%
								carList.initRow();
								while (carList.getNextRow()) {
									ERC004003Message car = (ERC004003Message) carList.getRecord();
%>
										<tr>
											<td align="center" width="5%">
												<input type="checkbox" id="rowcar" name="rowcar" value="<%=carList.getCurrentRow()%>" onclick="update(this)">
											</td>
											<td align="center" width="19%">
												<div><%=Util.formatDate(car.getE03RCSBDD(), car.getE03RCSBDM(), car.getE03RCSBDY())%></div>
											</td>
											<td align="center" width="19%">
												<div><%=Util.formatCell(car.getE03RCSCKN())%></div>
											</td>
											<td align="center" width="19%">
												<div><%=Util.formatCell(car.getE03RCSCDE())%></div>
											</td>
											<td align="right" width="19%">
												<div><%=Util.formatCCY(car.getE03RCSAMD())%></div>
											</td>
											<td align="right" width="19%">
												<div><%=Util.formatCCY(car.getE03RCSAMC())%></div>
											</td>
										</tr> 
<%									
								} 
								if (carList.size() < ibsList.size()) {
									for (int i = carList.size(); i < ibsList.size(); i++) {
%>
										<tr>
											<td align="center" width="5%">
												<input type="checkbox" id="rowcar" name="rowcar" value="<%=i%>" disabled="disabled">
											</td>
											<td align="center" width="19%">
												<div><%=Util.formatCell("")%></div>
											</td>
											<td align="center" width="19%">
												<div><%=Util.formatCell("")%></div>
											</td>
											<td align="center" width="19%">
												<div><%=Util.formatCell("")%></div>
											</td>
											<td align="right" width="19%">
												<div><%=Util.formatCell("")%></div>
											</td>
											<td align="right" width="19%">
												<div><%=Util.formatCell("")%></div>
											</td>
										</tr>
			
<%									
									}
								}
%>
								</table>
							</div>  				
						</td>
					</tr>	
  				</table>
  			</td>
  			<td width="50%" align="center" valign="top">
  				<table  id="dataTable2" class="tableinfo" ALIGN=CENTER style="width:'100%'">
					<tr>    
						<td NOWRAP width="100%">
							 <div id="dataDiv2" class="scbarcolor" style="width:100%; height:300px; overflow:auto;">  
							 	<table id="ibs" width="100%">      
<%
								ibsList.initRow();
								while (ibsList.getNextRow()) {
									ERC004002Message ibs = (ERC004002Message) ibsList.getRecord();
%>
										<tr>
											<td align="center" width="5%">
												<input type="checkbox" id="rowibs" name="rowibs" value="<%=ibsList.getCurrentRow()%>" onclick="update(this)">
											</td>
											<td align="center" width="19%">
												<div><%=Util.formatDate(ibs.getE02RCTBDD(), ibs.getE02RCTBDM(), ibs.getE02RCTBDY())%></div>
											</td>
											<td align="center" width="19%">
												<div><%=Util.formatCell(ibs.getE02RCTCKN())%></div>
											</td>
											<td align="center" width="19%">
												<div><%=Util.formatCell(ibs.getE02RCTCDE())%></div>
											</td>
											<td align="right" width="19%">
												<div><%=Util.formatCCY(ibs.getE02RCTAMD())%></div>
											</td>
											<td align="right" width="19%">
												<div><%=Util.formatCCY(ibs.getE02RCTAMC())%></div>
											</td>
										</tr> 
<%									
								} 
								if (ibsList.size() < carList.size()) {
									for (int i = ibsList.size(); i < carList.size(); i++) {
%>
										<tr>
											<td align="center" width="5%">
												<input type="checkbox" id="rowcar" name="rowibs" value="<%=i%>" disabled="disabled">
											</td>
											<td align="center" width="19%">
												<div><%=Util.formatCell("")%></div>
											</td>
											<td align="center" width="19%">
												<div><%=Util.formatCell("")%></div>
											</td>
											<td align="center" width="19%">
												<div><%=Util.formatCell("")%></div>
											</td>
											<td align="right" width="19%">
												<div><%=Util.formatCell("")%></div>
											</td>
											<td align="right" width="19%">
												<div><%=Util.formatCell("")%></div>
											</td>
										</tr>
			
<%									
									}
								}
%>
								</table>
							</div>  				
						</td>
					</tr>	
  				</table>
  			</td>
  		</tr>
  	</table>
  	
  	<table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0">
  		<tr>
  			<td width="50%">
  				<div id="CAR_TOTAL">
  					<table class="tableinfo" cellspacing=0 cellpadding=2 width="100%" border="0">
  						<tr>
  							<td align="center" width="62%"><div>&nbsp;</div></td>
  							<td align="right" width="19%"><input id="CAR_TOTAL_DT" align="right" size="16" value="<%=Util.formatCCY("0.00")%>" readonly="readonly"></td>
  							<td align="right" width="19%"><input id="CAR_TOTAL_CT" align="right" size="16" value="<%=Util.formatCCY("0.00")%>" readonly="readonly"></td>
  						</tr>
  					</table>
  				</div>
  			</td>
  			<td width="50%">
  				<div id="IBS_TOTAL">
  					<table class="tableinfo" cellspacing=0 cellpadding=2 width="100%" border="0">
  						<tr>
  							<td align="center" width="62%"><div>&nbsp;</div></td>
  							<td align="right" width="19%"><input id="IBS_TOTAL_DT" align="right" size="16" value="<%=Util.formatCCY("0.00")%>" readonly="readonly"></td>
  							<td align="right" width="19%"><input id="IBS_TOTAL_CT" align="right" size="16" value="<%=Util.formatCCY("0.00")%>" readonly="readonly"></td>
  						</tr>
  					</table>
  				</div>
  			</td>
  		</tr>	
  	</table>
  	
	<br>
	
  	<div align="center"> 
    	<input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="javascript:goAction()">	
    	<input id="EIBSBTN" type="button" name="button" value="Salir" onClick="javascript:location.href='<%=request.getContextPath()%>/pages/background.jsp'">   	   
  	</div>	  
  	<SCRIPT type="text/javascript">
  		/*
		function resizeDoc() {
     		adjustEquTables(headTable1, car, dataDiv1, 1, false);
     		adjustEquTables(headTable2, ibs, dataDiv2, 1, false);
      	}
	 	resizeDoc();   			
     	window.onresize=resizeDoc;
     	*/        
     </SCRIPT>
</form>
</body>
</html>