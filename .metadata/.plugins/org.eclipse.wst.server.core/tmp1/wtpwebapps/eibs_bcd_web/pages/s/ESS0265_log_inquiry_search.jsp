<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META http-equiv="Content-Style-Type" content="text/css"> 

<TITLE>Biometric Log</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "msgRecord" class= "datapro.eibs.beans.ESS026501Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />

<SCRIPT src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<SCRIPT>

function selUser(){
  getElement("E01REQORD").value = 'U';
  getElement("E01REQUSR").value='';
  getElement("E01REQFRM").value='';
}


function checkInfo(){
  	if (getElement("E01REQORD").value == "U") {
		getElement("E01REQFRM").value = getElement("E01REQUSR").value;
	}  
   	document.forms[0].SCREEN.value = '2';
	document.forms[0].submit();
 }


</SCRIPT>

</HEAD>

<body>

<% 
	String legtyp = (msgRecord.getH01LGT().equals("1")?"JURIDICO":"PERSONA"); 
 	if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
    }
%>

<h3 align="center">Consulta de Log de Biometría en e-IBS 
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="log_inquiry_search, ESS0265">
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESS0265">
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
    <INPUT TYPE=HIDDEN NAME="E01REQTYP" VALUE="C"> 
    <INPUT TYPE=HIDDEN NAME="E01REQORD" VALUE="<%=msgRecord.getE01REQORD()%>">
    <INPUT TYPE=HIDDEN NAME="E01REQFRM" VALUE="<%=msgRecord.getE01REQFRM()%>">

<table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" class="tbhead" bgcolor="#FFFFFF" bordercolor="#FFFFFF" align="center">
        <tr id="trdark"> 
            <td nowrap width="10%" align="right">Tipo Legal : </td>
            <td nowrap width="20%" align="left" > <%=legtyp%></td>
            <td nowrap width="10%" align="right">Estado : </td>
			<td nowrap width="60%" align="left" style="color:red;font-size:12;">
				<b><%= msgRecord.getD01STATUS().trim()%> </b>		
			</td>
		</tr>
		<tr id="trclear"> 
            <td nowrap width="10%" align="right">Código :</td>
            <td nowrap width="20%" align="left"><b><%= msgRecord.getH01CUN().trim()%></b></td>
            <td nowrap width="10%" align="right">Nombre Legal :</td>
			<td nowrap width="60%" align="left"><b><%= msgRecord.getH01NA1().trim()%></b></td>
		</tr>
		<tr id="trdark"> 
            <td nowrap width="10%" align="right">ID : </td>
            <td nowrap width="20%" align="left">
            	<b><%=msgRecord.getH01PID().trim()%> - <%=msgRecord.getH01TID().trim()%> - <%= msgRecord.getH01IDN().trim()%></b>  
			</td>
            <td nowrap width="10%" align="right"></td>
			<td nowrap width="60%" align="left"></td>
		</tr>
        </table>
	</td>
  </tr>
</table>  
<table class="tbenter"  border="1">
	<tr>
		<td>
		<table id="tbenter" width="100%" border="0" cellspacing="1" cellpadding="0">
			<tr id="trdark">
				<td width="20%" align="right"><b>Seleccionar Por : </b></td>
				<td width="30%"></td>
				<td width="50%" align="left"><b> </b></td>
			</tr>
			<tr>
				<td width="20%" align="center"></td>
				<td width="30%" align="left"><input type="radio" name="E01REQORD" value="U" onclick="JavaScript:selUser()">
				Usuario :</td>
				<td width="50%" align="left"><input type="text" name="E01REQUSR" size="12" maxlength="10"></td>
			</tr>
			<tr id="trdark">
				<td width="20%" align="center"></td>
				<td width="30%" align="left"><input type="radio" name="E01REQORD" value="T"> 
					Todos : 
				</td>
				<td width="50%" align="left"></td>
			</tr>
			
			<tr id="trdark">
				<td width="20%" align="right"><b>Seleccionar fechas :</b></td>
				<td width="30%" align="left"><b> </b></td>
				<td width="50%" align="left"></td>
			</tr>
			<tr>
				<td width="20%" align="center"></td>
				<td width="30%" align="left">Desde:</td>
				<td width="50%" align="left">
			    <eibsinput:date fn_month="E01REQDFM" fn_day="E01REQDFD" fn_year="E01REQDFY" />
				</td>
			</tr>
			<tr id="trdark">
				<td width="20%" align="center"></td>
				<td width="30%" align="left">Hasta:</td>
				<td width="50%" align="left">
			    <eibsinput:date fn_month="E01REQDTM" fn_day="E01REQDTD" fn_year="E01REQDTY" />
				</td>
			</tr>
		</table>

		<table class="tbenter" width="100%">
			<tr>
				<td width="85%">
				<div align="center"><input id="EIBSBTN" type="Button"name="Process" value="Enviar" onClick="JavaScript:checkInfo()">
				</div>
				</td>
			</tr>
		</table>

		</td>
	</tr>
</table>

<SCRIPT>

    <% if (currUser.getE01DTF().equals("MDY")) { %>
			getElement("E01REQDFM").value = '<%=currUser.getE01RDM()%>';
    		getElement("E01REQDFD").value = '<%=currUser.getE01RDD()%>';
    		getElement("E01REQDFY").value = '<%=currUser.getE01RDY()%>';
    		getElement("E01REQDTM").value = '<%=currUser.getE01RDM()%>';
    		getElement("E01REQDTD").value = '<%=currUser.getE01RDD()%>';
    		getElement("E01REQDTY").value = '<%=currUser.getE01RDY()%>';
    		
    <% } else if (currUser.getE01DTF().equals("DMY")) { %>    
			getElement("E01REQDFM").value = '<%=currUser.getE01RDM()%>';
    		getElement("E01REQDFD").value = '<%=currUser.getE01RDD()%>';
    		getElement("E01REQDFY").value = '<%=currUser.getE01RDY()%>';
    		getElement("E01REQDTD").value = '<%=currUser.getE01RDD()%>';
    		getElement("E01REQDTM").value = '<%=currUser.getE01RDM()%>';
    	   	getElement("E01REQDTY").value = '<%=currUser.getE01RDY()%>';
    			
    <% } else { %>
			getElement("E01REQDFM").value = '<%=currUser.getE01RDM()%>';
    		getElement("E01REQDFD").value = '<%=currUser.getE01RDD()%>';
    		getElement("E01REQDFY").value = '<%=currUser.getE01RDY()%>';
    		getElement("E01REQDTY").value = '<%=currUser.getE01RDY()%>';
    		getElement("E01REQDTM").value = '<%=currUser.getE01RDM()%>';
    	   	getElement("E01REQDTD").value = '<%=currUser.getE01RDD()%>'; 
    	   	
    <% } %>	
  
</SCRIPT>

</form>
</body>
</HTML>
 