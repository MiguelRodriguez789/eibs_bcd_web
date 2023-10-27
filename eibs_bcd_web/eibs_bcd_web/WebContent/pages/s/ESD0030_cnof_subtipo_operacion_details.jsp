<html>
<head>
<title>Códigos de Referencia</title>
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


<H3 align="center">C&oacute;digos de Referencia del Sistema  - Sub-Tipo de Operación Propuesta de Credito<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cnof_subtipo_operacion_details.jsp, ESD0030"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0030" id="form1" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
  <INPUT TYPE=HIDDEN NAME="E02CNOBNK" value="<%= currUser.getE01UBK()%>">
  <INPUT TYPE=HIDDEN NAME="DUMMY" value="<%= currUser.getE01UBK()%>">
   
   
   
  <h4>Informaci&oacute;n B&aacute;sica</h4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trclear"> 
            <td nowrap width="16%"> 
              <div align="right">Clasificaci&oacute;n :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E02CNOCFL" size="3" maxlength="2" value="<%= refCodes.getE02CNOCFL().trim()%>" readonly="readonly">
              </div>
            </td>
          </tr>

          <tr id="trdark" >
            <td nowrap width="16%" height="23"> 
              <div align="right">Tipo de Operación :</div>
            </td>

            <td nowrap height="23"> 
              <div align="left"> 
                <input type="text" name="E02CNOMID" size="5" maxlength="4" value="<%= refCodes.getE02CNOMID().trim()%>" >
                <input type="hidden" name="PROVDSC" size="37" maxlength="35" value=""  readonly="readonly">
			    <a href="javascript:GetCodeDescCNOFC('E02CNOMID','PROVDSC','P8')" >
			    <img src="<%=request.getContextPath()%>/images/1b.gif" alt="ayuda" align="bottom" border="0"></a> 
              </div>
            </td>
          </tr>
          
          <tr id="trclear" >
            <td nowrap width="16%" height="23"> 
              <div align="right">Sub-Tipo de Operación :</div>
            </td>

            <td nowrap height="23"> 
              <div align="left"> 
                <input type="text" name="E02CNORCD" size="5" maxlength="4" value="<%= refCodes.getE02CNORCD().trim()%>" >
                <input type="text" name="E02CNODSC" size="37" maxlength="35" value="<%= refCodes.getE02CNODSC().trim()%>" >
			    <a href="javascript:Get2FilterCodes('E02CNORCD','E02CNODSC','P7', document.getElementById('E02CNOMID').value,' ')" >
			    <img src="<%=request.getContextPath()%>/images/1b.gif" alt="ayuda" align="bottom" border="0"></a> 
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%" height="19"> 
              <div align="right">Tipo de Operaci&oacute;n a Realizar :</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <select name="E02CNOF04">
                  <option value=" " <%if (refCodes.getE02CNOF04().equals(" ")) { out.print("selected"); }%>></option>
                  <option value="1" <%if (refCodes.getE02CNOF04().equals("1")) { out.print("selected"); }%>>Apertura</option>
                  <option value="2" <%if (refCodes.getE02CNOF04().equals("2")) { out.print("selected"); }%>>Modificaci&oacute;n</option>
                  <option value="3" <%if (refCodes.getE02CNOF04().equals("3")) { out.print("selected"); }%>>Cancelaci&oacute;n</option>
                  <option value="4" <%if (refCodes.getE02CNOF04().equals("4")) { out.print("selected"); }%>>Adelanto</option>
                  <option value="5" <%if (refCodes.getE02CNOF04().equals("5")) { out.print("selected"); }%>>Revisi&oacute;n</option>	
                  <option value="6" <%if (refCodes.getE02CNOF04().equals("6")) { out.print("selected"); }%>>Refinanciaci&oacute;n</option>
                  <option value="7" <%if (refCodes.getE02CNOF04().equals("7")) { out.print("selected"); }%>>Pr&oacute;rroga/Restructuraci&oacute;n</option>
                  <option value="8" <%if (refCodes.getE02CNOF04().equals("8")) { out.print("selected"); }%>>Arreglo de Pagos</option>
                  <option value="9" <%if (refCodes.getE02CNOF04().equals("9")) { out.print("selected"); }%>>Aprobada(o) no Desembolsada(o)</option>
                  <option value="0" <%if (refCodes.getE02CNOF04().equals("0")) { out.print("selected"); }%>>Revisi&oacute;n de Pagaré</option>	
                </select>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%" height="19"> 
              <div align="right">Acumula para Determinar Nivel de Aprobaci&oacute;n :</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <select name="E02CNOF03">
                  <option value=" " <%if (refCodes.getE02CNOF03().equals(" ")) { out.print("selected"); }%>></option>
                  <option value="1" <%if (refCodes.getE02CNOF03().equals("1")) { out.print("selected"); }%>>Si</option>
                  <option value="0" <%if (refCodes.getE02CNOF03().equals("0")) { out.print("selected"); }%>>No</option>
                  <option value="2" <%if (refCodes.getE02CNOF03().equals("2")) { out.print("selected"); }%>>Cancelaci&oacute;n (-1)</option>
                  <option value="3" <%if (refCodes.getE02CNOF03().equals("3")) { out.print("selected"); }%>>Calcular Variaci&oacute;n</option>
                </select>
              </div>
            </td>
          </tr>

         <tr id="trclear"> 
            <td nowrap width="16%" height="19"> 
              <div align="right">N&uacute;mero de Referencia :</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <input type="text" name="E02CNOSCG" size="17" maxlength="16" value="<%= refCodes.getE02CNOSCG().trim()%>">
              </div>
            </td>
          </tr>
        </table>
      </td>  
    </tr>
  </table>
  <div align="center">
    <input id="EIBSBTN" type="submit" name="Submit" value="Enviar" >
  </div>
  </form>
  
<SCRIPT type="text/javascript" >


</SCRIPT>
  
</body>
</html>
