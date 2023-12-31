<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%> 
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.ECO105002Message"%> 

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Listado de Ciudades Validas para Recaudos</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="ECO105002List" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="cdeObj" class="datapro.eibs.beans.ECO105001Message"  scope="session" /> 
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
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
<script type="text/javascript">

  function goAction(op) {
	var ok = false;
	var cun = "";
	var pg = "";
	var num = '0';
	
	if (op != '610'){	//Checks something is selected except new 
	 	for(n=0; n<document.forms[0].elements.length; n++)
	     {
	      	var element = document.forms[0].elements[n];
	      	if(element.name == "CurrentRow") 
	      	{	
	      		if (element.checked == true) {
	      			num =  element.value;
        			ok = true;
        			break;
				}
	      	}
	      }
      } else {
      	ok = true;
      }
      
      if ( ok ) {
      	var confirm1 = true;
      	
      	if (op =='xxx'){// ventana emergente luego borrar
    		var pg = document.forms[0].action + "?SCREEN=400&E01COSNUM=" + document.forms[0].E01COSNUM.value;
		    CenterWindow(pg,600,500,2);
      	} else {
      		//por si es borrar
      		if (op =='620'){
      			confirm1 = confirm("Desea Eliminar Ciudad de Modalidad de Recaudo?");
      		}
      		if (op =='630'){//Validacion solo para oficinas
      			var indOfi= eval("document.forms[0].TOF"+num+".value");
      			if (indOfi=="Y"){
      				alert("Indico Todas Oficinas, No Puede Ingresar esta opcion!!!");
      				confirm1 = false;
      			}
      		}
      		if (confirm1){
				document.forms[0].SCREEN.value = op;
				document.forms[0].submit();		
			}
      	}

     } else {
		alert("Debe seleccionar una Modalidad para continuar.");	   
	 }
      
	}
	
  function goActionDocuments() {
	var ok = false;
	var cun = "";
	var pg = "";
	var cosnum = '0';
	
	 	for(n=0; n<document.forms[0].elements.length; n++)
	    {
	      	var element = document.forms[0].elements[n];
	      	if(element.name == "CurrentRow") 
	      	{	
	      		if (element.checked == true) {
        			ok = true;
        			cosnum =  element.value;
        			break;
				}
	      	}
	     }
      
      if ( ok ) {
      	var url_doc = '<%=request.getContextPath()%>/pages/s/EFRM000_pdf_form.jsp?SCREEN=1&OPE_CODE=85&CUST_NUMBER='+document.forms[0].cusNum.value+'&REQ_NUMBER='+cosnum;
      	getPdfForms(url_doc);
     } else {
		alert("Debe seleccionar un convenio para continuar.");	   
	 }
      
	}	
</script>

</head>

<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<h3 align="center">Lista Convenios de Recaudos<img
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" title="collect_deal_modality_list.jsp,ECO1050"></h3>
<hr size="4">
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECO1050">

<input type="hidden" name="SCREEN" value="200"> 

 <table  class="tableinfo">
    <tr id="trdark">   
      <td nowrap> 
			<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
		          <tr id="trdark">
		             <td nowrap width="20%" align="right">Cliente: 
		              </td>
		             <td nowrap width="30%" align="left">
			  			<eibsinput:text name="cdeObj" property="E01COMCUN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
		             </td>
		             <td nowrap width="20%" align="right">Identificaci�n:  
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
		            <td nowrap align="right">C�digo Convenio: </td>
		            <td nowrap align="left">
		            	<input type="text" name="E01COMNUM" maxlength="12" size="14" value="<%=cdeObj.getE01COMNUM()%>" readonly="readonly" class="TXTRIGHT">         	 
		            </td>         
		   			<td align="right">
		   				Descripci�n del<br>Convenio:
		   			</td>            
					<td nowrap align="left">
						<input type="text" name="E01COMDCO" maxlength="60" size="50" value="<%=cdeObj.getE01COMDCO()%>" readonly="readonly" class="TXTBASE">				
					</td>		
				</tr>				
		    </table>        
      </td>
    </tr>
  </table>
  
<table class="tbenter" width="100%">
	<tr>
		<td align="center" class="tdbkg" width="20%">
		<%if (!isReadOnly){ %>
			<a href="#" onclick="goAction('610')"> <b>Crear</b> </a>
		<%} %>
		</td>
		<td align="center" class="tdbkg" width="20%">
		<%if (!isReadOnly){ %>		
			<a href="javascript:goAction('620')"> <b>Borrar</b> </a>
		<%} %>			
		</td>	
		<td align="center" class="tdbkg" width="20%">
			<a href="javascript:goAction('630')"> <b>Oficinas</b> </a>
		</td>				
		<td align="center" class="tdbkg" width="20%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
		</td>			
	</tr>
</table>

<% if (ECO105002List.getNoResult()) { %>
<TABLE class="tbenter" width=100% height="50%" border="0">
	<TR>
		<TD>
			<div align="center"><font size="3"><b> No hay resultados que correspondan a su criterio de b�squeda. </b></font>
			</div>
		</TD>
	</TR>
</TABLE>
<% } else { %>
   <TABLE  id="mainTable" class="tableinfo" style="height:400px;">
   <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="100%">
			<tr id="trdark">
				<th align="center" nowrap width="5%">&nbsp;</th>
				<th align="center" nowrap width="25%">Pais</th>
				<th align="center" nowrap width="25%">Departamento</th>
				<th align="center" nowrap width="25%">Ciudad</th>
				<th align="center" nowrap width="20%">Ind. Todas Oficinas</th>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:400px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
		<%
			ECO105002List.initRow();
				int k = 0;
				boolean firstTime = true;
				String chk = "";
				while (ECO105002List.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
					ECO105002Message convObj = (ECO105002Message) ECO105002List.getRecord();
		%>
          <tr id="dataTable<%= ECO105002List.getCurrentRow() %>"> 
            <td NOWRAP  align=CENTER  width="5%" ><input type="radio" name="CurrentRow" id="CurrentRow" value="<%=ECO105002List.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= ECO105002List.getCurrentRow() %>)" ></td>
			<td nowrap align="center" width="25%" ><%=convObj.getE02MRCDPR()%></td>
			<td nowrap align="center" width="25%" ><%=convObj.getE02MRCDSC()%></td>
			<td nowrap align="center" width="25%" ><%=convObj.getE02MRCDRC()%></td>
			<td nowrap align="center" width="20%" >
			<%="Y".equals(convObj.getE02MRCIAO())?"Si":"No"%>			
			<input type="hidden" name="TOF<%=ECO105002List.getCurrentRow()%>" value="<%=convObj.getE02MRCIAO()%>">
			</td>			
		</tr>
		<% } %>
             </table>
             </div>
             </td>
             </tr>
</table>


<table class="tbenter" width="98%" align="center">
	<tr>
		<td width="50%" align="left">
		<%
			if (ECO105002List.getShowPrev()) {
					int pos = ECO105002List.getFirstRec() - 13;
					out.println("<A HREF=\""
									+ request.getContextPath()
									+ "/servlet/datapro.eibs.client.JSECO1050?SCREEN=600&customer_number="
									+ request.getAttribute("customer_number")
									+ "\"><IMG border=\"0\" src=\""
									+ request.getContextPath()
									+ "/images/s/previous_records.gif\" ></A>");
				}
		%>
		</td>
		<td width="50%" align="right">
		<%
			if (ECO105002List.getShowNext()) {
					int pos = ECO105002List.getLastRec();
					out.println("<A HREF=\""
									+ request.getContextPath()
									+ "/servlet/datapro.eibs.client.JSECO1050?SCREEN=600&customer_number="
									+ request.getAttribute("customer_number")
									+ "\"><IMG border=\"0\" src=\""
									+ request.getContextPath()
									+ "/images/s/previous_records.gif\" ></A>");
				}
		%>
		</td>
	</tr>
</table>

<SCRIPT type="text/javascript">
 	showChecked("CurrentRow");
</SCRIPT>

<% } %>
</form>

</body>
</html>
