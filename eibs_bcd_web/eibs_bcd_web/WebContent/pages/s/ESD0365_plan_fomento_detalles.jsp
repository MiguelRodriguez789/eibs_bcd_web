<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@ page import = "datapro.eibs.master.Util" %>

<html>
<head>
<title>Mantenimiento de Plan de Fomento </title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="RecData" class="datapro.eibs.beans.ESD036501Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>



<script type="text/javascript">

 function goAction(op) {
	
	getElement("SCREEN").value = op;
	document.forms[0].submit();
 }
 
 $().ready(function(){
	$('td').attr("nowrap","nowrap"); 
 });
 
 </script>
</head>

<%
	boolean maintenance=false;
	boolean readOnly = false;
%> 
          
<body>
<%
	if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
	if (!userPO.getPurpose().equals("NEW")) {
		maintenance = true;
		out.println("<SCRIPT> initMenu(); </SCRIPT>");
	}
%>

<h3 align="center">
<% if("1".equals( currUser.getH01WK1()) ){ %>      
	Consulta Plan de Fomento
<% 	readOnly = true;
   }else if (maintenance){ %>
	Mantenimiento Plan de Fomento
<%} else { %>
	Nuevo Plan de Fomento
<%} %>
 <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="plan_fomento_detalles.jsp, ESD0365"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0365" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
	<INPUT TYPE="hidden" NAME="H01FLGMAS" value="A"> 
  <%int row = 0; %>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
		   <tr id="trdark">
             <td nowrap width="10%" align="right"> Codigo : 
               </td>          
             <td nowrap align="left" width="10%">
                <input type="text" name="E01PFMCOD" size="5" maxlength="4" value="<%= RecData.getE01PFMCOD()%>" readonly >
             </td> 
             <td nowrap width="10%" align="right"> 
              </td>
             <td nowrap width="70%" align="left">
             </td>                    
       	 </tr>
         <tr id="trdark">
             <td nowrap width="10%" align="right"> Cliente Numero : 
              </td>
             <td nowrap width="10%" align="left">
            	<eibsinput:help fn_param_one="E01PFMCUN" fn_param_two="E01CUSNA1" name="RecData" property="E01PFMCUN" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER%>" readonly="<%=readOnly%>" />
             </td>
             <td nowrap width="10%" align="right"> Nombre : 
              </td>
             <td nowrap width="70%" align="left">
	  			<eibsinput:text name="RecData" property="E01CUSNA1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL%>" readonly="true"/>
             </td>             
         </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Detalles </h4>
    
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="15%" > 
              <div align="right">Nombre del Plan :</div>
            </td>
            <td width="35%" > 
	  			<eibsinput:text name="RecData" property="E01PFMNME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="<%=readOnly%>"/>
          </td>
            <td width="15%"> 
              <div align="right">Fecha   Inicio :</div>
            </td>
            <td width="35%"> 
               <eibsinput:date name="RecData" fn_month="E01PFMFIM" fn_day="E01PFMFID" fn_year="E01PFMFIY" readonly="<%=readOnly%>" />
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="15%"> 
              <div align="right">Tabla de Tasa Flotante :</div>
            </td>
            <td width="35%"> 
              <input type="text" name="E01PFMFTB" size="2" maxlength="2" value="<%= RecData.getE01PFMFTB().trim()%>"  >
              <a href="javascript:GetFloating('E01PFMFTB')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="middle" border="0" ></a> 
                <select name="E01PFMFTY">
                <option value=" " <% if (!(RecData.getE01PFMFTY().equals("FP") ||RecData.getE01PFMFTY().equals("FS"))) out.print("selected"); %>></option>
                  <option value="FP" <%if (RecData.getE01PFMFTY().equals("FP")) { out.print("selected"); }%>> Primario</option>
                  <option value="FS" <%if (RecData.getE01PFMFTY().equals("FS")) {  out.print("selected"); }%>>Secundario</option>
                </select>  
             </td>
            <td width="15%" > 
              <div align="right">Fecha   Vencimiento :</div>
            </td>
            <td width="35%" > 
               <eibsinput:date name="RecData" fn_month="E01PFMFVM" fn_day="E01PFMFVD" fn_year="E01PFMFVY" readonly="<%=readOnly%>" />
          </td>
          </tr>
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="15%"> 
              <div align="right">Tasa Fomento/Spread :</div>
            </td>
            <td width="35%"> 
	  			<eibsinput:text name="RecData" property="E01PFMRTE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="<%=readOnly%>" />
            </td>
           <td width="15%"> 
              <div align="right">Surcusal de Cr&eacute;dito Pasivo :</div>
            </td>
            <td width="35%"> 
 		        <eibsinput:text name="RecData" property="E01PFMBNK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" readonly="<%=readOnly%>"/>
 		        <eibsinput:help name="RecData" fn_param_one="E01PFMBRN" property="E01PFMBRN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>" readonly="<%=readOnly%>"/>
            </td>
          </tr>          

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="15%" > 
              <div align="right">Monto del Plan :</div>
            </td>
            <td width="35%" > 
                <div align="left">
	  			<eibsinput:text name="RecData" property="E01PFMAMA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="<%=readOnly%>"/>
                </div>
	        </td>
           <td width="15%"> 
              <div align="right">Cuenta Contable Abono :</div>
            </td>
            <td width="35%" > 
 		        <eibsinput:text name="RecData" property="E01PFMOBK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" readonly="<%=readOnly%>"/>
 		        <eibsinput:help name="RecData" property="E01PFMOBR" fn_param_one="E01PFMOBR" fn_param_two="document.forms[0].E01PFMOBK.value" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>"  readonly="<%=readOnly%>" />
 		        <eibsinput:help name="RecData" property="E01PFMOCY" fn_param_one="E01PFMOCY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" />
 		        <eibsinput:help name="RecData" property="E01PFMOGL" fn_param_one="E01PFMOGL" fn_param_two="document.forms[0].E01PFMOBK.value" fn_param_three="document.forms[0].E01PFMOCY.value" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="<%=readOnly%>" />
            </td>         
	        
          </tr>
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="15%" > 
              <div align="right">Monto Usado del Plan :</div>
            </td>
            <td width="35%" >
	  			<eibsinput:text name="RecData" property="E01PFMAMU" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="<%=readOnly%>"/>
	        </td>
           <td width="15%"> 
              <div align="right">Producto :</div>
            </td>		  
			<td nowrap width="35%">
 		        <eibsinput:help name="RecData" property="E01PFMPRD" fn_param_one="E01PFMPRD" fn_param_two="10" fn_param_three="document.forms[0].E01PFMBNK.value" fn_param_four="" fn_param_five="String('L')"  eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PRODUCT%>" readonly="<%=readOnly%>" />
 				<eibsinput:text name="RecData" property="E01PRDDSC" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME_FULL%>" readonly="true" />
			</td>
            <td width="15%"></td>		  
			<td nowrap width="35%"></td>			
		  </tr>
		  
		  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="15%">
              <div align="right">Porcentaje de Cobertura :</div>
            </td>		  
			<td nowrap width="35%"> 
				<eibsinput:text property="E01PFMPCO" name="RecData" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE%>" readonly="<%=readOnly%>" />%
			</td>			
           <td width="15%">    
                     <div align="right">Segmento :</div>
		   </td>		  
			<td nowrap width="35%">	
				<eibsinput:cnofc name="RecData" property="E01PFMSGM" fn_description="E01SGMDSC"  flag="SG" readonly="<%=readOnly%>" /> 
				<eibsinput:text name="RecData" property="E01SGMDSC" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME_FULL%>" readonly="true" required="true" />
			</td>
		  </tr>	  

		  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="15%">
              <div align="right">Tipo Reporte :</div>
            </td>		  
			<td nowrap width="35%"> 
                <select name="E01PFMFLX">
	              <option value=""></option>
	              <option value="F" <% if(RecData.getE01PFMFLX().equals("F")) out.print("selected");%>>Findeter</option>
	              <option value="B" <% if(RecData.getE01PFMFLX().equals("B")) out.print("selected");%>>Bancoldex</option>
                </select>  
			</td>			
           <td width="15%">    
		   </td>		  
		  </tr>	  

        </table>
      </td>
    </tr>
  </table>
  
  <h4>Comisi&oacute;n</h4>
  <%int row2 = 0; %>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row2 % 2 == 1) ? "trdark" : "trclear" %><%row2++;%>">
            <td width="12%" > 
              <div align="right">Codigo de Comisi&oacute;n :</div>
            </td>
            <td width="38%" nowrap> 
	  			<eibsinput:help name="RecData" property="E01PFMCCD" fn_param_one="E01PFMCCD" fn_param_two="E01DSCCCD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_COMMISSION%>" readonly="<%=readOnly%>" />
	  			<eibsinput:text name="RecData" property="E01DSCCCD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL%>" readonly="true" /> 
            </td>
            <td width="12%" > 
            </td>
            <td width="38%" > 
            </td>
         </tr>        
          <tr id="<%= (row2 % 2 == 1) ? "trdark" : "trclear" %><%row2++;%>">
            <td width="12%" > 
              <div align="right">Monto Complimento :</div>
            </td>
            <td width="38%" > 
	  			<eibsinput:text name="RecData" property="E01PFMCVA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT_FEE%>" readonly="<%=readOnly%>" /> 
                <select name="E01PFMCFA">
	                    <option value="F" <% if(!RecData.getE01PFMCFA().equals("P")) out.print("selected");%>>Fijo</option>
	                    <option value="P" <% if(RecData.getE01PFMCFA().equals("P"))  out.print("selected");%>>%</option>
                </select>  
            </td>
            <td width="12%" > 
              <div align="right">Acci&oacute;n :</div>
            </td>
            <td width="38%" > 
                <select name="E01PFMCSP">
		                <option value=" " <% if (!(RecData.getE01PFMCSP().equals("R") 
                								|| RecData.getE01PFMCSP().equals("X") 
                								|| RecData.getE01PFMCSP().equals("D") )) out.print("selected"); %>></option>
	                    <option value="R" <% if(RecData.getE01PFMCSP().equals("R")) out.print("selected");%>>Reemplaza</option>
	                    <option value="X" <% if(RecData.getE01PFMCSP().equals("X")) out.print("selected");%>>+ o -</option>
	                    <option value="D" <% if(RecData.getE01PFMCSP().equals("D")) out.print("selected");%>>Eliminar </option>
                </select>             
            </td>
         </tr>
          <tr id="<%= (row2 % 2 == 1) ? "trdark" : "trclear" %><%row2++;%>">
            <td width="12%" > 
              <div align="right">Monto Minimo :</div>
            </td>
            <td width="38%" nowrap> 
	  			<eibsinput:text name="RecData" property="E01PFMCMN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="<%=readOnly%>"/>
            </td>
            <td width="12%" > 
              <div align="right">Monto Maximo :</div>
            </td>
            <td width="38%" > 
	  			<eibsinput:text name="RecData" property="E01PFMCMX" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="<%=readOnly%>"/>
            </td>
         </tr>          
        </table>
      </td>
    </tr>
  </table>
  
<br>
  
      <div align="center" style="width:95%"> 
 	<% if( !"1".equals( currUser.getH01WK1()) ){ %>      
          <input id="EIBSBTN" type=submit name="Submit" value="Enviar">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <% } %> 
          <input class="EIBSBTN" type=button name="Cancel" value="Cancelar" onclick="javascript:goAction(500);">
      </div>
  </form>
</body>
</HTML>
