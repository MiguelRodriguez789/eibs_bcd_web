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

<jsp:useBean id="refCode" class="datapro.eibs.beans.EDD018001Message"  scope="session" />
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


<H3 align="center">Emisi&oacute;n de Ordenes de No Pago<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_stop_pay_det.jsp , EDD0180"> 
</H3><hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0180" >
  <input type=HIDDEN name="SCREEN" value="800">
  <INPUT TYPE=HIDDEN NAME="opt" VALUE="2">

  <input type=HIDDEN name="E01STPBNK" value="<%= userPO.getHeader10().trim()%>">
  <input type=HIDDEN name="E01STPBRN" value="<%= userPO.getHeader11().trim()%>">
  <input type=HIDDEN name="E01STPGLN" value="<%= userPO.getHeader12().trim()%>">

  <table class="tableinfo">
            <tr > 
              <td nowrap> 
                <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
                  <tr id="trdark"> 
                    <td nowrap width="16%" > 
                      <div align="right"><b>Cliente :</b></div>
                    </td>
                    <td nowrap width="20%" > 
                      <div align="left"><b> 
                        <input type="text" readonly name="E01STPCUN" size="10" maxlength="9" value="<%= userPO.getCusNum().trim()%>" >
                        </b> </div>
                    </td>
                    <td nowrap width="16%" > 
                      <div align="right"><b>Nombre :</b> </div>
                    </td>
                    <td nowrap width="16%" > 
                      <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
                        <input type="text" name="E01CUSNA1" size="45" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
                        </font></font></font></div>
                    </td>
                    <td nowrap width="16%" > 
                      <div align="right"><b></b> </div>
                    </td>
                    <td nowrap width="16%" > 
                      <div align="left"></div>
                    </td>
                  </tr>
                  <tr id="trdark"> 
                    <td nowrap width="16%"> 
                      <div align="right"><b>Cuenta :</b></div>
                    </td>
                    <td nowrap width="20%"> 
                      <div align="left"> 
                        <input type="text" name="E01STPACC" size="13" maxlength="12" value="<%= userPO.getAccNum().trim()%>" readonly>
                      </div>
                    </td>
                    <td nowrap width="16%"> 
                      <div align="right"><b>Moneda : </b></div>
                    </td>
                    <td nowrap width="16%"> 
                      <div align="left"><b> 
                        <input type="text" name="E01STPCCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                        </b> </div>
                    </td>
                    <td nowrap width="16%"> 
                      <div align="right"><b>Producto: </b></div>
                    </td>
                    <td nowrap width="16%"> 
                      <div align="left"><b> 
                        <input type="text" name="E01STPPRO" size="4" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>">
                        </b> </div>
                    </td>
                  </tr>
                </table>
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
            <td nowrap width="34%">
              <div align="right">Secuencia :</div>
            </td>
            <td nowrap colspan="3">
 		        <eibsinput:text name="refCode" property="E01STPSEQ" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="4" maxlength="3" readonly="true" />
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="34%"> 
              <div align="right">N&uacute;mero de Cheque :</div>
            </td>
            <td nowrap width="15%"> 
              <div align="left"> 
 		        <eibsinput:text name="refCode" property="E01STPFCK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHECK_NUMBER %>"/>
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right">Hasta Cheque :</div>
            </td>
            <td nowrap width="25%" >
 		        <eibsinput:text name="refCode" property="E01STPTCK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHECK_NUMBER %>"/>
              (Si Rango)</td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap> 
              <div align="right">Fecha del Cheque :</div>
            </td>
            <td nowrap colspan="3"> 
              <div align="left"> 
    	        <eibsinput:date name="refCode" fn_year="E01STPCKY" fn_month="E01STPCKM" fn_day="E01STPCKD" />
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap> 
              <div align="right">Monto de Cheque :</div>
            </td>
            <td nowrap colspan="3"> 
              <div align="left"> 
 		        <eibsinput:text name="refCode" property="E01STPAMT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL %>"/>
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap> 
              <div align="right">Comentarios :</div>
            </td>
            <td nowrap colspan="3"> 
 		        <eibsinput:text name="refCode" property="E01STPRMK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NARRATIVE %>"/>
            </td>
          </tr>
<%--          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  --%>
<!--             <td nowrap>  -->
<!--               <div align="right">Transacci&oacute;n Tipo ACH :</div> -->
<!--             </td> -->
<!--             <td nowrap  colspan="3">  -->
<!--               <input type="radio" name="E01STPFLG" value="Y" -->
<%-- 			  <%if(refCode.getE01STPFLG().equals("Y")) out.print("checked");%>> --%>
<!--               S&iacute;  -->
<!--               <input type="radio" name="E01STPFLG" value="N" -->
<%-- 			  <%if(!refCode.getE01STPFLG().equals("Y")) out.print("checked");%>> --%>
<!--               No <font size="2"> (*)</font> </td> -->
<!--           </tr> -->
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap> 
              <div align="right">Cargos al Cliente :</div>
            </td>
            <td nowrap colspan="3"> 
              <input type="radio" readonly name="E01STPCCF" value="Y"
			  <%if((refCode.getE01STPCCF().equals("Y")))  out.print("checked");%>>
              S&iacute; 
              <input type="radio" readonly name="E01STPCCF" value="N"
			  <%if(refCode.getE01STPCCF().equals("N")) out.print("checked");%>>
              No</td>
          </tr>
<%--           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> --%>
<!--             <td nowrap>  -->
<!--               <div align="right">Sub - Cuenta N&uacute;mero :</div> -->
<!--             </td> -->
<!--             <td nowrap colspan="3">  -->
<%--               <input type="text" name="E01STPPTS" size="7" maxlength="5" value="<%=refCode.getE01STPPTS()%>" onKeypress="enterInteger(event)"> --%>
<%--               <a href="javascript:GetSubAcc('E01STPPTS',document.forms[0].E01STPACC.value )"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>  --%>
<!--             </td> -->
<!--           </tr> -->
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap> 
              <div align="right">Eliminaci&oacute;n en 180 D&iacute;as :</div>
            </td>
            <td nowrap colspan="3"> 
              <input type="radio" name="E01STPF04" value="Y"
			  <%if(refCode.getE01STPF04().equals("Y")) out.print("checked");%>>
              S&iacute; 
              <input type="radio" name="E01STPF04" value="N"
			  <%if(!refCode.getE01STPF04().equals("Y")) out.print("checked");%>>
              No </td>
          </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap> 
              <div align="right">Motivo :</div>
            </td>
            <td nowrap colspan="3"> 
                 <eibsinput:cnofc name="refCode" property="E01STPF02" required="false" flag="51" fn_code="E01STPF02" fn_description="D01DSCCAU"/>
                 <eibsinput:text property="D01DSCCAU" name="refCode" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true"/>
            </td>
          </tr>
<%--           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  --%>
<!--             <td nowrap>  -->
<!--               <div align="right">Ratificado por el Cliente :</div> -->
<!--             </td> -->
<!--             <td nowrap colspan="3">  -->
<!--               <input type="radio" name="E01STPF05" value="Y" -->
<%-- 			  <%if(refCode.getE01STPF05().equals("Y")) out.print("checked");%>> --%>
<!--               S&iacute;  -->
<!--               <input type="radio" name="E01STPF05" value="N" -->
<%-- 			  <%if(!refCode.getE01STPF05().trim().equals("Y")) out.print("checked");%>> --%>
<!--               No</td> -->
<!--           </tr> -->
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap colspan="4"><b>(*) = &quot;Si&quot; 
              Transacci&oacute;n Tipo ACH se rechazar&aacute;</b>
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
