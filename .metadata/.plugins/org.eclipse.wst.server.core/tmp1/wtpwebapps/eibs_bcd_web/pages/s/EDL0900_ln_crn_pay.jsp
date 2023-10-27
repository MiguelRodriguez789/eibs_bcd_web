<%@ page import = "datapro.eibs.master.Util" %>
<HTML>
<HEAD>
<TITLE>Cronograma de Plan de Pagos</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="header" class="datapro.eibs.beans.EDL090001Message"  scope="session" />
<jsp:useBean id= "list" class= "datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id= "listUF" class= "datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

<%if (!userPO.getOption().equals("PROP")){%>
	<%if (userPO.getPurpose().equals("MAINTENANCE")){%>
   		<%if (userPO.getOption().equals("PV")){%>
   			builtNewMenu(pv_m_opt);
 		<% } else { %>
 			builtNewMenu(ln_m_opt);
 		<% } %>	
	<% } else if ( userPO.getHeader23().equals("G") ||  userPO.getHeader23().equals("V")){ %>
		builtNewMenu(ln_i_1_opt);
	<% } else  if (!userPO.getPurpose().equals("QUOTATION")) { %>
		<% if (!userPO.getPurpose().equals("SIM")) {%>
			builtNewMenu(ln_i_2_opt);
		<% } %>
	<% } %>
<% } %>

function goAction(op) {

     document.forms[0].opt.value = op;
     var formLength= document.forms[0].elements.length;
     var ok = false;
     for(n=0;n<formLength;n++)
     {
      	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "ACCNUM") 
      	{
        		ok = true;
        		break;
      	}
      }
	 if ( ok || (op == 3) ) {
          document.forms[0].submit();
     }
     else {
			alert("Seleccione una cuenta antes de realizar esta operación");	   
     }

  }
</SCRIPT>
</HEAD>

<BODY>

<SCRIPT>
<%if (!userPO.getOption().equals("PROP")){%>
	initMenu(); 
<%   
}
%>
</SCRIPT>

<form>
  <input TYPE=HIDDEN name="SCREEN" value="500">
  <INPUT TYPE=HIDDEN NAME="opt" VALUE="1">


  
  <h3 align="center">Cronograma de Plan de Pagos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_crn_pay.jsp,EDL0900"> 
  </h3>
  <hr size="4">

  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <%if(!userPO.getCusNum().equals("0")){ %>
          <tr id="trdark"> 
            <td nowrap width="14%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="9%" > 
              <div align="left"> 
              		<input type="text" name="E02CUN2" size="10" maxlength="9" readonly value="<%= userPO.getCusNum().trim()%>">
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap > 
              <div align="left"> 
              		<input type="text" name="E02NA12" size="45" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap ><b> 
              		<input type="text" name="E02PRO2" size="5" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>">
              </b></td>
          </tr>
          <% }%>
          <tr id="trdark"> 
            <td nowrap width="14%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"> 
              		<input type="text" name="E02ACC" size="13" maxlength="12" readonly value="<%= userPO.getAccNum().trim()%>">
              </div>
            </td>
            <td nowrap width="12%"></td>
            <td nowrap width="33%"></td>
            <td nowrap width="11%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="21%"> 
              <div align="left"><b> 
               	<input type="text" name="E01DEACCY" size="4" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
              </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>&nbsp;</h4>
  
  <%int row = 0; %>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%" > 
              <div align="right">Monto Original :</div>
            </td>
            <td nowrap width="30%"  > 
              <div align="left"><%= userPO.getHeader12().trim()%></div>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Fecha de Apertura :</div>
            </td>
            <td nowrap width="30%"  > 
              <div align="left"><%= userPO.getHeader10().trim()%></div>
            </td>
          </tr>
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="20%" > 
              <div align="right">Forma C&aacute;lculo Interes :</div>
            </td>
            <td nowrap width="30%" > 
              <div align="left">
	            <% if (userPO.getHeader15().trim().equals("S")) out.print("LINEAL/CALENDARIO/VENCIDO");
					else if (userPO.getHeader15().trim().equals("M")) out.print("LINEAL/COMERCIAL/VENCIDO");
					else if (userPO.getHeader15().trim().equals("P")) out.print("LINEAL/CALENDARIO/PREPAGADO");
					else if (userPO.getHeader15().trim().equals("A")) out.print("LINEAL/COMERCIAL/PREPAGADO");
					else if (userPO.getHeader15().trim().equals("D")) out.print("LINEAL/CALENDARIO/DESCONTADO");
					else if (userPO.getHeader15().trim().equals("R")) out.print("LINEAL/COMERCIAL/PREPAGADO");
					else if (userPO.getHeader15().trim().equals("1")) out.print("EXPON/CALENDARIO/VENCIDO");
					else if (userPO.getHeader15().trim().equals("2")) out.print("EXPON/COMERCIAL/VENCIDO");
					else if (userPO.getHeader15().trim().equals("3")) out.print("EXPON/CALENDARIO/PREPAGADO");
					else if (userPO.getHeader15().trim().equals("4")) out.print("EXPON/COMERCIAL/PREPAGADO");
					else if (userPO.getHeader15().trim().equals("5")) out.print("EXPON/CALENDARIO/DESCONTADO");
					else if (userPO.getHeader15().trim().equals("6")) out.print("EXPON/COMERCIAL/PREPAGADO");
					else out.print("");%>
              </div>
            </td>
            <td nowrap width="20%" >
              <div align="right">Fecha Inicio C&aacute;lculo :</div>
            </td>
            <td nowrap width="30%" > 
              <div align="left"><%= userPO.getCreditLineNum().trim()%></div>
            </td>
          </tr>
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="20%" > 
              <div align="right"> Base C&aacute;lculo Interes :</div>
            </td>
            <td nowrap width="30%"  > 
              <div align="left">
	            <% if (userPO.getHeader16().trim().equals("1")) out.print("CAPITAL VIGENTE");
							else if (userPO.getHeader16().trim().equals("2")) out.print("CAPITAL ORIGINAL");
							else if (userPO.getHeader16().trim().equals("3")) out.print("CAPITAL(VIGENTE - VENCIDO)");
							else if (userPO.getHeader16().trim().equals("N")) out.print("NO CALCULA INTERES");
							else out.print("");%>
			  </div>
            </td>
            <td nowrap width="20%" >
              <div align="right">Fecha de Vencimiento :</div>
            </td>
            <td nowrap width="30%" > 
              <div align="left"><%= userPO.getHeader11().trim()%></div>
            </td>
          </tr>
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%" > 
              <div align="right"> Base C&aacute;lculo Mora :</div>
            </td>
            <td nowrap width="30%" > 
              <div align="left">
	              <% if (userPO.getHeader17().trim().equals("1")) out.print("CAPITAL VENCIDO");
						else if (userPO.getHeader17().trim().equals("2")) out.print("CAPITAL ORIGINAL");
						else if (userPO.getHeader17().trim().equals("3")) out.print("CAPITAL VIGENTE");
						else if (userPO.getHeader17().trim().equals("4")) out.print("(CAPITAL + INTERES)VENCIDO");
						else if (userPO.getHeader17().trim().equals("N")) out.print("NO CALCULA MORA");
						else out.print("");%>
			 </div>
            </td>
            <td nowrap width="20%"  > 
              <div align="right">Ultimo C&aacute;lculo Interes :</div>
            </td>
            <td nowrap width="30%" > 
              <div align="left"><%= userPO.getCreditLineType().trim()%></div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%"  > 
              <div align="right">Tasa de Inter&eacute;s :</div>
            </td>
            <td nowrap width="30%" > 
              <div align="left"><%= userPO.getHeader13().trim()%></div>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Per&iacute;odo Base :</div>
            </td>
            <td nowrap width="30%" > 
              <div align="left"><%= userPO.getHeader14().trim()%></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>

  <TABLE class="tableinfo"  cellpadding=2 cellspacing=3>
    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
      <TH ALIGN=CENTER nowrap   >Nro<br>Cuota</TH>
      <TH ALIGN=CENTER nowrap   >Fecha <br>a Pagar</TH>
      <TH ALIGN=CENTER nowrap   >Principal</TH>
      <TH ALIGN=CENTER nowrap   >Inter&eacute;s</TH>
      <TH ALIGN=CENTER nowrap   >Otros<br>Cargos</TH>
      <TH ALIGN=CENTER nowrap   >Total<br>Cuota</TH>
      <TH ALIGN=CENTER nowrap   >Saldo</TH>
      <TH ALIGN=CENTER nowrap  >Est.</TH>
      <TH ALIGN=CENTER nowrap   >Dias<br>Ven.</TH>
      <TH ALIGN=CENTER nowrap  >Fecha<br>Pago</TH>
      <TH ALIGN=CENTER nowrap  >Monto<br>Pagado</TH>
    </TR>
    <%
    			String couteDate = "";
                list.initRow();
                while (list.getNextRow()) {
                    if (couteDate.equals(list.getRecord(1))) {
                    } else {
                       couteDate = list.getRecord(1);
                    	
                    	// out.println(list.getRecord());
	%> 
    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
      <TD ALIGN=CENTER  nowrap   ><A HREF="javascript:showQuoteDetail(<%= list.getCurrentRow() %>)"><%= list.getRecord(0) %></A></TD>
      <TD ALIGN=CENTER  nowrap  ><A HREF="javascript:showQuoteDetail(<%= list.getCurrentRow() %>)"><%= list.getRecord(1) %></A></TD>
      <TD ALIGN=CENTER  nowrap > 
        <div align="right"><A HREF="javascript:showQuoteDetail(<%= list.getCurrentRow() %>)"><%= list.getRecord(2) %></A></div>
      </TD>
      <TD ALIGN=CENTER  nowrap  > 
        <div align="right"><A HREF="javascript:showQuoteDetail(<%= list.getCurrentRow() %>)"><%= list.getRecord(3) %></A></div>
      </TD>
      <TD ALIGN=CENTER  nowrap  > 
        <div align="right"><A HREF="javascript:showQuoteDetail(<%= list.getCurrentRow() %>)"><%= list.getRecord(4) %></A></div>
      </TD>
      <TD ALIGN=CENTER  nowrap  > 
        <div align="right"><A HREF="javascript:showQuoteDetail(<%= list.getCurrentRow() %>)"><%= list.getRecord(5) %></A></div>
      </TD>
      <TD ALIGN=CENTER  nowrap > 
        <div align="right"><a href="javascript:showQuoteDetail(<%= list.getCurrentRow() %>)"><%= list.getRecord(6) %></a></div>
      </TD>
      <TD ALIGN=CENTER  nowrap  > 
        <div align="center"><A HREF="javascript:showQuoteDetail(<%= list.getCurrentRow() %>)"><%= list.getRecord(7) %></A></div>
      </TD>
      <TD ALIGN=CENTER  nowrap ><A HREF="javascript:showQuoteDetail(<%= list.getCurrentRow() %>)"><%= list.getRecord(8) %></A></TD>
      <TD ALIGN=CENTER  nowrap ><A HREF="javascript:showQuoteDetail(<%= list.getCurrentRow() %>)"><%= list.getRecord(9) %></A></TD>
      <TD ALIGN=CENTER  nowrap > 
        <div align="right"><A HREF="javascript:showQuoteDetail(<%= list.getCurrentRow() %>)"><%= list.getRecord(10) %></A></div>
      </TD>
    </TR>
    <%
                    }
                }
    %> 
  </TABLE>
  
    <p>&nbsp;</p>
    <h4>Totales</h4>

  <TABLE class="tableinfo"  cellpadding=2 cellspacing=3>
    <TR> 
      <TD ALIGN=CENTER  nowrap><b>PRINCIPAL : </b><%= Util.formatCCY(userPO.getHeader20()) %></TD>
      <TD ALIGN=CENTER  nowrap><b>INTERES : </b><%= Util.formatCCY(userPO.getHeader21()) %></TD>
      <TD ALIGN=CENTER  nowrap><b>OTROS CARGOS : </b><%= Util.formatCCY(userPO.getHeader22()) %></TD>
      <TD ALIGN=CENTER  nowrap><b>MONTO PAGADO : </b><%= Util.formatCCY(userPO.getHeader23()) %></TD>
    </TR>
    <TR> 
      <TD ALIGN=CENTER  nowrap colspan="3" >__________________________________________________________________________</TD>
      <TD ALIGN=CENTER  nowrap></TD>
    </TR>
    <TR> 
      <TD ALIGN=CENTER  nowrap colspan="3"><b>TOTAL A PAGAR : </b><%= Util.formatCCY(userPO.getHeader19()) %></TD>
      <TD ALIGN=CENTER  nowrap></TD>
    </TR>
  </TABLE>

<% 
	if (!listUF.getNoResult()) {
%>
  <p>&nbsp;</p>

  <TABLE class="tableinfo"  cellpadding=2 cellspacing=3>
    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
      <TH ALIGN=CENTER nowrap   >Nro<br>Cuota</TH>
      <TH ALIGN=CENTER nowrap   >Fecha <br>a Pagar</TH>
      <TH ALIGN=CENTER nowrap   >Principal</TH>
      <TH ALIGN=CENTER nowrap   >Inter&eacute;s</TH>
      <TH ALIGN=CENTER nowrap   >Otros<br>Cargos</TH>
      <TH ALIGN=CENTER nowrap   >Total<br>Cuota</TH>
      <TH ALIGN=CENTER nowrap   >Saldo</TH>
      <TH ALIGN=CENTER nowrap  >Est.</TH>
      <TH ALIGN=CENTER nowrap   >Dias<br>Ven.</TH>
      <TH ALIGN=CENTER nowrap  >Fecha<br>Pago</TH>
      <TH ALIGN=CENTER nowrap  >Monto<br>Pagado</TH>
    </TR>
    <%
    			String couteDateUF = "";
                listUF.initRow();
                while (listUF.getNextRow()) {
	                couteDateUF = listUF.getRecord(1);
                    	
                    	// out.println(list.getRecord());
	%> 
    <TR> 
      <TD ALIGN=CENTER  nowrap   ><A HREF="javascript:showQuoteDetailUF(<%= listUF.getCurrentRow() %>)"><%= listUF.getRecord(0) %></A></TD>
      <TD ALIGN=CENTER  nowrap  ><A HREF="javascript:showQuoteDetailUF(<%= listUF.getCurrentRow() %>)"><%= listUF.getRecord(1) %></A></TD>
      <TD ALIGN=CENTER  nowrap > 
        <div align="right"><A HREF="javascript:showQuoteDetailUF(<%= listUF.getCurrentRow() %>)"><%= listUF.getRecord(2) %></A></div>
      </TD>
      <TD ALIGN=CENTER  nowrap  > 
        <div align="right"><A HREF="javascript:showQuoteDetailUF(<%= listUF.getCurrentRow() %>)"><%= listUF.getRecord(3) %></A></div>
      </TD>
      <TD ALIGN=CENTER  nowrap  > 
        <div align="right"><A HREF="javascript:showQuoteDetailUF(<%= listUF.getCurrentRow() %>)"><%= listUF.getRecord(4) %></A></div>
      </TD>
      <TD ALIGN=CENTER  nowrap  > 
        <div align="right"><A HREF="javascript:showQuoteDetailUF(<%= listUF.getCurrentRow() %>)"><%= listUF.getRecord(5) %></A></div>
      </TD>
      <TD ALIGN=CENTER  nowrap > 
        <div align="right"><a href="javascript:showQuoteDetailUF(<%= listUF.getCurrentRow() %>)"><%= listUF.getRecord(6) %></a></div>
      </TD>
      <TD ALIGN=CENTER  nowrap  > 
        <div align="right"><A HREF="javascript:showQuoteDetailUF(<%= listUF.getCurrentRow() %>)"><%= listUF.getRecord(7) %></A></div>
      </TD>
      <TD ALIGN=CENTER  nowrap ><A HREF="javascript:showQuoteDetailUF(<%= listUF.getCurrentRow() %>)"><%= listUF.getRecord(8) %></A></TD>
      <TD ALIGN=CENTER  nowrap ><A HREF="javascript:showQuoteDetailUF(<%= listUF.getCurrentRow() %>)"><%= listUF.getRecord(9) %></A></TD>
      <TD ALIGN=CENTER  nowrap > 
        <div align="right"><A HREF="javascript:showQuoteDetailUF(<%= listUF.getCurrentRow() %>)"><%= listUF.getRecord(10) %></A></div>
      </TD>
    </TR>
    <%
       }
    %> 
  </TABLE>
  
    <p>&nbsp;</p>
    <h4>Totales</h4>

  <TABLE class="tableinfo"  cellpadding=2 cellspacing=3>
    <TR> 
      <TD ALIGN=CENTER  nowrap><b>PRINCIPAL : </b><%= Util.formatCell(userPO.getHeader4()) %></TD>
      <TD ALIGN=CENTER  nowrap><b>INTERES : </b><%= Util.formatCell(userPO.getHeader5()) %></TD>
      <TD ALIGN=CENTER  nowrap><b>OTROS CARGOS : </b><%= Util.formatCell(userPO.getHeader6()) %></TD>
      <TD ALIGN=CENTER  nowrap><b>MONTO PAGADO : </b><%= Util.formatCell(userPO.getHeader7()) %></TD>
    </TR>
    <TR> 
      <TD ALIGN=CENTER  nowrap colspan="3" >__________________________________________________________________________</TD>
      <TD ALIGN=CENTER  nowrap></TD>
    </TR>
    <TR> 
      <TD ALIGN=CENTER  nowrap colspan="3"><b>TOTAL A PAGAR : </b><%= Util.formatCell(userPO.getHeader8()) %></TD>
      <TD ALIGN=CENTER  nowrap></TD>
    </TR>
  </TABLE>
<% 
 }
%>



</FORM>

</BODY>
</HTML>
