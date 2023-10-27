<%@page import = "datapro.eibs.master.Util" %>
<%@page import = "java.lang.Object" %>
<%@page import="datapro.eibs.master.Util,datapro.eibs.beans.EDL090002Message,datapro.eibs.beans.EDL090005Message"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>

<HTML>
<HEAD>
<TITLE> Detalle de Mora </TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="header" class="datapro.eibs.beans.EDL090001Message"  scope="session" />
<jsp:useBean id="list" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id="EDL090005List" class="datapro.eibs.beans.JBObjList" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

  <%  
     boolean UF = false;
     if (request.getAttribute("UF") != null && request.getAttribute("UF").equals("Y")) {
       UF = true;
     }
  %>

</HEAD>

<BODY>

<h3 align="center">Detalle de la Mora
  <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_plan_de_pago_det_mora.jsp, EDL0900"> 
</h3>
<hr size="4">

<form>
  <input type="hidden" name="SCREEN" value="500">
  <input type="hidden" name="opt" value="1">

  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <%if(!header.getE01DEACUN().equals("0")){ %>
          <tr id="trdark"> 
            <td nowrap width="14%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="9%" > 
              <div align="left"> 
               <eibsinput:text property="E01DEACUN" name="header" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap > 
              <div align="left"> 
               <eibsinput:text property="E01CUSNA1" name="header" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true"/>
              </div>
            </td>
            <td nowrap > 
              <div align="right"><b>Tipo : </b></div>
            </td>
            <td nowrap ><b> 
                <eibsinput:text property="E01DEATYP" name="header" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
              </b></td>
          </tr>
          <% }%>
          <tr id="trdark"> 
            <td nowrap width="14%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"> 
                <eibsinput:text property="E01DEAACC" name="header" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true"/>
              </div>
            </td>
            <td nowrap width="12%">
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="33%">
                <eibsinput:text property="E01DEACCY" name="header" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true"/>
            </td>
            <td nowrap width="11%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="21%"> 
              <div align="left"><b> 
                <eibsinput:text property="E01DEAPRO" name="header" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/>
              </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
 
  <br>
  <% int row1 = 0; %>
  <%
     int index = Integer.parseInt(request.getParameter("Row").trim());
     EDL090002Message details = (EDL090002Message)list.get(index);
  %> 
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="30%" >N&uacute;mero de Cuota : <%= details.getE02DLPPNU().equals("77777") ? "Aceler."  :
																( details.getE02DLPPNU().equals("88888") ? "Abono" :
																	( details.getE02DLPPNU().equals("99999") ? "Prepago" : details.getE02DLPPNU())) %></td>
            <td nowrap width="3%" >&nbsp;</td>
            <td nowrap width="30%" > 
              <div align="left">Fecha a Pagar : <%= Util.formatCustomDate(currUser.getE01DTF(),
              															  details.getBigDecimalE02DLPPDM().intValue(),
              															  details.getBigDecimalE02DLPPDD().intValue(),
              															  details.getBigDecimalE02DLPPDY().intValue()) %></div>
            </td>
            <td nowrap width="3%" >&nbsp;</td>
            <td nowrap width="30%" > 
              <div align="left">Fecha de Pago : <%= Util.formatCustomDate(currUser.getE01DTF(),
              															  details.getBigDecimalE02DLPDTM().intValue(),
              															  details.getBigDecimalE02DLPDTD().intValue(),
              															  details.getBigDecimalE02DLPDTY().intValue()) %></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>

  <%  
     double suma = 0;
     double sumaUF = 0;
  %>
  
  <% row1 = 1; %>  
  <% if (!UF){ %>
  <table class="tableinfo">
    <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
      <th align="center" nowrap width="25%">Inicio</th>
      <th align="center" nowrap width="25%">Tasa</th>
      <th align="center" nowrap width="25%">Dias</th>
      <th align="center" nowrap width="25%">Monto</th>
    </tr>
  <%  
       EDL090005List.initRow();
       while (EDL090005List.getNextRow()) {
         EDL090005Message datarec = (EDL090005Message) EDL090005List.getRecord();
         suma += datarec.getBigDecimalE05PMRPMA().doubleValue();
  %>
    <tr> 
      <td align=CENTER  nowrap width="25%"><%=Util.formatCustomDate(currUser.getE01DTF(),datarec.getBigDecimalE05PMRLRM().intValue(),datarec.getBigDecimalE05PMRLRD().intValue(),datarec.getBigDecimalE05PMRLRY().intValue())%></td>
      <td align=CENTER  nowrap width="25%"><div align="right"><%=datarec.getE05PMRPEI()%></div></td>
      <td align=CENTER  nowrap width="25%"><div align="right"><%=datarec.getE05PMRDYS()%></div></td>
      <td align=CENTER  nowrap width="25%"><div align="right"><%=datarec.getE05PMRPMA()%></div></td>
    </tr>
  <%   } %>
  </table>
  <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">   
    <tr bgcolor="#FFFFFF">
      <td nowrap align="center" width="25%">&nbsp;</td>
      <td nowrap align="center" width="25%">&nbsp;</td>
      <td nowrap align="right"  width="25%" ><b>TOTAL : </b> </td>
      <td nowrap align="right"  width="25%" ><b><%=datapro.eibs.master.Util.formatCCY(suma)%></b></td>
    </tr>                
  </table>
  <% } else { %>
  <table class="tableinfo">
    <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
      <th align="center" nowrap width="20%">Inicio</th>
      <th align="center" nowrap width="20%">Tasa</th>
      <th align="center" nowrap width="20%">Dias</th>
      <th align="center" nowrap width="20%">UF</th>
      <th align="center" nowrap width="20%">Cambio</th>
    </tr>
  <%  
       EDL090005List.initRow();
       while (EDL090005List.getNextRow()) {
         EDL090005Message datarec = (EDL090005Message) EDL090005List.getRecord();
         suma += datarec.getBigDecimalE05PMRPMA().doubleValue();
         sumaUF += datarec.getBigDecimalE05PMRPMU().doubleValue();
  %>
    
    <tr> 
      <td align=CENTER  nowrap width="20%"><%=Util.formatCustomDate(currUser.getE01DTF(),datarec.getBigDecimalE05PMRLRM().intValue(),datarec.getBigDecimalE05PMRLRD().intValue(),datarec.getBigDecimalE05PMRLRY().intValue())%></td>
      <td align=CENTER  nowrap width="20%"><div align="right"><%=datarec.getE05PMRPEI()%></div></td>
      <td align=CENTER  nowrap width="20%"><div align="right"><%=datarec.getE05PMRDYS()%></div></td>
      <td align=CENTER  nowrap width="20%"><div align="right"><%=datarec.getE05PMRPMU()%></div></td>
      <td align=CENTER  nowrap width="20%"><div align="right"><%=datarec.getE05PMREXR()%></div></td>
    </tr>
  <%   } %>
  </table>
  <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">   
    <tr bgcolor="#FFFFFF">
      <td nowrap align="center" width="20%">&nbsp;</td>
      <td nowrap align="center" width="20%">&nbsp;</td>
      <td nowrap align="right"  width="20%" ><b>TOTAL : </b> </td>
      <td nowrap align="right"  width="20%" ><b><%=datapro.eibs.master.Util.formatCCY(sumaUF)%></b></td>
      <td nowrap align="center" width="20%">&nbsp;</td>
    </tr>                
  </table>
  <% } %>

  <br>

</form>
</body>
</html>
