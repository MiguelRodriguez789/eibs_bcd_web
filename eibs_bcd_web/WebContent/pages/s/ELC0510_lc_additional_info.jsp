<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<HTML>
<HEAD>
<TITLE>Letter of Credit Additional Information</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<jsp:useBean id="msg07" class="datapro.eibs.beans.ELC051007Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<SCRIPT type="text/javascript">
  <% if(request.getParameter("OPTMENU") != null) { %>
   		builtNewMenu(<%= request.getParameter("OPTMENU")%>);
   <%} else {%>
<% if (userPO.getPurpose().equals("APP_MAINTENANCE")) { %>	
		builtNewMenu(lc_apr_cc_maint<%=("Y".equals(request.getParameter("E01DOMFLG"))?"_local":"")%>);
<% } else if (userPO.getPurpose().equals("APP_NEW")) { %>
		builtNewMenu(lc_apr_cc_new<%=("Y".equals(request.getParameter("E01DOMFLG"))?"_local":"")%>);
<% } else if (userPO.getPurpose().equals("INQUIRY")) { %>			
		builtNewMenu(lc_i_opt);			
<% } else { %>		
		builtNewMenu(lc_maint);
<% } %>
   	<%}%>
   	
   	initMenu();

      function goMsgSwift() {
   	var dx = 450;
   	var dy = 350;
   	var y0 = (screen.height - dy) / 2;
   	var x0 = (screen.width - dx) / 2;
   	var attr = 'toolbar=no,location=no,directories=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no,left=' + x0 + ',top=' + y0 + ',height=' + dy + ',width=' + dx;

   	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.approval.JSEPR1080A?SCREEN=8&TRANSREFNUM=<%=msg07.getE07LCMACC().trim()%>";
   	listin = window.open(page,'',attr);
 }
</SCRIPT>

<%
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }

 String readonly = (userPO.getPurpose().equals("MAINTENANCE")) ? "" : "readonly";
 String disabled = (userPO.getPurpose().equals("MAINTENANCE")) ? "" : "disabled";
%>

</HEAD>
<BODY>
<H3 align="center">Datos Adicionales del Crédito
	<IMG src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="lc_additional_info, ELC0510"></H3>
<HR size="4">

<FORM method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.trade.JSELC0500A">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
<INPUT NAME="E01DOMFLG" TYPE=HIDDEN VALUE="<%=(request.getParameter("E01DOMFLG")==null?"":request.getParameter("E01DOMFLG"))%>">

<TABLE cellspacing="0" cellpadding="2" width="100%" border="0" class="tableinfo">
	<TR id="trdark">
		<TD nowrap width="16%" align="right"><B>Banco : </B></TD>
		<TD nowrap width="19%"><INPUT type="text" name="E07LCMBNK" size="4" maxlength="2" value="<%= msg07.getE07LCMBNK().trim() %>" <%=readonly%>></TD>
		<TD nowrap align="right" width="18%"><B>  Número de Carta de Crédito : </B></TD>
		<TD nowrap width="16%"><INPUT type="text" name="E07LCMACC" value="<%= msg07.getE07LCMACC().trim() %>" <%=readonly%>>
		<TD nowrap width="16%" align="right"><B>Producto : </B></TD>
		<TD nowrap width="16%"><INPUT type="text" name="E07LCMPRO" size="10" maxlength="4" value="<%= msg07.getE07LCMPRO().trim() %>" <%=readonly%>></TD>
	</TR>
</TABLE>	

<H4>Información Adicional</H4>

<TABLE class="tableinfo">
	<TBODY>
    	<TR>
        	<TD nowrap>
        		<TABLE cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
            		<TBODY>
            		    <% if (userPO.getID().equals("18") ) { %>
              			<TR id="trdark">
                			<TD nowrap width="16%"align="right"><B>Fecha de Suscripción del Pagaré: </B></TD>
	                		<TD nowrap width="20%" align="left">
								<eibsinput:date name="msg07" fn_month="E07LCMD1M" fn_day="E07LCMD1D" fn_year="E07LCMD1Y" readonly="<%= readonly.equals("") ? "false" : "true" %>"/>
	            			</TD>
	              		</TR>
              			<TR id="trclear">
                			<TD nowrap width="16%"align="right"><B>Fecha de Vencimiento del Pagaré: </B></TD>
	                		<TD nowrap width="20%" align="left">
								<eibsinput:date name="msg07" fn_month="E07LCMD2M" fn_day="E07LCMD2D" fn_year="E07LCMD2Y" readonly="<%= readonly.equals("") ? "false" : "true" %>"/>
	            			</TD>
	              		</TR>
	              		<% } %>
	              		<TR id="trdark">
                			<TD nowrap width="16%"align="right"><B>Fecha de Vencimiento del Reembolso: </B></TD>
	                		<TD nowrap width="20%" align="left">
								<eibsinput:date name="msg07" fn_month="E07LCMD3M" fn_day="E07LCMD3D" fn_year="E07LCMD3Y" readonly="<%= readonly.equals("") ? "false" : "true" %>"/>
	            			</TD>
	              		</TR>
	              		<TR id="trclear">
                			<TD nowrap width="16%"align="right"><B>Cargos del Banco Reembolsador: </B></TD>
	                		<TD nowrap width="20%" align="left">

                        		 <SELECT name="E07LCMRCC" <%=disabled%>>
                            		<OPTION value=" "></OPTION>
                	            	<OPTION value="CLM" <% if(msg07.getE07LCMRCC().equals("CLM")) out.print("selected");%>>Banco Solicitante</OPTION>
                             		<OPTION value="OUR" <% if(msg07.getE07LCMRCC().equals("OUR")) out.print("selected");%>>Nosotros</OPTION>
                        		</SELECT>
	                	</TR>	
<%-- 
	              		<TR id="trclear">
                			<TD nowrap width="16%"align="right"><B>Flete: </B></TD>
	                		<TD nowrap width="20%" align="left">
	                	        <SELECT name="E07LCMFRC">
                            		<OPTION value=" "></OPTION>
                	            	<OPTION value="P" <% if(msg07.getE07LCMFRC().equals("P")) out.print("selected");%>>Pre-Pagado</OPTION>
                             		<OPTION value="C" <% if(msg07.getE07LCMFRC().equals("C")) out.print("selected");%>>Por Cobrar</OPTION>
                        		</SELECT>
	                	</TR>	
--%>
			             <TR id="trdark">
                			 <TD width="25%" align="right" nowrap><B>Cancelación Automática: </B></TD>
                             <TD nowrap width="25%"> 
                            	<INPUT type="radio" name="E07LCMHCF" value="Y" <% if(msg07.getE07LCMHCF().equals("Y")) out.print("checked");%> <%=disabled%>>Si
                            	<INPUT type="radio" name="E07LCMHCF" value="N" <% if(msg07.getE07LCMHCF().equals("N")) out.print("checked");%> <%=disabled%>>No</TD>
	              		</TR>
	              		<%--
	              		<TR id="trclear">
                			<TD nowrap width="16%" align="right"><B>Último No de Enmienda: </B> </TD>
               				<TD nowrap width="20%" align="left">
                 				 <INPUT type="text" name="E07LCMLAN" size="4" maxlength="4" value="<%= msg07.getE07LCMLAN().trim()%>">
            			    </TD>
            			</TR>
            			<TR id="trdark">
                			<TD nowrap width="16%" align="right"><B>Fecha Última Enmienda: </B></TD>
                			<TD nowrap width="20%" align="left">
                  				<INPUT type="text" name="E07LCMLA1" size="3" maxlength="2" value="<%= msg07.getE07LCMLA1().trim()%>">
                 				<INPUT type="text" name="E07LCMLA2" size="3" maxlength="2" value="<%= msg07.getE07LCMLA2().trim()%>">
              				    <INPUT type="text" name="E07LCMLA3" size="3" maxlength="2" value="<%= msg07.getE07LCMLA3().trim()%>">
                 			</TD>
              		   </TR>
              		   --%>
            		</TBODY>
          		</TABLE>
          	</TD>
      	</TR>
    </TBODY>
</TABLE>
 <%--
<H4>Crédito Disponible Por</H4>

<TABLE class="tableinfo">
	<TBODY>
    	<TR>
        	<TD nowrap>
        		<TABLE cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
            		<TBODY>
            		   <TR id="trdark">
            		       <TD nowrap width="16%"align="right"><B>% Valor Factura: </B></TD>
	                	   <TD nowrap width="20%" align="left">
								<INPUT type="text" name="E07LCMPC1" size="5" maxlength="3" value="<%= msg07.getE07LCMPC1().trim()%>" >
	            		   </TD>
            		   </TR>
            		   <TR id="trclear">
              			   <TD nowrap width="16%"align="right"><B>Nro. de Dias: </B></TD>
	                	   <TD nowrap width="20%" align="left">
								<INPUT type="text" name="E07LCMTRM" size="5" maxlength="3" value="<%= msg07.getE07LCMTRM().trim()%>" >
	            		   </TD>
              		   </TR>
              		   <TR id="trdark">
                            <TD nowrap width="16%"align="right"><B>Código Término: </B></TD>
			                <TD nowrap width="20%">
				                <SELECT name="E07LCMTRC">
				                	<OPTION value="  " <% if ((!msg07.getE07LCMTRC().equals("AS")) && (!msg07.getE07LCMTRC().equals("BE")) && (!msg07.getE07LCMTRC().equals("BL")) && (!msg07.getE07LCMTRC().equals("CC")) && (!msg07.getE07LCMTRC().equals("FD")) && (!msg07.getE07LCMTRC().equals("FP")) && (!msg07.getE07LCMTRC().equals("GA")) && (!msg07.getE07LCMTRC().equals("ID")) && (!msg07.getE07LCMTRC().equals("ST")) && (!msg07.getE07LCMTRC().equals("TD"))) out.println("selected"); %>></OPTION>
			                		<OPTION value="AS" <% if (msg07.getE07LCMTRC().equals("AS")) out.println("selected"); %>>A la vista</OPTION>
			                		<OPTION value="BE" <% if (msg07.getE07LCMTRC().equals("BE")) out.println("selected"); %>>Después de Fecha de Letra de Cambio</OPTION>
		                			<OPTION value="BL" <% if (msg07.getE07LCMTRC().equals("BL")) out.println("selected"); %>>Después de Fecha de Embarque</OPTION>
		                			<OPTION value="CC" <% if (msg07.getE07LCMTRC().equals("CC")) out.println("selected"); %>>Después de Pase de Mercancía por Aduana</OPTION>
				                 	<OPTION value="FD" <% if (msg07.getE07LCMTRC().equals("FD")) out.println("selected"); %>>Después de Pase de Mercancía por Revisión</OPTION>
			                		<OPTION value="FP" <% if (msg07.getE07LCMTRC().equals("FP")) out.println("selected"); %>>Primera Presentación</OPTION>
			                		<OPTION value="GA" <% if (msg07.getE07LCMTRC().equals("GA")) out.println("selected"); %>>Después de Arribo de Mercancía</OPTION>
			                		<OPTION value="ID" <% if (msg07.getE07LCMTRC().equals("ID")) out.println("selected"); %>>Después de Fecha de Factura</OPTION>
				                	<OPTION value="ST" <% if (msg07.getE07LCMTRC().equals("ST")) out.println("selected"); %>>Después de Entregado</OPTION>
					                <OPTION value="TD" <% if (msg07.getE07LCMTRC().equals("TD")) out.println("selected"); %>>Después de Fecha de Doc. de Transporte</OPTION>
			                    </SELECT>
                            </TD>
			            </TR>
            		</TBODY>
          		</TABLE>
          	</TD>
      	</TR>


    </TBODY>
</TABLE>
--%>
<br>
<% if (readonly.equals("")) { %>
	<DIV align="center"><INPUT id="EIBSBTN" type=submit name="Submit" value="Enviar"></DIV>
<% } %>	

</FORM>
</BODY>
</HTML>
