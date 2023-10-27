<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Fomento Details</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id= "datarec" class="datapro.eibs.beans.EPV113001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

function cancel() {
	document.forms[0].SCREEN.value = 100;
	document.forms[0].submit();
}

function cerrarVentana(){
	window.open('','_parent','');
	window.close(); 
}

   
</SCRIPT>

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
%>
<%	
	boolean readOnly=false;
	if (request.getParameter("readOnly") != null ){
		if (request.getParameter("readOnly").toLowerCase().equals("true")){
			readOnly=true;
		} else {
			readOnly=false;
		}
	}	
 %>


<H3 align="center">Cred&iacute;to de Fomento (Pasivo)<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="plan_fomento_details.jsp, EPV1130"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1130" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
    <INPUT TYPE=HIDDEN NAME="E01PFNSEQ"  VALUE="<%=datarec.getE01PFNSEQ().trim()%>">
  
  
  
  <h4>Informaci&oacute;n B&aacute;sica</h4>
  
  <%int row = 0; %>
  
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Numero de Prestamo :</div>
            </td>
            <td nowrap width="60%">
                <input type="text" name="E01PFNPAC" size="14" maxlength="12"  readonly value="<% if (datarec.getE01PFNPAC().trim().equals("999999999999")) out.print("NUEVA CUENTA"); else out.print(datarec.getE01PFNPAC().trim()); %>">
            </td>
          </tr>          

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Numero Cliente Fomento :</div>
            </td>
            <td nowrap width="60%"> 
              	<eibsinput:text name="datarec" property="E01PFNCUP" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER%>" readonly="true" />
              	&nbsp;
              	<eibsinput:text name="datarec" property="E01PFNCNM" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true" />
            </td>
          </tr>
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Codigo de Fomento :</div>
            </td>
            <td nowrap width="60%"> 
              <div align="left"> 
                <input type="text" name="E01PFNCOD" size="5" maxlength="4" value="<%= datarec.getE01PFNCOD()%>" readonly >
              	&nbsp;
              	<eibsinput:text name="datarec" property="E01PFNDSC" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true" />
              </div>
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" height="23"> 
              <div align="right">Codigo de Producto :</div>
            </td>
            <td nowrap width="60%"> 
              <div align="left"> 
              	<eibsinput:text name="datarec" property="E01PFNPRD" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT%>" readonly="true" />
              	&nbsp;
              	<eibsinput:text name="datarec" property="E01DSCPRD" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true" />
              	
              </div>
            </td>
          </tr>          
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" height="23"> 
              <div align="right">Tabla Tasa Flotante :</div>
            </td>
            <td nowrap width="60%"> 
              <div align="left"> 

 			<% if (!readOnly) { %>
              <input type="text" name="E01PFNFTB" size="2" maxlength="2" value="<%= datarec.getE01PFNFTB().trim()%>"  >
              <a href="javascript:GetFloating('E01PFNFTB')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="middle" border="0" ></a> 
               <select name="E01PFNFTY"> 
                <option value=" " <% if (!(datarec.getE01PFNFTY().equals("FP") || datarec.getE01PFNFTY().equals("FS"))) out.print("selected"); %>></option>
                <option value="FP" <% if (datarec.getE01PFNFTY().equals("FP")) out.print("selected"); %>>FP</option>
                <option value="FS" <% if (datarec.getE01PFNFTY().equals("FS")) out.print("selected"); %>>FS</option>
              </select>             	
			<% } else { %>	
                <input type="text" name="E01PFNFTB" size="3" maxlength="2" value="<%= datarec.getE01PFNFTB().trim()%>"  readonly>
                <select  name="E01PFNFTY" disabled>
                <option value=" " <% if (!(datarec.getE01PFNFTY().equals("FP") || datarec.getE01PFNFTY().equals("FS"))) out.print("selected"); %>></option>
                  <option value="FP" <%if (datarec.getE01PFNFTY().equals("FP")) { out.print("selected"); }%>> Primario</option>
                  <option value="FS" <%if (datarec.getE01PFNFTY().equals("FS")) {  out.print("selected"); }%>> Secundario</option>
                </select>  
            <% } %>    
              </div>
            </td>
          </tr>          
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" height="23"> 
              <div align="right">Tasa Flotante :</div>
            </td>
            <td nowrap width="60%"> 
              <div align="left"> 
              	<eibsinput:text name="datarec" property="E01PFNFRT" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE%>" readonly="true" />
              </div>
            </td>
          </tr>          
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" height="23"> 
              <div align="right">Tasa Fomento/Spread :</div>
            </td>
            <td nowrap width="60%"> 
              <div align="left"> 
              	<eibsinput:text name="datarec" property="E01PFNRTE" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE%>" readonly="<%=readOnly%>" />
              </div>
            </td>
          </tr>           
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" height="23"> 
              <div align="right">Tasa del Prestamo :</div>
            </td>
            <td nowrap width="60%"> 
              <div align="left"> 
              	<eibsinput:text name="datarec" property="E01TOTRTE" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE%>" readonly="true" />
              </div>
            </td>
          </tr>            
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" height="23"> 
              <div align="right">Surcusal :</div>
            </td>
            <td nowrap width="60%"> 
              <div align="left"> 
              	<eibsinput:text name="datarec" property="E01PFNBNK" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK%>" readonly="<%=readOnly%>" />
              	&nbsp;
				<eibsinput:help name="datarec" property="E01PFNBRN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>" 
 	 				fn_param_one="E01PFNBRN" fn_param_two="document.forms[0].E01PFNBNK.value" readonly="<%=readOnly%>"/>              	
              </div>
            </td>
          </tr>     
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" height="23"> 
              <div align="right">Monto Original :</div>
            </td>
            <td nowrap width="60%"> 
              <div align="left"> 
              	<eibsinput:text name="datarec" property="E01PFNOAM" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="<%=readOnly%>" />
              </div>
            </td>
          </tr>          

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" height="23"> 
              <div align="right">Valor de Cuota :</div>
            </td>
            <td nowrap width="60%"> 
              <div align="left"> 
              	<eibsinput:text name="datarec" property="E01PFNVCU" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" />
              </div>
            </td>
          </tr> 

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" height="23"> 
              <div align="right">Comision :</div>
            </td>
            <td nowrap width="60%"> 
              <div align="left"> 
              	<eibsinput:text name="datarec" property="E01PFNVCO" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" />
              </div>
            </td>
          </tr> 
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" height="23"> 
              <div align="right">Cuenta de Desembolso :</div>
            </td>
            <td nowrap width="60%"> 
              <div align="left"> 
              	<eibsinput:text name="datarec" property="E01PFNOBK" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK%>" readonly="true" />
              	<eibsinput:text name="datarec" property="E01PFNOBR" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BRANCH%>" readonly="true" />
              	<eibsinput:text name="datarec" property="E01PFNOCY" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY%>" readonly="true" />
              	<eibsinput:text name="datarec" property="E01PFNOGL" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_GLEDGER%>" readonly="true" />
              </div>
            </td>
          </tr>          
          
        </table>
      </td>
    </tr>
  </table>
  <div align="center">
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
    <input id="EIBSBTN" type="button" name="Cancel" value="Cancelar" onclick="javascript:cerrarVentana()">
  </div>
  </form>
<% if ("S".equals(request.getAttribute("ACT"))) { %>
<script type="text/javascript">
	window.opener.location.href =  '<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1130?SCREEN=100&E01PFNCUN=<%=userPO.getCusNum()%>&E01PFNNUM=<%=userPO.getPorfNum()%>';	   	   
	cerrarVentana();	  
</script>
<% } %>    
  
  
</body>
</html>
