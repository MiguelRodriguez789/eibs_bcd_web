<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Cambio de PIN</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

function CheckCard(){
if ( document.forms[0].E01CCANUM.value.length < 1) {
  alert("Debe entrar una tarjeta v�lida");
  document.forms[0].E01CCANUM.value='';
  document.forms[0].E01CCANUM.focus();
  return false;
}
else {
  document.forms[0].submit();
  }
}

</SCRIPT>
</head>


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<body onload="top.client.location.reload();" >

<H3 align="center">Cambio de PIN<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="change_pin_enter_card, ECC010001"></H3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECC010001" onsubmit="return(CheckCard())" id="form1" name="form1" >
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="20">
  </p>

  <table class="tbenter" HEIGHT="75%" width="100%" border="0">

    <tr> 
      <td nowrap ALIGN=CENTER> 
        Numero de tarjeta: 
        <INPUT type="text" name="E01CCANUM" size="21" maxlength="20" onkeypress="enterInteger(event)">
			<A href="javascript:actPinpad()">
			<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Leer Tarjetas" align="bottom" border="0"></A> 
			<%--
			<A href="javascript:GetPlastic2('E01CCANUM', 'D', '')">
			<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Lista Tarjetas" align="bottom" border="0"></A> 
			--%>
        <br>
 <div align="center"> 
	   <input id="EIBSBTN" type=submit name="Submit" value="Aceptar">
  </div>     
      </td>
    </tr>
  </table>
  
<script type="text/javascript">
  document.forms[0].E01CCANUM.focus();
  document.forms[0].E01CCANUM.select();
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
</form>


<script type="text/javascript">

function enviar(){
	if(document.forms[0].E01CCRPIO.value == ""){
		alert("Debe leer el PIN correspondiente a la tarjeta.") ;
	}else {
		document.forms[0].submit() ;
	}
}

function openPINPAD(){


	var open = top.client.document.PINPAD.Iniciar("15") ;
	if( open != 0 ){
		var text = "" ;
		switch(open){
			case 100 :
				text = "Error. Puerto de comunicacion con el dispositivo." ;
				break ;

		}
		alert( text ) ;
		return false ;
	}else {
		return true ;
	}
	
}

function setPIN( cardnum ){

			var pinblock = top.client.document.PINPAD.AsignarPin( cardnum , document.form1.OPTION.value ) ;
			var text = "" ;
alert("PB:"+ pinblock + "-" + pinblock.length ) ;
			if( pinblock.length < 16 ){
				switch( pinblock ){
					case "150" :
						text = "Operaci�n Cancelada" ;
						break ;
					
					case "900" :
						text = "Tarjeta no corresponde" ;
						break ;
					
					case "200" :
						text = "Los PIN Introducidos son distintos" ;
						break ;
		
					default :
						text = "Error en el dispositivo. Cod:" + pinblock ;
						break ;
				}
				alert( text ) ;
			
			}
			return pinblock ;

}


function setNewPIN(){

	//if( openPINPAD() && activeDevice() ){

			var pb = setPIN( document.forms[0].E01CCRNUM.value ) ;
			if( pb.length != 16 ){
				top.client.document.PINPAD.Salir();
				
			}else{
				if( document.form1.OPTION.value == "1" ){
					top.client.document.PINPAD.Salir();			
				}
				//ASIGNAR EL PINBLOCK EN EL CAMPO EN EL QUE DEBE VIAJAR AL HOST
			}

//SE ASIGNA EL PINBLOCK CUALQUIERA QUE SEA PARA EFECTOS DE PRUEBAS			
document.forms[0].E01CCRPIO.value = pb ;
			

			
	//}

	//top.client.document.PINPAD.Salir();

}

function activeDevice(){

	switch( top.client.document.PINPAD.ActivarLectura() ){
		case 0 :
			return true ;
			break ;
		default :
			alert("No se pudo activar el dispositivo.") ;
			return false ;
			break ;
	}

}

function actPinpad(){

	if( openPINPAD() && activeDevice() ){
		alert("Deslice la Tarjeta y luego presione Aceptar.") ;
		readTrack() ;
	}else{
		top.client.document.PINPAD.Salir() ;
	}

}

function readPIN(){
	
	var pinblock = top.client.document.PINPAD.LeerPin( document.forms[0].E01CCRNUM.value ) ;
	var text = "" ;

alert("PB:"+ pinblock + "-" + pinblock.length ) ;

	if( pinblock.length < 16 ){
		switch( pinblock ){
			case "150" :
				text = "Operaci�n Cancelada" ;
				break ;
			
			case "900" :
				text = "Tarjeta no corresponde" ;
				break ;
			
			case "200" :
				text = "Los PIN Introducidos son distintos" ;
				break ;

			default :
				text = "Error en el dispositivo. Cod:" + pinblock ;
				break ;
		}
		alert( text ) ;
	
	}else{
		document.forms[0].E01CCRPIO.value = pb ;
	}
	
	top.client.document.PINPAD.Salir() ;
	
}

function readTrack(){

	var resp = top.client.document.PINPAD.LeerTrack() ;
	var text = "" ;
	if( resp.length <= 3 ){
		switch( resp ){
			case "900" :
				text = "Tarjeta Inv�lida" ;
				break ;
			default :
				text = "Error leyendo la tarjeta. Cod:" + resp ;
				break ;
		}
		alert( text ) ;
		
	}else{
		document.form1.E01CCANUM.value = resp.substring(2,21) ;
	}
	
	top.client.document.PINPAD.Salir() ;

}

</script>

</body>
</html>

 