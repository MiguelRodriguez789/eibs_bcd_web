<html>
<head>
<title>Instrucciones Especiales</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "lnInst" class= "datapro.eibs.beans.ESD000005Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

   builtNewMenu(pv_m_opt);

function history(type,code) {
	pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.general.JSEWD0701?SCREEN=1&TYPE=" + type + "&CODE=" + code;
	CenterWindow(pg,600,500,2);
}

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
    out.println("<SCRIPT> initMenu(); </SCRIPT>");

%> 
<h3 align="center">Instrucciones Especiales <%= userPO.getHeader4().trim()%><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_special_inst,EDL0150"></h3>
<hr size="4">
 <FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDL0150" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="12">
  </p>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
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
              <div align="right"><b>Préstamo :</b></div>
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
      </td>
    </tr>
  <tr>	
	<td> 
        <div align="center">  
          <input id="EIBSBTN_LARGE" type=button name="Button" value="Ver Historia de Instrucciones" onClick="javascript:history('<%= lnInst.getE05ACD().trim()%>','<%= userPO.getIdentifier().trim()%>')">
        </div>
      </td>
  </tr>
  </table>
  <p>&nbsp; </p>
 
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <p align="center"> 
          <input type="text"  name="E15DSC" size="155" maxlength="132" value="<%= lnInst.getE15DSC().trim()%>"><br>
          <input type="text"  name="E25DSC" size="155" maxlength="132" value="<%= lnInst.getE25DSC().trim()%>"><br>
          <input type="text"  name="E35DSC" size="155" maxlength="132" value="<%= lnInst.getE35DSC().trim()%>"><br>
          <input type="text"  name="E45DSC" size="155" maxlength="132" value="<%= lnInst.getE45DSC().trim()%>"><br>
          <input type="text"  name="E55DSC" size="155" maxlength="132" value="<%= lnInst.getE55DSC().trim()%>"><br>
          <input type="text"  name="E65DSC" size="155" maxlength="132" value="<%= lnInst.getE65DSC().trim()%>"><br>
          <input type="text"  name="E75DSC" size="155" maxlength="132" value="<%= lnInst.getE75DSC().trim()%>"><br>
          <input type="text"  name="E85DSC" size="155" maxlength="132" value="<%= lnInst.getE85DSC().trim()%>"><br>
          <input type="text"  name="E95DSC" size="155" maxlength="132" value="<%= lnInst.getE95DSC().trim()%>"><br>
          <input type="text"  name="E05DSC" size="155" maxlength="132" value="<%= lnInst.getE05DSC().trim()%>"><br>
          <input type="text"  name="EA5DSC" size="155" maxlength="132" value="<%= lnInst.getEA5DSC().trim()%>"><br>
          <input type="text"  name="EB5DSC" size="155" maxlength="132" value="<%= lnInst.getEB5DSC().trim()%>"><br>
          <input type="text"  name="EC5DSC" size="155" maxlength="132" value="<%= lnInst.getEC5DSC().trim()%>"><br>
          <input type="text"  name="ED5DSC" size="155" maxlength="132" value="<%= lnInst.getED5DSC().trim()%>"><br>
          <input type="text"  name="EE5DSC" size="155" maxlength="132" value="<%= lnInst.getEE5DSC().trim()%>"><br>
          <input type="text"  name="EF5DSC" size="155" maxlength="132" value="<%= lnInst.getEF5DSC().trim()%>"><br>
          <input type="text"  name="EG5DSC" size="155" maxlength="132" value="<%= lnInst.getEG5DSC().trim()%>"><br>
          <input type="text"  name="EH5DSC" size="155" maxlength="132" value="<%= lnInst.getEH5DSC().trim()%>"><br>
          <input type="text"  name="EI5DSC" size="155" maxlength="132" value="<%= lnInst.getEI5DSC().trim()%>"><br>
          <input type="text"  name="EJ5DSC" size="155" maxlength="132" value="<%= lnInst.getEJ5DSC().trim()%>"><br>
        </p>
      </td>
    </tr>
  </table>

  	<div align="center"> 
    	<input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  	</div>

  </form>
</body>
</html>
