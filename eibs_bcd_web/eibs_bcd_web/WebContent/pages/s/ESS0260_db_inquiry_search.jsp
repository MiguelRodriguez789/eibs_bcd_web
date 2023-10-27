<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META http-equiv="Content-Style-Type" content="text/css"> 

<TITLE>Documents Source</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "msgList" class= "datapro.eibs.beans.ESS026001Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />

<SCRIPT src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<SCRIPT Language="javascript">

function TypType(op){
  getElement("E01REQTYP").value = op;
}

function selUser(){
  getElement("E01REQORD").value = 'U';
  getElement("E01REQNUM").value='0';
  getElement("E01REQUSR").value='';
  getElement("E01REQFRM").value='';
}

function selOper(){
  getElement("E01REQORD").value = 'O';
  getElement("E01REQUSR").value='';
  getElement("E01REQNUM").value='0';
  getElement("E01REQFRM").value='';
}

function selNumber(){
  getElement("E01REQORD").value = 'N';
  getElement("E01REQUSR").value='';
  getElement("E01REQFRM").value='';
  getElement("E01REQNUM").value='0';
}

function checkInfo(){
  	if (getElement("E01REQORD").value == "U") {
		getElement("E01REQFRM").value = getElement("E01REQUSR").value;
	} else if (getElement("E01REQORD").value == "N") {
		getElement("E01REQFRM").value = getElement("E01REQNUM").value;
	} else if (getElement("E01REQORD").value == "O") {
		getElement("E01REQFRM").value = getElement("E01CDE").value;
	}  
   	document.forms[0].SCREEN.value = '2';
	document.forms[0].submit();
 }


</SCRIPT>

</HEAD>

<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
    }
%>

<h3 align="center">Consulta de Auditoria sobre Operaciones en e-IBS 
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="db_inquiry_search, ESS0260">
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESS0260">
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
    <INPUT TYPE=HIDDEN NAME="E01REQTYP" VALUE="00"> 
    <INPUT TYPE=HIDDEN NAME="E01REQORD" VALUE="<%=msgList.getE01REQORD()%>">
    <INPUT TYPE=HIDDEN NAME="E01REQFRM" VALUE="<%=msgList.getE01REQFRM()%>">


<table class="tbenter"  border="1">
	<tr>
		<td>
		<table id="tbenter" width="100%" border="0" cellspacing="1"
			cellpadding="0">
			<tr id="trdark">
				<td width="20%" align="right"><b>Ejecutadas sobre :</b></td>
				<td width="30%" align="left"><b>Producto: </b></td>
				<td width="50%" align="left"></td>
			</tr>
			<tr >
				<td width="20%" align="center"></td>
				<td width="30%" align="left"><input type="radio"
					name="E01REQTYP" value="00" checked onclick="JavaScript:TypType(00)">
				Todos</td>
				<td width="50%" align="left"></td>
			</tr>
			<tr id="trdark">
				<td width="20%" align="center"></td>
				<td width="30%" align="left"><input type="radio"
					name="E01REQTYP" value="12" onclick="JavaScript:TypType(12)">
				Perfiles de Usuarios e-IBS</td>
				<td width="50%" align="left"></td>
			</tr>
			<tr>
				<td width="20%" align="center"></td>
				<td width="30%" align="left"><input type="radio"
					name="E01REQTYP" value="1" onclick="JavaScript:TypType(01)">
				Clientes</td>
				<td width="50%" align="left"></td>
			</tr>
			<tr id="trdark">
				<td width="20%" align="center"></td>
				<td width="30%" align="left"><input type="radio"
					name="E01REQTYP" value="2" onclick="JavaScript:TypType(02)">
				Cuentas de Detalle</td>
				<td width="50%" align="left"></td>
			</tr>
			<tr>
				<td width="20%" align="center"></td>
				<td width="30%" align="left"><input type="radio"
					name="E01REQTYP" value="3" onclick="JavaScript:TypType(03)">
				Certificados de Deposito</td>
				<td width="50%" align="left"></td>
			</tr>
			<tr id="trdark">
				<td width="20%" align="center"></td>
				<td width="30%" align="left"><input type="radio"
					name="E01REQTYP" value="4" onclick="JavaScript:TypType(04)">
				Prestamos</td>
				<td width="50%" align="left"></td>
			</tr>
			<tr>
				<td width="20%" align="center"></td>
				<td width="30%" align="left"><input type="radio"
					name="E01REQTYP" value="5" onclick="JavaScript:TypType(05)">
				Papeles Comerciales</td>
				<td width="50%" align="left"></td>
			</tr>
			<tr id="trdark">
				<td width="20%" align="center"></td>
				<td width="30%" align="left"><input type="radio"
					name="E01REQTYP" value="6" onclick="JavaScript:TypType(06)">
				Cartas de Credito</td>
				<td width="50%" align="left"></td>
			</tr>
			<tr>
				<td width="20%" align="center"></td>
				<td width="30%" align="left"><input type="radio"
					name="E01REQTYP" value="7" onclick="JavaScript:TypType(07)">
				Beneficiarios, Firmantes, otros</td>
				<td width="50%" align="left"></td>
			</tr>
			<tr id="trdark">
				<td width="20%" align="center"></td>
				<td width="30%" align="left"><input type="radio"
					name="E01REQTYP" value="8" onclick="JavaScript:TypType(08)">
				Cobranzas</td>
				<td width="50%" align="left"></td>
			</tr>
			<tr>
				<td width="20%" align="center"></td>
				<td width="30%" align="left"><input type="radio"
					name="E01REQTYP" value="9" onclick="JavaScript:TypType(09)">
				Tarjetas de Credito</td>
				<td width="50%" align="left"></td>
			</tr>
			<tr id="trdark">
				<td width="20%" align="center"></td>
				<td width="30%" align="left"><input type="radio"
					name="E01REQTYP" value="11" onclick="JavaScript:TypType(11)">
				Cuentas Contables</td>
				<td width="50%" align="left"></td>
			</tr>
			<tr>
				<td width="20%" align="center"></td>
				<td width="30%" align="left"><input type="radio"
					name="E01REQTYP" value="99" onclick="JavaScript:TypType(99)">
				Otros Productos</td>
				<td width="50%" align="left"></td>
			</tr>

			<tr id="trdark">
				<td width="20%" align="right"><b>Seleccionar Por : </b></td>
				<td width="30%"></td>
				<td width="50%" align="left"><b> </b></td>
			</tr>
			<tr>
				<td width="20%" align="center"></td>
				<td width="30%" align="left"><input type="radio"
					name="E01REQORD" value="U" onclick="JavaScript:selUser()">
				Usuario :</td>
				<td width="50%" align="left"><input type="text"
					name="E01REQUSR" size="12" maxlength="10"></td>
			</tr>
			<tr id="trdark">
				<td width="20%" align="center"></td>
				<td width="30%" align="left"><input type="radio"
					name="E01REQORD" value="N" onclick="JavaScript:selNumber()">
				Número Interno :</td>
				<td width="50%" align="left"><input type="text"
					name="E01REQNUM" size="18" maxlength="15"
					onkeypress="enterInteger(event)"></td>
			</tr>
			<tr>
				<td width="20%" align="center"></td>
				<td width="30%" align="left"><input type="radio"
					name="E01REQORD" value="O" onclick="JavaScript:selOper()">
				Operación :</td>
				<td width="50%" align="left"><select name="E01CDE">
					<option value=" "></option>
					<option value="NEW">Crear</option>
					<option value="UPD">Actualizar</option>
					<option value="APR">Aprobar</option>
					<option value="REJ">Rechazar</option>
					<option value="INQ">Consultar</option>
					<option value="DEL">Borrar</option>
					<option value="TODAS">Todas</option>
					<option value="OTRAS">Diferentes a las anteriores</option>
				</select></td>
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

		<center>
		<table class="tbenter" width="100%">
			<tr>
				<td width="85%">
				<div align="center"><input id="EIBSBTN" type="Button"
					name="Process" value="Enviar" onClick="JavaScript:checkInfo()">
				</div>
				</td>
			</tr>
		</table>
		</center>

		</td>
	</tr>
</table>

<SCRIPT language="JavaScript">

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
 