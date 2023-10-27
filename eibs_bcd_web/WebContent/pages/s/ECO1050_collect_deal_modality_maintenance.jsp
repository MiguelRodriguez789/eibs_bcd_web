<!DOCTYPE HTML">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Mantenimiento de Ciudades Recaudos</title>

<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset="utf-8">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/jquery/themes/smoothness/jquery-ui.css"/> 

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery-ui-1.10.4.min.js"> </SCRIPT>

<jsp:useBean id="cdeObj" class="datapro.eibs.beans.ECO105001Message"  scope="session" />  
<jsp:useBean id="cdeObj2" class="datapro.eibs.beans.ECO105002Message"  scope="session" />

 
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

</head>
 
<body>
<%
String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"campo obligatorio\" align=\"bottom\" border=\"0\" >";
 %>
 
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript">
	
function goAction(op) {
	document.forms[0].SCREEN.value = op;
	document.forms[0].Submit.disabled = true;
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
<H3 align="center">Datos Modalidad de Recaudos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="collect_deal_modality_maintenance.jsp, ECO1050"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECO1050">
  
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="615">
  <INPUT TYPE=HIDDEN NAME="E02OPE" VALUE="<%= cdeObj2.getE02OPE().trim()%>">
 
 <!-- Campos ocultos -->
<INPUT TYPE=HIDDEN NAME="E02MRCCOB" VALUE="<%= cdeObj2.getE02MRCCOB().trim()%>">
<INPUT TYPE=HIDDEN NAME="E02MRCCMM" VALUE="<%= cdeObj2.getE02MRCCMM().trim()%>">
<INPUT TYPE=HIDDEN NAME="E02MRCCDD" VALUE="<%= cdeObj2.getE02MRCCDD().trim()%>">
<INPUT TYPE=HIDDEN NAME="E02MRCCYY" VALUE="<%= cdeObj2.getE02MRCCYY().trim()%>">
<INPUT TYPE=HIDDEN NAME="E02MRCCTM" VALUE="<%= cdeObj2.getE02MRCCTM().trim()%>">
<INPUT TYPE=HIDDEN NAME="E02MRCCUS" VALUE="<%= cdeObj2.getE02MRCCUS().trim()%>">
<INPUT TYPE=HIDDEN NAME="E02MRCAOB" VALUE="<%= cdeObj2.getE02MRCAOB().trim()%>">
<INPUT TYPE=HIDDEN NAME="E02MRCAMM" VALUE="<%= cdeObj2.getE02MRCAMM().trim()%>">
<INPUT TYPE=HIDDEN NAME="E02MRCADD" VALUE="<%= cdeObj2.getE02MRCADD().trim()%>">
<INPUT TYPE=HIDDEN NAME="E02MRCAYY" VALUE="<%= cdeObj2.getE02MRCAYY().trim()%>">
<INPUT TYPE=HIDDEN NAME="E02MRCATM" VALUE="<%= cdeObj2.getE02MRCATM().trim()%>">
<INPUT TYPE=HIDDEN NAME="E02MRCAUS" VALUE="<%= cdeObj2.getE02MRCAUS().trim()%>">
                                                     
        
  
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
    </table>
 
   <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

			<tr id="trclear"> 
	            <td nowrap width="15%" align="right">Pais Convenio: </td>
	            <td nowrap width="35%" align="left"> 
	             	<eibsinput:cnofc name="cdeObj2" property="E02MRCPRC" value="<%=cdeObj2.getE02MRCPRC()%>" required="true" flag="03" fn_code="E02MRCPRC" fn_description="E02MRCDPR"/>
	       	        <input type="text" name="E02MRCDPR" size="20" value="<%= cdeObj2.getE02MRCDPR().trim()%>" readonly>  
	       	    </td>
	            <td nowrap width="15%" align="right">Depto. Convenio: </td>
	            <td nowrap width="35%" align="left">
					<input type="text" name="E02MRCSRC" size="5" value="<%= cdeObj2.getE02MRCSRC().trim()%>" readonly>
					<a href="javascript:Get2FilterCodes('E02MRCSRC','E02MRCDSC','27', '',document.forms[0]['E02MRCPRC'].value)" >
              		<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" style="cursor:hand" ></a>
              		<%=mandatory%>					
            		<input type="text" name="E02MRCDSC" size="20" maxlength="2" value="<%= cdeObj2.getE02MRCDSC().trim()%>" readonly="readonly">            		
	            </td>          
	         </tr>

        <tr id="trdark">
			<td nowrap  align="right">Ciudad Convenio: </td>
			<td nowrapalign="left">  
				<input type="text" name="E02MRCCRC" size="5" value="<%= cdeObj2.getE02MRCCRC().trim()%>" readonly>
           		<a href="javascript:Get2FilterCodes('E02MRCCRC','E02MRCDRC','84', '',document.forms[0]['E02MRCSRC'].value)" >
             		<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" style="cursor:hand" ></a>
             		<%=mandatory%>					
           		<input type="text" name="E02MRCDRC" size="20" maxlength="2" value="<%= cdeObj2.getE02MRCDSC().trim()%>"  readonly="readonly"> 
			</td>           
            <td nowrap  align="right"> Todas Oficinas: </td>          
            <td nowrap  align="left" >
				<select name="E02MRCIAO" onclick="aviso(this.value)">
                    <option value="Y" <% if (cdeObj2.getE02MRCIAO().equals("Y") || cdeObj2.getE02MRCIAO().trim().equals("")) out.print("selected"); %>>Si</option>
                    <option value="N" <% if (cdeObj2.getE02MRCIAO().equals("N") ) out.print("selected"); %>>No</option>                   
                </select>                      	
            	<%=mandatory%> 
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
     		<input id="EIBSBTN" type=button name="Submit" value="Guardar" onClick="goAction(615);">
     	  </div>	
  		</td>
  		<td width="50%"> 
  		  <div align="center"> 
     		<input id="EIBSBTN" type=button name="Exit" value="Regresar" onClick="goAction(600);">
     	  </div>	
  		</td>
  	</tr>
	</table>

  
  </form>
</body> 

</html>
