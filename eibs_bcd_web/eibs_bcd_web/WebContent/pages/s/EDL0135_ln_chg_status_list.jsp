<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EDL013503Message"%>

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Historia Cambios de Estados</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">

<jsp:useBean id="loans" class="datapro.eibs.beans.EDL013503Message"  scope="session" />
<jsp:useBean id="EDL013503List" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

<% if ( userPO.getHeader23().equals("G") ||  userPO.getHeader23().equals("V")){ %>
	builtNewMenu(ln_i_1_opt);
<% } else  { %>
	builtNewMenu(ln_i_2_opt);
<% } %>
initMenu();
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
%>

<h3 align="center">Historia Cambios de Estados<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_chg_status_list.jsp,EDL0135"></h3>
<hr size="4">
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0135">
<input type="hidden" name="SCREEN" value="500"> 
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
								<eibsinput:text property="E03DEACUN" name="loans" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap > 
              <div align="left"> 
								<eibsinput:text property="E03CUSNA1" name="loans" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true"/>
              </div>
            </td>
            <td nowrap > 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap ><b>                
								<eibsinput:text property="E03DEATYP" name="loans" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/>
								<eibsinput:text property="E03DEAPRO" name="loans" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/>
              </b></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="14%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"> 
								<eibsinput:text property="E03DEAACC" name="loans" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true"/>
              </div>
            </td>
            <td nowrap width="12%"> 
              <div align="right">Oficial :</div>
            </td>
            <td nowrap width="33%"> 
              <div align="left"><b> 
                <input type="text" name="E03DEAOFC" size="48" maxlength="45" readonly value="<%= userPO.getOfficer().trim()%>">
                </b> </div>
            </td>
            <td nowrap width="11%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="21%"> 
              <div align="left"><b> 
								<eibsinput:text property="E03DEACCY" name="loans" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true"/>
                </b> </div>
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
	<br>
	<table class="tableinfolist" width="100%">
		<tr id="trdark">
			<th align="center" nowrap width="10%">Fecha</th>
			<th align="center" nowrap width="20%">Anterior</th>
			<th align="center" nowrap width="20%">Nuevo</th>
			<th align="center" nowrap width="10%">Sus/Dev</th>
			<th align="center" nowrap width="20%">Origen</th>
			<th align="center" nowrap width="20%">Usuario</th>
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
														'LN','<%=dlsts.getE03DSCUS1().trim()%>' , '<%=dlsts.getE03DSCUS1().trim()%>');">					
					<%=Util.formatCustomDate(currUser.getE01DTF(), dlsts.getE03DLSDTM(), dlsts.getE03DLSDTD(),dlsts.getE03DLSDTY())%>
				</a>
			</td>
			<td nowrap align="left">
				<a href="javascript:showStatusReason('<%=dlsts.getE03DLSREM().trim()%>','<%=dlsts.getE03DLSEVN().trim()%>','<%=dlsts.getE03DSCEVN().trim()%>',
														'LN','<%=dlsts.getE03DSCUS1().trim()%>' , '<%=dlsts.getE03DSCUS1().trim()%>');">					
			 		<%=Util.formatCell(dlsts.getE03DLSOST() + "-" + dlsts.getE03DSCOST())%>
			</a> 		
			</td>
			<td nowrap align="left"> 
				<a href="javascript:showStatusReason('<%=dlsts.getE03DLSREM().trim()%>','<%=dlsts.getE03DLSEVN().trim()%>','<%=dlsts.getE03DSCEVN().trim()%>',
														'LN','<%=dlsts.getE03DSCUS1().trim()%>' , '<%=dlsts.getE03DSCUS1().trim()%>');">					
					<%=Util.formatCell(dlsts.getE03DLSNST() + "-" + dlsts.getE03DSCNST())%>
				</a>
			</td>
			<td nowrap align="center"> 
				<a href="javascript:showStatusReason('<%=dlsts.getE03DLSREM().trim()%>','<%=dlsts.getE03DLSEVN().trim()%>','<%=dlsts.getE03DSCEVN().trim()%>',
														'LN','<%=dlsts.getE03DSCUS1().trim()%>' , '<%=dlsts.getE03DSCUS1().trim()%>');">					
					<%if(dlsts.getE03DLSSUS().equals("S")){%> Suspensi&oacute;n <%}else{ %> <%=dlsts.getE03DLSSUS()%> <% } %>
				</a>
			</td>
			<td nowrap align="center"> 
				<a href="javascript:showStatusReason('<%=dlsts.getE03DLSREM().trim()%>','<%=dlsts.getE03DLSEVN().trim()%>','<%=dlsts.getE03DSCEVN().trim()%>',
														'LN','<%=dlsts.getE03DSCUS1().trim()%>' , '<%=dlsts.getE03DSCUS1().trim()%>');">					
					<%=dlsts.getE03DSCFLG()%>
				</a>
			</td>
			<td nowrap align="left"> 
				<a href="javascript:showStatusReason('<%=dlsts.getE03DLSREM().trim()%>','<%=dlsts.getE03DLSEVN().trim()%>','<%=dlsts.getE03DSCEVN().trim()%>',
														'LN','<%=dlsts.getE03DSCUS1().trim()%>' , '<%=dlsts.getE03DSCUS1().trim()%>');">					
					<%=Util.formatCell(dlsts.getE03DLSUSR() + "-" + dlsts.getE03DSCUSR())%>
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

