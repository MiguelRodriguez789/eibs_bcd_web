<html>
<head>
<title>Codigos de Referencia</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="refCodes" class="datapro.eibs.beans.ESD003002Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
builtHPopUp();

function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }

function goAction(op) {

	document.forms[0].opt.value = op;
	document.forms[0].SCREEN.value = '400';
	
	document.forms[0].submit();
  
}   
</SCRIPT>

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
%>


<H3 align="center">Códigos de Referencia del Sistema - Ciudades
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cnof_ciudad_details.jsp, ESD0030"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0030" id="form1" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
  <INPUT TYPE=HIDDEN NAME="E02CNOBNK" value="<%= currUser.getE01UBK()%>">
  <INPUT TYPE=HIDDEN NAME="DUMMY" value="<%= currUser.getE01UBK()%>">
  <input type=HIDDEN name="opt" id="opt"> 
  <INPUT TYPE=HIDDEN NAME="TABLECODE" VALUE="<%= refCodes.getE02CNOCFL().trim()%>">
   
  <h4>Información Básica</h4>
  
  <%int row = 0; %>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" align="right">Clasificación : </td>
            <td nowrap align="left"> 
                <input type="text" name="E02CNOCFL" readonly size="3" maxlength="2" value="<%= refCodes.getE02CNOCFL().trim()%>" readonly>
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="23"> 
              <div align="right">Departamento :</div>
            </td>

            <td nowrap height="23" align="left"> 
                <input type="text" name="E02CNODCC" size="4" maxlength="2" value="<%= refCodes.getE02CNODCC().trim()%>" >
                <input type="hidden" name="STATEDSC" size="37" maxlength="35" value="" onchange="getElement('STATEDSCL').innerHTML = getElement('STATEDSC').value" >
			    <a href="javascript:GetCodeDescCNOFC('E02CNODCC','STATEDSC','27')" onblur="getElement('STATEDSCL').innerHTML = getElement('STATEDSC').value" >
			    <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a> 
                <SPAN id="STATEDSCL" ></SPAN>
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="23" align="right">Ciudad : </td>
            <td nowrap height="23" align="left"> 
                <input type="text" name="E02CNOCPC" size="7" maxlength="3" value="<%= refCodes.getE02CNOCPC().trim()%>">
                <input type="hidden" name="E02CNOMID" value="">
                <input type="hidden" name="E02CNORCD" value="">
                <input type="hidden" name="E02SETRCD" value="">
            </td>
          </tr>
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="23" align="right">Descripción : </td>

            <td nowrap height="23" align="left"> 
                <input type="text" name="E02CNODSC" size="50" maxlength="45" value="<%= refCodes.getE02CNODSC().trim()%>" >
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="19" align="right">Indicativo Telefónico  : </td>
            <td nowrap height="19" align="left"> 
                <input type="text" name="E02CNOSCG" size="5" maxlength="3" value="<%= refCodes.getE02CNOSCG().trim()%>" onkeypress="enterInteger(event)">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <table width="100%">		
  	<tr>
  		<td width="50%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="submit" name="Submit" value="Enviar" onclick="javascript:setValues()" >
     	  </div>	
  		</td>
  		<td width="50%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type=button name="Exit" value="Salir" onClick="goAction(2);"> 
     	  </div>	
  		</td>
	</table>
  </form>
  
<SCRIPT type="text/javascript" >

function setValues(){

	if( form1.E02CNODCC.value == "" ){ form1.E02CNODCC.value = "00" ; }
	if( form1.E02CNOCPC.value == "" ){ form1.E02CNOCPC.value = "   " ; }

	form1.E02CNOMID.value = form1.E02CNODCC.value + form1.E02CNOCPC.value ;
	form1.E02SETRCD.value = form1.E02CNOMID.value ;
	form1.E02CNORCD.value = form1.E02CNOMID.value ;

}

</SCRIPT>
  
</body>
</html>
