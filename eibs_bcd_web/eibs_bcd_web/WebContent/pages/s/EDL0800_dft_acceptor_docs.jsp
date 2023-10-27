<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Drafts Documents Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<jsp:useBean id="dftBasic" class="datapro.eibs.beans.EDL080001Message"  scope="session" />
<jsp:useBean id="dftAcceptor" class="datapro.eibs.beans.EDL080003Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<SCRIPT>
<%	if (userPO.getPurpose().equals("MAINTENANCE")){%>
   		builtNewMenu(ln_m_opt);
<%	}%>

function genDoc(element) {
	if (element.value == "Y") {
		getElement("tblAcceptant").style.display = "block";
		getElement("DFTINIDOC").focus();
      	getElement("DFTINIDOC").select();
      	if (getElement("DFTRATE").value.trim().length < 1) {
      		getElement("DFTRATE").value = getElement("TASA").value;
      	}
	} else {
		getElement("tblAcceptant").style.display = "none";
        getElement("DFTINIDOC").value = "";
        getElement("DFTFINDOC").value = "";
        getElement("DFTFRECUENCY").value = "";
	   	getElement("DFTDTMAT1").value = "";
        getElement("DFTDTMAT2").value = "";
        getElement("DFTDTMAT3").value = "";
        getElement("DFTAMOUNT").value = "";
        getElement("DFTRATE").value = "";
        getElement("DFTAUTDEBACCT").value = "";
        getElement("DFTCHGTYP").value = "";
        getElement("ORIAMOUNT").value = "";
	}
}
function checkGenDoc() {
	if (document.forms[0].HasErrors.value=="Y") {
		document.forms[0].AUTGEN[0].checked = true;
		document.forms[0].AUTGEN[1].checked = false;
		genDoc(document.forms[0].AUTGEN[0]);
		} else {
		document.forms[0].AUTGEN[1].checked = true;
		document.forms[0].AUTGEN[0].checked = false;
		genDoc(document.forms[0].AUTGEN[1]);
		}
}
function validate(){
	if (document.forms[0].AUTGEN[0].checked == true) {
		var docini = document.forms[0].DFTINIDOC.value;
		var docfin = document.forms[0].DFTFINDOC.value;
		var numdocini = new Number(document.forms[0].DFTINIDOC.value);
		var numdocfin = new Number(document.forms[0].DFTFINDOC.value);
		var freq = document.forms[0].DFTFRECUENCY.value;
		if (numdocfin < numdocini) {
			alert("El documento final debe tener un valor mayor que el documento inicial.");
			return false;
		}
		else if (docini == "0" || docini == "" || docfin == "0" || docfin == "") {
			alert("Por favor, ingrese los números de documento inicial y final.");
			return false;
		}
		else if (freq == 0) {
			alert("La frecuencia no debe ser cero.");
			return false;
		} 
		else if (document.forms[0].DFTDTMAT1.value == '' || document.forms[0].DFTDTMAT2.value == '' || document.forms[0].DFTDTMAT3.value == '') {
			alert("Por favor, ingrese la fecha de primer vencimiento.");
			return false;
		}
	}
    return true;
}

</SCRIPT>
</head>
<body onload="checkGenDoc()" >
<%

 String strBlank = "";
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%> 
<h3 align="center">Generación de Documentos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="dft_acceptor_docs.jsp, EDL0800"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0800" onSubmit="return validate();">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1000">
  <INPUT TYPE=HIDDEN NAME="GRP" VALUE="4">
  <INPUT TYPE=HIDDEN NAME="TASA" VALUE="<%=dftBasic.getE01DEARTE() %>">
  <INPUT TYPE=HIDDEN NAME="HasErrors" value = <%=userPO.getHeader9() %>>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left">
                <INPUT type="text" name="E01DEACUN" size="10" maxlength="9" value="<%= userPO.getCusNum()%>" readonly>
                <a href="javascript:GetCustomerDescId('E01DEACUN','E01CUSNA1','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0" ></a></div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="5" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2">
                <INPUT type="text" name="E01CUSNA1" size="45" maxlength="45" value="<%= userPO.getCusName() %>" readonly>
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
                <INPUT type="text" name="E01DEAACC" size="13" maxlength="12" value="<%= userPO.getIdentifier() %>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <INPUT type="text" name="E01DEACCY" size="4" maxlength="3" value="<%= userPO.getCurrency() %>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
                <INPUT type="text" name="E01DEAPRO" size="4" maxlength="4" value="<%= userPO.getProdCode() %>" readonly>
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Deudor</h4> 
  <table class="tableinfo">
         <tr id="trdark"> 
           <TD nowrap width="10%"> 
             <div align="right">Identificación :</div>
           </TD>
           <TD nowrap width="15%"> 
             <INPUT type="text" name="E03NUMIDE" size="18" maxlength="2" value="<%= dftAcceptor.getE03NUMIDE() %>" readonly>
           </TD>
           <TD nowrap width="10%"> 
             <div align="right">Nombre :</div>
           </TD>
           <TD nowrap width="15%" colspan="5"> 
             <INPUT type="text" name="E03CUMMA1" size="60" maxlength="60" value="<%= dftAcceptor.getE03CUMMA1() %>" readonly>
           </TD>
         </tr>
          <tr id="trdark"> 
           <TD nowrap width="10%"> 
             <div align="right">Numero de Cliente :</div>
           </TD>
           <TD nowrap width="15%"> 
             <INPUT type="text" name="E03CUN" size="10" maxlength="9" value="<%= dftAcceptor.getE03CUN() %>" readonly>
           </TD>
           <TD nowrap width="10%"> 
             <div align="right">Linea de Credito :</div>
           </TD>
           <TD nowrap width="15%"> 
             <INPUT type="text" name="E03DLDCMN" size="5" maxlength="4" value="<%= dftAcceptor.getE03DLDCMN() %>" readonly>
           </TD>
           <TD nowrap width="10%"> 
             <div align="right">Monto Disponible :</div>
           </TD>
           <TD nowrap width="15%"> 
             <INPUT type="text" name="E03LNEAVL" size="20" maxlength="18" value="<%= dftAcceptor.getE03LNEAVL() %>" readonly>
           </TD>
           <TD nowrap width="10%"> 
             <div align="right">Vencimiento :</div>
           </TD>
           <TD nowrap width="15%"> 
             <% if (currUser.getE01DTF().equals("MDY") ) { %>
             	<INPUT type="text" name="E03LNEMAM" size="3" maxlength="2" value="<%= dftAcceptor.getE03LNEMAM() %>" readonly>
             	<INPUT type="text" name="E03LNEMAD" size="3" maxlength="2" value="<%= dftAcceptor.getE03LNEMAD() %>" readonly>
             	<INPUT type="text" name="E03LNEMAY" size="5" maxlength="4" value="<%= dftAcceptor.getE03LNEMAY() %>" readonly>
             <% } else { %>
             	<INPUT type="text" name="E03LNEMAD" size="3" maxlength="2" value="<%= dftAcceptor.getE03LNEMAD() %>" readonly>
             	<INPUT type="text" name="E03LNEMAM" size="3" maxlength="2" value="<%= dftAcceptor.getE03LNEMAM() %>" readonly>
             	<INPUT type="text" name="E03LNEMAY" size="5" maxlength="4" value="<%= dftAcceptor.getE03LNEMAY() %>" readonly>
            <% } %>
           </TD>
         </tr>
         <tr id="trclear"> 
           <TD nowrap width="19%"> 
             <div align="right">Generación Automática :</div>
           </TD>
           <TD nowrap colspan="9"> 
             	<INPUT type="radio" name="AUTGEN" value="Y" disabled <%if (dftAcceptor.getE03AUTGEN().equals("Y")) { out.print("checked");} %> onclick="genDoc(this)"> Sí 
             	<INPUT type="radio" name="AUTGEN" value="N" <%if (!dftAcceptor.getE03AUTGEN().equals("Y")) { out.print("checked");} %> onclick="genDoc(this)" > No
           </TD>
         </tr>
         <tr id="trdark">
         <td colspan="9"> 
       	<TABLE id="tblAcceptant" cellpadding="2" cellspacing="0" width="100%" border="0" style="display: none;">
          <tr id="trdark"> 
            <TD nowrap width="19%"> 
              <div align="right">Documento Inicial :</div>
            </TD>
            <TD nowrap colspan="2"> 
              <INPUT size="6" type="text" name="DFTINIDOC" maxlength="6" value="<%= dftAcceptor.getE03INIDOC() %>">
            </TD>
            <TD nowrap width="13%" align="right">Documento Final :</TD>
            <TD nowrap width="56%"> 
              <INPUT size="6" type="text" name="DFTFINDOC" maxlength="6" value="<%= dftAcceptor.getE03FINDOC() %>">
            </TD>
          </tr>
          <tr id="trclear"> 
            <TD nowrap width="19%"> 
              <div align="right">Frecuencia :</div>
            </TD>
            <TD nowrap width="4%"> 
              <INPUT size="6" type="text" name="DFTFRECUENCY" maxlength="6" value="<%= dftAcceptor.getE03FRECUE() %>">
            </TD>	
            <TD nowrap width="8%"> 
              <input type="radio" name="INDFREC" value="D"<%if (!dftAcceptor.getE03FRECOD().equals("M") && !dftAcceptor.getE03FRECOD().equals("y")) 
              			{ out.print("checked");} %>> Día(s) </TD>
            <TD width="13%"></TD>
            <TD nowrap width="56%"></TD>
          </tr>
          <tr id="trdark"> 
            <TD nowrap width="19%"></TD>
            <TD nowrap width="4%">&nbsp; </TD>
            <TD nowrap width="8%"> 
              <input type="radio" name="INDFREC" value="M"<%if (dftAcceptor.getE03FRECOD().equals("M")) { out.print("checked");} %>> Meses(s)</TD>
            <TD nowrap width="13%"></TD>
            <TD nowrap width="56%"></TD>
          </tr>
          <tr id="trclear"> 
            <TD nowrap width="19%"></TD>
            <TD nowrap width="4%">&nbsp; </TD>
            <TD nowrap width="8%"> 
              <input type="radio" name="INDFREC" value="Y"<%if (dftAcceptor.getE03FRECOD().equals("Y")) { out.print("checked");} %>> Año(s)</TD>
            <TD nowrap width="13%"></TD>
            <TD nowrap width="56%"></TD>
          </tr>
          <tr id="trdark"> 
            <TD nowrap width="19%"> 
              <div align="right">Fecha de Primer Vencimiento :</div>
            </TD>
            <TD nowrap colspan="2"> 
            	<% if (currUser.getE01DTF().equals("MDY") ) { %>
             	<INPUT type="text" name="DFTDTMAT2" size="3" maxlength="2" value="<%= dftAcceptor.getE03DTMATM() %>" class="txtright" onkeypress=" enterInteger(event)">
             	<INPUT type="text" name="DFTDTMAT3" size="3" maxlength="2" value="<%= dftAcceptor.getE03DTMATD() %>" class="txtright" onkeypress=" enterInteger(event)">
             	<INPUT type="text" name="DFTDTMAT1" size="5" maxlength="4" value="<%= dftAcceptor.getE03DTMATY() %>" class="txtright" onkeypress=" enterInteger(event)">
            	<a id="linkHelp" href="javascript:DatePicker(document.forms[0].DFTDTMAT2,document.forms[0].DFTDTMAT3,document.forms[0].DFTDTMAT1)">
            		<img src="${pageContext.request.contextPath}/images/calendar.gif" title="null" style="vertical-align: bottom;" border="0"/></a>
             <% } else { %>
             	<INPUT type="text" name="DFTDTMAT3" size="3" maxlength="2" value="<%= dftAcceptor.getE03DTMATD() %>" class="txtright" onkeypress=" enterInteger(event)">
             	<INPUT type="text" name="DFTDTMAT2" size="3" maxlength="2" value="<%= dftAcceptor.getE03DTMATM() %>" class="txtright" onkeypress=" enterInteger(event)">
             	<INPUT type="text" name="DFTDTMAT1" size="5" maxlength="4" value="<%= dftAcceptor.getE03DTMATY() %>" class="txtright" onkeypress=" enterInteger(event)">
            	<a id="linkHelp" href="javascript:DatePicker(document.forms[0].DFTDTMAT3,document.forms[0].DFTDTMAT2,document.forms[0].DFTDTMAT1)">
            		<img src="${pageContext.request.contextPath}/images/calendar.gif" title="null" style="vertical-align: bottom;" border="0"/></a>
            <% } %>
            </TD>
            <TD nowrap width="13%">Monto del Documento</TD>
            <TD nowrap width="56%">
            	<INPUT size="17" maxlength="15" type="text" name="DFTAMOUNT" value=" <%= dftAcceptor.getE03AMOUNT() %>" onKeyPress="enterDecimal(event)" >
            </TD>
          </tr>
          <tr id="trclear"> 
            <TD nowrap width="19%"> 
              <div align="right">Monto Negociado:</div>
            </TD>
            <TD nowrap colspan="2"> 
              <INPUT size="17" maxlength="15" type="text" name="ORIAMOUNT" value="<%= dftAcceptor.getE03AMTNEG() %>" onKeyPress="enterDecimal(event)">
            </TD>
            <TD nowrap width="13%" align="right">Tasa del Documento :</TD>
            <TD nowrap width="56%"> 
            	<% if (!userPO.getHeader9().equals("Y") ) { %>
              		<INPUT size="10" maxlength="9" type="text" name="DFTRATE" value="<%=dftBasic.getE01DEARTE() %>" onKeyPress="enterDecimal(event)">
              	<% } else { %>	
              		<INPUT size="10" maxlength="9" type="text" name="DFTRATE" value="<%=dftAcceptor.getE03DFTRTE() %>" onKeyPress="enterDecimal(event)">
              	<% } %>
              
            </TD>
          </tr>
          <tr id="trdark"> 
            <TD nowrap width="19%"> 
              <div align="right">Cuenta de Débito Automática :</div>
            </TD>
            <TD nowrap colspan="2"> 
              <INPUT size="13" maxlength="12"  type="text" name="DFTAUTDEBACCT" value="<%= dftAcceptor.getE03DEBAUT() %>">
              <a href="javascript:GetAccount('DFTAUTDEBACCT','','RT','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
            </TD>
            <TD nowrap width="13%" align="right">Tipo de Cambio :</TD>
            <TD nowrap width="56%"> 
              <select name="DFTCHGTYP">
		              <option value=" "
		              	<% if (!dftAcceptor.getE03CHGTYP().equals("1") && !dftAcceptor.getE03CHGTYP().equals("2") && !dftAcceptor.getE03CHGTYP().equals("3") )
		              	{ out.print("selected"); } %>></option>
		              <option value="1" <% if (dftAcceptor.getE03CHGTYP().equals("1") ) { out.print("selected"); } %>>Oficial</option>
                      <option value="2" <% if (dftAcceptor.getE03CHGTYP().equals("2") ) { out.print("selected"); } %>>Observado</option>
                      <option value="3" <% if (dftAcceptor.getE03CHGTYP().equals("3") ) { out.print("selected"); } %>>Compra/Venta</option>
              </select>
            </TD>
          </tr>
        </TABLE>
      </td>
    </tr>
  </table>


	<div align="center"> 
    	<input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  	</div>

  </form>
<script type="text/javascript">
</script>
</body>
</html>
