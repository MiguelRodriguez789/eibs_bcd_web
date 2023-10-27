<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="datapro.eibs.master.*" %>
<%@ page import="datapro.eibs.beans.*" %>
<%@ page import="com.datapro.constants.EibsFields" %>
<%@ page import="java.math.*" %>

<html>
<head>
<title>Manejo Tarifas</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="header" class="datapro.eibs.beans.ESD052502Message" scope="session" />
<jsp:useBean id="ESD052501List" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/graphical.js"> </SCRIPT>

<script type="text/javascript">

function goActionOld(op,row) {
  if ((op != '200') && (!isValidObject(getElement("key")))) {
    alert("Debe seleccionar un registro.");
    return;
  }
	clickElement("key", row);
  
  if ((op == '202') || (op == '300')) {
    if (op == '202') chk = confirm("Desea eliminar el registro seleccionado?");
    if (op == '300') chk = confirm("Desea desmarcar el registro seleccionado?");
    if (!chk) return;
      getElement("SCREEN").value = op;
      document.forms[0].submit(); 
  } else {
    var url = "<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0525?SCREEN="+op;
    if (op == '200') url += "&E01DLSTBL=" + getElement('E01DLSTBL').value;
    if (op != '200') url += "&key=" + getElementChecked('key').value;
    CenterWindow(url, 1000, 500, 2);        
  }
}

function goAction(op,row) {
  if ((op != '200') && (!isValidObject(getElement("key")))) {
    alert("Debe seleccionar un registro.");
    return;
  }
  clickElement("key", row);
  if ((op == '202') || (op == '300')) {
    if (op == '202') chk = confirm("Desea eliminar el registro seleccionado?");
    if (op == '300') chk = confirm("Desea desmarcar el registro seleccionado?");
    if (op == '203') chk = "checked";
    if (!chk) return;
      getElement("SCREEN").value = op;
      document.forms[0].submit(); 
  } else {
    getElement("SCREEN").value = op;
    document.forms[0].submit(); 
  }
}

function closeHiddenDiv(){
  setVisibility(getElement("hiddenDivNew"), "hidden");
}

function showHiddenDiv(evt) {
  evt = (evt) ? evt : ((window.event) ? window.event : "");
  var hiddenDivNew = getElement("hiddenDivNew");
  var y = evt.clientY + document.body.scrollTop;
  var x = evt.clientX + document.body.scrollLeft;
  cancelBub(evt);
  moveElement(hiddenDivNew, y, x);
  setVisibility(hiddenDivNew, "visible");
}

addEventHandler(document, 'click' , closeHiddenDiv);

</script>

</head>

<body>
<% 
  if ( !error.getERRNUM().equals("0")  ) {
    error.setERRNUM("0");
    out.println("<SCRIPT Language=\"Javascript\">");
    out.println("  showErrors()");
    out.println("</SCRIPT>");
  }


	String title="";
	if (userPO.getApplicationCode().equals("10")) {
		title="para Prestamos";
	} else if (userPO.getApplicationCode().equals("43")){
		title="para Documentarias";
	} else if (userPO.getApplicationCode().equals("CONVENIO")){
		title="para Convenio";			
	} else {
		title="Genericas";
	}
	userPO.setSource("");

%>

<h3 align="center">Mantenimiento Tabla de Cargos <%=title %><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="tarifas_list.jsp, ESD0525"></h3>
<hr size="4">
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0525">
  <input type="hidden" name="SCREEN" id="SCREEN" value="201">
     
  <div id="hiddenDivNew" class="hiddenDiv">
    <table id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
      border-color: #0b23b5;
      border-style : solid solid solid solid;
      width: 50%;
      filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
      <tr id="trclear">  
        <td align=CENTER width="18%"> 
          <div align="right">Banco :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" name="DLSBNK" size="4" maxlength="2" value="<%=header.getE02DLFBNK().trim()%>" readonly>
          </div>
        </td>
      </tr>
      <tr id="trclear">  
        <td align=CENTER width="18%"> 
          <div align="right">Tipo de Producto :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <%if(header.getE02DLFTYP().equals("@CNV")){ %>
            	<input type="hidden" name="E02DLFTYP" id="E02DLFTYP" value="<%=header.getE02DLFTYP()%>" readonly maxlength="4" size="4">
            	<input type="text" name="generic" id="convenioName" value="Convenio" readonly maxlength="8" size="9">
			<%}else{%>            
	            <input type="text" name="DLSATY" size="4" maxlength="4" value="<%=header.getE02DLFTYP().trim()%>" readonly>
            <%}%>          
          </div>
        </td>
      </tr>
     <%if(!header.getE02DLFTYP().equals("@CNV")) { %>
      <tr id="trclear">  
        <td align=CENTER width="18%"> 
          <div align="right">Cliente :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" name="DLSCUN" size="9" maxlength="9" value="<%=header.getE02DLFCUN().trim()%>" readonly>
          </div>
        </td>
      </tr>
      <tr id="trclear" <%if(!ESD052501List.isEmpty()) out.println("style=\" display : none\"");%>>  
        <td align=CENTER width="18%" > 
          <div align="right">Tabla Gen&eacute;rica :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="checkbox" id="GENERIC_CHECKBOX" <%if(ESD052501List.isEmpty()) out.println("checked");%> onchange="sendGeneric(this);">
          </div>
        </td>
      </tr>      
      <% } %>
      <tr id="trclear">  
        <td align=CENTER width="18%" nowrap="nowrap"> 
          <div align="right">C&oacute;digo de Tabla :</div>
        </td>
        <td align=CENTER width="34%" nowrap="nowrap"> 
          <div align="left"> 
            <input type="text" id="DLSTBL" name="E01DLSTBL" size="4" maxlength="2" <%if(ESD052501List.isEmpty() && !header.getE02DLFTYP().equals("@CNV")) out.println("readonly");%>>
          </div>
        </td>
      </tr>
      <tr id="trclear">  
        <td align=center nowrap colspan="2"> 
          <input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="javascript:goAction(200)">
        </td>
      </tr>
    </table>
  </div>

  <table class="tableinfo" >
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
	      <tr id="trdark">  
            <td nowrap width="20%" align=right><b>Banco :&nbsp;</b></td>
            <td nowrap width="30%">                
              <eibsinput:text name="header" property="E02DLFBNK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" readonly="true"/>
            </td>
            <td nowrap width="20%" align=right><b>Tipo de Producto :&nbsp;</b></td>
            <td nowrap width="30%"> 
	            <%if(header.getE02DLFTYP().equals("@CNV")){ %>
	            	<input type="hidden" name="E02DLFTYP" id="E02DLFTYP" value="<%=header.getE02DLFTYP()%>" readonly maxlength="4" size="4">
	            	<input type="text" name="generic" id="convenioName" value="Convenio" readonly maxlength="8" size="9">
				<%}else{%>            
              		<eibsinput:text name="header" property="E02DLFTYP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
	            <%}%>  
            </td>
          </tr>
		<%if(!header.getE02DLFCUN().equals("0") ){%>
	      <tr id="trclear">  
            <td nowrap width="20%" align=right><b>Cliente :&nbsp;</b></td>
            <td nowrap width="30%">                
              <eibsinput:text name="header" property="E02DLFCUN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
            </td>
            <td nowrap width="20%" align=right><b>Nombre :&nbsp;</b></td>
            <td nowrap width="30%"> 
              <eibsinput:text name="header" property="E02CUSNA1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/>
            </td>
          </tr>
          <% } %>
        </table>
      </td>
    </tr>
  </table>
  
  <table class="tbenter" width="100%">
    <tr>
      <td align="center" class="tdbkg" width="20%"><div id="eibsNew" align="center" style="cursor:pointer"><a><b>Crear</b></a></div></td> 
      <td align="center" class="tdbkg" width="20%"><div align="center"><a href="javascript:goAction(201)"><b>Modificar</b></a></div></td>
      <td align="center" class="tdbkg" width="20%"><div align="center"><a href="javascript:goAction(202)"><b>Borrar</b></a></div></td> 
      <td align="center" class="tdbkg" width="20%"><div align="center"><a href="javascript:goAction(203)"><b>Consultar</b></a></div></td>
      <td align="center" class="tdbkg" width="20%"><div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div></td>
    </tr>
  </table>
  
  <table id="mainTable" class="tableinfo" width="100%">
    <tr > 
      <td NOWRAP valign="top" width="100%"> 
        <table id="headTable" width="100%">
          <tr id="trdark">
            <th align="center" nowrap width="10%">SEL</th>            
            <th align="center" nowrap width="10%">CODIGO</th>
            <th align="center" nowrap width="60%">DESCRIPCION</th>
          </tr>
        </table>
      </td>
    </tr>
    <tr >    
      <td nowrap="nowrap">      
        <div id="dataDiv1" style="overflow:auto;"> 
          <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
          <% 
             ESD052501List.initRow();
             int k = 0;
             boolean firstTime = true;
             String chk = "";
             while (ESD052501List.getNextRow()) {
               if (firstTime) {
                 firstTime = false;
                 chk = "checked";
               } else {
                 chk = "";
               }
             ESD052501Message record = (ESD052501Message) ESD052501List.getRecord();
          %>
            <tr id="dataTable<%= ESD052501List.getCurrentRow() %>">
              <td nowrap align="center" width="10%"><input type="radio" id="key" name="key" value="<%=ESD052501List.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= ESD052501List.getCurrentRow() %>)"/></td>
              <td nowrap align="center" width="10%"><a href="javascript:goAction('201',<%=ESD052501List.getCurrentRow()%>)"><% if(record.getE01DLFTBL().equals("@G")){ %>Generico
              																			 <% }else{ %> <%=record.getE01DLFTBL()%><% } %></a></td>
              <td nowrap align="left"   width="60%"><a href="javascript:goAction('201',<%=ESD052501List.getCurrentRow()%>)"><%=record.getE01DLFDSC()%></a></td>
            </tr>
          <% } %>
          </table>
        </div>
      </td>
    </tr>
  </table>
 
</form>

<SCRIPT type="text/javascript">
<% if (!ESD052501List.getNoResult()) { %>
  showChecked("key");
<% } %>
  getElement("hiddenDivNew").onclick = cancelBub;
  getElement("eibsNew").onclick = showHiddenDiv;
  
  function sendGeneric(that){
  	if(isValidObject(getElement("GENERIC_CHECKBOX"))){
	  	if(that.checked){
	  		getElement("E01DLSTBL").readOnly = true;
	  		getElement("E01DLSTBL").value = '@G';
	  	}else{
	    	getElement("E01DLSTBL").readOnly = false;
	  		getElement("E01DLSTBL").value = '';	
	  	}
  	}
  }

sendGeneric(getElement("GENERIC_CHECKBOX"));  
</SCRIPT>

</body>
</html>
