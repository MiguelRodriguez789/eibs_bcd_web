<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%><html>
<head>
<title>Codigos de Referencia</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="refCodes" class="datapro.eibs.beans.ESD003002Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
builtHPopUp();

function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
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


<H3 align="center">C&oacute;digos de Referencia del Sistema <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cnof_accounting_groups_details.jsp, ESD0030"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0030" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
   <INPUT TYPE=HIDDEN NAME="E02CNOBNK" value="<%= currUser.getE01UBK()%>">
  <h4>Informaci&oacute;n B&aacute;sica</h4>
  
 <% int row = 0;%>  
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%"> 
              <div align="right">Clasificaci&oacute;n :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E02CNOCFL" readonly size="3" maxlength="2" value="<%= refCodes.getE02CNOCFL().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="23"> 
              <div align="right">C&oacute;digo :</div>
            </td>
            <td nowrap height="23"> 
              <div align="left"> 
                <input type="text" name="E02CNORCD" size="6" maxlength="4" value="<%= refCodes.getE02CNORCD().trim()%>">
              </div>
            </td>
          </tr>
          
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="23"> 
              <div align="right">Descripci&oacute;n :</div>
            </td>
            <td nowrap height="23"> 
              <div align="left"> 
                <input type="text" name="E02CNODSC" size="36" maxlength="35" value="<%= refCodes.getE02CNODSC().trim()%>" >
              </div>
            </td>
          </tr>
         
<%--         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="23"> 
              <div align="right">Máscara :</div>
            </td>
            <td nowrap height="23"> 
              <div align="left"> 
                <input type="text" name="E02CNORUT" size="30" maxlength="25" value="<%= refCodes.getE02CNORUT().trim()%>" >
              </div>
            </td>
          </tr>   --%>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="23"> 
              <div align="right">Longitud de la Identidad (1-25) :</div>
            </td>
            <td nowrap height="23"> 
              <div align="left"> 
              	<eibsinput:text property="E02CNODCC" name="refCodes" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="2" size="3" onchange="validateValue();"/>
              </div>
            </td>
          </tr> 
            
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="23"> 
              <div align="right">Tipo de Identidad :</div>
            </td>
            <td nowrap height="23"> 
                <select name="E02CNODCB" id="E02CNODCB">
                  <option value="A" <%if (refCodes.getE02CNODCB().equals("A")) { out.print("selected"); }%>>Alfanum&eacute;rico</option>
                  <option value="N" <%if (refCodes.getE02CNODCB().equals("N")) { out.print("selected"); }%>>Num&eacute;rico</option>
                </select>
            </td>
          </tr>                         
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="19">
              <div align="right">Digito de Verificaci&oacute;n :</div>
            </td>
            <td nowrap height="19">
              <div align="left">
                <select name="E02CNOF01">
                  <option value="" <%if (refCodes.getE02CNOF01().equals("")) { out.print("selected"); }%>>No Aplica</option>
                  <option value="0" <%if (refCodes.getE02CNOF01().equals("0")) { out.print("selected"); }%>>M&oacute;dulo 10</option>
                  <option value="1" <%if (refCodes.getE02CNOF01().equals("1")) { out.print("selected"); }%>>M&oacute;dulo 11</option>
                  <option value="C" <%if (refCodes.getE02CNOF01().equals("C")) { out.print("selected"); }%>>Versi&oacute;n Chile RUT</option>
                  <option value="A" <%if (refCodes.getE02CNOF01().equals("A")) { out.print("selected"); }%>>Versi&oacute;n Chile Cta/Cte</option>
                </select>
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="19">
              <div align="right">Tipo de Persona :</div>
            </td>
            <td nowrap height="19">
              <div align="left">
                <select name="E02CNOF03">
                  <option value="" <%if (refCodes.getE02CNOF03().equals("")) { out.print("selected"); }%>>No Aplica</option>
                  <option value="1" <%if (refCodes.getE02CNOF03().equals("1")) { out.print("selected"); }%>>Empresas</option>
                  <option value="2" <%if (refCodes.getE02CNOF03().equals("2")) { out.print("selected"); }%>>Personas</option>
                  <option value="3" <%if (refCodes.getE02CNOF03().equals("3")) { out.print("selected"); }%>>Cualquiera</option>
                </select>
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="19">
              <div align="right">Códigos de Proveedor de Lista de Control :</div>
            </td>
            <td nowrap height="19">
              <div align="left">
					<input type="text" id="E02CNOMIC" name="E02CNOMIC" maxlength="6" size="7" value="<%= refCodes.getE02CNOMIC().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="19">
              <div align="right">Identidad Requiere Template :</div>
            </td>
             <td nowrap="nowrap" width="19%"> 
              <input type="radio" name="E02CNOF04" id="E02CNOF04" value="Y" <%if (!refCodes.getE02CNOF04().equals("N")) out.print("checked"); %>>
              S&iacute; 
              <input type="radio" name="E02CNOF04" id="E02CNOF04" value="N" <%if (refCodes.getE02CNOF04().equals("N")) out.print("checked"); %>>
              No 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="19">
              <div align="right">Validar Identidad Divisi&oacute;n 1 :</div>
            </td>
             <td nowrap="nowrap" width="19%"> 
              <input type="radio" name="E02CNOF05" id="E02CNOF05" value="Y" <%if (!refCodes.getE02CNOF05().equals("N")) out.print("checked"); %>>
              S&iacute; 
              <input type="radio" name="E02CNOF05" id="E02CNOF05" value="N" <%if (refCodes.getE02CNOF05().equals("N")) out.print("checked"); %>>
              No 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="19">
              <div align="right">Validar Identidad Divisi&oacute;n 2 :</div>
            </td>
             <td nowrap="nowrap" width="19%"> 
              <input type="radio" name="E02CNOF06" id="E02CNOF06" value="Y" <%if (!refCodes.getE02CNOF06().equals("N")) out.print("checked"); %>>
              S&iacute; 
              <input type="radio" name="E02CNOF06" id="E02CNOF06" value="N" <%if (refCodes.getE02CNOF06().equals("N")) out.print("checked"); %>>
              No 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="19">
              <div align="right">Validar Identidad Divisi&oacute;n 3 :</div>
            </td>
             <td nowrap="nowrap" width="19%"> 
              <input type="radio" name="E02CNOF07" id="E02CNOF07" value="Y" <%if (!refCodes.getE02CNOF07().equals("N")) out.print("checked"); %>>
              S&iacute; 
              <input type="radio" name="E02CNOF07" id="E02CNOF07" value="N" <%if (refCodes.getE02CNOF07().equals("N")) out.print("checked"); %>>
              No 
            </td>
          </tr>
          
        </table>
      </td>
    </tr>
  </table>
  <h4>&nbsp;</h4>  
  <div align="center">
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>
  
  <script type="text/javascript">
  	function validateValue(){
  		var longitude = getElement("E02CNODCC");
  		var valid = false;
  		
  		if(parseInt(longitude.value) > 25 || parseInt(longitude.value) < 0){
			alert("Error en la Longitud");
			longitude.focus();
			longitude.select();
  		} else {
  			valid = true;
  		}
  		return valid;
  	}
  	

  	addEventHandler(document, 'DOMContentLoaded', function() {
  		//Submit
  	    addEventHandler(getElement('EIBSBTN'), 'click', function(e) {
  	    	e.preventDefault();
  	    	
  	    	if(validateValue()){
  	    		submitForm();  	    		
  	    	}
  	    });
  	});
  </script>
  
  </form>
</body>
</html>
