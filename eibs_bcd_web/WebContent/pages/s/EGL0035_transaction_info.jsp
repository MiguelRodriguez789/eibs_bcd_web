<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Transacciones</title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<%
	String m = request.getParameter("CurrRow") == null ? "" : request.getParameter("CurrRow");
 %>

<SCRIPT type="text/javascript" >
	
	function enterInfo() {
		var row = -1;
		try {
			row = parseInt("<%=m%>");
		} catch (e) {
			// TODO: handle exception
		}
 		var form = top.opener.document.forms[0];
 		if ( row >= 0 ) {
	 		form["E01WRKEXR_"+ row].value = trim(document.forms[0].E01WRKEXR.value);
	 		form["E01WRKCUN_"+ row].value = trim(document.forms[0].E01WRKCUN.value);
	 		form["E01WRKMD1_"+ row].value = trim(document.forms[0].E01WRKMD1.value);
	 		form["E01WRKMD2_"+ row].value = trim(document.forms[0].E01WRKMD2.value);
	 		form["E01WRKMD3_"+ row].value = trim(document.forms[0].E01WRKMD3.value);
	 		form["E01WRKCKN_"+ row].value = trim(document.forms[0].E01WRKCKN.value);
	 		form["E01WRKTDS_"+ row].value = trim(document.forms[0].E01WRKTDS.value);
	 		try {
	 			form["E01WRKDS9_"+ row].value = trim(document.forms[0].E01WRKDS9.value);
	 		} catch (Exception) {
	 		}
	 		form["E01WRKVD1_"+ row].value = trim(document.forms[0].E01WRKVD1.value);
	 		form["E01WRKVD2_"+ row].value = trim(document.forms[0].E01WRKVD2.value);
	 		form["E01WRKVD3_"+ row].value = trim(document.forms[0].E01WRKVD3.value);
	 		form["E01WRKIVP_"+ row].value = trim(document.forms[0].E01WRKIVP.value);
	 		form["E01WRKIVB_"+ row].value = trim(document.forms[0].E01WRKIVB.value);
	 		form["E01WRKCDT_"+ row].value = trim(document.forms[0].E01WRKCDT.value);
	 		form["E01WRKRCL_"+ row].value = trim(document.forms[0].E01WRKRCL.value);

  		} else {
	 		form["E01WRKTDS"].value = trim(document.forms[0].E01WRKTDS.value);
	 		form["E01WRKVD1"].value = trim(document.forms[0].E01WRKVD1.value);
	 		form["E01WRKVD2"].value = trim(document.forms[0].E01WRKVD2.value);
	 		form["E01WRKVD3"].value = trim(document.forms[0].E01WRKVD3.value);
  		}
 
		top.close();
 	}

	function setInfo() {
		var row = -1;
		try {
			row = parseInt("<%=m%>");
		} catch (e) {
			// TODO: handle exception
		}
 		var form = top.opener.document.forms[0];
 		if (  row >= 0  ) {
			document.forms[0].E01WRKEXR.value=form["E01WRKEXR_"+ row].value;
			document.forms[0].E01WRKCUN.value=form["E01WRKCUN_"+ row].value;
			document.forms[0].E01WRKMD1.value=form["E01WRKMD1_"+ row].value;
			document.forms[0].E01WRKMD2.value=form["E01WRKMD2_"+ row].value;
			document.forms[0].E01WRKMD3.value=form["E01WRKMD3_"+ row].value;
			document.forms[0].E01WRKCKN.value=form["E01WRKCKN_"+ row].value;
	 		document.forms[0].E01WRKTDS.value=form["E01WRKTDS_"+ row].value;
	 		document.forms[0].E01WRKVD1.value=form["E01WRKVD1_"+ row].value;
	 		document.forms[0].E01WRKVD2.value=form["E01WRKVD2_"+ row].value;
	 		document.forms[0].E01WRKVD3.value=form["E01WRKVD3_"+ row].value;
	 		try {
	 			document.forms[0].E01WRKDS9.value=form["E01WRKDS9_"+ row].value;
	 		} catch (Exception) {
	 		}
	 		document.forms[0].E01WRKIVP.value=form["E01WRKIVP_"+ row].value;
	 		document.forms[0].E01WRKIVB.value=form["E01WRKIVB_"+ row].value;
	 		document.forms[0].E01WRKCDT.value=form["E01WRKCDT_"+ row].value;
	 		document.forms[0].E01WRKRCL.value=form["E01WRKRCL_"+ row].value;

  		} else {
	 		document.forms[0].E01WRKTDS.value=form["E01WRKTDS"].value;
	 		document.forms[0].E01WRKVD1.value=form["E01WRKVD1"].value;
	 		document.forms[0].E01WRKVD2.value=form["E01WRKVD2"].value;
	 		document.forms[0].E01WRKVD3.value=form["E01WRKVD3"].value;
	 		try {
	 			document.forms[0].E01WRKDS9.value=form["E01WRKDS9"].value;
	 		} catch (Exception) {
	 		}	
  		}
	 }
  
	function checkLength(field) {
   		if ( field.value.length < 300 ) {
     		field.value = field.value.toUpperCase();
     		return true;
		} else {
     		return false;
		}
	}
	
 </SCRIPT>
 
</head>
<body>
<form method="post">

  <h3 align="left">Información</h3>

  <table width="100%" class="tableinfo" cellpadding="2" cellspacing="2">
    <tr> 
      <td id=trdark width="25%" nowrap valign="top"> 
        <div align="right">Descripción : </div>
      </td>
      <td width="75%" nowrap > 
        <textarea name="E01WRKTDS" cols="35" rows="10" id="PHYSICAL" <% if (!(userPO.getPurpose().equals("MAINTENANCE") || userPO.getPurpose().equals("NEW"))){ out.print("readonly");}%>></textarea>
      </td>
    </tr>
        <% if (null != userPO.getType() && userPO.getType().equals("FACT")) { %>
    <tr> 
      <td id=trdark width="25%" nowrap > 
        <div align="right">UUID : </div>
      </td>
      <td width="75%" nowrap> 
        <input type="text" name="E01WRKDS9" size="55" maxlength="55" value="" readonly>
      </td>
    </tr>
    <% } %>
    <tr> 
      <td id=trdark width="25%" nowrap > 
        <div align="right">Fecha Valor : </div>
      </td>
      <td width="75%" nowrap> 
        <input type="text" name="E01WRKVD1" size="3" maxlength="2" onKeypress="enterInteger(event)" value="" <% if (!(userPO.getPurpose().equals("MAINTENANCE") || userPO.getPurpose().equals("NEW") )){ out.print("readonly");}%>>
        <input type="text" name="E01WRKVD2" size="3" maxlength="2" onKeypress="enterInteger(event)" value="" <% if (!(userPO.getPurpose().equals("MAINTENANCE") || userPO.getPurpose().equals("NEW") )){ out.print("readonly");}%>>
        <input type="text" name="E01WRKVD3" size="5" maxlength="4" onKeypress="enterInteger(event)" value="" <% if (!(userPO.getPurpose().equals("MAINTENANCE") || userPO.getPurpose().equals("NEW") )){ out.print("readonly");}%>>
      </td>
    </tr>
	<% 
     if (!(m.equals(""))){
    %>
	<tr> 
      <td id=trdark width="25%" nowrap > 
        <div align="right">Tasa de Cambio : </div>
      </td>
      <td width="75%" nowrap> 
        <input type="text" name="E01WRKEXR" size="13" maxlength="12" onKeypress="enterRate(event)" value="" <% if (!(userPO.getPurpose().equals("MAINTENANCE") || userPO.getPurpose().equals("NEW") )){ out.print("readonly");}%>>
      </td>
    </tr>
	<tr> 
      <td id=trdark width="25%" nowrap > 
        <div align="right">Número de Cliente : </div>
      </td>
      <td width="75%" nowrap> 
        <input type="text" name="E01WRKCUN" size="10" maxlength="9" onKeypress="enterInteger(event)" value="" <% if (!(userPO.getPurpose().equals("MAINTENANCE") || userPO.getPurpose().equals("NEW") )){ out.print("readonly");}%>>
        <% if (userPO.getPurpose().equals("MAINTENANCE") || userPO.getPurpose().equals("NEW")){%>
			<a href="javascript:GetCustomerDescId('E01WRKCUN','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0" ></a> 
        <% } %>
	  </td>
    </tr>

    <tr> 
      <td id=trdark width="25%" nowrap > 
        <div align="right">Fecha Vencimiento : </div>
      </td>
      <td width="75%" nowrap> 
        <input type="text" name="E01WRKMD1" size="3" maxlength="2" onKeypress="enterInteger(event)" value="" <% if (!(userPO.getPurpose().equals("MAINTENANCE") || userPO.getPurpose().equals("NEW") )){ out.print("readonly");}%>>
        <input type="text" name="E01WRKMD2" size="3" maxlength="2" onKeypress="enterInteger(event)" value="" <% if (!(userPO.getPurpose().equals("MAINTENANCE") || userPO.getPurpose().equals("NEW") )){ out.print("readonly");}%>>
        <input type="text" name="E01WRKMD3" size="5" maxlength="4" onKeypress="enterInteger(event)" value="" <% if (!(userPO.getPurpose().equals("MAINTENANCE") || userPO.getPurpose().equals("NEW") )){ out.print("readonly");}%>>
      </td>
    </tr>

    <tr> 
      <td id=trdark width="25%" nowrap > 
        <div align="right">N&uacute;mero de Cheque : </div>
      </td>
      <td width="75%" nowrap> 
        <input type="text" name="E01WRKCKN" size="12" maxlength="11" onKeypress="enterInteger(event)" value="" <% if (!(userPO.getPurpose().equals("MAINTENANCE") || userPO.getPurpose().equals("NEW") )){ out.print("readonly");}%>>
      </td>
    </tr>
    <tr> 
      <td id=trdark width="14%" nowrap > 
        <div align="right">Cheques Locales :</div>
      </td>
      <td nowrap> 
        <input type="text" name="E01WRKCR2" size="17" maxlength="15" onKeyPress="enterSignDecimal(event)" value="" <% if (!(userPO.getPurpose().equals("MAINTENANCE") || userPO.getPurpose().equals("NEW") )){ out.print("readonly");}%>>
        Dias :
        <input type="text" name="E01WRKUN2" size="3" maxlength="2" onKeyPress="enterInteger(event)" value="" <% if (!(userPO.getPurpose().equals("MAINTENANCE") || userPO.getPurpose().equals("NEW") )){ out.print("readonly");}%>>
      </td>
    </tr>
    <tr> 
      <td id=trdark width="14%" nowrap > 
        <div align="right">Cheques No Locales :</div>
      </td>
      <td nowrap>
        <input type="text" name="E01WRKCR3" size="17" maxlength="15" onKeyPress="enterSignDecimal(event)" value="" <% if (!(userPO.getPurpose().equals("MAINTENANCE") || userPO.getPurpose().equals("NEW") )){ out.print("readonly");}%>>
        Dias : 
        <input type="text" name="E01WRKUN3" size="3" maxlength="2" onKeyPress="enterInteger(event)" value="" <% if (!(userPO.getPurpose().equals("MAINTENANCE") || userPO.getPurpose().equals("NEW") )){ out.print("readonly");}%>>
      </td>
    </tr>
    <tr> 
      <td id=trdark width="14%" nowrap > 
        <div align="right">% De Impuesto :</div>
      </td>
      <td nowrap>
        <input type="text" name="E01WRKIVP" size="17" maxlength="7" onKeyPress="enterSignDecimal(event, 3)" placeholder="0.000" style="text-align:right;" value="" <% if (!(userPO.getPurpose().equals("MAINTENANCE") || userPO.getPurpose().equals("NEW") )){ out.print("readonly");}%>>
      </td>
    </tr>
    <tr> 
      <td id=trdark width="14%" nowrap > 
        <div align="right">Base de Impuesto :</div>
      </td>
      <td nowrap>
        <input type="text" name="E01WRKIVB" size="17" maxlength="16" onKeyPress="enterSignDecimal(event, 2)" placeholder="0.00" style="text-align:right;" value="" <% if (!(userPO.getPurpose().equals("MAINTENANCE") || userPO.getPurpose().equals("NEW") )){ out.print("readonly");}%>>
      </td>
    </tr>
    <tr> 
      <td id=trdark width="14%" nowrap > 
        <div align="right">Código de Impuesto :</div>
      </td>
      <td nowrap>
        <input type="text" name="E01WRKCDT" size="6" maxlength="4" style="text-align:right;" value="" readonly>
        	<a href="javascript:GetTaxCode2('E01WRKCDT','','')" >
            <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
      </td>
    </tr>
   <tr> 
    	<td id=trdark width="14%" nowrap > 
          <div align="right">Referencia :</div>
      	</td>
      	<td nowrap>
         	<input type="text" name="E01WRKRCL" size="25" maxlength="20" style="text-align:right;" value="" onKeypress="enterInteger(event)" value="" <% if (!(userPO.getPurpose().equals("MAINTENANCE") || userPO.getPurpose().equals("NEW") )){ out.print("readonly");}%>>	   	
      	</td>
    </tr>     
        
    <%  if (currUser.getE01INT().trim().equals("11")) {%>
    <tr> 
      <td id=trdark width="25%" nowrap > 
        <div align="right">Comentario/Origen : </div>
      </td>
      <td width="75%" nowrap> 
        <input type="text" name="E01WRKREM" size="26" maxlength="25" value="" <% if (!(userPO.getPurpose().equals("MAINTENANCE") || userPO.getPurpose().equals("NEW") )){ out.print("readonly");}%>>
      </td>
    </tr>
    <% }%> 
    
  <%  } %>
  </table> 
  <BR>
  <SCRIPT>
    setInfo();
  </SCRIPT>
  <%
   if (userPO.getPurpose().equals("MAINTENANCE") || userPO.getPurpose().equals("NEW")){
   %>
  
  <div align="center"> 
    <p><input id="EIBSBTN" type=button name="Submit" OnClick="enterInfo()" value="Enviar"></p>
  </div>

  <SCRIPT>
   document.forms[0].E01WRKTDS.focus();
  </SCRIPT>
 <% }  %> 
</form>
</body>
</html>			
