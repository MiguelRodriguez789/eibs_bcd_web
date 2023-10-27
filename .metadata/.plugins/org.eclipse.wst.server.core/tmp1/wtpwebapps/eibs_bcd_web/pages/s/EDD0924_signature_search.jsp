<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "dataCR" class= "datapro.eibs.beans.DataCheckReject"   scope="session" />

<script type="text/javascript">

function valAcc(){
		if(document.getElementById("E01SELACC").value <=0 && document.getElementById("E01SELNCH").value <= 0){
			alert("Numero de cuenta invalido o falta.");
		}else if(document.getElementById("E01SELNCH").value <0){
			alert("Numero de cheque invalido.");
		}else{ 
			if(document.getElementById("E01SELNCH").value > 0){
				document.getElementById("E01SELACC").value = 0;
			}
			GetSignImg(document.getElementById("E01SELACC").value, document.getElementById("E01SELNCH").value);
		}
}

</script>
<TITLE></TITLE>
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
<h3 align="center">Consulta Firmas<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="signature_search.jsp,EDD0924"></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.approval.JSEDD0924" onsubmit="return(enter())">
   <INPUT TYPE=HIDDEN NAME="SELACC" id="SELACC" VALUE="">
  
   <table class="tbenter" height="75%" width="100%" border="0">
    <TR>
    <TD>       
    <table class="tbenter" width="100%" border="0">
                <tr id="trdark"> 
                  <td NOWRAP width="50%"> 
                    <div align="right">N&uacute;mero de cuenta :</div>
                  </td>
                  <td NOWRAP width="50%"> 
                    <div align="left"> 
					 <input type="text" name="E01SELACC" id="E01SELACC" size="13" maxlength="12" onkeypress="enterInteger()">
					 <img
								src="<%=request.getContextPath()%>/images/Check.gif"
								title="campo obligatorio" align="bottom" border="0">
					</div>
				  </td>
                </tr>
                <tr id="trclear"> 
                  <td NOWRAP width="50%"> 
                    <div align="right">N&uacute;mero Cheque de Gerencia :</div>
                  </td>
                  <td NOWRAP width="50%"> 
                    <div align="left"> 
					 <input type="text" name="E01SELNCH" id="E01SELNCH" size="12" maxlength="11" onkeypress="enterInteger()">
		  			</div>
				  </td>
                </tr>
         </table>        
  <p>
		</TD>
    </TR>  
  </table>	
  
  <div align="center">
  	<input id="EIBSBTN" type=button name="Submit" OnClick="valAcc()" value="Enviar">
  </div>

<script type="text/javascript">
</script>
</form>
</body>
</html>
