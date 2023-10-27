<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields" %>
<%@ page import="com.datapro.eibs.constants.HelpTypes" %>
<%@ page import="com.datapro.constants.Entities" %> 

<html>
<head>
<title>Mantencion de Convenios</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id="deal" class="datapro.eibs.beans.ESD079001Message" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
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

 function showAccountpago() {
	var optp= document.forms[0].E01COTPFP.value;   
	if ( optp == 1 ){
		getElement("accountpago").style.display="";
		getElement("accountpagoTitle").style.display="";
		getElement("accountpagootherbank").style.display="none";
		getElement("accountpagootherbankTitle").style.display="none";
	}else if ( optp == 2 ){
		getElement("accountpagootherbank").style.display="";
		getElement("accountpagootherbankTitle").style.display="";
		getElement("accountpago").style.display="none";
		getElement("accountpagoTitle").style.display="none";
	} else {
		getElement("accountpago").style.display="none";
		getElement("accountpagoTitle").style.display="none";
		getElement("accountpagootherbank").style.display="none";
		getElement("accountpagootherbankTitle").style.display="none";

	}
 }

</SCRIPT>

<% 
 boolean inquiryMode = "TRUE".equals(request.getAttribute("INQUIRY"));
 String title = inquiryMode ? "Consulta" : "Mantenimiento";

 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%> 
<H3 align="center"><%=title %> de Convenios<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="deal_basic.jsp, ESD0790"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0790" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="2">
  <input type=HIDDEN name="E01PLNMA1"  value="<%= deal.getE01PLNMA1().trim()%>">
  <input type=HIDDEN name="E01PLNMA2"  value="<%= deal.getE01PLNMA2().trim()%>">
  <input type=HIDDEN name="E01PLNMA3"  value="<%= deal.getE01PLNMA3().trim()%>">
  <input type=HIDDEN name="E01PLNMA4"  value="<%= deal.getE01PLNMA4().trim()%>">
  <input type=HIDDEN name="E01COTECU"  value="<%= deal.getE01COTECU().trim()%>">
  <input type=HIDDEN name="E01COTCDE" id="E01COTCDE" value="<%= deal.getE01COTCDE().trim()%>">
  
  
  


<H4>Datos Cliente Convenio</H4>

<%int row = 0; %>
  <table  class="tableinfo" width="100%">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
      
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
            <td width="25%" > 
              <div align="right">Convenio :</div>
            </td>
            <td width="25%" > 
                <eibsinput:text property="E01COTCDE" name="deal" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="true"/>
                 <eibsinput:text name="deal" property="E01COTDES" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" />
            </td>
            <td width="25%" > 
              <div align="right"></div>
            </td>
            <td width="25%" > 
 	        </td>
          </tr>

          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
            <td width="25%" > 
              <div align="right">Cliente Convenio :</div>
            </td>
            <td width="25%" nowrap > 
				<eibsinput:help name="deal" property="E01COTCCU" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" fn_param_one="E01COTCCU" fn_param_two="E01CONNME" fn_param_three="E01CONIDN"/> 
	  			<eibsinput:text name="deal" property="E01CONNME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" readonly="true"/>
           </td>          
            <td width="25%"> 
              <div align="right">Identificación :</div>
            </td>
            <td width="25%"> 
	  			<eibsinput:text name="deal" property="E01CONIDN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" readonly="true"/>
            </td>
          </tr>

          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
            <td width="25%"> 
              <div align="right">Dirección Planillas :</div>
            </td>
            <td width="25%" align="left"> 
	  			<%=deal.getE01PLNMA1().trim()%><br> <%=deal.getE01PLNMA2().trim() %><br><%=deal.getE01PLNMA3().trim()%><br><%=deal.getE01PLNMA4().trim() %>
          </td>
            <td width="25%"> 
              <div align="right">Solicitud :</div>
            </td>
            <td width="25%"> 
	  			<eibsinput:help name="deal" property="E01COTNUM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" help="<%= HelpTypes.CONVENANT_REQUEST %>" fn_param_one="E01COTNUM" fn_param_two="document.forms[0].E01COTCCU.value"/>
            </td>
          </tr>
      
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
            <td width="25%" > 
              <div align="right">Tipo Convenio :</div>
            </td>
            <td width="25%" nowrap> 
				 <% if ( !deal.getE01COTNUM().equals("0")){ %>      
                 <eibsinput:text name="deal" property="E01COTCTY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="true" />
                 <eibsinput:text name="deal" property="D01COTCTY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true"/>
				 <%} else { %>
                 <eibsinput:cnofc name="deal" property="E01COTCTY" required="false" flag="C1" fn_code="E01COTCTY" fn_description="D01COTCTY" readonly="False"/>
                 <eibsinput:text property="D01COTCTY" name="deal" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true"/>
				 <% } %>	        
	        </td>
            <td width="25%"> 
              <div align="right">Estado :</div>
            </td>
            <td width="25%"> 
               <select name="E01COTSTA" >
                    <option value=" " <% if (deal.getE01COTSTA().equals(" ")) out.print("selected"); %>>Activo</option>
                    <option value="I" <% if (deal.getE01COTSTA().equals("I")) out.print("selected"); %>>Inactivo</option>
                    <!--  
                    <option value="A" <% if (deal.getE01COTSTA().equals("A")) out.print("selected"); %>>Anulado</option>                   
                    -->
                    <option value="B" <% if (deal.getE01COTSTA().equals("B")) out.print("selected"); %>>Bloqueado</option>                   
                    <option value="C" <% if (deal.getE01COTSTA().equals("C")) out.print("selected"); %>>Cerrado</option>                   
                  </select>
            </td>
          </tr>

          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
            <td width="25%"> 
              <div align="right">Oficial :</div>
            </td>
            <td width="25%" nowrap> 
			 <% if ( !deal.getE01COTNUM().equals("0")){ %>      
                 <eibsinput:text name="deal" property="E01COTOFC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="true" />
                 <eibsinput:text property="D01COTOFC" name="deal" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true"/>
			 <%} else { %>
                 <eibsinput:cnofc name="deal" property="E01COTOFC" required="false" flag="15" fn_code="E01COTOFC" fn_description="D01COTOFC" readonly="False"/>
                 <eibsinput:text property="D01COTOFC" name="deal" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true"/>
			 <% } %>	                 
            </td>
            <td width="25%" > 
              <div align="right">Banco/Sucursal :</div>
            </td>
            <td width="25%" > 
			 <% if ( !deal.getE01COTNUM().equals("0")){ %>      
  				<eibsinput:text name="deal" property="E01COTBNK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" readonly="true"  />
 	 			<eibsinput:text name="deal" property="E01COTBRN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>" readonly="true" />
			 <%} else { %>
  				<eibsinput:text name="deal" property="E01COTBNK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" readonly="false"  />
             	<eibsinput:help name="deal" property="E01COTBRN" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BRANCH %>" fn_param_one="E01COTBRN" fn_param_two="document.forms[0].E01COTBNK.value" />
			 <% } %>	                 
          </td>
         </tr>

        </table>
      </td>
    </tr>
  </table>  
  
  <H4>Datos del Convenio</H4>
  <table  class="tableinfo" width="100%">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
            <td width="25%"><div align="right">Fecha Inicio :</div></td>
            <td width="25%"> 
              <eibsinput:date name="deal" fn_year="E01COTFIY" fn_month="E01COTFIM" fn_day="E01COTFID" />
            </td>
            <td width="25%" ><div align="right">Vencimiento :</div></td>
            <td width="25%" > 
              <eibsinput:date name="deal" fn_year="E01COTFVY" fn_month="E01COTFVM" fn_day="E01COTFVD" />
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
            <td width="25%"><div align="right">Dia Vence Cuotas :</div></td>
            <td width="25%"> 
              <eibsinput:text name="deal" property="E01COTDVC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="3" maxlength="2"/>
            </td>
            <td width="25%" ><div align="right">Condona Mora :</div></td>
            <td width="25%" > 
              <input type="radio" name="E01COTDMR" value="Y" <%if (deal.getE01COTDMR().equals("Y")) out.print("checked"); %>>Sí
              <input type="radio" name="E01COTDMR" value="N" <%if (deal.getE01COTDMR().equals("N")) out.print("checked"); %>>No
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
            <td width="25%"><div align="right">Dia Inicio Bloqueo Desembolso :</div></td>
            <td width="25%"> 
              <eibsinput:text name="deal" property="E01COTBDI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="3" maxlength="2"/>
            </td>
            <td width="25%" ><div align="right">Dia Final Bloqueo Desembolso :</div></td>
            <td width="25%" > 
              <eibsinput:text name="deal" property="E01COTBDF" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="3" maxlength="2"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
            <td width="25%"><div align="right">Codigo Alias :</div></td>
            <td width="25%"> 
              <input type="text"  name="E01COTACO" size="7" maxlength="6" value="<%= deal.getE01COTACO()%>">
            </td>
            <td width="25%" ></td>
            <td width="25%" ></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>  
	
	<br>
	<!-- Pagadurias ONLY SHOWN FOR NON-NEW CONVENIO-->
	<%if(!deal.getH01FLGWK1().equals("N")){ %>
		<% session.setAttribute("EMPSG",inquiryMode ? "A" : "S"); %>
		<iframe id="ifrempsg" frameborder="0" scrolling="no" height="200" width="100%" src="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0792?SCREEN=100&E01COPCDE=<%=deal.getE01COTCDE().trim()%>"> -</iframe>
	<% } %>
  <br>   
   
  <H4>Informacion para Prestamos</H4>
  <table  class="tableinfo" >
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
            <td width="25%"><div align="right">L&iacute;nea de Cr&eacute;dito :</div></td>
            <td width="25%"> 
               <input type="text" name="E01COTCMC" size="9" maxlength="9" value="<%= deal.getE01COTCMC().trim()%>" >
               <input type="text" name="E01COTCMN" size="4" maxlength="4" value="<%= deal.getE01COTCMN().trim()%>" >
               <a href="javascript:GetCreditLine('E01COTCMN',document.forms[0].E01COTCMC.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom"></a> 
            </td>
            <td width="25%" ><div align="right">Min./Max.Referencia :</div></td>
            <td width="25%" > 
              <select name="E01COTFL3" >
                <option value=" " <%if (deal.getE01COTFL3().equals(" ")) { out.print("selected"); }%>>Moneda del Producto</option>
                <option value="6" <%if (deal.getE01COTFL3().equals("6")) { out.print("selected"); }%>>SMMLV </option>
              </select>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
            <td width="25%"><div align="right">Monto M&iacute;nimo Apertura :</div></td>
            <td width="25%"> 
              <input type="text" name="E01COTAM1" size="21" maxlength="15" value="<%= deal.getE01COTAM1().trim()%>" onKeypress="enterDecimal(event, 2)">
            </td>
            <td width="25%" ><div align="right">Monto M&aacute;ximo Apertura :</div></td>
            <td width="25%" > 
              <input type="text" name="E01COTAM2" size="21" maxlength="15" value="<%= deal.getE01COTAM2().trim()%>" onKeypress="enterDecimal(event, 2)">
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
            <td width="25%"><div align="right">Tasa Credito :</div></td>
            <td width="25%"> 
              <eibsinput:text property="E01COTRTE" name="deal" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="false"/>  
            </td>
            <td width="25%" ><div align="right">Factor Aplicacion :</div></td>
            <td width="25%" > 
              <select name="E01COTRTF">
                <option value="S" <% if (deal.getE01COTRTF().equals("S")) out.print("selected"); %>>Resta a la tasa del producto</option>
                <option value="R" <% if (deal.getE01COTRTF().equals("R")) out.print("selected"); %>>Reemplaza la tasa del crédito</option>                                                				
                <option value="%" <% if (deal.getE01COTRTF().equals("%")) out.print("selected"); %>>Porcentaje de la tasa del producto</option>                                                				
              </select>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
            <td width="25%"><div align="right">Tabla Tasa Flotante :</div></td>
            <td width="25%"> 
              <input type="text" name="E01COTFRT" size="2" maxlength="2" value="<%= deal.getE01COTFRT().trim()%>"  >
              <a href="javascript:GetFloating('E01COTFRT')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="middle" border="0" ></a> 
               <select name="E01COTFTY"> 
                <option value=" " <% if (!(deal.getE01COTFTY().equals("FP") ||deal.getE01COTFTY().equals("FS"))) out.print("selected"); %>></option>
                <option value="FP" <% if (deal.getE01COTFTY().equals("FP")) out.print("selected"); %>>FP</option>
                <option value="FS" <% if (deal.getE01COTFTY().equals("FS")) out.print("selected"); %>>FS</option>
              </select>             	
            </td>
            <td width="25%" ><div align="right">Tabla Tasa Matriz :</div></td>
            <td width="25%" > 
              <input type="text" name="E01COTTBR" size="3" maxlength="2" value="<%= deal.getE01COTTBR().trim() %>">
              <a href="javascript:GetRateTable('E01COTTBR', 'P')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="middle" border="0"></a> 
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
            <td width="25%"><div align="right">Minimo Cuotas :</div></td>
            <td width="25%"> 
              <eibsinput:text name="deal" property="E01COTMIC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="4" maxlength="3"/>
            </td>
            <td width="25%" ><div align="right">Maximo Cuotas :</div></td>
            <td width="25%" > 
              <eibsinput:text name="deal" property="E01COTMXC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="4" maxlength="3"/>
            </td>
          </tr>

          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
            <td width="25%"><div align="right">Dias de Gracia :</div></td>
            <td width="25%"> 
               <input type="text"  name="E01COTGDY" size="6" maxlength="5" value="<%= deal.getE01COTGDY()%>">
            </td>
            <td width="25%" > <div align="right">Enviar informaci&oacute;n a WEB :</div></td>
            <td width="25%" > 
             <input type="radio" name="E01COTFLG" value="Y" <%if (deal.getE01COTFLG().equals("Y")) out.print("checked"); %>>Sí
             <input type="radio" name="E01COTFLG" value="N" <%if (deal.getE01COTFLG().equals("N")) out.print("checked"); %>>No
            </td>    
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="25%"><div align="right">Frecuencia de Pagos :</div></td>
            <td width="25%"> 
 		        <eibsinput:text name="deal" property="E01COTFPG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="3" maxlength="2"/>
	              <select name="E01COTTPG" <% if (deal.getE01COTTPG().equals("Y")) out.print("class=\"txtchanged\""); %>>
	                <option value=" " <% if (!(deal.getE01COTTPG().equals("D") ||deal.getE01COTTPG().equals("M")||deal.getE01COTTPG().equals("Y"))) out.print("selected"); %>></option>
	                <option value="D" <% if(deal.getE01COTTPG().equals("D")) out.print("selected");%>>D&iacute;a(s)</option>
	                <option value="M" <% if(deal.getE01COTTPG().equals("M")) out.print("selected");%>>Mes(es)</option>
	                <option value="Y" <% if(deal.getE01COTTPG().equals("Y")) out.print("selected");%>>A&ntilde;o(s)</option>
	              </select>
            </td>
            <td nowrap width="25%"><div align="right">Tabla de Cargos :</div></td>
            <td nowrap width="25%"> 
              <input type="text" name="E01COTOFT" size="3" maxlength="2" value="<%= deal.getE01COTOFT().trim()%>">
              <a href="javascript:GetLoanChargeTable('E01COTOFT','@CNV')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="middle" border="0" ></a> 
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
            <td width="25%"><div align="right">Freq. Impresion Extracto :</div></td>
            <td width="25%"> 
               <input type="text"  name="E01COTEXT" size="3" maxlength="2" value="<%= deal.getE01COTEXT()%>">
            </td>
            <td width="25%"><div align="right"></div></td>
            <td width="25%" ></td>    
          </tr>
        </table>
      </td>
    </tr>
  </table>  
 
  <H4>Planillas</H4>
  <table class="tableinfo" width="100%">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
            <td width="25%"><div align="right">Administraci&oacute;n Masiva :</div></td>
            <td width="25%" > 
              <input type="radio" name="E01COTFL1" value="Y" <%if (deal.getE01COTFL1().equals("Y"))  out.print("checked"); %>>Sí
              <input type="radio" name="E01COTFL1" value="N" <%if (!deal.getE01COTFL1().equals("Y")) out.print("checked"); %>>No
            </td>    
            <td width="25%"><div align="right">Dia de Emision Planilla :</div></td>
            <td width="25%"> 
              <eibsinput:text property="E01COTDEV" name="deal" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DAYS%>" />
              <select name="E01COTPEV">
                <option value="0" <% if (deal.getE01COTPEV().equals("0")) out.print("selected"); %>>Mismo Mes</option>
                <option value="1" <% if (deal.getE01COTPEV().equals("1")) out.print("selected"); %>>1 Mes Antes</option>
                <option value="2" <% if (deal.getE01COTPEV().equals("2")) out.print("selected"); %>>2 Meses Antes</option>                                                				
                <option value="3" <% if (deal.getE01COTPEV().equals("3")) out.print("selected"); %>>3 Meses Antes</option>                                                				
          	  </select>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
            <td width="25%" ><div align="right">Forma de Pago Planilla :</div></td>
            <td width="25%" nowrap="nowrap"> 
              <select name="E01COTPFP" onchange="javascript:showAccountpago();">
                <option value=" " <% if (deal.getE01COTPFP().equals(" ")) out.print("selected"); %>></option>
                <option value="1" <% if (deal.getE01COTPFP().equals("1")) out.print("selected"); %>>Cuenta Cliente</option>
                <option value="2" <% if (deal.getE01COTPFP().equals("2")) out.print("selected"); %>>Cuenta Contable</option>                   
              </select>
            </td>
            <td width="25%" > 
              <div id="accountpagoTitle" align="right"> Numero Cuenta : </div>
              <div id="accountpagootherbankTitle" align="right">Cuenta Contable :</div>
            </td>	        
            <td  width="25%" nowrap="nowrap"> 
              <div id="accountpago" align="left">
                <eibsinput:help name="deal" property="E01COTPAC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" fn_param_one="E01COTPAC" fn_param_two="document.forms[0].E01COTBNK.value" fn_param_three="RT" fn_param_five="document.forms[0].E01COTCCU.value" required="false" />
              </div>
              <div id="accountpagootherbank" align="left"> 
                <eibsinput:text name="deal" property="E01COTPBK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" />
                <eibsinput:help name="deal" property="E01COTPBR" fn_param_one="E01COTPBR" fn_param_two="document.forms[0].E01COTPBK.value" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>" />
                <eibsinput:help name="deal" property="E01COTPCY" fn_param_one="E01COTPCY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" />
                <eibsinput:help name="deal" property="E01COTPGL" fn_param_one="E01COTPGL" fn_param_two="document.forms[0].E01COTPBK.value" fn_param_three="document.forms[0].E01COTPCY.value" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" />
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>  

  <h4>Deducciones (Seguros)</h4>
	<table  id="mainTable" class="tableinfo" style="height: 90px;">
    	<tr height="5%"> 
    		<TD NOWRAP width="100%" >
  				<TABLE id="headTable" width="100%" >
         			 <TR id="trdark"> 
			            <th nowrap  width="15%"></th>
			            <th nowrap  width="10%">Codigo</th>
			            <th nowrap  width="10%">Plan</th>
			            <th nowrap  width="30%">Descripcion</th>
			            <th nowrap  width="10%">Forma Cobro</th>
			            <th nowrap  width="10%">Obligatorio</th>
			            <th nowrap  width="15%"></th>
          			</TR>
       			</TABLE>
      		</td>
    	</tr>    
		<tr height="95%">    
			<td NOWRAP width="100%">       
  
   			    <div id="dataDiv1" class="scbarcolor" style="height:90px;  overflow:auto;">
    				<table id="dataTable" width="100%" > 
          <%
  				   int limite2 = 9;
 				   String seq2; 				   
  					for ( int i=1; i<=limite2; i++ ) {
   					 seq2 = i + "";
   			%> 
          <tr id="trclear"> 
            <td nowrap width="15%"> </td>
            <td nowrap width="10%"> 
              <div align="center" > 
	            <%= seq2 %>
	          <input type=text name="E01APDDED<%= seq2 %>" value="<%= deal.getField("E01APDDED"+seq2).getString() %>" size="5" maxlength="4"
	           class="context-menu-help" onmousedown="init(brokerHelp,this.name,'','','D01APDDED<%= seq2 %>','I','')">
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center" > 
	           <input type=text name="E01APDFL1<%=seq2%>" value="<%= deal.getField("E01APDFL1"+seq2).getString() %>" size="3" maxlength="2"
	           class="context-menu-help" onmousedown="init(accountPlanHelp, this.name, document.forms[0].elements['E01APDDED<%= seq2 %>'].value,'','','')">
              </div>
            </td>            
            <td nowrap width="30%"> 
              <div align="center"> 
                <input type="text" name="D01APDDED<%= seq2 %>" value="<%= deal.getField("D01APDDED"+seq2).getString()%>" size="45" maxlength="45" readonly>
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
					<select name="E01APDPFM<%= seq2 %>">
						<option value=""></option>
						<option value="O" <%if (deal.getField("E01APDPFM"+seq2).getString().equals("O")) { out.print("selected"); }%>>En la Apertura</option>
						<option value="L" <%if (deal.getField("E01APDPFM"+seq2).getString().equals("L")) { out.print("selected"); }%>>Financiado</option>
					</select>
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
					<select name="E01APDFL2<%= seq2 %>">
						<option value=""></option>
						<option value="Y" <%if (deal.getField("E01APDFL2"+seq2).getString().equals("Y")) { out.print("selected"); }%>>Si</option>
						<option value="N" <%if (deal.getField("E01APDFL2"+seq2).getString().equals("N")) { out.print("selected"); }%>>No</option>
					</select>
              </div>
            </td>
             <td nowrap width="15%"> </td>
          </tr>
         <% } %> 
				</table>
			</div>
		</TD>
	</TR>	
	</TABLE> 
  <% if(!inquiryMode){%>
  <p align="center"> 
      <input id="EIBSBTN" type=submit name="Submit" value="Enviar" >
  </p>
   <% } %>
  </form>
<script type="text/javascript">
  showAccountpago();
  
  <% if(inquiryMode){%>
	$("input[type='text']").attr("readonly", "readonly");  
	$("select" ).add("input[type='radio']").attr("disabled", "disabled");  
	$("img[title='null']").add("img[title='ayuda']").hide(); 
 <% } %>
</script>
  
 </body>
</html>
