<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@page import="datapro.eibs.master.Util"%>

<%@page import="com.datapro.constants.Entities"%> 

<html>
<head>
<title>Manejo Tarifas</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="datarec" class="datapro.eibs.beans.ESD052501Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBSBillsP.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>



<script type="text/javascript">

function goAction(op) {
// 	if(isValidObject(top.opener.document)){
// 		if(isValidObject(top.opener.document.forms[0]) && isValidObject(top.opener.document.forms[0]["RECALC"])){
// 			var elem = top.opener.document.forms[0]["RECALC"];
// 			elem.checked = true;
// 			if (typeof elem.onclick == "function") {
// 				elem.onclick.apply(elem);
// 			}		
// 		}
// 	}
	getElement("SCREEN").value = op;
	document.forms[0].submit();    
}

function grabGenericInfo(elem){
	
	var numberPattern = /\d+/g;
	var matches = (elem.name).match(numberPattern);
	var number = Number(matches[0]);	
	getElement("EDLFFRC"+number).value = ' ';
	getElement("EDLFBSC"+number).value = ' ';
	getElement("EDLFNPR"+number).value = '';
	getElement("EDLFCOA"+number).value = '0.0000';
	getElement("EDLFCFA"+number).value = ' ';
	getElement("EDLFSFA"+number).value = ' ';
	getElement("EDLFMIN"+number).value = '0.00';
	getElement("EDLFMAX"+number).value = '0.00';
	
	
	if(trim(elem.value) != '' ){
		getElement("EDSCCDE"+number).value = '';
		goAction("500");
	}
}

</script>

</head>

<%
  boolean readOnly = false;
  boolean newOnly = false;
  String disabled = "";
  String readonly = "";
  if (request.getParameter("readOnly") != null ){
    if (request.getParameter("readOnly").toLowerCase().equals("true")){
      readOnly=true;
      disabled="disabled";
      readonly="readonly";
    }
  }
  if (userPO.getHeader20().equals("NEW")){
    newOnly = true;
  }
%>

<body >
<%
  if (!error.getERRNUM().equals("0")) {
    error.setERRNUM("0");
    out.println("<script Language=\"Javascript\">");
    out.println("  showErrors()");
    out.println("</script>");
  }
  

	String title="";
	if (userPO.getApplicationCode().equals("10")) {
		title="para Prestamos";
	} else if (userPO.getApplicationCode().equals("43")){
		title="para Documentarias";
	} else if (userPO.getApplicationCode().equals("CONVENIO") || userPO.getApplicationCode().equals("CV")){
		title="para Convenio";				
	} else {
		title="Genericas";
	}
	
	String main="";
	if (readOnly) {
		main = "Consulta Tabla de Cargos";
 	} else if (newOnly) {		
		main = "Nueva Tabla de Cargos";
	} else {
		main = "Mantenimiento Tabla de Cargos";	
	}
%>
<script type="text/javascript">
	<%if (readOnly) { 
		if(userPO.getPurpose().equals("INQUIRY")){
			if(userPO.getSource().equals("LOAN")){
				if ( userPO.getHeader23().equals("G") ||  userPO.getHeader23().equals("V")){ %>
					 builtNewMenu(ln_i_1_opt);
				<% } else if(userPO.getHeader22().equals("CreditLines")) { %>
					 builtNewMenu(cuplus_inq_opt);
				<% } else { %>
					builtNewMenu(ln_i_2_opt);
				<% } 	
				} 
			}
		}
		%>
</script>

  <% out.println("<SCRIPT> initMenu(); </SCRIPT>");%>


<h3 align="center">
<%=main %>  <%=title %>

<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="tarifas_maintenance.jsp, ESD0525"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0525" >
  <input type="hidden" name="SCREEN" id="SCREEN" value="600">
  <input type="hidden" name="deletedRow" id="deletedRow" value="">
  <input type="hidden" name="E01DLFACD" id="E01DLFACD" value="<%= datarec.getE01DLFACD().trim()%>">

  <% int row = 0;%>
 
  <table class="tableinfo" >
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
  		 <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="10%" align=right><b>Banco :&nbsp;</b></td>
            <td nowrap width="20%">                
              <eibsinput:text name="datarec" property="E01DLFBNK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" readonly="true"/>
            </td>
            <td nowrap width="10%" align=right><b>Tipo de Producto :&nbsp;</b></td>
            <td nowrap width="20%"> 
            	<%if(datarec.getE01DLFTYP().equals("@CNV")){ %>
            		<input type="hidden" name="E01DLFTYP" id="E01DLFTYP" value="<%=datarec.getE01DLFTYP()%>" readonly maxlength="4" size="4">
            		<input type="text" name="generic" id="convenioName" value="Convenio" readonly maxlength="8" size="9">
				<%}else{%>            
              		<eibsinput:text name="datarec" property="E01DLFTYP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
            	<%}%>
            </td>
            <td nowrap width="10%"> 
              <div align="right">Codigo de Tabla :</div>
            </td>
            <td nowrap width="20%"> 
            	<%if(datarec.getE01DLFTBL().equals("@G")){ %>
					<input type="hidden" name="E01DLFTBL" id="E01DLFTBL" value="<%=datarec.getE01DLFTBL().trim()%>">
            		<input type="text" name="generic" id="generic" value="Generica" readonly maxlength="8" size="9">
            	<%}else{%>
              	<eibsinput:text name="datarec" property="E01DLFTBL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_TABLE %>" required="true" readonly="true" />
              	<% } %>
            </td>
          </tr>
		<%if(!datarec.getE01DLFCUN().equals("0")){%>
  		 <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="10%" align=right><b>Cliente :&nbsp;</b></td>
            <td nowrap width="20%">                
              <eibsinput:text name="datarec" property="E01DLFCUN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
            </td>
            <td nowrap width="10%" align=right><b>Nombre :&nbsp;</b></td>
            <td nowrap width="20%"> 
              <eibsinput:text name="datarec" property="E01CUSNA1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/>
            </td>
            <td nowrap width="10%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="20%"> 
            </td>
          </tr>
          <% } %>
        </table>
      </td>
    </tr>
  </table>

  <H4>Datos B&aacute;sicos</H4>
  <table  class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="10%"> 
              <div align="right">Descripci&oacute;n :</div>
            </td>
            <td nowrap width="40%"> 
              <eibsinput:text name="datarec" property="E01DLFDSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="true" readonly="<%=readOnly %>"/>
            </td>
            <td nowrap width="15%">  </td>
            <td nowrap width="35%">  </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>



<%if (datarec.getE01DLFACD().equals("43")) { %>

	
	  <h4>Comisiones o Impuestos</h4>
	  <table  id="mainTable" class="tableinfo" >
	    <tr height="5%"> 
	      <td NOWRAP width="100%" >
	        <table id="headTable" width="100%" >
	          <tr id="trdark"> 
			  	<th nowrap colspan="5">Informaci&oacute;n Base Para Calcular Cargo </th>
			  	<th nowrap colspan="5">Informaci&oacute;n Adicional Sobre Tabla Generica </th>
			  </tr>
	          <tr id="trdark"> 
	            <th nowrap width="5%">Cod&iacute;go</th>
	            <th nowrap width="20%">Descripcion</th>
	            <th nowrap width="10%" >Forma<br>Cobro</th>
	            <th nowrap width="10%" >Base <br>Calculo</th>
	            <th nowrap width="5%">Periodo</th>
	            <th nowrap width="10%">Valor</th>
	            <th nowrap width="10%" >Factor</th>
	            <th nowrap width="10%">Acci&oacute;n</th>
	            <th nowrap width="10%">Minimo</th>
	            <th nowrap width="10%" >Maximo</th>
	          </tr>
	        </table>
	      </td>
	    </tr>    
	    <tr height="95%">    
	      <td NOWRAP width="100%">       
	        <div id="dataDiv1" class="scbarcolor" style="overflow:auto;">
	          <table id="dataTable" width="100%" > 
	          <%
	             int limite = 15;
	             String seq;     
	             boolean isGeneric = false;            
	             for ( int i=1; i<=limite; i++ ) {
	             	seq = i + "";
	             	if(datarec.getField("EDLFCDE"+seq).getString().equals("Y")){
	             		isGeneric = true;
	             	}else{
	             		isGeneric = false;
	             	}
	          %> 
	            <tr id="trclear"> 
              	<td nowrap width="5%"> 
	                <div align="center" > 
	                  <%= seq %>	                  
	                  <%if(isGeneric){%>
		                  <input type="text" readonly name="EDLFCDE<%= seq %>" value="<%= datarec.getField("EDLFCDE"+seq).getString() %>" size="5" maxlength="4" onkeypress="enterInteger(event)">
	                  <%}else{%>
	                  <input type="text" <%=readonly%> <%=disabled%> name="EDLFCDE<%= seq %>" value="<%= datarec.getField("EDLFCDE"+seq).getString() %>" size="5" maxlength="4" onkeypress="enterInteger(event)" class="context-menu-help"  onmousedown="init(commDef,this.name,'EDSCCDE<%= seq %>');" onchange="grabGenericInfo(this);">
	                  <%}%>	                
	                  <br><%= Util.formatCell("") %>
	                </div>
	              </td>	            
	              <td nowrap width="20%"> 
	                <div align="center" > 
	                  <input type="text" name="EDSCCDE<%= seq %>" <%=isGeneric%> value="<%= datarec.getField("EDSCCDE"+seq).getString() %>" size="35" maxlength="35" readonly>
	                  <br><%= Util.formatCell("") %>
	                </div>
	              </td>
	              <td nowrap width="10%"> 
	                <div align="center"> 
	                  <select name="EDLFFRC<%=seq%>" <%=disabled%>>
	                    <option value=" " <% if (!(datarec.getField("EDLFFRC"+seq).getString().equals("A")
	                                            || datarec.getField("EDLFFRC"+seq).getString().equals("R") 
	                                            || datarec.getField("EDLFFRC"+seq).getString().equals("K") 
	                                            || datarec.getField("EDLFFRC"+seq).getString().equals("C") )) out.print("selected"); %>></option>
	                    <option value="A" <% if(datarec.getField("EDLFFRC"+seq).getString().equals("A")) out.print("selected");%>>Apertura</option>
	                    <option value="R" <% if(datarec.getField("EDLFFRC"+seq).getString().equals("R")) out.print("selected");%>>Prorroga</option>
	                    <option value="K" <% if(datarec.getField("EDLFFRC"+seq).getString().equals("K")) out.print("selected");%>>Aper/Prorr.</option>
	                    <option value="C" <% if(datarec.getField("EDLFFRC"+seq).getString().equals("C")) out.print("selected");%>>Cuotas</option>
	                  </select>
	                  <br><%= Util.formatCell("") %>
	                </div>
	              </td>
	              <td nowrap width="10%"> 
	                <div align="center"> 
	                  <select name="EDLFBSC<%=seq%>" <%=disabled%>>
	                    <option value=" " <% if (!(datarec.getField("EDLFBSC"+seq).getString().equals("O")
	                                            || datarec.getField("EDLFBSC"+seq).getString().equals("B") 
	                                            || datarec.getField("EDLFBSC"+seq).getString().equals("P") )) out.print("selected"); %>></option>
	                    <option value="O" <% if(datarec.getField("EDLFBSC"+seq).getString().equals("O")) out.print("selected");%>>Valor Original</option>
	                    <option value="B" <% if(datarec.getField("EDLFBSC"+seq).getString().equals("B")) out.print("selected");%>>Saldo Capital</option>
	                    <option value="P" <% if(datarec.getField("EDLFBSC"+seq).getString().equals("P")) out.print("selected");%>>Comision Principal</option>
	                  </select>
	                  <br><%= Util.formatCell("") %>
	                </div>
	              </td>
	              <td nowrap width="5%"> 
	                <div align="center"> 
	                  <input type="text" <%=readonly%> <%=disabled%> class="txtright" name="EDLFNPR<%= seq %>" size="4" maxlength="3"  value="<%= datarec.getField("EDLFNPR"+seq).getString()%>">
	                </div>
	              </td>
	              <td nowrap width="10%"> 
	                <div align="center"> 
	                  <input type="text" <%=readonly%> <%=disabled%> class="txtright" name="EDLFCOA<%= seq %>" size="15" maxlength="15" value="<%= datarec.getField("EDLFCOA"+seq).getString()%>">
	                  <br><div align="right">
	                  <%= !datarec.getField("EDLFCDE"+seq).getString().equals("") ? Util.formatCCY(datarec.getField("ECBSCOA"+seq).getString() + " ") : Util.formatCell("")%>
	                  </div>
	                </div>
	              </td>
	              <td nowrap width="10%"> 
	                <div align="center"> 
	                  <select name="EDLFCFA<%=seq%>" <%=disabled%>>
	                    <option value=" " <% if (!(datarec.getField("EDLFCFA"+seq).getString().equals("F")
	               							    || datarec.getField("EDLFCFA"+seq).getString().equals("P") 
	                                            || datarec.getField("EDLFCFA"+seq).getString().equals("1") )) out.print("selected"); %>></option>
	                    <option value="F" <% if(datarec.getField("EDLFCFA"+seq).getString().equals("F")) out.print("selected");%>>Valor Fijo</option>
	                    <option value="P" <% if(datarec.getField("EDLFCFA"+seq).getString().equals("P")) out.print("selected");%>>Porcentaje</option>
	                    <option value="1" <% if(datarec.getField("EDLFCFA"+seq).getString().equals("1")) out.print("selected");%>>Tasa/Periodo</option>
	                  </select>
	                  <br><%= Util.formatCell(datarec.getField("ECBSCFA"+seq).getString().equals("F") ? "Valor Fijo" : (datarec.getField("ECBSCFA"+seq).getString().equals("P") ? "Porcentaje" : datarec.getField("ECBSCFA"+seq).getString().equals("1") ? "Tasa/Periodo"  : "")) %>
	                 </div> 
	              </td>
	              <td nowrap width="10%"> 
	                <div align="center"> 
	                  <select name="EDLFSFA<%=seq%>" <%=disabled%>>
	                    <option value=" " <% if (!(datarec.getField("EDLFSFA"+seq).getString().equals("R")
	                                            || datarec.getField("EDLFSFA"+seq).getString().equals("X") 
	                                            || datarec.getField("EDLFSFA"+seq).getString().equals("D") )) out.print("selected"); %>></option>
	                    <option value="R" <% if(datarec.getField("EDLFSFA"+seq).getString().equals("R")) out.print("selected");%>>Reemplaza</option>
	                    <option value="X" <% if(datarec.getField("EDLFSFA"+seq).getString().equals("X")) out.print("selected");%>>+ o -</option>
	                    <option value="D" <% if(datarec.getField("EDLFSFA"+seq).getString().equals("D")) out.print("selected");%>>Eliminar</option>
	                  </select>
	                  <br><%= Util.formatCell("") %>
	                 </div> 
	              </td>
	              <td nowrap width="10%"> 
	                <div align="center"> 
	                  <input type="text" <%=readonly%> <%=disabled%> class="txtright" name="EDLFMIN<%= seq %>" size="15" maxlength="15" value="<%= datarec.getField("EDLFMIN"+seq).getString()%>">
	                  <br><div align="right">
	                  <%= !datarec.getField("EDLFCDE"+seq).getString().equals("") ? Util.formatCell(datarec.getField("ECBSMIN"+seq).getString() + " ") : Util.formatCell("") %>
	                  </div>
	                </div>
	              </td>
	              <td nowrap width="10%"> 
	                <div align="center"> 
	                  <input type="text" <%=readonly%> <%=disabled%> class="txtright" name="EDLFMAX<%= seq %>" size="15" maxlength="15" value="<%= datarec.getField("EDLFMAX"+seq).getString()%>">
	                  <br>
					<div align="right">	                  
	                  <%= !datarec.getField("EDLFCDE"+seq).getString().equals("") ? Util.formatCell(datarec.getField("ECBSMAX"+seq).getString() + " ") : Util.formatCell("")%>
	                 </div>
	                </div>
	              </td>
	            </tr>
	          <% } %>
	          </table>
	        </div>
	      </td>
	    </tr>   
	  </table>


<% } else if (datarec.getE01DLFACD().equals("10") || datarec.getE01DLFACD().equals("CV") ) {%>

	


	
	  <h4>Comisiones o Impuestos</h4>
	  <table  id="mainTable" class="tableinfo" >
	    <tr height="5%"> 
	      <td NOWRAP width="100%" >
	        <table id="headTable" width="100%" >
	          <tr id="trdark"> 
			  	<th nowrap colspan="5">Informaci&oacute;n Base Para Calcular Cargo </th>
			  	<th nowrap colspan="5">Informaci&oacute;n Adicional Sobre Tabla Generica </th>
			  </tr>
	          <tr id="trdark"> 
	            <th nowrap width="5%">Cod&iacute;go</th>
	            <th nowrap width="20%">Descripcion</th>
	            <th nowrap width="10%" >Forma<br>Cobro</th>
	            <th nowrap width="10%" >Base <br>Calculo</th>
	            <th nowrap width="5%">Periodo</th>
	            <th nowrap width="10%">Valor</th>
	            <th nowrap width="10%" >Factor</th>
	            <th nowrap width="10%">Acci&oacute;n</th>
	            <th nowrap width="10%">Minimo</th>
	            <th nowrap width="10%" >Maximo</th>
	          </tr>
	        </table>
	      </td>
	    </tr>    
	    <tr height="95%">    
	      <td NOWRAP width="100%">       
	        <div id="dataDiv1" class="scbarcolor" style="overflow:auto;">
	          <table id="dataTable" width="100%" > 
	          <%
	             int limite = 15;
	             String seq; 
	             boolean isGeneric = false;                
	             for ( int i=1; i<=limite; i++ ) {
	            	 seq = i + "";
	            	if(datarec.getField("ETBLGEN"+seq).getString().equals("Y")){
	             		isGeneric = true;
	             	}else{
	             		isGeneric = false;
	             	}	 
	          %> 
	            <tr id="trclear"> 
              	<td nowrap width="5%"> 
	                <div align="center" > 
	                  <%= seq %>	                  
	                  <%if(isGeneric){%>
		                  <input type="text" readonly name="EDLFCDE<%= seq %>" value="<%= datarec.getField("EDLFCDE"+seq).getString() %>" size="5" maxlength="4" >
	                  <%}else{%>
		                  <input type="text" <%=readonly%> <%=disabled%> name="EDLFCDE<%= seq %>" value="<%= datarec.getField("EDLFCDE"+seq).getString() %>" size="5" maxlength="4"  class="context-menu-help" onmousedown="init(commDef,this.name,'EDSCCDE<%= seq %>','',true);" onchange="grabGenericInfo(this);">
	                  <% } %>
	                  <br><%= Util.formatCell("") %>
	                </div>
	              </td>	            
	              <td nowrap width="20%"> 
	                <div align="center" > 
	                  <input type="text" <%=readonly%> <%=disabled%> <%=isGeneric%> name="EDSCCDE<%= seq %>" value="<%= datarec.getField("EDSCCDE"+seq).getString() %>" size="35" maxlength="35" readonly>
	                  <br><%= Util.formatCell("") %>
	                </div>
	              </td>
	              <td nowrap width="10%"> 
	                <div align="center"> 
	                  <select name="EDLFFRC<%=seq%>" <%=disabled%>>
	                    <option value=" " <% if (!(datarec.getField("EDLFFRC"+seq).getString().equals("A")
	                                            || datarec.getField("EDLFFRC"+seq).getString().equals("K") 
	                                            || datarec.getField("EDLFFRC"+seq).getString().equals("R") 
	                                            || datarec.getField("EDLFFRC"+seq).getString().equals("C") 
	                                            || datarec.getField("EDLFFRC"+seq).getString().equals("X") 
	                                            || datarec.getField("EDLFFRC"+seq).getString().equals("P")
	                                            || datarec.getField("EDLFFRC"+seq).getString().equals("4") 
	                                            || datarec.getField("EDLFFRC"+seq).getString().equals("L") )) out.print("selected"); %>></option>
	                    <option value="A" <% if(datarec.getField("EDLFFRC"+seq).getString().equals("A")) out.print("selected");%>>Apertura</option>
	                    <option value="K" <% if(datarec.getField("EDLFFRC"+seq).getString().equals("K")) out.print("selected");%>>Aper/Renova</option>
	                    <option value="R" <% if(datarec.getField("EDLFFRC"+seq).getString().equals("R")) out.print("selected");%>>Renovacion</option>
	                    <option value="C" <% if(datarec.getField("EDLFFRC"+seq).getString().equals("C")) out.print("selected");%>>Cuotas</option>
	                    <option value="X" <% if(datarec.getField("EDLFFRC"+seq).getString().equals("X")) out.print("selected");%>>Prepagos</option>
	                    <option value="P" <% if(datarec.getField("EDLFFRC"+seq).getString().equals("P")) out.print("selected");%>>Periodico</option>
	                    <option value="4" <% if(datarec.getField("EDLFFRC"+seq).getString().equals("4")) out.print("selected");%>>Aper/Cuotas</option>
	                    <option value="L" <% if(datarec.getField("EDLFFRC"+seq).getString().equals("L")) out.print("selected");%>>Aper/Period</option>
	                  </select>
	                  <br><%= Util.formatCell("") %>
	                </div>
	              </td>
	              <td nowrap width="10%"> 
	                <div align="center"> 
	                  <select name="EDLFBSC<%=seq%>" <%=disabled%>>
	                    <option value=" " <% if (!(datarec.getField("EDLFBSC"+seq).getString().equals("O")
	                                            || datarec.getField("EDLFBSC"+seq).getString().equals("B") 
	                                            || datarec.getField("EDLFBSC"+seq).getString().equals("I") 
	                                            || datarec.getField("EDLFBSC"+seq).getString().equals("T") 
	                                            || datarec.getField("EDLFBSC"+seq).getString().equals("C") 
	                                            || datarec.getField("EDLFBSC"+seq).getString().equals("P") 
	                                            || datarec.getField("EDLFBSC"+seq).getString().equals("5") 
	                                            || datarec.getField("EDLFBSC"+seq).getString().equals("7") )) out.print("selected"); %>></option>
	                    <option value="O" <% if(datarec.getField("EDLFBSC"+seq).getString().equals("O")) out.print("selected");%>>Valor Original</option>
	                    <option value="B" <% if(datarec.getField("EDLFBSC"+seq).getString().equals("B")) out.print("selected");%>>Saldo Capital</option>
	                    <option value="I" <% if(datarec.getField("EDLFBSC"+seq).getString().equals("I")) out.print("selected");%>>Saldo Teorico</option>
	                    <option value="T" <% if(datarec.getField("EDLFBSC"+seq).getString().equals("T")) out.print("selected");%>>Total Dueda</option>
	                    <option value="C" <% if(datarec.getField("EDLFBSC"+seq).getString().equals("C")) out.print("selected");%>>Valor Cuota</option>
	                    <option value="P" <% if(datarec.getField("EDLFBSC"+seq).getString().equals("P")) out.print("selected");%>>Comis. Ppal</option>
	                    <option value="7" <% if(datarec.getField("EDLFBSC"+seq).getString().equals("7")) out.print("selected");%>>Prepago Prod.</option>	                    
	                  </select>
	                  <br><%= Util.formatCell("") %>
	                </div>
	              </td>
	              <td nowrap width="5%"> 
	                <div align="center"> 
	                  <input type="text" <%=readonly%> <%=disabled%> class="txtright" name="EDLFNPR<%= seq %>" size="4" maxlength="3"  value="<%= datarec.getField("EDLFNPR"+seq).getString()%>">
	                  <br><%= Util.formatCell("") %>
	                </div>
	              </td>
	              <td nowrap width="10%"> 
	                <div align="center"> 
	                  <input type="text" <%=readonly%> <%=disabled%> class="txtright" name="EDLFCOA<%= seq %>" size="15" maxlength="15" value="<%= datarec.getField("EDLFCOA"+seq).getString()%>">
	                  <br><div align="right">
	                  <%= !datarec.getField("EDLFCDE"+seq).getString().equals("") ? Util.formatCCY(datarec.getField("ECBSCOA"+seq).getString()) +  " " : Util.formatCell("")%>
					  </div>
	                </div>
	              </td>
	              <td nowrap width="10%"> 
	                <div align="center"> 
	                  <select name="EDLFCFA<%=seq%>" <%=disabled%>>
	                    <option value=" " <% if (!(datarec.getField("EDLFCFA"+seq).getString().equals("F")
	               							    || datarec.getField("EDLFCFA"+seq).getString().equals("P") 
	                                            || datarec.getField("EDLFCFA"+seq).getString().equals("1") )) out.print("selected"); %>></option>
	                    <option value="F" <% if(datarec.getField("EDLFCFA"+seq).getString().equals("F")) out.print("selected");%>>Valor Fijo</option>
	                    <option value="P" <% if(datarec.getField("EDLFCFA"+seq).getString().equals("P")) out.print("selected");%>>Porcentaje</option>
	                    <option value="1" <% if(datarec.getField("EDLFCFA"+seq).getString().equals("1")) out.print("selected");%>>Tasa/Periodo</option>
	                  </select>
	                  <br>
	                  <%= Util.formatCell(datarec.getField("ECBSCFA"+seq).getString().equals("F") ? "Valor Fijo" : (datarec.getField("ECBSCFA"+seq).getString().equals("P") ? "Porcentaje" : datarec.getField("ECBSCFA"+seq).getString().equals("1") ? "Tasa/Periodo"  : "")) %>
	                 </div> 
	              </td>
	              <td nowrap width="10%"> 
	                <div align="center"> 
	                  <select name="EDLFSFA<%=seq%>" <%=disabled%>>
	                    <option value=" " <% if (!(datarec.getField("EDLFSFA"+seq).getString().equals("R")
	                                            || datarec.getField("EDLFSFA"+seq).getString().equals("X") 
	                                            || datarec.getField("EDLFSFA"+seq).getString().equals("D") )) out.print("selected"); %>></option>
	                    <option value="R" <% if(datarec.getField("EDLFSFA"+seq).getString().equals("R")) out.print("selected");%>>Reemplaza</option>
	                    <option value="X" <% if(datarec.getField("EDLFSFA"+seq).getString().equals("X")) out.print("selected");%>>+ o -</option>
	                    <option value="D" <% if(datarec.getField("EDLFSFA"+seq).getString().equals("D")) out.print("selected");%>>Eliminar </option>
	                  </select>
	                  <br><%= Util.formatCell("") %>
	                 </div> 
	              </td>
	              <td nowrap width="10%"> 
	                <div align="center"> 
	                  <input type="text" <%=readonly%> <%=disabled%> class="txtright" name="EDLFMIN<%= seq %>" size="15" maxlength="15" value="<%= datarec.getField("EDLFMIN"+seq).getString()%>">
	                  <br>
					<div align="right">	                  
	                  <%= !datarec.getField("EDLFCDE"+seq).getString().equals("") ? Util.formatCell(datarec.getField("ECBSMIN"+seq).getString() + " ") : Util.formatCell("") %>
	                </div>
	                </div>
	              </td>
	              <td nowrap width="10%"> 
	                <div align="center"> 
	                  <input type="text" <%=readonly%> <%=disabled%> class="txtright" name="EDLFMAX<%= seq %>" size="15" maxlength="15" value="<%= datarec.getField("EDLFMAX"+seq).getString()%>">
	                  <br>
					<div align="right">	                  
	                  <%= !datarec.getField("EDLFCDE"+seq).getString().equals("") ? Util.formatCell(datarec.getField("ECBSMAX"+seq).getString() + " ") : Util.formatCell("")%>
					</div>	               
	                </div>
	              </td>
	            </tr>
	          <% } %>
	          </table>
	        </div>
	      </td>
	    </tr>   
	  </table>


<% } %>


  
  <%if (!readOnly) { %>
  <div align="center">
    <table class="tbenter" class="tbenter">
      <tr>
        <td align="right"><input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="javascript:goAction(600)"></td>
        <td >&nbsp;</td>
	  <%  if( userPO.getSource().equals("POPUP")) { %>
        <td align="left"><input id="EIBSBTN" type=button name="Submit" value="Cancelar" onClick="window.close();"></td>
	  <% } else {  %>        
        <td align="left"><input id="EIBSBTN" type=button name="Submit" value="Cancelar" onClick="javascript:goAction(204)"></td>
	  <% } %>
      </tr>
    </table> 
  </div>
  <% } else { %>

	<%if(userPO.getSource().equals("PRODUCTS")){%>
		  <div align="center"> 
		    <input id="EIBSBTN" type=button name="Submit" value="Regresar" onClick="javascript:goAction(2100)">
		  </div>  	
	<%}else{%>
	  <%if (userPO.getHeader20().equals("APPROVAL") ) { %>
		  <div align="center"> 
		    <input id="EIBSBTN" type=button name="Submit" value="Cancelar" onClick="javascript:goAction(20)">
		  </div>  
	  <% } else if( userPO.getSource().equals("POPUP")) { %>
		  <div align="center"> 
		    <input id="EIBSBTN" type=button name="Submit" value="Cancelar" onClick="window.close();">
		  </div>	  
	  <% } else if(!userPO.getPurpose().equals("INQUIRY")){  %>
		  <div align="center"> 
		    <input id="EIBSBTN" type=button name="Submit" value="Cancelar" onClick="javascript:goAction(204)">
		  </div>     
	  <% } %>
	<% }%>
  <% } %>  

</form>

<script type="text/javascript">


</script>
  
</body>
</HTML>
