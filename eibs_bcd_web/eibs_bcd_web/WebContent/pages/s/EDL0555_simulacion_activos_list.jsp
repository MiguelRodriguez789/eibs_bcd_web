<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EDL055504Message,datapro.eibs.beans.EDL055505Message"%>

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Simulacion de Negociacion</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="msgFootDet" class="datapro.eibs.beans.EDL055505Message"  scope="session" />
<jsp:useBean id="msgListDet" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

function goAction(op) {
  var ok = false;
  getElement("SCREEN").value = op;
  document.forms[0].submit();    
}

</SCRIPT>  

</head>

<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<h3 align="center">Simulacion de Negociacion
  <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="simulacion_activos_list.jsp,EDL0555">
</h3>
<hr size="4">
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0555">
<input type="hidden" id="SCREEN" name="SCREEN" value="102"> 
  <%int row = 0;%>
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="10%" align="right"> Propuesta : </td>
            <td nowrap width="30%"align="left">
              <input type="text" name="PorfNum" size="13" maxlength="12" value="<%= userPO.getPorfNum()%>" readonly>
            </td>
            <td nowrap width="20%" align="right"> Cliente : </td>
            <td nowrap width="40%" align="left">
              <input type="text" name="CusNum" size="13" maxlength="12" value="<%= userPO.getCusNum()%>" readonly>
              <input type="text" name="cusName" size="50" maxlength="50" value="<%= userPO.getCusName()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <h4>Situacion de Credito Hoy</h4>
  <table id="mainTable" class="tableinfo" style="height:120px;" width="100%">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
        <table id="headTable" width="100%">
          <tr id="trdark">
            <th align="CENTER" nowrap width="9%">Cuenta </th>
            <th align="CENTER" nowrap width="9%">Fecha<br>Calculo</th>
            <th align="CENTER" nowrap width="9%">Capital<br>Total </th>
            <th align="CENTER" nowrap width="9%">Capital<br>Vencido</th>
            <th align="CENTER" nowrap width="9%">Interes<br>Vigente</th>
            <th align="CENTER" nowrap width="9%">Interes<br>Contingente</th>
            <th align="CENTER" nowrap width="9%">Mora<br>Vigente</th>
            <th align="CENTER" nowrap width="9%">Mora<br>Contingente</th>
            <th align="CENTER" nowrap width="9%">Otros</th>
            <th align="CENTER" nowrap width="9%">Saldos<br>Vencidos</th>
            <th align="CENTER" nowrap width="9%">Total<br>Adeudado</th>
          </tr>
        </table>
      </td>
    </tr>    
    <tr  height="100%">    
      <td nowrap="nowrap">      
        <div id="dataDiv1" style="height:120px; overflow:auto; width:100%"> 
          <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
          <%
             msgListDet.initRow();
             int k = 0;
             int cus = 0;
             long ofn = 0;
             double sal = 0;
             while (msgListDet.getNextRow()) {                 
               EDL055504Message list = (EDL055504Message) msgListDet.getRecord();
               cus = list.getBigDecimalE04DLNCUN().intValue();
               ofn = list.getBigDecimalE04DLNOFN().intValue();
               sal = list.getBigDecimalE04DLNAM2().doubleValue() + 
                     list.getBigDecimalE04DLNAM3().doubleValue() + 
                     list.getBigDecimalE04DLNAM4().doubleValue() +
                     list.getBigDecimalE04DLNAM5().doubleValue() +
                     list.getBigDecimalE04DLNAM6().doubleValue() +
                     list.getBigDecimalE04DLNAMH().doubleValue(); 
          %>                  
            <tr>
              <TD NOWRAP width="9%" ALIGN="right"><%=list.getE04DLNACC()%></TD>
              <TD NOWRAP width="9%" ALIGN="right"><%=Util.formatCustomDate(currUser.getE01DTF(), list.getBigDecimalE04DLNSIM().intValue(),list.getBigDecimalE04DLNSID().intValue(),list.getBigDecimalE04DLNSIY().intValue()) %></TD>
              <TD NOWRAP width="9%" ALIGN="right"><%=list.getE04DLNAM1()%>&nbsp;</TD>
              <TD NOWRAP width="9%" ALIGN="right"><%=list.getE04DLNAM2()%>&nbsp;</TD>
              <TD NOWRAP width="9%" ALIGN="right"><%=list.getE04DLNAM3()%>&nbsp;</TD>
              <TD NOWRAP width="9%" ALIGN="right"><%=list.getE04DLNAM4()%>&nbsp;</TD>
              <TD NOWRAP width="9%" ALIGN="right"><%=list.getE04DLNAM5()%>&nbsp;</TD>
              <TD NOWRAP width="9%" ALIGN="right"><%=list.getE04DLNAM6()%>&nbsp;</TD>
              <TD NOWRAP width="9%" ALIGN="right"><%=list.getE04DLNAMH()%>&nbsp;</TD>
              <TD NOWRAP width="9%" ALIGN="right"><%=datapro.eibs.master.Util.formatCCY(sal)%>&nbsp;</TD>
              <TD NOWRAP width="9%" ALIGN="right"><%=list.getE04DLNAMJ()%>&nbsp;</TD>            
            </tr>
          <%   
               k++;   
             }
          %> 
          </table>
        </div>
      </td>
    </tr>
  </table>
  
  <!-- Negociacion -->
  <% session.setAttribute("EMPNG","S"); %>
  <input type="hidden" name="NGTOT" id="NGTOT" value="0">
  <iframe id="ifrempng" frameborder="0" scrolling="no" height="200" width="100%" src="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0555?SCREEN=401&updTotal=true&ACT=N&E04DLNCUN=<%=cus%>&E04DLNOFN=<%=ofn%>"></iframe>

  <h4>Informacion </h4>
  <table class="tableinfo" >
    <tr>
      <td>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
           <tr id="trdark">
            <th align="CENTER" nowrap width="10%"></th>
            <th align="CENTER" nowrap width="10%">Capital<br>Total </th>
            <th align="CENTER" nowrap width="10%">Capital<br>Vencido</th>
            <th align="CENTER" nowrap width="10%">Interes<br>Vigente</th>
            <th align="CENTER" nowrap width="10%">Interes<br>Contingente</th>
            <th align="CENTER" nowrap width="10%">Mora<br>Vigente</th>
            <th align="CENTER" nowrap width="10%">Mora<br>Contingente</th>
            <th align="CENTER" nowrap width="10%">Otros</th>
            <th align="CENTER" nowrap width="10%">Saldos<br>Totales</th>
          </tr>
          <tr id="trclear">
            <td width="10%"><div align="right">Endeudamiento :</div></td>
            <td width="10%"><input type="text" id="E05DLNAM1" name="E05DLNAM1" maxlength="15" size="16" value="0.00" readonly="readonly" class="txtright"></td>
            <td width="10%"><input type="text" id="E05DLNAM2" name="E05DLNAM2" maxlength="15" size="16" value="0.00" readonly="readonly" class="txtright"></td>
            <td width="10%"><input type="text" id="E05DLNAM3" name="E05DLNAM3" maxlength="15" size="16" value="0.00" readonly="readonly" class="txtright"></td>
            <td width="10%"><input type="text" id="E05DLNAM4" name="E05DLNAM4" maxlength="15" size="16" value="0.00" readonly="readonly" class="txtright"></td>
            <td width="10%"><input type="text" id="E05DLNAM5" name="E05DLNAM5" maxlength="15" size="16" value="0.00" readonly="readonly" class="txtright"></td>
            <td width="10%"><input type="text" id="E05DLNAM6" name="E05DLNAM6" maxlength="15" size="16" value="0.00" readonly="readonly" class="txtright"></td>
            <td width="10%"><input type="text" id="E05DLNAMH" name="E05DLNAMH" maxlength="15" size="16" value="0.00" readonly="readonly" class="txtright"></td>
            <td width="10%"><input type="text" id="E05DLNAMJ" name="E05DLNAMJ" maxlength="15" size="16" value="0.00" readonly="readonly" class="txtright"></td>
          </tr>
           <tr id="trclear">
            <td width="10%"><div align="right">Valores Descuento :</div></td>
            <td width="10%"><input type="text" id="E05DLNCD1" name="E05DLNCD1" maxlength="15" size="16" value="0.00" readonly="readonly" class="txtright"></td>
            <td width="10%"><input type="text" id="E05DLNCD2" name="E05DLNCD2" maxlength="15" size="16" value="0.00" readonly="readonly" class="txtright"></td>
            <td width="10%"><input type="text" id="E05DLNCD3" name="E05DLNCD3" maxlength="15" size="16" value="0.00" readonly="readonly" class="txtright"></td>
            <td width="10%"><input type="text" id="E05DLNCD4" name="E05DLNCD4" maxlength="15" size="16" value="0.00" readonly="readonly" class="txtright"></td>
            <td width="10%"><input type="text" id="E05DLNCD5" name="E05DLNCD5" maxlength="15" size="16" value="0.00" readonly="readonly" class="txtright"></td>
            <td width="10%"><input type="text" id="E05DLNCD6" name="E05DLNCD6" maxlength="15" size="16" value="0.00" readonly="readonly" class="txtright"></td>
            <td width="10%"><input type="text" id="E05DLNCDH" name="E05DLNCDH" maxlength="15" size="16" value="0.00" readonly="readonly" class="txtright"></td>
            <td width="10%"><input type="text" id="E05DLNCDJ" name="E05DLNCDJ" maxlength="15" size="16" value="0.00" readonly="readonly" class="txtright"></td>
          </tr>
           <tr id="trdark">
            <td width="10%"><div align="right">Valor a Pagar Cliente :</div></td>
            <td width="10%"><input type="text" id="E05DLNTO1" name="E05DLNTO1" maxlength="15" size="16" value="0.00" readonly="readonly" class="txtright"></td>
            <td width="10%"><input type="text" id="E05DLNTO2" name="E05DLNTO2" maxlength="15" size="16" value="0.00" readonly="readonly" class="txtright"></td>
            <td width="10%"><input type="text" id="E05DLNTO3" name="E05DLNTO3" maxlength="15" size="16" value="0.00" readonly="readonly" class="txtright"></td>
            <td width="10%"><input type="text" id="E05DLNTO4" name="E05DLNTO4" maxlength="15" size="16" value="0.00" readonly="readonly" class="txtright"></td>
            <td width="10%"><input type="text" id="E05DLNTO5" name="E05DLNTO5" maxlength="15" size="16" value="0.00" readonly="readonly" class="txtright"></td>
            <td width="10%"><input type="text" id="E05DLNTO6" name="E05DLNTO6" maxlength="15" size="16" value="0.00" readonly="readonly" class="txtright"></td>
            <td width="10%"><input type="text" id="E05DLNTOH" name="E05DLNTOH" maxlength="15" size="16" value="0.00" readonly="readonly" class="txtright"></td>
            <td width="10%"><input type="text" id="E05DLNTOJ" name="E05DLNTOJ" maxlength="15" size="16" value="0.00" readonly="readonly" class="txtright"></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <table class="tbenter" >
    <tr > 
      <td width="10%"> 
        <div align="center"> 
          <p> <input class="EIBSBTN" type="button" name="Submit" value="Enviar" onclick="submitPage(this)"> </p>
        </div>
      </td>
    </tr>
  </table>
  
	
</form>


</body>
</html>

