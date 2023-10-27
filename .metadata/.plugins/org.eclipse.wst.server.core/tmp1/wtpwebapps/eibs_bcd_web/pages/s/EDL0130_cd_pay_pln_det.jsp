<html>
<head>
<title>Esquema de Pagos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "pmnt" class= "datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "userInfo" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

</head>
<%
  String readonly = userPO.getOption().equals("INQ")?"readonly":""; 
 %>
<body>
<%
	 pmnt.initRow();
    int blank_row = 5;
    int max_row = 361;
    int row;
    int total_row;
    try {
      row = Integer.parseInt(request.getParameter("ROW"));
    }
    catch (Exception e) {
      row = 0;
    }
    if ( (row == 0) || (row < pmnt.getLastRow()) ) {
      total_row = pmnt.getLastRow() + 1 + blank_row;
    }
    else {
		total_row = row;       
    }
%> 

<SCRIPT>

function checkRowValue() {
  var r = <%= total_row %> + parseInt(document.forms[0].TEMP_ROW.value);
  if (r > <%= max_row %>) {
    alert("Valor fuera de limites, el numero maximo es 361.");
  }
  else {
    document.forms[0].ROW.value = r + "";}}

function submitThis(option) {
  document.forms[0].opt.value = option;
  document.forms[0].submit();
}

function isYear(field) {
var year = parseInt(field.value)
if ( field.value.length > 0 ) {

  if ( isNaN(year) ) {
   alert(" Solamente admite valores numericos.")
   field.focus()
   field.value = ""
  }
else {
   if ( (""+year).length < 4 || year == 0 ) {
   alert("Please, enter a valid year ( 4 digits )")
   field.focus()
	}
  }
 }
}

</SCRIPT>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }
%> 

<h3 align="center"> Plan de Pagos</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDL0130" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="10">
  <INPUT TYPE=HIDDEN NAME="opt" VALUE="1">
  <INPUT TYPE=HIDDEN NAME="ROW" VALUE="<%= total_row %>">
   <%int row1 = 0; %>
  <%if(!userPO.getOption().equals("INQ")){ %>
  <h4>Generaci&oacute;n Automatica</h4>
        
 
  <table class="tableinfo">
    <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
      <td nowrap width="25%"  bordercolor="#FFFFFF"> 
        <div align="right">N&uacute;mero de Pagos : </div>
      </td>
      <td nowrap width="25%"  bordercolor="#FFFFFF"> 
        <div align="left"> 
          <input type="text" name="NUMBER" size="4" maxlength="3">
        </div>
      </td>
      <td nowrap width="25%"  bordercolor="#FFFFFF"> 
        <div align="right">Monto : </div>
      </td>
      <td nowrap width="25%"  bordercolor="#FFFFFF"> 
        <input type="text" name="AMOUNT" size="14" maxlength="13">
      </td>
      <td CLASS="TDBKG" ALIGN=CENTER width="50%"> <a href="javascript:submitThis(2)">Generar</a></td>
    </tr>
    <tr id="<%= (row1% 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
      <td nowrap width="25%"  bordercolor="#FFFFFF"> 
        <div align="right">Primera Fecha de Pago:</div>
      </td>
      <td nowrap width="25%"  bordercolor="#FFFFFF"> <%
          if ( userInfo.getE01DTF().equals("YMD") ) {
        %> 
              <input type="text" name="DATE3" size="5" maxlength="4">
              <input type="text" name="DATE1" size="3" maxlength="2">
              <input type="text" name="DATE2" size="3" maxlength="2" >
              <font face="Arial" size="2">(yy/mm/dd)</font>

        <%
          }
          else if ( userInfo.getE01DTF().equals("MDY") ) {
        %>
              <input type="text" name="DATE1" size="3" maxlength="2">
              <input type="text" name="DATE2" size="3" maxlength="2">
              <input type="text" name="DATE3" size="5" maxlength="4" >
              <font face="Arial" size="2">(mm/dd/yy)</font>

        <%
          }
          else {
        %>
              <input type="text" name="DATE2" size="3" maxlength="2">
              <input type="text" name="DATE1" size="3" maxlength="2">
              <input type="text" name="DATE3" size="5" maxlength="4" >
              <font face="Arial" size="2">(dd/mm/yy)</font>


        <%
          }
        %>
		</td>
      <td nowrap width="25%"  bordercolor="#FFFFFF"> 
        <div align="right">Frecuencia : </div>
      </td>
      <td nowrap width="25%"  bordercolor="#FFFFFF"> 
        <input type="text" name="FREQUENCY" size="5" maxlength="4">
        <select name="CODE">
          <option value="D" selected>Día(s)</option>
          <option value="M">Mes(es)</option>
          <option value="Y">Año(s)</option>
        </select>
      </td>
    </tr>
  </table>
  <%} else{%>
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
                <input type="text" name="E02CUN2" size="10" maxlength="9" readonly value="<%= userPO.getCusNum().trim()%>">
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="right"><b>Nombre :</b></div>
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
              <input type="text" name="E02PTYP" size="5" maxlength="4" readonly value="<%= userPO.getType().trim()%>">
              <input type="text" name="E02PRO2" size="5" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>">
              </b></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="14%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"> 
                <input type="text" name="E02ACC" size="13" maxlength="12" value="<%= userPO.getAccNum().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%"> 
              <div align="right"><b>Oficial :</b></div>
            </td>
            <td nowrap width="33%"> 
              <div align="left"> 
                <input type="text" name="E02NA122" size="45" maxlength="45" readonly value="<%= userPO.getOfficer().trim()%>">
              </div>
            </td>
            <td nowrap width="11%"> 
              <div align="right"><b>Moneda :</b></div>
            </td>
            <td nowrap width="21%"> 
              <div align="left"> 
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

<br>
  <%} %>
  <h4>&nbsp;</h4>
  <table class="tableinfo">
    <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
      <td nowrap bordercolor="#FFFFFF"> 
        <div align="center">Pago N&uacute;mero</div>
      </td>
      <td nowrap bordercolor="#FFFFFF"> 
        <div align="center">Fecha</div>
      </td>
      <td nowrap bordercolor="#FFFFFF"> 
        <div align="center">Principal</div>
      </td>
      <td nowrap bordercolor="#FFFFFF">
<!--         <div align="center">Inter&eacute;s</div> -->
      </td>
    </tr>
    <%
	 				 pmnt.initRow();
                while (pmnt.getNextRow()) {
	      %> 
    <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
      <td nowrap bordercolor="#FFFFFF"> 
        <div align="center"> 
          <input type="text" name="DLPPNU_<%= pmnt.getCurrentRow() %>" size="4" maxlength="3"  value="<%= pmnt.getRecord(0) %>" <%=readonly %>>
        </div>
      </td>
      <td nowrap bordercolor="#FFFFFF"> 
        <div align="center"> 
          <input type="text" name="DLPPD1_<%= pmnt.getCurrentRow() %>" size="3" maxlength="2"  value="<%= pmnt.getRecord(1) %>" <%=readonly %>>
          <input type="text" name="DLPPD2_<%= pmnt.getCurrentRow() %>" size="3" maxlength="2"  value="<%= pmnt.getRecord(2) %>" <%=readonly %>>
          <input type="text" name="DLPPD3_<%= pmnt.getCurrentRow() %>" size="5" maxlength="4"  value="<%= pmnt.getRecord(3) %>" <%=readonly %>>
        </div>
      </td>
      <td nowrap bordercolor="#FFFFFF" > 
        <div align="center"> 
          <input type="text" name="DLPPRI_<%= pmnt.getCurrentRow() %>" size="17" maxlength="13" value="<%= pmnt.getRecord(4) %>" class="txtright" onKeypress="enterDecimal()"
          			<%=readonly %>>
        </div>
      </td>
      <td nowrap bordercolor="#FFFFFF" >
        <div align="center">
<%--           <input type="text" name="DLPINT_<%= pmnt.getCurrentRow() %>" size="17" maxlength="13" value="<%= pmnt.getRecord(5) %>" class="txtright" onKeypress="enterDecimal()"> --%>
        </div>
      </td>
    </tr>
    <%
                }
			for (int i=pmnt.getRow(); i < total_row; i++) {
    %> 
    <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
      <td nowrap bordercolor="#FFFFFF"> 
        <div align="center"> 
          <input type="text" name="DLPPNU_<%= i %>" size="4" maxlength="3" <%=readonly %>>
        </div>
      </td>
      <td nowrap bordercolor="#FFFFFF"> 
        <div align="center"> 
          <input type="text" name="DLPPD1_<%= i %>" size="3" maxlength="2" <%=readonly %>>
          <input type="text" name="DLPPD2_<%= i %>" size="3" maxlength="2" <%=readonly %>>
          <input type="text" name="DLPPD3_<%= i %>" size="5" maxlength="4" <%=readonly %>>
        </div>
      </td>
      <td nowrap bordercolor="#FFFFFF" > 
        <div align="center"> 
          <input type="text" name="DLPPRI_<%= i %>" size="17" maxlength="15" value="" class="txtright" <%=readonly %>>
        </div>
      </td>
      <td nowrap bordercolor="#FFFFFF" >
        <div align="center">
<%--           <input type="text" name="DLPINT_<%= i %>" size="17" maxlength="15" value="" class="txtright"> --%>
        </div>
      </td>
    </tr>
    <%
                }
    %> 
  </table>
 <%if(!userPO.getOption().equals("INQ")){ %>
  <table  class="tbenter" >
    <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
      <td > 
        <div align="right">Cantidad de Registros a A&ntilde;adir : 
          <input type="text" name="TEMP_ROW" size="4" maxlength="3" value="0" onBlur="checkRowValue()">
        </div>
      </td>
      <td CLASS="TDBKG" ALIGN=CENTER width="50%"><a href="javascript:submitThis(3)">Aplicar</a></td>
    </tr>
  </table>
  
  <p align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </p>
  <%} %>
  </form>
</body>
</html>
