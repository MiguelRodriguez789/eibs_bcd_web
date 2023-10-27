<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EDL055503Message"%>

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Busqueda de Prestamos</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="msgHeaderNew" class="datapro.eibs.beans.EDL055502Message"  scope="session" />
<jsp:useBean id="msgListNew" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

function sendInfo(){
  if (!isCheck()) {
    alert("Debe seleccionar por lo menos un registro.");
    return;
  }
  if (!isValidDate()) {
    alert("Fecha no valida.");
    return;
  }
  document.forms[0].submit();
}

function goAction(op) {
  if ((op != '704') && (!isCheck())) {
    alert("Debe seleccionar un registro.");
    return;
  }
  document.forms[0].submit();    
}

function isCheck() {
  var formLength = document.forms[0].elements.length;
  for (n=0;n<formLength;n++) {
    var elementName= document.forms[0].elements[n].name;
    if (document.forms[0].elements[n].checked == true) {
      return true;		
    }
  }
  return false;
}

function isValidDate() {
  var ok; var year; var month; var day; var simDate; var runDate;
  ok = true;
  // Fecha Simulacion
  if (ok) {
    ok    = false;
    year  = parseInt(getElement('E02DLNSIY').value);
    month = parseInt(getElement('E02DLNSIM').value);
    day   = parseInt(getElement('E02DLNSID').value);
    if (year > 0 && month > 0 && day > 0) {
      if (month > 0) month = month-1;
      simDate = new Date(year,month,day);
      ok = ((day==simDate.getDate()) && (month==simDate.getMonth()) && (year==simDate.getFullYear()));
    }
  }
  // Fecha Sistema
  if (ok) {
    ok    = false;
    year  = parseInt(getElement('E01RDY').value);
    month = parseInt(getElement('E01RDM').value);
    day   = parseInt(getElement('E01RDD').value);
    if (year > 0 && month > 0 && day > 0) {
      if (month > 0) month = month-1;
      runDate = new Date(year,month,day);
      ok = ((day==runDate.getDate()) && (month==runDate.getMonth()) && (year==runDate.getFullYear()));
    }
  }
  // Fecha Simulacion vs Fecha Sistema
  if (ok) {
  	if (simDate < runDate) {
  		ok = false;
  	}
	}  
  return ok;
}

function cerrarVentana(){
  window.open('','_parent','');
  window.close(); 
}

function setSelection(chk){
  var myTable = getElement("dataTable");
  var myChkB  = document.forms[0]["ROWSEL"];
  document.forms[0]["SELALL"].checked = chk;
  if (!(myChkB == null)) {
    if (!(myChkB.length == null)) {
      for (i=0; i < myChkB.length; i++) { 
        if(myChkB[i].disabled && !myChkB[i].checked){
        } else {
          myChkB[i].checked = chk;
          myChkB[i].disabled = chk; 
          setCheckbox(chk,i);
        }
      }
    }
  }
} 

function setCheckbox(chk,row){
  if (isValidObject(getElement("E03PDTSEL_"+row))) {
    if (chk) {
      getElement("E03PDTSEL_"+row).value = "Y";
    } else {
      getElement("E03PDTSEL_"+row).value = "N";
    }
  }
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

<h3 align="center">Busqueda de Prestamos
  <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="plan_buscar_activos_list.jsp,EDL0555">
</h3>
<hr size="4">
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0555">
  <input type="hidden" id="SCREEN" name="SCREEN" value="702">
  <input type="hidden" id="E01RDM" name="E01RDM" value="<%=currUser.getE01RDM()%>">
  <input type="hidden" id="E01RDD" name="E01RDD" value="<%=currUser.getE01RDD()%>">
  <input type="hidden" id="E01RDY" name="E01RDY" value="<%=currUser.getE01RDY()%>">

  <table  class="tableinfo" style="width: 100%;">
    <tr>   
      <td nowrap> 
        <table width="100%" >
          <tr id="trdark">
            <td nowrap align="left"> Cliente:
              <eibsinput:text name="msgHeaderNew" property="E02SELCUN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
              <eibsinput:text name="msgHeaderNew" property="E02CUSNA1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" readonly="true"/>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <br><br>

  <table id="mainTable" class="tableinfo" style="height:220px;" width="100%">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
        <table id="headTable" width="100%">
          <tr id="trdark">
            <th align="CENTER" nowrap width="4%" ><input type="checkbox" name="SELALL" value="" onclick="setSelection(this.checked)"></th>
            <th align="CENTER" nowrap width="10%">Cuenta </th>
            <th align="CENTER" nowrap width="15%">Estado </th>
            <th align="CENTER" nowrap width="15%">Relacion</th>
            <th align="CENTER" nowrap width="5%">Agencia </th>
            <th align="CENTER" nowrap width="5%">Mora </th>
            <th align="CENTER" nowrap width="10%">Saldo A Capital</th>
            <th align="CENTER" nowrap width="5%" >Producto </th>
            <th align="CENTER" nowrap width="25%">Descripcion</th>
          </tr>
        </table>
      </td>
    </tr>    
    <tr  height="100%">    
      <td nowrap="nowrap">      
        <div id="dataDiv1" style="height:220px; overflow:auto; width:100%"> 
          <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
          <%
             msgListNew.initRow();
             int k=0;
             while (msgListNew.getNextRow()) {                 
               EDL055503Message list = (EDL055503Message) msgListNew.getRecord();
          %>                  
            <tr>
              <td nowrap align="center" width="4%" >
                <input type="hidden" name="E03PDTSEL_<%=msgListNew.getCurrentRow()%>" value="N" />
                <input type="checkbox" name="ROWSEL" value="<%=msgListNew.getCurrentRow()%>" onclick="setCheckbox(this.checked,<%=msgListNew.getCurrentRow()%>)"/>
              </td>
              <TD NOWRAP width="10%" ALIGN="center"><%=list.getE03ACCNUM()%></TD>
              <TD NOWRAP width="15%" ALIGN="left"><%=list.getE03ACCSTS()%>&nbsp;</TD>
              <TD NOWRAP width="15%" ALIGN="left"><%=list.getE03ACCREL()%>&nbsp;</TD>
              <TD NOWRAP width="5%" ALIGN="right"><%=list.getE03BRNNUM()%>&nbsp;</TD>
              <TD NOWRAP width="5%" ALIGN="right"><%=list.getE03PENDYS()%>&nbsp;</TD>
              <TD NOWRAP width="10%" ALIGN=right><%=list.getE03TOTAMN()%></TD>
              <TD NOWRAP width="5%" ALIGN="center"><%=list.getE03PROCDE()%></TD>
              <TD NOWRAP width="25%" ALIGN="left">&nbsp;<%=list.getE03DSCPRO()%></TD>
                           
            </tr>
          <%   
               k++;   
             }
          %> 
          </table>
        </div>
      </td>
    </tr>
  </table>
  
  <h4>Simulaci&oacute;n </h4>
  <table class="tableinfo" >
    <tr>
      <td>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td width="25%"><div align="right">Total Endeudamiento Consolidado :</div></td>
            <td width="25%">
              <eibsinput:text name="msgHeaderNew" property="E02TENDCO" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
            </td>
            
          </tr>
          <tr id="trdark">
            <td width="25%"><div align="right">Endeudamiento de Titularidad :</div></td>
            <td width="25%">
              <eibsinput:text name="msgHeaderNew" property="E02TENDTI" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
            </td>
          
          </tr>
          <tr id="trdark">
            <td width="25%"><div align="right">Fecha de Simulacion :</div></td>
            <td width="25%">
              <eibsinput:date name="msgHeaderNew" fn_year="E02DLNSIY" fn_month="E02DLNSIM" fn_day="E02DLNSID" required="true" />
            </td>
          </tr>
                  
        </table>
      </td>
    </tr>
  </table>
	<p align="center"> 
    <input id="EIBSBTN" type="button" name="Submit" OnClick="sendInfo()" value="Simular">
 	 </p>
  <TABLE class="tbenter" WIDTH="90%" ALIGN=CENTER height="10%">
    <TR>
      <TD WIDTH="50%" ALIGN=LEFT>
      <%
         if ( msgListNew.getShowPrev() ) {
           int pos = msgListNew.getFirstRec() - 51;
           out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.params.JSEDL0555?SCREEN=704&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
         }
      %> 
      </TD>
      <TD WIDTH="50%" ALIGN=RIGHT>
      <%       
         if ( msgListNew.getShowNext() ) {
           int pos = msgListNew.getLastRec();
           out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.params.JSDLD0555?SCREEN=704&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
         }
      %> 
      </TD>
    </TR>
  </TABLE>

</form>

<SCRIPT type="text/javascript">
  showChecked("key");
</SCRIPT>

<% if ("S".equals(request.getAttribute("ACT"))) { %>
<script type="text/javascript">
  window.opener.location.href = '<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0555?SCREEN=700&E01PDSCOD=<%=msgHeaderNew.getE02SELCUN()%>';	   
  cerrarVentana();	  
</script>
<% } %>  

</body>
</html>

