<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>

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
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script type="text/javascript">
	function goAction(op) {
    	document.forms[0].opt.value = op;
     	var pg = "";
     	
     	// Get value from  GL Account selected
     	var obj = getElementChecked("glAccount");
     	var values = obj.value.split('|');
        var bank = values[0];
        var ccy = values[1];
        var glAcc = values[2];
        var brn = values[3]; 
        
    	switch (op) {
    		case 1:
    			pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEGL0340?SCREEN=300&E01GLMBNK="+bank+"&E01GLMGLN="+glAcc+"&E01GLMCCY="+ccy;
    			break;	
    		case 2:
      			pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.accounting.JSEGL0750?SCREEN=400&E02GLBBNK="+bank+"&E02GLBGLN="+glAcc+"&E02GLBCCY="+ccy+"&E02GLBBRN="+brn;
    			break;	
    		case 3:
      			pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.accounting.JSEGL0750?SCREEN=300&E02GLBBNK="+bank+"&E02GLBGLN="+glAcc+"&E02GLBCCY="+ccy+"&E02GLBBRN="+brn;
    			break;	
    		case 4:
      			pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.accounting.JSEGL0750?SCREEN=200&E02GLBBNK="+bank+"&E02GLBGLN="+glAcc+"&E02GLBCCY="+ccy+"&E02GLBBRN="+brn;
    			break;	
    		case 5:
    			showdiv('fechas');
    			break;	
    		default:		
	     		alert('Debe seleccionar una cuenta contable');	   
    			break;	
    	}
           
     	if (pg != '') CenterWindow(pg, 600, 500, 2);
	}
	
  	function searchHistorico() {
    	hidediv('fechas');
    	
     	var hiscyc = getElement("E01HISCYC").value;
     	var valbth = "B"; // Date type Flag  - process(B) o value(V)
        var frdte1 = getElement("E01FRDTE1").value; // From Date
     	var frdte2 = getElement("E01FRDTE2").value;
     	var frdte3 = getElement("E01FRDTE3").value;
     	var todte1 = getElement("E01TODTE1").value; // To Date
     	var todte2 = getElement("E01TODTE2").value;
     	var todte3 = getElement("E01TODTE3").value;
     	var frrefn = getElement("E01FRREFN").value;
     	var torefn = getElement("E01TOREFN").value;
     	var framnt = getElement("E01FRAMNT").value;
     	var toamnt = getElement("E01TOAMNT").value;
     	
		var obj = getElementChecked("glAccount");
		var values = obj.value.split('|');
        var bank = values[0];
        var ccy = values[1];
        var glAcc = values[2];
        var brn = values[3];    
        
        var complete = (bank.trim() != "") || (ccy.trim() != "") || (glAcc.trim() != "") || (brn.trim() != "");
        
         // Get Date type
		var bth = getElementChecked("E01VALBTH");
		valbth = bth.value;
         
		var cyc = getElementChecked("E01HISCYC");
		hiscyc = cyc.value;
		
     	var pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSEGL0420?SCREEN=200&E01HISCYC="+hiscyc+"&E01TRABNK="+bank+"&E01TRABRN="+brn;
        pg += "&E01TRACCY="+ccy+"&E01TRAGLN="+glAcc+"&E01VALBTH="+valbth+"&E01FRDTE1="+frdte1+"&E01FRDTE2="+frdte2+"&E01FRDTE3="+frdte3;
        pg += "&E01TODTE1="+todte1+"&E01TODTE2="+todte2+"&E01TODTE3="+todte3+"&E01FRREFN="+frrefn;
        pg += "&E01TOREFN="+torefn+"&E01FRAMNT="+framnt+"&E01TOAMNT="+toamnt;
        
        if (complete) {
        	CenterWindow(pg, 600, 500, 2);  
        } else {
        	alert('Debe seleccionar una cuenta contable');
        }
	}
	
	function hidediv(id) {
		document.getElementById(id).style.display = 'none';
	}
	
	function showdiv(id) {
		document.getElementById(id).style.display = 'block';
	}
</script>

</HEAD>

<BODY>

<h3 align="center">Saldos de Cuentas Contables<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="inq_list.jsp,EGL0750"></h3>
<hr size="4">
<FORM name="form1" Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.accounting.JSEGL0750" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="3">
<INPUT TYPE=HIDDEN NAME="opt" VALUE="1">

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
  <p>   

  <TABLE class="tbenter" width="100%">
    <TR> 
      <TD ALIGN="center" class=TDBKG> <a href="javascript:goAction(1)" ><b>Consulta</b></a> 
      </TD>
      <TD ALIGN="center" class=TDBKG> <a href="javascript:goAction(2)" ><b>Balances</b></a> 
      </TD>
       <TD ALIGN="center" class=TDBKG> <a href="javascript:goAction(3)" ><b>Promedios</b></a> 
      </TD>
       <TD ALIGN="center" class=TDBKG> <a href="javascript:goAction(4)" ><b>Presupuesto</b></a> 
      </TD>
      <TD ALIGN="center" class=TDBKG> <a href="javascript:goAction(5)" ><b>Estado de Cuenta 
        <br>
        Historico
       </b></a> </TD> 
      <TD ALIGN="center" class=TDBKG> <a href="javascript:checkClose()" ><b>Salir</b></a> 
      </TD>
    </TR>
  </TABLE>

<br>
 
   <TABLE  id="mainTable" class="tableinfo" style="height:420px; width:100%;">
   <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="98%">
			<tr id="trdark">
		      <TH ALIGN="center" NOWRAP width="5%">&nbsp;</TH>
		      <TH ALIGN="center" NOWRAP width="10%">Sucursal</TH>
		      <TH ALIGN="center" NOWRAP width="10%">Moneda</TH>
		      <TH ALIGN="center" NOWRAP width="15%">Cuenta Contable</TH>
		      <TH ALIGN="center" NOWRAP width="25%">Descripcion</TH>
		      <TH ALIGN="center" NOWRAP width="10%">Clase</TH>
		      <TH ALIGN="center" NOWRAP width="10%">Tipo</TH>
		      <TH ALIGN="center" NOWRAP width="15%">Balance</TH>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap" valign="top">      
		       <div id="dataDiv1" style="height:420px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
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
                 datapro.eibs.beans.EGL075001Message msgList = (datapro.eibs.beans.EGL075001Message) cifList.getRecord();

     %>           
		<tr id="dataTable<%= cifList.getCurrentRow() %>">
			<td nowrap align="center" width="5%"><input type="radio" name="glAccount" 
				value="<%=msgList.getE01GLBBNK()%>|<%=msgList.getE01GLBCCY()%>|<%=msgList.getE01GLBGLN()%>|<%=msgList.getE01GLBBRN()%>" 
				<%=chk%> 
				class="highlight" onClick="highlightRow('dataTable', <%= cifList.getCurrentRow() %>)"/></td>
            <TD NOWRAP  ALIGN="center" width="5%"><%= msgList.getE01GLBBRN() %></td>  
            <TD NOWRAP  ALIGN="center" width="10%"><%= msgList.getE01GLBCCY() %></td> 
            <TD NOWRAP  ALIGN="center" width="20%"><%= msgList.getE01GLBGLN() %></td> 
            <TD NOWRAP  ALIGN="left" width="30%"><%= msgList.getE01GLBDSC() %></td> 
            <TD NOWRAP  ALIGN="center" width="5%"><%= msgList.getE01GLBCLS() %></td>
            <TD NOWRAP  ALIGN="center" width="5%"><%= msgList.getE01GLBATY() %></td>
            <TD NOWRAP  ALIGN="right" width="20%"><%= msgList.getE01GLBBAL() %></td>   
                  
        </TR>    		
    <%               
                }
    %> 
             </table>
             </div>
             </td>
             </tr>
</table>

<SCRIPT type="text/javascript">
 	showChecked("glAccount");
</SCRIPT>

<BR>
<TABLE class="tbenter" WIDTH="100%" ALIGN="center">
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>
<%
        if ( cifList.getShowPrev() ) {
      			int pos = cifList.getFirstRec() - 13;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.accounting.JSEGL0750?SCREEN=3&Pos=" + pos + "\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/s/previous_records.gif\" ></A>");
        }
  %>  
  </TD>
  <TD WIDTH="50%" ALIGN=RIGHT>     
 <%      
        if ( cifList.getShowNext() ) {
      			int pos = cifList.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.accounting.JSEGL0750?SCREEN=3&Pos=" + pos + "\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/s/next_records.gif\" ></A>");
        }
   %> 
   </TD>
 	</TR>
 	</TABLE> 
 <%           
  }
%>

<div id="fechas" style="display:none; position:absolute; width:200px; top:50px; left:150px;" >
  <table class="tableinfo">
    <tr > 
      <td nowrap height="143"> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="32%"> 
              <div align="right"><b>Seleccionar Transacci&oacute;n por :</b></div>
            </td>
            <td nowrap width="3%">&nbsp;</td>
            <td nowrap width="23%"> 
              <input type="radio" name="E01HISCYC" value="M" checked>
              <b>Este Ciclo</b></td>
            <td nowrap width="10%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="32%"> 
              <input type="radio" name="E01HISCYC" value="H">
              <b>Hist&oacute;rico</b></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="32%"> 
              <div align="right"><b>Tipo de Fecha :</b></div>
            </td>
            <td nowrap width="3%">&nbsp;</td>
            <td nowrap width="23%"> 
              <input type="radio" value="B" name="E01VALBTH" checked>
              <b> Fecha Proceso</b></td>
            <td nowrap width="10%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="32%"> 
              <input type="radio" value="V" name="E01VALBTH" >
              <b>Fecha Valor</b></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="32%"> 
              <div align="right"><b>Seleccionar Fechas desde :</b></div>
            </td>
            <td nowrap width="3%">&nbsp;</td>
            <td nowrap width="23%"> 
              <div align="left"> 
                <!--
                <input type="text" name="E01FRDTE1" size="3" maxlength="2">
                <input type="text" name="E01FRDTE2" size="3" maxlength="2">
                <input type="text" name="E01FRDTE3" size="5" maxlength="4">
                -->
                <eibsinput:date fn_month="E01FRDTE1" fn_day="E01FRDTE2" fn_year="E01FRDTE3"  />
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="right"><b>hasta :</b></div>
            </td>
            <td nowrap width="32%"> 
              <div align="left"> 
                <!--
                <input type="text" name="E01TODTE1" size="3" maxlength="2">
                <input type="text" name="E01TODTE2" size="3" maxlength="2">
                <input type="text" name="E01TODTE3" size="5" maxlength="4">
                -->
                <eibsinput:date fn_month="E01TODTE1" fn_day="E01TODTE2" fn_year="E01TODTE3"  />
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="32%"> 
              <div align="right"><b>Seleccionar Referencia desde :</b></div>
            </td>
            <td nowrap width="3%">&nbsp;</td>
            <td nowrap width="23%"> 
              <div align="left"> 
                <input type="text" name="E01FRREFN" size="13" maxlength="12">
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="right"><b>hasta :</b></div>
            </td>
            <td nowrap width="32%"> 
              <div align="left"> 
                <input type="text" name="E01TOREFN" size="13" maxlength="12">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="32%" height="26"> 
              <div align="right"><b>Seleccionar Montos desde :</b></div>
            </td>
            <td nowrap width="3%" height="26">&nbsp;</td>
            <td nowrap width="23%" height="26"> 
              <div align="left"> 
                <input type="text" name="E01FRAMNT" size="15" maxlength="15" onKeypress="enterDecimal(event)">
              </div>
            </td>
            <td nowrap width="10%" height="26"> 
              <div align="right"><b>hasta :</b></div>
            </td>
            <td nowrap width="32%" height="26"> 
              <div align="left"> 
                <input type="text" name="E01TOAMNT" size="15" maxlength="15" onKeypress="enterDecimal(event)">
              </div>
            </td>   
          </tr>
          <tr>
            <td colspan="5" align="center">
              <div align="center"> 
               <input class="EIBSBTN" width="50%" type="button" name="subHistorico" value="Enviar" onclick="searchHistorico();" />
               <input class="EIBSBTN" width="50%" type="button" name="clear" value="Cerrar" onclick="hidediv('fechas');" />
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</div>

</FORM>

</BODY>
</HTML>
