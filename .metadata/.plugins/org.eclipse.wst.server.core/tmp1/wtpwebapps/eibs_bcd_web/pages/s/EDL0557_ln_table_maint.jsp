<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%> 
<%@page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Tabla de Excepciones Ingreso de Creditos</title>
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id="lnParam" class="datapro.eibs.beans.EDL055701Message" scope="session" />
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
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }       
%>

<h3 align="center">Tabla de Excepciones Ingreso de Creditos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_table_maint.jsp,EDL0557"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0557" >
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
              <input type="text" name="E01APCCCY" size="3" maxlength="3" value="<%= lnParam.getE01EXITYP()%>" readonly="false"> 
             </td>
            <td nowrap width="10%" align=left><% if (lnParam.getField("E01EXITYP").getString().equals("02")) {
												out.print(Util.formatCell("Producto"));
											} else if (lnParam.getField("E01EXITYP").getString().equals("01")) {
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
         <% if( "02".equals( userPO.getHeader1() ) ){ %> 
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="20%"><div align="right">Codigo de Producto :</div></td>
            <td nowrap width="30%"> 
              <eibsinput:text name="lnParam" property="E01EXIPRO" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/>
            </td>
            <td nowrap width="20%"></td>
            <td nowrap width="30%"></td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="20%"><div align="right">Descripcion Producto :</div></td>
            <td nowrap width="30%"> 
              <eibsinput:text name="lnParam" property="E01EXIDSC" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" required="false"/>
            </td>
            <td nowrap width="20%"></td>
            <td nowrap width="30%"></td>
          </tr>
          <% } else if( "01".equals( userPO.getHeader1() ) ){ %> 
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="20%"><div align="right">Codigo de Cliente :</div></td>
            <td nowrap width="30%"> 
              <eibsinput:text name="lnParam" property="E01EXICUN" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
            </td>
            <td nowrap width="20%"></td>
            <td nowrap width="30%"></td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="20%"><div align="right">Nombre del Cliente :</div></td>
            <td nowrap width="30%"> 
              <eibsinput:text name="lnParam" property="E01EXIDSC" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" required="false"/>
            </td>
            <td nowrap width="20%"></td>
            <td nowrap width="30%"></td>
          </tr>
           <% } else if( "03".equals( userPO.getHeader1() ) ){ %> 
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="20%"><div align="right">Numero de Cuenta :</div></td>
            <td nowrap width="30%"> 
              <eibsinput:text name="lnParam" property="E01EXIACC" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true"/>
            </td>
            <td nowrap width="20%"></td>
            <td nowrap width="30%"></td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="20%"><div align="right">Nombre del Cliente :</div></td>
            <td nowrap width="30%"> 
              <eibsinput:text name="lnParam" property="E01EXIDSC" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" required="false"/>
            </td>
            <td nowrap width="20%"></td>
            <td nowrap width="30%"></td>
          </tr>
                
          <% } %>
           
           <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="20%"><div align="right">Monto :</div></td>
            <td nowrap width="30%"> 
              <eibsinput:text name="lnParam" property="E01EXIMIN" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" required="false"/> Minimo
              <eibsinput:text name="lnParam" property="E01EXIMAX" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" required="false"/> Maximo
            </td>
            <td nowrap width="20%"></td>
            <td nowrap width="30%"></td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="20%"><div align="right">Plazo en Meses :</div></td>
            <td nowrap width="30%"> 
            <%--
            	<select name="E01DEATRC" id="E01DEATRC" >
	              <OPTION value=" " <% if (!(lnParam.getE01EXITRC().equals("D") ||lnParam.getE01EXITRC().equals("M")||lnParam.getE01EXITRC().equals("Y"))) out.print("selected"); %>></OPTION>
	              <OPTION value="D" <% if(lnParam.getE01EXITRC().equals("D")) out.print("selected");%>>D&iacute;a(s)</OPTION>
	              <OPTION value="M" <% if(lnParam.getE01EXITRC().equals("M")) out.print("selected");%>>Mes(es)</OPTION>
	              <OPTION value="Y" <% if(lnParam.getE01EXITRC().equals("Y")) out.print("selected");%>>A&ntilde;o(s)</OPTION>
              	</select>
              	--%>
              <eibsinput:text name="lnParam" property="E01EXITRM" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DAYS %>" required="false"/> Minimo
              <eibsinput:text name="lnParam" property="E01EXITRX" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DAYS %>" required="false"/> Maximo
            </td>
            <td nowrap width="20%"></td>
            <td nowrap width="30%"></td>
          </tr>
            <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="20%"><div align="right">M&aacute;ximo D&iacute;as de gracia :</div></td>
            <td nowrap width="30%"> 
              <eibsinput:text name="lnParam" property="E01EXIDMX" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DAYS %>" required="false"/>
            </td>
            <td nowrap width="20%"></td>
            <td nowrap width="30%"></td> 
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
