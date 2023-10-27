<!DOCTYPE HTML">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Mantenimiento de Canales - Definicion de Referencia</title>

<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset="utf-8">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/jquery/themes/smoothness/jquery-ui.css"/> 

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<jsp:useBean id="cdeObj" class="datapro.eibs.beans.ECO105001Message"  scope="session" />  
<jsp:useBean id="cdeObj5" class="datapro.eibs.beans.ECO105005Message"  scope="session" />

 
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
	//hacer codigo javascripts para concatenar la lista de referencia
	if (op==715){
		if (document.forms[0].E05RCRSQR.value=="" || document.forms[0].E05RCRSQR.value=="0"){
			alert("Debe colocar un Consecutivo de Referencia");
			document.forms[0].E05RCRSQR.focus();
			return false;
		}
		concatenaCheckbox();
	}
	document.forms[0].SCREEN.value = op;
	<%if (!isReadOnly){ %>		
		document.forms[0].Submit.disabled = true;
	<%}%>
	document.forms[0].Exit.disabled = true;	
	document.forms[0].submit();
	
}

 function concatenaCheckbox() {
 	var canales="";
 	if (document.forms[0].E05RCRCNL01.checked){
 		canales = canales + document.forms[0].E05RCRCNL01.value;
 	}
 	if (document.forms[0].E05RCRCNL02.checked){
 		canales = canales + document.forms[0].E05RCRCNL02.value;
 	}	
 	if (document.forms[0].E05RCRCNL03.checked){
 		canales = canales + document.forms[0].E05RCRCNL03.value;
 	}

 	if (document.forms[0].E05RCRCNL04.checked){
 		canales = canales + document.forms[0].E05RCRCNL04.value;
 	}
 	
 	if (document.forms[0].E05RCRCNL05.checked){
 		canales = canales + document.forms[0].E05RCRCNL05.value;
 	}	
 	if (document.forms[0].E05RCRCNL06.checked){
 		canales = canales + document.forms[0].E05RCRCNL06.value;
 	}
 	if (document.forms[0].E05RCRCNL07.checked){
 		canales = canales + document.forms[0].E05RCRCNL07.value;
 	}
 	if (document.forms[0].E05RCRCNL08.checked){
 		canales = canales + document.forms[0].E05RCRCNL08.value;
 	}
 	if (document.forms[0].E05RCRCNL09.checked){
 		canales = canales + document.forms[0].E05RCRCNL09.value;
 	}
 	if (document.forms[0].E05RCRCNL10.checked){
 		canales = canales + document.forms[0].E05RCRCNL10.value;
 	}
 	if (document.forms[0].E05RCRCNL11.checked){
 		canales = canales + document.forms[0].E05RCRCNL11.value;
 	}
 	if (document.forms[0].E05RCRCNL12.checked){
 		canales = canales + document.forms[0].E05RCRCNL12.value;
 	}
 	if (document.forms[0].E05RCRCNL13.checked){
 		canales = canales + document.forms[0].E05RCRCNL13.value;
 	}
 	if (document.forms[0].E05RCRCNL14.checked){
 		canales = canales + document.forms[0].E05RCRCNL14.value;
 	} 	 	
 	document.forms[0].E05RCRCNL.value=canales; 	
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

<H3 align="center">Datos Canal de Recaudos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="collect_deal_canal_maintenance, ECO1050"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECO1050">
  
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="715">
  <INPUT TYPE=HIDDEN NAME="E05OPE" VALUE="<%= cdeObj5.getE05OPE().trim()%>">

  <INPUT TYPE=HIDDEN NAME="E05RCRBNK" VALUE="<%= cdeObj.getE01COMBNK().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E05RCRCUN" VALUE="<%= cdeObj.getE01COMCUN().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E05RCRNUM" VALUE="<%= cdeObj.getE01COMNUM().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E05RCRDCL" VALUE="<%= cdeObj.getE01COMDCL().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E05RCRIDN" VALUE="<%= cdeObj.getE01COMIDN().trim()%>">
  
  <!-- Campos Ocultos -->
  <INPUT TYPE=HIDDEN NAME="E05RCRCMM" VALUE="<%= cdeObj5.getE05RCRCMM().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E05RCRCDD" VALUE="<%= cdeObj5.getE05RCRCDD().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E05RCRCYY" VALUE="<%= cdeObj5.getE05RCRCYY().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E05RCRCTM" VALUE="<%= cdeObj5.getE05RCRCTM().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E05RCRCUS" VALUE="<%= cdeObj5.getE05RCRCUS().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E05RCRAMM" VALUE="<%= cdeObj5.getE05RCRAMM().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E05RCRADD" VALUE="<%= cdeObj5.getE05RCRADD().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E05RCRAYY" VALUE="<%= cdeObj5.getE05RCRAYY().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E05RCRATM" VALUE="<%= cdeObj5.getE05RCRATM().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E05RCRAUS" VALUE="<%= cdeObj5.getE05RCRAUS().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E05RCRMMM" VALUE="<%= cdeObj5.getE05RCRMMM().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E05RCRMDD" VALUE="<%= cdeObj5.getE05RCRMDD().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E05RCRMYY" VALUE="<%= cdeObj5.getE05RCRMYY().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E05RCRMTM" VALUE="<%= cdeObj5.getE05RCRMTM().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E05RCRMUS" VALUE="<%= cdeObj5.getE05RCRMUS().trim()%>">
                                                                                
                              
  
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
		<tr id="trdark"> 
            <td nowrap width="15%" align="right">Consecutivo referencia : </td>
            <td nowrap width="35%" align="left" >
            	<eibsinput:text  name="cdeObj5" property="E05RCRSQR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" required="true"  size="4" maxlength="3" readonly="<%=isReadOnly %>"/>                                 
       	    </td> 
			<td nowrap width="15%" align="right">Código de Referencia : </td>
            <td nowrap width="35%" align="left">
            	<eibsinput:cnofc name="cdeObj5" property="E05RCRCRF" value="<%=cdeObj5.getE05RCRCRF()%>" required="true" flag="VQ" fn_code="E05RCRCRF" fn_description="E05RCRDRF" readonly="<%=isReadOnly %>"/>
       	        <input type="text" name="E05RCRDRF" size="20" value="<%= cdeObj5.getE05RCRDRF().trim()%>" readonly> 	                      
       	    </td>  
         </tr>         
        <tr id="trclear">
			<td nowrap  align="right">Fecha de Vigencia Desde : </td>
			<td nowrapalign="left">  
				<eibsinput:date name="cdeObj5" fn_year="E05RCRVIY" fn_month="E05RCRVIM" fn_day="E05RCRVID" required="true" readonly="<%=isReadOnly %>"/>
			</td>           
            <td nowrap  align="right">Fecha de Vigencia Hasta : </td>          
            <td nowrap  align="left" >
				<eibsinput:date name="cdeObj5" fn_year="E05RCRVFY" fn_month="E05RCRVFM" fn_day="E05RCRVFD" required="true" readonly="<%=isReadOnly %>"/>
			</td>            
         </tr>   	   
         <tr id="trdark">
			<td nowrap  align="right">Referencia Asobancaria : </td>
			<td nowrapalign="left">
				<select name="E05RCRIRA" <%=isReadOnly?"disabled":""%>>
                    <option value="Y" <% if (cdeObj5.getE05RCRIRA().equals("Y") || cdeObj5.getE05RCRIRA().trim().equals("") ) out.print("selected"); %>>Si</option>
                    <option value="N" <% if (cdeObj5.getE05RCRIRA().equals("N")) out.print("selected"); %>>No</option>                   
                </select>
                <%=mandatory%>				
			</td>           
            <td nowrap  align="right">Indicador Concatenación : </td>          
            <td nowrap  align="left" >
				<select name="E05RCRICA" <%=isReadOnly?"disabled":""%>>
                    <option value="Y" <% if (cdeObj5.getE05RCRICA().equals("Y") || cdeObj5.getE05RCRICA().trim().equals("") ) out.print("selected"); %>>Si</option>
                    <option value="N" <% if (cdeObj5.getE05RCRICA().equals("N")) out.print("selected"); %>>No</option>                   
                </select>
                <%=mandatory%>
			</td>            
         </tr> 
         <tr id="trclear">
			<td nowrap  align="right">Referencia Obligatoria : </td>
			<td nowrapalign="left">  
				<select name="E05RCRIOR" <%=isReadOnly?"disabled":""%>>
                    <option value="Y" <% if (cdeObj5.getE05RCRIOR().equals("Y") || cdeObj5.getE05RCRIOR().trim().equals("") ) out.print("selected"); %>>Si</option>
                    <option value="N" <% if (cdeObj5.getE05RCRIOR().equals("N")) out.print("selected"); %>>No</option>                   
                </select>
                <%=mandatory%> 
			</td>           
            <td nowrap  align="right">Tipo de Datos Referencia : </td>          
            <td nowrap  align="left" >
				<select name="E05RCRTDR" <%=isReadOnly?"disabled":""%>>
                    <option value="ALFANUMERICO" <% if (cdeObj5.getE05RCRTDR().equals("ALFANUMERICO") || cdeObj5.getE05RCRTDR().trim().equals("") ) out.print("selected"); %>>ALFANUMERICO</option>
                    <option value="NUMERICO" <% if (cdeObj5.getE05RCRTDR().equals("NUMERICO")) out.print("selected"); %>>NUMERICO</option>                   
                </select>
                <%=mandatory%> 
			</td>            
         </tr>           
         <tr id="trdark">
			<td nowrap  align="right">Longitud Referencia :</td>
			<td nowrapalign="left">
					<eibsinput:text  name="cdeObj5" property="E05RCRLRC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" required="true"  size="6" maxlength="5" readonly="<%=isReadOnly %>"/>
			</td>           
            <td nowrap  align="right">Algoritmo Validación : </td>          
            <td nowrap  align="left" >
            	<eibsinput:cnofc name="cdeObj5" property="E05RCRCVR" value="<%=cdeObj5.getE05RCRCVR()%>" required="true" flag="VR" fn_code="E05RCRCVR" fn_description="E05RCRDVR" readonly="<%=isReadOnly %>"/>
       	        <input type="text" name="E05RCRDVR" size="20" value="<%= cdeObj5.getE05RCRDVR().trim()%>" readonly> 				
			</td>            
         </tr>   
         <tr id="trdark">
			<td nowrap  align="right">Lista a Referenciar : </td>
			<td nowrapalign="left" colspan="3">
            	<eibsinput:cnofc name="cdeObj5" property="E05RCRLVR" value="<%=cdeObj5.getE05RCRLVR()%>" required="true" flag="VP" fn_code="E05RCRLVR" fn_description="E05RCRDLV" readonly="<%=isReadOnly %>"/>
       	        <input type="text" name="E05RCRDLV" size="20" value="<%= cdeObj5.getE05RCRDLV().trim()%>" readonly> 				
			</td>           
         </tr>                
         <tr id="trclear">
			<td nowrap  align="right">Valor Mínimo Transacción : </td>
			<td nowrapalign="left">
				<eibsinput:text  name="cdeObj5" property="E05RCRVMT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL %>" required="true" size="20" maxlength="17" readonly="<%=isReadOnly %>"/>					
			</td>           
            <td nowrap  align="right">Valor Máximo Transacción : </td>          
            <td nowrap  align="left" >
				<eibsinput:text  name="cdeObj5" property="E05RCRVXT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL %>" required="true"  size="20" maxlength="17" readonly="<%=isReadOnly %>"/>
			</td>            
         </tr>
         	<%
            	String  cadC= cdeObj5.getE05RCRCNL();
            	//cad="000200040007";
            	java.util.Vector<String> vecC = null;
            	vecC = new java.util.Vector<String>();
            	int inicC =0;
            	int contC=0; 
            	for(int iC=0;iC<=cadC.length();iC++){
            		if (contC==2){
            			vecC.add(cadC.substring(inicC,iC));
            			inicC=iC;
            			contC=0;
            		}
            		contC++;
            	}
            %>
         <tr id="trdark">
			<td nowrap  align="right">Canales : </td>
			<td nowrapalign="left" colspan="3">
           	<INPUT TYPE=HIDDEN NAME="E05RCRCNL" VALUE="">
            	&nbsp;&nbsp;&nbsp;&nbsp;
            	<INPUT type="CHECKBOX" name="E05RCRCNL01" value="01" <% if (vecC.contains("01")) out.print(" checked"); %>
            	<%=isReadOnly?"disabled":""%>>Oficinas - Agencias  
            	&nbsp;&nbsp;&nbsp;&nbsp;
            	<INPUT type="CHECKBOX" name="E05RCRCNL02" value="02" <% if (vecC.contains("02")) out.print(" checked"); %>
            	<%=isReadOnly?"disabled":""%>>Domiciliacion   
            	&nbsp;&nbsp;&nbsp;&nbsp;
            	<INPUT type="CHECKBOX" name="E05RCRCNL03" value="03" <% if (vecC.contains("03")) out.print(" checked"); %>
            	<%=isReadOnly?"disabled":""%>>Portal 
            	&nbsp;&nbsp;&nbsp;&nbsp;
            	<INPUT type="CHECKBOX" name="E05RCRCNL04" value="04" <% if (vecC.contains("04")) out.print(" checked"); %>
            	<%=isReadOnly?"disabled":""%>>IVR  
            	&nbsp;&nbsp;&nbsp;&nbsp;
            	<INPUT type="CHECKBOX" name="E05RCRCNL05" value="05" <% if (vecC.contains("05")) out.print(" checked"); %>
            	<%=isReadOnly?"disabled":""%>>ATM'S 
            	<br>  
            	&nbsp;&nbsp;&nbsp;&nbsp;
            	<INPUT type="CHECKBOX" name="E05RCRCNL06" value="06" <% if (vecC.contains("06")) out.print(" checked"); %>
            	<%=isReadOnly?"disabled":""%>>Depositarias 
            	&nbsp;&nbsp;&nbsp;&nbsp;
            	<INPUT type="CHECKBOX" name="E05RCRCNL07" value="07" <% if (vecC.contains("07")) out.print(" checked"); %>
            	<%=isReadOnly?"disabled":""%>>PSE Bancos  
            	&nbsp;&nbsp;&nbsp;&nbsp;
            	<INPUT type="CHECKBOX" name="E05RCRCNL08" value="08" <% if (vecC.contains("08")) out.print(" checked"); %>
            	<%=isReadOnly?"disabled":""%>>PSE Comercio  
            	&nbsp;&nbsp;&nbsp;&nbsp;
            	<INPUT type="CHECKBOX" name="E05RCRCNL09" value="09" <% if (vecC.contains("09")) out.print(" checked"); %>
            	<%=isReadOnly?"disabled":""%>> Corresponsales Bancarios 
            	<br> 
            	&nbsp;&nbsp;&nbsp;&nbsp;
            	<INPUT type="CHECKBOX" name="E05RCRCNL10" value="10" <% if (vecC.contains("10")) out.print(" checked"); %>
            	<%=isReadOnly?"disabled":""%>>ACH Debito   
            	&nbsp;&nbsp;&nbsp;&nbsp;
            	<INPUT type="CHECKBOX" name="E05RCRCNL11" value="11" <% if (vecC.contains("11")) out.print(" checked"); %>
            	<%=isReadOnly?"disabled":""%>>ACH Credito 
            	&nbsp;&nbsp;&nbsp;&nbsp;
            	<INPUT type="CHECKBOX" name="E05RCRCNL12" value="12" <% if (vecC.contains("12")) out.print(" checked"); %>
            	<%=isReadOnly?"disabled":""%>>Puntos de Pago - Redes  
            	&nbsp;&nbsp;&nbsp;&nbsp;
            	<INPUT type="CHECKBOX" name="E05RCRCNL13" value="13" <% if (vecC.contains("13")) out.print(" checked"); %>
            	<%=isReadOnly?"disabled":""%>>Banca Movil 
            	<br> 
            	&nbsp;&nbsp;&nbsp;&nbsp;
            	<INPUT type="CHECKBOX" name="E05RCRCNL14" value="14" <% if (vecC.contains("14")) out.print(" checked"); %>
            	<%=isReadOnly?"disabled":""%>>Smart Channel
            	&nbsp;&nbsp;&nbsp;&nbsp;            	            	
            	<%=mandatory%> 					
			</td>           
         </tr>    
         <tr id="trclear">
			<td nowrap  align="right">Texto de Despliegue Referencia : </td>
			<td nowrapalign="left" colspan="3">
					<eibsinput:text  name="cdeObj5" property="E05RCRTDS" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR_40 %>" required="true"  size="30" maxlength="25" readonly="<%=isReadOnly %>"/>				
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
     		<input id="EIBSBTN" type=button name="Submit" value="Guardar" onClick="goAction(715);">
		<%} %>     		
     	  </div>	
  		</td>
  		<td width="50%"> 
  		  <div align="center"> 
     		<input id="EIBSBTN" type=button name="Exit" value="Regresar" onClick="goAction(700);">
     	  </div>	
  		</td>
  	</tr>
	</table>
<script type="text/javascript">
//escribirListaReferencia();
</script>
  
  </form>
</body> 

</html>
