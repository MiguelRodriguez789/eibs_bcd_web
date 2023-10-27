//HomPADHttp
//Parametro puertoHttp: Puerto para conexion por def 1200
function HomHttp(puertoHttp){
	this.puertoHttp = puertoHttp;
	//Auxiliares - AJAX
	//-----------------------------------------------------------------------
	this.solicitarAjax = function (ara, calls, callf) {
	var dsec = new Date();
	var sec = dsec.getSeconds();
	var urlServicio = "http://localhost:" + puertoHttp + "/HOM" + sec + "PD.php";
	try {
		var x = $.ajax({
                url: urlServicio,
                method: "POST",
                data: ara,
                dataType: "text",
                contentType: "text/plain; charset=UTF-8",
                processData: false
              });
      x.done(function(msg) {
        calls(msg);
      });
      x.fail(function(jqXHR,textStatus) {
        callf(textStatus);
      });
      return true;
    } catch(err) {
      callf(err);
      return false;
    }
  };
  //-----------------------------------------------------------------------
}

HomHttp.prototype.BuscarPersona = function (json,funsucc,funerr) {
  var bRes = false;
  var sRes;
  var solicitud = json;
  //----------------------------------------------------------------------
  sRes = this.solicitarAjax(solicitud,funsucc,funerr);
  //----------------------------------------------------------------------
  return sRes;
};

HomHttp.prototype.MatricularPersona = function (json,funsucc,funerr) {
  var bRes = false;
  var sRes;
  var solicitud = json;
  //----------------------------------------------------------------------
  sRes = this.solicitarAjax(solicitud,funsucc,funerr);
  //----------------------------------------------------------------------
  return sRes;
};

HomHttp.prototype.VerificarPersona = function (json,funsucc,funerr) {
	var bRes = false;
	var sRes;
	var solicitud = json;
	//----------------------------------------------------------------------
	sRes = this.solicitarAjax(solicitud,funsucc,funerr);
	//----------------------------------------------------------------------
	return sRes;
};

HomHttp.prototype.ProcesarPersona = function (json,funsucc,funerr) {
  var bRes = false;
  var sRes;
  var solicitud = json;
  //----------------------------------------------------------------------
  sRes = this.solicitarAjax(solicitud,funsucc,funerr);
  //----------------------------------------------------------------------
  return sRes;
};

HomHttp.prototype.RNEC = function (json,funsucc,funerr) {
  var bRes = false;
  var sRes;
  var solicitud = json;
  //----------------------------------------------------------------------
  sRes = this.solicitarAjax(solicitud,funsucc,funerr);
  //----------------------------------------------------------------------
  return sRes;
};

//-----------------------------------------------------------------------------
// MATRICULAR  
//-----------------------------------------------------------------------------
function hominiMatricularPersona(tipoNip,nip,nombres,apellidos) {
	var objetoHOM = new HomHttp(1200);
	//-------------------------------------------------------------------------
	// Llamar la funcion y obtener el resultado
	//-------------------------------------------------------------------------
	// JSON:
	// OPERACION: Especifique 3 para matricula
	// TipoNip: Tipo de identificacion
	// NIP: Identificacion
	// InfAdicional: Usuario*Nombres*Apellidos*InfAdicional
	// [{'Operacion':'3','TipoNip':'CC','Nip':'"+ cedula +"','InfAdicional':'usrOperacionMAT*Nombre1*Apellido1*Matriculado desde Javascript'}]
	var strOperacion = '3';
	var strTipoNIP = tipoNip;
	var strNIP = nip;
	var strNombres = nombres;
	var strApellidos = apellidos;
	var strInfAdicional = "eIBS"+"*"+strNombres+"*"+strApellidos+"*"+"";
	var jsonSolicitud = "[{'Operacion':'" + strOperacion + "','TipoNip':'" + strTipoNIP + "','Nip':'" + strNIP + "','InfAdicional':'" + strInfAdicional + "'}]";
	var resultado = objetoHOM.MatricularPersona(jsonSolicitud, ResMatriculaSuc, ResMatriculaErr);
};
// Resultado exitoso
function ResMatriculaSuc(res) {
	var s = res.split(",");
	var msg = RetornarCodSuceso(s[1]);
	if (s[0] == "0" && s[1] == "0") {
		MatricularPersonaSuc(msg);
	} else {
		MatricularPersonaErr(msg);
	}
}
// Resultado error
function ResMatriculaErr(res) {
	var msg = RetornarCodSuceso("-2");
	MatricularPersonaErr(msg);
}

//-------------------------------------------------------------------------
// VERIFICAR
//-------------------------------------------------------------------------
function hominiVerificarPersona(tipoNip,nip) {
	var objetoHOM = new HomHttp(1200);
	// JSON:
	// OPERACION: Especifique 2 para verificacion
	// TipoNip: Tipo de identificacion
	// NIP: Identificacion
	// InfAdicional: Usuario*BolInterfaz*lngTimeOut
	// [{'Operacion':'2','TipoNip':'CC','Nip':'"+ cedula +"','InfAdicional':'usrOperacionVER*0*20000'}]  
	var strOperacion = '2';
	var strTipoNIP = tipoNip;
	var strNIP = nip;
	var strInterfaz = "0";
	var strTimeOut = "20000";
	var strInfAdicional = "eIBS"+"*"+strInterfaz+"*"+strTimeOut;
	var jsonSolicitud = "[{'Operacion':'" + strOperacion + "','TipoNip':'" + strTipoNIP + "','Nip':'" + strNIP + "','InfAdicional':'" + strInfAdicional + "'}]";  
	var resultado = objetoHOM.VerificarPersona(jsonSolicitud, ResVerificacionSuc, ResVerificacionErr);
	return resultado;
};
// Resultado exitoso 
function ResVerificacionSuc(res){
	var s = res.split(",");
	var msg = RetornarCodSuceso(s[1]);
	if (s[0] == "0" && s[1] == "10") {
		VerificarPersonaSuc(msg);
	} else {
		VerificarPersonaErr(msg);
	}
}
// Resultado error
function ResVerificacionErr(res) {
	var msg = RetornarCodSuceso("-2");
	VerificarPersonaErr(msg);
}

//-----------------------------------------------------------------------------
// PROCESAR 
//-----------------------------------------------------------------------------
function hominiProcesarPersona(tipoNip,nip,nombres,apellidos) {
	var objetoHOM = new HomHttp(1200);
	//-------------------------------------------------------------------------
	// Llamar la funcion y obtener el resultado
	//-------------------------------------------------------------------------
	// JSON:
	// OPERACION: Especifique 4 para procesar persona
	// TipoNip: Tipo de identificacion
	// NIP: Identificacion
	// InfAdicional: Usuario*Nombres*Apellidos*bolTomarAnexos*InfAdicional
	// [{'Operacion':'4','TipoNip':'CC','Nip':'"+ cedula +"','InfAdicional':'usrOperacion*Nombres*Apellidos*False*NoHayMasInfo'}]
	var strOperacion = '4';
	var strTipoNIP = tipoNip;
	var strNIP = nip;
	var strNombres = nombres;
	var strApellidos = apellidos;
	var strTomarAnexos = "false";
	var strInfAdicional = "eIBS"+"*"+strNombres+"*"+strApellidos+"*"+strTomarAnexos+"*"+"eIBS";
	var jsonSolicitud = "[{'Operacion':'" + strOperacion + "','TipoNip':'" + strTipoNIP + "','Nip':'" + strNIP + "','InfAdicional':'" + strInfAdicional + "'}]";  
	// Solicitud al componente
	var resultado = objetoHOM.ProcesarPersona(jsonSolicitud, ResProcesarSuc, ResProcesarErr);
};
//Resultado exitoso
function ResProcesarSuc(res) {
	var s = res.split(",");
	var t = s[1].split("*");	// VER=Verificacion MAT=Matricula 
	var msg = RetornarCodSuceso(t[1]);
	if (s[0] == "0") {
		// Verificacion
		if (t[0] == "VER") { 
			if (t[1] == "10") {
				ProcesarPersonaSuc(msg);
			} else {
				ProcesarPersonaErr(msg);
			}
		} 
		if (t[0] == "MAT"){
			if (t[1] == "0") {
				ProcesarPersonaSuc(msg);
			} else {
				ProcesarPersonaErr(msg);
			}
		}
		if (t[0] != "VER" && t[0] != "MAT"){
			ProcesarPersonaErr(msg);
		}
	} else {
		ProcesarPersonaErr(msg);
	}
}
//Resultado error
function ResProcesarErr(res) {
	var msg = RetornarCodSuceso("-2");
	ProcesarPersonaErr(msg);
}

//-----------------------------------------------------------------------------
//RNEC 
//-----------------------------------------------------------------------------
function hominiRNEC(tipoNip,nip,correlId,usuarioAplicacion,sucursalId) {
	var objetoHOM = new HomHttp(1201);          
	//-------------------------------------------------------------------------
	// Llamar la funcion y obtener el resultado
	//-------------------------------------------------------------------------
	// JSON:
	// OPERACION: Especifique 6
	// TipoNip: Tipo de identificacion
	// NIP: Identificacion
	// InfAdicional: Usuario
	// [{'Operacion':'6','SucursalId':'1001','correlId':'" + cid + "','UsuarioAplicacion':'" + user + "','OperacionNegocio':'TomaHuellas','TipoNip':'" + tid + "','Nip':'" + cedula +"'}]
	var strOperacion = '6';
	var strSucursalId = sucursalId;
	var strCorrelId = correlId;
	var strUsuarioAplicacion = usuarioAplicacion;
	var strOperacionNegocio = 'TomaHuellas';
	var strTipoNip = tipoNip;
	var strNip = nip;
	var jsonSolicitud = "[{'Operacion':'" + strOperacion + "','SucursalId':'" + strSucursalId + "','correlId':'" + strCorrelId + "','UsuarioAplicacion':'" + strUsuarioAplicacion + "','OperacionNegocio':'" + strOperacionNegocio + "','TipoNip':'" + strTipoNip + "','Nip':'" + strNip +"'}]";		               
	//-------------------------------------------------------
	// Solicitud al componente
	var resultado = objetoHOM.RNEC(jsonSolicitud, ResRnecSuc, ResRnecErr);
};
//Resultado exitoso 
function ResRnecSuc(res){
	var s = res.split(",");
	var msg = res;
	if (s[0] == "0") {
		RNECSuc(msg);
	} else {
		RNECErr(msg);
	}
}
// Resultado error
function ResRnecErr(res) {
	var msg = RetornarCodSuceso("-2");
	RNECErr(msg);
}

//-----------------------------------------------------------------------------
// CODIGOS
//-----------------------------------------------------------------------------
function RetornarCodSuceso(codigo) {
  var s = "Codigo no encontrado!";
  switch (codigo) {
    case "-2":
      s = "Error Homini";
      break;
    case "-1":
      s = "Proceso cancelado";
      break;
    case "0":
      s = "Funcion Correcta";
      break;
    case "1":
      s = "Importando BLOB";
      break;
    case "2":
      s = "Error desencriptando";
     break;
    case "3":
      s = "Error de procedimiento de Desencripcion";
      break;
    case "4":
      s = "Error de Decompresion";
      break;
    case "5":
      s = "error de procedimiento de Procesar Trama";
      break;
    case "6":
      s = "No pertenece al NIP";
      break;
    case "7":
      s = "Expiro tiempo de vida";
      break;
    case "8":
      s = "Punto sin licencia";
      break;
    case "10":
      s = "Verificacion Valida";
      break;
    case "11":
      s = "Verificacion No Valida";
      break;
    case "12":
      s = "Error Librería";
      break;
    case "13":
      s = "Error Procedimiento";
      break;
    case "14":
      s = "No Existe Dedo";
      break;
    case "15":
      s = "Error Buscando Tpl Estado";
      break;
    case "16":
      s = "Bloqueado";
      break;
    case "17":
      s = "Error Actualizando Intentos";
      break;
    case "18":
      s = "Error Actualizando Bloqueo";
      break;
    case "19":
      s = "Error Ejecutando SQL";
      break;
    case "20":
      s = "Error Abriendo Recordset";
      break;
    case "21":
      s = "El Cliente Ya Existe";
      break;
    case "22":
      s = "No hay Datos";
      break;
    case "24":
      s = "En Proceso de Matricula";
      break;
    case "25":
      s = "Hay Verificaciones Relacionadas";
      break;
    case "26":
      s = "Proceso de Cambio de claves de matricula en curso";
      break;
    case "27":
      s = "Sin Licencias";
      break;
    case "28":
      s = "App. No Matriculado";
      break;
    case "29":
      s = "Servicios Reiniciados";
      break;
    case "30":
      s = "Verificacion sin Huellas";
      break;
    case "31":
      s = "Error Firmando Matricula";
      break;
    case "40":
      s = "Error Actualizando Punto";
      break;
    case "41":
      s = "Error Enviado Imagenes";
      break;
    case "42":
      s = "Error Recuperando imagenes";
      break;
    case "43":
      s = "Error Scanner Cliente";
      break;
    case "50":
      s = "Error Socket Servidor";
      break;
    case "51":
      s = "Time Out Conexión";
      break;
    case "52":
      s = "Time Out Cliente";
      break;
    case "53":
      s = "Id de Trama no Valido";
      break;
    case "54":
      s = "Pendiente Duplicados";
      break;
    case "55":
      s = "Pendiente Conf. Datos";
      break;
    case "56":
      s = "Persona DesHabilitada";
      break;
    case "57":
      s = "Identificacion Valida";
      break;
    case "58":
      s = "Identificacion NO Valida";
      break;
    case "59":
      s = "Identificacion Multiple";
      break;
    case "60":
      s = "Repositorio En Carga";
      break;
    case "61":
      s = "Duplicado Encontrado";
      break;
    case "62":
      s = "Error Actualizado Repositorio";
      break;
    case "63":
      s = "Anexos No tomados";
      break;
    case "90":
      s = "Operativo";
      break;
    case "91":
      s = "Sin Parametros";
      break;
    case "92":
      s = "Sin Conexión";
      break;
    case "93":
      s = "Sin Encripcion";
      break;
    case "94":
      s = "Licencia Corrupta";
      break;
    case "95":
      s = "No se pudo Consultar las Licencias";
      break;
    case "96":
      s = "Sin Parametros Privados";
      break;
    case "97":
      s = "Sin Sucesos";
      break;
    case "98":
      s = "No Operativo";
      break;
    case "99":
      s = "Sin Aplicativos";
      break;
    case "100":
      s = "Firma Parametros NO valida";
      break;
    case "101":
      s = "Objeto Ver. No Valido";
      break;
    case "102":
      s = "Identificacion Sin Repositorio";
      break;
  }
  s = codigo + ":" + s;
  return s;
}
