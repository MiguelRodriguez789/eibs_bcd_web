<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Money Launder Control</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="launder" class="datapro.eibs.beans.ELD051001Message" scope="session" />
<jsp:useBean id="error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" class= "datapro.eibs.beans.UserPos" scope="session" />

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

<H3 align="center">Tabla de Perfiles<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="profile_tables_detail, ELD0510"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSELD0510" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="400">
  <br>
  
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="38%"> 
              <div align="right">Tabla de Perfil :</div>
            </td>
            <td nowrap width="62%"> 
                 <eibsinput:text name="launder" property="E01LDPPRF" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_TABLE%>" readonly="true"/>
                 <eibsinput:text name="launder" property="E01LDPDSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" />
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Parametros Umbral de Excepciones</h4>
  
  <%int row = 0; %>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="40%"> 
              <div align="right">Variación en Número de Transacciones :</div>
            </td>
            <td nowrap width="60%"> 
              <div align="left"> 
                 <eibsinput:text name="launder" property="E01LDPVNT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="6" maxlength="5"  />
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="40%"> 
              <div align="right">Variación de Porciento en Montos :</div>
            </td>
            <td nowrap width="60%"> 
              <div align="left"> 
                 <eibsinput:text name="launder" property="E01LDPVAM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE%>" />
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="34%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="33%"> 
              <div align="center"><b>Corporaciones </b></div>
            </td>
            <td nowrap width="33%"> 
              <div align="center"><b>Individuales</b></div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="40%"> 
              <div align="right" >Límite Depósito Diario :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="center" > 
                  <eibsinput:text name="launder" property="E01LDPDDA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" />
              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="center" > 
                  <eibsinput:text name="launder" property="E01LDPDD1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" />
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="40%"> 
              <div align="right">Límite Depósito Semanal :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="center" > 
                  <eibsinput:text name="launder" property="E01LDPWDA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" />
              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="center" > 
                  <eibsinput:text name="launder" property="E01LDPWD1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" />
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="40%"> 
              <div align="right" >Límite Depósito Mensual :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="center" > 
                  <eibsinput:text name="launder" property="E01LDPMDA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" />
              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="center" > 
                  <eibsinput:text name="launder" property="E01LDPMD1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" />
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <H4>Cuentas Corrientes</H4>
<table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="34%"> 
              <div align="right"><b>Tipo Actividad</b></div>
            </td>
            <td nowrap width="33%"> 
              <div align="center"><b>Número</b></div>
            </td>
            <td nowrap width="33%"> 
              <div align="center"><b>Monto</b></div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="34%"> 
              <div align="right">Depósito Efectivo :</div>
            </td>
            <td nowrap width="33%"> 
              <div align="center"> 
                 <eibsinput:text name="launder" property="E01LDPCDP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="6" maxlength="5"  />
              </div>
            </td>
            <td nowrap width="33%"> 
              <div align="center"> 
                  <eibsinput:text name="launder" property="E01LDPCDA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" required="true"/>
             </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="34%"> 
              <div align="right">Depósitos Otros :</div>
            </td>
            <td nowrap width="33%"> 
              <div align="center"> 
                 <eibsinput:text name="launder" property="E01LDPKDP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="6" maxlength="5"  />
              </div>
            </td>
            <td nowrap width="33%"> 
              <div align="center"> 
                  <eibsinput:text name="launder" property="E01LDPKDA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" required="true" />
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="34%"> 
              <div align="right">Retiros Efectivo :</div>
            </td>
            <td nowrap width="33%"> 
              <div align="center"> 
                 <eibsinput:text name="launder" property="E01LDPCWD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="6" maxlength="5"  />
              </div>
            </td>
            <td nowrap width="33%"> 
              <div align="center"> 
                  <eibsinput:text name="launder" property="E01LDPCWA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" required="true"/>
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="34%"> 
              <div align="right">Pago de Cheques :</div>
            </td>
            <td nowrap width="33%"> 
              <div align="center"> 
                 <eibsinput:text name="launder" property="E01LDPCPY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="6" maxlength="5"  />
              </div>
            </td>
            <td nowrap width="33%"> 
              <div align="center"> 
                  <eibsinput:text name="launder" property="E01LDPCPA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" />&nbsp;&nbsp;&nbsp;&nbsp;
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="34%"> 
              <div align="right">Transferencias Emitidas :</div>
            </td>
            <td nowrap width="33%"> 
              <div align="center"> 
                 <eibsinput:text name="launder" property="E01LDPTIN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="6" maxlength="5"  />
              </div>
            </td>
            <td nowrap width="34%"> 
              <div align="center"> 
                  <eibsinput:text name="launder" property="E01LDPTIA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" />&nbsp;&nbsp;&nbsp;&nbsp;
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="34%"> 
              <div align="right">Transferencias Recibidas :</div>
            </td>
            <td nowrap width="33%"> 
              <div align="center"> 
                 <eibsinput:text name="launder" property="E01LDPTRV" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="6" maxlength="5"  />
              </div>
            </td>
            <td nowrap width="33%"> 
              <div align="center"> 
                  <eibsinput:text name="launder" property="E01LDPTRA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" />&nbsp;&nbsp;&nbsp;&nbsp;
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Cuentas de Contrato</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="34%"> 
              <div align="right"><b>Tipo Actividad</b></div>
            </td>
            <td nowrap width="33%"> 
              <div align="center"><b>Número</b></div>
            </td>
            <td nowrap width="33%"> 
              <div align="center"><b>Monto</b></div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="34%"> 
              <div align="right">Fuente de Fondos Efectivo :</div>
            </td>
            <td nowrap width="33%"> 
              <div align="center"> 
                 <eibsinput:text name="launder" property="E01LDPSCN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="6" maxlength="5"  />
              </div>
            </td>
            <td nowrap width="33%"> 
              <div align="center"> 
                  <eibsinput:text name="launder" property="E01LDPSCA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" />
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="34%"> 
              <div align="right">Fuente de Fondos Transferencia :</div>
            </td>
            <td nowrap width="33%"> 
              <div align="center"> 
                 <eibsinput:text name="launder" property="E01LDPSWN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="6" maxlength="5"  />
              </div>
            </td>
            <td nowrap width="33%"> 
              <div align="center"> 
                  <eibsinput:text name="launder" property="E01LDPSWA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" />
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="34%"> 
              <div align="right">Fuente de Fondos Cuenta Corriente :</div>
            </td>
            <td nowrap width="33%"> 
              <div align="center"> 
                 <eibsinput:text name="launder" property="E01LDPSDN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="6" maxlength="5"  />
              </div>
            </td>
            <td nowrap width="33%"> 
              <div align="center"> 
                  <eibsinput:text name="launder" property="E01LDPSDA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" />
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="34%"> 
              <div align="right">Fuente de Fondos Cheques Oficiales :</div>
            </td>
            <td nowrap width="33%"> 
              <div align="center"> 
                 <eibsinput:text name="launder" property="E01LDPSKN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="6" maxlength="5"  />
              </div>
            </td>
            <td nowrap width="33%"> 
              <div align="center"> 
                  <eibsinput:text name="launder" property="E01LDPSKA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" />
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="34%"> 
              <div align="right">Desembolso de Fondos Efectivo :</div>
            </td>
            <td nowrap width="33%"> 
              <div align="center"> 
                 <eibsinput:text name="launder" property="E01LDPBCN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="6" maxlength="5"  />
              </div>
            </td>
            <td nowrap width="33%"> 
              <div align="center"> 
                  <eibsinput:text name="launder" property="E01LDPBCA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" />
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="34%"> 
              <div align="right">Desembolso de Fondos Transferencias :</div>
            </td>
            <td nowrap width="33%"> 
              <div align="center"> 
                 <eibsinput:text name="launder" property="E01LDPBWN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="6" maxlength="5"  />
              </div>
            </td>
            <td nowrap width="33%"> 
              <div align="center"> 
                  <eibsinput:text name="launder" property="E01LDPBWA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" />
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="34%"> 
              <div align="right">Desembolso de Fondos Cuenta Corriente :</div>
            </td>
            <td nowrap width="33%"> 
              <div align="center"> 
                 <eibsinput:text name="launder" property="E01LDPBDN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="6" maxlength="5"  />
              </div>
            </td>
            <td nowrap width="33%"> 
              <div align="center"> 
                  <eibsinput:text name="launder" property="E01LDPBDA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" />
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="34%"> 
              <div align="right">Desembolso de Fondos Cheques Oficiales :</div>
            </td>
            <td nowrap width="33%"> 
              <div align="center"> 
                 <eibsinput:text name="launder" property="E01LDPBKN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="6" maxlength="5"  />
              </div>
            </td>
            <td nowrap width="33%"> 
              <div align="center"> 
                  <eibsinput:text name="launder" property="E01LDPBKA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" />
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <H4>Saldos</H4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="40%"> 
              <div align="right">Promedio Libros :</div>
            </td>
            <td nowrap width="60%"> 
                  <eibsinput:text name="launder" property="E01LDPGAV" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" required="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="40%"> 
              <div align="right">Promedio Neto :</div>
            </td>
            <td nowrap width="60%"> 
                  <eibsinput:text name="launder" property="E01LDPNAV" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" required="true"/>
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
