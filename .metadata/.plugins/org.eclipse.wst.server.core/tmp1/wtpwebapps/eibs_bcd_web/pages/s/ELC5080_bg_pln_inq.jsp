<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="datapro.eibs.master.Util,datapro.eibs.beans.ELC508003Message" %>
<%@page import="com.datapro.constants.EibsFields" %>

<html>
<head>
<title>Detalle de la Cuota</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="header" class= "datapro.eibs.beans.ELC508003Message" scope="session" />
<jsp:useBean id="list" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class= "datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">
</SCRIPT>  

</head>

<body>

<h3 align="center">Detalle de la Cuota <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="bg_pln_inq.jsp, ELC5080"></h3>
<hr size="4">
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.bolgaran.JSELC5080">
<input type="hidden" id="SCREEN" name="SCREEN" value="0"> 
<input type="hidden" id="TYPE" name="TYPE" value=""> 

<%
  int row = 1;
  int index = Integer.parseInt(request.getParameter("Row").trim());
  ELC508003Message datarec = (ELC508003Message) list.get(index);
  
  String dccpfl = ""; 
  if (datarec.getE03DCCPFL().equals(""))  dccpfl = "PENDIENTE";
  if (datarec.getE03DCCPFL().equals("P")) dccpfl = "PAGADA";
  if (datarec.getE03DCCPFL().equals("A")) dccpfl = "ANULADA";

  String dccpvi = ""; 
  if (datarec.getE03DCCPVI().equals("1")) dccpvi = "APERTURA";
  if (datarec.getE03DCCPVI().equals("2")) dccpvi = "PLAN DE PAGOS";

%>

  <table class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"><div align="right">Cuota :</div></td>
            <td nowrap width="25%"><%=datarec.getE03DCCSEQ()%></td>
            <td nowrap width="25%"><div align="right">Estado :</div></td>
            <td nowrap width="25%"><%=dccpfl%></td>
          </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"><div align="right">Codigo Comision : </div></td>
            <td nowrap width="25%"><%=datarec.getE03DCCCDE()%></td>
            <td nowrap width="25%"><div align="right">Descripcion :</div></td>
            <td nowrap width="25%"><%=datarec.getE03DCCNAR()%></td>
          </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"><div align="right">Forma de Pago :</div></td>
            <td nowrap width="25%"><%=dccpvi%></td>
            <td nowrap width="25%"><div align="right">Dias Vencidos :</div></td>
            <td nowrap width="25%"><%=datarec.getE03DCCDVE()%></td>
          </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"><div align="right">Monto a Pagar :</div></td>
            <td nowrap width="25%"><%=datarec.getE03DCCCAM()%></td>
            <td nowrap width="25%"><div align="right">Monto Pagado :</div></td>
            <td nowrap width="25%"><%=datarec.getE03DCCCPG()%></td>
          </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"><div align="right">IVA a Pagar : </div></td>
            <td nowrap width="25%"><%=datarec.getE03DCCIAM()%></td>
            <td nowrap width="25%"><div align="right">IVA Pagado : </div></td>
            <td nowrap width="25%"><%=datarec.getE03DCCIPG()%></td>
          </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"><div align="right">Fecha a Pagar : </div></td>
            <td nowrap width="25%"><%= Util.formatCustomDate(currUser.getE01DTF(),
                                         datarec.getBigDecimalE03DCCPDM().intValue(),
                                         datarec.getBigDecimalE03DCCPDD().intValue(),
                                         datarec.getBigDecimalE03DCCPDY().intValue()) %>
            </td>
            <td nowrap width="25%"><div align="right">Fecha de Pago : </div></td>
            <td nowrap width="25%"><%= Util.formatCustomDate(currUser.getE01DTF(),
                                         datarec.getBigDecimalE03DCCPGM().intValue(),
                                         datarec.getBigDecimalE03DCCPGD().intValue(),
                                         datarec.getBigDecimalE03DCCPGY().intValue()) %>
            </td>
          </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"><div align="right">Metodo Cobro Comision :</div></td>
            <td nowrap width="25%"><% if(datarec.getE03DDCMTH().equals("F")){%>Fijo
                                   <% }else if(datarec.getE03DDCMTH().equals("P")){%>Porcentaje
                                   <% }else if(datarec.getE03DDCMTH().equals("1")){%>Tasa/Periodo
                                   <% }else if(datarec.getE03DDCMTH().equals("E")){%>Escala/Tramos
                                   <% } %>                                    
            </td> 
            <td nowrap width="25%"><div align="right">Valor / % Comision :</div></td>
            <td nowrap width="25%"><%=datarec.getE03DDCCOA() %></td>
          </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"><div align="right">Escola Tramo :</div></td>
            <td nowrap width="25%"><%=datarec.getE03DDCCHN() %></td>
            <td nowrap width="25%"><div align="right">Cuenta Contable Comision :</div></td>
            <td nowrap width="25%">
            	<%if(!datarec.getE03DCCOGL().equals("") && !datarec.getE03DCCOGL().equals("0") && datarec.getE03DCCOGL() != null){ %>
            <%=datarec.getE03DCCOBK() %>-<%=datarec.getE03DCCOBR() %>-<%=datarec.getE03DCCOCY() %>-<%=datarec.getE03DCCOGL() %>
            <% } %></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

</form>

<script type="text/javascript">
  
</SCRIPT>

</body>
</html>

