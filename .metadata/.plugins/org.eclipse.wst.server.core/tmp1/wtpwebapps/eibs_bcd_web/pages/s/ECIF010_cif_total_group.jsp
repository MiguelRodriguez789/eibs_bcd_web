<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"> 
<html>
<head>
<title>Resumen de Operaciones por Cliente</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id="cifTotal" class="datapro.eibs.beans.ECIF01003Message" scope="session" />
<jsp:useBean id="cifTotalG" class="datapro.eibs.beans.ECIF01003Message" scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "EWD0300Portf" class= "datapro.eibs.beans.JBObjList"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

	function showAccGrp(app, flg) {
		var page = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF010?SCREEN=19&appCode=" + app + "&flag=" + flg;
		CenterWindow(page, 600, 500, 2);
	}

	function showGraph() {
		var pg= "<%=request.getContextPath()%>/pages/s/ECIF010_cif_total_graph_grp.jsp";
		CenterNamedWindow(pg, 'graph', 700, 560, 2);
	}

	function showListGroup(grpnum) {
		var page = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF010?SCREEN=666&grpNum=" + grpnum;
		CenterWindow(page, 600, 500, 2);
	}

	builtNewMenu(ecif10_i_opt);
	initMenu();

</SCRIPT>


</head>

<body>

<%@ page import = "datapro.eibs.master.Util" %>

 <% 
 	if ( !error.getERRNUM().equals("0")  ) {
    	out.println("<SCRIPT Language=\"Javascript\">");
     	error.setERRNUM("0");
     	out.println("       showErrors()");
     	out.println("</SCRIPT>");
 	}
%>

<h3 align="center">Resumen de Operaciones por Cliente y Grupo
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cif_total_group.jsp, ECIF010"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECIF010">
	<INPUT TYPE=HIDDEN NAME="SCREEN" value="6">
	
	<h4>Informaci&oacute;n del Cliente</h4>
 	<table class="tableinfo">
    	<tr bordercolor="#FFFFFF"> 
      		<td nowrap>
        		<table cellspacing=0 cellpadding=2 width="100%" border="0">
			          <tr id="trclear"> 
			            <td nowrap width="20%" > 
			              <div align="right">Tipo de Cliente :</div>
			            </td>
			            <td nowrap width="30%" > 
			              <input type="text" readonly name="E03CLITYP"  size="12" maxlength="10" value="<%= cifTotal.getE03CLITYP().trim()%>">
			            </td>
			            <td nowrap width="20%" > 
			              <div align="right"> </div>
			            </td>
			            <td nowrap width="30%" > 
			             </td>
			          </tr>
			          <tr id="trdark"> 
			            <td nowrap width="20%" > 
			              <div align="right">Cliente :</div>
			            </td>
			            <td nowrap width="30%" > 
			              <input type="text" readonly name="E03CUSCUN"  size="11" maxlength="9" value="<%= cifTotal.getE03CUSCUN().trim()%>">
			            </td>
			            <td nowrap width="20%" > 
			              <div align="right">Nombre :</div>
			            </td>
			            <td nowrap width="30%" > 
			              <input type="text" readonly name="E03CUSNA1"  size="50" maxlength="45" value="<%= cifTotal.getE03CUSNA1().trim()%>">
			            </td>
			          </tr>
			          <tr id="trclear"> 
			            <td nowrap width="20%"> 
			              <div align="right">Tel&eacute;fono Residencia :</div>
			            </td>
			            <td nowrap width="30%"> 
			              <input type="text" readonly name="E03CUSHPN" size="13" maxlength="11" value="<%= cifTotal.getE03CUSHPN().trim()%>">
			            </td>
			            <td nowrap width="20%"> 
			              <div align="right">Tel&eacute;fono Trabajo :</div>
			            </td>
			            <td nowrap width="30%"> 
			              <input type="text" readonly name="E03CUSPHN" size="13" maxlength="11" value="<%= cifTotal.getE03CUSPHN().trim()%>">
			            </td>
			          </tr>
			          <tr id="trdark"> 
			            <td nowrap width="20%"> 
			              <div align="right">Teléfono Celular :</div>
			            </td>
			            <td nowrap width="30%"> 
			              <input type="text" readonly name="E03CUSPH1" size="13" maxlength="11" value="<%= cifTotal.getE03CUSPH1().trim()%>">
			            </td>
			            <td nowrap width="20%"> 
			              <div align="right">Facsimil :</div>
			            </td>
			            <td nowrap width="30%"> 
			              <input type="text" readonly name="E03CUSFAX" size="13" maxlength="11" value="<%= cifTotal.getE03CUSFAX().trim()%>">
			            </td>
			          </tr>
          			  <tr id="trclear">
			            <td nowrap width="20%"> 
			              <div align="right">Correo Electronico :</div>
			            </td>
			            <td nowrap width="30%"><a href="mailto:<%= cifTotal.getE03CUSIAD().trim()%>" target="body"><%= cifTotal.getE03CUSIAD().trim()%></a> 
			            </td>
          			  <% if (cifTotal.getE03CLITYP().trim().equals("MASTER")) { %>
			            <td nowrap width="20%" > 
			              <div align="right">Miembros del Grupo :</div>
			            </td>
			            <td nowrap width="30%" > 
			            <%if(!cifTotal.getE03GRPNME().substring(0,4).equals("0000")){%>
			            <div align="left"><a href="javascript:showListGroup('<%= cifTotal.getE03CUSCUN().trim()%>')"><%= cifTotalG.getE03GRPNME().substring(1,4)%></a></div>
			 			<%}else{%> 
			              <input type="text" readonly name="E03GRPNME" size="5" maxlength="6" value="<%= cifTotal.getE03GRPNME().substring(0,4)%>">
			 			<%} %>
			             </td>
          			  <% } else { %>
			            <td nowrap width="20%">
			            </td>
			            <td nowrap width="30%"> 
			            </td>
          			  </tr>
			          <tr id="trdark"> 
			            <td nowrap width="20%" > 
			              <div align="right">Grupo :</div>
			            </td>
			            <td nowrap width="30%" > 
			              <input type="text" readonly name="E03CUSGRP"  size="11" maxlength="9" value="<%= cifTotal.getE03CUSGRP().trim()%>">
			            </td>
			            <td nowrap width="20%">
			              <div align="right">Nombre de Grupo :</div>
			            </td>
			            <td nowrap width="30%"> 
			              <input type="text" readonly name="E03GRPNME" size="50" maxlength="45" value="<%= cifTotal.getE03GRPNME().trim()%>">
			            </td>
			          </tr>          
          			  <%} %>   
        		</table>
      		</td>
      	</tr>
      </table>		

  <table class=tbenter>
   <tr > 
      <td nowrap align=right> 
	     <b>TOTALES EN MONEDA :</b>
      </td>
      <td nowrap> 
   		<b><font color="#ff6600"><%= currUser.getE01BCU().trim()%></font></b>
      </td>
      <td nowrap align=right> 
   		<b>CLIENTE :</b>
      </td>
      <td nowrap> 
   		<b><font color="#ff6600"><%= cifTotal.getE03CLILGT().trim()%></font></b>
      </td>
      <td nowrap align=right> 
   		<b>TIPO :</b>
      </td>
      <td nowrap> 
   		<b><font color="#ff6600"><%= cifTotal.getE03CLITYP().trim()%></font></b>
      </td>
      <td nowrap align=right> 
   		<b>ESTADO :</b>
      </td>
      <td nowrap> 
   		<b><font color="#ff6600"><%= cifTotal.getE03CLISTS().trim()%></font></b>
      </td>
    </tr>
  </table>
  
	
   <%
     boolean hasPortfolios =false;
     datapro.eibs.beans.EWD0300DSMessage PortfList = new datapro.eibs.beans.EWD0300DSMessage();
     EWD0300Portf.initRow();
     while (EWD0300Portf.getNextRow()) {
    	PortfList = (datapro.eibs.beans.EWD0300DSMessage) EWD0300Portf.getRecord();
       	if(!PortfList.getSWDNUM().trim().equals(cifTotal.getE03CUSCUN().trim())){
       	   hasPortfolios=true;
       	   break;
       	}
     }
     int numprfs =0;
     if(hasPortfolios){
       String CusLink = "<a href=\"" + request.getContextPath() + "/servlet/datapro.eibs.client.JSECIF010?SCREEN=16&opt=1&CUSTOMER=" + cifTotal.getE03CUSCUN() +  "\">"; 
    %>  
	  <h4>Portafolios</h4>
	    <h4>Totales están compuestos por las siguientes Cuentas de Portafolios <%= cifTotal.getH03FLGWK3().trim().equals("Y")?" + " + CusLink+"Accounts Linked to customer"+"</a>":"" %></h4>
	    <table id="dataTable" class="tableinfo">
	      <tr id="trdark" align="center">
	        <td>Número Portafolio</td>
	        <td>Nombre Portafolio</td>
	        <td>Fecha Apertura</td>
	      </tr>
	  <%
	     EWD0300Portf.initRow();
 	    while (EWD0300Portf.getNextRow()) {
	   		PortfList = (datapro.eibs.beans.EWD0300DSMessage) EWD0300Portf.getRecord();
	       	if(!PortfList.getSWDNUM().trim().equals(cifTotal.getE03CUSCUN().trim())){
	       	  String Prflink = "<A HREF=\"" + request.getContextPath() + "/servlet/datapro.eibs.client.JSECIF010?SCREEN=4&opt=1&CUSTOMER=" + PortfList.getSWDNUM().trim() +  "\">"; 
	       	  numprfs++;
 		%>
 		   	<tr id="trclear" align="center">
 		   	 <td><%= Prflink + PortfList.getSWDNUM() + "</a>" %> </td>
 		   	 <td><%= Prflink + PortfList.getSWDDSC() + "</a>" %> </td>
 		   	 <td><%= Prflink +  PortfList.getSWDOP1() + "/" + PortfList.getSWDOP2() + "/" + PortfList.getSWDOP3() + "</a>" %> </td>
 		   	</tr>	
 	  <%    }
 	     } 	     
		%>  
	    </table>
	  <% if(numprfs>1){ %>
        <P class="page">
          <div style="page-break-before:always;height:0;line-height:0;">
       </div>	    
   <%    }
      } %>
      
  <h4>Operaciones en Libro</h4>      
	
  <table  id="tbhelp">
    <tr> 
      <td width="12%" nowrap>Ver Gr&aacute;fica</td>
      <td width="88%"><a href="javascript:showGraph()"><img src="<%=request.getContextPath()%>/images/graphic.gif" border="0" width="32" height="32"></a></td>
    </tr>
  </table>
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap height="36"> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
             <td nowrap height="31" bordercolor="#000000" colspan=3> 
              <div align="center"><b>A Favor del Banco</b></div>
            </td>
            <td nowrap height="31" bordercolor="#000000" colspan=3> 
              <div align="center"><b>A Favor del Cliente</b></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap height="31" bordercolor="#000000" > 
              <div align="center"><b> </b></div>
            </td>
            <td nowrap height="31" bordercolor="#000000" > 
              <div align="center"><b> Individual </b></div>
            </td>
            <td nowrap height="31" bordercolor="#000000"  > 
              <div align="center"><b> Grupo </b></div>
            </td>
            <td nowrap height="31" bordercolor="#000000" > 
              <div align="center"><b> </b></div>
            </td>
            <td nowrap height="31" bordercolor="#000000" > 
              <div align="center"><b> Individual </b></div>
            </td>
            <td nowrap height="31" bordercolor="#000000"  > 
              <div align="center"><b> Grupo </b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" bordercolor="#000000" height="31"> 
              <div align="right"><a href="javascript:showAcc('OV','')">Cuentas 
                Sobregiradas : </a> </div>
            </td>
            <td nowrap width="15%" bordercolor="#000000" height="31"> 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03OVDRFT" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03OVDRFT())%>" onDblClick="showAcc('OV','')">
              </div>
            </td>
            <td nowrap width="15%" bordercolor="#000000" height="31"> 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="G03OVDRFT" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotalG.getE03OVDRFT())%>" onDblClick="showAccGrp('OV','')">
              </div>
            </td>
            <td nowrap width="20%" bordercolor="#000000" height="31"> 
              <div align="right"><a href="javascript:showAcc('01','')">Cuentas 
                sin Interes :</a> </div>
            </td>
            <td nowrap width="15%" height="31" bordercolor="#000000" > 
              <div align="center">
                <input type="text" id="txtright" readonly name="E03CTACTE" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03CTACTE())%>" onDblClick="showAcc('01','')">
              </div>
            </td>
            <td nowrap width="15%" height="31" bordercolor="#000000" > 
              <div align="center">
                <input type="text" id="txtright" readonly name="G03CTACTE" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotalG.getE03CTACTE())%>" onDblClick="showAccGrp('01','')">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('10','H')">Prestamos 
                Hipotecarios :</a> </div>
            </td>
            <td nowrap width="15%" bordercolor="#000000"> 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03LNSMOR" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03LNSMOR())%>" onDblClick="showAcc('10','H')">
              </div>
            </td>
            <td nowrap width="15%" bordercolor="#000000"> 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="G03LNSMOR" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotalG.getE03LNSMOR())%>" onDblClick="showAccGrp('10','H')">
              </div>
            </td>
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('MK','')">Cuentas 
                con Interes:</a> </div>
            </td>
            <td nowrap width="15%" height="22" bordercolor="#000000" > 
              <div align="center">
                <input type="text" id="txtright" readonly name="E03CTAMMK" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03CTAMMK())%>" onDblClick="showAcc('MK','')">
              </div>
            </td>
            <td nowrap width="15%" height="22" bordercolor="#000000" > 
              <div align="center">
                <input type="text" id="txtright" readonly name="G03CTAMMK" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotalG.getE03CTAMMK())%>" onDblClick="showAccGrp('MK','')">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" bordercolor="#000000" height="35"> 
              <div align="right"><a href="javascript:showAcc('10','A')">Arrendamiento 
                Financiero :</a> </div>
            </td>
            <td nowrap width="15%" bordercolor="#000000" height="35"> 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03LNSLSG" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03LNSLSG())%>" onDblClick="showAcc('10','A')">
              </div>
            </td>
            <td nowrap width="15%" bordercolor="#000000" height="35"> 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="G03LNSLSG" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotalG.getE03LNSLSG())%>" onDblClick="showAccGrp('10','A')">
              </div>
            </td>
            <td nowrap width="20%" bordercolor="#000000" height="35"> 
              <div align="right"><a href="javascript:showAcc('04','')">Cuentas 
                de Ahorro :</a> </div>
            </td>
            <td nowrap width="15%" height="35" bordercolor="#000000" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03CTAAHO" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03CTAAHO())%>" onDblClick="showAcc('04','')">
              </div>
            </td>
            <td nowrap width="15%" height="35" bordercolor="#000000" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="G03CTAAHO" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotalG.getE03CTAAHO())%>" onDblClick="showAccGrp('04','')">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('10','C')">Cr&eacute;dito 
                de Consumo :</a></div>
            </td>
            <td nowrap width="15%" bordercolor="#000000"> 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03LNSCON" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03LNSCON())%>" onDblClick="showAcc('10','C')">
              </div>
            </td>
            <td nowrap width="15%" bordercolor="#000000"> 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="G03LNSCON" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotalG.getE03LNSCON())%>" onDblClick="showAccGrp('10','C')">
              </div>
            </td>
            <td nowrap width="20%" bordercolor="#000000"> 
            </td>
            <td nowrap width="15%" height="22" bordercolor="#000000" > 
             </td>
            <td nowrap width="15%" height="22" bordercolor="#000000" > 
             </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('10','X')">Pr&eacute;stamos <%if(cifTotal.getE03CLITYP().trim().equals("MASTER")||cifTotal.getE03CLITYP().trim().equals("GRUPO")){%> Corporativos <%}%>
                :</a></div>
            </td>
            <td nowrap width="15%" bordercolor="#000000"> 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03LNSGRL" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03LNSGRL())%>" onDblClick="showAcc('10','X')">
              </div>
            </td>
            <td nowrap width="15%" bordercolor="#000000"> 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="G03LNSGRL" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotalG.getE03LNSGRL())%>" onDblClick="showAccGrp('10','X')">
              </div>
            </td>
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('CD','')">Certificados 
                :</a> </div>
            </td>
            <td nowrap width="15%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03CDTDPO" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03CDTDPO())%>" onDblClick="showAcc('CD','')">
              </div>
            </td>
            <td nowrap width="15%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="G03CDTDPO" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotalG.getE03CDTDPO())%>" onDblClick="showAccGrp('CD','')">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('94','T')">Tarjetas de Cr&eacute;dito :</a></div>
            </td>
            <td nowrap width="15%" bordercolor="#000000"> 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03TARCRE" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03TARCRE())%>" onDblClick="showAcc('94','T')">
              </div>
            </td>
            <td nowrap width="15%" bordercolor="#000000"> 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="G03TARCRE" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotalG.getE03TARCRE())%>" onDblClick="showAccGrp('94','T')">
              </div>
            </td>
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('13','L')">Inversiones 
                :</a></div>
            </td>
            <td nowrap width="15%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03INVERP" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03INVERP())%>" onDblClick="showAcc('13','L')">
              </div>
            </td>
            <td nowrap width="15%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="G03INVERP" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotalG.getE03INVERP())%>" onDblClick="showAccGrp('13','L')">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('10','G')">Facturas 
                Descontadas :</a></div>
            </td>
            <td nowrap width="15%" bordercolor="#000000"> 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03DESDOC" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03DESDOC())%>" onDblClick="showAcc('10','G')">
              </div>
            </td>
            <td nowrap width="15%" bordercolor="#000000"> 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="G03DESDOC" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotalG.getE03DESDOC())%>" onDblClick="showAccGrp('10','G')">
              </div>
            </td>
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('10','P')">Participaciones 
                :</a> </div>
            </td>
            <td nowrap width="15%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03PARTIC" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03PARTIC())%>" onDblClick="showAcc('10','P')">
              </div>
            </td>
            <td nowrap width="15%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="G03PARTIC" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotalG.getE03PARTIC())%>" onDblClick="showAccGrp('10','P')">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('13','A')">Inversiones 
                :</a> </div>
            </td>
            <td nowrap width="15%" bordercolor="#000000"> 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03INVERA" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03INVERA())%>" onDblClick="showAcc('13','A')">
              </div>
            </td>
            <td nowrap width="15%" bordercolor="#000000"> 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="G03INVERA" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotalG.getE03INVERA())%>" onDblClick="showAccGrp('13','A')">
              </div>
            </td>
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('14','L')">Aceptaciones 
                :</a> </div>
            </td>
            <td nowrap width="15%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03ACEPTP" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03ACEPTP())%>"  onDblClick="showAcc('14','L')">
              </div>
            </td>
            <td nowrap width="15%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="G03ACEPTP" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotalG.getE03ACEPTP())%>"  onDblClick="showAccGrp('14','L')">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('14','A')">Aceptaciones 
                :</a></div>
            </td>
            <td nowrap width="15%" bordercolor="#000000"> 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03ACEPTA" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03ACEPTA())%>" onDblClick="showAcc('14','A')">
              </div>
            </td>
            <td nowrap width="15%" bordercolor="#000000"> 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="G03ACEPTA" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotalG.getE03ACEPTA())%>" onDblClick="showAccGrp('14','A')">
              </div>
            </td>
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right"><%-- <a href="javascript:showAcc('LC','P')">C. de 
                C. en Proceso :</a>  --%></div>
            </td>
            <td nowrap width="15%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <%-- <input type="text" id="txtright" readonly name="E03LCPROC" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03LCPROC())%>"  onDblClick="showAcc('LC','P')">
                --%>
              </div>
            </td>
            <td nowrap width="15%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <%-- <input type="text" id="txtright" readonly name="G03LCPROC" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotalG.getE03LCPROC())%>"  onDblClick="showAccGrp('LC','P')">
                --%>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right"><%-- <a href="javascript:showAcc('LC','C')">C. de 
                C. Confirmadas :</a>  --%></div>
            </td>
            <td nowrap width="15%" bordercolor="#000000"> 
              <div align="center"> 
                <%-- <input type="text" id="txtright" readonly name="E03LCCONF" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03LCCONF())%>" onDblClick="showAcc('LC','C')">
                --%>
              </div>
            </td>
            <td nowrap width="15%" bordercolor="#000000"> 
              <div align="center"> 
                <%-- <input type="text" id="txtright" readonly name="G03LCCONF" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotalG.getE03LCCONF())%>" onDblClick="showAccGrp('LC','C')">
                --%>
              </div>
            </td>
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('31','')">Spot Vendidos 
                :</a></div>
            </td>
            <td nowrap width="15%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03SPTSAL" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03SPTSAL())%>" onDblClick="showAcc('31','')">
              </div>
            </td>
            <td nowrap width="15%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="G03SPTSAL" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotalG.getE03SPTSAL())%>" onDblClick="showAccGrp('31','')">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('30','')">Spot Comprados 
                :</a> </div>
            </td>
            <td nowrap width="15%" bordercolor="#000000"> 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03SPTPUR" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03SPTPUR())%>" onDblClick="showAcc('30','')">
              </div>
            </td>
            <td nowrap width="15%" bordercolor="#000000"> 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="G03SPTPUR" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotalG.getE03SPTPUR())%>" onDblClick="showAccGrp('30','')">
              </div>
            </td>
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('33','')">Forward 
                Vendidos :</a> </div>
            </td>
            <td nowrap width="15%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03FRWSAL" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03FRWSAL())%>"  onDblClick="showAcc('33','')">
              </div>
            </td>
            <td nowrap width="15%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="G03FRWSAL" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotalG.getE03FRWSAL())%>"  onDblClick="showAccGrp('33','')">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('32','')">Forward 
                Comprados :</a></div>
            </td>
            <td nowrap width="15%" bordercolor="#000000"> 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03FRWPUR" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03FRWPUR())%>" onDblClick="showAcc('32','')">
              </div>
            </td>
            <td nowrap width="15%" bordercolor="#000000"> 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="G03FRWPUR" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotalG.getE03FRWPUR())%>" onDblClick="showAccGrp('32','')">
              </div>
            </td>
            <td nowrap width="20%" bordercolor="#000000">&nbsp;</td>
            <td nowrap width="15%" bordercolor="#000000">&nbsp;</td>
            <td nowrap width="15%" height="22" bordercolor="#000000" > 
              <div align="center"></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" bordercolor="#000000">&nbsp;</td>
            <td nowrap width="15%" bordercolor="#000000"> 
              <div align="center"></div>
            </td>
            <td nowrap width="20%" bordercolor="#000000">&nbsp;</td>
            <td nowrap width="15%" height="22" bordercolor="#000000" > 
              <div align="center"></div>
            </td>
            <td nowrap width="28%" bordercolor="#000000">&nbsp;</td>
            <td nowrap width="28%" bordercolor="#000000">&nbsp;</td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right"><b>Total Activo :</b></div>
            </td>
            <td nowrap width="15%" bordercolor="#000000"> 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03TOTASS" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03TOTASS())%>">
              </div>
            </td>
            <td nowrap width="15%" bordercolor="#000000"> 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="G03TOTASS" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotalG.getE03TOTASS())%>">
              </div>
            </td>
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right"><b>Total Pasivo :</b></div>
            </td>
            <td nowrap width="15%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03TOTLIA" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03TOTLIA())%>">
              </div>
            </td>
            <td nowrap width="15%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="G03TOTLIA" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotalG.getE03TOTLIA())%>">
              </div>
            </td>
          </tr>
        </table>
        
      </td>
    </tr>
  </table>
  
  <h4>L&iacute;neas de Crédito</h4>
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap height="36"> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="21%" height="31" bordercolor="#000000"> 
        		<div align="center"> </div>
      		</td>
            <td nowrap width="21%" height="31"  > 
        		<div align="center">Monto Aprobado</div>
      		</td>
      <td width="23%"> 
        <div align="center">Monto Utilizado</div>
      </td>
      <td width="20%"> 
              <div align="center">Monto Disponible</div>
      </td>
      <td width="20%"> 
              <div align="center">Participaciones</div>
      </td>
      <td width="20%"> 
        <div align="center">Solicitudes de Hoy</div>
      </td>
    </tr>
    <tr>
            <td nowrap width="21%" height="31"  > 
        		<div align="right"> Individual :</div>
      		</td>
      <td width="17%"> 
        <div align="center">
          <input type="text" id="txtright" readonly name="E03LNEAMT"  size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03LNEAMT())%>" >
        </div>
      </td>
      <td width="23%"> 
        <div align="center">
          <input type="text" id="txtright" readonly name="E03LNEUSE"  size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03LNEUSE())%>">
        </div>
      </td>
      <td width="20%"> 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03LNEAVA"  size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03LNEAVA())%>">
              </div>
      </td>
      <td width="20%"> 
              <div align="center">
                <input type="text" id="txtright" readonly name="E03PARVEN"  size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03PARVEN())%>">
              </div>
      </td>
      <td width="20%"> 
        <div align="center">
          <input type="text" id="txtright" readonly name="E03LNETDY"  size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03LNETDY())%>">
        </div>
      </td>
    </tr>
    <tr>
            <td nowrap width="21%" height="31"  > 
        		<div align="right"> Grupo :</div>
      		</td>
      <td width="17%"> 
        <div align="center">
          <input type="text" id="txtright" readonly name="G03LNEAMT"  size="17" maxlength="15" value="<%= Util.formatCCY(cifTotalG.getE03LNEAMT())%>" >
        </div>
      </td>
      <td width="23%"> 
        <div align="center">
          <input type="text" id="txtright" readonly name="G03LNEUSE"  size="17" maxlength="15" value="<%= Util.formatCCY(cifTotalG.getE03LNEUSE())%>">
        </div>
      </td>
      <td width="20%"> 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="G03LNEAVA"  size="17" maxlength="15" value="<%= Util.formatCCY(cifTotalG.getE03LNEAVA())%>">
              </div>
      </td>
      <td width="20%"> 
              <div align="center">
                <input type="text" id="txtright" readonly name="G03PARVEN"  size="17" maxlength="15" value="<%= Util.formatCCY(cifTotalG.getE03PARVEN())%>">
              </div>
      </td>
      <td width="20%"> 
        <div align="center">
          <input type="text" id="txtright" readonly name="G03LNETDY"  size="17" maxlength="15" value="<%= Util.formatCCY(cifTotalG.getE03LNETDY())%>">
        </div>
      </td>
    </tr>
  </table>
        
      </td>
    </tr>
  </table>
  
  <h4>Operaciones Contingentes</h4>
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap height="36"> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap height="31" bordercolor="#000000" colspan=3> 
              <div align="center"><b>A Favor del Banco</b></div>
            </td>
            <td nowrap height="31" bordercolor="#000000" colspan=3> 
              <div align="center"><b>A Favor del Cliente</b></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap height="31" bordercolor="#000000" > 
              <div align="center"><b> </b></div>
            </td>
            <td nowrap height="31" bordercolor="#000000" > 
              <div align="center"><b> Individual </b></div>
            </td>
            <td nowrap height="31" bordercolor="#000000"  > 
              <div align="center"><b> Grupo </b></div>
            </td>
            <td nowrap height="31" bordercolor="#000000" > 
              <div align="center"><b> </b></div>
            </td>
            <td nowrap height="31" bordercolor="#000000" > 
              <div align="center"><b> Individual </b></div>
            </td>
            <td nowrap height="31" bordercolor="#000000"  > 
              <div align="center"><b> Grupo </b></div>
            </td>
          </tr>
          
          <tr id="trclear"> 
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right"></div>
            </td>
            <td nowrap width="15%" bordercolor="#000000"> 
              <div align="center"></div>
            </td>
            <td nowrap width="15%" bordercolor="#000000"> 
              <div align="center"></div>
            </td>
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('LC','B')">Garant&iacute;a en Efectivo : </a></div>
            </td>
            <td nowrap width="15%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03GAREFE" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03GAREFE())%>" onDblClick="showAcc('LC','B')">
              </div>
            </td>
            <td nowrap width="15%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="G03GAREFE" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotalG.getE03GAREFE())%>" onDblClick="showAccGrp('LC','B')">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right"></div>
            </td>
            <td nowrap width="15%" bordercolor="#000000"> 
              <div align="center"> </div>
            </td>
            <td nowrap width="15%" bordercolor="#000000"> 
              <div align="center"> </div>
            </td>
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('50','I')">Cobranzas Internacionales : </a></div>
            </td>
            <td nowrap width="15%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03CBZINT" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03CBZINT())%>" onDblClick="showAcc('50','I')">
              </div>
            </td>
            <td nowrap width="15%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="G03CBZINT" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotalG.getE03CBZINT())%>" onDblClick="showAccGrp('50','I')">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('41','')">Aceptaciones Descontadas : </a></div>
            </td>
            <td nowrap width="15%" bordercolor="#000000"> 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03ACPDES" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03ACPDES())%>" onDblClick="showAcc('41','')">
              </div>
            </td>
            <td nowrap width="15%" bordercolor="#000000"> 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="G03ACPDES" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotalG.getE03ACPDES())%>" onDblClick="showAccGrp('41','')">
              </div>
            </td>
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('51','')">Cobranzas Locales : </a></div>
            </td>
            <td nowrap width="15%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03CBZLOC" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03CBZLOC())%>" onDblClick="showAcc('51',' ')">
              </div>
            </td>
            <td nowrap width="15%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="G03CBZLOC" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotalG.getE03CBZLOC())%>" onDblClick="showAccGrp('51',' ')">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('LC','N')">C. de C. No Confirmadas : </a></div>
            </td>
            <td nowrap width="15%" bordercolor="#000000"> 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03LCNCON" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03LCNCON())%>" onDblClick="showAcc('LC','N')">
              </div>
            </td>
            <td nowrap width="15%" bordercolor="#000000"> 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="G03LCNCON" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotalG.getE03LCNCON())%>" onDblClick="showAccGrp('LC','N')">
              </div>
            </td>
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('91','')">Garant&iacute;as en Custodio : </a></div>
            </td>
            <td nowrap width="15%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03COLATE" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03COLATE())%>" onDblClick="showAcc('91','')">
              </div>
            </td>
            <td nowrap width="15%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="G03COLATE" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotalG.getE03COLATE())%>" onDblClick="showAccGrp('91','')">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('50','R')">Cobranzas Recibidas : </a></div>
            </td>
            <td nowrap width="15%" bordercolor="#000000"> 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03COLREC" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03COLREC())%>" onDblClick="showAcc('50','R')">
              </div>
            </td>
            <td nowrap width="15%" bordercolor="#000000"> 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="G03COLREC" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotalG.getE03COLREC())%>" onDblClick="showAccGrp('50','R')">
              </div>
            </td>
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('CD','P')">Certificados Pignorados : </a></div>
            </td>
            <td nowrap width="15%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03CDTPIG" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03CDTPIG())%>" onDblClick="showAcc('CD','P')">
              </div>
            </td>
            <td nowrap width="15%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="G03CDTPIG" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotalG.getE03CDTPIG())%>" onDblClick="showAccGrp('CD','P')">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right"></div>
            </td>
            <td nowrap width="15%" bordercolor="#000000"> 
              <div align="center"></div>
            </td>
            <td nowrap width="15%" bordercolor="#000000"> 
              <div align="center"></div>
            </td>
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('LC','1')">C. de C. Comerciales : </a></div>
            </td>
            <td nowrap width="15%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03AVAAM1" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03AVAAM1())%>" onDblClick="showAcc('LC','1')">
              </div>
            </td>
            <td nowrap width="15%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="G03AVAAM1" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotalG.getE03AVAAM1())%>" onDblClick="showAccGrp('LC','1')">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right"></div>
            </td>
            <td nowrap width="15%" bordercolor="#000000"> 
              <div align="center"></div>
            </td>
            <td nowrap width="15%" bordercolor="#000000"> 
              <div align="center"></div>
            </td>
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('LC','2')">C. de C. Standby : </a></div>
            </td>
            <td nowrap width="15%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03AVAAM2" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03AVAAM2())%>" onDblClick="showAcc('LC','2')">
              </div>
            </td>
            <td nowrap width="15%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="G03AVAAM2" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotalG.getE03AVAAM2())%>" onDblClick="showAccGrp('LC','2')">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right"></div>
            </td>
            <td nowrap width="15%" bordercolor="#000000"> 
              <div align="center"></div>
            </td>
            <td nowrap width="15%" bordercolor="#000000"> 
              <div align="center"></div>
            </td>
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right"><a href="javascript:showAcc('41','3')">Aceptaciones Bancarias : </a></div>
            </td>
            <td nowrap width="15%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03AVAAM3" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03AVAAM3())%>" onDblClick="showAcc('LC','3')">
              </div>
            </td>
            <td nowrap width="15%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="G03AVAAM3" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotalG.getE03AVAAM3())%>" onDblClick="showAccGrp('LC','3')">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" bordercolor="#000000">&nbsp;</td>
            <td nowrap width="15%" bordercolor="#000000">&nbsp;</td>
            <td nowrap width="15%" bordercolor="#000000"> 
              <div align="right"></div>
            </td>
            <td nowrap width="20%" height="22" bordercolor="#000000" > 
              <div align="center"> </div>
            </td>
            <td nowrap width="15%" bordercolor="#000000">&nbsp;</td>
            <td nowrap width="15%" bordercolor="#000000">&nbsp;</td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right"><b>Total D&eacute;bito : </b></div>
            </td>
            <td nowrap width="15%" bordercolor="#000000"> 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03TOTCDB" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03TOTCDB())%>">
              </div>
            </td>
            <td nowrap width="15%" bordercolor="#000000"> 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="G03TOTCDB" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotalG.getE03TOTCDB())%>">
              </div>
            </td>
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right"><b>Total Cr&eacute;dito : </b></div>
            </td>
            <td nowrap width="15%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03TOTCCR" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03TOTCCR())%>">
              </div>
            </td>
            <td nowrap width="15%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="G03TOTCCR" size="17" maxlength="15" value="<%= Util.formatCCY(cifTotalG.getE03TOTCCR())%>">
              </div>
            </td>
          </tr>
        </table>
        
      </td>
    </tr>
  </table>
  
  <h4>Activos Bajo Administración</h4>
  <h4>Individual</h4>	
  <table class="tableinfo">
    <tr > 
      <td nowrap height="36"> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="21%" > 
              <div align="right"><a href="javascript:showOpenCustPos(document.forms[0].E03CUSCUN.value)">Posición Abierta :</a></div>
            </td>
            <td width="23%"> 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03IEOPOS"  size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03IEOPOS())%>" >
              </div>
            </td>
            <td width="20%"> 
              <div align="center"></div>
            </td>
            <td width="20%"> 
              <div align="center"></div>
            </td>
          </tr>
          <tr> 
            <td width="17%"> 
              <div align="right">Monto Colateral :</div>
            </td>
            <td width="23%"> 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03IECOAM"  size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03IECOAM())%>">
              </div>
            </td>
            <td width="20%"> 
              <div align="right">Disponible :</div>
            </td>
            <td width="20%"> 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="E03IEAVAM"  size="17" maxlength="15" value="<%= Util.formatCCY(cifTotal.getE03IEAVAM())%>">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<h4>Grupo</h4>  
  <table class="tableinfo">
    <tr > 
      <td nowrap height="36"> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="21%" > 
              <div align="right"><a href="javascript:showOpenCustPos(document.forms[0].E03CUSGRP.value)">Posición Abierta :</a></div>
            </td>
            <td width="23%"> 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="G03IEOPOS"  size="17" maxlength="15" value="<%= Util.formatCCY(cifTotalG.getE03IEOPOS())%>" >
              </div>
            </td>
            <td width="20%"> 
              <div align="center"></div>
            </td>
            <td width="20%"> 
              <div align="center"></div>
            </td>
          </tr>
          <tr> 
            <td width="17%"> 
              <div align="right">Monto Colateral :</div>
            </td>
            <td width="23%"> 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="G03IECOAM"  size="17" maxlength="15" value="<%= Util.formatCCY(cifTotalG.getE03IECOAM())%>">
              </div>
            </td>
            <td width="20%"> 
              <div align="right">Disponible :</div>
            </td>
            <td width="20%"> 
              <div align="center"> 
                <input type="text" id="txtright" readonly name="G03IEAVAM"  size="17" maxlength="15" value="<%= Util.formatCCY(cifTotalG.getE03IEAVAM())%>">
              </div>
            </td>
          </tr>
        </table>
	</td>
	</tr>
</table>
</form>
</body>
</html>
