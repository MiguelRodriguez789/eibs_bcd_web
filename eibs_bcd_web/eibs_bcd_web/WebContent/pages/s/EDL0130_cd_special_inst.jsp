<html>
<head>
<title>Instrucciones Especiales</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "cdInst" class= "datapro.eibs.beans.ESD000005Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

   builtNewMenu(cd_m_opt);


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
 
<h3 align="center">Instrucciones Especiales<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cd_special_inst,EDL0130"></h3>
<hr size="4">
 <FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDL0130" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="16">
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
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
                <input type="text" name="E05ACC" size="13" maxlength="12" value="<%= userPO.getAccNum().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
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
  </table>
  <p>&nbsp; </p>
  
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <p align="center"> 
          <input type="text" name="E15DSC" size="155" maxlength="132" value="<%= cdInst.getE15DSC().trim()%>"><br>
          <input type="text" name="E25DSC" size="155" maxlength="132" value="<%= cdInst.getE25DSC().trim()%>"><br>
          <input type="text" name="E35DSC" size="155" maxlength="132" value="<%= cdInst.getE35DSC().trim()%>"><br>
          <input type="text" name="E45DSC" size="155" maxlength="132" value="<%= cdInst.getE45DSC().trim()%>"><br>
          <input type="text" name="E55DSC" size="155" maxlength="132" value="<%= cdInst.getE55DSC().trim()%>"><br>
          <input type="text" name="E65DSC" size="155" maxlength="132" value="<%= cdInst.getE65DSC().trim()%>"><br>
          <input type="text" name="E75DSC" size="155" maxlength="132" value="<%= cdInst.getE75DSC().trim()%>"><br>
          <input type="text" name="E85DSC" size="155" maxlength="132" value="<%= cdInst.getE85DSC().trim()%>"><br>
          <input type="text" name="E95DSC" size="155" maxlength="132" value="<%= cdInst.getE95DSC().trim()%>"><br>
          <input type="text" name="E05DSC" size="155" maxlength="132" value="<%= cdInst.getE05DSC().trim()%>"><br>
          <input type="text" name="EA5DSC" size="155" maxlength="132" value="<%= cdInst.getEA5DSC().trim()%>"><br>
          <input type="text" name="EB5DSC" size="155" maxlength="132" value="<%= cdInst.getEB5DSC().trim()%>"><br>
          <input type="text" name="EC5DSC" size="155" maxlength="132" value="<%= cdInst.getEC5DSC().trim()%>"><br>
          <input type="text" name="ED5DSC" size="155" maxlength="132" value="<%= cdInst.getED5DSC().trim()%>"><br>
          <input type="text" name="EE5DSC" size="155" maxlength="132" value="<%= cdInst.getEE5DSC().trim()%>"><br>
          <input type="text" name="EF5DSC" size="155" maxlength="132" value="<%= cdInst.getEF5DSC().trim()%>"><br>
          <input type="text" name="EG5DSC" size="155" maxlength="132" value="<%= cdInst.getEG5DSC().trim()%>"><br>
          <input type="text" name="EH5DSC" size="155" maxlength="132" value="<%= cdInst.getEH5DSC().trim()%>"><br>
          <input type="text" name="EI5DSC" size="155" maxlength="132" value="<%= cdInst.getEI5DSC().trim()%>"><br>
          <input type="text" name="EJ5DSC" size="155" maxlength="132" value="<%= cdInst.getEJ5DSC().trim()%>"><br>
        </p>
      </td>
    </tr>
  </table>
  
		<p><center>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
        <tr bgcolor="#FFFFFF"> 
          <td width="33%"> 
            <div align="center"> 
              <input id="EIBSBTN" type=submit name="Submit" value="Enviar" onClick="CheckSubmit('F')">
            </div>
          </td>
        </tr>
      </table>
    </center>
		<p>
 
</form>
</body>
</html>
