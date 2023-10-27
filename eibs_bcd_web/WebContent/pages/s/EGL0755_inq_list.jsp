<html>
<head>
<title>Lista de cuentas contables</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "cifList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script type="text/javascript">
  function goAction(op, index) {
  	if (op == 5 || op == 6) {//desplegar pantalla de fechas
    	document.forms[0].opt.value = op;
      	showdiv('fechas');
	} else if (op == 1){//Consulta de catalogo contable
		getRadioValue();
  		var index = document.forms[0].selected.value;
		var variables = getElement("variables_"+index).value;
		var values= variables.split('_');
        var  bank=values[0];
        var  ccy=values[1];
        var  glAcc=values[2];
		pg="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEGL0340?SCREEN=300&E01GLMBNK="+bank+"&E01GLMGLN="+glAcc+"&E01GLMCCY="+ccy;
       	CenterWindow(pg,800,500,2);      
    } else {
		document.forms[0].SCREEN.value = op;
		document.forms[0].submit();
	}
  }
  
  function getRadioValue() {
			for (i=0; i < document.forms[0].index.length; i++) {
				if (document.forms[0].index[i].checked) {
					document.forms[0].selected.value = document.forms[0].index[i].value;
					break;
				}
			}
		}
  
  function searchHistorico(){
     hidediv('fechas');
     document.forms[0].SCREEN.value = 1;
     document.forms[0].opt.value = 2;
     document.forms[0].submit();
}
  
 function hidediv(id) {
	getElement(id).style.display = 'none'; 
}

function showdiv(id) {
	//safe function to show an element with a specified id
	if (document.forms[0].opt.value == '5'){
		document.forms[0].E01HISCYC.value = 'M';
		document.getElementById("mensual").checked = true;
		document.getElementById("historico").checked = false;
		document.forms[0].E01FRDTE1.value = '1';
		document.forms[0].E01FRDTE2.value = document.forms[0].runDateMonth.value;
		document.forms[0].E01FRDTE3.value = document.forms[0].runDateYear.value;
	} else {
		document.forms[0].E01HISCYC.value = 'H';
		document.getElementById("mensual").checked = false;
		document.getElementById("historico").checked = true;
		document.forms[0].E01FRDTE1.value = "";
		document.forms[0].E01FRDTE2.value = "";
		document.forms[0].E01FRDTE3.value = "";
	
	}
	
	getElement(id).style.display = 'block'; 
}
   
</script>

</HEAD>

<BODY>

<h3 align="center">Saldos de Cuentas Contables<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="inq_list.jsp,EGL0755"></h3>
<hr size="4">
<FORM name="form1" Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.accounting.JSEGL0755" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="100">
<INPUT TYPE=HIDDEN NAME="opt" VALUE="1">
<INPUT TYPE=HIDDEN NAME="selected" VALUE="">
<INPUT TYPE=HIDDEN NAME="runDateDay" VALUE="<%=currUser.getE01RDD() %>">
<INPUT TYPE=HIDDEN NAME="runDateMonth" VALUE="<%=currUser.getE01RDM() %>">
<INPUT TYPE=HIDDEN NAME="runDateYear" VALUE="<%=currUser.getE01RDY() %>">

<%
	if ( cifList.getNoResult() ) {
 %>
   	<TABLE class="tbenter" width=100% height=90%>
   		<TR>
           <TD> 
           <div align="center"> <font size="3"><b> No hay resultado que corresponda a su criterio de búsqueda. 
        </b></font> </div>
      </TD></TR>
   	</TABLE>
<%   		
	}
	else {
%> <% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%>  

  <TABLE class="tbenter" width="100%">
    <TR> 
      <TD ALIGN=CENTER class=TDBKG> <a href="javascript:goAction(5)" ><b>Mensual</b></a> 
      </TD>
      <TD ALIGN=CENTER class=TDBKG> <a href="javascript:goAction(6)" ><b>Historico</b></a> 
      </TD>
       <TD ALIGN=CENTER class=TDBKG> <a href="javascript:goAction(400)" ><b>Saldos</b></a> 
      </TD>
       <TD ALIGN=CENTER class=TDBKG> <a href="javascript:goAction(1)" ><b>Consulta</b></a> 
      </TD>
      <TD ALIGN=CENTER class=TDBKG> <a href="<%=request.getContextPath()%>/pages/background.jsp" ><b>Salir</b></a> 
      </TD>
    </TR>
  </TABLE>

<br>
 
 <TABLE id="mainTable" class="tableinfo">      
 <TR> 
     <TD NOWRAP valign="top" width="100%" > 
     <TABLE id="headTable" width="100%">
     <TR id="trdark"> 
      <TH ALIGN=CENTER NOWRAP>Sel</TH>
      <TH ALIGN=CENTER NOWRAP>Moneda</TH>      
      <TH ALIGN=CENTER NOWRAP>Tipo</TH>
      <TH ALIGN=CENTER NOWRAP>Cuenta Contable</TH>
      <TH ALIGN=CENTER NOWRAP>Descripción</TH>
      <TH ALIGN=CENTER NOWRAP>Balance</TH>
     </TR>
     <%   
                cifList.initRow();
				boolean firstTime = true;
				String chk = "";
                while (cifList.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {   
						chk = "";
					}
                 datapro.eibs.beans.EGL075502Message msgList = (datapro.eibs.beans.EGL075502Message) cifList.getRecord();

     %>           
                <TR>       
                  <TD NOWRAP ALIGN=CENTER width="10%">  
                      <input type="radio" id="index" name="index" value="<%=cifList.getCurrentRow()%>" <%=chk%>>
                      <input type="hidden" name="variables_<%=cifList.getCurrentRow()%>" value="<%=msgList.getE02SELBNK()+"_"+ msgList.getE02GLBCCY()+"_"+msgList.getE02GLBGLN() %>">
                  </TD>
                  
                  <TD NOWRAP  ALIGN=CENTER width="10%"><%= msgList.getE02GLBCCY() %></td> 
                  <TD NOWRAP  ALIGN=CENTER width="10%"><%= msgList.getE02GLMCLS() %></td> 
                  <TD NOWRAP  ALIGN=CENTER width="10%"><%= msgList.getE02GLBGLN() %></td>                  
                  <TD NOWRAP  ALIGN=CENTER width="10%"><%= msgList.getE02GLMDSC() %></td> 
                  <TD NOWRAP  ALIGN=RIGHT width="10%"><%= msgList.getE02GLBBAL() %></td>   
                  
                </TR>    		
    <%               
                }
    %> 
   </table>
   </TD>
   
  </TR>	
 </TABLE> 


<BR>
<TABLE class="tbenter" WIDTH="100%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="35%" ALIGN=LEFT>
<%
        if ( cifList.getShowPrev() ) {
      			int pos = cifList.getFirstRec() - 51;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.accounting.JSEGL0755?SCREEN=4&Pos=" + pos + "\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/s/previous_records.gif\" ></A>");
        }
  %>  
  </TD>
  <TD WIDTH="30%" ALIGN=CENTER>
	<div align="center"> 
		<input id="EIBSBTN" type=submit name="Submit" value="Regresar">
  	</div>
  </TD>
  <TD WIDTH="35%" ALIGN=RIGHT>     
 <%      
        if ( cifList.getShowNext() ) {
      			int pos = cifList.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.accounting.JSEGL0755?SCREEN=4&Pos=" + pos + "\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/s/next_records.gif\" ></A>");
        }
   %> 
   </TD>
 	</TR>
 	</TABLE> 
 <%           
  }
%>

<div id="fechas" style="display:none; position:absolute; width:200px; top:50px; left:150px;" >
  <table class="tableinfo" cellpadding=2 cellspacing=0 width="100%" border="0">
  	<tr id="trclear"> 
       <td nowrap colspan="2"> 
         <div align="center"><b>CRITERIO DE SELECCION</b></div>
       </td>       
     </tr>
     <tr id="trdark"> 
       <td nowrap width="30%"> 
         <div align="right">Seleccionar Transacción por :</div>
       </td>
       <td nowrap width="70%"> 
         <input id ="mensual" type="radio" name="E01HISCYC" value="M"><b>Mensual</b>
         <input id ="historico" type="radio" name="E01HISCYC" value="H"><b>Histórico</b>
       </td>
     </tr>
     <tr id="trdark"> 
       <td nowrap width="30%"> 
         <div align="right">Seleccionar Fechas Desde :</div>
       </td>
       <td nowrap width="70%"> 
         <div align="left"> 
           <input type="text" name="E01FRDTE1" size="3" maxlength="2">
           <input type="text" name="E01FRDTE2" size="3" maxlength="2">
           <input type="text" name="E01FRDTE3" size="5" maxlength="4">
         </div>
       </td>       
     </tr>
     <tr id="trdark"> 
       <td nowrap width="30%"> 
         <div align="right">Seleccionar Fechas Hasta :</div>
       </td>
       <td nowrap width="70%"> 
         <div align="left"> 
           <input type="text" name="E01TODTE1" size="3" maxlength="2">
           <input type="text" name="E01TODTE2" size="3" maxlength="2">
           <input type="text" name="E01TODTE3" size="5" maxlength="4">
         </div>
       </td>
     </tr>
     <tr id="trdark">
       <td>
         <div align="center"> 
          	<input id="subHistorico" type="button" name="subHistorico" value="Enviar" onclick="searchHistorico();" />
         </div>
       </td>
       <td>
         <div align="center"> 
          <input id="clear" type="button" name="clear" value="Cerrar" onclick="hidediv('fechas');" />
         </div>
       </td>
     </tr>
   </table>
</div>

</FORM>

</BODY>
</HTML>
