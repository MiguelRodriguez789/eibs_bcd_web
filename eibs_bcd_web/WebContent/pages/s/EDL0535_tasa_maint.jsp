<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Tasa Maxima Permitida Maint </title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id="data" class="datapro.eibs.beans.EDL053502Message" scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>


<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"> </script>



<script type="text/javascript">

function goAction(op) {
	getElement("SCREEN").value = op;
	document.forms[0].submit();	
}

function cerrarVentana(){
//	window.open('','_parent','');
	window.opener.location.href = '<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0535?SCREEN=300';	   	   
	window.close(); 
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

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0535">
<input type="hidden" id="SCREEN" name="SCREEN" value="400">
<INPUT TYPE="hidden" NAME="H02FLGMAS" value="A">
	
	<h3 align="center">Tasa Maxima Permitida
		<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="tasa_maint.jsp,EDL0535"> 
	</h3> 
    <hr size="4">

  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trclear"> 
            <td align=CENTER > 
              <div align="right">Fecha :&nbsp;</div>
            </td>
            <td align=CENTER > 
              <div align="left"> 
                <eibsinput:date name="data" fn_month="E02MRTPDM" fn_day="E02MRTPDD" fn_year="E02MRTPDY"/>
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td align=CENTER > 
              <div align="right">Tasa Max. Interes :&nbsp;</div>

            </td>
            <td align=CENTER > 
              <div align="left"> 
                <eibsinput:text name="data" property="E02MRTTMI" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td align=CENTER > 
              <div align="right">Tasa Max. Mora :&nbsp;</div>
            </td>
            <td align=CENTER > 
              <div align="left"> 
                <eibsinput:text name="data" property="E02MRTTMM" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" />
                <select name="E02MRTTTA" >
                  <option value="%" <% if (!(data.getE02MRTTTA().equals("S") || data.getE02MRTTTA().equals("M") )) out.print("selected"); %> >Aplica s&oacute;lo el Porcentaje</OPTION>
                  <option value="S" <% if (data.getE02MRTTTA().equals("S")) out.print("selected");%> >Suma el Porcentaje al Inter&eacute;s</OPTION>
                  <option value="M" <% if (data.getE02MRTTTA().equals("M")) out.print("selected");%> >Multiplica el Porcentaje al Inter&eacute;s</OPTION>
                </select>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <div align="center">
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar" >
  </div>
</form>
</body>
<% if ("S".equals(request.getAttribute("ACT"))) { %>
<script type="text/javascript">
	window.opener.location.href = '<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0535?SCREEN=300';	   	   
	window.open('','_parent','');
	cerrarVentana();
</script>
<% } %>  
</html>