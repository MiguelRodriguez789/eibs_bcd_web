<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="com.datapro.constants.Entities"%> 
<%@ page import="datapro.eibs.master.Util"%>
<%@page import="datapro.eibs.beans.ESD081701Message"%><html>

<head>
<title> Remanentes </title>
<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="ESD0817List" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id= "remanentes" class= "datapro.eibs.beans.ERM006001Message"  scope="session" /> 
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

   builtNewMenu(cd_i_opt);
   initMenu(); 
    
</SCRIPT>

</head>

<body>


<h3 align="center">Consulta de Remanentes Asociados a Certificados <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="remanenetes_basic_inquiry.jsp,ERM0060"></h3>
<hr size="4">

<form  method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSERM0060">
<input type="hidden" name="SCREEN" value="400">

<input type="hidden" name="E01RMMACD" value="<%= remanentes.getField("E01RMMACD").getString().trim()%>">
<input type="hidden" name="E01RMMTYP" value="<%= remanentes.getField("E01RMMTYP").getString().trim()%>">
<input type="hidden" name="E01RMMGLN" value="<%= remanentes.getField("E01RMMGLN").getString().trim()%>">

 <% int row = 0;%>


<% 
 int k = 0;
if(remanentes.getE01RMMACC().equals("0") || remanentes.getE01RMMACC().equals(null)){
%>
<TABLE class="tbenter" width=100% >
	<TR>
		<TD>
		<div align="center"><font size="3"><b> No hay Asociaciones Registradas. </b></font></div>
		</TD>
	</TR>
</TABLE>
<%
}else{
%>
 <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left">
				<eibsinput:text name="remanentes" property="E01RMMCUN"  eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true" />
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left">
	  			<eibsinput:text name="remanentes" property="E01CUSNA1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" readonly="true"/>
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
      			<eibsinput:text name="remanentes" property="E01RMMACC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true"/>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
	  			<eibsinput:text name="remanentes" property="E01RMMCCY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true"/>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
	  			<eibsinput:text name="remanentes" property="E01RMMPRD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
 <h4>Información Básica</h4>
 <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%" > 
              <div align="right">Saldo Remanente :</div>
            </td>
            <td nowrap width="30%" > 
 		        <eibsinput:text name="remanentes" property="E01RMMAMT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Ultima Transaccion :</div>
            </td>
            <td nowrap width="30%" > 
    	        <eibsinput:date name="remanentes" fn_year="E01RMMLTY" fn_month="E01RMMLTM" fn_day="E01RMMLTD" readonly="true"/>
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%" > 
              <div align="right">Total Debitos :</div>
            </td>
            <td nowrap width="30%" > 
 		        <eibsinput:text name="remanentes" property="E01RMMTDR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Numero de Debitos :</div>
            </td>
            <td nowrap width="30%" > 
 		        <eibsinput:text name="remanentes" property="E01RMMNDR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="6" readonly="true"/>
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%" > 
              <div align="right">Total Credito :</div>
            </td>
            <td nowrap width="30%" > 
 		        <eibsinput:text name="remanentes" property="E01RMMTCR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Numero de Creditos :</div>
            </td>
            <td nowrap width="30%" > 
 		        <eibsinput:text name="remanentes" property="E01RMMNCR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="6" readonly="true"/>
            </td>
          </tr>


          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%" > 
              <div align="right">Monto Inicial :</div>
            </td>
            <td nowrap width="30%" > 
 		        <eibsinput:text name="remanentes" property="E01RMMOAM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Fecha Inicio :</div>
            </td>
            <td nowrap width="30%" > 
    	        <eibsinput:date name="remanentes" fn_year="E01RMMOPY" fn_month="E01RMMOPM" fn_day="E01RMMOPD" readonly="true"/>
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%" > 
              <div align="right">Ejecutivo :</div>
            </td>
            <td nowrap width="30%" > 
                 <eibsinput:text name="remanentes" property="E01RMMOFC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="true"/>
                 <eibsinput:text name="remanentes" property="E01DSCOFC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>"  readonly="true"/>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Centro de Costos :</div>
            </td>
            <td nowrap width="30%" > 
 		        <eibsinput:text name="remanentes" property="E01RMMCCN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_COST_CENTER %>"  readonly="true"/>
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%" > 
              <div align="right">Banco/Sucursal :</div>
            </td>
            <td nowrap width="30%" > 
		        <eibsinput:text name="remanentes" property="E01RMMBNK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" readonly="true" />
	            <eibsinput:text name="remanentes" property="E01RMMBRN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH%>" readonly="true" />
            </td>
            <td nowrap width="20%" > 
              <div align="right">Referencia :</div>
            </td>
            <td nowrap width="30%" > 
 		        <eibsinput:text name="remanentes" property="E01RMMREF" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>"  readonly="true"/>
            </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>
  
<h4>Transacciones</h4>


<% } 
  k = 0;
	if (ESD0817List.getNoResult()) {
%>
<TABLE class="tbenter" width=100% >
	<TR>
		<TD>
		<div align="center"><font size="3"><b>  </b></font></div>
		</TD>
	</TR>
</TABLE>
<%
	} else {
%>

 <table id="mainTable" class="tableinfo" align="center"  width=100%>
	<tr>
		<td nowrap valign="top">

		<TABLE id="headTable" width=100%>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<th align="center" nowrap width="10%">Fecha<br>Proceso</th>
				<th align="center" nowrap width="10%">Fecha<br>Valor</th>
				<th align="center" nowrap width="5%">CD<br>TR</th>
				<th align="center" nowrap width="30%">Descripcion</th>
				<th align="center" nowrap width="10%">Monto</th>
				<th align="center" nowrap width="5%"></th>
				<th align="center" nowrap width="5%">Lote</th>
				<th align="center" nowrap width="10%">Hora</th>
				<th align="center" nowrap width="5%">Usuario</th>
				<th align="center" nowrap width="5%">Banco<br>Origen</th>
				<th align="center" nowrap width="5%">Sucursal<br>Origen</th>

    		</TR>
			<%
				ESD0817List.initRow();
					k = 0;
					boolean firstTime = true;
					while (ESD0817List.getNextRow()) {
						if (firstTime) {
							firstTime = false;
						} else {
						ESD081701Message convObj = (ESD081701Message) ESD0817List.getRecord();
			%>
	          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<td nowrap align="center" width="10%">
					<a href="javascript:GetBatchDet('<%=convObj.getE01TRAVDM()%>', '<%=convObj.getE01TRAVDD()%>', '<%=convObj.getE01TRAVDY()%>', '<%=convObj.getE01TRABTH()%>', '<%=convObj.getE01TRAACR()%>')">
						<%=Util.formatCustomDate(currUser.getE01DTF(),
												 convObj.getBigDecimalE01TRABDM().intValue(),
												 convObj.getBigDecimalE01TRABDD().intValue(),
												 convObj.getBigDecimalE01TRABDY().intValue())%>
					</a>
				</td>
				<td nowrap align="center" width="10%">
					<a href="javascript:GetBatchDet('<%=convObj.getE01TRAVDM()%>', '<%=convObj.getE01TRAVDD()%>', '<%=convObj.getE01TRAVDY()%>', '<%=convObj.getE01TRABTH()%>', '<%=convObj.getE01TRAACR()%>')">
						<%=Util.formatCustomDate(currUser.getE01DTF(),
												 convObj.getBigDecimalE01TRAVDM().intValue(),
												 convObj.getBigDecimalE01TRAVDD().intValue(),
												 convObj.getBigDecimalE01TRAVDY().intValue())%>
					</a>
				</td>
				<td nowrap align="center" width="5%"><%= convObj.getE01TRACDE()%></td>
				<td nowrap align="left" width="30%"><%= convObj.getE01TRANAR()%></td>
				<td nowrap align="right" width="9%"><%= convObj.getE01TRAAMT()%></td>
				<% if (convObj.getE01TRADCC().equals("0")){%>
				<td nowrap align="left" width="1%">DB</td>
				<% } else {%>
				<td nowrap align="left" width="1%">CR</td>
				<% } %>
				<td nowrap align="center" width="5%">
					<a href="javascript:GetBatchDet('<%=convObj.getE01TRAVDM()%>', '<%=convObj.getE01TRAVDD()%>', '<%=convObj.getE01TRAVDY()%>', '<%=convObj.getE01TRABTH()%>', '<%=convObj.getE01TRAACR()%>')">
						<%= convObj.getE01TRABTH()%>
					</a>
				</td>
				<td nowrap align="left" width="10%"><%= convObj.getE01TRATIM()%></td>
				<td nowrap align="left" width="5%"><%= convObj.getE01TRAUSO()%></td>
				<td nowrap align="center" width="5%"><%= convObj.getE01TRAOBK()%></td>
				<td nowrap align="center" width="5%"><%= convObj.getE01TRAOBR()%></td>
    		</TR>
			<% 
						}
					k++;
					}
			%>
			 </table>
		</td>
	</tr>
</table>

<% } %>

	
</form>
</body>
</html>
