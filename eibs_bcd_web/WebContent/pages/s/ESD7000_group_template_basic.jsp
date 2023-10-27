<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<%@ page import = "datapro.eibs.master.Util" %>
<head>
<title>Acceso de Usuarios</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="user" class="datapro.eibs.beans.ESD700001Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">


function del() {
  
      ok = confirm("Esta seguro que desea eliminar el usuario seleccionado?");

	  if (ok) 
	  {
	  document.forms[0].SCREEN.value = 4;
	  document.forms[0].H01FLGWK1.value='Y';
      document.forms[0].submit();
	  }
	  

}

function showPassword(value){
	if(value){
		document.getElementById('password').style.display='none';
	} else {
		document.getElementById('password').style.display='block';
	} 
}

function goInquiry() {
 	if (document.forms[0].Purpose.value == "MAINTENANCE"){

 		if (!confirm("Si confirma se perderan algunos datos...")) {
 			return;
		}
	}		
	document.forms[0].SCREEN.value = 22;
	document.forms[0].submit();
}

</script>



</head>

<body bgcolor="#FFFFFF">

 <% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0") ;
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
	String read = "";
 	String disabled = "";
	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) { 
		read = " readonly ";
		disabled = " disabled"; 
	}
%>

  <%int row = 0; %>
<h3 align="center">Acceso de Grupos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="group_template_basic, ESD7000" ></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESD7000" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="3">
	<INPUT TYPE="HIDDEN" NAME="H01FLGWK1" VALUE="N">
  </p>
  <h4>Informaci�n de Grupo </h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap align="right"></td>
            <td nowrap> 
            </td>
            <td nowrap ></td>
            <td align="center" valign="top" style="color:red;font-size:12;">
              <b><% if (user.getH01FLGWK2().equals("Y")) out.println("Mantenimiento pendiente Aprobaci�n"); %> </b> 
            </td> 
            
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Grupo :</div>
            </td>
            <td nowrap> 
              <input type="hidden" name="E01BTHKEY" size="17" maxlength="15" value="<%= user.getE01BTHKEY().trim()%>">
              <%= user.getE01BTHKEY().trim()%>
             </td> 
            <td nowrap> 
              <div align="right">Nombre :</div>
            </td>
            <td nowrap> 
              	<input type="text" name="E01BTHNME" size="52" maxlength="45" value="<%= user.getE01BTHNME().trim()%>">
              	<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0"  > 
             </td> 
         </tr>
           <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Estado Grupo :</div>
            </td>
            <td nowrap> 
              	<input type="text" name="E01BTHSTS" size="2" maxlength="1" value="<%= user.getE01BTHSTS().trim()%>">
              	<a href="javascript:GetCode('E01BTHSTS','STATIC_user_status.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0" ></a>
              	<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0"  > 
             </td>  
            <td nowrap> 
              <div align="right">Frecuencia Cambio Contrase�a :</div>
            </td>
            <td nowrap> 
              	<input type="text" name="E01BTHCHG" size="6" maxlength="5" value="<%= user.getE01BTHCHG().trim()%>" onkeypress="enterInteger(event)">
             </td> 


          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Idioma :</div>
            </td>
            <td nowrap> 
               <select name="E01BTHLAN">
                <option value=" "
	           <% if (!(user.getE01BTHLAN().equals("S")
                    	|| user.getE01BTHLAN().equals("E")))
                	    out.print("selected"); %>>
                </option> 
                <option value="S" <%if (user.getE01BTHLAN().equals("S"))  out.print("selected");%>>Espa&ntilde;ol</option>
                <option value="E" <%if (user.getE01BTHLAN().equals("E"))  out.print("selected");%>>Ingles</option>
              </select>
            <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0"  > 
             </td>  
            <td nowrap> 
              <div align="right">Codigo de Banco :</div>
            </td>
            <td nowrap> 
              	<input type="text" name="E01BTHUBK" size="3" maxlength="2" value="<%= user.getE01BTHUBK().trim()%>">
				<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0"  > 
             </td> 
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
				<div align="right">Numero Sucursal :</div>
            </td>
            <td nowrap> 
            	<input type="text" name="E01BTHUBR" size="5" maxlength="4" value="<%= user.getE01BTHUBR().trim()%>" onkeypress="enterInteger(event)">
            	<a href="javascript:GetBranch('E01BTHUBR','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0"  ></a>
				<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0"  > 
            </td>  
            <td nowrap> 
              <div align="right">Centro de Costo :</div>
            </td>
            <td nowrap> 
              	<input type="text" name="E01BTHCCN" size="9" maxlength="8" value="<%= user.getE01BTHCCN().trim()%>" onkeypress="enterInteger(event)">
              	<a href="javascript:GetCostCenter('E01BTHCCN', getElement('E01BTHUBK').value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a> 
             </td> 
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Codigo de Oficial :</div>
            </td>
            <td nowrap> 
            	<input type="text" name="E01BTHOFC" size="4" maxlength="4" value="<%= user.getE01BTHOFC().trim()%>">
            	<a href="javascript:GetCodeCNOFC('E01BTHOFC','15')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
             </td>  
            <td nowrap> 
              <div align="right">Nivel de Autorizaci�n :</div>
            </td>
            <td nowrap > 
              	<input type="text" name="E01BTHAUT" size="2" maxlength="1" value="<%= user.getE01BTHAUT().trim()%>">
              	<a href="javascript:GetCode('E01BTHAUT','STATIC_user_authorization_level.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0" ></a> 
              	<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0"  > 
             </td> 
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Tipo Moneda Transf./Tesorer�a :</div>
            </td>
            <td nowrap> 
            	<select name="E01BTHFL7">
                	<option value=" " <% if (!(user.getE01BTHFL7().equals("1")||user.getE01BTHFL7().equals("2") || user.getE01BTHFL7().equals("3"))) out.print("selected"); %>> </option>
                	<option value="1" <% if (user.getE01BTHFL7().equals("1")) out.print("selected"); %>>Moneda Nacional</option>
                	<option value="2" <% if (user.getE01BTHFL7().equals("2")) out.print("selected"); %>>Moneda Extranjera</option>
                	<option value="3" <% if (user.getE01BTHFL7().equals("3")) out.print("selected"); %>>Ambas</option>
              	</select>
             </td>  
            <td nowrap> 
              <div align="right">Nivel de Consulta :</div>
            </td>
            <td nowrap> 
              	<input type="text" name="E01BTHINL" size="3" maxlength="2" value="<%= user.getE01BTHINL().trim()%>" onkeypress="enterInteger(event)">(0 - 9)
              </td> 
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Nivel Contabilizaci�n :</div>
            </td>
            <td nowrap> 
            	<input type="text" name="E01BTHACL" size="3" maxlength="2" value="<%= user.getE01BTHACL().trim()%>" onkeypress="enterInteger(event)">(0 - 9)
             </td>  
            <td nowrap> 
              <div align="right"></div>
            </td>
            <td nowrap> 
             </td>  
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Primer Rango Lotes Desde :</div>
            </td>
            <td nowrap> 
              	<input type="text" name="E01BTHFB1" size="6" maxlength="5" value="<%= user.getE01BTHFB1().trim()%>" onkeypress="enterInteger(event)">
              </td> 
            <td nowrap> 
              <div align="right">Primer Rango Lotes Hasta :</div>
            </td>
            <td nowrap> 
            	<input type="text" name="E01BTHTB1" size="6" maxlength="5" value="<%= user.getE01BTHTB1().trim()%>" onkeypress="enterInteger(event)">
             </td>  
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Segundo Rango Lotes Desde :</div>
            </td>
            <td nowrap> 
              	<input type="text" name="E01BTHFB2" size="6" maxlength="5" value="<%= user.getE01BTHFB2().trim()%>" onkeypress="enterInteger(event)">
              </td> 
            <td nowrap> 
              <div align="right">Segundo Rango Lotes Hasta :</div>
            </td>
            <td nowrap> 
            	<input type="text" name="E01BTHTB2" size="6" maxlength="5" value="<%= user.getE01BTHTB2().trim()%>" onkeypress="enterInteger(event)">
             </td>  
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Negociaci�n Carta Cr�dito Desde :</div>
            </td>
            <td nowrap> 
              	<input type="text" name="E01BTHFB3" size="6" maxlength="5" value="<%= user.getE01BTHFB3().trim()%>" onkeypress="enterInteger(event)">
              </td> 
            <td nowrap> 
              <div align="right">Negociaci�n Carta Cr�dito Hasta :</div>
            </td>
            <td nowrap> 
            	<input type="text" name="E01BTHTB3" size="6" maxlength="5" value="<%= user.getE01BTHTB3().trim()%>" onkeypress="enterInteger(event)">
             </td>  
          </tr>
         </table>
      </td>
    </tr>
  </table>

 
  <h4>Informaci�n Aprobaci�n</h4>
   <table  class="tableinfo">
    <tr > 
      <td nowrap >
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <% if (user.getH01FLGWK3().equals("Y")) { %>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
				<TD nowrap align="right">Moneda Extranjera Rango de Tolerancia :</TD>
				<TD nowrap>
					<INPUT type="text" name="E01BTHANG" size="7" maxlength="6" value="<%= user.getE01BTHANG().trim()%>" onkeypress="enterDecimal()"> %
				</TD>
				<TD nowrap></TD>
				<TD nowrap></TD>
			</tr>
			<% } %>
			
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Transacci�n (Moneda/Monto) :</div>
            </td> 
            <td nowrap> 
              	<input type="text" id="E01BTHCCY" name="E01BTHCCY" size="4" maxlength="3" value="<%= user.getE01BTHCCY().trim()%>">
              	<a href="javascript:GetCurrency('E01BTHCCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0"></a> 
              	<input type="text" name="E01BTHALM" size="17" maxlength="15" value="<%= user.getE01BTHALM().trim()%>" onkeypress="enterDecimal()">
              </td> 
            <td nowrap> 
              <div align="right">Total :</div>
            </td>
            <td nowrap> 
            	<input type="text" name="E01BTHAM2" size="17" maxlength="15" value="<%= user.getE01BTHAM2().trim()%>" onkeypress="enterDecimal()">
             </td>  
          </tr>
          
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap colspan="4"> 
              <div align="left"><b>Aprobaci&oacute;n L&iacute;neas de Cr&eacute;dito</b></div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Min/Max Referencia :</div>
            </td>
            <td nowrap> 
              <select name="E01BTHFL5">
                <option value=" " <% if (user.getE01BTHFL5().equals(" ")) out.print("selected"); %>>Moneda del Producto</option>
                <option value="6" <% if (user.getE01BTHFL5().equals("6")) out.print("selected"); %>>SMMLV</option>
              </select>
              </td> 
            <td nowrap></td>
            <td nowrap></td>  
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Monto M&iacute;nimo Apertura :</div>
            </td>
            <td nowrap> 
              	<input type="text" name="E01BTHAM4" size="17" maxlength="15" value="<%= user.getE01BTHAM4().trim()%>" onkeypress="enterDecimal()">
              </td> 
            <td nowrap> 
              <div align="right">Monto M&aacute;ximo Apertura :</div>
            </td>
            <td nowrap> 
              	<input type="text" name="E01BTHAM5" size="17" maxlength="15" value="<%= user.getE01BTHAM5().trim()%>" onkeypress="enterDecimal()">
             </td>  
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap colspan="4"> 
              <div align="left"><b>Aprobaci&oacute;n Certificados de deposito</b></div>
            </td>
          </tr>

          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
				<TD nowrap align="right">Tipo de Tolerancia</TD>
				<TD nowrap>
               <select name="E01BTHTFL">
                   <option value=" " <% if (!(user.getE01BTHTFL().equals("F")||user.getE01BTHTFL().equals("%"))) out.print("selected"); %>> </option>
                   <option value="F" <% if (user.getE01BTHTFL().equals("F")) out.print("selected"); %>>Fijo</option>
                   <option value="%" <% if (user.getE01BTHTFL().equals("%")) out.print("selected"); %>>Porcentaje</option>
                </select>
             </td>
            <td nowrap> 
              <div align="right"></div>
            </td>
            <td nowrap> 
			</td> 
			</TR>          
          
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 

            <td nowrap> 
              <div align="right">Limite inferior tolerancia de tasa :</div>
            </td>
            <td nowrap> 
            <div align="left"> 
              <input type="text" name="E01BTHPR1" size="9" maxlength="8" value="<%= user.getE01BTHPR1().trim()%>" onkeypress="enterDecimal()" >
             </div>
			</td> 
				<TD nowrap align="right">Limite Superior Tolerancia de tasa</TD>
				<TD nowrap>
               <input type="text" name="E01BTHPR2" size="9" maxlength="8" value="<%= user.getE01BTHPR2().trim()%>" onkeypress="enterDecimal()" >
            </td> 
          </tr>  
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Monto Minimo:</div>
            </td>
            <td nowrap> 
              <input type="text" name="E01BTHAM1" size="16" maxlength="15" value="<%= user.getE01BTHAM1().trim()%>" onkeypress="enterDecimal()" >
			</td> 
				<TD nowrap align="right">Monto Maximo</TD>
				<TD nowrap>
               <input type="text" name="E01BTHAM3" size="16" maxlength="15" value="<%= user.getE01BTHAM3().trim()%>" onkeypress="enterDecimal()" >
            </td> 
			</TR>          
          
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap colspan="4"> 
              <div align="left"><b>Aprobaci�n Devoluci�n de Cheques</b></div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">M�ximo Diario (Moneda/Monto) :</div>
            </td>
            <td nowrap> 
              	<input type="text" id="E01EUPCCY" name="E01EUPCCY" size="4" maxlength="3" value="<%= user.getE01BTHCCY().trim()%>">
              	<a href="javascript:GetCurrency('E01EUPCCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0"></a> 
              	<input type="text" name="E01BTHAM2" size="17" maxlength="15" value="<%= user.getE01BTHAM2().trim()%>" onkeypress="enterDecimal()">
              </td> 
            <td nowrap> 
              <div align="right">Nivel de Aprobaci�n :</div>
            </td>
            <td nowrap> 
               <select name="E01BTHAPL">
                <option value=" " <% if (!(user.getE01BTHAPL().equals("1")||user.getE01BTHAPL().equals("2") || user.getE01BTHAPL().equals("3"))) out.print("selected"); %>> 
                </option>
                <option value="1" <% if (user.getE01BTHAPL().equals("1")) out.print("selected"); %>>Banco</option>
                <option value="2" <% if (user.getE01BTHAPL().equals("2")) out.print("selected"); %>>Lote</option>
                <option value="3" <% if (user.getE01BTHAPL().equals("3")) out.print("selected"); %>>Todo</option>
              </select>
             </td>  
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap colspan="4"> 
              <div align="left"><b>Usuario Extranjero</b></div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Nivel de Autorizaci�n :</div>
            </td>
            <td nowrap> 
               <select name="E01BTHF01">
                <option value="N" <% if (!(user.getE01BTHF01().equals("1")||user.getE01BTHF01().equals("2") || user.getE01BTHF01().equals("3"))) out.print("selected"); %>> 
                </option>
                <option value="1" <% if (user.getE01BTHF01().equals("1")) out.print("selected"); %>>Entrar Solicitud</option>
                <option value="2" <% if (user.getE01BTHF01().equals("2")) out.print("selected"); %>>Aprobar Solicitud</option>
                <option value="3" <% if (user.getE01BTHF01().equals("3")) out.print("selected"); %>>Entrar/Aprobar Solicitud</option>
               </select>
              </td> 
            <td nowrap> 
              <div align="right">Sucursal Extranjera :</div>
            </td>
            <td nowrap> 
            	<input type="text" name="E01BTHUC2" size="4" maxlength="3" value="<%= user.getE01BTHUC2().trim()%>">
             </td>  
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">C�digo Oficial Extranjero :</div>
            </td>
            <td nowrap> 
				<input type="text" name="E01BTHUC1" size="4" maxlength="3" value="<%= user.getE01BTHUC1().trim()%>"> 
				<a href="javascript:GetCodeCNOFC('E01BTHUC1','15')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a>              
			</td> 
            <td nowrap> 
              <div align="right">C�digo Agencia F�sica(CAB) : </div>
			</td>
            <td nowrap> 
             <INPUT type="text" name="E01BTHAOF" size="5" maxlength="4" value="<%= user.getE01BTHAOF().trim()%>" onkeypress="enterInteger(event)">
            	<A href="javascript:GetCodeCNOFC('E01BTHAOF','OV')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0">
				</A></td>  
          </tr>
          
        </table>
        </td>
      </tr>
    </table>
    
  <h4>Caracter�sticas Adicionales</h4>
    
  <table  class="tableinfo">
    <tr> 
      <td nowrap > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Asientos Contables :</div>
            </td>
            <td nowrap> 
              <input type="radio" name="E01BTHCGL" value="Y" <%if (user.getE01BTHCGL().equals("Y")) out.print("checked"); %>>S�
              <input type="radio" name="E01BTHCGL" value="N" <%if (!user.getE01BTHCGL().equals("Y")) out.print("checked"); %>>No
             </td> 
            <td nowrap> 
              <div align="right">Cambiar No. de Clientes :</div>
            </td>
            <td nowrap> 
              <input type="radio" name="E01BTHCCU" value="Y" <%if (user.getE01BTHCCU().equals("Y")) out.print("checked"); %>>S�
              <input type="radio" name="E01BTHCCU" value="N" <%if (!user.getE01BTHCCU().equals("Y")) out.print("checked"); %>>No
             </td>  
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Asientos Cuentas de Detalle :</div>
            </td>
            <td nowrap> 
              <input type="radio" name="E01BTHRTL" value="Y" <%if (user.getE01BTHRTL().equals("Y")) out.print("checked"); %>>S�
              <input type="radio" name="E01BTHRTL" value="N" <%if (!user.getE01BTHRTL().equals("Y")) out.print("checked"); %>>No
             </td> 
            <td nowrap> 
              <div align="right">Cambiar Estado de la Cuenta :</div>
            </td>
            <td nowrap> 
              <input type="radio" name="E01BTHCAC" value="Y" <%if (user.getE01BTHCAC().equals("Y")) out.print("checked"); %>>S�
              <input type="radio" name="E01BTHCAC" value="N" <%if (!user.getE01BTHCAC().equals("Y")) out.print("checked"); %>>No
             </td>  
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Asientos Contratos (Activos) :</div>
            </td>
            <td nowrap> 
              <input type="radio" name="E01BTHASS" value="Y" <%if (user.getE01BTHASS().equals("Y")) out.print("checked"); %>>S�
              <input type="radio" name="E01BTHASS" value="N" <%if (!user.getE01BTHASS().equals("Y")) out.print("checked"); %>>No
             </td> 
            <td nowrap> 
              <div align="right">Cambiar Retenciones y Garant�as :</div>
            </td>
            <td nowrap> 
              <input type="radio" name="E01BTHCHL" value="Y" <%if (user.getE01BTHCHL().equals("Y")) out.print("checked"); %>>S�
              <input type="radio" name="E01BTHCHL" value="N" <%if (!user.getE01BTHCHL().equals("Y")) out.print("checked"); %>>No
             </td>  
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Asientos Contratos(Pasivos) :</div>
            </td>
            <td nowrap> 
              <input type="radio" name="E01BTHLIB" value="Y" <%if (user.getE01BTHLIB().equals("Y")) out.print("checked"); %>>S�
              <input type="radio" name="E01BTHLIB" value="N" <%if (!user.getE01BTHLIB().equals("Y")) out.print("checked"); %>>No
             </td> 
            <td nowrap> 
              <div align="right">Aprobar Contratos (Activos) :</div>
            </td>
            <td nowrap> 
              <input type="radio" name="E01BTHLNA" value="Y" <%if (user.getE01BTHLNA().equals("Y")) out.print("checked"); %>>S�
              <input type="radio" name="E01BTHLNA" value="N" <%if (!user.getE01BTHLNA().equals("Y")) out.print("checked"); %>>No
             </td>  
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Asientos Cartas de Cr�dito :</div>
            </td>
            <td nowrap> 
              <input type="radio" name="E01BTHLCR" value="Y" <%if (user.getE01BTHLCR().equals("Y")) out.print("checked"); %>>S�
              <input type="radio" name="E01BTHLCR" value="N" <%if (!user.getE01BTHLCR().equals("Y")) out.print("checked"); %>>No
             </td> 
            <td nowrap> 
              <div align="right">Aprobar Contratos(Pasivos) :</div>
            </td>
            <td nowrap> 
              <input type="radio" name="E01BTHCDA" value="Y" <%if (user.getE01BTHCDA().equals("Y")) out.print("checked"); %>>S�
              <input type="radio" name="E01BTHCDA" value="N" <%if (!user.getE01BTHCDA().equals("Y")) out.print("checked"); %>>No
             </td>  
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Asientos Reembolso :</div>
            </td>
            <td nowrap> 
              <input type="radio" name="E01BTHRBM" value="Y" <%if (user.getE01BTHRBM().equals("Y")) out.print("checked"); %>>S�
              <input type="radio" name="E01BTHRBM" value="N" <%if (!user.getE01BTHRBM().equals("Y")) out.print("checked"); %>>No
             </td> 
            <td nowrap> 
              <div align="right">Aprobar S/G Pagos &amp; Recibos :</div>
            </td>
            <td nowrap> 
              <input type="radio" name="E01BTHAOP" value="Y" <%if (user.getE01BTHAOP().equals("Y")) out.print("checked"); %>>S�
              <input type="radio" name="E01BTHAOP" value="N" <%if (!user.getE01BTHAOP().equals("Y")) out.print("checked"); %>>No
             </td>  
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Asientos Hipotecas :</div>
            </td>
            <td nowrap> 
              <input type="radio" name="E01BTHMLF" value="Y" <%if (user.getE01BTHMLF().equals("Y")) out.print("checked"); %>>S�
              <input type="radio" name="E01BTHMLF" value="N" <%if (!user.getE01BTHMLF().equals("Y")) out.print("checked"); %>>No
             </td> 
            <td nowrap> 
              <div align="right">Aprobar Garant�as :</div>
            </td>
            <td nowrap> 
              <input type="radio" name="E01BTHCLP" value="Y" <%if (user.getE01BTHCLP().equals("Y")) out.print("checked"); %>>S�
              <input type="radio" name="E01BTHCLP" value="N" <%if (!user.getE01BTHCLP().equals("Y")) out.print("checked"); %>>No
             </td>  
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Asientos Varios :</div>
            </td>
            <td nowrap> 
              <input type="radio" name="E01BTHOTH" value="Y" <%if (user.getE01BTHOTH().equals("Y")) out.print("checked"); %>>S�
              <input type="radio" name="E01BTHOTH" value="N" <%if (!user.getE01BTHOTH().equals("Y")) out.print("checked"); %>>No
             </td> 
            <td nowrap> 
              <div align="right">Aprobar Cartas de Cr�dito :</div>
            </td>
            <td nowrap> 
              <input type="radio" name="E01BTHLEC" value="Y" <%if (user.getE01BTHLEC().equals("Y")) out.print("checked"); %>>S�
              <input type="radio" name="E01BTHLEC" value="N" <%if (!user.getE01BTHLEC().equals("Y")) out.print("checked"); %>>No
             </td>  
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Inversiones Bancarias :</div>
            </td>
            <td nowrap> 
              <input type="radio" name="E01BTHFL2" value="Y" <%if (user.getE01BTHFL2().equals("Y")) out.print("checked"); %>>S�
              <input type="radio" name="E01BTHFL2" value="N" <%if (!user.getE01BTHFL2().equals("Y")) out.print("checked"); %>>No
             </td> 
            <td nowrap> 
              <div align="right">Aprobar L�neas de Cr�dito :</div>
            </td>
            <td nowrap> 
              <input type="radio" name="E01BTHLIC" value="Y" <%if (user.getE01BTHLIC().equals("Y")) out.print("checked"); %>>S�
              <input type="radio" name="E01BTHLIC" value="N" <%if (!user.getE01BTHLIC().equals("Y")) out.print("checked"); %>>No
             </td>  
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Cambiar Asientos Extendidos :</div>
            </td>
            <td nowrap> 
              <input type="radio" name="E01BTHILF" value="Y" <%if (user.getE01BTHILF().equals("Y")) out.print("checked"); %>>S�
              <input type="radio" name="E01BTHILF" value="N" <%if (!user.getE01BTHILF().equals("Y")) out.print("checked"); %>>No
             </td> 
            <td nowrap> 
              <div align="right">Aprobar S/G Lineas de Cr�dito :</div>
            </td>
            <td nowrap> 
              <input type="radio" name="E01BTHODL" value="Y" <%if (user.getE01BTHODL().equals("Y")) out.print("checked"); %>>S�
              <input type="radio" name="E01BTHODL" value="N" <%if (!user.getE01BTHODL().equals("Y")) out.print("checked"); %>>No
             </td>  
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Asientos Transferencias Externas :</div>
            </td>
            <td nowrap> 
              <input type="radio" name="E01BTHAEW" value="Y" <%if (user.getE01BTHAEW().equals("Y")) out.print("checked"); %>>S�
              <input type="radio" name="E01BTHAEW" value="N" <%if (!user.getE01BTHAEW().equals("Y")) out.print("checked"); %>>No
             </td> 
            <td nowrap> 
              <div align="right">Aprobar Contratos Moneda Extranjera :</div>
            </td>
            <td nowrap> 
              <input type="radio" name="E01BTHAFE" value="Y" <%if (user.getE01BTHAFE().equals("Y")) out.print("checked"); %>>S�
              <input type="radio" name="E01BTHAFE" value="N" <%if (!user.getE01BTHAFE().equals("Y")) out.print("checked"); %>>No
             </td>  
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Propuesta de Credito (Aprobacion) :</div>
            </td>
            <td nowrap> 
              <input type="radio" name="E01BTHFL1" value="Y" <%if (user.getE01BTHFL1().equals("Y")) out.print("checked"); %>>S�
              <input type="radio" name="E01BTHFL1" value="N" <%if (!user.getE01BTHFL1().equals("Y")) out.print("checked"); %>>No
             </td> 
            <td nowrap> 
              <div align="right">Aprobar Excede Tasa Interes :</div>
            </td>
            <td nowrap> 
              <input type="radio" name="E01BTHFL4" value="Y" <%if (user.getE01BTHFL4().equals("Y")) out.print("checked"); %>>S�
              <input type="radio" name="E01BTHFL4" value="N" <%if (!user.getE01BTHFL4().equals("Y")) out.print("checked"); %>>No
             </td>  
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap>
              <div align="right">Aprobar Precio Mercado Sobre/Debajo Tolerancia :</div>
            </td>
            <td nowrap>
              <INPUT type="radio" name="E01BTHFG3" value="Y" <%if (user.getE01BTHFG3().equals("Y")) out.print("checked"); %>>Si
              <INPUT type="radio" name="E01BTHFG3" value="N" <%if (!user.getE01BTHFG3().equals("Y")) out.print("checked"); %>>No
             </td>            
            <td nowrap> 
              <div align="right">Aprobar Sobregiro Operaciones Comerciales Exterior:</div>
            </td>
            <td nowrap> 
              <input type="radio" name="E01BTHF02" value="Y" <%if ( user.getE01BTHF02().equals("Y")) out.print("checked"); %>>S�
              <input type="radio" name="E01BTHF02" value="N" <%if (!user.getE01BTHF02().equals("Y")) out.print("checked"); %>>No
             </td> 
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap align="right">Nivel de Aprobaci�n de Clientes :</td>
            <td nowrap> 
             <SELECT name="E01BTHF31">
					<OPTION value=" " <% if (!(user.getE01BTHF31().equals("N")||user.getE01BTHF31().equals("1")||user.getE01BTHF31().equals("2"))) out.print("selected"); %>> </OPTION>
					<OPTION value="N" <% if (user.getE01BTHF31().equals("N")) out.print("selected"); %>>No Autorizado </OPTION>
					<OPTION value="1" <% if (user.getE01BTHF31().equals("1")) out.print("selected"); %>>Regular </OPTION>
					<OPTION value="2" <% if (user.getE01BTHF31().equals("2")) out.print("selected"); %>>Regular y Cambio ID </OPTION>
			 </SELECT>
			</td> 
            <td nowrap> 
              <div align="right">Tipos Cheques Oficiales :</div>
            </td>
            <td nowrap> 
               <select name="E01BTHOCK">
                <option value=" " <% if (!(user.getE01BTHOCK().equals("A")||user.getE01BTHOCK().equals("N"))) out.print("selected"); %>> </option>
                <option value="A" <% if (user.getE01BTHOCK().equals("A")) out.print("selected"); %>>Todos los tipos</option>
                <option value="N" <% if (user.getE01BTHOCK().equals("N")) out.print("selected"); %>>No Autorizado</option>
                </select>
             </td> 
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap align="right">Aprobaci�n de Transferencias : 
            </td>
            <td nowrap> 
              <SELECT name="E01BTHFL9">
					<OPTION value="1" <% if (user.getE01BTHFL9().equals("1")) out.print("selected"); %>>Internas </OPTION>
					<OPTION value="2" <% if (user.getE01BTHFL9().equals("2")) out.print("selected"); %>>Ext/Recibidas e Internas </OPTION>
					<OPTION value="3" <% if (user.getE01BTHFL9().equals("3")) out.print("selected"); %>>Ext/Recibidas </OPTION>
					<OPTION value="4" <% if (user.getE01BTHFL9().equals("4")) out.print("selected"); %>>Ext/Enviadas </OPTION>
					<OPTION value="5" <% if (user.getE01BTHFL9().equals("5")) out.print("selected"); %>>Todas </OPTION>
			 </SELECT>
             </td> 
          	  <td nowrap align="right" >Autorizaci�n a Par�metros :</td>
          	  <td nowrap> 
            	<select name="E01BTHFG6">
                	<option value="N" <% if (user.getE01BTHFG6().equals("N")) out.print("selected"); %>>Ninguna</option>
                	<option value="1" <% if (user.getE01BTHFG6().equals("1")) out.print("selected"); %>>Consulta</option>
                	<option value="2" <% if (user.getE01BTHFG6().equals("2")) out.print("selected"); %>>Mantenimiento</option>
                	<option value="3" <% if (user.getE01BTHFG6().equals("3")) out.print("selected"); %>>Aprobaci�n</option>
                	<option value="4" <% if (user.getE01BTHFG6().equals("4")) out.print("selected"); %>>Aprob.+ Mant.</option>
              	</select>
            </td> 				
            </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
				<TD nowrap align="right">Tipo Usuario Inversiones :</TD>
				<TD nowrap>
            	<select name="E01BTHFG4">
                	<option value="  " <% if (!(user.getE01BTHFG4().equals("PR")||user.getE01BTHFG4().equals("TR"))) out.print("selected"); %>>Ninguno</option>
                	<option value="PR" <% if (user.getE01BTHFG4().equals("PR")) out.print("selected"); %>>Banca Privada</option>
                	<option value="TR" <% if (user.getE01BTHFG4().equals("TR")) out.print("selected"); %>>Tesorer�a</option>
              	</select>
				</TD>
            <td nowrap> 
              <div align="right">Tipo de Banca :</div>
            </td>
            <td nowrap> 
            <div align="left"> 
                <input type="text" name="E01BTHUC3" size="5" maxlength="4" value="<%= user.getE01BTHUC3().trim()%>">
                <a href="javascript:GetCodeCNOFC('E01BTHUC3','S5')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a></div>
			</td> 
			</TR>          

        </table>
      </td>
    </tr>
  </table>
  <br>
   <p align="center">
 <%if  (!userPO.getPurpose().equals("INQUIRY")) { %>
    		<input id="EIBSBTN" type=submit name="Submit" value="Actualizar">
            <%if (user.getH01OPECOD().trim().equals("0002")) { %>
    		<input id="EIBSBTN" type=submit name="Submit" value="Eliminar" onclick="del()">
			<% } %>
<% } %>			
  </p>
</form>
<script type="text/javascript">
	showPassword('<%= currUser.getE01LGM() %>' == '2');
	
<% 	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) { %>
	$("input[type='text']").attr("readonly", "readonly");  
	$("select" ).add("input[type='radio']").attr("disabled", "disabled");  
	$("img[title='null']").add("img[title='ayuda']").hide(); 
<% } %>
</script>
</body>
</html>

