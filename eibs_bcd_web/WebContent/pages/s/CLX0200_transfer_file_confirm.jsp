<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">

<meta http-equiv="Refresh" CONTENT="5;url='<%=request.getContextPath()%>/servlet/datapro.eibs.trust.JSCLX0200?SCREEN=100'">

<META name="GENERATOR" content="IBM WebSphere Studio">

<head>

<title>Presupuesto Generaci&oacute;n Masiva de Compromisos</title>

<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>


</head>


<body>

 

<h3 align="center">Presupuesto Generaci&oacute;n Masiva de Compromisos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_transfer_file_confirm, CLX0200" ></h3>

<hr size="4">


  <table width="100%" height="30%" border="1" bordercolor="#000000">

    <tr > 

      <td> 

        <table width="100%" height="30%">        

          <tr>             

	          	<td align=center> Archivo ha Sido Transferido al IBS. Verificar si los compromisos fueron generados</td>

          </tr>

          <tr>

          </tr>

        </table>

      </td>

    </tr>

  </table>

</body>

</html>

