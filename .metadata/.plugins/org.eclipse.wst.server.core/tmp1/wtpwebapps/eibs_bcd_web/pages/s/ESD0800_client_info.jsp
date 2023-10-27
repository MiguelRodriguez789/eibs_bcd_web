<html>
<head>
<title>e-IBS Client</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/events.js"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.js"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/Ajax.js"> </SCRIPT>

<style type="text/css">
body {    
	background : #FFFFFF;
	font-family : Verdana, Arial, Helvetica, Sans Serif;
	margin-top: 0px;
	margin-left: 16px;
	margin-right: 16px;
	margin-bottom: 0px;
}
#txtlabel{
  	text-align : left;border-style : none none none none;
  	cursor : default;
  	font-size : 8pt;
 	font-family : "Arial, Helvetica, sans-serif";
  	color : #2C2D2F;
  	background-color :transparent;
}
.title {  font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; font-weight: normal; color: #2C2D2F; text-decoration: underline}
.title A:VISITED {
	color:#2C2D2F;
}

.title A:LINK {
	color:#2C2D2F;
}

.title A:HOVER {
	color:#838486;
}
.data {  font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9px; font-weight: normal; color: #2C2D2F; background-color: #F3F3F3; border-color: black #FFFFFF black black; border-right-width: medium; margin-right: auto; padding-right: 2px}
</style>
</head>

<body text="#000000">
<form>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td class="title" nowrap width="92"><a href="<%=response.encodeURL(request.getContextPath()+"/servlet/datapro.eibs.client.JSESD0800?SCREEN=100")%>" target="main">Cliente Actual</a> |</td>
    <td class="data" nowrap><a href="javascript:removeCurrClient();"><img src="<%=request.getContextPath() %>/images/close_up.gif" title="Limpiar Cliente Seleccionado..." border="0"/></a></td>
    <td class="data" nowrap>ID: <input id="txtlabel" type=text name="E01CUSIDN" value="" readonly size=15></td>
    <td class="data" nowrap><input id="txtlabel" type=text name="E01CUSNA1" value="" readonly size=65></td>
    <td class="data" nowrap><input id="txtlabel" type=text name="E01RELBAN" value="" readonly size=35 style="color :red"></td>
  </tr>
</table>
</form>

<script type="text/javascript">

	function removeCurrClient() {
		var url = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0800?SCREEN=500";
		GetXMLResponse(url, functionCallback, true);
	}
	
	function eraseCurrClientFields() {
		document.forms[0].E01CUSIDN.value = "";
	    document.forms[0].E01CUSNA1.value = "";
	    document.forms[0].E01RELBAN.value = "";
	}
	
</script>
</body>
</html>
