<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>
Proyección Estados Financieros
</TITLE>

<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="Edp075501" class="datapro.eibs.beans.EDP075501Message" scope="session" />
<jsp:useBean id= "optList" class= "datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id= "grpList" class= "datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id= "accList" class= "datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="mL0730" class="datapro.eibs.beans.EDP073001Message" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
%>
<script type="text/javascript">

function goUpdVal(){
	document.forms[0].SCREEN.value=500;
	document.forms[0].NEXT.value='';
	document.forms[0].submit();	 
}

function goNext(){
    nextRegister();
    if ( !ok ) {
	    alert("Debe indicar porcentajes de proyeccion para el último periodo proyectado.");
		return;	 
	}
	document.forms[0].SCREEN.value=500;
	document.forms[0].NEXT.value='1';
	document.forms[0].submit();	 
}

function updPercent1(val,val1){
//   var vlr = document.getElementsByName(val.name)[0];
//	var prc = document.getElementsByName(val.name.substring(4))[0];
//	var v1 = parseFloat(val1.split(',').join(''));
//	var v2 = parseFloat(vlr.value.split(',').join(''));
//	if(v1 > 0 && v2 > 0)
//		prc.value = preciseRound(((v2/v1)-1)*100,2);
//	else
//		prc.value = 0; 	
}

function updPercent(val,val2){
//    var vlr = document.getElementsByName(val.name)[0];
//    var prc = document.getElementsByName(val.name.substring(4))[0];
//    var pVlr = document.getElementsByName(val2)[0];
//	var pPrc = document.getElementsByName(val2.substring(4))[0];
//	var v1 = parseFloat(pVlr.value.split(',').join(''));
//	var v2 = parseFloat(vlr.value.split(',').join(''));
//	if(v1 > 0 && v2 > 0)
//		prc.value = preciseRound((1 - (v1/v2))*100,2);
//	else
//		prc.value = 0;
}
    function preciseRound(num,decimals){
		return Math.round(num*Math.pow(10,decimals))/Math.pow(10,decimals);
	}
	
	function nextRegister(){
	   ok = false;
	   var count  = "<%=session.getAttribute("countProjection")%>";
	   var lim = document.forms[0].RECNUM.value;
	  for(n=1;n<lim;n++) {
	 	 if(document.getElementsByName("E01DPPRJ"+count+n)[0] != null || 
	 	    document.getElementsByName("E01DPPRJ"+count+n)[0] != undefined ) {
	 	      if(document.getElementsByName("E01DPPRJ"+count+n)[0].value != isNaN("0")) {
			    ok = true;
				break;
			  }
      	 }
      }
    }
	
	
</script>

</HEAD>
<% int cp = 3;
	try{
		cp = Integer.valueOf(String.valueOf(session.getAttribute("countProjection")));
	} catch(Exception e){}%>
<BODY>

<h3 align="center">Proyección Estados Financieros<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="EDP0755_client_financial_proj_main.jsp,EDP0755"></h3>
<h3 align="center"> <%=userPO.getHeader20()%> </h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.creditproposal.JSEDP0755">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="500"> 
<INPUT TYPE=HIDDEN NAME="NEXT" VALUE=""> 

<table class="tableinfo">    
 <TR > 
  <TD NOWRAP >
   <TABLE id="headTable" width="100%" cellpading=0 cellspacing=0>
    <tr id="trdark"> 
      <td align="right"  >
         <b>Cliente :</b>
      </td>
      <td nowrap > 
         <input type="text" name="E01IFMCUN" size="12" readonly value="<%=userPO.getHeader1()%>">
      </td>
      <td align="right"  >
         <b>Nombre :</b>
      </td>
      <td nowrap colspan=3> 
         <input type="text" name="NAMECUM" size="45" readonly value="<%=userPO.getHeader2()%>">
      </td>         
    </tr> 
  </table> 
 </td>        
 </tr>  
</table>
  <table class="tbenter" width=100% align=center>
    <tr> 
      <td class=TDBKG width="50%"> 
        <div align="center"><a href="javascript:goNext()"><b>Adicionar<br>Siguiente Periodo</b></a></div>
      </td>
      <td class=TDBKG width="50%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </td>
    </tr>
  </table>
  <br>
  
<%
   optList.initRow();
   int k=0;
   int h=0;
   while (optList.getNextRow()) {
      if (optList.getFlag().equals("")) {
%>
	  <H4><%=optList.getRecord(0)%></H4>
      <TABLE  class="tableinfo" BORDER=1>
          <tr id="trdark"> 
	 		<input type=HIDDEN name="E01IFMFEY" value="<%= Edp075501.getE01IFMFEY().trim()%>">
	 		<input type=HIDDEN name="E01IFMFEM" value="<%= Edp075501.getE01IFMFEM().trim()%>">
	 		<input type=HIDDEN name="E01IFMFED" value="<%= Edp075501.getE01IFMFED().trim()%>">
	 		<input type=HIDDEN name="E01DPPFY1" value="<%= Edp075501.getE01DPPFY1().trim()%>">
	 		<input type=HIDDEN name="E01DPPFY2" value="<%= Edp075501.getE01DPPFY2().trim()%>">
	 		<input type=HIDDEN name="E01DPPFY3" value="<%= Edp075501.getE01DPPFY3().trim()%>">
	 		<input type=HIDDEN name="E01DPPFM1" value="<%= Edp075501.getE01DPPFM1().trim()%>">
	 		<input type=HIDDEN name="E01DPPFM2" value="<%= Edp075501.getE01DPPFM2().trim()%>">
	 		<input type=HIDDEN name="E01DPPFM3" value="<%= Edp075501.getE01DPPFM3().trim()%>">
<%-- 	 	
			<input type=HIDDEN name="E01DPPFY4" value="<%= Edp075501.getE01DPPFY4().trim()%>">
	 		<input type=HIDDEN name="E01DPPFY5" value="<%= Edp075501.getE01DPPFY5().trim()%>">
	 		<input type=HIDDEN name="E01DPPFY6" value="<%= Edp075501.getE01DPPFY6().trim()%>">
	 		<input type=HIDDEN name="E01DPPFY7" value="<%= Edp075501.getE01DPPFY7().trim()%>">
	 		<input type=HIDDEN name="E01DPPFY8" value="<%= Edp075501.getE01DPPFY8().trim()%>">
	 		<input type=HIDDEN name="E01DPPFY9" value="<%= Edp075501.getE01DPPFY9().trim()%>">
	 		<input type=HIDDEN name="E01DPPFY10" value="<%= Edp075501.getE01DPPFY10().trim()%>">
	 		<input type=HIDDEN name="E01DPPFY11" value="<%= Edp075501.getE01DPPFY11().trim()%>">
	 		<input type=HIDDEN name="E01DPPFY12" value="<%= Edp075501.getE01DPPFY12().trim()%>">
	 		<input type=HIDDEN name="E01DPPFY13" value="<%= Edp075501.getE01DPPFY13().trim()%>">
	 		<input type=HIDDEN name="E01DPPFY14" value="<%= Edp075501.getE01DPPFY14().trim()%>">
	 		<input type=HIDDEN name="E01DPPFY15" value="<%= Edp075501.getE01DPPFY15().trim()%>">
	 		<input type=HIDDEN name="E01DPPFY16" value="<%= Edp075501.getE01DPPFY16().trim()%>">
	 		<input type=HIDDEN name="E01DPPFY17" value="<%= Edp075501.getE01DPPFY17().trim()%>">
	 		<input type=HIDDEN name="E01DPPFY18" value="<%= Edp075501.getE01DPPFY18().trim()%>">
	 		<input type=HIDDEN name="E01DPPFY19" value="<%= Edp075501.getE01DPPFY19().trim()%>">
	 		<input type=HIDDEN name="E01DPPFY20" value="<%= Edp075501.getE01DPPFY20().trim()%>">
	 		<input type=HIDDEN name="E01DPPFM4" value="<%= Edp075501.getE01DPPFM4().trim()%>">
	 		<input type=HIDDEN name="E01DPPFM5" value="<%= Edp075501.getE01DPPFM5().trim()%>">
	 		<input type=HIDDEN name="E01DPPFM6" value="<%= Edp075501.getE01DPPFM6().trim()%>">
	 		<input type=HIDDEN name="E01DPPFM7" value="<%= Edp075501.getE01DPPFM7().trim()%>">
	 		<input type=HIDDEN name="E01DPPFM8" value="<%= Edp075501.getE01DPPFM8().trim()%>">
	 		<input type=HIDDEN name="E01DPPFM9" value="<%= Edp075501.getE01DPPFM9().trim()%>">
	 		<input type=HIDDEN name="E01DPPFM10" value="<%= Edp075501.getE01DPPFM10().trim()%>">
	 		<input type=HIDDEN name="E01DPPFM11" value="<%= Edp075501.getE01DPPFM11().trim()%>">
	 		<input type=HIDDEN name="E01DPPFM12" value="<%= Edp075501.getE01DPPFM12().trim()%>">
	 		<input type=HIDDEN name="E01DPPFM13" value="<%= Edp075501.getE01DPPFM13().trim()%>">
	 		<input type=HIDDEN name="E01DPPFM14" value="<%= Edp075501.getE01DPPFM14().trim()%>">
	 		<input type=HIDDEN name="E01DPPFM15" value="<%= Edp075501.getE01DPPFM15().trim()%>">
	 		<input type=HIDDEN name="E01DPPFM16" value="<%= Edp075501.getE01DPPFM16().trim()%>">
	 		<input type=HIDDEN name="E01DPPFM17" value="<%= Edp075501.getE01DPPFM17().trim()%>">
	 		<input type=HIDDEN name="E01DPPFM18" value="<%= Edp075501.getE01DPPFM18().trim()%>">
	 		<input type=HIDDEN name="E01DPPFM19" value="<%= Edp075501.getE01DPPFM19().trim()%>">
	 		<input type=HIDDEN name="E01DPPFM20" value="<%= Edp075501.getE01DPPFM20().trim()%>">
 --%>	 		<input type=HIDDEN name="E01IFMCFO" value="<%= Edp075501.getE01IFMCFO().trim()%>">
	 		<% if(request.getParameter("ANUALIZAR")!=null) {%>
	 			<input type=HIDDEN name="ANUALIZAR" value="<%= request.getParameter("ANUALIZAR")%>">
	 		<% } %>
	 		<th align=CENTER nowrap width="20%"> 
            	<div align="center">Descripción
            	</div>
            </th>
            <th align=CENTER nowrap width="10%"> 
            	<div align="center">Periodo<BR>
	            	<%=Edp075501.getE01IFMFY1().trim()%>/12
            	</div>
            </th>
            <th align=CENTER nowrap width="10%"> 
            	<div align="center">Periodo<BR>
	            	<%=Edp075501.getE01IFMFY2().trim()%>/12
            	</div>
            	</th>
             <th align=CENTER nowrap width="10%"> 
            	<div align="center">Periodo<BR>
	            	<%=Edp075501.getE01IFMFEY().trim()%>/
   		         	<%=Edp075501.getE01IFMFEM().trim()%>
            </th>
             <th align=CENTER nowrap width="8%"> 
            	<div align="center">% Proyec.<BR>
	            	<%=Edp075501.getE01DPPFY1().trim()%>/12
            	</div>
            </th>
             <th align=CENTER nowrap width="10%"> 
            	<div align="center">Vlr. Proyec.<BR>
	            	<%=Edp075501.getE01DPPFY1().trim()%>/12
            	</div>
            </th>
             <th align=CENTER nowrap width="8%"> 
            	<div align="center">% Proyec.<BR>
	            	<%=Edp075501.getE01DPPFY2().trim()%>/12
            	</div>
            </th>
             <th align=CENTER nowrap width="10%"> 
            	<div align="center">Vlr. Proyec.<BR>
	            	<%=Edp075501.getE01DPPFY2().trim()%>/12
            	</div>
            </th>
             <th align=CENTER nowrap width="8%"> 
            	<div align="center">% Proyec.<BR>
	            	<%=Edp075501.getE01DPPFY3().trim()%>/12
            	</div>
            </th>
             <th align=CENTER nowrap width="10%"> 
            	<div align="center">Vlr. Proyec.<BR>
	            	<%=Edp075501.getE01DPPFY3().trim()%>/12
            	</div>
            </th>
<%--          	<% if(cp>3) { %>
      	     <th align=CENTER nowrap width="8%"> 
            	<div align="center">% Proyec.<BR>
	            	<%=Edp075501.getE01DPPFY4().trim()%>/12
            	</div>
            </th>
            <th align=CENTER nowrap width="10%"> 
            	<div align="center">Vlr. Proyec.<BR>
	            	<%=Edp075501.getE01DPPFY4().trim()%>/12
            	</div>
            </th> 
            <%} %>
      		<% if(cp>4) { %>
      		<th align=CENTER nowrap width="8%"> 
            	<div align="center">% Proyec.<BR>
	            	<%=Edp075501.getE01DPPFY5().trim()%>/12
            	</div>
            </th>
             <th align=CENTER nowrap width="10%"> 
            	<div align="center">Vlr. Proyec.<BR>
	            	<%=Edp075501.getE01DPPFY5().trim()%>/12
            	</div>
            </th>
            <%} %>
      		<% if(cp>5) { %>
      		<th align=CENTER nowrap width="8%"> 
            	<div align="center">% Proyec.<BR>
	            	<%=Edp075501.getE01DPPFY6().trim()%>/12
            	</div>
            </th>
             <th align=CENTER nowrap width="10%"> 
            	<div align="center">Vlr. Proyec.<BR>
	            	<%=Edp075501.getE01DPPFY6().trim()%>/12
            	</div>
            </th>
            <%} %>
      		<% if(cp>6) { %>
      		<th align=CENTER nowrap width="8%"> 
            	<div align="center">% Proyec.<BR>
	            	<%=Edp075501.getE01DPPFY7().trim()%>/12
            	</div>
            </th>
             <th align=CENTER nowrap width="10%"> 
            	<div align="center">Vlr. Proyec.<BR>
	            	<%=Edp075501.getE01DPPFY7().trim()%>/12
            	</div>
            </th>
            <%} %>
      		<% if(cp>7) { %>
      		<th align=CENTER nowrap width="8%"> 
            	<div align="center">% Proyec.<BR>
	            	<%=Edp075501.getE01DPPFY8().trim()%>/12
            	</div>
            </th>
            <th align=CENTER nowrap width="10%"> 
            	<div align="center">Vlr. Proyec.<BR>
	            	<%=Edp075501.getE01DPPFY8().trim()%>/12
            	</div>
            </th>
            <%} %>
      		<% if(cp>8) { %>
      		<th align=CENTER nowrap width="8%"> 
            	<div align="center">% Proyec.<BR>
	            	<%=Edp075501.getE01DPPFY9().trim()%>/12
            	</div>
            </th>
            <th align=CENTER nowrap width="10%"> 
            	<div align="center">Vlr. Proyec.<BR>
	            	<%=Edp075501.getE01DPPFY9().trim()%>/12
            	</div>
            </th>
            <%} %>
      		<% if(cp>9) { %>
      		<th align=CENTER nowrap width="8%"> 
            	<div align="center">% Proyec.<BR>
	            	<%=Edp075501.getE01DPPFY10().trim()%>/12
            	</div>
            </th>
            <th align=CENTER nowrap width="10%"> 
            	<div align="center">Vlr. Proyec.<BR>
	            	<%=Edp075501.getE01DPPFY10().trim()%>/12
            	</div>
            </th>
            <%} %>
            <% if(cp>10) { %>
      		<th align=CENTER nowrap width="8%"> 
            	<div align="center">% Proyec.<BR>
	            	<%=Edp075501.getE01DPPFY11().trim()%>/12
	            </div>
            </th>
            <th align=CENTER nowrap width="10%"> 
            	<div align="center">Vlr. Proyec.<BR>
	            	<%=Edp075501.getE01DPPFY11().trim()%>/12
	            </div>
            </th>
            <%} %>
            <% if(cp>11) { %>
      		<th align=CENTER nowrap width="8%"> 
            	<div align="center">% Proyec.<BR>
	            	<%=Edp075501.getE01DPPFY12().trim()%>/12
	            </div>
            </th>
            <th align=CENTER nowrap width="10%"> 
            	<div align="center">Vlr. Proyec.<BR>
	            	<%=Edp075501.getE01DPPFY12().trim()%>/12
	            </div>
            </th>
            <%} %>
			<% if(cp>12) { %>
      		<th align=CENTER nowrap width="8%"> 
            	<div align="center">% Proyec.<BR>
	            	<%=Edp075501.getE01DPPFY13().trim()%>/12
	            </div>
            </th>
            <th align=CENTER nowrap width="10%"> 
            	<div align="center">Vlr. Proyec.<BR>
	            	<%=Edp075501.getE01DPPFY13().trim()%>/12
	            </div>
            </th>
            <%} %>
            <% if(cp>13) { %>
      		<th align=CENTER nowrap width="8%"> 
            	<div align="center">% Proyec.<BR>
	            	<%=Edp075501.getE01DPPFY14().trim()%>/12
	            </div>
            </th>
            <th align=CENTER nowrap width="10%"> 
            	<div align="center">Vlr. Proyec.<BR>
	            	<%=Edp075501.getE01DPPFY14().trim()%>/12
	            </div>
            </th>
            <%} %>
			<% if(cp>14) { %>
      		<th align=CENTER nowrap width="8%"> 
            	<div align="center">% Proyec.<BR>
	            	<%=Edp075501.getE01DPPFY15().trim()%>/12
	            </div>
            </th>
            <th align=CENTER nowrap width="10%"> 
            	<div align="center">Vlr. Proyec.<BR>
	            	<%=Edp075501.getE01DPPFY15().trim()%>/12
	            </div>
            </th>
            <%} %>
            <% if(cp>15) { %>
      		<th align=CENTER nowrap width="8%"> 
            	<div align="center">% Proyec.<BR>
	            	<%=Edp075501.getE01DPPFY16().trim()%>/12
	            </div>
            </th>
            <th align=CENTER nowrap width="10%"> 
            	<div align="center">Vlr. Proyec.<BR>
	            	<%=Edp075501.getE01DPPFY16().trim()%>/12
	            </div>
            </th>
            <%} %>
			<% if(cp>16) { %>
      		<th align=CENTER nowrap width="8%"> 
            	<div align="center">% Proyec.<BR>
	            	<%=Edp075501.getE01DPPFY17().trim()%>/12
	            </div>
            </th>
            <th align=CENTER nowrap width="10%"> 
            	<div align="center">Vlr. Proyec.<BR>
	            	<%=Edp075501.getE01DPPFY17().trim()%>/12
	            </div>
            </th>
            <%} %>
           <% if(cp>17) { %>
      		<th align=CENTER nowrap width="8%"> 
            	<div align="center">% Proyec.<BR>
	            	<%=Edp075501.getE01DPPFY18().trim()%>/12
	            </div>
            </th>
            <th align=CENTER nowrap width="10%"> 
            	<div align="center">Vlr. Proyec.<BR>
	            	<%=Edp075501.getE01DPPFY18().trim()%>/12
	            </div>
            </th>
            <%} %>
			<% if(cp>18) { %>
      		<th align=CENTER nowrap width="8%"> 
            	<div align="center">% Proyec.<BR>
	            	<%=Edp075501.getE01DPPFY19().trim()%>/12
	            </div>
            </th>
            <th align=CENTER nowrap width="10%"> 
            	<div align="center">Vlr. Proyec.<BR>
	            	<%=Edp075501.getE01DPPFY19().trim()%>/12
	            </div>
            </th>
            <%} %>
            <% if(cp>19) { %>
      		<th align=CENTER nowrap width="8%"> 
            	<div align="center">% Proyec.<BR>
	            	<%=Edp075501.getE01DPPFY20().trim()%>/12
	            </div>
            </th>
            <th align=CENTER nowrap width="10%"> 
            	<div align="center">Vlr. Proyec.<BR>
	            	<%=Edp075501.getE01DPPFY20().trim()%>/12
	            </div>
            </th>
            <%} %>
--%>            
           </tr>
      <% 
        grpList.initRow();
        int j = 0;
        int chgGrp =0;
       %> 
      	   <% 
      	       accList.initRow();
               while (accList.getNextRow()) {
           %>
               <TR id=trclear>       			
	            <input type="HIDDEN" name="DPLGLN<%=j%>" value="<%=accList.getRecord(0)%>">
	            <input type="HIDDEN" name="E01DPXLID<%=j%>" value="<%=accList.getRecord(7)%>">
				<% if (accList.getRecord(7).equals("Titulo")) { %>
      			<TH ALIGN=LEFT width="20%"  NOWRAP><%= accList.getRecord(1) %> </TH>
      			<% } else { %>
					<% if(accList.getRecord(7).equals("Detalle")){%> 
      			<TD ALIGN=LEFT width="20%"  NOWRAP><%= accList.getRecord(1) %> </TD>      
	      			<% } else { %>
      			<TH ALIGN=LEFT width="20%"  NOWRAP><%= accList.getRecord(1) %> </TH>
      			<% } %>
      			<% } %>
				<% if (!accList.getRecord(7).equals("Titulo")) { %>
					<% if(accList.getRecord(7).equals("Detalle")){%> 
					<% java.math.BigDecimal d = new java.math.BigDecimal(String.valueOf(accList.getRecord(2).replaceAll(",",""))); 
					   if(request.getParameter("ANUALIZAR")!=null) {
					   		d = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   }
					%>
      			<TD ALIGN=RIGHT width="10%" NOWRAP><%= datapro.eibs.master.Util.fcolorCCY(accList.getRecord(8)) %></TD>
      			<TD ALIGN=RIGHT width="10%" NOWRAP><%= datapro.eibs.master.Util.fcolorCCY(accList.getRecord(9)) %></TD>
      			<TD ALIGN=RIGHT width="10%" NOWRAP><%= datapro.eibs.master.Util.fcolorCCY(d.toString()) %></TD>
      			<TD ALIGN=RIGHT width="8%" NOWRAP>
					<INPUT type="text" name="E01DPPRJ1<%=j%>" size="7" maxlength="6" value="<%=accList.getRecord(10)%>" onKeypress="enterDecimal(2)" style="text-align:right"
					<% if(userPO.getOption().equals("4")){out.print("readonly");}%> >
      			</TD>
      				<% d = new java.math.BigDecimal(String.valueOf(accList.getRecord(11).replaceAll(",",""))); 
					   if(request.getParameter("ANUALIZAR")!=null) {
					   		d = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   }
					%>
      			<TD ALIGN=RIGHT width="10%" NOWRAP>
      				<INPUT onkeyup="updPercent1(this,'<%=accList.getRecord(2).replaceAll(",","")%>');" type="text" name="VLR_E01DPPRJ1<%=j%>" size="12" maxlength="20" value="<%=d.toString()%>" onKeypress="enterDecimal(2)" style="text-align:right" <% if(userPO.getOption().equals("4")){out.print("readonly");}%> >
				</TD>
      			<TD ALIGN=RIGHT width="8%" NOWRAP>
					<INPUT type="text" name="E01DPPRJ2<%=j%>" size="7" maxlength="6" value="<%=accList.getRecord(12)%>" onKeypress="enterDecimal(2)" style="text-align:right"
					<% if(userPO.getOption().equals("4")){out.print("readonly");}%> >
      			</TD>
      			    <% d = new java.math.BigDecimal(String.valueOf(accList.getRecord(13).replaceAll(",",""))); 
					   if(request.getParameter("ANUALIZAR")!=null) {
					   		d = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   }
					%>
      			<TD ALIGN=RIGHT width="10%" NOWRAP>
      				<INPUT onkeyup="updPercent(this,'VLR_E01DPPRJ1<%=j%>');" type="text" name="VLR_E01DPPRJ2<%=j%>" size="12" maxlength="20" value="<%=d.toString()%>" onKeypress="enterDecimal(2)" style="text-align:right" <% if(userPO.getOption().equals("4")){out.print("readonly");}%> >
				</TD>
      			<TD ALIGN=RIGHT width="8%" NOWRAP>
					<INPUT type="text" name="E01DPPRJ3<%=j%>" size="7" maxlength="6" value="<%=accList.getRecord(14)%>" onKeypress="enterDecimal(2)" style="text-align:right"
					<% if(userPO.getOption().equals("4")){out.print("readonly");}%> >
      			</TD>
      			    <% d = new java.math.BigDecimal(String.valueOf(accList.getRecord(15).replaceAll(",",""))); 
					   if(request.getParameter("ANUALIZAR")!=null) {
					   		d = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   }
					%>
      			<TD ALIGN=RIGHT width="10%" NOWRAP>
      				<INPUT onkeyup="updPercent(this,'VLR_E01DPPRJ2<%=j%>');" type="text" name="VLR_E01DPPRJ3<%=j%>" size="12" maxlength="20" value="<%=d.toString()%>" onKeypress="enterDecimal(2)" style="text-align:right" <% if(userPO.getOption().equals("4")){out.print("readonly");}%> >
				</TD>
      			
      			<%if(cp>3) { %>
      			<TD ALIGN=RIGHT width="8%" NOWRAP>
					<INPUT type="text" name="E01DPPRJ4<%=j%>" size="7" maxlength="6" value="<%=accList.getRecord(16)%>" onKeypress="enterDecimal(2)" style="text-align:right"
					<% if(userPO.getOption().equals("4")){out.print("readonly");}%> >
      			</TD>
      			    <% d = new java.math.BigDecimal(String.valueOf(accList.getRecord(17).replaceAll(",",""))); 
					   if(request.getParameter("ANUALIZAR")!=null) {
					   		d = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   }
					%>
      			<TD ALIGN=RIGHT width="10%" NOWRAP>
      				<INPUT onkeyup="updPercent(this,'VLR_E01DPPRJ3<%=j%>');" type="text" name="VLR_E01DPPRJ4<%=j%>" size="12" maxlength="20" value="<%=d.toString()%>" onKeypress="enterDecimal(2)" style="text-align:right" <% if(userPO.getOption().equals("4")){out.print("readonly");}%> >
				</TD>
      			<%} %>
      			<% if(cp>4) { %>
      			<TD ALIGN=RIGHT width="8%" NOWRAP>
					<INPUT type="text" name="E01DPPRJ5<%=j%>" size="7" maxlength="6" value="<%=accList.getRecord(18)%>" onKeypress="enterDecimal(2)" style="text-align:right"
					<% if(userPO.getOption().equals("4")){out.print("readonly");}%> >
      			</TD>
      			    <% d = new java.math.BigDecimal(String.valueOf(accList.getRecord(19).replaceAll(",",""))); 
					   if(request.getParameter("ANUALIZAR")!=null) {
					   		d = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   }
					%>
      			<TD ALIGN=RIGHT width="10%" NOWRAP>
      				<INPUT onkeyup="updPercent(this,'VLR_E01DPPRJ4<%=j%>');" type="text" name="VLR_E01DPPRJ5<%=j%>" size="12" maxlength="20" value="<%=d.toString()%>" onKeypress="enterDecimal(2)" style="text-align:right" <% if(userPO.getOption().equals("4")){out.print("readonly");}%> >
				</TD>
      			<%} %>
      			<% if(cp>5) { %>
      			<TD ALIGN=RIGHT width="8%" NOWRAP>
					<INPUT type="text" name="E01DPPRJ6<%=j%>" size="7" maxlength="6" value="<%=accList.getRecord(20)%>" onKeypress="enterDecimal(2)" style="text-align:right"
					<% if(userPO.getOption().equals("4")){out.print("readonly");}%> >
      			</TD>
      			    <% d = new java.math.BigDecimal(String.valueOf(accList.getRecord(21).replaceAll(",",""))); 
					   if(request.getParameter("ANUALIZAR")!=null) {
					   		d = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   }
					%>
      			<TD ALIGN=RIGHT width="10%" NOWRAP>
      				<INPUT onkeyup="updPercent(this,'VLR_E01DPPRJ5<%=j%>');" type="text" name="VLR_E01DPPRJ6<%=j%>" size="12" maxlength="20" value="<%=d.toString()%>" onKeypress="enterDecimal(2)" style="text-align:right" <% if(userPO.getOption().equals("4")){out.print("readonly");}%> >
				</TD>
      			<%} %>
      			<% if(cp>6) { %>
      			<TD ALIGN=RIGHT width="8%" NOWRAP>
					<INPUT type="text" name="E01DPPRJ7<%=j%>" size="7" maxlength="6" value="<%=accList.getRecord(22)%>" onKeypress="enterDecimal(2)" style="text-align:right"
					<% if(userPO.getOption().equals("4")){out.print("readonly");}%> >
      			</TD>
      			    <% d = new java.math.BigDecimal(String.valueOf(accList.getRecord(23).replaceAll(",",""))); 
					   if(request.getParameter("ANUALIZAR")!=null) {
					   		d = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   }
					%>
      			<TD ALIGN=RIGHT width="10%" NOWRAP>
      				<INPUT onkeyup="updPercent(this,'VLR_E01DPPRJ6<%=j%>');" type="text" name="VLR_E01DPPRJ7<%=j%>" size="12" maxlength="20" value="<%=d.toString()%>" onKeypress="enterDecimal(2)" style="text-align:right" <% if(userPO.getOption().equals("4")){out.print("readonly");}%> >
				</TD>
      			<%} %>
      			<% if(cp>7) { %>
      			<TD ALIGN=RIGHT width="8%" NOWRAP>
					<INPUT type="text" name="E01DPPRJ8<%=j%>" size="7" maxlength="6" value="<%=accList.getRecord(24)%>" onKeypress="enterDecimal(2)" style="text-align:right"
					<% if(userPO.getOption().equals("4")){out.print("readonly");}%> >
      			</TD>
      			<% d = new java.math.BigDecimal(String.valueOf(accList.getRecord(25).replaceAll(",",""))); 
					   if(request.getParameter("ANUALIZAR")!=null) {
					   		d = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   }
					%>
      			<TD ALIGN=RIGHT width="10%" NOWRAP>
      				<INPUT onkeyup="updPercent(this,'VLR_E01DPPRJ7<%=j%>');" type="text" name="VLR_E01DPPRJ8<%=j%>" size="12" maxlength="20" value="<%=d.toString()%>" onKeypress="enterDecimal(2)" style="text-align:right" <% if(userPO.getOption().equals("4")){out.print("readonly");}%> >
				</TD>
      			<%} %>
      			<% if(cp>8) { %>
      			<TD ALIGN=RIGHT width="8%" NOWRAP>
					<INPUT type="text" name="E01DPPRJ9<%=j%>" size="7" maxlength="6" value="<%=accList.getRecord(26)%>" onKeypress="enterDecimal(2)" style="text-align:right"
					<% if(userPO.getOption().equals("4")){out.print("readonly");}%> >
      			</TD>
      			<% d = new java.math.BigDecimal(String.valueOf(accList.getRecord(27).replaceAll(",",""))); 
					   if(request.getParameter("ANUALIZAR")!=null) {
					   		d = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   }
					%>
      			<TD ALIGN=RIGHT width="10%" NOWRAP>
      				<INPUT onkeyup="updPercent(this,'VLR_E01DPPRJ8<%=j%>');" type="text" name="VLR_E01DPPRJ9<%=j%>" size="12" maxlength="20" value="<%=d.toString()%>" onKeypress="enterDecimal(2)" style="text-align:right" <% if(userPO.getOption().equals("4")){out.print("readonly");}%> >
				</TD>
      			<%} %>
      			<% if(cp>9) { %>
      			<TD ALIGN=RIGHT width="8%" NOWRAP>
					<INPUT type="text" name="E01DPPRJ10<%=j%>" size="7" maxlength="6" value="<%=accList.getRecord(28)%>" onKeypress="enterDecimal(2)" style="text-align:right"
					<% if(userPO.getOption().equals("4")){out.print("readonly");}%> >
      			</TD>
      			<% d = new java.math.BigDecimal(String.valueOf(accList.getRecord(29).replaceAll(",",""))); 
					   if(request.getParameter("ANUALIZAR")!=null) {
					   		d = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   }
					%>
      			<TD ALIGN=RIGHT width="10%" NOWRAP>
      				<INPUT onkeyup="updPercent(this,'VLR_E01DPPRJ9<%=j%>');" type="text" name="VLR_E01DPPRJ10<%=j%>" size="12" maxlength="20" value="<%=d.toString()%>" onKeypress="enterDecimal(2)" style="text-align:right" <% if(userPO.getOption().equals("4")){out.print("readonly");}%> >
				</TD>
      			<%} %>
      			<% if(cp>10) { %>
      			<TD ALIGN=RIGHT width="8%" NOWRAP>
					<INPUT type="text" name="E01DPPRJ11<%=j%>" size="7" maxlength="6" value="<%=accList.getRecord(30)%>" onKeypress="enterDecimal(2)" style="text-align:right"
					<% if(userPO.getOption().equals("4")){out.print("readonly");}%> >
      			</TD>
      			<% d = new java.math.BigDecimal(String.valueOf(accList.getRecord(31).replaceAll(",",""))); 
					   if(request.getParameter("ANUALIZAR")!=null) {
					   		d = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   }
					%>
      			<TD ALIGN=RIGHT width="10%" NOWRAP>
      				<INPUT onkeyup="updPercent(this,'VLR_E01DPPRJ10<%=j%>');" type="text" name="VLR_E01DPPRJ11<%=j%>" size="12" maxlength="20" value="<%=d.toString()%>" onKeypress="enterDecimal(2)" style="text-align:right" <% if(userPO.getOption().equals("4")){out.print("readonly");}%> >
				</TD>
      			<%} %>
      			<% if(cp>11) { %>
      			<TD ALIGN=RIGHT width="8%" NOWRAP>
					<INPUT type="text" name="E01DPPRJ12<%=j%>" size="7" maxlength="6" value="<%=accList.getRecord(32)%>" onKeypress="enterDecimal(2)" style="text-align:right"
					<% if(userPO.getOption().equals("4")){out.print("readonly");}%> >
      			</TD>
      			<% d = new java.math.BigDecimal(String.valueOf(accList.getRecord(33).replaceAll(",",""))); 
					   if(request.getParameter("ANUALIZAR")!=null) {
					   		d = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   }
					%>
      			<TD ALIGN=RIGHT width="10%" NOWRAP>
      				<INPUT onkeyup="updPercent(this,'VLR_E01DPPRJ11<%=j%>');" type="text" name="VLR_E01DPPRJ12<%=j%>" size="12" maxlength="20" value="<%=d.toString()%>" onKeypress="enterDecimal(2)" style="text-align:right" <% if(userPO.getOption().equals("4")){out.print("readonly");}%> >
				</TD>
      			<%} %>
      			<% if(cp>12) { %>
      			<TD ALIGN=RIGHT width="8%" NOWRAP>
					<INPUT type="text" name="E01DPPRJ13<%=j%>" size="7" maxlength="6" value="<%=accList.getRecord(34)%>" onKeypress="enterDecimal(2)" style="text-align:right"
					<% if(userPO.getOption().equals("4")){out.print("readonly");}%> >
      			</TD>
      			<% d = new java.math.BigDecimal(String.valueOf(accList.getRecord(35).replaceAll(",",""))); 
					   if(request.getParameter("ANUALIZAR")!=null) {
					   		d = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   }
					%>
      			<TD ALIGN=RIGHT width="10%" NOWRAP>
      				<INPUT onkeyup="updPercent(this,'VLR_E01DPPRJ12<%=j%>');" type="text" name="VLR_E01DPPRJ13<%=j%>" size="12" maxlength="20" value="<%=d.toString()%>" onKeypress="enterDecimal(2)" style="text-align:right" <% if(userPO.getOption().equals("4")){out.print("readonly");}%> >
				</TD>
      			<%} %>
      			<% if(cp>13) { %>
      			<TD ALIGN=RIGHT width="8%" NOWRAP>
					<INPUT type="text" name="E01DPPRJ14<%=j%>" size="7" maxlength="6" value="<%=accList.getRecord(36)%>" onKeypress="enterDecimal(2)" style="text-align:right"
					<% if(userPO.getOption().equals("4")){out.print("readonly");}%> >
      			</TD>
      			<% d = new java.math.BigDecimal(String.valueOf(accList.getRecord(37).replaceAll(",",""))); 
					   if(request.getParameter("ANUALIZAR")!=null) {
					   		d = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   }
					%>
      			<TD ALIGN=RIGHT width="10%" NOWRAP>
      				<INPUT onkeyup="updPercent(this,'VLR_E01DPPRJ13<%=j%>');" type="text" name="VLR_E01DPPRJ14<%=j%>" size="12" maxlength="20" value="<%=d.toString()%>" onKeypress="enterDecimal(2)" style="text-align:right" <% if(userPO.getOption().equals("4")){out.print("readonly");}%> >
				</TD>
      			<%} %>
      			<% if(cp>14) { %>
      			<TD ALIGN=RIGHT width="8%" NOWRAP>
					<INPUT type="text" name="E01DPPRJ15<%=j%>" size="7" maxlength="6" value="<%=accList.getRecord(38)%>" onKeypress="enterDecimal(2)" style="text-align:right"
					<% if(userPO.getOption().equals("4")){out.print("readonly");}%> >
      			</TD>
      			<% d = new java.math.BigDecimal(String.valueOf(accList.getRecord(39).replaceAll(",",""))); 
					   if(request.getParameter("ANUALIZAR")!=null) {
					   		d = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   }
					%>
      			<TD ALIGN=RIGHT width="10%" NOWRAP>
      				<INPUT onkeyup="updPercent(this,'VLR_E01DPPRJ14<%=j%>');" type="text" name="VLR_E01DPPRJ15<%=j%>" size="12" maxlength="20" value="<%=d.toString()%>" onKeypress="enterDecimal(2)" style="text-align:right" <% if(userPO.getOption().equals("4")){out.print("readonly");}%> >
				</TD>
      			<%} %>
      			<% if(cp>15) { %>
      			<TD ALIGN=RIGHT width="8%" NOWRAP>
					<INPUT type="text" name="E01DPPRJ16<%=j%>" size="7" maxlength="6" value="<%=accList.getRecord(40)%>" onKeypress="enterDecimal(2)" style="text-align:right"
					<% if(userPO.getOption().equals("4")){out.print("readonly");}%> >
      			</TD>
      			<% d = new java.math.BigDecimal(String.valueOf(accList.getRecord(41).replaceAll(",",""))); 
					   if(request.getParameter("ANUALIZAR")!=null) {
					   		d = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   }
					%>
      			<TD ALIGN=RIGHT width="10%" NOWRAP>
      				<INPUT onkeyup="updPercent(this,'VLR_E01DPPRJ15<%=j%>');" type="text" name="VLR_E01DPPRJ16<%=j%>" size="12" maxlength="20" value="<%=d.toString()%>" onKeypress="enterDecimal(2)" style="text-align:right" <% if(userPO.getOption().equals("4")){out.print("readonly");}%> >
				</TD>
      			<%} %>
      			<% if(cp>16) { %>
      			<TD ALIGN=RIGHT width="8%" NOWRAP>
					<INPUT type="text" name="E01DPPRJ17<%=j%>" size="7" maxlength="6" value="<%=accList.getRecord(42)%>" onKeypress="enterDecimal(2)" style="text-align:right"
					<% if(userPO.getOption().equals("4")){out.print("readonly");}%> >
      			</TD>
      			<% d = new java.math.BigDecimal(String.valueOf(accList.getRecord(43).replaceAll(",",""))); 
					   if(request.getParameter("ANUALIZAR")!=null) {
					   		d = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   }
					%>
      			<TD ALIGN=RIGHT width="10%" NOWRAP>
      				<INPUT onkeyup="updPercent(this,'VLR_E01DPPRJ16<%=j%>');" type="text" name="VLR_E01DPPRJ17<%=j%>" size="12" maxlength="20" value="<%=d.toString()%>" onKeypress="enterDecimal(2)" style="text-align:right" <% if(userPO.getOption().equals("4")){out.print("readonly");}%> >
				</TD>
      			<%} %>
      			<% if(cp>17) { %>
      			<TD ALIGN=RIGHT width="8%" NOWRAP>
					<INPUT type="text" name="E01DPPRJ18<%=j%>" size="7" maxlength="6" value="<%=accList.getRecord(44)%>" onKeypress="enterDecimal(2)" style="text-align:right"
					<% if(userPO.getOption().equals("4")){out.print("readonly");}%> >
      			</TD>
      			<% d = new java.math.BigDecimal(String.valueOf(accList.getRecord(45).replaceAll(",",""))); 
					   if(request.getParameter("ANUALIZAR")!=null) {
					   		d = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   }
					%>
      			<TD ALIGN=RIGHT width="10%" NOWRAP>
      				<INPUT onkeyup="updPercent(this,'VLR_E01DPPRJ17<%=j%>');" type="text" name="VLR_E01DPPRJ18<%=j%>" size="12" maxlength="20" value="<%=d.toString()%>" onKeypress="enterDecimal(2)" style="text-align:right" <% if(userPO.getOption().equals("4")){out.print("readonly");}%> >
				</TD>
      			<%} %>
      			<% if(cp>18) { %>
      			<TD ALIGN=RIGHT width="8%" NOWRAP>
					<INPUT type="text" name="E01DPPRJ19<%=j%>" size="7" maxlength="6" value="<%=accList.getRecord(46)%>" onKeypress="enterDecimal(2)" style="text-align:right"
					<% if(userPO.getOption().equals("4")){out.print("readonly");}%> >
      			</TD>
      			<% d = new java.math.BigDecimal(String.valueOf(accList.getRecord(47).replaceAll(",",""))); 
					   if(request.getParameter("ANUALIZAR")!=null) {
					   		d = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   }
					%>
      			<TD ALIGN=RIGHT width="10%" NOWRAP>
      				<INPUT onkeyup="updPercent(this,'VLR_E01DPPRJ18<%=j%>');" type="text" name="VLR_E01DPPRJ19<%=j%>" size="12" maxlength="20" value="<%=d.toString()%>" onKeypress="enterDecimal(2)" style="text-align:right" <% if(userPO.getOption().equals("4")){out.print("readonly");}%> >
				</TD>
      			<%} %>
      			<% if(cp>19) { %>
      			<TD ALIGN=RIGHT width="8%" NOWRAP>
					<INPUT type="text" name="E01DPPRJ20<%=j%>" size="7" maxlength="6" value="<%=accList.getRecord(48)%>" onKeypress="enterDecimal(2)" style="text-align:right"
					<% if(userPO.getOption().equals("4")){out.print("readonly");}%> >
      			</TD>
      			<% d = new java.math.BigDecimal(String.valueOf(accList.getRecord(49).replaceAll(",",""))); 
					   if(request.getParameter("ANUALIZAR")!=null) {
					   		d = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   }
					%>
      			<TD ALIGN=RIGHT width="10%" NOWRAP>
      				<INPUT onkeyup="updPercent(this,'VLR_E01DPPRJ19<%=j%>');" type="text" name="VLR_E01DPPRJ20<%=j%>" size="12" maxlength="20" value="<%=d.toString()%>" onKeypress="enterDecimal(2)" style="text-align:right" <% if(userPO.getOption().equals("4")){out.print("readonly");}%> >
				</TD>
      			<%} %>
      				<% } else { %>
				<TD ALIGN=RIGHT width="10%" NOWRAP><%= datapro.eibs.master.Util.fcolorCCY(accList.getRecord(8)) %></TD>
      			<TD ALIGN=RIGHT width="10%" NOWRAP><%= datapro.eibs.master.Util.fcolorCCY(accList.getRecord(9)) %></TD>
      			<% java.math.BigDecimal d = new java.math.BigDecimal(String.valueOf(accList.getRecord(2).replaceAll(",",""))); 
					   if(request.getParameter("ANUALIZAR")!=null) {
					   		d = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   }
					%>
      			<TD ALIGN=RIGHT width="10%" NOWRAP><%= datapro.eibs.master.Util.fcolorCCY(d.toString()) %></TD>
      			<TH ALIGN=RIGHT width="8%"  NOWRAP><%=datapro.eibs.master.Util.fcolorCCY(accList.getRecord(10))%></TH>
      			<TH ALIGN=RIGHT width="10%"  NOWRAP><%=datapro.eibs.master.Util.fcolorCCY(accList.getRecord(11))%></TH>
      			<TH ALIGN=RIGHT width="8%"  NOWRAP><%=datapro.eibs.master.Util.fcolorCCY(accList.getRecord(12))%></TH>
      			<TH ALIGN=RIGHT width="10%"  NOWRAP><%=datapro.eibs.master.Util.fcolorCCY(accList.getRecord(13))%></TH>
      			<TH ALIGN=RIGHT width="8%"  NOWRAP><%=datapro.eibs.master.Util.fcolorCCY(accList.getRecord(14))%></TH>
      			<TH ALIGN=RIGHT width="10%"  NOWRAP><%=datapro.eibs.master.Util.fcolorCCY(accList.getRecord(15))%></TH>
      			<% if(cp>3) { %>
      			<% d = new java.math.BigDecimal(String.valueOf(accList.getRecord(16).replaceAll(",",""))); 
      			   java.math.BigDecimal d2 = new java.math.BigDecimal(String.valueOf(accList.getRecord(17).replaceAll(",",""))); 
					   if(request.getParameter("ANUALIZAR")!=null) {
					   		d = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   		d2 = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   }
					%>
      			<TH ALIGN=RIGHT width="8%"  NOWRAP><%=datapro.eibs.master.Util.fcolorCCY(d.toString())%></TH>
      			<TH ALIGN=RIGHT width="10%"  NOWRAP><%=datapro.eibs.master.Util.fcolorCCY(d2.toString())%></TH>
      			<%} %>
      			<% if(cp>4) { %>
      			<% d = new java.math.BigDecimal(String.valueOf(accList.getRecord(18).replaceAll(",",""))); 
      			   java.math.BigDecimal d2 = new java.math.BigDecimal(String.valueOf(accList.getRecord(19).replaceAll(",",""))); 
					   if(request.getParameter("ANUALIZAR")!=null) {
					   		d = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   		d2 = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   }
					%>
      			<TH ALIGN=RIGHT width="8%"  NOWRAP><%=datapro.eibs.master.Util.fcolorCCY(d.toString())%></TH>
      			<TH ALIGN=RIGHT width="10%"  NOWRAP><%=datapro.eibs.master.Util.fcolorCCY(d2.toString())%></TH>
      			<%} %>
      			<% if(cp>5) { %>
      			      			<% d = new java.math.BigDecimal(String.valueOf(accList.getRecord(20).replaceAll(",",""))); 
      			   java.math.BigDecimal d2 = new java.math.BigDecimal(String.valueOf(accList.getRecord(21).replaceAll(",",""))); 
					   if(request.getParameter("ANUALIZAR")!=null) {
					   		d = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   		d2 = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   }
					%>
      			<TH ALIGN=RIGHT width="8%"  NOWRAP><%=datapro.eibs.master.Util.fcolorCCY(d.toString())%></TH>
      			<TH ALIGN=RIGHT width="10%"  NOWRAP><%=datapro.eibs.master.Util.fcolorCCY(d2.toString())%></TH>
      			<%} %>
      			<% if(cp>6) { %>
      			      			<% d = new java.math.BigDecimal(String.valueOf(accList.getRecord(22).replaceAll(",",""))); 
      			   java.math.BigDecimal d2 = new java.math.BigDecimal(String.valueOf(accList.getRecord(23).replaceAll(",",""))); 
					   if(request.getParameter("ANUALIZAR")!=null) {
					   		d = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   		d2 = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   }
					%>
      			<TH ALIGN=RIGHT width="8%"  NOWRAP><%=datapro.eibs.master.Util.fcolorCCY(d.toString())%></TH>
      			<TH ALIGN=RIGHT width="10%"  NOWRAP><%=datapro.eibs.master.Util.fcolorCCY(d2.toString())%></TH>
      			<%} %>
      			<% if(cp>7) { %>
      			      			<% d = new java.math.BigDecimal(String.valueOf(accList.getRecord(24).replaceAll(",",""))); 
      			   java.math.BigDecimal d2 = new java.math.BigDecimal(String.valueOf(accList.getRecord(25).replaceAll(",",""))); 
					   if(request.getParameter("ANUALIZAR")!=null) {
					   		d = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   		d2 = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   }
					%>
      			<TH ALIGN=RIGHT width="8%"  NOWRAP><%=datapro.eibs.master.Util.fcolorCCY(d.toString())%></TH>
      			<TH ALIGN=RIGHT width="10%"  NOWRAP><%=datapro.eibs.master.Util.fcolorCCY(d2.toString())%></TH>
      			<%} %>
      			<% if(cp>8) { %>
      			      			<% d = new java.math.BigDecimal(String.valueOf(accList.getRecord(26).replaceAll(",",""))); 
      			   java.math.BigDecimal d2 = new java.math.BigDecimal(String.valueOf(accList.getRecord(27).replaceAll(",",""))); 
					   if(request.getParameter("ANUALIZAR")!=null) {
					   		d = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   		d2 = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   }
					%>
      			<TH ALIGN=RIGHT width="8%"  NOWRAP><%=datapro.eibs.master.Util.fcolorCCY(d.toString())%></TH>
      			<TH ALIGN=RIGHT width="10%"  NOWRAP><%=datapro.eibs.master.Util.fcolorCCY(d2.toString())%></TH>
      			<%} %>
      			<% if(cp>9) { %>
      			      			<% d = new java.math.BigDecimal(String.valueOf(accList.getRecord(28).replaceAll(",",""))); 
      			   java.math.BigDecimal d2 = new java.math.BigDecimal(String.valueOf(accList.getRecord(29).replaceAll(",",""))); 
					   if(request.getParameter("ANUALIZAR")!=null) {
					   		d = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   		d2 = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   }
					%>
      			<TH ALIGN=RIGHT width="8%"  NOWRAP><%=datapro.eibs.master.Util.fcolorCCY(d.toString())%></TH>
      			<TH ALIGN=RIGHT width="10%"  NOWRAP><%=datapro.eibs.master.Util.fcolorCCY(d2.toString())%></TH>
      			<%} %>
      			<% if(cp>10) { %>
      			      			<% d = new java.math.BigDecimal(String.valueOf(accList.getRecord(30).replaceAll(",",""))); 
      			   java.math.BigDecimal d2 = new java.math.BigDecimal(String.valueOf(accList.getRecord(31).replaceAll(",",""))); 
					   if(request.getParameter("ANUALIZAR")!=null) {
					   		d = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   		d2 = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   }
					%>
      			<TH ALIGN=RIGHT width="8%"  NOWRAP><%=datapro.eibs.master.Util.fcolorCCY(d.toString())%></TH>
      			<TH ALIGN=RIGHT width="10%"  NOWRAP><%=datapro.eibs.master.Util.fcolorCCY(d2.toString())%></TH>
      			<%} %>
      			<% if(cp>11) { %>
      			      			<% d = new java.math.BigDecimal(String.valueOf(accList.getRecord(32).replaceAll(",",""))); 
      			   java.math.BigDecimal d2 = new java.math.BigDecimal(String.valueOf(accList.getRecord(33).replaceAll(",",""))); 
					   if(request.getParameter("ANUALIZAR")!=null) {
					   		d = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   		d2 = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   }
					%>
      			<TH ALIGN=RIGHT width="8%"  NOWRAP><%=datapro.eibs.master.Util.fcolorCCY(d.toString())%></TH>
      			<TH ALIGN=RIGHT width="10%"  NOWRAP><%=datapro.eibs.master.Util.fcolorCCY(d2.toString())%></TH>
      			<%} %>
      			<% if(cp>12) { %>
      			      			<% d = new java.math.BigDecimal(String.valueOf(accList.getRecord(34).replaceAll(",",""))); 
      			   java.math.BigDecimal d2 = new java.math.BigDecimal(String.valueOf(accList.getRecord(35).replaceAll(",",""))); 
					   if(request.getParameter("ANUALIZAR")!=null) {
					   		d = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   		d2 = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   }
					%>
      			<TH ALIGN=RIGHT width="8%"  NOWRAP><%=datapro.eibs.master.Util.fcolorCCY(d.toString())%></TH>
      			<TH ALIGN=RIGHT width="10%"  NOWRAP><%=datapro.eibs.master.Util.fcolorCCY(d2.toString())%></TH>
      			<%} %>
      			<% if(cp>13) { %>
      			      			<% d = new java.math.BigDecimal(String.valueOf(accList.getRecord(36).replaceAll(",",""))); 
      			   java.math.BigDecimal d2 = new java.math.BigDecimal(String.valueOf(accList.getRecord(37).replaceAll(",",""))); 
					   if(request.getParameter("ANUALIZAR")!=null) {
					   		d = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   		d2 = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   }
					%>
      			<TH ALIGN=RIGHT width="8%"  NOWRAP><%=datapro.eibs.master.Util.fcolorCCY(d.toString())%></TH>
      			<TH ALIGN=RIGHT width="10%"  NOWRAP><%=datapro.eibs.master.Util.fcolorCCY(d2.toString())%></TH>
      			<%} %>
      			<% if(cp>14) { %>
      			      			<% d = new java.math.BigDecimal(String.valueOf(accList.getRecord(38).replaceAll(",",""))); 
      			   java.math.BigDecimal d2 = new java.math.BigDecimal(String.valueOf(accList.getRecord(39).replaceAll(",",""))); 
					   if(request.getParameter("ANUALIZAR")!=null) {
					   		d = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   		d2 = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   }
					%>
      			<TH ALIGN=RIGHT width="8%"  NOWRAP><%=datapro.eibs.master.Util.fcolorCCY(d.toString())%></TH>
      			<TH ALIGN=RIGHT width="10%"  NOWRAP><%=datapro.eibs.master.Util.fcolorCCY(d2.toString())%></TH>
      			<%} %>
      			<% if(cp>15) { %>
      			      			<% d = new java.math.BigDecimal(String.valueOf(accList.getRecord(40).replaceAll(",",""))); 
      			   java.math.BigDecimal d2 = new java.math.BigDecimal(String.valueOf(accList.getRecord(41).replaceAll(",",""))); 
					   if(request.getParameter("ANUALIZAR")!=null) {
					   		d = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   		d2 = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   }
					%>
      			<TH ALIGN=RIGHT width="8%"  NOWRAP><%=datapro.eibs.master.Util.fcolorCCY(d.toString())%></TH>
      			<TH ALIGN=RIGHT width="10%"  NOWRAP><%=datapro.eibs.master.Util.fcolorCCY(d2.toString())%></TH>
      			<%} %>
      			<% if(cp>16) { %>
      			      			<% d = new java.math.BigDecimal(String.valueOf(accList.getRecord(42).replaceAll(",",""))); 
      			   java.math.BigDecimal d2 = new java.math.BigDecimal(String.valueOf(accList.getRecord(43).replaceAll(",",""))); 
					   if(request.getParameter("ANUALIZAR")!=null) {
					   		d = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   		d2 = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   }
					%>
      			<TH ALIGN=RIGHT width="8%"  NOWRAP><%=datapro.eibs.master.Util.fcolorCCY(d.toString())%></TH>
      			<TH ALIGN=RIGHT width="10%"  NOWRAP><%=datapro.eibs.master.Util.fcolorCCY(d2.toString())%></TH>
      			<%} %>
      			<% if(cp>17) { %>
      			      			<% d = new java.math.BigDecimal(String.valueOf(accList.getRecord(44).replaceAll(",",""))); 
      			   java.math.BigDecimal d2 = new java.math.BigDecimal(String.valueOf(accList.getRecord(45).replaceAll(",",""))); 
					   if(request.getParameter("ANUALIZAR")!=null) {
					   		d = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   		d2 = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   }
					%>
      			<TH ALIGN=RIGHT width="8%"  NOWRAP><%=datapro.eibs.master.Util.fcolorCCY(d.toString())%></TH>
      			<TH ALIGN=RIGHT width="10%"  NOWRAP><%=datapro.eibs.master.Util.fcolorCCY(d2.toString())%></TH>
      			<%} %>
      			<% if(cp>18) { %>
      			      			<% d = new java.math.BigDecimal(String.valueOf(accList.getRecord(46).replaceAll(",",""))); 
      			   java.math.BigDecimal d2 = new java.math.BigDecimal(String.valueOf(accList.getRecord(47).replaceAll(",",""))); 
					   if(request.getParameter("ANUALIZAR")!=null) {
					   		d = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   		d2 = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   }
					%>
      			<TH ALIGN=RIGHT width="8%"  NOWRAP><%=datapro.eibs.master.Util.fcolorCCY(d.toString())%></TH>
      			<TH ALIGN=RIGHT width="10%"  NOWRAP><%=datapro.eibs.master.Util.fcolorCCY(d2.toString())%></TH>
      			<%} %>
      			<% if(cp>19) { %>
      			      			<% d = new java.math.BigDecimal(String.valueOf(accList.getRecord(48).replaceAll(",",""))); 
      			   java.math.BigDecimal d2 = new java.math.BigDecimal(String.valueOf(accList.getRecord(49).replaceAll(",",""))); 
					   if(request.getParameter("ANUALIZAR")!=null) {
					   		d = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   		d2 = d.multiply(new java.math.BigDecimal("12")).divide(mL0730.getBigDecimalE01IFMFEM(),java.math.BigDecimal.ROUND_HALF_EVEN);
					   }
					%>
      			<TH ALIGN=RIGHT width="8%"  NOWRAP><%=datapro.eibs.master.Util.fcolorCCY(d.toString())%></TH>
      			<TH ALIGN=RIGHT width="10%"  NOWRAP><%=datapro.eibs.master.Util.fcolorCCY(d2.toString())%></TH>
      			<%} %>
      			<% } %>
      			<% } %>

     		  </TR>
	
			<%j++; h++; 
        		} 
        	%>
      </TABLE> 
<%
       k++;
      }        
   }                 
%>
<input type="HIDDEN" name="RECNUM" value="<%=h%>">
<div align="center"> 
		<INPUT onclick="goUpdVal()" id="EIBSBTN0" type="button" name="Submit0" value="Enviar" class="EIBSBTN"
	<% if(userPO.getOption().equals("4")){out.print("disabled");}%>  >
</div>

</FORM>
<script type="text/javascript">
	<% if(request.getAttribute("NEXT_MAX_ERROR")!=null && "Y".equals(request.getAttribute("NEXT_MAX_ERROR"))) { %>
				alert('Poyección Máxima 20 años');
	<% } %>
	
</script>
</BODY>
</HTML>
