<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import = "datapro.eibs.master.*" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@page import="com.datapro.eibs.constants.StyleID"%>

<html>
<head>
<title>Consulta de Cobranzas Documentarias</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<jsp:useBean id="collBasic" class="datapro.eibs.beans.EDC010001Message"  scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
  <% if(request.getParameter("OPTMENU") != null) { %>
   		builtNewMenu(<%= request.getParameter("OPTMENU")%>);
   <%} else {%>
   builtNewMenu(coll_i_opt);
 <%}%>
</SCRIPT>

</head>

<body bgcolor="#FFFFFF">

<%@ page import = "datapro.eibs.master.Util" %>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
    out.println("<SCRIPT> initMenu(); </SCRIPT>");

%>

<H3 align="center">Consulta de Cobranza Documentaria Enviada<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="coll_doc_inq_basic_outgoingq,EDC0100"></h3>
<hr size="4">
<form method="post">
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="14%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="9%" > 
              <div align="left"> 
                <input type="text" name="E02CUN2" size="9" maxlength="9" readonly value="<%= userPO.getHeader2().trim()%>">
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E02NA12" size="45" maxlength="45" readonly value="<%= userPO.getHeader3().trim()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap ><b> 
              <input type="text" name="E02PRO2" size="4" maxlength="4" readonly value="<%= userPO.getHeader1().trim()%>">
              </b></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="14%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"> 
                <input type="text" name="E02ACC" size="12" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%"> 
              <div align="right">Oficial :</div>
            </td>
            <td nowrap width="33%"> 
              <div align="left"><b> 
                <input type="text" name="E02NA122" size="30" maxlength="30" readonly value="<%= userPO.getOfficer().trim()%>">
                </b> </div>
            </td>
            <td nowrap width="11%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="21%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="14%"> 
              <div align="right"><b>Nuestra Referencia :</b></div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"> <input type="text" name="E01DCMORF" readonly size="16" maxlength="16" value="<%= collBasic.getE01DCMORF().trim()%>">
             </div>
            </td>
            <td nowrap width="12%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="33%"> 
              <div align="left"><b> 
                </b> </div>
            </td>
            <td nowrap width="11%"> 
              <div align="right"><b></b></div>
            </td>
            <td nowrap width="21%"> 
              <div align="left"><b> 
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
 <h4>Girador (Exportador)</h4>
<table class="tableinfo">
	<tr>
		<td>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trdark">
				<td align="right">
				<table border="0" cellspacing="0">
					<tr id="trdark">
						<td align="right">Numero de Cliente o de Cuenta:</td>
						<td nowrap width="25%">
							<select name="E01DCMAF1" disabled>
								<option value=" " <%if (!(collBasic.getE01DCMAF1().equals("C") || collBasic.getE01DCMAF1().equals("A"))) out.print("selected");%> selected></option>
								<option value="C" <%if (collBasic.getE01DCMAF1().equals("C")) out.print("selected");%>>Cliente</option>
								<option value="A" <%if (collBasic.getE01DCMAF1().equals("A")) out.print("selected");%>>Cuenta</option>
							</select>
						</td>
					</tr>
				</table>
				</td>
				<td>
				<table border="0" cellspacing="0">
					<tr id="trdark">
						<td align="left">
							<input type="text" name="E01DCMDRA" size="12" maxlength="12" value="<%=collBasic.getE01DCMDRA()%>" readonly>
						</td>
						<td>
						</td>
					</tr>
				</table>
				</td>
			</tr>
			<tr id="trclear">
				<td>
					<div align="right">Nombre :</div>
				</td>
				<td>
					<div align="left">
						<input type="text" name="E01DCMDR1" size="45" maxlength="35" value="<%=collBasic.getE01DCMDR1()%>" readonly>
					</div>
				</td>
			</tr>
			<tr id="trdark">
				<td>
					<div align="right">Dirección :</div>
				</td>
				<td>
					<div align="left">
						<input type="text" name="E01DCMDR2" size="45" maxlength="35" value="<%=collBasic.getE01DCMDR2()%>" readonly>
					</div>
				</td>
			</tr>
			<tr id="trclear">
				<td>
					<div align="right"></div>
				</td>
				<td>
					<div align="left">
						<input type="text" name="E01DCMDR3" size="45" maxlength="35" value="<%=collBasic.getE01DCMDR3()%>" readonly>
					</div>
				</td>
			</tr>
			<tr id="trdark">
				<td>
					<div align="right"></div>
				</td>
				<td>
					<div align="left">
						<input type="text" name="E01DCMDR4" size="45" maxlength="35" value="<%=collBasic.getE01DCMDR4()%>" readonly>
					</div>
				</td>
			</tr>
			<tr id="trclear">
				<td>
					<div align="right">Referencia :</div>
				</td>
				<td>
					<div align="left">
						<input type="text" name="E01DCMDRF" size="20" maxlength="16" value="<%=collBasic.getE01DCMDRF()%>" readonly>
					</div>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

<h4>Girado (Importador)</h4>
<table class="tableinfo">
	<tr>
		<td>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trdark">
				<td align="right">
				<table border="0" cellspacing="0">
					<tr id="trdark">
						<td align="right">Numero de Cliente o de Cuenta:</td>
						<td nowrap width="25%">
							<select name="E01DCMAF2" disabled>
								<option value=" " <%if (!(collBasic.getE01DCMAF2().equals("C") || collBasic.getE01DCMAF2().equals("A"))) out.print("selected");%> selected></option>
								<option value="C" <%if (collBasic.getE01DCMAF2().equals("C")) out.print("selected");%>>Cliente</option>
								<option value="A" <%if (collBasic.getE01DCMAF2().equals("A")) out.print("selected");%>>Cuenta</option>
							</select>
						</td>
					</tr>
				</table>
				</td>
				<td>
				<table border="0" cellspacing="0">
					<tr id="trdark">
						<td align="left">
							<input type="text" name="E01DCMDWA" size="12" maxlength="12" value="<%=collBasic.getE01DCMDWA()%>" readonly>
						</td>
						<td>
						</td>
					</tr>
				</table>
				</td>
			</tr>
			<tr id="trclear">
				<td>
					<div align="right">Nombre :</div>
				</td>
				<td>
					<div align="left">
						<input type="text" name="E01DCMDW1" size="45" maxlength="35" value="<%=collBasic.getE01DCMDW1()%>" readonly>
					</div>
				</td>
			</tr>
			<tr id="trdark">
				<td>
					<div align="right">Dirección :</div>
				</td>
				<td>
					<div align="left">
						<input type="text" name="E01DCMDW2" size="45" maxlength="35" value="<%=collBasic.getE01DCMDW2()%>" readonly>
					</div>
				</td>
			</tr>
			<tr id="trclear">
				<td>
					<div align="right"></div>
				</td>
				<td>
					<div align="left">
						<input type="text" name="E01DCMDW3" size="45" maxlength="35" value="<%=collBasic.getE01DCMDW3()%>" readonly>
					</div>
				</td>
			</tr>
			<tr id="trdark">
				<td>
					<div align="right"></div>
				</td>
				<td>
					<div align="left">
						<input type="text" name="E01DCMDW4" size="45" maxlength="35" value="<%=collBasic.getE01DCMDW4()%>" readonly>
					</div>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

<h4>Banco Remitente</h4>
<table class="tableinfo">
	<tr>
		<td>
		<TABLE cellspacing="0" cellpadding="2" width="100%" border="0">
			<TBODY><TR id="trdark">
				<TD align="right">
				<TABLE border="0" cellspacing="0">
					<TBODY><TR id="trdark">
						<TD align="right">Numero de Cliente o de Cuenta:</TD>
						<TD nowrap width="25%"><SELECT name="E01DCMAF3" disabled>
							<OPTION value=" "></OPTION>
							<OPTION value="C" <%if (collBasic.getE01DCMAF3().equals("C")) out.print("selected");%>>Cliente</OPTION>
							<OPTION value="A" <%if (collBasic.getE01DCMAF3().equals("A")) out.print("selected");%>>Cuenta</OPTION>
						</SELECT></TD>
					</TR>
				</TBODY></TABLE>
				</TD>
				<TD>
				<TABLE border="0" cellspacing="0">
					<TBODY>
						<TR id="trdark">
							<TD align="left">
								<INPUT type="text" name="E01DCMRBA" size="12" maxlength="12" value="<%=collBasic.getE01DCMRBA()%>" readonly>
							</TD>
							<TD>
							</TD>
						</TR>
					</TBODY>
				</TABLE>
				</TD>
			</TR>
			  <TR id="trclear">
			    <TD align="right" nowrap>Codigo Swift:</TD>
			    <TD align="left" nowrap><INPUT type="text" name="E01DCMRBI" size="14" maxlength="12" value="<%=collBasic.getE01DCMRBI()%>" readonly>
				 </TD>
			  </TR>
			<TR id="trdark">
				<TD>
					<DIV align="right">Nombre :</DIV>
				</TD>
				<TD>
					<DIV align="left">
						<INPUT type="text" name="E01DCMRB1" size="45" maxlength="35" value="<%=collBasic.getE01DCMRB1()%>" readonly>
					</DIV>
				</TD>
			</TR>
			<TR id="trclear">
				<TD>
					<DIV align="right">Dirección :</DIV>
				</TD>
				<TD>
					<DIV align="left">
						<INPUT type="text" name="E01DCMRB2" size="45" maxlength="35" value="<%=collBasic.getE01DCMRB2()%>" readonly>
					</DIV>
				</TD>
			</TR>
			<TR id="trdark">
				<TD>
					<DIV align="right"></DIV>
				</TD>
				<TD>
					<DIV align="left">
						<INPUT type="text" name="E01DCMRB3" size="45" maxlength="35" value="<%=collBasic.getE01DCMRB3()%>" readonly>
					</DIV>
				</TD>
			</TR>
			<TR id="trclear">
				<TD>
					<DIV align="right"></DIV>
				</TD>
				<TD>
					<DIV align="left">
						<INPUT type="text" name="E01DCMRB4" size="45" maxlength="35" value="<%=collBasic.getE01DCMRB4()%>" readonly>
					</DIV>
				</TD>
			</TR>
			<TR id="trdark">
				<TD>
					<DIV align="right">Referencia :</DIV>
				</TD>
				<TD>
					<DIV align="left">
						<INPUT type="text" name="E01DCMRRF" size="20" maxlength="16" value="<%=collBasic.getE01DCMRRF()%>" readonly>
					</DIV>
				</TD>
			</TR>
		</TBODY></TABLE>
		</td>
	</tr>
</table>

<h4>Banco Cobrador</h4>
<table class="tableinfo">
	<tr>
		<td>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trdark">
				<td align="right">
				<table border="0" cellspacing="0">
					<tr id="trdark">
						<td align="right">Numero de Cliente o de Cuenta:</td>
						<td nowrap width="25%">
							<select name="E01DCMAF4" disabled>
								<option value=" " <%if (!(collBasic.getE01DCMAF4().equals("C") || collBasic.getE01DCMAF4().equals("A"))) out.print("selected");%> selected></option>
								<option value="C" <%if (collBasic.getE01DCMAF4().equals("C")) out.print("selected");%>>Cliente</option>
								<option value="A" <%if (collBasic.getE01DCMAF4().equals("A")) out.print("selected");%>>Cuenta</option>
							</select>
						</td>
					</tr>
				</table>
				</td>
				<td>
				<table border="0" cellspacing="0">
					<tr id="trdark">
						<td align="left">
							<input type="text" name="E01DCMCLA" size="12" maxlength="12" value="<%=collBasic.getE01DCMCLA()%>" readonly>
							
						</td>
						<td>
						</td>
					</tr>
				</table>
				</td>
			</tr>
			  <TR id="trclear">
			    <TD align="right" nowrap>Codigo Swift:</TD>
			    <TD align="left" nowrap><INPUT type="text" name="E01DCMCLI" size="14" maxlength="12" value="<%=collBasic.getE01DCMCLI()%>" readonly>
				</TD>
			  </TR>
			<tr id="trdark">
				<td>
					<div align="right">Nombre :</div>
				</td>
				<td>
					<div align="left">
						<input type="text" name="E01DCMCL1" size="45" maxlength="35" value="<%=collBasic.getE01DCMCL1()%>" readonly>
					</div>
				</td>
			</tr>
			<tr id="trclear">
				<td>
					<div align="right">Dirección :</div>
				</td>
				<td>
					<div align="left"><input type="text" name="E01DCMCL2" size="45" maxlength="35" value="<%=collBasic.getE01DCMCL2()%>" readonly>
				</div>
				</td>
			</tr>
			<tr id="trdark">
				<td>
					<div align="right"></div>
				</td>
				<td>
					<div align="left">
						<input type="text" name="E01DCMCL3" size="45" maxlength="35" value="<%=collBasic.getE01DCMCL3()%>" readonly>
					</div>
				</td>
			</tr>
			<tr id="trclear">
				<td>
					<div align="right"></div>
				</td>
				<td>
					<div align="left">
						<input type="text" name="E01DCMCL4" size="45" maxlength="35" value="<%=collBasic.getE01DCMCL4()%>" readonly>
					</div>
				</td>
			</tr>
			<tr id="trdark">
				<td>
					<div align="right">Referencia :</div>
				</td>
				<td>
					<div align="left">
						<input type="text" name="E01DCMCRF" size="20" maxlength="16" value="<%=collBasic.getE01DCMCRF()%>" readonly>
					</div>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>


<%-- START ADDED BY LMCR / MRC 20120622 --%>

<h4>Banco Receptor de Fondos</h4>
<table class="tableinfo">
	<tr>
		<td>
		<TABLE cellspacing="0" cellpadding="2" width="100%" border="0">
			<TBODY><TR id="trdark">
				<TD align="right">
				<TABLE border="0" cellspacing="0">
					<TBODY><TR id="trdark">
						<TD align="right">Numero de Cliente o de Cuenta:</TD>
						<TD nowrap width="25%"><SELECT name="E01DCMAF5" disabled>
							<OPTION value=" "></OPTION>
							<OPTION value="C" <%if (collBasic.getE01DCMAF5().equals("C")) out.print("selected");%>>Cliente</OPTION>
							<OPTION value="A" <%if (collBasic.getE01DCMAF5().equals("A")) out.print("selected");%>>Cuenta</OPTION>
						</SELECT></TD>
					</TR>
				</TBODY></TABLE>
				</TD>
				<TD>
				<TABLE border="0" cellspacing="0">
					<TBODY>
						<TR id="trdark">
							<TD align="left">
								<INPUT type="text" name="E01DCMSRA" size="12" maxlength="12" value="<%=collBasic.getE01DCMSRA()%>">
							</TD>
							<TD>
							</TD>
						</TR>
					</TBODY>
				</TABLE>
				</TD>
			</TR>
			  <TR id="trclear">
			    <TD align="right" nowrap>Codigo Swift:</TD>
			    <TD align="left" nowrap><INPUT type="text" name="E01DCMSRI" size="14" maxlength="12" value="<%=collBasic.getE01DCMSRI()%>" readonly>
				</TD>
			  </TR>
			<TR id="trdark">
				<TD>
					<DIV align="right">Nombre :</DIV>
				</TD>
				<TD>
					<DIV align="left">
						<INPUT type="text" name="E01DCMSRB" size="45" maxlength="35" value="<%=collBasic.getE01DCMSRB()%>" readonly>
					</DIV>
				</TD>
			</TR>
			<TR id="trclear">
				<TD>
					<DIV align="right">Dirección :</DIV>
				</TD>
				<TD>
					<DIV align="left">
						<INPUT type="text" name="E01DCMSR2" size="45" maxlength="35" value="<%=collBasic.getE01DCMSR2()%>" readonly>
					</DIV>
				</TD>
			</TR>
			<TR id="trdark">
				<TD>
					<DIV align="right"></DIV>
				</TD>
				<TD>
					<DIV align="left">
						<INPUT type="text" name="E01DCMSR3" size="45" maxlength="35" value="<%=collBasic.getE01DCMSR3()%>" readonly>
					</DIV>
				</TD>
			</TR>
			<TR id="trclear">
				<TD>
					<DIV align="right"></DIV>
				</TD>
				<TD>
					<DIV align="left">
						<INPUT type="text" name="E01DCMSR4" size="45" maxlength="35" value="<%=collBasic.getE01DCMSR4()%>" readonly>
					</DIV>
				</TD>
			</TR>
			<TR id="trdark">
				<TD>
					<DIV align="right">Nuestra Cuenta :</DIV>
				</TD>
				<TD>
					<DIV align="left">
						<INPUT type="text" name="E01DCMNAC" size="45" maxlength="34" value="<%=collBasic.getE01DCMNAC()%>" readonly>
					</DIV>
				</TD>
			</TR>
		</TBODY></TABLE>
		</td>
	</tr>
</table>

<%-- END ADDED BY LMCR / MRC 20120622 --%>

  <h4>Información de la Cobranza</h4>
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF">
      <td nowrap>
        <TABLE cellspacing="0" cellpadding="2" width="100%" border="0">
          <TBODY>
          <TR id="trdark">
            <TD nowrap width="30%">
             	<DIV align="right">Oficina :</DIV>
			</TD><TD nowrap width="20%">
			    <INPUT type="text" name="E01DCMBRN" maxlength="3" size="3" value="<%= collBasic.getE01DCMBRN().trim()%>" readonly>
            </TD>
			<TD nowrap width="30%">
             	<DIV align="right">Centro de Costo :</DIV>
            </TD><TD nowrap width="20%">
            	<INPUT type="text" name="E01DCMCCN" maxlength="9" size="10" value="<%= collBasic.getE01DCMCCN().trim()%>" readonly>
			</TD>
          </TR>
           <TR id="trclear">
            
			<TD nowrap width="30%">
             	<DIV align="right">Moneda Extranjera :</DIV>
            </TD><TD nowrap width="20%">
           		    <INPUT type="text" name="E01DCMFCY" maxlength="3" size="3" value="<%= collBasic.getE01DCMFCY().trim()%>" readonly>
            </TD>
            <TD nowrap width="30%">
             	<DIV align="right">Tasa de Cambio M/E :</DIV>
			</TD><TD nowrap width="20%">
            	<INPUT type="text" name="E01DCMOFX" maxlength="19" size="20" value="<%= collBasic.getE01DCMOFX().trim()%>" readonly>
            </TD>
          </TR>
          <TR id="trdark">
            <TD nowrap width="30%">
             	<DIV align="right">Monto de la Cobranza :</DIV>
			</TD><TD nowrap width="20%">
            	<INPUT type="text" name="E01DCMOAM" maxlength="19" size="20" value="<%= collBasic.getE01DCMOAM().trim()%>" readonly>
            </TD>
			<TD nowrap width="30%">
             	<DIV align="right">Protestar :</DIV>
            </TD><TD nowrap width="20%">
            	<INPUT type="radio" name="E01DCMPTF" value="Y" <%if(collBasic.getE01DCMPTF().equals("Y")) out.print("checked");%> disabled>Sí
            	<INPUT type="radio" name="E01DCMPTF" value="N" <%if(collBasic.getE01DCMPTF().equals("N")) out.print("checked");%> disabled>No
			</TD>
          </TR>
          <TR id="trclear">
            <TD nowrap width="30%">
             	<DIV align="right">Entregar Documentos Contra :</DIV>
            </TD>
            <TD nowrap width="20%">
				<SELECT name="E01DCMRDF" disabled>
					<OPTION value=" " <% if ((!collBasic.getE01DCMRDF().equals("P")) && (!collBasic.getE01DCMRDF().equals("A"))) out.println("selected"); %>></OPTION>
					<OPTION value="P" <% if (collBasic.getE01DCMRDF().equals("P")) out.println("selected"); %>>Pago</OPTION>
					<OPTION value="A" <% if (collBasic.getE01DCMRDF().equals("A")) out.println("selected"); %>>Aceptación</OPTION>
				</SELECT>
			</TD>
			<TD nowrap width="30%">
             	<DIV align="right">Condonar Cargos :</DIV>
            </TD><TD nowrap width="20%">
            	<INPUT type="radio" name="E01DCMWCF" value="Y" <%if(collBasic.getE01DCMWCF().equals("Y")) out.print("checked");%> disabled>Sí
            	<INPUT type="radio" name="E01DCMWCF" value="N" <%if(collBasic.getE01DCMWCF().equals("N")) out.print("checked");%> disabled>No
			</TD>
          </TR>
          <TR id="trdark">
            <TD nowrap width="30%">
             	<DIV align="right">Avisar Aceptación Vía :</DIV>
            </TD>
            <TD nowrap width="20%">
				<SELECT name="E01DCMAAF" disabled>
					<OPTION value=" " <% if ((!collBasic.getE01DCMAAF().equals("E")) && (!collBasic.getE01DCMAAF().equals("S")) && (!collBasic.getE01DCMAAF().equals("A")) && (!collBasic.getE01DCMAAF().equals("C")) && (!collBasic.getE01DCMAAF().equals("F"))) out.println("selected"); %>></OPTION>
					<OPTION value="E" <% if (collBasic.getE01DCMAAF().equals("E")) out.println("selected"); %>>E-mail</OPTION>
					<OPTION value="S" <% if (collBasic.getE01DCMAAF().equals("S")) out.println("selected"); %>>Swift</OPTION>
					<OPTION value="A" <% if (collBasic.getE01DCMAAF().equals("A")) out.println("selected"); %>>Correo Aéreo</OPTION>
					<OPTION value="C" <% if (collBasic.getE01DCMAAF().equals("C")) out.println("selected"); %>>Courier</OPTION>
					<OPTION value="F" <% if (collBasic.getE01DCMAAF().equals("F")) out.println("selected"); %>>Fax</OPTION>
				</SELECT>
			</TD>
			<TD nowrap width="30%">
             	<DIV align="right">Pagos Parciales :</DIV>
			</TD>
            <TD nowrap width="20%">
            	<INPUT type="radio" name="E01DCMPPF" value="Y" <%if(collBasic.getE01DCMPPF().equals("Y")) out.print("checked");%> disabled>Sí
            	<INPUT type="radio" name="E01DCMPPF" value="N" <%if(collBasic.getE01DCMPPF().equals("N")) out.print("checked");%> disabled>No
            </TD>
          </TR>
          <TR id="trclear">
            <TD nowrap width="30%">
             	<DIV align="right">Avisar No Aceptación Vía :</DIV>
			</TD><TD nowrap width="20%">
				<SELECT name="E01DCMADF" disabled>
					<OPTION value=" " <% if ((!collBasic.getE01DCMADF().equals("E")) && (!collBasic.getE01DCMADF().equals("S")) && (!collBasic.getE01DCMADF().equals("A")) && (!collBasic.getE01DCMADF().equals("C")) && (!collBasic.getE01DCMADF().equals("F"))) out.println("selected"); %>></OPTION>
					<OPTION value="E" <% if (collBasic.getE01DCMADF().equals("E")) out.println("selected"); %>>E-mail</OPTION>
					<OPTION value="S" <% if (collBasic.getE01DCMADF().equals("S")) out.println("selected"); %>>Swift</OPTION>
					<OPTION value="A" <% if (collBasic.getE01DCMADF().equals("A")) out.println("selected"); %>>Correo Aéreo</OPTION>
					<OPTION value="C" <% if (collBasic.getE01DCMADF().equals("C")) out.println("selected"); %>>Courier</OPTION>
					<OPTION value="F" <% if (collBasic.getE01DCMADF().equals("F")) out.println("selected"); %>>Fax</OPTION>
				</SELECT>
            </TD>
			<TD nowrap width="30%">
             	<DIV align="right">Condonar Intereses :</DIV>
			</TD>
            <TD nowrap width="20%">
            	<INPUT type="radio" name="E01DCMWIF" value="Y" <%if(collBasic.getE01DCMWIF().equals("Y")) out.print("checked");%> disabled>Sí
            	<INPUT type="radio" name="E01DCMWIF" value="N" <%if(collBasic.getE01DCMWIF().equals("N")) out.print("checked");%> disabled>No
            </TD>
          </TR>
          <TR id="trdark">
            <TD nowrap width="30%">
             	<DIV align="right">Avisar Pago Vía :</DIV>
			</TD>
			<TD nowrap width="20%">
				<SELECT name="E01DCMAPF" disabled>
					<OPTION value=" " <% if ((!collBasic.getE01DCMAPF().equals("E")) && (!collBasic.getE01DCMAPF().equals("S")) && (!collBasic.getE01DCMAPF().equals("A")) && (!collBasic.getE01DCMAPF().equals("C")) && (!collBasic.getE01DCMAPF().equals("F"))) out.println("selected"); %>></OPTION>
					<OPTION value="E" <% if (collBasic.getE01DCMAPF().equals("E")) out.println("selected"); %>>E-mail</OPTION>
					<OPTION value="S" <% if (collBasic.getE01DCMAPF().equals("S")) out.println("selected"); %>>Swift</OPTION>
					<OPTION value="A" <% if (collBasic.getE01DCMAPF().equals("A")) out.println("selected"); %>>Correo Aéreo</OPTION>
					<OPTION value="C" <% if (collBasic.getE01DCMAPF().equals("C")) out.println("selected"); %>>Courier</OPTION>
					<OPTION value="F" <% if (collBasic.getE01DCMAPF().equals("F")) out.println("selected"); %>>Fax</OPTION>
				</SELECT>
            </TD>
			<TD nowrap width="30%">
             	<DIV align="right">Tracers Vía Swift :</DIV>
			</TD>
            <TD nowrap width="20%">
            	<INPUT type="radio" name="E01DCMTVS" value="Y" <%if(collBasic.getE01DCMTVS().equals("Y")) out.print("checked");%> disabled>Sí
            	<INPUT type="radio" name="E01DCMTVS" value="N" <%if(collBasic.getE01DCMTVS().equals("N")) out.print("checked");%> disabled>No
            </TD>
          </TR>
          <TR id="trclear">
            <TD nowrap width="30%">
             	<DIV align="right">Cargos Nuestros x Cta. del :</DIV>
            </TD>
            <TD nowrap width="20%">
				<SELECT name="E01DCMOCF" disabled>
					<OPTION value=" " <% if ((!collBasic.getE01DCMOCF().equals("D")) && (!collBasic.getE01DCMOCF().equals("P")) && (!collBasic.getE01DCMOCF().equals("N"))) out.println("selected"); %>></OPTION>
					<OPTION value="D" <% if (collBasic.getE01DCMOCF().equals("D")) out.println("selected"); %>>Girado/Importador</OPTION>
					<OPTION value="P" <% if (collBasic.getE01DCMOCF().equals("P")) out.println("selected"); %>>Girador/Exportador</OPTION>
					<OPTION value="N" <% if (collBasic.getE01DCMOCF().equals("N")) out.println("selected"); %>>Sin Cargos</OPTION>
				</SELECT>
			</TD>
			<TD nowrap width="30%">

					<DIV align="right">Estado de la Cobranza :</DIV>
					</TD>
			<TD nowrap width="20%">
			<SELECT name="E01DCMCST" disabled>
						<OPTION value=" "
							<% if ((!collBasic.getE01DCMCST().equals("0")) && (!collBasic.getE01DCMCST().equals("1")) && (!collBasic.getE01DCMCST().equals("2")) && (!collBasic.getE01DCMCST().equals("3")) && (!collBasic.getE01DCMCST().equals("4")) && (!collBasic.getE01DCMCST().equals("5")) && (!collBasic.getE01DCMCST().equals("6")) && (!collBasic.getE01DCMCST().equals("7")) && (!collBasic.getE01DCMCST().equals("8")) && (!collBasic.getE01DCMCST().equals("9")) && (!collBasic.getE01DCMCST().equals("P")) && (!collBasic.getE01DCMCST().equals("V")))%>></OPTION>
						<OPTION value="0"
							<% if (collBasic.getE01DCMCST().equals("0")) out.println("selected"); %>>Esperando
						Confirmación Recibida</OPTION>
						<OPTION value="1"
							<% if (collBasic.getE01DCMCST().equals("1")) out.println("selected"); %>>Pendiente
						de Aceptación</OPTION>
						<OPTION value="2"
							<% if (collBasic.getE01DCMCST().equals("2")) out.println("selected"); %>>Pendiente
						de Pago</OPTION>
						<OPTION value="3"
							<% if (collBasic.getE01DCMCST().equals("3")) out.println("selected"); %>>Aceptada</OPTION>
						<OPTION value="4"
							<% if (collBasic.getE01DCMCST().equals("4")) out.println("selected"); %>>Protestada
						Vigente</OPTION>
						<OPTION value="5"
							<% if (collBasic.getE01DCMCST().equals("5")) out.println("selected"); %>>Prorrogada
						Extendida</OPTION>
						<OPTION value="6"
							<% if (collBasic.getE01DCMCST().equals("6")) out.println("selected"); %>>Cancelada
						- Libre de Pago</OPTION>
						<OPTION value="7"
							<% if (collBasic.getE01DCMCST().equals("7")) out.println("selected"); %>>Cancelada
						- Devuelta</OPTION>
						<OPTION value="8"
							<% if (collBasic.getE01DCMCST().equals("8")) out.println("selected"); %>>Cerrada
						Parcialmente Pagada</OPTION>
						<OPTION value="9"
							<% if (collBasic.getE01DCMCST().equals("9")) out.println("selected"); %>>Cerrada
						Totalmente Pagada</OPTION>
						<OPTION value="P"
							<% if (collBasic.getE01DCMCST().equals("P")) out.println("selected"); %>>Vencida
						Protestada</OPTION>
						<OPTION value="V"
							<% if (collBasic.getE01DCMCST().equals("V")) out.println("selected"); %>>Vencida
						Sin Protestar</OPTION>
					</SELECT></TD>
          </TR>
		  <TR id="trdark">
			<TD nowrap width="30%">
             	<DIV align="right">Cargos del Otro Banco x Cta. del :</DIV>
			</TD>
			<TD nowrap width="20%">
				<SELECT name="E01DCMOBF" disabled>
					<OPTION value=" " <% if ((!collBasic.getE01DCMOBF().equals("D")) && (!collBasic.getE01DCMOBF().equals("P"))) out.println("selected"); %>></OPTION>
					<OPTION value="D" <% if (collBasic.getE01DCMOBF().equals("D")) out.println("selected"); %>>Girado/Importador</OPTION>
					<OPTION value="P" <% if (collBasic.getE01DCMOBF().equals("P")) out.println("selected"); %>>Girador/Exportador</OPTION>
				</SELECT>
            </TD>
			<TD nowrap width="30%"><DIV align="right">
			N° de Tarifa de Cargos :</DIV></TD>
			<TD nowrap width="20%">
				<INPUT type="text" name="E01DCMTAR" maxlength="3" size="4" value="<%= collBasic.getE01DCMTAR().trim()%>" readonly>
			</TD>
		  </TR>
          <TR id="trclear">
            <TD nowrap width="30%">
             	<DIV align="right">Término :</DIV>
			</TD>
			<TD nowrap width="20%">
				<SELECT name="E01DCMTRC" disabled>
					<OPTION value="  " <% if ((!collBasic.getE01DCMTRC().equals("AS")) && (!collBasic.getE01DCMTRC().equals("BE")) && (!collBasic.getE01DCMTRC().equals("BL")) && (!collBasic.getE01DCMTRC().equals("CC")) && (!collBasic.getE01DCMTRC().equals("FD")) && (!collBasic.getE01DCMTRC().equals("FP")) && (!collBasic.getE01DCMTRC().equals("GA")) && (!collBasic.getE01DCMTRC().equals("ID")) && (!collBasic.getE01DCMTRC().equals("ST")) && (!collBasic.getE01DCMTRC().equals("TD"))) out.println("selected"); %>></OPTION>
					<OPTION value="AS" <% if (collBasic.getE01DCMTRC().equals("AS")) out.println("selected"); %>>A la vista</OPTION>
					<OPTION value="BE" <% if (collBasic.getE01DCMTRC().equals("BE")) out.println("selected"); %>>Después de Fecha de Letra de Cambio</OPTION>
					<OPTION value="BL" <% if (collBasic.getE01DCMTRC().equals("BL")) out.println("selected"); %>>Después de Fecha de Embarque</OPTION>
					<OPTION value="CC" <% if (collBasic.getE01DCMTRC().equals("CC")) out.println("selected"); %>>Después de Pase de Mercancía por Aduana</OPTION>
					<OPTION value="FD" <% if (collBasic.getE01DCMTRC().equals("FD")) out.println("selected"); %>>Después de Pase de Mercancía por Revisión</OPTION>
					<OPTION value="FP" <% if (collBasic.getE01DCMTRC().equals("FP")) out.println("selected"); %>>Primera presentación</OPTION>
					<OPTION value="GA" <% if (collBasic.getE01DCMTRC().equals("GA")) out.println("selected"); %>>Después de Arribo de Mercancía</OPTION>
					<OPTION value="ID" <% if (collBasic.getE01DCMTRC().equals("ID")) out.println("selected"); %>>Después de Fecha de Factura</OPTION>
					<OPTION value="ST" <% if (collBasic.getE01DCMTRC().equals("ST")) out.println("selected"); %>>Después de Entregado</OPTION>
					<OPTION value="TD" <% if (collBasic.getE01DCMTRC().equals("TD")) out.println("selected"); %>>Después de Fecha de Doc. de Transporte</OPTION>
				</SELECT>
            </TD>

			<TD nowrap width="30%">
             	<DIV align="right">Plazo :</DIV>
            </TD>
            <TD nowrap width="20%">
            	<INPUT type="text" name="E01DCMDYS" maxlength="4" size="5" value="<%= collBasic.getE01DCMDYS().trim()%>" readonly>
			</TD>
          </TR> 
		  
		  <TR id="trdark">
			<TD nowrap width="30%">
             	<DIV align="right"></DIV>
			</TD>
			<TD nowrap width="20%">
			</TD>
            <td nowrap width="27%" height="19"> 
              <div align="right">Cuenta Contable :</div>
            </td>
            <td nowrap width="27%" height="19"> 
              <input type="text" name="E01DCMGLN" readonly size="17" maxlength="16" value="<%= collBasic.getE01DCMGLN().trim()%>">
            </td>
		  </TR>
		  <TR id="trclear">
			<td nowrap width="29%"> 
              <div align="right">Saldo de la Cobranza :</div>
            </td>
            <td nowrap width="18%"> 
              <input type="text"  name="E01DCMMEB" readonly size="16" maxlength="15" value="<%= collBasic.getE01DCMMEB().trim()%>">
            </td>
            <td nowrap width="27%" height="19"> 
              <div align="right"></div>
            </td>
            <td nowrap width="27%" height="19"> 
             </td>
		  </TR>
        </TBODY></TABLE>
      </td>
    </tr>
  </table>

  <h4>Información de Fechas</h4>
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF">
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="30%">
             	<div align="right">Fecha de Vencimiento :</div>
            </td>
            <td nowrap width="20%">
              <eibsinput:date name="collBasic"  fn_month="E01DCMMAM" fn_day="E01DCMMAD" fn_year="E01DCMMAY" required="True" onchange="setRecalculate()" readonly="true"/> 
			</td>
			<td nowrap width="30%">
             	<div align="right">Fecha de Emisión :</div>
			</td>
            <td nowrap width="20%">
              <eibsinput:date name="collBasic"  fn_month="E01DCMIDM" fn_day="E01DCMIDD" fn_year="E01DCMIDY" required="True" onchange="setRecalculate()" readonly="true"/> 
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="30%">
             	<div align="right">Fecha de Remitente :</div>
            </td>
            <td nowrap width="20%">
              <eibsinput:date name="collBasic"  fn_month="E01DCMRMM" fn_day="E01DCMRMD" fn_year="E01DCMRMY" required="True" onchange="setRecalculate()" readonly="true"/> 
			</td>
			<td nowrap width="30%">
             	<div align="right">Próxima Fecha de Tracer :</div>
			</td>
            <td nowrap width="20%">
              <eibsinput:date name="collBasic"  fn_month="E01DCMNTM" fn_day="E01DCMNTD" fn_year="E01DCMNTY" required="True" onchange="setRecalculate()" readonly="true"/> 
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="30%">
             	<div align="right">Fecha de Acuse de Recibo :</div>
            </td>
            <td nowrap width="20%">
              <eibsinput:date name="collBasic"  fn_month="E01DCMAKM" fn_day="E01DCMAKD" fn_year="E01DCMAKY" required="True" onchange="setRecalculate()" readonly="true"/> 
			</td>
			<td nowrap width="30%">
             	<div align="right">Fecha de Aceptación :</div>
			</td>
            <td nowrap width="20%">
              <eibsinput:date name="collBasic"  fn_month="E01DCMACM" fn_day="E01DCMACD" fn_year="E01DCMACY" required="True" onchange="setRecalculate()" readonly="true"/> 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <h4>Información Adicional</h4>
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF">
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="30%">
				<div align="right">N° de Guía de Embarque :</DIV>
            </td>
            <td nowrap width="20%"><INPUT type="text" name="E01DCMBLN" 	maxlength="16" size="17" value="<%= collBasic.getE01DCMBLN().trim()%>" readonly></td>
			<td nowrap width="30%">
             	<div align="right">Fecha de Guía de Embarque :</div>
			</td>
            <td nowrap width="20%">
              <eibsinput:date name="collBasic"  fn_month="E01DCMBDM" fn_day="E01DCMBDD" fn_year="E01DCMBDY" required="True" onchange="setRecalculate()" readonly="true"/> 
            </td>
          </tr>
		  <tr id="trclear">
            <td nowrap width="30%">
				<DIV align="right">Mercanc&iacute;a :</DIV>
            </td>
            <td nowrap width="20%">
            	<INPUT type="text" name="E01DCMMED" 	maxlength="35" size="50" value="<%= collBasic.getE01DCMMED().trim()%>" readonly>
            </td>
            <td nowrap width="30%"> 
             	<div align="right">Mercancía en Consignación :</div>
            </td>
            <td nowrap width="20%">  
            	<input type="radio" name="E01DCMMCO" value="Y" <%if(collBasic.getE01DCMMCO().equals("Y")) out.print("checked");%> disabled>Sí 
            	<input type="radio" name="E01DCMMCO" value="N" <%if(collBasic.getE01DCMMCO().equals("N")) out.print("checked");%> disabled>No 
			</td>
		  </tr>
		  <tr id="trdark">
			<td nowrap>
             	<div align="right">Nombre del Navío :</div>
			</td>
            <td nowrap colspan=3>
            	<INPUT type="text" name="E01DCMVSL" maxlength="20" size="35" value="<%= collBasic.getE01DCMVSL().trim()%>" readonly> 
            </td>
          </tr>	            
          <tr id="trclear">
             <td><DIV align="right">&nbsp;</div></td>
             <td colspan=3>
                <INPUT type="text" name="E01DCMAG1" maxlength="35" size="50" value="<%= collBasic.getE01DCMAG1().trim()%>" readonly><br>
                <INPUT type="text" name="E01DCMAG2" maxlength="35" size="50" value="<%= collBasic.getE01DCMAG2().trim()%>" readonly><br>
                <INPUT type="text" name="E01DCMAG3" maxlength="35" size="50" value="<%= collBasic.getE01DCMAG3().trim()%>" readonly><br>
                <INPUT type="text" name="E01DCMAG4" maxlength="35" size="50" value="<%= collBasic.getE01DCMAG4().trim()%>" readonly>
             </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
    <h4>Información de Documentos Recibidos</h4>
  <table class="tableinfo">

    <tr bordercolor="#FFFFFF">
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr>
		      <td align="center">Documento</td>
		      <td align="center">Descripci&oacute;n</td>
		      <td align="center">Originales<br>Requeridas</td>
		      <td align="center">Originales<br>Recibidas</td>
  			  <td align="center">Copias<br>Requeridas</td>
  			  <td align="center">Copias<br>Recibidas</td>
		      <td align="center">Nro. de Documento</td>
         </tr>
          <tr id="trdark">
            <td align="center"><INPUT type="text" name="E01DCMDD1" maxlength="4" size="5" value="<%= collBasic.getE01DCMDD1() %>" readonly>				
			</td>
			<td align="center"><INPUT type="text" name="E01DCMDS1" maxlength="35" size="35" value="<%= collBasic.getE01DCMDS1() %>" readonly></td>
            <td align="center"> <INPUT type="text" name="E01DCMDO1" maxlength="1" size="2" value="<%= collBasic.getE01DCMDO1() %>" onKeyPress="enterInteger()" readonly></td>
            <td align="center"> <INPUT type="text" name="E01DCMOR1" maxlength="1" size="2" value="<%= collBasic.getE01DCMOR1() %>" onKeyPress="enterInteger()" readonly></td>
            <td align="center"> <INPUT type="text" name="E01DCMDC1" maxlength="1" size="2" value="<%= collBasic.getE01DCMDC1() %>" onKeyPress="enterInteger()" readonly></td>
            <td align="center"> <INPUT type="text" name="E01DCMCR1" maxlength="1" size="2" value="<%= collBasic.getE01DCMCR1() %>" onKeyPress="enterInteger()" readonly></td>
            <td align="center"><INPUT type="text" name="E01DCMDN1" maxlength="16" size="19" value="<%= collBasic.getE01DCMDN1() %>" readonly></td>
           </tr>
           <tr id="trclear">
            <td align="center"><INPUT type="text" name="E01DCMDD2" maxlength="4" size="5" value="<%= collBasic.getE01DCMDD2() %>" readonly>
			</td>
			<td align="center"><INPUT type="text" name="E01DCMDS2" maxlength="35" size="35" value="<%= collBasic.getE01DCMDS2() %>" readonly></td>
            <td align="center"> <INPUT type="text" name="E01DCMDO2" maxlength="1" size="2" value="<%= collBasic.getE01DCMDO2() %>" onKeyPress="enterInteger()" readonly></td>
            <td align="center"> <INPUT type="text" name="E01DCMOR2" maxlength="1" size="2" value="<%= collBasic.getE01DCMOR2() %>" onKeyPress="enterInteger()" readonly></td>
            <td align="center"> <INPUT type="text" name="E01DCMDC2" maxlength="1" size="2" value="<%= collBasic.getE01DCMDC2() %>" onKeyPress="enterInteger()" readonly></td>
            <td align="center"> <INPUT type="text" name="E01DCMCR2" maxlength="1" size="2" value="<%= collBasic.getE01DCMCR2() %>" onKeyPress="enterInteger()" readonly></td>
            <td align="center"><INPUT type="text" name="E01DCMDN2" maxlength="16" size="19" value="<%= collBasic.getE01DCMDN2() %>" readonly></td>
          </tr>
          <tr id="trdark">
            <td align="center"><INPUT type="text" name="E01DCMDD3" maxlength="4" size="5" value="<%= collBasic.getE01DCMDD3() %>" readonly>	
			</td>
			<td align="center"><INPUT type="text" name="E01DCMDS3" maxlength="35" size="35" value="<%= collBasic.getE01DCMDS3() %>" readonly></td>
            <td align="center"> <INPUT type="text" name="E01DCMDO3" maxlength="1" size="2" value="<%= collBasic.getE01DCMDO3() %>" onKeyPress="enterInteger()" readonly></td>
            <td align="center"> <INPUT type="text" name="E01DCMOR3" maxlength="1" size="2" value="<%= collBasic.getE01DCMOR3() %>" onKeyPress="enterInteger()" readonly></td>
            <td align="center"> <INPUT type="text" name="E01DCMDC3" maxlength="1" size="2" value="<%= collBasic.getE01DCMDC3() %>" onKeyPress="enterInteger()" readonly></td>
            <td align="center"> <INPUT type="text" name="E01DCMCR3" maxlength="1" size="2" value="<%= collBasic.getE01DCMCR3() %>" onKeyPress="enterInteger()" readonly></td>
            <td align="center"><INPUT type="text" name="E01DCMDN3" maxlength="16" size="19" value="<%= collBasic.getE01DCMDN3() %>" readonly></td>
          </tr>
          <tr id="trclear">
            <td align="center"><INPUT type="text" name="E01DCMDD4" maxlength="4" size="5" value="<%= collBasic.getE01DCMDD4() %>" readonly>				
			</td>
			<td align="center"><INPUT type="text" name="E01DCMDS4" maxlength="35" size="35" value="<%= collBasic.getE01DCMDS4() %>" readonly></td>
            <td align="center"> <INPUT type="text" name="E01DCMDO4" maxlength="1" size="2" value="<%= collBasic.getE01DCMDO4() %>" onKeyPress="enterInteger()" readonly></td>
            <td align="center"> <INPUT type="text" name="E01DCMOR4" maxlength="1" size="2" value="<%= collBasic.getE01DCMOR4() %>" onKeyPress="enterInteger()" readonly></td>
            <td align="center"> <INPUT type="text" name="E01DCMDC4" maxlength="1" size="2" value="<%= collBasic.getE01DCMDC4() %>" onKeyPress="enterInteger()" readonly></td>
            <td align="center"> <INPUT type="text" name="E01DCMCR4" maxlength="1" size="2" value="<%= collBasic.getE01DCMCR4() %>" onKeyPress="enterInteger()" readonly></td>
            <td align="center"><INPUT type="text" name="E01DCMDN4" maxlength="16" size="19" value="<%= collBasic.getE01DCMDN4() %>" readonly></td>
          </tr>
          <tr id="trdark">
            <td align="center"><INPUT type="text" name="E01DCMDD5" maxlength="4" size="5" value="<%= collBasic.getE01DCMDD5() %>" readonly>
			</td>
			<td align="center"><INPUT type="text" name="E01DCMDS5" maxlength="35" size="35" value="<%= collBasic.getE01DCMDS5() %>" readonly></td>
            <td align="center"> <INPUT type="text" name="E01DCMDO5" maxlength="1" size="2" value="<%= collBasic.getE01DCMDO5() %>" onKeyPress="enterInteger()" readonly></td>
            <td align="center"> <INPUT type="text" name="E01DCMOR5" maxlength="1" size="2" value="<%= collBasic.getE01DCMOR5() %>" onKeyPress="enterInteger()" readonly></td>
            <td align="center"> <INPUT type="text" name="E01DCMDC5" maxlength="1" size="2" value="<%= collBasic.getE01DCMDC5() %>" onKeyPress="enterInteger()" readonly></td>
            <td align="center"> <INPUT type="text" name="E01DCMCR5" maxlength="1" size="2" value="<%= collBasic.getE01DCMCR5() %>" onKeyPress="enterInteger()" readonly></td>
            <td align="center"><INPUT type="text" name="E01DCMDN5" maxlength="16" size="19" value="<%= collBasic.getE01DCMDN5() %>" readonly></td>
          </tr>
          <tr id="trclear">
            <td align="center"><INPUT type="text" name="E01DCMDD6" maxlength="4" size="5" value="<%= collBasic.getE01DCMDD6() %>" readonly>
			</td>
			<td align="center"><INPUT type="text" name="E01DCMDS6" maxlength="35" size="35" value="<%= collBasic.getE01DCMDS6() %>" readonly></td>
            <td align="center"> <INPUT type="text" name="E01DCMDO6" maxlength="1" size="2" value="<%= collBasic.getE01DCMDO6() %>" onKeyPress="enterInteger()" readonly></td>
            <td align="center"> <INPUT type="text" name="E01DCMOR6" maxlength="1" size="2" value="<%= collBasic.getE01DCMOR6() %>" onKeyPress="enterInteger()" readonly></td>
            <td align="center"> <INPUT type="text" name="E01DCMDC6" maxlength="1" size="2" value="<%= collBasic.getE01DCMDC6() %>" onKeyPress="enterInteger()" readonly></td>
            <td align="center"> <INPUT type="text" name="E01DCMCR6" maxlength="1" size="2" value="<%= collBasic.getE01DCMCR6() %>" onKeyPress="enterInteger()" readonly></td>
            <td align="center"><INPUT type="text" name="E01DCMDN6" maxlength="16" size="19" value="<%= collBasic.getE01DCMDN6() %>" readonly></td>
          </tr>
          <tr id="trdark">
            <td align="center"><INPUT type="text" name="E01DCMDD7" maxlength="4" size="5" value="<%= collBasic.getE01DCMDD7() %>" readonly>
			</td>
			<td align="center"><INPUT type="text" name="E01DCMDS7" maxlength="35" size="35" value="<%= collBasic.getE01DCMDS7() %>" readonly></td>
            <td align="center"> <INPUT type="text" name="E01DCMDO7" maxlength="1" size="2" value="<%= collBasic.getE01DCMDO7() %>" onKeyPress="enterInteger()" readonly></td>
            <td align="center"> <INPUT type="text" name="E01DCMOR7" maxlength="1" size="2" value="<%= collBasic.getE01DCMOR7() %>" onKeyPress="enterInteger()" readonly></td>
            <td align="center"> <INPUT type="text" name="E01DCMDC7" maxlength="1" size="2" value="<%= collBasic.getE01DCMDC7() %>" onKeyPress="enterInteger()" readonly></td>
            <td align="center"> <INPUT type="text" name="E01DCMCR7" maxlength="1" size="2" value="<%= collBasic.getE01DCMCR7() %>" onKeyPress="enterInteger()" readonly></td>
            <td align="center"><INPUT type="text" name="E01DCMDN7" maxlength="16" size="19" value="<%= collBasic.getE01DCMDN7() %>" readonly></td>
          </tr>
          <tr id="trclear">            
            <td align="center"><INPUT type="text" name="E01DCMDD8" maxlength="4" size="5" value="<%= collBasic.getE01DCMDD8() %>" readonly>
			</td>
			<td align="center"><INPUT type="text" name="E01DCMDS8" maxlength="35" size="35" value="<%= collBasic.getE01DCMDS8() %>" readonly></td>
            <td align="center"> <INPUT type="text" name="E01DCMDO8" maxlength="1" size="2" value="<%= collBasic.getE01DCMDO8() %>" onKeyPress="enterInteger()" readonly></td>
            <td align="center"> <INPUT type="text" name="E01DCMOR8" maxlength="1" size="2" value="<%= collBasic.getE01DCMOR8() %>" onKeyPress="enterInteger()" readonly></td>
            <td align="center"> <INPUT type="text" name="E01DCMDC8" maxlength="1" size="2" value="<%= collBasic.getE01DCMDC8() %>" onKeyPress="enterInteger()" readonly></td>
            <td align="center"> <INPUT type="text" name="E01DCMCR8" maxlength="1" size="2" value="<%= collBasic.getE01DCMCR8() %>" onKeyPress="enterInteger()" readonly></td>
            <td align="center"><INPUT type="text" name="E01DCMDN8" maxlength="16" size="19" value="<%= collBasic.getE01DCMDN8() %>" readonly></td>
          </tr>
          <tr id="trdark">
            <td align="center"><INPUT type="text" name="E01DCMDD9" maxlength="4" size="5" value="<%= collBasic.getE01DCMDD9() %>" readonly>
			</td>
			<td align="center"><INPUT type="text" name="E01DCMDS9" maxlength="35" size="35" value="<%= collBasic.getE01DCMDS9() %>" readonly></td>
            <td align="center"> <INPUT type="text" name="E01DCMDO9" maxlength="1" size="2" value="<%= collBasic.getE01DCMDO9() %>" onKeyPress="enterInteger()" readonly></td>
            <td align="center"> <INPUT type="text" name="E01DCMOR9" maxlength="1" size="2" value="<%= collBasic.getE01DCMOR9() %>" onKeyPress="enterInteger()" readonly></td>
            <td align="center"> <INPUT type="text" name="E01DCMDC9" maxlength="1" size="2" value="<%= collBasic.getE01DCMDC9() %>" onKeyPress="enterInteger()" readonly></td>
            <td align="center"> <INPUT type="text" name="E01DCMCR9" maxlength="1" size="2" value="<%= collBasic.getE01DCMCR9() %>" onKeyPress="enterInteger()" readonly></td>
            <td align="center"><INPUT type="text" name="E01DCMDN9" maxlength="16" size="19" value="<%= collBasic.getE01DCMDN9() %>" readonly></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

<BR>
  </form>
</body>
</html>
