<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EDL055001Message"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EDL055002Message"%>

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Busqueda de Prestamos</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="recData" class="datapro.eibs.beans.EDL055001Message"  scope="session" />
<jsp:useBean id="EDL055002Loans" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

function goAction(op) {
  var ok = false;
  if ((op != '704') && (!isCheck())) {
    alert("Debe seleccionar un registro.");
    return;
  }
  getElement("SCREEN").value = op;
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

function closeHiddenDivNew(){
  setVisibility(document.getElementById("hiddenDivNew"), "hidden");
}

function showHiddenDivNew(evt) {
  evt = (evt) ? evt : ((window.event) ? window.event : "");
  var hiddenDivNew = document.getElementById("hiddenDivNew");
  var y=evt.clientY + document.body.scrollTop;
  var x=evt.clientX + document.body.scrollLeft;
  cancelBub(evt);
  moveElement(hiddenDivNew, y, x);
  setVisibility(hiddenDivNew, "visible");
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
  if (isValidObject(getElement("E02PDTSEL_"+row))) {
    if (chk) {
      getElement("E02PDTSEL_"+row).value = "Y";
    } else {
      getElement("E02PDTSEL_"+row).value = "N";
    }
  }
} 

addEventHandler(document, 'click' , closeHiddenDivNew);

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
  <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="plan_buscar_activos_list.jsp,EDL0550">
</h3>
<hr size="4">
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0550">
<input type="hidden" id="SCREEN" name="SCREEN" value="702"> 

  <div id="hiddenDivNew" class="hiddenDiv">
    <table id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
      border-color: #0b23b5;
      border-style : solid solid solid solid;
      filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
      <tr id="trdark"> 
        <td align=CENTER width="200px"> 
          <div align="right">Fuente de Recurso :</div>
        </td>
        <td align=CENTER width="200px"> 
          <div align="left"> 
           <eibsinput:cnofc name="recData" flag="RS" property="E01PDSRCS" fn_code="E01PDSRCS" fn_description="" required="true"/>
          </div>
        </td>
      </tr>
      <tr id="trdark"> 
        <td align=CENTER width="200px"> 
          <div align="right">Plazo :</div>
        </td>
        <td align=CENTER width="200px"> 
          <div align="left"> 
            <input type="text" name="E01PDSPLZ" size="6" maxlength="5" value="<%= recData.getE01PDSPLZ()%>"  >
            <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  >
            (d&iacute;as)
          </div>
          
        </td>
      </tr>
      <tr id="trdark"> 
        <td align=CENTER width="200px"> 
          <div align="right">Calificacion :</div>
        </td>
        <td align=CENTER width="200px"> 
          <div align="left"> 
            <input type="text" id="E01PDSCAL" name="E01PDSCAL" size="1" maxlength="1" value="<%= recData.getE01PDSCAL()%>">
            <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  >
          </div>
        </td>
      </tr>
      <tr id="trdark"> 
        <td align=CENTER width="200px"> 
          <div align="right">Fecha de Desembolso Desde :</div>
        </td>
        <td align=CENTER width="200px"> 
          <div align="left"> 
            <eibsinput:date name="recData" fn_month="E01PDSFFM" fn_day="E01PDSFFD" fn_year="E01PDSFFA"  /> 
            <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  >
           </div>
        </td>
      </tr>
      <tr id="trdark"> 
        <td align=CENTER width="200px"> 
          <div align="right"> Hasta :</div>
        </td>
        <td align=CENTER width="200px"> 
          <div align="left"> 
             <eibsinput:date name="recData" fn_month="E01PDSFTM" fn_day="E01PDSFTD" fn_year="E01PDSFTA"  /> 
             <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  >
            </div>
        </td>
      </tr>
      <tr id="trdark"> 
        <td align=CENTER width="200px"> 
          <div align="right">Monto Maximo :</div>
        </td>
        <td align=CENTER width="200px"> 
          <div align="left"> 
           <eibsinput:text property="E01PDSAMT" name="recData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" /> 
           <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  >
          </div>
        </td>
      </tr>
      <tr id="trdark"> 
        <td align=CENTER width="200px"> 
          <div align="right">Sucursal :</div>
        </td>
        <td align=CENTER width="200px"> 
          <div align="left"> 
            <eibsinput:help fn_param_one="E01PDSSUC" property="E01PDSSUC" name="recData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BRANCH %>" required="true"/>
            (9999 = Todas)
          </div>
        </td>
      </tr>
      <tr id="trclear"> 
        <td align=center nowrap colspan="2"> 
          <input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="javascript:goAction('704')">
        </td>
      </tr>
    </table>
  </div>
  
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap width="10%" align="right"> Paquete :</td>          
            <td nowrap width="90%" align="left" colspan="5">
              <input type="text" name="E01PDSCOD" size="5" maxlength="4" value="<%= recData.getE01PDSCOD()%>" readonly >
              <eibsinput:text name="recData" property="E01PDSNME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td> 
          </tr>
         <tr id="trdark">
             <td nowrap width="10%" align="right"> Entidad de Redescuento :</td>
             <td nowrap width="90%" align="left" colspan="5">
              <input type="text" name="E01PDSREC" size="5" maxlength="4" value="<%= recData.getE01PDSREC()%>" readonly >
              <eibsinput:text name="recData" property="E01CUSNA1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
             </td>
         </tr>
         <tr id="trdark">
           <td nowrap width="10%" align="right"> Cantidad de Prestamos :</td>
           <td nowrap width="10%" align="left">
             <input type="text" name="E01PDSSEQ" size="7" maxlength="6" value="<%= recData.getE01PDSSEQ()%>" readonly >
           </td>
           <td nowrap width="10%" align="right"> Total Paquete :</td>
           <td nowrap width="70%" align="left">
             <input type="text" name="E01PDSAMA" size="18" maxlength="15" value="<%= recData.getE01PDSAMA()%>" readonly >
           </td>             
           <td nowrap width="10%" align="right"> Estado :</td>
           <td nowrap width="70%" align="left">
             <input type="text" name="E01DSCSTS" size="18" maxlength="15" value="<%= recData.getE01DSCSTS()%>" readonly >
           </td>             
         </tr>
        </table>
      </td>
    </tr>
  </table>

  <table class="tbenter" width="100%" height="10%">
    <tr>
      <td align="center" id="NewPlan" class="tdbkg" width="10%"><b>Buscar</b></td>
      <td align="center" class="tdbkg" width="10%"><a href="javascript:goAction('702')"> <b>Agregar</b> </a></td>
      <td align="center" class="tdbkg" width="10%"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></td>
  </tr>
  </table>

  <table id="mainTable" class="tableinfo" style="height:340px;" width="100%">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
        <table id="headTable" width="100%">
          <tr id="trdark">
            <th align="CENTER" nowrap width="2%" ><input type="checkbox" name="SELALL" value="" onclick="setSelection(this.checked)"></th>
            <th align="CENTER" nowrap width="10%">Cuenta </th>
            <th align="CENTER" nowrap width="8%" >Cliente </th>
            <th align="CENTER" nowrap width="25%">Nombre</th>
            <th align="CENTER" nowrap width="10%">Producto </th>
            <th align="CENTER" nowrap width="10%">Plazo </th>
            <th align="CENTER" nowrap width="15%">Capital </th>
            <th align="CENTER" nowrap width="10%">Fecha Inicio </th>
            <th align="CENTER" nowrap width="10%">Fecha Venc. </th>
          </tr>
        </table>
      </td>
    </tr>    
    <tr  height="100%">    
      <td nowrap="nowrap">      
        <div id="dataDiv1" style="height:340px; overflow:auto; width:100%"> 
          <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
          <%
             EDL055002Loans.initRow();
             int k=0;
             while (EDL055002Loans.getNextRow()) {                 
               EDL055002Message list = (EDL055002Message) EDL055002Loans.getRecord();
          %>                  
            <tr>
              <td nowrap align="center" width="2%" >
                <input type="hidden" name="E02PDTSEL_<%=EDL055002Loans.getCurrentRow()%>" value="N" />
                <input type="checkbox" name="ROWSEL" value="<%=EDL055002Loans.getCurrentRow()%>" onclick="setCheckbox(this.checked,<%=EDL055002Loans.getCurrentRow()%>)"/>
              </td>
              <TD NOWRAP width="10%" ALIGN="right"><%=list.getE02PDTACC()%></TD>
              <TD NOWRAP width="8%"  ALIGN="right"><%=list.getE02PDTCUN()%>&nbsp;</TD>
              <TD NOWRAP width="25%" ALIGN="left">&nbsp;<%=list.getE02CUSNA1()%></TD>
              <TD NOWRAP width="10%" ALIGN="center"><%=list.getE02PDTPRD()%></TD>
              <TD NOWRAP width="10%" ALIGN="center"><%=list.getE02PDTTRM()%></TD>
              <TD NOWRAP width="15%" ALIGN=right><%=list.getE02PDTPRI()%></TD>
              <td NOWRAP width="10%" ALIGN="center" ><%= Util.formatCustomDate(currUser.getE01DTF(), 
                                    list.getBigDecimalE02PDTFFM().intValue(),
                                    list.getBigDecimalE02PDTFFD().intValue(), 
                                    list.getBigDecimalE02PDTFFA().intValue()) %></td>
              <td NOWRAP width="10%" ALIGN="center" ><%= Util.formatCustomDate(currUser.getE01DTF(), 
                                    list.getBigDecimalE02PDTFTM().intValue(),
                                    list.getBigDecimalE02PDTFTD().intValue(), 
                                    list.getBigDecimalE02PDTFTA().intValue()) %></td>
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

  <TABLE class="tbenter" WIDTH="90%" ALIGN=CENTER height="10%">
    <TR>
      <TD WIDTH="50%" ALIGN=LEFT>
      <%
         if ( EDL055002Loans.getShowPrev() ) {
           int pos = EDL055002Loans.getFirstRec() - 51;
           out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.params.JSEDL0550?SCREEN=704&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
         }
      %> 
      </TD>
      <TD WIDTH="50%" ALIGN=RIGHT>
      <%       
         if ( EDL055002Loans.getShowNext() ) {
           int pos = EDL055002Loans.getLastRec();
           out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.params.JSDLD0550?SCREEN=704&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
         }
      %> 
      </TD>
    </TR>
  </TABLE>

</form>

<SCRIPT type="text/javascript">
  showChecked("key");
  document.getElementById("hiddenDivNew").onclick=cancelBub;
  document.getElementById("NewPlan").onclick=showHiddenDivNew;  
</SCRIPT>

<% if ("S".equals(request.getAttribute("ACT"))) { %>
<script type="text/javascript">
  window.opener.location.href = '<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0550?SCREEN=700&E01PDSCOD=<%=recData.getE01PDSCOD()%>';	   	   
  cerrarVentana();	  
</script>
<% } %>  

</body>
</html>

