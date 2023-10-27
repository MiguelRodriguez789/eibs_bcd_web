<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EDL015801Message"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EDL0158code" class= "datapro.eibs.beans.EDL015802Message"  scope="session" />
<jsp:useBean id= "EDL0158Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script type="text/javascript">

function goAction(op) {
	document.forms[0].SCREEN.value = op;
	document.forms[0].submit();		
 }      

function closeHiddenDivNew(){
	setVisibility(getElement("hiddenDivNew"), "hidden");
}

function showHiddenDivNew(evt) {
	evt = (evt) ? evt : ((window.event) ? window.event : "");
 	
	var hiddenDivNew = getElement("hiddenDivNew");

	var y=evt.clientY + document.body.scrollTop;
	var x=evt.clientX + document.body.scrollLeft;
     
	cancelBub(evt);

	moveElement(hiddenDivNew, y, x);
	setVisibility(hiddenDivNew, "visible");
	 
}

addEventHandler(document, 'click', closeHiddenDivNew);

</script>
</HEAD>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<BODY>


<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0158">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
<INPUT TYPE=HIDDEN NAME="OPT" VALUE="3">
<INPUT TYPE=HIDDEN NAME="ROW" VALUE="0">

<h3 align="center"> Lista de Gastos Extraordinarios<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_list_extrachg.jsp,EDL0158"> 
</h3>
<hr size="4">
  
<%int row = 0; %>
          <table class="tableinfo">
            <tr > 
              <td nowrap> 
                <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
                  <tr id="trdark"> 
                    <td nowrap width="16%" > 
                      <div align="right"><b>Cliente :</b></div>
                    </td>
                    <td nowrap width="20%" > 
                      <div align="left"><b> 
                        <input type="text" readonly name="E02DEACUN" size="10" maxlength="9" value="<%= userPO.getCusNum().trim()%>" >
                        </b> </div>
                    </td>
                    <td nowrap width="16%" > 
                      <div align="right"><b>Nombre :</b> </div>
                    </td>
                    <td nowrap width="16%" > 
                      <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
                        <input type="text" name="E02DEANA1" size="50" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
                        </font></font></font></div>
                    </td>
                    <td nowrap width="16%" > 
                      <div align="right"><b></b> </div>
                    </td>
                    <td nowrap width="16%" > 
                      <div align="left"></div>
                    </td>
                  </tr>
                  <tr id="trdark"> 
                    <td nowrap width="16%"> 
                      <div align="right"><b>Cuenta :</b></div>
                    </td>
                    <td nowrap width="20%"> 
                      <div align="left"> 
                        <input type="text" name="E01DEAACC" size="13" maxlength="12" value="<%= userPO.getAccNum().trim()%>" readonly>
                      </div>
                    </td>
                    <td nowrap width="16%"> 
                      <div align="right"><b>Moneda : </b></div>
                    </td>
                    <td nowrap width="16%"> 
                      <div align="left"><b> 
                        <input type="text" name="E02DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                        </b> </div>
                    </td>
                    <td nowrap width="16%"> 
                      <div align="right"><b>Producto: </b></div>
                    </td>
                    <td nowrap width="16%"> 
                      <div align="left"><b> 
                        <input type="text" name="E02DEAPRO" size="4" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>">
                        </b> </div>
                    </td>
                  </tr>
                </table>
      </td>
    </tr>
  </table>

<br>
<h4> Datos Basico </h4>

          <table class="tableinfo">
            <tr > 
              <td nowrap> 
                <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
                  <tr id="trdark"> 
                    <td nowrap width="16%" > 
                      <div align="right"><b>Fecha de Pago :</b></div>
                    </td>
                    <td nowrap width="20%" > 
                      <div align="left"><b> 
                        <eibsinput:date name="EDL0158code" fn_year="E02DEAPDY" fn_month="E02DEAPDM" fn_day="E02DEAPDD" readonly="false"/>
                        </b> </div>
                    </td>
                    </tr>
                   <tr id="trdark">
                    <td nowrap width="16%" > 
                      <div align="right"><b>Estado :</b> </div>
                    </td>
                    <td nowrap width="16%" > 
                      <div align="left"> 
                        <input type="text" name="E02STATUS" size="30" maxlength="30" readonly value="<%= EDL0158code.getE02STATUS().trim()%>">
                        </div>
                    </td>
                    </tr>
                    <tr id="trdark">
                    <td nowrap width="16%" > 
                      <div align="right"><b>Dias Mora</b> </div>
                    </td>
                    <td nowrap width="16%" > 
                      <div align="left">
                        <input type="text" name="E02MORDYS" size="12" maxlength="10" readonly value="<%= EDL0158code.getE02MORDYS().trim()%>">
                      </div>
                    </td>
                  </tr>
                </table>
      </td>
    </tr>
  </table>
    <% if ( EDL0158Help.getNoResult() ) { %>
<br>
         <table class="tbenter" width="100%">
            <tr> 
              <td class=TDBKG> <a href="javascript:goAction(1)"><b>Crear</b></a></td>
              <td class=TDBKG> <a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></td>
            </tr>
          </table>
<br>
   	<TABLE class="tbenter" width=100% height=40%>
   	 <TR valign="middle">
      <TD> 
        <div align="center">       		
          <p><b>No hay resultados que correspondan a su criterio de búsqueda. 
            Haga Click en la opci&oacute;n de Nueva para adicionar un nuevo gasto 
            </b></p>
          </div>
      </TD>
     </TR>
   	</TABLE>
<% } else { %>  
<table class="tbenter" width=100% align=center>
    <tr> 
      <td class=TDBKG width="25%"> 
        <div align="center" style="cursor:hand" ><a href="javascript:goAction(1)"><b>Crear</b></a></div>
      </td>
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction(2)"><b>Modificar</b></a></div>
      </td>
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction(3)"><b>Borrar</b></a></div>
      </td>
     <td class=TDBKG width="25%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </td>
    </tr>
  </table>   
 <br> 
 <TABLE  id="mainTable" class="tableinfo" height="70%">
 <TR height="5%"> 
   <TD NOWRAP valign="top" width="95%">
    <TABLE id="headTable" width="100%">
    <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
      <TH ALIGN=CENTER nowrap width="10%">&nbsp;</TH>
      <TH ALIGN=CENTER nowrap width="10%">Secuencia</TH>
      <TH ALIGN=CENTER nowrap width="10%">Tipo</TH>
      <TH ALIGN=CENTER nowrap width="20%">Fecha Aplicación</TH>
      <TH ALIGN=CENTER nowrap width="30%">Concepto</TH>
      <TH ALIGN=CENTER nowrap width="15%">Monto</TH>
      <TH ALIGN=CENTER nowrap width="5%"></TH>
    </TR>
    </TABLE>
  
<tr  height="100%"> 
<td nowrap="nowrap">     
<div id="dataDiv1" style="height:400px; overflow:auto;">   
<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">
		<%
          	EDL0158Help.initRow();
          		boolean firstTime = true;
          		String chk = "";
          		while (EDL0158Help.getNextRow()) {
          			if (firstTime) {
          				firstTime = false;
          				chk = "checked";
          			} else {
          				chk = "";
          			}
          			EDL015801Message msgLN = (EDL015801Message) EDL0158Help.getRecord();
          %>

 			<tr id="dataTable<%=EDL0158Help.getCurrentRow()%>">
				<td nowrap align="center" width="10%"> <input type="radio" name="key" value="<%=EDL0158Help.getCurrentRow()%>" <%=chk%>
					class="highlight" onClick="highlightRow('dataTable', <%=EDL0158Help.getCurrentRow()%>)" /></td>
                <td ALIGN=CENTER NOWRAP width="10%"><%= msgLN.getE01DLSSEQ() %></TD>   
				<% if (msgLN.getE01DLSTYP().equals("1")){ %>
	                <td ALIGN=CENTER NOWRAP width="10%">IMPUESTO</TD>   
	            <% } else if (msgLN.getE01DLSTYP().equals("2")){ %>
	                <td ALIGN=CENTER NOWRAP width="10%">COMISION</TD>  
	            <% } else if (msgLN.getE01DLSTYP().equals("3")){ %>
	                <td ALIGN=CENTER NOWRAP width="10%">DEDUCCION</TD>  
	            <% } else if (msgLN.getE01DLSTYP().equals("4")){ %>
	                <td ALIGN=CENTER NOWRAP width="10%">IVA</TD>   
				<%} else { %>
	                <td ALIGN=CENTER NOWRAP width="10%">COBRANZA</TD>   
				<% } %>                         
                <td ALIGN=CENTER NOWRAP width="20%"><%= Util.formatCustomDate(currUser.getE01DTF(), msgLN.getE01DLSPDM(), msgLN.getE01DLSPDD(), msgLN.getE01DLSPDY()) %></TD>              
                <td align=left NOWRAP width="30%"><%= msgLN.getE01DLSNAR() %></TD>
                <td ALIGN=RIGHT NOWRAP width="15%"><%= msgLN.getE01DLSAMT() %></TD>
                <td ALIGN=RIGHT NOWRAP width="5%"></TD>
             </tr>
      <% }  %>
    </table>
    </div>
   </TD> 
  </TR>	
 </TABLE>
 
  <% } %>
 
  <SCRIPT type="text/javascript">  	
    showChecked("key");
	getElement("hiddenDivNew").onclick=cancelBub;
	getElement("eibsNew").onclick=showHiddenDivNew;
     
  </SCRIPT>
</FORM>

</BODY>
</HTML>
