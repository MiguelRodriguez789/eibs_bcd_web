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
<jsp:useBean id="cdeObj4R" class="datapro.eibs.beans.ECO105004Message"  scope="session" />
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
  <INPUT TYPE=HIDDEN NAME="E04OPE" VALUE="<%= cdeObj4R.getE04OPE().trim()%>">
 
  
  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
             <td nowrap width="20%" align="right">Cliente: 
              </td>
             <td nowrap width="30%" align="left">
	  			<eibsinput:text name="cdeObj" property="E01COMCUN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
             </td>
             <td nowrap width="20%" align="right">Identificación:  
             </td>
             <td nowrap width="30%" align="left">
	  			<eibsinput:text name="cdeObj" property="E01COMIDN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" readonly="true"/>
             </td>
         </tr>
		<tr id="trclear"> 
             <td nowrap align="right"> Nombre: 
               </td>
             <td nowrap align="left" colspan="3">
	  			<eibsinput:text name="cdeObj" property="E01COMDCL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" readonly="true"  size="40"/>
             </td>
         </tr>                       
		<tr id="trdark"> 		
            <td nowrap align="right">Código Convenio: </td>
            <td nowrap align="left">
            	<input type="text" name="E01COMNUM" maxlength="12" size="14" value="<%=cdeObj.getE01COMNUM()%>" readonly="readonly" class="TXTRIGHT">         	 
            </td>         
   			<td align="right">
   				Descripción del<br>Convenio:
   			</td>            
			<td nowrap align="left">
				<input type="text" name="E01COMDCO" maxlength="60" size="50" value="<%=cdeObj.getE01COMDCO()%>" readonly="readonly" class="TXTBASE">				
			</td>		
		</tr>				
		<tr id="trclear"> 
            <td nowrap align="left" colspan="4">
            &nbsp;        	 
            </td>         		
		</tr>
    </table>
 
   <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
         <tr id="trclear">
			<td nowrap  align="right">Fecha Vigencia Desde: </td>
			<td nowrapalign="left">
			    <eibsinput:date name="cdeObj4R" fn_year="E04DRBVIY" fn_month="E04DRBVIM" fn_day="E04DRBVID" required="false" readonly="true"/>       	       
			</td>           
            <td nowrap  align="right">Fecha Vigencia Hasta: </td>          
            <td nowrap  align="left" >
				<eibsinput:date name="cdeObj4R" fn_year="E04DRBVFY" fn_month="E04DRBVFM" fn_day="E04DRBVFD" required="false" readonly="true"/>
			</td>            
         </tr>  
        <tr id="trdark">
			<td nowrap width="15%" align="right">Posición inicial : </td>
			<td nowrapalign="left" width="35%" >  
				<eibsinput:text  name="cdeObj4R" property="E04DRBPIS" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" required="true"  size="7" maxlength="5" readonly="<%=isReadOnly %>"/>
			</td>           
            <td nowrap  align="right" width="15%" >Longitud inicial : </td>          
            <td nowrap  align="left" width="35%"  >
				<eibsinput:text  name="cdeObj4R" property="E04DRBLTS" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" required="true"  size="7" maxlength="5" readonly="<%=isReadOnly %>" disabled="true"/>
			</td>            
         </tr> 
         <tr id="trclear">
			<td nowrap  align="right">Código Separador<br>Inicial: </td>
			<td nowrapalign="left">
			    <eibsinput:cnofc name="cdeObj4R" property="E04DRBCDS" value="<%=cdeObj4R.getE04DRBCDS()%>" required="true" flag="VK" fn_code="E04DRBCDS" readonly="<%=isReadOnly %>"/>       	       
			</td>           
            <td nowrap  align="right">Posición Referencia: </td>          
            <td nowrap  align="left" >
				<eibsinput:text  name="cdeObj4R" property="E04DRBPIR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" required="false"  size="7" maxlength="5" readonly="<%=isReadOnly %>" disabled="true"/>
			</td>            
         </tr>    	   
         <tr id="trdark">
			<td nowrap  align="right">Longitud Referencia:</td>
			<td nowrap align="left">
				<eibsinput:text  name="cdeObj4R" property="E04DRBLTR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" required="true"  size="7" maxlength="5" readonly="<%=isReadOnly %>"/>
			</td>           
            <td nowrap  align="right">Delimitador Final: </td>          
            <td nowrap  align="left" >
             	<eibsinput:cnofc name="cdeObj4R" property="E04DRBDIR" value="<%=cdeObj4R.getE04DRBDIR()%>" required="true" flag="VK" fn_code="E04DRBDIR" readonly="<%=isReadOnly %>"/> 
            </td>            
         </tr> 
         <tr id="trclear">
			<td nowrap  align="right">Señal Obligatorio: </td>
			<td nowrapalign="left">				
				<select name="E04DRBIOR" disabled="<%=isReadOnly %>">
                    <option value="Y" <% if (cdeObj4R.getE04DRBIOR().equals("Y") || cdeObj4R.getE04DRBIOR().trim().equals("") ) out.print("selected"); %>>Si</option>
                    <option value="N" <% if (cdeObj4R.getE04DRBIOR().equals("N")) out.print("selected"); %>>No</option>                   
                </select>
                <%=mandatory%> 
			</td>           
            <td nowrap  align="right">Código Referencia: </td>          
            <td nowrap  align="left" >
                <eibsinput:cnofc name="cdeObj4R" property="E04DRBCRF" value="<%=cdeObj4R.getE04DRBCRF()%>" required="false" flag="VQ" fn_code="E04DRBCRF" fn_description="E04DRBDRF" readonly="<%=isReadOnly %>"/>
       	        <input type="text" name="E04DRBDRF" size="20" value="<%= cdeObj4R.getE04DRBDRF().trim()%>" readonly>
            </td>            
         </tr>  
         <tr id="trdark">
			<td nowrap  align="right">Lista de Valores </td>
			<td nowrapalign="left">
			    <eibsinput:cnofc name="cdeObj4R" property="E04DRBLRF" value="<%=cdeObj4R.getE04DRBLRF()%>" required="false" flag="VP" fn_code="E04DRBLRF" fn_description="E04DRBDLF" readonly="<%=isReadOnly %>"/>
       	        <input type="text" name="E04DRBDLF" size="20" value="<%= cdeObj4R.getE04DRBDLF().trim()%>" readonly>
			</td>           
            <td nowrap  align="right"></td>          
            <td nowrap  align="left" ></td>            
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
     		<input id="EIBSBTN" type=button name="Submit" value="Guardar" onClick="goAction(815);">
		<%} %>     		
     	  </div>	
  		</td>
  		<td width="50%"> 
  		  <div align="center"> 
     		<input id="EIBSBTN" type=button name="Exit" value="Regresar" onClick="goAction(800);">
     	  </div>	
  		</td>
  	</tr>
	</table>

  
  </form>
</body> 

</html>
