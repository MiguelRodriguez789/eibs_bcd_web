<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.ESG010504Message"%>

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Listado de Polizas de Seguros</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">

<jsp:useBean id="ESG010504List" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>	
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery-1.7.2.js"> </script>

<script type="text/javascript">


$(function(){
		$("#radio_key").attr("checked", false);
	
});


function pad(num, size) {
    var s = num+"";
    while (s.length < size) s = "0" + s;
    return s;
}

function goAction(op){
	var ok = false;	
    var fol = "";
 
    for(n=0; n<document.forms[0].elements.length; n++)
     {
     	var elementName= document.forms[0].elements[n].name;
     	if(elementName == "key") 
     	{
			if (document.forms[0].elements[n].checked == true) {
      			ok = true;
      			fol = document.forms[0].elements[n].value;
      			//alert(fol);
      			break;
			}
     	}
     }  

			if(ok && op=='402'){
				 var pg = "${pageContext.request.contextPath}/servlet/datapro.eibs.client.JSESG0010I?SCREEN=402&key="+fol;
 				CenterWindow(pg,700,600,2); 
			}

		else if (ok && op=='403'){
	

var folio=pad(fol,15-fol.length);
	var ruta = "http://shvisados1pr-01/virtualfile/vf_renuncias/despliege.asp?valor="+folio;
	CenterWindow(ruta,700,600,2); 
		}
	
			 else 
				alert("Debe seleccionar un Retracto");	 

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

<h3 align="center">Consulta de Seguros Retractados<img
	
	
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" ALT="PAC_Inq_seguros_list.jsp,ESG0010"></h3>
<hr size="4">
<form method="POST"
	action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESG0010I">
<input type="hidden" name="SCREEN" value="402"> 
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr class="trdark">
             <td nowrap width="10%" align="right"> Cliente : 
              </td>
             <td nowrap width="10%" align="left">
	  			<eibsinput:text name="userPO" property="cusNum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
             </td>
             <td nowrap width="10%" align="right"> Nombre : 
               </td>
             <td nowrap width="50%"align="left">
	  			<eibsinput:text name="userPO" property="cusName" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" readonly="true"/>
             </td>
             <td nowrap width="10%" align="right">Identificación :  
             </td>
             <td nowrap width="10%" align="left">
	  			<eibsinput:text name="userPO" property="ID" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" readonly="true"/>
             </td>
         </tr>
        </table>
      </td>
    </tr>
  </table>


	

<%
	if (ESG010504List.getNoResult()) {
%>
<table class="tbenter" width=100% height=90%>
	<tr>
		<td>
		<div align="center">
			<font size="3">
				<b> No hay resultados que correspondan a su criterio de búsqueda. </b>
			</font>
		</div>
		</td>
	</tr>
</table>
<%
	} else {
%> 
	<table class="tbenter" width="100%" height="10%">
		<tr>
			<td colspan="4"  align="center" id="eibsNew" class="tdbkg" width="25%">
			<a href="javascript:goAction('402')"> <b>Reimprimir</b> </a>
		    </td>
		    <td colspan="4"  align="center" id="eibsNew" class="tdbkg" width="25%">
			<a href="javascript:goAction('403')"> <b>Ver Formulario</b> </a>
		    </td>
		</tr>
	</table>


	<table  class="tableinfo"  width="100%">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="100%">	
		<tr id="trdark">
			<th align="center" nowrap></th>
			<th align="center" nowrap>Folio</th>
			<th align="center" nowrap>Cuenta</th>
			<th align="center" nowrap>Compañía</th>
			<th align="center" nowrap>Seguro</th>
			<th align="center" nowrap>Fecha</th>	
			<th align="center" nowrap>Prima</th>
			<th align="center" nowrap>Devolución</th>
			<th align="center" nowrap>Sucursal</th>	
			<th align="center" nowrap>Ejecutivo</th>	
		</tr>
		</table>
		</td>									
		</tr>
	  <tr  height="95%">    
	    <td nowrap="nowrap">       
	       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">     		
		<%
			ESG010504List.initRow();
				boolean firstTime = true;
				String chk = "";
				String fol = "";
				int flg = 0; 
				
				while (ESG010504List.getNextRow()) {
			
			
			        ESG010504Message convObj = (ESG010504Message) ESG010504List.getRecord();
			
				    if (firstTime) {
						firstTime = false;
						chk = "";
						fol = convObj.getE04SREFOL();
					} else {
						chk = "";
					}
					
		
			 if (!fol.equals(convObj.getE04SREFOL())) {
               flg = 0; 
               fol = convObj.getE04SREFOL();
		     }
		
		
		%>
		<tr id="detTable<%= ESG010504List.getCurrentRow() %>">
			<td nowrap>
			<%if ( flg == 0) { %>
			<input type="radio" name="key"
				value="<%=convObj.getE04SREFOL()%>" <%=chk%>  class="highlight" onClick="highlightRow('detTable', <%= ESG010504List.getCurrentRow() %>)">
			<% } %>
			</td>
			
			<td nowrap align="right">
				<%=Util.formatCell(convObj.getE04SREFOL())%>
			</td>

			<td nowrap align="right">
				<%=Util.formatCell(convObj.getE04SREPAC())%>
			</td>

			<td nowrap align="left">
				<%=Util.formatCell(convObj.getE04DSCCIA())%>
			</td>

			<td nowrap align="left">
				<%=Util.formatCell(convObj.getE04SREDCO())%>
			</td>
				
			<td nowrap align="center">
				<%=Util.formatCell(Util.formatCustomDate(currUser.getE01DTF(),
											convObj.getBigDecimalE04SREFRM().intValue(),
											convObj.getBigDecimalE04SREFRD().intValue(),
											convObj.getBigDecimalE04SREFRY().intValue())+"-" + Util.getTimeFromTimestamp(convObj.getE04SREHRT() ).substring(0,5)) %>
			</td>
			
			<td nowrap align="right">
				<%=Util.formatCCY(convObj.getE04SREMTP())%>
			</td>
			
			<td nowrap align="right">
				<%=Util.formatCCY(convObj.getE04SRESOC())%>
			</td>
			
			<td nowrap align="center">
				<%=Util.formatCell(convObj.getE04SREBRN())%>
			</td>
			
			<td nowrap align="center">
				<%=Util.formatCell(convObj.getE04SREOFI())%>
			</td>
	
		</tr>
		<%
			flg = 1;
	
			}
		%>
	</table>
	</td>
	</tr>
	</table>

 <br>

<%
	}
%>
</form>

</body>
</html>

