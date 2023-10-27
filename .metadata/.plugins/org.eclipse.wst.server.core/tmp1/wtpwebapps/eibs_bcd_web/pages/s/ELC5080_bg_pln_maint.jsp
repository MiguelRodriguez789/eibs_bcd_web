<%@page import="datapro.eibs.master.Util" %>
<%@page import="java.lang.Object" %>
<%@page import="datapro.eibs.master.Util,datapro.eibs.beans.ELC508003Message"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>

<HTML>
<HEAD>
<TITLE> Detalle de Cuota </TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="header" class="datapro.eibs.beans.ELC508003Message" scope="session" />
<jsp:useBean id="datadet" class="datapro.eibs.beans.ELC508003Message" scope="session" />
<jsp:useBean id="list" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

</HEAD>

<BODY>

<%
  int plnRow = list.getNoResult() ? 0 : list.getLastRec() + 1;
  double suma = 0;
%> 

<SCRIPT type="text/javascript">

function goSend(button) {
  var vlrcam = 0;
  try {
    var myTable = document.all["DINTABLE"];
    var totcam  = parseFloat((getElement("TOTCAM").value));
    for (i = 1; i <= myTable.rows.length-1; i++) {
      vlrcam = vlrcam + parseFloat((getElement("E03DCCCAM_" + i).value));
    }
    if (vlrcam != totcam) {
      alert("El valor de las cuotas no es correcto.");
    } else {
      button.disabled = true;
      document.forms[0].submit();
    }
  } catch(e) {
    alert("goSend: "+e);
  }
}

function cerrarVentana(){
  window.open('','_parent','');
  window.close(); 
}

function updateTableSize(nReg) {  
  try {
    getElement('TABLESIZE').value = "" + nReg;
  } catch(e) {
    alert("updateTableSize: "+e);
  }
}

function setSelection(chk){
  var myTable = document.all["DINTABLE"];
  var myChkB  = document.forms[0]["ROWSEL"];
  var status  = "";
  document.forms[0]["SELALL"].checked = chk;
  if (!(myChkB == null)) {
    if (!(myChkB.length == null)) {
      for (i=0; i < myChkB.length; i++) { 
        sufix  = "" + (i+1);
        status = document.forms[0].elements("E03DCCPFL_" + sufix).value;
        if (status == "") {
          myChkB[i].checked = chk;
        }
      }
    }
  }
} 

function DeleteRowSel(tableName, chkboxName){
  try {
    var noRow = DeleteRows(tableName, chkboxName);  
    if (noRow > 0) {
      UpdateTable(tableName, chkboxName, noRow);    
      document.forms[0].PLNROW.value = "" + document.all[tableName].rows.length -1;
    }
    updateTotal();
  } catch(e) {
    alert("DeleteRowSel: "+e);
  }
}

function DeleteRows(tableName, chkboxName){  
  var maxrow;
  var noRow = 0;
  var firstTime = true;
  var okdel = false;
  try {
    var myTable = document.all[tableName];
    maxrow = myTable.rows.length;
    if (maxrow > 1) {
      var myChkB = document.forms[0][chkboxName];
      if (myChkB.length == null) {
        if (myChkB.checked) {
          if (firstTime) {
            okdel = confirm("Todos los pagos seleccionados se borraran");
            if ( !okdel ) return(noRow);
          }
           myTable.deleteRow(1);
          return noRow;
        }
      } else {          
        for (i=0; i < myChkB.length; i++) {                
          if (myChkB[i].checked){
            if (firstTime) {
              okdel = confirm("Todos los pagos seleccionados se borraran");
              if ( !okdel ) break;
              firstTime = false;
            }
            noRow++;                                      
          } else {
            if (noRow > 0) {
              var row = i+1;                       
              MoveElements(row,row - noRow);                     
            } 
          }
        }
        if (noRow == 0) {
          alert("Seleccione un registro antes de realizar esta operacion ");
        }             
        return(noRow);
      }
    } else return(noRow);
  } catch(e) {
    alert("DeleteRows: "+e);
    return(noRow);
  }
}

function MoveElements(posIni, posEnd){   
  try {
    document.forms[0].elements("E03DCCPDM_" + posEnd).value = document.forms[0].elements("E03DCCPDM_" + posIni).value;
    document.forms[0].elements("E03DCCPDD_" + posEnd).value = document.forms[0].elements("E03DCCPDD_" + posIni).value;    
    document.forms[0].elements("E03DCCPDY_" + posEnd).value = document.forms[0].elements("E03DCCPDY_" + posIni).value;
    document.forms[0].elements("E03DCCCAM_" + posEnd).value = document.forms[0].elements("E03DCCCAM_" + posIni).value;
    document.forms[0].elements("E03DCCPFL_" + posEnd).value = document.forms[0].elements("E03DCCPFL_" + posIni).value;    
  } catch(e) {
    alert("MoveElements: "+e);
  }
}

function UpdateTable(tableName, chkboxName, noRow) {  
  var maxRow;
  var restRow;
  try {
    var myTable = document.all[tableName];
    maxRow = myTable.rows.length;
    restRow = maxRow - noRow;
    for (i=restRow; i < maxRow; i++) {
      myTable.deleteRow(restRow);
    }       
    if (restRow > 1) {
      var myChkB = document.forms[0][chkboxName];          
      if (myChkB.length == null) {
        myChkB.checked = false;
      } else {
        for (j=0; j < myChkB.length; j++) {                
          myChkB[j].checked = false;
        }
      }
    }       
  } catch(e) {
    alert("UpdateTable: "+e);
  }
}

function updateTotal() {  
  var total = 0.00; var nReg = 0;
  try {
    var myTable = document.all["DINTABLE"];
    for (i = 1; i <= myTable.rows.length-1; i++) {
      total = total + parseFloat((getElement("E03DCCCAM_" + i).value));
      nReg  = nReg + 1;  
    }
    updateTableSize(nReg);
    getElement("RESUMEN").rows[0].cells[3].innerHTML = formatCCY(total);
    setSelection(false);
    OrderElements("DINTABLE");
  } catch(e) {
    alert("updateTotal: "+e);
  }
}

function OrderElements(tableName){   
  var maxRow;
  var numOrd;
  try {
    var myTable = document.all[tableName];
    maxrow = myTable.rows.length;
    numOrd = 0;
    for (i=1; i < maxrow; i++) {    
      if (i+1 < maxrow) {      
        var mm1 = parseInt(getElement("E03DCCPDM_" +i).value);
        var dd1 = parseInt(getElement("E03DCCPDD_" +i).value);
        var yy1 = parseInt(getElement("E03DCCPDY_" +i).value);
        var mm2 = parseInt(getElement("E03DCCPDM_" +(i+1)).value);
        var dd2 = parseInt(getElement("E03DCCPDD_" +(i+1)).value);
        var yy2 = parseInt(getElement("E03DCCPDY_" +(i+1)).value);
        var myDate1 = new Date(yy1, mm1-1, dd1);
        var myDate2 = new Date(yy2, mm2-1, dd2);
        if (myDate1 > myDate2) {
          numOrd = numOrd + 1;
          ReplaceElements(i+1, i);
        }
      }
    }
    if (numOrd > 0) {
      OrderElements(tableName);
    }
  } catch(e) {
    alert("OrderElements: "+e);
  }
}

function ReplaceElements(posIni, posEnd){   
  try {
    document.forms[0].elements("E03DCCPDM_0").value = document.forms[0].elements("E03DCCPDM_" + posEnd).value;
    document.forms[0].elements("E03DCCPDD_0").value = document.forms[0].elements("E03DCCPDD_" + posEnd).value;    
    document.forms[0].elements("E03DCCPDY_0").value = document.forms[0].elements("E03DCCPDY_" + posEnd).value;
    document.forms[0].elements("E03DCCCAM_0").value = document.forms[0].elements("E03DCCCAM_" + posEnd).value;    
    document.forms[0].elements("E03DCCPFL_0").value = document.forms[0].elements("E03DCCPFL_" + posEnd).value;
    //
    document.forms[0].elements("E03DCCPDM_" + posEnd).value = document.forms[0].elements("E03DCCPDM_" + posIni).value;
    document.forms[0].elements("E03DCCPDD_" + posEnd).value = document.forms[0].elements("E03DCCPDD_" + posIni).value;    
    document.forms[0].elements("E03DCCPDY_" + posEnd).value = document.forms[0].elements("E03DCCPDY_" + posIni).value;
    document.forms[0].elements("E03DCCCAM_" + posEnd).value = document.forms[0].elements("E03DCCCAM_" + posIni).value;    
    document.forms[0].elements("E03DCCPFL_" + posEnd).value = document.forms[0].elements("E03DCCPFL_" + posIni).value;
    //
    document.forms[0].elements("E03DCCPDM_" + posIni).value = document.forms[0].elements("E03DCCPDM_0").value;
    document.forms[0].elements("E03DCCPDD_" + posIni).value = document.forms[0].elements("E03DCCPDD_0").value;    
    document.forms[0].elements("E03DCCPDY_" + posIni).value = document.forms[0].elements("E03DCCPDY_0").value;
    document.forms[0].elements("E03DCCCAM_" + posIni).value = document.forms[0].elements("E03DCCCAM_0").value;    
    document.forms[0].elements("E03DCCPFL_" + posIni).value = document.forms[0].elements("E03DCCPFL_0").value;      
  } catch(e) {
    alert("ReplaceElements: "+e);
  }
}

function AddRow(tableName, nRow) {
  var maxcell = 6;
  var idxrow;
  var okdel = false;
  var sufix = "";
  try {
    var myTable = document.all[tableName];
    if (myTable.rows.length < 360) {
      myTable.insertRow();
      idxrow = myTable.rows.length - 1;
      sufix = "" + idxrow;
      for (i=0; i<maxcell; i++) {
        myTable.rows[idxrow].insertCell();
        myTable.rows[idxrow].cells[i].align = "center";
      }         
      myTable.rows[idxrow].cells[0].innerHTML = "<input type='checkbox' name='ROWSEL' value='" + sufix + "'>"; 
      myTable.rows[idxrow].cells[1].innerHTML = "<input type='text' name='E03DCCSEQ_" + sufix + "' size='4' maxlength='3'  value='" + idxrow + "' readonly>";
      myTable.rows[idxrow].cells[2].innerHTML = getDateCells(sufix);
      myTable.rows[idxrow].cells[3].innerHTML = "<input type='text' name='E03DCCCAM_" + sufix + "' size='17' maxlength='15' value='' style='text-align: right' onKeypress='enterDecimal(event, 2)' onchange='updateTotal()' >";
      myTable.rows[idxrow].cells[5].innerHTML = "<input type='hidden' name='E03DCCPFL_" + sufix + "' size='2' maxlength='1' value='' readonly >";
      if (nRow > 1) {
        AddRow(tableName, nRow - 1); 
      } else {
        document.forms[0].PLNROW.value = "" + idxrow;
      }
    }      
  } catch(e) {
    alert("AddRow: "+e);
  }
}

function getDateCells(sufix) {
  var result = "";
  if (document.forms[0]["DFORMAT"].value == "MDY") {
    result = " <input type='text' name='E03DCCPDM_" + sufix + "' id='MANDATORY' size='3' maxlength='2' value='' onKeypress='enterInteger(event)'>" +
             " <input type='text' name='E03DCCPDD_" + sufix + "' id='MANDATORY' size='3' maxlength='2' value='' onKeypress='enterInteger(event)'>" +
             " <input type='text' name='E03DCCPDY_" + sufix + "' id='MANDATORY' size='5' maxlength='4' value='' onKeypress='enterInteger(event)'>";
  } else if (document.forms[0]["DFORMAT"].value == "YMD") {
    result = " <input type='text' name='E03DCCPDY_" + sufix + "' id='MANDATORY' size='5' maxlength='4' value='' onKeypress='enterInteger(event)'>" +
             " <input type='text' name='E03DCCPDM_" + sufix + "' id='MANDATORY' size='3' maxlength='2' value='' onKeypress='enterInteger(event)'>" +
             " <input type='text' name='E03DCCPDD_" + sufix + "' id='MANDATORY' size='3' maxlength='2' value='' onKeypress='enterInteger(event)'>";
  } else {
    result = " <input type='text' name='E03DCCPDD_" + sufix + "' id='MANDATORY' size='3' maxlength='2' value='' onKeypress='enterInteger(event)'>" + 
             " <input type='text' name='E03DCCPDM_" + sufix + "' id='MANDATORY' size='3' maxlength='2' value='' onKeypress='enterInteger(event)'>" +
             " <input type='text' name='E03DCCPDY_" + sufix + "' id='MANDATORY' size='5' maxlength='4' value='' onKeypress='enterInteger(event)'>";
  }
  return(result);
}

</SCRIPT>

<h3 align="center">Detalle de la Cuota
  <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="bg_pln_maint.jsp, ELC5080"> 
</h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.bolgaran.JSELC5080" >
  <input type=hidden name="SCREEN" value="601">
  <input type=hidden name="opt" id="opt" value="1">
  <input type=hidden name="PLNROW" id="PLNROW" value=""<%=plnRow%>"">
  <input type=hidden name="DFORMAT"  value="<%=currUser.getE01DTF()%>">
  <input type=hidden name="TABLESIZE" id="TABLESIZE" value="10" >
  <input type=hidden name="E03DCCPDM_0" value="">
  <input type=hidden name="E03DCCPDD_0" value="">
  <input type=hidden name="E03DCCPDY_0" value="">
  <input type=hidden name="E03DCCCAM_0" value="">
  <input type=hidden name="E03DCCPFL_0" value="">

<%
  String code = request.getParameter("code") == null ? "" : request.getParameter("code").trim();
%>
  
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="15%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="35%" > 
              <div align="left"> 
                <eibsinput:text property="E03LCMCUN" name="header" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
              </div>
            </td>
            <td nowrap width="15%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap width="35%" > 
              <div align="left"> 
                <eibsinput:text property="E03CUSNA1" name="header" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" readonly="true"/>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="15%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="35%"> 
              <div align="left"> 
                <eibsinput:text property="E03LCMACC" name="header" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true"/>
              </div>
            </td>
            <td nowrap width="15%"> 
              <div align="right"><b>Total :</b></div>
            </td>
            <td nowrap width="35%"> 
              <div align="left"> 
                <eibsinput:text property="TOTCAM" id="TOTCAM" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true"/>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
 
  <table class="tbenter" width="100%" >
    <tr> 
      <td class="TDBKG"><a href="javascript:AddRow('DINTABLE', 1)">Agregar</a></td> 
      <td class="TDBKG"><a href="javascript:DeleteRowSel('DINTABLE','ROWSEL')">Eliminar</a></td>    
    </tr>
  </table>

  <table class="tableinfo" id="DINTABLE">
    <tr id="trdark">
      <th align=center width="5%">
        <input type="checkbox" name="SELALL" value="" onclick="setSelection(this.checked)">
      </th>
      <th nowrap width="15%"> 
        <div align="center">Cuota</div>
      </th>
      <th nowrap width="25%"> 
        <div align="center">Fecha</div>
      </th>
      <th nowrap width="30%"> 
        <div align="center">Monto</div>
      </th>
      <th nowrap width="25%"> 
        <div align="center">Estado</div>
      </th>
    </tr>
<%
    list.initRow();
    int row = 1;
    int actrow = 0;
    boolean readOnly = false;
    suma = 0;
    while (list.getNextRow()) {
      ELC508003Message datarec = (ELC508003Message) list.getRecord();
      if (datarec.getE03DCCPVI().equals("2") && datarec.getE03DCCCDE().equals(code)) {
        actrow++;
        readOnly = false;
        suma = suma + datarec.getBigDecimalE03DCCCAM().longValue();
%> 
    <tr id="trclear">
      <td align=center width="5%">
     <% if ( actrow == 1 ) { %>      
        <input type="hidden" name="E03DCCCDE" value="<%=datarec.getE03DCCCDE()%>" >
        <input type="hidden" name="E03DCCPVI" value="<%=datarec.getE03DCCPVI()%>" >
        <input type="hidden" name="E03DCCNAR" value="<%=datarec.getE03DCCNAR()%>" >
        <input type="hidden" name="E03DCCOBK" value="<%=datarec.getE03DCCOBK()%>" >
        <input type="hidden" name="E03DCCOBR" value="<%=datarec.getE03DCCOBR()%>" >
        <input type="hidden" name="E03DCCOCY" value="<%=datarec.getE03DCCOCY()%>" >
        <input type="hidden" name="E03DCCOGL" value="<%=datarec.getE03DCCOGL()%>" >
        <input type="hidden" name="E03DCCOAC" value="<%=datarec.getE03DCCOAC()%>" >
        <input type="hidden" name="E03DCCIVA" value="<%=datarec.getE03DCCIVA()%>" >
        <input type="hidden" name="E03DCCIVP" value="<%=datarec.getE03DCCIVP()%>" >
        <input type="hidden" name="E03DCCIVB" value="<%=datarec.getE03DCCIVB()%>" >
     <% } %>
     <% if ( !datarec.getE03DCCPFL().equals("") ) { %>      
     <%   readOnly = true; %>
     <% } %>
        <input type="checkbox" name="ROWSEL" value="<%= actrow %>" <%=readOnly?"disabled":""%> >
      </td>
      <td nowrap width="15%">
        <div align="center"> 
          <input type="text" name="E03DCCSEQ_<%= actrow %>" size="4" maxlength="3"  value="<%= datarec.getE03DCCSEQ() %>" readonly>
        </div>
      </td>
      <td nowrap width="25%">
        <div align="center"> 
     <% if ( currUser.getE01DTF().equals("YMD") ) { %> 
          <input type="text" name="E03DCCPDY_<%= actrow %>" id="MANDATORY" size="5" maxlength="4"  value="<%= datarec.getE03DCCPDY() %>" onKeypress="enterInteger(event)" <%=readOnly?"readonly":""%> >
          <input type="text" name="E03DCCPDM_<%= actrow %>" id="MANDATORY" size="3" maxlength="2"  value="<%= datarec.getE03DCCPDM() %>" onKeypress="enterInteger(event)" <%=readOnly?"readonly":""%> >
          <input type="text" name="E03DCCPDD_<%= actrow %>" id="MANDATORY" size="3" maxlength="2"  value="<%= datarec.getE03DCCPDD() %>" onKeypress="enterInteger(event)" <%=readOnly?"readonly":""%> >
     <% } else if ( currUser.getE01DTF().equals("MDY") ) { %>
          <input type="text" name="E03DCCPDM_<%= actrow %>" id="MANDATORY" size="3" maxlength="2"  value="<%= datarec.getE03DCCPDM() %>" onKeypress="enterInteger(event)" <%=readOnly?"readonly":""%> >
          <input type="text" name="E03DCCPDD_<%= actrow %>" id="MANDATORY" size="3" maxlength="2"  value="<%= datarec.getE03DCCPDD() %>" onKeypress="enterInteger(event)" <%=readOnly?"readonly":""%> >
          <input type="text" name="E03DCCPDY_<%= actrow %>" id="MANDATORY" size="5" maxlength="4"  value="<%= datarec.getE03DCCPDY() %>" onKeypress="enterInteger(event)" <%=readOnly?"readonly":""%> >
     <% } else { %>
          <input type="text" name="E03DCCPDD_<%= actrow %>" id="MANDATORY" size="3" maxlength="2"  value="<%= datarec.getE03DCCPDD() %>" onKeypress="enterInteger(event)" <%=readOnly?"readonly":""%> >
          <input type="text" name="E03DCCPDM_<%= actrow %>" id="MANDATORY" size="3" maxlength="2"  value="<%= datarec.getE03DCCPDM() %>" onKeypress="enterInteger(event)" <%=readOnly?"readonly":""%> >
          <input type="text" name="E03DCCPDY_<%= actrow %>" id="MANDATORY" size="5" maxlength="4"  value="<%= datarec.getE03DCCPDY() %>" onKeypress="enterInteger(event)" <%=readOnly?"readonly":""%> >
     <% } %>
        </div>
      </td>
      <td nowrap width="30%"> 
        <div align="center"> 
          <input type="text" name="E03DCCCAM_<%= actrow %>" id="MANDATORY" style="text-align: right" size="17" maxlength="15" value="<%=datarec.getE03DCCCAM()%>" onKeypress="enterDecimal(event, 2)" onchange="updateTotal();" <%=readOnly?"readonly":""%> >
        </div>
      </td>
      <td nowrap width="25%">
        <div align="center"> 
          <input type="hidden" name="E03DCCPFL_<%=actrow%>" size="2" maxlength="1" value="<%=datarec.getE03DCCPFL()%>" readonly >
          <% if (datarec.getE03DCCPFL().equals(""))  out.print("PENDIENTE"); %>
          <% if (datarec.getE03DCCPFL().equals("P")) out.print("PAGADA"); %>
          <% if (datarec.getE03DCCPFL().equals("A")) out.print("ANULADA"); %>
        </div>
      </td>
    </tr>
<%    } %> 
<%  } %>
  </table>

  <br>
  <table id="RESUMEN" class="tbenter" >
    <tr>
      <td width="5%">&nbsp;</td>
      <td width="15%">&nbsp;</td>                       
      <td align="right" nowrap width="25%"><b>TOTAL : </b></td>
      <td align="center" nowrap width="30%"><b><%=datapro.eibs.master.Util.formatCCY(suma)%></b></td>
      <td width="25%">&nbsp;</td>
    </tr>       
  </table>    

  <div align="center">
    <table class="tbenter" class="tbenter">
      <tr>
        <td align="right"><input id="EIBSBTN" type="button" name="Submit" OnClick="goSend(this)" value="Enviar"></td>
        <td >&nbsp;</td>
        <td align="left"><input id="EIBSBTN" type=button   name="Submit" OnClick="checkClose()" value="Salir"></td>
      </tr>
    </table> 
  </div>

</form>

<SCRIPT type="text/javascript">
  updateTableSize(parseFloat("<%=actrow%>")); 
  getElement('TOTCAM').value = "<%=datapro.eibs.master.Util.formatCCY(suma)%>";
</SCRIPT>

<% if ("S".equals(request.getAttribute("ACT"))) { %>
<script type="text/javascript">
  window.opener.location.href = '<%=request.getContextPath()%>/servlet/datapro.eibs.bolgaran.JSELC5080?SCREEN=600&IFRAME=Y&E03DCCACC=<%=userPO.getAccNum()%>';           
  cerrarVentana();      
</script>
<% } %>  

</body>
</html>
