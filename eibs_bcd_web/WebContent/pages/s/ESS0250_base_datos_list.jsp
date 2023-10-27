<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.ESS025002Message"%>
<html>
<head>
<title>Historial de Mantenimiento</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="list" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id="header" class="datapro.eibs.beans.ESS025001Message"  scope="session" />
<jsp:useBean id="select" class="datapro.eibs.beans.ESS025002Message"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

function goAction(acc, apc) {

	getElement("ACCREF").value = acc;
	getElement("APCCDE").value = apc;
    page = "<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESS0250?ACCREF=" + acc + "&APCCDE=" + apc + "&SCREEN=300";
	CenterWindow(page,600,500,2);
}

function goSearch(){
	getElement("SCREEN").value = "200";
	document.forms[0].submit();
}

</SCRIPT>
</head>

<BODY>
<h3 align="center">Historial de Auditoria<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="base_datos_list.jsp, ESS0250"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESS0250" >
    <input type=hidden name="SCREEN" id="SCREEN" value="300">
    <input type=hidden name="E01UBK" id="E01UBK" value="<%=currUser.getE01UBK() %>">
    <input type=hidden name="ACCREF" id="ACCREF" value="">
    <input type=hidden name="APCCDE" id="APCCDE" value="">
    
<%if(!header.getE01SELCUN().equals("0") || !header.getE01SELACD().equals("")){ %>
  <table class="tableinfo" style="width: 1040px">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="30%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="70%" > 
              <div align="left"> 
                <input type="text" name="E01SELCUN" size="10" maxlength="9" value="<%= header.getE01SELCUN().trim()%>" readonly>
                <input type="text" name="E01CUSNA1" size="50" maxlength="45" value="<%= header.getE01CUSNA1().trim()%>" readonly>
              </div>
            </td>
          </tr>
          <%if(!header.getE01SELACD().equals("")){ %>
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right"><b>Aplicaci&oacute;n :</b></div>
            </td>
            <td nowrap width="70%"> 
              <div align="left"> 
                <input type="text" name="E01SELACD" size="3" maxlength="2" value="<%= header.getE01SELACD()%>" readonly>
                <input type="text" name="E01DSCACD" size="50" maxlength="45" value="<%= header.getE01DSCACD().trim()%>" readonly>
              </div>
            </td>
          </tr>
          <% } %>
        </table>
      </td>
    </tr>
  </table>
<% } %>  
<%if(!header.getE01SELFIL().equals("")){ %>
  <table class="tableinfo" style="width: 1040px">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="30%" > 
              <div align="right"><b>Archivo :</b></div>
            </td>
            <td nowrap width="70%" > 
              <div align="left"> 
                <input type="text" name="E01SELFIL" size="11" maxlength="10" value="<%= header.getE01SELFIL().trim()%>" readonly>
                <input type="text" name="E01DSCFLE" size="50" maxlength="45" value="<%= header.getE01DSCFLE().trim()%>" readonly>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<% } %>  
  <p>
  <%if ( list.getNoResult() ) {%>
  </p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>No hay resultados para su criterio de búsqueda</b></p>
          <p>&nbsp;</p>
        </div>
	  </TD>
	</TR>
    </TABLE>
	<%} else {%> 
  <p> 
  <br>

<TABLE  id="mainTable" class="tableinfo" style="height: 400px; width: 1040px">
 	<TR height="5%"> 
   		<TD NOWRAP valign="top" width="80%"> 
    		<TABLE id="headTable" width="100%">
    			<TR id="trdark">  
		            <th align="center" nowrap width="5%">Cliente</th>
		            <th align="center" nowrap width="15%">Cuenta
						<table style="border: 0px" align="center">
						<tr id="trdark">
						<td nowrap>
				   			<input type="text" name="E01SELACC" id="E01SELACC"  size="13" maxlength="12" value="<%=select.getE02NUMACC()%>">
				   			<a href="javascript:GetAccount('E01SELACC','E01UBK','','')" >
				   			<img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="middle" border="0">
							</a>
				   			<A href="javascript:goSearch()" >
							<img src="<%=request.getContextPath()%>/images/ico5.gif" title="Posicionarse en..." align="bottom" style="cursor:hand; border: 0px" >
		        			</a>
			   			</td>
			   			</tr> 
						</table>
		            </th>
		            <th align="center" nowrap width="10%">Fecha</th>
		            <th align="center" nowrap width="5%">Hora</th>
		            <th align="center" nowrap width="5%">Ref.</th>
		            <th align="center" nowrap width="10%">Archivo</th>
		            <th align="center" nowrap width="10%">Evento</th>
		            <th align="center" nowrap width="15%">Direccion<br>IP</th>
		            <th align="center" nowrap width="10%">Operador</th>
		            <th align="center" nowrap width="10%">Supervisor</th>
	         </tr>
	        </table>
	        </td>
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:400px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
          <%
          int numrec = 0;
          list.initRow();
          while (list.getNextRow()) {
	          ESS025002Message msg = (ESS025002Message) list.getRecord();
    	      numrec = Integer.parseInt(msg.getE02NUMREC());
		 %>
          <tr> 
            <td NOWRAP  align="center" width="5%"><a href="javascript:goAction('<%= msg.getE02NUMREF() %>','<%= msg.getE02APLCDE() %>')"><%= msg.getE02CUSNUM() %></a></td>
            <td NOWRAP  align="center" width="15%"><a href="javascript:goAction('<%= msg.getE02NUMREF() %>','<%= msg.getE02APLCDE() %>')"><%= msg.getE02NUMACC() %></a></td>
            <td NOWRAP  align="center" width="10%"><a href="javascript:goAction('<%= msg.getE02NUMREF() %>','<%= msg.getE02APLCDE() %>')"><%= Util.formatCustomDate(currUser.getE01DTF(), msg.getBigDecimalE02DATERM().intValue(), msg.getBigDecimalE02DATERD().intValue(), msg.getBigDecimalE02DATERY().intValue()) %></a></td>
            <td NOWRAP  align="center" width="5%"><a href="javascript:goAction('<%= msg.getE02NUMREF() %>','<%= msg.getE02APLCDE() %>')"><%= msg.getE02VALTIM().substring(11,19) %></a></td>
            <td NOWRAP  align="center" width="5%"><a href="javascript:goAction('<%= msg.getE02NUMREF() %>','<%= msg.getE02APLCDE() %>')"><%= msg.getE02NUMREF() %></a></td>
            <td NOWRAP  align="center" width="10%"><a href="javascript:goAction('<%= msg.getE02NUMREF() %>','<%= msg.getE02APLCDE() %>')"><%= msg.getE02MNLFIL() %></a></td>
            <td NOWRAP  align="center" width="10%"><a href="javascript:goAction('<%= msg.getE02NUMREF() %>','<%= msg.getE02APLCDE() %>')"><%= msg.getE02DSCMOD() %></a></td>
            <td NOWRAP  align="center" width="15%"><a href="javascript:goAction('<%= msg.getE02NUMREF() %>','<%= msg.getE02APLCDE() %>')"><%= msg.getE02MNLIPA() %></a></td>
            <td NOWRAP  align="center" width="10%"><a href="javascript:goAction('<%= msg.getE02NUMREF() %>','<%= msg.getE02APLCDE() %>')"><%= msg.getE02USERID() %></a></td>
            <td NOWRAP  align="center" width="10%"><a href="javascript:goAction('<%= msg.getE02NUMREF() %>','<%= msg.getE02APLCDE() %>')"><%= msg.getE02MNPUSA() %></a></td>
          </tr>          
          <%}%>
		</table>
	</div>
</td>
</tr>
</TABLE>

<table class="tbenter" style="width: 1040px" >
	<tr>
		<td width="50%" align="left">
		<% if (list.getShowPrev()) {
			int pos = numrec - 100;
      		out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.security.JSESS0250?SCREEN=200&POS=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
		}%>
		</td>
		<td width="50%" align="right">
		<% if (list.getShowNext()) {
			int pos = numrec;
			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.security.JSESS0250?SCREEN=200&POS=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
		}%>
		</td>
	</tr>
</table>

<%}%>
</form>
</body>
</html>
