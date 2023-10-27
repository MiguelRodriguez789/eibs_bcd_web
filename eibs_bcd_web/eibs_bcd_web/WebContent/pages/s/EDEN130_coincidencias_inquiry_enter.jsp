<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css"> 

<TITLE>Control List Inquiry</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "msgList" class= "datapro.eibs.beans.EDEN13001Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />

<SCRIPT type="text/javascript" SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

function ordCustomer(){
  getElement("E01REQORD").value = 'C';
  getElement("E01REQORDC").checked = true;
  var y = [ 'E01REQCUS'];
  readOnlyFields(y, false);
  getElement("E01REQORDD").checked = false;
  getElement("E01REQORDN").checked = false;
  getElement("E01REQORDA").checked = false;
  getElement("E01REQORDM").checked = false;
  getElement("E01REQORDI").checked = false;
  getElement("E01REQORDO").checked = false;
  var x = [ 'E01REQPDD', 'E01REQPDM', 'E01REQDAY', 'E01REQNUM', 'E01REQACC', 'E01REQNME', 
    	    'E01REQIDN', 'E01REQORG'];      
  cleanFields(x);
  readOnlyFields(x, true);
  }

function ordDate(){
  getElement("E01REQORD").value = 'D';
  getElement("E01REQORDD").checked = true;
  var y = [ 'E01REQPDD', 'E01REQPDM','E01REQDAY'];
  readOnlyFields(y, false);
  getElement("E01REQORDC").checked = false;
  getElement("E01REQORDN").checked = false;
  getElement("E01REQORDA").checked = false;
  getElement("E01REQORDM").checked = false;
  getElement("E01REQORDI").checked = false;
  getElement("E01REQORDO").checked = false;
  var x = [ 'E01REQCUS', 'E01REQNUM', 'E01REQACC', 'E01REQNME', 
    	    'E01REQIDN', 'E01REQORG'];      
  cleanFields(x);
  readOnlyFields(x, true);
}

function ordNumber(){
  getElement("E01REQORD").value = 'N';
  getElement("E01REQORDN").checked = true;
  var y = [ 'E01REQNUM'];
  readOnlyFields(y, false);
  getElement("E01REQORDD").checked = false;
  getElement("E01REQORDC").checked = false;
  getElement("E01REQORDA").checked = false;
  getElement("E01REQORDM").checked = false;
  getElement("E01REQORDI").checked = false;
  getElement("E01REQORDO").checked = false;
  var x = [ 'E01REQPDD', 'E01REQPDM', 'E01REQDAY', 'E01REQCUS', 'E01REQACC', 'E01REQNME', 
    	    'E01REQIDN', 'E01REQORG'];      
  cleanFields(x);
  readOnlyFields(x, true);
}

function ordAccount(){
  getElement("E01REQORD").value = 'A';
  getElement("E01REQORDA").checked = true;
  var y = [ 'E01REQACC'];
  readOnlyFields(y, false);
  getElement("E01REQORDD").checked = false;
  getElement("E01REQORDN").checked = false;
  getElement("E01REQORDC").checked = false;
  getElement("E01REQORDM").checked = false;
  getElement("E01REQORDI").checked = false;
  getElement("E01REQORDO").checked = false;
  var x = [ 'E01REQPDD', 'E01REQPDM', 'E01REQDAY', 'E01REQNUM', 'E01REQCUS', 'E01REQNME', 
    	    'E01REQIDN', 'E01REQORG'];      
  cleanFields(x);
  readOnlyFields(x, true);
}

function ordNombre(){
  getElement("E01REQORD").value = 'M';
  getElement("E01REQORDM").checked = true;
  var y = [ 'E01REQNME'];
  readOnlyFields(y, false);
  getElement("E01REQORDD").checked = false;
  getElement("E01REQORDN").checked = false;
  getElement("E01REQORDA").checked = false;
  getElement("E01REQORDC").checked = false;
  getElement("E01REQORDI").checked = false;
  getElement("E01REQORDO").checked = false;
  var x = [ 'E01REQPDD', 'E01REQPDM', 'E01REQDAY', 'E01REQNUM', 'E01REQACC', 'E01REQCUS', 
    	    'E01REQIDN', 'E01REQORG'];      
  cleanFields(x);
  readOnlyFields(x, true);
}

function ordIdn(){
  getElement("E01REQORD").value = 'I';
  getElement("E01REQORDI").checked = true;
  var y = [ 'E01REQIDN'];
  readOnlyFields(y, false);
  getElement("E01REQORDD").checked = false;
  getElement("E01REQORDN").checked = false;
  getElement("E01REQORDA").checked = false;
  getElement("E01REQORDM").checked = false;
  getElement("E01REQORDC").checked = false;
  getElement("E01REQORDO").checked = false;
  var x = [ 'E01REQPDD', 'E01REQPDM', 'E01REQDAY', 'E01REQNUM', 'E01REQACC', 'E01REQNME', 
    	    'E01REQCUS', 'E01REQORG'];      
  cleanFields(x);
  readOnlyFields(x, true);
  }
  
function ordOrg(){
  getElement("E01REQORD").value = 'O';
  getElement("E01REQORDO").checked = true;
  var y = [ 'E01REQORG'];
  readOnlyFields(y, false);
  getElement("E01REQORDD").checked = false;
  getElement("E01REQORDN").checked = false;
  getElement("E01REQORDA").checked = false;
  getElement("E01REQORDM").checked = false;
  getElement("E01REQORDI").checked = false;
  getElement("E01REQORDC").checked = false;
  var x = [ 'E01REQPDD', 'E01REQPDM', 'E01REQDAY', 'E01REQNUM', 'E01REQACC', 'E01REQNME', 
    	    'E01REQIDN', 'E01REQCUS'];      
  cleanFields(x);
  readOnlyFields(x, true);
  }  

function stsPending(){
  getElement("E01REQSTS").value = 'P';
  getElement("E01REQSTSA").checked = false;
  getElement("E01REQSTSC").checked = false;
}

function stsApproved(){
  getElement("E01REQSTS").value = 'A';
  getElement("E01REQSTSP").checked = false;
  getElement("E01REQSTSC").checked = false;
}

function stsReject(){
  getElement("E01REQSTS").value = 'C';
  getElement("E01REQSTSP").checked = false;
  getElement("E01REQSTSA").checked = false;
}

function checkInfo(){
  	if (getElement("E01REQORD").value == "C") {
		getElement("E01REQFRM").value = getElement("E01REQCUS").value;
	} else if (getElement("E01REQORD").value == "N") {
		getElement("E01REQFRM").value = getElement("E01REQNUM").value;
	} else if (getElement("E01REQORD").value == "A") {
		getElement("E01REQFRM").value = getElement("E01REQACC").value;
	} else if (getElement("E01REQORD").value == "M") {
		getElement("E01REQFRM").value = getElement("E01REQNME").value;
	} else if (getElement("E01REQORD").value == "I") {
		getElement("E01REQFRM").value = getElement("E01REQIDN").value;
	} else if (getElement("E01REQORD").value == "O") {
		getElement("E01REQFRM").value = getElement("E01REQORG").value;	
	} else if (getElement("E01REQORD").value == "D") {
		getElement("E01REQFRM").value = getElement("E01REQPDY").value + getElement("E01REQPDM").value + getElement("E01REQPDD").value;		
	} 
   	document.forms[0].SCREEN.value = '2';
	document.forms[0].submit();
 }

</SCRIPT>

</HEAD>

<body>

 <h3 align="center">Consulta Coincidencias Listas de Control<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="coincidencias_inquiry_enter, EDEN130"></h3>
<hr size="4">
 <FORM METHOD="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.ofac.JSEDEN130">	
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
    <INPUT TYPE=HIDDEN NAME="E01REQORD" VALUE="C">
    <INPUT TYPE=HIDDEN NAME="E01REQSTS" VALUE="P">
    <INPUT TYPE=HIDDEN NAME="E01REQFRM" VALUE="0">
    
  <table id="tbenter" align="center" style="width:85%" border="1">
    <tr> 
      <td> 
        <table id="tbenter" width="100%" border="0" cellspacing="1" cellpadding="0">
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
              <eibsinput:date fn_month="E01REQPDM" fn_day="E01REQPDD" fn_year="E01REQPDY" />
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
                <a href="javascript:GetAccount('E01REQACC','','RT','')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda de Cuenta" align="middle" border="0" ></a>
            </td>
          </tr>
          <tr> 
            <td width="20%" align="center"></td>
            <td width="30%" align="left">
				<INPUT type="radio" name="E01REQORDM" value="M" onclick="JavaScript:ordNombre()"
					<% if (msgList.getE01REQORD().equals("M")) out.print(" checked"); %>
					> Nombre :
			</td>
            <td width="50%" align="left"> 
                <input type="text" name="E01REQNME"  size=45 maxlength="60" >
            </td>
          </tr>
          <tr> 
            <td width="20%" align="center"></td>
            <td width="30%" align="left">
				<INPUT type="radio" name="E01REQORDI" value="I" onclick="JavaScript:ordIdn()"
					<% if (msgList.getE01REQORD().equals("I")) out.print(" checked"); %>
					> Identificación :
			</td>
            <td width="50%" align="left"> 
                <input type="text" name="E01REQIDN" size=26 maxlength="25" >
            </td>
          </tr>          
          <tr> 
            <td width="20%" align="center"></td>
            <td width="30%" align="left">
				<INPUT type="radio" name="E01REQORDO" value="O" onclick="JavaScript:ordOrg()"
					<% if (msgList.getE01REQORD().equals("O")) out.print(" checked"); %>
					> Programa Origen :
			</td>
            <td width="50%" align="left"> 
                <input type="text" name="E01REQORG" size=11 maxlength="10" >
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
				> Pendiente de Aprobación
			</td>
            <td width="50%" align="left"></td>
          </tr>
          <tr> 
            <td width="20%" align="center"></td>
            <td width="30%" align="left">
				<INPUT type="radio" name="E01REQSTSA" value="A" onclick="JavaScript:stsApproved()"
					<% if (msgList.getE01REQSTS().equals("A")) out.print(" checked"); %>
				> Aprobado</td>
            <td width="50%" align="left"></td>
          </tr>
          <tr> 
            <td width="20%" align="center"></td>
            <td width="30%" align="left">
				<INPUT type="radio" name="E01REQSTSC" value="C" onclick="JavaScript:stsReject()"
					<% if (msgList.getE01REQSTS().equals("C")) out.print(" checked"); %>
				> Rechazado</td>
            <td width="50%" align="left"></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <table width="100%">		
  		<tr>
  			<td width="100%"> 
  		  		<div align="center"> 
     				<input id="EIBSBTN" type="Button" name="Process" value="Enviar" onClick="JavaScript:checkInfo()">
     	  		</div>	
  			</td>
  		</tr>	
  </table>

<SCRIPT type="text/javascript">
  getElement("E01REQSTS").value = 'A';
  getElement("E01REQSTSA").checked = true;
  ordCustomer();
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
 