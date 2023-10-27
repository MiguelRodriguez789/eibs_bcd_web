<%@ page import ="datapro.eibs.master.Util" %>
<HTML>
<HEAD>
<TITLE>
Lista de Garantías
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "gaMant" class= "datapro.eibs.beans.ERA001101Message"  scope="session"/>
<jsp:useBean id= "collList" class= "datapro.eibs.beans.JBObjList"  scope="session" /> 
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/> 
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
   
function setOptMenu(purpose) {
	if (purpose == "INQUIRY") {
    	builtNewMenu(colla_i_opt);
	} else {
		if (purpose == "APPROVAL_INQ") {
    		builtNewMenu(colla_A_opt);
    	} else {	
    		builtNewMenu(colla_M_opt);
    	}
    }		
    initMenu();
}
    
</SCRIPT>

<script type="text/javascript">
<!--
//-->
function goAction(op) {
    document.forms[0].opt.value = op;
    if (op == 3) {// Ask for confirmation in order to delete
		if (!confirm("Esta seguro que desea eliminar este detalle?")) return;
	}
	if (op==1) { //New
		document.forms[0].actRow.value = -1;
	}
	document.forms[0].submit();
}

//-->
function showAddInfo(idxRow, seq){
   for ( var i=0; i<dataTable.rows.length; i++ ) {
       dataTable.rows[i].className="trnormal";
    }
   dataTable.rows[idxRow].className="trhighlight";
   document.forms[0].actRow.value = idxRow;
   document.forms[0].SEQ.value = seq;
} 
</script>

<SCRIPT type="text/javascript">
	setOptMenu("<%= userPO.getPurpose() %>");
</SCRIPT>


</head>

<body onLoad="MM_preloadImages('<%=request.getContextPath()%>/images/s/nueva_over.gif','<%=request.getContextPath()%>/images/s/modificar_over.gif','<%=request.getContextPath()%>/images/s/exit_over.gif','<%=request.getContextPath()%>/images/s/delete_over.gif')">
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%> 

<h3 align="center">Listado de Otras Inscripciones</h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0011">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
<INPUT TYPE=HIDDEN NAME="opt" VALUE="1">
<INPUT TYPE=HIDDEN NAME="actRow" VALUE="">
<INPUT TYPE=HIDDEN NAME="SEQ" VALUE="">

<%
	if ( collList.getNoResult() ) {
       String action = "";
	   try {
			action = userPO.getHeader20();
			userPO.setHeader20("");
       } catch (Exception e) {
       		action = "";
       }
       String pagename = "";
       try {
       		pagename = userPO.getHeader21();
       		userPO.setHeader21("");
       } catch (Exception e) {
       		pagename = "";
       }
       if ( action.equals("DO_MAINT") || action.equals("DO_NEW")) {
%>
       		<SCRIPT type="text/javascript">
<% 
            if ( !pagename.equals("") ) {
%>
	   			CenterWindow('<%= pagename %>',620,500,2);
<% 
            }
%>
            </SCRIPT>
<% 
		}
%> 
   		<TABLE class="tbenter" width=100% height=90%>
   			<TR>
      			<TD> 
        			<div align="center"> 
          				<table class="tableinfo">
            				<tr> 
              					<td nowrap> 
                					<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
                  						<tr id="trdark"> 
                    						<td nowrap><div align="right"><b>Cliente :</b></div></td>
                    						<td nowrap><div align="left"><%=userPO.getCusNum().trim()%></div></td>
                    						<td nowrap><div align="right"><b>Nombre :</b></div></td>
                    						<td nowrap><div align="left"><%= userPO.getCusName().trim()%></div></td>
                    						<td nowrap><div align="right"><b>Referencia :</b></div></td>
                    						<td nowrap><%= userPO.getIdentifier().trim()%></td>
                  						</tr>
                					</table>
              					</td>
            				</tr>
          				</table>
          				<p>&nbsp;</p>
          				<p><b>El cliente seleccionado a&uacute;n no posee Garant&iacute;as 
            				  asignadas.</b></p>
        			</div>
      			</TD>
      		</TR>
   		</TABLE>
<% 	} else {
      	String action = "";
		try {
			action = userPO.getHeader20();
			userPO.setHeader20("");
        } catch (Exception e) {
       		action = "";
        }
        String pagename = "";
        try {
       	 	pagename = userPO.getHeader21();
       	 	userPO.setHeader21("");
        } catch (Exception e) {
       		pagename = "";
       	}               
       if ( action.equals("DO_MAINT") || action.equals("DO_NEW")) {
%>
       		<SCRIPT type="text/javascript">
<% 
            	if ( !pagename.equals("") ) {
%>
	   			CenterWindow('<%= pagename %>',620,500,2);
<% 
              	}
%>
             </SCRIPT>
<% 
		}
%> 

		<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
		<table class="tableinfo">
    		<tr> 
      			<td nowrap> 
        			<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          				<tr id="trdark"> 
            				<td nowrap width="50%"><div align="right"><b>Referencia :</b></div></td>
            				<td nowrap width="50%"><%= userPO.getIdentifier().trim()%></td>
          				</tr>
        			</table>
      			</td>
    		</tr>
		</table>

		<h4>Inscripción Principal</h4>

		<TABLE class="tableinfo">
			<TR id="trdark"> 
				<TH ALIGN=CENTER NOWRAP>Codigo Cliente</TH>
				<TH ALIGN=CENTER NOWRAP>ID</TH>
				<TH ALIGN=CENTER NOWRAP>Oficina<BR>Propietaria</TH>
				<TH ALIGN=CENTER NOWRAP>Grado</TH>
				<TH ALIGN=CENTER NOWRAP>Valor Limite</TH>
				<TH ALIGN=CENTER NOWRAP>Ltda<BR>Oper</TH>
				<TH ALIGN=CENTER NOWRAP>Balance<BR>V. Limite</TH>
				<TH ALIGN=CENTER NOWRAP>Fecha<BR>Vencimiento</TH>
			</TR>
			<TR>
				<td nowrap align="center"><%= gaMant.getE01ROCCUN() %></td>
				<td nowrap align="center"><%= gaMant.getE01RUTO01() %></td>
				<td nowrap align="center"><%= gaMant.getE01ROCOF2() %></td>
				<td nowrap align="center"><%= gaMant.getE01ROCUC1() %></td>
				<td nowrap align="center"><%= gaMant.getE01ROCAPA() %></td>
				<td nowrap align="center"><%= (gaMant.getE01ROCUC2().equals("S") ? "SI" : "NO") %></td>
				<td nowrap align="center"><%= gaMant.getE01ROCAM2() %></td>
				<td nowrap align="center"><%= Util.formatCustomDate(currUser.getE01DTF(),
													gaMant.getBigDecimalE01ROCMTM().intValue(),
													gaMant.getBigDecimalE01ROCMTD().intValue(),
													gaMant.getBigDecimalE01ROCMTY().intValue()) %></td>
			</TR>
		</table>

		<h4>Otras inscripciones</h4>

 		<TABLE  id="mainTable" class="tableinfo">
 			<TR> 
   				<TD NOWRAP valign="top">
        			<TABLE id="headTable">
          				<TR id="trdark"> 
				            <TH ALIGN=CENTER NOWRAP>Cod.<br>Cliente</TH>
				            <TH ALIGN=CENTER NOWRAP>Oficina<BR>Propietaria</TH>
				            <TH ALIGN=CENTER NOWRAP>Grado</TH>
				            <TH ALIGN=CENTER NOWRAP>Valor Limite</TH>
				            <TH ALIGN=CENTER NOWRAP>Limitada<BR>Opereración</TH>
				            <TH ALIGN=CENTER NOWRAP>Estado<BR>Cliente</TH>
          				</TR>
        			</TABLE>
        
    				<div id="dataDiv1" class="scbarcolor" style="padding:0">
        				<table id="dataTable">
    					<%
					         int row;
							 try{row = Integer.parseInt(request.getParameter("ROW"));}catch(Exception e){row = 0;}
					         collList.initRow();
					         int k=1;
					         while (collList.getNextRow()) {
					         	datapro.eibs.beans.ERA001102Message collDet = (datapro.eibs.beans.ERA001102Message) collList.getRecord();                   
					     %> 
	            				<TR> 
					              	<TD ALIGN=CENTER NOWRAP><%= Util.formatCell(collDet.getE02RODCUN()) %></TD>
					              	<TD ALIGN=CENTER NOWRAP><%= Util.formatCell(collDet.getE02RODOFN()) %></TD>
					              	<TD ALIGN=CENTER NOWRAP><%= Util.formatCell(collDet.getE02RODUC1()) %></TD>
					              	<TD ALIGN=CENTER NOWRAP><%= Util.fcolorCCY(collDet.getE02RODAMT()) %></TD>
					              	<TD ALIGN=CENTER NOWRAP><%= (collDet.getE02RODUC2().equals("S") ? "SI" : "NO") %></TD>
					              	<TD ALIGN=CENTER NOWRAP><%= Util.formatCell(collDet.getE02RODEST()) %></TD>
	            				</TR>
      					<%
              					k++;
         					}        
    					%> 
          				</table>
   					</div>
   				</TD>
  			</TR>	
		</TABLE>
      
		<SCRIPT type="text/javascript">
		  document.forms[0].totalRow.value="<%= k %>";
		  function resizeDoc() {
		       divResize();
		       adjustEquTables(getElement("headTable"), getElement("dataTable"), getElement("dataDiv1"),1,false);
		  }
		  showChecked("ROW");
		  resizeDoc();
		  window.onresize=resizeDoc;
		     
		</SCRIPT>


<%
	}
%> 
</FORM>

</BODY>
</HTML>
