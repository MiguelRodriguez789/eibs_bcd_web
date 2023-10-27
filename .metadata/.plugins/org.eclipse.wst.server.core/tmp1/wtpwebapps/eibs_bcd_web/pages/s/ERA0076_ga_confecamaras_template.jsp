<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<jsp:useBean id="gaConfFld" class= "datapro.eibs.beans.ERA007601Message"  scope="session"/>
<%

  String READ="";
  String color1="trdark";
  String color2="trclear";
  int row = 0;
  String disabled1 = "";
  String read_only1 = "";
 
  // PARAMETROS 
  String suffixE, suffix, suffixDsc, suffixMod ;
  String messageName;
  String title="";
  String i="";
  boolean readOnly=false ;  
  boolean basicData=false ; 
  boolean b_read_only1 = false;
  
  if( request.getParameter("basic") != null ){
		basicData = Boolean.valueOf(request.getParameter("basic").toString()).booleanValue() ;
  }
   
   //Obtiene el titulo del segmento de direccion
   if (request.getParameter("title") != null)
     title = request.getParameter("title");
   
   // Determina si es solo lectura
   if (request.getParameter("readOnly") != null ){
     readOnly=Boolean.valueOf( request.getParameter("readOnly").toString() ).
     					booleanValue() ;
     READ = readOnly?"readonly":"";
   }
   if (READ.equals("readonly")){
		b_read_only1 = true;
		disabled1 = "disabled";
		read_only1 = "readonly";
	}
   // Obtiene el mensaje a desplegar
   messageName = request.getParameter("messageName");
   
   //Obtiene el color de la primera fila
   if(request.getParameter("firstColor")!= null){
      color1=request.getParameter("firstColor");
      if (color1.equals("trclear")) color2="trdark";
   }
%>
<SCRIPT type="text/javascript">
 function trim (str)
 {
     return str.replace (/^\s+|\s+$/g, '');
 }
function hidePAdmin(fld, value){
 if (value) {
   eval(fld+".style.display=''");
   } else{
   eval(fld+".style.display='none'");
   }
}
 
</SCRIPT>

<div id="IDCOL<%=i%>" style="position:relative; display:'';">
<% if( basicData){ %>
	<h4><%=title%></h4>
<% } %>   
   <table class="tableinfo" width="100%" >
    	<tr > 
       	<td nowrap >
   		<table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap colspan=4> 
				<B>Información Confecámaras</B>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Es Garantía Prioritaria de Adquisición : </div>
            </td>
            <td nowrap >
                <input type="hidden" name="E01EXCGPA" value="<%=gaConfFld.getE01EXCGPA()%>">
                <input type="radio" name="CE01EXCGPA" value="S" onClick="document.forms[0].E01EXCGPA.value='S'"
			  <%if (gaConfFld.getE01EXCGPA().equals("S"))
				out.print("checked");%> <%=disabled1%>>
                Si
                <input type="radio" name="CE01EXCGPA" value="N" onClick="document.forms[0].E01EXCGPA.value='N'"
			  <%if (gaConfFld.getE01EXCGPA().equals("N"))
				out.print("checked");%> <%=disabled1%>>
                No
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
            <td nowrap >
              <div align="right">Bien para uso : </div>
            </td>
            <td nowrap >
                <input type="hidden" name="E01EXCBUS" value="<%=gaConfFld.getE01EXCBUS()%>">
                <input type="radio" name="CE01EXCBUS" value="1" onClick="document.forms[0].E01EXCBUS.value='1'"
			  <%if (gaConfFld.getE01EXCBUS().equals("1"))
				out.print("checked");%> <%=disabled1%>>
                Comercial
                <input type="radio" name="CE01EXCBUS" value="2" onClick="document.forms[0].E01EXCBUS.value='2'"
			  <%if (gaConfFld.getE01EXCBUS().equals("2"))
				out.print("checked");%> <%=disabled1%>>
                Consumo
                <input type="radio" name="CE01EXCBUS" value="3" onClick="document.forms[0].E01EXCBUS.value='3'"
			  <%if (gaConfFld.getE01EXCBUS().equals("3"))
				out.print("checked");%> <%=disabled1%>>
                Ambos
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
          </tr>

          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Bien con Serial : </div>
            </td>
            <td nowrap >
                <input type="hidden" name="E01EXCUS1" value="<%=gaConfFld.getE01EXCUS1()%>">
                <input type="radio" name="CE01EXCUS1" value="S" onClick="document.forms[0].E01EXCUS1.value='S';hidePAdmin('bSerial',false);hidePAdmin('aSerial',true)"
			  <%if (gaConfFld.getE01EXCUS1().equals("S"))
				out.print("checked");%> <%=disabled1%> onChange="hidePAdmin('bSerial',false)" onBlur="hidePAdmin('bSerial',false);hidePAdmin('aSerial',true)" >
                Sí
                <input type="radio" name="CE01EXCUS1" value="N" onClick="document.forms[0].E01EXCUS1.value='N';hidePAdmin('bSerial',true);hidePAdmin('aSerial',false)"
			  <%if (gaConfFld.getE01EXCUS1().equals("N"))
				out.print("checked");%> <%=disabled1%> onChange="hidePAdmin('bSerial',true)" onBlur="hidePAdmin('bSerial',true);hidePAdmin('aSerial',false)" >
                No
            </td>
            <td nowrap >
            </td>
            <td nowrap >
             </td>
          </tr>
	</table>
	<div id="aSerial" style="display:''">
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Tipo de Bien: </div>
            </td>
            <td nowrap >
               <div align="left"> 
                  <select name="E01EXCUS2">
                    <option value=" " <%if (!(gaConfFld.getE01EXCUS2().equals("V")
					|| gaConfFld.getE01EXCUS2().equals("L")
					|| gaConfFld.getE01EXCUS2().equals("P")
					|| gaConfFld.getE01EXCUS2().equals("E")
					|| gaConfFld.getE01EXCUS2().equals("M")))
				out.print("selected");%>> 
                     </option>
                     <option value="V" <%if (gaConfFld.getE01EXCUS2().equals("V"))
				out.print("selected");%> <%=disabled1%>>Vehículo</option>
                     <option value="L" <%if (gaConfFld.getE01EXCUS2().equals("L"))
				out.print("selected");%> <%=disabled1%>>Licencias</option>
                     <option value="P" <%if (gaConfFld.getE01EXCUS2().equals("P"))
				out.print("selected");%> <%=disabled1%>>Permisos</option>
                     <option value="E" <%if (gaConfFld.getE01EXCUS2().equals("E"))
				out.print("selected");%> <%=disabled1%>>Equipo</option>
                     <option value="M" <%if (gaConfFld.getE01EXCUS2().equals("M"))
				out.print("selected");%> <%=disabled1%>>Maquinaria</option>
                   </select>
                </div>
            </td>
            <td nowrap> 
            </td>
            <td nowrap >
            </td>
          </tr>
		</table>
	</div>
	<div id="bSerial" style="display:''">
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Tipo de Bien : </div>
            </td>
            <td nowrap colspan=3>
			  <input type="checkbox" <%=disabled1%> name="E01EXCTB1" value="Y" <%if (gaConfFld.getE01EXCTB1().equals("Y")){out.print(" checked");}; %>/>Equipo Industrial&nbsp;&nbsp;
			  <input type="checkbox" <%=disabled1%> name="E01EXCTB2" value="Y" <%if (gaConfFld.getE01EXCTB2().equals("Y")){out.print(" checked");}; %>/>Equipo Construcción
			  <input type="checkbox" <%=disabled1%> name="E01EXCTB3" value="Y" <%if (gaConfFld.getE01EXCTB3().equals("Y")){out.print(" checked");}; %>/>Equipo Oficina&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  <input type="checkbox" <%=disabled1%> name="E01EXCTB4" value="Y" <%if (gaConfFld.getE01EXCTB4().equals("Y")){out.print(" checked");}; %>/>Equipo Agrícola<BR>
			  <input type="checkbox" <%=disabled1%> name="E01EXCTB5" value="Y" <%if (gaConfFld.getE01EXCTB5().equals("Y")){out.print(" checked");}; %>/>Otro Equipo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  <input type="checkbox" <%=disabled1%> name="E01EXCTB6" value="Y" <%if (gaConfFld.getE01EXCTB6().equals("Y")){out.print(" checked");}; %>/>Productos Agrícolas&nbsp;
			  <input type="checkbox" <%=disabled1%> name="E01EXCTB7" value="Y" <%if (gaConfFld.getE01EXCTB7().equals("Y")){out.print(" checked");}; %>/>Inventarios&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  <input type="checkbox" <%=disabled1%> name="E01EXCTB8" value="Y" <%if (gaConfFld.getE01EXCTB8().equals("Y")){out.print(" checked");}; %>/>Cuentas por Cobrar&nbsp;<BR>
			  <input type="checkbox" <%=disabled1%> name="E01EXCTB9" value="Y" <%if (gaConfFld.getE01EXCTB9().equals("Y")){out.print(" checked");}; %>/>Bienes por Adhesion
            </td>
          </tr>
		</table>
	</div>
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Número Registro Confecamaras : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01EXCRCF" size="28" maxlength="25" value="<%= gaConfFld.getE01EXCRCF().trim()%>" <%=read_only1%>>
            </td>
            <td nowrap >
            </td>
            <td nowrap >
             </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Descripción de los Bienes en Garantía : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01EXCDRE" size="55" maxlength="50" value="<%= gaConfFld.getE01EXCDRE().trim()%>" <%=read_only1%>>
            </td>
            <td nowrap >
              <div align="right">Fabricante : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01EXCUS4" size="28" maxlength="25" value="<%= gaConfFld.getE01EXCUS4().trim()%>" <%=read_only1%>>
            <%-- 
               <div align="left">
                    <select name="E01EXCIRE">
                    <option value=" " <% if (!(gaConfFld.getE01EXCIRE().equals("1")||gaConfFld.getE01EXCIRE().equals("2")||gaConfFld.getE01EXCIRE().equals("3")||gaConfFld.getE01EXCIRE().equals("4")||gaConfFld.getE01EXCIRE().equals("5"))) out.print("selected"); %>> 
                     </option>
                     <option value="1" <% if (gaConfFld.getE01EXCIRE().equals("1")) out.print("selected"); %> <%=disabled1%>>Runt</option>
                     <option value="2" <% if (gaConfFld.getE01EXCIRE().equals("2")) out.print("selected"); %> <%=disabled1%>>Dimar</option>
                     <option value="3" <% if (gaConfFld.getE01EXCIRE().equals("3")) out.print("selected"); %> <%=disabled1%>>Registro Mercantil</option>
                     <option value="4" <% if (gaConfFld.getE01EXCIRE().equals("4")) out.print("selected"); %> <%=disabled1%>>SIC</option>
                     <option value="5" <% if (gaConfFld.getE01EXCIRE().equals("5")) out.print("selected"); %> <%=disabled1%>>Otros</option>
                   </select>
 				</div>
			--%>
             </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Fecha de Registro :</div>
            </td>
            <td nowrap >
				<eibsinput:date name="gaConfFld" fn_year="E01EXCFRY" fn_month="E01EXCFRM" fn_day="E01EXCFRD" required="false" readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap >
            </td>
            <td nowrap >
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">Tipo de Cliente :</div>
            </td>
            <td nowrap >
               <div align="left"> 
                  <select name="E01EXCTCL">
                    <option value=" " <%if (!(gaConfFld.getE01EXCTCL().equals("N")
					|| gaConfFld.getE01EXCTCL().equals("R")))
				out.print("selected");%>> 
                     </option>
                     <option value="N" <%if (gaConfFld.getE01EXCTCL().equals("N"))
				out.print("selected");%> <%=disabled1%>>Nuevo</option>
                     <option value="R" <%if (gaConfFld.getE01EXCTCL().equals("R"))
				out.print("selected");%> <%=disabled1%>>Recurrente</option>
                   </select>
                </div>
            </td>
            <td nowrap >
            </td>
            <td nowrap >
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap >
              <div align="right">% Participación del Banco : </div>
            </td>
            <td nowrap >
               <div align="left">
              	<input type="text" name="E01EXCPPB" size="11" maxlength="7" value="<%=gaConfFld.getE01EXCPPB().trim()%>"  onKeyPress="enterDecimal(event,2)" 			  
				<%=read_only1%>>
 				</div>
             </td>
            <td nowrap> 
              <div align="right">Tiene Proceso de Insolvencia : </div>
            </td>
            <td nowrap >
                <input type="hidden" name="E01EXCPIN" value="<%=gaConfFld.getE01EXCPIN()%>">
                <input type="radio" name="CE01EXCPIN" value="S" onClick="document.forms[0].E01EXCPIN.value='S';hidePAdmin('pInsolv',true)"
			  <%if (gaConfFld.getE01EXCPIN().equals("S"))
				out.print("checked");%> <%=disabled1%> onChange="hidePAdmin('pInsolv',true)" onBlur="hidePAdmin('pInsolv',true)" >
                Sí
                <input type="radio" name="CE01EXCPIN" value="N" onClick="document.forms[0].E01EXCPIN.value='N';hidePAdmin('pInsolv',false)"
			  <%if (gaConfFld.getE01EXCPIN().equals("N"))
				out.print("checked");%> <%=disabled1%> onChange="hidePAdmin('pInsolv',false)" onBlur="hidePAdmin('pInsolv',false)" >
                No
            </td>
          </tr>
	</table>

	<div id="pInsolv" style="display:''">
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Tipo Administrador : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01EXCTAD" size="55" maxlength="50" value="<%= gaConfFld.getE01EXCTAD().trim()%>" <%=read_only1%>>
            </td>
            <td nowrap> 
              <div align="right">Nombre Administrador : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01EXCNAD" size="55" maxlength="50" value="<%= gaConfFld.getE01EXCNAD().trim()%>" <%=read_only1%>>
            </td>
          </tr>
		</table>
	</div>    
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Asociar Bienes Inmuebles por Adhesión o Destinación  : </div>
            </td>
            <td nowrap >
                <input type="hidden" name="E01EXCBAD" value="<%=gaConfFld.getE01EXCBAD()%>">
                <input type="radio" name="CE01EXCBAD" value="S" onClick="document.forms[0].E01EXCBAD.value='S';hidePAdmin('pBienAd',true)"
			  <%if (gaConfFld.getE01EXCBAD().equals("S"))
				out.print("checked");%> <%=disabled1%> onChange="hidePAdmin('pBienAd',true)" onBlur="hidePAdmin('pBienAd',true)" >
                Sí
                <input type="radio" name="CE01EXCBAD" value="N" onClick="document.forms[0].E01EXCBAD.value='N';hidePAdmin('pBienAd',false)"
			  <%if (gaConfFld.getE01EXCBAD().equals("N"))
				out.print("checked");%> <%=disabled1%> onChange="hidePAdmin('pBienAd',false)" onBlur="hidePAdmin('pBienAd',false)" >
                No
            </td>
            <td nowrap >
            </td>
            <td nowrap >
               <div align="left">
 				</div>
             </td>
          </tr>
		</table>
	<div id="pBienAd" style="display:''">
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Tipo de Inmueble : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01EXCTIN" size="4" maxlength="5" value="<%=gaConfFld.getE01EXCTIN().trim()%>" <%=read_only1%>>
              <%
              	if (read_only1.equals("")) {
              %> 
              <a href="javascript:GetCodeDescCNOFC('E01EXCTIN','D01EXCTIN','GT')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>
			  <%
			  	}
			  %>
              <input type="text" name="D01EXCTIN" size="35" maxlength="35" value="<%= gaConfFld.getD01EXCTIN().trim()%>" <%=read_only1%>>
            </td>
            <td nowrap> 
              <div align="right">Número de Inscripción : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01EXCNIN" size="30" maxlength="34" value="<%= gaConfFld.getE01EXCNIN().trim()%>" <%=read_only1%>>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Folio de Matricula Inmobiliaria : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01EXCNMT" size="55" maxlength="50" value="<%= gaConfFld.getE01EXCNMT().trim()%>" <%=read_only1%>>
            </td>
            <td nowrap> 
              <div align="right">País Inmueble : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01EXCPAI" size="4" maxlength="5" value="<%=gaConfFld.getE01EXCPAI().trim()%>" <%=read_only1%>>
              <%
              	if (read_only1.equals("")) {
              %> 
              <a href="javascript:GetCodeDescCNOFC('E01EXCPAI','D01EXCPAI','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>
			  <%
			  	}
			  %>
              <input type="text" name="D01EXCPAI" size="25" maxlength="25" value="<%= gaConfFld.getD01EXCPAI().trim()%>" <%=read_only1%>>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Departamento : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01EXCDPI" size="4" maxlength="5" value="<%=gaConfFld.getE01EXCDPI().trim()%>" <%=read_only1%>>
              <%
              	if (read_only1.equals("")) {
              %> 
 			  <a href="javascript:Get2FilterCodes('E01EXCDPI','D01EXCDPI','27', '',document.forms[0]['E01EXCPAI'].value)" >
              <img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>
			  <%
			  	}
			  %>
              <input type="text" name="D01EXCDPI" size="25" maxlength="25" value="<%= gaConfFld.getD01EXCDPI().trim()%>" <%=read_only1%>>
            </td>
            <td nowrap> 
              <div align="right">Municipio : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01EXCMNI" size="4" maxlength="5" value="<%=gaConfFld.getE01EXCMNI().trim()%>" <%=read_only1%>>
              <%
              	if (read_only1.equals("")) {
              %> 
			<a href="javascript:Get2FilterCodes('E01EXCMNI','D01EXCMNI','84', '',document.forms[0]['E01EXCDPI'].value)" >
              <img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>
			  <%
			  	}
			  %>
              <input type="text" name="D01EXCMNI" size="25" maxlength="25" value="<%= gaConfFld.getD01EXCMNI().trim()%>" <%=read_only1%>>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Descripción Inmueble : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01EXCDSI" size="60" maxlength="65" value="<%= gaConfFld.getE01EXCDSI().trim()%>" <%=read_only1%>>
            </td>
            <td nowrap> 
<%-- 
              <div align="right">ID Cliente Propietario : </div>
--%>
            </td>
            <td nowrap >
<%-- 
              <input type="text" name="E01EXCCUN" size="9" maxlength="10" value="<%=gaConfFld.getE01EXCCUN().trim()%>" <%=read_only1%> onKeyPress="enterInteger(event)">
              <%
              	if (read_only1.equals("")) {
              %> 
               <a href="javascript:GetCustomerDetails2('E01EXCCUN','E01EXCRSP','E01EXCIDP','','','','E01EXCDPP','','','','','','','','','','','','','','','','','','E01EXCTPP','E01EXCCIP','E01EXC1NP','E01EXC2NP','E01EXC1AP','E01EXC2AP','E01EXCPAP','D01EXCDPP','E01EXCMNP','D01EXCMNP','E01EXCDIP','E01EXCEMP')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
			  <%
			  	}
			  %>
--%>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Tipo de Persona Propietaria : </div>
            </td>
            <td nowrap >
               <div align="left"> 
                  <select name="E01EXCTPP">
                    <option value=" " <%if (!(gaConfFld.getE01EXCTPP().equals("1")
					|| gaConfFld.getE01EXCTPP().equals("2")
					|| gaConfFld.getE01EXCTPP().equals("3")
					|| gaConfFld.getE01EXCTPP().equals("4")
					|| gaConfFld.getE01EXCTPP().equals("5")
					|| gaConfFld.getE01EXCTPP().equals("6")
					|| gaConfFld.getE01EXCTPP().equals("7")))
				out.print("selected");%>> 
                     </option>
                     <option value="1" <%if (gaConfFld.getE01EXCTPP().equals("1"))
				out.print("selected");%> <%=disabled1%>>Persona Física nacional mayor de 18 años</option>
                     <option value="2" <%if (gaConfFld.getE01EXCTPP().equals("2"))
				out.print("selected");%> <%=disabled1%>>Persona Física menor de 18 años</option>
                     <option value="3" <%if (gaConfFld.getE01EXCTPP().equals("3"))
				out.print("selected");%> <%=disabled1%>>Persona Física extranjero residente</option>
                     <option value="4" <%if (gaConfFld.getE01EXCTPP().equals("4"))
				out.print("selected");%> <%=disabled1%>>Persona Física extranjero no residente</option>
                     <option value="5" <%if (gaConfFld.getE01EXCTPP().equals("5"))
				out.print("selected");%> <%=disabled1%>>Persona juridica nacional o extranjera registrada</option>
                     <option value="6" <%if (gaConfFld.getE01EXCTPP().equals("6"))
				out.print("selected");%> <%=disabled1%>>Persona juridica  extranjera no  registrada</option>
                     <option value="7" <%if (gaConfFld.getE01EXCTPP().equals("7"))
				out.print("selected");%> <%=disabled1%>>Patrimonio autonomo o encargo fiduciario</option>
                   </select>
                </div>
            </td>
            <td nowrap> 
              <div align="right">Clase de Identificación : </div>
            </td>
            <td nowrap >
               <div align="left"> 
                  <select name="E01EXCCIP">
                    <option value=" " <%if (!(gaConfFld.getE01EXCCIP().equals("1")
					|| gaConfFld.getE01EXCCIP().equals("2")
					|| gaConfFld.getE01EXCCIP().equals("3")
					|| gaConfFld.getE01EXCCIP().equals("4")
					|| gaConfFld.getE01EXCCIP().equals("5")
					|| gaConfFld.getE01EXCCIP().equals("6")
					|| gaConfFld.getE01EXCCIP().equals("7")))
				out.print("selected");%>> 
                     </option>
                     <option value="1" <%if (gaConfFld.getE01EXCCIP().equals("1"))
				out.print("selected");%> <%=disabled1%>>CEDULA DE CIUDADANIA</option>
                     <option value="2" <%if (gaConfFld.getE01EXCCIP().equals("2"))
				out.print("selected");%> <%=disabled1%>>REGISTRO CIVIL DE NACIMIENTO</option>
                     <option value="3" <%if (gaConfFld.getE01EXCCIP().equals("3"))
				out.print("selected");%> <%=disabled1%>>CEDULA DE EXTRANJERIA</option>
                     <option value="4" <%if (gaConfFld.getE01EXCCIP().equals("4"))
				out.print("selected");%> <%=disabled1%>>PASAPORTE</option>
                     <option value="5" <%if (gaConfFld.getE01EXCCIP().equals("5"))
				out.print("selected");%> <%=disabled1%>>NIT</option>
                     <option value="6" <%if (gaConfFld.getE01EXCCIP().equals("6"))
				out.print("selected");%> <%=disabled1%>>CERTIFICADO DE INSCRIPCION O EXISTENCIA</option>
                     <option value="7" <%if (gaConfFld.getE01EXCCIP().equals("7"))
				out.print("selected");%> <%=disabled1%>>CODIGO NEGOCIOS FIDUCIARIOS</option>
                   </select>
                </div>
            </td>
          </tr>
		</table>
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Razón Social : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01EXCRSP" size="60" maxlength="65" value="<%= gaConfFld.getE01EXCRSP().trim()%>" <%=read_only1%>>
            </td>
            <td nowrap> 
              <div align="right">Número Identificación : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01EXCIDP" size="25" maxlength="27" value="<%= gaConfFld.getE01EXCIDP().trim()%>" <%=read_only1%>>
            </td>
          </tr>
		</table>
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Primer Nombre : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01EXC1NP" size="30" maxlength="33" value="<%= gaConfFld.getE01EXC1NP().trim()%>" <%=read_only1%>>
            </td>
            <td nowrap> 
              <div align="right">Segundo Nombre : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01EXC2NP" size="30" maxlength="33" value="<%= gaConfFld.getE01EXC2NP().trim()%>" <%=read_only1%>>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Primer Apellido : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01EXC1AP" size="30" maxlength="33" value="<%= gaConfFld.getE01EXC1AP().trim()%>" <%=read_only1%>>
            </td>
            <td nowrap> 
              <div align="right">Segundo Apellido : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01EXC2AP" size="30" maxlength="33" value="<%= gaConfFld.getE01EXC2AP().trim()%>" <%=read_only1%>>
            </td>
          </tr>
		</table>
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">País Propietario : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01EXCPAP" size="4" maxlength="5" value="<%=gaConfFld.getE01EXCPAP().trim()%>" <%=read_only1%>>
              <%
              	if (read_only1.equals("")) {
              %> 
              <a href="javascript:GetCodeDescCNOFC('E01EXCPAP','D01EXCPAP','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>
			  <%
			  	}
			  %>
              <input type="text" name="D01EXCPAP" size="25" maxlength="25" value="<%= gaConfFld.getD01EXCPAP().trim()%>" <%=read_only1%>>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Departamento : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01EXCDPP" size="4" maxlength="5" value="<%=gaConfFld.getE01EXCDPP().trim()%>" <%=read_only1%>>
              <%
              	if (read_only1.equals("")) {
              %> 
			  <a href="javascript:Get2FilterCodes('E01EXCDPP','D01EXCDPP','27', '',document.forms[0]['E01EXCPAP'].value)" >
              <img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>
			  <%
			  	}
			  %>
              <input type="text" name="D01EXCDPP" size="25" maxlength="25" value="<%= gaConfFld.getD01EXCDPP().trim()%>" <%=read_only1%>>
            </td>
            <td nowrap> 
              <div align="right">Municipio : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01EXCMNP" size="4" maxlength="5" value="<%=gaConfFld.getE01EXCMNP().trim()%>" <%=read_only1%>>
              <%
              	if (read_only1.equals("")) {
              %> 
			<a href="javascript:Get2FilterCodes('E01EXCMNP','D01EXCMNP','84', '',document.forms[0]['E01EXCDPP'].value)" >
              <img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>
			  <%
			  	}
			  %>
              <input type="text" name="D01EXCMNP" size="25" maxlength="25" value="<%= gaConfFld.getD01EXCMNP().trim()%>" <%=read_only1%>>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Dirección : </div>
            </td>
            <td nowrap colspan="2">
              <input type="text" name="E01EXCDIP" size="90" maxlength="95" value="<%= gaConfFld.getE01EXCDIP().trim()%>" <%=read_only1%>>
            </td>
            <td nowrap >
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Email Propietario : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01EXCEMP" size="60" maxlength="65" value="<%= gaConfFld.getE01EXCEMP().trim()%>" <%=read_only1%>>
            </td>
            <td nowrap> 
            </td>
            <td nowrap >
            </td>
          </tr>
		</table>
	</div>    
	</td>
	</tr>
</table>

</div>    

<SCRIPT type="text/javascript">
 	if (document.forms[0].E01EXCPIN.value == "S") {
		hidePAdmin('pInsolv', true);
	}else{
		hidePAdmin('pInsolv', false);
	}
 	if (document.forms[0].E01EXCBAD.value == "S") {
		hidePAdmin('pBienAd', true);
	}else{
		hidePAdmin('pBienAd', false);
	}
 	if (document.forms[0].E01EXCUS1.value == "S") {
		hidePAdmin('aSerial', false);
		hidePAdmin('bSerial', true);
	}else{
		hidePAdmin('aSerial', true);
		hidePAdmin('bSerial', false);
	}
</SCRIPT>