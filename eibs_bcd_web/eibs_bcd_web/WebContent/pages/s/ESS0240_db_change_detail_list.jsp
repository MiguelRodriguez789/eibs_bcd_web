<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Historial de Mantenimiento</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="dbList" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="header" class="datapro.eibs.beans.ESS024002Message" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
<%
	// show option menu
	if (userPO.getOption().equals("LN")) {
		if (userPO.getPurpose().equals("INQUIRY")) {
			if ( userPO.getHeader23().equals("G") ||  userPO.getHeader23().equals("V")){
%>
				builtNewMenu(ln_i_1_opt);
<%   
			} else  {
%>
			<%  if(!userPO.getHeader22().equals("CreditLines")) {%>
				builtNewMenu(ln_i_2_opt);
				initMenu();
			<%}else{%>
				builtNewMenu(cuplus_inq_opt);
				initMenu();
			<%} %>
<%   
			}
		} else { %>
 			builtNewMenu(ln_a_opt);
<% 		
		}
	} else if (userPO.getOption().equals("LN_PAYMENTCOND")) {
%>
		builtNewMenu(pm_cnd_opt);

<% 		
	} else if (userPO.getOption().equals("CD")) {
		if (userPO.getPurpose().equals("INQUIRY")) {
%>
			builtNewMenu(cd_i_opt);
<% 		
		} else {
%>
			builtNewMenu(cd_a_opt);

<% 		
	}
	} else if (userPO.getOption().equals("LC")) {
		if (userPO.getPurpose().equals("INQUIRY")) {
%>
			builtNewMenu(lc_i_opt);
<% 		
		} else {
%>
			builtNewMenu(lc_i_opt);


<% 		
	}
	} else if (userPO.getOption().equals("DV")) {
		if (userPO.getPurpose().equals("INQUIRY")) {
%>
			builtNewMenu(coll_i_opt);
<% 		
		} else {
%>
			builtNewMenu(coll_i_opt);

<% 		

		}
	} else if (userPO.getOption().equals("RT")) {
		if (userPO.getPurpose().equals("INQUIRY")) {
%>
			builtNewMenu(rt_i_opt);
<%
		} else {
%>		
			builtNewMenu(rt_a_opt);
<%
	 	}
	} else if (userPO.getOption().equals("SV")) {
		if (userPO.getPurpose().equals("INQUIRY")) {
%>
			builtNewMenu(sv_i_opt);
<%		
		} else {
%>
			builtNewMenu(sv_a_opt);		
<% 		
		}
	} else if (userPO.getOption().equals("CLIENT_C")) {
		if (userPO.getPurpose().equals("INQUIRY")) {
%>
			builtNewMenu(client_inq_corp_opt);
<%		
		} else {
%>
			builtNewMenu(client_ap_corp_opt);		
<% 		
		}
	} else if (userPO.getOption().equals("CLIENT_P")) {
		if (userPO.getPurpose().equals("INQUIRY")) {
%>
			builtNewMenu(client_inq_personal_opt);
<%		
		} else {			
%>
			builtNewMenu(client_ap_personal_opt);								
<% 		
		}
	} 
%>

</SCRIPT>
</head>

<BODY>
<%
	// show option menu
	if (userPO.getOption().equals("LN") 
		|| userPO.getOption().equals("LN_PAYMENTCOND")
		|| userPO.getOption().equals("CD")
		|| userPO.getOption().equals("DV")
		|| userPO.getOption().equals("LC")
		|| userPO.getOption().equals("RT")
		|| userPO.getOption().equals("SV")
		|| userPO.getOption().equals("CLIENT_C")
		|| userPO.getOption().equals("CLIENT_P")) {
	
 		out.println("<SCRIPT> initMenu();  </SCRIPT>");
	}
%>

<h3 align="center">Historial de Mantenimiento<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="db_change_detail_list.jsp, ESS0240"></h3>
<hr size="4">
<FORM  >
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
	            <td nowrap width="6%" align="right">Identificacion :  
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
                <input type="text" name="E02CUN" size="10" maxlength="9" readonly value="<%= userPO.getCusNum().trim()%>">
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E02NA1" size="48" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap ><b>                
               <input type="text" name="E02TYP" size="4" maxlength="4" readonly value="<%= userPO.getType().trim()%>">
               <input type="text" name="E02PRO" size="4" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>">
              </b></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="14%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"> 
                <input type="text" name="E02ACC" size="13" maxlength="12" value="<%= userPO.getAccNum().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%"> 
              <div align="right">Oficial :</div>
            </td>
            <td nowrap width="33%"> 
              <div align="left"><b> 
                <input type="text" name="E02OFC" size="48" maxlength="45" readonly value="<%= userPO.getOfficer().trim()%>">
                </b> </div>
            </td>
            <td nowrap width="11%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="21%"> 
              <div align="left"><b> 
              <input type="text" name="E02CCY" size="4" maxlength="4" readonly value="<%= userPO.getCurrency().trim()%>">    
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<%}%>  
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
         <%
          dbList.initRow();
          boolean firstTime = true;
          String chk = "";
          while (dbList.getNextRow()) {
                
                datapro.eibs.beans.ESS024003Message msgList = (datapro.eibs.beans.ESS024003Message) dbList.getRecord();
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
     
<%}%>
</form>
</body>
</html>
