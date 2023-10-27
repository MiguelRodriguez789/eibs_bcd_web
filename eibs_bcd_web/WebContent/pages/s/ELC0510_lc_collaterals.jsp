<html>
<head>
<title>Codigos Especiales</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "msgLC" class= "datapro.eibs.beans.ELC051011Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>


<script type="text/javascript">

	builtNewMenu(lc_maint);
	initMenu();
	
</script>
</head>
<body bgcolor="#FFFFFF">
<% if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }

	String flgrd = msgLC.getH11SCRCOD();
	if( flgrd==null ) flgrd = "";
	if(!flgrd.equals(""))
     	flgrd = "readonly";
%>

<h3 align="center">Garant&iacute;as<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="lc_documents.jsp,0510"></h3>
<hr size="4"> <form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0510">
 <input type=HIDDEN name="SCREEN" value="702"> 
 <input type=HIDDEN name="H11FLGWK3" value="<%= msgLC.getH11FLGWK3()%>"> 
 
  <table cellspacing="0" cellpadding="2" width="100%" border="1" bordercolor="#000000">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tbody><tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
                <input type="text" name="E11LCMCUN" size="9" maxlength="9" value="<%=msgLC.getE11LCMCUN().trim()%>">
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3"> 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" name="E11CUSNA1" size="45" maxlength="45" readonly value="<%=msgLC.getE11CUSNA1().trim()%>">
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
                <input type="text" name="E11LCMACC" size="12" maxlength="12" value="<%=msgLC.getE11LCMACC().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td><td nowrap width="16%"> 
              <div align="left"><b>
                <input type="text" name="E11LCMPRO" size="4" maxlength="4" readonly value="<%=msgLC.getE11LCMPRO().trim()%>">
                </b> </div>
            </td>
            
            <td nowrap width="16%" align="right"><b>Descripcion de Producto :</b></td><td nowrap width="16%" align="left">
                  <b>
                  <input type="text" name="E02DSCPRO" size="40" maxlength="35" value="<%=userPO.getHeader14()%>" readonly>
                  </b></td>
            
          </tr>
        </tbody></table>
      </td>
    </tr>
  </table>
  <br><br><br>
  <center> 
  <table cellpadding=2 cellspacing=0 width="600" border="1" bordercolor="#000000" bgcolor="#FFFFFF" >
    <tr bordercolor="#FFFFFF"> 
      <td nowrap > 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          	<tr id="trdark"> 
	            <th nowrap width="10%"> 
	            </th>
	            <th nowrap width="40%" align="center">Tipo de Garant&iacute;a
	            </th>
				<th nowrap width="10%" align="center">% 
	            </th>
				<th nowrap width="1%" align="center"></th>
				<th nowrap width="39%">Fecha de Vencimiento</th>
			</tr>
          <tr id="trclear"> 
            <td nowrap></td>
            <td nowrap align="right">Contragarant&iacute;a de corresponsal :</td>
            <td nowrap> 
              <input type="text" name="E11PCTGCC" size="13" maxlength="15" value="<%=msgLC.getBigDecimalE11PCTGCC() %>" <%= flgrd %>>              
            </td>
            <td nowrap></td>
            <TD nowrap width="20%" align="center">
          				<INPUT type="text" name="E11FEVEG1" size="2" maxlength="2" value='<%= (msgLC.getE11FEVEG1().trim().equals("0") ? "" : msgLC.getE11FEVEG1().trim()) %>' onKeyPress="enterInteger(event)">
          				<INPUT type="text" name="E11FEVEG2" size="2" maxlength="2" value='<%= (msgLC.getE11FEVEG2().trim().equals("0") ? "" : msgLC.getE11FEVEG2().trim()) %>' onKeyPress="enterInteger(event)">
          				<INPUT type="text" name="E11FEVEG3" size="2" maxlength="2" value='<%= (msgLC.getE11FEVEG3().trim().equals("0") ? "" : msgLC.getE11FEVEG3().trim()) %>' onKeyPress="enterInteger(event)">
          				<A href="javascript:DatePicker(document.forms[0].E11FEVEG1,document.forms[0].E11FEVEG2,document.forms[0].E11FEVEG3)">
          				<IMG src="<%=request.getContextPath()%>/images/calendar.gif" title="Ayuda" align="middle" border="0"></A>
        	</TD>            
			</tr>
          <tr id="trclear"> 
            <td nowrap></td>
            <td nowrap align="right">Dep&oacute;sito a Plazo :</td>
            <td nowrap> 
              <input type="text" name="E11PCTGDP" size="13" maxlength="15" value="<%=msgLC.getE11PCTGDP() %>" <%= flgrd %>>              
            </td>
            <td nowrap></td>
            <td nowrap width="20%" align="center">
				&nbsp;
        	</td>            
			</tr>
          <tr id="trclear"> 
            <td nowrap></td>
            <td nowrap align="right">Garant&iacute;a Fiduciaria :</td>
            <td nowrap> 
              <input type="text" name="E11PCTGGF" size="13" maxlength="15" value="<%=msgLC.getE11PCTGGF() %>" <%= flgrd %>>              
            </td>
            <td nowrap></td>
            <td nowrap width="20%" align="center">
				&nbsp;
        	</td>            
			</tr>						
          <tr id="trclear"> 
            <td nowrap></td>
            <td nowrap align="right">Garant&iacute;a Hipotecaria :</td>
            <td nowrap> 
              <input type="text" name="E11PCTGGH" size="13" maxlength="15" value="<%=msgLC.getE11PCTGGH() %>" <%= flgrd %>>              
            </td>
            <td nowrap></td>
            <td nowrap width="20%" align="center">
				&nbsp;
        	</td>            
			</tr>			
          <tr id="trclear"> 
            <td nowrap></td>
            <td nowrap align="right">Garant&iacute;a Prendaria :</td>
            <td nowrap> 
              <input type="text" name="E11PCTGGP" size="13" maxlength="15" value="<%=msgLC.getE11PCTGGH() %>" <%= flgrd %>>              
            </td>
            <td nowrap></td>
            <td nowrap width="20%" align="center">
				&nbsp;
        	</td>            
			</tr>			
        </table>
      </td>
    </tr>
  </table>
  </center>
  <p align="center"> 
    <input id="EIBSBTN" type="submit" name="Submit" value="Enviar">
  </p>
</form>
</body>
</html>

