<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Cartera Sustitutiva</title>
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id= "EDL0548Logs" class= "datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="list" class="datapro.eibs.beans.EDL054802Message" scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

</head>

<%
   int row = Integer.parseInt(request.getParameter("Row"));
   EDL0548Logs.setCurrentRow(row);
  
   list = (datapro.eibs.beans.EDL054802Message) EDL0548Logs.getRecord();
 %> 

<body>

<h3 align="center">Consulta de Situacion Reserva por Solicitante<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_reserva_inq.jsp,EDL0548"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0548" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="200">
  <INPUT TYPE=HIDDEN NAME="H01FLGMAS" >
  
  <H4>Informacion Basica</H4>
  <table  class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="20%"><div align="right">Proyecto :&nbsp;</div></td>
            <td nowrap width="30%"> 
              <input type="text" name="E02CTLNUM" size="12" maxlength="13" value="<%= list.getE02CTLNUM() %>" readonly>
              <input type="text" name="E02CTPDSC" size="50" maxlength="50" value="<%= list.getE02CTPDSC() %>" readonly>
            </td>
            <td nowrap width="20%"><div align="right"></div></td>
            <td nowrap width="30%">
            </td>
          </tr>
           <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="20%"><div align="right">Reserva :&nbsp;</div></td>
            <td nowrap width="30%">
              <input type="text" name="E02CTLSEQ" size="12" maxlength="13" value="<%= list.getE02CTLSEQ() %>" readonly>
              <input type="text" name="E02CTlNA1" size="50" maxlength="50" value="<%= list.getE02CTLNA1() %>" readonly>
            </td>
            <td nowrap width="20%"><div align="right"></div></td>
            <td nowrap width="30%">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <h4>Situaci&oacute;n Actual </h4>
  <table class="tableinfo" >
    <tr>
      <td>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="25%"><div align="right">Monto Reservado :</div></td>
            <td width="25%">
              <input type="text" name="E02CTLRSV" size="17" maxlength="15" value="<%= list.getE02CTLRSV() %>" readonly>&nbsp; 
            </td>
            <td width="25%"><div align="right"></div></td>
            <td width="25%">&nbsp;
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="25%"><div align="right">Estado :</div></td>
            <td width="25%">
             <div align="left"> 
	              	 <SELECT name="E02CTLCAU" disabled > 
						<OPTION value="0001" <%if (list.getE02CTLCAU().equals("0001")) { out.print("selected"); }%>>Aprobado</OPTION>
						<OPTION value="0002" <%if (list.getE02CTLCAU().equals("0002")) { out.print("selected"); }%>>Negado</OPTION>
						<OPTION value="0003" <%if (list.getE02CTLCAU().equals("0003")) { out.print("selected"); }%>>Cancelado </OPTION>
			       </SELECT>
	               </div>
            </td>
            <td width="25%"><div align="right"></div></td>
            <td width="25%">
			</td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="25%"><div align="right">Fecha Cambio de Estado :</div></td>
            <td width="25%">
             <eibsinput:date name="clMant" fn_year="E02CTLUCY" fn_month="E02CTLUCM" fn_day="E02CTLUCD" readonly="true" />
			<div align="left">
	         </div>
            </td>
            <td width="25%"><div align="right"></div></td>
            <td width="25%">
			</td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="25%"><div align="right">Observaciones :</div></td>
            <td width="25%">
              <input type="text" name="E02CTLOBS" size="40" maxlength="40" value="<%= list.getE02CTLOBS() %>" readonly>&nbsp; 
            </td>
            <td width="25%"><div align="right"></div></td>
            <td width="25%">&nbsp;
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="25%"><div align="right">Valor Aprobado :</div></td>
            <td width="25%">
              <input type="text" name="E02CTLAPV" size="17" maxlength="15" value="<%= list.getE02CTLAPV() %>" readonly>&nbsp; 
            </td>
            <td width="25%"><div align="right"></div></td>
            <td width="25%">&nbsp;
            </td>
          </tr>
         
         
        </table>
      </td>
    </tr>
  </table>

 
</form>

<script type="text/javascript">
</script>

</body>
</html>
