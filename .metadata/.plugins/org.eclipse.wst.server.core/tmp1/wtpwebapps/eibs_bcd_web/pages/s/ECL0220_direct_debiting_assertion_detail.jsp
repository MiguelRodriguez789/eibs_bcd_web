<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Confirmación de Domiciliaciones</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import = "datapro.eibs.master.Util" %>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "msgDetail" class= "datapro.eibs.beans.ECL022001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

</head>
<body >
<h3 align="center">Confirmación de Domiciliaciones<BR>Detalle
<IMG src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="direct_debiting_assertion_detail.jsp, ECL0220"></h3>
<hr size="4">
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0"); 
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
%> 
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.misc.JSECL0220" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">

  <h4>Información Básica</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <TABLE cellspacing="0" cellpadding="2" width="100%" border="0">
          <TBODY>
          <TR id="trdark"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Referencia :</DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01CLIIND" size="10" maxlength="9" readonly value="<%= msgDetail.getE01CLIIND() %>">
			  </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Código de Transacción :</DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01CLITRA" size="4" maxlength="3" readonly value="<%= msgDetail.getE01CLITRA() %>">
              </DIV>
            </TD>
          </TR>
         <TR id="trclear"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Código Interno :</DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="left">
                 <INPUT type="text" name="E01CLIINT" size="21" maxlength="20" readonly value="<%= msgDetail.getE01CLIINT() %>">
              </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Número del Contrato :</DIV>
            </TD>
            <TD nowrap width="20%"> 
                 <INPUT type="text" name="E01CLICON" size="31" maxlength="30" readonly value="<%= msgDetail.getE01CLICON() %>">
            </TD>
          </TR>  
         <TR id="trdark"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Fecha de Origen :</DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01CLIDIO" size="3" maxlength="2" readonly value="<%= msgDetail.getE01CLIDIO() %>">
                <INPUT type="text" name="E01CLIMEO" size="3" maxlength="2" readonly value="<%= msgDetail.getE01CLIMEO() %>">
                <INPUT type="text" name="E01CLIANO" size="5" maxlength="4" readonly value="<%= msgDetail.getE01CLIANO() %>">
              </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Fecha de Vencimiento :</DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="left">
                <INPUT type="text" name="E01CLIDIV" size="3" maxlength="2" readonly value="<%= msgDetail.getE01CLIDIV() %>">
                <INPUT type="text" name="E01CLIMEV" size="3" maxlength="2" readonly value="<%= msgDetail.getE01CLIMEV() %>">
                <INPUT type="text" name="E01CLIANV" size="5" maxlength="4" readonly value="<%= msgDetail.getE01CLIANV() %>">
              </DIV>
            </TD>
          </TR>  
			</TBODY>
			</TABLE>
      </td>
    </tr>
  </table>
  
  <h4>Información de la Compañía</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <TABLE cellspacing="0" cellpadding="2" width="100%" border="0">
          <TBODY>
          <TR id="trdark"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Código :</DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left">                 
				  <INPUT type="text" name="E01CLICIA" size="5" maxlength="4" readonly value="<%= msgDetail.getE01CLICIA() %>">
              </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">RIF :</DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left">
	              <INPUT type="text" name="E01CLIRIF" size="13" maxlength="12" readonly value="<%= msgDetail.getE01CLIRIF() %>">
              </DIV>
            </TD>
          </TR>
         <TR id="trclear"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Nombre :</DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01CLIRIN" size="36" maxlength="35" readonly value="<%= msgDetail.getE01CLIRIN() %>">
              </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Dirección :</DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01CLIDIR" size="46" maxlength="45" readonly value="<%= msgDetail.getE01CLIDIR() %>">
              </DIV>
            </TD>
          </TR>
          <TR id="trdark"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Ciudad :</DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left">                 
				  <INPUT type="text" name="E01CLICIU" size="26" maxlength="25" readonly value="<%= msgDetail.getE01CLICIU() %>">
              </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Municipio :</DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left">
	              <INPUT type="text" name="E01CLIMUN" size="36" maxlength="35" readonly value="<%= msgDetail.getE01CLIMUN() %>">
              </DIV>
            </TD>
          </TR>
         <TR id="trclear"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Teléfono 1 :</DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01CLITE1" size="12" maxlength="11" readonly value="<%= msgDetail.getE01CLITE1() %>">
              </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Teléfono 2 :</DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01CLITE2" size="12" maxlength="11" readonly value="<%= msgDetail.getE01CLITE2() %>">
              </DIV>
            </TD>
          </TR>
         <TR id="trdark"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Teléfono 3 :</DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01CLITE3" size="12" maxlength="11" readonly value="<%= msgDetail.getE01CLITE3() %>">
              </DIV>
            </TD>
            <TD nowrap width="16%"> 
            </TD>
            <TD nowrap width="16%"> 
            </TD>
          </TR>
			</TBODY>
			</TABLE>
      </td>
    </tr>
  </table>
  
  <h4>Información del Pagador y el Ordenante</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <TABLE cellspacing="0" cellpadding="2" width="100%" border="0">
          <TBODY>
         <TR id="trdark"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Identificación del Pagador :</DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left"> 
                <INPUT type="text" name="E01CLIIDE" size="13" maxlength="12" readonly value="<%= msgDetail.getE01CLIIDE() %>">
              </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Cuenta del Pagador :</DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="left">
                 <INPUT type="text" name="E01CLICTA" size="21" maxlength="20" readonly value="<%= msgDetail.getE01CLICTA() %>">
              </DIV>
            </TD>
          </TR>  
          <TR id="trclear"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Nombre del Pagador :</DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left">
				  <INPUT type="text" name="E01CLINOM" size="36" maxlength="35" readonly value="<%= msgDetail.getE01CLINOM() %>">
              </DIV>
            </TD>
            <TD nowrap width="16%"> 
              <DIV align="right">Cuenta del Ordenante :</DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left">
				  <INPUT type="text" name="E01CLIORD" size="21" maxlength="20" readonly value="<%= msgDetail.getE01CLIORD() %>">
              </DIV>
            </TD>
          </TR>
          <TR id="trdark"> 
            <TD nowrap width="16%"> 
              <DIV align="right">Tipo de Pagador :</DIV>
            </TD>
            <TD nowrap width="20%"> 
              <DIV align="left">                 
				  <INPUT type="text" name="E01CLITIP" size="2" maxlength="1" readonly value="<%= msgDetail.getE01CLITIP() %>">
              </DIV>
            </TD>
            <TD nowrap width="16%"> 
            </TD>
            <TD nowrap width="20%"> 
            </TD>
          </TR>
			</TBODY>
			</TABLE>
      </td>
    </tr>
    
  </table>
  <h4>Operación</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <TABLE cellspacing="0" cellpadding="2" width="100%" border="0">
          <TR id="trdark"> 
            <TD nowrap width="50%"> 
              <DIV align="right">Respuesta :</DIV>
            </TD>
            <TD nowrap width="50%"> 
              <DIV align="left">                 
				<SELECT name="E01CLIRES">
						<OPTION value="" <% if (!(msgDetail.getE01CLIRES().equals("C") || msgDetail.getE01CLIRES().equals("N") || msgDetail.getE01CLIRES().equals("P"))) { out.print("checked"); } %>></OPTION>
						<OPTION value="C" <% if (msgDetail.getE01CLIRES().equals("C")) { out.print("checked"); } %>>Confirmar</OPTION>
						<OPTION value="N" <% if (msgDetail.getE01CLIRES().equals("N")) { out.print("checked"); } %>>Negar</OPTION>
						<OPTION value="P" <% if (msgDetail.getE01CLIRES().equals("P")) { out.print("checked"); } %>>Postergar</OPTION>
				</SELECT>
              </DIV>
            </TD>
          </TR>
          <TR id="trclear"> 
            <TD nowrap width="50%"> 
              <DIV align="right">Comentarios :</DIV>
            </TD>
            <TD nowrap width="50%"> 
              <DIV align="left">                 
				  <INPUT type="text" name="E01CLICO1" size="31" maxlength="30" value="<%= msgDetail.getE01CLICO1() %>"><br>
				  <INPUT type="text" name="E01CLICO2" size="31" maxlength="30" value="<%= msgDetail.getE01CLICO2() %>"><br>
				  <INPUT type="text" name="E01CLICO3" size="31" maxlength="30" value="<%= msgDetail.getE01CLICO3() %>">
              </DIV>
            </TD>
          </TR>
			</TABLE>
      </td>
    </tr>
  </table>
  <br>
  <div align="center"> 
	   <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>
  
  </form>
</body>
</html>
