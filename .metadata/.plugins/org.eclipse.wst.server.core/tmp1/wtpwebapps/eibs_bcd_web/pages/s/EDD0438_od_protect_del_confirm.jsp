<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Proteccion de Sobregiros</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<meta http-equiv="Refresh" CONTENT="5;url='<%=request.getContextPath()%>/pages/background.jsp'">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="rtBasic" class="datapro.eibs.beans.EDD043801Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

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
<H3 align="center">Protecci&oacute;n de Sobregiros- Confirmaci&oacute;n<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="EDD0000_rt_basic.jsp, EDD0000"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0438" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" value="200">
  </p>
  <center>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap colspan="4" height="23"> 
              <div align="center">La operaci&oacute;n ha concluido satisfactoriamente, 
                han sido borrados los Parametros de Sobregiro.</div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  </center>
    <SCRIPT type="text/javascript">
    function tableresize() {
     adjustEquTables( getElement('headTable'), getElement('dataTable'), getElement('dataDiv'),0,true);
   }
  tableresize();
  window.onresize=tableresize;
  </SCRIPT>
    <br>
  <div align="center"> </div>
  </form>
</body>
</html>
