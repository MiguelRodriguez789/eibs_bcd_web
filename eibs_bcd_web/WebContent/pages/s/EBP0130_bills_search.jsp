<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css"> 

<TITLE>Bills</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "msgList" class= "datapro.eibs.beans.EBP013001Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />

<SCRIPT src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBSBillsP.jsp"> </SCRIPT>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<SCRIPT type="text/javascript">

function vendors(){
  document.getElementById("E01REQTYP").value = 'V';
  document.getElementById("E01REQTYPP").checked  = false;
}

function purcharse(){
  document.getElementById("E01REQTYP").value = 'P';
  document.getElementById("E01REQTYPV").checked  = false;
}


function ordCustomer(){
  document.getElementById("E01REQORD").value = 'C';
  document.getElementById("E01REQORDD").checked = false;
  document.getElementById("E01REQORDN").checked = false;
  document.getElementById("E01REQORDB").checked = false;
  document.getElementById("E01REQNUM").value='0';
  document.getElementById("E01REQBIL").value='0';
  document.getElementById("E01REQCUS").value='0';
}

function ordDate(){
  document.getElementById("E01REQORD").value = 'D';
  document.getElementById("E01REQORDC").checked = false;
  document.getElementById("E01REQORDN").checked = false;
  document.getElementById("E01REQORDB").checked = false;
  document.getElementById("E01REQCUS").value='0';
  document.getElementById("E01REQNUM").value='0';
  document.getElementById("E01REQBIL").value=' ';
}

function ordNumber(){
  document.getElementById("E01REQORD").value = 'N';
  document.getElementById("E01REQORDC").checked = false;
  document.getElementById("E01REQORDD").checked = false;
  document.getElementById("E01REQORDB").checked = false;
  document.getElementById("E01REQCUS").value='0';
  document.getElementById("E01REQBIL").value=' ';
  document.getElementById("E01REQNUM").value='0';
}

function ordBill(){
  document.getElementById("E01REQORD").value = 'B';
  document.getElementById("E01REQORDC").checked = false;
  document.getElementById("E01REQORDD").checked = false;  
  document.getElementById("E01REQORDN").checked = false;  
  document.getElementById("E01REQCUS").value='0';
  document.getElementById("E01REQNUM").value='0';
  document.getElementById("E01REQBIL").value=' ';
}

function stsPending(){
  document.getElementById("E01REQSTS").value = 'W';
  document.getElementById("E01REQSTSR").checked = false;
  document.getElementById("E01REQSTSA").checked = false;
}

function stsRejected(){
  document.getElementById("E01REQSTS").value = 'R';
  document.getElementById("E01REQSTSW").checked = false;
  document.getElementById("E01REQSTSA").checked = false;
}

function stsApproved(){
  document.getElementById("E01REQSTS").value = 'A';
  document.getElementById("E01REQSTSW").checked = false;
  document.getElementById("E01REQSTSR").checked = false;
}

function checkInfo(){
  	if (document.getElementById("E01REQORD").value == "C") {
		document.getElementById("E01REQFRM").value = document.getElementById("E01REQCUS").value;
	} else if (document.getElementById("E01REQORD").value == "N") {
		document.getElementById("E01REQFRM").value = document.getElementById("E01REQNUM").value;
	} else if (document.getElementById("E01REQORD").value == "B") {
		document.getElementById("E01REQFRM").value = document.getElementById("E01REQBIL").value;
	} 
   	document.forms[0].SCREEN.value = '2';
	document.forms[0].submit();
 }

</SCRIPT>

</HEAD>

<body>

 <h3 align="center">Facturas
 	<%	if (msgList.getE01REQTYP().equals("V")) { 
		 	out.println(" Proveedor "); 
		} else if (msgList.getE01REQTYP().equals("C")) {
		    out.println(" Cliente "); 
		   	} else { out.println(" Con Documento Origen Obligación ");
		}  	
	%> <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="bills_search, EBP0130"></h3>
<hr size="4">
 <FORM METHOD="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0130">	
    <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="2">
    <INPUT TYPE=HIDDEN NAME="E01REQTYP" id="E01REQTYP" VALUE="<%=msgList.getE01REQTYP()%>"> 
    <INPUT TYPE=HIDDEN NAME="E01REQORD" id="E01REQORD" VALUE="N">
    <INPUT TYPE=HIDDEN NAME="E01REQSTS" id="E01REQSTS" VALUE="W">
    <INPUT TYPE=HIDDEN NAME="E01REQFRM" id="E01REQFRM" VALUE="0">
    
  <table id="tbenter" align="center" style="width:85%" border="1">
    <tr> 
      <td> 
        <table id="tbenter" width="100%" border="0" cellspacing="1" cellpadding="0">
          <tr>
          <% if (msgList.getE01REQTYP().equals("V") )  { %>
			<td valign="middle" align="left" colspan="3" height=33>
				<INPUT type="radio" name="E01REQTYPV" id="E01REQTYPV" value="V" onclick="JavaScript:vendors()"
					<% if (msgList.getE01REQTYP().equals("V")) out.print(" checked"); %>> <B>
					</FONT><FONT color="#000066">Facturas</FONT></B> <BR>
			
				<INPUT type="radio" name="E01REQTYPP" id="E01REQTYPP" value="P" onclick="JavaScript:purcharse()"
					<% if (msgList.getE01REQTYP().equals("P")) out.print(" checked"); %>> <B>
				    </FONT><FONT color="#000066">Facturas con Documento Origen Obligación</FONT></B> <BR>
			</td>
			<% }%>
		  </tr>
          <tr> 
            <td width="20%" align="left"> </td>
            <td width="30%"> </td>
            <td width="50%" align="left"> </td>
          </tr>

		  <tr> 
            <td width="20%" align="right"><B>Orden Por : </B></td>
            <td width="30%"> </td>
            <td width="50%" align="left"><B>Desde</B>:</td>
          </tr>
          <tr>
            <td width="20%" align="center"> </td>
            <td width="30%" align="left">
				 <INPUT type="radio" name="E01REQORDC" id="E01REQORDC" value="C" onclick="JavaScript:ordCustomer()"
					<% if (msgList.getE01REQORD().equals("C")) out.print(" checked"); %>
				  > Código Proveedor/Código Cliente :
			</td>
            <td width="50%" align="left">
              <input type="text" name="E01REQCUS"  id="E01REQCUS"  size=10 maxlength="9" onKeyPress="enterInteger(event)">
			  <a href="javascript:GetVendorBP('E01REQCUS','VENNAME')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda Proveedor" align="middle" border="0"></a>
              <a href="javascript:GetCustomerDescId('E01REQCUS','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda Cliente" align="middle" border="0"></a>
			<INPUT type="text" name="VENNAME" id="VENNAME" size="30" maxlength="30" readonly></td>  
          </tr>
          <tr> 
            <td width="20%" align="center"></td>
            <td width="30%" align="left">
				<INPUT type="radio" name="E01REQORDD" id="E01REQORDD" value="D" onclick="JavaScript:ordDate()"
					<% if (msgList.getE01REQORD().equals("D")) out.print(" checked"); %>
				> Fecha Vencimiento de Pago :
				</td>
            <td width="50%" align="left">
               <eibsinput:date fn_month="E01REQDA1" fn_day="E01REQDA2" fn_year="E01REQDA3" />
            <B><%=currUser.getE01DTF()%></B>
            </td>
          </tr>
          <tr> 
            <td width="20%" align="center"></td>
            <td width="30%" align="left">
            	<INPUT type="radio" name="E01REQORDN" id="E01REQORDN" value="N" onclick="JavaScript:ordNumber()"
					<% if (msgList.getE01REQORD().equals("N")) out.print(" checked"); %>
					>  Número Interno :
			</td>
            <td width="50%" align="left">
            	<INPUT type="text" name="E01REQNUM" id="E01REQNUM" size="13" maxlength="12" onkeypress="enterInteger(event)">
            </td>
          </tr>
          <tr> 
            <td width="20%" align="center"></td>
            <td width="30%" align="left">
				<INPUT type="radio" name="E01REQORDB" id="E01REQORDB" value="B" onclick="JavaScript:ordBill()"
					<% if (msgList.getE01REQORD().equals("B")) out.print(" checked"); %>
					> Número Factura :
			</td>
            <td width="50%" align="left"> 
                <input type="text" name="E01REQBIL" id="E01REQBIL"  size=26 maxlength="25" >
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
				<INPUT type="radio" name="E01REQSTSW" id="E01REQSTSW" value="W" onclick="JavaScript:stsPending()"
					<% if (msgList.getE01REQSTS().equals("W")) out.print(" checked"); %>
				> Pendiente de Aprobación
			</td>
            <td width="50%" align="left"></td>
          </tr>
          <tr> 
            <td width="20%" align="center"></td>
            <td width="30%" align="left">
				<INPUT type="radio" name="E01REQSTSR" id="E01REQSTSR" value="R" onclick="JavaScript:stsRejected()"
					<% if (msgList.getE01REQSTS().equals("R")) out.print(" checked"); %>
				> Rechazada
			</td>
            <td width="50%" align="left"></td>
          </tr>
          <tr> 
            <td width="20%" align="center"></td>
            <td width="30%" align="left">
				<INPUT type="radio" name="E01REQSTSA" id="E01REQSTSA" value="A" onclick="JavaScript:stsApproved()"
					<% if (msgList.getE01REQSTS().equals("A")) out.print(" checked"); %>
				> Activa (Aprobada)
			</td>
            <td width="50%" align="left"></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <table id="tbenter" align="center" style="width:85%">
   		<tr>
  			<td width="85%"> 
  		  		<div align="center"> 
     				<input id="EIBSBTN" type="Button" name="Process" id="Process" value="Enviar" onClick="JavaScript:checkInfo()">
     	  		</div>	
  			</td>
  		</tr>	
  </table>

<SCRIPT type="text/javascript">

	document.getElementById("E01REQDA1").value = '<%=currUser.getE01RDM()%>';
    document.getElementById("E01REQDA2").value = '<%=currUser.getE01RDD()%>';
    document.getElementById("E01REQDA3").value = '<%=currUser.getE01RDY()%>';
    		
//  document.getElementById("E01REQTYPV").checked = true;  
//  document.getElementById("E01REQORDN").checked = true;
//  document.getElementById("E01REQSTSW").checked = true;
  ordNumber();
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
 