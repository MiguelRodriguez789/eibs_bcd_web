<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.ECH056501Message"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%@page import="com.datapro.constants.EibsFields"%><HTML>
<HEAD>
<TITLE> Consulta de Chequeras </TITLE>

<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">

<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="rtBasic" class="datapro.eibs.beans.ECH056503Message"  scope="session" />
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

<% if (userPO.getPurpose().equals("INQUIRY")){%>

	<%if ( userPO.getOption().equals("RT") ) {%>
	       builtNewMenu(rt_i_opt);
    <% } else if ( userPO.getOption().equals("SV") ) { %>
		    builtNewMenu(sv_i_opt);
	<%}%>
<% } %>

</SCRIPT>
</head>

<body>

<h3 align="center">Consulta de Chequeras<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="chb_list_inq.jsp, ECH0565"></h3>
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

<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECH0565" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="3">
<INPUT TYPE=HIDDEN NAME="BOOKNUM" VALUE="">

<%	if ( checkBooks.getNoResult() ) { %>
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

 <table class="tableinfo" width="80%">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="15%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="15%" > 
              <div align="left"> 
                <input type="text" name="E03ACMCUN" size="9" maxlength="9" value="<%= userPO.getCusNum().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="10%" > 
              <div align="right"><b>Nombre :</b></div>
            </td>
            <td nowrap width="30%" > 
              <div align="left">
              <eibsinput:text property="E03CUSNA1" name="rtBasic" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" readonly="true"></eibsinput:text>
              </div>
            </td>
            <td nowrap width="15%" > 
            </td>
            <td nowrap width="15%" > 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="15%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="15%"> 
              <div align="left"> 
                <input type="text" name="E03ACMACC" size="12" readonly maxlength="12" value="<%= userPO.getAccNum().trim()%>" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="30%"> 
              <div align="left"> 
                <input type="text" name="E03ACMCCY" size="4" readonly maxlength="4" value="<%= userPO.getCurrency().trim()%>">
              </div>
            </td>
            <td nowrap width="15%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="15%"> 
              <div align="left"> 
                <input type="text" name="E03ACMPRO" size="4" readonly maxlength="4" value="<%= userPO.getProdCode().trim()%>">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<BR> 

<%int row = 0; %>
 <table  class="tableinfo" width="80%">
    <tr> 
      <td nowrap> 
       <table cellspacing="0" cellpadding="2" width="100%" border="0">
        
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td align=right width = "30%">
            	<b>Nombre Personalizado :</b>
            </td>
            <td nowrap colspan=3 width = "30%"> 
            	<INPUT type="text" name="E03CHPNO1" size="50" maxlength="50" value="<%= rtBasic.getE03CHPNO1().trim()%>" readonly>
            </td>
            
          </tr>
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap align="right" width = "30%">
  		       <%if (rtBasic.getE03CHPRE1().equals("O")) {	%>
  		          <b> o </b>
                <%} else { %>                
                  <b> y/o </b>
                <%}%>
            </td>
            <td nowrap colspan=3 width = "30%">
              <INPUT type="text" name="E03CHPNO2" size="50" maxlength="50" value="<%= rtBasic.getE03CHPNO2().trim()%>" readonly>
            </td>
            
          </tr>
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap align=right width = "25%"> 
              <b>Tipo de Chequera :</b>
            </td>
            <td nowrap align=left width = "25%">
              <INPUT type="text" name="E03ACMTCB" size="3" maxlength="2" value="<%= rtBasic.getE03ACMTCB().trim()%>" readonly>
            </td>
            <td align=right nowrap width = "25%">
              <b>Oficina de Entrega : </b>
            </td>
            <td nowrap width = "25%">
              <input type="text" name="E03CHPDBR" size="3" maxlength="3" value="<%= rtBasic.getE03CHPDBR().trim()%>" readonly>
            </td>            
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap align=right width = "25%"> 
              <b>Cargos por Chequeras :</b>
            </td>
            <td nowrap width = "25%">
              <INPUT type="radio" name="E03ACMCBC" value="Y" <% if(!rtBasic.getE03ACMCBC().equals("N")) out.print("checked");%> readonly disabled>
              S&iacute; 
              <INPUT type="radio" name="E03ACMCBC" value="N" <% if(rtBasic.getE03ACMCBC().equals("N")) out.print("checked");%> readonly disabled>
               No
            </td>
            <td nowrap align=right width = "25%"><b>Stock Actual  :</b>
            </td>
            <td nowrap width = "25%">
              <INPUT type="text" name="E03ACMASK" size="3" maxlength="2" value="<%= rtBasic.getE03ACMASK().trim()%>" readonly>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap align=right width = "25%"> 
              <b>Restricción de Entregas :</b>
            </td>
            <td nowrap width = "25%">
              <INPUT type="radio" name="E03CHPCON" value="Y" <% if(rtBasic.getE03CHPCON().equals("Y")) out.print("checked");%> readonly disabled>
              S&iacute; 
              <INPUT type="radio" name="E03CHPCON" value="N" <% if(!rtBasic.getE03CHPCON().equals("Y")) out.print("checked");%> readonly disabled>
              No
            </td>
            <td nowrap align=right width = "25%"> 
              <b>Stock Mínimo :</b>
            </td>
            <td nowrap width = "25%">
              <INPUT type="text" name="E03ACMMSK" size="3" maxlength="2" value="<%= rtBasic.getE03ACMMSK().trim()%>" readonly> 
            </td>
            
          </tr>
        </table>
    </td>
   </tr>
 </table>
<BR>

 <table  id=cfTable class="tableinfo" height="50%" width="80%">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="98%">
			<tr id="trdark">
		      <TH ALIGN=CENTER rowspan="2" width="7%">Numero<br>
		        Chequera</TH>
		      <TH ALIGN=CENTER colspan="2" width="14%">Fecha</TH>
		      <TH ALIGN=CENTER rowspan="2" width="7%" >Status<br>
		        Chequera</TH>
		      <TH ALIGN=CENTER rowspan="2" width="7%" >Cantidad<br>
		        Cheques </TH>
		      <TH ALIGN=CENTER rowspan="2" width="7%">Cheque<br>Inicial</TH>
		      <TH ALIGN=CENTER rowspan="2" width="7%"> Cheque<br>Final</TH>
		      <TH ALIGN=CENTER colspan="5" width="7%">Estado de Chequera</TH>
		      <TH ALIGN=CENTER rowspan="2" width="7%">Oficina <br>Entrega</TH>
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
					ECH056501Message menu = (ECH056501Message) checkBooks.getRecord();
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
			
		   if(menu.getE01CHMSTS().equals("A")){
   		   		status = "Anulado";
   		   } else if(menu.getE01CHMSTS().equals("R")) {
   		    	status = "Rechazado";
	    	} else if(menu.getE01STSENT().equals("Y")) {
	    		status = "Entregado ";
	    	}else if(menu.getE01CHMSTS().equals("1")) {
   		    	status = "1";
	    	}else {
	    		status = "";
	       	}	
		   
   		 %>
 
 		<tr id="dataTable">
			<td nowrap align="center" width="7%"><a href="javascript:goAction('<%=menu.getE01CHMNCB()%>');"><%=menu.getE01CHMNCB()%></a></td>
			<td nowrap align="left" width="7%"><a href="javascript:goAction('<%=menu.getE01CHMNCB()%>');"><%= Util.formatCustomDate(currUser.getE01DTF(), menu.getBigDecimalE01CHMRQM().intValue(), menu.getBigDecimalE01CHMRQD().intValue(), menu.getBigDecimalE01CHMRQY().intValue())%></a></td>
			<td nowrap align="left" width="7%"><a href="javascript:goAction('<%=menu.getE01CHMNCB()%>');"><%=Util.formatCustomDate(currUser.getE01DTF(), menu.getBigDecimalE01CHMACM().intValue(), menu.getBigDecimalE01CHMACD().intValue(), menu.getBigDecimalE01CHMACY().intValue())%></a></td>
			<td nowrap align="center" width="7%"><a href="javascript:goAction('<%=menu.getE01CHMNCB()%>');"><%=status%></a></td>
			<td nowrap align="center" width="7%"><a href="javascript:goAction('<%=menu.getE01CHMNCB()%>');"><%=menu.getE01CHMNTC()%></a></td>
			<td nowrap align="center" width="7%"><a href="javascript:goAction('<%=menu.getE01CHMNCB()%>');"><%=menu.getE01CHMICK()%></a></td>
			<td nowrap align="center" width="7%"><a href="javascript:goAction('<%=menu.getE01CHMNCB()%>');"><%=menu.getE01CHMFCK()%></a></td>
			<td nowrap align="center" width="7%"><a href="javascript:goAction('<%=menu.getE01CHMNCB()%>');"><%=answer1%></a></td>
			<td nowrap align="center" width="7%"><a href="javascript:goAction('<%=menu.getE01CHMNCB()%>');"><%=answer2%></a></td>
			<td nowrap align="center" width="7%"><a href="javascript:goAction('<%=menu.getE01CHMNCB()%>');"><%=answer3%></a></td>
			<td nowrap align="center" width="7%"><a href="javascript:goAction('<%=menu.getE01CHMNCB()%>');"><%=answer4%></a></td>
			<td nowrap align="center" width="7%"><a href="javascript:goAction('<%=menu.getE01CHMNCB()%>');"><%=answer5%></a></td>
			<td nowrap align="center" width="7%"><a href="javascript:goAction('<%=menu.getE01CHMNCB()%>');"><%=menu.getE01CHMDET()%></a></td>
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
