<html>
<head>
<title>Codigos de Referencia</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<SCRIPT Language="javascript">
function finish(){
 self.window.location.href = "<%=request.getContextPath()%>/pages/background.jsp";
}
</SCRIPT>

</head>

<jsp:useBean id="refCodes" class="datapro.eibs.beans.ESD003002Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
 
<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
%>

<H3 align="center">C&oacute;digos de Referencia del Sistema <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cnof_VD_details.jsp, ESD0030"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0030" id="form1" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
  <INPUT TYPE=HIDDEN NAME="E02CNOBNK" value="<%= currUser.getE01UBK()%>">
  <INPUT TYPE=HIDDEN NAME="DUMMY" value="<%= currUser.getE01UBK()%>">
   
   
   
  <h4>Informaci&oacute;n B&aacute;sica</h4>
  
  <%int row = 0; %>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%"> 
              <div align="right">Clasificaci&oacute;n :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E02CNOCFL" readonly size="3" maxlength="2" value="<%= refCodes.getE02CNOCFL().trim()%>" readonly>
              </div>
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="23"> 
              <div align="right">Entidad Validación BD :</div>
            </td>

            <td nowrap height="23"> 
              <div align="left"> 
                <input type="text" name="STATECODE" size="4" maxlength="2" value="" >
                <input type="hidden" name="STATEDSC" size="37" maxlength="35" value="" onchange="document.all.STATEDSCL.innerHTML = form1.STATEDSC.value" >
			    <a href="javascript:GetCodeDescCNOFC('STATECODE','STATEDSC','VC')" onblur="document.all.STATEDSCL.innerHTML = form1.STATEDSC.value" ><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a> 
                <SPAN id="STATEDSCL" ></SPAN>

              </div>
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="23"> 
              <div align="right">Codigo Enlace BD Externa :</div>
            </td>

            <td nowrap height="23"> 
              <div align="left"> 
                <input type="text" name="CITYCODE" size="4" maxlength="3" value="">


                <input type="hidden" name="E02CNOMID" size="8" maxlength="6" value="<%= refCodes.getE02CNORCD().trim()%>">
                <input type="hidden" name="E02CNORCD" size="8" maxlength="6" value="">
                <input type="hidden" name="E02SETRCD" size="8" maxlength="6" value="<%= refCodes.getE02CNORCD().trim()%>">


              </div>
            </td>
          </tr>
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="23"> 
              <div align="right">Descripci&oacute;n :</div>
            </td>

            <td nowrap height="23"> 
              <div align="left"> 

                <input type="text" name="E02CNODSC" size="50" maxlength="45" value="<%= refCodes.getE02CNODSC().trim()%>" >

              </div>
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="19"> 
              <div align="right">N&uacute;mero de Referencia :</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <input type="text" name="E02CNOSCG" size="17" maxlength="16" value="<%= refCodes.getE02CNOSCG().trim()%>">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

   <h4>&nbsp;</h4>  
      <div align="center">
         <%if(!userPO.getPurpose().equals("INQUIRY")) {%>
            <input id="EIBSBTN" type=submit name="Submit" value="Enviar" onclick="javascript:setValues()" >
         <%}%>
         <input id="EIBSBTN" type=button name="Submit" value="Salir" onClick="finish();">
   </div>  
	    
  </form>
  
<SCRIPT language="javascript" >


function parseValues(){
	var longCode = "<%= refCodes.getE02SETRCD()%>" ;
	var stCode = longCode.substring(0,3) ;
	
	if( longCode.length >= 5 ){
		if( stCode == "000"){
			form1.STATECODE.value = "000" ;
		}else {
			form1.STATECODE.value = stCode ;
		}
		form1.CITYCODE.value = longCode.substring(3,6);
	}
}

parseValues();

function setValues(){

	if( form1.STATECODE.value == "" ){ form1.STATECODE.value = "000" ; }
	if( form1.CITYCODE.value == "" ){ form1.CITYCODE.value = "   " ; }

	form1.E02CNOMID.value = form1.STATECODE.value + form1.CITYCODE.value ;
	form1.E02SETRCD.value = form1.E02CNOMID.value ;
	form1.E02CNORCD.value = form1.E02CNOMID.value ;

}

</SCRIPT>
  
</body>
</html>
