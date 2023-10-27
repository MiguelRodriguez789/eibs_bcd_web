<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EGL001001Message"%>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Transacciones Contables</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link Href="<%=request.getContextPath()%>/fonts/css/font-awesome.min.css" rel="stylesheet">

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id="batchTotal" class="datapro.eibs.beans.EGL001002Message"  scope="session" /> 
<jsp:useBean id="batchList" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<script src="<%=request.getContextPath()%>/jquery/deleteLocalAuthorization.jsp"> </script>

<style>
.tooltip.top .tooltip-inner{
	background-color: #47639C!important;
}
.tooltip.top .tooltip-arrow {
	background-top-color: #47639C!important;
}
.tooltip.right .tooltip-inner {
	background-color: #47639C!important;
	border-right-color: #47639C!important;
}

.tooltip.right .tooltip-arrow {
	border-right-color: #47639C!important;
}

.tooltip.left .tooltip-inner {
	background-color: #47639C!important;
	border-left-color: #47639C!important;
}

.tooltip.left, .tooltip-arrow {
	border-left-color: #47639C!important;
}

.fa-sm{
    -webkit-transform: scale(0.75,0.75);
    -ms-transform: scale(0.75,0.75);
    transform: scale(0.75,0.75);
    vertical-align: middle;
} 

.tooltip.top-left .tooltip-inner {
	background-top-color: #47639C!important;
	background-color: #47639C!important;
}

.tooltip.top-left .tooltip-arrow {
	background-top-color: #47639C!important;

}
.tooltip.top-right .tooltip-inner {
	background-top-color: #47639C!important;
}

</style>


<script type="text/javascript">

function goAction(op) {
	if (op == '204') {
		if (confirm("Desea eliminar este registro seleccionado?")) {
			getElement("SCREEN").value = op;
			document.forms[0].submit();		
		}
	} else if (op === '218') {
		exeReport(op);
		
	} else if (op == '200' || op == '210'){
			getElement("SCREEN").value = op;
			document.forms[0].submit();		
	} else if (op == '201' || op == '202'){
		if (op =='201') {				
			var url = "<%=request.getContextPath()%>/servlet/datapro.eibs.accounting.JSEGL0010?SCREEN="+ op;		
		} else  {				
			url = "<%=request.getContextPath()%>/servlet/datapro.eibs.accounting.JSEGL0010?SCREEN="+ op + "&key=" + getElementChecked('key').value;		
		}	
		CenterWindow(url, 1100, 300, 2);		
	}
}

function exeReport(screenVal){
	$.ajax({
	    type: "post", 
		data : $('form').serialize(),
		url : "${pageContext.request.contextPath}/servlet/datapro.eibs.accounting.JSEGL0010?SCREEN=" + screenVal,
		beforeSend : function(){ addWaitCursor();},
		success: function(data,text){ 
			reportResponse(data,text);
		},
		error: function(request, status, error){
			responseError(request, status, error, flgSelector);
		},
		complete: function(){ removeWaitCursor();}
	});		
}

function reportResponse(data, text){
	if(typeof data !== 'object'){
		data = $.parseJSON(""+data);
	}
	if (data.type == "ERROR") {
		showErrors();
	} else {
		alert("Reporte proccesado, ver la Bandeja de Impresion");
	}
}

function responseError(request, status, error, flg){
	scriptLog("Request Error: " + String(error));
}	


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

<h3 align="center"> Transacciones Contables 
<%if (userPO.getSource().equals("1")){ %>
	- Sin Aprobacion
<%} else { %>
	- Pendiente de Aprobacion
<% } %>
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="transaction_batch_list.jsp,EGL0010"></h3>
<hr size="4">
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.accounting.JSEGL0010">
<input type="hidden" id="SCREEN" name="SCREEN" value="2"> 

 <table  class="tableinfo" style="height: 25px">
    <tr id="trdark">   
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="trdark">
             <td nowrap width="10%" align="right"> Numero de Lote : 
              </td>
             <td nowrap width="20%" align="left">
            	  <eibsinput:text name="batchTotal" property="E02SELBTH" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BATCH %>" readonly="true"/>    
             </td>
             <td nowrap width="10%" align="right">  
             </td>
             <td nowrap width="20%"align="left">
             </td>
             <td nowrap width="15%" align="right"> Total Debitos (Moneda Base) : 
               </td>
             <td nowrap width="25%"align="left">
            	  <eibsinput:text name="batchTotal" property="E02TOTDEB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
             </td>
         </tr>
          <tr id="trdark">
             <td nowrap width="10%" align="right"> Banco Origen : 
              </td>
             <td nowrap width="20%" align="left">
            	  <eibsinput:text name="batchTotal" property="E02SELOBK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" readonly="true"/>    
             </td>
             <td nowrap width="10%" align="right"> Usuario Operador : 
             </td>
             <td nowrap width="20%"align="left">
            	  <eibsinput:text name="batchTotal" property="H02USERID" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_USER %>" readonly="true"/>    
             </td>
             <td nowrap width="15%" align="right"> Total Credito (Moneda Base) : 
               </td>
             <td nowrap width="25%"align="left">
            	  <eibsinput:text name="batchTotal" property="E02TOTCRE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
             </td>
         </tr>
          <tr id="trdark">
             <td nowrap width="10%" align="right"> Sucursal Origen : 
              </td>
             <td nowrap width="20%" align="left">
            	  <eibsinput:text name="batchTotal" property="E02SELOBR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>" readonly="true"/>    
             </td>
             <td nowrap width="10%" align="right"> Fecha Valor :  
             </td>
             <td nowrap width="20%"align="left">
				  <eibsinput:date name="batchTotal" fn_year="E02SELVDY" fn_month="E02SELVDM" fn_day="E02SELVDD" readonly="true"/>
             </td>
             <td nowrap width="15%" align="right"> Total de Transacciones : 
               </td>
             <td nowrap width="25%"align="left">
            	  <eibsinput:text name="batchTotal" property="E02NUMREC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BATCH_SEQ %>" readonly="true"/>    
             </td>
         </tr>
        </table>
      </td>
    </tr>
  </table>
  
<table class="tbenter" width="100%" height="10%">
	<tr>
      <% if( "1".equals( currUser.getH01WK1() ) ){ %>
	      <td class=TDBKG width="25%"> 
	        <div align="center"><a href="javascript:goAction(203)"><b>Consultar</b></a></div>
	      </td>     
      <% } else { %>

		<td align="center" class="tdbkg" width="15%">
			<a href="javascript:goAction('201')"> <b>Crear</b> </a>
		</td>
		<% if (!(batchList.getNoResult())) { %>
		<td align="center" class="tdbkg" width="15%">
			<a href="javascript:goAction('202')"> <b>Modificar</b> </a>
		</td>
		<td align="center" class="tdbkg" width="15%">
			<a href="javascript:goAction('204')"> <b>Borrar</b> </a>
		</td>
		<td align="center" class="tdbkg" width="15%">
			<a href="javascript:goAction('210')"> <b>Cuadratura</b></a>
		</td>
		<td align="center" class="tdbkg" width="15%">
			<a href="javascript:goAction('218')"> <b>Reporte</b></a>
		</td>
		<td width="15%" nowrap="nowrap">
		<div align="left">
			<b>Secuencia :</b>
       	    <eibsinput:text name="batchTotal" property="E02SELSEQ" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BATCH_SEQ %>" />    
	            <a><img id="sendsequence" src="<%=request.getContextPath()%>/images/ico3.gif" title=". . ." align="bottom" border="0" ></a> 
		</div>
		</td>

		<% }
        }
		%>
	</tr>
</table>


<% if (batchList.getNoResult()) { %>
<table class="tbenter" width=100% height=80%>
	<tr>
		<td>
		<div align="center">
			<font size="3">
				<b> Lote Contable sin Transacciones </b>
			</font>
		</div>
		</td>
	</tr>
</table>

<% } else {
%>

<table  id="mainTable" class="tableinfo" style="max-height:380px;">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="100%">
			<tr id="trdark">
				<th align="center" nowrap width="5%">&nbsp;</th>
				<th align="left" nowrap width="5%">Sec.</th>
				<th align="center" nowrap width="18%">Cuenta Contable</th>
				<th align="center" nowrap width="10%">Referencia</th>
				<th align="left" nowrap width="5%">Centro<br>Costos</th>
				<th align="left" nowrap width="5%">Cod <br>Trn</th>
				<th align="left" nowrap width="30%">Descripcion </th>
				<th align="center" nowrap width="10%">Debito</th>
				<th align="center" nowrap width="10%">Credito</th>
			</tr>
        </table>
      </td>
    </tr>    
    <tr  height="95%">    
	    <td nowrap="nowrap">      
	       <div id="dataDiv1" style="height:400px; overflow:auto;"> 
	      	 <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
				<%
					batchList.initRow();
						int k = 0;
						boolean firstTime = true;
						String chk = "";
						while (batchList.getNextRow()) {
							if (firstTime) {
								firstTime = false;
								chk = "checked";
							} else {
								chk = "";
							}
							EGL001001Message list = (EGL001001Message) batchList.getRecord();
				%>
				<tr id="dataTable<%= batchList.getCurrentRow() %>">
					<td nowrap align="center" width="5%">
						<input type="radio" name="key" value="<%=batchList.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= batchList.getCurrentRow() %>)"/>
					</td>
					<td nowrap align="left" width="5%">
						<%=list.getE01SEQ()%>
					</td>
					<td nowrap align="left" width="18%">
						<%=list.getE01BNK()%>-<%=list.getE01BRN()%>-<%=list.getE01CCY()%>-<a aria-hidden="true"  trigger="hover" container="body" title="<%= "Cuenta Contable : \n" + list.getE01GLMDSC() %>"> <%=list.getE01GLN()%></a>
					</td>
					<td nowrap align="right" width="10%">
						<%if(!"0".equals(list.getE01ACC().trim())) {%> 
							<a aria-hidden="true"  trigger="hover" container="body" title="<%= "Cliente : \n" + list.getE01CUSNA1() %>"> <%=list.getE01ACC()%> </a>						
						<% } %>	
					</td>
					<td nowrap align="right" width="5%">
						<%=list.getE01CCN()%>
					</td>
					<td nowrap align="left" width="5%">
						<%=list.getE01TCD()%>
					</td>
					<td nowrap align="left" width="30%">
						<%=list.getE01TDS() %>
						<%if(!"".equals(list.getE01DSC().trim())) {%> 
							<i class="fa fa-plus-square" aria-hidden="true"  placement="right" trigger="hover" container="body" title="<%= "Descripcion Adicional : \n" + list.getE01DSC() %>" ></i>
						<% } %>	
					</td>
					<%if (list.getE01DCC().equals("D")) { %>
					<td nowrap align="right" width="10%">
						<%=list.getE01AMT()%>
					</td>
					<td nowrap align="right" width="10%"></td>
					<%} else { %>					
					<td nowrap align="right" width="10%"></td>
					<td nowrap align="right" width="10%">
						<%=list.getE01AMT()%>
					</td>
					<% } %>
				</tr>
				<% } %>
             </table>
           </div>
       </td>
    </tr>
</table>
<TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
	<TR>
		<TD WIDTH="50%" ALIGN=LEFT height="25">
		<%
        if ( batchList.getShowPrev() ) {
  			int pos = 0; int seq = 0; int numrec = 0;
 
  			batchList.initRow();
  			pos = 0;
  			EGL001001Message row = (EGL001001Message) batchList.get(pos);
  			seq = row.getBigDecimalE01SEQ().intValue() + 50;
			numrec = row.getBigDecimalE01NUMREC().intValue() - 50;

  			if(numrec > 0){
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.accounting.JSEGL0010?SCREEN=200&E01SEQ=" + seq  + "&E01NUMREC=" + numrec  + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
  			}
  		}
		%>
		</TD>
		<TD WIDTH="50%" ALIGN=RIGHT height="25">
		<%       
        if ( batchList.getShowNext() ) {
  			int pos = 0; int seq = 0; int numrec = 0;
  			
        	batchList.initRow();
        	pos = batchList.size()-1;
        	batchList.initRow();
  			EGL001001Message row = (EGL001001Message) batchList.get(pos);
  			seq = row.getBigDecimalE01SEQ().intValue() -1;
			numrec = row.getBigDecimalE01NUMREC().intValue();
			
  			if(seq > 0){
  				out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.accounting.JSEGL0010?SCREEN=200&E01SEQ=" + seq + "&E01NUMREC=" + numrec  + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
  			}
        }%>
		</TD>
	</TR>
</TABLE>

<% } %>	
</form>
<SCRIPT type="text/javascript">
function registerEventListner(){
	$('#sendsequence').click(function(){
		window.location.href = 	"${pageContext.request.contextPath}/servlet/datapro.eibs.accounting.JSEGL0010?SCREEN=300&E01SEQ=" + $('#E02SELSEQ').val() + "&E01NUMREC=0";		
	});
}

$(document).ready(function(){
	registerEventListner();		
	showChecked("key");
	$('.fa-info-circle').tooltip({placement:'right'});
});
</SCRIPT>
</body>
</html>

