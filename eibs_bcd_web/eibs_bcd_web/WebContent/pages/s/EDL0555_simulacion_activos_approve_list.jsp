<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EDL055504Message"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EDL055505Message"%>

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Simulacion de Negociacion</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="msgFoot" class="datapro.eibs.beans.EDL055505Message"  scope="session" />
<jsp:useBean id="msgList" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="msgList1" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

function goAction(op,row) {
   getElement("ROW").value = row;
   getElement("SCREEN").value = op;
   document.forms[0].submit();    
  
 }
 
 function SendFlujo(op,row) {
		getElement("ROW").value = row;
		var params = "&ROW=" + getElement("ROW").value;
		var pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0555?SCREEN=1010" + params;
		CenterWindow(pg, 800, 500, 2);
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
  <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="simulacion_activos_approve_list.jsp,EDL0555">
</h3>
<hr size="4">
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0555">
<input type="hidden" id="SCREEN" name="SCREEN" value="1000"> 
<input type="hidden" id="ROW" name="ROW" value=""> 

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
            <th align="CENTER" nowrap width="9%">Total<br>Vencido</th>
            <th align="CENTER" nowrap width="9%">Total<br>Endeudado</th>
          </tr>
        </table>
      </td>
    </tr>    
    <tr  height="100%">    
      <td nowrap="nowrap">      
        <div id="dataDiv1" style="height:120px; overflow:auto; width:100%"> 
          <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
          <%
             msgList.initRow();
             int k = 0;
             int cus = 0;
             long ofn = 0;
             while (msgList.getNextRow()) {                 
               EDL055504Message list = (EDL055504Message) msgList.getRecord();
               cus = list.getBigDecimalE04DLNCUN().intValue();
               ofn = list.getBigDecimalE04DLNOFN().intValue();
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
              <TD NOWRAP width="9%" ALIGN="right"><%=list.getE04DLNAMI()%>&nbsp;</TD>
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
  
  <h4>Situacion de Credito Simulado</h4>
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
            <th align="CENTER" nowrap width="9%">Total<br>Vencido</th>
            <th align="CENTER" nowrap width="9%">Total<br>Endeudado</th>
          </tr>
        </table>
      </td>
    </tr>    
    <tr  height="100%">    
      <td nowrap="nowrap">      
        <div id="dataDiv1" style="height:120px; overflow:auto; width:100%"> 
          <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
          <%
             msgList1.initRow();
             int kx = 0;
             int cusx = 0;
             long ofnx = 0;
             boolean firstTime = true;
             
             while (msgList1.getNextRow()) {  
             	 if (firstTime) {
                 firstTime = false;
                
               } else {
                
               }               
               EDL055504Message list = (EDL055504Message) msgList1.getRecord();
               cusx = list.getBigDecimalE04DLNCUN().intValue();
               ofnx = list.getBigDecimalE04DLNOFN().intValue();
          %>   
                 
            <tr id="dataTable<%= msgList.getCurrentRow() %>">
              <TD NOWRAP width="9%" ALIGN="right"><a href="javascript:SendFlujo('1010',<%=msgList1.getCurrentRow()%>);"><%=list.getE04DLNACC()%></a></TD>
              <TD NOWRAP width="9%" ALIGN="right"><%=Util.formatCustomDate(currUser.getE01DTF(), list.getBigDecimalE04DLNSIM().intValue(),list.getBigDecimalE04DLNSID().intValue(),list.getBigDecimalE04DLNSIY().intValue()) %></TD>
              <TD NOWRAP width="9%" ALIGN="right"><%=list.getE04DLNAM1()%>&nbsp;</TD>
              <TD NOWRAP width="9%" ALIGN="right"><%=list.getE04DLNAM2()%>&nbsp;</TD>
              <TD NOWRAP width="9%" ALIGN="right"><%=list.getE04DLNAM3()%>&nbsp;</TD>
              <TD NOWRAP width="9%" ALIGN="right"><%=list.getE04DLNAM4()%>&nbsp;</TD>
              <TD NOWRAP width="9%" ALIGN="right"><%=list.getE04DLNAM5()%>&nbsp;</TD>
              <TD NOWRAP width="9%" ALIGN="right"><%=list.getE04DLNAM6()%>&nbsp;</TD>
              <TD NOWRAP width="9%" ALIGN="right"><%=list.getE04DLNAMH()%>&nbsp;</TD>
              <TD NOWRAP width="9%" ALIGN="right"><%=list.getE04DLNAMI()%>&nbsp;</TD>
              <TD NOWRAP width="9%" ALIGN="right"><%=list.getE04DLNAMJ()%>&nbsp;</TD>            
            </tr>
          <%   
               kx++;   
             }
          %> 
          </table>
        </div>
      </td>
    </tr>
  </table>
  
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
            <th align="CENTER" nowrap width="10%">Total<br>Vencido</th>
            <th align="CENTER" nowrap width="10%">Total<br>Endeudado</th>
          </tr>
          <tr id="trclear">
            <td width="10%"><div align="right">Endeudamiento :</div></td>
            <td width="10%"><input type="text" id="E05DLNAM1" name="E05DLNAM1" maxlength="15" size="16" value="<%=msgFoot.getE05DLNAM1()%>" readonly="readonly" class="txtright"></td>
            <td width="10%"><input type="text" id="E05DLNAM2" name="E05DLNAM2" maxlength="15" size="16" value="<%=msgFoot.getE05DLNAM2()%>" readonly="readonly" class="txtright"></td>
            <td width="10%"><input type="text" id="E05DLNAM3" name="E05DLNAM3" maxlength="15" size="16" value="<%=msgFoot.getE05DLNAM3()%>" readonly="readonly" class="txtright"></td>
            <td width="10%"><input type="text" id="E05DLNAM4" name="E05DLNAM4" maxlength="15" size="16" value="<%=msgFoot.getE05DLNAM4()%>" readonly="readonly" class="txtright"></td>
            <td width="10%"><input type="text" id="E05DLNAM5" name="E05DLNAM5" maxlength="15" size="16" value="<%=msgFoot.getE05DLNAM5()%>" readonly="readonly" class="txtright"></td>
            <td width="10%"><input type="text" id="E05DLNAM6" name="E05DLNAM6" maxlength="15" size="16" value="<%=msgFoot.getE05DLNAM6()%>" readonly="readonly" class="txtright"></td>
            <td width="10%"><input type="text" id="E05DLNAMH" name="E05DLNAMH" maxlength="15" size="16" value="<%=msgFoot.getE05DLNAMH()%>" readonly="readonly" class="txtright"></td>
            <td width="10%"><input type="text" id="E05DLNAMI" name="E05DLNAMI" maxlength="15" size="16" value="<%=msgFoot.getE05DLNAMI()%>" readonly="readonly" class="txtright"></td>
            <td width="10%"><input type="text" id="E05DLNAMJ" name="E05DLNAMJ" maxlength="15" size="16" value="<%=msgFoot.getE05DLNAMJ()%>" readonly="readonly" class="txtright"></td>
          </tr>
           <tr id="trclear">
            <td width="10%"><div align="right">Valores Descuento :</div></td>
            <td width="10%"><input type="text" id="E05DLNCD1" name="E05DLNCD1" maxlength="15" size="16" value="<%=msgFoot.getE05DLNCD1()%>" readonly="readonly" class="txtright"></td>
            <td width="10%"><input type="text" id="E05DLNCD2" name="E05DLNCD2" maxlength="15" size="16" value="<%=msgFoot.getE05DLNCD2()%>" readonly="readonly" class="txtright"></td>
            <td width="10%"><input type="text" id="E05DLNCD3" name="E05DLNCD3" maxlength="15" size="16" value="<%=msgFoot.getE05DLNCD3()%>" readonly="readonly" class="txtright"></td>
            <td width="10%"><input type="text" id="E05DLNCD4" name="E05DLNCD4" maxlength="15" size="16" value="<%=msgFoot.getE05DLNCD4()%>" readonly="readonly" class="txtright"></td>
            <td width="10%"><input type="text" id="E05DLNCD5" name="E05DLNCD5" maxlength="15" size="16" value="<%=msgFoot.getE05DLNCD5()%>" readonly="readonly" class="txtright"></td>
            <td width="10%"><input type="text" id="E05DLNCD6" name="E05DLNCD6" maxlength="15" size="16" value="<%=msgFoot.getE05DLNCD6()%>" readonly="readonly" class="txtright"></td>
            <td width="10%"><input type="text" id="E05DLNCDH" name="E05DLNCDH" maxlength="15" size="16" value="<%=msgFoot.getE05DLNCDH()%>" readonly="readonly" class="txtright"></td>
            <td width="10%"><input type="text" id="E05DLNCDI" name="E05DLNCDI" maxlength="15" size="16" value="<%=msgFoot.getE05DLNCDI()%>" readonly="readonly" class="txtright"></td>
            <td width="10%"><input type="text" id="E05DLNCDJ" name="E05DLNCDJ" maxlength="15" size="16" value="<%=msgFoot.getE05DLNCDJ()%>" readonly="readonly" class="txtright"></td>
          </tr>
           <tr id="trdark">
            <td width="10%"><div align="right">Valor a Pagar Cliente :</div></td>
            <td width="10%"><input type="text" id="E05DLNTO1" name="E05DLNTO1" maxlength="15" size="16" value="<%=msgFoot.getE05DLNTO1()%>" readonly="readonly" class="txtright"></td>
            <td width="10%"><input type="text" id="E05DLNTO2" name="E05DLNTO2" maxlength="15" size="16" value="<%=msgFoot.getE05DLNTO2()%>" readonly="readonly" class="txtright"></td>
            <td width="10%"><input type="text" id="E05DLNTO3" name="E05DLNTO3" maxlength="15" size="16" value="<%=msgFoot.getE05DLNTO3()%>" readonly="readonly" class="txtright"></td>
            <td width="10%"><input type="text" id="E05DLNTO4" name="E05DLNTO4" maxlength="15" size="16" value="<%=msgFoot.getE05DLNTO4()%>" readonly="readonly" class="txtright"></td>
            <td width="10%"><input type="text" id="E05DLNTO5" name="E05DLNTO5" maxlength="15" size="16" value="<%=msgFoot.getE05DLNTO5()%>" readonly="readonly" class="txtright"></td>
            <td width="10%"><input type="text" id="E05DLNTO6" name="E05DLNTO6" maxlength="15" size="16" value="<%=msgFoot.getE05DLNTO6()%>" readonly="readonly" class="txtright"></td>
            <td width="10%"><input type="text" id="E05DLNTOH" name="E05DLNTOH" maxlength="15" size="16" value="<%=msgFoot.getE05DLNTOH()%>" readonly="readonly" class="txtright"></td>
            <td width="10%"><input type="text" id="E05DLNTOI" name="E05DLNTOI" maxlength="15" size="16" value="<%=msgFoot.getE05DLNTOI()%>" readonly="readonly" class="txtright"></td>
            <td width="10%"><input type="text" id="E05DLNTOJ" name="E05DLNTOJ" maxlength="15" size="16" value="<%=msgFoot.getE05DLNTOJ()%>" readonly="readonly" class="txtright"></td>
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

