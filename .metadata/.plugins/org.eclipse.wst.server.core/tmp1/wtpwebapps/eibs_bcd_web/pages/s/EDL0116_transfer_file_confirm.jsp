<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">

<meta http-equiv="Refresh" CONTENT="5;url='<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEDL0116?SCREEN=100'">

<META name="GENERATOR" content="IBM WebSphere Studio">

<head>

<title>Codigos Bloomberg</title>

<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>


</head>


<body>

 

<h3 align="center">Actulizacion Masiva Codigos Bloomberg<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="transfer_file_confirm, EDL0116" ></h3>

<hr size="4">


  <table width="100%" height="30%" border="1" bordercolor="#000000">

    <tr > 

      <td> 

        <table width="100%" height="30%">        

          <tr>             

	          	<td align=center> Archivo ha Sido Transferido al IBS. <%=request.getAttribute("rows")!= null?request.getAttribute("rows"):" " %> Filas han sido actualizadas</td>

          </tr>

          <tr>

          </tr>

        </table>

      </td>

    </tr>

  </table>

</body>

</html>

