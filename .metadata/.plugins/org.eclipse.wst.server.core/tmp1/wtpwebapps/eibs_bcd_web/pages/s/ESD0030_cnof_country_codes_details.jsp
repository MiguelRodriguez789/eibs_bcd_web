<html>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields"%>


<head>
<title>Codigos de Referencia</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="refCodes" class="datapro.eibs.beans.ESD003002Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
builtHPopUp();

function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
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


<H3 align="center">C&oacute;digos de Referencia del Sistema - C&oacute;digos de 
  Pa&iacute;ses<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cnof_country_codes_details.jsp, ESD0030"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0030" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
   <INPUT TYPE=HIDDEN NAME="E02CNOBNK" value="<%= currUser.getE01UBK()%>">
  <h4>Informaci&oacute;n B&aacute;sica</h4>
  
  <%int row = 0; %>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%"> 
              <div align="right">Clasificaci&oacute;n :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E02CNOCFL" size="3" maxlength="2" value="<%= refCodes.getE02CNOCFL().trim()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="23"> 
              <div align="right">C&oacute;digo :</div>
            </td>
            <td nowrap height="23"> 
              <div align="left"> 
                <input type="text" name="E02CNORCD" size="6" maxlength="4" value="<%= refCodes.getE02CNORCD().trim()%>" >
              </div>
            </td>
          </tr>
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="23"> 
              <div align="right">Descripci&oacute;n :</div>
            </td>
            <td nowrap height="23"> 
              <div align="left"> 
                <input type="text" name="E02CNODSC" size="50" maxlength="45" value="<%= refCodes.getE02CNODSC().trim()%>" >
              </div>
            </td>
          </tr>
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="19"> 
              <div align="right">Pa&iacute;s de la Instituci&oacute;n :</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <input type="radio" name="E02CNOF03" value="Y" <%if (refCodes.getE02CNOF03().equals("Y")) out.print("checked"); %>>
                S&iacute; 
                <input type="radio" name="E02CNOF03" value="N" <%if (refCodes.getE02CNOF03().equals("N")) out.print("checked"); %>>
                No</div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="19"> 
              <div align="right">Tasa ISR Extranjeros :</div>
            </td>
            <td nowrap height="19"> 
           		<eibsinput:text name="refCodes" property="E02CNOCST" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="19"> 
              <div align="right">Pa&iacute;s Miembro del Comit&eacute; de Basilea 
                :</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <input type="radio" name="E02CNOF04" value="Y" <%if (refCodes.getE02CNOF04().equals("N")) out.print("checked"); %>>
                S&iacute; 
                <input type="radio" name="E02CNOF04" value="N" <%if (refCodes.getE02CNOF04().equals("N")) out.print("checked"); %>>
                No </div>
            </td>
          </tr>
                    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="19"> 
              <div align="right">Pa&iacute;s con Convenio FATCA :</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <input type="radio" name="E02CNOF05" value="Y" <%if (refCodes.getE02CNOF05().equals("Y")) out.print("checked"); %>>
                S&iacute; 
                <input type="radio" name="E02CNOF05" value="N" <%if (!refCodes.getE02CNOF05().equals("Y")) out.print("checked"); %>>
                No </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="19"> 
              <div align="right">Pa&iacute;s con Convenio CRS :</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <input type="radio" name="E02CNOF06" value="Y" <%if (refCodes.getE02CNOF06().equals("Y")) out.print("checked"); %>>
                S&iacute; 
                <input type="radio" name="E02CNOF06" value="N" <%if (!refCodes.getE02CNOF06().equals("Y")) out.print("checked"); %>>
                No </div>
            </td>
          </tr>
         
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="19"> 
              <div align="right">Pa&iacute;s de Riesgo :</div>
           <td nowrap height="19"> 
              <div align="left"> 
                <input type="radio" name="E02CNOF06" value="Y" <%if (refCodes.getE02CNOF06().equals("Y")) out.print("checked"); %>>
                S&iacute; 
                <input type="radio" name="E02CNOF06" value="N" <%if (!refCodes.getE02CNOF06().equals("Y")) out.print("checked"); %>>
                No </div>
            </td>
          </tr>
         
         
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="19"> 
              <div align="right">C&oacute;digo de Pa&iacute;s AFIP :</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <input type="text" name="E02CNOSCG" size="17" maxlength="16" value="<%= refCodes.getE02CNOSCG().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="19"> 
              <div align="right">C&oacute;digo Reporte FED BL1/BC1 :</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <input type="text" name="E02CNOFRP" size="6" maxlength="5" value="<%= refCodes.getE02CNOFRP().trim()%>" >
                *</div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap height="19"> 
              <div align="right">(*) Ejemplo (Forma BL1/BC) : </div>
            </td>
            <td nowrap height="19">EUROPA</td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap height="19"> 
              <div align="right"></div>
              <div align="right">Austria :</div>
            </td>
            <td nowrap height="19">1018-9 (Entre 10189)</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
    <h4>Códigos Equivalentes</h4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right">Formato Direcciones :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E02CNOACD" size="3" maxlength="2" value="<%= refCodes.getE02CNOACD().trim()%>">
				<a href="javascript:GetCode('E02CNOACD','STATIC_par_country.jsp')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="bottom" border="0"></a> 
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="16%"> 
              <div align="right">Código ISO Númerico: </div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E02CNOPXT" size="4" maxlength="3" value="<%= refCodes.getE02CNOPXT().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right">Código ISO alfa-3: </div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E02CNOSCY" size="4" maxlength="3" value="<%= refCodes.getE02CNOSCY().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="16%"> 
              <div align="right">Código ISO alfa-2: </div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E02CNOAPC" size="3" maxlength="2" value="<%= refCodes.getE02CNOAPC().trim()%>">
              </div>
            </td>
          </tr>          
    	 </table>
  		</td>
	</tr>
  </table>
  <div align="center">
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>
  </form>
</body>
</html>
