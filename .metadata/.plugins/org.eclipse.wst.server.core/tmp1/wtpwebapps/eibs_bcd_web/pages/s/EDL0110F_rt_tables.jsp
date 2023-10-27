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
		document.getElementById("nominalTable").style.display = 'block';
	}else{
		document.getElementById("nominalTable").style.display = 'none';
	}

}
</script>

 
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
 
 
<h3 align="center">Tasas Flotantes<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_tables,EDL0110F" ></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0110F">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
               
  <h4>Informaci&oacute;n  B&aacute;sica</h4>
 
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
                <input type="text" name="E01PRRTBL"  size="3" maxlength="2" value="<%= rates.getE01PRRTBL()%>">
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
			<table id="nominalTable" style="border: 0px; display: none; height:100%; width: 100%;">
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
					<div align="right">Base : </div>              
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
    
  <div align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>
  
  
</form>
</body>
</html>
