<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%@page import="datapro.eibs.beans.DataSignRulHI"%>
<%@page import="datapro.eibs.beans.DataSignRule"%>
<%@ page import ="datapro.eibs.master.Util" %>
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@ page
	import="java.io.*,java.net.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*"%>


<HTML>
<HEAD>
<TITLE>
Approval List Account
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
 
<jsp:useBean id= "rulesListH" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

	function FormatNumberLength(num, length) {
    	var r = "" + num;
    	while (r.length < length) {
       	 r = "0" + r;
   		 }
    	return r;
	}
	
	function goAction(opt) {
		 //var dateFrom = document.forms[0].YYF.value + document.forms[0].MMF.value +document.forms[0].DDF.value;
		 //var dateTo = document.forms[0].YYT.value + document.forms[0].MMT.value +document.forms[0].DDT.value;
		 
		 var dateFrom = FormatNumberLength(document.forms[0].YYF.value, 4) + FormatNumberLength(document.forms[0].MMF.value, 2) 
		 				+ FormatNumberLength(document.forms[0].DDF.value, 2);
		 var dateTo = FormatNumberLength(document.forms[0].YYT.value, 4) + FormatNumberLength(document.forms[0].MMT.value, 2) 
		 				+ FormatNumberLength(document.forms[0].DDT.value, 2);
		 
		 if(dateFrom > dateTo){
		 	alert("Rango de fechas invalido.!");
		 	return;
		 }
		 
		 document.forms[0].dateF.value = dateFrom;
		 document.forms[0].dateT.value = dateTo;
		 document.forms[0].submit();
		 
	}
	
	function setInfo(idx) {
	   //document.forms[0].selRow.value = idx;
	}
    
</SCRIPT>

</HEAD>

<BODY>


 <h3 align="center">
  Historico Reglas de Firmas
 <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_sign_rules_list_his.jsp,EDD0000"> 
    </h3>
   <hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD5500" >

<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="10">
<INPUT TYPE=HIDDEN NAME="dateF" VALUE="0">
<INPUT TYPE=HIDDEN NAME="dateT" VALUE="0">  

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
                <input type="text" name="E02CUN" size="9" maxlength="9" readonly value="<%= userPO.getCusNum().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E02NA1" size="45" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E04CUN" size="12" maxlength="12" value="<%= userPO.getAccNum().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E02PRO" size="4" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
<%
	if ( rulesListH.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=60%>
   	<TR>
      <TD> 
        <div align="center">           
          <p>&nbsp;</p>
          <p><b>No existen reglas asociadas en Historico a esta cuenta.</b></p>
        </div>
      </TD>
     </TR>
     </TABLE>
   		
<%   		
	}
	else {
	
	boolean firstTime = true;
 	String chk = "";
%>

  <INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
  
  <table class="tbenter" width="100%">
  <tr>
  	<td width="30%" align="right">Fecha Desde: <input type="text" name="DDF" size="2" maxlength="2">
  		<input type="text" name="MMF" size="2" maxlength="2">
  		<input type="text" name="YYF" size="4" maxlength="4">
  		<a href="javascript:DatePicker(document.forms[0].DDF, 
                    				document.forms[0].MMF, 
                    				document.forms[0].YYF)">
                    <img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></a>
                  
  		</td>
  	<td width="30%" align="right">Fecha Hasta: <input type="text" name="DDT" size="2" maxlength="2">
  		<input type="text" name="MMT" size="2" maxlength="2">
  		<input type="text" name="YYT" size="4" maxlength="4">
  		<a href="javascript:DatePicker(document.forms[0].DDT, 
                    				document.forms[0].MMT, 
                    				document.forms[0].YYT)">
                    <img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></a>
 	   </td>
 	   <td class=TDBKG width="30%" align="left"><a href="javascript:goAction(1)"> Buscar</a></td>
 	   <td nowrap width="40%" ></td>
  	
   </tr>	
  </table> 
 <TABLE  id="mainTable" class="tableinfo">
 <TR> 
   <TD NOWRAP valign="top">
        <table id="headTable" style="width: 100%">
          <TR id="trdark"> 
            <TH ALIGN=CENTER nowrap>Sel</TH>
            <TH width="20%">Mantenimiento<br>Fecha/Usuario <br> Operaci&oacuten </TH>
      		<TH width="10%">Regla</TH>
      		<TH width="15%">Monto</TH>
      		<TH width="5%">Moneda</TH>
      		<TH ALIGN=CENTER nowrap>Valida Desde</TH>
      		<TH ALIGN=CENTER nowrap>Valida Hasta</TH>
      		<TH ALIGN=CENTER nowrap>Status</TH>
          </TR>
        </TABLE>
        
    <div id="dataDiv1" class="scbarcolor" style="padding:0" >
        <table id="dataTable" >
    <%
         rulesListH.initRow();
         int k=1;
         int cont = 0;
         while (rulesListH.getNextRow()) {
            if (firstTime) {
						firstTime = false;
						chk = "checked";
				  }
				  else {
							chk = "";
				  }
            DataSignRulHI dsr = (DataSignRulHI)rulesListH.getRecord();
            String dd =dsr.getRulelmd() == null ? "0" : dsr.getRulelmd();
            String mm = dsr.getRulelmm() == null ? "0" : dsr.getRulelmm();
            String yy = dsr.getRulelmy() == null ? "0" : dsr.getRulelmy();
           
            if (mm.length() < 2) {
       	 		mm = "0" + mm;
   		 	}
   		 	if (dd.length() < 2) {
       	 		dd = "0" + dd;
   		 	}
   		 	if (yy.length() < 4) {
       	 		dd = "000" + dd;
   		 	}
   		 
           String fecha = yy + mm + dd;
           int fechar = 0;
           int fechaf = 0;  
           int fechat = 0;
           try{
             fechar = Integer.parseInt(fecha);
             fechaf = Integer.parseInt(userPO.getHeader22());  
             fechat = Integer.parseInt(userPO.getHeader23());
           }catch(NumberFormatException e){
           	 fechar = 0;
             fechaf = 0;  
             fechat = 0;
           }           
           
           if((fechar >= fechaf && 
           		fechar <= fechat)
           		|| (fechaf == 0 && fechat == 0)){
     %> 
            <TR id="dataTable<%=rulesListH.getCurrentRow()%>"> 
              <TD ALIGN=CENTER NOWRAP> 
                <INPUT TYPE="radio" NAME="ROW" VALUE="<%= rulesListH.getCurrentRow() %>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= rulesListH.getCurrentRow() %>)">
              </TD>
              <TD width="20%"><%= dsr.getRulelmd() + "/" + dsr.getRulelmm() + "/" + dsr.getRulelmy() + " - " +dsr.getRulelmt() %>
              						<br> <%=dsr.getRulelmu() %>
              						<br> <b> <% if (dsr.getTypeMaint().equals("I")) out.print("Creaci&oacuten");
              								 else if (dsr.getTypeMaint().equals("U")) out.print("Modificaci&oacuten");
              								 else if (dsr.getTypeMaint().equals("D")) out.print("Eliminaci&oacuten"); 
              								  %></b>
              								  </TD>
              <TD width="10%"><%= Util.formatCell(dsr.getSigRule()) %></TD>
              <TD width="15%"><% if (dsr.getAmount().equals("0.00") || dsr.getAmount().equals("0")) out.print("Sin Limite"); else out.print(Util.formatCCY(dsr.getAmount())); %></TD>
              <TD width="5%"><%= dsr.getCCYCode() %></TD>
              <TD ALIGN=CENTER NOWRAP><%= dsr.getDayFrom() + "/" + dsr.getMonthFrom() + "/" + dsr.getYearFrom() %></TD>
              <TD ALIGN=CENTER NOWRAP><%= dsr.getDayTo() + "/" + dsr.getMonthTo() + "/" + dsr.getYearTo() %></TD>
              <TD ALIGN=CENTER NOWRAP><% if (dsr.getStatus().equals("0")) out.print("Inactiva"); else out.print("Activa"); %></TD>
            </TR>
      <%
              k++;
              cont++;
              }
           
         } 
         
              userPO.setHeader22("0");
              userPO.setHeader23("0");
      %> 
          </table>
          <%          
              if(cont == 0){
               %> 
               	<TABLE class="tbenter" width=100% height=60%>
  		 			<TR>
      					<TD> 
        					<div align="center">           
          					<p>&nbsp;</p>
          					<p><b>No existen reglas asociadas en Historico para la fecha seleccionada.</b></p>
        					</div>
      					</TD>
     				</TR>
     			</TABLE>
   		<%} %>
       
   </div>
   </TD>
  </TR>	
</TABLE>
      
<SCRIPT type="text/javascript">
  document.forms[0].totalRow.value="<%= k %>";
  function resizeDoc() {
       divResize();
            	adjustEquTables(getElement('headTable'),getElement('dataTable'), getElement('dataDiv1'),1,false);
  }
  showChecked("ROW");
  resizeDoc();
  window.onresize=resizeDoc;
  
 <%                
 String error = request.getParameter("ERROR");
   if ( error != null ) {    
   out.println("alert(\" Error de actualizacion. Por favor contacte con el Administardor de sistema\")");      
 	}
 %>
     
</SCRIPT>


  <%
   
  }
%> 

</FORM>
</BODY>
</HTML>
