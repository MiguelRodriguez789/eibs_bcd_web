<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<html>
<head>
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<title>Cargos x Servicios</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "rates" class= "datapro.eibs.beans.EDL011001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id="lnParam" class="datapro.eibs.beans.EDL011001Message"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">
function typeChange(){
	if(document.getElementById("E01PRRTYP").value == ("2")){
		document.getElementById("nominalTable").style.visibility = 'visible';
	}else{
		document.getElementById("nominalTable").style.visibility = 'hidden';
	}

}

function cancel() {
	document.forms[0].SCREEN.value = 1;
	document.forms[0].submit();
}

</script>


<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"> </script>

 
</head>

<body bgcolor="#FFFFFF" onload="typeChange();">

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
 %> 
 
 
<h3 align="center">Tasas Flotantes Mantenimiento
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_tables_maint,EDL0110F" ></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0110F">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">


    <h4>INFORMACI&Oacute;N   NUEVA</h4>
  
  	<% int row = 0; %>
    <table class="tableinfo">
      <tr > 
        <td nowrap> 
          
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left" >
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Codigo de Tabla :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E01PRRTBL" readonly size="3" maxlength="2" value="<%= rates.getE01PRRTBL()%>">
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">            
            <td nowrap>
              <div align="right">Descripci&oacute;n :</div>
            </td>
            <td nowrap>                                                                         
              <input type="text" name="E01PRRNME" size="46" maxlength="45" value="<%= rates.getE01PRRNME()%>">              
            </td>
          </tr>
          
          
          
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Tasa Primaria :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01PRRPRT" size="12" maxlength="10" value="<%= rates.getE01PRRPRT()%>" onKeypress="enterRate()" >
              </div>
            </td>
          </tr> 

          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Tasa Secundaria :</div>
            </td>
            <td nowrap  > 
              <div align="left"> 
                <input type="text" name="E01PRRSRT" size="12" maxlength="10" value="<%= rates.getE01PRRSRT()%>" onKeypress="enterRate()" > 
              </div>
            </td>
          </tr>  
          
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">            
            <td nowrap width="29%"> 
              <div align="right">Fecha Efectiva :</div>
            </td>
            <td nowrap  > 
              <div align="left">         
                <eibsinput:date name="rates" fn_year="E01PRREFY" fn_month="E01PRREFM" fn_day="E01PRREFD" />
					                  
              </div>
            </td>
          </tr>
          
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="29%"> 
              <div align="right">Tipo  :</div>
            </td>
            <td nowrap > 
              <select name="E01PRRTYP" id="E01PRRTYP" onchange="javascript:typeChange();">
                <option value=" " <% if ( !( rates.getE01PRRTYP().equals("1")||rates.getE01PRRTYP().equals("2") ) ) out.print("selected"); %> > 
                </option>
                <option value=""  <% if (rates.getE01PRRTYP().equals("")) out.print("selected"); %>>Nominal</option>
                <option value="1" <% if (rates.getE01PRRTYP().equals("1")) out.print("selected"); %>>Efectiva</option>
                <option value="2" <% if (rates.getE01PRRTYP().equals("2")) out.print("selected"); %>>Conversion</option>
              </select>
            </td> 
          </tr>
			<table id="nominalTable" style="border: 0px; height:100%; width: 100%;visibility: hidden;">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="29%"> 
              <div align="right">Modalidad  :</div>
            </td>
	            <td nowrap width="78%" > 
	              <select name="E01PRRMOD" >
	                <option value=" " <% if ( !( rates.getE01PRRMOD().equals("P")||rates.getE01PRRMOD().equals("S") ) ) out.print("selected"); %> > </option>
	                <option value="P" <% if (rates.getE01PRRMOD().equals("P")) out.print("selected"); %>>Anticipado</option>
	                <option value="S"  <% if (rates.getE01PRRMOD().equals("S")) out.print("selected"); %>>Vencido</option>
	              </select>
	      	    </td>
	      </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="29%"> 
					<div align="right">Periodicidad : </div>              
				  </td>
	            <td nowrap width="78%" > 
	              <div align="left">
		              <select name="E01PRRPER" >
			              <OPTION value=" " <% if (!(rates.getE01PRRPER().equals("30") ||rates.getE01PRRPER().equals("60")||rates.getE01PRRPER().equals("90") 
			              								||rates.getE01PRRPER().equals("180")||rates.getE01PRRPER().equals("360")) ) out.print("selected"); %>> </OPTION>
			              <OPTION value="030" <% if(rates.getE01PRRPER().equals("30")) out.print("selected");%>>030</OPTION>
			              <OPTION value="060" <% if(rates.getE01PRRPER().equals("60")) out.print("selected");%>>060</OPTION>
			              <OPTION value="090" <% if(rates.getE01PRRPER().equals("90")) out.print("selected");%>>090</OPTION>
			              <OPTION value="180" <% if(rates.getE01PRRPER().equals("180")) out.print("selected");%>>180</OPTION>
			              <OPTION value="360" <% if(rates.getE01PRRPER().equals("360")) out.print("selected");%>>360</OPTION>
		              </select>
	 			  </div>
	            </td>
	          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="29%"> 
					<div align="right">Base Calculo: </div>              
				  </td>
	            <td nowrap width="78%" > 
	              <div align="left">
		              <select name="E01PRRBAS" >
			              <OPTION value=" " <% if (!(rates.getE01PRRBAS().equals("30") ||rates.getE01PRRBAS().equals("360")) || rates.getE01PRRBAS().equals("365") ) out.print("selected"); %>></OPTION>
			              <OPTION value="030" <% if(rates.getE01PRRBAS().equals("30")) out.print("selected");%>>30</OPTION>
			              <OPTION value="360" <% if(rates.getE01PRRBAS().equals("360")) out.print("selected");%>>360</OPTION>
			              <OPTION value="365" <% if(rates.getE01PRRBAS().equals("365")) out.print("selected");%>>365</OPTION>
		              </select>
	 			  </div>
	            </td>
          </tr>
		 	</table>          
        </table>
      </td>
    </tr>
  </table>
  

<h4>INFORMACI&Oacute;N  ANTERIOR</h4>  
  <table class="tableinfo">
      <tr > 
        <td nowrap> 
          
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left" >
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Codigo de Tabla :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                 <%= rates.getA01PRRTBL()%> 
              </div>
            </td>
          </tr>  
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">             
            <td nowrap>
              <div align="right">Descripci&oacute;n :</div>
            </td>
            <td nowrap>                                                                         
               <%= rates.getA01PRRNME()%>             
            </td>
          </tr>
<%           
    if  (  rates.getA01PRRTYP().equals("1")   )
    {       
%>          
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Tipo  :</div>
            </td>
            <td nowrap  > 
               Efectiva 
            </td>
          </tr>
<%           
    } else if  (  rates.getA01PRRTYP().equals("")   )
    {       
%>          
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Tipo  :</div>
            </td>
            <td nowrap  > 
               Nominal
            </td>
          </tr>          
          
<% 
    }
    else if  ( rates.getA01PRRTYP().equals("2")   )
    {
%>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Tipo  :</div>
            </td>
            <td nowrap  > 
               Conversion
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Modalidad  :</div>
            </td>
            <td nowrap  > 
               <%if(rates.getA01PRRMOD().equals("P")){
               		out.println("Anticipado");
               	}else if (rates.getA01PRRMOD().equals("S")){
               		out.println("Vencido"); 
               	}%>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Periodicidad  :</div>
            </td>
            <td nowrap  > 
            	<%if(rates.getA01PRRMOD().length() < 3 ){%>
            		<%=Util.formatCell("0"+rates.getA01PRRPER())%>
            	<%}else{%>
            		<%=Util.formatCell(rates.getA01PRRPER())%>
            	<%}%>
            </td>
          </tr>     
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Base Calculo :</div>
            </td>
            <td nowrap  > 
               <%=Util.formatCell(rates.getA01PRRBAS())%>
            </td>
          </tr>                              
<% 
    }
%>          
            
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Tasa Primaria :</div>
            </td>
            <td nowrap  > 
              <div align="left"> 
                 <%= rates.getA01PRRPRT()%> 
              </div>
            </td>
          </tr>  
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Tasa Secundaria :</div>
            </td>
            <td nowrap  > 
              <div align="left"> 
                 <%= rates.getA01PRRSRT()%> 
              </div>
            </td>
          </tr> 
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="29%"> 
              <div align="right">Fecha Efectiva   :</div>
            </td>
            <td nowrap  > 
              <div align="left">         
                 <%=Util.formatCustomDate(currUser.getE01DTF(), rates.getA01PRREFM(),rates.getA01PRREFD(),rates.getA01PRREFY()) %>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>  
  
  
  <div align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
    <input id="EIBSBTN" type="button" name="Cancel" value="Cancelar" onclick="cancel()">
  </div>
  
</form>
</body>
</html>
