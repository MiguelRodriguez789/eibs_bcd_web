<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1"> 
<TITLE>Consulta de Lineas de Credito</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

</HEAD>
<body bgcolor="#FFFFFF">

<h3 align="center">Consulta de Lineas de Credito por Tipo<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cl_type_enter, ELN0110"></h3>
<hr>
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.credit.JSELN0110" >
  <CENTER>
    <p><INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
    </p>
    <table cellspacing="0" cellpadding="2" class="tbenter" border=0   width=70% align="center" height="80%">
      <tr valign="middle"> 
        <td nowrap colspan="2" align="center" height="64">&nbsp;</td>
      </tr>
      <tr valign="middle"> 
        <td nowrap width=40% align="right" height="106"> 
          <p>Ingrese el Tipo de Linea de Cr&eacute;dito : 
        </td>
        <td nowrap width=40% align="left" height="106"> 
          <p> 
            <input type=TEXT name="CLTYPE" value="" size=05 maxlength=4>
            <a href="javascript:GetCodeCNOFC('CLTYPE','14')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="middle" border="0" ></a> 
            &nbsp; 
        </td>
      </tr>
      <tr> 
        <td nowrap colspan="2" valign="middle" height="100"> 

	    <div align="center"> 
    	  <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
   		</div>

        </td>
      </tr>
      <tr> 
        <td nowrap colspan="2" valign="middle">&nbsp;</td>
      </tr>
    </table>
  </CENTER>
<script type="text/javascript">
  document.forms[0].CLTYPE.focus();
  document.forms[0].CLTYPE.select();
</script>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT type="text/javascript">;
            showErrors();
     </SCRIPT>
 <%
 }
%>
 </FORM>
</BODY>
</HTML>
 