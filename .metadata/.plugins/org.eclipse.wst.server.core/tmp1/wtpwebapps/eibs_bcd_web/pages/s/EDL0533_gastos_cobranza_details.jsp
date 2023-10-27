<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Tablas de Condonaciones</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="conDetails" class="datapro.eibs.beans.EDL053301Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<%
	boolean readOnly=false;
	boolean maintenance=false;
%> 
          
<%
	// Determina si es solo lectura
	if (userPO.getPurpose().equals("NEW")){
			readOnly=false;
		} else {
			readOnly=true;
		}
%>
<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
%>


<H3 align="center"><% if (userPO.getPurpose().equals("NEW")) out.print("Crear "); else if (userPO.getPurpose().equals("DELETE")) out.print("Eliminar  ");else out.print("Mantencion "); %>Tabla Gastos Cobranza<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="center" name="EIBS_GIF" ALT="gastos_cobranza_detail.jsp, EDL0522"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0533" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Banco :</b></div>
            </td>
            <td width="30%" <%=readOnly?"disabled":""%>> 
               <input type="text"  name="E01GCTBNK" size="3" maxlength="2" align="center" value="<%= conDetails.getE01GCTBNK() %>" > 
            </td>
            </tr>
         <tr id="trclear">
            <td nowrap width="16%" > 
              <div align="right"><b>Moneda :</b></div>
            </td>
	  	<td <%=readOnly?"disabled":""%>>
	  	   <input type="text" name="E01GCTCCY" size="4" maxlength="3" value="<%= conDetails.getE01GCTCCY() %>" >
	  	   <a href="javascript:GetCurrency('E01GCTCCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0"  ></a>         
        </td>          
          </tr>
         <tr id="trdark">
            <td nowrap width="16%" > 
              <div align="right"><b>Dias Mora :</b></div>
            </td>
            <td width="30%" <%=readOnly?"disabled":""%>> 
               <input type="text"  name="E01GCTDID" size="4" maxlength="3" align="center" value="<%= conDetails.getE01GCTDID() %>" >
            </td>              
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>  
   <h4>Tramos</h4>
  <table  class="tableinfo" style="width: 100%;" align="center">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
         <tr id="trclear">
            <td nowrap width="16%" > 
              <div align="center"><b>Monto Hasta </b></div>
            </td>
            <td nowrap width="16%" > 
              <div align="left"><b>Porcentaje </b></div>
            </td>                       
          </tr>
          <tr id="trclear"> 
             <td nowrap width="50%"align="center">
	  			<eibsinput:text name="conDetails" property="E01GCTMO1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
             </td>
            <td nowrap width="50%"align="left">
	  			<eibsinput:text name="conDetails" property="E01GCTPO1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  />
             </td>          	 		
          </tr>
          <tr id="trdark"> 
             <td nowrap width="50%"align="center">
	  			<eibsinput:text name="conDetails" property="E01GCTMO2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
             </td>
            <td nowrap width="50%"align="left" >
	  			<eibsinput:text name="conDetails" property="E01GCTPO2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" />
             </td>          	 		
          </tr>  
          <tr id="trclear"> 
             <td nowrap width="50%"align="center" >
	  			<eibsinput:text name="conDetails" property="E01GCTMO3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
             </td>
            <td nowrap width="50%"align="left" >
	  			<eibsinput:text name="conDetails" property="E01GCTPO3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" />
             </td>          	 		
          </tr>  
          <tr id="trdark"> 
             <td nowrap width="50%"align="center" >
	  			<eibsinput:text name="conDetails" property="E01GCTMO4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>"  />
             </td>
            <td nowrap width="50%"align="left" >
	  			<eibsinput:text name="conDetails" property="E01GCTPO4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  />
             </td>          	 		
          </tr>   
          <tr id="trclear"> 
             <td nowrap width="50%"align="center" >
	  			<eibsinput:text name="conDetails" property="E01GCTMO5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>"  />
             </td>
            <td nowrap width="50%"align="left" >
	  			<eibsinput:text name="conDetails" property="E01GCTPO5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" />
             </td>          	 		
          </tr>
          <tr id="trdark"> 
             <td nowrap width="50%"align="center" >
	  			<eibsinput:text name="conDetails" property="E01GCTMO6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>"  />
             </td>
            <td nowrap width="50%"align="left" >
	  			<eibsinput:text name="conDetails" property="E01GCTPO6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" />
             </td>          	 		
          </tr>  
          <tr id="trclear"> 
             <td nowrap width="50%"align="center" >
	  			<eibsinput:text name="conDetails" property="E01GCTMO7" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>"  />
             </td>
            <td nowrap width="50%"align="left" >
	  			<eibsinput:text name="conDetails" property="E01GCTPO7" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" />
             </td>          	 		
          </tr>  
          <tr id="trdark"> 
             <td nowrap width="50%"align="center" >
	  			<eibsinput:text name="conDetails" property="E01GCTMO8" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
             </td>
            <td nowrap width="50%"align="left" >
	  			<eibsinput:text name="conDetails" property="E01GCTPO8" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" />
             </td> 
             </tr>                                  
        </table>
      </td>
    </tr>
  </table>
  <br>
  <p><br>
  </p>
  <div align="center"> 
            <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
          </div>
  </form>
  
  <% if(userPO.getPurpose().equals("DELETE")) {%>
  	<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"> </script>
  <% } %>
</body>
</html>
