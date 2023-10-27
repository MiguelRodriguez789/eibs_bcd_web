<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%><html>


<%@ page import = "datapro.eibs.master.Util" %>

<head>
<title>Transacciones</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="lnGenTran" class="datapro.eibs.beans.EDL080030Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<SCRIPT type="text/javascript">

function MaintenanceCheck(chk,lns1,ridx1) {

	myVar1 = "MNTCHK" + ridx1;
	myVar2 = "DELCHK" + ridx1;
	document.getElementById(myVar1).checked = false;
	document.getElementById(myVar1).disabled = true;
	document.getElementById(myVar2).disabled = true;

		var ckn = chk;

		var loan1  = lns1;

		MntCheck(chk,lns1);

		

 } 
    

function DeleteCheck(chk,lns1,ridx1) {
	myVar1 = "MNTCHK" + ridx1;
	myVar2 = "DELCHK" + ridx1;
	document.getElementById(myVar2).checked = false;
	document.getElementById(myVar1).disabled = true;
	document.getElementById(myVar2).disabled = true;
		var ckn = chk;

		var loan1  = lns1;

		DelCheck(chk,lns1);

		

 }      




	function CreateCheck(val,lns,ridx,gln, con){

		myVar = "E30OFFCB" + ridx;
	
		if (document.getElementById(myVar).checked) {	
			document.getElementById(myVar).disabled = true;
		}
		UpdateFlag(false);

		var valor = val;

		var loan  = lns;

		CrtChk(valor,lns,gln,ridx,con);

  }


 function UpdateFlag(val) {
	document.forms[0].H30FLGWK2.value = (val)?"X":"";
 }


 function setRecalculate() {

  document.forms[0].RECALC.checked = true;

  document.forms[0].RECALC.disabled = true;

  UpdateFlag(true);  

 }


</SCRIPT>

<SCRIPT type="text/javascript">
 
    builtNewMenu(dft_m_opt);

</SCRIPT>

</head>

<body>


<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }

  out.println("<SCRIPT> initMenu(); </SCRIPT>");

%>

<SCRIPT type="text/javascript">

function setCkn(val,row) {
	
   if (isNaN(row)) {
	row = 0;
   } else {
      row = parseInt(row, 10);
   }
   if (val == "1") {
	  if (row == 1) 
   	  	divcheck1.style.display="";
   	  if (row == 2) 
   	  	divcheck2.style.display="";
   	  if (row == 3) 
   	  	divcheck3.style.display="";
   	  if (row == 4) 
   	  	divcheck4.style.display="";
   	  if (row == 5) 
   	  	divcheck5.style.display="";
   	  if (row == 6) 
   	  	divcheck6.style.display="";
   	  if (row == 7) 
   	  	divcheck7.style.display="";
   	  if (row == 8) 
   	  	divcheck8.style.display="";
   	  if (row == 9) 
   	  	divcheck9.style.display="";						
   } else {
   	  if (row == 1) 
   	  	divcheck1.style.display="none";
   	  if (row == 2) 
   	  	divcheck2.style.display="none";
   	  if (row == 3) 
   	  	divcheck3.style.display="none";
   	  if (row == 4) 
   	  	divcheck4.style.display="none";
   	  if (row == 5) 
   	  	divcheck5.style.display="none";
   	  if (row == 6) 
   	  	divcheck6.style.display="none";
   	  if (row == 7) 
   	  	divcheck7.style.display="none";
   	  if (row == 8) 
   	  	divcheck8.style.display="none";
   	  if (row == 9) 
   	  	divcheck9.style.display="none";
   }
}
</SCRIPT>

<h3 align="center">Transacciones<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="dft_new_transac.jsp, EDL0800"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0800" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="26">
  <INPUT TYPE=HIDDEN NAME="E30DEABNK"  value="<%= lnGenTran.getE30DEABNK().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E30DEACCY"  value="<%= lnGenTran.getE30DEACCY().trim()%>">
  <INPUT TYPE=HIDDEN ID="H30FLGWK2" NAME="H30FLGWK2"  value="<%= lnGenTran.getH30FLGWK2().trim()%>">
  
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left">
                <input type="text" name="E30DEACUN" size="10" maxlength="9" value="<%= lnGenTran.getE30DEACUN().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" name="E30CUSNA1" size="50" maxlength="45" value="<%= lnGenTran.getE30CUSNA1().trim()%>" >
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
                <input type="text" name="E30DEAACC" size="13" maxlength="12" value="<%= lnGenTran.getE30DEAACC().trim()%>" >
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
                <input type="text" name="E30DEACCY2" size="4" maxlength="3" value="<%= lnGenTran.getE30DEACCY().trim()%>" >
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
                <input type="text" name="E30DEAPRO" size="5" maxlength="4" value="<%= lnGenTran.getE30DEAPRO().trim()%>" >
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Distribuci&oacute;n del Pago</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap colspan="2"> 
              <div align="right">VALOR DEL PRESTAMO :</div>
            </td>
            <td nowrap colspan="3" width="56%"> 
              <input type="text" size="15" maxlength="13" name="E30TRNPRI" value="<%= lnGenTran.getE30TRNPRI().trim()%>" readonly>
            </td>
            <td nowrap colspan="2"> 
              <div align="right">FECHA DE VENCIMIENTO :</div>
            </td>
            <td nowrap colspan="3" width="56%"> 
            <eibsinput:date name="lnGenTran" fn_year="E30DEAMDY" fn_month="E30DEAMDM" fn_day="E30DEAMDD" />
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap colspan="2"> 
              <div align="right">INTERESES PREPAGADOS :</div>
            </td>
            <td nowrap colspan="3" width="56%"> 
              <input type="text" size="15" maxlength="13" name="E30TRNINT" value="<%= lnGenTran.getE30TRNINT().trim()%>"  readonly>
            </td>
            <td nowrap colspan="2"> 
              <div align="right">TÉRMINO :</div>
            </td>
            <td nowrap colspan="3" width="56%"> 
              <input type="text" size="5" maxlength="5" name="E30DEATRM" value="<%= lnGenTran.getE30DEATRM().trim()%>"  readonly>
              <select name="E30DEATRC" disabled>
                            <OPTION value=" " <% if (lnGenTran.getE30DEATRC().trim().equals(""))  out.print("selected"); %>=""></OPTION>
                            <OPTION value="D" <% if (lnGenTran.getE30DEATRC().trim().equals("D"))  out.print("selected"); %>="">Día(s)</OPTION>
                            <OPTION value="M" <% if (lnGenTran.getE30DEATRC().trim().equals("M")) out.print("selected"); %>="">Mes(es)</OPTION>
                            <OPTION value="Y" <% if (lnGenTran.getE30DEATRC().trim().equals("Y")) out.print("selected"); %>="">Año(s)</OPTION>
                        </select>
            </td>
          </tr>
          <%
           String trType = "trclear";
		   if(!lnGenTran.getE30PDSC01().trim().equals("")){
		   	  if (trType.compareTo("trclear") == 0) { trType = "trdark"; } else { trType = "trclear"; }
		 %> 
          <tr id="<%= trType %>"> 
            <td nowrap colspan="2"> 
              <div align="right"><%= lnGenTran.getE30PDSC01().trim()%> : </div>
            </td>
            <td nowrap colspan="3" width="56%"> 
              <input type="text" size="15" maxlength="13" name="E30PAMT01" value="<%= lnGenTran.getE30PAMT01().trim()%>" readonly>
            </td>
            <td nowrap colspan="2"> 
            	<div align="right">
	            	<% if(lnGenTran.getE30PDSC01().equals("TIMBRE FISCAL")) { 
	            		out.print("CONDONAR TIMBRE FISCAL :");
					} else if (lnGenTran.getE30PDSC01().equals("COMISION FLAT")) { 
						out.print("CONDONAR COMISION FLAT :");	
					} %>
            	</div>
            </td>
            <td nowrap colspan="3" width="56%"> 
            	<% if(lnGenTran.getE30PDSC01().equals("TIMBRE FISCAL")) { %>
                <input type="radio" name="E30CONTIM" value="1" <%if(lnGenTran.getE30CONTIM().equals("1")) out.print("checked");%>>Sí 
                <input type="radio" name="E30CONTIM" value="N" <%if(lnGenTran.getE30CONTIM().equals("N")) out.print("checked");%>>No 
				<% } else if (lnGenTran.getE30PDSC01().equals("COMISION FLAT")) { %>
                <input type="radio" name="E30CONCOM" value="1" <%if(lnGenTran.getE30CONCOM().equals("1")) out.print("checked");%>>Sí 
                <input type="radio" name="E30CONCOM" value="N" <%if(lnGenTran.getE30CONCOM().equals("N")) out.print("checked");%>>No 
				<% } %>
            </td>
          </tr>
          <%
		   }
		  %> <%
		   if(!lnGenTran.getE30PDSC02().trim().equals("")){
		   	  if (trType.compareTo("trclear") == 0) { trType = "trdark"; } else { trType = "trclear"; }
		 %> 
          <tr id="<%= trType %>"> 
            <td nowrap colspan="2"> 
              <div align="right"><%= lnGenTran.getE30PDSC02().trim()%> :</div>
            </td>
            <td nowrap colspan="3" width="56%"> 
              <input type="text" size="15" maxlength="13" name="E30PAMT02" value="<%= lnGenTran.getE30PAMT02().trim()%>" readonly>
            </td>
            <td nowrap colspan="2">
            	<div align="right">
	            	<% if(lnGenTran.getE30PDSC02().equals("TIMBRE FISCAL")) { 
	            		out.print("CONDONAR TIMBRE FISCAL :");
					} else if (lnGenTran.getE30PDSC02().equals("COMISION FLAT")) { 
						out.print("CONDONAR COMISION FLAT :");	
					} %>
            	</div>
            </td>
            <td nowrap colspan="3" width="56%"> 
            	<% if(lnGenTran.getE30PDSC02().equals("TIMBRE FISCAL")) { %>
                <input type="radio" name="E30CONTIM" value="1" <%if(lnGenTran.getE30CONTIM().equals("1")) out.print("checked");%>>Sí 
                <input type="radio" name="E30CONTIM" value="N" <%if(lnGenTran.getE30CONTIM().equals("N")) out.print("checked");%>>No 
				<% } else if (lnGenTran.getE30PDSC02().equals("COMISION FLAT")) { %>
                <input type="radio" name="E30CONCOM" value="1" <%if(lnGenTran.getE30CONCOM().equals("1")) out.print("checked");%>>Sí 
                <input type="radio" name="E30CONCOM" value="N" <%if(lnGenTran.getE30CONCOM().equals("N")) out.print("checked");%>>No 
				<% } %>
            </td>
            
          </tr>
          <%
          }
          %> <%
		   if(!lnGenTran.getE30PDSC03().trim().equals("")){
		   	  if (trType.compareTo("trclear") == 0) { trType = "trdark"; } else { trType = "trclear"; }
		 %> 
          <tr id="<%= trType %>"> 
            <td nowrap colspan="2"> 
              <div align="right"><%= lnGenTran.getE30PDSC03().trim()%> :</div>
            </td>
            <td nowrap colspan="3" width="56%"> 
              <input type="text" size="15" maxlength="13" name="E30PAMT03" value="<%= lnGenTran.getE30PAMT03().trim()%>" readonly>
            </td>
            <td nowrap colspan="2"> 
            	<div align="right">
	            	<% if(lnGenTran.getE30PDSC03().equals("TIMBRE FISCAL")) { 
	            		out.print("CONDONAR TIMBRE FISCAL :");
					} else if (lnGenTran.getE30PDSC03().equals("COMISION FLAT")) { 
						out.print("CONDONAR COMISION FLAT :");	
					} %>
            	</div>
            </td>
            <td nowrap colspan="3" width="56%"> 
            	<% if(lnGenTran.getE30PDSC03().equals("TIMBRE FISCAL")) { %>
                <input type="radio" name="E30CONTIM" value="1" <%if(lnGenTran.getE30CONTIM().equals("1")) out.print("checked");%>>Sí 
                <input type="radio" name="E30CONTIM" value="N" <%if(lnGenTran.getE30CONTIM().equals("N")) out.print("checked");%>>No 
				<% } else if (lnGenTran.getE30PDSC03().equals("COMISION FLAT")) { %>
                <input type="radio" name="E30CONCOM" value="1" <%if(lnGenTran.getE30CONCOM().equals("1")) out.print("checked");%>>Sí 
                <input type="radio" name="E30CONCOM" value="N" <%if(lnGenTran.getE30CONCOM().equals("N")) out.print("checked");%>>No 
				<% } %>
            </td>
            
          </tr>
          <%
          }
          %> <%
		    if(!lnGenTran.getE30PDSC04().trim().equals("")){
		    	if (trType.compareTo("trclear") == 0) { trType = "trdark"; } else { trType = "trclear"; }
	      %> 
          <tr id="<%= trType %>"> 
            <td nowrap colspan="2"> 
              <div align="right"><%= lnGenTran.getE30PDSC04().trim()%> :</div>
            </td>
            <td nowrap colspan="3" width="56%"> 
              <input type="text" size="15" maxlength="13" name="E30PAMT04" value="<%= lnGenTran.getE30PAMT04().trim()%>" readonly>
            </td>
            <td nowrap colspan="2"> 
            	<div align="right">
	            	<% if(lnGenTran.getE30PDSC04().equals("TIMBRE FISCAL")) { 
	            		out.print("CONDONAR TIMBRE FISCAL :");
					} else if (lnGenTran.getE30PDSC04().equals("COMISION FLAT")) { 
						out.print("CONDONAR COMISION FLAT :");	
					} %>
            	</div>
            </td>
            <td nowrap colspan="3" width="56%"> 
            	<% if(lnGenTran.getE30PDSC04().equals("TIMBRE FISCAL")) { %>
                <input type="radio" name="E30CONTIM" value="1" <%if(lnGenTran.getE30CONTIM().equals("1")) out.print("checked");%>>Sí 
                <input type="radio" name="E30CONTIM" value="N" <%if(lnGenTran.getE30CONTIM().equals("N")) out.print("checked");%>>No 
				<% } else if (lnGenTran.getE30PDSC04().equals("COMISION FLAT")) { %>
                <input type="radio" name="E30CONCOM" value="1" <%if(lnGenTran.getE30CONCOM().equals("1")) out.print("checked");%>>Sí 
                <input type="radio" name="E30CONCOM" value="N" <%if(lnGenTran.getE30CONCOM().equals("N")) out.print("checked");%>>No 
				<% } %>
            </td>
            
          </tr>
          <%
          }
          %> <%
		     if(!lnGenTran.getE30PDSC05().trim().equals("")){
		     	if (trType.compareTo("trclear") == 0) { trType = "trdark"; } else { trType = "trclear"; }
		    %> 
          <tr id="<%= trType %>"> 
            <td nowrap colspan="2"> 
              <div align="right"><%= lnGenTran.getE30PDSC05().trim()%> :</div>
            </td>
            <td nowrap colspan="3" width="56%"> 
              <input type="text" size="15" maxlength="13" name="E30PAMT05" value="<%= lnGenTran.getE30PAMT05().trim()%>" readonly>
            </td>
            <td nowrap colspan="2"> 
            	<div align="right">
	            	<% if(lnGenTran.getE30PDSC05().equals("TIMBRE FISCAL")) { 
	            		out.print("CONDONAR TIMBRE FISCAL :");
					} else if (lnGenTran.getE30PDSC05().equals("COMISION FLAT")) { 
						out.print("CONDONAR COMISION FLAT :");	
					} %>
            	</div>
            </td>
            <td nowrap colspan="3" width="56%"> 
            	<% if(lnGenTran.getE30PDSC05().equals("TIMBRE FISCAL")) { %>
                <input type="radio" name="E30CONTIM" value="1" <%if(lnGenTran.getE30CONTIM().equals("1")) out.print("checked");%>>Sí 
                <input type="radio" name="E30CONTIM" value="N" <%if(lnGenTran.getE30CONTIM().equals("N")) out.print("checked");%>>No 
				<% } else if (lnGenTran.getE30PDSC05().equals("COMISION FLAT")) { %>
                <input type="radio" name="E30CONCOM" value="1" <%if(lnGenTran.getE30CONCOM().equals("1")) out.print("checked");%>>Sí 
                <input type="radio" name="E30CONCOM" value="N" <%if(lnGenTran.getE30CONCOM().equals("N")) out.print("checked");%>>No 
				<% } %>
            </td>
            
          </tr>
          <%
          }
          %> <%
		     if(!lnGenTran.getE30PDSC06().trim().equals("")){
		     	if (trType.compareTo("trclear") == 0) { trType = "trdark"; } else { trType = "trclear"; }
		    %> 
          <tr id="<%= trType %>"> 
            <td nowrap colspan="2"> 
              <div align="right"><%= lnGenTran.getE30PDSC06().trim()%> :</div>
            </td>
            <td nowrap colspan="3" width="56%"> 
              <input type="text" size="15" maxlength="13" name="E30PAMT06" value="<%= lnGenTran.getE30PAMT06().trim()%>" readonly>
            </td>
            <td nowrap colspan="2"> 
            	<div align="right">
	            	<% if(lnGenTran.getE30PDSC06().equals("TIMBRE FISCAL")) { 
	            		out.print("CONDONAR TIMBRE FISCAL :");
					} else if (lnGenTran.getE30PDSC06().equals("COMISION FLAT")) { 
						out.print("CONDONAR COMISION FLAT :");	
					} %>
            	</div>
            </td>
            <td nowrap colspan="3" width="56%"> 
            	<% if(lnGenTran.getE30PDSC06().equals("TIMBRE FISCAL")) { %>
                <input type="radio" name="E30CONTIM" value="1" <%if(lnGenTran.getE30CONTIM().equals("1")) out.print("checked");%>>Sí 
                <input type="radio" name="E30CONTIM" value="N" <%if(lnGenTran.getE30CONTIM().equals("N")) out.print("checked");%>>No 
				<% } else if (lnGenTran.getE30PDSC06().equals("COMISION FLAT")) { %>
                <input type="radio" name="E30CONCOM" value="1" <%if(lnGenTran.getE30CONCOM().equals("1")) out.print("checked");%>>Sí 
                <input type="radio" name="E30CONCOM" value="N" <%if(lnGenTran.getE30CONCOM().equals("N")) out.print("checked");%>>No 
				<% } %>
            </td>
            
          </tr>
          <%
          }
          %> <%
		     if(!lnGenTran.getE30PDSC07().trim().equals("")){
		     	if (trType.compareTo("trclear") == 0) { trType = "trdark"; } else { trType = "trclear"; }
	   	 %> 
          <tr id="<%= trType %>"> 
            <td nowrap colspan="2" height="20"> 
              <div align="right"><%= lnGenTran.getE30PDSC07().trim()%> :</div>
            </td>
            <td nowrap colspan="3" width="56%" height="20"> 
              <input type="text" size="15" maxlength="13" name="E30PAMT07" value="<%= lnGenTran.getE30PAMT07().trim()%>" readonly>
            </td>
            <td nowrap colspan="2"> 
            	<div align="right">
	            	<% if(lnGenTran.getE30PDSC07().equals("TIMBRE FISCAL")) { 
	            		out.print("CONDONAR TIMBRE FISCAL :");
					} else if (lnGenTran.getE30PDSC07().equals("COMISION FLAT")) { 
						out.print("CONDONAR COMISION FLAT :");	
					} %>
            	</div>
            </td>
            <td nowrap colspan="3" width="56%"> 
            	<% if(lnGenTran.getE30PDSC07().equals("TIMBRE FISCAL")) { %>
                <input type="radio" name="E30CONTIM" value="1" <%if(lnGenTran.getE30CONTIM().equals("1")) out.print("checked");%>>Sí 
                <input type="radio" name="E30CONTIM" value="N" <%if(lnGenTran.getE30CONTIM().equals("N")) out.print("checked");%>>No 
				<% } else if (lnGenTran.getE30PDSC07().equals("COMISION FLAT")) { %>
                <input type="radio" name="E30CONCOM" value="1" <%if(lnGenTran.getE30CONCOM().equals("1")) out.print("checked");%>>Sí 
                <input type="radio" name="E30CONCOM" value="N" <%if(lnGenTran.getE30CONCOM().equals("N")) out.print("checked");%>>No 
				<% } %>
            </td>
            
          </tr>
          <%
          }
          %> <%
		      if(!lnGenTran.getE30PDSC08().trim().equals("")){
		      	  if (trType.compareTo("trclear") == 0) { trType = "trdark"; } else { trType = "trclear"; }
		    %> 
          <tr id="<%= trType %>"> 
            <td nowrap colspan="2"> 
              <div align="right"><%= lnGenTran.getE30PDSC08().trim()%> :</div>
            </td>
            <td nowrap colspan="3" width="56%"> 
              <input type="text" size="15" maxlength="13" name="E30PAMT08" value="<%= lnGenTran.getE30PAMT08().trim()%>" readonly>
            </td>
            <td nowrap colspan="2"> 
            	<div align="right">
	            	<% if(lnGenTran.getE30PDSC08().equals("TIMBRE FISCAL")) { 
	            		out.print("CONDONAR TIMBRE FISCAL :");
					} else if (lnGenTran.getE30PDSC08().equals("COMISION FLAT")) { 
						out.print("CONDONAR COMISION FLAT :");	
					} %>
            	</div>
            </td>
            <td nowrap colspan="3" width="56%"> 
            	<% if(lnGenTran.getE30PDSC08().equals("TIMBRE FISCAL")) { %>
                <input type="radio" name="E30CONTIM" value="1" <%if(lnGenTran.getE30CONTIM().equals("1")) out.print("checked");%>>Sí 
                <input type="radio" name="E30CONTIM" value="N" <%if(lnGenTran.getE30CONTIM().equals("N")) out.print("checked");%>>No 
				<% } else if (lnGenTran.getE30PDSC08().equals("COMISION FLAT")) { %>
                <input type="radio" name="E30CONCOM" value="1" <%if(lnGenTran.getE30CONCOM().equals("1")) out.print("checked");%>>Sí 
                <input type="radio" name="E30CONCOM" value="N" <%if(lnGenTran.getE30CONCOM().equals("N")) out.print("checked");%>>No 
				<% } %>
            </td>
            
          </tr>
          <%
          }
          %> <%
		     if(!lnGenTran.getE30PDSC09().trim().equals("")){
		     	if (trType.compareTo("trclear") == 0) { trType = "trdark"; } else { trType = "trclear"; }
		    %> 
          <tr id="<%= trType %>"> 
            <td nowrap colspan="2"> 
              <div align="right"><%= lnGenTran.getE30PDSC09().trim()%> :</div>
            </td>
            <td nowrap colspan="3" width="56%"> 
              <input type="text" size="15" maxlength="13" name="E30PAMT09" value="<%= lnGenTran.getE30PAMT09().trim()%>" readonly>
            </td>
            <td nowrap colspan="2"> 
            	<div align="right">
	            	<% if(lnGenTran.getE30PDSC09().equals("TIMBRE FISCAL")) { 
	            		out.print("CONDONAR TIMBRE FISCAL :");
					} else if (lnGenTran.getE30PDSC09().equals("COMISION FLAT")) { 
						out.print("CONDONAR COMISION FLAT :");	
					} %>
            	</div>
            </td>
            <td nowrap colspan="3" width="56%"> 
            	<% if(lnGenTran.getE30PDSC09().equals("TIMBRE FISCAL")) { %>
                <input type="radio" name="E30CONTIM" value="1" <%if(lnGenTran.getE30CONTIM().equals("1")) out.print("checked");%>>Sí 
                <input type="radio" name="E30CONTIM" value="N" <%if(lnGenTran.getE30CONTIM().equals("N")) out.print("checked");%>>No 
				<% } else if (lnGenTran.getE30PDSC09().equals("COMISION FLAT")) { %>
                <input type="radio" name="E30CONCOM" value="1" <%if(lnGenTran.getE30CONCOM().equals("1")) out.print("checked");%>>Sí 
                <input type="radio" name="E30CONCOM" value="N" <%if(lnGenTran.getE30CONCOM().equals("N")) out.print("checked");%>>No 
				<% } %>
            </td>
            
          </tr>
          <%
          }
          %> <%
		      if(!lnGenTran.getE30PDSC10().trim().equals("")){
		      	  if (trType.compareTo("trclear") == 0) { trType = "trdark"; } else { trType = "trclear"; }
		    %> 
          <tr id="<%= trType %>"> 
            <td nowrap colspan="2"> 
              <div align="right"><%= lnGenTran.getE30PDSC10().trim()%> :</div>
            </td>
            <td nowrap colspan="3" width="56%"> 
              <input type="text" size="15" maxlength="13" name="E30PAMT10" value="<%= lnGenTran.getE30PAMT10().trim()%>" readonly>
            </td>
            <td nowrap colspan="2"> 
            	<div align="right">
	            	<% if(lnGenTran.getE30PDSC10().equals("TIMBRE FISCAL")) { 
	            		out.print("CONDONAR TIMBRE FISCAL :");
					} else if (lnGenTran.getE30PDSC10().equals("COMISION FLAT")) { 
						out.print("CONDONAR COMISION FLAT :");	
					} %>
            	</div>
            </td>
            <td nowrap colspan="3" width="56%"> 
            	<% if(lnGenTran.getE30PDSC10().equals("TIMBRE FISCAL")) { %>
                <input type="radio" name="E30CONTIM" value="1" <%if(lnGenTran.getE30CONTIM().equals("1")) out.print("checked");%>>Sí 
                <input type="radio" name="E30CONTIM" value="N" <%if(lnGenTran.getE30CONTIM().equals("N")) out.print("checked");%>>No 
				<% } else if (lnGenTran.getE30PDSC10().equals("COMISION FLAT")) { %>
                <input type="radio" name="E30CONCOM" value="1" <%if(lnGenTran.getE30CONCOM().equals("1")) out.print("checked");%>>Sí 
                <input type="radio" name="E30CONCOM" value="N" <%if(lnGenTran.getE30CONCOM().equals("N")) out.print("checked");%>>No 
				<% } %>
            </td>
            
          </tr>
          <%
          }
          %> <%
		     if(!lnGenTran.getE30PDSC11().trim().equals("")){
		     	if (trType.compareTo("trclear") == 0) { trType = "trdark"; } else { trType = "trclear"; }
		   %> 
          <tr id="<%= trType %>"> 
            <td nowrap colspan="2"> 
              <div align="right"><%= lnGenTran.getE30PDSC11().trim()%> :</div>
            </td>
            <td nowrap colspan="3" width="56%"> 
              <input type="text" size="15" maxlength="13" name="E30PAMT11" value="<%= lnGenTran.getE30PAMT11().trim()%>" readonly>
            </td>
            <td nowrap colspan="2"> 
            	<div align="right">
	            	<% if(lnGenTran.getE30PDSC11().equals("TIMBRE FISCAL")) { 
	            		out.print("CONDONAR TIMBRE FISCAL :");
					} else if (lnGenTran.getE30PDSC11().equals("COMISION FLAT")) { 
						out.print("CONDONAR COMISION FLAT :");	
					} %>
            	</div>
            </td>
            <td nowrap colspan="3" width="56%"> 
            	<% if(lnGenTran.getE30PDSC11().equals("TIMBRE FISCAL")) { %>
                <input type="radio" name="E30CONTIM" value="1" <%if(lnGenTran.getE30CONTIM().equals("1")) out.print("checked");%>>Sí 
                <input type="radio" name="E30CONTIM" value="N" <%if(lnGenTran.getE30CONTIM().equals("N")) out.print("checked");%>>No 
				<% } else if (lnGenTran.getE30PDSC11().equals("COMISION FLAT")) { %>
                <input type="radio" name="E30CONCOM" value="1" <%if(lnGenTran.getE30CONCOM().equals("1")) out.print("checked");%>>Sí 
                <input type="radio" name="E30CONCOM" value="N" <%if(lnGenTran.getE30CONCOM().equals("N")) out.print("checked");%>>No 
				<% } %>
            </td>
            
          </tr>
          <%
          }
          %> <%
		     if(!lnGenTran.getE30PDSC12().trim().equals("")){
		     	if (trType.compareTo("trclear") == 0) { trType = "trdark"; } else { trType = "trclear"; }
	   	 %> 
          <tr id="<%= trType %>"> 
            <td nowrap colspan="2"> 
              <div align="right"><%= lnGenTran.getE30PDSC12().trim()%> :</div>
            </td>
            <td nowrap colspan="3" width="56%"> 
              <input type="text" size="15" maxlength="13" name="E30PAMT12" value="<%= lnGenTran.getE30PAMT12().trim()%>" readonly>
            </td>
            <td nowrap colspan="2"> 
            	<div align="right">
	            	<% if(lnGenTran.getE30PDSC12().equals("TIMBRE FISCAL")) { 
	            		out.print("CONDONAR TIMBRE FISCAL :");
					} else if (lnGenTran.getE30PDSC12().equals("COMISION FLAT")) { 
						out.print("CONDONAR COMISION FLAT :");	
					} %>
            	</div>
            </td>
            <td nowrap colspan="3" width="56%"> 
            	<% if(lnGenTran.getE30PDSC12().equals("TIMBRE FISCAL")) { %>
                <input type="radio" name="E30CONTIM" value="1" <%if(lnGenTran.getE30CONTIM().equals("1")) out.print("checked");%>>Sí 
                <input type="radio" name="E30CONTIM" value="N" <%if(lnGenTran.getE30CONTIM().equals("N")) out.print("checked");%>>No 
				<% } else if (lnGenTran.getE30PDSC12().equals("COMISION FLAT")) { %>
                <input type="radio" name="E30CONCOM" value="1" <%if(lnGenTran.getE30CONCOM().equals("1")) out.print("checked");%>>Sí 
                <input type="radio" name="E30CONCOM" value="N" <%if(lnGenTran.getE30CONCOM().equals("N")) out.print("checked");%>>No 
				<% } %>
            </td>
            
          </tr>
          <%
           }
          %> <%
		     if(!lnGenTran.getE30PDSC13().trim().equals("")){
		     	if (trType.compareTo("trclear") == 0) { trType = "trdark"; } else { trType = "trclear"; }
		   %> 
          <tr id="<%= trType %>"> 
            <td nowrap colspan="2"> 
              <div align="right"><%= lnGenTran.getE30PDSC13().trim()%> :</div>
            </td>
            <td nowrap colspan="3" width="56%"> 
              <input type="text" size="15" maxlength="13" name="E30PAMT13" value="<%= lnGenTran.getE30PAMT13().trim()%>" readonly>
            </td>
            <td nowrap colspan="2"> 
            	<div align="right">
	            	<% if(lnGenTran.getE30PDSC13().equals("TIMBRE FISCAL")) { 
	            		out.print("CONDONAR TIMBRE FISCAL :");
					} else if (lnGenTran.getE30PDSC13().equals("COMISION FLAT")) { 
						out.print("CONDONAR COMISION FLAT :");	
					} %>
            	</div>
            </td>
            <td nowrap colspan="3" width="56%"> 
            	<% if(lnGenTran.getE30PDSC13().equals("TIMBRE FISCAL")) { %>
                <input type="radio" name="E30CONTIM" value="1" <%if(lnGenTran.getE30CONTIM().equals("1")) out.print("checked");%>>Sí 
                <input type="radio" name="E30CONTIM" value="N" <%if(lnGenTran.getE30CONTIM().equals("N")) out.print("checked");%>>No 
				<% } else if (lnGenTran.getE30PDSC13().equals("COMISION FLAT")) { %>
                <input type="radio" name="E30CONCOM" value="1" <%if(lnGenTran.getE30CONCOM().equals("1")) out.print("checked");%>>Sí 
                <input type="radio" name="E30CONCOM" value="N" <%if(lnGenTran.getE30CONCOM().equals("N")) out.print("checked");%>>No 
				<% } %>
            </td>
            
          </tr>
          <%
          }
          %> <%
		    if(!lnGenTran.getE30PDSC14().trim().equals("")){
		    	if (trType.compareTo("trclear") == 0) { trType = "trdark"; } else { trType = "trclear"; }
	      %> 
          <tr id="<%= trType %>"> 
            <td nowrap colspan="2"> 
              <div align="right"><%= lnGenTran.getE30PDSC14().trim()%> :</div>
            </td>
            <td nowrap colspan="3" width="56%"> 
              <input type="text" size="15" maxlength="13" name="E30PAMT14" value="<%= lnGenTran.getE30PAMT14().trim()%>" readonly>
            </td>
            <td nowrap colspan="2"> 
            	<div align="right">
	            	<% if(lnGenTran.getE30PDSC14().equals("TIMBRE FISCAL")) { 
	            		out.print("CONDONAR TIMBRE FISCAL :");
					} else if (lnGenTran.getE30PDSC14().equals("COMISION FLAT")) { 
						out.print("CONDONAR COMISION FLAT :");	
					} %>
            	</div>
            </td>
            <td nowrap colspan="3" width="56%"> 
            	<% if(lnGenTran.getE30PDSC14().equals("TIMBRE FISCAL")) { %>
                <input type="radio" name="E30CONTIM" value="1" <%if(lnGenTran.getE30CONTIM().equals("1")) out.print("checked");%>>Sí 
                <input type="radio" name="E30CONTIM" value="N" <%if(lnGenTran.getE30CONTIM().equals("N")) out.print("checked");%>>No 
				<% } else if (lnGenTran.getE30PDSC14().equals("COMISION FLAT")) { %>
                <input type="radio" name="E30CONCOM" value="1" <%if(lnGenTran.getE30CONCOM().equals("1")) out.print("checked");%>>Sí 
                <input type="radio" name="E30CONCOM" value="N" <%if(lnGenTran.getE30CONCOM().equals("N")) out.print("checked");%>>No 
				<% } %>
            </td>
            
          </tr>
          <%
          }
          %> <%
		     if(!lnGenTran.getE30PDSC15().trim().equals("")){
		     	if (trType.compareTo("trclear") == 0) { trType = "trdark"; } else { trType = "trclear"; }
		   %> 
          <tr id="<%= trType %>"> 
            <td nowrap colspan="2"> 
              <div align="right"><%= lnGenTran.getE30PDSC15().trim()%> :</div>
            </td>
            <td nowrap colspan="3" width="56%"> 
              <input type="text" size="15" maxlength="13" name="E30PAMT15" value="<%= lnGenTran.getE30PAMT15().trim()%>" readonly>
            </td>
            <td nowrap colspan="2"> 
            	<div align="right">
	            	<% if(lnGenTran.getE30PDSC15().equals("TIMBRE FISCAL")) { 
	            		out.print("CONDONAR TIMBRE FISCAL :");
					} else if (lnGenTran.getE30PDSC15().equals("COMISION FLAT")) { 
						out.print("CONDONAR COMISION FLAT :");	
					} %>
            	</div>
            </td>
            <td nowrap colspan="3" width="56%"> 
            	<% if(lnGenTran.getE30PDSC15().equals("TIMBRE FISCAL")) { %>
                <input type="radio" name="E30CONTIM" value="1" <%if(lnGenTran.getE30CONTIM().equals("1")) out.print("checked");%>>Sí 
                <input type="radio" name="E30CONTIM" value="N" <%if(lnGenTran.getE30CONTIM().equals("N")) out.print("checked");%>>No 
				<% } else if (lnGenTran.getE30PDSC15().equals("COMISION FLAT")) { %>
                <input type="radio" name="E30CONCOM" value="1" <%if(lnGenTran.getE30CONCOM().equals("1")) out.print("checked");%>>Sí 
                <input type="radio" name="E30CONCOM" value="N" <%if(lnGenTran.getE30CONCOM().equals("N")) out.print("checked");%>>No 
				<% } %>
            </td>
            
          </tr>
          <%
		     if (trType.compareTo("trclear") == 0) { trType = "trdark"; } else { trType = "trclear"; }
		    %> 
          <tr id="<%= trType %>"> 
            <td nowrap colspan="2">&nbsp;</td>
            <td nowrap colspan="3" width="56%">&nbsp;</td>
            <td nowrap colspan="2"> 
            </td>
            <td nowrap colspan="3" width="56%"> 
            </td>
            
          </tr>
          <%
		     }
		     if (trType.compareTo("trclear") == 0) { trType = "trdark"; } else { trType = "trclear"; }
		    %> 
          <tr id="<%= trType %>"> 
            <td nowrap colspan="2"> 
              <div align="right" style="font-weight:  bold;">Monto Neto(Desembolso) :</div>
            </td>
            <td nowrap colspan="3" width="56%"> 
              <input type="text" size="15" maxlength="13" name="E30TRNTOT" value="<%= lnGenTran.getE30TRNTOT().trim()%>" readonly>
            </td>
            <td nowrap colspan="2"> 
              <div align="right" style="font-weight:  bold;">Saldo(Desembolso) :</div>
            </td>
            <td nowrap colspan="3" width="56%"> 
				<eibsinput:text property="SALNET" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <br> 
  <!-- Desembolso -->
  <% session.setAttribute("EMPDS","S"); %>
  <input type="hidden" name="DSTOT" id="DSTOT" value="0">
  <input type="hidden" name="DSGMF" id="DSGMF" value="0">
  <iframe id="ifrempds" frameborder="0" scrolling="no" height="200" width="100%" 
  src="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1100?SCREEN=101&ACT=S&E01PVBCUN=<%=lnGenTran.getE30PVDCUN().trim()%>&E01PVBNUM=<%=lnGenTran.getE30PVDNUM().trim()%>&prdCode=<%=lnGenTran.getE30DEAPRO().trim()%>"></iframe>  
  
   
  <p align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </p>
  </form>
  
  <script type="text/javascript">
  	function updateDist(sec){
  		<%-- Function is called from Iframe ("Cargos, Seguros, etc"--%>
		<%-- Updates Field Element Values in Distribution Section. --%>
  		var netAmt = parseFloat('${lnGenTran.E30TRNTOT}');
  		// Desembolso
		if (sec == "DS") {
			if (isValidObject(getElement("DSTOT")) && isValidObject(getElement("SALNET"))) {
				total =  netAmt - parseFloat((document.forms[0].DSTOT.value)); 
				document.forms[0].SALNET.value = formatCCY(total);
			}
		}
  	}
  </script>
</body>
</html>
