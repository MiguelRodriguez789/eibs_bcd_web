<html>
<head>
<title>Mensajes Vencidos -  Detalle</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import = "java.io.*,java.net.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*" %>


<jsp:useBean id= "rtInstX" class= "datapro.eibs.beans.ESD005002Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

<% if(userPO.getPurpose().equals("INQUIRY")) {%>
   <% if ( userPO.getOption().equals("RT") ) {%>
         builtNewMenu(rt_i_opt);
     <%}else if ( userPO.getOption().equals("SV") ) {%>
	            builtNewMenu(sv_i_opt);
     <%}else if ( userPO.getOption().equals("LN") ) {%>
   		        <%if ( userPO.getHeader23().equals("G") ||  userPO.getHeader23().equals("V")){ %>
	                 builtNewMenu(ln_i_1_opt);
                <% } else  { %>
	                 builtNewMenu(ln_i_2_opt);
                <% } %>
     <%}else if ( userPO.getOption().equals("CD") ) {%>
	            builtNewMenu(cd_i_opt);
	            initMenu();
     <%}else if ( userPO.getOption().equals("C1") ) {%>
   		        <%if ( userPO.getCusType().equals("1") ){ %>
	                 builtNewMenu(client_inq_corp_opt);
                <% } else  { %>
	                 builtNewMenu(client_inq_personal_opt);
                <% } %>
     <%}%>
<%}%>      

function goBack() {
	document.forms[0].SCREEN.value="50";
	document.forms[0].submit();
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
}
out.println("<SCRIPT> initMenu(); </SCRIPT>");
   
Boolean isReadOnly = false;
String disabled = "";
String read = "";
   
	//inicializamos valores
	read = " readonly ";
	disabled = " disabled";
	isReadOnly = true;


%> 
<h3 align="center">Detalle Mensaje Vencido
<%	if(userPO.getOption().equals("RA")){%>
	 Cuentas Corrientes
    <%}else if(userPO.getOption().equals("SV")){%>
	 Cuentas de Ahorro
	<%}else if(userPO.getOption().equals("CD")){%>
	 Depositos a Plazo
	<%}else if(userPO.getOption().equals("LN")){%>
	 Prestamos
	<%}else if(userPO.getOption().equals("C1")){%>
	 Clientes
	<%}%>


<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_alert_messages__2.jsp, ESD0050"></h3>
<hr size="4">
 <FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.alerts.JSESD0050" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="3">
    <INPUT TYPE=HIDDEN NAME="E02WNMNME" value="<%=rtInstX.getE02WNMNME().trim()%>">
    <INPUT TYPE=HIDDEN NAME="E02WNMSEQ" VALUE="<%=rtInstX.getE02WNMSEQ().trim()%>">
    <INPUT TYPE=HIDDEN NAME="E02WNMUSE" value="<%=rtInstX.getE02WNMUSE().trim()%>">
    <INPUT TYPE=HIDDEN NAME="E02WNMACC" value="<%=rtInstX.getE02WNMACC().trim()%>">
    <INPUT TYPE=HIDDEN NAME="E02WNMACD" value="<%=rtInstX.getE02WNMACD().trim()%>">
  </p>

<table  class="tableinfo">
   <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
         <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
            <tr id="trdark"> 
               <td nowrap width="10%" > 
                  <div align="right"><b>Cliente :</b></div>
               </td>
               <td nowrap width="10%"> 
                  <div align="left">
                     <input type="text" name="E02WNMCUN" size="9" maxlength="9" readonly value="<%= rtInstX.getE02WNMCUN().trim()%>">
                  </div>
               </td>
               <td nowrap width="10%" > 
                  <div align="right"><b>Nombre :</b></div>
               </td>
               <td nowrap width="40%"> 
                  <div align="left">
                     <font face="Arial">
                        <font size="2">
                           <input type="text" name="E02WNMNA1" size="45" maxlength="45" readonly value="<%= rtInstX.getE02WNMCUM().trim()%>">
                        </font>
                     </font>
                  </div>
               </td>
               <td nowrap width="10%"> 
                  <div align="left">
                  </div>
               </td>
               <td nowrap width="20%"> 
                  <div align="left">
                  </div>
               </td>
            </tr>
            <% if (!userPO.getOption().equals("C1")){%>
            <tr id="trdark"> 
               <td nowrap width="10%"> 
                  <div align="right"><b>Cuenta :</b></div>
               </td>
               <td nowrap width="10%"> 
                  <div align="left">
                     <input type="text" name="E02WNMACC" size="12" maxlength="12" readonly value="<%= rtInstX.getE02WNMACC().trim()%>">
                  </div>
               </td>
               <td nowrap width="10%"> 
                  <div align="right"><b>Moneda : </b></div>
               </td>
               <td nowrap width="40%"> 
                  <div align="left">
                     <b><input type="text" name="E02WNMCCY" size="3" maxlength="3" readonly value="<%= rtInstX.getE02WNMCCY().trim()%>"></b>
                  </div>
               </td>
               <td nowrap width="10%"> 
                  <div align="right"><b>Producto : </b></div>
               </td>
               <td nowrap width="20%"> 
                  <div align="left"><b><input type="text" name="E02WNMPRO" size="4" maxlength="4" readonly value="<%= rtInstX.getE02WNMPRO().trim()%>"></b>
                  </div>
               </td>
            </tr>
 	        <%}%>
         </table>
      </td>
   </tr>
</table>


<TABLE class="tbenter"> 
   <TR>
		<TD align="CENTER"  width="35%">
			&nbsp;
		</TD>
		<TD align="CENTER" class="TDBKG" width="35%">
			<a href="javascript:goBack()"><b>Regresar</b></a>
		</TD>
	  	<TD align="CENTER" class="TDBKG" width="30%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE>
<H4>Datos Generales</H4>
<table  class="tableinfo">
   <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
         <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
            <tr id="trdark"> 
               <td nowrap width="20%"> 
                  <div align="right">Fecha de Apertura :</div>
               </td>
               <td nowrap width="30%"> 
                  <eibsinput:date name="rtInstX" fn_year="E02WNMFCY" fn_month="E02WNMFCM" fn_day="E02WNMFCD" readonly="true"/> 
               </td>
               <td nowrap width="20%"> 
                  <div align="right">Fecha de Vencimiento :</div>
               </td>
               <td nowrap width="30%">
                     <eibsinput:date name="rtInstX" fn_year="E02WNMFVY" fn_month="E02WNMFVM" fn_day="E02WNMFVD" readonly="true"/>
               </td>
            </tr>            
            <tr id="trclear"> 
               <td nowrap width="20%"> 
                  <div align="right">Motivo :</div>
               </td>
               <td nowrap width="30%">
                  <eibsinput:cnofc name="rtInstX" property="E02WNMMOT" value="<%=rtInstX.getE02WNMMOT()%>" required="false" flag="TM" fn_code="E02WNMMOT" fn_description="E02WNMMOD" readonly="<%=isReadOnly %>" />
                  <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0" >
                  <eibsinput:text name="rtInstX" property="E02WNMMOD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
                  <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0" >
               <td nowrap width="20%"> 
                  <div align="right">Estado :</div>
               </td>
               <td nowrap width="30%">
               	     <input type="text" readonly name="E02WNMSTS" size="10" maxlength="10" 
					     value="<% if (rtInstX.getE02WNMSTS().equals("A")) out.print("Activo");
								   else if (rtInstX.getE02WNMSTS().equals("C")) out.print("Cancelado");
								   else if (rtInstX.getE02WNMSTS().equals("R")) out.print("Atendido");
								   else if (rtInstX.getE02WNMSTS().equals("V")) out.print("Vencido");
							       else out.print("");%>">
               </td>
            </tr> 
            <tr id="trdark"> 
               <td nowrap width="20%"> 
                  <div align="right">Categoria Mensaje :</div>
               </td>
               <td nowrap width="80%" colspan="3"> 
                	<INPUT TYPE=HIDDEN NAME="E02WNMTYP" value="<%=rtInstX.getE02WNMTYP().trim()%>">
	                <input type="text" readonly name="E02WNMTYPDES" size="15" maxlength="10" 
						     value="<% if (rtInstX.getE02WNMTYP().equals("3")) out.print("Informativo");
									   else if (rtInstX.getE02WNMTYP().equals("2")) out.print("Autorizado");
									   else if (rtInstX.getE02WNMTYP().equals("1")) out.print("Restrictivo");
								       else out.print("");%>">                      
               </td>
            </tr>                       
            <tr id="trdark"> 
               <td nowrap width="20%"> 
                  <div align="right">Resumen :</div>
               </td>
               <td nowrap width="80%" colspan="3"> 
                  <input type="text" name="E02WNMDSC" size="127" maxlength="92" <%=read%> value="<%=rtInstX.getE02WNMDSC().trim()%>" >
                  <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0" >
               </td>
            </tr>
            <tr id="trclear"> 
               <td nowrap width="20%"> 
                  <div align="right">Detalle :</div>
               </td>
               <td nowrap width="80%" colspan="3"> 
                  <input type="text" name="E15WNMDSC" size="155" maxlength="132" <%=read%> value="<%= rtInstX.getE15WNMDSC().trim()%>">
                  <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0" > 
               </td>
            </tr> 
            <tr id="trclear"> 
               <td nowrap width="20%"> 
               </td>
               <td nowrap width="80%" colspan="3"> 
                  <input type="text" name="E25WNMDSC" size="155" maxlength="132" <%=read%> value="<%= rtInstX.getE25WNMDSC().trim()%>">
               </td>
            </tr> 
            <tr id="trclear"> 
               <td nowrap width="20%"> 
               </td>
               <td nowrap width="80%" colspan="3"> 
                  <input type="text" name="E35WNMDSC" size="155" maxlength="132" <%=read%> value="<%= rtInstX.getE35WNMDSC().trim()%>">
               </td>
            </tr> 
            <tr id="trclear"> 
               <td nowrap width="20%"> 
               </td>
               <td nowrap width="80%" colspan="3"> 
                  <input type="text" name="E45WNMDSC" size="155" maxlength="132" <%=read%> value="<%= rtInstX.getE45WNMDSC().trim()%>">
               </td>
            </tr> 
            <tr id="trclear"> 
               <td nowrap width="20%"> 
               </td>
               <td nowrap width="80%" colspan="3"> 
                  <input type="text" name="E55WNMDSC" size="155" maxlength="132" <%=read%> value="<%= rtInstX.getE55WNMDSC().trim()%>">
               </td>
            </tr> 
            <tr id="trclear"> 
               <td nowrap width="20%"> 
               </td>
               <td nowrap width="80%" colspan="3"> 
                  <input type="text" name="E65WNMDSC" size="155" maxlength="132" <%=read%> value="<%= rtInstX.getE65WNMDSC().trim()%>">
               </td>
            </tr> 
            <tr id="trclear"> 
               <td nowrap width="20%"> 
               </td>
               <td nowrap width="80%" colspan="3"> 
                  <input type="text" name="E75WNMDSC" size="155" maxlength="132" <%=read%> value="<%= rtInstX.getE75WNMDSC().trim()%>">
               </td>
            </tr> 
            <tr id="trclear"> 
               <td nowrap width="20%"> 
               </td>
               <td nowrap width="80%" colspan="3"> 
                  <input type="text" name="E85WNMDSC" size="155" maxlength="132" <%=read%> value="<%= rtInstX.getE85WNMDSC().trim()%>">
               </td>
            </tr> 
            <tr id="trclear"> 
               <td nowrap width="20%"> 
               </td>
               <td nowrap width="80%" colspan="3"> 
                  <input type="text" name="E95WNMDSC" size="155" maxlength="132" <%=read%> value="<%= rtInstX.getE95WNMDSC().trim()%>">
               </td>
            </tr> 
            <tr id="trclear"> 
               <td nowrap width="20%"> 
               </td>
               <td nowrap width="80%" colspan="3"> 
                  <input type="text" name="E05WNMDSC" size="155" maxlength="132" <%=read%> value="<%= rtInstX.getE05WNMDSC().trim()%>">
               </td>
            </tr> 
            <tr id="trclear"> 
               <td nowrap width="20%"> 
               </td>
               <td nowrap width="80%" colspan="3"> 
                  <input type="text" name="EA5WNMDSC" size="155" maxlength="132" <%=read%> value="<%= rtInstX.getEA5WNMDSC().trim()%>">
               </td>
            </tr> 
            <tr id="trclear"> 
               <td nowrap width="20%"> 
               </td>
               <td nowrap width="80%" colspan="3"> 
                  <input type="text" name="EB5WNMDSC" size="155" maxlength="132" <%=read%> value="<%= rtInstX.getEB5WNMDSC().trim()%>">
               </td>
            </tr> 
            <tr id="trclear"> 
               <td nowrap width="20%"> 
               </td>
               <td nowrap width="80%" colspan="3"> 
                  <input type="text" name="EC5WNMDSC" size="155" maxlength="132" <%=read%> value="<%= rtInstX.getEC5WNMDSC().trim()%>">
               </td>
            </tr> 
            <tr id="trclear"> 
               <td nowrap width="20%"> 
               </td>
               <td nowrap width="80%" colspan="3"> 
                  <input type="text" name="ED5WNMDSC" size="155" maxlength="132" <%=read%> value="<%= rtInstX.getED5WNMDSC().trim()%>">
               </td>
            </tr> 
            <tr id="trclear"> 
               <td nowrap width="20%"> 
               </td>
               <td nowrap width="80%" colspan="3"> 
                  <input type="text" name="EE5WNMDSC" size="155" maxlength="132" <%=read%> value="<%= rtInstX.getEE5WNMDSC().trim()%>">
               </td>
            </tr> 
            <tr id="trclear"> 
               <td nowrap width="20%"> 
               </td>
               <td nowrap width="80%" colspan="3"> 
                  <input type="text" name="EF5WNMDSC" size="155" maxlength="132" <%=read%> value="<%= rtInstX.getEF5WNMDSC().trim()%>">
               </td>
            </tr> 
            <tr id="trclear"> 
               <td nowrap width="20%"> 
               </td>
               <td nowrap width="80%" colspan="3"> 
                  <input type="text" name="EG5WNMDSC" size="155" maxlength="132" <%=read%> value="<%= rtInstX.getEG5WNMDSC().trim()%>">
               </td>
            </tr> 
            <tr id="trclear"> 
               <td nowrap width="20%"> 
               </td>
               <td nowrap width="80%" colspan="3"> 
                  <input type="text" name="EH5WNMDSC" size="155" maxlength="132" <%=read%> value="<%= rtInstX.getEH5WNMDSC().trim()%>">
               </td>
            </tr> 
            <tr id="trclear"> 
               <td nowrap width="20%"> 
               </td>
               <td nowrap width="80%" colspan="3"> 
                  <input type="text" name="EI5WNMDSC" size="155" maxlength="132" <%=read%> value="<%= rtInstX.getEI5WNMDSC().trim()%>">
               </td>
            </tr> 
            <tr id="trclear"> 
               <td nowrap width="100%" colspan="4"> 
               </td>
            </tr> 
            <tr id="trclear"> 
               <td nowrap width="100%" colspan="4"> 
               </td>
            </tr> 
         </table>
      </td>
   </tr> 
</table>





</form>
</body>
</html>
