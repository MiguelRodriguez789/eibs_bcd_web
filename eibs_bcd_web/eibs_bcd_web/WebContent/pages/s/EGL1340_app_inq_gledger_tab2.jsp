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
   td {
   white-space: nowrap ;
   }
   table tr td:first-child,
   {
   text-align:right; 
   width: 20%;
   }  
   #tab2 table tr td:nth-child(2) {
   text-align:left;
   width: 70%; 
   }
</style>
<% row = 0; if (GLedger.getE02GLMACD().equals("10")) { %>
<H4>Modulo de Prestamos</H4>
<table class="tableinfo">
   <tr id="<%=getRowClass()%>">
      <TH align="left" colspan=2>Periodificación</TH>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Débito por Interés Normal :</td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLMXDR() %>" <%=getModifiedClass(GLedger.getF02GLMXDR())%>>
         <eibsinput:text property="D02GLMXDR" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Crédito por Interés Normal :</td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLMXCR() %>" <%=getModifiedClass(GLedger.getF02GLMXCR())%>>
         <eibsinput:text property="D02GLMXCR" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Débito por Interés de Mora :</td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLMXLR() %>" <%=getModifiedClass(GLedger.getF02GLMXLR())%>>
         <eibsinput:text property="D02GLMXLR" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Crédito por Interés de Mora :</td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLMXLC() %>" <%=getModifiedClass(GLedger.getF02GLMXLC())%>>
         <eibsinput:text property="D02GLMXLC" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <% if (!GLedger.getE02GLMREV().equals("N")) { %>
   <tr id="<%=getRowClass()%>">
      <td>Débito por Reajuste :</td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLMRIN() %>" <%=getModifiedClass(GLedger.getF02GLMRIN())%>>
         <eibsinput:text property="D02GLMRIN" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Crédito por Reajuste :</td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLMREX() %>" <%=getModifiedClass(GLedger.getF02GLMREX())%>>
         <eibsinput:text property="D02GLMREX" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Débito por Reajuste Moroso :</td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLXG09() %>" <%=getModifiedClass(GLedger.getF02GLXG09())%>>
         <eibsinput:text property="D02GLXG09" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Crédito por Reajuste Moroso :</td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLXG10() %>" <%=getModifiedClass(GLedger.getF02GLXG10())%>>
         <eibsinput:text property="D02GLXG10" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <% } %>
   <tr id="<%=getRowClass()%>">
      <TH align="left" colspan=2>Vencimiento Cuotas</TH>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cuenta Principal Activo Vencido :</td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLXG05() %>" <%=getModifiedClass(GLedger.getF02GLXG05())%>>
         <eibsinput:text property="D02GLXG05" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cuenta Interés Activo Vencido :</td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLXG06() %>" <%=getModifiedClass(GLedger.getF02GLXG06())%>>
         <eibsinput:text property="D02GLXG06" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <% if (!GLedger.getE02GLMREV().equals("N")) { %>
   <tr id="<%=getRowClass()%>">
      <td>Cuenta Reajuste Activo Vencido :</td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLXG07() %>" <%=getModifiedClass(GLedger.getF02GLXG07())%>>
         <eibsinput:text property="D02GLXG07" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cuenta Reajuste Moroso Activo Vencido :</td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLXG08() %>" <%=getModifiedClass(GLedger.getF02GLXG08())%>>
         <eibsinput:text property="D02GLXG08" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <% } %>
   <tr id="<%=getRowClass()%>">
      <TH align="left" colspan=2>Suspension de Devengo </TH>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Débito por Interés Normal :</td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLXG01() %>" <%=getModifiedClass(GLedger.getF02GLXG01())%>>
         <eibsinput:text property="D02GLXG01" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Crédito por Interés Normal :</td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLXG02() %>" <%=getModifiedClass(GLedger.getF02GLXG02())%>>
         <eibsinput:text property="D02GLXG02" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Débito por Interés de Mora :</td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLMX19() %>" <%=getModifiedClass(GLedger.getF02GLMX19())%>>
         <eibsinput:text property="D02GLMX19" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Crédito por Interés de Mora :</td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLMX20() %>" <%=getModifiedClass(GLedger.getF02GLMX20())%>>
         <eibsinput:text property="D02GLMX20" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <% if (!GLedger.getE02GLMREV().equals("N")) { %>
   <tr id="<%=getRowClass()%>">
      <td>Débito por Reajuste :</td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLXG03() %>" <%=getModifiedClass(GLedger.getF02GLXG03())%>>
         <eibsinput:text property="D02GLXG03" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Crédito por Reajuste :</td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLXG04() %>" <%=getModifiedClass(GLedger.getF02GLXG04())%>>
         <eibsinput:text property="D02GLXG04" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Débito por Reajuste Moroso :</td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLMX21() %>" <%=getModifiedClass(GLedger.getF02GLMX21())%>>
         <eibsinput:text property="D02GLMX21" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Crédito por Reajuste Moroso :</td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLMX22() %>" <%=getModifiedClass(GLedger.getF02GLMX22())%>>
         <eibsinput:text property="D02GLMX22" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <% } %>
   <tr id="<%=getRowClass()%>">
      <TH align="left" colspan=2>Cuentas de Recupero</TH>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Ingreso por Interés en Suspenso :</td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLMXSO() %>" <%=getModifiedClass(GLedger.getF02GLMXSO())%>>
         <eibsinput:text property="D02GLMXSO" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Ingreso por Interés de Mora en suspenso :</td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLMXSD() %>" <%=getModifiedClass(GLedger.getF02GLMXSD())%>>
         <eibsinput:text property="D02GLMXSD" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <% if (!GLedger.getE02GLMREV().equals("N")) { %>
   <tr id="<%=getRowClass()%>">
      <td>Ingreso por Reajuste en Suspenso :</td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLXG14() %>" <%=getModifiedClass(GLedger.getF02GLXG14())%>>
         <eibsinput:text property="D02GLXG14" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Ingreso por Reajuste Moroso en Suspenso :</td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLMX18() %>" <%=getModifiedClass(GLedger.getF02GLMX18())%>>
         <eibsinput:text property="D02GLMX18" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <% } %>
   <tr id="<%=getRowClass()%>">
      <td>Ingreso por Recupero Periodo Actual :</td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLXG15() %>" <%=getModifiedClass(GLedger.getF02GLXG15())%>>
         <eibsinput:text property="D02GLXG15" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Ingreso por Recupero Periodo Anterior :</td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLXG13() %>" <%=getModifiedClass(GLedger.getF02GLXG13())%>>
         <eibsinput:text property="D02GLXG13" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Ingreso por Recupero Interes de Mora Post Castigo :</td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLXG54() %>" <%=getModifiedClass(GLedger.getF02GLXG54())%>>
         <eibsinput:text property="D02GLXG54" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <% if (!GLedger.getE02GLMREV().equals("N")) { %>
   <tr id="<%=getRowClass()%>">
      <td>Ingreso por Recupero Reajuste Moroso Post Castigo :</td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLXG55() %>" <%=getModifiedClass(GLedger.getF02GLXG55())%>>
         <eibsinput:text property="D02GLXG55" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <% } %>
   <tr id="<%=getRowClass()%>">
      <TH align="left" colspan=2>Referencias Adicionales</TH>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cuenta de Interés Pagado por Anticipado :</td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLXG18() %>" <%=getModifiedClass(GLedger.getF02GLXG18())%>>
         <eibsinput:text property="D02GLXG18" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cuenta Paso a Prestamo Vencido :</td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLMXSM() %>" <%=getModifiedClass(GLedger.getF02GLMXSM())%>>
         <eibsinput:text property="D02GLMXSM" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cuenta Paso a Prestamo Vigente :</td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLMXSR() %>" <%=getModifiedClass(GLedger.getF02GLMXSR())%>>
         <eibsinput:text property="D02GLMXSR" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cuenta para Condonaciones :</td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLXG49() %>" <%=getModifiedClass(GLedger.getF02GLXG49())%>>
         <eibsinput:text property="D02GLXG49" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cuenta Pendientes por Cobrar :</td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLXG32() %>" <%=getModifiedClass(GLedger.getF02GLXG32())%>>
         <eibsinput:text property="D02GLXG32" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cuenta para Reverso de Pagos :</td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLMX32() %>" <%=getModifiedClass(GLedger.getF02GLMX32())%>>
         <eibsinput:text property="D02GLMX32" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Pendiente por Cobrar Seguros :</td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLMX27() %>" <%=getModifiedClass(GLedger.getF02GLMX32())%>>
         <eibsinput:text property="D02GLMX27" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cuenta para Reverso de Pagos :</td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLXG32() %>" <%=getModifiedClass(GLedger.getF02GLXG32())%>>
         <eibsinput:text property="D02GLXG32" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>      
   <tr id="<%=getRowClass()%>">
      <TH align="left" colspan=2>Provision</TH>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Débito por Principal :</td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLXG41() %>" <%=getModifiedClass(GLedger.getF02GLXG41())%>>
         <eibsinput:text property="D02GLXG41" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Crédito por Principal :</td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLXG42() %>" <%=getModifiedClass(GLedger.getF02GLXG42())%>>
         <eibsinput:text property="D02GLXG42" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Débito por Intereses :</td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLXG43() %>" <%=getModifiedClass(GLedger.getF02GLXG43())%>>
         <eibsinput:text property="D02GLXG43" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Crédito por Intereses :</td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLXG44() %>" <%=getModifiedClass(GLedger.getF02GLXG44())%>>
         <eibsinput:text property="D02GLXG44" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
    <tr id="<%=getRowClass()%>">
      <td>Débito por Intereses de Mora :</td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLXG56() %>" <%=getModifiedClass(GLedger.getF02GLXG56())%>>
         <eibsinput:text property="E02GLXG56" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>  
   <tr id="<%=getRowClass()%>">
      <td>Crédito por Intereses de Mora :</td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLXG57() %>" <%=getModifiedClass(GLedger.getF02GLXG57())%>>
         <eibsinput:text property="D02GLXG57" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Débito por Otros Cargos :</td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLXG45() %>" <%=getModifiedClass(GLedger.getF02GLXG45())%>>
         <eibsinput:text property="D02GLXG45" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Crédito por Otros Cargos :</td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLXG46() %>" <%=getModifiedClass(GLedger.getF02GLXG46())%>>
         <eibsinput:text property="D02GLXG46" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <TH align="left" colspan=2>Castigo</TH>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Débito por Principal :</td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLXG16() %>" <%=getModifiedClass(GLedger.getF02GLXG16())%>>
         <eibsinput:text property="D02GLXG16" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Crédito por Principal :</td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLXG17() %>" <%=getModifiedClass(GLedger.getF02GLXG17())%>>
         <eibsinput:text property="D02GLXG17" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Débito por Intereses :</td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLXG11() %>" <%=getModifiedClass(GLedger.getF02GLXG11())%>>
         <eibsinput:text property="D02GLXG11" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Crédito por Intereses :</td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLXG12() %>" <%=getModifiedClass(GLedger.getF02GLXG12())%>>
         <eibsinput:text property="D02GLXG12" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
    <tr id="<%=getRowClass()%>">
      <td>Débito por Intereses de Mora :</td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLXG58() %>" <%=getModifiedClass(GLedger.getF02GLXG58())%>>
         <eibsinput:text property="D02GLXG58" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Crédito por Intereses de Mora :</td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLXG59() %>" <%=getModifiedClass(GLedger.getF02GLXG59())%>>
         <eibsinput:text property="D02GLXG59" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>     
   <tr id="<%=getRowClass()%>">
      <td>Débito por Otros Cargos :</td>
      <td>
         <input type="text" name="E02GLXG47" size="17" value="<%= GLedger.getE02GLXG47() %>" <%=getModifiedClass(GLedger.getF02GLXG47())%>>
         <eibsinput:text property="D02GLXG47" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Crédito por Otros Cargos :</td>
      <td>
         <input type="text" name="E02GLXG48" size="17" value="<%= GLedger.getE02GLXG48() %>" <%=getModifiedClass(GLedger.getF02GLXG48())%>>
         <eibsinput:text property="D02GLXG48" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Débito Cuenta Castigo no Informado :</td>
      <td>
         <input type="text" name="E02GLXG19" size="17" value="<%= GLedger.getE02GLXG19() %>" <%=getModifiedClass(GLedger.getF02GLXG19())%>>
         <eibsinput:text property="D02GLXG19" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Crédito Cuenta Castigo no Informado :</td>
      <td>
         <input type="text" name="E02GLXG20" size="17" value="<%= GLedger.getE02GLXG20() %>" <%=getModifiedClass(GLedger.getF02GLXG20())%>>
         <eibsinput:text property="D02GLXG20" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cuenta Provision Individual :</td>
      <td>
         <input type="text" name="E02GLMX28" size="17" value="<%= GLedger.getE02GLMX28() %>" <%=getModifiedClass(GLedger.getF02GLMX28())%>>
         <eibsinput:text property="D02GLMX28" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cuenta Provision Global :</td>
      <td>
         <input type="text" name="E02GLMX29" size="17" value="<%= GLedger.getE02GLMX29() %>" <%=getModifiedClass(GLedger.getF02GLMX29())%>>
         <eibsinput:text property="D02GLMX29" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cuenta Uso Provision :</td>
      <td>
         <input type="text" name="E02GLMX30" size="17" value="<%= GLedger.getE02GLMX30() %>" <%=getModifiedClass(GLedger.getF02GLMX30())%>>
         <eibsinput:text property="D02GLMX30" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cuenta de Responsabilidad :</td>
      <td>
         <input type="text" name="E02GLMX31" size="17" value="<%= GLedger.getE02GLMX31() %>" <%=getModifiedClass(GLedger.getF02GLMX31())%>>
         <eibsinput:text property="D02GLMX31" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Debito por Interes de Mora Post Castigo :</td>
      <td>
         <input type="text" name="E02GLXG50" size="17" value="<%= GLedger.getE02GLXG50() %>" <%=getModifiedClass(GLedger.getF02GLXG50())%>>
         <eibsinput:text property="D02GLXG50" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Credito por Interes de Mora Post Castigo :</td>
      <td>
         <input type="text" name="E02GLXG51" size="17" value="<%= GLedger.getE02GLXG51() %>" <%=getModifiedClass(GLedger.getF02GLXG51())%>>
         <eibsinput:text property="D02GLXG51" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <% if (!GLedger.getE02GLMREV().equals("N")) { %>
   <tr id="<%=getRowClass()%>">
      <td>Débito por Reajuste Moroso Post Castigo:</td>
      <td>
         <input type="text" name="E02GLXG52" size="17" value="<%= GLedger.getE02GLXG52() %>" <%=getModifiedClass(GLedger.getF02GLXG52())%>>
         <eibsinput:text property="D02GLXG52" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Crédito por Reajuste Moroso Post Castigo:</td>
      <td>
         <input type="text" name="E02GLXG53" size="17" value="<%= GLedger.getE02GLXG53() %>" <%=getModifiedClass(GLedger.getF02GLXG53())%>>
         <eibsinput:text property="D02GLXG53" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <% } %>
   <%if(currUser.getE01INT().equals("18")){%>
   <% if (GLedger.getH02FLGWK3().equals("H")) {%>
   <% if (GLedger.getE02GLMCLS().equals("1") ||GLedger.getE02GLMCLS().equals("6") || GLedger.getE02GLMCLS().equals("8")) { //activo %>
   <tr id="<%=getRowClass()%>">
      <TH align="left" colspan=2>HIPOTECARIOS ACTIVOS</TH>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Distribucion Fondos:</td>
      <td>
         <input type="text" name="E02GLXG21" size="17" value="<%= GLedger.getE02GLXG21() %>" <%=getModifiedClass(GLedger.getF02GLXG21())%>>
         <eibsinput:text property="D02GLXG21" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Comisiones Letras Hipotecarias:</td>
      <td>
         <input type="text" name="E02GLXG22" size="17" value="<%= GLedger.getE02GLXG22() %>" <%=getModifiedClass(GLedger.getF02GLXG22())%>>
         <eibsinput:text property="D02GLXG22" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Amortizacion Directa Letras Hipotecarias:</td>
      <td>
         <input type="text" name="E02GLXG23" size="17" value="<%= GLedger.getE02GLXG23() %>" <%=getModifiedClass(GLedger.getF02GLXG23())%>>
         <eibsinput:text property="D02GLXG23" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Responsabilidad Amortizacion Directa Letras Hipotecarias :</td>
      <td>
         <input type="text" name="E02GLXG24" size="17" value="<%= GLedger.getE02GLXG24() %>" <%=getModifiedClass(GLedger.getF02GLXG24())%>>
         <eibsinput:text property="D02GLXG24" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Comision Letras Hipotecarias Suspendidas Vigentes:</td>
      <td>
         <input type="text" name="E02GLXG25" size="17" value="<%= GLedger.getE02GLXG25() %>" <%=getModifiedClass(GLedger.getF02GLXG25())%>>
         <eibsinput:text property="D02GLXG25" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Comision Letras Hipotecarias Suspendidas Vencidas:</td>
      <td>
         <input type="text" name="E02GLXG26" size="17" value="<%= GLedger.getE02GLXG26() %>" <%=getModifiedClass(GLedger.getF02GLXG26())%>>
         <eibsinput:text property="D02GLXG26" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Interes Suspendido Vigente:</td>
      <td>
         <input type="text" name="E02GLXG27" size="17" value="<%= GLedger.getE02GLXG27() %>" <%=getModifiedClass(GLedger.getF02GLXG27())%>>
         <eibsinput:text property="D02GLXG27" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Reajuste Suspendido Vigente:</td>
      <td>
         <input type="text" name="E02GLXG28" size="17" value="<%= GLedger.getE02GLXG28() %>" <%=getModifiedClass(GLedger.getF02GLXG28())%>>
         <eibsinput:text property="D02GLXG28" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Constituci&oacute;n Dividendos Vigentes:</td>
      <td>
         <input type="text" name="E02GLXG29" size="17" value="<%= GLedger.getE02GLXG29() %>" <%=getModifiedClass(GLedger.getF02GLXG29())%>>
         <eibsinput:text property="D02GLXG29" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Constituci&oacute;n Dividendos Vencidos:</td>
      <td>
         <input type="text" name="E02GLXG30" size="17" value="<%= GLedger.getE02GLXG30() %>" <%=getModifiedClass(GLedger.getF02GLXG30())%>>
         <eibsinput:text property="D02GLXG30" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Constituci&oacute;n Dividendos Acelerados:</td>
      <td>
         <input type="text" name="E02GLXG31" size="17" value="<%= GLedger.getE02GLXG31() %>" <%=getModifiedClass(GLedger.getF02GLXG31())%>>
         <eibsinput:text property="D02GLXG31" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Castigos del año:</td>
      <td>
         <input type="text" name="E02GLXG32" size="17" value="<%= GLedger.getE02GLXG32() %>" <%=getModifiedClass(GLedger.getF02GLXG32())%>>
         <eibsinput:text property="D02GLXG32" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Constituci&oacute;n Seguros Vigentes:</td>
      <td>
         <input type="text" name="E02GLXG33" size="17" value="<%= GLedger.getE02GLXG33() %>" <%=getModifiedClass(GLedger.getF02GLXG33())%>>
         <eibsinput:text property="D02GLXG33" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Constituci&oacute;n Seguros Vencidos:</td>
      <td>
         <input type="text" name="E02GLXG34" size="17" value="<%= GLedger.getE02GLXG34() %>" <%=getModifiedClass(GLedger.getF02GLXG34())%>>
         <eibsinput:text property="D02GLXG34" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Constituci&oacute;n Seguros Castigados:</td>
      <td>
         <input type="text" name="E02GLXG35" size="17" value="<%= GLedger.getE02GLXG35() %>" <%=getModifiedClass(GLedger.getF02GLXG35())%>>
         <eibsinput:text property="D02GLXG35" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Comision Letras Hipotecarias Suspendidas Castigadas:</td>
      <td>
         <input type="text" name="E02GLXG36" size="17" value="<%= GLedger.getE02GLXG36() %>" <%=getModifiedClass(GLedger.getF02GLXG36())%>>
         <eibsinput:text property="D02GLXG36" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Fondo de Amortizaci&oacute;n Extraordinaria:</td>
      <td>
         <input type="text" name="E02GLXG37" size="17" value="<%= GLedger.getE02GLXG37() %>" <%=getModifiedClass(GLedger.getF02GLXG37())%>>
         <eibsinput:text property="D02GLXG37" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Fondo de Inter&eacute;s Ordinario:</td>
      <td>
         <input type="text" name="E02GLXG38" size="17" value="<%= GLedger.getE02GLXG38() %>" <%=getModifiedClass(GLedger.getF02GLXG38())%>>
         <eibsinput:text property="D02GLXG28" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Reajuste Suspendido Castigado:</td>
      <td>
         <input type="text" name="E02GLXG39" size="17" value="<%= GLedger.getE02GLXG39() %>" <%=getModifiedClass(GLedger.getF02GLXG39())%>>
         <eibsinput:text property="D02GLXG39" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Interés Suspendido Castigado:</td>
      <td>
         <input type="text" name="E02GLXG40" size="17" value="<%= GLedger.getE02GLXG40() %>" <%=getModifiedClass(GLedger.getF02GLXG40())%>>
         <eibsinput:text property="D02GLXG40" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <% } %>
   <% if (GLedger.getE02GLMCLS().equals("2")) { // pasivo %>
   <tr id="<%=getRowClass()%>">
      <TH align="left" colspan=2>HIPOTECARIOS PASIVOS</TH>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Constituci&oacute;n Cupones y Letras Sorteadas:</td>
      <td>
         <input type="text" name="E02GLXG21" size="17" value="<%= GLedger.getE02GLXG21() %>" <%=getModifiedClass(GLedger.getF02GLXG21())%>>
         <eibsinput:text property="D02GLXG21" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Pago DCV:</td>
      <td>
         <input type="text" name="E02GLXG22" size="17" value="<%= GLedger.getE02GLXG22() %>" <%=getModifiedClass(GLedger.getF02GLXG22())%>>
         <eibsinput:text property="D02GLXG22" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Amortización Ordinaria Letras Hipotecarias:</td>
      <td>
         <input type="text" name="E02GLXG23" size="17" value="<%= GLedger.getE02GLXG23() %>" <%=getModifiedClass(GLedger.getF02GLXG23())%>>
         <eibsinput:text property="D02GLXG23" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Interés Ordinario Letras Hipotecarias:</td>
      <td>
         <input type="text" name="E02GLXG24" size="17" value="<%= GLedger.getE02GLXG24() %>" <%=getModifiedClass(GLedger.getF02GLXG24())%>>
         <eibsinput:text property="D02GLXG24" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Amortización Extraordinaria Letras Hipotecarias:</td>
      <td>
         <input type="text" name="E02GLXG25" size="17" value="<%= GLedger.getE02GLXG25() %>" <%=getModifiedClass(GLedger.getF02GLXG25())%>>
         <eibsinput:text property="D02GLXG25" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Responsabilidad Letras Hipotecarias:</td>
      <td>
         <input type="text" name="E02GLXG26" size="17" value="<%= GLedger.getE02GLXG26() %>" <%=getModifiedClass(GLedger.getF02GLXG26())%>>
         <eibsinput:text property="D02GLXG26" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Pagar&eacute; Cup&oacute;n: </td>
      <td>
         <input type="text" name="E02GLXG27" size="17" value="<%= GLedger.getE02GLXG27() %>" <%=getModifiedClass(GLedger.getF02GLXG27())%>>
         <eibsinput:text property="D02GLXG27" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Responsabilidad Pagar&eacute; Cup&oacute;n:</td>
      <td>
         <input type="text" name="E02GLXG28" size="17" value="<%= GLedger.getE02GLXG28() %>" <%=getModifiedClass(GLedger.getF02GLXG28())%>>
         <eibsinput:text property="D02GLXG28" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Reserva T&eacute;cnica:</td>
      <td>
         <input type="text" name="E02GLXG29" size="17" value="<%= GLedger.getE02GLXG29() %>" <%=getModifiedClass(GLedger.getF02GLXG29())%>>
         <eibsinput:text property="D02GLXG29" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Responsabilidad Reserva T&eacute;cnica:</td>
      <td>
         <input type="text" name="E02GLXG30" size="17" value="<%= GLedger.getE02GLXG30() %>" <%=getModifiedClass(GLedger.getF02GLXG30())%>>
         <eibsinput:text property="D02GLXG30" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <% } %>
   <% } %>
   <% } %>
</table>
<% } %>
<% if (GLedger.getE02GLMACD().equals("50") || GLedger.getE02GLMACD().equals("51")) { %>
<H4>Modulo de Cobranzas</H4>
<table class="tableinfo">
   <tr id="<%=getRowClass()%>">
      <td>Comisiones por Cobrar :</td>
      <td>
         <input type="text" name="E02GLMXDR" size="17" value="<%= GLedger.getE02GLMXDR() %>" <%=getModifiedClass(GLedger.getF02GLMXDR())%>>
         <eibsinput:text property="D02GLMXDR" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cuenta Contrapartida :</td>
      <td>
         <input type="text" name="E02GLMXCR" size="17" value="<%= GLedger.getE02GLMXCR() %>" <%=getModifiedClass(GLedger.getF02GLMXCR())%>>
         <eibsinput:text property="D02GLMXCR" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Retenciones de Impuestos :</td>
      <td>
         <input type="text" name="E02GLMX16" size="17" value="<%= GLedger.getE02GLMX16() %>" <%=getModifiedClass(GLedger.getF02GLMX16())%>>
         <eibsinput:text property="D02GLMX16" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Otras Retenciones :</td>
      <td>
         <input type="text" name="E02GLMX17" size="17" value="<%= GLedger.getE02GLMX17() %>" <%=getModifiedClass(GLedger.getF02GLMX17())%>>
         <eibsinput:text property="D02GLMX17" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Intereses de Terceros :</td>
      <td>
         <input type="text" name="E02GLMXST" size="17" value="<%= GLedger.getE02GLMXST() %>" <%=getModifiedClass(GLedger.getF02GLMXST())%>>
         <eibsinput:text property="D02GLMXST" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Gastos del Corresponsal :</td>
      <td>
         <input type="text" name="E02GLMXIE" size="17" value="<%= GLedger.getE02GLMXIE() %>" <%=getModifiedClass(GLedger.getF02GLMXIE())%>>
         <eibsinput:text property="D02GLMXIE" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
</table>
<% } %>
<% if (GLedger.getE02GLMACD().equals("40") || GLedger.getE02GLMACD().equals("41") 
   || GLedger.getE02GLMACD().equals("42") || GLedger.getE02GLMACD().equals("43")) { %>
<H4>Modulo de Cartas de Crédito</H4>
<table class="tableinfo">
   <tr id="<%=getRowClass()%>">
      <td>Comisiones por Cobrar :</td>
      <td>
         <input type="text" name="E02GLMXDR" size="17" value="<%= GLedger.getE02GLMXDR() %>" <%=getModifiedClass(GLedger.getF02GLMXDR())%>>
         <input type="text" name="D02GLMXDR" size="62" value="<%= GLedger.getD02GLMXDR() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cuenta Contrapartida :</td>
      <td>
         <input type="text" name="E02GLMXCR" size="17" value="<%= GLedger.getE02GLMXCR() %>" <%=getModifiedClass(GLedger.getF02GLMXCR())%>>
         <input type="text" name="D02GLMXCR" size="62" value="<%= GLedger.getD02GLMXCR() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cuenta Débito Aceptaciones:</td>
      <td>
         <input type="text" name="E02GLMXSD" size="17" value="<%= GLedger.getE02GLMXSD() %>" <%=getModifiedClass(GLedger.getF02GLMXSD())%>>
         <input type="text" name="D02GLMXSD" size="62" value="<%= GLedger.getD02GLMXSD() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cuenta Crédito Aceptaciones :</td>
      <td>
         <input type="text" name="E02GLMXST" size="17" value="<%= GLedger.getE02GLMXST() %>" <%=getModifiedClass(GLedger.getF02GLMXST())%>>
         <input type="text" name="D02GLMXST" size="62" value="<%= GLedger.getD02GLMXST() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cuenta Garantia Efectivo :</td>
      <td>
         <input type="text" name="E02GLMXSR" size="17" value="<%= GLedger.getE02GLMXSR() %>" <%=getModifiedClass(GLedger.getF02GLMXSR())%>>
         <input type="text" name="D02GLMXSR" size="62" value="<%= GLedger.getD02GLMXSR() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Aceptaciones Descontadas :</td>
      <td>
         <input type="text" name="E02GLMXSO" size="17" value="<%= GLedger.getE02GLMXSO() %>" <%=getModifiedClass(GLedger.getF02GLMXSO())%>>
         <input type="text" name="D02GLMXSO" size="62" value="<%= GLedger.getD02GLMXSO() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Refinanciamientos (Prestamos) :</td>
      <td>
         <input type="text" name="E02GLMXSS" size="17" value="<%= GLedger.getE02GLMXSS() %>" <%=getModifiedClass(GLedger.getF02GLMXSS())%>>
         <input type="text" name="D02GLMXSS" size="62" value="<%= GLedger.getD02GLMXSS() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cuenta Débito Pagos Diferidos :</td>
      <td>
         <input type="text" name="E02GLMXIE" size="17" value="<%= GLedger.getE02GLMXIE() %>" <%=getModifiedClass(GLedger.getF02GLMXIE())%>>
         <input type="text" name="D02GLMXIE" size="62" value="<%= GLedger.getD02GLMXIE() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cuenta Crédito Pagos Diferidos :</td>
      <td>
         <input type="text" name="E02GLMDFP" size="17" value="<%= GLedger.getE02GLMDFP() %>" <%=getModifiedClass(GLedger.getF02GLMDFP())%>>
         <input type="text" name="D02GLMDFP" size="62" value="<%= GLedger.getD02GLMDFP() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <TH align="left" colspan=2>Periodificación de Interes</TH>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cuenta Débito por Intereses :</td>
      <td>
         <input type="text" name="E02GLMX21" size="17" value="<%= GLedger.getE02GLMX21() %>" <%=getModifiedClass(GLedger.getF02GLMX21())%>>
         <input type="text" name="D02GLMX21" size="62" value="<%= GLedger.getD02GLMX21() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cuenta Crédito por Intereses :</td>
      <td>
         <input type="text" name="E02GLMX22" size="17" value="<%= GLedger.getE02GLMX22() %>" <%=getModifiedClass(GLedger.getF02GLMX22())%>>
         <input type="text" name="D02GLMX22" size="62" value="<%= GLedger.getD02GLMX22() %>" readonly>
      </td>
   </tr>
</table>
<% } %>
<% if (GLedger.getE02GLMACD().equals("01") || GLedger.getE02GLMACD().equals("02") || GLedger.getE02GLMACD().equals("03") || GLedger.getE02GLMACD().equals("04")) { %>
<H4>Modulo de Depositos a la Vista</H4>
<table class="tableinfo">
   <tr id="<%=getRowClass()%>">
      <TH align="left" colspan=2>Créditos</TH>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cuenta Crédito de Interes :</td>
      <td>
         <input type="text" name="E02GLMXCR" size="17" value="<%= GLedger.getE02GLMXCR() %>" <%=getModifiedClass(GLedger.getF02GLMXCR())%>>
         <input type="text" name="D02GLMXCR" size="62" value="<%= GLedger.getD02GLMXCR() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cargos por Servicio Saldo Minimo :</td>
      <td>
         <input type="text" name="E02GLMXSM" size="17" value="<%= GLedger.getE02GLMXSM() %>" <%=getModifiedClass(GLedger.getF02GLMXSM())%>>
         <input type="text" name="D02GLMXSM" size="62" value="<%= GLedger.getD02GLMXSM() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cargos por Servicio Diferidos/Sobregiro :</td>
      <td>
         <input type="text" name="E02GLMXSR" size="17" value="<%= GLedger.getE02GLMXSR() %>" <%=getModifiedClass(GLedger.getF02GLMXSR())%>>
         <input type="text" name="D02GLMXSR" size="62" value="<%= GLedger.getD02GLMXSR() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cargos por Servicio Suspension Pagos :</td>
      <td>
         <input type="text" name="E02GLMXSS" size="17" value="<%= GLedger.getE02GLMXSS() %>" <%=getModifiedClass(GLedger.getF02GLMXSS())%>>
         <input type="text" name="D02GLMXSS" size="62" value="<%= GLedger.getD02GLMXSS() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cargos por Servicio Cuentas Inactivas :</td>
      <td>
         <input type="text" name="E02GLMXSD" size="17" value="<%= GLedger.getE02GLMXSD() %>" <%=getModifiedClass(GLedger.getF02GLMXSD())%>>
         <input type="text" name="D02GLMXSD" size="62" value="<%= GLedger.getD02GLMXSD() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cargos por Servicio Varios :</td>
      <td>
         <input type="text" name="E02GLMXST" size="17" value="<%= GLedger.getE02GLMXST() %>" <%=getModifiedClass(GLedger.getF02GLMXST())%>>
         <input type="text" name="D02GLMXST" size="62" value="<%= GLedger.getD02GLMXST() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cuenta Pendientes por Cobrar :</td>
      <td>
         <input type="text" name="E02GLXG32" size="17" value="<%= GLedger.getE02GLXG32() %>" <%=getModifiedClass(GLedger.getF02GLXG32())%>>
         <input type="text" name="D02GLXG32" size="62" value="<%= GLedger.getD02GLXG32() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Garantias (Contingencia) :</td>
      <td>
         <input type="text" name="E02GLMXDR" size="17" value="<%= GLedger.getE02GLMXDR() %>" <%=getModifiedClass(GLedger.getF02GLMXDR())%>>
         <input type="text" name="D02GLMXDR" size="62" value="<%= GLedger.getD02GLMXDR() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Comisiones por Cancelaciones :</td>
      <td>
         <input type="text" name="E02GLMXCC" size="17" value="<%= GLedger.getE02GLMXCC() %>" <%=getModifiedClass(GLedger.getF02GLMXCC())%>>
         <input type="text" name="D02GLMXCC" size="62" value="<%= GLedger.getD02GLMXCC() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cheques Certificados :</td>
      <td>
         <input type="text" name="E02GLMX17" size="17" value="<%= GLedger.getE02GLMX17() %>" <%=getModifiedClass(GLedger.getF02GLMX17())%>>
         <input type="text" name="D02GLMX17" size="62" value="<%= GLedger.getD02GLMX17() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <TD>Cargo de Timbres por Cheque :</TD>
      <td>
         <INPUT type="text" name="E02GLMX28" size="17" value="<%= GLedger.getE02GLMX28() %>" <%=getModifiedClass(GLedger.getF02GLMX28())%>>
         <INPUT type="text" name="D02GLMX28" size="62" value="<%= GLedger.getD02GLMX28() %>" readonly>
      </TD>
   </TR>
   <tr id="<%=getRowClass()%>">
      <TD>Cuenta Crédito por Cancelación :</TD>
      <td>
         <INPUT type="text" name="E02GLMX32" size="17" value="<%= GLedger.getE02GLMX32() %>" <%=getModifiedClass(GLedger.getF02GLMX32())%>>
         <INPUT type="text" name="D02GLMX32" size="62" value="<%= GLedger.getD02GLMX32() %>" readonly>
      </TD>
   </TR>
   <tr id="<%=getRowClass()%>">
      <TH align="left" colspan=2>Débitos</TH>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cuenta por Contra Sobregiro Garantizado :</td>
      <td>
         <input type="text" name="E02GLMXLR" size="17" value="<%= GLedger.getE02GLMXLR() %>" <%=getModifiedClass(GLedger.getF02GLMXLR())%>>
         <input type="text" name="D02GLMXLR" size="62" value="<%= GLedger.getD02GLMXLR() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cuenta por Contra Sobregiro No Garantizado :</td>
      <td>
         <input type="text" name="E02GLMXOD" size="17" value="<%= GLedger.getE02GLMXOD() %>" <%=getModifiedClass(GLedger.getF02GLMXOD())%>>
         <input type="text" name="D02GLMXOD" size="62" value="<%= GLedger.getD02GLMXOD() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cuenta Sobregiro en Suspenso :</td>
      <td>
         <input type="text" name="E02GLMXO2" size="17" value="<%= GLedger.getE02GLMXO2() %>" <%=getModifiedClass(GLedger.getF02GLMXO2())%>>
         <input type="text" name="D02GLMXO2" size="62" value="<%= GLedger.getD02GLMXO2() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Gastos Intereses (MMK,SAV,NOW) :</td>
      <td>
         <input type="text" name="E02GLMXIE" size="17" value="<%= GLedger.getE02GLMXIE() %>" <%=getModifiedClass(GLedger.getF02GLMXIE())%>>
         <input type="text" name="D02GLMXIE" size="62" value="<%= GLedger.getD02GLMXIE() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Garantias (Contingencia) :</td>
      <td>
         <input type="text" name="E02GLMDFP" size="17" value="<%= GLedger.getE02GLMDFP() %>" <%=getModifiedClass(GLedger.getF02GLMDFP())%>>
         <input type="text" name="D02GLMDFP" size="62" value="<%= GLedger.getD02GLMDFP() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Por Contra Cuentas Inactivas :</td>
      <td>
         <input type="text" name="E02GLMX19" size="17" value="<%= GLedger.getE02GLMX19() %>" <%=getModifiedClass(GLedger.getF02GLMX19())%>>
         <input type="text" name="D02GLMX19" size="62" value="<%= GLedger.getD02GLMX19() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Por Contra Cuentas Dormidas :</td>
      <td>
         <input type="text" name="E02GLMX20" size="17" value="<%= GLedger.getE02GLMX20() %>" <%=getModifiedClass(GLedger.getF02GLMX20())%>>
         <input type="text" name="D02GLMX20" size="62" value="<%= GLedger.getD02GLMX20() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Gastos por Bonificaciones : </td>
      <td>
         <input type="text" name="E02GLXG01" size="17" value="<%= GLedger.getE02GLXG01() %>" <%=getModifiedClass(GLedger.getF02GLXG01())%>>
         <input type="text" name="D02GLXG01" size="62" value="<%= GLedger.getD02GLXG01() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Condonacion de Impagos:</td>
      <td>
         <input type="text" name="E02GLXG33" size="17" value="<%= GLedger.getE02GLXG33() %>" <%=getModifiedClass(GLedger.getF02GLXG33())%>>
         <eibsinput:text property="D02GLXG33" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <TH align="left" colspan=2>Debito por Intereses de Sobregiros</TH>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Interes de Sobregiro Dias Ciclo 1 :</td>
      <td>
         <input type="text" name="E02GLMX16" size="17" value="<%= GLedger.getE02GLMX16() %>" <%=getModifiedClass(GLedger.getF02GLMX16())%>>
         <input type="text" name="D02GLMX16" size="62" value="<%= GLedger.getD02GLMX16() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Interes de Sobregiro Dias Ciclo 2 :</td>
      <td>
         <input type="text" name="E02GLXG13" size="17" value="<%= GLedger.getE02GLXG13() %>" <%=getModifiedClass(GLedger.getF02GLXG13())%>>
         <input type="text" name="D02GLXG13" size="62" value="<%= GLedger.getD02GLXG13() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Interes de Sobregiro Dias Ciclo 3 :</td>
      <td>
         <input type="text" name="E02GLXG14" size="17" value="<%= GLedger.getE02GLXG14() %>" <%=getModifiedClass(GLedger.getF02GLXG14())%>>
         <input type="text" name="D02GLXG14" size="62" value="<%= GLedger.getD02GLXG14() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Interes de Sobregiro Dias Ciclo 4 :</td>
      <td>
         <input type="text" name="E02GLXG15" size="17" value="<%= GLedger.getE02GLXG15() %>" <%=getModifiedClass(GLedger.getF02GLXG15())%>>
         <input type="text" name="D02GLXG15" size="62" value="<%= GLedger.getD02GLXG15() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Interes de Sobregiro Dias Ciclo 5 :</td>
      <td>
         <input type="text" name="E02GLXG16" size="17" value="<%= GLedger.getE02GLXG16() %>" <%=getModifiedClass(GLedger.getF02GLXG16())%>>
         <input type="text" name="D02GLXG16" size="62" value="<%= GLedger.getD02GLXG16() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Interes de Sobregiro en Suspenso :</td>
      <td>
         <input type="text" name="E02GLXG30" size="17" value="<%= GLedger.getE02GLXG30() %>" <%=getModifiedClass(GLedger.getF02GLXG30())%>>
         <input type="text" name="D02GLXG30" size="62" value="<%= GLedger.getD02GLXG30() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <TH align="left" colspan=2>Credito por Intereses de Sobregiros</TH>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Interes de Sobregiro Dias Ciclo 1 :</td>
      <td>
         <input type="text" name="E02GLMXSO" size="17" value="<%= GLedger.getE02GLMXSO() %>" <%=getModifiedClass(GLedger.getF02GLMXSO())%>>
         <input type="text" name="D02GLMXSO" size="62" value="<%= GLedger.getD02GLMXSO() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Interes de Sobregiro Dias Ciclo 2 :</td>
      <td>
         <input type="text" name="E02GLXG21" size="17" value="<%= GLedger.getE02GLXG21() %>" <%=getModifiedClass(GLedger.getF02GLXG21())%>>
         <input type="text" name="D02GLXG21" size="62" value="<%= GLedger.getD02GLXG21() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Interes de Sobregiro Dias Ciclo 3 :</td>
      <td>
         <input type="text" name="E02GLXG22" size="17" value="<%= GLedger.getE02GLXG22() %>" <%=getModifiedClass(GLedger.getF02GLXG22())%>>
         <input type="text" name="D02GLXG22" size="62" value="<%= GLedger.getD02GLXG22() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Interes de Sobregiro Dias Ciclo 4 :</td>
      <td>
         <input type="text" name="E02GLXG23" size="17" value="<%= GLedger.getE02GLXG23() %>" <%=getModifiedClass(GLedger.getF02GLXG23())%>>
         <input type="text" name="D02GLXG23" size="62" value="<%= GLedger.getD02GLXG23() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Interes de Sobregiro Dias Ciclo 5 :</td>
      <td>
         <input type="text" name="E02GLXG24" size="17" value="<%= GLedger.getE02GLXG24() %>" <%=getModifiedClass(GLedger.getF02GLXG24())%>>
         <input type="text" name="D02GLXG24" size="62" value="<%= GLedger.getD02GLXG24() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Interes de Sobregiro en Suspenso :</td>
      <td>
         <input type="text" name="E02GLMXLC" size="17" value="<%= GLedger.getE02GLMXLC() %>" <%=getModifiedClass(GLedger.getF02GLMXLC())%>>
         <input type="text" name="D02GLMXLC" size="62" value="<%= GLedger.getD02GLMXLC() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <TH align="left" colspan=2>Debito por Intereses de Sobregiros en Contingencia</TH>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Interes de Sobregiro en Contingencia Dias Ciclo 1 :</td>
      <td>
         <input type="text" name="E02GLMX26" size="17" value="<%= GLedger.getE02GLMX26() %>" <%=getModifiedClass(GLedger.getF02GLMX26())%>>
         <input type="text" name="D02GLMX26" size="62" value="<%= GLedger.getD02GLMX26() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Interes de Sobregiro en Contingencia Dias Ciclo 2 :</td>
      <td>
         <input type="text" name="E02GLXG17" size="17" value="<%= GLedger.getE02GLXG17() %>" <%=getModifiedClass(GLedger.getF02GLXG17())%>>
         <input type="text" name="D02GLXG17" size="62" value="<%= GLedger.getD02GLXG17() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Interes de Sobregiro en Contingencia Dias Ciclo 3 :</td>
      <td>
         <input type="text" name="E02GLXG18" size="17" value="<%= GLedger.getE02GLXG18() %>" <%=getModifiedClass(GLedger.getF02GLXG18())%>>
         <input type="text" name="D02GLXG18" size="62" value="<%= GLedger.getD02GLXG18() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Interes de Sobregiro en Contingencia Dias Ciclo 4 :</td>
      <td>
         <input type="text" name="E02GLXG19" size="17" value="<%= GLedger.getE02GLXG19() %>" <%=getModifiedClass(GLedger.getF02GLXG19())%>>
         <input type="text" name="D02GLXG19" size="62" value="<%= GLedger.getD02GLXG19() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Interes de Sobregiro en Contingencia Dias Ciclo 5 :</td>
      <td>
         <input type="text" name="E02GLXG20" size="17" value="<%= GLedger.getE02GLXG20() %>" <%=getModifiedClass(GLedger.getF02GLXG20())%>>
         <input type="text" name="D02GLXG20" size="62" value="<%= GLedger.getD02GLXG20() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <TH align="left" colspan=2>Debito por Intereses de Sobregiros en Contingencia</TH>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Interes de Sobregiro en Contingencia Dias Ciclo 1 :</td>
      <td>
         <input type="text" name="E02GLMX27" size="17" value="<%= GLedger.getE02GLMX27() %>" <%=getModifiedClass(GLedger.getF02GLXG27())%>>
         <input type="text" name="D02GLMX27" size="62" value="<%= GLedger.getD02GLMX27() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Interes de Sobregiro en Contingencia Dias Ciclo 2 :</td>
      <td>
         <input type="text" name="E02GLXG26" size="17" value="<%= GLedger.getE02GLXG26() %>" <%=getModifiedClass(GLedger.getF02GLXG26())%>>
         <input type="text" name="D02GLXG26" size="62" value="<%= GLedger.getD02GLXG26() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Interes de Sobregiro en Contingencia Dias Ciclo 3 :</td>
      <td>
         <input type="text" name="E02GLXG27" size="17" value="<%= GLedger.getE02GLXG27() %>" <%=getModifiedClass(GLedger.getF02GLXG27())%>>
         <input type="text" name="D02GLXG27" size="62" value="<%= GLedger.getD02GLXG27() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Interes de Sobregiro en Contingencia Dias Ciclo 4 :</td>
      <td>
         <input type="text" name="E02GLXG28" size="17" value="<%= GLedger.getE02GLXG28() %>" <%=getModifiedClass(GLedger.getF02GLXG28())%>>
         <input type="text" name="D02GLXG28" size="62" value="<%= GLedger.getD02GLXG28() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Interes de Sobregiro en Contingencia Dias Ciclo 5 :</td>
      <td>
         <input type="text" name="E02GLXG29" size="17" value="<%= GLedger.getE02GLXG29() %>" <%=getModifiedClass(GLedger.getF02GLXG29())%>>
         <input type="text" name="D02GLXG29" size="62" value="<%= GLedger.getD02GLXG29() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <TH align="left" colspan=2>Retencion Contingente Cuentas AFC</TH>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Contingencias Débito :</td>
      <td>
         <input type="text" name="E02GLMX18" size="17" value="<%= GLedger.getE02GLMX18() %>" <%=getModifiedClass(GLedger.getF02GLMX18())%>>
         <input type="text" name="D02GLMX18" size="62" value="<%= GLedger.getD02GLMX18() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Contingencias Crédito :</td>
      <td>
         <input type="text" name="E02GLMX29" size="17" value="<%= GLedger.getE02GLMX29() %>" <%=getModifiedClass(GLedger.getF02GLXG29())%>>
         <input type="text" name="D02GLMX29" size="62" value="<%= GLedger.getD02GLMX29() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <TH align="left" colspan=2>Traslado a Dirección Nacional del Tesoro</TH>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Débito por Traslado :</td>
      <td>
         <input type="text" name="E02GLMX30" size="17" value="<%= GLedger.getE02GLMX30() %>" <%=getModifiedClass(GLedger.getF02GLXG30())%>>
         <input type="text" name="D02GLMX30" size="62" value="<%= GLedger.getD02GLMX30() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Crédito por Traslado :</td>
      <td>
         <input type="text" name="E02GLMX31" size="17" value="<%= GLedger.getE02GLMX31() %>" <%=getModifiedClass(GLedger.getF02GLXG31())%>>
         <input type="text" name="D02GLMX31" size="62" value="<%= GLedger.getD02GLMX31() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <TH align="left" colspan=2>Otras Entradas</TH>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Diferidos a 24 Horas :</td>
      <td>
         <input type="text" name="E02GLMX21" size="17" value="<%= GLedger.getE02GLMX21() %>" <%=getModifiedClass(GLedger.getF02GLMX21())%>>
         <input type="text" name="D02GLMX21" size="62" value="<%= GLedger.getD02GLMX21() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Diferidos a 48 Horas :</td>
      <td>
         <input type="text" name="E02GLMX22" size="17" value="<%= GLedger.getE02GLMX22() %>" <%=getModifiedClass(GLedger.getF02GLMX22())%>>
         <input type="text" name="D02GLMX22" size="62" value="<%= GLedger.getD02GLMX22() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Diferidos a 72 Horas :</td>
      <td>
         <input type="text" name="E02GLMX23" size="17" value="<%= GLedger.getE02GLMX23() %>" <%=getModifiedClass(GLedger.getF02GLMX23())%>>
         <input type="text" name="D02GLMX23" size="62" value="<%= GLedger.getD02GLMX23() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Diferidos a 96 Horas :</td>
      <td>
         <input type="text" name="E02GLMX24" size="17" value="<%= GLedger.getE02GLMX24() %>" <%=getModifiedClass(GLedger.getF02GLMX24())%>>
         <input type="text" name="D02GLMX24" size="62" value="<%= GLedger.getD02GLMX24() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Diferidos Mas 96 Horas :</td>
      <td>
         <input type="text" name="E02GLMX25" size="17" value="<%= GLedger.getE02GLMX25() %>" <%=getModifiedClass(GLedger.getF02GLMX25())%>>
         <input type="text" name="D02GLMX25" size="62" value="<%= GLedger.getD02GLMX25() %>" readonly>
      </td>
   </tr>
</table>
<% } %>
<% if (GLedger.getE02GLMACD().equals("06")) { %>
<H4>Modulo de Cuotas de Participacion</H4>
<table class="tableinfo">
   <tr id="<%=getRowClass()%>">
      <td>Cuenta por Capitalizacion :</td>
      <td>
         <input type="text" name="E02GLXG01" size="17" value="<%= GLedger.getE02GLXG01() %>" <%=getModifiedClass(GLedger.getF02GLXG01())%>>
         <input type="text" name="D02GLXG01" size="62" value="<%= GLedger.getD02GLXG01() %>" readonly>
      </td>
   </tr>
</table>
<% } %>
<% if (GLedger.getE02GLMACD().equals("90") || GLedger.getE02GLMACD().equals("92")) { %>
<H4>Modulo de Amortización / Garantias / Lineas de Crédito / Otros
   Productos
</H4>
<table class="tableinfo">
   <tr id="<%=getRowClass()%>">
      <td align="right" width="2%">(*)</td>
      <td align="right" width="28%">Cuenta Contrapartida :</td>
      <td>
         <input type="text" name="E02GLMXDR" size="17" value="<%= GLedger.getE02GLMXDR() %>" <%=getModifiedClass(GLedger.getF02GLMXDR())%>>
         <input type="text" name="D02GLMXDR" size="62" value="<%= GLedger.getD02GLMXDR() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td align="right" width="2%">(**)</td>
      <td align="right" width="28%">Cuenta Amortización :</td>
      <td>
         <input type="text" name="E02GLMXCR" size="17" value="<%= GLedger.getE02GLMXCR() %>" <%=getModifiedClass(GLedger.getF02GLMXCR())%>>
         <input type="text" name="D02GLMXCR" size="62" value="<%= GLedger.getD02GLMXCR() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td align="right" width="2%"></td>
      <td align="right" width="28%">Cuenta de Débito Monto Usado :</td>
      <td>
         <input type="text" name="E02GLMX21" size="17" value="<%= GLedger.getE02GLMX21() %>" <%=getModifiedClass(GLedger.getF02GLMX21())%>>
         <input type="text" name="D02GLMX21" size="62" value="<%= GLedger.getD02GLMX21() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td align="right" width="2%"></td>
      <td align="right" width="28%">Cuenta de Crédito Monto Usado :</td>
      <td>
         <input type="text" name="E02GLMX22" size="17" value="<%= GLedger.getE02GLMX22() %>" <%=getModifiedClass(GLedger.getF02GLMX22())%>>
         <input type="text" name="D02GLMX22" size="62" value="<%= GLedger.getD02GLMX22() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td align="right" width="2%"></td>
      <td align="right" colspan="2"></td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td align="right" valign="top" width="2%">(*)</td>
      <td align="left" colspan="2">Cuenta de Contrapartida sera usada para GARANTIAS, LINEAS DE Crédito Y OTROS.</td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td align="right" valign="top" width="2%">(**)</td>
      <td align="left" colspan="2">La Cuenta de Ingresos x Comision o Gastos Prepagados serán utilizadas para la Amortización Diaria; Ingresos y Egresos serán afectados a diario de acuerdo a la clasificación de la Cuenta Principal Utilizada. (Cuenta Contable Reflejada Arriba)</td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td align="right" valign="top" width="2%">(**)</td>
      <td align="left" colspan="2">Lineas de Crédito usaran la cuenta de Amortización para incluir la cuenta de Ingresos por Comisión.</td>
   </tr>
</table>
<% } %>
<% if (GLedger.getE02GLMACD().equals("91")) { %>
<H4>Módulo de Garantias</H4>
<table class="tableinfo">
   <tr id="<%=getRowClass()%>">
      <td>Cuenta Contrapartida :</td>
      <td>
         <input type="text" name="E02GLMXDR" size="17" value="<%= GLedger.getE02GLMXDR() %>" <%=getModifiedClass(GLedger.getF02GLMXDR())%>>
         <input type="text" name="D02GLMXDR" size="62" value="<%= GLedger.getD02GLMXDR() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cuentas Futuras :</td>
      <td>
         <input type="text" name="E02GLMXSD" size="17" value="<%= GLedger.getE02GLMXSD() %>" <%=getModifiedClass(GLedger.getF02GLMXSD())%>>
         <input type="text" name="D02GLMXSD" size="62" value="<%= GLedger.getD02GLMXSD() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Garantía Idónea Utilizada Comercial :</td>
      <td>
         <input type="text" name="E02GLMXST" size="17" value="<%= GLedger.getE02GLMXST() %>" <%=getModifiedClass(GLedger.getF02GLMXST())%>>
         <input type="text" name="D02GLMXST" size="62" value="<%= GLedger.getD02GLMXST() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Garantía Idónea Utilizada Consumo :</td>
      <td>
         <input type="text" name="E02GLMXSR" size="17" value="<%= GLedger.getE02GLMXSR() %>" <%=getModifiedClass(GLedger.getF02GLMXSR())%>>
         <input type="text" name="D02GLMXSR" size="62" value="<%= GLedger.getD02GLMXSR() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Garantía Idónea Utilizada Vivienda :</td>
      <td>
         <input type="text" name="E02GLMXSO" size="17" value="<%= GLedger.getE02GLMXSO() %>" <%=getModifiedClass(GLedger.getF02GLMXSO())%>>
         <input type="text" name="D02GLMXSO" size="62" value="<%= GLedger.getD02GLMXSO() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Garantía NO Idónea Utilizada Comercial :</td>
      <td>
         <input type="text" name="E02GLMXSS" size="17" value="<%= GLedger.getE02GLMXSS() %>" <%=getModifiedClass(GLedger.getF02GLMXSS())%>>
         <input type="text" name="D02GLMXSS" size="62" value="<%= GLedger.getD02GLMXSS() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Garantía NO Idónea Utilizada Consumo :</td>
      <td>
         <input type="text" name="E02GLMXIE" size="17" value="<%= GLedger.getE02GLMXIE() %>" <%=getModifiedClass(GLedger.getF02GLMXIE())%>>
         <input type="text" name="D02GLMXIE" size="62" value="<%= GLedger.getD02GLMXIE() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Garantía NO Idónea Utilizada Vivienda :</td>
      <td>
         <input type="text" name="E02GLMDFP" size="17" value="<%= GLedger.getE02GLMDFP() %>" <%=getModifiedClass(GLedger.getF02GLMDFP())%>>
         <input type="text" name="D02GLMDFP" size="62" value="<%= GLedger.getD02GLMDFP() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cuenta Pendiente por Cancelar :</td>
      <td>
         <input type="text" name="E02GLMX21" size="17" value="<%= GLedger.getE02GLMX21() %>" <%=getModifiedClass(GLedger.getF02GLMX21())%>>
         <input type="text" name="D02GLMX21" size="62" value="<%= GLedger.getD02GLMX21() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Débito Titularizacion :</td>
      <td>
         <input type="text" name="E02GLMX24" size="17" value="<%= GLedger.getE02GLMX24() %>" <%=getModifiedClass(GLedger.getF02GLMX24())%>>
         <input type="text" name="D02GLMX24" size="62" value="<%= GLedger.getD02GLMX24() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Crédito Titularizacion :</td>
      <td>
         <input type="text" name="E02GLMX25" size="17" value="<%= GLedger.getE02GLMX25() %>" <%=getModifiedClass(GLedger.getF02GLMX25())%>>
         <input type="text" name="D02GLMX25" size="62" value="<%= GLedger.getD02GLMX25() %>" readonly>
      </td>
   </tr>
</table>
<% } %>
<% if (GLedger.getE02GLMACD().equals("70") || GLedger.getE02GLMACD().equals("71")) { %>
<H4>Modulo Productos Externos a eIBS</H4>
<table class="tableinfo">
   <tr id="<%=getRowClass()%>">
      <td align="right" width="2%"></td>
      <td align="right" width="28%">Débito: Cuentas por Cobrara Intereses :</td>
      <td>
         <input type="text" name="E02GLMXDR" size="17" value="<%= GLedger.getE02GLMXDR() %>" <%=getModifiedClass(GLedger.getF02GLMXDR())%>>
         <input type="text" name="D02GLMXDR" size="62" value="<%= GLedger.getD02GLMXDR() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td align="right" width="2%"></td>
      <td align="right" width="28%">Crédito: Ingreso por Intereses :</td>
      <td>
         <input type="text" name="E02GLMXCR" size="17" value="<%= GLedger.getE02GLMXCR() %>" <%=getModifiedClass(GLedger.getF02GLMXCR())%>>
         <input type="text" name="D02GLMXCR" size="62" value="<%= GLedger.getD02GLMXCR() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td align="right" width="2%"></td>
      <td align="right" width="28%">Débito: Intereses Contingentes :</td>
      <td>
         <input type="text" name="E02GLMX21" size="17" value="<%= GLedger.getE02GLMX21() %>" <%=getModifiedClass(GLedger.getF02GLMX21())%>>
         <input type="text" name="D02GLMX21" size="62" value="<%= GLedger.getD02GLMX21() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td align="right" width="2%"></td>
      <td align="right" width="28%">Crédito: Por Contra Intereses Contingentes :</td>
      <td>
         <input type="text" name="E02GLMX22" size="17" value="<%= GLedger.getE02GLMX22() %>" <%=getModifiedClass(GLedger.getF02GLMX22())%>>
         <input type="text" name="D02GLMX22" size="62" value="<%= GLedger.getD02GLMX22() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td align="right" width="2%"></td>
      <td align="right" colspan="2"></td>
   </tr>
</table>
<% } %>
<% if (GLedger.getE02GLMACD().equals("11") || GLedger.getE02GLMACD().equals("12") || GLedger.getE02GLMACD().equals("14") || GLedger.getE02GLMACD().equals("15")) { %>
<H4>Modulo de Contratos</H4>
<table class="tableinfo">
   <tr id="<%=getRowClass()%>">
      <TH align="left" colspan=2>Periodificación de Interes</TH>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Débito por Interes Normal :</td>
      <td>
         <input type="text" name="E02GLMXDR" size="17" value="<%= GLedger.getE02GLMXDR() %>" <%=getModifiedClass(GLedger.getF02GLMXDR())%>>
         <input type="text" name="D02GLMXDR" size="62" value="<%= GLedger.getD02GLMXDR() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Crédito por Interes Normal :</td>
      <td>
         <input type="text" name="E02GLMXCR" size="17" value="<%= GLedger.getE02GLMXCR() %>" <%=getModifiedClass(GLedger.getF02GLMXCR())%>>
         <input type="text" name="D02GLMXCR" size="62" value="<%= GLedger.getD02GLMXCR() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Débito por Interes Certificado Vencido :</td>
      <td>
         <input type="text" name="E02GLMXLR" size="17" value="<%= GLedger.getE02GLMXLR() %>" <%=getModifiedClass(GLedger.getF02GLMXLR())%>>
         <input type="text" name="D02GLMXLR" size="62" value="<%= GLedger.getD02GLMXLR() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Crédito por Interes Certificado Vencido :</td>
      <td>
         <input type="text" name="E02GLMXLC" size="17" value="<%= GLedger.getE02GLMXLC() %>" <%=getModifiedClass(GLedger.getF02GLMXLC())%>>
         <input type="text" name="D02GLMXLC" size="62" value="<%= GLedger.getD02GLMXLC() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <TH align="left" colspan=2>Entradas Garantias</TH>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cuenta Débito Contingencia :</td>
      <td>
         <input type="text" name="E02GLMXIE" size="17" value="<%= GLedger.getE02GLMXIE() %>" <%=getModifiedClass(GLedger.getF02GLMXIE())%>>
         <input type="text" name="D02GLMXIE" size="62" value="<%= GLedger.getD02GLMXIE() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cuenta Crédito Contingencia :</td>
      <td>
         <input type="text" name="E02GLMDFP" size="17" value="<%= GLedger.getE02GLMDFP() %>" <%=getModifiedClass(GLedger.getF02GLMDFP())%>>
         <input type="text" name="D02GLMDFP" size="62" value="<%= GLedger.getD02GLMDFP() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cuenta Débito Monto Usado :</td>
      <td>
         <input type="text" name="E02GLMX21" size="17" value="<%= GLedger.getE02GLMX21() %>" <%=getModifiedClass(GLedger.getF02GLMX21())%>>
         <input type="text" name="D02GLMX21" size="62" value="<%= GLedger.getD02GLMX21() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cuenta Crédito Monto Usado :</td>
      <td>
         <input type="text" name="E02GLMX22" size="17" value="<%= GLedger.getE02GLMX22() %>" <%=getModifiedClass(GLedger.getF02GLMX22())%>>
         <input type="text" name="D02GLMX22" size="62" value="<%= GLedger.getD02GLMX22() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <TH align="left" colspan=2>Referencias Adicionales</TH>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Operación dada en Garantia :</td>
      <td>
         <input type="text" name="E02GLMXSO" size="17" value="<%= GLedger.getE02GLMXSO() %>" <%=getModifiedClass(GLedger.getF02GLMXSO())%>>
         <input type="text" name="D02GLMXSO" size="62" value="<%= GLedger.getD02GLMXSO() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cuenta Origen del Contrato :</td>
      <td>
         <input type="text" name="E02GLMXSR" size="17" value="<%= GLedger.getE02GLMXSR() %>" <%=getModifiedClass(GLedger.getF02GLMXSR())%>>
         <input type="text" name="D02GLMXSR" size="62" value="<%= GLedger.getD02GLMXSR() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cuenta Contratos Vencidos :</td>
      <td>
         <input type="text" name="E02GLMXSM" size="17" value="<%= GLedger.getE02GLMXSM() %>" <%=getModifiedClass(GLedger.getF02GLMXSM())%>>
         <input type="text" name="D02GLMXSM" size="62" value="<%= GLedger.getD02GLMXSM() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Anulación de Certificados :</td>
      <td>
         <input type="text" name="E02GLMXO2" size="17" value="<%= GLedger.getE02GLMXO2() %>" <%=getModifiedClass(GLedger.getF02GLMXO2())%>>
         <input type="text" name="D02GLMXO2" size="62" value="<%= GLedger.getD02GLMXO2() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cuenta Remanentes por Pago Cuenta Inactiva/Bloqueada :</td>
      <td>
         <input type="text" name="E02GLMXIE" size="17" value="<%= GLedger.getE02GLMXIE() %>" <%=getModifiedClass(GLedger.getF02GLMXIE())%>>
         <input type="text" name="D02GLMXIE" size="62" value="<%= GLedger.getD02GLMXIE() %>" readonly>
      </td>
   </tr>   
   <% if (GLedger.getE02GLMACD().equals("12")) { %>
   <tr id="<%=getRowClass()%>">
      <td>Cancelación de Bonos :</td>
      <td>
         <input type="text" name="E02GLMXSD" size="17" value="<%= GLedger.getE02GLMXSD() %>" <%=getModifiedClass(GLedger.getF02GLMXSD())%>>
         <eibsinput:text property="D02GLMXSD" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <% } %>
</table>
<% } %>
<% if (GLedger.getE02GLMACD().equals("13")) { %>
<H4>Modulo de Inversiones (Papel Comercial)</H4>
<table class="tableinfo">
   <tr id="<%=getRowClass()%>">
      <TH align="left" colspan=2>Periodificación de Interes</TH>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cuenta de Débito por Interes :</td>
      <td>
         <input type="text" name="E02GLMXDR" size="17" value="<%= GLedger.getE02GLMXDR() %>" <%=getModifiedClass(GLedger.getF02GLMXDR())%>>
         <input type="text" name="D02GLMXDR" size="62" value="<%= GLedger.getD02GLMXDR() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cuenta de Crédito por Interes :</td>
      <td>
         <input type="text" name="E02GLMXCR" size="17" value="<%= GLedger.getE02GLMXCR() %>" <%=getModifiedClass(GLedger.getF02GLMXCR())%>>
         <input type="text" name="D02GLMXCR" size="62" value="<%= GLedger.getD02GLMXCR() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <TH align="left" colspan=2>Custodio (Contingencias)</TH>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cuenta de Débito :</td>
      <td>
         <input type="text" name="E02GLMXIE" size="17" value="<%= GLedger.getE02GLMXIE() %>" <%=getModifiedClass(GLedger.getF02GLMXIE())%>>
         <input type="text" name="D02GLMXIE" size="62" value="<%= GLedger.getD02GLMXIE() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cuenta de Crédito :</td>
      <td>
         <input type="text" name="E02GLMDFP" size="17" value="<%= GLedger.getE02GLMDFP() %>" <%=getModifiedClass(GLedger.getF02GLMDFP())%>>
         <input type="text" name="D02GLMDFP" size="62" value="<%= GLedger.getD02GLMDFP() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <TH align="left" colspan=2>Otras Entradas</TH>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Amortización de Prima :</td>
      <td>
         <input type="text" name="E02GLMXSD" size="17" value="<%= GLedger.getE02GLMXSD() %>" <%=getModifiedClass(GLedger.getF02GLMXSD())%>>
         <input type="text" name="D02GLMXSD" size="62" value="<%= GLedger.getD02GLMXSD() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Amortización de Descuento :</td>
      <td>
         <input type="text" name="E02GLMXSO" size="17" value="<%= GLedger.getE02GLMXSO() %>" <%=getModifiedClass(GLedger.getF02GLMXSO())%>>
         <input type="text" name="D02GLMXSO" size="62" value="<%= GLedger.getD02GLMXSO() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Ajuste de Precio de Mercado :</td>
      <td>
         <input type="text" name="E02GLMXSM" size="17" value="<%= GLedger.getE02GLMXSM() %>" <%=getModifiedClass(GLedger.getF02GLMXSM())%>>
         <input type="text" name="D02GLMXSM" size="62" value="<%= GLedger.getD02GLMXSM() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Contrapartida Ajuste por Ganancias :</td>
      <td>
         <input type="text" name="E02GLMXSR" size="17" value="<%= GLedger.getE02GLMXSR() %>" <%=getModifiedClass(GLedger.getF02GLMXSR())%>>
         <input type="text" name="D02GLMXSR" size="62" value="<%= GLedger.getD02GLMXSR() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Contrapartida Ajuste por Perdidas :</td>
      <td>
         <input type="text" name="E02GLMXCC" size="17" value="<%= GLedger.getE02GLMXCC() %>" <%=getModifiedClass(GLedger.getF02GLMXCC())%>>
         <input type="text" name="D02GLMXCC" size="62" value="<%= GLedger.getD02GLMXCC() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Ganancias por Ventas :</td>
      <td>
         <input type="text" name="E02GLMXSS" size="17" value="<%= GLedger.getE02GLMXSS() %>" <%=getModifiedClass(GLedger.getF02GLMXSS())%>>
         <input type="text" name="D02GLMXSS" size="62" value="<%= GLedger.getD02GLMXSS() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Perdidas por Ventas :</td>
      <td>
         <input type="text" name="E02GLMXLC" size="17" value="<%= GLedger.getE02GLMXLC() %>" <%=getModifiedClass(GLedger.getF02GLMXLC())%>>
         <input type="text" name="D02GLMXLC" size="62" value="<%= GLedger.getD02GLMXLC() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cuenta de Inversiones Vencidas :</td>
      <td>
         <input type="text" name="E02GLMX16" size="17" value="<%= GLedger.getE02GLMX16() %>" <%=getModifiedClass(GLedger.getF02GLMX16())%>>
         <input type="text" name="D02GLMX16" size="62" value="<%= GLedger.getD02GLMX16() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cuenta de Ganancias Realizadas :</td>
      <td>
         <input type="text" name="E02GLMXO2" size="17" value="<%= GLedger.getE02GLMXO2() %>" <%=getModifiedClass(GLedger.getF02GLMXO2())%>>
         <input type="text" name="D02GLMXO2" size="62" value="<%= GLedger.getD02GLMXO2() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cuenta de Perdidas Realizadas :</td>
      <td>
         <input type="text" name="E02GLMXLR" size="17" value="<%= GLedger.getE02GLMXLR() %>" <%=getModifiedClass(GLedger.getF02GLMXLR())%>>
         <input type="text" name="D02GLMXLR" size="62" value="<%= GLedger.getD02GLMXLR() %>" readonly>
      </td>
   </tr>
</table>
<% } %>
<% if (GLedger.getE02GLMACD().equals("19")) { %>
<H4>Modulo de Proyectos de Constructor</H4>
<table class="tableinfo">
   <tr id="<%=getRowClass()%>">
      <TH align="left" colspan=2>Solicitud</TH>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Crédito por Solicitud Recibida :</td>
      <td>
         <input type="text" name="E02GLMXCR" size="17" value="<%= GLedger.getE02GLMXCR() %>" <%=getModifiedClass(GLedger.getF02GLMXCR())%>>
         <input type="text" name="D02GLMXCR" size="62" value="<%= GLedger.getD02GLMXCR() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <TH align="left" colspan=2>Aprobación Solicitud</TH>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Débito Solicitud Aprobada :</td>
      <td>
         <input type="text" name="E02GLMXSM" size="17" value="<%= GLedger.getE02GLMXSM() %>" <%=getModifiedClass(GLedger.getF02GLMXSM())%>>
         <input type="text" name="D02GLMXSM" size="62" value="<%= GLedger.getD02GLMXSM() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Crédito Solicitud Aprobada :</td>
      <td>
         <input type="text" name="E02GLMXSR" size="17" value="<%= GLedger.getE02GLMXSR() %>" <%=getModifiedClass(GLedger.getF02GLMXSR())%>>
         <input type="text" name="D02GLMXSR" size="62" value="<%= GLedger.getD02GLMXSR() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <TH align="left" colspan=2>Protocolización</TH>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Débito Protocolizado por Utilizar :</td>
      <td>
         <input type="text" name="E02GLMXSS" size="17" value="<%= GLedger.getE02GLMXSS() %>" <%=getModifiedClass(GLedger.getF02GLMXSS())%>>
         <input type="text" name="D02GLMXSS" size="62" value="<%= GLedger.getD02GLMXSS() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Crédito Protocolizado por Utilizar
         :
      </td>
      <td>
         <input type="text" name="E02GLMXSD" size="17" value="<%= GLedger.getE02GLMXSD() %>" <%=getModifiedClass(GLedger.getF02GLMXSD())%>>
         <input type="text" name="D02GLMXSD" size="62" value="<%= GLedger.getD02GLMXSD() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <TH align="left" colspan=2>Referencias Adicionales</TH>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Contribución :</td>
      <td>
         <input type="text" name="E02GLMXST" size="17" value="<%= GLedger.getE02GLMXST() %>" <%=getModifiedClass(GLedger.getF02GLMXST())%>>
         <input type="text" name="D02GLMXST" size="62" value="<%= GLedger.getD02GLMXST() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Anticipos :</td>
      <td>
         <input type="text" name="E02GLMXSO" size="17" value="<%= GLedger.getE02GLMXSO() %>" <%=getModifiedClass(GLedger.getF02GLMXSO())%>>
         <input type="text" name="D02GLMXSO" size="62" value="<%= GLedger.getD02GLMXSO() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Prima Fondo de Garantia :</td>
      <td>
         <input type="text" name="E02GLMXDR" size="17" value="<%= GLedger.getE02GLMXDR() %>" <%=getModifiedClass(GLedger.getF02GLMXDR())%>>
         <input type="text" name="D02GLMXDR" size="62" value="<%= GLedger.getD02GLMXDR() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Retención Fiel Cumplimiento :</td>
      <td>
         <input type="text" name="E02GLMXCC" size="17" value="<%= GLedger.getE02GLMXCC() %>" <%=getModifiedClass(GLedger.getF02GLMXCC())%>>
         <input type="text" name="D02GLMXCC" size="62" value="<%= GLedger.getD02GLMXCC() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Pago de Valuaciones :</td>
      <td>
         <input type="text" name="E02GLMX16" size="17" value="<%= GLedger.getE02GLMX16() %>" <%=getModifiedClass(GLedger.getF02GLMX16())%>>
         <input type="text" name="D02GLMX16" size="62" value="<%= GLedger.getD02GLMX16() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Comisiones y Otros :</td>
      <td>
         <input type="text" name="E02GLMXOD" size="17" value="<%= GLedger.getE02GLMXOD() %>" <%=getModifiedClass(GLedger.getF02GLMXOD())%>>
         <input type="text" name="D02GLMXOD" size="62" value="<%= GLedger.getD02GLMXOD() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Honorarios Inspector :</td>
      <td>
         <input type="text" name="E02GLMXO2" size="17" value="<%= GLedger.getE02GLMXO2() %>" <%=getModifiedClass(GLedger.getF02GLMXO2())%>>
         <input type="text" name="D02GLMXO2" size="62" value="<%= GLedger.getD02GLMXO2() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Retención Fiel Cumplimiento Inspector :</td>
      <td>
         <input type="text" name="E02GLMXIE" size="17" value="<%= GLedger.getE02GLMXIE() %>" <%=getModifiedClass(GLedger.getF02GLMXIE())%>>
         <input type="text" name="D02GLMXIE" size="62" value="<%= GLedger.getD02GLMXIE() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Contrapartida Adicional :</td>
      <td>
         <input type="text" name="E02GLMX17" size="17" value="<%= GLedger.getE02GLMX17() %>" <%=getModifiedClass(GLedger.getF02GLMX17())%>>
         <input type="text" name="D02GLMX17" size="62" value="<%= GLedger.getD02GLMX17() %>" readonly>
      </td>
   </tr>
</table>
<% } %>
<% if (GLedger.getE02GLMACD().equals("10") || GLedger.getE02GLMACD().equals("11") || GLedger.getE02GLMACD().equals("12") || GLedger.getE02GLMACD().equals("13") || GLedger.getE02GLMACD().equals("14") || GLedger.getE02GLMACD().equals("15")) { %>
<H4>Referencias sobre Contratos</H4>
<table class="tableinfo">
   <% if (GLedger.getE02GLMACD().equals("10")) {%>
   <tr id="<%=getRowClass()%>">
      <TH align="left" colspan=2>Renovación Reestructuración</TH>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cuenta Débito Contingencia :</td>
      <td>
         <input type="text" name="E02GLMXO2" size="17" value="<%= GLedger.getE02GLMXO2() %>" <%=getModifiedClass(GLedger.getF02GLMXO2())%>>
         <input type="text" name="D02GLMXO2" size="62" value="<%= GLedger.getD02GLMXO2() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cuenta Crédito Contingencia :</td>
      <td>
         <input type="text" name="E02GLMX16" size="17" value="<%= GLedger.getE02GLMX16() %>" <%=getModifiedClass(GLedger.getF02GLMX16())%>>
         <input type="text" name="D02GLMX16" size="62" value="<%= GLedger.getD02GLMX16() %>" readonly>
      </td>
   </tr>
   <% }%>
   <tr id="<%=getRowClass()%>">
      <TH align="left" colspan=2>Contratos a Futuro</TH>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Débito Contingencia :</td>
      <td>
         <input type="text" name="E02GLMXST" size="17" value="<%= GLedger.getE02GLMXST() %>" <%=getModifiedClass(GLedger.getF02GLMXST())%>>
         <input type="text" name="D02GLMXST" size="62" value="<%= GLedger.getD02GLMXST() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Crédito Contingencia :</td>
      <td>
         <input type="text" name="E02GLMXOD" size="17" value="<%= GLedger.getE02GLMXOD() %>" <%=getModifiedClass(GLedger.getF02GLMXOD())%>>
         <input type="text" name="D02GLMXOD" size="62" value="<%= GLedger.getD02GLMXOD() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <TH align="left" colspan=2>Proyeccion Intereses</TH>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Intereses Débito :</td>
      <td>
         <input type="text" name="E02GLMX23" size="17" value="<%= GLedger.getE02GLMX23() %>" <%=getModifiedClass(GLedger.getF02GLMX23())%>>
         <input type="text" name="D02GLMX23" size="62" value="<%= GLedger.getD02GLMX23() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Intereses Créditos :</td>
      <td>
         <input type="text" name="E02GLMX24" size="17" value="<%= GLedger.getE02GLMX24() %>" <%=getModifiedClass(GLedger.getF02GLMX24())%>>
         <input type="text" name="D02GLMX24" size="62" value="<%= GLedger.getD02GLMX24() %>" readonly>
      </td>
   </tr>
   <% if (!GLedger.getE02GLMACD().equals("10")) { %>
   <tr id="<%=getRowClass()%>">
      <TH align="left" colspan=2>Registro de Custodia :</TH>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Débito Custodia Magnetica :</td>
      <td>
         <input type="text" name="E02GLMX26" size="17" value="<%= GLedger.getE02GLMX26() %>" <%=getModifiedClass(GLedger.getF02GLMX26())%>>
         <input type="text" name="D02GLMX26" size="62" value="<%= GLedger.getD02GLMX26() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Crédito Custodia Magnetica :</td>
      <td>
         <input type="text" name="E02GLMX27" size="17" value="<%= GLedger.getE02GLMX27() %>" <%=getModifiedClass(GLedger.getF02GLMX27())%>>
         <input type="text" name="D02GLMX27" size="62" value="<%= GLedger.getD02GLMX27() %>" readonly>
      </td>
   </tr>
   <% } %>
   <%if(currUser.getE01INT().equals("03")){%>
   <tr id="<%=getRowClass()%>">
      <TH align="left" colspan=2>Politica Habitacional (Cuentas de
         Orden)
      </TH>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Contrapartida Principal :</td>
      <td>
         <input type="text" name="E02GLXG01" size="17" value="<%= GLedger.getE02GLXG01() %>" <%=getModifiedClass(GLedger.getF02GLXG01())%>>
         <input type="text" name="D02GLXG01" size="62" value="<%= GLedger.getD02GLXG01() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cuenta Contable Fideicomiso:</td>
      <td>
         <input type="text" name="E02GLXG02" size="17" value="<%= GLedger.getE02GLXG02() %>" <%=getModifiedClass(GLedger.getF02GLXG02())%>>
         <input type="text" name="D02GLXG02" size="62" value="<%= GLedger.getD02GLXG02() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Disponibilidad :</td>
      <td>
         <input type="text" name="E02GLXG03" size="17" value="<%= GLedger.getE02GLXG03() %>" <%=getModifiedClass(GLedger.getF02GLXG03())%>>
         <input type="text" name="D02GLXG03" size="62" value="<%= GLedger.getD02GLXG03() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Aporte FAOV por Pagar :</td>
      <td>
         <input type="text" name="E02GLXG04" size="17" value="<%= GLedger.getE02GLXG04() %>" <%=getModifiedClass(GLedger.getF02GLXG04())%>>
         <input type="text" name="D02GLXG04" size="62" value="<%= GLedger.getD02GLXG04() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Contrapartida por Seguros :</td>
      <td>
         <input type="text" name="E02GLXG05" size="17" value="<%= GLedger.getE02GLXG05() %>" <%=getModifiedClass(GLedger.getF02GLXG05())%>>
         <input type="text" name="D02GLXG05" size="62" value="<%= GLedger.getD02GLXG05() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>:</td>
      <td>
         <input type="text" name="E02GLXG06" size="17" value="<%= GLedger.getE02GLXG06() %>" <%=getModifiedClass(GLedger.getF02GLXG06())%>>
         <input type="text" name="D02GLXG06" size="62" value="<%= GLedger.getD02GLXG06() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Intermediación Financiera :</td>
      <td>
         <input type="text" name="E02GLXG07" size="17" value="<%= GLedger.getE02GLXG07() %>" <%=getModifiedClass(GLedger.getF02GLXG07())%>>
         <input type="text" name="D02GLXG07" size="62" value="<%= GLedger.getD02GLXG07() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Ingresos por Intermediación :</td>
      <td>
         <input type="text" name="E02GLXG08" size="17" value="<%= GLedger.getE02GLXG08() %>" <%=getModifiedClass(GLedger.getF02GLXG08())%>>
         <input type="text" name="D02GLXG08" size="62" value="<%= GLedger.getD02GLXG08() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Obligaciones con BANAVIH :</td>
      <td>
         <input type="text" name="E02GLXG09" size="17" value="<%= GLedger.getE02GLXG09() %>" <%=getModifiedClass(GLedger.getF02GLXG09())%>>
         <input type="text" name="D02GLXG09" size="62" value="<%= GLedger.getD02GLXG09() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Gastos BANAVIH :</td>
      <td>
         <input type="text" name="E02GLXG10" size="17" value="<%= GLedger.getE02GLXG10() %>" <%=getModifiedClass(GLedger.getF02GLXG10())%>>
         <input type="text" name="D02GLXG10" size="62" value="<%= GLedger.getD02GLXG10() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Rendimientos no Cobrados :</td>
      <td>
         <input type="text" name="E02GLXG11" size="17" value="<%= GLedger.getE02GLXG11() %>" <%=getModifiedClass(GLedger.getF02GLXG11())%>>
         <input type="text" name="D02GLXG11" size="62" value="<%= GLedger.getD02GLXG11() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Costos Operativos BANAVIH :</td>
      <td>
         <input type="text" size="17" value="<%= GLedger.getE02GLXG12() %>" <%=getModifiedClass(GLedger.getF02GLXG12())%>>
         <input type="text" name="D02GLXG12" size="62" value="<%= GLedger.getD02GLXG12() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Fideicomiso de Inversion :</td>
      <td>
         <input type="text" name="E02GLXG13" size="17" value="<%= GLedger.getE02GLXG13() %>" <%=getModifiedClass(GLedger.getF02GLXG13())%>>
         <input type="text" name="D02GLXG13" size="62" value="<%= GLedger.getD02GLXG13() %>" readonly>
      </td>
   </tr>
   <% } %>
</table>
<% } %>
<% if (GLedger.getE02GLMPRV().equals("Y") && !GLedger.getE02GLMACD().equals("10")) { %>
<H4>Cuentas para Previsiones</H4>
<table class="tableinfo">
   <tr id="<%=getRowClass()%>">
      <TH align="left" colspan=2>Año Actual</TH>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Débito Principal :</td>
      <td>
         <input type="text" name="E02GLXG41" size="17" value="<%= GLedger.getE02GLXG41() %>" <%=getModifiedClass(GLedger.getF02GLXG41())%>>
         <input type="text" name="D02GLXG41" size="62" value="<%= GLedger.getD02GLXG41() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Crédito Principal :</td>
      <td>
         <input type="text" name="E02GLMX31" size="17" value="<%= GLedger.getE02GLMX31() %>" <%=getModifiedClass(GLedger.getF02GLXG31())%>>
         <input type="text" name="D02GLMX31" size="62" value="<%= GLedger.getD02GLMX31() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Débito Intereses :</td>
      <td>
         <input type="text" name="E02GLXG42" size="17" value="<%= GLedger.getE02GLXG42() %>" <%=getModifiedClass(GLedger.getF02GLXG42())%>>
         <input type="text" name="D02GLXG42" size="62" value="<%= GLedger.getD02GLXG42() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Crédito Intereses :</td>
      <td>
         <input type="text" name="E02GLMX20" size="17" value="<%= GLedger.getE02GLMX20() %>" <%=getModifiedClass(GLedger.getF02GLXG20())%>>
         <input type="text" name="D02GLMX20" size="62" value="<%= GLedger.getD02GLMX20() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <TH align="left" colspan=2>Año Pasado</TH>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Débito Principal :</td>
      <td>
         <input type="text" name="E02GLMX28" size="17" value="<%= GLedger.getE02GLMX28() %>" <%=getModifiedClass(GLedger.getF02GLXG28())%>>
         <input type="text" name="D02GLMX28" size="62" value="<%= GLedger.getD02GLMX28() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Crédito Principal :</td>
      <td>
         <input type="text" name="E02GLMX29" size="17" value="<%= GLedger.getE02GLMX29() %>" <%=getModifiedClass(GLedger.getF02GLXG29())%>>
         <input type="text" name="D02GLMX29" size="62" value="<%= GLedger.getD02GLMX29() %>" readonly>
      </td>
   </tr>
</table>
<% } %>
<% if (GLedger.getE02GLMRVF().equals("Y")) { %>
<H4>Cuentas de Revaluación Moneda Extranjera</H4>
<table class="tableinfo">
   <tr id="<%=getRowClass()%>">
      <td>Cuenta de Ingreso :</td>
      <td>
         <input type="text" name="E02GLMRIN" size="17" value="<%= GLedger.getE02GLMRIN() %>" <%=getModifiedClass(GLedger.getF02GLMRIN())%>>
         <input type="text" name="D02GLMRIN" size="62" value="<%= GLedger.getD02GLMRIN() %>" readonly>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Cuenta de Egreso :</td>
      <td>
         <input type="text" name="E02GLMREX" size="17" value="<%= GLedger.getE02GLMREX() %>" <%=getModifiedClass(GLedger.getF02GLMREX())%>>
         <input type="text" name="D02GLMREX" size="62" value="<%= GLedger.getD02GLMREX() %>" readonly>
      </td>
   </tr>
</table>
<% } %>
<% if (GLedger.getE02GLMRVF().equals("4")) { %>
<H4>Cuentas de Diferencial Cambiario</H4>
<table class="tableinfo">
   <tr id="<%=getRowClass()%>">
      <td>Cuenta de Diferencial Cambiario :</td>
      <td>
         <input type="text" name="E02GLMRIN" size="17" value="<%= GLedger.getE02GLMRIN() %>" <%=getModifiedClass(GLedger.getF02GLMRIN())%>>
         <input type="text" name="D02GLMRIN" size="62" value="<%= GLedger.getD02GLMRIN() %>" readonly>
      </td>
   </tr>
</table>
<% } %>
<% if (GLedger.getE02GLMATY().equals("BND") || GLedger.getE02GLMATY().equals("EQT") ||  GLedger.getE02GLMATY().equals("MUT") || GLedger.getE02GLMATY().equals("ACD") || GLedger.getE02GLMATY().equals("PFS")) { %>
<h4>Cuentas de Inversiones</h4>
<table class="tableinfo">
   <tr id="<%=getRowClass()%>">
      <td>
         <div>Cuenta Compensacion :</div>
      </td>
      <td>
         <div>
            <input type="text" name="E02GLMX32" size="17" value="<%= GLedger.getE02GLMX32() %>" <%=getModifiedClass(GLedger.getF02GLMX32())%>>
            <input type="text" name="D02GLMX32" size="62" value="<%= GLedger.getD02GLMX32() %>" readonly>
         </div>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>
         <div>Ganancias/Perdidas Ingresos :</div>
      </td>
      <td>
         <div>
            <input type="text" name="E02GLMXCR" size="17" value="<%= GLedger.getE02GLMXCR() %>" <%=getModifiedClass(GLedger.getF02GLMXCR())%>>
            <input type="text" name="D02GLMXCR" size="62" value="<%= GLedger.getD02GLMXCR() %>" readonly>
         </div>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>
         <div>Ganancias/Perdidas Gastos :</div>
      </td>
      <td>
         <div>
            <input type="text" name="E02GLMXSM" size="17" value="<%= GLedger.getE02GLMXSM() %>" <%=getModifiedClass(GLedger.getF02GLMXSM())%>>
            <input type="text" name="D02GLMXSM" size="62" value="<%= GLedger.getD02GLMXSM() %>" readonly>
         </div>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>
         <div>Débito Interes Devengos :</div>
      </td>
      <td>
         <div>
            <input type="text" name="E02GLMXSS" size="17" value="<%= GLedger.getE02GLMXSS() %>" <%=getModifiedClass(GLedger.getF02GLMXSS())%>>
            <input type="text" name="D02GLMXSS" size="62" value="<%= GLedger.getD02GLMXSS() %>" readonly>
         </div>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>
         <div>Crédito Interes Devengos :</div>
      </td>
      <td>
         <div>
            <input type="text" name="E02GLMXSD" size="17" value="<%= GLedger.getE02GLMXSD() %>" <%=getModifiedClass(GLedger.getF02GLMXSD())%>>
            <input type="text" name="D02GLMXSD" size="62" value="<%= GLedger.getD02GLMXSD() %>" readonly>
         </div>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>
         <div>Débito Ordenes de Venta Pendientes :</div>
      </td>
      <td>
         <div>
            <input type="text" name="E02GLMXST" size="17" value="<%= GLedger.getE02GLMXST() %>" <%=getModifiedClass(GLedger.getF02GLMXST())%>>
            <input type="text" name="D02GLMXST" size="62" value="<%= GLedger.getD02GLMXST() %>" readonly>
         </div>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>
         <div>Crédito Ordenes de Venta Pendientes :</div>
      </td>
      <td>
         <div>
            <input type="text" name="E02GLMXSO" size="17" value="<%= GLedger.getE02GLMXSO() %>" <%=getModifiedClass(GLedger.getF02GLMXSO())%>>
            <input type="text" name="D02GLMXSO" size="62" value="<%= GLedger.getD02GLMXSO() %>" readonly>
         </div>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>
         <div>Débito Ordenes de Compra Pendientes :</div>
      </td>
      <td>
         <div>
            <input type="text" name="E02GLMXLR" size="17" value="<%= GLedger.getE02GLMXLR() %>" <%=getModifiedClass(GLedger.getF02GLMXLR())%>>
            <input type="text" name="D02GLMXLR" size="62" value="<%= GLedger.getD02GLMXLR() %>" readonly>
         </div>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>
         <div>Crédito Ordenes de Compra Pendientes :</div>
      </td>
      <td>
         <div>
            <input type="text" name="E02GLMXO2" size="17" value="<%= GLedger.getE02GLMXO2() %>" <%=getModifiedClass(GLedger.getF02GLMXO2())%>>
            <input type="text" name="D02GLMXO2" size="62" value="<%= GLedger.getD02GLMXO2() %>" readonly>
         </div>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>
         <div>Comision acumulada de custodia Débito :</div>
      </td>
      <td>
         <div>
            <input type="text" name="E02GLMX17" size="17" value="<%= GLedger.getE02GLMX17() %>" <%=getModifiedClass(GLedger.getF02GLMX17())%>>
            <input type="text" name="D02GLMX17" size="62" value="<%= GLedger.getD02GLMX17() %>" readonly>
         </div>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>
         <div>Comision acumulada de custodia Crédito :</div>
      </td>
      <td>
         <div>
            <input type="text" name="E02GLMX18" size="17" value="<%= GLedger.getE02GLMX18() %>" <%=getModifiedClass(GLedger.getF02GLMX18())%>>
            <input type="text" name="D02GLMX18" size="62" value="<%= GLedger.getD02GLMX18() %>" readonly>
         </div>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>
         <div>Cuenta Comision del Comisionista :</div>
      </td>
      <td>
         <div>
            <input type="text" name="E02GLMXSR" size="17" value="<%= GLedger.getE02GLMXSR() %>" <%=getModifiedClass(GLedger.getF02GLMXSR())%>>
            <input type="text" name="D02GLMXSR" size="62" value="<%= GLedger.getD02GLMXSR() %>" readonly>
         </div>
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>
         <div>Cuenta Gastos del Comisionista :</div>
      </td>
      <td>
         <div>
            <input type="text" name="E02GLMXCC" size="17" value="<%= GLedger.getE02GLMXCC() %>" <%=getModifiedClass(GLedger.getF02GLMXCC())%>>
            <input type="text" name="D02GLMXCC" size="62" value="<%= GLedger.getD02GLMXCC() %>" readonly>
         </div>
      </td>
   </tr>
</table>
<H4>Posicion Banco</H4>
<TABLE class="tableinfo">
   <TBODY>
      <tr id="<%=getRowClass()%>">
         <TD>
            <div>Cuenta Face value :</DIV>
         </TD>
         <td>
            <div>
               <INPUT type="text" name="E02GLMDFP" size="17" value="<%= GLedger.getE02GLMDFP() %>" <%=getModifiedClass(GLedger.getF02GLMDFP())%>>
               <INPUT type="text" name="D02GLMDFP" size="62" value="<%= GLedger.getD02GLMDFP() %>" readonly>
            </DIV>
         </TD>
      </TR>
      <TR id="trclear">
         <TD>
            <div>Cuenta Prima/Descuento :</DIV>
         </TD>
         <td>
            <div>
               <INPUT type="text" name="E02GLMX16" size="17" value="<%= GLedger.getE02GLMX16() %>" <%=getModifiedClass(GLedger.getF02GLMX16())%>>
               <INPUT type="text" name="D02GLMX16" size="62" value="<%= GLedger.getD02GLMX16() %>" readonly>
            </DIV>
         </TD>
      </TR>
      <tr id="<%=getRowClass()%>">
         <TD>
            <div>Devengo de Intereses tiempo de compra :</DIV>
         </TD>
         <td>
            <div>
               <INPUT type="text" name="E02GLMXIE" size="17" value="<%= GLedger.getE02GLMXIE() %>" <%=getModifiedClass(GLedger.getF02GLMXIE())%>>
               <INPUT type="text" name="D02GLMXIE" size="62" value="<%= GLedger.getD02GLMXIE() %>" readonly>
            </DIV>
         </TD>
      </TR>
      <TR id="trclear">
         <TD>
            <div>Cuenta Débito en poder del Banco :</DIV>
         </TD>
         <td>
            <div>
               <INPUT type="text" name="E02GLMX19" size="17" value="<%= GLedger.getE02GLMX19() %>" <%=getModifiedClass(GLedger.getF02GLMX19())%>>
               <INPUT type="text" name="D02GLMX19" size="62" value="<%= GLedger.getD02GLMX19() %>" readonly>
            </DIV>
         </TD>
      </TR>
      <tr id="<%=getRowClass()%>">
         <TD>
            <div>Cuenta Crédito en poder del Banco:</DIV>
         </TD>
         <td>
            <div>
               <INPUT type="text" name="E02GLMX20" size="17" value="<%= GLedger.getE02GLMX20() %>" <%=getModifiedClass(GLedger.getF02GLMX20())%>>
               <INPUT type="text" name="D02GLMX20" size="62" value="<%= GLedger.getD02GLMX20() %>" readonly>
            </DIV>
         </TD>
      </TR>
   </TBODY>
</TABLE>
<% } %>
<% if (!GLedger.getE02GLMREV().equals("N") && !GLedger.getE02GLMACD().equals("10")) { %>
<H4>Cuentas de Reajuste/Corrección Monetaria</H4>
<table class="tableinfo">
   <tr id="<%=getRowClass()%>">
      <td>Débito por Reajuste :</td>
      <td>
         <input type="text" name="E02GLMRIN" size="17" value="<%= GLedger.getE02GLMRIN() %>" <%=getModifiedClass(GLedger.getF02GLMRIN())%>>
         <eibsinput:text property="D02GLMRIN" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
   <tr id="<%=getRowClass()%>">
      <td>Crédito por Reajuste :</td>
      <td>
         <input type="text" name="E02GLMREX" size="17" value="<%= GLedger.getE02GLMREX() %>" <%=getModifiedClass(GLedger.getF02GLMREX())%>>
         <eibsinput:text property="D02GLMREX" name="crossRef" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
      </td>
   </tr>
</table>
<% } %>