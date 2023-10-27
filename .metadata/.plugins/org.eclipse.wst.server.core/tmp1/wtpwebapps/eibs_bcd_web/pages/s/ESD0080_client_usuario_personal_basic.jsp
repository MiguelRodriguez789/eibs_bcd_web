<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">

<title>Informacion Bàsica</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

//  Process according with user selection
 function goAction(op) {
	
   	switch (op){
	// Validate & Write 
  	case 1:  {
    	document.forms[0].APPROVAL.value = 'N';
    	document.forms[0].SCREEN.value = 2;
       	break;
        }
	// Exit
	case 2:  {
		document.forms[0].SCREEN.value = 100;
       	break;
		}
	}
	document.forms[0].submit();
 }

function protectFields(p) {
		document.getElementById("E01SHN").disabled=true;  
		document.getElementById("E01NA1").disabled=true;  
} 
</SCRIPT>

 
<jsp:useBean id= "client" class= "datapro.eibs.beans.ESD008001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

</head>

<body bgcolor="#FFFFFF">

 <% 
 String dirCodes;
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
 if (client.getE01CTR().trim()== "") {
 	dirCodes = client.getE01GEC().trim() + "     ";
 } else {
 	dirCodes = client.getE01POB().trim();
 }
%>

<h3 align="center">Informaciòn Cliente Tipo Usuario para Persona Física<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_usuario_personal_basic, ESD0080"  ></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="APPROVAL" VALUE="N">
  <input type="hidden" name="E01LGT" size="1" maxlength="1" value="<%= client.getE01LGT().trim()%>">
  
<h4>Datos Basicos</h4>
<table class="tableinfo" >
	<tr> 
    	<td nowrap> 
        	<div align="center"> 
            	<table cellspacing="0" cellpadding="2" width="100%" border="0">
              		<tr id="trdark"> 
                		<td nowrap align="right">Nùmero Cliente : </td>
                		<td nowrap> 
                  			<input type="hidden" name="E01CUN" size="15" maxlength="10" value="<%= client.getE01CUN().trim()%>">
                  			<%= client.getE01CUN().trim()%> 
               			</td>
						<td nowrap align="right">Identificaciòn : </td>
                		<td nowrap colspan="2"> 
                  			<input type="hidden" name="E01PID" size="4" value="<%= client.getE01PID().trim()%>">
                  			<input type="hidden" name="E01TID" size="4" value="<%= client.getE01TID().trim()%>">
                  			<input type="hidden" name="E01IDN" size="25" value="<%= client.getE01IDN().trim()%>">
                  			<b>Paìs : <%= client.getE01PID().trim()%>  Tipo : <%= client.getE01TID().trim()%>  Nùmero : <%= client.getE01IDN().trim()%></b>
                		</td>
              		</tr>
              		<tr id="trclear"> 
                		<td nowrap align="right">Primer Nombre : </td>
                		<td nowrap colspan=4> 
                  			<input type="text" name="E01FNA" size="35" maxlength="30" value="<%= client.getE01FNA().trim()%>">
                  			<img src="<%=request.getContextPath()%>/images/Check.gif" title="Campo Obligatorio" align="bottom" border="0" > 
                		</td>
              		</tr>
              		<tr id="trdark"> 
                		<td nowrap align="right">Segundo Nombre : </td>
                		<td nowrap colspan=4> 
                  			<input type="text" name="E01FN2" size="35" maxlength="30" value="<%= client.getE01FN2().trim()%>">
                		</td>
              		</tr>
              		<tr id="trclear"> 
                		<td nowrap align="right">Primer Apellido : </td>
                		<td nowrap colspan=4> 
                  			<input type="text" name="E01LN1" size="35" maxlength="30" value="<%= client.getE01LN1().trim()%>">
                  			<img src="<%=request.getContextPath()%>/images/Check.gif" title="Campo Obligatorio" align="bottom" border="0"  > 
                		</td>
              		</tr>
              		<tr id="trdark"> 
                		<td nowrap align="right">Segundo Apellido : </td>
                		<td nowrap colspan=4> 
                  			<input type="text" name="E01LN2" size="35" maxlength="30" value="<%= client.getE01LN2().trim()%>">
                		</td>
              		</tr>
              		<tr id="trclear"> 
                		<td nowrap align="right">Nombre de Casada : </td>
                		<td nowrap colspan=4> 
                  			<input type="text" name="E01ACA" size="35" maxlength="30" value="<%= client.getE01ACA().trim()%>">
                		</td>
              		</tr>
              		<tr id="trdark"> 
                		<td nowrap align="right">Nombre Legal : </td>
                		<td nowrap colspan=4 > 
                  			<input type="text" name="E01NA1" size="45" maxlength="45" value="<%= client.getE01NA1().trim()%>" readonly>
                		</td>
              		</tr>
              		<tr id="trclear"> 
                		<td nowrap align="right">Nombre Corto : </td>
                		<td nowrap colspan=4 > 
                  			<input type="text" name="E01SHN" size="28" maxlength="25" value="<%= client.getE01SHN().trim()%>" readonly>
                		</td>
              		</tr>
            	</table>
          	</div>
        </td>
    </tr>
</table>

	<jsp:include page="ESD0080_address_template_basic_colombia.jsp" flush="true" >				
		<jsp:param name="title" value="Direcciòn" /> 
		<jsp:param name="messageName" value="client" />
		<jsp:param name="readOnly" value="false" />
		<jsp:param name="suffix" value="E01" />
		<jsp:param name="basic" value="true" />
	</jsp:include>
    
  <h4>Fechas</h4>
  <table class="tableinfo">
    <tr > 
        <td nowrap > 
          
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="center">
          <tr id="trdark"> 
              <td nowrap> 
                
              <div align="right">Fecha de Nacimiento : </div>
              </td>
              <td nowrap> 
	               <eibsinput:date name="client" fn_year="E01BDY" fn_month="E01BDM" fn_day="E01BDD" required="true"/>
              </td>
              <td nowrap> 
                
              <div align="right">Fecha 1er Contacto : </div>
              </td>
              <td nowrap> 
	               <eibsinput:date name="client" fn_year="E01IDY" fn_month="E01IDM" fn_day="E01IDD" required="false"/>
              </td>
            </tr>
          </table>
          
        </td>
      </tr>
    </table>
    <h4>Telèfonos</h4>
    
  <table class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="center">
          <tr id="trdark"> 
            <td nowrap width="27%"> 
              <div align="right">Telèfono Residencia : </div>
            </td>
            <td nowrap width="21%"> 
              <input type="text" name="E01HPN" size="16" maxlength="15" value="<%= client.getE01HPN().trim()%>">
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="Campo Obligatorio" align="bottom" border="0" > 
             </td>
            <td nowrap width="29%"> 
              <div align="right">Telèfono Oficina : </div>
            </td>
            <td nowrap width="23%"> 
              <input type="text" name="E01PHN" size="16" maxlength="15" value="<%= client.getE01PHN().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="27%" > 
              <div align="right">Telèfono Fax : </div>
            </td>
            <td nowrap width="21%" > 
              <input type="text" name="E01FAX" size="16" maxlength="15" value="<%= client.getE01FAX().trim()%>">
            </td>
            <td nowrap width="29%" > 
              <div align="right">Telèfono Celular : </div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01PH1" size="16" maxlength="15" value="<%= client.getE01PH1().trim()%>">
            </td>
          </tr>
        </table>
        </td>
    </tr>
  </table>

  <h4>Còdigos de Clasificaciòn</h4>
    
  <table class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0"  align="center">
          <tr id="trdark"> 
            <td nowrap width="29%"> 
              <div align="right">Oficial Principal : </div>
            </td>
            <td nowrap width="17%"> 
              <input type="text" name="E01OFC" size="5" maxlength="4" value="<%= client.getE01OFC().trim()%>">
              <a href="javascript:GetCodeCNOFC('E01OFC','15')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
            </td>
            <td nowrap width="33%"> 
              <div align="right">Oficial Secundario : </div>
            </td>
            <td nowrap width="21%"> 
              <input type="text" name="E01OF2" size="5" maxlength="4" value="<%= client.getE01OF2().trim()%>">
              <a href="javascript:GetCodeCNOFC('E01OF2','10')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%"> 
              <div align="right">Sector Econòmico : </div>
            </td>
            <td nowrap width="17%"> 
              <input type="text" name="E01INC" size="5" maxlength="4" value="<%= client.getE01INC().trim()%>">
              <a href="javascript:GetCodeCNOFC('E01INC','09')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
            </td>
            <td nowrap width="33%"> 
              <div align="right">Actividad Econòmica : </div>
            </td>
            <td nowrap width="21%"> 
              <input type="text" name="E01BUC" size="5" maxlength="4" value="<%= client.getE01BUC().trim()%>">
              <a href="javascript:GetCodeCNOFC('E01BUC','12')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="Campo Obligatorio" align="bottom" border="0"  > 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="29%"> 
              <div align="right">Paìs de Residencia : </div>
            </td>
            <td nowrap width="17%"> 
              <input type="text" name="E01GEC" size="5" maxlength="4" value="<%= client.getE01GEC().trim()%>" readonly>
              <a href="javascript:GetCodeCNOFC('E01GEC','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
            </td>
            <td nowrap width="33%"> 
              <div align="right">Tipo de Relaciòn : </div>
            </td>
            <td nowrap width="21%"> 
              <input type="text" name="E01UC1" size="5" maxlength="4" value="<%= client.getE01UC1().trim()%>" >
              <a href="javascript:GetCodeCNOFC('E01UC1','2A')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <h4>Datos Operativos</h4>
   
  <table cellspacing="0" cellpadding="2" width="100%" border="1" bordercolor="#000000" bgcolor="#FFFFFF" >
    <tr bordercolor="#FFFFFF"> 
        <td nowrap >
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="center">
          <tr id="trdark"> 
            <td nowrap width="23%"> 
              <div align="right">Estado del Cliente :</div>
              </td>
            <td nowrap width="36%"> 
              <select name="E01STS">
				<option value=" " <% if (!(client.getE01STS().equals("1")||client.getE01STS().equals("2")||client.getE01STS().equals("3"))) out.print("selected"); %>> </option>               
                <option value="1" <% if (client.getE01STS().equals("1")) out.print("selected"); %>>Activo</option>
                <option value="2" <% if (client.getE01STS().equals("2")) out.print("selected"); %>>Inactivo</option>
                <option value="3" <% if (client.getE01STS().equals("3")) out.print("selected"); %>>Lista de Control</option>
              </select>
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="Campo Obligatorio" align="bottom" border="0"> 
            </td>
            <td nowrap width="25%"> 
              <div align="right"> </div>
              </td>
            <td nowrap width="16%"> 
            </td>
            </tr>
    	</table>
		</td>
	</tr>
</table>
	
	<br>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    	<tr bgcolor="#FFFFFF"> 
      		<td width="33%"> 
        		<div align="center"><input type="checkbox" name="H01WK2" value="1" >Aceptar con Avisos</div>
      		</td>
    	</tr>
  	</table>

<table width="100%">		
  	<tr>
  		<td width="50%">
  			<div align="center"> 
     			<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="javascript:goAction(1);">
     	  	</div>	
  		</td>
		<td width="50%">
	  		<div align="center">
				<input id="EIBSBTN" type="button" name="Submit2" value="Salir" onClick="javascript:goAction(2);">
     	  	</div>	
  		</td>
  	</tr>	
</table>	

<SCRIPT type="text/javascript">
	protectFields('<%= userPO.getPurpose().trim()%>');	
</SCRIPT>

</form>
</body>
</html>

