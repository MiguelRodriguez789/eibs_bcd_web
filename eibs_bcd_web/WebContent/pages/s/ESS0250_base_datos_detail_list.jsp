<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.ESS025003Message"%>

<html>
<head>
<title>Base de Datos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="dList" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="header" class="datapro.eibs.beans.ESS025002Message" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
</SCRIPT>
</head>

<BODY>
<h3 align="center">Auditoria Base de Datos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="base_datos_detail_list.jsp, ESS0250"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESS0250">
<%if(!header.getE02CUSNUM().equals("0")){ %>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="30%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="70%" > 
              <div align="left"> 
                <input type="text" name="E02CUSNUM" size="10" maxlength="9" value="<%= header.getE02CUSNUM().trim()%>" readonly>
                <input type="text" name="E02CUSNA1" size="45" maxlength="45" value="<%= header.getE02CUSNA1().trim()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="70%"> 
              <div align="left"> 
                <input type="text" name="E02NUMACC" size="13" maxlength="12" value="<%= header.getE02NUMACC()%>" readonly>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<% } %> 
<br> 
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="12%" > 
              <div align="right"><b>Fecha :</b></div>
            </td>
            <td nowrap width="12%"> 
              <div align="left"> 
              	<eibsinput:date name="header" fn_year="E02DATERY" fn_month="E02DATERM" fn_day="E02DATERD" readonly="true" />
              </div>
            </td>
            <td nowrap width="12%"> 
              <div align="right"><b>Hora :</b> </div>
            </td>
            <td nowrap width="12%"> 
              <div align="left">
                <input type="text" name="E02VALTIM" size="10" maxlength="10" readonly value="<%= header.getE02VALTIM().substring(11,19)%>">
              </div>
            </td>
            <td nowrap width="12%"> 
              <div align="right"><b>Operador :</b></div>
            </td>
            <td nowrap width="12%"> 
              <div align="left">
              	<eibsinput:text property="E02USERID" name="header" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_USER %>" readonly="true" /> 
              </div>
            </td>
            <td nowrap width="12%"> 
              <div align="right"><b>Modo :</b> </div>
            </td>
            <td nowrap width="12%"> 
              <div align="left"> 
                <input type="text" name="E02DSCMOD" size="20" maxlength="20" readonly value="<%= header.getE02DSCMOD().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="12%"> 
              <div align="right"><b>Referencia :</b></div>
            </td>
            <td nowrap width="12%"> 
              <div align="left">
              	<eibsinput:text property="E02NUMREF" name="header" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true" /> 
              </div>
            </td>
            <td nowrap width="12%"> 
              <div align="right"><b>Programa : </b></div>
            </td>
            <td nowrap width="12%"> 
              <div align="left"><b> 
                <input type="text" name="E01MNLPRG" size="10" maxlength="10" value="<%= header.getE02MNLPRG().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="12%"> 
              <div align="right"><b>Supervisor : </b></div>
            </td>
            <td nowrap width="12%"> 
              <div align="left"><b> 
              	<eibsinput:text property="E02MNPUSA" name="header" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_USER %>" readonly="true" /> 
                </b> </div>
            </td>
            <td nowrap width="12%"> 
              <div align="right"><b>Direccion IP :</b></div>
            </td>
            <td nowrap width="12%"> 
              <div align="left"><b> 
                <input type="text" name="E02MNLIPA" size="20" maxlength="20" readonly value="<%= header.getE02MNLIPA().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p>
  <%if ( dList.getNoResult() ) {%>
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
          <p><b>No hay detalle de Campos</b></p>
          <p>&nbsp;</p>
        </div>
	  </TD>
	</TR>
    </TABLE>
	<%} else {%> 
  <p> 
  <br>
         <%
          dList.initRow();
          boolean firstTime = true;
          String chk = "";
          while (dList.getNextRow()) {
                
                ESS025003Message msgList = (ESS025003Message) dList.getRecord();
                if (firstTime){
                firstTime = false;
                 %>
				  <table  id=cfTable class="tableinfo">
				    <tr > 
				      <td NOWRAP valign="top" width="100%"> 
				        <table id="headTable" width="100%">
				          <tr id="trdark"> 
				            <th align=CENTER nowrap width="10%"> 
				              <div align="center">Archivo</div>
				            </th>	
				            <th align=CENTER nowrap width="30%"> 
				              <div align="center">Nombre Campo </div>
				            </th>
				            <th align=CENTER nowrap width="30%"> 
				              <div align="center">Valor Anterior</div>
				            </th>
				            <th align=CENTER nowrap width="30%"> 
				              <div align="center">Nuevo Valor</div>
				            </th>
				          </tr>
                 <%
                }
                
		 %>
          <tr> 
            <td NOWRAP  align=LEFT  width="10%"><%= msgList.getE03MNPFIL() %></td>
            <td NOWRAP  align=LEFT  width="30%"><%= msgList.getE03FLDDSC() %></td>
            <td NOWRAP  align=LEFT  width="30%"><%= msgList.getE03VALBEF() %></td>
            <td NOWRAP  align=LEFT width="30%"><%= msgList.getE03VALAFT() %></td>
          </tr>
          <%}%>
        </table>
  </table>
<% } %> 

</form>
</body>
</html>
