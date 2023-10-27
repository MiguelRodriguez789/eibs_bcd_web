<html>
<head>
<title>Commercial Paper</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="cdRenov" class="datapro.eibs.beans.EDL010508Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

   builtNewMenu(cp_a_opt);


</SCRIPT>


<body >
<% 
 if ( !error.getERRNUM().equals("0")  ) {
	 error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }
	 
	 
     out.println("<SCRIPT> initMenu();  </SCRIPT>");
%> 
<h3 align="center">Intrucciones de Pago  (Renovaci�n)<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cp_ap_renov_options,EDL0105"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0105" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="8">
  <INPUT TYPE=HIDDEN NAME="E08DEABNK" VALUE="<%= cdRenov.getE08DEABNK().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E08DEACCY" VALUE="<%= cdRenov.getE08DEACCY().trim()%>">
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>No. Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" onkeypress="enterInteger(event)" name="E08DEACUN" size="10" maxlength="9" readonly value="<%= userPO.getCusNum().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" onkeypress="enterInteger(event)" name="E08CUSNA1" size="45" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text"  name="E08DEAACC" size="13" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E08DEAPRO" size="4" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Instrucciones de Pago (Renovaci�n)</h4>
  <table class="tableinfo">
    <tr > 
      <td>
        <table cellpadding=2 cellspacing=0 align=center width=100% bordercolor="#000000">
          <tr id="trdark"> 
            <td width=39 height="46"><b><b> </b><b><b><b> 
              <input disabled type="radio" name="E08DEAROC" value="D" 
			  <%if (cdRenov.getE08DEAROC().equals("D")) out.print("checked");%>>
              </b></b></b>D</b></td>
            <td height="46" colspan="2" > Opci�n de Cancelaci�n. Principal e Intereses ser�n pagados a una Cuenta Contable. <input type="hidden" name="E08DDDFLV" value=""></td>
          </tr>
          <tr id="trclear"> 
            <td width=39></td>
            <td colspan="2" >&nbsp;</td>
          </tr>
          <tr id="trdark"> 
            <td width=39 height="36"><b><b> </b><b> 
              <input disabled type="radio" name="E08DEAROC" value="E" 
			  <%if (cdRenov.getE08DEAROC().equals("E")) out.print("checked");%>>
              </b>E</b></td>
            <td height="36" colspan="2" >Opci�n de Cancelaci�n. Principal e Intereses ser�n pagados a una Cuenta de Detalle (Corriente, Ahorros, etc.). </td>
          </tr>
          <tr id="trclear"> 
            <td width=39></td>
            <td colspan="2" >&nbsp;</td>
          </tr>
          <tr id="trdark"> 
            <td width=39><b><b> </b><b> 
              <input disabled type="radio" name="E08DEAROC" value="H" 
			  <%if (cdRenov.getE08DEAROC().equals("H")) out.print("checked");%>>
              </b>H</b></td>
            <td colspan="2" > 
              <p>Inter�s ser� pagado en  
                <input type="text" readonly name="E08HHHROY" size="3" maxlength="3" value="<%= cdRenov.getE08HHHROY().trim()%>">
                <select disabled name="E08HHHODA">
                  <option value="" <% if (!(cdRenov.getE08HHHODA().equals("D") || cdRenov.getE08HHHODA().equals("M")||
                cdRenov.getE08HHHODA().equals("Q")||cdRenov.getE08HHHODA().equals("S")))out.print("selected"); %>> 
                  </option>
                  <option value="D" <% if (cdRenov.getE08HHHODA().equals("D")){out.print("selected");} %>>Dias</option>
                  <option value="M" <% if (cdRenov.getE08HHHODA().equals("M")){out.print("selected");} %>>Mensualmente</option>
                  <option value="Q" <% if (cdRenov.getE08HHHODA().equals("Q")){out.print("selected");} %>>Trimestralmente</option>
                  <option value="S" <% if (cdRenov.getE08HHHODA().equals("S")){out.print("selected");} %>>Semestralmente</option>
                </select>
                a una<input type="hidden" name="E08HHHFLG" value=""> Cuenta de Detalle (Corriente, Ahorros, etc.) , o a
                un Certificado. El principal ser� renovado por el mismo periodo de tiempo.</p>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width=39></td>
            <td colspan="2" >&nbsp;</td>
          </tr>
          <tr id="trdark"> 
            <td width=39><b><b> </b><b> 
              <input type="radio" name="E08DEAROC" value="I" 
			  <%if (cdRenov.getE08DEAROC().equals("I")) out.print("checked");%>>
              </b>I</b></td>
            <td colspan="2" > Inter�s ser� pagado en   
              <input type="text" readonly name="E08IIIROY" size="3" maxlength="3" value="<%= cdRenov.getE08IIIROY().trim()%>">
              <select disabled name="E08IIIODA">
                <option value="" <% if (!(cdRenov.getE08IIIODA().equals("D") || cdRenov.getE08IIIODA().equals("M")||
                cdRenov.getE08IIIODA().equals("Q")||cdRenov.getE08IIIODA().equals("S")))out.print("selected"); %>> 
                </option>
                <option value="D" <% if (cdRenov.getE08IIIODA().equals("D")){out.print("selected");} %>>Days</option>
                <option value="M" <% if (cdRenov.getE08IIIODA().equals("M")){out.print("selected");} %>>Mensualmente</option>
                <option value="Q" <% if (cdRenov.getE08IIIODA().equals("Q")){out.print("selected");} %>>Trimestralmente</option>
                <option value="S" <% if (cdRenov.getE08IIIODA().equals("S")){out.print("selected");} %>>Semestralmente</option>
              </select>
              a una Cuenta Contable. El principal ser� renovado por el mismo periodo de tiempo.</td>
          </tr>
          <tr id="trclear"> 
            <td width=39></td>
            <td colspan="2" >&nbsp;</td>
          </tr>
          <tr id="trdark"> 
            <td width=39><b><b> </b><b> 
              <input disabled id="typeS" type="radio" name="E08DEAROC" value="S" 
			  <%if (cdRenov.getE08DEAROC().equals("S")) out.print("checked");%>>
              </b>S</b></td>
            <td colspan="2" >El Principal e Inter�s ser� pagado basado en una cronograma de pago  <a href="javascript:document.forms[0].typeS.click();showCDPayMaint()"><img src="<%=request.getContextPath()%>/images/eibs_deducciones.gif" title="Payment Plan" align="middle" border="0" ></a> 
              , y ser� pagado a una Cuenta Contable o a una Cuenta de Detalle. </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
   </form>
</body>
</html>
