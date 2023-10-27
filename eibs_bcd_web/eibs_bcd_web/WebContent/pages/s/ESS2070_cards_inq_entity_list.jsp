<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META NAME="Author" CONTENT="Datapro">
<META NAME="Generator" CONTENT="Microsoft FrontPage 5.0">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<TITLE>Transacciones Históricas</TITLE>
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
function GetDCIBSUsers(name){
	page = "${pageContext.request.contextPath}/servlet/com.datapro.eibs.internet.JSLogTransSearch?SCREEN=" + 3;
	fieldName=name;
	CenterWindow(page,630,230,1);

}
// end hiding from old browsers -->
</SCRIPT>

</HEAD>

<BODY>
 
<form method="post" action="<%=request.getContextPath()%>/servlet/com.datapro.eibs.internet.JSESS2070" > 
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="21">
<INPUT TYPE=HIDDEN NAME="TYPE" VALUE="2"> 
<input type=HIDDEN name="PB" value="2">
<h3 align="center">Consultar Tarjetas de Seguridad<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cards_inq_entity_list, ESS2070"></h3>
<hr size="4">
<h4 align="center">Seleccione la Entidad de la cual se desea consultar las Tarjetas de Seguridad</h4>

<p>&nbsp; </p>
<table class="tableinfo">
  <TR class="rowlight" > 
    <TD align=right>Usuario/Entidad&nbsp;:&nbsp; </TD>
    <TD align="left">
      <input type="text" id="ENT" name="ENTITYID" size="16" maxlength="10" value="">
      <a href="javascript:GetDCIBSUsers('ENTITYID')">
              		<img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" align="bottom" border="0" ></a>
      </TD>
</TABLE>  

<BR>

  <p align="center"> <input id="EIBSBTN" type=submit name="Submit" value="Enviar"> </p>

</FORM>
</BODY>
</HTML>