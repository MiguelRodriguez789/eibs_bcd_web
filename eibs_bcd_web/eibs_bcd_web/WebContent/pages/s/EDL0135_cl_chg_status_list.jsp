<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EDL013503Message"%>

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Historia Cambios de Estados / Segmento </title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">

<jsp:useBean id="loans" class="datapro.eibs.beans.EDL013503Message"  scope="session" />
<jsp:useBean id="EDL013503List" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script language="Javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script language="Javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

//<%if ( loans.getH03FLGWK1().trim().equals("1")) {%> // H03FLGWK1 Determines Legal Type
//	builtNewMenu(client_inq_corp_opt);	
//<%}else{%>
//	builtNewMenu(client_inq_personal_opt);
//<%}%>
>
function goSearch() {
	getElement("SCREEN").value="500";
	getElement("TYPE").value="C";
	document.forms[0].submit();
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
 out.println("<SCRIPT> initMenu(); </SCRIPT>");
%>

<h3 align="center">Historia Cambios de Estados / Segmentos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cl_chg_status_list.jsp,EDL0135"></h3>
<hr size="4">
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0135">
<input type="hidden" name="SCREEN" value="500">
<input type="hidden" name="TYPE" value="C"> 

  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left">
                <input type="text" name="E03DEACUN" size="10" maxlength="9" value="<%= loans.getE03DEACUN().trim()%>" readonly>
              </div>
              </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left">
                <input type="text" name="E03CUSNA1" size="45" maxlength="45" value="<%= loans.getE03CUSNA1().trim()%>" readonly>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <br>


<%
	if (EDL013503List.getNoResult()) {
%>
<table class="tbenter" width=100% height=90%>
	<tr>
		<td>
		<div align="center">
			<font size="3">
				<b> No hay resultados que correspondan a su criterio de búsqueda. </b>
			</font>
		</div>
		</td>
	</tr>
</table>
<%
	} else {
%>

	<table id="headTable" class="tableinfoList" width="100%">
		<tr id="trdark">
			<th align="center" nowrap width="10%">Fecha
				<table border="0">
					<tr id="trdark">
					<td nowrap>
						<INPUT type="text" name="JBDD" size="3" maxlength="2" value="<%= userPO.getHeader1().trim()%>" onkeypress="enterInteger(event)" >
						<INPUT type="text" name="JBDM" size="3" maxlength="2" value="<%= userPO.getHeader2().trim()%>" onkeypress="enterInteger(event)" >
						<INPUT type="text" name="JBDY" size="5" maxlength="4" value="<%= userPO.getHeader3().trim()%>" onkeypress="enterInteger(event)" >
						<A href="javascript:DatePicker(document.forms[0].JBDD,document.forms[0].JBDM,document.forms[0].JBDY)">
						<IMG src="<%=request.getContextPath()%>/images/calendar.gif" title="Ayuda" align="middle" border="0"></A>
			   			<A href="javascript:goSearch()" >
						<img src="<%=request.getContextPath()%>/images/ico5.gif" title="Posicionarse en..." align="bottom" border="0" style="cursor:hand" >
	        			</a>
		   			</td>
		   			</tr> 
				</table>
			</th>	
			<th align="center" nowrap width="10%">Anterior</th>
			<th align="center" nowrap width="10%">Nuevo</th>
			<th align="center" nowrap width="15%">Causal</th>
			<th align="center" nowrap width="15%">Motivo</th>
			<th align="center" nowrap width="20%">Usuario</th>
			<th align="center" nowrap width="20%">Fecha y Hora</th>
		</tr>
		<%
			EDL013503List.initRow();
				int k = 0;
				boolean firstTime = true;
				String chk = "";
				while (EDL013503List.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
					EDL013503Message dlsts = (EDL013503Message) EDL013503List.getRecord();
		%>
		<tr>
			<td nowrap align="center"> 
				<a href="javascript:showStatusReason('<%=dlsts.getE03DLSREM().trim()%>','<%=dlsts.getE03DLSEVN().trim()%>','<%=dlsts.getE03DSCEVN().trim()%>',
														'CL','<%=dlsts.getE03DLSUS2().trim()%>' , '<%=dlsts.getE03DSCUS2().trim()%>');">					
				 <%=Util.formatCustomDate(currUser.getE01DTF(), dlsts.getE03DLSDTM(), dlsts.getE03DLSDTD(),dlsts.getE03DLSDTY())%>
				</a>
			</td>
			<td nowrap align="left">
				<a href="javascript:showStatusReason('<%=dlsts.getE03DLSREM().trim()%>','<%=dlsts.getE03DLSEVN().trim()%>','<%=dlsts.getE03DSCEVN().trim()%>',
														'CL','<%=dlsts.getE03DLSUS2().trim()%>' , '<%=dlsts.getE03DSCUS2().trim()%>');">					
			 	<%=Util.formatCell(dlsts.getE03DLSOST() + " " + dlsts.getE03DSCOST())%>
			 	</a>
			</td>
			<td nowrap align="left"> 
				<a href="javascript:showStatusReason('<%=dlsts.getE03DLSREM().trim()%>','<%=dlsts.getE03DLSEVN().trim()%>','<%=dlsts.getE03DSCEVN().trim()%>',
														'CL','<%=dlsts.getE03DLSUS2().trim()%>' , '<%=dlsts.getE03DSCUS2().trim()%>');">		
				<%=Util.formatCell(dlsts.getE03DLSNST() + " " + dlsts.getE03DSCNST())%>
				</a>
			</td>																	

			<td nowrap align="center"> 
				<a href="javascript:showStatusReason('<%=dlsts.getE03DLSREM().trim()%>','<%=dlsts.getE03DLSEVN().trim()%>','<%=dlsts.getE03DSCEVN().trim()%>',
														'CL','<%=dlsts.getE03DLSUS2().trim()%>' , '<%=dlsts.getE03DSCUS2().trim()%>');">	
					<%=Util.formatCell(dlsts.getE03DSCEVN())%>
				</a>	
			</td>																		

			<td nowrap align="center"> 
				<a href="javascript:showStatusReason('<%=dlsts.getE03DLSREM().trim()%>','<%=dlsts.getE03DLSEVN().trim()%>','<%=dlsts.getE03DSCEVN().trim()%>',
														'CL','<%=dlsts.getE03DLSUS2().trim()%>' , '<%=dlsts.getE03DSCUS2().trim()%>');">	
					<%=Util.formatCell(dlsts.getE03DSCUS2())%>
				</a>	
			</td>																		

			<td nowrap align="left"> 
				<a href="javascript:showStatusReason('<%=dlsts.getE03DLSREM().trim()%>','<%=dlsts.getE03DLSEVN().trim()%>','<%=dlsts.getE03DSCEVN().trim()%>',
														'CL','<%=dlsts.getE03DLSUS2().trim()%>' , '<%=dlsts.getE03DSCUS2().trim()%>');">		
					<%=Util.formatCell(dlsts.getE03DLSUSR() + "-" + dlsts.getE03DSCUSR())%>
				</a>
			</td>																	
			<td nowrap align="left"> 
				<a href="javascript:showStatusReason('<%=dlsts.getE03DLSREM().trim()%>','<%=dlsts.getE03DLSEVN().trim()%>','<%=dlsts.getE03DSCEVN().trim()%>',
														'CL','<%=dlsts.getE03DLSUS2().trim()%>' , '<%=dlsts.getE03DSCUS2().trim()%>');">					
					<%=Util.formatCell(dlsts.getE03DLSTIM())%>
				</a>
			</td>
		</tr>
		<%
			}
		%>
	<%
		}
	%>
   </table>

  </form>
</body>
</html>

