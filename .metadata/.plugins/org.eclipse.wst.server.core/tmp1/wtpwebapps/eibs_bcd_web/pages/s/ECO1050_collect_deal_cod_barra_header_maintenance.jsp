<!DOCTYPE HTML">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Mantenimiento de referencia Codigo de Barra</title>

<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset="utf-8">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/jquery/themes/smoothness/jquery-ui.css"/> 

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery-ui-1.10.4.min.js"> </SCRIPT>

<jsp:useBean id="cdeObj" class="datapro.eibs.beans.ECO105001Message"  scope="session" />  
<jsp:useBean id="cdeObj4" class="datapro.eibs.beans.ECO105004Message"  scope="session" />
 
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

</head>
 
<body>
<%
String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"campo obligatorio\" align=\"bottom\" border=\"0\" >";

	Boolean isReadOnly = false;
	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) { 
		isReadOnly = true;
	}	
 %>
 
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript">
	
function goAction(op) {
	document.forms[0].SCREEN.value = op;
<%if (!isReadOnly){ %>	
	document.forms[0].Submit.disabled = true;
<%} %>	
	document.forms[0].Exit.disabled = true;		
	document.forms[0].submit();
}

function aviso(valor) {
	if (valor=="N"){
		alert("Luego de Grabar, Recuerde colocarla lista de Oficinas donde Puede Recibir el Recaudo");
	}
}

  function golistaCodigoBarra() {
 	if (document.forms[0].E01COMNUM.value!="999999999999"){
		page = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECO1050?SCREEN=800&E01COMCUN="+document.forms[0].E04DCBCUN.value+"&E01COMNUM="+document.forms[0].E04DCBNUM.value;
		//alert(page);		
  		CenterWindow(page,800,500,2);
	}else{
		alert("Debe Grabar el convenio para agregar Referecia - Codigo de Barra");
	}  		
 }


</SCRIPT>  
 
 <% 
	if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
%>

<H3 align="center">Mantenimiento de referencia Codigo de Barra<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="collect_deal_cod_barra_maintenance, ECO1050"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECO1050">
  
  	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="715">
  	<INPUT TYPE=HIDDEN NAME="E04OPE" VALUE="<%= cdeObj4.getE04OPE().trim()%>">
 
 
	<INPUT TYPE=HIDDEN NAME="E01COMCUN" VALUE="<%= cdeObj.getE01COMCUN().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01COMNUM" VALUE="<%= cdeObj.getE01COMNUM().trim()%>">

	<INPUT TYPE=HIDDEN NAME="E04DCBBNK" VALUE="<%= cdeObj.getE01COMBNK().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E04DCBCUN" VALUE="<%= cdeObj.getE01COMCUN().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E04DCBNUM" VALUE="<%= cdeObj.getE01COMNUM().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E04DCBDCL" VALUE="<%= cdeObj.getE01COMDCL().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E04DCBIDN" VALUE="<%= cdeObj.getE01COMIDN().trim()%>">
	<INPUT TYPE=HIDDEN NAME="GRABAR04" VALUE="N">
	<INPUT TYPE=HIDDEN NAME="E04OPE" VALUE="<%= cdeObj4.getE04OPE().trim()%>">
  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
      
   <b>Indicadores Codigo de Barras</b>    
   <table cellspacing="0" cellpadding="2" width="100%" border="1" class="tbhead">
     <tr>
     <td>       
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="center">  
          <tr id="trclear"> 
            <td nowrap align="right">Código EAN:</td>
            <td nowrap align="left">
            		<INPUT TYPE=HIDDEN NAME="E04DCBTCE_H" VALUE="<%=cdeObj4.getE04DCBTCE()%>">
	            	<eibsinput:cnofc name="cdeObj4" property="E04DCBTCE" value="<%=cdeObj4.getE04DCBTCE()%>" required="true" flag="VG" fn_code="E04DCBTCE" fn_description="E04DCBDCE" readonly="<%=isReadOnly %>"/>
	       	        <input type="text" name="E04DCBDCE" size="20" value="<%= cdeObj4.getE04DCBDCE().trim()%>" readonly>
            </td>
            <%
              //se coloca la fecha de a dds01 si las de la dd4 si la de estas son ceros
              //fecha desde
              if (cdeObj4.getE04DCBVIY().equals("0")) cdeObj4.setE04DCBVIY(cdeObj.getE01COMVIY());
              if (cdeObj4.getE04DCBVIM().equals("0")) cdeObj4.setE04DCBVIM(cdeObj.getE01COMVIM());
              if (cdeObj4.getE04DCBVID().equals("0")) cdeObj4.setE04DCBVID(cdeObj.getE01COMVID());
              //fecha hasta               
              if (cdeObj4.getE04DCBVFY().equals("0")) cdeObj4.setE04DCBVFY(cdeObj.getE01COMVFY());
              if (cdeObj4.getE04DCBVFM().equals("0")) cdeObj4.setE04DCBVFM(cdeObj.getE01COMVFM());
              if (cdeObj4.getE04DCBVFD().equals("0")) cdeObj4.setE04DCBVFD(cdeObj.getE01COMVFD());

             %>
            <td nowrap align="right">Fecha Vigencia Desde:</td>
            <td nowrap align="left">
            	<eibsinput:date name="cdeObj4" fn_year="E04DCBVIY" fn_month="E04DCBVIM" fn_day="E04DCBVID" required="true" readonly="<%=isReadOnly %>"/>
            </td>
			<td nowrap align="right">Fecha Vigencia Hasta:</td>
			<td nowrap align="left">
				<eibsinput:date name="cdeObj4" fn_year="E04DCBVFY" fn_month="E04DCBVFM" fn_day="E04DCBVFD" required="true" readonly="<%=isReadOnly %>"/>
			</td>            
         </tr>                 			     	
          <tr id="trdark"> 
            <td nowrap align="right">Consecutivo Código:</td>
            <td nowrap align="left">
					<eibsinput:text name="cdeObj4" property="E04DCBSCB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" required="false" readonly="true" size="4" maxlength="3"/>
            </td>
			<td nowrap align="right">&nbsp;</td>
			<td nowrap align="left">
				
			</td>               
            <td nowrap align="right">&nbsp;</td>
            <td nowrap align="left">
            	&nbsp;
            </td>         
         </tr> 
          <tr id="trclear"> 
            <td nowrap align="right">Código Adicional:</td>
            <td nowrap align="left">
		       <select name="E04DCBIBA" <%=isReadOnly?"disabled":""%>>
                   <option value="Y"  <% if (cdeObj4.getE04DCBIBA().equals("Y") ) out.print("selected"); %>>Si</option>
                   <option value="N"  <% if (cdeObj4.getE04DCBIBA().equals("N") || cdeObj4.getE04DCBIBA().equals("") ) out.print("selected"); %>>No</option>                      
               </select>            </td>
            <td nowrap align="right"><!-- Clave de Control:  --> </td>
            <td nowrap align="left">
            <!-- 
            	<eibsinput:text name="cdeObj4" property="E04DCBCCO" eibsType="" required="false" readonly="" size="30" maxlength="25"/>
 			-->            	
            </td>
			<td nowrap align="right">Algoritmo de <br>Validación:</td>
			<td nowrap align="left">			
            	<eibsinput:cnofc name="cdeObj4" property="E04DCBAVC" value="<%=cdeObj4.getE04DCBAVC()%>" required="true" flag="VR" fn_code="E04DCBAVC" fn_description="E04DCBDVC" readonly="<%=isReadOnly %>"/>
       	        <input type="text" name="E04DCBDVC" size="20" value="<%= cdeObj4.getE04DCBDVC().trim()%>" readonly> 				
				
			</td>            
         </tr>          
         <tr id="trdark"> 
            <td nowrap align="right">Indicador de <br>Contingencia:</td>
            <td nowrap align="left">
            	<select name="E04DCBICT" <%=isReadOnly?"disabled":""%>>
                   <option value="Y"  <% if (cdeObj4.getE04DCBICT().equals("Y") ) out.print("selected"); %>>Si</option>
                   <option value="N"  <% if (cdeObj4.getE04DCBICT().equals("N") || cdeObj4.getE04DCBICT().equals("") ) out.print("selected"); %>>No</option>                      
               </select>
            </td>
            <td nowrap align="right">Indicador Valida Cero:</td>
            <td nowrap align="left">
            	<select name="E04DCBIVC" <%=isReadOnly?"disabled":""%>>
                   <option value="Y"  <% if (cdeObj4.getE04DCBIVC().equals("Y") ) out.print("selected"); %>>Si</option>
                   <option value="N"  <% if (cdeObj4.getE04DCBIVC().equals("N") || cdeObj4.getE04DCBIVC().equals("") ) out.print("selected"); %>>No</option>                      
               </select>            
            </td>
	    	<td nowrap align="right">Indicador Valida <br>Fecha:</td>
	    	<td nowrap align="left">
            	<select name="E04DCBIVF" <%=isReadOnly?"disabled":""%>>
                   <option value="Y"  <% if (cdeObj4.getE04DCBIVF().equals("Y") ) out.print("selected"); %>>Si</option>
                   <option value="N"  <% if (cdeObj4.getE04DCBIVF().equals("N") || cdeObj4.getE04DCBIVF().equals("") ) out.print("selected"); %>>No</option>                      
               </select>	    	
	    	</td>            
         </tr> 
         <tr id="trclear"> 
            <td nowrap align="right">Indicador Valida Hash:</td>
            <td nowrap align="left">
            	<select name="E04DCBIVH" <%=isReadOnly?"disabled":""%>>
                   <option value="Y"  <% if (cdeObj4.getE04DCBIVH().equals("Y") ) out.print("selected"); %>>Si</option>
                   <option value="N"  <% if (cdeObj4.getE04DCBIVH().equals("N") || cdeObj4.getE04DCBIVH().equals("") ) out.print("selected"); %>>No</option>                      
               </select>            
            </td>
            <td nowrap align="right">Permitido Editar Monto:</td>
            <td nowrap align="left">
            	<select name="E04DCBIEM" <%=isReadOnly?"disabled":""%>>
                   <option value="Y"  <% if (cdeObj4.getE04DCBIEM().equals("Y") ) out.print("selected"); %>>Si</option>
                   <option value="N"  <% if (cdeObj4.getE04DCBIEM().equals("N") || cdeObj4.getE04DCBIEM().equals("") ) out.print("selected"); %>>No</option>                      
               </select>            
            </td>
	    	<td nowrap align="right">Código de Mensaje:</td>
	    	<td nowrap align="left">
				<eibsinput:text name="cdeObj4" property="E04DCBCCM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" required="false" readonly="<%=isReadOnly %>" size="5" maxlength="4"/> 	    	
	    	</td>            
         </tr>
         <tr id="trdark"> 
            <td nowrap align="right">Captura Automática:</td>
            <td nowrap align="left">
            	<select name="E04DCBIAB" <%=isReadOnly?"disabled":""%>>
                   <option value="Y"  <% if (cdeObj4.getE04DCBIAB().equals("Y") ) out.print("selected"); %>>Si</option>
                   <option value="N"  <% if (cdeObj4.getE04DCBIAB().equals("N") || cdeObj4.getE04DCBIAB().equals("") ) out.print("selected"); %>>No</option>                      
               </select>               
            </td>
            <td nowrap align="right">Retorno Automático:</td>
            <td nowrap align="left">
            	<select name="E04DCBIRB" <%=isReadOnly?"disabled":""%>>
                   <option value="Y"  <% if (cdeObj4.getE04DCBIRB().equals("Y") ) out.print("selected"); %>>Si</option>
                   <option value="N"  <% if (cdeObj4.getE04DCBIRB().equals("N") || cdeObj4.getE04DCBIRB().equals("") ) out.print("selected"); %>>No</option>                      
               </select>            
            </td>
	    	<td nowrap align="right">Indicador Código de <br>Barras Principal:</td>
	    	<td nowrap align="left">
	    	  <select name="E04DCBICP" <%=isReadOnly?"disabled":""%>>
                   <option value="Y"  <% if (cdeObj4.getE04DCBICP().equals("Y") ) out.print("selected"); %>>Si</option>
                   <option value="N"  <% if (cdeObj4.getE04DCBICP().equals("N") || cdeObj4.getE04DCBICP().equals("") ) out.print("selected"); %>>No</option>                      
               </select> 
	    	</td>            
         </tr>          
		</table>
      </td>
      </tr>
    </table>

     <br>
     <b>Estructura del Codigo de Barras</b>
   <table cellspacing="0" cellpadding="2" width="100%" border="1">
     <tr>
     <td>     
		<table cellspacing="0" cellpadding="2" width="100%" border="0">                 
         <tr id="trdark"> 
            <td nowrap align="right">Posición Encabezado:</td>
            <td nowrap align="left">         
            	<eibsinput:text name="cdeObj4" property="E04DCBPIE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" required="false" readonly="<%=isReadOnly %>" size="5" maxlength="5"/>
            </td>
            <td nowrap align="right">Longitud Encabezado:</td>
            <td nowrap align="left">           
				<eibsinput:text name="cdeObj4" property="E04DCBLEN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" required="false" readonly="<%=isReadOnly %>" size="5" maxlength="5"/>            
            </td>
	    	<td nowrap align="right">Código Encabezado:</td>
	    	<td nowrap align="left">
				<eibsinput:text name="cdeObj4" property="E04DCBCEN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" required="false" readonly="<%=isReadOnly %>" size="5" maxlength="4"/> 	    	
	    	</td>            
         </tr>
         <tr id="trclear"> 
            <td nowrap align="right">Tipo Longitud:</td>
            <td nowrap align="left">            
            	<select name="E04DCBTLE" <%=isReadOnly?"disabled":""%>>
                   <option value="LONGITUD FIJA POR POSICIONES"  <% if (cdeObj4.getE04DCBTLE().equals("LONGITUD FIJA POR POSICIONES") ) out.print("selected"); %>>LONGITUD FIJA POR POSICIONES</option>
                   <option value="LONGITUD VARIABLE POR DELIMITADOR"  <% if (cdeObj4.getE04DCBTLE().equals("LONGITUD VARIABLE POR DELIMITADOR") ) out.print("selected"); %>>LONGITUD VARIABLE POR DELIMITADOR</option>                      
               </select>            
            </td>
            <td nowrap align="right">Longitud Total Código:</td>
            <td nowrap align="left">
				<eibsinput:text name="cdeObj4" property="E04DCBLTC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" required="false" readonly="<%=isReadOnly %>" size="5" maxlength="5"/>            
            </td>
	    	<td nowrap align="right">Posición Código IAC:</td>
	    	<td nowrap align="left">	    	
				<eibsinput:text name="cdeObj4" property="E04DCBPII" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" required="false" readonly="<%=isReadOnly %>" size="5" maxlength="5"/>	    	
	    	</td>            
         </tr>
         <tr id="trdark"> 
            <td nowrap align="right">Longitud Código IAC:</td>
            <td nowrap align="left">
            	<eibsinput:text name="cdeObj4" property="E04DCBLTI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" required="false" readonly="<%=isReadOnly %>" size="5" maxlength="5"/>            
            </td>
            <td nowrap align="right">Código IAC:</td>
            <td nowrap align="left">
            	<eibsinput:text name="cdeObj4" property="E04DCBIAC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" required="false" readonly="<%=isReadOnly %>" size="26" maxlength="25"/>            
            </td>
	    	<td nowrap align="right">&nbsp;</td>
	    	<td nowrap align="left">&nbsp; </td>            
         </tr>
		</table>
      </td>
      </tr>
    </table>
     <br>
     <b>Iteracion de Referencias del Codigo de Barras</b>    
   <table cellspacing="0" cellpadding="2" width="100%" border="1">
     <tr>
     <td>     
		<table cellspacing="0" cellpadding="2" width="100%" border="0">         
         <tr id="trdark"> 
            <td nowrap align="right"width="50%">
            	<b>&nbsp;</b>
            </td>
            <td nowrap align="left" width="50%">
            		<input id="EIBSBTN" type=button name="listaCodigoBarra" value="Lista" onClick="golistaCodigoBarra();">
            </td>            
         </tr>                                    
        </table>
      </td>
      </tr>
    </table>       





        </td>
      </tr>
    </table>     
    
    <br>
    <br>
    <table width="100%">		
	<tr>
  		<td width="50%">
  		  <div align="center"> 
		<%if (!isReadOnly){ %>  		  
     		<input id="EIBSBTN" type=button name="Submit" value="Guardar" onClick="goAction(865);">
		<%} %>     		
     	  </div>	
  		</td>
  		<td width="50%"> 
  		  <div align="center"> 
     		<input id="EIBSBTN" type=button name="Exit" value="Regresar" onClick="goAction(850);">
     	  </div>	
  		</td>
  	</tr>
	</table>

  
  </form>
  <%
  	String consec = (String)request.getAttribute("CONSE");
  	if (consec!= null){ %>  
		<SCRIPT type="text/javascript">
	 		document.forms[0].E04DCBSCB.value="<%=consec%>";
		</SCRIPT>
  	<%} %>
</body> 

</html>
