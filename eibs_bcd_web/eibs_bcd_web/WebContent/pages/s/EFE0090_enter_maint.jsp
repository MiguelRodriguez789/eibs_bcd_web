<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Mantenimiento Agentes de Bolsa</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

</SCRIPT>

</head>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<body >

<h3 align="center">Mantenimiento Agentes de Bolsa, Seguros y Otros<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="enter_maint, EFE0090"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEFE0090">
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
  </p>
  <br>
  <br>
  <table class="tbenter" width="100%" border="0">
    <tr>
          <td nowrap align="right" width="35%">
              C&oacute;digo :
          </td>
          <td>
              <INPUT type="text" name="E01FEBNUM" size="5" maxlength="4" value="">
              <a href="javascript:GetTypeBroker('E01FEBNUM',document.forms[0].E01FEBATY.options[document.forms[0].E01FEBATY.selectedIndex].value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0" ></a> 
		  </td>
    </tr>
    <tr>
		  <td nowrap align="right"> 
		      Tipo :
          </td>
          <td>
              <select name="E01FEBATY">
                <option value="A">Aseguradora de Autos</option>
                <option value="C">Crediahorros</option>
                <option value="T">Recoleccion Impuestos</option>
                <option value="V">Agentes de Bolsa</option>
              	<option value="G">Administracion Fondos</option>
                <option value="I">Otras Aseguradoras</option>
                <option value="E">Entidades Gobierno</option>
                <option value="S">Vendedores/ Comisionistas</option>
                <option value="D">Agente/Represente Comex</option>
                <option value="N">Notarios</option>
                <option value="P">Participante Pool</option>
                <option value="O">Inspector de Obra</option> 
			   
			 </select> 


            </td>
    </tr>
    <tr>
           <td nowrap align="center" colspan=2>
            <p align="center"> 
				Si desea ingresar uno Nuevo, deje el C&oacute;digo en blanco y seleccione el Tipo 
			</p>              
			<p align="center"> 
    			<input id="EIBSBTN" type=submit name="Submit" value="Enviar">  
  			</p>  
          </td>
   </tr>
  </table>
      
  </form>
<script type="text/javascript">
	document.forms[0].E01FEBNUM.focus();
	document.forms[0].E01FEBNUM.select();
</script>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT type="text/javascript">
            showErrors();
     </SCRIPT>
 <%
 }
%>
</body>
</html>
