<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.ECO107201Message"%>

<HTML>
<HEAD>
<TITLE>Control de validacion de Impuestos</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "mtList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script type="text/javascript">

  function goAction(op) {
	var ok = false;
	var cun = "";
	var pg = "";

	if (op != '400'){	//Checks something is selected except new 
	 	for(n=0; n<document.forms[0].elements.length; n++)
	     {
	      	var element = document.forms[0].elements[n];
	      	if(element.name == "CurrentRow") 
	      	{	
	      		if (element.checked == true) {
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
      	//por si es borrar
      	if (op =='600'){
      		confirm1 = confirm("Desea Eliminar este registro");
      	}
      	if (confirm1){
			document.forms[0].SCREEN.value = op;
			document.forms[0].submit();		
		}

     } else {
		alert("Debe seleccionar una secuencia para continuar.");	   
	 }
      
  }
	
	
</script>

</HEAD>
<BODY>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors();");
     out.println("</SCRIPT>");
 } 
%>

<h3 align="center">Control de validacion de Impuestos
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="Reporte_paquetes_list.jsp,ECO1072">
</h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.adhesives.JSECO1072" >
 <INPUT TYPE=HIDDEN NAME="E01IMPSEQ" VALUE="0">
 <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="300">

 <table  class="tableinfo">
    <tr id="trdark">   
      <td nowrap> 
		<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">                     
		<tr id="trdark"> 		
            <td nowrap align="right">Código Convenio: </td>
            <td nowrap align="left">
            	<input type="text" name="E01IMPCNV" maxlength="12" size="14" value="<%=userPO.getHeader1()%>" readonly="readonly" class="TXTRIGHT">         	 
            </td>         
   			<td align="right">
   				Descripción del<br>Convenio:
   			</td>            
			<td nowrap align="left">
				<input type="text" name="E01IMPCND" maxlength="60" size="50" value="<%=userPO.getHeader2()%>" readonly="readonly" class="TXTBASE">				
			</td>		
		</tr>
		<tr id="trdark"> 		
            <td nowrap align="right">Formato: </td>
            <td nowrap align="left">
            	<input type="text" name="E01IMPTFR" maxlength="12" size="14" value="<%=userPO.getHeader3()%>" readonly="readonly" class="TXTRIGHT">         	 
            </td>         
   			<td align="right">
   				Descripción <br>Formato:
   			</td>            
			<td nowrap align="left">
				<input type="text" name="E01IMPTFD" maxlength="60" size="50" value="<%=userPO.getHeader4()%>" readonly="readonly" class="TXTBASE">				
			</td>		
		</tr>						
    </table>
      </td>
    </tr>
  </table>

<table class="tbenter" width="100%">
	<tr>
		<td align="center" class="tdbkg" width="20%">	
			<a href="#" onclick="goAction('400')"> <b>Crear</b> </a>		
		</td>
		<td align="center" class="tdbkg" width="20%">		
			<a href="javascript:goAction('500')"> <b>Modificar</b> </a>			
		</td>									
		<td align="center" class="tdbkg" width="20%">			
			<a href="javascript:goAction('600')"> <b>Eliminar</b> </a>
		</td>
		<td align="center" class="tdbkg" width="20%">			
			<a href="javascript:goAction('700')"> <b>Consultar</b> </a>	
		</td>						
		<td align="center" class="tdbkg" width="20%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
		</td>			
	</tr>
</table>

<%if ( mtList.getNoResult() ) {%> 
  <TABLE class="tbenter" width=100% height=40%>
   	<TR>
      <TD> 
        <div align="center"> 
          <p>
            <b>No hay Existen registros para el convenio solicitado</b>
          </p>          
        </div>
      </TD>
     </TR>
   </TABLE>
<%} else {%>  
       
  <TABLE  id="mainTable" class="tableinfo" >
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="100%">
			<tr id="trdark">		
	    		<th align="center" nowrap width="5%">&nbsp;</th>
				<!-- <th align="center" nowrap width="5%">SEC.</th> -->
				<th align="center" nowrap width="15%">REFERENCIA 1</th>
				<th align="center" nowrap width="15%">REFERENCIA 2</th>
				<th align="center" nowrap width="15%">REFERENCIA 3</th>
				<th align="center" nowrap width="15%">REFERENCIA 4</th>
				<th align="center" nowrap width="15%">REFERENCIA 5</th>		
				<th align="center" nowrap width="15%">REFERENCIA 6</th>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" > 
		       <table id="dataTable" cellspacing="2" cellpadding="2" border="0" width="100%">         
     <%
        mtList.initRow(); 
        ECO107201Message msgMT = null;
		boolean firstTime = true;
		String chk = "";         
        while (mtList.getNextRow()) {
			if (firstTime) {
				firstTime = false;
				chk = "checked";
			} else {
				chk = "";
			}        
           msgMT = (ECO107201Message) mtList.getRecord();
     %>     
               
        <tr id="dataTable<%= mtList.getCurrentRow() %>"> 		
			<td NOWRAP  align=CENTER  width="5%" ><input type="radio" name="CurrentRow" id="CurrentRow" value="<%=mtList.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= mtList.getCurrentRow() %>)" ></td>
			<!--<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE01IMPSEQ())%></TD>-->
			<TD NOWRAP ALIGN="CENTER" width="15%"><%=Util.formatCell(msgMT.getE01IMPRF01())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="15%"><%=Util.formatCell(msgMT.getE01IMPRF02())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="15%"><%=Util.formatCell(msgMT.getE01IMPRF03())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="15%"><%=Util.formatCell(msgMT.getE01IMPRF04())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="15%"><%=Util.formatCell(msgMT.getE01IMPRF05())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="15%"><%=Util.formatCell(msgMT.getE01IMPRF06())%></TD>
		</TR>    		
    <%}%>    
             </table>
             </div>
             </td>
             </tr>
</table> 

<SCRIPT type="text/javascript">
 	showChecked("CurrentRow");
</SCRIPT>           
             
<%}%>


 
</FORM>
</BODY>
</HTML>
