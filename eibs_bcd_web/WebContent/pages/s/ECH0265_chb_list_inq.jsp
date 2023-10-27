<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.ECH020501Message"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.ECH026501Message"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%@page import="com.datapro.constants.EibsFields"%><HTML>
<HEAD>
<TITLE> Consulta de Chequeras Universal </TITLE>

<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">

<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="rtBasic" class="datapro.eibs.beans.ECH026503Message"  scope="session" />
<jsp:useBean id="checkStocks" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="checkBooks" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="userPO" class= "datapro.eibs.beans.UserPos"   scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" /> 

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<SCRIPT  type="text/javascript">

 function goAction(bn) {
 	document.forms[0].SCREEN.value = "3";	
	document.forms[0].BOOKNUM.value = bn;	
	document.forms[0].submit();	
		
}

 function showWarn(rowNum)
{
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSECH0265?SCREEN=113&ROW=" + rowNum;
	CenterWindow(page,420,250,2);
}

<% if (userPO.getPurpose().equals("INQUIRY")){%>

	<%if ( userPO.getOption().equals("RT") ) {%>
	       builtNewMenu(rt_i_opt);
    <% } else if ( userPO.getOption().equals("SV") ) { %>
		    builtNewMenu(sv_i_opt);
	<%}%>
<% } %>

function goSearch() {
	if (getElement("SEARCHCDE").value == "") {
		alert("Favor digitar una cuenta para posicionarse en la lista!!!");
		return;
	}
	getElement("SCREEN").value="200";
	document.forms[0].submit();
}
</SCRIPT>
</head>

<body>

<h3 align="center">Consulta de Stock - Chequeras Universal<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="chb_list_inq.jsp, ECH0265"></h3>
<hr size="4">

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
   if (userPO.getPurpose().equals("INQUIRY")){ 
   out.println("<SCRIPT> initMenu(); </SCRIPT>");}
%> 

<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECH0265" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="3">
<INPUT TYPE=HIDDEN NAME="BOOKNUM" VALUE="">
<INPUT TYPE=HIDDEN NAME="E01SELBNK" VALUE="<%= rtBasic.getE03SELBNK()%>">
<INPUT TYPE=HIDDEN NAME="E01SELBRN" VALUE="<%= rtBasic.getE03SELBRN()%>">
<INPUT TYPE=HIDDEN NAME="E01SELTCB" VALUE="<%= userPO.getHeader1()%>">

<%	if ( checkBooks.getNoResult() && 1 ==2) { %>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
        <div align="center">
        		<font size="3"><b>
        		No hay resultados que correspondan a su criterio de búsqueda. 
        		</b></font>
        	</div>
      </TD></TR>
   		</TABLE>
   		
<% }  else {%> 

 <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="15%" > 
              <div align="right"><b>Banco :</b></div>
            </td>
            <td nowrap width="15%" > 
              <div align="left"> 
                <input type="text" name="E01SELBNK" size="3" value="<%= rtBasic.getE03SELBNK()%>" readonly> 
              </div>
            </td>
            <td nowrap width="15%" > 
            </td>
            <td nowrap width="15%" > 
             </td>
            <td nowrap width="15%" > 
            </td>
            <td nowrap width="15%" > 
            </td>
             <td nowrap width="15%" > 
            </td>
          </tr>  	
          <tr id="trdark"> 
            <td nowrap width="15%" > 
              <div align="right"><b>Agencia :</b></div>
            </td>
            <td nowrap width="15%" > 
              <div align="left"> 
                <input type="text" name="E03SELBRN" size="4" value="<%= rtBasic.getE03SELBRN()%>" readonly> 
                <input type="text" name="E03SELBDS" size="44" value="<%= rtBasic.getE03SELBDS()%>" readonly>
              </div>
            </td>
            <td nowrap width="15%"> 
<!--               <div align="right"><b>Stock Actual : </b></div> -->
            </td>
            <td nowrap width="15%"> 
              <div align="left"> 
<%--                 <input type="text" name="E01CHLBSK" size="6" readonly value="<%= msgMT.getE01CHLBSK()%>"> --%>
              </div>
            </td>
           <td nowrap width="15%"> 
<!--               <div align="right"><b>Imprenta : </b></div> -->
            </td>
            <td nowrap width="15%"> 
              <div align="left"> 
<%--                 <input type="text" name="E01CHLBIM" size="6" readonly value="<%= msgMT.getE01CHLBIM()%>"> --%>
              </div>
            </td>
             <td nowrap width="15%"> 
              <div align="left"> 
<%--                 <input type="text" name="E01CHLBIM" size="6" readonly value="<%= msgMT.getE01CHLBIM()%>"> --%>
              </div>
            </td>
            
          </tr>
        </table>
      </td>
    </tr>
  </table>
<BR> 

<%int row = 0; %>
<h4>Información Stock en Oficina</h4>
 <table  id=cfTable class="tableinfo" height="20%" width="70%">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="98%">
			<tr id="trdark">
		      <TH ALIGN=CENTER rowspan="2" width="7%">Tipo<br>
		        Chequera</TH>
		      <TH ALIGN=CENTER colspan="2" width="7%">Stock<br>
		        Minimo</TH>
		       <TH ALIGN=CENTER colspan="2" width="7%">Stock<br>
		        Maximo</TH> 
		      <TH ALIGN=CENTER rowspan="2" width="7%" >Stock<br>
		        Actual</TH>
		      <TH ALIGN=CENTER rowspan="2" width="7%" >Stock<br>
		        Transito</TH>
		      <TH ALIGN=CENTER rowspan="2" width="7%">Stock<br>
		        Solicitud</TH>
		    </TR>
	    </table>
    </td>
   </tr>
   
		  <tr  height="95%">    
		    <td nowrap="nowrap">       
		       <div id="dataDiv1" style="width:100%; height:100%; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         

    <%
          checkStocks.initRow();
				boolean firstTimex = true;
				String chkx = "";
                while (checkStocks.getNextRow()) {
 					if (firstTimex) {
						firstTimex = false;
						chkx = "checked";
					} else {
						chkx = "";
					}
					ECH020501Message menu0 = (ECH020501Message) checkStocks.getRecord();
					String chkWarn = (menu0.getH01FLGWK1().equals("Y")
							? "<a href=\"javascript:showWarn('"
								+ checkStocks.getCurrentRow()
								+ "')\"><img src=\""+request.getContextPath()+"/images/warning01.gif\" title=\"Warnings\" align=\"middle\" border=\"0\" ></a>"
								: "");
   %>  
   		 
 		<tr id="dataTable">
 			<td nowrap align="center" width="7%"><%=menu0.getE01CHLTCB()%><%=chkWarn%></td>
			<td nowrap align="center" width="7%"><%=menu0.getE01CHLMSK()%></td>
			<td nowrap align="center" width="7%"><%=menu0.getE01CHLTSK()%></td>
			<td nowrap align="center" width="7%"><%=menu0.getE01CHLASK()%></td>
			<td nowrap align="center" width="7%"><%=menu0.getE01CHLCIM()%></td>
			<td nowrap align="center" width="7%"><%=menu0.getE01CHLBSK()%></td>
		</tr>
<% }%>
		  
        </table>
        </div>
        </td>
        </tr>
    </table>

 <BR>

<h4>Información de Chequeras </h4>
 <table  id=cfTable class="tableinfo" height="70%" width="80%">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="98%">
			<tr id="trdark">
		      <TH ALIGN=CENTER rowspan="3" width="8%">Numero<br>
		        Chequera<br>
		         <INPUT type="text" name="SEARCHCDE" size="13" maxlength="12" value="<%= userPO.getHeader6() %>" >
				 <IMG src="<%=request.getContextPath()%>/images/ico5.gif" onclick="goSearch()" width="15" height="11" title="Posicionarse en...">
		        </TH>
		      <TH ALIGN=CENTER colspan="2" width="14%">Fecha</TH>
		      <TH ALIGN=CENTER rowspan="2" width="7%" >Status<br>
		        Chequera</TH>
		      <TH ALIGN=CENTER rowspan="2" width="7%" >Cantidad<br>
		        Cheques </TH>
		      <TH ALIGN=CENTER rowspan="2" width="7%">Cheque<br>Inicial</TH>
		      <TH ALIGN=CENTER rowspan="2" width="7%"> Cheque<br>Final</TH>
		      <TH ALIGN=CENTER colspan="5" width="7%">Estado de Chequera</TH>
		      <TH ALIGN=CENTER rowspan="2" width="7%">Oficina <br>Entrega</TH>
		       <TH ALIGN=CENTER rowspan="2" width="8%">Cuenta <br>Entrega</TH>
		    </TR>
		    <TR id="trdark"> 
		      <TH ALIGN=CENTER width="7%"><font size="1"> Solicitud Proveedor</font></TH>
		      <TH ALIGN=CENTER width="7%"><font size="1"> Entregado Cliente</font></TH>
		      <TH ALIGN=CENTER width="7%"><font size="1"> Solicitud Proveedor</font></TH>
		      <TH ALIGN=CENTER width="7%"><font size="1"> Recibido Proveedor</font></TH>
		      <TH ALIGN=CENTER width="7%"><font size="1"> Enviado Oficina</font></TH>
		      <TH ALIGN=CENTER width="7%"><font size="1"> Recibido Oficina</font></TH>
		      <TH ALIGN=CENTER width="7%"><font size="1"> Entregado Cliente</font></TH>
		    </TR>
	    </table>
    </td>
   </tr>
   
		  <tr  height="95%">    
		    <td nowrap="nowrap">       
		       <div id="dataDiv1" style="width:100%; height:100%; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         

    <%
          checkBooks.initRow();
				boolean firstTime = true;
				String chk = "";
                while (checkBooks.getNextRow()) {
 					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
					ECH026501Message menu = (ECH026501Message) checkBooks.getRecord();
   %>  
   		<% String answer1 = " ";
   		   String answer2 = " ";
   		   String answer3 = " ";
   		   String answer4 = " ";
   		   String answer5 = " ";
   		   String status = " ";
   		   
   		   if(menu.getE01STSSOL().equals("Y")){
   		   		answer1 = "Si";
   		   }else{
   		   		answer1 = "No";
   		   }

   		   if(menu.getE01STSRCV().equals("Y")){
   		   		answer2 = "Si";
   		   }else{
   		   		answer2 = "No";
   		   }

   		   if(menu.getE01STSENV().equals("Y")){
   		   		answer3 = "Si";
   		   }else{
   		   		answer3 = "No";
   		   }

   		   if(menu.getE01STSSUC().equals("Y")){
   		   		answer4 = "Si";
   		   }else{
   		   		answer4 = "No";
   		   }

   		   if(menu.getE01STSENT().equals("Y")){
   		   		answer5 = "Si";
   		   }else{
   		   		answer5 = "No";
   		   }

   		   if(menu.getE01CHUSTS().equals("A")){
   		   		status = "Anulado";
   		   } else if(menu.getE01CHUSTS().equals("R")) {
   		    	status = "Rechazado";
	    	} else if(menu.getE01STSENT().equals("Y")) {
	    		status = "Entregado ";
	    	}else {
	    		status = "";
	       	}
 		    	

   		 %>
 
 		<tr id="dataTable">
<%-- 			<td nowrap align="center" width="7%"><a href="javascript:goAction('<%=menu.getE01CHUNCB()%>');"><%=menu.getE01CHUNCB()%></a></td> --%>
<%-- 			<td nowrap align="left" width="7%"><a href="javascript:goAction('<%=menu.getE01CHUNCB()%>');"><%= Util.formatCustomDate(currUser.getE01DTF(), menu.getBigDecimalE01CHURQM().intValue(), menu.getBigDecimalE01CHURQD().intValue(), menu.getBigDecimalE01CHURQY().intValue())%></a></td> --%>
<%-- 			<td nowrap align="left" width="7%"><a href="javascript:goAction('<%=menu.getE01CHUNCB()%>');"><%=Util.formatCustomDate(currUser.getE01DTF(), menu.getBigDecimalE01CHUACM().intValue(), menu.getBigDecimalE01CHUACD().intValue(), menu.getBigDecimalE01CHUACY().intValue())%></a></td> --%>
<%-- 			<td nowrap align="center" width="7%"><a href="javascript:goAction('<%=menu.getE01CHUNCB()%>');"><%=status%></a></td> --%>
<%-- 			<td nowrap align="center" width="7%"><a href="javascript:goAction('<%=menu.getE01CHUNCB()%>');"><%=menu.getE01CHUNTC()%></a></td> --%>
<%-- 			<td nowrap align="center" width="7%"><a href="javascript:goAction('<%=menu.getE01CHUNCB()%>');"><%=menu.getE01CHUICK()%></a></td> --%>
<%-- 			<td nowrap align="center" width="7%"><a href="javascript:goAction('<%=menu.getE01CHUNCB()%>');"><%=menu.getE01CHUFCK()%></a></td> --%>
<%-- 			<td nowrap align="center" width="7%"><a href="javascript:goAction('<%=menu.getE01CHUNCB()%>');"><%=answer1%></a></td> --%>
<%-- 			<td nowrap align="center" width="7%"><a href="javascript:goAction('<%=menu.getE01CHUNCB()%>');"><%=answer2%></a></td> --%>
<%-- 			<td nowrap align="center" width="7%"><a href="javascript:goAction('<%=menu.getE01CHUNCB()%>');"><%=answer3%></a></td> --%>
<%-- 			<td nowrap align="center" width="7%"><a href="javascript:goAction('<%=menu.getE01CHUNCB()%>');"><%=answer4%></a></td> --%>
<%-- 			<td nowrap align="center" width="7%"><a href="javascript:goAction('<%=menu.getE01CHUNCB()%>');"><%=answer5%></a></td> --%>
<%-- 			<td nowrap align="center" width="7%"><a href="javascript:goAction('<%=menu.getE01CHUNCB()%>');"><%=menu.getE01CHUDET()%></a></td> --%>
<%-- 			<td nowrap align="center" width="5%"><a href="javascript:goAction('<%=menu.getE01CHUNCB()%>');"><%=menu.getE01CHUACC()%></a></td> --%>
			<td nowrap align="center" width="8%"><%=menu.getE01CHUNCB()%></td>
			<td nowrap align="left" width="7%"><%= Util.formatCustomDate(currUser.getE01DTF(), menu.getBigDecimalE01CHURQM().intValue(), menu.getBigDecimalE01CHURQD().intValue(), menu.getBigDecimalE01CHURQY().intValue())%></td>
			<td nowrap align="left" width="7%"><%=Util.formatCustomDate(currUser.getE01DTF(), menu.getBigDecimalE01CHUACM().intValue(), menu.getBigDecimalE01CHUACD().intValue(), menu.getBigDecimalE01CHUACY().intValue())%></td>
			<td nowrap align="center" width="7%"><%=status%></td>
			<td nowrap align="center" width="7%"><%=menu.getE01CHUNTC()%></td>
			<td nowrap align="center" width="7%"><%=menu.getE01CHUICK()%></td>
			<td nowrap align="center" width="7%"><%=menu.getE01CHUFCK()%></td>
			<td nowrap align="center" width="7%"><%=answer1%></td>
			<td nowrap align="center" width="7%"><%=answer2%></td>
			<td nowrap align="center" width="7%"><%=answer3%></td>
			<td nowrap align="center" width="7%"><%=answer4%></td>
			<td nowrap align="center" width="7%"><%=answer5%></td>
			<td nowrap align="center" width="7%"><%=menu.getE01CHUDET()%></td>
			<td nowrap align="center" width="8%"><%=menu.getE01CHUACC()%></td>
		</tr>
<% }%>
		  
        </table>
        </div>
        </td>
        </tr>
    </table>
<% }%>

</form>


</BODY>
</HTML>
