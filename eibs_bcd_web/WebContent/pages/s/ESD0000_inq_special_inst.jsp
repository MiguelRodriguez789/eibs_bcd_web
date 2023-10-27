<html>
<head>
<title>Instrucciones Especiales</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "specInst" class= "datapro.eibs.beans.ESD000005Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

<% boolean menu = true;
if ( userPO.getPurpose().equals("INQUIRY"))  {
    	if ( userPO.getOption().equals("RT") ) {
%>
	builtNewMenu(rt_i_opt);
<% 		} else if ( userPO.getOption().equals("SV")) { %>
	builtNewMenu(sv_i_opt);
<% 		} else if (userPO.getOption().equals("CD")) { %>
	builtNewMenu(cd_i_opt);
<% 		} else if (userPO.getOption().equals("LN")) { 
   			if ( userPO.getHeader23().equals("G") ||  userPO.getHeader23().equals("V")){
%>
	builtNewMenu(ln_i_1_opt);
<% 			} else if("FACT".equals(userPO.getSource())) { %>	
	builtNewMenu(dft_i_opt);
<% 			} else { %>
	builtNewMenu(ln_i_2_opt);
<% 			} 
		} else if ( userPO.getOption().equals("CLIENT_P")) {
%>
	builtNewMenu(client_inq_personal_opt);
<%  	} else if ( userPO.getOption().equals("CLIENT_C")) { %>
	builtNewMenu(client_inq_corp_opt);
<% 		} else if ( userPO.getOption().equals("CLIENT_SHORT")) {
			if(userPO.getCusType().equals("2")){
%>
		 builtNewMenu("customer_short_i_opt");
<%           } else {%>
		 builtNewMenu("customer_short_corp_i_opt");
<%  		}
		} else if ( userPO.getOption().equals("LC")) { %>
	builtNewMenu(lc_i_opt);
<% 		} else if ( userPO.getOption().equals("DV")) { %>
	builtNewMenu(coll_i_opt);
<%  	} else if ( userPO.getOption().equals("CO")) { %>
	builtNewMenu(colla_i_opt);
<%  	} else if ( userPO.getOption().equals("CR")) { %>
	builtNewMenu(cer_i_opt);
<% 		} else if ( userPO.getOption().equals("ENTITY")) { %>
	builtNewMenu("ent_i_opt");  
<% 		} else if (userPO.getOption().equals("DFT")) { %>
	builtNewMenu(dft_i_opt);
<%
   		} else {
   			menu = false;
   		}
} else {
     	if ( userPO.getOption().equals("RT")) {
%>
	builtNewMenu(rt_a_opt);
 <%  	} else if ( userPO.getOption().equals("SV")) { %>
	builtNewMenu(sv_a_opt);
<%  	} else if (userPO.getOption().equals("CD")) { %>
	builtNewMenu(cd_a_opt);
<%  	} else if (userPO.getOption().equals("LN")) { 
			if("FACT".equals(userPO.getSource())) { %>	
	builtNewMenu(dft_a_opt);
<%			} else {                                    %>
	builtNewMenu(ln_a_opt);
			
<%      	}
		} else if (userPO.getOption().equals("PV")) { %>
	 builtNewMenu(pv_a_opt);
<%  	} else if (userPO.getOption().equals("CO")) { %>
	builtNewMenu(colla_a_opt);
<%      } else if ( userPO.getOption().equals("CLIENT_P")) { %>
	builtNewMenu(client_ap_personal_opt);
<% 		} else if ( userPO.getOption().equals("CLIENT_C")) { %>
	builtNewMenu(client_ap_corp_opt);
<% 		} else if ( userPO.getOption().equals("ENTITY")) { %>
	builtNewMenu("ent_a_opt");  
<% 		} else if (userPO.getOption().equals("DFT")) { %>
	builtNewMenu(dft_a_opt);
<% } else if ( userPO.getSource().equals("COBRANZA")) { %>
	builtNewMenu("dc_d_inquiry_opening");  
<% } else if ( userPO.getSource().equals("COBRANZA_SIMPLE")) { %>
	builtNewMenu("dc_s_inquiry_opening");  
	
<%		} else {
			menu = false;
		}
}
%>

function history(type,code) {
	pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.general.JSEWD0701?SCREEN=1&TYPE=" + type + "&CODE=" + code;
	CenterWindow(pg,600 ,500,2);
}

</SCRIPT>

</head>

<body bgcolor="#FFFFFF">

<% 
if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
}
if (menu){
	if ( !userPO.getPurpose().equals("NEW") ) {
    	out.println("<SCRIPT> initMenu(); </SCRIPT>");
	}
}
%> 
<h3 align="center">Instrucciones Especiales  
  <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="inq_special_inst.jsp, ESD0000"></h3>
<hr size="4">
<p>&nbsp;</p>

 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="36">
   
<table class="tableinfo" >
  <tr > 
    <td nowrap> 
<%if(userPO.isCustomer()) { %>    
      <table class="tbhead" cellspacing="0" cellpadding="2" width="100%"    align="center">
        <tr>
            <td nowrap align="right"> Cliente: 
               </td>
          <td nowrap align="left">
      			<%= userPO.getCusNum()%>
          </td>
            <td nowrap align="right"> ID:  
            </td>
          <td nowrap align="left">
      			<%= userPO.getID()%>
          </td>
            <td nowrap align="right"> Nombre: 
               </td>
          <td nowrap align="left">
      			<%= userPO.getCusName()%>
          </td>
        </tr>
      </table>
     </td>
  </tr>
</table> 
<% } else if(!userPO.getSource().equals("COBRANZA") && !userPO.getSource().equals("COBRANZA_SIMPLE")) {%>
        <table class="tbhead" cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left">
                <input type="text" name="E02CUN2" size="10" maxlength="9" readonly value="<%= userPO.getCusNum().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" name="E02NA12" size="45" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>No. Cuenta/Referencia :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
                <input type="text" name="E02ACC" size="13" maxlength="12" value="<%= userPO.getAccNum().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
                <input type="text" name="E02CCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
                <input type="text" name="E02PRO2" size="4" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
<% } else {%>
        <table class="tbhead" cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>No. Cobranza :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left">
                <input type="text" name="E02CUN2" size="15" maxlength="15" readonly value="<%= userPO.getAccNum().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Producto :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" name="E02PRO2" size="4" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>">
                </font></font></font></div>
            </td>
          </tr>
        </table>

<% } %>
  <tr>	
	<td> 
        <div align="center">  
          <input id="EIBSBTN_LARGE" type=button name="Button" value="Ver Historia de Instrucciones" onClick="javascript:history('C1','<%= userPO.getHeader1()%>')">
        </div>
      </td>
  </tr>
</table>


 <p>&nbsp;</p><table class="tableinfo" width="132%">
    <tr id="trdark" > 
      <td nowrap> 
        <p align="center"> 
          <input type="text" readonly name="E15DSC" size="155" maxlength="132" value="<%= specInst.getE15DSC().trim()%>"><br>
          <input type="text" readonly name="E25DSC" size="155" maxlength="132" value="<%= specInst.getE25DSC().trim()%>"><br>
          <input type="text" readonly name="E35DSC" size="155" maxlength="132" value="<%= specInst.getE35DSC().trim()%>"><br>
          <input type="text" readonly name="E45DSC" size="155" maxlength="132" value="<%= specInst.getE45DSC().trim()%>"><br>
          <input type="text" readonly name="E55DSC" size="155" maxlength="132" value="<%= specInst.getE55DSC().trim()%>"><br>
          <input type="text" readonly name="E65DSC" size="155" maxlength="132" value="<%= specInst.getE65DSC().trim()%>"><br>
          <input type="text" readonly name="E75DSC" size="155" maxlength="132" value="<%= specInst.getE75DSC().trim()%>"><br>
          <input type="text" readonly name="E85DSC" size="155" maxlength="132" value="<%= specInst.getE85DSC().trim()%>"><br>
          <input type="text" readonly name="E95DSC" size="155" maxlength="132" value="<%= specInst.getE95DSC().trim()%>"><br>
          <input type="text" readonly name="E05DSC" size="155" maxlength="132" value="<%= specInst.getE05DSC().trim()%>"><br>
          <input type="text" readonly name="EA5DSC" size="155" maxlength="132" value="<%= specInst.getEA5DSC().trim()%>"><br>
          <input type="text" readonly name="EB5DSC" size="155" maxlength="132" value="<%= specInst.getEB5DSC().trim()%>"><br>
          <input type="text" readonly name="EC5DSC" size="155" maxlength="132" value="<%= specInst.getEC5DSC().trim()%>"><br>
          <input type="text" readonly name="ED5DSC" size="155" maxlength="132" value="<%= specInst.getED5DSC().trim()%>"><br>
          <input type="text" readonly name="EE5DSC" size="155" maxlength="132" value="<%= specInst.getEE5DSC().trim()%>"><br>
          <input type="text" readonly name="EF5DSC" size="155" maxlength="132" value="<%= specInst.getEF5DSC().trim()%>"><br>
          <input type="text" readonly name="EG5DSC" size="155" maxlength="132" value="<%= specInst.getEG5DSC().trim()%>"><br>
          <input type="text" readonly name="EH5DSC" size="155" maxlength="132" value="<%= specInst.getEH5DSC().trim()%>"><br>
          <input type="text" readonly name="EI5DSC" size="155" maxlength="132" value="<%= specInst.getEI5DSC().trim()%>"><br>
          <input type="text" readonly name="EJ5DSC" size="155" maxlength="132" value="<%= specInst.getEJ5DSC().trim()%>"><br>
        </p>
        <p align="center"></p>
      </td>
    </tr>
  </table>
  
</form>
</body>
</html>
