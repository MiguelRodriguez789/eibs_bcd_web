<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="datapro.eibs.master.*" %>
<%@page import="com.datapro.constants.EibsFields" %>
<%@page import="com.datapro.eibs.constants.HelpTypes" %>

<html>
<head>
<title>Boleta de Garantia</title>
<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id= "bolgaran" class= "datapro.eibs.beans.ELC500001Message" scope="session" />
<jsp:useBean id= "garantizaBean" class= "datapro.eibs.beans.ELC500006Message"  scope="session" />
<jsp:useBean id= "planDis" class= "datapro.eibs.beans.ELC500005Message"  scope="session" />
<jsp:useBean id= "bolprga" class= "datapro.eibs.beans.ELC500003Message" scope="session" />
<jsp:useBean id= "bolaviben" class= "datapro.eibs.beans.ELC500004Message" scope="session" />
<jsp:useBean id= "bolaval" class= "datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
  function showTab(index){
   for(var i=0;i<5;i++){
     document.all["Tab"+i].className="tabnormal";
     document.all["dataTab"+i].style.display="none";
    }

    document.all["Tab"+index].className="tabhighlight";
   document.all["dataTab"+index].style.display="";
  }
  builtNewMenu(bg_i_opt);
  
 <% if (userPO.getPurpose().equals("APPROVAL_INQ") ) { %>
   builtNewMenu(approval_opt);

 <% } else { %>
   builtNewMenu(bg_i_opt);
 <% }%>
 initMenu();
</SCRIPT>

</head>
<body>

<h3 align="center">Consulta Boleta de Garantia<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="bg_inq_basic.jsp,ELC5000"></h3>
<hr size="4">

<FORM>
  <!--
  <input type="hidden" name="SCREEN" value="800">
  <input type="hidden" name="E01LCMBNK" value="<%=bolgaran.getE01LCMBNK()%>">
  -->
  <table class=tableinfo>
  <tr>
   <td>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr id=trdark>
       <td align=right nowrap>Boleta :</td>
      <td >
       <input size="15" type="text" name="E01LCMACC" value="<%= bolgaran.getE01LCMACC().trim() %>" readonly>
      </td>
         <td nowrap >
            <div align="right">Banco/Sucursal :</div>
         </td>
         <td nowrap >
          <input readonly type="text" size="3" maxlength="2" value="<%= bolgaran.getE01LCMBNK().trim()%>" name="E01LCMBNK">
                <input readonly type="text" name="E01LCMBRN" size="5" maxlength="4" value="<%= bolgaran.getE01LCMBRN().trim()%>">
         </td>
 </tr>
    <tr id=trclear>
         <td align=right nowrap>Producto :</td>
         <td>
          <input size="5" type="text" name="E01LCMPRO" readonly value="<%= bolgaran.getE01LCMPRO()%>">
            <input size="40" type="text" name="E01PRDNME" readonly value="<%= bolgaran.getE01PRDNME()%>">
         </td>
         <td align=right nowrap>Moneda :</td>
         <td nowrap><input size="5" type="text" name="E01LCMCCY" readonly value="<%= bolgaran.getE01LCMCCY()%>"></td>
    </tr>
    <tr id=trclear>
         <td align=right nowrap>Estado : </td>
         <td colspan = 3><font color="red" >
          <% if (bolgaran.getE01LCMSTS().equals("C")) out.print("Cancelado");
             else if (bolgaran.getE01LCMSTS().equals("X")) out.print("Con Aviso de Pago");
             else if (bolgaran.getE01LCMSTS().equals("P")) out.print("Pendiente");
             else out.print("Vigente"); %></font>
         </td>
    </tr>
  </table>
  </td>
  </tr>
 </table>

<h4>Datos Generales</h4>
   <table class="tbenter" width="100%" border="0" cellspacing=0 cellpadding=0>
    <tr>
       <td nowrap>
           <table id="TableTab" cellspacing=0 cellpadding=2 border="0">
                <tr>
                    <td nowrap id="Tab0" class="tabhighlight" onClick="showTab(0)">
                            <div >Por Orden</div>
                    </td>
                    <td nowrap id="Tab1" class="tabnormal" onClick="showTab(1)">
                            <div >Datos Beneficiario</div>
                    </td>
                    <td nowrap id="Tab2" class="tabnormal" onClick="showTab(2)">
                            <div >Avales</div>
                    </td>
                    <td nowrap id="Tab3" class="tabnormal" onClick="showTab(3)">
                            <div >Prorroga</div>
                    </td>
                    <td nowrap id="Tab4" class="tabnormal" onClick="showTab(4)">
                            <div >Aviso de Pago</div>
                    </td>
                    <td nowrap id="Tab5" class="tabnormal" onClick="showTab(5)">
                            <div >Bloqueo/Desbloqueo</div>
                    </td>
   
                    <td class="tabempty" width="100%">&nbsp;
                    </td>
                 </tr>
            </table>
       </td>
    </tr>
  </table>
  <table class="tabdata" width="100%">
    <tr>
     <td nowrap>
      <div id="dataTab0">
     <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr id=trdark>
              <td align=right nowrap width="23%">Numero :</td>
              <td nowrap width="25%">
                <input size="12" type="text" name="E01LCMCUN" maxlength="10" value="<%=bolgaran.getE01LCMCUN()%>" readonly>
            </td>
              <td align=right nowrap width="27%">Identificaci&oacute;n :</td>
              <td width="25%">
                <input size="28" type="text" name="E01APLRUT" maxlength="25" value="<%=bolgaran.getE01APLRUT()%>" readonly>
         </td>
      </tr>
      <tr id=trclear>
        <td align=right nowrap width="23%">Nombre :</td>
            <td colspan=3>
               <input size="55" type="text" name="E01APLNME" maxlength="55" value="<%=bolgaran.getE01APLNME()%>" readonly>
        </td>
      </tr>
	    <tr id=trdark>
	       <td align=right nowrap>Fecha Emisi�n :</td>
	       <td>
	           <eibsinput:date name="bolgaran" fn_month="E01LCMIDM" fn_day="E01LCMIDD" fn_year="E01LCMIDY" readonly="true" />
		   </td>
	       <td align=right nowrap>Fecha Vencimiento :</td>
	          <td>
	           <eibsinput:date name="bolgaran" fn_month="E01LCMEXM" fn_day="E01LCMEXD" fn_year="E01LCMEXY" readonly="true" />
	          </td>
	    </tr>
      <tr id=clear>
           <td align=right nowrap width="23%">Cuenta Corriente :</td>
           <td width="25%" >
                <input type="text" name="E01LCMAPA" size="12" maxlength="12" value="<%= bolgaran.getE01LCMAPA().trim()%>" readonly>
         </td>
           <td align="right" width="27%">Linea de Cr&eacute;dito :</td>
           <td nowrap width="25%">
                <input type="text" name="E01LCMLNR" size="9" maxlength="9" value="<%= bolgaran.getE01LCMLNR().trim()%>" readonly >
             <input type="text" name="E01LCMCMN" size="4" maxlength="4" value="<%= bolgaran.getE01LCMCMN().trim()%>" readonly >
            </td>
      </tr>
    </table>
      </div>
       <div id="dataTab1" style="display: none">
     <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr id=trdark>
            <td align=right nowrap>Numero :</td>
            <td>
          <input size="12" type="text" name="E01LCMBCU" maxlength="10" value="<%=bolgaran.getE01LCMBCU()%>" readonly>
        </td>
            <td align=right nowrap>Identificaci&oacute;n :</td>
            <td>
          <input size="28" type="text" name="E01BNFRUT" maxlength="25" value="<%=bolgaran.getE01BNFRUT()%>" readonly>
        </td>
      </tr>
      <tr id=trclear>
            <td align=right nowrap>Nombre :</td>
            <td colspan=3>
          <input size="55" type="text" name="E01BNFNME" maxlength="55" value="<%=bolgaran.getE01BNFNME()%>" readonly>
        </td>
      </tr>
      <tr id=trdark>
       <td align=right nowrap>Direccion :</td>
       <td colspan=3>
          <input size="55" type="text" name="E01BNFAD1" maxlength="55" value="<%=bolgaran.getE01BNFAD1()%>" readonly>
        </td>
      </tr>
      <tr id=trclear>
            <td ></td>
            <td colspan=3>
          <input size="55" type="text" name="E01BNFAD2" maxlength="55" value="<%=bolgaran.getE01BNFAD2()%>" readonly>
        </td>
      </tr>
      <tr id=trdark>
       <td ></td>
       <td colspan=3>
          <input size="55" type="text" name="E01BNFAD3" maxlength="55" value="<%=bolgaran.getE01BNFAD3()%>" readonly>
        </td>
      </tr>
      <tr id=trclear>
        <td ></td>
        <td colspan=3>
          <input size="55" type="text" name="E01BNFAD4" maxlength="55" value="<%=bolgaran.getE01BNFAD4()%>" readonly>
        </td>
      </tr>
      <tr id=trdark>
         <td align=right nowrap>Garantiza :</td>
         <td colspan=3>
               <textarea name="E01LCMSHF" cols="45" rows="3" disabled ><%= bolgaran.getE01LCMSHF() %></textarea>
         </td>
       </tr>
       <tr id=trclear>
         <td align=right nowrap>Cta. Corriente :</td>
         <td>
             <input type="text" name="E01LCMBAC" size="12" maxlength="12" value="<%= bolgaran.getE01LCMBAC().trim()%>" readonly>
         </td>
        <td align=right nowrap>Pago :</td>
        <td>
         <SELECT name="E01PAGFLG" disabled>
                 <OPTION value="1" <% if (bolgaran.getE01PAGFLG().equals("1")) out.print("selected");%>>30 d�as plazo</OPTION>
                 <OPTION value="2" <% if (bolgaran.getE01PAGFLG().equals("2")) out.print("selected");%>>Vista</OPTION>
             </SELECT>
        </td>
        </tr>
    </table>
      </div>
      <div id="dataTab2" style="display: none">
    <%
  if ( bolaval.getNoResult() ) {
    %>
        <TABLE class="tbenter" width="100%">
       <TR>
        <TD>
          <div align="center" >
            <p><b>La Boleta seleccionada no posee Avales asignados.</b></p>
          </div>
        </TD>
        </TR>
     </TABLE>
    <% } else { %>
        <table width="100%" cellspacing="2" cellpadding="0">
          <TR id="trdark">
            <TH ALIGN=CENTER NOWRAP>Cod. Cliente</TH>
            <TH ALIGN=CENTER NOWRAP>Nombre</TH>
            <TH ALIGN=CENTER NOWRAP>% Avala</TH>
          </TR>
    <%
         bolaval.initRow();
         while (bolaval.getNextRow()) {
            datapro.eibs.beans.ELC500002Message msgAval = (datapro.eibs.beans.ELC500002Message) bolaval.getRecord();
     %>
            <TR>
              <td align=center nowrap><%=msgAval.getE02CUMBNI() %></td>
            <td nowrap><%=msgAval.getE02CUMMA1() %></td>
            <td align=center nowrap><%=msgAval.getE02CUMNST() %></td>
      </TR>
      <%
         }
    %>
        </table>
       <%
         }
    %>
      </div>
      <div id="dataTab3" style="display: none">
        <table width="100%" cellspacing="0" cellpadding="0">
       <tr id=trdark>
         <td width=40% align=right>Nueva Fecha de Vencimiento :</td>
         <td>
           <eibsinput:date name="bolprga" fn_month="E03LCMEEM" fn_day="E03LCMEED" fn_year="E03LCMEEY" readonly="true" />
         </td>
      <tr id=trclear>
         <td align=right>Comision Flat :</td>
         <td>
        <INPUT size="10" type="text" name="E03LCMC11" maxlength="10" value="<%= bolprga.getE03LCMC11() %>" readonly>
      </td>
       </tr>
       <tr id=trdark>
         <td align=right>Tasa Interes :</td>
         <td>
           <INPUT size="10" type="text" name="E03LCMIRT" maxlength="10" value="<%= bolprga.getE03LCMIRT() %>" readonly>
         </td>
    </tr>
    <tr id=trclear>
        <td align=right nowrap>Cobros :</td>
       <td>
            <INPUT type="radio" name="E03PAGFLG" value="1" <% if (bolprga.getE03PAGFLG().equals("1")) out.print("checked");%> disabled>Cuenta Corriente
            <INPUT type="radio" name="E03PAGFLG" value="2" <% if (bolprga.getE03PAGFLG().equals("2")) out.print("checked");%> disabled>Caja
        </td>
       </tr>
     </table>
      </div>
      <div id="dataTab4" style="display: none">
        <table width="100%" cellspacing="0" cellpadding="0">
       <tr id=trdark>
         <td width=40% align=right> Fecha de Aviso :</td>
         <td>
           <eibsinput:date name="bolaviben" fn_month="E04LCMCNM" fn_day="E04LCMCND" fn_year="E04LCMCNY" readonly="true" />
         </td>
          </tr>
      <!--tr id=trclear>
         <td align=right>Usuario :</td>
         <td>
        <INPUT size="10" type="text" name="E04CUSNA1" size="45" value="<%=bolaviben.getE04CUSNA1() %>" readonly>
      </td>
       </tr-->
     </table>
      </div>

      <div id="dataTab5" style="display: none">
        <table width="100%" cellspacing="0" cellpadding="0">
       <tr id=trdark>
         <td width=40% align=right> Estado Actual:</td>
         <td align="left">
          <input size="30" type="text" name="E01LCMCRF" maxlength="30" value="
          <% 
          if (bolgaran.getE01LCMCRF().trim().equals("Y")) out.print("Bloqueado"); else if (bolgaran.getE01LCMCRF().trim().equals("N")) out.print("Desbloqueado");
          else out.print("Normal");  
          %>
          " readonly>
         </td>
       </tr>
       
       <tr id=trclear>
         <td width=40% align=right> Motivo del Cambio :</td>
         <td>
          <input size="5" type="text" name="E01LCMUC6" maxlength="4" value="<%=bolgaran.getE01LCMUC6()%>" readonly>
          <input size="60" type="text" name="D01LCMUC6" maxlength="60" value="<%=bolgaran.getD01LCMUC6()%>" readonly>
         </td>
       </tr>

      <tr id=trclear>
         <td width=40% align=right> Usuario de Cambio de Estado :</td>
         <td>
          <input size="15" type="text" name="E01LCMRF2" maxlength="15" value="<%=bolgaran.getE01LCMRF2()%>" readonly>
         </td>
       </tr>
    <tr id=trclear>
         <td width=40% align=right> Fecha de Cambio de Estado :</td>
         <td>
           <eibsinput:date name="bolgaran" fn_month="E01LCMCRM" fn_day="E01LCMCRD" fn_year="E01LCMCRY" readonly="true" />
         </td>
       </tr>


          
     </table>
      </div>





   </td>
  </tr>
 </table>
  <h4>Datos Por Cuenta de</h4>
  <table class=tableinfo>
  <tr>
   <td>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr id=trdark>
	    <td align=right nowrap>Identificaci&oacute;n :</td>
	    <td>
			<input size="15" type="text" name="E01LCMCBC" maxlength="10" value="<%=bolgaran.getE01LCMCBC()%>" readonly>
	  		    <a href="javascript:GetCustomerDescId('E01LCMCBC','E01LCMCA1','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
	  	</td>
    </tr>
    <tr id=trclear>
	    <td align=right nowrap>Nombre :</td>
	    <td colspan=3>
			<input size="45" type="text" name="E01LCMCA1" maxlength="35" value="<%=bolgaran.getE01LCMCA1()%>" readonly>
	  		</td>
    </tr>
  </table>
</td>
  </tr>
 </table>

 <h4>Datos Emisi�n</h4>
  <table class=tableinfo>
  <tr>
   <td>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr id=trdark>
      <td align=right nowrap>Monto Origen :</td>
      <td><INPUT type="text" name="E01LCMOAM" maxlength="21" class="txtright" readonly value="<%=bolgaran.getE01LCMOAM()%>"> </td>
      <td align=right nowrap>Tasa Interes :</td>
      <td><INPUT type="text" name="E01LCMIRT" readonly class="txtright" maxlength="21" value="<%=bolgaran.getE01LCMIRT()%>"></td>
    </tr>
    <tr id=trclear>
      <td align=right nowrap>Monto Boleta :</td>
      <td><INPUT type="text" name="E01LCMC10" maxlength="21" class="txtright" readonly value="<%=bolgaran.getE01LCMC10()%>"> </td>
      <td align=right nowrap>Monto de Comision :</td>
      <td><INPUT type="text" name="E01LCMC11" readonly class="txtright" maxlength="21" value="<%=bolgaran.getE01LCMC11()%>"></td>
    </tr>
    <tr id=trdark>
      <td align=right nowrap>Tipo Cambio :</td>
      <td><INPUT type="text" name="E01LCMOFX" readonly class="txtright" maxlength="21" value="<%=bolgaran.getE01LCMOFX()%>"></td>
      <td align=right nowrap>Gastos Notar�a :</td>
      <td><INPUT type="text" name="E01LCMC12" readonly class="txtright" maxlength="21" value="<%=bolgaran.getE01LCMC12()%>"></td>
    </tr>
    <tr id=trclear>
      <td align=right nowrap>Interes Acumulado :</td>
      <td ><INPUT type="text" name="E01LCMIAL" maxlength="21" class="txtright" readonly value="<%=bolgaran.getE01LCMIAL()%>"> </td>
      <td align=right nowrap>Impuesto Timbres :</td>
      <td><INPUT type="text" name="E01LCMAM1" readonly class="txtright" maxlength="21" value="<%=bolgaran.getE01LCMAM1()%>"></td>
    </tr>
    <tr id=trdark>
      <td align=right nowrap>Interes Pagado :</td>
      <td ><INPUT type="text" name="E01LCMIPL" maxlength="21" class="txtright" readonly value="<%=bolgaran.getE01LCMIPL()%>"> </td>
      <td align=right nowrap>IVA :</td>
      <td><INPUT type="text" name="E01LCMAM2" readonly class="txtright" maxlength="21" value="<%=bolgaran.getE01LCMAM2()%>"></td>
    </tr>
  </table>
</td>
  </tr>
 </table>

 <% if (bolgaran.getE01LCMFDI().equals("Y")){ %>
 <h4>Plan de disminuci&oacute;n</h4>
   <div id="dataTab5">  <!-- style="display: none" -->
     <table class=tableinfo>
  <tr>
   <td>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr id=trdark>
    	<th width="5%" align=center nowrap>N�</th>
 	    <th width="35%" align=center nowrap>Fecha Vencimiento<br>Dia - Mes - A�o</th>
 	    <th width="35%" align=center nowrap>Monto</th>
 	    <th width="25%" align=center nowrap>Aplicado</th>
	</tr>
 <% String apli1 = "";
 	String apli2 = "";
 	String apli3 = "";
 	if (!planDis.getE05L01EXD().equals("0")){ %>
    <tr id=trclear>
    	<td align="center" nowrap> 1 </td>
         <td align="center" nowrap>
         	<%	apli1 = planDis.getE05L01STS();
         		apli2 = (apli1.equalsIgnoreCase("P")?"disabled checked":"disabled");
         		apli3 = "readonly";
         	%>
            <input type="text" size="2" maxlength="2" name="E05L01EXD" value="<%= planDis.getE05L01EXD().equals("0")?"":planDis.getE05L01EXD() %>" <%= apli3 %>>
            /
            <input type="text" size="2" maxlength="2" name="E05L01EXM" value="<%= planDis.getE05L01EXM().equals("0")?"":planDis.getE05L01EXM() %>" <%= apli3 %>>
            /
            <input type="text" size="5" maxlength="4" name="E05L01EXA" value="<%= planDis.getE05L01EXA().equals("0")?"":planDis.getE05L01EXA() %>" <%= apli3 %>>
         </td>
         <td align="center" nowrap>
            <input type="text" size="20" maxlength="20"  name="E05L01DIS" value="<%= planDis.getE05L01DIS().equals("0.00")?"":planDis.getE05L01DIS() %>" <%= apli3 %>>
         </td>
         <td align="center" nowrap>
            <input type="checkbox" name="E05L01STS" value="<%= apli1 %>" <%= apli2 %>>
         </td>
    </tr>
 <% }
 	if (!planDis.getE05L02EXD().equals("0")){ %>
    <tr id=trdark>
    	<td align="center" nowrap> 2 </td>
         <td align="center" nowrap>
         	<%	apli1 = planDis.getE05L02STS();
         		apli2 = (apli1.equalsIgnoreCase("P")?"disabled checked":"disabled");
         		//apli3 = apli1.equalsIgnoreCase("P")?"readonly":"";
         	%>
            <input type="text" size="2" name="E05L02EXD" maxlength="2" value="<%= planDis.getE05L02EXD().equals("0")?"":planDis.getE05L02EXD() %>" <%= apli3 %>>
            /
            <input type="text" size="2" name="E05L02EXM" maxlength="2" value="<%= planDis.getE05L02EXM().equals("0")?"":planDis.getE05L02EXM() %>" <%= apli3 %>>
            /
            <input type="text" size="5" name="E05L02EXA" maxlength="4" value="<%= planDis.getE05L02EXA().equals("0")?"":planDis.getE05L02EXA() %>" <%= apli3 %>>
         </td>
         <td align="center" nowrap>
            <input type="text" size="20" name="E05L02DIS" maxlength="20" value="<%= planDis.getE05L02DIS().equals("0.00")?"":planDis.getE05L02DIS() %>" <%= apli3 %>>
         </td>
         <td align="center" nowrap>
            <input type="checkbox" name="E05L01STS" value="<%= apli1 %>" <%= apli2 %>>
         </td>
    </tr>
 <% }
 	if (!planDis.getE05L03EXD().equals("0")){ %>
    <tr id=trclear>
    	<td align="center" nowrap> 3 </td>
         <td align="center" nowrap>
         	<%	apli1 = planDis.getE05L03STS();
         		apli2 = (apli1.equalsIgnoreCase("P")?"disabled checked":"disabled");
         		//apli3 = apli1.equalsIgnoreCase("P")?"readonly":"";
         	%>
            <input type="text" size="2" name="E05L03EXD" maxlength="2" value="<%= planDis.getE05L03EXD().equals("0")?"":planDis.getE05L03EXD() %>" <%= apli3 %>>
            /
            <input type="text" size="2" name="E05L03EXM" maxlength="2" value="<%= planDis.getE05L03EXM().equals("0")?"":planDis.getE05L03EXM() %>" <%= apli3 %>>
            /
            <input type="text" size="5" name="E05L03EXA" maxlength="4" value="<%= planDis.getE05L03EXA().equals("0")?"":planDis.getE05L03EXA() %>" <%= apli3 %>>
         </td>
         <td align="center" nowrap>
            <input type="text" size="20" name="E05L03DIS" maxlength="20" value="<%= planDis.getE05L03DIS().equals("0.00")?"":planDis.getE05L03DIS() %>" <%= apli3 %>>
         </td>
         <td align="center" nowrap>
            <input type="checkbox" name="E05L03STS" value="<%= apli1 %>" <%= apli2 %>>
         </td>
    </tr>
 <% }
 	if (!planDis.getE05L04EXD().equals("0")){ %>
    <tr id=trdark>
    	<td align="center" nowrap> 4 </td>
         <td align="center" nowrap>
         	<%	apli1 = planDis.getE05L04STS();
         		apli2 = (apli1.equalsIgnoreCase("P")?"disabled checked":"disabled");
         		//apli3 = apli1.equalsIgnoreCase("P")?"readonly":"";
         	%>
            <input type="text" size="2" name="E05L04EXD" maxlength="2" value="<%= planDis.getE05L04EXD().equals("0")?"":planDis.getE05L04EXD() %>" <%= apli3 %>>
            /
            <input type="text" size="2" name="E05L04EXM" maxlength="2" value="<%= planDis.getE05L04EXM().equals("0")?"":planDis.getE05L04EXM() %>" <%= apli3 %>>
            /
            <input type="text" size="5" name="E05L04EXA" maxlength="4" value="<%= planDis.getE05L04EXA().equals("0")?"":planDis.getE05L04EXA() %>" <%= apli3 %>>
         </td>
         <td align="center" nowrap>
            <input type="text" size="20" name="E05L04DIS" maxlength="20" value="<%= planDis.getE05L04DIS().equals("0.00")?"":planDis.getE05L04DIS() %>" <%= apli3 %>>
         </td>
         <td align="center" nowrap>
            <input type="checkbox" name="E05L04STS" value="<%= apli1 %>" <%= apli2 %>>
         </td>
    </tr>
 <% }
 	if (!planDis.getE05L05EXD().equals("0")){ %>
    <tr id=trclear>
    	<td align="center" nowrap> 5 </td>
         <td align="center" nowrap>
         	<%	apli1 = planDis.getE05L05STS();
         		apli2 = (apli1.equalsIgnoreCase("P")?"disabled checked":"disabled");
         		//apli3 = apli1.equalsIgnoreCase("P")?"readonly":"";
         	%>
            <input type="text" size="2" name="E05L05EXD" maxlength="2" value="<%= planDis.getE05L05EXD().equals("0")?"":planDis.getE05L05EXD() %>" <%= apli3 %>>
            /
            <input type="text" size="2" name="E05L05EXM" maxlength="2" value="<%= planDis.getE05L05EXM().equals("0")?"":planDis.getE05L05EXM() %>" <%= apli3 %>>
            /
            <input type="text" size="5" name="E05L05EXA" maxlength="4" value="<%= planDis.getE05L05EXA().equals("0")?"":planDis.getE05L05EXA() %>" <%= apli3 %>>
         </td>
         <td align="center" nowrap>
            <input type="text" size="20" name="E05L05DIS" maxlength="20" value="<%= planDis.getE05L05DIS().equals("0.00")?"":planDis.getE05L05DIS() %>" <%= apli3 %>>
         </td>
         <td align="center" nowrap>
            <input type="checkbox" name="E05L05STS" value="<%= apli1 %>" <%= apli2 %>>
         </td>
    </tr>
 <% }
 	if (!planDis.getE05L06EXD().equals("0")){ %>
    <tr id=trdark>
	    <td align="center" nowrap> 6 </td>
         <td align="center" nowrap>
         	<%	apli1 = planDis.getE05L06STS();
         		apli2 = (apli1.equalsIgnoreCase("P")?"disabled checked":"disabled");
         		//apli3 = apli1.equalsIgnoreCase("P")?"readonly":"";
         	%>
            <input type="text" size="2" name="E05L06EXD" maxlength="2" value="<%= planDis.getE05L06EXD().equals("0")?"":planDis.getE05L06EXD() %>" <%= apli3 %>>
            /
            <input type="text" size="2" name="E05L06EXM" maxlength="2" value="<%= planDis.getE05L06EXM().equals("0")?"":planDis.getE05L06EXM() %>" <%= apli3 %>>
            /
            <input type="text" size="5" name="E05L06EXA" maxlength="4" value="<%= planDis.getE05L06EXA().equals("0")?"":planDis.getE05L06EXA() %>" <%= apli3 %>>
         </td>
         <td align="center" nowrap>
            <input type="text" size="20" name="E05L06DIS" maxlength="20" value="<%= planDis.getE05L06DIS().equals("0.00")?"":planDis.getE05L06DIS() %>" <%= apli3 %>>
         </td>
         <td align="center" nowrap>
            <input type="checkbox" name="E05L06STS" value="<%= apli1 %>" <%= apli2 %>>
         </td>
    </tr>
 <% }
 	if (!planDis.getE05L07EXD().equals("0")){ %>
    <tr id=trclear>
    	<td align="center" nowrap> 7 </td>
         <td align="center" nowrap>
         	<%	apli1 = planDis.getE05L07STS();
         		apli2 = (apli1.equalsIgnoreCase("P")?"disabled checked":"disabled");
         		//apli3 = apli1.equalsIgnoreCase("P")?"readonly":"";
         	%>
            <input type="text" size="2" name="E05L07EXD" maxlength="2" value="<%= planDis.getE05L07EXD().equals("0")?"":planDis.getE05L07EXD() %>" <%= apli3 %>>
            /
            <input type="text" size="2" name="E05L07EXM" maxlength="2" value="<%= planDis.getE05L07EXM().equals("0")?"":planDis.getE05L07EXM() %>" <%= apli3 %>>
            /
            <input type="text" size="5" name="E05L07EXA" maxlength="4" value="<%= planDis.getE05L07EXA().equals("0")?"":planDis.getE05L07EXA() %>" <%= apli3 %>>
         </td>
         <td align="center" nowrap>
            <input type="text" size="20" name="E05L07DIS" maxlength="20" value="<%= planDis.getE05L07DIS().equals("0.00")?"":planDis.getE05L07DIS() %>" <%= apli3 %>>
         </td>
         <td align="center" nowrap>
            <input type="checkbox" name="E05L07STS" value="<%= apli1 %>" <%= apli2 %>>
         </td>
    </tr>
 <% }
 	if (!planDis.getE05L08EXD().equals("0")){ %>
    <tr id=trdark>
    	<td align="center" nowrap> 8 </td>
         <td align="center" nowrap>
         	<%	apli1 = planDis.getE05L08STS();
         		apli2 = (apli1.equalsIgnoreCase("P")?"disabled checked":"disabled");
         		//apli3 = apli1.equalsIgnoreCase("P")?"readonly":"";
         	%>
            <input type="text" size="2" name="E05L08EXD" maxlength="2" value="<%= planDis.getE05L08EXD().equals("0")?"":planDis.getE05L08EXD() %>" <%= apli3 %>>
            /
            <input type="text" size="2" name="E05L08EXM" maxlength="2" value="<%= planDis.getE05L08EXM().equals("0")?"":planDis.getE05L08EXM() %>" <%= apli3 %>>
            /
            <input type="text" size="5" name="E05L08EXA" maxlength="4" value="<%= planDis.getE05L08EXA().equals("0")?"":planDis.getE05L08EXA() %>" <%= apli3 %>>
         </td>
         <td align="center" nowrap>
            <input type="text" size="20" name="E05L08DIS" maxlength="20" value="<%= planDis.getE05L08DIS().equals("0.00")?"":planDis.getE05L08DIS() %>" <%= apli3 %>>
         </td>
         <td align="center" nowrap>
            <input type="checkbox" name="E05L08STS" value="<%= apli1 %>" <%= apli2 %>>
         </td>
    </tr>
 <% }
 	if (!planDis.getE05L09EXD().equals("0")){ %>
    <tr id=trclear>
    	<td align="center" nowrap> 9 </td>
         <td align="center" nowrap>
         	<%	apli1 = planDis.getE05L09STS();
         		apli2 = (apli1.equalsIgnoreCase("P")?"disabled checked":"disabled");
         		//apli3 = apli1.equalsIgnoreCase("P")?"readonly":"";
         	%>
            <input type="text" size="2" name="E05L09EXD" maxlength="2" value="<%= planDis.getE05L09EXD().equals("0")?"":planDis.getE05L09EXD() %>" <%= apli3 %>>
            /
            <input type="text" size="2" name="E05L09EXM" maxlength="2" value="<%= planDis.getE05L09EXM().equals("0")?"":planDis.getE05L09EXM() %>" <%= apli3 %>>
            /
            <input type="text" size="5" name="E05L09EXA" maxlength="4" value="<%= planDis.getE05L09EXA().equals("0")?"":planDis.getE05L09EXA() %>" <%= apli3 %>>
         </td>
         <td align="center" nowrap>
            <input type="text" size="20" name="E05L09DIS" maxlength="20" value="<%= planDis.getE05L09DIS().equals("0.00")?"":planDis.getE05L09DIS() %>" <%= apli3 %>>
         </td>
         <td align="center" nowrap>
            <input type="checkbox" name="E05L09STS" value="<%= apli1 %>" <%= apli2 %>>
         </td>
    </tr>
 <% }
 	if (!planDis.getE05L10EXD().equals("0")){ %>
    <tr id=trdark>
    	<td align="center" nowrap> 10 </td>
         <td align="center" nowrap>
         	<%	apli1 = planDis.getE05L10STS();
         		apli2 = (apli1.equalsIgnoreCase("P")?"disabled checked":"disabled");
         		//apli3 = apli1.equalsIgnoreCase("P")?"readonly":"";
         	%>
            <input type="text" size="2" name="E05L10EXD" maxlength="2" value="<%= planDis.getE05L10EXD().equals("0")?"":planDis.getE05L10EXD() %>" <%= apli3 %>>
            /
            <input type="text" size="2" name="E05L10EXM" maxlength="2" value="<%= planDis.getE05L10EXM().equals("0")?"":planDis.getE05L10EXM() %>" <%= apli3 %>>
            /
            <input type="text" size="5" name="E05L10EXA" maxlength="4" value="<%= planDis.getE05L10EXA().equals("0")?"":planDis.getE05L10EXA() %>" <%= apli3 %>>
         </td>
         <td align="center" nowrap>
            <input type="text" size="20" name="E05L10DIS" maxlength="20" value="<%= planDis.getE05L10DIS().equals("0.00")?"":planDis.getE05L10DIS() %>" <%= apli3 %>>
         </td>
         <td align="center" nowrap>
            <input type="checkbox" name="E05L10STS" value="<%= apli1 %>" <%= apli2 %>>
         </td>
    </tr>
 <% }
 	if (!planDis.getE05L11EXD().equals("0")){ %>
    <tr id=trclear>
    	<td align="center" nowrap> 11 </td>
         <td align="center" nowrap>
         	<%	apli1 = planDis.getE05L11STS();
         		apli2 = (apli1.equalsIgnoreCase("P")?"disabled checked":"disabled");
         		//apli3 = apli1.equalsIgnoreCase("P")?"readonly":"";
         	%>
            <input type="text" size="2" name="E05L11EXD" maxlength="2" value="<%= planDis.getE05L11EXD().equals("0")?"":planDis.getE05L11EXD() %>" <%= apli3 %>>
            /
            <input type="text" size="2" name="E05L11EXM" maxlength="2" value="<%= planDis.getE05L11EXM().equals("0")?"":planDis.getE05L11EXM() %>" <%= apli3 %>>
            /
            <input type="text" size="5" name="E05L11EXA" maxlength="4" value="<%= planDis.getE05L11EXA().equals("0")?"":planDis.getE05L11EXA() %>" <%= apli3 %>>
         </td>
         <td align="center" nowrap>
            <input type="text" size="20" name="E05L11DIS" maxlength="20" value="<%= planDis.getE05L11DIS().equals("0.00")?"":planDis.getE05L11DIS() %>" <%= apli3 %>>
         </td>
         <td align="center" nowrap>
            <input type="checkbox" name="E05L12STS" value="<%= apli1 %>" <%= apli2 %>>
         </td>
    </tr>
 <% }
 	if (!planDis.getE05L12EXD().equals("0")){ %>
    <tr id=trdark>
    	<td align="center" nowrap> 12 </td>
         <td align="center" nowrap>
         	<%	apli1 = planDis.getE05L12STS();
         		apli2 = (apli1.equalsIgnoreCase("P")?"disabled checked":"disabled");
         		//apli3 = apli1.equalsIgnoreCase("P")?"readonly":"";
         	%>
            <input type="text" size="2" name="E05L12EXD" maxlength="2" value="<%= planDis.getE05L12EXD().equals("0")?"":planDis.getE05L12EXD() %>" <%= apli3 %>>
            /
            <input type="text" size="2" name="E05L12EXM" maxlength="2" value="<%= planDis.getE05L12EXM().equals("0")?"":planDis.getE05L12EXM() %>" <%= apli3 %>>
            /
            <input type="text" size="5" name="E05L12EXA" maxlength="4" value="<%= planDis.getE05L12EXA().equals("0")?"":planDis.getE05L12EXA() %>" <%= apli3 %>>
         </td>
         <td align="center" nowrap>
            <input type="text" size="20" name="E05L12DIS" maxlength="20" value="<%= planDis.getE05L12DIS().equals("0.00")?"":planDis.getE05L12DIS() %>" <%= apli3 %>>
         </td>
         <td align="center" nowrap>
            <input type="checkbox" name="E05L12STS" value="<%= apli1 %>" <%= apli2 %>>
         </td>
    </tr>
 <% }
 	if (!planDis.getE05L13EXD().equals("0")){ %>
    <tr id=trclear>
    	<td align="center" nowrap> 13 </td>
         <td align="center" nowrap>
         	<%	apli1 = planDis.getE05L13STS();
         		apli2 = (apli1.equalsIgnoreCase("P")?"disabled checked":"disabled");
         		//apli3 = apli1.equalsIgnoreCase("P")?"readonly":"";
         	%>
            <input type="text" size="2" name="E05L13EXD" maxlength="2" value="<%= planDis.getE05L13EXD().equals("0")?"":planDis.getE05L13EXD() %>" <%= apli3 %>>
            /
            <input type="text" size="2" name="E05L13EXM" maxlength="2" value="<%= planDis.getE05L13EXM().equals("0")?"":planDis.getE05L13EXM() %>" <%= apli3 %>>
            /
            <input type="text" size="5" name="E05L13EXA" maxlength="4" value="<%= planDis.getE05L13EXA().equals("0")?"":planDis.getE05L13EXA() %>" <%= apli3 %>>
         </td>
         <td align="center" nowrap>
            <input type="text" size="20" name="E05L13DIS" maxlength="20" value="<%= planDis.getE05L13DIS().equals("0.00")?"":planDis.getE05L13DIS() %>" <%= apli3 %>>
         </td>
         <td align="center" nowrap>
            <input type="checkbox" name="E05L13STS" value="<%= apli1 %>" <%= apli2 %>>
         </td>
    </tr>
 <% }
 	if (!planDis.getE05L14EXD().equals("0")){ %>
    <tr id=trdark>
    	<td align="center" nowrap> 14 </td>
         <td align="center" nowrap>
         	<%	apli1 = planDis.getE05L14STS();
         		apli2 = (apli1.equalsIgnoreCase("P")?"disabled checked":"disabled");
         		//apli3 = apli1.equalsIgnoreCase("P")?"readonly":"";
         	%>
            <input type="text" size="2" name="E05L14EXD" maxlength="2" value="<%= planDis.getE05L14EXD().equals("0")?"":planDis.getE05L14EXD() %>" <%= apli3 %>>
            /
            <input type="text" size="2" name="E05L14EXM" maxlength="2" value="<%= planDis.getE05L14EXM().equals("0")?"":planDis.getE05L14EXM() %>" <%= apli3 %>>
            /
            <input type="text" size="5" name="E05L14EXA" maxlength="4" value="<%= planDis.getE05L14EXA().equals("0")?"":planDis.getE05L14EXA() %>" <%= apli3 %>>
         </td>
         <td align="center" nowrap>
            <input type="text" size="20" name="E05L14DIS" maxlength="20" value="<%= planDis.getE05L14DIS().equals("0.00")?"":planDis.getE05L14DIS() %>" <%= apli3 %>>
         </td>
         <td align="center" nowrap>
            <input type="checkbox" name="E05L14STS" value="<%= apli1 %>" <%= apli2 %>> <!-- planDis.get() E05L01STS -->
         </td>
    </tr>
 <% }
 	if (!planDis.getE05L15EXD().equals("0")){ %>
    <tr id=trclear>
    	<td align="center" nowrap> 15 </td>
         <td align="center" nowrap>
         	<%	apli1 = planDis.getE05L15STS();
         		apli2 = (apli1.equalsIgnoreCase("P")?"disabled checked":"disabled");
         		//apli3 = apli1.equalsIgnoreCase("P")?"readonly":"";
         	%>
            <input type="text" size="2" name="E05L15EXD" maxlength="2" value="<%= planDis.getE05L15EXD().equals("0")?"":planDis.getE05L15EXD() %>" <%= apli3 %>>
            /
            <input type="text" size="2" name="E05L15EXM" maxlength="2" value="<%= planDis.getE05L15EXM().equals("0")?"":planDis.getE05L15EXM() %>" <%= apli3 %>>
            /
            <input type="text" size="5" name="E05L15EXA" maxlength="4" value="<%= planDis.getE05L15EXA().equals("0")?"":planDis.getE05L15EXA() %>" <%= apli3 %>>
         </td>
         <td align="center" nowrap>
            <input type="text" size="20" name="E05L15DIS" maxlength="20" value="<%= planDis.getE05L15DIS().equals("0.00")?"":planDis.getE05L15DIS() %>" <%= apli3 %>>
         </td>
         <td align="center" nowrap>
            <input type="checkbox" name="E05L15STS" value="<%= apli1 %>" <%= apli2 %>>
         </td>
    </tr>
 <% } %>
  </table>
  </td>
  </tr>
</table>
 </div>
  <% } /* FIN Plan de disminucion */ %>

<jsp:include page="ESD0840_reevaluation_inquiry.jsp" flush="true">
	<jsp:param name="flag" value="<%=bolgaran.getH01FLGWK3()%>" />
</jsp:include>

</FORM>
</BODY>
</html>

