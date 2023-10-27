<%@ page import="datapro.eibs.master.*" %>
<%@ page import="datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="datapro.eibs.sockets.DecimalField" %>

<HTML>
<HEAD> 
<TITLE>Payment Schedule Maintenance</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="header" class="datapro.eibs.beans.EPV015501Message" scope="session"/>
<jsp:useBean id="listOld" class="datapro.eibs.beans.JBObjList" scope="session"/>
<jsp:useBean id="list" class="datapro.eibs.beans.JBListRec" scope="session"/>
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

function showDetailPay(rowNum) {
  document.forms[0].Row.value = rowNum;
  document.forms[0].submit();
}

function hideMenu() {
	if (isValidObject(document.getElementById("menuPP"))) {
		if (document.getElementById("menuPP").style.display == 'none') {
			document.getElementById("menuPP").style.display = '';
			resizeIFrame(true);
		} else {
			document.getElementById("menuPP").style.display = 'none';
			resizeIFrame(false);
		}
	}
}

function resizeIFrame(lMenu) {
	var nHeight = 0;	
	var nMenu = 60;
	if (isValidObject(parent.document.getElementById("ifremppp"))) {
		nHeight = parseInt(document.getElementById("IFRHEIGHT").value);
	}
	if (nHeight > 0) {
		nHeight = lMenu ? nHeight + nMenu : nHeight;
		parent.document.getElementById("ifremppp").height = nHeight;
	}	
}

function showPayMaint(acc) {
  var page = '${pageContext.request.contextPath}/s/EPV0155_ln_pay_pln_det.jsp';
  page = '${pageContext.request.contextPath}/servlet/datapro.eibs.salesplatform.JSEPV0155?SCREEN=200&E01DEAACC=' + acc;		
  CenterWindow(page, 1200, 800, 2);
  hideMenu();	
}

</SCRIPT>

</HEAD>

<BODY>

<% 
  String emp = (String) session.getAttribute("EMPPP");
  emp = (emp == null) ? "" : emp;
  
  if (!error.getERRNUM().equals("0")) {
    error.setERRNUM("0");
    out.println("<SCRIPT Language=\"Javascript\">");
    out.println("       showErrors()");
    out.println("</SCRIPT>");
  }
%>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV0155">
  <input TYPE=HIDDEN name="SCREEN" value="200">
  <input type="hidden" name="IFRHEIGHT" id="IFRHEIGHT" value="">
  <% int row = 0; %>
  <% if (emp.equals("")) { %>
  <h3 align="center">Cuadro Manual - Plan de Pagos
    <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_pay_pln.jsp, EPV0155"> 
  </h3>
  <hr size="4">
  <h4></h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="14%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="9%" > 
              <div align="left"> 
                <input type="text" name="E01DEACUN" size="10" maxlength="9" readonly value="<%= header.getE01DEACUN().trim()%>">
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01CUSNA1" size="46" maxlength="45" readonly value="<%= header.getE01CUSNA1().trim()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap ><b> 
              <input type="text" name="E01DEAPRO" size="5" maxlength="4" readonly value="<%= header.getE01DEAPRO().trim() %>">
              </b></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="14%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"> 
                <input type="text" name="E01DEAACC" size="13" maxlength="12" value="<%= header.getE01DEAACC().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="33%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY" size="4" maxlength="3" value="<%= header.getE01DEACCY().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="11%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="21%"> 
              <div align="left"><b> 
                
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <% } %>
  
  <% if (emp.equals("")) { %>
  <h4>&nbsp;</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="30%" > 
              <div align="right" >Fecha Apertura :</div>
            </td>
            <td nowrap width="20%"  > 
              <div align="left"><%= Util.formatCustomDate(currUser.getE01DTF(),header.getBigDecimalE01DEAODM().intValue(),header.getBigDecimalE01DEAODD().intValue(),header.getBigDecimalE01DEAODY().intValue()) %></div>
            </td>
            <td nowrap width="30%" > 
              <div align="right">Tasa de Interés :</div>
            </td>
            <td nowrap width="20%"  > 
              <div align="left"><%= Util.formatCell(header.getE01DEARTE()) %></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%" > 
              <div align="right">Fecha Vencimiento :</div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"><%= Util.formatCustomDate(currUser.getE01DTF(),header.getBigDecimalE01DEAMAM().intValue(),header.getBigDecimalE01DEAMAD().intValue(),header.getBigDecimalE01DEAMAY().intValue()) %></div>
            </td>
            <td nowrap width="30%" > 
              <div align="right">Periodo Base :</div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"><%= Util.formatCell(header.getE01DEABAS()) %></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%" > 
              <div align="right">Monto Original  :</div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"><%= Util.formatCCY(header.getE01DEAOAM()) %></div>
            </td>
            <td nowrap width="30%" > 
              <div align="right">Tipo de Interés :</div>
            </td>
            <td nowrap width="20%" > 
              <div align="left">
	            <% if (header.getE01DEAICT().trim().equals("S")) out.print("LINEAL/CALENDARIO/AL VENC.");
					else if (header.getE01DEAICT().trim().equals("M")) out.print("LINEAL/COMRECIAL/AL VENC.");
					else if (header.getE01DEAICT().trim().equals("P")) out.print("LINEAL/CALENDARIO/PREPAGADO");
					else if (header.getE01DEAICT().trim().equals("A")) out.print("LINEAL/COMRECIAL/PREPAGADO");
					else if (header.getE01DEAICT().trim().equals("D")) out.print("LINEAL/CALENDARIO/DESCONTADO");
					else if (header.getE01DEAICT().trim().equals("R")) out.print("LINEAL/COMRECIAL/PREPAGADO");
					else if (header.getE01DEAICT().trim().equals("1")) out.print("EXPON/CALENDARIO/AL VENC.");
					else if (header.getE01DEAICT().trim().equals("2")) out.print("EXPON/COMRECIAL/AL VENC.");
					else if (header.getE01DEAICT().trim().equals("3")) out.print("EXPON/CALENDARIO/PREPAGADO");
					else if (header.getE01DEAICT().trim().equals("4")) out.print("EXPON/COMRECIAL/PREPAGADO");
					else if (header.getE01DEAICT().trim().equals("5")) out.print("EXPON/CALENDARIO/DESCONTADO");
					else if (header.getE01DEAICT().trim().equals("6")) out.print("EXPON/COMRECIAL/PREPAGADO");
					else out.print("");%>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%" > 
              <div align="right">C&aacute;lculo Inter&eacute;s Normal :</div>
            </td>
            <td nowrap width="20%"  > 
              <div align="left">
	            <% if (header.getE01DEAICT().trim().equals("1")) out.print("CAPITAL VIGENTE");
							else if (header.getE01DEAICT().trim().equals("2")) out.print("CAPITAL ORIGINAL");
							else if (header.getE01DEAICT().trim().equals("3")) out.print("CAPITAL VIGENTE - VENCIDO");
							else if (header.getE01DEAICT().trim().equals("N")) out.print("NO CALCULA INTERES");
							else out.print("");%>
			  </div>
            </td>
            <td nowrap width="30%" > 
              <div align="right">C&aacute;lculo Inter&eacute;s Mora :</div>
            </td>
            <td nowrap width="20%" > 
              <div align="left">
	              <% if (header.getE01DEAPCL().trim().equals("1")) out.print("CAPITAL VENCIDO");
						else if (header.getE01DEAPCL().trim().equals("2")) out.print("CAPITAL ORIGINAL");
						else if (header.getE01DEAPCL().trim().equals("3")) out.print("CAPITAL VIGENTE");
						else if (header.getE01DEAPCL().trim().equals("4")) out.print("CAPITAL + INTERES VENCIDO");
						else if (header.getE01DEAPCL().trim().equals("5")) out.print("CAPITAL + INTERES + SEGURO VENCIDO");
						else if (header.getE01DEAPCL().trim().equals("6")) out.print("CAPITAL + SEGURO VENCIDO");
						else if (header.getE01DEAPCL().trim().equals("N")) out.print("NO CALCULA INTERES");
						else out.print("");%>
			 </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br> 
  <% } %>
  

<%if ("".equals(emp)){ %>
  <h5>Plan de Pagos 
    <a href="javascript:showPayMaint(document.forms[0].E01DEAACC.value)">
      <img src="<%=request.getContextPath()%>/images/eibs_deducciones.gif" title="Plan de Pagos" align="middle" border="0" >
    </a>
  </h5>
<%}else if("A".equals(emp)){%>
	<h4>Plan de Pagos</h4>

<%}else{%>
  <input TYPE=HIDDEN name="E01DEAACC" value="<%= header.getE01DEAACC().trim()%>">
  <a href="javascript:showPayMaint(document.forms[0].E01DEAACC.value)" ><b>Plan de Pagos </b></a>
  <br><br>
<%}%>  

 <table  id="mainTable" class="tableinfo" style="height:89px;" width="100%">
   <tr  height="5%"> 
     <td NOWRAP valign="top" width="100%"> 
	<table id="headTable" width="100%">
		<tr id="trdark">
			<th align="center" nowrap width="15%">CUOTA</th>
			<th align="center" nowrap width="15%">FECHA</th>						
			<th align="center" nowrap width="15%">VALOR</th>
			<th align="center" nowrap width="15%">DISTRIBUCION</th>
			<th align="center" nowrap width="15%">PRINCIPAL</th>			
			<th align="center" nowrap width="15%">INTERESES</th>
			<th align="center" nowrap width="15%">SALDO</th>
		</tr>
       </table>
     </td> 
   </tr>    
   <tr height="95%">    
	    <td nowrap="nowrap">      
	       <div id="dataDiv1" style="height:89px; overflow:auto;"> 
	       <table id="dataTable" class="tableinfoList" style="border: 0" cellspacing="0" cellpadding="1" border="0" width="100%">         
                <%
            	double suma = 0;  double sumCapital = 0;  double sumInt = 0;double valor = 0;	  
                  list.initRow();
                  while (list.getNextRow()) {
                	  
                    if (list.getFlag().equals("")) {
                        try {
                            valor = Double.parseDouble(list.getRecord(4));
                          } catch (NumberFormatException e1) {
                            try {
                              valor = DecimalField.parseDouble(list.getRecord(4));
                            } catch (NumberFormatException e2) {
                              valor = 0;
                            }
                          }
                          suma = suma + valor;
                          
                          try {
                              valor = Double.parseDouble(list.getRecord(6));
                            } catch (NumberFormatException e1) {
                              try {
                                valor = DecimalField.parseDouble(list.getRecord(6));
                              } catch (NumberFormatException e2) {
                                valor = 0;
                              }
                            }

                          sumCapital += valor;
                          
                          try {
                              valor = Double.parseDouble(list.getRecord(7));
                            } catch (NumberFormatException e1) {
                              try {
                                valor = DecimalField.parseDouble(list.getRecord(7));
                              } catch (NumberFormatException e2) {
                                valor = 0;
                              }
                            }

                          sumInt += valor;                    	
                    	
                    	
	              %> 
			<tr id="dataTable<%= list.getCurrentRow() %>">
				<td nowrap align="center" width="15%"><%= list.getRecord(0) %></td>
				<td nowrap align="center" width="15%"><%= Util.formatCustomDate(currUser.getE01DTF(), Integer.parseInt(list.getRecord(1)), Integer.parseInt(list.getRecord(2)),Integer.parseInt(list.getRecord(3))) %></td>
				<td nowrap align="right"  width="15%"><%= list.getRecord(4) %></td>	
				<td nowrap align="center" width="15%">
                   <% 
                      if(list.getRecord(5).equals("F")) out.print("Cuota Fija");
					  else if(list.getRecord(5).equals("Y")) out.print("Capital + Inter&eacute;s");
					  else if(list.getRecord(5).equals("N")) out.print("Capital Solamente");
					  else if(list.getRecord(5).equals("I")) out.print("Inter&eacute;s Solamente");
                   
				      else out.print("PAGADO"); 
                   %>
				</td>
				<td nowrap align="right"  width="15%"><%= list.getRecord(6) %></td>
				<td nowrap align="right"  width="15%"><%= list.getRecord(7) %></td>
				<td nowrap align="right"  width="15%"><%= list.getRecord(8) %></td>
			</tr>
                <%
                    }
                  }
                %> 
           </table>
         </div>
       </td>
     </tr>
</table>
  <table id="RESUMEN" class="tbenter" >
    <tr>
      <td width="15%">&nbsp;</td>						
      <td align="right" nowrap width="15%"><b>TOTAL : </b></td>
      <td align="right" nowrap width="15%"><b><%=datapro.eibs.master.Util.formatCCY(suma)%></b></td>
      <td width="15%">&nbsp;</td>
      <td width="15%" align="right"><b><%=datapro.eibs.master.Util.formatCCY(sumCapital)%></b></td>
      <td width="15%" align="right"><b><%=datapro.eibs.master.Util.formatCCY(sumInt)%></b></td>
      <td width="15%">&nbsp;</td>
    </tr>		
  </table>    


</FORM>
<SCRIPT type="text/javascript">
  if (isValidObject(document.getElementById("menuPP"))) {
	  if (!(document.getElementById("menuPP") == null)) {
	    document.getElementById("menuPP").style.display = 'none';
	  }
  }
	if (isValidObject(parent.document.getElementById("ifremppp"))) {
		document.getElementById("IFRHEIGHT").value = parent.document.getElementById("ifremppp").height;
	}	
</SCRIPT>
</BODY>
</HTML>
