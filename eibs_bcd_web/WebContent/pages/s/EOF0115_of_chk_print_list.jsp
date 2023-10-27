<HTML>
<HEAD>
<TITLE>
Lista de Cheques a Imprimir
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</HEAD>

<jsp:useBean id= "msgHeader" class= "datapro.eibs.beans.ETL051001Message"  scope="session" />

<jsp:useBean id= "dvList" class= "datapro.eibs.beans.JBList"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script type="text/javascript">

function enter(accnum , currency) {
   document.forms[0].SCREEN.value = "200";
   document.forms[0].E01OFMCKN.value = accnum;
   document.forms[0].E01OFMCCY.value = currency;
   document.forms[0].submit();
}

function changeChecked(field){

	for (var i = 0; i < field.length; i++)
		field[i].checked = document.forms[0].hcheck.checked ;
}

function submitForm(){

	var anyChecked = false ;
	var checks = document.forms[0].ACCNUM ;

	if( typeof(checks.length)=="undefined" ){ //If true there is only one item in the list
		if( checks.checked == true ){
			anyChecked = true ;
		}
	}else{ //There is more than one item in the list, in this case the items must be accessed by an array
		for(var i=0 ; i < checks.length ; i++ ){
			if( checks[i].checked == true ){
				anyChecked = true ;
				break ;
			}
		}
	
	}
	
	
	if( ! anyChecked ){
		alert("No existe ningun cheque seleccionado.");
		return false ;
	}else{
	    document.forms[0].SCREEN.value = "600";
		document.forms[0].submit();
		return true;
	}
}

function goPrint(op) {
  		if( getElementChecked("ACCNUM") != null){
			document.forms[0].SCREEN.value = "600";
			document.forms[0].submit();
		return true;
			
  		} else {
			alert("Debe seleccionar un registro.");
  		}			
  	}

</script>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<BODY onload="">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEOF0115P" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="500">
<INPUT TYPE=HIDDEN NAME="E01OFMCCY" VALUE="">
<INPUT TYPE=HIDDEN NAME="E01OFMCKN" VALUE="">


  <h3 align="center"> Impresi&oacute;n de Cheques de Gerencia   <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="of_chk_print_list.jsp,EOF0115"> 
  </h3>
<hr size="4">

<%
	if ( dvList.getNoResult() ) {
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
  
  <TABLE class="tbenter" width="50%">
  	
  	<tr id="trdark"> 
      
    <TR> 
      <TD ALIGN=CENTER class="TDBKG" >
			<input id="EIBSBTN" type=button name="Submit" value="Imprimir" onclick="return goPrint();" >
	  </TD>
      <TD ALIGN=CENTER >&nbsp;</TD>
      <TD ALIGN=CENTER class="TDBKG">
      	<input id="EIBSBTN" type="button" name="button" value="Salir" onClick="javascript:location.href='<%=request.getContextPath()%>/pages/background.jsp'">
      </TD>
    </TR>
  </TABLE>
        
  
  <table class="tableinfo">
    <tr id="trdark">
      <th align=CENTER  nowrap width="1%">
<!--       	<INPUT type="checkbox" name="hcheck" -->
<!--       		onclick="javascript:changeChecked(document.forms[0].ACCNUM)" /> -->
      </th>
      <th align=CENTER  nowrap width="6%">Referencia</th>
      <th align=CENTER  nowrap width="6%">Moneda</th>
      <th align=CENTER  nowrap width="6%">Sucursal</th>
      <th align=CENTER  nowrap width="10%">Monto</th>
      <th align=CENTER  nowrap width="9%"> 
        <div align="center">Estado</div>
      </th>
      <th align=CENTER  nowrap width="5%"> 
        <div align="center">Forma</div>
      </th>
      <th align=CENTER  nowrap width="8%"> 
        <div align="center">Emitido</div>
      </th>
      <th align=CENTER  nowrap width="50%"> 
        <div align="center">Beneficiario</div>
      </th>
      <th align=CENTER  nowrap width="6%"> 
        <div align="center">Cheque para Imprimir</div>
      </th>
    </tr>
    <%
                dvList.initRow();
                while (dvList.getNextRow()) {
                    if (dvList.getFlag().equals("")) {
                    		out.println(dvList.getRecord());
                    }
                }
              %> 
  </table>
  <%
  }
%>

</FORM>
<SCRIPT type="text/javascript">
  	showChecked("ACCNUM");
</SCRIPT>
</BODY>
</HTML>
