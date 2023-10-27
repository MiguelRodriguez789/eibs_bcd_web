<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EPV120501Message"%>

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Plataforma de Venta</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">

<jsp:useBean id="EPV120501List" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

  function goAction(op) {
	var ok = false;
	var cun = "";
	var pg = "";

	if (op != '200'){	//Checks something is selected
	 	for(n=0; n<document.forms[0].elements.length; n++)
	     {
	      	var element = document.forms[0].elements[n];
	      	if(element.name == "PVFFL3") 
	      	{	
	      		if (element.checked == true) {
	      			getElement("E01PVFFL3").value = element.value; 
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
      	
      	if (op =='202'){
      		confirm1 = confirm("Desea Eliminar este Registro Seleccionado?");
      	}
		if (confirm1){
			getElement("SCREEN").value = op;
			document.forms[0].submit();		
		}		

     } else {
		alert("Debe seleccionar un registro para continuar. " + element.value);	   
	 }
      
	}

function closeHiddenDivNew(){
	setVisibility(getElement("hiddenDivNew"), "hidden");
}

function showHiddenDivNew(evt) {
	evt = (evt) ? evt : ((window.event) ? window.event : "");
 	
	var hiddenDivNew = getElement("hiddenDivNew");

	var y=evt.clientY + document.body.scrollTop;
	var x=evt.clientX + document.body.scrollLeft;
     
	cancelBub(evt);

	moveElement(hiddenDivNew, y, x);
	setVisibility(hiddenDivNew, "visible");
	 
}

addEventHandler(document, 'click', closeHiddenDivNew);


</SCRIPT>  

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

<h3 align="center">Factor Carga Financiera para Plataforma de Venta<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="PVFAC_list.jsp,EPV1205"></h3>
<hr size="4">
<form method="POST"	action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1205">
<input type="hidden" name="SCREEN" value="201"> 

<div id="hiddenDivNew" class="hiddenDiv">
    <table id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
      <tr id="trdark"> 
        <td align=CENTER width="18%"> 
          <div align="right">Tipo de Deuda :</div>
        </td>
        <td align=CENTER width="34%"> 
          <select name="E01PVFFL3">          
             <option value="C" <% out.print("selected"); %>>Deuda Consumo</option>
             <option value="L" <% out.print("selected"); %>>Deuda Comercial</option>    
             <option value="H" <% out.print("selected"); %>>Deuda Hipotecaria</option>   
             <option value="1 " <% out.print("selected"); %>>Lineas de Credito Disponibles</option>   
             <option value="2" <% out.print("selected"); %>>Deuda Vencida entre 90-180</option> 
             <option value="3" <% out.print("selected"); %>>Deuda Castigada entre 180 - 3 años</option> 
             <option value="4" <% out.print("selected"); %>>Deuda Castigada &gt; 3 años</option>  
             <option value=" " <% out.print("selected"); %>> </option>                                            
          </select>         
        </td>    
      </tr>
      <tr id="trclear"> 
        <td align=center nowrap colspan="2"> 
          <input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="javascript:goAction('200')">
        </td>
      </tr>
    </table>
  </div>
 
<table class="tbenter" width="100%">
	<tr>
		<td align="center" id="eibsNew" class="tdbkg" width="20%"><b>Crear</b></td>
		<td align="center" class="tdbkg" width="20%"><a
			href="javascript:goAction('201')"> <b>Modificar</b> </a></td>
		<td align="center" class="tdbkg" width="20%"><a
			href="javascript:goAction('202')"> <b>Borrar</b> </a></td>
		<td align="center" class="tdbkg" width="20%"><a
			href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
		</td>
	</tr>
</table>

<%
	if (EPV120501List.getNoResult()) {
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

  <TABLE  id="mainTable" class="tableinfo" style="height:600px; width:1040px;">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="98%">
			<tr id="trdark">
				<th align="center" nowrap width="5%"></th>
				<th align="center" nowrap width="20%">Tipo Deuda SBIF</th>
				<th align="center" nowrap width="20%">Descripcion</th>			
				<th align="center" nowrap width="20%">Porcentaje o Factor</th>
				<th align="center" nowrap width="20%">Valor</th>							
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:600px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
		<%
			EPV120501List.initRow();
				int k = 0;
				boolean firstTime = true;
				String chk = "";
				while (EPV120501List.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
					EPV120501Message pvfac = (EPV120501Message) EPV120501List
							.getRecord();
		%>
		<tr id="dataTable<%= EPV120501List.getCurrentRow() %>">
			<td nowrap align="center" width="5%"><input type="radio" id="PVFFL3" name="PVFFL3" value="<%=pvfac.getE01PVFFL3()%>; <%=EPV120501List.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= EPV120501List.getCurrentRow() %>)"/></td>
			<td nowrap align="center" width="20%"><a href="javascript:goAction('203');"><%= pvfac.getE01PVFFL3() %></a></td>
			<td nowrap align="left" width="20%">
				  <input type="HIDDEN" name="E01PVFFL3" size="4" value="<%= pvfac.getE01PVFFL3().trim()%>">
							<% if (pvfac.getE01PVFFL3().equals("C")) out.print("     Deuda Consumo");
								 else if (pvfac.getE01PVFFL3().equals("L")) out.print("     Deuda Comercial");
			   					 else if (pvfac.getE01PVFFL3().equals("H")) out.print("     Deuda Hipotecaria");
			   					 else if (pvfac.getE01PVFFL3().equals("1")) out.print("     Lineas de Credito Disponibles");
			   					 else if (pvfac.getE01PVFFL3().equals("2")) out.print("     Deuda Vencida entre 90-180");
			   					 else if (pvfac.getE01PVFFL3().equals("3")) out.print("     Deuda Castigada entre 180 - 3 años");			   					 
			    				 else if (pvfac.getE01PVFFL3().equals("4")) out.print("     Deuda Castigada > 3 años"); %>
	 		       </TD>
			<td nowrap align="center" width="20%">
				 <input type="HIDDEN" name="E01PVFTYP" size="1" value="<%= pvfac.getE01PVFTYP().trim()%>">
							<% if (pvfac.getE01PVFTYP().equals("%")) out.print("Porcentaje");
								 else if (pvfac.getE01PVFTYP().equals("F")) out.print("Factor");
  			    			     else out.print(" "); %>
	 		  </td>			
			<td nowrap align="center" width="20%"><a href="javascript:goAction('203');"><%=Util.formatCell(pvfac.getE01PVFFAC())%></a></td>	
		</tr>
		<%
			}
		%>
             </table>
             </div>
             </td>
             </tr>
</table>


<table class="tbenter" width="98%" align="center">
	<tr>
		<td width="50%" align="left">
		<%
			if (EPV120501List.getShowPrev()) {
					int pos = EPV120501List.getFirstRec() - 13;
					out
							.println("<A HREF=\""
									+ request.getContextPath()
									+ "/servlet/datapro.eibs.client.JSEPV1205?SCREEN=100&codNum="
									+ request.getAttribute("codNum")
									+ "\"><IMG border=\"0\" src=\""
									+ request.getContextPath()
									+ "/images/s/previous_records.gif\" ></A>");
				}
		%>
		</td>
		<td width="50%" align="right">
		<%
			if (EPV120501List.getShowNext()) {
					int pos = EPV120501List.getLastRec();
					out
							.println("<A HREF=\""
									+ request.getContextPath()
									+ "/servlet/datapro.eibs.client.JSEPV1205?SCREEN=100&codNum="
									+ request.getAttribute("codNum")
									+ "\"><IMG border=\"0\" src=\""
									+ request.getContextPath()
									+ "/images/s/previous_records.gif\" ></A>");
				}
		%>
		</td>
	</tr>
</table>
<%
	}
%>
</form>
<SCRIPT type="text/javascript">
	showChecked("PVFFL3");
 	getElement("hiddenDivNew").onclick=cancelBub;
	getElement("eibsNew").onclick=showHiddenDivNew;  
</SCRIPT>
</body>
</html>

