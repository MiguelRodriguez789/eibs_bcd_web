<html>
<head>
<title>Envio recepcion y eliminacion de documentos papel valor Plazo Fijo</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="refCodes" class="datapro.eibs.beans.EDL017001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
%>


<H3 align="center">Envio recepcion y eliminacion de documentos papel valor Plazo Fijo<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="maintenance_details.jsp, EDL0170"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0170" id="form1" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
  <input type="hidden" name="E01ACTION" size="1" maxlength="1">
   
  <h4>Informaci&oacute;n B&aacute;sica</h4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trclear"> 
            <td nowrap width="16%"> 
              <div align="right">Banco :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E01PFDBNK" size="02" maxlength="02" value="<%= refCodes.getE01PFDBNK().trim()%>" readonly>
              </div>
            </td>
          </tr>

          <tr id="trdark" >
            <td nowrap width="16%" height="23"> 
              <div align="right">Sucursal :</div>
            </td>

            <td nowrap height="23"> 
              <div align="left"> 
                <input type="text" name="E01PFDBRN" size="04" maxlength="04" value="<%= refCodes.getE01PFDBRN().trim()%>" readonly>
              </div>
            </td>
          </tr>

          <tr id="trclear"> 
            <td nowrap width="16%"> 
              <div align="right">Documento Inicial :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E01PFDINI" size="13" maxlength="13" value="<%= refCodes.getE01PFDINI().trim()%>" readonly>
              </div>
            </td>
          </tr>

          <tr id="trdark" >
            <td nowrap width="16%" height="23"> 
              <div align="right">Documento Final :</div>
            </td>

            <td nowrap height="23"> 
              <div align="left"> 
                <input type="text" name="E01PFDFIN" size="13" maxlength="13" value="<%= refCodes.getE01PFDFIN().trim()%>" readonly>
              </div>
            </td>
          </tr>

          <tr id="trclear" >
            <td nowrap width="16%" height="23"> 
              <div align="right">Total documentos :</div>
            </td>

            <td nowrap height="23"> 
              <div align="left"> 
                <input type="text" name="E01PFDTOT" size="13" maxlength="13" value="<%= refCodes.getE01PFDTOT().trim()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right">Sucursal de recepcion o envio :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E01PFDSUC" size="4" maxlength="4" value="<%= userPO.getHeader15().trim()%>" onkeypress="enterInteger(event)" readonly>
                 <a href="javascript:GetBranch('E01PFDSUC','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
              </div>
            </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>
  <div align="center">
    <input id="EIBSBTN" type="submit" name="Submit" value="Enviar">
  </div>
  </form>
  
<SCRIPT type="text/javascript" >

</SCRIPT>
  
</body>
</html>
