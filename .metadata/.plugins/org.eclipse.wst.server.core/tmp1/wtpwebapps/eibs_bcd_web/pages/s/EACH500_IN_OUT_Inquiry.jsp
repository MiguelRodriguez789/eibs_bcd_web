<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css"> 

<TITLE>ACH Inquiry</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "msgList" class= "datapro.eibs.beans.EACH50001Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />

<SCRIPT type="text/javascript" SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

function inComing(){
  getElement("E01REQTYP").value = 'I';
  getElement("E01REQTYPO").checked = false;
  getElement("E01REQORDB").checked = false;
  getElement("E01REQORDB").disabled=true;
  getElement("E01REQSTSP").checked = false;
  getElement("E01REQSTSP").disabled=true;
  getElement("E01REQSTSA").checked = false;
  getElement("E01REQSTSA").disabled=true;
  getElement("E01REQSTSR").checked = false;
  getElement("E01REQSTSR").disabled=false;
}

function outGoing(){
  getElement("E01REQTYP").value = 'O';
  getElement("E01REQTYPI").checked = false;
  getElement("E01REQORDB").disabled=false;
  getElement("E01REQSTSR").checked = false;
  getElement("E01REQSTSR").disabled=true;
  getElement("E01REQSTSP").checked = false;
  getElement("E01REQSTSP").disabled=false;
  getElement("E01REQSTSA").checked = false;
  getElement("E01REQSTSA").disabled=false;
}

function ordCustomer(){
  getElement("E01REQORD").value = 'C';
  getElement("E01REQCUS").disabled=false;
  getElement("E01REQORDD").checked = false;
  getElement("E01REQORDN").checked = false;
  getElement("E01REQORDA").checked = false;
  getElement("E01REQORDB").checked = false;
  getElement("E01REQNUM").disabled=true;
  getElement("E01REQNUM").value='0';
  getElement("E01REQACC").disabled=true;
  getElement("E01REQACC").value='0';
  getElement("E01REQBTH").disabled=true;
  getElement("E01REQBTH").value='0';
}

function ordDate(){
  getElement("E01REQORD").value = 'D';
  getElement("E01REQORDC").checked = false;
  getElement("E01REQORDN").checked = false;
  getElement("E01REQORDA").checked = false;
  getElement("E01REQORDB").checked = false;
  getElement("E01REQCUS").disabled=true;
  getElement("E01REQCUS").value='0';
  getElement("E01REQNUM").disabled=true;
  getElement("E01REQNUM").value='0';
  getElement("E01REQACC").disabled=true;
  getElement("E01REQACC").value='0';
  getElement("E01REQBTH").disabled=true;
  getElement("E01REQBTH").value='0';
}

function ordNumber(){
  getElement("E01REQORD").value = 'N';
  getElement("E01REQNUM").disabled=false;
  getElement("E01REQORDC").checked = false;
  getElement("E01REQORDD").checked = false;
  getElement("E01REQORDA").checked = false;
  getElement("E01REQORDB").checked = false;
  getElement("E01REQCUS").disabled=true;
  getElement("E01REQCUS").value='0';
  getElement("E01REQACC").disabled=true;
  getElement("E01REQACC").value='0';
  getElement("E01REQBTH").disabled=true;
  getElement("E01REQBTH").value='0';
}

function ordAccount(){
  getElement("E01REQORD").value = 'A';
  getElement("E01REQACC").disabled=false;
  getElement("E01REQORDC").checked = false;
  getElement("E01REQORDD").checked = false;
  getElement("E01REQORDN").checked = false;
  getElement("E01REQORDB").checked = false;
  getElement("E01REQCUS").disabled=true;
  getElement("E01REQCUS").value='0';
  getElement("E01REQNUM").disabled=true;
  getElement("E01REQNUM").value='0';
  getElement("E01REQBTH").disabled=true;
  getElement("E01REQBTH").value='0';
}

function ordBatch(){
  getElement("E01REQORD").value = 'B';
  getElement("E01REQBTH").disabled=false;
  getElement("E01REQORDC").checked = false;
  getElement("E01REQORDN").checked = false;
  getElement("E01REQORDA").checked = false;
  getElement("E01REQCUS").disabled=true;
  getElement("E01REQCUS").value='0';
  getElement("E01REQNUM").disabled=true;
  getElement("E01REQNUM").value='0';
  getElement("E01REQACC").disabled=true;
  getElement("E01REQACC").value='0';
}

function stsPending(){
  getElement("E01REQSTS").value = 'P';
  getElement("E01REQSTSA").checked = false;
  getElement("E01REQSTSAST").checked = false;
  getElement("E01REQSTSR").checked = false;
}

function stsApproved(){
  getElement("E01REQSTS").value = 'A';
  getElement("E01REQSTSP").checked = false;
  getElement("E01REQSTSAST").checked = false;
  getElement("E01REQSTSR").checked = false;
}

function stsProcessed(){
  getElement("E01REQSTS").value = '*';
  getElement("E01REQSTSP").checked = false;
  getElement("E01REQSTSA").checked = false;
  getElement("E01REQSTSR").checked = false;
}

function stsReturned(){
  getElement("E01REQSTS").value = 'R';
  getElement("E01REQSTSP").checked = false;
  getElement("E01REQSTSA").checked = false;
  getElement("E01REQSTSAST").checked = false;
}

function checkInfo(){
  	if (getElement("E01REQORD").value == "C") {
		getElement("E01REQFRM").value = getElement("E01REQCUS").value;
	} else if (getElement("E01REQORD").value == "N") {
		getElement("E01REQFRM").value = getElement("E01REQNUM").value;
	} else if (getElement("E01REQORD").value == "A") {
		getElement("E01REQFRM").value = getElement("E01REQACC").value;
	} else if (getElement("E01REQORD").value == "B") {
		getElement("E01REQFRM").value = getElement("E01REQBTH").value;
	} 
   	document.forms[0].SCREEN.value = '2';
	document.forms[0].submit();
 }

</SCRIPT>

</HEAD>

<body>

 <h3 align="center">Consulta de Transacciones ACH<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="IN_OUT_inquiry, EACH500"></h3>
<hr size="4">
 <FORM METHOD="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.ach.JSEACH500">	
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
    <INPUT TYPE=HIDDEN NAME="E01REQTYP" VALUE="I">
    <INPUT TYPE=HIDDEN NAME="E01REQORD" VALUE="D">
    <INPUT TYPE=HIDDEN NAME="E01REQSTS" VALUE="*">
    <INPUT TYPE=HIDDEN NAME="E01REQFRM" VALUE="0">
    
  <table id="tbenter" align="center" style="width:85%" border="1">
    <tr> 
      <td> 
        <table id="tbenter" width="100%" border="0" cellspacing="1" cellpadding="0">
          <tr>
			<td valign="middle" align="left" colspan="3" height=33>
				<INPUT type="radio" name="E01REQTYPI" value="I" onclick="JavaScript:inComing()"
					<% if (msgList.getE01REQTYP().equals("I")) out.print(" checked"); %>
					style="color: red"> <B><FONT color="red">ENTRANTES</FONT></B><BR>
				<INPUT type="radio" name="E01REQTYPO" value="O" onclick="JavaScript:outGoing()"
					<% if (msgList.getE01REQTYP().equals("O")) out.print(" checked"); %>>
				<B><FONT color="green">SALIENTES</FONT></B>
			</td>
		  </tr>
          <tr> 
            <td width="20%" align="left"> </td>
            <td width="30%"> </td>
            <td width="50%" align="left"> </td>
          </tr>
          <tr> 
            <td width="20%" align="right"><B>Ordenar por : </B></td>
            <td width="30%"> </td>
            <td width="50%" align="left"><B>Desde : </B></td>
          </tr>
          <tr>
            <td width="20%" align="center"> </td>
            <td width="30%" align="left">
				 <INPUT type="radio" name="E01REQORDC" value="C" onclick="JavaScript:ordCustomer()"
					<% if (msgList.getE01REQORD().equals("C")) out.print(" checked"); %>
				  > Numero de Cliente :
			</td>
            <td width="50%" align="left">
              <input type="text" name="E01REQCUS"  size=10 maxlength="9" onKeyPress="enterInteger(event)">
              <a href="javascript:GetCustomerDescId('E01REQCUS','','')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0"></a></td>
          </tr>
          <tr> 
            <td width="20%" align="center"></td>
            <td width="30%" align="left">
				<INPUT type="radio" name="E01REQORDD" value="D" onclick="JavaScript:ordDate()"
					<% if (msgList.getE01REQORD().equals("D")) out.print(" checked"); %>
				> Fecha de Proceso :
				</td>
            <td width="50%" align="left"> 
            	<eibsinput:date name="msgList" fn_month="E01REQPDM" fn_day="E01REQPDD" fn_year="E01REQPDY" />
            </td>
          </tr>
          <tr> 
            <td width="20%" align="center"></td>
            <td width="30%" align="left">
            	<INPUT type="radio" name="E01REQORDN" value="N" onclick="JavaScript:ordNumber()"
					<% if (msgList.getE01REQORD().equals("N")) out.print(" checked"); %>
					>  Numero Interno :
			</td>
            <td width="50%" align="left">
            	<INPUT type="text" name="E01REQNUM" size="10" maxlength="9" onkeypress="enterInteger(event)">
            </td>
          </tr>
          <tr> 
            <td width="20%" align="center"></td>
            <td width="30%" align="left">
				<INPUT type="radio" name="E01REQORDA" value="A" onclick="JavaScript:ordAccount()"
					<% if (msgList.getE01REQORD().equals("A")) out.print(" checked"); %>
					> Cuenta :
			</td>
            <td width="50%" align="left"> 
                <input type="text" name="E01REQACC"  size=17 maxlength="16" onKeypress="enterInteger(event)">
                <a href="javascript:GetAccount('E01REQACC','','RT','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda de Cuenta" align="middle" border="0" ></a>
            </td>
          </tr>
          <tr> 
            <td width="20%" align="center"></td>
            <td width="30%" align="left">
				<INPUT type="radio" name="E01REQORDB" value="B" onclick="JavaScript:ordBatch()"
					<% if (msgList.getE01REQORD().equals("B")) out.print(" checked"); %>
					> Lote ACH :
			</td>
            <td width="50%" align="left"> 
                <input type="text" name="E01REQBTH"  size=10 maxlength="9" onKeypress="enterInteger(event)">
            </td>
          </tr>
          <tr>
			<td width="20%" align="right"><B>Con Estado :</B></td>
			<td width="30%" align="left"></td>
            <td width="50%" align="left"></td>
          </tr>
          <tr> 
            <td width="20%" align="center"></td>
            <td width="30%" align="left">
				<INPUT type="radio" name="E01REQSTSP" value="P" onclick="JavaScript:stsPending()"
					<% if (msgList.getE01REQSTS().equals("P")) out.print(" checked"); %>
				> Pendiente de Aprobacion
			</td>
            <td width="50%" align="left"></td>
          </tr>
          <tr> 
            <td width="20%" align="center"></td>
            <td width="30%" align="left">
				<INPUT type="radio" name="E01REQSTSA" value="A" onclick="JavaScript:stsApproved()"
					<% if (msgList.getE01REQSTS().equals("A")) out.print(" checked"); %>
				> Aprobado para enviar
			</td>
            <td width="50%" align="left"></td>
          </tr>
          <tr> 
            <td></td>
            <td width="30%"> 
              <INPUT type="radio" name="E01REQSTSAST" value="*" onclick="JavaScript:stsProcessed()"
					<% if (msgList.getE01REQSTS().equals("*")) out.print(" checked"); %>
					> Procesado
			</td>
            <td width="50%" align="left"></td>
          </tr>
          <tr> 
            <td></td>
            <td width="30%" align="left"> 
              <INPUT type="radio" name="E01REQSTSR" value="R" onclick="JavaScript:stsReturned()"
					<% if (msgList.getE01REQSTS().equals("R")) out.print(" checked"); %>
					> En Proceso de Retorno
			</td>
            <td width="50%" align="left"> </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <table width="100%">		
  		<tr>
  			<td width="100%"> 
  		  		<div align="center"> 
     				<input id="EIBSBTN" type="Button" name="Process" value="Someter" onClick="JavaScript:checkInfo()">
     	  		</div>	
  			</td>
  		</tr>	
  </table>

<SCRIPT type="text/javascript">
  getElement("E01REQTYPI").checked = true;
  getElement("E01REQORDD").checked = true;
  inComing();
  ordDate();
</SCRIPT>

 <% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %> <SCRIPT type="text/javascript">
            showErrors();
     </SCRIPT> <%
 }
 %>
</FORM>
</BODY>
</HTML>
 