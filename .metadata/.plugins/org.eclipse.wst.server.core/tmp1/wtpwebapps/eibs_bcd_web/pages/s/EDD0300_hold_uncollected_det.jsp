<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Retenciones y Diferidos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="refCode" class="datapro.eibs.beans.EDD030001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

function goAction(op) {

	document.forms[0].SCREEN.value = op;
	if (op == '3') {
    	if (confirm("Desea eliminar este registro seleccionado?")) {
			document.forms[0].submit();		
    	}
  	} else {
		document.forms[0].submit();		
	}
}

</script>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
	 out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%> 

<H3 align="center">Mantenimiento de Retenciones y Diferidos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="hold_uncollected_det.jsp , EDD0300"> 
</H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0300" >
  
  <input type=HIDDEN name="SCREEN" value="300">
  <INPUT TYPE=HIDDEN NAME="opt" VALUE="2">

  <input type=HIDDEN name="E01UNCBNK" value="<%= userPO.getBank().trim()%>">
  <input type=HIDDEN name="E01UNCBRN" value="<%= userPO.getBranch().trim()%>">
 
 
   <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="10%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"><b> 
                <input type="text" readonly name="E02UNCCUN" size="10" maxlength="9" value="<%= userPO.getCusNum().trim()%>" >
                </b> </div>
            </td>
            <td nowrap width="10%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap width="30%"  > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
                <input type="text" name="E02CUSNA1" size="45" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
                </font></font></font></div>
            </td>
			<td nowrap width="10%">
			</td>
			<td nowrap width="20%">
			</td>
			</tr>
          <tr id="trdark"> 
            <td nowrap width="10%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E01UNCACC" size="13" maxlength="12" value="<%= userPO.getAccNum().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="30%"> 
              <div align="left"><b> 
                <input type="text" name="E02UNCCCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="10%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"><b> 
                <input type="text" name="E02UNCPRO" size="4" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<BR>
  
  <%int row = 0; %>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Secuencia :</div>
            </td>
            <td nowrap width="60%"> 
 		        <eibsinput:text name="refCode" property="E01UNCSEQ" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="4" maxlength="3" readonly="true" />
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Tipo :</div>
            </td>
            <td nowrap width="60%"> 
              <div align="left"> 
			    <select name="E01UNCFLG">
				  <option value="H" <% if (refCode.getE01UNCFLG().equals("H")) out.print("selected"); %>>Retenciones</option>
				  <option value=" " <% if (refCode.getE01UNCFLG().equals(" ")) out.print("selected"); %>>Diferidos</option>
				</select>
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Fecha Proceso :</div>
            </td>
            <td nowrap width="60%"> 
    	        <eibsinput:date name="refCode" fn_year="E01UNCRDY" fn_month="E01UNCRDM" fn_day="E01UNCRDD" />
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Fecha Vencimiento :</div>
            </td>
            <td nowrap width="60%"> 
    	        <eibsinput:date name="refCode" fn_year="E01UNCMDY" fn_month="E01UNCMDM" fn_day="E01UNCMDD" />
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Dias :</div>
            </td>
            <td nowrap width="60%"> 
 		        <eibsinput:text name="refCode" property="E01UNCDYS" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="4" />
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Monto :</div>
            </td>
            <td nowrap width="60%"> 
              <div align="left"> 
 		        <eibsinput:text name="refCode" property="E01UNCAMN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL %>"/>
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Raz&oacute;n :</div>
            </td>
            <td nowrap width="60%"> 
 		        <eibsinput:text name="refCode" property="E01UNCRSN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NARRATIVE %>"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="40%"> 
              <div align="right">Referencia :</div>
            </td>
            <td nowrap width="60%"> 
              <div align="left"> 
                <input type="text" name="E01UNCCKN" size="13" maxlength="11" value="<%= refCode.getE01UNCCKN()%>">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <br>
          <div align="center"> 
            <% if (!refCode.getE01UNCF02().equals("E")) {%>
            <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
            <% } %>
          </div>
  </form>
</body>
</html>
