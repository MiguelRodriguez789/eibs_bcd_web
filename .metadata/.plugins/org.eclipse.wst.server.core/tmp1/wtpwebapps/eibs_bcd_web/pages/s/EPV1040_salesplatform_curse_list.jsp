<%@ page import="datapro.eibs.beans.EPV104001Message"%>
<%@ page import="datapro.eibs.master.Util"%>

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<head>
<title>Plataforma de Venta</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="EPV104001List" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>

<script type="text/javascript">


  function goAction(op) {
	var ok = false;
	
    for(n=0; n<document.forms[0].elements.length; n++)
     {
     	var elementName= document.forms[0].elements[n].name;
     	if(elementName == "key") 
     	{
			if (document.forms[0].elements[n].checked == true) {
      			ok = true;
      			break;
			}
     	}
     }      
     if ( ok ) { 
		getElement("SCREEN").value = op;
						  					
		if (op == '900'){	//Inquiry
			dir = "<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1040?SCREEN="+getElement('SCREEN').value+
				  "&key="+getElement("keysel").value;			
			CenterWindow(dir,780,500,2);
		} else {
			document.forms[0].submit();	
		}
		
     } else {
		alert("Debe seleccionar un convenio para continuar.");	   
	 }
		
	}

  
 function showAddInfo(idxRow){
    getElement("keysel").value=idxRow;
     
   tbAddInfo.rows[0].cells[1].style.color="#d0122c";   
   tbAddInfo.rows[0].cells[1].innerHTML=getElement("TXTDATA"+idxRow).value;//extraInfo(getElement("TXTDATA"+idxRow).value,4);
 
   		for ( var i=0; i<getElement("dataTable").rows.length; i++ ) {
       		getElement("dataTable").rows[i].className = "trnormal";
    	}
   		getElement("dataTable").rows[idxRow].className = "trhighlight";

   }
      
   
 function extraInfo(textfields,noField) {
	 var pos=0
	 var s= textfields;
	 for ( var i=0; i<noField ; i++ ) {
	   pos=textfields.indexOf("<br>",pos+1);
	  }
	 s=textfields.substring(0,pos);
	 return(s);
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

<h3 align="center">Plataforma de Venta<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="salesplatform_curse_list.jsp,EPV1040"></h3>

<hr size="4">
<form method="POST"
	action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1040">
<input type="hidden" name="SCREEN" id="SCREEN" value="200"> 
<input type="hidden" name="keysel" id="keysel" value="">
<input type="hidden" name="totalRow" id="totalRow" value="">
<input type="hidden" name="selected_customer" id="selected_customer" >


<table class="tbenter" width=100% align=center>
	<tr>
		<td class=TDBKG width="35%">
			<div align="center"><a href="javascript:goAction('200')" id="linkApproval"><b>Cursar</b></a></div>
		</td>
		<td class=TDBKG width="35%">
			<div align="center"><a href="javascript:goAction('300')" id="linkReject"><b>Rechazar</b></a></div>
		</td>
		<td class=TDBKG width="30%">
		<div align="center"><a
			href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
		</td>
	</tr>
</table>

<% 
 int k = 0;
	if (EPV104001List.getNoResult()) {
%>
<TABLE class="tbenter" width=100% height=90%>
	<TR>
		<TD>
		<div align="center"><font size="3"><b> No hay Operaciones pendientes de Curse. </b></font></div>
		</TD>
	</TR>
</TABLE>
<%
	} else {
%>
 <TABLE  id="mainTable" class="tableinfo" style="height:400px; width:1000px;">
 <tr height="5%">
	<td NOWRAP valign="top" width="80%">
  		<TABLE id="headTable" width="100%" >
		  <TR id="trdark"> 
				<th align="center" nowrap width="5%"></th>
				<th align="center" nowrap width="10%">N&uacute;mero</th>
				<th align="center" nowrap width="35%">Cliente</th>
				<th align="center" nowrap width="10%">Emision</th>
				<th align="center" nowrap width="10%">Monto prestamo</th>
				<th align="center" nowrap width="10%">Monto Liquido</th>

    		</TR>
    		</table>
    		</td>
  		<TD nowrap ALIGN="RIGHT" valign="top" width="20%">
	        <Table id="tbAddInfoH"  width="100%" >
	        <tr id="trdark">
	            <TH ALIGN=CENTER nowrap > Informaci&oacute;n B&aacute;sica</TH>
	        </tr>
	      	</Table>
  		</TD>
    	</tr>	
  	<TR height="95%"> 
    	<TD NOWRAP valign="top" width="80%">
			  	<div id="dataDiv1" style=" height:400px; overflow:auto;">  
			    <table id=dataTable cellspacing="0" cellpadding="1" border="0" >
			<%
				EPV104001List.initRow();
					k = 0;
					boolean firstTime = true;
					String chk = "";
					while (EPV104001List.getNextRow()) {
						if (firstTime) {
							firstTime = false;
							chk = "checked";
						} else {
							chk = "";
						}
						EPV104001Message convObj = (EPV104001Message) EPV104001List
								.getRecord();
			%>
          <tr id="dataTable<%= EPV104001List.getCurrentRow() %>"> 
            <td NOWRAP  align=CENTER width="5%"><input type="radio" name="key" id="key" value="<%=k%>; <%= EPV104001List.getCurrentRow() %>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= EPV104001List.getCurrentRow() %>); showAddInfo(<%=k%>); //setValue('<%=convObj.getE01PVDNUM()%>')" ></td>
				<td nowrap align="center" width="10%"><a href="javascript:goAction('900');"><%= Util.formatCell(convObj.getE01PVDNUM())%></a></td>
				<td nowrap align="left" width="35%"><a href="javascript:goAction('900');"><%= Util.formatCell(convObj.getE01CUSNA1())%></a></td>
				<td nowrap align="center" width="10%"><a href="javascript:goAction('900');"><%=Util.formatCell(convObj.getE01PVDODD() + "/" + convObj.getE01PVDODM() + "/"+ convObj.getE01PVDODY())%></a></td>
				<td nowrap align="right" width="10%"><a href="javascript:goAction('900');"><%= Util.formatCell(convObj.getE01PVDOAM())%></a></td>
				<td nowrap align="right" width="10%"><a href="javascript:goAction('900');"><%= Util.formatCell(convObj.getE01PVDNET())%></a>
				<%
					String ls = "";
							ls += Util.formatCell(convObj.getE01PVDCUN()) + "<br>";
							ls += Util.formatCell(convObj.getE01PVDUUS()) + "<br>";
							ls += Util.fcolorCCY(convObj.getE01PVMRMK()) + "<br>";
				%>
				<input type="hidden" id="TXTDATA<%=k%>"  name="TXTDATA<%=k%>" value="<%=ls%>">
				</td>
			</tr>
			<%
			k++;
				}
			%>
   				</table>
   				</div>
    </td> 

      <TD nowrap ALIGN="RIGHT" valign="top" > 
			<Table id="tbAddInfo" >
		      <tr id="trclear" >
		            <TD  ALIGN="RIGHT"  align="center" nowrap width="20%">
		              <b>Numero de Cliente : <br>
		              Usuario : <br>
		              Remark :<br> </b>		              
		            </TD>
		         <TD ALIGN="LEFT" align="center" nowrap class="tdaddinfo">hola</TD>
		      </tr>
		     </Table>
	</td>
	</tr>
</table>


<br>
<table class="tbenter" width="98%" align="center">
	<tr>
		<td width="50%" align="left">
		<%
			if (EPV104001List.getShowPrev()) {
					int pos = EPV104001List.getFirstRec() - 13;
					out
							.println("<A HREF=\""
									+ request.getContextPath()
									+ "/servlet/datapro.eibs.client.JSECIF010?SCREEN=3&NameSearch="
									//+ EPV104001List.getSearchText() + "&Type="
									//+ EPV104001List.getSearchType() + "&Pos=" + pos
									+ "\"><IMG border=\"0\" src=\""
									+ request.getContextPath()
									+ "/images/s/previous_records.gif\" ></A>");
				}
		%>
		</td>
		<td width="50%" align="right">
		<%
			if (EPV104001List.getShowNext()) {
					int pos = EPV104001List.getLastRec();
					out
							.println("<A HREF=\""
									+ request.getContextPath()
									+ "/servlet/datapro.eibs.client.JSECIF010?SCREEN=3&NameSearch="
									//	+ cifList.getSearchText() + "&Type="
									//	+ cifList.getSearchType() + "&Pos=" + pos
									+ "\"><IMG border=\"0\" src=\""
									+ request.getContextPath()
									+ "/images/s/next_records.gif\" ></A>");
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
  document.forms[0].totalRow.value="<%= k %>";
   function resizeDoc() {
       divResize(true);
       //adjustDifTables(headTable, dataTable, dataDiv1,2,1);
	        	adjustEquTables(getElement('headTable'),getElement('dataTable'), getElement('dataDiv1'),1,false);
       
  }
  showChecked("ACCNUM");
  resizeDoc();
  tbAddInfoH.rows[0].cells[0].height = headTable.rows[0].cells[0].clientHeight;
  window.onresize=resizeDoc;
   showAddInfo(0);   
</SCRIPT>
</body>
</html>
