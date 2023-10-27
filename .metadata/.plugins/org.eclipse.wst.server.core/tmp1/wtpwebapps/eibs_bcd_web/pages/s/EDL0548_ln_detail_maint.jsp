<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Reserva Contraparte</title>
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id="recData" class="datapro.eibs.beans.EDL054802Message" scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/jquery.jsp"> </script>
<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"> </script>

<SCRIPT type="text/javascript">


</SCRIPT>

</head>
<body>

<% 
 
 boolean readOnly = false;
 
 if (recData.getE02CTLOBS().equals("APROBADO")) {
   readOnly = true;
 }
 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }       
%>

<h3 align="center">Reserva Contraparte<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_detail_maint.jsp,EDL0548"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0548" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="205">
  <INPUT TYPE=HIDDEN NAME="H01FLGMAS" >
  
  <%int row = 0; %>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="25%"><div align="right"><b>Convenio :</b> </div></td>
            <td nowrap width="25%"> 
              <div align="left"> 
                <eibsinput:text name="recData" property="E02CTPCNV" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true" />
                <eibsinput:text name="recData" property="E02DSCCNV" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true" />
            </td>
              </div>
            <td nowrap width="25%"></td>
            <td nowrap width="25%"></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%"><div align="right"><b>Proyecto :</b> </div></td>
            <td nowrap width="25%"> 
              <div align="left"> 
                <eibsinput:text name="recData" property="E02CTLNUM" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true" />
                <eibsinput:text name="recData" property="E02CTPDSC" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true" />
              </div>
            </td>
            <td nowrap width="25%"><div align="right"></div></td>
            <td nowrap width="25%"><div align="left"> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table> 
  
  <H4>Datos B&aacute;sicos</H4>
  <table  class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="25%"><div align="right">Numero Reserva :&nbsp;</div></td>
            <td nowrap width="25%"> 
              <eibsinput:text name="recData" property="E02CTLSEQ" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true" />
            </td>
            <td nowrap width="25%"></td>
            <td nowrap width="25%"></td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="25%"><div align="right">Cliente Reserva :&nbsp;</div></td>
            <td nowrap width="25%"> 
              <eibsinput:text name="recData" property="E02CTLCUN" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>"  readonly="<%=readOnly%>" />
              <a href="javascript:GetCustomer('E02CTLCUR')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0" ></a>
            </td>
            <td nowrap width="25%"></td>
            <td nowrap width="25%"></td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="25%"><div align="right">Referencia :&nbsp;</div></td>
            <td nowrap width="25%"> 
              <eibsinput:text name="recData" property="E02CTLREF" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_REFERENCE %>" readonly="<%=readOnly%>" />
            </td>
            <td nowrap width="25%"></td>
            <td nowrap width="25%"></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <h4>Informaci&oacute;n </h4>
  <table class="tableinfo" >
    <tr>
      <td>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="25%"><div align="right">Monto Aprobado :</div></td>
            <td width="25%">
              <eibsinput:text name="recData" property="E02CTLAPV" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
            </td>
            <td width="25%"></td>
            <td width="25%">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="25%"><div align="right">Monto a Reservar :</div></td>
            <td width="25%">
              <eibsinput:text name="recData" property="E02CTLRSV" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="<%=readOnly%>" />
            </td>
            <td width="25%"></td>
            <td width="25%">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="25%"><div align="right">Fecha de Reserva :</div></td>
            <td width="25%">
              <eibsinput:date name="recData" fn_year="E02CTLOPY" fn_month="E02CTLOPM" fn_day="E02CTLOPD" readonly="true" />
            </td>
            <td width="25%"><div align="right"></div></td>
            <td width="25%">  
              
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <p align="center"> 
    <input id="EIBSBTN" type="submit" name="Submit" value="Enviar">
  </p>

</form>

<script type="text/javascript">
</script>

</body>
</html>
