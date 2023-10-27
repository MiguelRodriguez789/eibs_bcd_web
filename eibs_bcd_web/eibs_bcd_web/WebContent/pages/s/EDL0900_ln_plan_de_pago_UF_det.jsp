<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import = "java.lang.Object" %>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EDL090003Message"%>

<HTML>
<HEAD>
<TITLE> Detalle de Cuota </TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="header" class="datapro.eibs.beans.EDL090001Message"  scope="session" />
<jsp:useBean id="listUF" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
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
  	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_details_de_pago_UF_det.jsp,EDL0900"> 
  </h3>
  <hr size="4">

  <%
			int index = Integer.parseInt(request.getParameter("Row").trim());
			EDL090003Message details = (EDL090003Message)listUF.get(index);
 %> 
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <%if(!userPO.getCusNum().equals("0")){ %>
          <tr id="trdark"> 
            <td nowrap width="14%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="9%" > 
              <div align="left"> 
              		<input type="text" name="E03CUN2" size="10" maxlength="9" readonly value="<%= header.getE01DEACUN().trim()%>">
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap > 
              <div align="left"> 
              		<input type="text" name="E03NA12" size="45" maxlength="45" readonly value="<%= header.getE01CUSNA1().trim()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap ><b> 
              		<input type="text" name="E03PRO2" size="5" maxlength="4" readonly value="<%= header.getE01DEAPRO().trim()%>">
              </b></td>
          </tr>
          <% }%>
          <tr id="trdark"> 
            <td nowrap width="14%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"> 
              		<input type="text" name="E03ACC" size="13" maxlength="12" readonly value="<%= header.getE01DEAACC().trim()%>">
              </div>
            </td>
            <td nowrap width="12%"></td>
            <td nowrap width="33%"></td>
            <td nowrap width="11%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="21%"> 
              <div align="left"><b> 
               	<input type="text" name="E01DEACCY" size="4" maxlength="3" value="<%= header.getE01DEACCY().trim()%>" readonly>
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
            <td nowrap width="30%" >Cuota de N&uacute;mero : <%= details.getE03DLPPNU().equals("77777") ? "Aceler."  :
																( details.getE03DLPPNU().equals("88888") ? "Abono" :
																	( details.getE03DLPPNU().equals("99999") ? "Prepago" : details.getE03DLPPNU())) %></td>
            <td nowrap width="3%" >&nbsp;</td>
            <td nowrap width="30%" > 
              <div align="left">Fecha a Pagar : <%= Util.formatCustomDate(currUser.getE01DTF(),
              															  details.getBigDecimalE03DLPPDM().intValue(),
              															  details.getBigDecimalE03DLPPDD().intValue(),
              															  details.getBigDecimalE03DLPPDY().intValue()) %></div>
            </td>
            <td nowrap width="3%" >&nbsp;</td>
            <td nowrap width="30%" > 
              <div align="left">Fecha de Pago : <%= Util.formatCustomDate(currUser.getE01DTF(),
              															  details.getBigDecimalE03DLPDTM().intValue(),
              															  details.getBigDecimalE03DLPDTD().intValue(),
              															  details.getBigDecimalE03DLPDTY().intValue()) %></div>
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="30%" > 
              <div align="left">Fecha Facturaci&oacute;n : <%= Util.formatCustomDate(currUser.getE01DTF(),
              															  details.getBigDecimalE03DLPSDM().intValue(),
              															  details.getBigDecimalE03DLPSDD().intValue(),
              															  details.getBigDecimalE03DLPSDY().intValue()) %></div>
            </td>
            <td nowrap width="3%" >&nbsp;</td>
            <td nowrap width="30%" > 
              <div align="left">Numero Planilla : <%=details.getE03DLPNPL()%></div>
            </td>
            <td nowrap width="3%" >&nbsp;</td>
            <td nowrap width="30%" > 
            </td>
          </tr>
      
        </table>
      </td>
    </tr>
  </table>
  <br>
  
  <table class="tableinfo">
    <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
      <th align=CENTER nowrap width="30%" >Descripci&oacute;n</th>
      <th align=right nowrap width="15%" >A Pagar</th>
      <th align=right nowrap width="20%" >Pagado</th>
      <th align=right nowrap width="20%" >Condonado</th>
      <th align=right nowrap width="15%" >Saldos</th>
    </tr>
    <%
     	String name="";
     	for (int i=1;i<21;i++) {
     		if (i< 10) name="0"+i; else name="" +i;
	    	if (!(details.getField("E03AMNT"+name).getString().trim().equals("0.0000") || details.getField("E03AMNT"+name).getString().trim().equals("0,0000")) ){  %> 
	    <tr> 
	      <td align=CENTER  nowrap width="15%">
	      <% if (details.getField("E03FLGT"+name).getString().equals("L")){ %>
	      <div style="text-decoration: underline;font-style: italic; font-weight: bold;">
	      		<a href="javascript:showDetailMoraUF(<%=request.getParameter("Row").trim()%>,'<%=header.getE01DEAACC()%>','<%=details.getE03DLPPDM()%>','<%=details.getE03DLPPDD()%>','<%=details.getE03DLPPDY()%>')"><%=details.getField("E03DESC"+name).getString().trim()%></a>
	      	</div>
	      <% } else { %>
	      	<%= details.getField("E03DESC"+name).getString().trim() %> 
	      <% } %>
	      </td>
	      <td align="right"  nowrap width="10%"> 
	        <div align="right" ><%= details.getField("E03AMNT"+name).getString().trim() %></div>
	      </td>
	      <td align="right"  nowrap width="10%"> 
	        <div align="right" ><%= details.getField("E03PAID"+name).getString().trim() %></div>
	      </td>
	      <td align="right"  nowrap width="10%"> 
	        <div align="right" ><%= details.getField("E03COND"+name).getString().trim() %></div>
	      </td>
	      <td align="right"  nowrap width="10%"> 
	        <div align="right" ><%= details.getField("E03TOTA"+name).getString().trim() %></div>
	      </td>
	    </tr>
	    <%   }
	 	}
	%> 
  </table>
  <br>
  
  <table class="tableinfo">
    <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
            <td nowrap width="20%" height="18" ><b>Total</b></td>
            <td nowrap width="20%" height="18" >A Pagar : &nbsp;<%= details.getE03TOAMNT() %></td>
            <td nowrap width="20%" height="18" > 
              <div align="left">Pagado :&nbsp;<%= details.getE03TOPAID() %></div>
            </td>
            <td nowrap width="20%" height="18" > 
              <div align="left">Condonado :&nbsp;<%= details.getE03TOCOND() %></div>
            </td>
            <td nowrap width="20%" height="18" > 
              <div align="left">Saldos :&nbsp;<%= details.getE03TOTOTA() %></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  </FORM>

</BODY>
<script type="text/javascript">

function showDetailMoraUF(rowNum, account, mm, dd, yy) {
	var param = "&Row=" + rowNum + "&E05PMRACC=" + account + "&E05PMRPDM=" + mm + "&E05PMRPDD=" + dd + "&E05PMRPDY=" + yy;
	param += "&UF=Y";
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSEDL0900?SCREEN=400" + param;
	CenterWindow(page, 760, 380, 2);
}

</script>

</HTML>
