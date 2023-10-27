<%@page isELIgnored="false" %>
<h3 align="center">${param.screenTitle}<img src="${pageContext.request.contextPath}/images/e_ibs.gif" align="left" name="EIBS_GIF" id="EIBS_GIF"   ></h3>
<script>

 document.getElementById("EIBS_GIF").title='${param.pageName}'.replace("/pages/s/", "");
 
</script>
<hr size="4">