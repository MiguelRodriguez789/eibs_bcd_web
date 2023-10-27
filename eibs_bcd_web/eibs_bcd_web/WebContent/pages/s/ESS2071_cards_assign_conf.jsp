<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META NAME="Author" CONTENT="Datapro">
<META NAME="Generator" CONTENT="Microsoft FrontPage 5.0">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="../style.css" rel="stylesheet">
<TITLE>Transacciones Históricas</TITLE>

<jsp:useBean id="lsCards" class="com.datapro.generic.beanutil.BeanList"  scope="session"/>
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript"> 
<!--- hide script from old browsers
function FSubmitValidation() {
if(document.forms[0].ENTITYID.value == ""){
    alert("Debe de Seleccionar Usuario/Entidad");
    document.forms[0].ENTITYID.focus();
    return false;
  } 
}
// end hiding from old browsers -->
</SCRIPT>

</HEAD>

<BODY>
 <% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0") ;
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 %> 
<form method="post" action="<%=request.getContextPath()%>/servlet/com.datapro.eibs.internet.JSESS2071" > 
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="100">
<h3 align="center">Asignar Tarjetas de Seguridad<img src="../../images/e_ibs.gif" align="left" name="EIBS_GIF" title="cards_inq_entity_list, ESS2070"> a Entidad</h3>
<hr size="4">
<h4 align="center">Tarjetas fueron asignadas a Usuario de forma satisfactoria</h4>

  

<BR>

  <p align="center"> <input id="EIBSBTN" type=submit name="Submit" value="Aceptar"> </p>

</FORM>
</BODY>
</HTML>