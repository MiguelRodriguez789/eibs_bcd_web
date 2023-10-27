<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Emision de Ordenes de No Pago</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="refCodeOF" class="datapro.eibs.beans.EDD018001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

function goAction(op) {

	document.getElementById("SCREEN").value = op;
	if (op == '113') {
    	if (confirm("Desea eliminar este registro seleccionado?")) {
			document.forms[0].submit();		
    	}
   	} else if (op == '114') {
   		if (confirm("Desea aclarar este registro seleccionado?")) {
			document.forms[0].submit();		
    	}
  	} else {
		document.forms[0].submit();		
	}
}

</script>

<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
	 out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%> 

<H3 align="center">Emisi&oacute;n de Ordenes de No Pago
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="of_stop_pay_maint.jsp , EDD0180"></H3> 
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0180" >
  <input type=HIDDEN name="SCREEN" id="SCREEN" value="115">

  <input type=HIDDEN name="E01STPBNK" id="E01STPBNK" value="<%= refCodeOF.getE01STPBNK().trim()%>">
  <input type=HIDDEN name="E01STPBRN" id="E01STPBRN" value="<%= refCodeOF.getE01STPBRN().trim()%>">
  <input type=HIDDEN name="E01STPGLN" id="E01STPGLN" value="<%= refCodeOF.getE01STPGLN().trim()%>">
  <input type=HIDDEN name="E01STPSEQ" id="E01STPSEQ" value="<%= refCodeOF.getE01STPSEQ().trim()%>">
  
  <table class="tableinfo">
            <tr > 
              <td nowrap> 
                <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
                  <tr id="trdark"> 
                    <td nowrap width="25%" > 
                      <div align="right"><b>Numero de Cheque :</b></div>
                    </td>
                    <td nowrap width="25%" > 
                      <div align="left"><b> 
                      	<eibsinput:text property="E01STPACC" name="refCodeOF" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="12" maxlength="11" readonly="true" />
                        </b> </div>
                    </td>
                    <td nowrap width="25%" > 
                      <div align="right"><b>Moneda :</b> </div>
                    </td>
                   <td nowrap width="25%" > 
                      <div align="left"><b> 
                      	<eibsinput:text property="E01STPCCY" name="refCodeOF" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true" />
                        </b> </div>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
<br>
 <table class="tbenter" width=100% align=center>
    <tr> 
      <td class=TDBKG width="33%"> 
        <div align="center"><a href="javascript:goAction(113)"><b>Borrar</b></a></div>
      </td>
      <td class=TDBKG width="33%"> 
        <div align="center"><a href="javascript:goAction(114)"><b>Aclarar</b></a></div>
      </td>
     <td class=TDBKG width="33%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </td>
    </tr>
  </table>
 
  <br>                

<%int row = 0; %> 
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Beneficiario :</div>
            </td>
            <td nowrap width="60%"> 
              <div align="left"> 
 		        <eibsinput:text name="refCodeOF" property="E01CUSNA1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" readonly="true" />
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Identificacion :</div>
            </td>
            <td nowrap width="60%"> 
              <div align="left"> 
 		        <eibsinput:text name="refCodeOF" property="E01IDENTI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" readonly="true"/>
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Applicante :</div>
            </td>
            <td nowrap width="60%"> 
              <div align="left"> 
 		        <eibsinput:text name="refCodeOF" property="E01PLICAN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" readonly="true" />
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Descripci&oacute;n :</div>
            </td>
            <td nowrap width="60%"> 
              <div align="left"> 
 		        <eibsinput:text name="refCodeOF" property="E01DESCRI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Fecha :</div>
            </td>
            <td nowrap width="60%"> 
              <div align="left"> 
    	        <eibsinput:date name="refCodeOF" fn_year="E01STPCKY" fn_month="E01STPCKM" fn_day="E01STPCKD" readonly="true" />
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Monto :</div>
            </td>
            <td nowrap width="60%"> 
              <div align="left"> 
 		        <eibsinput:text name="refCodeOF" property="E01STPAMT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL %>" readonly="true" />
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Comentarios :</div>
            </td>
            <td nowrap width="60%"> 
 		        <eibsinput:text name="refCodeOF" property="E01STPRMK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NARRATIVE %>"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Eliminaci&oacute;n en 180 D&iacute;as :</div>
            </td>
            <td nowrap width="60%">
              <input type="radio" name="E01STPF04" id="E01STPF04" value="Y" <%if(!refCodeOF.getE01STPF04().equals("N")) out.print("checked");%>>
              S&iacute; 
              <input type="radio" name="E01STPF04" id="E01STPF04" value="N" <%if(refCodeOF.getE01STPF04().equals("N")) out.print("checked");%>>
              No </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" > 
              <div align="right">Motivo :</div>
            </td>
            <td nowrap width="60%" > 
                 <eibsinput:cnofc name="refCodeOF" property="E01STPF02" required="false" flag="51" fn_code="E01STPF02" fn_description="D01DSCCAU"/>
                 <eibsinput:text property="D01DSCCAU" name="refCodeOF" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true"/>
            </td>
          </tr>
        </table>
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
