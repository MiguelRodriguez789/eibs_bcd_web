<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page	language="java" contentType="text/html; charset=ISO-8859-1"	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/theme/Master.css" type="text/css">
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<title>Cambio de Oficiales</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:useBean id= "error"    class= "datapro.eibs.beans.ELEERRMessage"       scope="session" />
<jsp:useBean id= "userPO"   class= "datapro.eibs.beans.UserPos"             scope="session" />
<jsp:useBean id= "msgXchg"  class= "datapro.eibs.beans.ESD098001Message"    scope="session" />
</head>
<body>
<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
%>
<H3 align="center">Cambio de Oficial<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="official_xchg.jsp, ESD0980"></H3>
<hr size="4">

<FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0980" >
<input type="hidden" name="SCREEN" value="200">
<h4>Productos</h4>
<table class="tableinfo">
    <tr>
        <td nowrap>
            <table cellspacing="0" cellpadding="2" width="100%" border="0">
                <tr id="trdark">
                     <td nowrap >
                        <div align="right">
                            <input type="checkbox" name="E01CHGCUS" value="X"    <% if (msgXchg.getE01CHGCUS().equals("X")) { out.print("checked"); } %> >
                        </div>
                    </td>
                    <td nowrap >
                        <div align="left">
                            <b>Clientes</b>
                        </div>
                    </td>
                    <td nowrap>
                        <div align="right">
                            <input type="checkbox" name="E01CHGACM" value="X" <% if (msgXchg.getE01CHGACM().equals("X")) { out.print("checked"); } %> >
                        </div>
                    </td>
                    <td nowrap>
                        <div align="left">
                            <b>Cuentas Detalles</b>
                        </div>
                    </td>
                    <td nowrap>
                        <div align="right">
                            <input type="checkbox" name="E01CHGLCM" value="X"    <% if (msgXchg.getE01CHGLCM().equals("X")) { out.print("checked"); } %> >
                        </div>
                    </td>
                    <td nowrap>
                        <div align="left">
                            <b>Cartas de Credito</b>
                        </div>
                    </td>
                    <td nowrap>
                        <div align="right">
                            <input type="checkbox" name="E01CHGDCM" value="X"    <% if (msgXchg.getE01CHGDCM().equals("X")) { out.print("checked"); } %> >
                        </div>
                    </td>
                    <td nowrap>
                        <div align="left">
                            <b>Cobranzas</b>
                        </div>
                    </td>
                </tr>
                <tr id="trdark">
                    <td nowrap>
                        <div align="right">
                            <input type="checkbox" name="E01CHGROC" value="X"    <% if (msgXchg.getE01CHGROC().equals("X")) { out.print("checked"); } %> >
                        </div>
                    </td>
                    <td nowrap>
                        <div align="left">
                            <b>Garantias No Deposito</b>
                        </div>
                    </td>
                    <td nowrap>
                        <div align="right">
                            <input type="checkbox" name="E01CHGLNS"  value="X"   <% if (msgXchg.getE01CHGLNS().equals("X")) { out.print("checked"); } %> >
                        </div>
                    </td>
                    <td nowrap>
                        <div align="left">
                            <b>Prestamos</b>
                        </div>
                    </td>
                    <td nowrap>
                        <div align="right">
                            <input type="checkbox" name="E01CHGDEP" value="X"    <% if (msgXchg.getE01CHGDEP().equals("X")) { out.print("checked"); } %> >
                        </div>
                    </td>
                    <td nowrap>
                        <div align="left">
                            <b>Plazo Fijo</b>
                        </div>
                    </td>
                    <td nowrap >
                        <div align="right">
                            <input type="checkbox" name="E01CHGLNC" value="X"    <% if (msgXchg.getE01CHGLNC().equals("X")) { out.print("checked"); } %> >
                        </div>
                    </td>
                    <td nowrap >
                        <div align="left">
                            <b>Lineas de Credito</b>
                        </div>
                    </td>
                   
                </tr>
            </table>
        </td>
    </tr>
 </table>
<h4>Información Actual</h4>
<table class="tableinfo">
    <tr>
        <td nowrap>
            <table cellspacing="0" cellpadding="2" width="100%" border="0">
                <tr id="trdark">
                    <td nowrap>
                        <div align="right">
                            <b>Oficial Principal Actual</b>
                        </div>
                    </td>
                    <td nowrap>
                        <div align="right">
                        	<eibsinput:cnofc flag="15" name="msgXchg" fn_code="E01CHGOPA" fn_description="E01CHGDPA" />
                        </div>
                    </td>
                    <td nowrap>
                        <div align="left">
                        	<eibsinput:text property="E01CHGDPA" name="msgXchg" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
                        </div>
                    </td>
                </tr>
                <tr id="trclear">
                    <td nowrap>
                        <div align="right">
                            <b>Oficial Secundario Actual</b>
                        </div>
                    </td>
                    <td nowrap>
                        <div align="right">
                        	<eibsinput:cnofc flag="15" name="msgXchg" fn_code="E01CHGOSA" fn_description="E01CHGDSA" />
                        </div>
                    </td>
                    <td nowrap>
                        <div align="left">
                        	<eibsinput:text property="E01CHGDSA" name="msgXchg" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
                        </div>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<h4>Información Nueva</h4>
    <table class="tableinfo">
        <tr > 
            <td nowrap> 
                <table cellspacing="0" cellpadding="2" width="100%" border="0">
                <tr id="trdark">
                    <td nowrap>
                        <div align="right">
                            <b>Oficial Principal Nuevo</b>
                        </div>
                    </td>
                    <td nowrap>
                        <div align="right">
                        	<eibsinput:cnofc flag="15" name="msgXchg" fn_code="E01CHGOPN" fn_description="E01CHGDPN" />
                        </div>
                    </td>
                    <td nowrap>
                        <div align="left">
                        	<eibsinput:text property="E01CHGDPN" name="msgXchg" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
                        </div>
                    </td>
                </tr>
                <tr id="trclear">
                    <td nowrap>
                        <div align="right">
                            <b>Oficial Secundario Nuevo</b>
                        </div>
                    </td>
                    <td nowrap>
                        <div align="right">
                        	<eibsinput:cnofc flag="15" name="msgXchg" fn_code="E01CHGOSN" fn_description="E01CHGDSN" />
                        </div>
                    </td>
                    <td nowrap>
                        <div align="left">
                        	<eibsinput:text property="E01CHGDSN" name="msgXchg" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
                        </div>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<p align="center">
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </p>
</FORM>
</body>
</html>