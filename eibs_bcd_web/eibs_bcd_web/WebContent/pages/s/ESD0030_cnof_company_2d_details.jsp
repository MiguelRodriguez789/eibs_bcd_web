<%-- <html> 
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

<H3 align="center">C&oacute;digos de Referencia del Sistema <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cnof_company_2d_details.jsp, ESD0030"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0030" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
  <INPUT TYPE=HIDDEN NAME="E02CNOBNK" value="<%= currUser.getE01UBK()%>">
    <h4>Informaci&oacute;n B&aacute;sica</h4>
      <table  class="tableinfo">
        <tr bordercolor="#FFFFFF"> 
          <td nowrap> 
            <table cellspacing="0" cellpadding="2" width="100%" border="0">
              <tr id="trdark"> 
                <td nowrap width="20%"> 
                  <div align="right">Clasificaci&oacute;n :</div>
                </td>
                <td nowrap width="80%" height="19">    
                  <div align="left"> 
                    <input type="text" name="E02CNOCFL" size="3" maxlength="2" value="<%= refCodes.getE02CNOCFL().trim()%>">
                  </div>
                </td>
              </tr>
              <tr id="trclear"> 
                <td nowrap width="20%" height="19"> 
                  <div align="right">C&oacute;digo y Nombre de Compa&ntilde;&iacute;a:</div>
                </td>
                <td nowrap width="80%" height="19">    
                  <div align="left"> 
                    <input type="text" name="E02CNOMID" size="7" maxlength="6" value="<%= refCodes.getE02CNOMID().trim()%>">
                    <input type="text" name="E02CNODSC" size="36" maxlength="35" value="<%= refCodes.getE02CNODSC().trim()%>" >
                  </div>
                </td>
              </tr>
              <tr id="trdark"> 
                <td nowrap width="20%" height="19"> 
                  <div align="right">Nombre Largo de Compa&ntilde;&iacute;a:</div>
                </td>
                <td nowrap width="80%" height="19">    
                  <div align="left">
                    <input type="text" name="E02CNDNLR" size="75" maxlength="70" value="<%= refCodes.getE02CNDNLR().trim()%>" >
                  </div>
                </td>
              </tr>
              <tr id="trclear"> 
                <td nowrap width="20%" height="19"> 
                  <div align="right">Raz&oacute;n Social:</div>
                </td>
                <td nowrap width="80%" height="19">    
                  <div align="left">
                    <input type="text" name="E02CNDRZO" size="75" maxlength="70" value="<%= refCodes.getE02CNDRZO().trim()%>" >
                  </div>
                </td>
              </tr>
              <tr id="trdark"> 
                <td nowrap width="20%" height="19"> 
                  <div align="right">Nombre Comercial/Nombre &Oacute;rden Descuento:</div>
                </td>
                <td nowrap width="80%" height="19">    
                  <div align="left">
                    <input type="text" name="E02CNDNCO" size="75" maxlength="70" value="<%= refCodes.getE02CNDNCO().trim()%>" >
                  / <input type="text" name="E02CNOEML" size="45"
					maxlength="40" value="<%= refCodes.getE02CNOEML().trim()%>"></div>
                </td>
              </tr>
              <tr id="trclear"> 
                <td nowrap width="20%" height="19"> 
                  <div align="right">C&oacute;digo de Empresa de Cobro:</div>
                </td>
                <td nowrap width="80%" height="19">    
                  <div align="left"> 
                    <input type="text" name="E02CNDUC4" size="5" maxlength="4" value="<%= refCodes.getE02CNDUC4().trim()%>" >
                      <a href="javascript:GetCodeCNOFC('E02CNDUC4','2D')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="ayuda" align="absbottom" border="0"></a> 		
                ** Si no se especifica asume el mismo c&oacute;digo de compa&ntilde;&iacute;a
                  </div>
                </td>
              </tr>
              <tr id="trdark"> 
                <td nowrap width="20%" height="19"> 
                  <div align="right">Cuenta Contable Rechazos :</div>
                </td>
                <td nowrap width="80%" height="19"> 
                  <div align="left">
                    <input type="text" name="E02CNDGL1" size="17" maxlength="16" value="<%= refCodes.getE02CNDGL1().trim()%>" onkeypress="enterInteger()">
                      <a href="javascript:GetLedger('E02CNDGL1',document.forms[0].E02CNOBNK.value,'','')"> 
                        <img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0" >
                      </a>
                  </div>
                </td>
              </tr>
              <tr id="trclear"> 
                <td nowrap width="20%" height="19"> 
                  <div align="right">Cuenta Contable Servicio Descuento / Gasto:</div>
                </td>
                <td nowrap width="80%" height="19"> 
                  <div align="left"> 
                    <input type="text" name="E02CNDGL2" size="17" maxlength="16" value="<%= refCodes.getE02CNDGL2().trim()%>" onkeypress="enterInteger()">
                      <a href="javascript:GetLedger('E02CNDGL2',document.forms[0].E02CNOBNK.value,'','')"> 
                        <img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0" >
                      </a>
                  </div>
                </td>
              </tr>
              <tr id="trdark"> 
                <td nowrap width="20%" height="19"> 
              <div align="right">Cuenta Contable Cta.Transitoria:</div>
            </td>
            <td nowrap width="80%" height="19"> 
              <div align="left"> 
                <input type="text" name="E02CNDGL3" size="17" maxlength="16" value="<%= refCodes.getE02CNDGL3().trim()%>" onkeypress="enterInteger()">
                <a href="javascript:GetLedger('E02CNDGL3',document.forms[0].E02CNOBNK.value,'','')"> 
                  <img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0" >
                </a>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" height="19"> 
              <div align="right">C&oacute;digo de Moneda :</div>
            </td>
            <td nowrap width="80%" height="19"> 
              <div align="left"> 
                <input type="text" name="E02CNOSCY" size="4" maxlength="3" value="<%= refCodes.getE02CNOSCY().trim()%>"  >
                <a href="javascript:GetCurrency('E02CNOSCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="ayuda" align="absmiddle" border="0" ></a></div>
            </td>  
          </tr>      
          <tr id="trdark"> 
            <td nowrap width="20%" height="19"> 
              <div align="right">Tipo de Empresa :</div>
            </td>
            <td nowrap width="80%" height="19"> 
              <input type="text" name="E02CNOCPC" size="5" maxlength="4" value="<%= refCodes.getE02CNOCPC().trim()%>" readonly>
              <a href="javascript:GetCodeCNOFC('E02CNOCPC','T9')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="ayuda" align="absbottom" border="0"></a> 		
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" height="19"> 
              <div align="right">Porcentaje de Descuento :</div>
            </td>
            <td nowrap width="80%" height="19"> 
              <div align="left">
                <input type="text" name="E02CNOCST" size="8" maxlength="7" value="<%= refCodes.getE02CNOCST().trim()%>"  onkeypress="enterDecimal(3)">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%" height="19"> 
              <div align="right">Forma Pago Servicio Descuento:</div>
            </td>
            <td nowrap width="80%" height="19"> 
              <div align="left">
              <select name="E02CNOF01">
                <option value="1" <% if (refCodes.getE02CNOF01().equals("1")) out.print("selected"); %>> Un Solo Cobro Primer Descuento</option>
                <option value="2" <% if (refCodes.getE02CNOF01().equals("2")) out.print("selected");%>>Un Cobro En Cada Descuento</option>
                <option value="N" <% if (!refCodes.getE02CNOF01().equals("1") && !refCodes.getE02CNOF01().equals("2")) out.print("selected");%>>No Aplica</option>
              </select>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" height="19"> 
              <div align="right">Calificaci&oacute;n :</div>
            </td>
            <td nowrap width="80%" height="19"> 
              <div align="left">
                <input type="text" name="E02CNOMIC" size="4" maxlength="3" value="<%= refCodes.getE02CNOMIC().trim()%>"  readonly>
              <a href="javascript:GetCodeCNOFC('E02CNOMIC','T5')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="ayuda" align="absbottom" border="0"></a> 		
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%" height="19"> 
              <div align="right">Código de Area :</div>
            </td>
            <td nowrap width="80%" height="19"> 
              <div align="left">
                <input type="text" name="E02CNDUC1" size="5" maxlength="4" value="<%= refCodes.getE02CNDUC1().trim()%>"  readonly>
                <a href="javascript:GetCodeDescCNOFC('E02CNDUC1','E02CNDDS1','AR')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="ayuda" align="absbottom" border="0" ></a> 
                <input type="text" name="E02CNDDS1" size="40" maxlength="35" value="<%= refCodes.getE02CNDDS1().trim()%>" readonly>
              </div>
            </td>
          </tr> 
          <tr id="trclear"> 
            <td nowrap width="20%" height="19"> 
              <div align="right">Código de Ruta :</div>
            </td>
            <td nowrap width="80%" height="19"> 
              <div align="left">
                <input type="text" name="E02CNDUC2" size="5" maxlength="4" value="<%= refCodes.getE02CNDUC2().trim()%>"  readonly>
                <a href="javascript:GetCodeDescCNOFC('E02CNDUC2','E02CNDDS2','RC')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="ayuda" align="absbottom" border="0" ></a> 
                <input type="text" name="E02CNDDS2" size="40" maxlength="35" value="<%= refCodes.getE02CNDDS2().trim()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%" height="19"> 
              <div align="right">Tipo/Cliente :</div>
            </td>
            <td nowrap width="80%" height="19"> 
              <div align="left">
                <input type="text" name="E02CNDUC3" size="5" maxlength="4" value="<%= refCodes.getE02CNDUC3().trim()%>"  readonly>
                <a href="javascript:GetCodeDescCNOFC('E02CNDUC3','E02CNDDS3','CT')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="ayuda" align="absbottom" border="0" ></a> 
                <input type="text" name="E02CNDDS3" size="40" maxlength="35" value="<%= refCodes.getE02CNDDS3().trim()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" height="19"> 
              <div align="right">Dirección Empresa :</div>
            </td>
            <td nowrap width="80%" height="19"> 
              <div align="left">
                <input type="text" name="E02CNDDSC" size="125"
					maxlength="120" value="<%= refCodes.getE02CNODSC().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%" height="19"> 
              <div align="right">Teléfonos  :</div>
            </td>
            <td nowrap width="80%" height="19"> 
              <div align="left">
                <input type="text" name="E02CNOPHN" size="12" maxlength="11" value="<%= refCodes.getE02CNOPHN().trim()%>" onkeypress="enterInteger()" >
                <input type="text" name="E02CNOPH1" size="12" maxlength="11" value="<%= refCodes.getE02CNOPH1().trim()%>" onkeypress="enterInteger()" >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" height="19"> 
              <div align="right">Persona de Contacto:</div>
            </td>
            <td nowrap width="80%" height="19"> 
              <div align="left">
                <input type="text" name="E02CNDDS1" size="55"
					maxlength="50" value="<%= refCodes.getE02CNDDS1().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%" height="19"> 
              <div align="right">Pago :</div>
            </td>
            <td nowrap width="80%" height="19"> 
              <input type="radio" name="E02CNDFL1" value="Y" <% if (!refCodes.getE02CNDFL1().equals("N")) out.print("checked"); %>>Sí 
              <input type="radio" name="E02CNDFL1" value="N" <% if  (refCodes.getE02CNDFL1().equals("N")) out.print("checked"); %>>No
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" height="19"> 
              <div align="right">Observaciones :</div>
            </td>
            <td nowrap width="80%" height="19"> 
              <div align="left">
                <input type="text" name="E02CNDDS2" size="55"
					maxlength="50" value="<%= refCodes.getE02CNDDS2().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%" height="19"> 
              <div align="right"></div>
            </td>
            <td nowrap width="80%" height="19"> 
              <div align="left">
                <input type="text" name="E02CNDDS3" size="55"
					maxlength="50" value="<%= refCodes.getE02CNDDS3().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" height="19"> 
              <div align="right"></div>
            </td>
            <td nowrap width="80%" height="19"> 
              <div align="left">
                <input type="text" name="E02CNDDS4" size="55"
					maxlength="50" value="<%= refCodes.getE02CNDDS4().trim()%>">
              </div> 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%" height="19"> 
              <div align="right">Dias de Cobro 1/2/3 :</div>
            </td>
            <td nowrap width="80%" height="19"> 
              <div align="left">
                <input type="text" name="E02CNDNU1" size="4" maxlength="2" value="<%= refCodes.getE02CNDNU1().trim()%>"  onkeypress="enterInteger()">
                <input type="text" name="E02CNDNU2" size="4" maxlength="2" value="<%= refCodes.getE02CNDNU2().trim()%>"  onkeypress="enterInteger()">
                <input type="text" name="E02CNDNU3" size="4" maxlength="2" value="<%= refCodes.getE02CNDNU3().trim()%>"  onkeypress="enterInteger()">
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

 --%>