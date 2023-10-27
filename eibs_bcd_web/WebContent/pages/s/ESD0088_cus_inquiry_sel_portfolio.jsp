<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<META name="GENERATOR" content="IBM WebSphere Studio">
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
  
  <h3 align="center">Consulta Portafolio de Cliente<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
  	  name="EIBS_GIF" title="cus_inquiry_sel_portfolio.jsp, ESD0088"></h3>
  <hr size="4">
 
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0300" >
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1">
  <input type=HIDDEN name="RWDTYP" value="C">
  <table class="tbenter" height="55%" width="100%" border="0">
    <tr>
      <td nowrap align="center">
        <table class="tableinfo" align="center" width="100%" >
          <tr>
            <td>
              <table width="100%">
                <tr id="trdark">
                  <td valign="middle" align="center" colspan="2" height=33>
                    <div align="left"><b>Buscar por </b></div>
                  </td>
                </tr>
                <tr id="trclear">
                  <td width="27%" nowrap>
                    <div align="right">Portafolio o Número de Cliente :</div>
                  </td>
                  <td width="73%" nowrap>
                    <input type="text" name="CUSTOMER"  size=9 maxlength="9"
						>
                    <input type="text" name="DESCRIPTION"  size=40 maxlength="35"
						>
                    <a href="javascript:GetCustomerDescId('CUSTOMER', 'DESCRIPTION', '')">
                    	<img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0" ></a>
                  </td>
                </tr>
					<tr id="trclear">
                  <td width="27%" nowrap>
                    <div align="right">Código de Oficial :</div>
                  </td>
                  <td width="73%" nowrap>
                    <div align="left">
                      <input type="text" name="OFFICER"  size=9 maxlength="9">
                      <a href="javascript:GetCodeCNOFC('OFFICER', '15')">
                      	<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
                    </div>
                  </td>
                </tr>
                <tr id="trclear">
                  <td width="27%" nowrap>
                    <div align="right">Portafolio Estado :</div>
                  </td>
                  <td width="73%" nowrap>
                    <input type=HIDDEN name="SWDSTS">
                    <input type="radio" name="CSWDSTS" value="A" onClick="document.forms[0].SWDSTS.value='A'">
                    Activo
                    <input type="radio" name="CSWDSTS" onClick="document.forms[0].SWDSTS.value='I'" value="I">
                    Inactivo
                    <input type="radio" name="CSWDSTS" onClick="document.forms[0].SWDSTS.value='P'" value="P">
                    Pendiente
                    <input type="radio" name="CSWDSTS" onClick="document.forms[0].SWDSTS.value=''" checked value=" ">
                    Todos </td>
                </tr>
                <tr id="trclear">
                  <td width="27%" nowrap>
                    <div align="right">Fecha de Apertura :</div>
                  </td>
                  <td width="73%" nowrap>
                    <div align="left">
                      <input type="text" size="2" maxlength="2" name="SWDOP1" onKeyPress="enterInteger(event)" >
                      <input type="text" size="2" maxlength="2" name="SWDOP2" onKeyPress="enterInteger(event)">
                      <input type="text" size="4" maxlength="4" name="SWDOP3" onKeyPress="enterInteger(event)">
                      <a href="javascript:DatePicker(document.forms[0].SWDOP1,document.forms[0].SWDOP2,document.forms[0].SWDOP3)">
                      <img src="<%=request.getContextPath()%>/images/calendar.gif" title="help" align="middle" border="0">
                      </a> Hasta 
                      <input type="text" size="2" maxlength="2" name="SWDUP1" onKeyPress="enterInteger(event)">
                      <input type="text" size="2" maxlength="2" name="SWDUP2" onKeyPress="enterInteger(event)">
                      <input type="text" size="4" maxlength="4" name="SWDUP3" onKeyPress="enterInteger(event)">
                      <a href="javascript:DatePicker(document.forms[0].SWDUP1,document.forms[0].SWDUP2,document.forms[0].SWDUP3)">
                      	<img src="<%=request.getContextPath()%>/images/calendar.gif" title="help" align="middle" border="0"></a>
                    </div>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
          <tr bgcolor="#FFFFFF">
            <td width="33%">
              <div align="center">
                <input class="EIBSBTN" type="submit" name="Submit" value="Enviar">
              </div>
            </td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td>
              <div align="center"> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
