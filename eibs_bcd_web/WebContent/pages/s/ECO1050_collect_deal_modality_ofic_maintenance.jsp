<!DOCTYPE HTML">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@ page import="datapro.eibs.beans.ECO105002Message"%> 

<html>
<head>
<title>Recaudos - Oficinas</title>

<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset="utf-8">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/jquery/themes/smoothness/jquery-ui.css"/> 

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery-ui-1.10.4.min.js"> </SCRIPT>


<jsp:useBean id="cdeObj" class="datapro.eibs.beans.ECO105001Message"  scope="session" />  
<jsp:useBean id="cdeObj2" class="datapro.eibs.beans.ECO105002Message"  scope="session" />
<jsp:useBean id="ECO105002ListOfic" class="datapro.eibs.beans.JBObjList" scope="session" />
 
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

</head>
 
<body>
<% 
String read = "";
String disabled = "";
String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"campo obligatorio\" align=\"bottom\" border=\"0\" >";
 	
Boolean isReadOnly = false;
if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) { 
		read = " readonly ";
		disabled = " disabled";
		isReadOnly = true;
	}
%>
 
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript">
	
function goAction(op) {
	if (op==632 || op ==633){
		//Agregar oficina o eliminar oficina
		if (document.forms[0].E02MRCORC.value=="" || document.forms[0].E02MRCORC.value=="0"){
			alert("Debe Seleccionar una Oficina para Continuar.!!");
			return;
		}
		
	}
	document.forms[0].SCREEN.value = op;
 <%if (!isReadOnly){ %>  	
	document.forms[0].Submit.disabled = true;
	document.forms[0].borrar.disabled = true;	
 <%}%>  	
	document.forms[0].Exit.disabled = true;			
	document.forms[0].submit();
}


function colocaAgencia(posi) {
	document.forms[0].E02MRCORC.value = eval("document.forms[0].E02MRCORC"+posi+".value");
	document.forms[0].E02MRCDOC.value = eval("document.forms[0].E02MRCDOC"+posi+".value");	
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
<H3 align="center">Datos Modalidad de Recaudos - Oficinas<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="collect_deal_modality_ofic_maintenance, ECO1050"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECO1050">
  
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="615">
  <INPUT TYPE=HIDDEN NAME="E02OPE" VALUE="<%= cdeObj2.getE02OPE().trim()%>">
  <INPUT TYPE=HIDDEN NAME="CurrentRow" VALUE="<%= request.getAttribute("indexVec")%>">
  <INPUT TYPE=HIDDEN NAME="E02MRCBNK" VALUE="<%= cdeObj2.getE02MRCBNK().trim()%>">
  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
             <td nowrap width="20%" align="right">Cliente: 
              </td>
             <td nowrap width="30%" align="left">
             	<input type="hidden" name="E02MRCBNK" value="<%=cdeObj.getE01COMBNK()%>">
             	<input type="text" name="E02MRCCUN" maxlength="9" size="11" value="<%=cdeObj.getE01COMCUN()%>" readonly="readonly" class="TXTRIGHT">
             </td>
             <td nowrap width="20%" align="right">Identificación:  
             </td>
             <td nowrap width="30%" align="left">
	  			<input type="text" name="E02MRCIDN" maxlength="25" size="27" value="<%=cdeObj.getE01COMIDN()%>" readonly="readonly">
             </td>
         </tr>
		<tr id="trclear"> 
             <td nowrap align="right"> Nombre: 
               </td>
             <td nowrap align="left" colspan="3">
	  			<input type="text" name="E02MRCDCL" maxlength="60" size="40" value="<%=cdeObj.getE01COMDCL()%>" readonly="readonly" class="TXTBASE">
             </td>
         </tr>                       
		<tr id="trdark"> 		
            <td nowrap align="right">Código Convenio: </td>
            <td nowrap align="left">
            	<input type="text" name="E02MRCNUM" maxlength="12" size="14" value="<%=cdeObj.getE01COMNUM()%>" readonly="readonly" class="TXTRIGHT">             	 
            </td>         
   			<td align="right">
   				Descripción del Convenio:
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
		<tr id="trdark"> 
            <td nowrap  align="right">Pais Convenio: </td>
            <td nowrap  align="left"> 
             	<eibsinput:cnofc name="cdeObj2" property="E02MRCPRC" value="<%=cdeObj2.getE02MRCPRC()%>" required="true" flag="03" fn_code="E02MRCPRC" fn_description="E02MRCDPR" readonly="true"/>
       	        <input type="text" name="E02MRCDPR" size="20" value="<%= cdeObj2.getE02MRCDPR().trim()%>" readonly>  
       	    </td>
            <td nowrap  align="right">Depto. Convenio: </td>
            <td nowrap  align="left">
				<input type="text" name="E02MRCSRC" size="5" value="<%= cdeObj2.getE02MRCSRC().trim()%>" readonly>				
           		<input type="text" name="E02MRCDSC" size="20" maxlength="2" value="<%= cdeObj2.getE02MRCDSC().trim()%>" readonly="readonly">            		
            </td>          
      	</tr>
        <tr id="trclear">
			<td nowrap  align="right">Ciudad Convenio: </td>
			<td nowrapalign="left">  
				<input type="text" name="E02MRCCRC" size="5" value="<%= cdeObj2.getE02MRCCRC().trim()%>" readonly>
           		<input type="text" name="E02MRCDRC" size="20" maxlength="2" value="<%= cdeObj2.getE02MRCDSC().trim()%>"  readonly="readonly"> 
			</td>           
            <td nowrap  align="right"> Todas Oficinas: </td>          
            <td nowrap  align="left" >  
            	 <input type="text" name="TOFIC" size="5" value="<%=("Y".equals(cdeObj2.getE02MRCIAO()))?"SI":"NO"%>" readonly>
            	 <INPUT TYPE=HIDDEN NAME="E02MRCIAO" VALUE="<%=cdeObj2.getE02MRCIAO()%>">            	
			</td>            
         </tr>          		
    </table>

 <br>

    <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">         	
			  <td nowrap width="20%" align="right">Oficina Recaudo: 
              </td>
             <td nowrap width="30%" align="left" colspan="3">             
	  			   <eibsinput:help name="brnDetails" property="E02MRCORC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH%>" 
          	    	fn_param_one="E02MRCORC" fn_param_two="document.forms[0].E02MRCBNK.value" fn_param_three="E02MRCDOC" readonly="<%=isReadOnly %>"/>
          	    	<input type="text" name="E02MRCDOC" size="20" value="" readonly>
             </td>
         </table>         
        </td>
     </tr>
    </table>
    
     <br>
     
    <table width="100%">		
	<tr>
  		<td width="30%">
  		  <div align="center"> 
  		  <%if (!isReadOnly){ %>
     		<input id="EIBSBTN" type=button name="Submit" value="Agregar" onClick="goAction(632);">
		  <%} %>     		
     	  </div>	
  		</td>
  		<td width="35%">
  		  <div align="center"> 
  		  <%if (!isReadOnly){ %>  		  
     		<input id="EIBSBTN" type=button name="borrar" value="Eliminar" onClick="goAction(633);">
		  <%} %>     		
     	  </div>	
  		</td>  		
  		<td width="30%"> 
  		  <div align="center"> 
     		<input id="EIBSBTN" type=button name="Exit" value="Regresar" onClick="goAction(600);">
     	  </div>	
  		</td>
  	</tr>
	</table>
	       <br>  
    
   <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">         	
         	<tr id="trdark"> 
	            <td nowrap align="left" colspan="4">
        	    	Lista Oficinas Validas en la Ciudad para Recepción del Recaudo:        	 
    	        </td>  
            </tr>
          <%
			ECO105002ListOfic.initRow();
				int k = 0;
				boolean firstTime = true;
				String chk = "";
				while (ECO105002ListOfic.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						//chk = "checked";
					} else {
						chk = "";
					}
					ECO105002Message convObj = (ECO105002Message) ECO105002ListOfic.getRecord();
			%>
	          <tr id="dataTable<%= ECO105002ListOfic.getCurrentRow() %>"> 
	            <td NOWRAP  align=CENTER  width="5%" >
	            	<input align="center" type="radio" name="CurrentRow" id="CurrentRow" value="<%=ECO105002ListOfic.getCurrentRow()%>" <%=chk%> class="highlight" 
	            	onClick="colocaAgencia(<%=ECO105002ListOfic.getCurrentRow()%>);" >
	            </td>
				<td nowrap align="left" width="95%" colspan="3">
					<INPUT TYPE=HIDDEN NAME="E02MRCORC<%=ECO105002ListOfic.getCurrentRow()%>" VALUE="<%=convObj.getE02MRCORC()%>">
					<INPUT TYPE=HIDDEN NAME="E02MRCDOC<%=ECO105002ListOfic.getCurrentRow()%>" VALUE="<%=convObj.getE02MRCDOC()%>">					
					<%=convObj.getE02MRCORC()%> - <%=convObj.getE02MRCDOC()%>
				</td>		
			</tr>
			<% } %>
         </table>         
        </td>
     </tr>
    </table>
    
        
        </td>
      </tr>
    </table>     
    
    <br>
    <br>


  
  </form>
</body> 

</html>
