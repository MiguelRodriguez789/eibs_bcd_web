<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Banesco - Abonos Masivos, opcion manual</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">

<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "lnScheme" class= "datapro.eibs.beans.EDL111201Message"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT> 
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<SCRIPT type="text/javascript">
function CheckACC(){

	if ( document.forms[0].E01CNOMID.value.length < 1) {
  		alert("Debe entrar un c�digo de empresa v�lido");
  		document.forms[0].E01CNOMID.value='';
  		document.forms[0].E01CNOMID.focus();
  		return false;
	} else {
		if ( document.forms[0].E01OFFOPC.value.length < 1) {
		//  alert("Debe entrar un concepto v�lido");
		//  document.forms[0].E01OFFOPC.value='';
		//  document.forms[0].E01OFFOPC.focus();
		  	return true;
		} else {
	  		return true;
	  	}
		//  return true;
	}
}

</SCRIPT>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%> 

</head>

<body bgcolor="#FFFFFF">

<h3 align="center">Abonos Masivos, Proceso Manual<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_enter_sch,EDL1112"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL1112" onsubmit="return(CheckACC())">
	<p><INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200"></p>
  	<p>&nbsp;</p>
  	<table class="tableinfo">
    	<tr > 
      		<td nowrap height="100%"> 
        		<table cellpadding=2 cellspacing=0 width="100%" border="0">
          			<tr id="trdark"> 
            			<td nowrap width="32%"><div align="right"><b>Compa�ia de Pago :</b></div></td>
            			<td nowrap width="3%">&nbsp;</td>
            			<td nowrap width="23%"><div align="left"> 
                			<input type="text" name="E01CNOMID" size="7" maxlength="6" value="<%= userPO.getHeader7()%>">
              				<a href="javascript:GetCodeCNOFC('E01CNOMID','2D')">
              				<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a></div>
            			</td>
          			</tr>

          			<tr id="trclear"> 
            			<td nowrap width="32%"><div align="right"><b>Orden de Planilla :</b></div></td>
            			<td nowrap width="3%">&nbsp;</td>
            			<td nowrap width="23%"> 
              				<select name="E01ORDLST">
				                <option value="1" <% if(userPO.getHeader8().equals("1")) out.print("selected");%>>Nombre de Cliente</option>
				                <option value="2" <% if(userPO.getHeader8().equals("2")) out.print("selected");%>>N�mero de Empleado</option>
				                <option value="3" <% if(userPO.getHeader8().equals("3")) out.print("selected");%>>Identificaci�n</option>
              				</select>
            			</td>
          			</tr>

          			<tr id="trdark"> 
            			<td nowrap width="32%"><div align="right"><b>Descripci�n :</b></div></td>
            			<td nowrap width="3%">&nbsp;</td>
            			<td nowrap width="23%"><input type="text" name="E01NARRAT"  size="60" maxlength="60" value="<%= userPO.getHeader9()%>"></td>
          			</tr>

    				<tr> 
   						<td nowrap colspan="3">
			        		<table cellspacing=2 cellpadding=2 width="100%" border="1">
			          			<tr id="trclear"> 
			            			<td nowrap  ><div align="center"><b>Concepto</b></div></td>
			            			<td nowrap  ><div align="center"><b>Banco</b></div></td>
			            			<td nowrap  ><div align="center"><b>Sucursal</b></div></td>
			            			<td nowrap  ><div align="center"><b>Moneda</b></div></td>
			            			<td nowrap  ><div align="center"><b>Referencia</b></div></td>
			          			</tr>
			          			<tr id="trdark"> 
			            			<td nowrap  >
			            				<div align="center"> 
				                			<input type=text readonly name="E01OFFOPC"  size="3" maxlength="3"  value="<%= userPO.getHeader10()%>" >
				                			<input type=HIDDEN name="E01OFFGLN" value="<%= userPO.getHeader11()%>">
				                			<input type="text" readonly  size="26" maxlength="25" readonly name="E01OFFCON" value="<%= userPO.getHeader12()%>" >
			              				</div>
			            			</td>
			            			<td nowrap  ><div align="center"><input type="text" size="2" maxlength="2" name="E01OFFBNK" value="<%= userPO.getHeader13()%>"></div></td>
			            			<td nowrap  >
			            				<div align="center"> 
			                				<input type="text" size="4" maxlength="4" name="E01OFFBRN" value="<%= userPO.getHeader14()%>" class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E01OFFBNK.value,'','','','')">
			              				</div>
			            			</td>
			            			<td nowrap   >
			            				<div align="center"> 
			                				<input type="text" size="3" maxlength="3" name="E01OFFCCY" value="<%= userPO.getHeader15()%>" class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E01OFFBNK.value,'','','','')">
			              				</div>
			            			</td>
			            			<td nowrap   > 
			              				<div align="center"> 
			                				<input type="text" size="16" maxlength="13" name="E01OFFACC" value="<%= userPO.getHeader16()%>" class="context-menu-help" onmousedown="init(accountHelp,this.name,document.forms[0].E01OFFBNK.value,'','','','RT')">
			               				</div>
			            			</td>
			          			</tr>
			        		</table>
			      		</td>
			    	</tr>
        		</table>
      		</td>
    	</tr>
  	</table>
  
  	<div align="center"><p><input id="EIBSBTN" type=submit name="Submit" value="Enviar"></p></div>

     
  
</form>
</body>
</html>
