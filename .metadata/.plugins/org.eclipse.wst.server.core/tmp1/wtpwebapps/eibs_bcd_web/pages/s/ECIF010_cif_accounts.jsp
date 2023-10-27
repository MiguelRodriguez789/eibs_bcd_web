<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Detalle de Cuentas</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "cifAcc" class= "datapro.eibs.beans.JBList"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

function goAction(op) {
     document.forms[0].opt.value = op;
     var formLength= document.forms[0].elements.length;
     var ok = false;
     var acc = "";
	 var pg = "";
     for(n=0;n<formLength;n++)
     {
      	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "ACCNUM") 
      	{       
      	       if (document.forms[0].elements[n].checked == true) {
					acc = document.forms[0].elements[n].value; 
        		ok = true;
        		break;
        	}	
      	}
      }
      
	  if ( ok ) {
	     pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF010?SCREEN=10&ACCNUM=" + acc + "&opt=" + op;
	     CenterWindow(pg,600,400,2);	
     }
     else {
			alert("Seleccione una cuenta antes de realizar esta operación");	   
     }

  }
      
function showAddInfo(idxRow){
	var opening="<b>Banco : <br>Sucursal : <br>Apertura : <br>Principal : <br>Interes : <br>Otros : <br>Total : </b>";
	var mature="<b>Banco : <br>Sucursal : <br>Vencimiento : <br>Principal : <br>Interes : <br>Otros : <br>Total : </b>";
	var codeACD=getElement("CODACD"+idxRow).value;
	var headTable = document.getElementById('headTable');
	var dataTable = document.getElementById('dataTable');
	var tbAddInfo = document.getElementById('tbAddInfo');
   if (codeACD=="01" || codeACD=="02" || codeACD=="03" || codeACD=="04"){
     tbAddInfo.rows[0].cells[0].innerHTML=opening; 
   } else {
     tbAddInfo.rows[0].cells[0].innerHTML=mature;
   }
   tbAddInfo.rows[0].cells[1].style.color="white";
   tbAddInfo.rows[0].cells[1].innerHTML=getElement("TXTDATA"+idxRow).value;  
   tbAddInfo.rows[0].cells[1].style.color="";
   for ( var i=0; i<dataTable.rows.length; i++ ) {
       dataTable.rows[i].className="trnormal";
    }
   dataTable.rows[idxRow].className="trhighlight";
   adjustDifTables('headTable', 'dataTable', 'dataDiv1',1,1);
  } 

 builtNewMenu(ecif10_i_opt);
</SCRIPT>

<SCRIPT> initMenu(); </SCRIPT>

</head>

<BODY onload="MM_preloadImages('<%=request.getContextPath()%>/images/s/exit_over.gif','<%=request.getContextPath()%>/images/s/inquiry_over.gif','<%=request.getContextPath()%>/images/s/average_over.gif','<%=request.getContextPath()%>/images/s/statement_account_over.gif')">

<%@ page import="datapro.eibs.master.Util" %>
<h3 align="center">Lista de Cuentas</h3>
<hr size="4">
  <form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF010" >
    <INPUT TYPE=HIDDEN NAME="SCREEN" value="10">
	 <INPUT TYPE=HIDDEN NAME="opt" VALUE="1">
	 <INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
<%
	if ( cifAcc.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
        <div align="center">
        		<font size="3"><b>
        				No hay resultados que correspondan a su criterio de búsqueda 
        		</b></font>
        	</div>
      </TD></TR>
   		</TABLE>
<%   		
	}
	else {
    
%>
  
  <TABLE class="tbenter">
    <TR>
      <TD CLASS="TDBKG" ALIGN=CENTER width="20%">
  			<a href="javascript:goAction(1)" >Consulta</a>
      </TD>
      <TD CLASS="TDBKG" ALIGN=CENTER width="20%">
  			<a href="javascript:goAction(2)" >Estado<br>de Cuentas</a>
      </TD>
      <TD CLASS="TDBKG" ALIGN=CENTER width="20%">
  			<a href="javascript:goAction(3)" >Promedio</a>
      </TD>
      <TD CLASS="TDBKG" ALIGN=CENTER width="20%">
  			<a href="<%=request.getContextPath()%>/pages/background.jsp" onClick="top.close()">Salir</a>
      </TD>
    </TR>
  </TABLE>

<TABLE  id="mainTable" ALIGN=CENTER class=tableinfo >
<TR> 
    <TD NOWRAP valign="top" width="100%" >
<TABLE id="headTable" >
  <TR id="trdark"> 
    <TH nowrap width="10%" ALIGN=CENTER ></TH>
    <TH nowrap width="30%"ALIGN=CENTER colspan="2">Cuenta</TH>
    <TH nowrap width="15%"ALIGN=CENTER >Producto</TH>
	<TH nowrap width="15%" ALIGN=CENTER >Mda</TH>
    <TH nowrap width="15%" ALIGN=CENTER >Principal</TH>
    <TH nowrap width="15%" ALIGN=CENTER >Oficial</TH>
  </TR>
  <TR id="trdark">
  	<TH nowrap width="10%" ALIGN=CENTER ></TH>
    <TH nowrap width="15%" ALIGN=CENTER>Número</TH>
    <TH nowrap width="15%" ALIGN=CENTER>Status</TH>
    <TH nowrap width="15%" ALIGN=CENTER ></TH>
	<TH nowrap width="15%" ALIGN=CENTER ></TH>
    <TH nowrap width="15%" ALIGN=CENTER ></TH>
    <TH nowrap width="15%" ALIGN=CENTER ></TH>
  	 
    
  </TR>
  </TABLE>
  
   <div id="dataDiv1" class="scbarcolor print_overflow" >
    <table id="dataTable" >
   
  <%
                cifAcc.initRow();
                int k=1;
                while (cifAcc.getNextRow()) {
                    if (cifAcc.getFlag().equals("")) {
                    		out.println(cifAcc.getRecord());
                    		k++;
                    }        
                }
    %> 
   </table>
   </div>
   <!--<TABLE id="tbbotton" width="100%">
     <TR> 
      <TD nowrap align=right width="70%"><b>Total del Principal:</b>
      </TD>
      <TD nowrap align=right><%= Util.fcolorCCY((String)request.getAttribute("Total")) %>
      </TD>
	  <TD nowrap align=right width="14%">
      </TD>
     </TR>
   </TABLE>-->
   </TD>
   <TD nowrap ALIGN="RIGHT" valign="top">
      <Table id="tbAddInfoH" width="100%" >
        <tr id="trdark">
         <TH ALIGN=CENTER nowrap >Información Básica </TH>
        </tr>
      </Table>

     <Table id="tbAddInfo" height="100%">
      <tr id="trclear" >
         <TD  ALIGN="RIGHT" align="center" nowrap ></TD>
         <TD ALIGN="LEFT" align="center" nowrap class="tdaddinfo"></TD>
      </tr>
     </Table>
   
  </TD>
  </TR>
   	
</TABLE>

	<div align="center"> 
		<input id="PRINTBTN" class="EIBSBTN" type=button name="Submit" OnClick="doPrint()" value="Imprimir">
	</div>  
	<SCRIPT type="text/javascript">
	
	  function doPrint(){
			document.getElementById('PRINTBTN').style.visibility = 'hidden';
		    window.focus();
		    if (document.queryCommandSupported("print")) {
		    	document.execCommand('print', false, null);
		    } else {
				window.print();
			}
			document.getElementById('PRINTBTN').style.visibility = 'visible';
			return;
	  }
	</SCRIPT>

<SCRIPT type="text/javascript">
     document.forms[0].totalRow.value="<%= k %>";
     function resizeDoc() {
       divResize(true);
      	adjustDifTables(getElement('headTable'), getElement('dataTable'), getElement('dataDiv1'),1,1);
      
      }
     showAddInfo(0);
     resizeDoc();
     getElement('tbAddInfoH').rows[0].cells[0].height = getElement('headTable').rows[0].cells[0].clientHeight;
     window.onresize=resizeDoc;
     
     
</SCRIPT>

<%
  }
%>

  </form>
</body>
</html>
