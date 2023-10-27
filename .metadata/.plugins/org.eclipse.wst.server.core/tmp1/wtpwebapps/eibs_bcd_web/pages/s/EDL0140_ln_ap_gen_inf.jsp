<html>
<head>
<title>Información General</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="lnGenInf" class="datapro.eibs.beans.EDL015001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

   builtNewMenu(ln_a_opt);

</SCRIPT>

</head>

<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
 		error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
  out.println("<SCRIPT> initMenu(); </SCRIPT>");
%> 
<h3 align="center">Informaci&oacute;n General <%= lnGenInf.getE01DSCPRO().trim()%><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_ap_gen_inf.jsp,EDL0140"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDL0150" >
  <INPUT TYPE=HIDDEN NAME="E01DEABNK"  value="<%= lnGenInf.getE01DEABNK().trim()%>">
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left">
                <input type="text" name="E01DEACUN" size="10" maxlength="9" value="<%= lnGenInf.getE01DEACUN().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" name="E01CUSNA1" size="45" maxlength="45" value="<%= lnGenInf.getE01CUSNA1().trim()%>" >
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
                <input type="text" name="E01DEAACC" size="13" maxlength="12" value="<%= lnGenInf.getE01DEAACC().trim()%>" >
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
                <input type="text" name="E01DEACCY2" size="3" maxlength="3" value="<%= lnGenInf.getE01DEACCY().trim()%>" >
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
                <input type="text" name="E01DEAPRO" size="4" maxlength="4" value="<%= lnGenInf.getE01DEAPRO().trim()%>" >
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Informaci&oacute;n General</h4>
  
  <%int row = 0; %>    
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="30%" > 
              <div align="right">Tipo de Inter&eacute;s :</div>
            </td>
            <td nowrap width="19%" > 
              <input type="text" readonly <% if (lnGenInf.getF01DEAICT().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01DEAICT" size="30" maxlength="30" 
				  value="<% if (lnGenInf.getE01DEAICT().equals("S")) out.print("Al Vencimiento Calendario");
							else if (lnGenInf.getE01DEAICT().equals("M")) out.print("Al Vencimiento Comercial");
							else if (lnGenInf.getE01DEAICT().equals("P")) out.print("Prepagados Calendario");
							else if (lnGenInf.getE01DEAICT().equals("A")) out.print("Prepagados Comerciales");
							else if (lnGenInf.getE01DEAICT().equals("D")) out.print("Descontados Calendario");
							else if (lnGenInf.getE01DEAICT().equals("T")) out.print("Descontados Comerciales");
							else if (lnGenInf.getE01DEAICT().equals("R")) out.print("Capitalizados");
							else if (lnGenInf.getE01DEAICT().equals("1")) out.print("Al Vencimiento Calendario");
							else if (lnGenInf.getE01DEAICT().equals("2")) out.print("Al Vencimiento Comercial");
							else if (lnGenInf.getE01DEAICT().equals("3")) out.print("Prepagados Calendario");
							else if (lnGenInf.getE01DEAICT().equals("4")) out.print("Prepagados Comerciales");
							else if (lnGenInf.getE01DEAICT().equals("5")) out.print("Descontados Calendario");
							else if (lnGenInf.getE01DEAICT().equals("6")) out.print("Descontados Comerciales");
							else if (lnGenInf.getE01DEAICT().equals("7")) out.print("Capitalizados");
							else if (lnGenInf.getE01DEAICT().equals("8")) out.print("Regla 78");
							else out.print("");%>" 
				>
            </td>
            <td nowrap width="24%" > 
              <div align="right">Comisionista :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" readonly <% if (lnGenInf.getF01DEABRK().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01DEABRK" size="4" maxlength="3" value="<%= lnGenInf.getE01DEABRK().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="30%" > 
              <div align="right">Per&iacute;odo Base :</div>
            </td>
            <td nowrap width="19%" > 
              <input type="text" name="E01DEABAS" size="4" maxlength="3" <% if (lnGenInf.getF01DEABAS().equals("Y")) out.print("class=\"txtchanged\""); %> value="<%= lnGenInf.getE01DEABAS().trim()%>" readonly>
            </td>
            <td nowrap width="24%" > 
              <div align="right">Tasa del Comisionista :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" readonly <% if (lnGenInf.getF01DEABCP().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01DEABCP" size="10" maxlength="9" value="<%= lnGenInf.getE01DEABCP().trim()%>" >
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="30%" > 
              <div align="right">C&aacute;lculo de Inter&eacute;s Normal :</div>
            </td>
            <td nowrap width="19%" > 
              <input type="text" readonly <% if (lnGenInf.getF01DEAIFL().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01DEAIFL" size="30" maxlength="30" 
				  value="<% if (lnGenInf.getE01DEAIFL().equals("1")) out.print("Capital Vigente");
							else if (lnGenInf.getE01DEAIFL().equals("2")) out.print("Capital Original");
							else if (lnGenInf.getE01DEAIFL().equals("3")) out.print("Capital Vigente menos Capital Vencido");
							else if (lnGenInf.getE01DEAIFL().equals("N")) out.print("No Calcula Intereses");
							else out.print("");%>" 
				>
            </td>
            <td nowrap width="24%" > 
              <div align="right">Retenci&oacute;n de Impuestos :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" readonly <% if (lnGenInf.getF01DEAWHF().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01DEAWHF" size="30" maxlength="30" 
				  value="<% if (lnGenInf.getE01DEAWHF().equals("1")) out.print("Retencion sobre Intereses ISR");
							else if (lnGenInf.getE01DEAWHF().equals("2")) out.print("Cobre del IVA");
							else if (lnGenInf.getE01DEAWHF().equals("3")) out.print("IVA mas ISR");
							else if (lnGenInf.getE01DEAWHF().equals("4")) out.print("IVA solo en Comisiones");
							else if (lnGenInf.getE01DEAWHF().equals("5")) out.print("IVA solo en Intereses");
							else if (lnGenInf.getE01DEAWHF().equals("6")) out.print("Debito bancario IDB");
							else if (lnGenInf.getE01DEAWHF().equals("7")) out.print("IDB mas ISR");
							else if (lnGenInf.getE01DEAWHF().equals("8")) out.print("IDB mas IVA");
							else if (lnGenInf.getE01DEAWHF().equals("9")) out.print("Todo Tipo de Impuestos");
							else if (lnGenInf.getE01DEAWHF().equals("N")) out.print("No Calcula Impuestos");
							else if (lnGenInf.getE01DEAWHF().equals("F")) out.print("Cobro del FECI");
							else out.print("");%>" 
				>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="30%" > 
              <div align="right">C&aacute;lculo de Inter&eacute;s Mora :</div>
            </td>
            <td nowrap width="19%" > 
              <input type="text" readonly <% if (lnGenInf.getF01DEAPCL().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01DEAPCL" size="30" maxlength="30" 
				  value="<% if (lnGenInf.getE01DEAPCL().equals("1")) out.print("Sobre Capital Vencido");
							else if (lnGenInf.getE01DEAPCL().equals("2")) out.print("Sobre Capital Original");
							else if (lnGenInf.getE01DEAPCL().equals("3")) out.print("Sobre Capital Vigente");
							else if (lnGenInf.getE01DEAPCL().equals("4")) out.print("Sobre Capital Vencido mas Intereses Vencido");
							else if (lnGenInf.getE01DEAPCL().equals("N")) out.print("No Calcula Intereses");
							else out.print("");%>" 
				>
            </td>
            <td nowrap width="24%" > 
              <div align="right">Vencimiento Feriados :</div>
            </td>
            <td nowrap width="27%" > 
	              <input type="text" name="E01DEAHFQ" size="60" maxlength="60" readonly
	              		 value="<% if (lnGenInf.getE01DEAHFQ().equals("1")) out.print("Acepta Dias Feriados");
							      else if (lnGenInf.getE01DEAHFQ().equals("2")) out.print("No Acepta Dias Feriados, Vencimiento Dia Habil Anterior");
							      else if (lnGenInf.getE01DEAHFQ().equals("3")) out.print("No Acepta Dias Feriados, Vencimiento Dia Habil Siguiente");
								  else out.print("");%>" <% if (lnGenInf.getF01DEAHFQ().equals("Y")) out.print("class=\"txtchanged\""); %>>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="30%" > 
              <div align="right">Per&iacute;odo de Gracia :</div>
            </td>
            <td nowrap width="19%" > 
              <input type="text" readonly <% if (lnGenInf.getF01DEAGPD().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01DEAGPD" size="3" maxlength="2" value="<%= lnGenInf.getE01DEAGPD().trim()%>" >
            </td>
            <td nowrap width="24%" > 
              <div align="right">Direcci&oacute;n de Correos :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" readonly <% if (lnGenInf.getF01DEAMLA().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01DEAMLA" size="2" maxlength="2" value="<%= lnGenInf.getE01DEAMLA().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="30%" > 
              <div align="right">Tabla Cargos :</div>
            </td>
            <td nowrap width="19%" > 
              <input type="text" readonly <% if (lnGenInf.getF01DEATLN().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01DEATLN" size="2" maxlength="2" value="<%= lnGenInf.getE01DEATLN().trim()%>">
            </td>
            <td nowrap width="24%" > 
              <div align="right">C&oacute;digo de Obligaci&oacute;n :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" readonly <% if (lnGenInf.getF01DEAOBL().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01DEAOBL" size="3" maxlength="2" value="<%= lnGenInf.getE01DEAOBL().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="30%" > 
              <div align="right">Tabla Tasas :</div>
            </td>
            <td nowrap width="19%" > 
              <input type="text" readonly <% if (lnGenInf.getF01DEARTB().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01DEARTB" size="2" maxlength="2" value="<%= lnGenInf.getE01DEARTB().trim()%>">
            </td>
            <td nowrap width="24%" > 
              <div align="right">C&oacute;digo de Usuario :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" readonly <% if (lnGenInf.getF01DEARRC().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01DEARRC" size="3" maxlength="2" value="<%= lnGenInf.getE01DEARRC().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="30%" > 
              <div align="right">Clase de Cr&eacute;dito :</div>
            </td>
            <td nowrap width="19%" > 
              <input type="text" readonly <% if (lnGenInf.getF01DEACLF().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01DEACLF" size="2" maxlength="1" value="<%= lnGenInf.getE01DEACLF().trim()%>">
            </td>
            <td nowrap width="24%" > 
              <div align="right">Participaciones :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" readonly <% if (lnGenInf.getF01DEAPAR().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01DEAPAR" size="3" maxlength="2" 
				  value="<% if (lnGenInf.getE01DEAPAR().equals("Y")) out.print("Si");
							else if (lnGenInf.getE01DEAPAR().equals("N")) out.print("No");
							else out.print("");%>" 
				>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="30%" > 
              <div align="right">Pr&eacute;stamo a Demanda :</div>
            </td>
            <td nowrap width="19%" > 
              <input type="text" readonly <% if (lnGenInf.getF01DEALNC().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01DEALNC" size="3" maxlength="2" 
				  value="<% if (lnGenInf.getE01DEALNC().equals("Y")) out.print("Si");
							else if (lnGenInf.getE01DEALNC().equals("N")) out.print("No");
							else out.print("");%>" 
				>
            </td>
            <td nowrap width="24%" > 
              <div align="right">Cuenta :</div>
            </td>
            <td nowrap width="27%">
              <input type="text" readonly <% if (lnGenInf.getF01DEAPAC().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01DEAPAC" size="12" maxlength="12" value="<%= lnGenInf.getE01DEAPAC().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="30%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="19%" >&nbsp; </td>
            <td nowrap width="24%" > 
              <div align="right"> Porciento de Participaciones :</div>
            </td>
            <td nowrap width="27%">
              <input type="text" readonly <% if (lnGenInf.getF01DEACCF().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01DEACCF" size="4" maxlength="3" value="<%= lnGenInf.getE01DEACCF().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Prioridad de Pagos </h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="12%"  > 
              <div align="center"> 
                <input type="text" name="E01DEAPP1" <% if (lnGenInf.getF01DEAPP1().equals("Y")) out.print("class=\"txtchanged\""); %> size="2" maxlength="1" value="<%= lnGenInf.getE01DEAPP1().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%"  > 
              <div align="center"> 
                <input type="text" name="E01DEAPP2" <% if (lnGenInf.getF01DEAPP2().equals("Y")) out.print("class=\"txtchanged\""); %> size="2" maxlength="1" value="<%= lnGenInf.getE01DEAPP2().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="center"> 
                <input type="text" name="E01DEAPP3" <% if (lnGenInf.getF01DEAPP3().equals("Y")) out.print("class=\"txtchanged\""); %> size="2" maxlength="1" value="<%= lnGenInf.getE01DEAPP3().trim()%>" readonly>
              </div>
            </td>
           <td nowrap width="12%"  > 
              <div align="center"> 
                <input type="text" name="E01DEAPP4" <% if (lnGenInf.getF01DEAPP4().equals("Y")) out.print("class=\"txtchanged\""); %> size="2" maxlength="1" value="<%= lnGenInf.getE01DEAPP4().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="center"> 
                <input type="text" name="E01DEAPP5" <% if (lnGenInf.getF01DEAPP5().equals("Y")) out.print("class=\"txtchanged\""); %> size="2" maxlength="1" value="<%= lnGenInf.getE01DEAPP5().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%"  > 
              <div align="center"> 
                <input type="text" name="E01DEAPP6" <% if (lnGenInf.getF01DEAPP6().equals("Y")) out.print("class=\"txtchanged\""); %> size="2" maxlength="1" value="<%= lnGenInf.getE01DEAPP6().trim()%>" readonly>
              </div>
            </td>
			 <%if(currUser.getE01INT().equals("07")){%> 
	            <td nowrap width="12%"  > 
	              <div align="center"> 
	                <input type="text" name="E01DEAPP7" <% if (lnGenInf.getF01DEAPP7().equals("Y")) out.print("class=\"txtchanged\""); %> size="2" maxlength="1" value="<%= lnGenInf.getE01DEAPP7().trim()%>" readonly>
	              </div>
	            </td>
			  <% } %>
            <td nowrap width="12%"  > 
              <div align="center"> 
                <input type="text" name="E01DEAPP8" <% if (lnGenInf.getF01DEAPP8().equals("Y")) out.print("class=\"txtchanged\""); %> size="2" maxlength="1" value="<%= lnGenInf.getE01DEAPP8().trim()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="12%" > 
              <div align="center">Principal</div>
            </td>
            <td nowrap width="12%" > 
              <div align="center">Intereses</div>
            </td>
            <td nowrap width="12%" > 
              <div align="center">Mora</div>
            </td>
            <td nowrap width="12%" > 
              <div align="center">Comisiones</div>
            </td>
            <td nowrap width="12%" > 
              <div align="center">Impuestos</div>
            </td>
            <td nowrap width="12%" > 
              <div align="center">Deducciones</div>
            </td>
			 <%if(currUser.getE01INT().equals("07")){%> 
	            <td nowrap width="12%" > 
	              <div align="center">FECI</div>
	            </td>
			  <% } %>
            <td nowrap width="12%" > 
              <div align="center">Cobranzas</div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
    
  </form>
</body>
</html>
