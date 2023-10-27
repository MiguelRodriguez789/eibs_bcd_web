<html>
<head>
<title>Códigos de Referencia</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="refCodes" class="datapro.eibs.beans.ESD003002Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<SCRIPT Language="javascript">


function finish(){
 self.window.location.href = "<%=request.getContextPath()%>/pages/background.jsp";
}
function joinDate(){
  document.forms[0].E02DSCUS1.value = document.forms[0].E01CNOFID.value+document.forms[0].E01CNOFIM.value+document.forms[0].E01CNOFIY.value+
document.forms[0].E01CNOFFD.value+document.forms[0].E01CNOFFM.value+document.forms[0].E01CNOFFY.value+
document.forms[0].E01CNOFPD.value+document.forms[0].E01CNOFPM.value+document.forms[0].E01CNOFPY.value ;
}

</SCRIPT>
</head>
<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
%>

<H3 align="center">C&oacute;digos de Referencia del Sistema - Abogados<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cnof_proposal_routes_details.jsp, ESD0030"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0030" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
   <INPUT TYPE=HIDDEN NAME="E02CNOBNK" value="<%= currUser.getE01UBK()%>">
   <INPUT TYPE=HIDDEN NAME="E02DSCUS1" value="<%= refCodes.getE02DSCUS1().trim()%>">
  <h4>Informaci&oacute;n B&aacute;sica</h4>
  
  <%int row = 0; %>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="16%"> 
              <div align="right">Clasificaci&oacute;n :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E02CNOCFL"  readonly size="3" maxlength="2" value="<%= refCodes.getE02CNOCFL().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="23"> 
              <div align="right">C&oacute;digo :</div>
            </td>
            <td nowrap height="23"> 
              <div align="left"> 
                <input type="text" name="E02CNORCD" size="6" maxlength="4" value="<%= refCodes.getE02CNORCD().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="23"> 
              <div align="right">Nombre del Abogado :</div>
            </td>
            <td nowrap height="23"> 
              <div align="left"> 
                <input type="text" name="E02CNODSC" size="50" maxlength="45" value="<%= refCodes.getE02CNODSC().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="23"> 
              <div align="right">No. Documento Identificación :</div>
            </td>
            <td nowrap height="23"> 
              <div align="left"> 
                <input type="text" name="E02CNORUT" size="25" maxlength="25" value="<%= refCodes.getE02CNORUT().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="23"> 
              <div align="right">Firma a la que Pertenece :</div>
            </td>
            <td nowrap height="23"> 
              <div align="left"> 
                <input type="text" name="E02CNOEML" size="60" maxlength="60" value="<%= refCodes.getE02CNOEML().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="23"> 
              <div align="right">Fecha Inicio del Contrato :</div>
            </td>
            <td nowrap height="23"> 
              <div align="left"> 
				<INPUT type="text" name="E01CNOFID" size="2" maxlength="2" value="<%=refCodes.getE02DSCUS1().length() > 1 ? refCodes.getE02DSCUS1().substring(0,2) : "" %>" readonly>
				/
				<INPUT type="text" name="E01CNOFIM" size="2" maxlength="2" value="<%=refCodes.getE02DSCUS1().length() > 2 ? refCodes.getE02DSCUS1().substring(2,4) : "" %>" readonly>
				/
				<INPUT type="text" name="E01CNOFIY" size="4" maxlength="4" value="<%=refCodes.getE02DSCUS1().length() > 7 ? refCodes.getE02DSCUS1().substring(4,8) : "" %>" readonly>
				<A 	href="javascript:DOBPicker(document.forms[0].E01CNOFIM,document.forms[0].E01CNOFID,document.forms[0].E01CNOFIY)"><IMG
					src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" border="0">
				</A>
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="23"> 
              <div align="right">Fecha Fin del Contrato :</div>
            </td>
            <td nowrap height="23"> 
              <div align="left"> 
				<INPUT type="text" name="E01CNOFFD" size="2" maxlength="2" value="<%=refCodes.getE02DSCUS1().length() > 8 ? refCodes.getE02DSCUS1().substring(8,10) : "" %>" readonly>
				/
				<INPUT type="text" name="E01CNOFFM" size="2" maxlength="2" value="<%=refCodes.getE02DSCUS1().length() > 10 ? refCodes.getE02DSCUS1().substring(10,12) : "" %>" readonly>
				/
				<INPUT type="text" name="E01CNOFFY" size="4" maxlength="4" value="<%=refCodes.getE02DSCUS1().length() > 15 ? refCodes.getE02DSCUS1().substring(12,16) : "" %>" readonly>
				<A 	href="javascript:DOBPicker(document.forms[0].E01CNOFFM,document.forms[0].E01CNOFFD,document.forms[0].E01CNOFFY)"><IMG
					src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" border="0">
				</A>
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="23"> 
              <div align="right">Fecha de Prórroga :</div>
            </td>
            <td nowrap height="23"> 
              <div align="left"> 
				<INPUT type="text" name="E01CNOFPD" size="2" maxlength="2" value="<%= refCodes.getE02DSCUS1().length() > 16 ? refCodes.getE02DSCUS1().substring(16,18) : ""%>" readonly>
				/
				<INPUT type="text" name="E01CNOFPM" size="2" maxlength="2" value="<%= refCodes.getE02DSCUS1().length() > 17 ? refCodes.getE02DSCUS1().substring(18,20) : "" %>" readonly>
				/
				<INPUT type="text" name="E01CNOFPY" size="4" maxlength="4" value="<%= refCodes.getE02DSCUS1().length() > 20 ? refCodes.getE02DSCUS1().substring(20) : "" %>" readonly>
				<A 	href="javascript:DOBPicker(document.forms[0].E01CNOFPM,document.forms[0].E01CNOFPD,document.forms[0].E01CNOFPY)"><IMG
					src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" border="0">
				</A>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
   <h4>&nbsp;</h4>  
      <div align="center">
         <%if(!userPO.getPurpose().equals("INQUIRY")) {%>
            <input id="EIBSBTN" type=submit name="Submit" value="Enviar" onClick="joinDate();">
         <%}%>
         <input id="EIBSBTN" type=button name="Submit" value="Salir" onClick="finish();">
   </div>  
  
  </form>
</body>
</html>
