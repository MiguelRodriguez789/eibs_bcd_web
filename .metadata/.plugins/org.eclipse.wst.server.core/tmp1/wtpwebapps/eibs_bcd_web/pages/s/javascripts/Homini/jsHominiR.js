

//HomPADHttp
//Parametro puertoHttp: Puerto para conexion por def 1200
function HomHttp(puertoHttp) {
    this.puertoHttp = puertoHttp;

    //Auxiliares - AJAX
    //-----------------------------------------------------------------------
    this.solicitarAjax = function (ara, calls, callf) {
        var dsec = new Date();
        var sec = dsec.getSeconds();
        var urlServicio = "http://127.0.0.1:" + puertoHttp + "/HOM" + sec + "PD.php";

        try {
            var x = $.ajax({
                url: urlServicio,
                method: "POST",
                data: ara,
                dataType: "text",
                contentType: "text/plain; charset=UTF-8",
                processData: false
            });

            x.done(function (msg) {
                calls(msg);
            });

            x.fail(function (jqXHR, textStatus) {
                callf(textStatus);
            });
            return true;
        }
        catch (err) {
            callf(err);
            return false;
        }

    };
}



HomHttp.prototype.RNEC = function (json,funsucc,funerr) {
    var bRes = false;
    var sRes;
    var solicitud = json;
    //----------------------------------------------------------------------
    sRes = this.solicitarAjax(solicitud,funsucc,funerr);
    //----------------------------------------------------------------------
    return sRes;
};
