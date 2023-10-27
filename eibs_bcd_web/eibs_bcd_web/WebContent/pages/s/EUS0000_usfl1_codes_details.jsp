<html>
<head>
<title>Reference Code</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="refCodes" class="datapro.eibs.beans.EUS000002Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
builtHPopUp();

function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }
   
</SCRIPT>

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
%>


<H3 align="center">Codigos Especiales de Usuario - <%=userPO.getHeader10()%>
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="usfl1_codes_details.jsp, EUS0000"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEUS0000" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
  
  <h4>Informacion Basica</h4>
  
  <%int row = 0; %>
  <table  class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="45%"> 
              <div align="right">Clasificacion  :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E02US1RTY" size="3" maxlength="2" value="<%= refCodes.getE02US1RTY().trim()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="45%" > 
              <div align="right">Codigo :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E02US1CDE" size="7" maxlength="6" value="<%= refCodes.getE02US1CDE().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="45%"> 
              <div align="right">Descripcion :</div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="E02US1DSC" size="61" maxlength="60" value="<%= refCodes.getE02US1DSC().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
          
          <%if (refCodes.getE02US1RTY().equals("16")) {%> 
          
            <td nowrap width="45%" align="right">Responsable Area :</td>
            <td nowrap> 
            	<select name="E02US1CD1">
          			<option value="1" <%if (refCodes.getE02US1CD1().equals("1")) { out.print("selected"); }%>>Private Banking</option>
          			<option value="2" <%if (refCodes.getE02US1CD1().equals("2")) {  out.print("selected"); }%>>Treasury</option>
          			<option value="3" <%if (refCodes.getE02US1CD1().equals("3")) {  out.print("selected"); }%>>Back Office</option>          		 
				</select>              
            </td>
            
            
          <%}else{%>           
            <td nowrap width="45%" align="right">Referencia 1 :</td>
            <td nowrap> 
              <div align="left">
                <INPUT type="text" name="E02US1CD1" size="7" maxlength="6"
					value="<%= refCodes.getE02US1CD1().trim()%>"></div>
            </td>            
          <%}%>
             
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <TD nowrap width="45%" align="right">Referencia 2 :</TD><TD nowrap> 
              <DIV align="left">
                <INPUT type="text" name="E02US1CD2" size="7" maxlength="6" value="<%= refCodes.getE02US1CD2().trim()%>"></DIV>
            </TD>
            
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <TD nowrap width="45%" align="right">Referencia 3 :</TD><TD nowrap> 
              <DIV align="left">
                <INPUT type="text" name="E02US1CD3" size="7" maxlength="6" value="<%= refCodes.getE02US1CD3().trim()%>"></DIV>
            </TD>
            
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <TD nowrap width="45%" align="right">Referencia 4 :</TD><TD nowrap> 
              <DIV align="left">
                <INPUT type="text" name="E02US1CD4" size="7" maxlength="6" value="<%= refCodes.getE02US1CD4().trim()%>"></DIV>
            </TD>
            
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <TD nowrap width="45%" align="right">Referencia 5 :</TD><TD nowrap> 
              <DIV align="left">
                <INPUT type="text" name="E02US1CD5" size="7" maxlength="6" value="<%= refCodes.getE02US1CD5().trim()%>"></DIV>
            </TD>
            
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <TD nowrap width="45%" align="right">Referencia 6 :</TD><TD nowrap> 
              <DIV align="left">
                <INPUT type="text" name="E02US1CD6" size="7" maxlength="6" value="<%= refCodes.getE02US1CD6().trim()%>"></DIV>
            </TD>
            
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <TD nowrap width="45%" align="right">Referencia 7 :</TD><TD nowrap> 
              <DIV align="left">
                <INPUT type="text" name="E02US1CD7" size="7" maxlength="6" value="<%= refCodes.getE02US1CD7().trim()%>"></DIV>
            </TD>
            
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <TD nowrap width="45%" align="right">Referencia 8 :</TD><TD nowrap> 
              <DIV align="left">
                <INPUT type="text" name="E02US1CD8" size="7" maxlength="6" value="<%= refCodes.getE02US1CD8().trim()%>"></DIV>
            </TD>
            
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <TD nowrap width="45%" align="right">Referencia 9 :</TD><TD nowrap> 
              <DIV align="left">
                <INPUT type="text" name="E02US1CD9" size="7" maxlength="6" value="<%= refCodes.getE02US1CD9().trim()%>" size="7"></DIV>
            </TD>
            
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p align="center">
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </p>
  </form>
</body>
</html>
