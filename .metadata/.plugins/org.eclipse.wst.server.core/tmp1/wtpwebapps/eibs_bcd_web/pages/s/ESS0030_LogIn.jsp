<%@ page import="java.util.logging.*" %>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setHeader("Expires", "0"); // Proxies.
Logger.getLogger(this.getClass().getName()).log(Level.FINEST,"TIME ESS0030LOGIN :" + System.currentTimeMillis());
%>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="request" />

<!DOCTYPE html>
<html>
<title>Login Page</title>
<head>
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />

<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.js"> </SCRIPT>
<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/events.js"> </SCRIPT>
	
<style>
/* Basics */
html, body {
    /*background: url("<%=request.getContextPath()%>/images/background2.png");
  	background-size: 657px 445px;
  	background-repeat: no-repeat;
  	background-attachment: fixed;
    background-position: center; */
}
h2{
  font-family: "Arial", Helvetica, sans-serif;
  font-size: 13px;
  color: #d0122d;
  font-weight: bold;
  background: #dbdbdb;
  text-align: center;
  margin: 0;
  padding: 15px;
}
#container {
  background: url("<%=request.getContextPath()%>/images/background2.png");
    background-size: 657px 445px;
    background-repeat: no-repeat;
    /*background-attachment: fixed;*/
    background-position: center; 
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    margin: auto;
    width: 657px;
    height: 445px;
    /*width: 340px;
    height: 220px;*/
    /*top: 75%;
    left: 50%;
    margin-top: -140px;
    margin-left: -170px;*/
    
/*    border-radius: 3px;
    border: 1px solid #d0122d;
    box-shadow: 0 1px 2px rgba(0, 0, 0, .1);*/

}
form {
    width: 450px;
    position: relative;
    
    background: #fff;
    left: 0px;
    right: 0px;
    margin: auto;
    box-shadow: 3px 4px 10px #333;
    border:2px solid #f3f3f3;
}

label {
    color: #555;
    display: inline-block;
    margin-left: 18px;
    padding-top: 1px;
    font-size: 12px;
    font-weight: bold;
}
p a {
    font-size: 12px;
    color: #aaa;
    float: right;
    margin-top: -13px;
    margin-right: 20px;
 -webkit-transition: all .4s ease;
    -moz-transition: all .4s ease;
    transition: all .4s ease;
}
p a:hover {
    color: #555;
}
label{
  font-family: "Arial", Helvetica, sans-serif;
  font-size: 12px;
}
input {
    font-family: "Arial", Helvetica, sans-serif;
    font-size: 12px;
    border: 1px solid #d0122d;
    box-shadow: none;
}
input[type=text],
input[type=password] ,input[type=time]{
    color: #777;
    padding-left: 10px;
    margin: 10px;
    margin-top: 5px;
    margin-left: 18px;
    width: 290px;
    height: 25px;
    border: 1px solid #e8e8e8;
    border-radius: 2px;
    -webkit-transition: all .4s ease;
    -moz-transition: all .4s ease;
    transition: all .4s ease;
    }
input[type=text]:hover,
input[type=password]:hover,input[type=time]:hover {
    border: 1px solid #d0122d;
}
input[type=text]:focus,
input[type=password]:focus,input[type=time]:focus {
    border: 1px solid #d0122d;
}
#lower {
/*    background: #dbdbdb;
    width: 100%;
    height: 65px;
    margin-top: 20px;
    box-shadow: inset 0 1px 1px #fff;
    border-top: 1px solid #ccc;
    border-bottom-right-radius: 3px;
    border-bottom-left-radius: 3px;*/
}
input[type=checkbox] {
    margin-left: 20px;
    margin-top: 30px;
}
.check {
    margin-left: 3px;
    font-size: 11px;
    color: #444;
    text-shadow: 0 1px 0 #fff;
}
.campos-inline input[type=submit] {
  display: inline-block;
  margin-left: 2px;
  padding: 10px;
  color: #fff;
  background: #d0122d
    /*float: right;
    margin-right: 20px;
    margin-top: 5px;
    width: 80px;
    height: 30px;
    font-size: 12px;
    font-weight: Arial bold;
    color: #ffffff;
    background-color: #d0122d ;
    background-image: -webkit-gradient(linear, left top, left bottom, from(#dbdbdb), to(#bcbcbc));
    background-image: -moz-linear-gradient(top left 90deg, #dbdbdb 0%, #bcbcbc 100%);
    background-image: linear-gradient(top left 90deg, #dbdbdb 0%, #bcbcbc 100%);
    border-radius: 30px;
    border: 1px solid #d0122d;
    cursor: pointer;*/
}
/*input[type=submit]:hover {
    background-image: -webkit-gradient(linear, left top, left bottom, from(#dbdbdb), to(#bcbcbc));
    background-image: -moz-linear-gradient(top left 90deg, #dbdbdb 0%, #bcbcbc 100%);
    background-image: linear-gradient(top left 90deg, #dbdbdb 0%, #bcbcbc 100%);
}
input[type=submit]:active {
    background-image: -webkit-gradient(linear, left top, left bottom, from(#dbdbdb), to(#bcbcbc));
    background-image: -moz-linear-gradient(top left 90deg, #dbdbdb 0%, #bcbcbc 100%);
    background-image: linear-gradient(top left 90deg, #dbdbdb 0%, #bcbcbc 100%);
}*/

.header {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  padding-bottom: 10px;  
  z-index: 10; 
  background: #FFFFFF;
  -webkit-box-shadow: 0 7px 8px rgba(0, 0, 0, 0.12);
  -moz-box-shadow: 0 7px 8px rgba(0, 0, 0, 0.12);
  box-shadow: 0 7px 8px rgba(0, 0, 0, 0.12);
}

 .footer{
  position: fixed;
  bottom:0;
  left: 0;
  width: 100%;
  padding-bottom: 10px;  
  z-index: 10; 
  background: #FFFFFF;
  -webkit-box-shadow: 0 7px 8px rgba(0, 0, 0, 0.12);
  -moz-box-shadow: 0 7px 8px rgba(0, 0, 0, 0.12);
  box-shadow: 0 7px 8px rgba(0, 0, 0, 0.12);
}

.imgHeader{
  font-size: 0;
  margin-left: auto;
  margin-right: auto;
  text-align:center;
}

.imgFooter{
  font-size: 0;
  margin-left: auto;
  margin-right: auto;
  text-align:right;
}
.campos-inline{
  margin-bottom: 20px;
}
.campos-inline label, .campos-inline input{
  display: inline-block;
  vertical-align: middle;
  margin: 0;
  padding: 0;
}
.campos-inline label{
  width: 30%;
}
.campos-inline input{
  width: 67%;
}
.formulario-login{
  margin: 2px;
  border: 1px solid #d0122d;
}
.formulario-login > div{
  padding: 20px 60px 10px;
}
.form-header {
    height: 30px;
    background: #f3f3f3;
}
.circulo{
  width: 5px;
  height: 5px;
  display: inline-block;
  vertical-align: middle;
  border-radius: 50%;
  margin-top: 5px;
}
.c-rojo{
  background: #f5a2a2;
}
.c-verde{
  background: #46ec6d;
}
.c-gris{
  background: #cacaf9;
}
.login-isotipo{
  text-align: center;
  padding-top: 25px;
}



</style>
</head>
	 <body> 
		<!-- Begin Page Content -->
		<div class="header"  style="background-color: #d01f2f; text-align: left; ">
		  <h1 class="header__content-text"></h1>
		  	<div class="imgHeader" style="padding: 0 20px; text-align: left;">
		      <img src="<%=request.getContextPath()%>/images/de/bancompartir-logo-header.png" >
	      	</div>
		</div>		
		<br>	
		<div id="container">
      <div class="login-isotipo">
        <img src="<%=request.getContextPath()%>/images/bancompartir_isotipo.png" width="130px" >
      </div>
			<form METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.menu.JSESS0030">
      <div class="form-header">
        <span class="circulo c-rojo"></span>
        <span class="circulo c-verde"></span>
        <span class="circulo c-gris"></span>
      </div>
        <div class="formulario-login">
          <h2>LOGIN</h2>
          <div>
    			  <INPUT TYPE="hidden" NAME="Language" VALUE="s">
    			  <INPUT TYPE="hidden" NAME="LOGIN" VALUE="NO">
    			  <INPUT TYPE="hidden" NAME="option-menu" VALUE="<%= request.getParameter("option-menu") != null ? request.getParameter("option-menu") : "" %>">
    				<label for="loginmsg" style="color:hsla(0,100%,50%,0.5); font-family: "Arial" ,Helvetica,sans-serif;">
    			   <%  if (error != null && !error.getERRNUM().equals("0")  ) {%>
    					 <%= error.getERDS01()%> 
    				<% } %>	
    				</label>
    				<div class="campos-inline">
              <label for="username">Usuario:</label>
              <input type="text" id="UserId" name="UserId" SIZE="18" MAXLENGTH="10" placeholder="Escribe tu usuario" >
            </div>
    				<div class="campos-inline">
              <label for="password">Contrase&ntilde;a:</label>
              <input type="password" id="Password" name="Password" autocomplete="off" SIZE="18" MAXLENGTH=20 placeholder="Escribe tu contrase&ntilde;a" >
            </div>
						  <div id="lower" class="campos-inline"><label></label><input type="submit" value="Login"></div>
          </div>
        </div>
			</form>
		</div>
		<div class="footer">
		  <h1 class="footer__content-text"></h1>
		  	<div class="imgFooter">
		  		<div class="imgFooter">
		      		<img src="<%=request.getContextPath()%>/images/login eibs.gif"  align=left>
		      		<img src="<%=request.getContextPath()%>/images/login_datapro.gif" >
		      		<img src="<%=request.getContextPath()%>/images/login_datapro_2.gif" >
		      	</div>
	      	</div>
		</div>			
	<!--/ container-->
	<!-- End Page Content -->
	
<script type="text/javascript">
   if (checkCookie("eibs")) {
   		deleteCookie("eibs");
   }

  document.forms[0].UserId.focus();
  document.forms[0].UserId.select();
</script>	
	</body>
</html>
