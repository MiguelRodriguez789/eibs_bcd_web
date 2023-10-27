<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Tabla de Credito Milagroso</title>
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id="lnParam" class="datapro.eibs.beans.EDL054701Message" scope="session" />
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

<h3 align="center">Tabla de Credito Milagroso<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_table_new.jsp,EDL0547"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0547" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="100">
  <INPUT TYPE=HIDDEN NAME="H01FLGMAS" >
  <INPUT TYPE=HIDDEN NAME="E01CMLCON" VALUE="<%= lnParam.getE01CMLCON().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01CMLBRN" VALUE="<%= lnParam.getE01CMLBRN().trim()%>">
  <%int row = 0; %>
  <table class="tableinfo" >
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
         
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
             <td nowrap width="20%" align=right><b>Condicion :&nbsp;</b></td>
            <td nowrap width="30%">                
            	  <SELECT name="E01CMLCONX" disabled>
						<OPTION value="C" <%if (lnParam.getE01CMLCON().equals("C")) { out.print("selected"); }%>>Consumo </OPTION>
						<OPTION value="L" <%if (lnParam.getE01CMLCON().equals("L")) { out.print("selected"); }%>>Comercial </OPTION>
						<OPTION value="H" <%if (lnParam.getE01CMLCON().equals("H")) { out.print("selected"); }%>>Vivienda </OPTION>
						<OPTION value="M" <%if (lnParam.getE01CMLCON().equals("M")) { out.print("selected"); }%>>Microcredito </OPTION>
						
					</SELECT>
            </td>
            <td nowrap width="20%" align=right><b>Agencia :&nbsp;</b>
            </td>
            <td nowrap width="30%">
                   	   <input type="text" readonly name="E01CMLBRNX" size="4" maxlength="4" value="<%= lnParam.getE01CMLBRN().trim()%>"   >
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
          
            <td nowrap width="25%" > 
              <div align="center"><b>Rango Tasa Inicial </b></div>
            </td>
            <td nowrap width="25%" > 
              <div align="center"><b>Rango Tasa Final </b></div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"><b>Porcentaje de Ahorro </b></div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"><b>Tasa Efectiva(Beneficio) </b></div>
            </td>                        
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
             <td nowrap width="25%"align="center">
	  			<eibsinput:text name="lnParam" property="E01CMLRTI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
             </td>
             <td nowrap width="25%"align="center">
	  			<eibsinput:text name="lnParam" property="E01CMLRTF" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
             </td>
            <td nowrap width="25%"align="left">
	  			<eibsinput:text name="lnParam" property="E01CMLPR1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  />
             </td>
              <td nowrap width="25%"align="center">
	  			<eibsinput:text name="lnParam" property="E01CMLRT1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
             </td>          	 		
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
             <td nowrap width="25%"align="center">
	  			
             </td>
             <td nowrap width="25%"align="center">
	  			
             </td>
            <td nowrap width="25%"align="left">
	  			<eibsinput:text name="lnParam" property="E01CMLPR2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  />
             </td>
              <td nowrap width="25%"align="center">
	  			<eibsinput:text name="lnParam" property="E01CMLRT2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
             </td>          	 		
          </tr>
           <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
             <td nowrap width="25%"align="center">
	  			
             </td>
             <td nowrap width="25%"align="center">
	  			
             </td>
            <td nowrap width="25%"align="left">
	  			<eibsinput:text name="lnParam" property="E01CMLPR3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  />
             </td>
              <td nowrap width="25%"align="center">
	  			<eibsinput:text name="lnParam" property="E01CMLRT3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
             </td>          	 		
          </tr>
          </tr>
           <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
             <td nowrap width="25%"align="center">
	  			
             </td>
             <td nowrap width="25%"align="center">
	  			
             </td>
            <td nowrap width="25%"align="left">
	  			<eibsinput:text name="lnParam" property="E01CMLPR4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  />
             </td>
              <td nowrap width="25%"align="center">
	  			<eibsinput:text name="lnParam" property="E01CMLRT4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
             </td>          	 		
          </tr>
          </tr>
           <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
             <td nowrap width="25%"align="center">
	  			
             </td>
             <td nowrap width="25%"align="center">
	  			
             </td>
            <td nowrap width="25%"align="left">
	  			<eibsinput:text name="lnParam" property="E01CMLPR5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  />
             </td>
              <td nowrap width="25%"align="center">
	  			<eibsinput:text name="lnParam" property="E01CMLRT5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
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
