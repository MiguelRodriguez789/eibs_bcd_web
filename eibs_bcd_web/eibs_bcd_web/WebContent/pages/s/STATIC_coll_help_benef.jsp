<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>Estado del Bien</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script type="text/javascript">
//<!-- Hide from old browsers

function a(code) {
var formLength= top.opener.document.forms[0].elements.length;
//for(n=0;n<formLength;n++)
//{
	//var elementName= top.opener.document.forms[0].elements[n].name;
	var campo=top.opener.fieldName
	//if(elementName == top.opener.fieldName) 
	//{
  		top.opener.document.forms[0].elements[campo].value = code;
  		if(window.opener.jQuery){
		window.opener.jQuery("[name='"+ top.opener.fieldName +"']").trigger("change");
	}
	else{
	}
  			//campo.value = code;
  		//break;
	//}
// }
 top.close();
 }
//-->
</script>
</HEAD>
<BODY>
<H4>Estado del Bien/Beneficiario</H4>
<table align=center class="tableinfo" style="width:95%">
  <tr id="trdark">
    <td width=39  height="18">
      <div align="center"><b>Código</b></div>
    </td>
    <td width="424"> 
      <div align="left"><b>Descripción</b></div>
    </td>
  </tr>
  <tr > 
    <td width=39  height="18"> 
      <div align="center"><b>C</b></div>
    </td>
    <td width="424"><A HREF="javascript:a('C')"> Constituida</a></td>
  </tr>
  <tr > 
    <td width=39  height="18"> 
      <div align="center"><b>S</b></div>
    </td>
    <td width="424"><A HREF="javascript:a('S')"> Solicitada en Alzamiento</a></td>
  </tr>
  <tr > 
    <td width=39  height="18"> 
      <div align="center"><b>T</b></div>
    </td>
    <td width="424"><A HREF="javascript:a('T')"> En Tramite de Alzamiento</a></td>
  </tr>
  <tr > 
    <td width=39  height="18"> 
      <div align="center"><b>L</b></div>
    </td>
    <td width="424"><A HREF="javascript:a('L')"> Irrecuperable</a></td>
  </tr>
  <tr > 
    <td width=39  height="18"> 
      <div align="center"><b>Q</b></div>
    </td>
    <td width="424"><A HREF="javascript:a('Q')"> Quiebra</a></td>
  </tr>
  <tr > 
    <td width=39  height="18"> 
      <div align="center"><b>W</b></div>
    </td>
    <td width="424"><A HREF="javascript:a('W')"> Quiebra Compartidor</a></td>
  </tr>
  <tr > 
    <td width=39  height="18"> 
      <div align="center"><b>D</b></div>
    </td>
    <td width="424"><A HREF="javascript:a('D')"> Dacion en Pago</a></td>
  </tr>
  <tr > 
    <td width=39  height="18"> 
      <div align="center"><b>E</b></div>
    </td>
    <td width="424"><A HREF="javascript:a('E')"> Rematada a Terceros</a></td>
  </tr>
  <tr > 
    <td width=39  height="18"> 
      <div align="center"><b>P</b></div>
    </td>
    <td width="424"><A HREF="javascript:a('P')"> Rematada Acr. Pref.</a></td>
  </tr>
  <tr > 
    <td width=39  height="18"> 
      <div align="center"><b>A</b></div>
    </td>
    <td width="424"><A HREF="javascript:a('A')"> Alzada</a></td>
  </tr>
  <tr > 
    <td width=39  height="18"> 
      <div align="center"><b>M</b></div>
    </td>
    <td width="424"><A HREF="javascript:a('M')"> Rematada</a></td>
  </tr>
  <tr > 
  <td width=39  height="18"> 
    <div align="center"><b>I</b></div>
  </td>
  <td width="424"><A HREF="javascript:a('I')"> Ingresada Con Protocolo</a></td>
  </tr >
  <tr >
  <td width=39  height="18"> 
    <div align="center"><b>O</b></div>
  </td>
  <td width="424"><A HREF="javascript:a('O')"> Otros</a></td> 
  </tr>
</table>
<P>
</P>
</BODY>
</HTML>
