<html>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">

<head>
<title>Confirmación de la creación de un Cliente Moral </title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "client" class= "datapro.eibs.beans.ESD008020Message"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">
function finish(){
	var form = top.opener.document.forms[0];	
  	if(top.opener.fieldDesc.trim() != ""){
		try{
			form[top.opener.fieldDesc].value = '<%= client.getE20NA1() %>';
		} catch (e){
		}
	}
	form[top.opener.fieldName].value = <%= client.getE20CUN() %>;
	if (form[top.opener.fieldName].type != "hidden") {
		try{
			form[top.opener.fieldName].focus();
			form[top.opener.fieldName].select();
		} catch (e){
		}
	} else {
		try{
			form[top.opener.fieldDesc].focus();
			form[top.opener.fieldDesc].select();
		} catch (e){
		}
	}
	top.close();
}

<% if(!client.getH20WK1().equals("S")){ %>
	setTimeout("finish();", 5500);
	function setLayout() {
		setCenterSize(800,400);
	}
<% } else { %>  
	function setLayout(){}
<% } %>  
	
if (window.name != "main") {

} else {
	setTimeout(function(){
		document.forms[0].submit();
	}, 3500);
}
</SCRIPT>
</head>

<body onload="setLayout()">

 <h3 align="center">Confirmación  <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_short_personal_confirm, ESD0080" ></h3>
 <hr size="4">
 <FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=7" >
  <table width="100%" height="100%" border="1" bordercolor="#000000">
    <tr > 
      <td> 
        <table width="100%" height="100%">
          <tr> 
            <td align=center>
			  		El cliente <b><%= client.getE20NA1() %></b> se ha creado satisfactoriamente y se le ha asignado el número  <b><%= client.getE20CUN()%></b> dentro del sistema.

            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
 </FORM>

</body>
</html>
