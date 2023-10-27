<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Balances de cuentas contables</title>
<%@ page import = "datapro.eibs.master.Util" %>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="balance" class="datapro.eibs.beans.EGL075501Message" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

  function VerTransaccionesDiarias() {
		var pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEGL0590?SCREEN=400&E01GLBBNK=<%=balance.getE01GLBBNK().trim()%>&E01GLBCCY=<%=balance.getE01GLBCCY().trim()%>&E01GLBGLN=<%=balance.getE01GLBGLN().trim()%>&GLBBAL=<%=balance.getE01FINBAL().trim()%>&E01GLMDSC=<%= balance.getE01GLMDSC().trim()%>";			  
	CenterWindow(pg,1050,600,2);	
 }	
</SCRIPT>

</head>

<body>


 <% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }%>
 
<SCRIPT type="text/javascript">
	builtNewMenu(cc_m_opt);
	initMenu();
</SCRIPT>
 
 <h3 align="center">
 Balances  
 <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="inq_balances.jsp,EGL0755"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.accounting.JSEGL0755" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="4">
  <input type=HIDDEN name="SELMTH">
  <h4>Informaci&oacute;n de la Cuenta Contable</h4>
 <table class="tableinfo" width="100%" >
    <tr id="trdark"> 
       <td nowrap width="25%" height="31" > 
         <div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Cuenta Contable :       
	         <input type="text" readonly name="BANCO"  size="3" maxlength="2" value="<%= balance.getE01GLBBNK().trim()%>">
	         <input type="text" readonly name="MONEDA"  size="4" maxlength="3" value="<%= balance.getE01GLBCCY().trim()%>">
	         <input type="text" readonly name="CUENTA"  size="17" maxlength="16" value="<%= balance.getE01GLBGLN().trim()%>">              
	         <input type="text" readonly name="DESC"  size="45" maxlength="40" value="<%= balance.getE01GLMDSC().trim()%>">
         </div>
       </td>            
    </tr>
  </table>
	<table class="tbenter" width="100%">
		<tr>
			<td align="center" width="15%">
				&nbsp;
			</td>	
			<td align="center" width="15%">
				&nbsp;
			</td>
			<td align="center" class="tdbkg" width="15%"><a
				href="javascript:VerTransaccionesDiarias()"> <b>Transacciones del Dia</b> </a>
			</td>
			<td align="center" width="15%">
				&nbsp;
			</td>
			<td align="center" width="15%">
				&nbsp;
			</td>								
		</tr>
	</table>
  
  <table class="tableinfo" width="100%" >
     <tr id="trclear"> 
        <td nowrap height="25" bordercolor="#000000"> 
          <div align="center"><b></b></div>
        </td>
        <td nowrap height="25" height="50" bordercolor="#000000" colspan="2"> 
          <div align="center"><b>Año Actual</b></div>
        </td>
        <td nowrap height="25" bordercolor="#000000"> 
          <div align="center"><b></b></div>
        </td>
        <td nowrap height="25" height="50" bordercolor="#000000" colspan="2"> 
          <div align="center"><b>Año Anterior</b></div>
        </td>      
      </tr>
      <tr id="trdark"> 
        <td nowrap height="20" bordercolor="#000000"> 
          <div align="center"><b></b></div>
        </td>
        <td nowrap height="20" bordercolor="#000000"> 
          <div align="center"><b>Este Mes</b></div>
        </td>
        <td nowrap height="20" bordercolor="#000000"> 
          <div align="center"><b>Acumulado Año </b></div>
        </td>
         <td nowrap height="25" bordercolor="#000000"> 
          <div align="center"><b></b></div>
        </td>
        <td nowrap height="20" bordercolor="#000000"> 
          <div align="center"><b>Este Mes</b></div>
        </td>
        <td nowrap height="20" bordercolor="#000000"> 
          <div align="center"><b>Acumulado Año</b></div>
        </td>
      </tr>

      <tr id="trclear"> 
        <td nowrap width="20%" bordercolor="#000000" height="31"> 
          <div align="right"><b>Inicio de Balance :</b></div>
        </td>
        <td nowrap width="20%" height="31" bordercolor="#000000" > 
          <div align="center"> 
            <input type="text" class="txtright" readonly name="E01INIBAL" size="17" maxlength="15" value="<%= Util.formatCCY(balance.getE01INIBAL())%>" >
          </div>
        </td>
        <td nowrap width="20%" height="31" bordercolor="#000000" > 
          <div align="center">
          </div>
        </td>
        <td nowrap width="20%" bordercolor="#000000" height="31"> 
          <div align="right"><b>Inicio de Balance :</b></div>
        </td>
        
        <td nowrap width="20%" height="31" bordercolor="#000000" > 
          <div align="center"> 
            <input type="text" class="txtright" readonly name="E01PINIBAL" size="17" maxlength="15" value="<%= Util.formatCCY(balance.getE01PINIBAL())%>" >
          </div>
        </td>
        <td nowrap width="20%" height="31" bordercolor="#000000" > 
          <div align="center">
          </div>
        </td>
      </tr>
      <tr id="trdark"> 
        <td nowrap width="20%" bordercolor="#000000"> 
          <div align="right">Enero :</div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center"> 
            <input type="text" class="txtright" readonly name="E01BALCM01" size="17" maxlength="15" value="<%= Util.formatCCY(balance.getE01BALCM01())%>" >
          </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">                 
          	 <input type="text" class="txtright" readonly name="E01BALAC01" size="17" maxlength="15" value="<%= Util.formatCCY(balance.getE01BALAC01())%>" >
          </div>
        </td>
         <td nowrap width="20%" bordercolor="#000000"> 
          <div align="right">Enero :</div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center"> 
            <input type="text" class="txtright" readonly name="E01BALPM01" size="17" maxlength="15" value="<%= Util.formatCCY(balance.getE01BALPM01())%>" >
          </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center"> 
          	<INPUT	type="text" class="txtright" readonly name="E01BALPA01" size="17"	maxlength="15" value="<%= Util.formatCCY(balance.getE01BALPA01())%>">
          </div>
        </td>
      </tr>
      <tr id="trclear"> 
        <td nowrap width="20%" bordercolor="#000000" height="35"> 
          <div align="right">Febrero : </div>
        </td>
        <td nowrap width="20%" height="35" bordercolor="#000000" > 
          <div align="center">
          	<INPUT type="text" class="txtright" readonly name="E01BALCM02" size="17" maxlength="15" value="<%= Util.formatCCY(balance.getE01BALCM02())%>"></div>
        </td>
        <td nowrap width="20%" height="35" bordercolor="#000000" > 
          <div align="center">
          	<input type="text" class="txtright" readonly name="E01BALAC02" size="17" maxlength="15" value="<%= Util.formatCCY(balance.getE01BALAC02())%>" >
          </div>
        </td>
        <td nowrap width="20%" bordercolor="#000000" height="35"> 
          <div align="right">Febrero : </div>
        </td>
        <td nowrap width="20%" height="35" bordercolor="#000000" > 
          <div align="center">
          	<INPUT type="text" class="txtright" readonly name="E01BALPM02" size="17" maxlength="15" value="<%= Util.formatCCY(balance.getE01BALPM02())%>">
          </div>
        </td>
        <td nowrap width="20%" height="35" bordercolor="#000000" > 
          <div align="center">
          	<INPUT	type="text" class="txtright" readonly name="E01BALPA02" size="17"	maxlength="15" value="<%= Util.formatCCY(balance.getE01BALPA02())%>">
          </div>
        </td>
      </tr>
      <tr id="trdark"> 
        <td nowrap width="20%" bordercolor="#000000"> 
          <div align="right">Marzo : </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
          	<INPUT type="text" class="txtright" readonly name="E01BALCM03" size="17" maxlength="15" value="<%= Util.formatCCY(balance.getE01BALCM03())%>">
          </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
			<input type="text" class="txtright" readonly name="E01BALAC03" size="17" maxlength="15" value="<%= Util.formatCCY(balance.getE01BALAC03())%>" >
          </div>
        </td>
        <td nowrap width="20%" bordercolor="#000000"> 
          <div align="right">Marzo : </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
          	<INPUT type="text" class="txtright" readonly name="E01BALPM03" size="17" maxlength="15" value="<%= Util.formatCCY(balance.getE01BALPM03())%>">
          </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
          	<INPUT type="text" class="txtright" readonly name="E01BALPA03" size="17" maxlength="15" value="<%= Util.formatCCY(balance.getE01BALPA03())%>">
          </div>
        </td>
      </tr>
      <tr id="trclear"> 
        <td nowrap width="20%" bordercolor="#000000"> 
          <div align="right">Abril :</div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center"> 
            <INPUT type="text" class="txtright" readonly name="E01BALCM04" size="17" maxlength="15" value="<%= Util.formatCCY(balance.getE01BALCM04())%>">
          </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
          	<input type="text" class="txtright" readonly name="E01BALAC04" size="17" maxlength="15" value="<%= Util.formatCCY(balance.getE01BALAC04())%>" >
          </div>
        </td>
        <td nowrap width="20%" bordercolor="#000000"> 
          <div align="right">Abril :</div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
          	<INPUT type="text" class="txtright" readonly name="E01BALPM04" size="17" maxlength="15" value="<%= Util.formatCCY(balance.getE01BALPM04())%>">
          </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
          	<INPUT	type="text" class="txtright" readonly name="E01BALPA04" size="17"	maxlength="15" value="<%= Util.formatCCY(balance.getE01BALPA04())%>">
          </div>
        </td>
      </tr>
      <tr id="trdark"> 
        <td nowrap width="20%" bordercolor="#000000"> 
          <div align="right">Mayo :</div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
          	<INPUT type="text" class="txtright" readonly name="E01BALCM05" size="17" maxlength="15" value="<%= Util.formatCCY(balance.getE01BALCM05())%>">
          </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
          	<input type="text" class="txtright" readonly name="E01BALAC05" size="17" maxlength="15" value="<%= Util.formatCCY(balance.getE01BALAC05())%>" >
          </div>
        </td>
        <td nowrap width="20%" bordercolor="#000000"> 
          <div align="right">Mayo :</div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
          	<INPUT type="text" class="txtright" readonly name="E01BALPM05" size="17" maxlength="15" value="<%= Util.formatCCY(balance.getE01BALPM05())%>">
          </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
          	<INPUT	type="text" class="txtright" readonly name="E01BALPA05" size="17"	maxlength="15" value="<%= Util.formatCCY(balance.getE01BALPA05())%>">
          </div>
        </td>
      </tr>
      <tr id="trclear"> 
        <td nowrap width="20%" bordercolor="#000000"> 
          <div align="right">Junio : </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
          	<INPUT type="text" class="txtright" readonly name="E01BALCM06" size="17" maxlength="15" value="<%= Util.formatCCY(balance.getE01BALCM06())%>">
          </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
			<input type="text" class="txtright" readonly name="E01BALAC06" size="17" maxlength="15" value="<%= Util.formatCCY(balance.getE01BALAC06())%>" >
          </div>
        </td>
        <td nowrap width="20%" bordercolor="#000000"> 
          <div align="right">Junio : </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
          	<INPUT type="text" class="txtright" readonly name="E01BALPM06" size="17" maxlength="15" value="<%= Util.formatCCY(balance.getE01BALPM06())%>">
          </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
          	<INPUT type="text" class="txtright" readonly name="E01BALPA06" size="17" maxlength="15" value="<%= Util.formatCCY(balance.getE01BALPA06())%>">
          </div>
        </td>
      </tr>
      <tr id="trdark"> 
        <td nowrap width="20%" bordercolor="#000000"> 
          <div align="right">Julio : </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
          	<INPUT type="text" class="txtright" readonly name="E01BALCM07" size="17" maxlength="15" value="<%= Util.formatCCY(balance.getE01BALCM07())%>">
          </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
           <input type="text" class="txtright" readonly name="E01BALAC07" size="17" maxlength="15" value="<%= Util.formatCCY(balance.getE01BALAC07())%>" >
          </div>
        </td>
        <td nowrap width="20%" bordercolor="#000000"> 
          <div align="right">Julio : </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
          	<INPUT type="text" class="txtright" readonly name="E01BALPM07" size="17" maxlength="15" value="<%= Util.formatCCY(balance.getE01BALPM07())%>">
          </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
          	<INPUT	type="text" class="txtright" readonly name="E01BALPA07" size="17"	maxlength="15" value="<%= Util.formatCCY(balance.getE01BALPA07())%>">
          </div>
        </td>
      </tr>
      <tr id="trclear"> 
        <td nowrap width="20%" bordercolor="#000000"> 
          <div align="right">Agosto : </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
          	<INPUT type="text" class="txtright" readonly name="E01BALCM08" size="17" maxlength="15" value="<%= Util.formatCCY(balance.getE01BALCM08())%>">
          </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
          	<input type="text" class="txtright" readonly name="E01BALAC08" size="17" maxlength="15" value="<%= Util.formatCCY(balance.getE01BALAC08())%>" >
          </div>
        </td>
        <td nowrap width="20%" bordercolor="#000000"> 
          <div align="right">Agosto : </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
          	<INPUT type="text" class="txtright" readonly name="E01BALPM08" size="17" maxlength="15" value="<%= Util.formatCCY(balance.getE01BALPM08())%>">
          </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
          	<INPUT	type="text" class="txtright" readonly name="E01BALPA08" size="17"	maxlength="15" value="<%= Util.formatCCY(balance.getE01BALPA08())%>">
          </div>
        </td>
      </tr>
      <tr id="trdark"> 
        <td nowrap width="20%" bordercolor="#000000"> 
          <div align="right">Setiembre : </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
          	<INPUT type="text" class="txtright" readonly name="E01BALCM09" size="17" maxlength="15" value="<%= Util.formatCCY(balance.getE01BALCM09())%>">
          </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
          	<input type="text" class="txtright" readonly name="E01BALAC09" size="17" maxlength="15" value="<%= Util.formatCCY(balance.getE01BALAC09())%>" >
          </div>
        </td>
        <td nowrap width="20%" bordercolor="#000000"> 
          <div align="right">Setiembre : </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
          	<INPUT type="text" class="txtright" readonly name="E01BALPM09" size="17" maxlength="15" value="<%= Util.formatCCY(balance.getE01BALPM09())%>">
          </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
          	<INPUT	type="text" class="txtright" readonly name="E01BALPA09" size="17"	maxlength="15" value="<%= Util.formatCCY(balance.getE01BALPA09())%>">
          </div>
        </td>
      </tr>
      <tr id="trclear"> 
        <td nowrap width="20%" bordercolor="#000000"> 
          <div align="right">Octubre : </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
           <INPUT type="text" class="txtright" readonly name="E01BALCM10" size="17" maxlength="15" value="<%= Util.formatCCY(balance.getE01BALCM10())%>">
          </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
          	<input type="text" class="txtright" readonly name="E01BALAC10" size="17" maxlength="15" value="<%= Util.formatCCY(balance.getE01BALAC10())%>" >
          </div>
        </td>
        <td nowrap width="20%" bordercolor="#000000"> 
          <div align="right">Octubre : </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
          	<INPUT type="text" class="txtright" readonly name="E01BALPM10" size="17" maxlength="15" value="<%= Util.formatCCY(balance.getE01BALPM10())%>">
          </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
             <INPUT	type="text" class="txtright" readonly name="E01BALPA10" size="17"	maxlength="15" value="<%= Util.formatCCY(balance.getE01BALPA10())%>">
          </div>
        </td>
      </tr>
      <tr id="trdark"> 
        <td nowrap width="20%" bordercolor="#000000"> 
          <div align="right">Noviembre : </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
          	<INPUT type="text" class="txtright" readonly name="E01BALCM11" size="17" maxlength="15" value="<%= Util.formatCCY(balance.getE01BALCM11())%>">
          </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
          	<input type="text" class="txtright" readonly name="E01BALAC11" size="17" maxlength="15" value="<%= Util.formatCCY(balance.getE01BALAC11())%>" >
          </div>
        </td>
        <td nowrap width="20%" bordercolor="#000000"> 
          <div align="right">Noviembre : </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
          	<INPUT type="text" class="txtright" readonly name="E01BALPM11" size="17" maxlength="15" value="<%= Util.formatCCY(balance.getE01BALPM11())%>">
          </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
          	<INPUT	type="text" class="txtright" readonly name="E01BALPA11" size="17"	maxlength="15" value="<%= Util.formatCCY(balance.getE01BALPA11())%>">
          </div>
        </td>
      </tr>
      <tr id="trclear"> 
        <td nowrap width="20%" bordercolor="#000000"> 
          <div align="right">Diciembre : </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
               <INPUT type="text" class="txtright" readonly name="E01BALCM12" size="17" maxlength="15" value="<%= Util.formatCCY(balance.getE01BALCM12())%>">
          </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
          	<input type="text" class="txtright" readonly name="E01BALAC12" size="17" maxlength="15" value="<%= Util.formatCCY(balance.getE01BALAC12())%>" >
          </div>
        </td>
        <td nowrap width="20%" bordercolor="#000000"> 
          <div align="right">Diciembre : </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
          	<INPUT type="text" class="txtright" readonly name="E01BALPM12" size="17" maxlength="15" value="<%= Util.formatCCY(balance.getE01BALPM12())%>">
          </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
          	<INPUT type="text" class="txtright" readonly name="E01BALPA12" size="17" maxlength="15" value="<%= Util.formatCCY(balance.getE01BALPA12())%>">
          </div>
        </td>
      </tr>
      <tr id="trdark"> 
        <td nowrap width="20%" bordercolor="#000000"> 
          <div align="right"><b>Final deBalance : </b></div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" >
 		  <div align="center">
			<INPUT type="text" class="txtright" readonly name="E01BALFIN"	size="17" maxlength="15" value="<%= Util.formatCCY(balance.getE01FINBAL())%>">				
          </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
          	<INPUT type="text" class="txtright" readonly name="E01FINBAL"	size="17" maxlength="15" value="<%= Util.formatCCY(balance.getE01FINBAL())%>">
          </div>
        </td>
        <td nowrap width="20%" bordercolor="#000000"> 
          <div align="right"><b>Final deBalance : </b></div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
          	<INPUT	type="text" class="txtright" readonly name="E01BALPFIN" size="17"	maxlength="15" value="<%=Util.formatCCY(balance.getE01FINPBAL())%>">
          </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
          	<INPUT	type="text" class="txtright" readonly name="E01FINPBAL" size="17"	maxlength="15" value="<%=Util.formatCCY(balance.getE01FINPBAL())%>">
          </div>
        </td>
      </tr>
    </table>

  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td width="100%"> 
      	<div align="center"> 
			<input id="EIBSBTN" type=submit name="Submit" value="Regresar">
  		</div>
      </td>      
    </tr>    
  </table>
  </form>
</body>
</html>
