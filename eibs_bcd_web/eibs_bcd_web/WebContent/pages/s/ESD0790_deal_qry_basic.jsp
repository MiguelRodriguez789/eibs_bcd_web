<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@page import="com.datapro.constants.Entities"%> 

<html>
<head>
<title>Sistema Bancario: Mantencion de Convenios</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id="deal" class="datapro.eibs.beans.ESD079001Message" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
</head>

<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

  function GetTabla(cod,codtabla)
  {
   page= "${pageContext.request.contextPath}/pages/s/EST0005_helpfile_Table.jsp?codtabla=" + codtabla ;
   fieldName=cod;
   var dx = 400;
   var dy = 350;
   var y0 = (screen.height - dy) / 2;
   var x0 = (screen.width - dx) / 2;
   var attr = 'toolbar=no,location=no,directories=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no,left=' + x0 + ',top=' + y0 + ',height=' + dy + ',width=' + dx;

   listin = window.open(page,'',attr);

}

function GetTablasComex(name,desc,flag)
{
	page= "${pageContext.request.contextPath}/pages/s/EOC0001_helpfiles_TablasComex_Desc.jsp?codeflag=" + flag;
	fieldName=name;
	fieldDesc=desc;		
	CenterWindow(page,400,350,2);
}

function callEntidadRelacionada(){
	var pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECO0010?SCREEN=203&E01COSNUM=" + document.forms[0].E01COTNUM.value;
	document.location.href = pg;
}

function callConsultaEvaluacionConv(){
	var pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECO0010?SCREEN=355&E01COSNUM=" + document.forms[0].E01COTNUM.value+"&E01EMPCUN="+document.forms[0].E01COTECU.value;
	document.location.href = pg;
}


</SCRIPT>


<SCRIPT type="text/javascript">
	builtNewMenu(covenat_qry_opt);
</SCRIPT>

<SCRIPT> initMenu(); </SCRIPT>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%> 
<H3 align="center">Consulta de Convenios<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="deal_qry_basic.jsp, ESD0790"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0790" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="2">
  <input type=HIDDEN name="E01PLNMA1"  value="<%= deal.getE01PLNMA1().trim()%>">
  <input type=HIDDEN name="E01PLNMA2"  value="<%= deal.getE01PLNMA2().trim()%>">
  <input type=HIDDEN name="E01PLNMA3"  value="<%= deal.getE01PLNMA3().trim()%>">
  <input type=HIDDEN name="E01PLNMA4"  value="<%= deal.getE01PLNMA4().trim()%>">

 
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
<% if (deal.getE01COTNUM().equals("0")) { %>
          <tr id="trdark">
             <td nowrap width="10%" align="right" height="29"> Empleador: 
              </td>
             <td nowrap width="10%" align="left" height="29">
	  			<eibsinput:text name="deal" property="E01COTECU" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
             </td>
             <td nowrap width="10%" align="right" height="29">Identificación:  
             </td>
             <td nowrap width="10%" align="left" height="29">
	  			<eibsinput:text name="deal" property="E01EMPIDN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" readonly="true"/>
             </td>
            <td width="10%" height="37"> 
              <div align="right">Convenio :</div>
            </td>
            <td width="10%" height="37"> 
                <eibsinput:text property="E01COTCDE" name="deal" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="true"/>
          </td>
             <td nowrap width="10%" align="right" height="29"> Nombre: 
               </td>
             <td nowrap width="30%"align="left" height="29">
	  			<eibsinput:text name="deal" property="E01EMPNME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/>
             </td>
         </tr>
<% }else{ %>
          <tr id="trdark">
             <td nowrap width="10%" align="right" height="29"> Empleador: 
              </td>
             <td nowrap width="10%" align="left" height="29">
	  			<eibsinput:text name="deal" property="E01COTECU" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
             </td>
             <td nowrap width="10%" align="right" height="29">Identificación:  
             </td>
             <td nowrap width="10%" align="left" height="29">
	  			<eibsinput:text name="deal" property="E01EMPIDN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" readonly="true"/>
             </td>
             <td nowrap width="10%" align="right" height="29"> Nombre: 
               </td>
             <td nowrap width="50%"align="left" height="29">
	  			<eibsinput:text name="deal" property="E01EMPNME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/>
             </td>
         </tr>
<%}%> 
         
         
<% if (!deal.getE01COTNUM().equals("0")) { %>

          <tr id="trdark"> 
            <td width="10%" height="37"> 
              <div align="right">Solicitud :</div>
            </td>
            <td width="10%" height="37"> 
	  			<eibsinput:text name="deal" property="E01COTNUM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>"  readonly="true"/>
            </td>
            <td width="10%" height="37"> 
              <div align="right">Convenio :</div>
            </td>
            <td width="10%" height="37"> 
                <eibsinput:text property="E01COTCDE" name="deal" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="true"/>
          </td>
            <td width="10%" height="37"> 
            </td>
            <td width="50%" height="37"> 
            </td>
          </tr>
<%}%>
        </table>
      </td>
    </tr>
  </table>
  
<H4>Datos Cliente Convenio</H4>
  <table  class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

          <tr id="trdark"> 
            <td width="15%" > 
              <div align="right">Cliente Convenio :</div>
            </td>
            <td width="35%" > 
				<eibsinput:text name="deal" property="E01COTCCU" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>"  readonly="true" />
          </td>
            <td width="15%"> 
              <div align="right">Nombre :</div>
            </td>
            <td width="35%"> 
	  			<eibsinput:text name="deal" property="E01CONNME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/>
            </td>
          </tr>

          <tr id="tclear"> 
            <td width="15%"> 
              <div align="right">Dirección Planillas :</div>
            </td>
            <td width="50%" align="left"> 
	  			<%=deal.getE01PLNMA1() %><br> <%=deal.getE01PLNMA2() %><br><%=deal.getE01PLNMA3() %><br><%=deal.getE01PLNMA4() %>
          </td>
            <td width="15%"> 
              <div align="right">Identificación :</div>
            </td>
            <td width="35%"> 
	  			<eibsinput:text name="deal" property="E01CONIDN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" readonly="true"/>
            </td>
          </tr>
      
          <tr id="trdark"> 
            <td width="15%" > 
              <div align="right">Descripcion Convenio :</div>
            </td>
            <td width="35%" > 
                 <eibsinput:text name="deal" property="E01COTDES" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true"/>
	        </td>
            <td width="15%" > 
            </td>
            <td width="35%" > 
	        </td>
          </tr>
      
          <tr id="trclear"> 
            <td width="15%" > 
              <div align="right">Tipo Convenio :</div>
            </td>
            <td width="35%" > 
                 <eibsinput:text name="deal" property="E01COTCTY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="true" />
                 <eibsinput:text name="deal" property="D01COTCTY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true"/>
	        </td>
            <td width="15%"> 
              <div align="right">Estado :</div>
            </td>
            <td width="35%"> 
               <select name="E01COTSTA"  disabled="disabled">
                    <option value=" " <% if (deal.getE01COTSTA().equals(" ")) out.print("selected"); %>>Vigente</option>
                    <option value="A" <% if (deal.getE01COTSTA().equals("A")) out.print("selected"); %>>Anulado</option>                   
                    <option value="C" <% if (deal.getE01COTSTA().equals("C")) out.print("selected"); %>>Cerrado</option>                   
                  </select>
            </td>
          </tr>

          <tr id="trdark"> 
            <td width="15%"> 
              <div align="right">Oficial :</div>
            </td>
            <td width="35%"> 
                 <eibsinput:text name="deal" property="E01COTOFC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="true" />
                 <eibsinput:text property="D01COTOFC" name="deal" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true"/>
            </td>
            <td width="15%" > 
              <div align="right">Banco/Sucursal :</div>
            </td>
            <td width="35%" > 
  				<eibsinput:text name="deal" property="E01COTBNK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" readonly="true"  />
 	 			<eibsinput:text name="deal" property="E01COTBRN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>" readonly="true" />
          </td>
         </tr>

        </table>
      </td>
    </tr>
  </table>  
  
<H4>Datos del Convenio</H4>
  <table  class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

          <tr id="trdark"> 
            <td width="15%"> 
              <div align="right">Fecha Inicio :</div>
            </td>
            <td width="35%"> 
    	        <eibsinput:date name="deal" fn_year="E01COTFIY" fn_month="E01COTFIM" fn_day="E01COTFID" readonly="true"/>
            </td>
            <td width="15%" > 
              <div align="right">Vencimiento :</div>
            </td>
            <td width="35%" > 
    	        <eibsinput:date name="deal" fn_year="E01COTFVY" fn_month="E01COTFVM" fn_day="E01COTFVD" readonly="true"/>
          </td>
         </tr>
 
          <tr id="trclear"> 
            <td width="15%"> 
              <div align="right">Dia Vence Cuotas :</div>
            </td>
            <td width="35%"> 
 		        <eibsinput:text name="deal" property="E01COTDVC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="3" maxlength="2" readonly="true"/>
            </td>
            <td width="15%" > 
              <div align="right">Dia de Emision Planilla :</div>
            </td>
            <td width="35%" > 
 	           <eibsinput:text property="E01COTDEV" name="deal" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DAYS%>" readonly="true"/>
                <select name="E01COTPEV" disabled="disabled">
                <option value="0" <% if (deal.getE01COTPEV().equals("0")) out.print("selected"); %>>Mismo Mes</option>
                <option value="1" <% if (deal.getE01COTPEV().equals("1")) out.print("selected"); %>>1 Mes Antes</option>
                <option value="2" <% if (deal.getE01COTPEV().equals("2")) out.print("selected"); %>>2 Meses Antes</option>                                                				
                <option value="3" <% if (deal.getE01COTPEV().equals("3")) out.print("selected"); %>>3 Meses Antes</option>                                                				
          	   </select>
	      </td>
         <tr id="trdark">
            <td width="25%" > 
              <div align="right">Dia Inicio Bloqueo Desembolso :</div>
            </td>
            <td width="25%"> 
 		        <eibsinput:text name="deal" property="E01COTBDI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="3" maxlength="2" readonly="True"/>
            </td>
            <td width="25%" > 
              <div align="right">Dia Final Bloqueo Desembolso :</div>
            </td>
            <td width="25%" > 
 		        <eibsinput:text name="deal" property="E01COTBDF" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="3" maxlength="2" readonly="True" />
          </td>
         </tr>
          <tr id="trclear"> 
            <td width="15%"> 
              <div align="right">Codigo Alias :</div>
            </td>
            <td width="35%"> 
               <input type="text"  name="E01COTACO" size="7" maxlength="6" value="<%= deal.getE01COTACO()%>" readonly>
            </td>
            <td width="15%" > 
              <div align="right">Condona Mora :</div>
            </td>
            <td width="35%" > 
             <input  type="radio" name="E01COTDMR" value="Y" <%if (deal.getE01COTDMR().equals("Y")) out.print("checked"); %> readonly disabled="disabled">Sí
             <input  type="radio" name="E01COTDMR" value="N" <%if (deal.getE01COTDMR().equals("N")) out.print("checked"); %> readonly disabled="disabled">No
          </td>
         </tr>
        </table>
      </td>
    </tr>
  </table>          

<H4>Informacion para Prestamos</H4>
  <table  class="tableinfo" >
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td width="25%"> 
              <div align="right">Tasa Credito :</div>
            </td>
            <td width="25%"> 
            	<eibsinput:text readonly="true" property="E01COTRTE" name="deal" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" />  
            </td>
            <td width="25%" > 
              <div align="right">Factor Aplicacion :</div>
            </td>
            <td width="25%" > 
 			   <select name="E01COTRTF" disabled="disabled" >
                	<option value="S" <% if (deal.getE01COTRTF().equals("S")) out.print("selected"); %>>Resta a la tasa del producto</option>
                	<option value="R" <% if (deal.getE01COTRTF().equals("R")) out.print("selected"); %>>Reemplaza la tasa del crédito</option>                                                				
					<option value="%" <% if (deal.getE01COTRTF().equals("%")) out.print("selected"); %>>Porcentaje de la tasa del producto</option>                                                				
          	   </select>
          </td>
         </tr>
          <tr id="trclear"> 
            <td width="25%"> 
              <div align="right">Tabla Tasa Flotante :</div>
            </td>
            <td width="25%"> 
              <input type="text" readonly name="E01COTFRT" size="2" maxlength="2" value="<%= deal.getE01COTFRT().trim()%>"  >
               <select name="E01DEAFTY" disabled="disabled"> 
                <option value=" " <% if (!(deal.getE01COTFTY().equals("FP") ||deal.getE01COTFTY().equals("FS"))) out.print("selected"); %>></option>
                <option value="FP" <% if (deal.getE01COTFTY().equals("FP")) out.print("selected"); %>>FP</option>
                <option value="FS" <% if (deal.getE01COTFTY().equals("FS")) out.print("selected"); %>>FS</option>
              </select>             	
            </td>
            <td width="25%" > 
              <div align="right">Tabla Tasa Matriz :</div>
            </td>
            <td width="25%" > 
              <input readonly type="text" name="E01COTTBR" size="3" maxlength="2" value="<%= deal.getE01COTTBR().trim() %>">
	      </td>
         </tr>
          <tr id="trdark"> 
            <td width="25%"> 
              <div align="right">Minimo Cuotas :</div>
            </td>
            <td width="25%"> 
 		        <eibsinput:text readonly="true" name="deal" property="E01COTMIC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="4" maxlength="3"/>
            </td>
            <td width="25%" > 
              <div align="right">Maximo Cuotas :</div>
            </td>
            <td width="25%" > 
 		        <eibsinput:text readonly="true" name="deal" property="E01COTMXC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="4" maxlength="3"/>
          </td>
         </tr>
          <tr id="clear"> 
            <td width="25%"> 
              <div align="right">Dias de Gracia :</div>
            </td>
            <td width="25%"> 
            	<eibsinput:text name="deal" property="E01COTGDY"  eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DAYS%>" readonly="true"/>
            </td>
          <td width="25%" > 
              <div align="right">Enviar informaci&oacute;n a WEB :</div>
            </td>
            <td width="25%" > 
             <input type="radio" name="E01COTFLG" value="Y" <%if (deal.getE01COTFLG().equals("Y")) out.print("checked"); %> readonly disabled="disabled">Sí
             <input type="radio" name="E01COTFLG" value="N" <%if (deal.getE01COTFLG().equals("N")) out.print("checked"); %> readonly disabled="disabled">No
          </td>  
         </tr>
        </table>
      </td>
    </tr>
  </table>  
  </form>
 </body>
</html>
