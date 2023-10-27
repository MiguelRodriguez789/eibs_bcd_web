<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css"> 

<TITLE>Pay Bills Selection</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "msgList" class= "datapro.eibs.beans.EBP014501Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<SCRIPT src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBSBillsP.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

function SingleInvoice(){
  document.getElementById("E01REQPYM").value = 'S';
  document.getElementById("E01REQPYMS").checked = true;
  document.getElementById("E01REQPYMM").checked = false;
}

function MultipleInvoices(){
  document.getElementById("E01REQPYM").value = 'M';
  document.getElementById("E01REQPYMS").checked = false;
  document.getElementById("E01REQPYMM").checked = true;
}

function checkInfo(){
  		
   	document.forms[0].SCREEN.value = '2';
	document.forms[0].submit();
 }

</SCRIPT>

</HEAD>

<body>

 <h3 align="center"> 
    <%	if (msgList.getE01REQTYP().equals("C")) { 
		 	out.println(" Clientes - "); 
		} else { out.println(" Proveedores - ");
		}  	
	%> Selección de Pagos a Aprobar<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="pay_by_vendor_search, EBP0145"></h3>
<hr size="4">
 <FORM METHOD="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0145">	
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
    <INPUT TYPE=HIDDEN NAME="E01REQTYP" VALUE="<%=msgList.getE01REQTYP()%>">
    <INPUT TYPE=HIDDEN NAME="E01REQPYM" id="E01REQPYM" VALUE="S"> 
    
  <table id="tbenter" align="center" style="width:85%" border="1">
    <tr> 
      <td> 
        <table id="tbenter" width="100%" border="0" cellpadding="0">
         <tr>
            <td width="30%" align="center"> </td>
			<td width="70%" align="left">
            	<input type="radio" id="E01REQPYMS" name="E01REQPYMS" value="S" onclick="JavaScript:SingleInvoice()" 
            	<% if (msgList.getE01REQPYM().equals("S")) out.print(" checked"); %>>											
                Pago por Factura 
                <input type="radio" id="E01REQPYMM" name="E01REQPYMM" value="M" onclick="JavaScript:MultipleInvoices()"
            	<% if (msgList.getE01REQPYM().equals("M")) out.print(" checked"); %>>
                Varias Facturas en un Pago</td>
         </tr>
           <tr>
				<td width="30%" align="right"><BR>
				<BR>
				</td>
				<td width="70%" align="left"></td>
				
         </tr>
         <tr >
	     	<td width="30%" align="right"> </td>
    	    <td width="70%" align="left"><B>"Obligatorio para la opción de  Varias Facturas en un Pago"</B></td>
	       </tr>
           <tr>
				<td width="30%" align="right"></td>
				<td width="70%" align="left"></td>
         </tr>
		 <tr>
            <td width="30%" align="right"> Proveedor : </td>
            <td width="70%" align="left">
            	<INPUT type="text" name="E01REQVEN" size="10" maxlength="9" onkeypress="enterInteger(event)">
            	<a href="javascript:GetVendorBP('E01REQVEN','VENNAME')">
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda Proveedor" align="bottom" border="0"></a>
					<INPUT type="text" name="VENNAME" size="30" maxlength="30" readonly>
			</td>
         </tr>
         <tr> 
            <td width="30%" align="right">  Vía de Pago: </td>
            <td width="70%" align="left">
             	<select name="E01REQPVI">
             		<option <%= msgList.getE01REQPVI().trim().equals(" ")?"selected":"" %> value=" ">Todos</option>
             		<option <%= msgList.getE01REQPVI().trim().equals("A")?"selected":"" %> value="A">ACH</option>
				    <option <%= msgList.getE01REQPVI().trim().equals("R")?"selected":"" %> value="R">Cuenta Corriente</option>
				    <option <%= msgList.getE01REQPVI().trim().equals("G")?"selected":"" %> value="G">Cuenta Contable</option>
				    <option <%= msgList.getE01REQPVI().trim().equals("C")?"selected":"" %> value="C">Cheque Oficial</option>
				    <option <%= msgList.getE01REQPVI().trim().equals("S")?"selected":"" %> value="S">Swift</option>
				    <option <%= msgList.getE01REQPVI().trim().equals("F")?"selected":"" %> value="F">Transferencia</option>
			    </select>
            </td>
         </tr>
        </table>
  </table>
  <table id="tbenter" align="center" style="width:85%">
   		<tr>
  			<td width="85%"> 
  		  		<div align="center"> 
     				<input id="EIBSBTN" type="Button" name="Process" value="Submit" onClick="JavaScript:checkInfo()">
     	  		</div>	
  			</td>
  		</tr>	
  </table>
<SCRIPT type="text/javascript">

	document.getElementById("E01REQPYM").value = 'S';
	document.getElementById("E01REQPYMS").checked = true;
	document.getElementById("E01REQPYMM").checked = false;
	
</SCRIPT>

 <% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %> <SCRIPT type="text/javascript">
    showErrors();
    </SCRIPT> 
 <% }%>
</FORM>
</BODY>
</HTML>
 