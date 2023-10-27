<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields" %>

<html>
<head>
<title>Documentarias</title>
<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "bolgaran" class= "datapro.eibs.beans.ELC500001Message"  scope="session" /> 
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
  <%if (userPO.getPurpose().equals("MAINTENANCE")){%>

   builtNewMenu('bg_b_opt');
   initMenu();
   			
  <%}%>
  
   function enviar(n){
   		document.forms[0].SCREEN.value = n;
   		document.forms[0].submit();
   }



	</script>

</head>
<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }    
 %> 

<h3 align="center">Bloqueo/Desbloqueo de Documentarias<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="bg_block.jsp,ELC5000"></h3>
<hr size="4">
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.bolgaran.JSELC5000">
  <input type="hidden" name="SCREEN" value="15"> 
  
  <%int row = 0; %>
  <table class="tableinfo">
    <tr>
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="15%"><div align="right">Cuenta : </div></td>
            <td nowrap width="35%">
              <input size="15" type="text" name="E01LCMACC" value="<%= bolgaran.getE01LCMACC().trim()%>" readonly>       
            </td>
            <td nowrap width="15%"><div align="right">Banco/Sucursal : </div></td>
            <td nowrap width="35%">
              <input  type="text" size="3" maxlength="2" value="<%= bolgaran.getE01LCMBNK().trim()%>" name="E01LCMBNK" readonly>
              <input type="text" name="E01LCMBRN" size="5" maxlength="4" value="<%= bolgaran.getE01LCMBRN().trim()%>" readonly>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td align=right width="15%">Producto : </td>
            <td width="35%">
              <input size="5" type="text" name="E01LCMPRO" readonly value="<%= bolgaran.getE01LCMPRO()%>" >
              <input size="40" type="text" name="E01PRDNME" readonly value="<%= bolgaran.getE01PRDNME()%>">
            </td>
            <td align=right width="15%">Moneda : </td>
            <td width="35%"><input size="5" type="text" name="E01LCMCCY" readonly value="<%= bolgaran.getE01LCMCCY()%>"></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td align=right width="15%">Fecha Emisión : </td>
            <td width="35%">
              <eibsinput:date name="bolgaran" fn_year="E01LCMIDY" fn_month="E01LCMIDM" fn_day="E01LCMIDD" readonly="True" />
            </td>
            <td align=right width="15%">Fecha Valor : </td>
            <td width="35%">  
              <eibsinput:date name="bolgaran" fn_year="E01FECVAY" fn_month="E01FECVAM" fn_day="E01FECVAD"  readonly="True"/>
            </td>
          </tr>    
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td align=right width="15%">T&eacute;rmino : </td>
            <td width="35%" >
              <input size="5" type="text" name="E01TRMNUM" maxlength="4" value="<%=bolgaran.getE01TRMNUM()%>" readonly>
              <SELECT name="E01TRMFLG" disabled>
                <option value=" " <% if (!(bolgaran.getE01TRMFLG().equals("D") || bolgaran.getE01TRMFLG().equals("M")||bolgaran.getE01TRMFLG().equals("Y"))) out.print("selected"); %>></option>
                <option value="D" <% if(bolgaran.getE01TRMFLG().equals("D")) out.print("selected");%>>D&iacute;a(s)</option>
                <option value="M" <% if(bolgaran.getE01TRMFLG().equals("M")) out.print("selected");%>>Mes(es)</option>
                <option value="Y" <% if(bolgaran.getE01TRMFLG().equals("Y")) out.print("selected");%>>A&ntilde;o(s)</option>
              </SELECT>
            </td>
            <td align=right width="15%">Fecha Vencimiento : </td>
            <td nowrap>
              <eibsinput:date name="bolgaran" fn_year="E01LCMEXY" fn_month="E01LCMEXM" fn_day="E01LCMEXD" readonly="True"/>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <h4>Por Orden</h4>
  <table class=tableinfo>
    <tr>
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id=trdark>
            <td align=right width="15%">N&uacute;mero : </td>
            <td width="35%"> 
              <input size="15" type="text" name="E01LCMCUN" maxlength="10" value="<%=bolgaran.getE01LCMCUN()%>" readonly>
            </td>
            <td align=right width="15%">Identificaci&oacute;n : </td>
            <td width="35%"> 
              <input size="28" type="text" name="E01APLRUT" maxlength="25" value="<%=bolgaran.getE01APLRUT()%>" readonly>
            </td>
          </tr>
          <tr id=trclear>
            <td align=right width="15%">Nombre : </td>
            <td  colspan=3> 
              <input size="50" type="text" name="E01APLNME" maxlength="45" value="<%=bolgaran.getE01APLNME()%>" readonly> 
            </td>                      
          </tr>
          <tr id=trdark>
            <td align=right width="15%">Cta. Corriente : </td>
            <td width="35%">           
              <input type="text" name="E01LCMAPA" size="12" maxlength="12"  value="<%= bolgaran.getE01LCMAPA().trim()%>" readonly>
            </td>
            <td width="15%"> 
              <div align="right" >Linea de Cr&eacute;dito : </div>
            </td>
            <td width="35%"> 
              <input type="text" name="E01LCMLNR" size="10" maxlength="9" value="<%= bolgaran.getE01LCMLNR().trim()%>" readonly>
              <input type="text" name="E01LCMCMN" size="5" maxlength="4" value="<%= bolgaran.getE01LCMCMN().trim()%>" readonly>
            </td>                       
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <h4>Datos Por Cuenta de</h4>
  <table class=tableinfo>
    <tr>
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id=trdark>
            <td align=right width="15%">Identificaci&oacute;n : </td>
            <td> 
              <input size="15" type="text" name="E01LCMCBC" maxlength="10" value="<%=bolgaran.getE01LCMCBC()%>" readonly>
            </td>
          </tr>
          <tr id=trclear>
            <td align=right width="15%">Nombre : </td>
            <td colspan=3> 
              <input size="45" type="text" name="E01LCMCA1" maxlength="45" value="<%=bolgaran.getE01LCMCA1()%>" readonly> 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <h4>Datos Beneficiario</h4>
  <table class=tableinfo>
    <tr>
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id=trdark>
            <td align=right width="15%">N&uacute;mero : </td>
            <td width="35%"> 
              <input size="15" type="text" name="E01LCMBCU" maxlength="10" value="<%=bolgaran.getE01LCMBCU()%>" readonly>
            </td>
            <td align=right width="15%">Identificaci&oacute;n : </td>
            <td width="35%"> 
              <input size="28" type="text" name="E01BNFRUT" maxlength="10" value="<%=bolgaran.getE01BNFRUT()%>" readonly>
            </td>
          </tr>
          <tr id=trclear>
            <td align=right width="15%">Nombre : </td>
            <td colspan=3> 
              <input size="45" type="text" name="E01BNFNME" maxlength="45" value="<%=bolgaran.getE01BNFNME()%>" readonly> 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>  

  <h4>Datos Emisión</h4>
  <table class=tableinfo>
    <tr>
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
         <tr id=trdark>
           <td align=right width="15%">Monto Origen : </td>
           <td><INPUT type="text" name="E01LCMOAM" maxlength="15" size="16"  value="<%=bolgaran.getE01LCMOAM()%>" readonly> </td>
           <td align=right width="15%"></td>
           <td></td>
         </tr>
         <tr id=trclear>
           <td align=right width="15%">Saldo Documento : </td>
           <!-- 
           <td><INPUT type="text" name="E01LCMC10" maxlength="15" size="16" value="<%=bolgaran.getE01LCMC10()%>" readonly> </td>
            -->
            <td><INPUT type="text" name="E01PRIAMN" maxlength="15" size="16" value="<%=bolgaran.getE01PRIAMN()%>" readonly> </td>
           <td align=right width="15%"></td>
           <td></td>
         </tr>
         <tr id=trdark>
           <td align=right width="15%">Saldo Comision : </td>
           <!-- 
           <td><INPUT type="text" name="E01LCMC11"  maxlength="15" size="16" value="<%=bolgaran.getE01LCMC11()%>" readonly></td>
            -->
            <td><INPUT type="text" name="E01COMAMN"  maxlength="15" size="16" value="<%=bolgaran.getE01COMAMN()%>" readonly></td>
           <td align=right width="15%"></td>
           <td></td>
         </tr>
         <!--          
         <tr id=trclear>
           <td align=right width="15%">Timbres : </td>
           <td><INPUT type="text" name="E01LCMAM1"  maxlength="15" size="16" value="<%=bolgaran.getE01LCMAM1()%>" readonly></td>
           <td align=right width="15%"></td>
           <td></td>
         </tr>
          -->
       </table>
     </td>
    </tr>
  </table>

  <% if (userPO.getPurpose().equals("MAINTENANCE")){%>
  <H4>Tipo de Operaci&oacute;n</H4>
  <TABLE class="tableinfo">
    <TBODY>
      <TR>
        <TD nowrap><TABLE cellspacing="0" cellpadding="2" width="100%" border="0"
        class="tbhead">
            <TBODY>
              <TR id="trdark0">
                <TD nowrap width="15%"align="right">Bloqueo/Desbloqueo: </TD>
                <TD nowrap width="20%" align="left"><SELECT name="E01LCMCRF">
                  <OPTION value=""> </OPTION>
                  <OPTION value="Y" <% if(bolgaran.getE01LCMCRF().equals("Y")) out.print("selected");%>>Bloqueo</OPTION>
                  <OPTION value="N" <% if(bolgaran.getE01LCMCRF().equals("N")) out.print("selected");%>>Desbloqueo</OPTION>
                </SELECT></TD>
                <TD nowrap width="15%"align="right">Motivo: </TD>
                <TD nowrap width="50%" align="left">
               <eibsinput:cnofc name="bolgaran" flag="BK" property="E01LCMUC6" fn_description="D01LCMUC6"  required="true"/>
               <eibsinput:text name="bolgaran" property="D01LCMUC6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
               </td>
              </TR>
            </TBODY>
        </TABLE></TD>
      </TR>
    </TBODY>
  </TABLE>
  <% } %>
 
  <P align="center"><INPUT type="button" value="enviar" id="EIBSBTN" onClick="enviar(15)"></P>
	
</FORM>
</BODY>
</html>
