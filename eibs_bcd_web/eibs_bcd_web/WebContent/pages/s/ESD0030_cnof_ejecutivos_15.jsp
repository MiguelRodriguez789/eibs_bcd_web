<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>


<%@page import="com.datapro.constants.Entities"%> 

<html>
<head>
<title>Codigos de Referencia</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="refCodes" class="datapro.eibs.beans.ESD003002Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

</head>

<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
%>

<h3 align="center">
Códigos de Referencia del Sistema - <%=userPO.getHeader6()%> <%=userPO.getHeader7()%>
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cnof_ejecutivos_15.jsp, ESD0030"></H3>

<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0030" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" ID="SCREEN" VALUE="600">
  <h4>Información Básica</h4>

 <% int row = 0;%>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" align="right">Clasificación : </td>
            <td nowrap  align="left"> 
                <input type="text" name="E02CNOCFL" id="E02CNOCFL" size="3" maxlength="2" value="<%= refCodes.getE02CNOCFL().trim()%>" readonly>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%"  align="right">Código : </td>
            <td nowrap  align="left"> 
				<% if ( !userPO.getPurpose().equals("NEW") ) { %>
                <input type="text" name="E02CNORCD" id="E02CNORCD" size="6" maxlength="4" value="<%= refCodes.getE02CNORCD().trim()%>" readonly>
				<% } else { %>
                <input type="text" name="E02CNORCD" id="E02CNORCD" size="6" maxlength="4" value="<%= refCodes.getE02CNORCD().trim()%>">
				<% } %>
                 <eibsinput:text name="refCodes" property="E02CNODSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" />
            </td>
          </tr>
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" align="right">Segmento : </td>
            <td nowrap align="left"> 
                <eibsinput:cnofc name="refCodes" property="E02CNOCPC" required="false" flag="S5" fn_code="E02CNOCPC" fn_description="" />
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" align="right">Fuerza Comercial : </td>
            <td nowrap  align="left"> 
                <eibsinput:cnofc name="refCodes" property="E02CNOUS1" required="false" flag="TB" fn_code="E02CNOUS1" fn_description="" />
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" align="right">Zona GEO : </td>
            <td nowrap align="left"> 
                <eibsinput:cnofc name="refCodes" property="E02CNOUS3" required="true" flag="LG" fn_code="E02CNOUS3" fn_description="" />
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" align="right">Dirección E-Mail : </td>
             <td nowrap align="left">  
                 <eibsinput:text name="refCodes" property="E02CNOEML" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EMAIL%>" />
               </td>
           </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" align="right">Identificación : </td>
             <td nowrap align="left">  
                 <eibsinput:text name="refCodes" property="E02CNORUT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION%>" />
               </td>
           </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<td nowrap width="16%" align="right">Telefono : </td> 
				<td nowrap align="left">
    	             <eibsinput:text name="refCodes" property="E02CNOPHN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE%>" />
				</td>
			</tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<td nowrap width="16%" align="right">Extension:</td> 
				<td nowrap align="left">
    	             <eibsinput:text name="refCodes" property="E02CNOPXT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="5" maxlength="4" />
				</td>
			</tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<td nowrap width="16%" align="right">Centro de Costos:</td> 
				<td nowrap align="left">
	 		        <eibsinput:help name="refCodes" property="E02CNOCCN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_COST_CENTER %>" fn_param_one="E02CNOCCN" fn_param_two="document.getElementById('E02CNOBNK').value" />
				</td>
			</tr>
		  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<td nowrap width="16%" align="right">Cargo : </td> 
				<td nowrap align="left">
					<eibsinput:cnofc name="refCodes" property="E02CNOUS2" required="false" flag="TL" fn_code="E02CNOUS2" fn_description="" />
				</td>
			</tr>	
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<td nowrap width="16%" align="right">Supervisor:</td> 
				<td nowrap align="left">
					<% if (refCodes.getE02CNOCFL().trim().equals("15") ) { %> 
		                <eibsinput:cnofc name="refCodes" property="E02CNOSUP" required="false" flag="15" fn_code="E02CNOSUP" fn_description="" />
					<% } else { %>
		                <eibsinput:cnofc name="refCodes" property="E02CNOSUP" required="false" flag="CA" fn_code="E02CNOSUP" fn_description="" />
					<% } %>
				</td>
			</tr>
			
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<td nowrap width="16%" align="right">Banco:</td> 
				<td nowrap align="left">
    	             <eibsinput:text name="refCodes" property="E02CNOBNK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK%>" />
				</td>
			</tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<td nowrap width="16%" align="right">Agencia:</td> 
				<td nowrap align="left">
		            <eibsinput:help name="refCodes" property="E02CNOBRN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH%>" 
 	         	    	fn_param_one="E02CNOBRN" fn_param_two="document.getElementById('E02CNOBNK').value" />
				</td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" align="right">Estado : </td>
            <td nowrap > 
               <select name="E02CNOIVA" id="E02CNOIVA">
                    <option value=" " <% if (!(refCodes.getE02CNOIVA().equals("A")||refCodes.getE02CNOIVA().equals("I"))) out.print("selected"); %>> 
                    </option>
                    <option value="A" <% if (refCodes.getE02CNOIVA().equals("A")) out.print("selected"); %>>Activo</option>
                    <option value="I" <% if (refCodes.getE02CNOIVA().equals("I")) out.print("selected"); %>>Inactivo</option>                   
                  </select>
	        </td>	             
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="19" align="right">Tipo de Estado : </td>
            <td nowrap align="left"> 
                <eibsinput:cnofc name="refCodes" property="E02CNOTYP" required="false" flag="ET" fn_code="E02CNOTYP" fn_description="" />
            </td>
          </tr>
		</table>
      </td>
    </tr>
  </table>

  <p align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </p>

<h4>Información de Auditoria</h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Usuario Creador : </td>
            <td nowrap align="left" width="35%">
            	<%= refCodes.getE02CNALB1()%>
			</td>
            <td nowrap width="15%" align="right">Usuario último Cambio : </td>
            <td nowrap width="35%" align="left">
            	<%= refCodes.getE02CNALB3()%>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" align="right">Fecha / Hora - Creación : </td>
			<td nowrap width="35%" align="left">
				<%= refCodes.getE02CNALB2()%>
            </td>
            <td nowrap width="15%" align="right">Fecha / Hora - Cambio : </td>
			<td nowrap width="35%" align="left"> 
            	<%= refCodes.getE02CNALB4()%>
			</td>
          </tr>
        </table> 
      </td>  
    </tr>
  </table>
 </form>
</body>
</html>
