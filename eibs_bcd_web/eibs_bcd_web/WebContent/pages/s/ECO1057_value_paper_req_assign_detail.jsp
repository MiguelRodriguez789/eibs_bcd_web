<%@ page import ="datapro.eibs.master.Util" %>
<html> 
<head>
<title>Asignacion Pedidos Adhesivos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" 		class= "datapro.eibs.beans.UserPos"  		scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<% 
	int row = 0;
	try { row = Integer.parseInt(request.getParameter("ROW"));} catch (Exception e) {}
	appList.setCurrentRow(row);
	datapro.eibs.beans.ECO105701Message msgMT = (datapro.eibs.beans.ECO105701Message) appList.getRecord();
	
	if ( !error.getERRNUM().equals("0")  ) {
	      error.setERRNUM("0");
%>
	<SCRIPT type="text/javascript">
	    showErrors();
	</SCRIPT>
<%}%>

</head>
<body>

<H3 align="center">Asignacion de Pedidos Adhesivos
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="value_paper_req_assign_detail,ECO1057">
</H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.adhesives.JSECO1057">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="400">
  <INPUT TYPE=HIDDEN NAME="ROW" VALUE="<%= row%>">

 <%int row1 = 0; %>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
		      <td nowrap width="45%"> 
		        <div align="right">Referencia : </div>
		      </td>
		      <td nowrap  width="55%"> 
		        <input type="text" name="E01REQREF" size="10" maxlength="2" readonly value="<%= msgMT.getE01REQREF() %>">
		      </td>
		 </tr>
     	<tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">  
	      <td nowrap> 
	        <div align="right">Banco/Oficina : </div>
	      </td>
	      <td nowrap>
	      	<input type="text" name="E01REQBNK" size="3" maxlength="2" readonly value="<%= msgMT.getE01REQBNK() %>"><b>-</b> 
	        <input type="text" name="E01REQBRN" size="5" maxlength="4" readonly value="<%= msgMT.getE01REQBRN() %>">
	      </td>
     	</tr>
      	<tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">  
	      <td nowrap> 
	        <div align="right">Cajero Solicitante : </div>
	      </td>
	      <td nowrap>
	      	<input type="text" name="E01REQCSN" size="5" maxlength="5" readonly value="<%= msgMT.getE01REQCSN() %>"><b>-</b> 
	        <input type="text" name="E01REQCSM" size="35" maxlength="35" readonly value="<%= msgMT.getE01REQCSM() %>">
	      </td>
     	</tr>    	
     	<tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">  
		  <td> 
		     <div align="right">Tipo Adhesivos : </div>        
		  </td>
      	  <td nowrap> 
      	    <input type="text" name="E01REQTIP" size="5" maxlength="4" readonly value="<%= msgMT.getE01REQTIP() %>">
      	    <input type="text" name="E01REQTIN" size="35" maxlength="35" readonly value="<%= msgMT.getE01REQTIN() %>">
      	  </td>     
      	</tr>
      	<tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
          <td nowrap>
              <div align="right">Subtipo Adhesivos : </div>
          </td>
          <td nowrap>
              <input type="text" name="E01REQSUB" size="5" maxlength="4" readonly value="<%= msgMT.getE01REQSUB() %>">
              <input type="text" name="E01REQSUN" size="35" maxlength="35" readonly value="<%= msgMT.getE01REQSUN() %>"> 
          </td>
        </tr>
     	<tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">  
		  <td> 
		     <div align="right">Creado por : </div>        
		  </td>
      	  <td nowrap> 
      	    <input type="text" name="E01REQCRU" size="12" maxlength="10"
					readonly value="<%= msgMT.getE01REQCRU() %>">
      	  </td>     
      	</tr>
      	<tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
          <td nowrap>
             <div align="right">Cantidad Solicitada : </div>
          </td>
          <td nowrap>
             <input type="text" name="E01REQRQT" value ="<%= msgMT.getE01REQRQT() %>" readonly>             
          </td>
        </tr>
        <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
          <td nowrap>
             <div align="right">Cantidad Disponible : </div>
          </td>
          <td nowrap>
             <input type="text" name="E01REQVQT" value ="<%= msgMT.getE01REQVQT() %>" readonly>             
          </td>
        </tr>
        <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
          <td nowrap>
             <div align="right">Cantidad a Asignar : </div>
          </td>
          <td nowrap>
             <input type="text" name="E01REQAQT" value ="<%= msgMT.getE01REQAQT() %>" onkeypress="enterInteger(event)">
             <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20">             
          </td>
        </tr>
     </table>
    </td>
   </tr>
  </table>

<br>
  <table class="tableinfo">
   <tr> 
   <td>
    <table cellspacing=0 cellpadding=2 width="100%" border="0">    
		<tr id="trdark">
			<td align="center" width="14%"><b>Lote</b></td>
			<td align="center" width="14%"><b>Cantidad<br>Diponible</b></td>
			<td align="center" width="14%"><b>Documento<br>Desde</b></td>
			<td align="center" width="14%"><b>Documento<br>Hasta</b></td>
			<td align="center" width="14%"><b>Cantidad<br>Asignada</b></td>
			<td align="center" width="14%"><b>Documento<br>Desde</b></td>
			<td align="center" width="14%"><b>Documento<br>Hasta</b></td>
		</tr>
		<tr>
			<td width="14%">
				<input type="text" name="E01BALLO1" size="12" maxlength="12" value="<%= msgMT.getE01BALLO1() %>">
      	    	<a href="javascript:GetAdhesivos('E01BALLO1','E01BALBA1','E01BALIN1','E01BALFI1','<%= userPO.getBank() %>','<%= userPO.getBranch() %>',document.forms[0].E01REQTIP.value,document.forms[0].E01REQSUB.value,'E01BALAQ1','E01BALAI1','E01BALAF1')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></a>
			</td>
			<td width="14%">
				<input type="text" name="E01BALBA1" size="13" maxlength="13" value="<%= msgMT.getE01BALBA1() %>" readonly> 
			</td> 
			<td width="14%">
				<input type="text" name="E01BALIN1" size="18" maxlength="16" value="<%= msgMT.getE01BALIN1() %>" readonly> 
			</td>
			<td width="14%">
				<input type="text" name="E01BALFI1" size="18" maxlength="16" value="<%= msgMT.getE01BALFI1() %>" readonly> 
			</td>
			<td width="14%">
				<input type="text" name="E01BALAQ1" size="13" maxlength="13" value="<%= msgMT.getE01BALAQ1() %>">
			</td>
			<td width="14%">
				<input type="text" name="E01BALAI1" size="18" maxlength="16" value="<%= msgMT.getE01BALAI1() %>"> 
			</td>
			<td width="14%">
				<input type="text" name="E01BALAF1" size="18" maxlength="16" value="<%= msgMT.getE01BALAF1() %>"> 
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" name="E01BALLO2" size="12" maxlength="12" value="<%= msgMT.getE01BALLO2() %>">
      	    	<a href="javascript:GetAdhesivos('E01BALLO2','E01BALBA2','E01BALIN2','E01BALFI2','<%= userPO.getBank() %>','<%= userPO.getBranch() %>',document.forms[0].E01REQTIP.value,document.forms[0].E01REQSUB.value,'E01BALAQ2','E01BALAI2','E01BALAF2')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></a>
			</td>
			<td>
				<input type="text" name="E01BALBA2" size="13" maxlength="13" value="<%= msgMT.getE01BALBA2() %>" readonly> 
			</td>
			<td>
				<input type="text" name="E01BALIN2" size="18" maxlength="16" value="<%= msgMT.getE01BALIN2() %>" readonly> 
			</td>
			<td>
				<input type="text" name="E01BALFI2" size="18" maxlength="16" value="<%= msgMT.getE01BALFI2() %>" readonly> 
			</td>
			<td>
				<input type="text" name="E01BALAQ2" size="13" maxlength="13" value="<%= msgMT.getE01BALAQ2() %>">
			</td>
			<td>
				<input type="text" name="E01BALAI2" size="18" maxlength="16" value="<%= msgMT.getE01BALAI2() %>"> 
			</td>
			<td>
				<input type="text" name="E01BALAF2" size="18" maxlength="16" value="<%= msgMT.getE01BALAF2() %>"> 
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" name="E01BALLO3" size="12" maxlength="12" value="<%= msgMT.getE01BALLO3() %>">
      	    	<a href="javascript:GetAdhesivos('E01BALLO3','E01BALBA3','E01BALIN3','E01BALFI3','<%= userPO.getBank() %>','<%= userPO.getBranch() %>',document.forms[0].E01REQTIP.value,document.forms[0].E01REQSUB.value,'E01BALAQ3','E01BALAI3','E01BALAF3')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></a>
			</td>
			<td>
				<input type="text" name="E01BALBA3" size="13" maxlength="13" value="<%= msgMT.getE01BALBA3() %>" readonly> 
			</td>
			<td>
				<input type="text" name="E01BALIN3" size="18" maxlength="16" value="<%= msgMT.getE01BALIN3() %>" readonly> 
			</td>
			<td>
				<input type="text" name="E01BALFI3" size="18" maxlength="16" value="<%= msgMT.getE01BALFI3() %>" readonly> 
			</td>
			<td>
				<input type="text" name="E01BALAQ3" size="13" maxlength="13" value="<%= msgMT.getE01BALAQ3() %>">
			</td>
			<td>
				<input type="text" name="E01BALAI3" size="18" maxlength="16" value="<%= msgMT.getE01BALAI3() %>"> 
			</td>
			<td>
				<input type="text" name="E01BALAF3" size="18" maxlength="16" value="<%= msgMT.getE01BALAF3() %>"> 
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" name="E01BALLO4" size="12" maxlength="12" value="<%= msgMT.getE01BALLO4() %>">
      	    	<a href="javascript:GetAdhesivos('E01BALLO4','E01BALBA4','E01BALIN4','E01BALFI4','<%= userPO.getBank() %>','<%= userPO.getBranch() %>',document.forms[0].E01REQTIP.value,document.forms[0].E01REQSUB.value,'E01BALAQ4','E01BALAI4','E01BALAF4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></a>
			</td>
			<td>
				<input type="text" name="E01BALBA4" size="13" maxlength="13" value="<%= msgMT.getE01BALBA4() %>" readonly> 
			</td>
			<td>
				<input type="text" name="E01BALIN4" size="18" maxlength="16" value="<%= msgMT.getE01BALIN4() %>" readonly> 
			</td>
			<td>
				<input type="text" name="E01BALFI4" size="18" maxlength="16" value="<%= msgMT.getE01BALFI4() %>" readonly> 
			</td>
			<td>
				<input type="text" name="E01BALAQ4" size="13" maxlength="13" value="<%= msgMT.getE01BALAQ4() %>">
			</td>
			<td>
				<input type="text" name="E01BALAI4" size="18" maxlength="16" value="<%= msgMT.getE01BALAI4() %>"> 
			</td>
			<td>
				<input type="text" name="E01BALAF4" size="18" maxlength="16" value="<%= msgMT.getE01BALAF4() %>"> 
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" name="E01BALLO5" size="12" maxlength="12" value="<%= msgMT.getE01BALLO5() %>">
      	    	<a href="javascript:GetAdhesivos('E01BALLO5','E01BALBA5','E01BALIN5','E01BALFI5','<%= userPO.getBank() %>','<%= userPO.getBranch() %>',document.forms[0].E01REQTIP.value,document.forms[0].E01REQSUB.value,'E01BALAQ5','E01BALAI5','E01BALAF5')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></a>
			</td>
			<td>
				<input type="text" name="E01BALBA5" size="13" maxlength="13" value="<%= msgMT.getE01BALBA5() %>" readonly> 
			</td>
			<td>
				<input type="text" name="E01BALIN5" size="18" maxlength="16" value="<%= msgMT.getE01BALIN5() %>" readonly> 
			</td>
			<td>
				<input type="text" name="E01BALFI5" size="18" maxlength="16" value="<%= msgMT.getE01BALFI5() %>" readonly> 
			</td>
			<td>
				<input type="text" name="E01BALAQ5" size="13" maxlength="13" value="<%= msgMT.getE01BALAQ5() %>">
			</td>
			<td>
				<input type="text" name="E01BALAI5" size="18" maxlength="16" value="<%= msgMT.getE01BALAI5() %>"> 
			</td>
			<td>
				<input type="text" name="E01BALAF5" size="18" maxlength="16" value="<%= msgMT.getE01BALAF5() %>"> 
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" name="E01BALLO6" size="12" maxlength="12" value="<%= msgMT.getE01BALLO6() %>">
      	    	<a href="javascript:GetAdhesivos('E01BALLO6','E01BALBA6','E01BALIN6','E01BALFI6','<%= userPO.getBank() %>','<%= userPO.getBranch() %>',document.forms[0].E01REQTIP.value,document.forms[0].E01REQSUB.value,'E01BALAQ6','E01BALAI6','E01BALAF6')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></a>
			</td>
			<td>
				<input type="text" name="E01BALBA6" size="13" maxlength="13" value="<%= msgMT.getE01BALBA6() %>" readonly> 
			</td>
			<td>
				<input type="text" name="E01BALIN6" size="18" maxlength="16" value="<%= msgMT.getE01BALIN6() %>" readonly> 
			</td>
			<td>
				<input type="text" name="E01BALFI6" size="18" maxlength="16" value="<%= msgMT.getE01BALFI6() %>" readonly> 
			</td>
			<td>
				<input type="text" name="E01BALAQ6" size="13" maxlength="13" value="<%= msgMT.getE01BALAQ6() %>">
			</td>
			<td>
				<input type="text" name="E01BALAI6" size="18" maxlength="16" value="<%= msgMT.getE01BALAI6() %>"> 
			</td>
			<td>
				<input type="text" name="E01BALAF6" size="18" maxlength="16" value="<%= msgMT.getE01BALAF6() %>"> 
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" name="E01BALLO7" size="12" maxlength="12" value="<%= msgMT.getE01BALLO7() %>">
      	    	<a href="javascript:GetAdhesivos('E01BALLO7','E01BALBA7','E01BALIN7','E01BALFI7','<%= userPO.getBank() %>','<%= userPO.getBranch() %>',document.forms[0].E01REQTIP.value,document.forms[0].E01REQSUB.value,'E01BALAQ7','E01BALAI7','E01BALAF7')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></a>
			</td>
			<td>
				<input type="text" name="E01BALBA7" size="13" maxlength="13" value="<%= msgMT.getE01BALBA7() %>" readonly> 
			</td>
			<td>
				<input type="text" name="E01BALIN7" size="18" maxlength="16" value="<%= msgMT.getE01BALIN7() %>" readonly> 
			</td>
			<td>
				<input type="text" name="E01BALFI7" size="18" maxlength="16" value="<%= msgMT.getE01BALFI7() %>" readonly> 
			</td>
			<td>
				<input type="text" name="E01BALAQ7" size="13" maxlength="13" value="<%= msgMT.getE01BALAQ7() %>">
			</td>
			<td>
				<input type="text" name="E01BALAI7" size="18" maxlength="16" value="<%= msgMT.getE01BALAI7() %>"> 
			</td>
			<td>
				<input type="text" name="E01BALAF7" size="18" maxlength="16" value="<%= msgMT.getE01BALAF7() %>"> 
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" name="E01BALLO8" size="12" maxlength="12" value="<%= msgMT.getE01BALLO8() %>">
      	    	<a href="javascript:GetAdhesivos('E01BALLO8','E01BALBA8','E01BALIN8','E01BALFI8','<%= userPO.getBank() %>','<%= userPO.getBranch() %>',document.forms[0].E01REQTIP.value,document.forms[0].E01REQSUB.value,'E01BALAQ8','E01BALAI8','E01BALAF8')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></a>
			</td>
			<td>
				<input type="text" name="E01BALBA8" size="13" maxlength="13" value="<%= msgMT.getE01BALBA8() %>" readonly> 
			</td>
			<td>
				<input type="text" name="E01BALIN8" size="18" maxlength="16" value="<%= msgMT.getE01BALIN8() %>" readonly> 
			</td>
			<td>
				<input type="text" name="E01BALFI8" size="18" maxlength="16" value="<%= msgMT.getE01BALFI8() %>" readonly> 
			</td>
			<td>
				<input type="text" name="E01BALAQ8" size="13" maxlength="13" value="<%= msgMT.getE01BALAQ8() %>">
			</td>
			<td>
				<input type="text" name="E01BALAI8" size="18" maxlength="16" value="<%= msgMT.getE01BALAI8() %>"> 
			</td>
			<td>
				<input type="text" name="E01BALAF8" size="18" maxlength="16" value="<%= msgMT.getE01BALAF8() %>"> 
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" name="E01BALLO9" size="12" maxlength="12" value="<%= msgMT.getE01BALLO9() %>">
      	    	<a href="javascript:GetAdhesivos('E01BALLO9','E01BALBA9','E01BALIN9','E01BALFI9','<%= userPO.getBank() %>','<%= userPO.getBranch() %>',document.forms[0].E01REQTIP.value,document.forms[0].E01REQSUB.value,'E01BALAQ9','E01BALAI9','E01BALAF9')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></a>
			</td>
			<td>
				<input type="text" name="E01BALBA9" size="13" maxlength="13" value="<%= msgMT.getE01BALBA9() %>" readonly> 
			</td>
			<td>
				<input type="text" name="E01BALIN9" size="18" maxlength="16" value="<%= msgMT.getE01BALIN9() %>" readonly> 
			</td>
			<td>
				<input type="text" name="E01BALFI9" size="18" maxlength="16" value="<%= msgMT.getE01BALFI9() %>" readonly> 
			</td>
			<td>
				<input type="text" name="E01BALAQ9" size="13" maxlength="13" value="<%= msgMT.getE01BALAQ9() %>">
			</td>
			<td>
				<input type="text" name="E01BALAI9" size="18" maxlength="16" value="<%= msgMT.getE01BALAI9() %>"> 
			</td>
			<td>
				<input type="text" name="E01BALAF9" size="18" maxlength="16" value="<%= msgMT.getE01BALAF9() %>"> 
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" name="E01BALLO0" size="12" maxlength="12" value="<%= msgMT.getE01BALLO0() %>">
      	    	<a href="javascript:GetAdhesivos('E01BALLO0','E01BALBA0','E01BALIN0','E01BALFI0','<%= userPO.getBank() %>','<%= userPO.getBranch() %>',document.forms[0].E01REQTIP.value,document.forms[0].E01REQSUB.value,'E01BALAQ0','E01BALAI0','E01BALAF0')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></a>
			</td>
			<td>
				<input type="text" name="E01BALBA0" size="13" maxlength="13" value="<%= msgMT.getE01BALBA0() %>" readonly> 
			</td>
			<td>
				<input type="text" name="E01BALIN0" size="18" maxlength="16" value="<%= msgMT.getE01BALIN0() %>" readonly> 
			</td>
			<td>
				<input type="text" name="E01BALFI0" size="18" maxlength="16" value="<%= msgMT.getE01BALFI0() %>" readonly> 
			</td>
			<td>
				<input type="text" name="E01BALAQ0" size="13" maxlength="13" value="<%= msgMT.getE01BALAQ0() %>">
			</td>
			<td>
				<input type="text" name="E01BALAI0" size="18" maxlength="16" value="<%= msgMT.getE01BALAI0() %>"> 
			</td>
			<td>
				<input type="text" name="E01BALAF0" size="18" maxlength="16" value="<%= msgMT.getE01BALAF0() %>"> 
			</td>
		</tr>
		<tr id="trdark">
			<td align="center">
				<p><B>TOTALES</B></p>
			</td>
			<td>
				<input type="text" name="E01BALTAV" size="13" maxlength="13" value="<%= msgMT.getE01BALTAV() %>" readonly> 
			</td>
			<td>
				<div></div>
			</td>
			<td>
				<div></div>
			</td>
			<td colspan="3">
				<input type="text" name="E01BALTAS" size="13" maxlength="13" value="<%= msgMT.getE01BALTAS() %>" readonly> 
			</td>
		</tr>
     </table>
    </td>
   </tr>
  </table>
  <br>
  <p align="center"> 
    <input id="EIBSBTN" type="submit" name="Submit" value="Asignar">
  </p>
  
</form>
</body>
</html>
