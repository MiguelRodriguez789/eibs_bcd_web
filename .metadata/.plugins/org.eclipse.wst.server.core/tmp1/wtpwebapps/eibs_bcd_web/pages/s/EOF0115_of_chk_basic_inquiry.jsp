<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Emisión de Cheques</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "offBasic" class= "datapro.eibs.beans.EOF011501Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

<%	if(userPO.getPurpose().equals("APPROVAL") ||
		userPO.getPurpose().equals("APPROVAL_INQ")) { %>	
		builtNewMenu(of_a_opt);
<%	} else { %>
		builtNewMenu(of_np_opt);
<%	} %>

	initMenu();

</SCRIPT>

</head>


<body >
<% 
 if ( !error.getERRNUM().equals("0")  ) {
 	  error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%> 
 
<H3 align="center">Emisi&oacute;n de Cheques de Gerencia
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="of_chk_basic_inquiry.jsp, EOF0115"> 
</H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEOF0115">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  
  
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Formato :</b></div>
            </td>
            <td nowrap width="7%" > 
              <div align="left">
	     	       <eibsinput:text 	name="offBasic" property="E01OFMFTY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CODE %>" readonly="true"/>
	     	       <eibsinput:text 	name="offBasic" property="E01OFMDSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
              </div>
            </td>
            <td nowrap colspan="3" width="77%" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2">
                </font></font></font></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
 <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="26%"> 
              <div align="right">Cheque No. :</div>
            </td>
            <td nowrap width="27%">
 
       	       <eibsinput:text 	name="offBasic" property="E01OFMCKN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHECK_NUMBER %>" readonly="true"/>
           </td>
            <td nowrap width="24%"> 
              <div align="right">Fecha :</div>
            </td>
            <td nowrap width="23%"> 
				<eibsinput:date name="offBasic" fn_day="E01OFMEMD" fn_month="E01OFMEMM" fn_year="E01OFMEMY" readonly="true"/>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="26%"> 
              <div align="right">Banco / Sucursal : </div>
            </td>
            <td nowrap>
       	       <eibsinput:text 	name="offBasic" property="E01OFMBNK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" readonly="true"/>
              / 
       	       <eibsinput:text 	name="offBasic" property="E01OFMBRN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>" readonly="true"/>
            </td>
            <td nowrap>
              <div align="right">Moneda : </div>
            </td>
            <td nowrap>
       	       <eibsinput:text 	name="offBasic" property="E01OFMCCY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true"/>
           </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="26%" height="19"> 
              <div align="right">Clase de Cheque :</div>
            </td>
            <td nowrap height="19"> 
              <input type="text" name="E01OFMCLS" size="2" maxlength="1" value="<%= offBasic.getE01OFMCLS().trim()%>" readonly>
            </td>
            <td nowrap width="26%" height="19"> 
            </td>
            <td nowrap width="28%" height="19"> 

             </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="26%"> 
              <div align="right">Pagar a la Orden de :</div>
            </td>
			<td nowrap colspan="3">
       	       <eibsinput:text 	name="offBasic" property="E01OFMBNF" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true"/>
       	      <BR>
       	       <eibsinput:text 	name="offBasic" property="E01OFMBN1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
       	      <Br>
       	       <eibsinput:text 	name="offBasic" property="E01OFMBN2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true"/>
			
 			</td>
			</tr>
          <tr id="trdark"> 
            <td nowrap width="26%" height="23"> 
              <div align="right">Identificación :</div>
            </td>
            <td nowrap height="23" colspan="3">
            <eibsinput:cnofc name="offBasic" flag="34" property="E01OFMTIB" fn_description="" required="false" readonly="true"/>
            <eibsinput:text	name="offBasic" property="E01OFMBID" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION%>" readonly="true"/>
         </tr>
          <tr id="trclear"> 
            <td nowrap width="26%" height="19"> 
              <div align="right">La suma de :</div>
            </td>
            <td nowrap height="19" colspan="3"> 
            <eibsinput:text	name="offBasic" property="E01OFMAMT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true"/>
             </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="26%" height="19"> 
              <div align="right">Origen/Destino :</div>
            </td>
            <td nowrap height="19" colspan="3">
              <eibsinput:text property="D01OFMCTY" name="offBasic" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true" />
            </td>
          </tr>          
        </table>
      </td>
    </tr>
  </table>

  <h4>Datos de la Transacci&oacute;n</h4>
<table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark">  
            <td nowrap width="19%"> 
              <div align="right">Identificaci&oacute;n del Aplicante :</div>
            </td>
            <td nowrap width="22%">
            <eibsinput:text	name="offBasic" property="E01OFMAID" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION%>" readonly="true"/>

            </td>
            <td nowrap width="18%"> 
              <div align="right">Cliente :</div>
            </td>
            <td nowrap width="41%"> 
	            <eibsinput:text	name="offBasic" property="E01OFMCUN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER%>" readonly="true"/>
             </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="19%"> 
              <div align="right">Nombre del Aplicante :</div>
            </td>
            <td nowrap colspan="3">
            <eibsinput:text	name="offBasic" property="E01OFMAPL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true"/>
         </td>
          </tr>
		  <tr id="trdark"> 
            <td nowrap width="19%"> 
              <div align="right"> </div>
            </td>
            <td nowrap colspan="3"> 
            <eibsinput:text	name="offBasic" property="E01OFMAP1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true"/>
           </td>
          </tr>
          <tr id="trcleark"> 
            <td nowrap width="19%"> 
              <div align="right">Descripcion :</div>
            </td>
            <td nowrap colspan="3"> 
           <eibsinput:text	name="offBasic" property="E01OFMCO1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true"/>
           </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="19%"> 
              <div align="right">Direcci&oacute;n :</div>
            </td>
            <td nowrap colspan="3">
           <eibsinput:text	name="offBasic" property="E01OFMAD1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true"/>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="19%"> 
              <div align="right"></div>
            </td>
            <td nowrap colspan="3">
           <eibsinput:text	name="offBasic" property="E01OFMAD2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true"/>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="19%"> 
              <div align="right"></div>
            </td>
            <td nowrap colspan="3">
           <eibsinput:text	name="offBasic" property="E01OFMAD3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true"/>
            </td>
          </tr>
          <tr id="trclear"> 
            	<td nowrap> 
              		<div align="right">Cuenta de Pago :</div>
            	</td>	  
          	  <td nowrap colspan="3"> 
          	  <table class="tableinfo" style="filter:''">
          		<tr id="trdark"> 
            		<td width="31%"> 
              		<div align="center">Concepto</div>
            		</td>
            		<td width="5%"> 
              		<div align="center">Banco</div>
            		</td>
            		<td width="13%" > 
              		<div align="center">Sucursal</div>
            		</td>
            		<td width="12%" > 
              		<div align="center">Moneda</div>
            		</td>
            		<td width="21%" > 
              		<div align="center">Referencia</div>
            		</td>
          		</tr>
          		<tr id="trclear"> 
            		<td width="31%" > 
              		<div align="center"> 
                		<input type=text name="E01DEBOPC" id="E01DEBOPC" value="<%= offBasic.getE01DEBOPC().trim()%>" size="3" maxlength="3" readonly>
                		<input type=HIDDEN name="E01DEBGLN" value="<%= offBasic.getE01DEBGLN().trim()%>" readonly>
                		<input type="text" name="E01DEBCON" size="25" maxlength="25" readonly value="<%= offBasic.getE01DEBCON().trim()%>" readonly>
              		</div>
            		</td>
            		<td width="5%" > 
              		<div align="center"> 
                		<input type="text" name="E01DEBBNK" size="2" maxlength="2" value="<%= offBasic.getE01DEBBNK().trim()%>" readonly>
              		</div>
            		</td>
            		<td width="13%"> 
              		<div align="center"> 
                		<input type="text" name="E01DEBBRN" size="4" maxlength="4" value="<%= offBasic.getE01DEBBRN().trim()%>" readonly>
              		</div>
            		</td>
            		<td width="12%" > 
              		<div align="center">
                		<input type="text" name="E01DEBCCY" size="3" maxlength="3" value="<%= offBasic.getE01DEBCCY().trim()%>" readonly> 
              		</div>
            		</td>
            		<td width="21%" > 
              		<div align="center"> 
                		<input type="text" name="E01DEBACC" size="14" maxlength="12" value="<%= offBasic.getE01DEBACC().trim()%>" readonly>
              		 </div>
            		</td>
          		</tr>
        	</table>
        	</td>
           </tr>
        </table>
        
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <p align="center">
  	<input id="EIBSBTN" type="button" name="Close" value="Cerrar" onclick="checkClose()">
  </p>

</form>

</body>
</html>
