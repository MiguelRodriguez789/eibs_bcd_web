<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<jsp:useBean id="GLedger" class="datapro.eibs.beans.EGL134002Message" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<%! 
   int row = 0 ;
   String getRowClass(){
   String rowClass = "";
   	rowClass = (row % 2 == 1) ? "trdark" : "trclear" ;	
   	row++;
   	return rowClass ;
   }
   String getModifiedClass( String fieldValue ){
   	return ( "Y".equals( fieldValue )?"class=\"txtchanged\"":"" );
   }
   %>
<style>
   table tr td:first-child,
   table tr td:first-child,
   table tr td:nth-child(3)
   {
   text-align:right; 
   width: 20%;
   }  
   table tr td:nth-child(2).
   table tr td:nth-child(4)
   {
   text-align:left; 
   width: 30%;
   }  
</style>
<H4>Datos B&aacute;sicos</H4>
<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
   <tr id="<%=getRowClass()%>">
      <td>
         <div>Numero de Cuenta Contable :</div>
      </td>
      <td>
         <eibsinput:text property="E02GLMBNK" name="GLedger" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK %>" readonly="true" />
         <eibsinput:text property="E02GLMCCY" name="GLedger" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true" />
         <eibsinput:text property="E02GLMGLN" name="GLedger" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true" />
      </td>
      <td> </td>
      <td></td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>
         <div>Estado Cuenta :</div>
      </td>
      <td <%=getModifiedClass(GLedger.getF02GLMFR1())%>>
         <INPUT type="radio" value="1" <% if (GLedger.getE02GLMFR1().equals("1") || GLedger.getE02GLMFR1().equals("")) out.print("checked");%> onclick="chgesta(this.value)">Activo
         <INPUT type="radio" value="2" <% if (GLedger.getE02GLMFR1().equals("2")) out.print("checked");%> onclick="chgesta(this.value)">Inactivo
         <INPUT type="radio" value="3" <% if (GLedger.getE02GLMFR1().equals("3")) out.print("checked");%> onclick="chgesta(this.value)">Cerrado
      </td>
      <td> </td>
      <td></td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>
         <div>Descripción de la Cuenta :</div>
      </td>
      <td>
         <eibsinput:text property="E02GLMDSC" name="GLedger" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" required="true" modified="F02GLMDSC" />
      </td>
      <td> </td>
      <td></td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>
         <div>Tipo de Producto :</div>
      </td>
      <td <%=getModifiedClass(GLedger.getF02GLMATY())%>>
         <eibsinput:cnofc property="E02GLMATY" name="GLedger" flag="04" fn_code="E02GLMATY" />
      </td>
      <td>
         <div>Clase de la Cuenta :</div>
      </td>
      <td <%=getModifiedClass(GLedger.getF02GLMCLS())%>>
         <eibsinput:cnofc property="E02GLMCLS" name="GLedger" flag="01" fn_code="E02GLMCLS" size="3" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>
         <div>Requiere Centro de Costo :</div>
      </td>
      <td <%=getModifiedClass(GLedger.getF02GLMCCN())%>>
         <INPUT type="radio" value="Y" <%if(GLedger.getE02GLMCCN().equals("Y")) out.print("checked");%>> S&iacute;
         <INPUT type="radio" value="N" <%if(!GLedger.getE02GLMCCN().equals("Y")) out.print("checked");%>> No
      </td>
      <td>
         <div>Cuenta Reconciliable :</div>
      </td>
      <td <%=getModifiedClass(GLedger.getF02GLMRCL())%>>
         <INPUT type="radio" value="Y" <%if(GLedger.getE02GLMRCL().equals("Y")) out.print("checked");%>> S&iacute;
         <INPUT type="radio" value="N" <%if(!GLedger.getE02GLMRCL().equals("Y")) out.print("checked");%>> No
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>
         <div>Estado de Cuenta Diario :</div>
      </td>
      <td <%=getModifiedClass(GLedger.getF02GLMDST())%>>
         <INPUT type="radio" value="1" <%if(GLedger.getE02GLMDST().equals("1")) out.print("checked");%>> S&iacute;
         <INPUT type="radio" value="N" <%if(!GLedger.getE02GLMDST().equals("1")) out.print("checked");%>> No
      </td>
      <td>
         <div>Nivel de Libro Diario :</div>
      </td>
      <td <%=getModifiedClass(GLedger.getF02GLMRMA())%>>
         <INPUT type="radio" value="D" <%if(GLedger.getE02GLMRMA().equals("D")) out.print("checked");%>> Detalle
         <INPUT type="radio" value="T" <%if(!GLedger.getE02GLMRMA().equals("D")) out.print("checked");%>> Total
      </td>
   </tr>
   <%if(currUser.getE01INT().equals("04")){%>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="20%">
			<div align="right">Codigo Agrupador SAT :</div>
		</td>
		<td nowrap width="30%">
			<eibsinput:text property="E02GLMFRD" modified="F02GLMFRD" name="GLedger" size="3" />
			 <b>.</b>
			 <eibsinput:text property="E02GLMFRE" modified="F02GLMFRE" name="GLedger" size="2" />
		</td>
		<td nowrap width="20%">
			<div align="right">Nivel del SAT :</div>
		</td>
		<td nowrap width="30%">
			<eibsinput:text property="E02GLMFRF" modified="F02GLMFRF" name="GLedger" size="1" />
		</td>
	</tr>
			<% } %>
   <tr id="<%=getRowClass()%>">
      <td>
         <div>Cuenta I.B.F :</div>
      </td>
      <td <%=getModifiedClass(GLedger.getF02GLMIBF())%>>
         <INPUT type="radio" value="IB" <%if(GLedger.getE02GLMRMA().equals("IB")) out.print("checked");%>> Sí
         <INPUT type="radio" value="" <%if(!GLedger.getE02GLMRMA().equals("IB")) out.print("checked");%>> No
      </td>
      <td>
         <div>Cuenta de Tesorería :</div>
      </td>
      <td <%=getModifiedClass(GLedger.getF02GLMMEF())%>>
         <INPUT type="radio" value="Y" <%if(GLedger.getE02GLMMEF().equals("Y")) out.print("checked");%>> S&iacute;
         <INPUT type="radio" value="N" <%if(!GLedger.getE02GLMMEF().equals("Y")) out.print("checked");%>> No
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>
         <div>Reconciliación/Clientes :</div>
      </td>
      <td>
         <SELECT name="E02GLMCPF" <%=getModifiedClass(GLedger.getF02GLMCPF())%>>
			<OPTION value=" " <%if (!(GLedger.getE02GLMCPF().equals("1") 
									|| GLedger.getE02GLMCPF().equals("2")
									|| GLedger.getE02GLMCPF().equals("3")
									|| GLedger.getE02GLMCPF().equals("4")
									|| GLedger.getE02GLMCPF().equals("5")
									|| GLedger.getE02GLMCPF().equals("6")
									|| GLedger.getE02GLMCPF().equals("7")
									|| GLedger.getE02GLMCPF().equals("N"))) out.print("selected"); %>></OPTION>
			<OPTION value="1" <%if (GLedger.getE02GLMCPF().equals("1")) out.print("selected"); %>>Reconciliación Bancaria</OPTION>						
			<OPTION value="2" <%if (GLedger.getE02GLMCPF().equals("2")) out.print("selected"); %>>Referencia</OPTION>
			<OPTION value="3" <%if (GLedger.getE02GLMCPF().equals("3")) out.print("selected"); %>>Nro Cliente</OPTION>
			<OPTION value="4" <%if (GLedger.getE02GLMCPF().equals("4")) out.print("selected"); %>>Referencia-Nro Cliente</OPTION>
			<OPTION value="5" <%if (GLedger.getE02GLMCPF().equals("5")) out.print("selected"); %>>Referencia-Fecha Referencia</OPTION>
			<OPTION value="6" <%if (GLedger.getE02GLMCPF().equals("6")) out.print("selected"); %>>Referencia-Nro Cliente-Fecha Referencia</OPTION>
			<OPTION value="7" <%if (GLedger.getE02GLMCPF().equals("7")) out.print("selected"); %>>Nro Cliente-Fecha Referencia</OPTION>
			<OPTION value="N" <%if (GLedger.getE02GLMCPF().equals("N")) out.print("selected"); %>>Ninguna</OPTION>
         </SELECT>
      </td>
      <td>
         <div>Control de Previsiones :</div>
      </td>
      <td <%=getModifiedClass(GLedger.getF02GLMPRV())%>>
         <INPUT type="radio" value="Y" <%if(GLedger.getE02GLMPRV().equals("Y")) out.print("checked");%>> S&iacute;
         <INPUT type="radio" value="N" <%if(!GLedger.getE02GLMPRV().equals("Y")) out.print("checked");%>> No
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>
         <div>Cuenta Reajuste :</div>
      </td>
      <td>
         <SELECT name="E02GLMREV" <%=getModifiedClass(GLedger.getF02GLMREV())%>>
            <OPTION value="N" <%if (!(GLedger.getE02GLMREV().equals("1") ||GLedger.getE02GLMREV().equals("2")||GLedger.getE02GLMREV().equals("3") ||GLedger.getE02GLMREV().equals("4")||GLedger.getE02GLMREV().equals("5")||GLedger.getE02GLMREV().equals("N"))) out.print("selected"); %>></OPTION>
            <OPTION value="1" <%if (GLedger.getE02GLMREV().equals("1")) out.print("selected"); %>>Mant./Valor Nicaragua</OPTION>
            <%if(currUser.getE01INT().equals("05")){%>
            <OPTION value="2" <%if (GLedger.getE02GLMREV().equals("2")) out.print("selected"); %>>Reajuste UVR</OPTION>
            <% } else { %>
            <OPTION value="2" <%if (GLedger.getE02GLMREV().equals("2")) out.print("selected"); %>>Reajuste UF/Chile</OPTION>
            <% }%>
            <OPTION value="3" <%if (GLedger.getE02GLMREV().equals("3")) out.print("selected"); %>>Reajuste IPV/Chile</OPTION>
            <OPTION value="4" <%if (GLedger.getE02GLMREV().equals("4")) out.print("selected"); %>>Reajuste USD/Chile</OPTION>
            <OPTION value="5" <%if (GLedger.getE02GLMREV().equals("5")) out.print("selected"); %>>Valor Ajuste/PERU</OPTION>
            <OPTION value="N" <%if (GLedger.getE02GLMREV().equals("N")) out.print("selected"); %>>No Aplica</OPTION>
         </SELECT>
      </td>
      <td>
         <div>Sensibilidad de Tasas :</div>
      </td>
      <td>
         <input type="text" size="6" value="<%= GLedger.getE02GLMFR6().trim()%>">
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>
         <div>Cuenta Contrapartida :</div>
      </td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLMXOF()%>" <%=getModifiedClass(GLedger.getF02GLMXOF())%>>
      </td>
      <td>
         <div>Nivel de Contabilización :</div>
      </td>
      <td>
         <input type="text" size="2" value="<%= GLedger.getE02GLMACL().trim()%>" <%=getModifiedClass(GLedger.getF02GLMACL())%>>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>
         <div>Numero Cuenta Presupuesto :</div>
      </td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLMBUN()%>" <%=getModifiedClass(GLedger.getF02GLMBUN())%>>
      </td>
      <td>
         <div>Grupo Presupuesto Promedio :</div>
      </td>
      <td>
         <input type="text" size="2" value="<%= GLedger.getE02GLMFL1().trim()%>" <%=getModifiedClass(GLedger.getF02GLMFL1())%>>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>
         <div>Cuenta Equivalente :</div>
      </td>
      <td>
         <input type="text" size="21" value="<%= GLedger.getE02GLMHOA()%>" <%=getModifiedClass(GLedger.getF02GLMHOA())%>>
      </td>
      <td>
         <div>Requiere Origen y Destino :</div>
      </td>
      <td <%=getModifiedClass(GLedger.getF02GLMFL2())%>>
         <INPUT type="radio" value="Y" <%if(GLedger.getE02GLMFL2().equals("Y")) out.print("checked");%>> S&iacute;
         <INPUT type="radio" value="N" <%if(!GLedger.getE02GLMFL2().equals("Y")) out.print("checked");%>> No
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>
         <div>Descripción Equivalente :</div>
      </td>
      <td>
         <eibsinput:text property="E02GLMHDS" name="GLedger" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" modified="F02GLMHDS" />
      </td>
      <td>
         <div>Códigos de Usuario :</div>
      </td>
      <td>
         <input type="text" size="4" value="<%= GLedger.getE02GLMCIC().trim()%>" <%=getModifiedClass(GLedger.getF02GLMCIC())%>>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>
         <div>Cuenta de Encaje :</div>
      </td>
      <td>
         <input type="text" size="5" value="<%= GLedger.getE02GLMFR2().trim()%>" <%=getModifiedClass(GLedger.getF02GLMFR2())%>>
      </td>
      <td>
         <div>Cuenta de Impuestos:</div>
      </td>
      <td <%=getModifiedClass(GLedger.getF02GLMFR5())%>>
         <INPUT type="radio" value="Y" <%if(GLedger.getE02GLMFR5().equals("Y")) out.print("checked");%>> S&iacute;
         <INPUT type="radio" value="N" <%if(!GLedger.getE02GLMFR5().equals("Y")) out.print("checked");%>> No
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>
         <div>Cuenta Centralizada :</div>
      </td>
      <td <%=getModifiedClass(GLedger.getF02GLMSUM())%>>
         <p>
            <input type="radio" value="Y" <%if (GLedger.getE02GLMSUM().equals("Y")) out.print("checked"); %> onclick="chgvali(this.value)">Si
            <input type="radio" value="N" <%if (!GLedger.getE02GLMSUM().equals("Y")) out.print("checked"); %> onclick="chgvali(this.value)">No
         </p>
      </td>
      <td>
         <div>Oficina Centralizadora :</div>
      </td>
      <td>
         <input type="text" size="5" value="<%= GLedger.getE02GLMCBR().trim()%>" <%=getModifiedClass(GLedger.getF02GLMCBR())%>>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>
         <div>Temporalidad de Cartera :</div>
      </td>
      <td>
         <input type="text" size="6" value="<%= GLedger.getE02GLMFR7().trim()%>" <%=getModifiedClass(GLedger.getF02GLMFR7())%>>
      </td>
      <td>
         <div>Dia Traslado (0 Todos los dias) :</div>
      </td>
      <td>
         <input type="text" size="2" value="<%= GLedger.getE02GLMFR3().length() > 2 ? GLedger.getE02GLMFR3().substring(1,3) : "" %>" <%=getModifiedClass(GLedger.getF02GLMFR3())%>>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>
         <div>Saldos a tomar (D)iario - (M)ensual:</div>
      </td>
      <td>
         <input type="text" size="1" value="<%= GLedger.getE02GLMFR3().length() > 0 ? GLedger.getE02GLMFR3().substring(0,1) : "" %>" <%=getModifiedClass(GLedger.getF02GLMFR3())%>>
      </td>
      <td>
         <div>Posición de Apalancamiento :</div>
      </td>
      <td>
         <SELECT name="E02GLMFRC">
            <OPTION value=" " <%if (!(GLedger.getE02GLMFRB().equals("1") ||GLedger.getE02GLMFRB().equals("2")||GLedger.getE02GLMFRB().equals("3")||GLedger.getE02GLMFRB().equals("4")||GLedger.getE02GLMFRB().equals("5")||GLedger.getE02GLMFRB().equals("6")||GLedger.getE02GLMFRB().equals("7")||GLedger.getE02GLMFRB().equals("8"))) out.print("selected"); %>></OPTION>
            <OPTION value="1" <%if (GLedger.getE02GLMFRB().equals("1")) out.print("selected"); %>>Activo M/E</OPTION>
            <OPTION value="2" <%if (GLedger.getE02GLMFRB().equals("2")) out.print("selected"); %>>Activo M/E Posicion.Bruta</OPTION>
            <OPTION value="3" <%if (GLedger.getE02GLMFRB().equals("3")) out.print("selected"); %>>Otros Derechos M/E</OPTION>
            <OPTION value="4" <%if (GLedger.getE02GLMFRB().equals("4")) out.print("selected"); %>>Otros Derechos M/E P.Bruta</OPTION>
            <OPTION value="5" <%if (GLedger.getE02GLMFRB().equals("5")) out.print("selected"); %>>Pasivo M/E</OPTION>
            <OPTION value="6" <%if (GLedger.getE02GLMFRB().equals("6")) out.print("selected"); %>>Pasivos M/E Posicion Bruta</OPTION>
            <OPTION value="7" <%if (GLedger.getE02GLMFRB().equals("7")) out.print("selected"); %>>Otras Obligaciones M/E</OPTION>
            <OPTION value="8" <%if (GLedger.getE02GLMFRB().equals("8")) out.print("selected"); %>>Otras Obligaciones M/E P.Bruta</OPTION>
         </SELECT>
      </td>
      <td></td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>
         <div>Clasificación Provisión Iva:</div>
      </td>
      <td>
         <SELECT name="E02GLMFRA" <%=getModifiedClass(GLedger.getF02GLMFRA())%>>
            <OPTION value=" " <%if (!(GLedger.getE02GLMFRA().equals("1") ||GLedger.getE02GLMFRA().equals("2")||GLedger.getE02GLMFRA().equals("3") ||GLedger.getE02GLMFRA().equals("N"))) out.print("selected"); %>></OPTION>
            <OPTION value="1" <%if (GLedger.getE02GLMFRA().equals("1")) out.print("selected"); %>>Si</OPTION>
            <OPTION value="2" <%if (GLedger.getE02GLMFRA().equals("2")) out.print("selected"); %>>No</OPTION>
         </SELECT>
      </td>
      <td>
         <div>Autoretención :</div>
      </td>
      <td <%=getModifiedClass(GLedger.getF02GLMFRB())%>>
         <% 	boolean bCRE = (GLedger.getE02GLMFRB().indexOf("C") > -1);
            boolean bCOM = (GLedger.getE02GLMFRB().indexOf("O") > -1);
            boolean bINT = (GLedger.getE02GLMFRB().indexOf("I") > -1);
            boolean bDER = (GLedger.getE02GLMFRB().indexOf("D") > -1); %>
         <INPUT type="checkbox" value="C" <% if (bCRE == true) out.print("checked"); %>>Cree
         <INPUT type="checkbox" value="O" <% if (bCOM == true) out.print("checked"); %>>Comision
         <INPUT type="checkbox" value="I" <% if (bINT == true) out.print("checked"); %>>Interes.Cartera
         <INPUT type="checkbox" value="D" <% if (bDER == true) out.print("checked"); %>>Derivados
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>
         <div>Codigo Entidad Titularizada :</div>
      </td>
      <td>
         <eibsinput:help name="GLedger" property="E02GLMFR9" modified="F02GLMFR9" fn_param_one="E02GLMFR9" fn_param_three="K" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BROKER%>" onchange="showTitular()"/>
      </td>
      <td>
         <div><% if (!currUser.getE01INT().equals("04")) { out.print("Codigo MISPYG :"); } %></div>
      </td>
      <td>
      <% if (!currUser.getE01INT().equals("04")) { %>
         <eibsinput:text property="E02GLMFR4" modified="F02GLMFR4" name="GLedger" size="6" />
      <% } %>
      </td>
   </tr>
   <tr id="TITULAR1" class="<%=getRowClass()%>" style="display:<%= !GLedger.getE02GLMFR9().isEmpty() ? "" : "none"%>">
      <td>
         <div>Numero de Cuenta Externa :</div>
      </td>
      <td>
         <input type="text" size="21" value="<%= GLedger.getE02GLMTIA()%>" <%=getModifiedClass(GLedger.getF02GLMTIA())%>>
      </td>
      <td>
         <div>Descripcion Cuenta :</div>
      </td>
      <td>
         <eibsinput:text property="E02GLMTIS" modified="F02GLMTIS" name="GLedger" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" />
      </td>
   </tr>
</table>