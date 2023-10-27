<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<html> 
<head>
<title>ACH Transaction Inquiry</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="EACH500Record" class="datapro.eibs.beans.EACH50002Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript">

function showOfac(fieldValue){
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0092?shrAcc=" + fieldValue + "&shrCategory=ALL" + "&FromRecord=0&shrAction=INQ";
	CenterWindow(page,600,500,2);
 }

function goTransfer(refnum) {
     page = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSEPR1060?SCREEN=3&REFNUM="+ refnum;
	 CenterWindow(page,600,500,2);
  }

</SCRIPT>  
 

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
%>


<H3 align="center">Consulta de Transaccion   
	<% if (EACH500Record.getE02REQTYP().equals("I")) out.print("<B><FONT color=\"red\"> ENTRANTE </FONT></B>");%>
	<% if (EACH500Record.getE02REQTYP().equals("O")) out.print("<B><FONT color=\"green\"> SALIENTE </FONT></B>");%>
	<%= EACH500Record.getE02ACUNUM().trim()%>
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ach_detail.jsp, EACH500">
</H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.ach.JSEACH500" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
        <tr id="trdark"> 
            <td nowrap width="10%" align="right">Clase de Entrada : </td>
            <td nowrap width="30%" align="left"> 
                <INPUT type="text" name="E02ACUECD" size="4"  value="<%= EACH500Record.getE02ACUECD().trim()%>" readonly> 
				<INPUT type="text" name="E02ECDDSC" size="40" value="<%= EACH500Record.getE02ECDDSC().trim()%>" readonly>
			</td>
            <TD nowrap width="10%" align="right">Fecha Valor : </TD>
            <TD nowrap width="20%" align="left">
            	<eibsinput:date name="EACH500Record" fn_month="E02ACUVDM" fn_day="E02ACUVDD" fn_year="E02ACUVDY" readonly="true" />
            </TD>
			<TD nowrap width="10%" align="right">Estado : </TD>
			<TD nowrap width="20%" align="left">
			 <% if(EACH500Record.getE02REQSTS().equals("P")) { out.print("Pendiente de Aprobacion");
				} else if (EACH500Record.getE02REQSTS().equals("A")) { out.print("Aprobado para Enviar");		
				} else if (EACH500Record.getE02REQSTS().equals("*")) { out.print("Procesado");				
				} else if (EACH500Record.getE02REQSTS().equals("R")) { out.print("En Proceso de Retorno");
				} 
			 %> - <%= EACH500Record.getE02ACUSTC().trim()%>			
			</TD>			
		</tr>
		<tr id="trclear"> 
            <td nowrap width="10%" align="right">Compañia : </td>
            <td nowrap width="30%" align="left"> 
                <INPUT type="text" name="E02ACUOCD" size="10"  value="<%= EACH500Record.getE02ACUOCD().trim()%>" readonly> 
				<INPUT type="text" name="E02OCDDSC" size="40" value="<%= EACH500Record.getE02OCDDSC().trim()%>" readonly>
			</td>
            <TD nowrap width="10%" align="right">Fecha de Proceso : </TD>
            <TD nowrap width="20%" align="left">
            	<eibsinput:date name="EACH500Record" fn_month="E02ACURDM" fn_day="E02ACURDD" fn_year="E02ACURDY" readonly="true" />
            </TD>
			<TD nowrap width="10%" align="right">Hora de Proceso : </TD>
			<TD nowrap width="20%" align="left">			
			<%= EACH500Record.getE02ACUPTS().trim()%></TD>			
		</tr>
		<tr id="trclear"> 
            <td nowrap width="10%" align="right"> </td>
            <td nowrap width="30%" align="left"> 
			</td>
            <TD nowrap width="10%" align="right"> Lote : </TD>
            <TD nowrap width="20%" align="left">
            <INPUT type="text" name="E02ACUBTH" size="5" maxlength="4"
					value="<%= EACH500Record.getE02ACUBTH().trim()%>" readonly></TD>
			<TD nowrap width="10%" align="right">Hora Grabacion : </TD>
			<TD nowrap width="20%" align="left">			
			<%= EACH500Record.getE02ACURTS().trim()%></TD>			
		</tr>

        </table>
      </td>
    </tr>
  </table>

  <h4>Informacion Basica</h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Cuenta IBS: </td>
            <td nowrap align="left" width="35%">
				<INPUT type="text" name="E02ACUACC" size="17"  maxlength="16" value="<%= EACH500Record.getE02ACUACC().trim()%>" readonly>
				<INPUT type="text" name="E02CUNDSC" value="<%= EACH500Record.getE02CUNDSC().trim()%>" size="35" readonly>

			</td>
            <TD nowrap width="15%" align="right">Transaccion ACH : </TD>
			<TD nowrap width="35%" align="left">
				<INPUT type="text" name="E02ACUCDE" size="3"  maxlength="2" value="<%= EACH500Record.getE02ACUCDE().trim()%>" readonly>
				<INPUT type="text" name="E02CDEDSC" value="<%= EACH500Record.getE02CDEDSC().trim()%>" size="35" readonly>
			</TD>
          </tr>
		  <TR id="clear">
			<TD nowrap width="15%" align="right">Ruta : </TD>
			<TD nowrap align="left" width="35%">
				<INPUT type="text" name="E02ACUROU" size="11" maxlength="10" value="<%= EACH500Record.getE02ACUROU().trim()%>" readonly>
			</TD>
			<TD nowrap width="15%" align="right">Cuenta del Receptor : </TD>
			<TD nowrap width="35%" align="left">
				<INPUT type="text" name="E02ACUDAC" size="21" maxlength="20" value="<%= EACH500Record.getE02ACUDAC().trim()%>" readonly> 
				<SELECT name="E02ACUACT" disabled>
					<OPTION <%= EACH500Record.getE02ACUACT().trim().equals("C")?"Selected":"" %> value="C">Checks</OPTION>
					<OPTION <%= EACH500Record.getE02ACUACT().trim().equals("S")?"Selected":"" %> value="S">Saving</OPTION>
					<OPTION <%= EACH500Record.getE02ACUACT().trim().equals("L")?"Selected":"" %> value="L">Loans</OPTION>
					<OPTION <%= EACH500Record.getE02ACUACT().trim().equals("R")?"Selected":"" %> value="R">Credit Card</OPTION>
				</SELECT> 
			</TD>
			</TR>
			<TR id="trdark">
				<TD nowrap width="15%" align="right">Monto : </TD>
				<TD nowrap width="35%" align="left">
					<INPUT type="text" name="E02ACUAMT" size="16" maxlength="15" value="<%= EACH500Record.getE02ACUAMT().trim()%>" readonly> 	
				 	<INPUT type="text" name="E02ACUCCY" size="4" maxlength="3" value="<%= EACH500Record.getE02ACUCCY().trim()%>" readonly> 	
				</TD>
				
				<TD nowrap width="15%" align="right">Numero de Identificacion : </TD>
				<TD nowrap width="35%" align="left">
					<INPUT type="text" name="E02ACUIDN" size="16" maxlength="15" value="<%= EACH500Record.getE02ACUIDN().trim()%>" readonly> 
				</TD>
			</TR>
			<tr id="trclear"> 
            <td nowrap width="15%" align="right">Beneficiario : </td>
			<td nowrap width="35%" align="left">
				<INPUT type="text" name="E02ACUNME" size="46" maxlength="45" value="<%= EACH500Record.getE02ACUNME().trim()%>" readonly> 
				<% if (EACH500Record.getH02FLGWK3().trim().equals("3")) { %>
					<IMG border="0" src="<%=request.getContextPath()%>/images/warning_16.jpg" title="OFAC Match List" onClick="showOfac('<%= EACH500Record.getE02ACUNUM()%>')">
				<% } %>
			</td>
            <td nowrap width="15%" align="right">Direccion de eMail : </td>
			<td nowrap width="35%" align="left">
				<INPUT type="text" name="E02ACUEMA" size="61" maxlength="60" value="<%= EACH500Record.getE02ACUEMA().trim()%>" readonly> 
			</td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Direccion :  </td>
			<td nowrap width="35%" align="left">
				<INPUT type="text" id="E02ACUADR" name="E02ACUADR" size="46" maxlength="45" value="<%= EACH500Record.getE02ACUADR().trim()%>" readonly> 
			</td>
            <td nowrap width="15%" align="right"> </td>
			<td nowrap width="35%" align="left"></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" align="right">Ciudad, Estado, Codigo Postal: </td>
			<td nowrap width="35%" align="left">
				<INPUT type="text" name="E02ACUCSZ" size="46" maxlength="45" value="<%= EACH500Record.getE02ACUCSZ().trim()%>" readonly> 
			</td>
            <td nowrap width="15%" align="right">Referencia IBS : </td>
			<td nowrap width="35%" align="left">
				<INPUT type="text" name="E02ACUREF" size="10" maxlength="9" value="<%= EACH500Record.getE02ACUREF().trim()%>" readonly>
				<A href="javascript:goTransfer(<%= EACH500Record.getE02ACUREF().trim()%>)">
				<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Consultar" border="0"></A>
			</td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="15%" align="right"></td>
			<td nowrap width="35%" align="left"></td>
            <td nowrap width="15%" align="right"></td> 
            <td nowrap width="35%" align="left"></td>
          </tr>
        </table> 
      </td>  
    </tr>
  </table>

  <h4>Addenda(s)</h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="50%" align="left"><b>(1)</b> <%= EACH500Record.getE02ACUAD1().trim()%></td>
			<td nowrap width="50%" align="left"><b>(7)</b> <%= EACH500Record.getE02ACUAD7().trim()%></td>
          </tr>
		  <TR id="clear">
            <td nowrap width="50%" align="left"><b>(2)</b> <%= EACH500Record.getE02ACUAD2().trim()%></td>
			<td nowrap width="50%" align="left"><b>(8)</b> <%= EACH500Record.getE02ACUAD8().trim()%></td>
		  </TR>
			<TR id="trdark">
            <td nowrap width="50%" align="left"><b>(3)</b> <%= EACH500Record.getE02ACUAD3().trim()%></td>
			<td nowrap width="50%" align="left"><b>(9)</b> <%= EACH500Record.getE02ACUAD9().trim()%></td>
		  </TR>
			<tr id="trclear"> 
            <td nowrap width="50%" align="left"><b>(4)</b> <%= EACH500Record.getE02ACUAD4().trim()%></td>
			<td nowrap width="50%" align="left"><b>(10)</b> <%= EACH500Record.getE02ACUADA().trim()%></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="50%" align="left"><b>(5)</b> <%= EACH500Record.getE02ACUAD5().trim()%></td>
			<td nowrap width="50%" align="left"><b>(11)</b> <%= EACH500Record.getE02ACUADB().trim()%></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="50%" align="left"><b>(6)</b> <%= EACH500Record.getE02ACUAD6().trim()%></td>
			<td nowrap width="50%" align="left"><b>(12)</b> <%= EACH500Record.getE02ACUADC().trim()%></td>
          </tr>
        </table> 
      </td>  
    </tr>
  </table>

  
  </form>
</body>
</html>
