<html>
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id="concept" class="datapro.eibs.beans.EGL034801Message"  scope="session" />

<script type="text/javascript">
function enter(){
	  document.forms[0].submit();
	 }
</script>

</head>
<body>

 
 <% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
    }
%>
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEGL0348" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
  <h3 align="center">Cuentas de Contrapartida<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="concepts_enter.jsp,EGL0348"> 
  </h3>
  <hr size="4">
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <table id="tbenter" align="center" style="width:85%" border="1">
    <tr> 
      <td> 
        <table id="tbenter" width="100%" border="0" cellspacing="1" cellpadding="0">
          <tr> 
            <td width="20%" nowrap>&nbsp;</td>
            <td width="25%" nowrap> 
              <div align="right">Banco :</div>
            </td>
            <td width="55%" nowrap> 
              <input type="text" name="E01GLHB01" size="3" maxlength="2"  >
            </td>
          </tr>
          <tr>
            <td width="20%" nowrap>&nbsp;</td>
            <td width="25%" nowrap>
              <div align="right">C&oacute;digo de Aplicaci&oacute;n :</div>
            </td>
            <td width="55%" nowrap>
              <input type="text" name="E01GLHA01" size="3" maxlength="2"  >
              <a href="javascript:GetApplicationCode('E01GLHA01')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0">
              </a> 
            </td>
          </tr>
		  <tr>
            <td width="20%" nowrap>&nbsp;</td>
            <td width="25%" nowrap>
              <div align="right">Modo de Utilizaci&oacute;n :</div>
            </td>
		  	<td width="55%" nowrap>
				<select name="E01GLHM01">
          		<OPTION value="  " <% if(concept.getE01GLHM01().equals(" ")) out.print("selected");%>>Generico</OPTION>
          		<OPTION value="01" <% if(concept.getE01GLHM01().equals("01")) out.print("selected");%>>Apertura</OPTION>
          		<OPTION value="02" <% if(concept.getE01GLHM01().equals("02")) out.print("selected");%>>Pagos</OPTION>
          		<OPTION value="04" <% if(concept.getE01GLHM01().equals("04")) out.print("selected");%>>Reestructuraciones/Renovaciones</OPTION>
          		<OPTION value="05" <% if(concept.getE01GLHM01().equals("05")) out.print("selected");%>>Transacciones</OPTION>
          		<OPTION value="06" <% if(concept.getE01GLHM01().equals("06")) out.print("selected");%>>Cancelaciones</OPTION>
          		<OPTION value="CO" <% if(concept.getE01GLHM01().equals("CO")) out.print("selected");%>>Convenios</OPTION>
          		<OPTION value="PM" <% if(concept.getE01GLHM01().equals("PM")) out.print("selected");%>>Pagos Masivos</OPTION>
          		<OPTION value="PL" <% if(concept.getE01GLHM01().equals("PL")) out.print("selected");%>>Pagos Planillas</OPTION>
          		<OPTION value="RN" <% if(concept.getE01GLHM01().equals("RN")) out.print("selected");%>>Reliquidaciones</OPTION>
          		<OPTION value="CU" <% if(concept.getE01GLHM01().equals("CU")) out.print("selected");%>>Cupo Rotativo</OPTION>
  	  			</select>		  	
		  	</td>
		  </tr>

        </table>
      </td>
    </tr>
  </table>
  <p align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </p>
        <p>&nbsp;</p>
  <p><BR>
  </p>
  <p align="center">&nbsp; </p>
      
</form>
</body>
</html>
