
<%@ page import = "datapro.eibs.master.Util" %>

<%@page import="datapro.eibs.beans.EDI001002Message"%>
<%@page import="datapro.eibs.beans.EDI011002Message"%><html>
<head>
<title>Documentos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/dynTable.js"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/Ajax.js"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/cnofc.js"> </SCRIPT>
<%@ taglib uri="/WEB-INF/datapro-dyntable.tld" prefix="dyntable" %>
<jsp:useBean id="dftDoc" class="datapro.eibs.beans.EDL080002Message"  scope="session" />
<jsp:useBean id="lstScanDocuments" class="datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<SCRIPT type="text/javascript">

</SCRIPT>

</head>
<body>
<h3 align="center">Documentos del Deudor<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="dft_acceptor_doc_list.jsp,EDL0800"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0800" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1801">
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
		   <td nowrap width="16%"> 
		  <div align="right">Identificación :</div>
		  </td>
		  <td nowrap width="20%"> 
		  <input type="text" name="E02DLDDID" size="18" maxlength="2" value="<%= dftDoc.getE02DLDDID() %>" readonly>
		  </td>
		  <td nowrap width="16%">
		  <div align="right">Nombre :</div>
		  </td>
		  <td nowrap width="20%">
		  <input type="text" name="E02DLDNME" size="35" maxlength="30" value="<%= dftDoc.getE02DLDNME() %>" readonly>
		  </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <TABLE class="tbenter" width="100%">
    <TR> 
      <TD ALIGN=CENTER  class=TDBKG> <a href="javascript:goAction(1)"><b>Actualizar</b></a> 
      </TD>
      <TD ALIGN=CENTER  class=TDBKG> <a href="javascript:goAction(2)"><b>Escanear</b></a> 
      </TD>
      <TD ALIGN=CENTER   class=TDBKG> <a href="javascript:goAction(3)"><b>Visualizar</b></a> 
      </TD>
		<TD ALIGN=CENTER   class=TDBKG> <a href="javascript:AddRow('dataTable')"><b>Agregar</b></a> 
      </TD>   	      
      <TD ALIGN=CENTER   class=TDBKG> <a href="javascript:goAction(4)"><b>Limpiar</b></a> 
      </TD>
      <TD ALIGN=CENTER  class=TDBKG> <a href="<%=request.getContextPath()%>/pages/background.jsp" ><b>Salir</b></a> 
      </TD>
    </TR>
  </TABLE>
  
<%
if ( lstScanDocuments.getNoResult() ) {
%>
  
  <TABLE class="tbenter" width=100% height=20%>
    <TR>
      <TD> 
        <div align="center">
          <font size="3"><b>
        	No hay documentos asignados
          </b></font>
        </div>
      </TD>
    </TR>
  </TABLE>

<%   		
} else {
%>

<TABLE  id="mainTable" class="tableinfo"  >
	<TR id="TRCLEAR"> 
    	<TH NOWRAP ALIGN=CENTER colspan="2"><b>Sec.</b></TH>
        <TH NOWRAP ALIGN=CENTER><b>Descripción</b></TH>
        <TH NOWRAP ALIGN=CENTER><b>Frecuencia</b></TH>
        <TH NOWRAP ALIGN=CENTER><b>Estado</b></TH>
        <TH NOWRAP ALIGN=CENTER><b>Fecha Venc.</b></TH>
        <TH NOWRAP ALIGN=CENTER><b>Comentarios</b></TH>
	</TR>
            <%
                lstScanDocuments.initRow();
                while (lstScanDocuments.getNextRow()) {
                	EDI011002Message scanDoc = (EDI011002Message)lstScanDocuments.getRecord(); 
  %>
            <TR id="TRCLEAR"> 
              <TD NOWRAP ALIGN=CENTER><INPUT TYPE="radio" NAME="ROW" VALUE="<%= lstScanDocuments.getCurrentRow() %>" <% if (lstScanDocuments.getCurrentRow() == 0) out.print("checked"); %> onClick="showAddInfo(<%= lstScanDocuments.getCurrentRow() %>)"></TD>
              <TD NOWRAP ALIGN=CENTER><INPUT TYPE="TEXT" NAME="E01DCISEQ_<%= lstScanDocuments.getCurrentRow() %>" VALUE="<%= scanDoc.getE02DIDSEQ() %>" SIZE=2 MAXLENGTH=4 READONLY></TD>
              <TD NOWRAP ALIGN=CENTER><INPUT TYPE="TEXT" NAME="E01DCIDES_<%= lstScanDocuments.getCurrentRow() %>" VALUE="<%= scanDoc.getE02DIDDES() %>" SIZE=35 MAXLENGTH=35 READONLY></TD>
              <TD NOWRAP ALIGN=CENTER> 
                <SELECT NAME="E01DCIFRE_<%= lstScanDocuments.getCurrentRow() %>">
                  <OPTION value="M" <% if (scanDoc.getE02DIDFRE().equals("M")) out.print("selected"); %>>MENSUAL</OPTION>
                  <OPTION value="B" <% if (scanDoc.getE02DIDFRE().equals("B")) out.print("selected"); %>>BIMENSUAL</OPTION>
                  <OPTION value="Q" <% if (scanDoc.getE02DIDFRE().equals("Q")) out.print("selected"); %>>CUATRIMESTRAL</OPTION>
                  <OPTION value="S" <% if (scanDoc.getE02DIDFRE().equals("S")) out.print("selected"); %>>SEMESTRAL</OPTION>
                  <OPTION value="X" <% if (scanDoc.getE02DIDFRE().equals("X")) out.print("selected"); %>>SIN VENCIMIENTO</OPTION>
                  <OPTION value="1" <% if (scanDoc.getE02DIDFRE().equals("1")) out.print("selected"); %>>CADA UN AÑO</OPTION>
                  <OPTION value="2" <% if (scanDoc.getE02DIDFRE().equals("2")) out.print("selected"); %>>CADA DOS AÑOS</OPTION>
				  <OPTION value="3" <% if (scanDoc.getE02DIDFRE().equals("3")) out.print("selected"); %>>CADA TRES AÑOS</OPTION>
                  <OPTION value="4" <% if (scanDoc.getE02DIDFRE().equals("4")) out.print("selected"); %>>CADA CUATRO AÑOS</OPTION>
                  <OPTION value="5" <% if (scanDoc.getE02DIDFRE().equals("5")) out.print("selected"); %>>CADA CINCO AÑOS</OPTION>
                </SELECT>
              </TD>
              <TD NOWRAP ALIGN=CENTER> 
      			<SELECT id="E01DCISTA_<%= lstScanDocuments.getCurrentRow() %>" name="E01DCISTA_<%= lstScanDocuments.getCurrentRow() %>" 
      				style="min-width: 260px; max-width: 260px; width: 260px;"
		    		onclick="CNOFCSelect('17', 'E01DCISTA_<%= lstScanDocuments.getCurrentRow() %>').getFilter(this)">
		    	</SELECT>
              </TD>
              <TD NOWRAP ALIGN=CENTER>
				<INPUT TYPE="TEXT" NAME="E02DIDIS1_<%= lstScanDocuments.getCurrentRow() %>" VALUE="<%= scanDoc.getE02DIDIS1() %>" SIZE=3 MAXLENGTH=2 onkeypress="enterInteger(event)" readonly>
              	<INPUT TYPE="TEXT" NAME="E02DIDIS2_<%= lstScanDocuments.getCurrentRow() %>" VALUE="<%= scanDoc.getE02DIDIS2() %>" SIZE=3 MAXLENGTH=2 onkeypress="enterInteger(event)" readonly>
              	<INPUT TYPE="TEXT" NAME="E02DIDIS3_<%= lstScanDocuments.getCurrentRow() %>" VALUE="<%= scanDoc.getE02DIDIS3() %>" SIZE=3 MAXLENGTH=2 onkeypress="enterInteger(event)" readonly>             
              </TD > 
              <%-- %><TD NOWRAP ALIGN=CENTER><INPUT TYPE="TEXT" NAME="E01DCICOM_<%= lstScanDocuments.getCurrentRow() %>" VALUE="<%= scanDoc.getE02DIDCOM() %>" SIZE=35 MAXLENGTH=30 ></TD>--%>
            </TR>
            		
            <%
                }
                  
      %>            
</TABLE>
<%   		
} 
%>
</form>
<script type="text/javascript">
function goAction(op) {	 
	if (op == 4) {
		var where_to= confirm("¿Está seguro que quiere eliminar los documentos?");
	 	if (where_to == false) {
	 		return;
		}
	}

	document.forms[0].opt.value = op;
	var formLength= document.forms[0].elements.length;
	var ok = false;
	var en = '';
	for(n=0;n<formLength;n++) {
    	var elementName= document.forms[0].elements[n].name;
		if(elementName == "ROW") {
			if (document.forms[0].elements[n].checked == true) {
        		ok = true;
				en = 'E01DCISTA_' + document.forms[0].elements[n].value;
        		break;
			}
		}
	}
	if ( ok ) {
		if (op == 2 || op == 4) {
			for(n=0;n<formLength;n++) {
      			var l = document.forms[0].elements[n].name;
      			if(l == en) {
      				if (op == 2) {
						document.forms[0].elements[n].value = 'CO';
					} else if (op == 4) {
						document.forms[0].elements[n].value = '';
					}
					break;
				}
			}
   		}
		document.forms[0].submit();
	} else {
		alert("Seleccione un documento antes de realizar esta operación");	   
	}
}  
</script>

</body>
</html>
