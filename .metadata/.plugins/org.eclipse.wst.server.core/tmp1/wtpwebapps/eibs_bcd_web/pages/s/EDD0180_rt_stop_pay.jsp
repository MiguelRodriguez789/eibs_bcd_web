<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EDD018001Message"%>
<%@page import="com.datapro.constants.EibsFields"%>


<HTML>
<HEAD>
<TITLE> Parar Pagos</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "stop" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

  function goAction(op) {

    document.forms[0].SCREEN.value = op;
	if (op == '3') {
    	if (confirm("Desea Eliminar este Registro seleccionado?")) {
			document.forms[0].submit();		
			}
	} else 	if (op == '5') {
    	if (confirm("Desea Aclarar este Registro seleccionado?")) {
			document.forms[0].submit();		
			}
    } else {
		document.forms[0].submit();
	}  

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

addEventHandler(document, 'click', closeHiddenDivNew);

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
<h3 align="center">Suspensiones de Pagos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_stop_pay.jsp , EDD0180"></h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0180">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
<INPUT TYPE=HIDDEN NAME="opt" VALUE="1">

<% if ( stop.getNoResult() ) { %>

<TABLE class="tbenter" width=100% height=90%>
	<TR>
      <TD> 
        <div align="center"> 
          <table class="tableinfo">
            <tr > 
              <td nowrap> 
                <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
                  <tr id="trdark"> 
                    <td nowrap width="16%" > 
                      <div align="right"><b>Cliente :</b></div>
                    </td>
                    <td nowrap width="20%" > 
                      <div align="left"><b> 
                        <input type="text" readonly name="E02STPCUN" size="10" maxlength="9" value="<%= userPO.getCusNum().trim()%>" >
                        </b> </div>
                    </td>
                    <td nowrap width="16%" > 
                      <div align="right"><b>Nombre :</b> </div>
                    </td>
                    <td nowrap width="16%" > 
                      <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
                        <input type="text" name="E02CUSNA1" size="45" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
                        </font></font></font></div>
                    </td>
                    <td nowrap width="16%" > 
                      <div align="right"><b></b> </div>
                    </td>
                    <td nowrap width="16%" > 
                      <div align="left"></div>
                    </td>
                  </tr>
                  <tr id="trdark"> 
                    <td nowrap width="16%"> 
                      <div align="right"><b>Cuenta :</b></div>
                    </td>
                    <td nowrap width="20%"> 
                      <div align="left"> 
                        <input type="text" name="E01STPACC" size="13" maxlength="12" value="<%= userPO.getAccNum().trim()%>" readonly>
                      </div>
                    </td>
                    <td nowrap width="16%"> 
                      <div align="right"><b>Moneda : </b></div>
                    </td>
                    <td nowrap width="16%"> 
                      <div align="left"><b> 
                        <input type="text" name="E02STPCCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                        </b> </div>
                    </td>
                    <td nowrap width="16%"> 
                      <div align="right"><b>Producto: </b></div>
                    </td>
                    <td nowrap width="16%"> 
                      <div align="left"><b> 
                        <input type="text" name="E02STPPRO" size="4" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>">
                        </b> </div>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
          <p>&nbsp;</p>
          <p><b>No hay resultados para su b&uacute;squeda</b></p>
          <table class="tbenter" width="100%">
            <tr> 
              <td class=TDBKG> <a href="javascript:goAction(1)"><b>Crear</b></a></td>
              <td class=TDBKG> <a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></td>
            </tr>
          </table>
          <p>&nbsp; </p>
        </div>
      </TD></TR>
   		</TABLE>
  <% }else {%> 
  
          <table class="tableinfo">
            <tr > 
              <td nowrap> 
                <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
                  <tr id="trdark"> 
                    <td nowrap width="16%" > 
                      <div align="right"><b>Cliente :</b></div>
                    </td>
                    <td nowrap width="20%" > 
                      <div align="left"><b> 
                        <input type="text" readonly name="E02STPCUN" size="10" maxlength="9" value="<%= userPO.getCusNum().trim()%>" >
                        </b> </div>
                    </td>
                    <td nowrap width="16%" > 
                      <div align="right"><b>Nombre :</b> </div>
                    </td>
                    <td nowrap width="16%" > 
                      <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
                        <input type="text" name="E02CUSNA1" size="45" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
                        </font></font></font></div>
                    </td>
                    <td nowrap width="16%" > 
                      <div align="right"><b></b> </div>
                    </td>
                    <td nowrap width="16%" > 
                      <div align="left"></div>
                    </td>
                  </tr>
                  <tr id="trdark"> 
                    <td nowrap width="16%"> 
                      <div align="right"><b>Cuenta :</b></div>
                    </td>
                    <td nowrap width="20%"> 
                      <div align="left"> 
                        <input type="text" name="E01STPACC" size="13" maxlength="12" value="<%= userPO.getAccNum().trim()%>" readonly>
                      </div>
                    </td>
                    <td nowrap width="16%"> 
                      <div align="right"><b>Moneda : </b></div>
                    </td>
                    <td nowrap width="16%"> 
                      <div align="left"><b> 
                        <input type="text" name="E02STPCCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                        </b> </div>
                    </td>
                    <td nowrap width="16%"> 
                      <div align="right"><b>Producto: </b></div>
                    </td>
                    <td nowrap width="16%"> 
                      <div align="left"><b> 
                        <input type="text" name="E02STPPRO" size="4" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>">
                        </b> </div>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
          
 <table class="tbenter" width=100% align=center>
    <tr> 
      <td class=TDBKG width="10%"> 
        <div align="center" style="cursor:hand" ><a href="javascript:goAction(1)"><b>Crear</b></a></div>
      </td>
      <td class=TDBKG width="10%"> 
        <div align="center"><a href="javascript:goAction(2)"><b>Modificar</b></a></div>
      </td>
      <td class=TDBKG width="10%"> 
        <div align="center"><a href="javascript:goAction(3)"><b>Borrar</b></a></div>
      </td>
      <td class=TDBKG width="10%"> 
        <div align="center"><a href="javascript:goAction(5)"><b>Aclarar</b></a></div>
      </td>
     <td class=TDBKG width="10%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </td>
    </tr>
  </table>
 <TABLE  id="mainTable" class="tableinfo"  height="60%" width="80%">
 <tr height="5%"> 
   <td NOWRAP valign="top" width="80%" >
        <TABLE id="headTable" width="100%">
          <TR id="trdark"> 
            <TH ALIGN=CENTER rowspan="2" NOWRAP width="5%" ></TH>
            <TH ALIGN=CENTER colspan="4" NOWRAP width="50%">Cheques</TH>
            <TH ALIGN=CENTER rowspan="2" NOWRAP width="15%">Monto</TH>
            <TH ALIGN=CENTER rowspan="2" NOWRAP width="30%">Comentarios</TH>
    	 </TR>
    	 <TR id="trdark">  
            <TH ALIGN=CENTER NOWRAP width="12.5%">Secuencia</TH>
            <TH ALIGN=CENTER NOWRAP width="12.5%">Desde</TH>
            <TH ALIGN=CENTER NOWRAP width="12.5%">Hasta</TH>
            <TH ALIGN=CENTER NOWRAP width="13.5%">Fecha</TH> 
    	 </TR>
   		</TABLE>
   </td>
 </tr>
    
          	<tr  height="100%"> 
          	<td nowrap="nowrap">     
          	<div id="dataDiv1" style="width:100%; height:100%; overflow:auto;">  
			<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">
		<%
			stop.initRow();
			String stringDate;
			boolean firstTime = true;
			String chk = "";
       		while (stop.getNextRow()) {
				if (firstTime) {
					firstTime = false;
					chk = "checked";
				} else {
					chk = "";
				}
				EDD018001Message msgList= (EDD018001Message) stop.getRecord();
				
		 %>
	<tr id="dataTable<%= stop.getCurrentRow() %>">
	    <td nowrap  ALIGN=center width="5%"><input type="radio" name="CURRCODE" value="<%= stop.getCurrentRow() %>" <%=chk%> onClick="highlightRow('dataTable', <%= stop.getCurrentRow() %>)"></td>
		<td nowrap  ALIGN=center width="8%"><a href="javascript:goAction('2');"><%= msgList.getE01STPSEQ() %></a></td>
		<td nowrap  ALIGN=right width="12%"><a href="javascript:goAction('2');"><%= msgList.getE01STPFCK() %></a></td>
		<td nowrap  ALIGN=right width="12%"><a href="javascript:goAction('2');"><%= msgList.getE01STPTCK() %></a></td>	
		<td nowrap  ALIGN=center width="18%"><a href="javascript:goAction('2');"><%= Util.formatCustomDate(currUser.getE01DTF(), msgList.getBigDecimalE01STPCKM().intValue(), msgList.getBigDecimalE01STPCKD().intValue(), msgList.getBigDecimalE01STPCKY().intValue()) %></a></td>
		<td nowrap  ALIGN=right width="15%"><a href="javascript:goAction('2');"><%= msgList.getE01STPAMT()+ " " %></a></td>
		<td nowrap  ALIGN=left width="30%"><a href="javascript:goAction('2');"><%= msgList.getE01STPRMK() %></a></td>
   </tr>
    <% } %>
  </table>
   </div>
   </td>
   </tr>
   </TABLE>
   
   <% } %>
   
   </FORM>
      
<SCRIPT type="text/javascript">
  
  showChecked("CURRCODE");
  document.getElementById("hiddenDivNew").onclick=cancelBub;
  document.getElementById("eibsNew").onclick=showHiddenDivNew; 
  
</SCRIPT>

</BODY>
</HTML>
