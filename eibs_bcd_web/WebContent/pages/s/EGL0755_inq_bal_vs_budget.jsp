<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Balances de Cuentas Contables</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="balVSbud" class="datapro.eibs.beans.EGL075504Message" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


</head>

<body>

<%@ page import = "datapro.eibs.master.Util" %>

 <% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }%>
 
<SCRIPT type="text/javascript">

builtNewMenu(gl_i_opt);
builtHPopUp();
initMenu();

</SCRIPT>
 
 <h3 align="center">
	 Balance Vs. Presupuesto
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="inq_bal_vs_budget.jsp,EGL0755"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.accounting.JSEGL0755" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="4">
  <h4>Información de la Cuenta Contable</h4>
 <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap>
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="25%" height="31"> 
              <div align="right">Cuenta Contable :</div>
            </td>
            <td nowrap width="25%" height="30"> 
              <input type="text" readonly name="BANCO"  size="3" maxlength="2" value="<%= balVSbud.getE04GLBBNK().trim()%>">
              <input type="text" readonly name="MONEDA"  size="4" maxlength="3" value="<%= balVSbud.getE04GLBCCY().trim()%>">
              <input type="text" readonly name="CUENTA"  size="17" maxlength="16" value="<%= balVSbud.getE04GLBGLN().trim()%>">
              <input type="text" readonly name="DESC"  size="35" maxlength="35" value="<%= balVSbud.getE04GLMDSC().trim()%>">
            </td>            
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4></h4>
  <table class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap height="36"> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
         <tr id="trclear"> 
            <td nowrap height="25" bordercolor="#000000" colspan="2"> 
              <div align="center"><b>Saldo Contable</b></div>
            </td>
            <td nowrap height="25" height="50" bordercolor="#000000" colspan="2"> 
              <div align="center"><b>Presupuesto</b></div>
            </td>
                       
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" bordercolor="#000000" height="31"> 
              <div align="right"><b>Saldo Inicial:</b></div>
            </td>
            <td nowrap width="25%" height="31" bordercolor="#000000" > 
              <div align="center"> 
                <input type="text" class="txtright" readonly name="E04INIBAL" size="17" maxlength="15" value="<%= Util.formatCCY(balVSbud.getE04INIBAL())%>" >
              </div>
            </td>
            <td nowrap width="25%" height="22" bordercolor="#000000" > 
              <div align="right"><b>Saldo Inicial:</b></div>
            </td>
            <td nowrap width="25%" height="31" bordercolor="#000000" > 
              <div align="left"> 
                <input type="text" class="txtright" readonly name="E04BUGINI" size="17" maxlength="15" value="<%= Util.formatCCY(balVSbud.getE04BUGINI())%>" >
              </div>
            </td>
           </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right">Enero :</div>
            </td>
            <td nowrap width="20%" height="22" bordercolor="#000000" > 
              <div align="left"> 
                <input type="text" class="txtright" readonly name="E04BALCM01" size="17" maxlength="15" value="<%= Util.formatCCY(balVSbud.getE04BALCM01())%>" >
              </div>
            </td>
            <td nowrap width="20%" height="22" bordercolor="#000000" > 
              <div align="right">Enero :</div>
            </td>
            <td nowrap width="20%" height="22" bordercolor="#000000" > 
              <div align="left"> 
                <input type="text" class="txtright" readonly name="E04BUGCY01" size="17" maxlength="15" value="<%= Util.formatCCY(balVSbud.getE04BUGCY01())%>" >
              </div>
            </td>            
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" bordercolor="#000000" height="35"> 
              <div align="right">Febrero : </div>
            </td>
            <td nowrap width="20%" height="35" bordercolor="#000000" > 
              <div align="left">
              	<INPUT type="text" class="txtright" readonly name="E04BALCM02" size="17" maxlength="15" value="<%= Util.formatCCY(balVSbud.getE04BALCM02())%>">
              </div>
            </td>
            <td nowrap width="20%" height="35" bordercolor="#000000" > 
              <div align="right">Febrero : </div>
            </td>
            <td nowrap width="20%" height="35" bordercolor="#000000" > 
              <div align="left">
              	<INPUT type="text" class="txtright" readonly name="E04BUGCY02" size="17" maxlength="15" value="<%= Util.formatCCY(balVSbud.getE04BUGCY02())%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right">Marzo : </div>
            </td>
            <td nowrap width="20%" height="22" bordercolor="#000000" > 
              <div align="left">
              	<INPUT type="text" class="txtright" readonly name="E04BALCM03" size="17" maxlength="15" value="<%= Util.formatCCY(balVSbud.getE04BALCM03())%>">
              </div>
            </td>
            <td nowrap width="20%" height="22" bordercolor="#000000" > 
              <div align="right">Marzo : </div>
            </td>
            <td nowrap width="20%" height="22" bordercolor="#000000" > 
              <div align="left">
              	<INPUT type="text" class="txtright" readonly name="E04BUGCY03" size="17" maxlength="15" value="<%= Util.formatCCY(balVSbud.getE04BUGCY03())%>">
              </div>
            </td>            
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right">Primer Trimestre : </div>
            </td>
            <td nowrap width="20%" height="22" bordercolor="#000000" > 
              <div align="left">
              	<INPUT type="text" class="txtright" readonly name="E04BALT01" size="17" maxlength="15" value="<%= Util.formatCCY(balVSbud.getE04BALT01())%>">
              </div>
            </td>
            <td nowrap width="20%" height="22" bordercolor="#000000" > 
              <div align="right">Primer Trimestre : </div>
            </td>
            <td nowrap width="20%" height="22" bordercolor="#000000" > 
              <div align="left">
              	<INPUT type="text" class="txtright" readonly name="E04BUGCT01" size="17" maxlength="15" value="<%= Util.formatCCY(balVSbud.getE04BUGCT01())%>">
              </div>
            </td>            
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right">Abril :</div>
            </td>
            <td nowrap width="20%" height="22" bordercolor="#000000" > 
              <div align="left"> 
                <INPUT type="text" class="txtright" readonly name="E04BALCM04" size="17" maxlength="15" value="<%= Util.formatCCY(balVSbud.getE04BALCM04())%>">
              </div>
            </td>
            <td nowrap width="20%" height="22" bordercolor="#000000" > 
              <div align="right">Abril :</div>
            </td>
            <td nowrap width="20%" height="22" bordercolor="#000000" > 
              <div align="left">
              	<INPUT type="text" class="txtright" readonly name="E04BUGCY04" size="17" maxlength="15" value="<%= Util.formatCCY(balVSbud.getE04BUGCY04())%>">
              </div>
            </td>            
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right">Mayo :</div>
            </td>
            <td nowrap width="20%" height="22" bordercolor="#000000" > 
              <div align="left">
              	<INPUT type="text" class="txtright" readonly name="E04BALCM05" size="17" maxlength="15" value="<%= Util.formatCCY(balVSbud.getE04BALCM05())%>">
              </div>
            </td>
            <td nowrap width="20%" height="22" bordercolor="#000000" > 
              <div align="right">Mayo :</div>
            </td>
            <td nowrap width="20%" height="22" bordercolor="#000000" > 
              <div align="left">
              	<INPUT type="text" class="txtright" readonly name="E04BUGCY05" size="17" maxlength="15" value="<%= Util.formatCCY(balVSbud.getE04BUGCY05())%>">
              </div>
            </td>            
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right">Junio : </div>
            </td>
            <td nowrap width="20%" height="22" bordercolor="#000000" > 
              <div align="left">
              	<INPUT type="text" class="txtright" readonly name="E04BALCM06" size="17" maxlength="15" value="<%= Util.formatCCY(balVSbud.getE04BALCM06())%>">
              </div>
            </td>
            <td nowrap width="20%" height="22" bordercolor="#000000" > 
              <div align="right">Junio : </div>
            </td>
            <td nowrap width="20%" height="22" bordercolor="#000000" > 
              <div align="left">
              	<INPUT type="text" class="txtright" readonly name="E04BUGCY06" size="17" maxlength="15" value="<%= Util.formatCCY(balVSbud.getE04BUGCY06())%>">
              </div>
            </td>            
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right">Segundo Trimestre : </div>
            </td>
            <td nowrap width="20%" height="22" bordercolor="#000000" > 
              <div align="left">
              	<INPUT type="text" class="txtright" readonly name="E04BALT02" size="17" maxlength="15" value="<%= Util.formatCCY(balVSbud.getE04BALT02())%>">
              </div>
            </td>
            <td nowrap width="20%" height="22" bordercolor="#000000" > 
              <div align="right">Segundo Trimestre : </div>
            </td>
            <td nowrap width="20%" height="22" bordercolor="#000000" > 
              <div align="left">
              	<INPUT type="text" class="txtright" readonly name="E04BUGCT02" size="17" maxlength="15" value="<%= Util.formatCCY(balVSbud.getE04BUGCT02())%>">
              </div>
            </td>            
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right">Julio : </div>
            </td>
            <td nowrap width="20%" height="22" bordercolor="#000000" > 
              <div align="left">
              	<INPUT type="text" class="txtright" readonly name="E04BALCM07" size="17" maxlength="15" value="<%= Util.formatCCY(balVSbud.getE04BALCM07())%>">
              </div>
            </td>
            <td nowrap width="20%" height="22" bordercolor="#000000" > 
              <div align="right">Julio : </div>
            </td>
            <td nowrap width="20%" height="22" bordercolor="#000000" > 
              <div align="left">
              	<INPUT type="text" class="txtright" readonly name="E04BUGCY07" size="17" maxlength="15" value="<%= Util.formatCCY(balVSbud.getE04BUGCY07())%>">
              </div>
            </td>            
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right">Agosto : </div>
            </td>
            <td nowrap width="20%" height="22" bordercolor="#000000" > 
              <div align="left">
              	<INPUT type="text" class="txtright" readonly name="E04BALCM08" size="17" maxlength="15" value="<%= Util.formatCCY(balVSbud.getE04BALCM08())%>">
              </div>
            </td>
            <td nowrap width="20%" height="22" bordercolor="#000000" > 
              <div align="right">Agosto : </div>
            </td>
            <td nowrap width="20%" height="22" bordercolor="#000000" > 
              <div align="left">
              	<INPUT type="text" class="txtright" readonly name="E04BUGCY08" size="17" maxlength="15" value="<%= Util.formatCCY(balVSbud.getE04BUGCY08())%>">
              </div>
            </td>           
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right">Septiembre : </div>
            </td>
            <td nowrap width="20%" height="22" bordercolor="#000000" > 
              <div align="left">
              	<INPUT type="text" class="txtright" readonly name="E04BALCM09" size="17" maxlength="15" value="<%= Util.formatCCY(balVSbud.getE04BALCM09())%>">
              </div>
            </td>
            <td nowrap width="20%" height="22" bordercolor="#000000" > 
              <div align="right">Septiembre : </div>
            </td>
            <td nowrap width="20%" height="22" bordercolor="#000000" > 
              <div align="left">
              	<INPUT type="text" class="txtright" readonly name="E04BUGCY09" size="17" maxlength="15" value="<%= Util.formatCCY(balVSbud.getE04BUGCY09())%>">
              </div>
            </td>            
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right">Tercer Trimestre : </div>
            </td>
            <td nowrap width="20%" height="22" bordercolor="#000000" > 
              <div align="left">
              	<INPUT type="text" class="txtright" readonly name="E04BALT03" size="17" maxlength="15" value="<%= Util.formatCCY(balVSbud.getE04BALT03())%>">
              </div>
            </td>
            <td nowrap width="20%" height="22" bordercolor="#000000" > 
              <div align="right">Tercer Trimestre : </div>
            </td>
            <td nowrap width="20%" height="22" bordercolor="#000000" > 
              <div align="left">
              	<INPUT type="text" class="txtright" readonly name="E04BUGCT03" size="17" maxlength="15" value="<%= Util.formatCCY(balVSbud.getE04BUGCT03())%>">
              </div>
            </td>            
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right">Octubre : </div>
            </td>
            <td nowrap width="20%" height="22" bordercolor="#000000" > 
              <div align="left">
              	<INPUT type="text" class="txtright" readonly name="E04BALCM10" size="17" maxlength="15" value="<%= Util.formatCCY(balVSbud.getE04BALCM10())%>">
              </div>
            </td>
            <td nowrap width="20%" height="22" bordercolor="#000000" > 
              <div align="right">Octubre : </div>
            </td>
            <td nowrap width="20%" height="22" bordercolor="#000000" > 
              <div align="left">
              	<INPUT type="text" class="txtright" readonly name="E04BUGPY10" size="17" maxlength="15" value="<%= Util.formatCCY(balVSbud.getE04BUGPY10())%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right">Noviembre : </div>
            </td>
            <td nowrap width="20%" height="22" bordercolor="#000000" > 
              <div align="left">
              	<INPUT type="text" class="txtright" readonly name="E04BALCM11" size="17" maxlength="15" value="<%= Util.formatCCY(balVSbud.getE04BALCM11())%>">
              </div>
            </td>
            <td nowrap width="20%" height="22" bordercolor="#000000" > 
              <div align="right">Noviembre : </div>
            </td>
            <td nowrap width="20%" height="22" bordercolor="#000000" > 
              <div align="left">
              	<INPUT type="text" class="txtright" readonly name="E04BUGCY11" size="17" maxlength="15" value="<%= Util.formatCCY(balVSbud.getE04BUGCY11())%>">
              </div>
            </td>            
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right">Diciembre : </div>
            </td>
            <td nowrap width="20%" height="22" bordercolor="#000000" > 
              <div align="left">
                 <INPUT	type="text" class="txtright" readonly name="E04BALCM12" size="17" maxlength="15" value="<%= Util.formatCCY(balVSbud.getE04BALCM12())%>">
              </div>
            </td>
            <td nowrap width="20%" height="22" bordercolor="#000000" > 
              <div align="right">Diciembre : </div>
            </td>
            <td nowrap width="20%" height="22" bordercolor="#000000" > 
              <div align="left">
              	<INPUT type="text" class="txtright" readonly name="E04BUGCY12" size="17" maxlength="15" value="<%= Util.formatCCY(balVSbud.getE04BUGCY12())%>">
              </div>
            </td>            
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right">Cuerto Trimestre : </div>
            </td>
            <td nowrap width="20%" height="22" bordercolor="#000000" > 
              <div align="left">
              	<INPUT type="text" class="txtright" readonly name="E04BALT04" size="17" maxlength="15" value="<%= Util.formatCCY(balVSbud.getE04BALT04())%>">
              </div>
            </td>
            <td nowrap width="20%" height="22" bordercolor="#000000" > 
              <div align="right">Cuarto Trimestre : </div>
            </td>
            <td nowrap width="20%" height="22" bordercolor="#000000" > 
              <div align="left">
              	<INPUT type="text" class="txtright" readonly name="E04BUGCT04" size="17" maxlength="15" value="<%= Util.formatCCY(balVSbud.getE04BUGCT04())%>">
              </div>
            </td>            
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%" bordercolor="#000000"> 
              <div align="right"><b>Total : </b></div>
            </td>
            <td nowrap width="20%" height="22" bordercolor="#000000" >
				<div align="left">
					<INPUT type="text" class="txtright" readonly name="E04BALT05(" size="17" maxlength="15" value="<%= Util.formatCCY(balVSbud.getE04BALT05())%>">				
              </div>
            </td>
            <td nowrap width="20%" height="22" bordercolor="#000000" > 
              <div align="right"><b>Total : </b></div>
            </td>
            <td nowrap width="20%" height="22" bordercolor="#000000" > 
              <div align="left">
              	<INPUT type="text" class="txtright" readonly name="E04BUGTT05" size="17" maxlength="15" value="<%=Util.formatCCY(balVSbud.getE04BUGTT05())%>">
              </div>
            </td>           
          </tr>         
        </table>
        
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
