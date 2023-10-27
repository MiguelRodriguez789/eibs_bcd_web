<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Tabla de Excepciones GAC</title>
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id="lnParam" class="datapro.eibs.beans.EDL054601Message" scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/jquery.jsp"> </script>
<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"> </script>

<SCRIPT type="text/javascript">
function cerrarVentana(){
	window.open('','_parent','');
	window.close(); 
}
</SCRIPT>

<%
  boolean readOnly = false;
  // Determina si es solo lectura
  if (request.getParameter("readOnly") != null) {
    if (request.getParameter("readOnly").toLowerCase().equals("true")) {
      readOnly = true;
    } else {
      readOnly = false;
    }
  }
%>

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

<h3 align="center">Tabla de Excepciones GAC<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_table_maint.jsp,EDL0546"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0546" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="200">
  <INPUT TYPE=HIDDEN NAME="H01FLGMAS" >
  
  <%int row = 0; %>
  <table class="tableinfo" >
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
         
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
             <td nowrap width="20%" align=right><b>Tipo :&nbsp;</b></td>
             <td nowrap width="5%">
              <input type="text" name="E01APCCCY" size="3" maxlength="3" value="<%= lnParam.getE01EXCTYP()%>" readonly="false"> 
             </td>
            <td nowrap width="10%" align=left><% if (lnParam.getField("E01EXCTYP").getString().equals("01")) {
                        out.print(Util.formatCell("Producto"));
                      } else if (lnParam.getField("E01EXCTYP").getString().equals("02")) {
                        out.print(Util.formatCell("Cliente"));
                      } else  {out.print(Util.formatCell("Cuenta"));
                      }%> </td>
            <td nowrap width="30%">
              
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
         <% if( "01".equals( userPO.getType() ) ){ %> 
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="20%"><div align="right">Codigo de Producto :</div></td>
            <td nowrap width="30%"> 
              <eibsinput:text name="lnParam" property="E01EXCPRO" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/>
            </td>
            <td nowrap width="20%"></td>
            <td nowrap width="30%"></td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="20%"><div align="right">Descripcion Producto :</div></td>
            <td nowrap width="30%"> 
              <eibsinput:text name="lnParam" property="E01EXCDSC" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" required="false"/>
            </td>
            <td nowrap width="20%"></td>
            <td nowrap width="30%"></td>
          </tr>
          <% } else if( "02".equals( userPO.getType() ) ){ %> 
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="20%"><div align="right">Codigo de Cliente :</div></td>
            <td nowrap width="30%"> 
              <eibsinput:text name="lnParam" property="E01EXCCUN" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
            </td>
            <td nowrap width="20%"></td>
            <td nowrap width="30%"></td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="20%"><div align="right">Nombre del Cliente :</div></td>
            <td nowrap width="30%"> 
              <eibsinput:text name="lnParam" property="E01EXCDSC" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" required="false"/>
            </td>
            <td nowrap width="20%"></td>
            <td nowrap width="30%"></td>
          </tr>
          <% } else if( "03".equals( userPO.getType() ) ){ %> 
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="20%"><div align="right">Codigo de Cuenta :</div></td>
            <td nowrap width="30%"> 
              <eibsinput:text name="lnParam" property="E01EXCACC" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true"/>
            </td>
            <td nowrap width="20%"></td>
            <td nowrap width="30%"></td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="20%"><div align="right">Nombre de la Cuenta :</div></td>
            <td nowrap width="30%"> 
              <eibsinput:text name="lnParam" property="E01EXCDSC" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" required="false"/>
            </td>
            <td nowrap width="20%"></td>
            <td nowrap width="30%"></td>
          </tr>
         
          <% } %>
           
            <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="20%"><div align="right">Porcentaje aplicar :</div></td>
            <td nowrap width="30%"> 
              <eibsinput:text name="lnParam" property="E01EXCPOR" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" required="false" readonly="<%=readOnly%>"/>
            </td>
            <td nowrap width="20%"></td>
            <td nowrap width="30%"></td>
          </tr>
           <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="20%"><div align="right">Fecha de Vigencia :</div></td>
            <td nowrap width="30%"> 
              <eibsinput:date name="lnParam" fn_month="E01EXCMAM" fn_day="E01EXCMAD" fn_year="E01EXCMAY" required="true" readonly="<%=readOnly%>"/> 
              
            </td>
            <td nowrap width="20%"></td>
            <td nowrap width="30%"></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>


  <% if (!readOnly) { %>
  <p align="center"> 
    <input id="EIBSBTN" type="submit" name="Submit" value="Enviar">
  </p>
  <% } else { %>
  <div align="center"> 
    <input id="EIBSBTN" type=button name="Cancel" value="Cancelar" onclick="javascript:cerrarVentana();">
  </div>     
  <% } %>

</form>

<script type="text/javascript">
</script>

</body>
</html>
