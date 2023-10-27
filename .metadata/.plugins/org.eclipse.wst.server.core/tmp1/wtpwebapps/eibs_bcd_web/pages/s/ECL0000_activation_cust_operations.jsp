<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"> 
<html>
<head>
<title>Activación de Productos y Servicios</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id= "msgCust" class= "datapro.eibs.beans.ECL0000DSMessage"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "prodList" class= "datapro.eibs.beans.JBObjList"  scope="session" />

<script type="text/javascript">
function goAction(op) {
	if (op == "DCACTV") { // Debit Card Activation
		page = "${pageContext.request.contextPath}/servlet/datapro.eibs.misc.JSECL0000?SCREEN=800&option=191";
	}
	if (op == "DCUNBL") { // Debit Card Unblock
		page = "${pageContext.request.contextPath}/servlet/datapro.eibs.misc.JSECL0000?SCREEN=800&option=192";
	}
	CenterWindow(page,800,600,2);
}

function transfer (cedula, accion){
          try{
            window.external.MensajeIVR(cedula+','+accion);
            //window.external.MensajeIVR(cedula, accion);
          }catch(error){
              alert ('El script debe ejecutarse dentro del contexto del cliente ATENTO');
          } 
        }
</script>

</head>

<body >
<h3 align="center">Activación de Productos y Servicios<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="activation_cust_operations.jsp, ECL0000"> 
</h3>
<hr size="4">
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0"); 
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
%> 
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.misc.JSECL0000" onSubmit="return validate()">
  <INPUT TYPE="hidden" NAME="SCREEN" VALUE="400">
  <input type="hidden" name="option" value="">

  <h4>Información del Cliente</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right">Identificación del Cliente :</div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
              	<input type="text" name="E01CCLIDT" size="2" maxlength="1" value="<%= userPO.getHeader1() %>" readonly>
              	<input type="text" name="E01CCLIDN" size="10" maxlength="9" value="<%= userPO.getHeader2() %>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right">Nombre del Cliente :</div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E01CCLNA1" size="36" maxlength="35" value="<%= userPO.getHeader3() %>" readonly>
              </div>
            </td>
          </tr>    
        </table>
      </td>
    </tr>
  </table>
  <%--
  <h4>Productos del Cliente</h4>     
	<TABLE id="mainTable" class="tableinfo" ALIGN=CENTER>
		<TR> 
			<TD NOWRAP>
				<table id="headTable" width="100%">
					<TR id="trdark"> 
						<th align="center" width="2%"></th>
						<th align="center" width="30%">Número</th>
						<th align="center" width="68%">Descripción</th>
					</tr>
					<%
						prodList.initRow();
						while (prodList.getNextRow()) {
                 			datapro.eibs.beans.ECL000001Message msg = (datapro.eibs.beans.ECL000001Message) prodList.getRecord();
					%> 
					<tr id="trclear"> 
				      <td align="center" nowrap > 
				          <input type="radio" name="E02NROPRO" value="<%= msg.getE02NROPRO() %>">
				      </td>
				      <td align="center" nowrap >  
				          <%= msg.getE02NROPRO() %>
				      </td>
				      <td align="center" nowrap > 
				          <%= msg.getE02DESPRO() %>
				      </td>												
					<% } %> 
				</TABLE>
			</TD>
		</TR>	
	</TABLE>
  --%>
  <h4>Listado de Operaciones</h4>
  <TABLE class="tbenter" width="100%">
		<TBODY>
			<TR valign="bottom">
				<TD width="50%">
					<DIV id="btnOption1" align="left">
						<IMG border="0" src="<%=request.getContextPath()%>/images/ico1.gif" width="16" height="16" align="middle">
						<A href="javascript:goAction('DCACTV')"><B>Activación de Tarjeta de Débito</B></A>
					</DIV>
				</TD>
			</TR>
			<TR valign="bottom">
				<TD width="50%">
					<DIV id="btnOption1" align="left">
						<IMG border="0" src="<%=request.getContextPath()%>/images/ico1.gif" width="16" height="16" align="middle">
						<A href="javascript:goAction('DCUNBL')"><B>Desbloqueo de Tarjeta de Débito</B></A>
					</DIV>
				</TD>
			</TR>
		</TBODY>
  </TABLE>
  <h4>Listado de Operaciones con Atento</h4>
  <TABLE class="tbenter" width="100%">
		<TBODY>
            <TR valign="bottom">
				<TD width="50%">
					<DIV id="btnOption1" align="left">
						<IMG border="0" src="<%=request.getContextPath()%>/images/ico1.gif" width="16" height="16" align="middle">
						<A href="javascript:transfer('<%= userPO.getHeader2().trim()%>', 'DT')"><B>IVR - Desbloqueo de Tarjeta de Débito</B></A>
					</DIV>
				</TD>
			</TR>
		</TBODY>
  </TABLE>

<SCRIPT type="text/javascript">;
        refillLeftField('0',9,'E01CCLIDN');
</SCRIPT>

  </form>
</body>
</html>
