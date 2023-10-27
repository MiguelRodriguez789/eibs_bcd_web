<%@page import="java.math.BigDecimal"%>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import = "java.lang.Object" %>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EDL090002Message"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@page import="com.datapro.constants.EibsFields"%>

<HTML>
<HEAD>
<TITLE> Detalle de Cuota </TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="header" class="datapro.eibs.beans.EDL090001Message"  scope="session" />
<jsp:useBean id="list" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

</HEAD>

<BODY>

<form>
  <p> 
    <input TYPE=HIDDEN name="SCREEN" value="500">
    <INPUT TYPE=HIDDEN NAME="opt" VALUE="1">
  </p>

  <h3 align="center">Detalle de la Cuota
  	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_plan_de_pago_det.jsp,EDL0900"> 
  </h3>
  <hr size="4">

  <%
			int index = Integer.parseInt(request.getParameter("Row").trim());
			EDL090002Message details = (EDL090002Message)list.get(index);
 %> 
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <%if(!header.getE01DEACUN().equals("0") || userPO.getCusType().equals("S") ){ %>
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
             	<eibsinput:text property="E01CUSNA1" name="header" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" readonly="true"/>
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
 
  <BR>
  <%int row1 = 0; %>
 <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="30%" > 
              <div align="right">Fecha de Apertura :</div>
            </td>
            <td nowrap width="20%"  > 
              <div align="left"><%= Util.formatCustomDate(currUser.getE01DTF(),
              											header.getBigDecimalE01DEAODM().intValue(),
              											header.getBigDecimalE01DEAODD().intValue(),
              											header.getBigDecimalE01DEAODY().intValue())%></div>
            </td>
            <td nowrap width="30%" > 
              <div align="right">Tasa de Inter&eacute;s :</div>
            </td>
            <td nowrap width="20%" > 
               <div align="left"><%= header.getE01DEARTE()%></div>
           </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
            <td nowrap width="30%" > 
              <div align="right">Fecha de Vencimiento :</div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"><%= Util.formatCustomDate(currUser.getE01DTF(),
              											header.getBigDecimalE01DEAMAM().intValue(),
              											header.getBigDecimalE01DEAMAD().intValue(),
              											header.getBigDecimalE01DEAMAY().intValue())%></div>
            </td>
            <td nowrap width="30%" > 
              <div align="right">Per&iacute;odo Base :</div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"><%= header.getE01DEABAS()%></div>
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="30%" > 
              <div align="right">Monto Original :</div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"><%=header.getE01DEAOAM()%></div>
            </td>
            <td nowrap width="30%" > 
              <div align="right">Tipo de C&aacute;lculo :</div>
            </td>
            <td nowrap width="30%" > 
              <div align="left"><%=header.getE01DEAICT()%></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  
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
      
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="30%" > 
              <div align="left">Fecha Facturaci&oacute;n : <%= Util.formatCustomDate(currUser.getE01DTF(),
              															  details.getBigDecimalE02DLPSDM().intValue(),
              															  details.getBigDecimalE02DLPSDD().intValue(),
              															  details.getBigDecimalE02DLPSDY().intValue()) %></div>
            </td>
            <td nowrap width="3%" >&nbsp;</td>
            <td nowrap width="30%" > 
              <div align="left">Numero Planilla : <%=details.getE02DLPNPL()%></div>
            </td>
            <td nowrap width="3%" >&nbsp;</td>
            <td nowrap width="30%" > 
              <div align="left">Tasa Interes Mora : <%= details.getBigDecimalE02DLPPEI().compareTo(BigDecimal.ZERO) == 0  ? "N/A" : details.getE02DLPPEI() %></div>
            </td>
          </tr>
      
        </table>
      </td>
    </tr>
  </table>
  <br>
  
  <table class="tableinfo">
    <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
      <th align=center nowrap width="30%">Descripci&oacute;n</th>
      <th align=right  nowrap width="15%">A Pagar</th>
      <th align=right  nowrap width="20%">Pagado</th>
      <th align=right  nowrap width="20%">Condonado</th>
      <th align=right  nowrap width="15%">Saldos</th>
    </tr>
    <%
     	String name="";
     	for (int i=1;i<21;i++) {
     		if (i< 10) name="0"+i; else name="" +i;
	    	if (!(details.getField("E02AMNT"+name).getString().trim().equals("0.00") || details.getField("E02AMNT"+name).getString().trim().equals("0,00")) ){  %> 
	    <tr> 
	      <td align=CENTER  nowrap width="15%">
	      <% if (details.getField("E02FLGT"+name).getString().equals("L")){ %>
	      <div style="text-decoration: underline;font-style: italic; font-weight: bold;">
	      	<a  href="javascript:showDetailMora(<%=request.getParameter("Row").trim()%>,'<%=header.getE01DEAACC()%>','<%=details.getE02DLPPDM()%>','<%=details.getE02DLPPDD()%>','<%=details.getE02DLPPDY()%>')"><%=details.getField("E02DESC"+name).getString().trim()%></a>
	      </div>
	      <% } else { %>
	      <%= details.getField("E02DESC"+name).getString().trim() %> 
	      <% } %>
	      </td>
	      <td align=CENTER  nowrap width="10%"> 
	        <div align="right" ><%= details.getField("E02AMNT"+name).getString().trim() %></div>
	      </td>
	      <td align=CENTER  nowrap width="10%"> 
	        <div align="right" ><%= details.getField("E02PAID"+name).getString().trim() %></div>
	      </td>
	      <td align=CENTER  nowrap width="10%"> 
	        <div align="right" ><%= details.getField("E02COND"+name).getString().trim() %></div>
	      </td>
	      <td align=CENTER  nowrap width="10%"> 
	        <div align="right" ><%= details.getField("E02TOTA"+name).getString().trim() %></div>
	      </td>
	    </tr>
	    <%   }
	 	}
	%> 
		<% if (header.getField("E01DLCFL9").getString().equals("Y")){ %>
	 	<tr> 
	      <td align=CENTER  nowrap width="15%">
	      <div align="center" ><%= details.getField("E02PAHDSC").getString().trim() %></div>
	      </td>
	      <td align=CENTER  nowrap width="10%"> 
	        <div align="right" ><%= details.getField("E02PAHVAH").getString().trim() %></div>
	      </td>
	      <td align=CENTER  nowrap width="10%"> 
	        <div align="right" ><%= details.getField("E02PAHVAP").getString().trim() %></div>
	      </td>
	      <td align=CENTER  nowrap width="10%"> 
	        <div align="right" >0.00</div>
	      </td>
	      <td align=CENTER  nowrap width="10%"> 
	        <div align="right" ><%= details.getField("E02PAHTOT").getString().trim() %></div>
	      </td>
	   </tr>
		<% } %>
  </table>
  <br>
  
  <table class="tableinfo">
    <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
            <td nowrap width="20%" height="18" ><b>Total</b></td>
            <td nowrap width="20%" height="18" >A Pagar : &nbsp;<%= details.getE02TOAMNT() %></td>
            <td nowrap width="20%" height="18" > 
              <div align="left">Pagado :&nbsp;<%= details.getE02TOPAID() %></div>
            </td>
            <td nowrap width="20%" height="18" > 
              <div align="left">Condonado :&nbsp;<%= details.getE02TOCOND() %></div>
            </td>
            <td nowrap width="20%" height="18" > 
              <div align="left">Saldos :&nbsp;<%= details.getE02TOTOTA() %></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  </FORM>

<script type="text/javascript">
function showDetailMora(rowNum, account, mm, dd, yy) {
	var param = "&Row=" + rowNum + "&E05PMRACC=" + account + "&E05PMRPDM=" + mm + "&E05PMRPDD=" + dd + "&E05PMRPDY=" + yy;
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSEDL0900?SCREEN=400" + param;
	CenterWindow(page, 760, 380, 2);
}

</script>

</BODY>
</HTML>
