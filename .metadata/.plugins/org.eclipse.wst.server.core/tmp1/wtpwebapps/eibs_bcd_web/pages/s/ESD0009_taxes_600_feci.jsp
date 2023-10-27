<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>


<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Retenciones</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="taxes" class="datapro.eibs.beans.ESD000901Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

</head>
<body>

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
%>


<H3 align="center">Mantenimiento de Retenciones e Impuestos <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="taxes_600_feci.jsp, ESD0009"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0009" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" ID="SCREEN"  VALUE="600">
   
  <h4>Informaci&oacute;n B&aacute;sica</h4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Banco :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <eibsinput:text name="taxes" property="E01TAXBNK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" readonly="true"/>
             </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%" height="23"> 
              <div align="right">C&oacute;digo de Impuesto :</div>
            </td>
            <td nowrap height="23"> 
              <div align="left"> 
                <eibsinput:text name="taxes" property="E01TAXTTP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
                  <eibsinput:text
               			name="taxes" property="E01TAXDSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>          
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%" height="19"> 
              <div align="right">Porcentaje de Impuestos :</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <eibsinput:text name="taxes" property="E01TAXPRC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" />
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%" height="19"> 
              <div align="right">Cuenta Contable F.E.C.I para Sobregiros:</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                 <eibsinput:help name="taxes" property="E01TAXGL1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER%>" required="false"
          	    	fn_param_one="E01TAXGL1" fn_param_two="<%= taxes.getE01TAXBNK() %>" ></eibsinput:help>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%" height="19"> 
              <div align="right">Cuenta Contable F.E.C.I para Préstamos:</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                 <eibsinput:help name="taxes" property="E01TAXGL2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER%>" required="false"
          	    	fn_param_one="E01TAXGL2" fn_param_two="<%= taxes.getE01TAXBNK() %>" />
           		</div>
           </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%" height="19"> 
              <div align="right">Cuenta Contable F.E.C.I Tarjetas Visa :</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                 <eibsinput:help name="taxes" property="E01TAXGLA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER%>" required="false"
          	    	fn_param_one="E01TAXGLA" fn_param_two="<%= taxes.getE01TAXBNK() %>" />
       	    	</div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%" height="19"> 
              <div align="right">Cuenta Contable F.E.C.I Master Card 
                :</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <eibsinput:help name="taxes" property="E01TAXGLB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER%>" required="false"
          	    	fn_param_one="E01TAXGLB" fn_param_two="<%= taxes.getE01TAXBNK() %>" />
           	  </div>
           </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%" height="19"> 
              <div align="right">Cuenta Contable F.E.C.I Adicional 1 :</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <eibsinput:help name="taxes" property="E01TAXGLC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER%>" required="false"
          	    	fn_param_one="E01TAXGLC" fn_param_two="<%= taxes.getE01TAXBNK() %>" />
           	  </div>
           </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%" height="19"> 
              <div align="right">Cuenta Contable F.E.C.I Adicional 2 :</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
               <eibsinput:help name="taxes" property="E01TAXGLD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER%>" required="false"
          	    	fn_param_one="E01TAXGLD" fn_param_two="<%= taxes.getE01TAXBNK() %>" />
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%" height="19"> 
              <div align="right">Cuenta Contable F.E.C.I Adicional 3 :</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
               <eibsinput:help name="taxes" property="E01TAXGLE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER%>" required="false"
          	    	fn_param_one="E01TAXGLE" fn_param_two="<%= taxes.getE01TAXBNK() %>" />
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%" height="19"> 
              <div align="right">Cuenta Contable F.E.C.I Adicional 4 :</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
               <eibsinput:help name="taxes" property="E01TAXGLC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER%>" required="false"
          	    	fn_param_one="E01TAXGLC" fn_param_two="<%= taxes.getE01TAXBNK() %>" />
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%" height="19"> 
              <div align="right">Cuenta Contable F.E.C.I Adicional 5 :</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
               <eibsinput:help name="taxes" property="E01TAXGCC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER%>" required="false"
          	    	fn_param_one="E01TAXGCC" fn_param_two="<%= taxes.getE01TAXBNK() %>" />
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%" height="19"> 
              <div align="right">Cuenta Contable F.E.C.I Adicional 6 :</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
               <eibsinput:help name="taxes" property="E01TAXGCD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER%>" required="false"
          	    	fn_param_one="E01TAXGCD" fn_param_two="<%= taxes.getE01TAXBNK() %>" />
              </div>
            </td>
          </tr>

<%--
          <tr id="trclear"> 
            <td nowrap width="30%" height="19"> 
              <div align="right">Monto del L&iacute;mite Superior :</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <input type="text" name="E01TAXUPL" size="17" maxlength="15" value="<%= taxes.getE01TAXUPL().trim()%>"  >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%" height="19"> 
              <div align="right">Monto del L&iacute;mite Inferior :</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <input type="text" name="E01TAXLLM" size="17" maxlength="15" value="<%= taxes.getE01TAXLLM().trim()%>"  >
              </div>
            </td>
          </tr>
--%>
        </table>
      </td>
    </tr>
  </table>
  
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td width="33%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="33%"> 
        <div align="center"> 
          <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
        </div>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td> 
        <div align="center"> </div>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
