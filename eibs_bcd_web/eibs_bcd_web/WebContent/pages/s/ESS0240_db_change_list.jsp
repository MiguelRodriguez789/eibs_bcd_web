<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-menu.tld" prefix="eibsmenu" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.ESS024002Message"%>
<html>
<head>
<title>Historial de Mantenimiento</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="dbList" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id="select" class="datapro.eibs.beans.ESS024002Message"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<SCRIPT type="text/javascript">


function goAction(acc, apc) {

	getElement("ACCREF").value = acc;
	getElement("APCCDE").value = apc;
	document.forms[0].submit();
}

function goSearch(){
	getElement("SCREEN").value = "400";
	document.forms[0].submit();
}

</SCRIPT>
</head>

<BODY>

<h3 align="center">Historial de Mantenimiento<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="db_change_list.jsp, ESS0240"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESS0240" >
    <input type=hidden name="SCREEN" id="SCREEN" value="500">
    <input type=hidden name="ACCREF" id="ACCREF" value="">
    <input type=hidden name="APCCDE" id="APCCDE" value="">
    <input type=hidden name="E02USRNME" id="E02USRNME" value="">
    <input type=hidden name="E02USANME" id="E02USANME" value="">

<% if (userPO.getOption().equals("CLIENT_P") || userPO.getOption().equals("CLIENT_C")) {%>
	<table class="tableinfo">
	  <tr > 
	    <td> 
       	 <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
	        <tr>
	             
	            <td nowrap width="10%" align="right"> Cliente : </td>
	          <td nowrap width="12%" align="left">
	      			<%= userPO.getCusNum()%>
	          </td>
	            <td nowrap width="6%" align="right">Identifiacion :  
	            </td>
	          <td nowrap width="14%" align="left">
	      			<%= userPO.getIdentifier()%>
	          </td>
	            <td nowrap width="8%" align="right"> Nombre : </td>
	          <td nowrap width="50%"align="left">
	      			<%= userPO.getCusName()%>
	          </td>
	        </tr>
	      </table>
	    </td>
	  </tr>
	</table>
<%} else {%>
   <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="14%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="9%" > 
              <div align="left"> 
                <input type="text" name="E06CUN" size="10" maxlength="9" readonly value="<%= userPO.getCusNum().trim()%>">
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E06NA1" size="48" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap ><b>                
               <input type="text" name="E06TYP" size="4" maxlength="4" readonly value="<%= userPO.getType().trim()%>">
               <input type="text" name="E06PRO" size="4" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>">
              </b></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="14%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"> 
                <input type="text" name="E06ACC" size="13" maxlength="12" value="<%= userPO.getAccNum().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%"> 
              <div align="right">Oficial :</div>
            </td>
            <td nowrap width="33%"> 
              <div align="left"><b> 
                <input type="text" name="E06OFC" size="48" maxlength="45" readonly value="<%= userPO.getOfficer().trim()%>">
                </b> </div>
            </td>
            <td nowrap width="11%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="21%"> 
              <div align="left"><b> 
              <input type="text" name="E06CCY" size="4" maxlength="4" readonly value="<%= userPO.getCurrency().trim()%>">    
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
 <%}%>
  
  <p>
  <%if ( dbList.getNoResult() ) {%>
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
  <table  id=cfTable class="tableinfo">
    <tr > 
      <td NOWRAP valign="top" width="100%"> 
        <table id="headTable" width="100%">
          <tr id="trdark"> 
            <th align="center" nowrap width="8%">Fecha
				<table style="border: 0px" align="center">
				<tr id="trdark">
				<td nowrap>
					<eibsinput:date fn_year="E02SELDTY" fn_day="E02SELDTD" fn_month="E02SELDTM" name="select"/>
		   			<A href="javascript:goSearch()" >
					<img src="<%=request.getContextPath()%>/images/ico5.gif" title="Posicionarse en..." align="bottom" style="cursor:hand; border: 0px" >
        			</a>
	   			</td>
	   			</tr> 
				</table>
            </th>
            <th align="center" nowrap width="7%">Hora</th>
            <th align="center" nowrap width="10%">Referencia</th>
            <th align="center" nowrap width="10%">Evento
				<table style="border: 0px" align="center">
				<tr id="trdark">
				<td nowrap>
					<SELECT name="EVENTO">
						<OPTION value=""></OPTION>
						<OPTION <%= select.getE02SELMOD().trim().equals("NEW")?"Selected":"" %> value="NEW">Nuevo</OPTION>
						<OPTION <%= select.getE02SELMOD().trim().equals("DEL")?"Selected":"" %> value="DEL">Borrado</OPTION>
						<OPTION <%= select.getE02SELMOD().trim().equals("UPD")?"Selected":"" %> value="UPD">Actualizado</OPTION>
						<OPTION <%= select.getE02SELMOD().trim().equals("INQ")?"Selected":"" %> value="INQ">Consulta</OPTION>
						<OPTION <%= select.getE02SELMOD().trim().equals("APR")?"Selected":"" %> value="APR">Aprobado</OPTION>
						<OPTION <%= select.getE02SELMOD().trim().equals("REJ")?"Selected":"" %> value="REJ">Rechazado</OPTION>
						<OPTION <%= select.getE02SELMOD().trim().equals("OTR")?"Selected":"" %> value="OTR">Oros</OPTION>
					</SELECT> 
		   			<A href="javascript:goSearch()" >
					<img src="<%=request.getContextPath()%>/images/ico5.gif" title="Posicionarse en..." align="bottom" style="cursor:hand; border: 0px" >
        			</a>
	   			</td>
	   			</tr> 
				</table>
            </th>
            <th align="center" nowrap width="15%">Direccion IP
				<table style="border: 0px" align="center">
				<tr id="trdark">
				<td nowrap>
		   			<input type="text" name="IP" id="IP"  size="16" maxlength="15" value="<%=select.getE02SELIPA()%>">
		   			<A href="javascript:goSearch()" >
					<img src="<%=request.getContextPath()%>/images/ico5.gif" title="Posicionarse en..." align="bottom" style="cursor:hand; border: 0px" >
        			</a>
	   			</td>
	   			</tr> 
				</table>
			</th>
            <th align="center" nowrap width="25%">Operador
				<table style="border: 0px" align="center">
				<tr id="trdark">
				<td nowrap>
		   			<input type="text" name="USER" id="USER"  size="16" maxlength="15" value="<%=select.getE02SELUSR()%>">
		   			<a href="javascript:GetUser('USER','E02USRNME',document.forms[0].USER.value)" >
		   			<img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="middle" border="0">
					</a>
		   			<a href="javascript:goSearch()">
					<img src="<%=request.getContextPath()%>/images/ico5.gif" title="Posicionarse en..." align="bottom" style="cursor:hand; border: 0px" >
        			</a>
	   			</td>
	   			</tr> 
				</table>
            </th>
            <th align="center" nowrap width="25%">Supervisor
				<table style="border: 0px" align="center">
				<tr id="trdark">
				<td nowrap>
		   			<input type="text" name="SUPERVISOR" id="SURPERVISOR" size="16" maxlength="15" value="<%=select.getE02SELUSA()%>">
		   			<a href="javascript:GetUser('SUPERVISOR','E02USANME',document.forms[0].SUPERVISOR.value)" >
		   			<img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="middle" border="0">
					</a>
		   			<A href="javascript:goSearch()" >
					<img src="<%=request.getContextPath()%>/images/ico5.gif" title="Posicionarse en..." align="bottom" style="cursor:hand; border: 0px" >
        			</a>
	   			</td>
	   			</tr> 
				</table>
            </th>
          </tr>
          
          <%
          dbList.initRow();
          boolean firstTime = true;
          boolean firstTYPE = true;
          String chk = "";
          while (dbList.getNextRow()) {
				if (firstTime) {
					firstTime = false;
					chk = "checked";
				} else {
					chk = "";
				}
          ESS024002Message msgList = (ESS024002Message) dbList.getRecord();
          %>
		    <%if(firstTYPE){%>
		    	<input type=hidden name="TYPE" id="TYPE" value="<%=msgList.getE02CDTYPE()%>">
		    <%  firstTYPE = false;
		     	}
		      %>
          <tr>
            <td NOWRAP  align="center" width="8%"><a href="javascript:goAction('<%= msgList.getE02NUMREF() %>','<%= msgList.getE02APLCDE() %>')"><%= Util.formatCustomDate(currUser.getE01DTF(), msgList.getBigDecimalE02DATERM().intValue(), msgList.getBigDecimalE02DATERD().intValue(), msgList.getBigDecimalE02DATERY().intValue()) %></a></td>
            <td NOWRAP  align="center"  width="7%"><a href="javascript:goAction('<%= msgList.getE02NUMREF() %>','<%= msgList.getE02APLCDE() %>')"><%= msgList.getE02VALTIM().substring(11,19) %></a></td>
            <td NOWRAP  align="center" width="10%"><a href="javascript:goAction('<%= msgList.getE02NUMREF() %>','<%= msgList.getE02APLCDE() %>')"><%= msgList.getE02NUMREF() %></a></td>
            <td NOWRAP  align="center" width="10%"><a href="javascript:goAction('<%= msgList.getE02NUMREF() %>','<%= msgList.getE02APLCDE() %>')"><%= msgList.getE02DSCMOD() %></a></td>
            <td NOWRAP  align="center" width="15%"><a href="javascript:goAction('<%= msgList.getE02NUMREF() %>','<%= msgList.getE02APLCDE() %>')"><%= msgList.getE02MNLIPA() %></a></td>
            <td NOWRAP  align="left"  width="25%"><a href="javascript:goAction('<%= msgList.getE02NUMREF() %>','<%= msgList.getE02APLCDE() %>')"><%= msgList.getE02USERID() %> - <%= msgList.getE02USRNME() %></a></td>
            <td NOWRAP  align="left"   width="25%"><a href="javascript:goAction('<%= msgList.getE02NUMREF() %>','<%= msgList.getE02APLCDE() %>')"><%= msgList.getE02MNPUSA() %>  <%= msgList.getE02USANME() %></a></td>
          </tr>
          <% 
          	}
          %>
        </table>
        </td>
        </tr>
  </table>
     
<%}%>
</form>
</body>
</html>
