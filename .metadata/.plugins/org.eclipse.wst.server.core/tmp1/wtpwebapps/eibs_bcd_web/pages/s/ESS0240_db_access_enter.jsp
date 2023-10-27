<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" 	class= "datapro.eibs.beans.ELEERRMessage"  		scope="session"/>
<jsp:useBean id= "msgDB" 	class= "datapro.eibs.beans.ESS024001Message"  	scope="session" />

<% 
if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
%>
<SCRIPT type="text/javascript">
        showErrors();
</SCRIPT>
<%}%>

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

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESS0240" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="100">
  <h3 align="center">Acceso a Base de Datos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="db_access_enter.jsp, ESS0240"> 
  </h3>
  <hr size="4">
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <table id="tbenter" align="center" style="width:85%" border="1">
    <tr> 
      <td> 
        <table id="tbenter" width="100%" border="0" cellspacing="1" cellpadding="0">
          <tr align="center"> 
            <td width="25%" nowrap align="right"> 
				<input type="radio" name="E01FLGFLE" value="1" <%if (msgDB.getE01FLGFLE().equals("1")) {%>checked<%}%>>
            </td>
            <td width="75%" nowrap> 
				<div align="left">&nbsp;Clientes</div>
            </td>
          </tr>
          <tr align="center"> 
            <td nowrap align="right"> 
				<input type="radio" name="E01FLGFLE" value="2" <%if (msgDB.getE01FLGFLE().equals("2")) {%>checked<%}%>>
            </td>
            <td nowrap> 
				<div align="left">&nbsp;Cuentas de Detalles</div>
            </td>
          </tr>
          <tr align="center"> 
            <td nowrap align="right"> 
				<input type="radio" name="E01FLGFLE" value="3" <%if (msgDB.getE01FLGFLE().equals("3")) {%>checked<%}%>>
            </td>
            <td nowrap> 
				<div align="left">&nbsp;Certificados de D�positos</div>
            </td>
          </tr>
          <tr align="center"> 
            <td nowrap align="right"> 
				<input type="radio" name="E01FLGFLE" value="4" <%if (msgDB.getE01FLGFLE().equals("4")) {%>checked<%}%>>
            </td>
            <td nowrap> 
				<div align="left">&nbsp;Pr�stamos</div>
            </td>
          </tr>
          <tr align="center"> 
            <td nowrap align="right"> 
				<input type="radio" name="E01FLGFLE" value="5" <%if (msgDB.getE01FLGFLE().equals("5")) {%>checked<%}%>>
            </td>
            <td nowrap> 
				<div align="left">&nbsp;Inversiones</div>
            </td>
          </tr>
          <tr align="center"> 
            <td nowrap align="right"> 
				<input type="radio" name="E01FLGFLE" value="0" <%if (msgDB.getE01FLGFLE().equals("0")) {%>checked<%}%>>
            </td>
            <td nowrap> 
				<div align="left">&nbsp;Suspensi�n de Pagos</div>
            </td>
          </tr>
          
          <tr align="center"> 
            <td nowrap align="right"> 
				<input type="radio" name="E01FLGFLE" value="6" <%if (msgDB.getE01FLGFLE().equals("6")) {%>checked<%}%>>
            </td>
            <td nowrap> 
				<div align="left">&nbsp;Cartas de Cr�dito</div>
            </td>
          </tr>
          <tr align="center"> 
            <td nowrap align="right"> 
				<input type="radio" name="E01FLGFLE" value="7" <%if (msgDB.getE01FLGFLE().equals("7")) {%>checked<%}%>>
            </td>
            <td nowrap> 
				<div align="left">&nbsp;Otros (Beneficiarios, Firmantes, Direcciones de Env�o, etc.)</div>
            </td>
          </tr>  
        </table>
      </td>
    </tr>
  </table>
  <br>
  <table id="tbenter" align="center" style="width:85%" border="1">
    <tr> 
      <td> 
        <table id="tbenter" width="100%" border="0" cellspacing="1" cellpadding="0">
          <tr align="center"> 
            <td width="25%" nowrap align="right"> 
				<input type="radio" name="E01FLGPRO" value="1" <%if (msgDB.getE01FLGPRO().equals("1")) {%>checked<%}%>>
            </td>
            <td width="75%" nowrap> 
				<div align="left">&nbsp;Nuevo</div>
            </td>
          </tr>
          <tr align="center"> 
            <td nowrap align="right"> 
				<input type="radio" name="E01FLGPRO" value="2" <%if (msgDB.getE01FLGPRO().equals("2")) {%>checked<%}%>>
            </td>
            <td nowrap> 
				<div align="left">&nbsp;Mantenimiento</div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <table id="tbenter" align="center" style="width:85%" border="1">
    <tr> 
      <td> 
        <table id="tbenter" width="100%" border="0" cellspacing="1" cellpadding="0">
          <tr align="center"> 
            <td width="25%" nowrap> 
				<div align="right">Fecha Desde : </div>
            </td>
            <td width="75%" nowrap align="left"> 
			    <eibsinput:date name="msgDB" fn_month="E01FRDTE1" fn_day="E01FRDTE2" fn_year="E01FRDTE3" />
              &nbsp; Hasta : &nbsp; 
			    <eibsinput:date name="msgDB" fn_month="E01TODTE1" fn_day="E01TODTE2" fn_year="E01TODTE3" />
            </td>
          </tr>
          <tr align="center"> 
            <td width="25%" nowrap> 
				<div align="right">Usuario : </div>
            </td>
            <td width="75%" nowrap align="left"> 
              <input type="text" name="E01SELUSR" size="12" maxlength="10" value="<%= msgDB.getE01SELUSR()%>">
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
