<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css"> 

<TITLE>Consulta Facturas</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "msgList" class= "datapro.eibs.beans.EBP016001Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<SCRIPT src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBSBillsP.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

function vendors(){
  document.getElementById("E01REQTYP").value = 'V';
  document.getElementById("E01REQTYPC").checked  = false;
  document.getElementById("E01REQTYPP").checked  = false;
}

function customers(){
  document.getElementById("E01REQTYP").value = 'C';
  document.getElementById("E01REQTYPV").checked  = false;
  document.getElementById("E01REQTYPP").checked  = false;
}

function purcharse(){
  document.getElementById("E01REQTYP").value = 'P';
  document.getElementById("E01REQTYPV").checked  = false;
  document.getElementById("E01REQTYPC").checked  = false;
}


function checkInfo(){
  	
   	document.getElementById("SCREEN").value = '2';
	document.forms[0].submit();
 }

</SCRIPT>

</HEAD>

<body>

 <h3 align="center"> Consulta Facturas por Selección<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="bill_inquiry_search, EBP0160"></h3>
<hr size="4">
 <FORM METHOD="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0160">	
    <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="2">
    <INPUT TYPE=HIDDEN NAME="E01REQTYP" id="E01REQTYP" VALUE="V">
    <INPUT TYPE=HIDDEN NAME="E01REQDTE" id="E01REQDTE" VALUE="D">
    <INPUT TYPE=HIDDEN name="VENNAME" id="VENNAME" VALUE=" " size="30" maxlength="30" >  
    
  <table id="tbenter" align="center" style="width:85%" border="1">
    <tr> 
      <td> 
        <table id="tbenter" width="100%" border="0" cellspacing="1" cellpadding="0">
          <tr>
			<td valign="middle" align="left" colspan="3" height=33>
				<INPUT type="radio" name="E01REQTYPV" id="E01REQTYPV" value="V" onclick="JavaScript:vendors()"
					<% if (msgList.getE01REQTYP().equals("V")) out.print(" checked"); %>> <B>
					<FONT color="navy"></FONT><FONT color="navy">Facturas Proveedores</FONT></B> <BR>
				<INPUT type="radio" name="E01REQTYPC" id="E01REQTYPC" value="C" onclick="JavaScript:customers()"
					<% if (msgList.getE01REQTYP().equals("C")) out.print(" checked"); %>> <B>
				    <FONT color="green"></FONT><FONT color="green">Facturas Clientes</FONT></B> <BR>
				<INPUT type="radio" name="E01REQTYPP" id="E01REQTYPP" value="P" onclick="JavaScript:purcharse()"
					<% if (msgList.getE01REQTYP().equals("P")) out.print(" checked"); %>> <B>
				    <FONT color="olive"></FONT><FONT color="olive">Facturas Con Documento Origen</FONT></B> <BR>
			</td>
		  </tr>
          <tr> 
            <td width="20%" align="left"> </td>
            <td width="30%" align="right"> Banco : </td>
            <td width="50%" align="left">
            	<INPUT type="text" name="E01REQBNK" id="E01REQBNK" size="3" maxlength="2" onkeypress="enterInteger(event)">
            </td>
          </tr>
          <tr> 
            <td width="20%" align="right"></td>
            <td width="30%" align="right"> Oficina : </td>
            <td width="50%" align="left">
            	<INPUT type="text" name="E01REQBRN" id="E01REQBRN" size="5" maxlength="4" onkeypress="enterInteger(event)">
                 <A href="javascript:GetBranch('E01REQBRN', document.forms[0].E01REQBNK.value)">
                 <IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0">
                 </A> (9999 = All Oficinas)
            </td>
          </tr>
          <tr> 
            <td width="20%" align="right"></td>
            <td width="30%" align="right"> Código : </td>
            <td width="50%" align="left">
            	<INPUT type="text" name="E01REQCOD" id="E01REQCOD" size="10" maxlength="9" onkeypress="enterInteger(event)">
            	 <a href="javascript:GetVendorBP('E01REQCOD','VENNAME')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda Proveedores" align="middle" border="0"></a>
                 <a href="javascript:GetCustomerDescId('E01REQCOD','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda Clientes" align="middle" border="0"></a>
                 (0 = Todos los Códigos)
            </td>
          </tr>
          <tr> 
            <td width="20%" align="right"></td>
            <td width="30%" align="right"> Estado Factura : </td>
            <td width="50%" align="left">
             	<select name="E01REQSTS" id="E01REQSTS">
             		<option <%= msgList.getE01REQSTS().trim().equals("T")?"selected":"" %> value="T">Todas</option>
			    	<option <%= msgList.getE01REQSTS().trim().equals("W")?"selected":"" %> value="W">Pendiente Aprobación</option>
				    <option <%= msgList.getE01REQSTS().trim().equals("A")?"selected":"" %> value="A">Activa (Aprobada)</option>
				    <option <%= msgList.getE01REQSTS().trim().equals("P")?"selected":"" %> value="P">Pagada</option>
				    <option <%= msgList.getE01REQSTS().trim().equals("S")?"selected":"" %> value="S">Suspendida</option>
				    <option <%= msgList.getE01REQSTS().trim().equals("R")?"selected":"" %> value="R">Rechazada</option>
				    <option <%= msgList.getE01REQSTS().trim().equals("R")?"selected":"" %> value="V">Anulada</option>
			    </select>
            </td>
          </tr>
          <tr> 
            <td width="20%" align="right"></td>
            <td width="30%" align="right"> Fecha : </td>
            <td width="50%" align="left">
            	<input type="radio" name="E01REQDTED" id="E01REQDTED" value="D" <% if (msgList.getE01REQDTE().equals("D")) out.print("checked"); %>>											
                Vencimiento del Pago
            	<input type="radio" name="E01REQDTEP" id="E01REQDTEP" value="P" <% if (msgList.getE01REQDTE().equals("P")) out.print("checked"); %>>
                Fecha Ultimo Pago
                
            </td>
          </tr>
          <tr>
            <td width="20%" align="center"> </td>
			<td width="30%" align="right">Fecha Desde : </td>
			<td width="50%" align="left">
				<eibsinput:date fn_month="E01REQDFM" fn_day="E01REQDFD" fn_year="E01REQDFY"/>
			<B><%=currUser.getE01DTF()%></B></td>  
          </tr>
          <tr> 
            <td width="20%" align="center"></td>
				<td width="30%" align="right">Fecha Hasta : </td>
				<td width="50%" align="left"> 
				<eibsinput:date fn_month="E01REQDTM" fn_day="E01REQDTD" fn_year="E01REQDTY"/>
            <B><%=currUser.getE01DTF()%></B></td>
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

	document.getElementById("E01REQDFM").value = '<%=currUser.getE01RDM()%>';
	document.getElementById("E01REQDFD").value = '<%=currUser.getE01RDD()%>';
   	document.getElementById("E01REQDFY").value = '<%=currUser.getE01RDY()%>';
    document.getElementById("E01REQDTM").value = '<%=currUser.getE01RDM()%>';
    document.getElementById("E01REQDTD").value = '<%=currUser.getE01RDD()%>';
    document.getElementById("E01REQDTY").value = '<%=currUser.getE01RDY()%>';
    
	document.getElementById("E01REQSTS").value = 'P';
	document.getElementById("E01REQTYPV").checked = true;
	document.getElementById("E01REQDTED").checked = true;
	document.getElementById("E01REQDTEP").checked = false;    			
	document.getElementById("E01REQBNK").value = '<%=currUser.getE01UBK()%>';
	document.getElementById("E01REQBRN").value = '<%=currUser.getE01UBR()%>';
	
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
 