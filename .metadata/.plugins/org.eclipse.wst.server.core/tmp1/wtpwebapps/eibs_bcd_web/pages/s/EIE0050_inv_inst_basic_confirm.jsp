<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Instrumentos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">

<jsp:useBean id="invInst" class="datapro.eibs.beans.EIE005001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>


<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language = "javascript">
function doPrint(){
	if(!window.print){
       var msg ="This browser doesn't allow print";
	   alert(msg);
	   return;}
	
    window.focus();
	window.print();

	return;
}
function search(){
  document.forms[0].SCREEN.value = 34;
  document.forms[0].submit();
}
</SCRIPT>

</head>

<body>

 
<h3 align="center"> Operación Terminada</h3>
<hr size="4">
<table border="0" class="tableinfo" width="100%">
  <tr> 
    <td colspan="3">
      <div align="center"> Esta página no es válida como recibo oficial.</div>
    </td>
  </tr>
</table>
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0050">
  <h4>Información Básica 
      <input type="hidden" name="SCREEN"  value="400" >
    </h4>
    <table  class="tableinfo" width="715">
      <tr > 
        <td nowrap> 
          
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Código / Descripción :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" readonly  name="E01ISIIIC" size="5" maxlength="3" value="<%= invInst.getE01ISIIIC()%>" >
              <input type="text" readonly  name="E01ISIDSC" size="35" maxlength="30" value="<%= invInst.getE01ISIDSC()%>">
            </td>
            <td nowrap width="14%" > 
              <div align="right">Estado Interno :</div>
            </td>
            <td nowrap width="33%" > <% if(invInst.getE01ISISTS().equals("P")) out.print("Pendiente");
				 else if(invInst.getE01ISISTS().equals("R")) out.print("Redimido");
				 else if(invInst.getE01ISISTS().equals("A")) out.print("Activo");
				 else if(invInst.getE01ISISTS().equals("C")) out.print("Cancelado");
				 else out.print("Activo");%> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Moneda Instrumento :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" readonly  name="E01ISICCY" size="5" maxlength="3" value="<%= invInst.getE01ISICCY()%>">
            </td>
            <td nowrap width="14%" > 
              <div align="right">Moneda Bloomberg :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" readonly  name="E01ISIBCY" size="5" maxlength="3" value="<%= invInst.getE01ISIBCY()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Tipo Instrumento :</div>
            </td>
            <td nowrap width="36%" >
              <INPUT type="text" readonly name="E01PTYDSCY" size="35" maxlength="25" value="<%= invInst.getE01PTYDSC() %>">
              <input type="hidden" name="E01ISIPTY"  value="<%= invInst.getE01ISIPTY()%>" >
            </td>
            <td nowrap width="14%" > 
              <div align="right">Símbolo :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" readonly  name="E01ISISYM" size="20" maxlength="15" value="<%= invInst.getE01ISISYM()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Nombre Emisor :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" readonly  name="E01ISIENM" size="50" maxlength="45" value="<%= invInst.getE01ISIENM()%>">
            </td>
            <td nowrap width="14%" > 
              <div align="right">Número ISIN / Serie :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" readonly  name="E01ISINUM" size="12" maxlength="12" value="<%= invInst.getE01ISINUM()%>">
              / 
              <input type="text" readonly  name="E01ISISER" size="3" maxlength="2" value="<%= invInst.getE01ISISER()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Marcar como Complex :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="hidden" name="E01ISIPRE" value="<%= invInst.getE01ISIPRE()%>">
              <input type="radio" disabled  name="CE01ISIPRE" value="Y" onClick="document.forms[0].E01ISIPRE.value='Y'"
			  <%if(invInst.getE01ISIPRE().equals("Y")) out.print("checked");%>>
              Si 
              <input type="radio" disabled  name="CE01ISIPRE" value="N" onClick="document.forms[0].E01ISIPRE.value='N'"
			  <%if(invInst.getE01ISIPRE().equals("N")) out.print("checked");%>>
              No </td>
            <td nowrap width="14%" > 
              <div align="right">Código Común/CUSIP :</div>
            </td>
            <td nowrap width="33%" >  <INPUT type="text" readonly name="E01ISICCD" size="16" maxlength="15" value="<%= invInst.getE01ISICCD()%>">
              <input type="text" readonly  name="E01ISICUS" size="12" maxlength="12" value="<%= invInst.getE01ISICUS()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Código País :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" readonly  name="E01ISICTC" size="5" maxlength="3" value="<%= invInst.getE01ISICTC()%>">
              <a href="javascript:GetCodeCNOFC('E01ISICTC','03')"> </a> </td>
            <td nowrap width="14%" > 
              <div align="right">Nombre País :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" readonly  name="E01ISICTR" size="30" maxlength="30" value="<%= invInst.getE01ISICTR()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Calificacion 'Standard &amp; Poor':</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" readonly  name="E01ISIRSP" size="10" maxlength="10" value="<%= invInst.getE01ISIRSP()%>">
            </td>
            <td nowrap width="14%" > 
              <div align="right">Calificacion 'Moodys' :</div>
            </td>
            <td nowrap width="33%" > 
              <div align="left"> 
                <input type="text" readonly  name="E01ISIRMD" size="10" maxlength="10" value="<%= invInst.getE01ISIRMD()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Nota Rango :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly  name="E01ISIRGN" size="45" maxlength="45" value="<%= invInst.getE01ISIRGN()%>">
            </td>
            <td nowrap > 
              <div align="right">Precio en Porcentaje :</div>
            </td>
            <td nowrap > 
              <input type="hidden" name="E01ISIPER" value="<%= invInst.getE01ISIPER()%>">
              <input type="radio" disabled  name="CE01ISIPER " value="Y" onClick="document.forms[0].E01ISIPER .value='Y'"
			  <%if(invInst.getE01ISIPER ().equals("Y")) out.print("checked");%>>
              Si 
              <input type="radio" disabled  name="CE01ISIPER " value="N" onClick="document.forms[0].E01ISIPER .value='N'"
			  <%if(invInst.getE01ISIPER ().equals("N")) out.print("checked");%>>
              No </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Fecha Emisión :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" readonly  name="E01ISISDM" size="3" maxlength="2" value="<%= invInst.getE01ISISDM()%>">
              <input type="text" readonly  name="E01ISISDD" size="3" maxlength="2" value="<%= invInst.getE01ISISDD()%>">
              <input type="text" readonly  name="E01ISISDY" size="3" maxlength="2" value="<%= invInst.getE01ISISDY()%>">
            </td>
            <td nowrap width="14%" > 
              <div align="right">Modo Actualización :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="hidden" name="E01ISIMOD" value="<%= invInst.getE01ISIMOD()%>">
              <input type="radio" disabled  name="CE01ISIMOD" value="M" onClick="document.forms[0].E01ISIMOD.value='M'"
			  <%if(invInst.getE01ISIMOD().equals("M")) out.print("checked");%>>
              Manual 
              <input type="radio" disabled  name="CE01ISIMOD" value="B" onClick="document.forms[0].E01ISIMOD.value='B'"
			  <%if(invInst.getE01ISIMOD().equals("B")) out.print("checked");%>>
              Bloomberg </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Tipo Cálculo :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" readonly  name="E01ISICTP" size="7" maxlength="6" value="<%= invInst.getE01ISICTP()%>">
            </td>
            <td nowrap width="14%" > 
              <div align="right">Descripción Tipo de Calculo :</div></td>
            <td nowrap width="33%" > 
              <input type="text" readonly  name="E01ISICTD" size="35" maxlength="35" value="<%= invInst.getE01ISICTD()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="34%" > 
              <div align="right">Rendimiento :</div>
            </td>
            <td nowrap width="34%" > 
              <input type="text" name="E01ISIYLD" size="11" maxlength="9" value="<%= invInst.getE01ISIYLD()%>" readonly>
            </td>
            <td nowrap width="34%" > 
              <div align="right">Estado del instrumento en el Mercado :</div></td>
            <td nowrap width="66%" > 
              <input type="text" name="E01ISIMKS" size="15" maxlength="10" value="<%= invInst.getE01ISIMKS()%>" >
            </td>
          </tr>
          	<tr id="trclear"> 
            <td nowrap width="34%" > 
              <div align="right">Cupon Cero :</div>
            </td>
            <td nowrap width="34%" > 
              <input type="text" readonly  name="E01ISIZER" size="5" maxlength="3" 
				value="<% if (invInst.getE01ISIZER().equals("Y")) out.print("YES");
							else if (invInst.getE01ISIZER().equals("N")) out.print(" NO");
							else out.print("");%>" >
            </td>
            <td nowrap width="34%" >
               <div align="right">Aceptado para negociar en Europa :</div></td>
            <td nowrap width="66%" >
            	<input type="text" readonly  name="E01ISIEUR" size="2" maxlength="1" 
				value="<% if (invInst.getE01ISIEUR().equals("Y")) out.print("YES");
							else if (invInst.getE01ISIEUR().equals("N")) out.print(" NO");
							else out.print("");%>">
            </td>
          </tr><tr id="trdark"> 
            <td nowrap width="34%" > 
              <div align="right">Unidad de Medida :</div></td>
            <td nowrap width="34%" >
              <INPUT type="text" name="E01ISICMS" size="6" maxlength="6" value="<%= invInst.getE01ISICMS()%>" readonly>
            </td>
                        
            <td nowrap width="14%" > 
              <div align="right">Factor de Pool  :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" readonly  name="E01ISIPFA" size="11" maxlength="11" value="<%= invInst.getE01ISIPFA()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="14%" align="right">Permite Decimales en Cantidad : </td>
            <td nowrap width="34%" >
              <INPUT type="radio" name="E01ISIDAQ" value="Y" disabled
					<%if(invInst.getE01ISIDAQ().equals("Y")) out.print("checked");%>>Si 
              <INPUT type="radio" name="E01ISIDAQ" value="N" disabled
					<%if(invInst.getE01ISIDAQ().equals("N")) out.print("checked");%>>No
            </td>
            <td nowrap width="14%" align="right"> </td>
            <td nowrap > 
            </td>
          </tr>
          
        </table>
        </td>
      </tr>
    </table>
    <h4>Informacion Fiscal </h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Instrumento de US sujeto a IRS :</div>
            </td>
            <td nowrap width="36%" >            
                 <INPUT type="text" readonly name="E01ISIUSS" size="5" maxlength="3"
					value='<% if (invInst.getE01ISIUSS().equals("Y")) out.print("YES");
							else if (invInst.getE01ISIUSS().equals("N")) out.print(" NO");
							else out.print("");%>'>
			</td>
            <td nowrap width="14%" > 
              <div align="right">Fuente de Tasa de Impuesto :</div>
            </td>
            <td nowrap > 
                <div align="left"> 
                  <input type="text" readonly  name="E01ISITRS" size="11" maxlength="11" value="<%= invInst.getE01ISITRS()%>">
                </div>
              </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Codigo de Ingreso :</div>
            </td>
            <td nowrap width="36%"> 
              <div align="left"> 
                <input type="text" readonly  name="D01INCOME" size="50" maxlength="50" value="<%= invInst.getD01INCOME()%>">
              </div>
            </td>
            <td nowrap width="14%" > 
              <div align="right"> </div>
            </td>
            <td nowrap width="33" > 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
    <% if(invInst.getH01SCRCOD().equals("98") || invInst.getH01SCRCOD().equals("99") || invInst.getH01FLGWK1().equals("B")) { %> 
    <h4>Informacion Adicional</h4>
    <table  class="tableinfo">
      <tr > 
        <td nowrap> 
          <table cellpadding=2 cellspacing=0 width="100%" border="0">
            <tr id="trdark"> 
              <td nowrap width="34%" > 
                <div align="right">Fecha Vencimiento :</div>
              </td>
              <td nowrap width="34%" > 
                <input type="text" readonly  name="E01ISIMAM" size="3" maxlength="2" value="<%= invInst.getE01ISIMAM()%>">
                <input type="text" readonly  name="E01ISIMAD" size="3" maxlength="2" value="<%= invInst.getE01ISIMAD()%>">
                <input type="text" readonly  name="E01ISIMAY" size="3" maxlength="2" value="<%= invInst.getE01ISIMAY()%>">
              </td>
              <td nowrap width="34%" > 
                <div align="right"></div>
              </td>
              <td nowrap width="66%" >&nbsp; </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap width="34%" > 
                <div align="right">Tasa de Interes :</div>
              </td>
              <td nowrap > 
                <div align="left"> 
                  <input type="text" readonly  name="E01ISIRTE" size="11" maxlength="11" value="<%= invInst.getE01ISIRTE()%>">
                </div>
              </td>
              <td nowrap > 
                <div align="right">Tipo de Causacion :</div>
              </td>
              <td nowrap > 
                <select disabled  name="E01ISIATY">
                  <option value="1" <%if (invInst.getE01ISIATY().equals("1")) { out.print("selected"); }%>>Actual/Actual</option>
                  <option value="2" <%if (invInst.getE01ISIATY().equals("2")) {  out.print("selected"); }%>>Actual/365</option>
                  <option value="3" <%if (invInst.getE01ISIATY().equals("3")) {  out.print("selected"); }%>>Actual/365(366)</option>
                  <option value="4" <%if (invInst.getE01ISIATY().equals("4")) {  out.print("selected"); }%>>Actual/360</option>
                  <option value="5" <%if (invInst.getE01ISIATY().equals("5")) {  out.print("selected"); }%>>30/360</option>
                  <option value="6" <%if (invInst.getE01ISIATY().equals("6")) {  out.print("selected"); }%>>30E/360</option>
                  <option value="7" <%if (invInst.getE01ISIATY().equals("7")) {  out.print("selected"); }%>>22/252</option>
                                  
                </select>
              </td>
            </tr>
            <tr id="trdark"> 
              <td nowrap width="34%" > 
                <div align="right">Base de Calculo :</div>
              </td>
              <td nowrap width="34%" > 
                <input type="text" readonly  name="E01ISIBAS" size="5" maxlength="3" value="<%= invInst.getE01ISIBAS()%>">
              </td>
              <td nowrap width="34%" > 
                <div align="right">Tipo de Dias para Calculo :</div>
              </td>
              <td nowrap width="66%" > 
                <select disabled  name="E01ISIICT">
                  <option value="1" <%if (invInst.getE01ISIICT().equals("1")) { out.print("selected"); }%>>Calendar 
                  Days</option>
                  <option value="2" <%if (invInst.getE01ISIICT().equals("2")) {  out.print("selected"); }%>>Commercial 
                  Days</option>
                </select>
              </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap width="34%" > 
                <div align="right">Tabla de Tasa Flotante :</div>
              </td>
              <td nowrap width="34%" > 
                <input type="text" readonly  name="E01ISIFTB" size="2" maxlength="2" value="<%= invInst.getE01ISIFTB().trim()%>">
                <select disabled  name="E01ISIFTY">
                  <option value="FP" <%if (invInst.getE01ISIFTY().equals("FP")) { out.print("selected"); }%>> 
                  Primaria</option>
                  <option value="FS" <%if (invInst.getE01ISIFTY().equals("FS")) {  out.print("selected"); }%>> 
                  Secundaria</option>
                </select>
              </td>
              <td nowrap width="34%" > 
                <div align="right">Tasa Flotante :</div>
              </td>
              <td nowrap width="66%" > 
                <input type="text" readonly  name="E01ISIFRT" size="11" maxlength="11" value="<%= invInst.getE01ISIFRT()%>">
              </td>
            </tr>
            <tr id="trdark"> 
              <td nowrap width="34%" > 
                <div align="right">Dias / Fecha T + N :</div>
              </td>
              <td nowrap width="34%" > 
                <input type="text" readonly  name="E01ISIDTN" size="11" maxlength="11" value="<%= invInst.getE01ISIDTN()%>">
              </td>
              <td nowrap width="34%" > 
                <div align="right">Frecuencia de Pago :</div>
              </td>
              <td nowrap width="66%" > 
                <input type="text" readonly  name="E01ISIPFV" size="4" maxlength="4" value="<%= invInst.getE01ISIPFV().trim()%>" onKeyPress="enterInteger(event)">
                <select disabled  name="E01ISIPFC">
                  <option value="D" <% if(invInst.getE01ISIPFC().equals("D")) out.print("selected");%>>Day(s)</option>
                  <option value="M" <% if(invInst.getE01ISIPFC().equals("M")) out.print("selected");%>>Month(s)</option>
                  <option value="Q" <% if(invInst.getE01ISIPFC().equals("Q")) out.print("selected");%>>Quarter</option>
                  <option value="S" <% if(invInst.getE01ISIPFC().equals("S")) out.print("selected");%>>Semianually</option>
                  <option value="Y" <% if(invInst.getE01ISIPFC().equals("Y")) out.print("selected");%>>Anually</option>
                </select>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
    <%
     
    }
  %> 
    <h4>Dates</h4>
    <table  class="tableinfo">
      <tr > 
        <td nowrap> 
          <table cellpadding=2 cellspacing=0 width="100%" border="0">
            <tr id="trdark"> 
              <td nowrap width="22%" > 
                <div align="right">Ultima Fecha de Pago de Interes :</div></td>
              <td nowrap width="18%" > 
                <div align="left"> 
                  <input type="text" readonly  name="E01ISIINM" size="3" maxlength="2" value="<%= invInst.getE01ISIINM()%>">
                  <input type="text" readonly  name="E01ISIIND" size="3" maxlength="2" value="<%= invInst.getE01ISIIND()%>">
                  <input type="text" readonly  name="E01ISIINY" size="3" maxlength="2" value="<%= invInst.getE01ISIINY()%>">
                </div>
              </td>
              <td nowrap width="41%" > 
                <div align="right">Proxima Fecha de Pago de Interes :</div>
              </td>
              <td nowrap width="19%" > 
                <div align="left"> 
                  	<input type="text" readonly  name="E01ISINIM" size="3" maxlength="2" value="<%= invInst.getE01ISINIM()%>">
                	<input type="text" readonly  name="E01ISINID" size="3" maxlength="2" value="<%= invInst.getE01ISINID()%>">
              		<input type="text" readonly  name="E01ISINIY" size="3" maxlength="2" value="<%= invInst.getE01ISINIY()%>">
                </div>
              </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap width="22%" > 
                <div align="right">Ultima Fecha de Pago de Dividendos :</div>
              </td>
              <td nowrap width="18%" > 
                <div align="left"> 
                  <input type="text" readonly  name="E01ISIDIM" size="3" maxlength="2" value="<%= invInst.getE01ISIDIM()%>">
                  <input type="text" readonly  name="E01ISIDID" size="3" maxlength="2" value="<%= invInst.getE01ISIDID()%>">
                  <input type="text" readonly  name="E01ISIDIY" size="3" maxlength="2" value="<%= invInst.getE01ISIDIY()%>">
                </div>
              </td>
              <td nowrap width="41%" > 
                <div align="right">Proxima Fecha de Pago de  Dividendos </div>
              </td>
              <td nowrap width="19%" > 
                <div align="left">
                <input type="text" readonly  name="E01ISIDIM" size="3" maxlength="2" value="<%= invInst.getE01ISIDIM()%>">
                <input type="text" readonly  name="E01ISIDID" size="3" maxlength="2" value="<%= invInst.getE01ISIDID()%>">
                <input type="text" readonly  name="E01ISIDIY" size="3" maxlength="2" value="<%= invInst.getE01ISIDIY()%>">
                	
                </div>
              </td>
            </tr>
            <tr id="trdark"> 
              <td nowrap width="22%" > 
                <div align="right">Ultima Fecha de Pago de  Capital :</div>
              </td>
              <td nowrap width="18%" > 
              	  <input type="text" readonly  name="E01ISICAM" size="3" maxlength="2" value="<%= invInst.getE01ISICAM()%>">
                  <input type="text" readonly  name="E01ISICAD" size="3" maxlength="2" value="<%= invInst.getE01ISICAD()%>">
                  <input type="text" readonly  name="E01ISICAY" size="3" maxlength="2" value="<%= invInst.getE01ISICAY()%>">
              </td>
              <td nowrap width="41%" > 
                <div align="right">Proxima Fecha de Pago de  Capital :</div>
              </td>
              <td nowrap width="19%" > 
           		  <input type="text" readonly  name="E01ISINCM" size="3" maxlength="2" value="<%= invInst.getE01ISINCM()%>">
                  <input type="text" readonly  name="E01ISINCD" size="3" maxlength="2" value="<%= invInst.getE01ISINCD()%>">
                  <input type="text" readonly  name="E01ISINCY" size="3" maxlength="2" value="<%= invInst.getE01ISINCY()%>">     
              </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap width="22%" > 
                <div align="right">Primera Fecha de Cálculo :</div>
              </td>
              <td nowrap width="18%" > 
                <div align="left"> 
                	<input type="text" readonly  name="E01ISIFAM" size="3" maxlength="2" value="<%= invInst.getE01ISIFAM()%>">
               		<input type="text" readonly  name="E01ISIFAD" size="3" maxlength="2" value="<%= invInst.getE01ISIFAD()%>">
                	<input type="text" readonly  name="E01ISIFAY" size="3" maxlength="2" value="<%= invInst.getE01ISIFAY()%>">  
                </div>
              </td>
              <td nowrap width="41%" > 
                <div align="right">Próxima Fecha Call :</div>
              </td>
              <td nowrap width="19%" > 
                <input type="text" readonly  name="E01ISICLM" size="3" maxlength="2" value="<%= invInst.getE01ISICLM()%>">
                <input type="text" readonly  name="E01ISICLD" size="3" maxlength="2" value="<%= invInst.getE01ISICLD()%>">
                <input type="text" readonly  name="E01ISICLY" size="3" maxlength="2" value="<%= invInst.getE01ISICLY()%>">
              </td>
            </tr>
            <tr id="trdark"> 
              <td nowrap width="22%" > 
                <div align="right">Primera Fecha Cupón ::</div>
              </td>
              <td nowrap width="18%" > 
              	<input type="text" readonly  name="E01ISIFIM" size="3" maxlength="2" value="<%= invInst.getE01ISIFIM()%>">
              	<input type="text" readonly  name="E01ISIFID" size="3" maxlength="2" value="<%= invInst.getE01ISIFID()%>">
                <input type="text" readonly  name="E01ISIFIY" size="3" maxlength="2" value="<%= invInst.getE01ISIFIY()%>">
              </td>
              <td nowrap width="41%" > 
                <div align="right">Próxima Fecha Put :</div>
              </td>
              <td nowrap width="19%" > 
                <input type="text" readonly  name="E01ISIPUM" size="3" maxlength="2" value="<%= invInst.getE01ISIPUM()%>">
                <input type="text" readonly  name="E01ISIPUD" size="3" maxlength="2" value="<%= invInst.getE01ISIPUD()%>">
                <input type="text" readonly  name="E01ISIPUY" size="3" maxlength="2" value="<%= invInst.getE01ISIPUY()%>">
              </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap width="22%" > 
                <div align="right">Primera Fecha Liquidación :</div>
              </td>
              <td nowrap width="18%" > 
                <input type="text" readonly  name="E01ISIFSM" size="3" maxlength="2" value="<%= invInst.getE01ISIFSM()%>">
                <input type="text" readonly  name="E01ISIFSD" size="3" maxlength="2" value="<%= invInst.getE01ISIFSD()%>">
                <input type="text" readonly  name="E01ISIFSY" size="3" maxlength="2" value="<%= invInst.getE01ISIFSY()%>">
              </td>
              <td nowrap width="41%" > 
                <div align="right">:</div>
              </td>
              <td nowrap width="19%" > 
                
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
    
 
    <h4>Tamaño Emisión</h4>
    <table  class="tableinfo" width="546">
      <tr > 
        <td nowrap> 
          <table cellpadding=2 cellspacing=0 width="100%" border="0">
            <tr id="trdark"> 
              <td nowrap width="34%" > 
                <div align="right">Monto Emitido :</div>
              </td>
              <td nowrap width="34%" > 
                <input type="text" readonly  name="E01ISIAMT" size="17" maxlength="16" value="<%= invInst.getE01ISIAMT()%>" onKeyPress="enterDecimal()">
              </td>
              <td nowrap width="34%" > 
                <div align="right">Precio Emitido :</div>
              </td>
              <td nowrap width="66%" > 
                <input type="text" readonly  name="E01ISIIPR" size="17" maxlength="16" value="<%= invInst.getE01ISIIPR()%>" onKeyPress="enterDecimal()">
              </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap width="34%" > 
                <div align="right">Precio Monto Mínimo :</div>
              </td>
              <td nowrap width="34%" > 
                <input type="text" readonly  name="E01ISIMIA" size="17" maxlength="16" value="<%= invInst.getE01ISIMIA()%>" onKeyPress="enterDecimal()">
              </td>
              <td nowrap width="34%" > 
                <div align="right">Precio Vencimiento :</div>
              </td>
              <td nowrap width="66%" > 
                <input type="text" readonly  name="E01ISIMPR" size="17" maxlength="16" value="<%= invInst.getE01ISIMPR()%>" onKeyPress="enterDecimal()">
              </td>
            </tr>
            <tr id="trdark"> 
              <td nowrap width="34%" > 
                <div align="right">Monto Incremento :</div>
              </td>
              <td nowrap width="34%" > 
                <input type="text" readonly  name="E01ISIINA" size="17" maxlength="16" value="<%= invInst.getE01ISIINA()%>" onKeyPress="enterDecimal()">
              </td>
              <td nowrap width="34%" > 
                <div align="right">Precio Promedio Mensual :</div>
              </td>
              <td nowrap width="66%" > 
                <input type="text" readonly  name="E01ISIMAP" size="17" maxlength="16" value="<%= invInst.getE01ISIMAP()%>" onKeyPress="enterDecimal()">
              </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap width="34%" > 
                <div align="right">Monto Par. :</div>
              </td>
              <td nowrap width="34%" > 
                <input type="text" readonly  name="E01ISIPAR" size="17" maxlength="16" value="<%= invInst.getE01ISIPAR()%>" onKeyPress="enterDecimal()">
              </td>
              <td nowrap width="34%" > 
                <div align="right"></div>
              </td>
              <td nowrap width="66%" >&nbsp;</td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
    <h4>Información de Auditoría</h4>
    <table  class="tableinfo" width="546">
      <tr > 
        <td nowrap> 
          <table cellpadding=2 cellspacing=0 width="100%" border="0">
            <tr id="trdark"> 
              <td nowrap width="34%" > 
                <div align="right">Fecha Ultima Actualización Usuario :</div>
              </td>
              <td nowrap width="34%" > 
                <input type="text" readonly  name="E01ISIUPM" size="3" maxlength="2" value="<%= invInst.getE01ISIUPM()%>" >
                <input type="text" readonly  name="E01ISIUPD" size="3" maxlength="2" value="<%= invInst.getE01ISIUPD()%>" >
                <input type="text" readonly  name="E01ISIUPY" size="3" maxlength="2" value="<%= invInst.getE01ISIUPY()%>" >
              </td>
              <td nowrap width="34%" > 
                <div align="right">Perfil Usuario :</div>
              </td>
              <td nowrap width="34%" > 
                <input type="text" readonly  name="E01ISIUSR" size="11" maxlength="10" value="<%= invInst.getE01ISIUSR()%>" >
              </td>
            </tr>
            <tr id="trclear">  
              <td nowrap width="34%" > 
                <div align="right">Fecha Ultima Actualización Bloomberg :</div>
              </td>
              <td nowrap width="34%" > 
                <input type="text" readonly  name="E01ISIBLM" size="3" maxlength="2" value="<%= invInst.getE01ISIBLM()%>" >
                <input type="text" readonly  name="E01ISIBLD" size="3" maxlength="2" value="<%= invInst.getE01ISIBLD()%>" >
                <input type="text" readonly  name="E01ISIBLY" size="3" maxlength="2" value="<%= invInst.getE01ISIBLY()%>" >
              </td>
              <td nowrap width="34%" > 
                <div align="right">Estado Proceso :</div>
              </td>
              <td nowrap width="66%" >
              	<% 
              		if(invInst.getE01ISIMOD().equals("M")) { out.print("N/A");}
	            	else if(invInst.getE01ISIUST().equals("0")) { out.print("OK");}
    	        	else if(invInst.getE01ISIUST().equals("1")) { out.print("Error-No Incluido en Archivo Requerido");}
					else out.print(" ");
				%> 
			  </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td width="33%">&nbsp;</td>
      <td width="33%">&nbsp;</td>
      <td width="33%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="33%"> 
        <div align="center">
          <input id="EIBSBTN" type=button name="Submit3" value="Buscar" onClick="search()">
        </div>
      </td>
      <td width="33%">
        <div align="center">
          <input id="EIBSBTN" type=button name="Submit" value="Imprimir" onClick="doPrint()">
        </div>
      </td>
      <td width="33%"> 
        <div align="center">
          <input id="EIBSBTN" type=submit name="Submit2" value="Continuar">
        </div>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td> 
        <div align="center"> </div>
      </td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  </table>
</form>
</body>
</html>
