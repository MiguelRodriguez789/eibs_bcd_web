<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<meta http-equiv="Pragma" content="No-cache">
<meta name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<meta http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>

<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript">
	function enter(BNK,CCY,M,D,Y,EXR) {
    	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.params.JSESD0952?SCREEN=3&E02PRMBNK=" + BNK + "&E02PRMCCY=" + CCY + "&E02PRMDFM=" + M + "&E02PRMDFD=" + D + "&E02PRMDFY=" + Y + "&E02PRMEXR=" + EXR;
    	CenterWindow(page,750,460,1);
 	}
</script>
</head>
<jsp:useBean id= "jbList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<body>
<%
	if ( jbList.getNoResult() ) {
%>
 		<table class="tbenter" width="100%">
 		<tr>
      	<td nowrap align="center"><b>No existen resultados para su criterio de búsqueda.</b></td></tr>
   		</table>
<%

	} else {
%>
	  <table class="tableinfo" align="center" style="width:'500px'">
	    <tr id="trdark">
	      <th align=CENTER nowrap>Banco</th>
	      <th align=CENTER nowrap>Moneda</th>
	      <th align=CENTER nowrap>Fecha</th>
	      <th align=CENTER nowrap>Tasa</th>
	    </tr>
<%          
		jbList.initRow(); 
		int i = 0;
		String bnk, ccy, rdm, rdd, rdy, exr, enterLink;
        while (jbList.getNextRow()) {
        	ESD095201Message msgHelp = (ESD095201Message) jbList.getRecord();
            bnk = msgHelp.getE01RTRBNK();
            ccy = msgHelp.getE01RTRCCY();
            rdm = msgHelp.getE01RTRRDM();
            rdd = msgHelp.getE01RTRRDD();
            rdy = msgHelp.getE01RTRRDY();
            exr = msgHelp.getE01RTREXR();
            enterLink = "javascript:enter('" + bnk + "','" + ccy + "','" + rdm + "','" + rdd + "','" + rdy + "','" + exr + "')";                
%>
        <tr>
			<td nowrap align=CENTER ><a href="<%=enterLink%>"><%=bnk%></a></td>
			<td nowrap align=CENTER ><a href="<%=enterLink%>"><%=ccy%></a></td>
			<td nowrap align=CENTER ><a href="<%=enterLink%>"><%=Util.formatCustomDate(currUser.getE01DTF(), rdm, rdd, rdy)%></a></td>
			<td nowrap align=CENTER ><a href="<%=enterLink%>"><%=exr%></a></td>
		</tr>
<%        
		}
	}	
%>
  </table>

</body>
</html>