<html>
<head>
<title>Consulta de Documentos Emitidos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">
function redirect() {
	document.forms[0].SCREEN.value = 210;
	document.forms[0].submit();
}

</SCRIPT>
</head>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<body  bgcolor="#FFFFFF">

<h3 align="center">Consulta de Documentos Emitidos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="vl_enter_inquiry.jsp, EVL0120"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.valuepaper.JSEVL0120" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="210">

  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="trdark">
            <td width="30%" nowrap>
              <div align="right">Modulo IBS: </div>
            </td>
            <td width="70%" nowrap>
              <input type="text" name="E01SCHACD" size="3" maxlength="2" value="<%= userPO.getApplicationCode() %>">
                <a href="javascript:GetCodeCNOFC('E01SCHACD','AP')">
                  <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda"
					align="bottom" border="0">
			 	</a>
            </td>
          </tr>
          <tr id="trclear">
            <td width="30%" nowrap>
              <div align="right">Sucursal de Emisión : </div>
            </td>
            <td width="70%" nowrap>
              <input type="text" name="E01SCHBRN" size="5" maxlength="4" value="<%= userPO.getBranch() %>">
              <a href="javascript:GetBranch('E01SCHBRN','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" align="bottom" border="0"></a>
            </td>
          </tr>
          <tr id="trdark">
            <td width="30%" nowrap> 
              <div align="right">Fecha de Emisión : </div>
            </td>
            <td width="70%" nowrap>
              Del 
              <input type="text" size="3" maxlength="2" name="E01SCHFI1" onkeypress="enterInteger(event)" value="<%= userPO.getHeader10() %>">
              <input type="text" size="3" maxlength="2" name="E01SCHFI2" onkeypress="enterInteger(event)" value="<%= userPO.getHeader11() %>">
              <input type="text" size="5" maxlength="4" name="E01SCHFI3" onkeypress="enterInteger(event)" value="<%= userPO.getHeader12() %>">
              <A href="javascript:DatePicker(document.forms[0].E01SCHFI1,document.forms[0].E01SCHFI2,document.forms[0].E01SCHFI3)">
				<IMG src="<%=request.getContextPath()%>/images/calendar.gif" title="Ayuda" align="middle" border="0">
			  </A>
              al 
              <input type="text" size="3" maxlength="2" name="E01SCHTI1" onkeypress="enterInteger(event)" value="<%= userPO.getHeader13() %>">
              <input type="text" size="3" maxlength="2" name="E01SCHTI2" onkeypress="enterInteger(event)" value="<%= userPO.getHeader14() %>">
              <input type="text" size="5" maxlength="4" name="E01SCHTI3" onkeypress="enterInteger(event)" value="<%= userPO.getHeader15() %>">
              <A href="javascript:DatePicker(document.forms[0].E01SCHTI1,document.forms[0].E01SCHTI2,document.forms[0].E01SCHTI3)">
				<IMG src="<%=request.getContextPath()%>/images/calendar.gif" title="Ayuda" align="middle" border="0">
			  </A>              
            </td>
          </tr>
          <tr id="trclear">
            <td width="30%" nowrap> 
              <div align="right">Fecha de Impresión : </div>
            </td>
            <td width="70%" nowrap>
              Del 
              <input type="text" size="3" maxlength="2" name="E01SCHFM1" onkeypress="enterInteger(event)" value="<%= userPO.getHeader16() %>">
              <input type="text" size="3" maxlength="2" name="E01SCHFM2" onkeypress="enterInteger(event)" value="<%= userPO.getHeader17() %>">
              <input type="text" size="5" maxlength="4" name="E01SCHFM3" onkeypress="enterInteger(event)" value="<%= userPO.getHeader18() %>">
              <A href="javascript:DatePicker(document.forms[0].E01SCHFM1,document.forms[0].E01SCHFM2,document.forms[0].E01SCHFM3)">
				<IMG src="<%=request.getContextPath()%>/images/calendar.gif" title="Ayuda" align="middle" border="0">
			  </A>              
              
              al 
              <input type="text" size="3" maxlength="2" name="E01SCHTM1" onkeypress="enterInteger(event)" value="<%= userPO.getHeader19() %>">
              <input type="text" size="3" maxlength="2" name="E01SCHTM2" onkeypress="enterInteger(event)" value="<%= userPO.getHeader20() %>">
              <input type="text" size="5" maxlength="4" name="E01SCHTM3" onkeypress="enterInteger(event)" value="<%= userPO.getHeader21() %>">
              <A href="javascript:DatePicker(document.forms[0].E01SCHTM1,document.forms[0].E01SCHTM2,document.forms[0].E01SCHTM3)">
				<IMG src="<%=request.getContextPath()%>/images/calendar.gif" title="Ayuda" align="middle" border="0">
			  </A>                            
            </td>
          </tr>
          <tr id="trdark">
            <td width="50%"> 
              <div align="right">Número de Documento : </div>
            </td>
            <td width="50%"> 
              <div align="left"> 
	              <input type="text" name="E01SCHACC" size="14" maxlength="12" onkeypress="enterInteger(event)" value="<%= userPO.getAccNum() %>">
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td width="30%" nowrap>
              <div align="right">Número de Papel Valorado : </div>
            </td>
            <td width="70%" nowrap>
              <input type="text" name="E01SCHSER" size="14" maxlength="12" onkeypress="enterInteger(event)" value="<%= userPO.getHeader22() %>">
            </td>
          </tr>
         </table>
      </td>
    </tr>
  </table>
  <br>
  <div align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar" onclick="redirect();">
  </div>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT Language="Javascript">;
            showErrors();
     </SCRIPT>;
 <%
 }
%>
</form>
</body>
</html>
