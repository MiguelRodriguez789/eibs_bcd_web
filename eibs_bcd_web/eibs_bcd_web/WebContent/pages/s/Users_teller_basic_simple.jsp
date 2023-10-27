<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html> 
<%@ page import = "datapro.eibs.master.Util" %>
<head>
<title>Perfil del Cajero</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="teller" class="com.datapro.eibs.teller.vo.ATTELLUSERSExtBasic"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script type="text/javascript">

function del() {
	ok = confirm("Esta seguro que desea eliminar el usuario seleccionado?");
	if (ok){
		document.forms[0].del.value='Y';
		document.forms[0].submit();
	}
}

function toStart() {
	document.forms[0].SCREEN.value='3';
	document.forms[0].submit(); 
}

</script>

</head>
<body bgcolor="#FFFFFF">
<% 
boolean isNew = !"MAINTENANCE".equals(userPO.getPurpose());
if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0") ;
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
}
%>
<h3 align="center">Perfil del Cajero<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="Users_registy_basic" ></h3>
<hr size="4">
 <FORM id="formTeller" name="formTeller" METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSUsersTeller" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="10">
  </p>

  <h4>Definición de Cajero </h4>
  
  <table  class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap>
              <div align="right">Cajero :</div>
            </td>
            <td nowrap>
              	<input type="text" name="TELLUSERID" size="12" maxlength="10" value="<%= teller.getTELLUSERID()%>" readonly>
              	<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0"  >
             </td>
            <td nowrap>
              <div align="right">Nombre :</div>
            </td>
            <td nowrap>
              	<input type="text" name="USERNAME" size="35" maxlength="50" value="<%= teller.getUSERNAME()%>" >
             </td>
          </tr>
          <tr id="trclear">
            <td nowrap>
              <div align="right">Banco :</div>
            </td>
            <td nowrap>
              	<input type="text" name="CODEBANK" size="5" maxlength="4" value="<%= teller.getCODEBANK().substring(2, 4) %>" <%= !isNew ? " readonly" : "" %>>
              	<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0"  >
             </td>
            <td nowrap>
              <div align="right">Branch :</div>
            </td>
            <td nowrap>
             	<input type="text" name="CODEBRANCH" size="5" maxlength="4" value="<%= Integer.parseInt(teller.getCODEBRANCH())%>">
				<a href="javascript:GetBranch('CODEBRANCH', document.formTeller.CODEBANK.value, '')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" border="0"  ></a>
              	<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0"  >
             </td> 
          </tr>
          <tr id="trdark">
            <td nowrap>
              <div align="right">Nivel :</div>
            </td>
            <td nowrap>
             	<input type="text" name="USERNIVEL" size="5" maxlength="4" value="<%= teller.getUSERNIVEL()%>">
				<a href="javascript:GetTellerParameters('0002','USERNIVEL','')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" border="0"  ></a>
             </td>
            <td nowrap>
              <div align="right">Jornada :</div>
            </td>
            <td nowrap>
             	<input type="text" name="CODESHIFT" size="5" maxlength="4" value="<%= teller.getCODESHIFT()%>">
				<a href="javascript:GetTellerShifts('CODESHIFT', '', document.formTeller.CODEBANK.value, document.formTeller.CODEBRANCH.value)">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" border="0"  ></a>
             </td>
          </tr>
          <tr id="trclear">
            <td nowrap>
              <div align="right">Estado :</div>
            </td>
            <td nowrap>
             	<input type="text" name="USERMOD" size="5" maxlength="4" value="<%= teller.getUSERMOD()%>">
				<a href="javascript:GetTellerParameters('0011','USERMOD','')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" border="0"  ></a>
             </td>          
            <td nowrap>
              <div align="right">Secuencia :</div>
            </td>
            <td nowrap>
             	<input type="text" name="TRNSEQ" size="16" maxlength="15" value="<%= teller.getTRNSEQ()%>">
             </td> 
          </tr>
          <tr id="trdark">
            <td nowrap>
              <div align="right">e-mail:</div>
            </td>
            <td nowrap colspan="3">
             	<input type="text" name="USEREMAIL" size="40" maxlength="35" value="<%= teller.getUSEREMAIL()%>" readonly>
             </td>          
          </tr>
         </table>
      </td>
    </tr>
  </table>
    <br>
   <p align="center">
    		<input id="EIBSBTN" type=submit name="Submit" value="Actualizar">
			<input id="EIBSBTN" type=submit name="Start" value="Inicio" onclick="toStart()">
            <%if (currUser.getH01OPE().trim().equals("0002")) { %>
    		<input id="EIBSBTN" type=submit name="Submit" value="Eliminar" onclick="del()">
			<% } %>
  </p>

</form>
</body>
</html>

