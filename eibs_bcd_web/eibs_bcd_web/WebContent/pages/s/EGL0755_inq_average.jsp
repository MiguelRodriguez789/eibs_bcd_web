<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>promedios de cuentas contables</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="average" class="datapro.eibs.beans.EGL075503Message" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


</head>

<body>
<SCRIPT type="text/javascript">

builtNewMenu(gl_i_opt);
builtHPopUp();
initMenu();

</SCRIPT>

<%@ page import = "datapro.eibs.master.Util" %>

 <% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }%>
 
 <h3 align="center">
 Promedios  
 <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="inq_averages.jsp,EGL0755"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.accounting.JSEGL0755" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="4">
  <input type=HIDDEN name="SELMTH">
  <h4>Informaci&oacute;n de la Cuenta Contable</h4>
 <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap>
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="25%" height="31"> 
              <div align="right">Cuenta Contable :</div>
            </td>
            <td nowrap width="25%" height="30"> 
              <input type="text" readonly name="BANCO"  size="3" maxlength="2" value="<%= average.getE03GLBBNK().trim()%>">
              <input type="text" readonly name="MONEDA"  size="4" maxlength="3" value="<%= average.getE03GLBCCY().trim()%>">
              <input type="text" readonly name="CUENTA"  size="17" maxlength="16" value="<%= average.getE03GLBGLN().trim()%>">              
              <input type="text" readonly name="DESC"  size="35" maxlength="35" value="<%= average.getE03GLMDSC().trim()%>">
            </td>            
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4></h4>
  <table class="tableinfo" width="100%">
     <tr id="trclear"> 
        <td nowrap height="25" colspan="2" bordercolor="#000000"> 
          <div align="center"><b>Año En Curso</b></div>
        </td>
        <td nowrap height="25" colspan="2" bordercolor="#000000"> 
          <div align="center"><b>Año Anterior</b></div>
        </td>
                   
      </tr>
      <tr id="trdark"> 
        <td nowrap width="20%" bordercolor="#000000" height="31"> 
          <div align="right"><b>Saldo Inicial :</b></div>
        </td>
        <td nowrap width="20%" height="31" bordercolor="#000000" > 
          <div align="center"> 
            <input type="text" class="txtright" readonly name="E03INIAVG" size="17" maxlength="15" value="<%= Util.formatCCY(average.getE03INIAVG())%>" >
          </div>
        </td>
        <td nowrap width="20%" height="31" bordercolor="#000000" > 
          <div align="right"><b>Saldo Inicial :</b></div>
        </td>
        <td nowrap width="20%" height="31" bordercolor="#000000" > 
          <div align="center"> 
            <input type="text" class="txtright" readonly name="E03AVGPYTD" size="17" maxlength="15" value="<%= Util.formatCCY(average.getE03AVGPYTD())%>" >
          </div>
        </td>
      </tr>
      <tr id="trclear"> 
        <td nowrap width="20%" bordercolor="#000000"> 
          <div align="right">Enero :</div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center"> 
            <input type="text" class="txtright" readonly name="E03AVGCM01" size="17" maxlength="15" value="<%= Util.formatCCY(average.getE03AVGCM01())%>" >
          </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="right">Enero :</div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center"> 
            <input type="text" class="txtright" readonly name="E03AVGPY01" size="17" maxlength="15" value="<%= Util.formatCCY(average.getE03AVGPY01())%>" >
          </div>
        </td>           
      </tr>
      <tr id="trclear"> 
        <td nowrap width="20%" bordercolor="#000000" height="35"> 
          <div align="right">Febrero : </div>
        </td>
        <td nowrap width="20%" height="35" bordercolor="#000000" > 
          <div align="center">
          	<INPUT type="text" class="txtright" readonly name="E03AVGCM02" size="17" maxlength="15" value="<%= Util.formatCCY(average.getE03AVGCM02())%>">
          </div>
        </td>
        <td nowrap width="20%" height="35" bordercolor="#000000" > 
          <div align="right">Febrero : </div>
        </td>
        <td nowrap width="20%" height="35" bordercolor="#000000" > 
          <div align="center">
          	<INPUT type="text" class="txtright" readonly name="E03AVGPY02" size="17" maxlength="15" value="<%= Util.formatCCY(average.getE03AVGPY02())%>">
          </div>
        </td>            
      </tr>
      <tr id="trclear"> 
        <td nowrap width="20%" bordercolor="#000000"> 
          <div align="right">Marzo : </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center"><INPUT
	type="text" class="txtright" readonly name="E03AVGCM03" size="17"
	maxlength="15" value="<%= Util.formatCCY(average.getE03AVGCM03())%>">
          </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="right">Marzo : </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center"><INPUT
	type="text" class="txtright" readonly name="E03AVGPT01" size="17"
	maxlength="15" value="<%= Util.formatCCY(average.getE03AVGPT01())%>">
          </div>
        </td>
      </tr>
      <tr id="trdark"> 
        <td nowrap width="20%" bordercolor="#000000"> 
          <div align="right"> <b> Primer Trimestre :</b> </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
          	<INPUT type="text" class="txtright" readonly name="E03AVGCM03" size="17" maxlength="15" value="<%= Util.formatCCY(average.getE03AVGCM03())%>">
          </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="right"><b>Primer Trimestre : </b></div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center"><INPUT
	type="text" class="txtright" readonly name="E03AVGPT01" size="17"
	maxlength="15" value="<%= Util.formatCCY(average.getE03AVGPT01())%>">
          </div>
        </td>
      </tr>
      <tr id="trclear"> 
        <td nowrap width="20%" bordercolor="#000000"> 
          <div align="right">Abril :</div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center"> 
            <INPUT
	type="text" class="txtright" readonly name="E03AVGCM04" size="17"
	maxlength="15" value="<%= Util.formatCCY(average.getE03AVGCM04())%>">
          </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="right">Abril :</div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
          	<INPUT type="text" class="txtright" readonly name="E03AVGPY04" size="17" maxlength="15" value="<%= Util.formatCCY(average.getE03AVGPY04())%>">
          </div>
        </td>           
      </tr>
      <tr id="trclear"> 
        <td nowrap width="20%" bordercolor="#000000"> 
          <div align="right">Mayo :</div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
          	<INPUT type="text" class="txtright" readonly name="E03AVGCM05" size="17" maxlength="15" value="<%= Util.formatCCY(average.getE03AVGCM05())%>">
          </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="right">Mayo :</div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center"><INPUT
	type="text" class="txtright" readonly name="E03AVGPY05" size="17"
	maxlength="15" value="<%= Util.formatCCY(average.getE03AVGPY05())%>">
          </div>
        </td>
      </tr>
      <tr id="trclear"> 
        <td nowrap width="20%" bordercolor="#000000"> 
          <div align="right">Junio : </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center"><INPUT
	type="text" class="txtright" readonly name="E03AVGCM06" size="17"
	maxlength="15" value="<%= Util.formatCCY(average.getE03AVGCM06())%>">
          </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="right">Junio : </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center"><INPUT
	type="text" class="txtright" readonly name="E03AVGPY06" size="17"
	maxlength="15" value="<%= Util.formatCCY(average.getE03AVGPY06())%>">
          </div>
        </td>           
      </tr>
      <tr id="trdark"> 
        <td nowrap width="20%" bordercolor="#000000"> 
          <div align="right"><b>Segundo Trimestre :</b> </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center"><INPUT
	type="text" class="txtright" readonly name="E03AVGT02" size="17"
	maxlength="15" value="<%= Util.formatCCY(average.getE03AVGT02())%>">
          </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="right"><b>Segundo Trimestre :</b> </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
           <div align="center"><INPUT
	type="text" class="txtright" readonly name="E03AVGPT02" size="17"
	maxlength="15" value="<%= Util.formatCCY(average.getE03AVGPT02())%>">
          </div>
        </td>
      </tr>
      <tr id="trclear"> 
        <td nowrap width="20%" bordercolor="#000000"> 
          <div align="right">Julio : </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
          	<INPUT type="text" class="txtright" readonly name="E03AVGCM07" size="17" maxlength="15" value="<%= Util.formatCCY(average.getE03AVGCM07())%>">
          </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="right">Julio : </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
          	<INPUT type="text" class="txtright" readonly name="E03AVGPY07" size="17" maxlength="15" value="<%= Util.formatCCY(average.getE03AVGPY07())%>">
          </div>
        </td>           
      </tr>
      <tr id="trclear"> 
        <td nowrap width="20%" bordercolor="#000000"> 
          <div align="right">Agosto : </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
          	<INPUT type="text" class="txtright" readonly name="E03AVGCM08" size="17" maxlength="15" value="<%= Util.formatCCY(average.getE03AVGCM08())%>">
          </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="right">Agosto : </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
          	<INPUT type="text" class="txtright" readonly name="E03AVGPY08" size="17" maxlength="15" value="<%= Util.formatCCY(average.getE03AVGPY08())%>">
          </div>
        </td>           
      </tr>
      <tr id="trclear"> 
        <td nowrap width="20%" bordercolor="#000000"> 
          <div align="right">Septiembre : </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center"><INPUT
	type="text" class="txtright" readonly name="E03AVGCM09" size="17"
	maxlength="15" value="<%= Util.formatCCY(average.getE03AVGCM09())%>">
          </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="right">Septiembre : </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center"><INPUT
	type="text" class="txtright" readonly name="E03AVGPY09" size="17"
	maxlength="15" value="<%= Util.formatCCY(average.getE03AVGPY09())%>">
          </div>
        </td>            
      </tr>
      <tr id="trdark"> 
        <td nowrap width="20%" bordercolor="#000000"> 
          <div align="right"><b>Tercer Trimestre :</b> </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
          	<INPUT type="text" class="txtright" readonly name="E03AVGT03" size="17" maxlength="15" value="<%= Util.formatCCY(average.getE03AVGT03())%>">
          </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="right"><b>Tercer Trimestre :</b> </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
           <div align="center">
           	<INPUT type="text" class="txtright" readonly name="E03AVGPT03" size="17" maxlength="15" value="<%= Util.formatCCY(average.getE03AVGPT03())%>">
          </div>
        </td>
      </tr>
      <tr id="trclear"> 
        <td nowrap width="20%" bordercolor="#000000"> 
          <div align="right">Octubre : </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
          	<INPUT type="text" class="txtright" readonly name="E03AVGCM10" size="17" maxlength="15" value="<%= Util.formatCCY(average.getE03AVGCM10())%>">
          </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="right">Octubre : </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
          	<INPUT type="text" class="txtright" readonly name="E03AVGPY10" size="17" maxlength="15" value="<%= Util.formatCCY(average.getE03AVGPY10())%>">
          </div>
        </td>            
      </tr>
      <tr id="trclear"> 
        <td nowrap width="20%" bordercolor="#000000"> 
          <div align="right">Noviembre : </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
          	<INPUT type="text" class="txtright" readonly name="E03AVGCM11" size="17" maxlength="15" value="<%= Util.formatCCY(average.getE03AVGCM11())%>">
          </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="right">Noviembre : </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
          	<INPUT type="text" class="txtright" readonly name="E03AVGPY11" size="17" maxlength="15" value="<%= Util.formatCCY(average.getE03AVGPY11())%>">
          </div>
        </td>
      </tr>
      <tr id="trclear"> 
        <td nowrap width="20%" bordercolor="#000000"> 
          <div align="right">Diciembre : </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
            <INPUT type="text" class="txtright" readonly name="E03AVGCM12" size="17" maxlength="15" value="<%= Util.formatCCY(average.getE0AVGCMV12())%>">
          </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="right">Diciembre : </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
          	<INPUT type="text" class="txtright" readonly name="E03AVGPY12" size="17" maxlength="15" value="<%= Util.formatCCY(average.getE03AVGPY12())%>">
          </div>
        </td>            
      </tr>
      <tr id="trdark"> 
        <td nowrap width="20%" bordercolor="#000000"> 
          <div align="right"><b>Cuarto Trimestre :</b> </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
          	<INPUT type="text" class="txtright" readonly name="E03AVGT04" size="17" maxlength="15" value="<%= Util.formatCCY(average.getE03AVGT04())%>">
          </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="right"><b>Cuarto Trimestre :</b> </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
           <div align="center">
           	<INPUT type="text" class="txtright" readonly name="E03AVGPT04" size="17" maxlength="15" value="<%= Util.formatCCY(average.getE03AVGPT04())%>">
          </div>
        </td>
      </tr>
      <tr id="trdark"> 
        <td nowrap width="20%" bordercolor="#000000"> 
          <div align="right"><b>Total del Año : </b></div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" >
 <div align="center">
<INPUT type="text" class="txtright" readonly name="E03AVGYTD" size="17" maxlength="15"	value="<%= Util.formatCCY(average.getE03AVGYTD())%>">				
          </div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="right"><b>Total del Año : </b></div>
        </td>
        <td nowrap width="20%" height="22" bordercolor="#000000" > 
          <div align="center">
          	<INPUT type="text" class="txtright" readonly name="E03AVGPYTD" size="17" maxlength="15" value="<%=Util.formatCCY(average.getE03AVGPYTD())%>">
          </div>
        </td>            
      </tr>
    </table>       

    <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td width="100%"> 
      	<div align="center"> 
			<input id="EIBSBTN" type=submit name="Submit" value="Regresar">
  		</div>
      </td>      
    </tr>    
  </table>
  </form>
</body>
</html>
