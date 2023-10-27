<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>


<%@page import="com.datapro.constants.Entities"%>
<html>
<head>
<title>Evaluación de Convenio</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="cnvObj" class="datapro.eibs.beans.ECO001003Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>

<script type="text/javascript">

function cerrarVentana(){
	window.open('','_parent','');
	window.close();
}
 
 </script>
</head>

<%
	boolean readOnly=false;
	boolean maintenance=false;
%> 
          
<%
	// Determina si es solo lectura
	if (request.getParameter("readOnly") != null ){
		if (request.getParameter("readOnly").toLowerCase().equals("true")){
			readOnly=true;
		} else {
			readOnly=false;
		}
	}
%>
<body>
<%
	if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors();");
		//out.println("    cerrarVentana();");
		out.println("</SCRIPT>");
	}
%>

<h3 align="center">
<%if (readOnly){ %>
	CONSULTA DE
<%} %>
EVALUACION DE CONVENIO <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="convenant_evaluation_inq.jsp, ECO0010"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECO0010" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="303">
  <input type=HIDDEN name="E03COSBNK"  value="<%= cnvObj.getE03COSBNK().trim()%>">
  <input type=HIDDEN name="E03COSCCU"  value="<%= cnvObj.getE03COSCCU().trim()%>">
 
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr>
             <td nowrap width="20%" align="right"> Empleador: 
              </td>
             <td nowrap width="30%" align="left">
	  			<eibsinput:text name="cnvObj" property="E03COSECU" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
             </td>
             <td nowrap width="20%" align="right">Identificación:  
             </td>
             <td nowrap width="30%" align="left">
	  			<eibsinput:text name="cnvObj" property="E03EMPIDN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" readonly="true"/>
             </td>
         </tr>
          <tr>
             <td nowrap align="right"> Solicitud Nro: 
              </td>
             <td nowrap align="left">
	  			<eibsinput:text name="cnvObj" property="E03COSNUM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true"/>
             </td>
             <td nowrap align="right">  
             	Nombre: 
             </td>
             <td nowrap align="left">
					<eibsinput:text name="cnvObj" property="E03EMPNME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" readonly="true"/>             
             </td>
         </tr>
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
				<eibsinput:text name="cnvObj" property="E03COSCCU" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>"  readonly="true" />
          </td>
            <td width="15%"> 
              <div align="right">Nombre :</div>
            </td>
            <td width="35%"> 
	  			<eibsinput:text name="cnvObj" property="E03CONNME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/>
            </td>
          </tr>

          <tr id="tclear"> 
            <td width="15%"> 
              <div align="right">Identificación :</div>
            </td>
            <td width="35%"> 
	  			<eibsinput:text name="cnvObj" property="E03CONIDN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" readonly="true"/>
            </td>
            <td width="15%"> 
            </td>
            <td width="50%" align="left"> 
	      </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>  
  
  <h4>Descuentos</h4>
    
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
        	<% 
        	for (int i = 1; i<=9 ; i++){
        	%>
        	<tr id="trdark"> 
	            <td width="50%" > 
	              <div align="right">Descuento número <%=i%>:</div>
	            </td>
	            <td width="50%">             
	            	<input type="text" name="<%="E03COSDS"+i%>" size="3" maxlength="2" value="<%= cnvObj.getField("E03COSDS"+i)%>" <% if (readOnly)out.print(" readonly"); %>> 				
					<input type="text" name="<%="D03COSDS"+i%>" size="35" maxlength="30" value="<%= cnvObj.getField("D03COSDS"+i)%>" readonly="readonly">              
	          	</td>            
          	</tr>
        	<%
        	}
        	 %>          
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Rebajas</h4>
    
   <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
        	<% 
        	for (int i = 1; i<=9 ; i++){
        	%>
        	<tr id="trdark"> 
	            <td width="50%" > 
	              <div align="right">Rebaja número <%=i%>:</div>
	            </td>
	            <td width="50%" >             
	            	<input type="text" name="<%="E03COSRB"+i%>" size="3" maxlength="2" value="<%= cnvObj.getField("E03COSRB"+i)%>" <% if (readOnly)out.print(" readonly"); %>> 					
					<input type="text" name="<%="D03COSRB"+i%>" size="35" maxlength="30" value="<%= cnvObj.getField("D03COSRB"+i)%>" readonly="readonly" >   
	          	</td>            
          	</tr>
        	<%
        	}
        	 %>          
        </table>
      </td>
    </tr>
  </table> 
  <h4>Autorización Empleador </h4>
    
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

          <tr id="trdark"> 
            <td width="15%" > 
              <div align="right">Ingreso :</div>
            </td>
            <td width="35%" > 
	  			<input type="checkbox" disabled="disabled" name="E03COSASL" value="Y" <%if (cnvObj.getE03COSASL().equals("Y")){out.print(" checked");}; %>/>Liquidación Sueldo <br>
  			  	<input type="checkbox" disabled="disabled" name="E03COSASO" value="Y" <%if (cnvObj.getE03COSASO().equals("Y")){out.print(" checked");}; %>/>Solicitud<br>
  			  	<input type="checkbox" disabled="disabled" name="E03COSACR" value="Y" <%if (cnvObj.getE03COSACR().equals("Y")){out.print(" checked");}; %>/>Certificado<br>
          	</td>
            <td width="15%"> 
              <div align="right">Crédito :</div>
            </td>
            <td width="35%"> 
	  			<input type="checkbox" disabled="disabled" name="E03COSPSL" value="Y" <%if (cnvObj.getE03COSPSL().equals("Y")){out.print(" checked");}; %>/>Liquidación Sueldo <br>
  			  	<input type="checkbox" disabled="disabled" name="E03COSPSO" value="Y" <%if (cnvObj.getE03COSPSO().equals("Y")){out.print(" checked");}; %>/>Solicitud<br>
  			  	<input type="checkbox" disabled="disabled" name="E03COSPCR" value="Y" <%if (cnvObj.getE03COSPCR().equals("Y")){out.print(" checked");}; %>/>Certificado<br>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="15%"> 
              <div align="right">Tipo Autorización :</div>
            </td>
            <td width="35%"> 
	  			<input type="checkbox" disabled="disabled" name="E03COSFRM" value="Y" <%if (cnvObj.getE03COSFRM().equals("Y")){out.print(" checked");}; %>/>Firma Autorizada <br>
  			  	<input type="checkbox" disabled="disabled" name="E03COSTBR" value="Y" <%if (cnvObj.getE03COSTBR().equals("Y")){out.print(" checked");}; %>/>Timbre Autorizado<br>
  			  	<input type="checkbox" disabled="disabled" name="C03COSOTH" value="Y" <%if (cnvObj.getC03COSOTH().equals("Y")){out.print(" checked");}; %>/>Otra
  			  	<eibsinput:text name="cnvObj" property="E03COSOTH" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="<%=readOnly%>"/>
            </td>
            <td width="15%" > 
            </td>
            <td width="35%" >  		        
	        </td>
          </tr>
         </table>
      </td>
    </tr>
  </table>
  
  <h4>Observaciones </h4>
    
    <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td> 
            	<textarea cols="88" rows="5" name="E03COSEDS" readonly="readonly"><%= cnvObj.getE03COSEDS().trim()%></textarea>             
            </td>                       
          </tr>          
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Firmas </h4>
    
    <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td> 
            	<textarea cols="88" rows="5" name="E03COSADS" readonly="readonly"><%= cnvObj.getE03COSADS().trim()%></textarea>             
            </td>                       
          </tr>          
        </table>
      </td>
    </tr>
  </table>
       <div align="center"> 
           <input id="EIBSBTN" type="button" name="Cerrar" value="Cerrar" onclick="javascript:cerrarVentana();">
       </div>       
  </form>
</body>
</HTML>
