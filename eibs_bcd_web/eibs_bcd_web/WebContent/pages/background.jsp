<!DOCTYPE HTML>
<HTML>
<HEAD>
<meta charset="UTF-8">
<TITLE>Main Menu</TITLE>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/events.js"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.js"> </SCRIPT>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/plugins/jsplayer/jquery.jplayer.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery-2.1.4.min.js"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/Graphics/v272/Chart.min.js"> </SCRIPT>

<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

</HEAD>
<script>
	document.onmousedown = right;
	
 	if ( window.name != "main" ){
			top.close();
 	}
 	
	window.onbeforeunload = function (){
	 	document.getElementsByTagName('body')[0].className = 'waiting';	
		if (isValidObject(document.getElementsByClassName('wait-div'))
			&& document.getElementsByClassName('wait-div').hasOwnProperty('visibility')) {
			if (document.getElementsByClassName('wait-div').length > 1) {
				document.getElementsByClassName('wait-div')[0].style.visibility = 'visible';
			} else {
				document.getElementsByClassName('wait-div').style.visibility = 'visible';
			}
		}
	}	
</script>

<style>
/* Basics */
html, body {
    background-image: url("<%=request.getContextPath()%>/images/background_texture_large.png");
  	background-size: 621px 792px;
  	background-repeat: repeat;
}
</style>

<BODY leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<div class="wait-div" style="visibility: hidden; background-image: inherit;"></div>
<div align="center" width="100%" height="auto" style ="background-image: inherit; vertical-align: top;"> 
  <table border="0" cellspacing="0" cellpadding="0" height="100%" align="center" style ="background-image: inherit;">
    <tr> 
      <td height="40%" width="100%" colspan=2 align=center >
      	<img src="<%=request.getContextPath()%>/images/main_frame_image.png" vspace="0" hspace="0" border="0">
      </td>
    </tr>
    <tr>
    	<div height="40%" width="50%" style ="background-image: inherit;">
      	<td>
      		<canvas id="bnkChart" ></canvas>
      		<script>
      			var ctx = document.getElementById("bnkChart");
      			new Chart(ctx, {
      			    type: 'horizontalBar',
      			    data: {
      			        labels: ["Oficinas", "Corresponsales", "Clientes", "Prestamos", "Cuentas", "CDTs"],
      			        datasets: [{
      			            label: 'Numero Activo de ',
      			            data: [<%=currUser.getE01NBR()%>, <%=currUser.getE01NCR()%>,<%=currUser.getE01NCU()%>,<%=currUser.getE01NLN()%>,<%=currUser.getE01NAC()%>, 
      			            	   <%=currUser.getE01NCD()%>],
      			            backgroundColor: [
      			                              'rgba(255, 99, 132, 0.2)',
      			                              'rgba(54, 162, 235, 0.2)',
      			                              'rgba(255, 206, 86, 0.2)',
      			                              'rgba(75, 192, 192, 0.2)',
      			                              'rgba(153, 102, 255, 0.2)',
      			                              'rgba(255, 159, 64, 0.2)'
      			                          ],
      			                          borderColor: [
      			                              'rgba(255,99,132,1)',
      			                              'rgba(54, 162, 235, 1)',
      			                              'rgba(255, 206, 86, 1)',
      			                              'rgba(75, 192, 192, 1)',
      			                              'rgba(153, 102, 255, 1)',
      			                              'rgba(255, 159, 64, 1)'
      			                          ],
      			                          borderWidth: 1
      			                      }]
      			                  },
      			    	options: {
      			    		legend: { display: false },
      			          title: {
      			            display: true,
      			            text: 'Mi Banco'
      			          }      
      			    	}
      				});
      		</script>
      	</td>
      	</div>
      	<div height="40%" width="50%" valign="top" style ="background-image: inherit;">
      	<td>
      		<canvas id="usrChart" ></canvas>
      		<script>
      			var ctx = document.getElementById("usrChart");
      			new Chart(ctx, {
      			    type: 'horizontalBar',
      			    data: {
      			        labels: ["Accesos Hoy", "Accesos Invalidos", "Clientes x Aprobar", "Prestamos x Aprobar", "Cuentas x Aprobar", "CDT x Aprobar", "Rev. Cumplimiento", "Mensajes"],
      			        datasets: [{
      			            label: 'Numero',
      			            data: [<%=currUser.getE01ATD()%>, <%=currUser.getE01ARD()%>,<%=currUser.getE01CFA()%>,<%=currUser.getE01LFA()%>,<%=currUser.getE01AFA()%>, 
      			            	   <%=currUser.getE01CDA()%>,<%=currUser.getE01RCM()%>, <%=currUser.getE01MSG()%>],
      			            backgroundColor: [
      			                              'rgba(255, 99, 132, 0.2)',
      			                              'rgba(54, 162, 235, 0.2)',
      			                              'rgba(255, 206, 86, 0.2)',
      			                              'rgba(75, 192, 192, 0.2)',
      			                              'rgba(153, 102, 255, 0.2)',
      			                              'rgba(255, 159, 64, 0.2)',
      			                              'rgba(54, 130, 64, 0.2)',
      			                              'rgba(255, 120, 64, 0.2)'
      			                          ],
      			                          borderColor: [
      			                              'rgba(255,99,132,1)',
      			                              'rgba(54, 162, 235, 1)',
      			                              'rgba(255, 206, 86, 1)',
      			                              'rgba(75, 192, 192, 1)',
      			                              'rgba(153, 102, 255, 1)',
      			                              'rgba(255, 159, 64, 1)',
      			                              'rgba(54, 130, 64, 1)',
      			                              'rgba(255, 120, 64, 1)'
      			                          ],
      			                          borderWidth: 1
      			                      }]
      			                  },
      			    	options: {
      			    		legend: { display: false },
      			          title: {
      			            display: true,
      			            text: 'Mis datos'
      			          }      
      			    	}
      				});
      		</script>
      	</td>
      	</div>
    </tr>
  </table>
</div>
<div class="footer">
		  <h1 class="footer__content-text"></h1>
		  	<div class="imgFooter">
		  		<div class="imgFooter">
		      		<img src="<%=request.getContextPath()%>/images/login eibs.gif"  align=left>
		      		<img src="<%=request.getContextPath()%>/images/login_datapro_2.gif" align=right>
		      		<img src="<%=request.getContextPath()%>/images/login_datapro.gif" align=right>
		      	</div>
	      	</div>
		</div>	
</BODY>
</HTML>
