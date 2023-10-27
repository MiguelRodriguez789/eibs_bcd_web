<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Pignoración/Bloqueo de Certificado de Depósito</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="refCodeCD" class="datapro.eibs.beans.EDD018001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

function goAction(op) {

	document.getElementById("SCREEN").value = op;
	if (op == '13') {
    	if (confirm("Desea eliminar este registro seleccionado?")) {
			document.forms[0].submit();		
    	}
   	} else if (op == '15') {
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

<H3 align="center">Pignoración/Bloqueo de Certificado de Depósito
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cd_stop_pay_det.jsp , EDD0180"></H3> 
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0180" >
  <input type=HIDDEN name="SCREEN" id="SCREEN" value="600">

  <input type=HIDDEN name="E01STPBNK" id="E01STPBNK" value="<%= refCodeCD.getE01STPBNK().trim()%>">
  <input type=HIDDEN name="E01STPBRN" id="E01STPBRN" value="<%= refCodeCD.getE01STPBRN().trim()%>">
  <input type=HIDDEN name="E01STPGLN" id="E01STPGLN" value="<%= refCodeCD.getE01STPGLN().trim()%>">
  <input type=HIDDEN name="E01STPSEQ" id="E01STPSEQ" value="<%= refCodeCD.getE01STPSEQ().trim()%>">
  <input type=HIDDEN name="E01CUN" id="E01CUN" value="">
  <input type=HIDDEN name="E01OT" id="E01OT" value="">
  
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
                        <input type="text" readonly name="E01STPCUN" size="10" maxlength="9" value="<%= refCodeCD.getE01STPCUN().trim()%>" >
                        </b> </div>
                    </td>
                    <td nowrap width="16%" > 
                      <div align="right"><b>Nombre :</b> </div>
                    </td>
                    <td nowrap width="16%" > 
                      <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
                        <input type="text" name="E01CUSNA1" size="45" maxlength="45" readonly value="<%= refCodeCD.getE01CUSNA1().trim()%>">
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
                        <input type="text" name="E01STPACC" size="13" maxlength="12" value="<%= refCodeCD.getE01STPACC().trim()%>" readonly>
                      </div>
                    </td>
                    <td nowrap width="16%"> 
                      <div align="right"><b>Moneda : </b></div>
                    </td>
                    <td nowrap width="16%"> 
                      <div align="left"><b> 
                        <input type="text" name="E01STPCCY" size="3" maxlength="3" value="<%= refCodeCD.getE01STPCCY().trim()%>" readonly>
                        </b> </div>
                    </td>
                    <td nowrap width="16%"> 
                      <div align="right"><b>Producto: </b></div>
                    </td>
                    <td nowrap width="16%"> 
                      <div align="left"><b> 
                        <input type="text" name="E01STPPRO" size="4" maxlength="4" readonly value="<%= refCodeCD.getE01STPPRO().trim()%>">
                        </b> </div>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
 <table class="tbenter" width=100% align=center>
    <tr> 
<!--       <td class=TDBKG width="25%">  -->
<!--         <div align="center"><a href="javascript:goAction(13)"><b>Borrar</b></a></div> -->
<!--       </td> -->
       <td class=TDBKG width="50%"> 
        <div align="center"><a href="javascript:goAction(15)"><b>Levantar</b></a></div>
      </td>
     <td class=TDBKG width="25%"> 
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
            <td nowrap width="30%"> 
              <div align="right">Fecha :</div>
            </td>
            <td nowrap width="70%"> 
              <div align="left"> 
    	        <eibsinput:date name="refCodeCD" fn_year="E01STPCKY" fn_month="E01STPCKM" fn_day="E01STPCKD" />
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="30%"> 
              <div align="right">Saldo de Capital :</div>
            </td>
            <td nowrap width="70%"> 
              <div align="left"> 
 		        <eibsinput:text name="refCodeCD" property="E01STPAMT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL %>"/>
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="30%" > 
              <div align="right">Motivo :</div>
            </td>
            <td nowrap width="70%" > 
                 <eibsinput:cnofc name="refCodeCD" property="E01STPCAU" required="false" flag="51" fn_code="E01STPCAU" fn_description="D01DSCCAU"/>
                 <eibsinput:text property="D01DSCCAU" name="refCodeCD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true"/>
            </td>
           </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>A Favor de Terceros</h4>

  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

          <tr id="<%= (row % 2 == 1) ? "trclear" : "trdark" %><%row++;%>"> 
            <td nowrap width="30%"> 
              <div align="right">Identificación/Nombre :</div>
            </td>
            <td nowrap width="70%">
	             <input type="text" name="E01STPF02" size="15" maxlength="14" value="<%= refCodeCD.getE01STPF02().trim()%>" readonly>
	             <input type="text" name="E01STPRMK" size="60" maxlength="60" value="<%= refCodeCD.getE01STPRMK().trim()%>" readonly>
	             <a href="javascript:GetCustomerDescId('','E01STPRMK','E01STPF02','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0"  ></a>
            </td>
          </tr>
          
          <tr id="<%= (row % 2 == 1) ? "trclear" : "trdark" %><%row++;%>"> 
            <td nowrap width="30%"> 
              <div align="right">Fecha Inicio de Garantia :</div>
            </td>
            <td nowrap width="70%"> 
              <div align="left"> 
    	        <eibsinput:date name="refCodeCD" fn_year="E01STPDTY" fn_month="E01STPDTM" fn_day="E01STPDTD" />
              </div>
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trclear" : "trdark" %><%row++;%>"> 
            <td nowrap width="30%"> 
              <div align="right">Fecha Fin de Garantia :</div>
            </td>
            <td nowrap width="70%"> 
              <div align="left"> 
    	        <eibsinput:date name="refCodeCD" fn_year="E01STPMDY" fn_month="E01STPMDM" fn_day="E01STPMDD" />
              </div>
            </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>
  <br>
  
  <br>
          <div align="center"> 
            <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
          </div>
  </form>
</body>
</html>
