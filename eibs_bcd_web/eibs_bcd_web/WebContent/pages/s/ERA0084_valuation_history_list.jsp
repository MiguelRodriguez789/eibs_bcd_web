<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Consulta Histórica de Valuaciones</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id= "trans" class= "datapro.eibs.beans.ERA008401Message"  scope="session" /> 
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id="ERA008401Help" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="gaList" class="datapro.eibs.beans.JBListRec" scope="session" />
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

	function submitThis(option) {
  		document.forms[0].SCREEN.value = "2";
  		document.forms[0].submit();		  	       	       
	}

	function hideDiv(fld, value){
 		if (value) {
   			fld.style.display = 'none';
   		} else {
   			fld.style.display = 'block';
   		}
	}
	
	function getParamsBien(idx,bien,seq){
		document.forms[0].SEQBIEN.value = bien;
		document.forms[0].SEQVAL.value = seq;
		goValuation();
	}

	function goValuation() {
		showChecked("COLLCOD");
		var SCREEN = "200";
		var OPECOD = "0020";
		var E01HVAREF = document.forms[0].E01HVAREF.value;
		var SEQBIEN = document.forms[0].SEQBIEN.value;
		var SEQVAL = document.forms[0].SEQVAL.value;
		var page = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0084?SCREEN="+SCREEN+"&OPECOD="+OPECOD+"&E01HVAREF="+E01HVAREF+"&E01HVASEQ="+SEQBIEN+"&E01HVASEA="+SEQVAL+"&PURPOSE=INQUIRY";
		CenterNamedWindow(page,'Information', 1200, 500, 2);
	}
	
<% 		
	if (userPO.getOption().equals("CO")) {
		if (userPO.getPurpose().equals("INQUIRY")) {
%>
			builtNewMenu(colla_i_opt);
			initMenu();
<%		
		} else {
%>
			builtNewMenu(colla_a_opt);
			initMenu();		
<%
		}
	}	 		
%>
</SCRIPT>  
</head>
<body>

<h3 align="center">Consulta Valuaciones
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="valuation_history_list, ERA0084"></h3>

<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0084">
  <p> 
    <INPUT TYPE=HIDDEN NAME="CURRENTROW" id="CURRENTROW" VALUE="0"> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="2">
    <input type=HIDDEN name="opt" id="opt" >
   <input type=HIDDEN name="SEQBIEN" value=""> 
   <input type=HIDDEN name="SEQVAL" value=""> 
  </p>

<% 
String chk = "";

 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

 	int row = 0;
 %>

  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap> 
              <div align="right"><b>Cliente : </b></div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01HVACUN" readonly size="11" maxlength="9" value="<%=trans.getE01HVACUN().trim()%>">
              </div>
            </td>
            <td nowrap> 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="E01HVANA1" id="E01HVANA1" readonly size="60" maxlength="45" value="<%=trans.getE01HVANA1().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap > 
              <div align="right"><b>No. Referencia : </b></div>
            </td>
            <td nowrap>
              <input type="text" name="E01HVAREF" id="E01HVAREF" size="14" maxlength="12" value="<%=trans.getE01HVAREF().trim()%>" readonly>
            </td> 
            <td nowrap> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap> 
              <div align="left">
               <input type="text" name="E01HVACCY" id="E01HVACCY" size="4" maxlength="3" value="<%=trans.getE01HVACCY().trim()%>" readonly> 
              </div>
            </td>
           </tr>
          <tr id="trdark">             
            <td nowrap> 
              <div align="right"><b>Producto :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="PRODUCT" size="38" value="<%=trans.getE01HVAPRD().trim()%> - <%=trans.getD01HVAPRD().trim()%>" readonly>                 
              </div>
            </td>
            <td nowrap> 
              <div align="right"><b>Tipo de Garantía :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="TYPE" size="38" value="<%=trans.getE01HVATYP().trim()%> - <%=trans.getD01HVATYP().trim()%>" readonly>                 
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<%
	if (gaList.getNoResult()) {
%>
<TABLE class="tbenter" height="20%">
	<TR>
		<TD ALIGN=CENTER VALIGN=MIDDLE>
		<H4 style="text-align: center">No existe historial de valuaciones para esta garantía.
		</h4>
		</TD>
	</TR>
</TABLE>
<%
	} else {
%>
<h3>Historial de Valuaciones para esta Garantía</h3>
	<TABLE id="mainTableF" class="tableinfo">
			<TR>
				<TD nowrap valign="top" width="100%">
					<table class="tbenter" width=100% align=center>
					<tr>
					<td class=TDBKG width="100%">
					<div align="center"><a href="javascript:goValuation()" id="btnA4"><b>Consultar </b></a></div>
					</td>
					</tr>
					</table>
					<TABLE id="headTable1" >
					<TBODY>
					<tr id="trdark">
					<TH align="CENTER" nowrap width="5%">&nbsp;</TH>
					<TH align="CENTER" nowrap width="5%">Sec. Bien</TH>
					<TH align="CENTER" nowrap width="5%">Sec. Avaluo</TH>
					<TH align="CENTER" nowrap width="15%">Descripción Bien</TH>
					<TH align="CENTER" nowrap width="10%">Fecha Avalúo</TH>
					<TH align="CENTER" nowrap width="15%">Anterior Avalúo</TH>
					<TH align="CENTER" nowrap width="15%">Nuevo Avalúo</TH>
					<TH align="CENTER" nowrap width="10%">Coefic. Apl.</TH>
					<TH align="CENTER" nowrap width="25%">Avaluador</TH>
					<TH align="CENTER" nowrap width="10%">Proximo Avalúo</TH>
					<TH align="CENTER" nowrap width="10%">Aprobó</TH>
 					</tr>
					</TBODY>
					</TABLE>
					<div id="dataDiv1" class="scbarcolor">
						<table id="dataTable1" >
			<%
				boolean firstTime = true;
				String gaChk = "";
				gaList.initRow();
				int i = 0;
				ERA008401Help.initRow();
				while (gaList.getNextRow()) {
					if (gaList.getFlag().equals("")) {
						gaChk = (firstTime) ? "checked" : "";
						firstTime = false;
						ERA008401Help.getNextRow();
						datapro.eibs.beans.ERA008401Message msgList = (datapro.eibs.beans.ERA008401Message) ERA008401Help
						.getRecord();
			%>
			<TBODY>
			<TR>
				<TD ALIGN=LEFT NOWRAP width="5%">
				<input type="radio" name="COLLCOD" value="<%=ERA008401Help.getCurrentRow()%>" onClick="getParamsBien(this.value,'<%=msgList.getE01HVASEQ()%>','<%=msgList.getE01HVASEA()%>')" <%=gaChk%>>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="5%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)"><%=msgList.getE01HVASEQ().trim()%></a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="5%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)"><%=msgList.getE01HVASEA().trim()%></a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="15%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)"><%=msgList.getD01HVAPRD().trim()%></a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="10%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)"><%=msgList.getE01HVAFAD().trim()%>/<%=msgList.getE01HVAFAM().trim()%>/<%=msgList.getE01HVAFAY().trim()%></a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="15%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)"><%=msgList.getE01HVAAPA().trim()%></a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="15%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)"><%=msgList.getE01HVANAP().trim()%></a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="10%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)"><%=msgList.getE01HVACAP().trim()%></a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="25%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)"><%=msgList.getD01HVACAV().trim()%></a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="10%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)"><%=msgList.getE01HVAFXD().trim()%>/<%=msgList.getE01HVAFXM().trim()%>/<%=msgList.getE01HVAFXY().trim()%></a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="25%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)"><%=msgList.getE01HVAUSA().trim()%></a>
				</TD>
 			</TR>
			</TBODY>
			<%
				i++;
							}
						}
			%>
			</table>
			</DIV>
			</TD>
			</TR>

	</TABLE>

<%
	}
%>
  
  <table class="tbenter" width=100% align=center>
    <tr> 
      <td width="33%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp" class="botonrojo"><b>Salir</b></a></div>
      </td>
    </tr>
  </table>
  

  <BR>
 <SCRIPT type="text/javascript">
// 	showChecked("COLLCOD");
	function resizeDoc() {
   		if ( isValidObject(getElement("dataTable1"))) {
	   		adjustEquTables(getElement("headTable1"), getElement("dataTable1"), getElement("dataDiv1"), 1, false);
		}
   	}
	resizeDoc();
    window.resize = resizeDoc;
</SCRIPT>
</form>
</body>
</html>