<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>

<head>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<style>
TH {
  background: #FFFFFF;
}
</style>
<script type="text/javascript">
	function enter() {
		var form = top.opener.document.forms[0];

		var AppCode = "";
		if(isValidObject(top.opener.AppCode)){
			if( isNumeric(top.opener.AppCode) ){
				AppCode = top.opener.AppCode;
				
			}else{
				if (isValidObject(form[top.opener.AppCode])) {
					AppCode = form[top.opener.AppCode].value;
				}				
			}
			
		}
  
		var ProductBank = "";
		if(isValidObject(top.opener.ProductBank)){
			if( isNumeric(top.opener.ProductBank) ){
				ProductBank = top.opener.ProductBank;
				
			}else{
				if (isValidObject(form[top.opener.ProductBank])) {
					ProductBank = form[top.opener.ProductBank].value;
				}				
			}
			
		}
 
		var srhProduct = getElement("srhProduct").value;
	
	parent.results.window.location.href="<%=request.getContextPath()%>/pages/s/MISC_search_wait.jsp?URL='<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0008?AppCode=" + AppCode +"@ProductBank=" + ProductBank + "@srhProduct=" + srhProduct +  "'";
}

</script>
</head>

<body>
<FORM Action="javascript:enter()">

  <table id="tbhelp" align="center" width="556" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td align="center"><b>B&uacute;squeda de Productos</b></td>
    </tr>
    <tr>
      <td align="center">&nbsp;</td>
    </tr>
    <tr> 
      <td align="center">Por favor seleccione el tipo de producto:&nbsp; 
        <input type="text" name="srhProduct" size="5" maxlength="4" value="" >
        &nbsp;&nbsp;<img src="<%=request.getContextPath()%>/images/search1.gif" onClick="enter()" width="25" height="21"></td>
    </tr>
  </table>
  
<script type="text/javascript">
  document.forms[0].srhProduct.focus();
  var form = top.opener.document.forms[0];

  if (isValidObject(form[top.opener.fieldAux2])){
		getElement("srhProduct").value = form[top.opener.fieldAux2].value;
  } 
  
 </script>
  
</form>
</body>
</html>
