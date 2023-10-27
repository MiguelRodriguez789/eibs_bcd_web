<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.ESD020401Message"%>
<%@page import="com.datapro.constants.EibsFields"%>

<HTML>
<HEAD>
<TITLE>Cobro de Comisiones Manuales</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "holduncoll" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/events.js"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

  function goAction(op) {

    document.forms[0].SCREEN.value = op;
	if (op == '3') {
    	if (confirm("Desea eliminar este registro seleccionado?")) {
			document.forms[0].submit();		
			}
    } else {
		document.forms[0].submit();
	}  

  }
  
function closeHiddenDivNew(){
	setVisibility(getElement("hiddenDivNew"), "hidden");
}

function showHiddenDivNew(evt) {
	evt = (evt) ? evt : ((window.event) ? window.event : "");
 	
	var hiddenDivNew = getElement("hiddenDivNew");

	var y=evt.clientY + document.body.scrollTop;
	var x=evt.clientX + document.body.scrollLeft;
     
	cancelBub(evt);

	moveElement(hiddenDivNew, y, x);
	setVisibility(hiddenDivNew, "visible");
	 
}

addEventHandler(document, 'click' ,closeHiddenDivNew);

</script>
</head>

<body >
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }

%> 
<h3 align="center">Cobro de Comisiones Manuales<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="manual_fees.jsp , ESD0204"></h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0204" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
<INPUT TYPE=HIDDEN NAME="E01UNCSEQ" value= "<%= userPO.getHeader12() %>">
        <table class="tableinfo">
            <tr bordercolor="#FFFFFF"> 
              <td nowrap> 
                <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
                  <tr id="trdark"> 
                    <td nowrap width="10%" > 
                      <div align="right"><b>Cliente :</b></div>
                    </td>
                    <td nowrap width="20%" > 
                      <div align="left"><b> 
                        <input type="text" readonly name="E01CACCUN" size="10" maxlength="9" value="<%= userPO.getCusNum().trim()%>" >
                        </b> </div>
                    </td>
                    <td nowrap width="10%" > 
                      <div align="right"><b>Nombre :</b> </div>
                    </td>
                    <td nowrap width="30%" > 
                      <div align="left"> 
                        <input type="text" name="E01CUSNA1" size="45" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
                        </div>
                    </td>
		            <td nowrap width="10%"> 
		            </td>
		            <td nowrap width="20%"> 
		            </td>
                  </tr>
                  <tr id="trdark"> 
                    <td nowrap width="10%"> 
                      <div align="right"><b>Cuenta :</b></div>
                    </td>
                    <td nowrap width="20%"> 
                      <div align="left"> 
                        <input type="text" name="E01CACACC" size="13" maxlength="12" value="<%= userPO.getAccNum().trim()%>" readonly>
                      </div>
                    </td>
                    <td nowrap width="10%"> 
                      <div align="right"><b>Moneda :</b></div>
                    </td>
                    <td nowrap width="30%"> 
                      <div align="left"><b> 
                        <input type="text" name="E01CACCCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                        </b> </div>
                    </td>
                    <td nowrap width="10%"> 
                      <div align="right"><b> Producto :</b></div>
                    </td>
                    <td nowrap width="20%"> 
                      <div align="left"><b> 
                        <input type="text" name="E01CACPRO" size="4" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>">
                        </b> </div>
                    </td>
                  </tr>               
                </table>
              </td>
            </tr>
          </table>

<% 	if ( holduncoll.getNoResult() ) {  %>
		<p align="center"><b>No hay resultados para su b&uacute;squeda</b></p>
          <table class="tbenter" width=100% align=center>
           <tr>
           
      <% if( !"1".equals( currUser.getH01WK1() ) ){ %>
		      <td class=TDBKG width="25%"> 
					<div align="center" style="cursor:hand" ><a href="javascript:goAction(1)"><b>Crear</b></a></div>
		      </td>     
      <% } %>

	          <td class=TDBKG>
	                <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
	          </td>
           </tr>
         </table>
         
<% } else { %>

  <table class="tbenter" width=100% align=center>
    <tr> 
      <% if( "1".equals( currUser.getH01WK1() ) ){ %>
	      <td class=TDBKG width="25%"> 
	        <div align="center"><a href="javascript:goAction(2)"><b>Consultar</b></a></div>
	      </td>     
      <% } else { %>

	      <td class=TDBKG width="25%"> 
	        <div align="center" style="cursor:hand" ><a href="javascript:goAction(1)"><b>Crear</b></a></div>
	      </td>
	      <td class=TDBKG width="25%"> 
	        <div align="center"><a href="javascript:goAction(2)"><b>Modificar</b></a></div>
	      </td>
	      <td class=TDBKG width="25%"> 
	        <div align="center"><a href="javascript:goAction(3)"><b>Borrar</b></a></div>
	      </td>

      <% } %>

	      <td class=TDBKG width="25%"> 
	        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
	      </td>

    </tr>
  </table>
   
  <br>
  
  <%int row = 0; %>
  <table  id=cfTable class="tableinfo" height="70%">
   
 	<tr height="5%">  
    <td NOWRAP valign="top" width="95%">
        <table id="headTable" width="100%">    
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
	      <TH ALIGN=center nowrap width="10%" >&nbsp;</TH>
	      <TH ALIGN=center nowrap width="15%">Secuencia</TH>
	      <TH ALIGN=center nowrap width="15%">Fecha<br>Proceso</TH>
	      <TH ALIGN=center nowrap width="15%">Comision</TH>
	      <TH ALIGN=center nowrap width="30%">Descripcion</TH>
	      <TH ALIGN=center nowrap width="15%">Valor Comision</TH>
	    </tr>
        </table>
       </td>
     </tr>
	    
          	<tr  height="100%"> 
          	<td nowrap="nowrap">     
          	<div id="dataDiv1" style="height:400px; overflow:auto;">   
			<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">

		<%
			holduncoll.initRow();
			boolean firstTime = true;
			String chk = "";
       		while (holduncoll.getNextRow()) {
				if (firstTime) {
					firstTime = false;
					chk = "checked";
				} else {
					chk = "";
				}
				ESD020401Message msgList= (ESD020401Message) holduncoll.getRecord();
				
		 %>
				<tr id="dataTable<%= holduncoll.getCurrentRow() %>">
						
					<td nowrap  ALIGN=center width="10%"><input type="radio" name="CURRCODE" value="<%= holduncoll.getCurrentRow() %>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= holduncoll.getCurrentRow() %>)"></td>
					<td nowrap  ALIGN=center width="15%"><a href="javascript:goAction('2');"><%= msgList.getE01CACSEQ() %></a></td>
					<td nowrap  ALIGN=center width="15%"><a href="javascript:goAction('2');"><%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),msgList.getBigDecimalE01CACRDM().intValue(),msgList.getBigDecimalE01CACRDD().intValue(),msgList.getBigDecimalE01CACRDY().intValue()) %></a></td>
					<td nowrap  ALIGN=center width="15%"><a href="javascript:goAction('2');"><%= msgList.getE01CACCDE() %></a></td>	
					<td nowrap  ALIGN=left width="30%"><a href="javascript:goAction('2');"><%= msgList.getD01CACCDE() %></a></td>
					<td nowrap  ALIGN=right width="15%"><a href="javascript:goAction('2');"><%= msgList.getE01CACCOA() %></a></td>
				</tr>

    <% } %> 
  </TABLE>
  </div>
  </td>
  </tr>
  </table>
	
  <% } %>
   
</FORM>

<SCRIPT type="text/javascript">
  
  showChecked("CURRCODE");
  //getElement("hiddenDivNew").onclick=cancelBub;
  //getElement("eibsNew").onclick=showHiddenDivNew; 
  
</SCRIPT>


</BODY>
</HTML>
