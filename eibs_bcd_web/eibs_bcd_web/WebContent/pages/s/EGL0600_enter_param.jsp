<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<%@page import="com.datapro.constants.Entities"%> 

<html>
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="msgList" class="datapro.eibs.beans.EGL060001Message"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>



<script type="text/javascript">

function checkValues() {
	return true;
}

function enter(){
	  document.forms[0].submit();
	 }
</script>

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
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEGL0600" >
	<INPUT TYPE=HIDDEN NAME="SCREEN" ID="SCREEN" VALUE="200">
 	<INPUT TYPE=HIDDEN NAME="SEARCHC" ID="SEARCHC" VALUE="">
 	
<h3 align="center">Consulta Partidas a Reconciliar<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="enter_param.jsp, EGL0600"></h3>
<hr size="4">
  <br><br><br><br><br><br>
  <table class="tableinfo">
    <tr> 
      <td valign="middle" align="center" height=33 width="49%"> 
        <div align="right">Banco : </div>
      </td>
      <td valign="middle" align="center" height=33 width="51%"> 
        <div align="left"> 
          <input type="text" name="E01TLDBNK" id="E01TLDBNK" size=3 maxlength="2" value="<%= userPO.getBank().trim()%>">
        </div>
      </td>
    </tr>
    <tr> 
      <td valign="middle" align="center" height=33 width="49%"> 
        <div align="right">Agencia : </div>
      </td>
      <td valign="middle" align="center" height=33 width="51%"> 
        <div align="left"> 
              <input type="text" name="E01TLDBRN" id="E01TLDBRN" size="5" maxlength="4" value="<%= userPO.getBranch().trim()%>">
                <a href="javascript:GetBranch('E01TLDBRN',document.getElementById('E01TLDBNK').value)"> <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"  ></a>
        </div>
      </td>
    </tr>
    <tr> 
      <td valign="middle" align="center" height=33 width="49%"> 
        <div align="right">Moneda : </div>
      </td>
      <td valign="middle" align="center" height=33 width="51%"> 
        <div align="left"> 
	          <input type="text" name="E01TDRTMC" id="E01TDRTMC" size="4" maxlength="3" value="<%= userPO.getCurrency().trim()%>" >
	           <a href="javascript:GetCurrency('E01TDRTMC',document.getElementById('E01TLDBNK').value)"> <img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="middle" border="0" > 
              </a>
        </div>
      </td>
    </tr>
    <tr> 
      <td valign="middle" align="center" height=33 width="49%"> 
        <div align="right">Cuenta : </div>
      </td>
      <td valign="middle" align="center" height=33 width="51%"> 
        <div align="left"> 
	          <input type="text" name="E01TDRTGL" id="E01TDRTGL" size="20" maxlength="16" value="<%= userPO.getAccNum().trim()%>" onkeypress="enterInteger(event)" >
		        <a href="javascript:GetLedger('E01TDRTGL',document.getElementById('E01TLDBNK').value,document.getElementById('E01TDRTMC').value,'')"> <img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="middle" border="0" > 
              </a>
        </div>
      </td>
    </tr>
    <tr> 
      <td valign="middle" align="center" height=33 width="49%"> 
        <div align="right">Importe Débito : </div>
      </td>
      <td valign="middle" align="center" height=33 width="51%"> 
        <div align="left"> 
		   	<input type="text" name="E01INPLMI" value="<%= msgList.getE01INPLMI() %>" size="18" maxlength="15" onkeypress="enterDecimal()">              
        </div>
      </td>
    </tr>
    <tr> 
      <td valign="middle" align="center" height=33 width="49%"> 
        <div align="right">Importe Crédito : </div>
      </td>
      <td valign="middle" align="center" height=33 width="51%"> 
        <div align="left"> 
		   	<input type="text" name="E01INPLMX" value="<%= msgList.getE01INPLMX() %>" size="18" maxlength="16" onkeypress="enterDecimal()">              
        </div>
      </td>
    </tr>
    
  </table>
  <br>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
          <tr bgcolor="#FFFFFF"> 
            <td width="33%"> 
              <div align="center"> 
                <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
              </div>
            </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td> 
              <div align="center"> </div>
            </td>
          </tr>
        </table>
</form>
</body>
</html>