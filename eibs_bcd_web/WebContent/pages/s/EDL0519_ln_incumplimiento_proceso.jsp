<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<title>Mantenimiento de Incumplimientos</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id= "Main_Incum" class= "datapro.eibs.beans.EDL051902Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script language="Javascript">
function cancel(){
	document.forms[0].SCREEN.value = 8;
	document.forms[0].submit();
}
</script>
</head>

<body bgcolor="#FFFFFF">

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 %> 
 
 <h3 align="center">Mantenimiento de Incumplimientos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_incumplimiento_proceso, EDL0519" ></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0519">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="7">
  <%int row = 0; %>
  	<table class="tableinfo">
      <tr > 
        <td nowrap>          
         <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            
            <td nowrap> 
              <div align="right">Nro Cliente :</div>
            </td>
            <td nowrap><input type="text" readonly name="E02CUSCUN" size="10" maxlength="9" value="<%= userPO.getHeader1()%>">
        </td>
			<td nowrap> 
              <div align="right">Identificaci&oacute;n :</div>
            </td>
            <td nowrap><input type="text" readonly name="E02CUSTID" size="5" maxlength="4" value="<%= userPO.getHeader6()%>">
              <input type="text" readonly name="E02CUSIDN" size="26" maxlength="25" value="<%= userPO.getHeader7()%>">
        </td>
			 <td nowrap> 
              <div align="right">Nombre :</div>
            </td>
            <td nowrap colspan="3"><input type="text" readonly name="E02CUSNA1" size="60" maxlength="60" value="<%= userPO.getHeader8()%>">
        </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Pr&eacute;stamo :</div>
            </td>
            <td nowrap colspan="3"><input type="text" readonly name="E02DEAACC" size="13" maxlength="12" value="<%= Main_Incum.getE02DEAACC()%>"></td>
			<td nowrap> 
              <div align="right">Modalidad :</div>
            </td>
            <td nowrap colspan="3"><input type="text" readonly name="D02DLCMOD" size="20" maxlength="20" value="<%= userPO.getHeader5()%>">
        </td>
			
          </tr>          
		        <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Condici&oacute;n :</div>
            </td>
            <td nowrap colspan="3"><input type="text" readonly name="D02DEADLC" size="20" maxlength="20" value="<%= Main_Incum.getD02DEADLC()%>"></td>
			<td nowrap> 
              <div align="right"></div>
            </td>
            <td nowrap colspan="3">&nbsp;</td>
			
          </tr>    
		  <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Producto :</div>
            </td>
            <td nowrap colspan="3"><input type="text" readonly name="D02DEATYP" size="35" maxlength="35" value="<%= Main_Incum.getD02DEATYP()%>"></td>
			<td nowrap> 
              <div align="right">
                <div align="right">Tipo Producto :</div>
              </div>
            </td>
            <td nowrap colspan="3"><input type="text" readonly name="D02DEAPRO" size="35" maxlength="35" value="<%= Main_Incum.getD02DEAPRO()%>"></td>
			
          </tr>    
		  <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Fecha Apertura  :</div>
            </td>
            <td nowrap colspan="3"><%= Util.formatDate(Main_Incum.getE02DEAODD(),Main_Incum.getE02DEAODM(),Main_Incum.getE02DEAODY())%></td>
            <td nowrap> 
              <div align="right">
                <div align="right">Fecha Vencimiento  :</div>
              </div>
            </td>
            <td nowrap colspan="3"><%= Util.formatDate(Main_Incum.getE02DEAMAD(),Main_Incum.getE02DEAMAM(),Main_Incum.getE02DEAMAY())%></td>
		  </tr>  
		  <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Principal  :</div>
            </td>
            <td nowrap colspan="3"><input type="text" readonly name="E02DEAMEP" size="17" maxlength="15" value="<%= Main_Incum.getE02DEAMEP()%>"></td>
            <td nowrap> 
              <div align="right">
                <div align="right">Inter&eacute;s :</div>
              </div>
            </td>
            <td nowrap colspan="3"><input type="text" readonly name="E02DEAMEI" size="17" maxlength="15" value="<%= Main_Incum.getE02DEAMEI()%>"></td>
		  </tr>  
		    <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Otros  :</div>
            </td>
            <td nowrap colspan="3"><input type="text" readonly name="E02DEAOTR" size="17" maxlength="15" value="<%= Main_Incum.getE02DEAOTR()%>"></td>
            <td nowrap> 
              <div align="right">
                <div align="right">Total :</div>
              </div>
            </td>
            <td nowrap colspan="3"><input type="text" readonly name="E02TOTPAG" size="17" maxlength="15" value="<%= Main_Incum.getE02TOTPAG()%>"></td>
		  </tr> 
		   <tr id="trdark"> 
            <td nowrap> 
              <div align="right">D&iacute;as de Mora   :</div>
            </td>
            <td nowrap colspan="3"><input type="text" readonly name="E02DIASMO" size="5" maxlength="4" value="<%= Main_Incum.getE02DIASMO()%>"></td>
            <td nowrap> 
              <div align="right">
                <div align="right">Periodo : </div>
              </div>
            </td>
            <td nowrap colspan="3">Mes:
              <input type="text" readonly name="E02PERMES" size="5" maxlength="4" value="<%= userPO.getHeader3()%>">
A&ntilde;o:
<input type="text" readonly name="E02PERAYO" size="5" maxlength="2" value="<%= userPO.getHeader4()%>"></td>
		   </tr> 
         </table>
        </td>
      </tr>
    </table>
  
	 <h4>Informaci&oacute;n  Actual de Incumplimiento</h4> 
	<table class="tableinfo">
      <tr > 
        <td nowrap> 
		<table cellpadding=2 cellspacing=0 width="100%" border="0">
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="40%"><div align="right">Fecha Incumplimiento :</div></td>
              <td nowrap width="20%" align=center><div align=left><%= Util.formatDate(Main_Incum.getE02OLDIID(),Main_Incum.getE02OLDIIM(),Main_Incum.getE02OLDIIY())%></div></td>
			  <td nowrap width="40%"><div align="right">Tipo Incumplimiento  : </div></td> 
              <td nowrap > 
                <div align=left>
                  <input type="text" readonly name="E02OLDTYP" size="5" maxlength="4" value="<%= Main_Incum.getE02OLDTYP()%>">
				  <input type="text" readonly name="D02OLDTYP" size="35" maxlength="35" value="<%= Main_Incum.getD02OLDTYP()%>">
                </div>              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
               <td nowrap width="40%"><div align="right">Estado Incumplimiento :</div></td> 
              <td nowrap > 
                <div align=left>
                  <input type="text" readonly name="D02OLDSTS" size="35" maxlength="35" value="<%= Main_Incum.getD02OLDSTS()%>">
                </div>              </td>
				<td nowrap width="40%"><div align="right">Motivo Incumplimiento   : </div></td>
              <td nowrap ><input type="text" readonly name="E02OLDMOT" size="5" maxlength="4" value="<%= Main_Incum.getE02OLDMOT()%>">
                <input type="text" readonly name="D02OLDMOT" size="35" maxlength="35" value="<%= Main_Incum.getD02OLDMOT()%>"></td>
            </tr>
			
          </table>
        </td>
      </tr>
    </table>
	 <h4>Datos Auditoria Ultima Actualizaci&oacute;n </h4> 
	 <table class="tableinfo">
      <tr > 
        <td nowrap> 
		<table cellpadding=2 cellspacing=0 width="100%" border="0">
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="40%"><div align="right">Usuario :</div></td>
              <td nowrap width="20%" align=center><div align=left>
                <input type="text" readonly name="E02INCLMU" size="11" maxlength="10" value="<%= Main_Incum.getE02INCLMU()%>">
              </div></td>
			  <td nowrap width="40%"><div align="right">Fecha  : </div></td> 
              <td nowrap > 
                <div align=left><%= Util.formatDate(Main_Incum.getE02INCLMD(),Main_Incum.getE02INCLMM(),Main_Incum.getE02INCLMY())%></div>              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
<%  if ((!Main_Incum.getH02SCRCOD().equals("03"))) {%>         	
	<h4>Nueva Informaci&oacute;n</h4> 
	<table class="tableinfo">
      <tr > 
        <td nowrap> 
		<table cellpadding=2 cellspacing=0 width="100%" border="0">
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="40%"><div align="right">Fecha Incumplimiento   :</div></td>
              <td nowrap width="20%" align=center><div align=left><eibsinput:date name="Main_Incum"  fn_day="E02INCIID" fn_month="E02INCIIM"  fn_year="E02INCIIY" /> </div></td>
			  <td nowrap width="40%"><div align="right">Tipo   : </div></td> 
              <td nowrap > 
                <eibsinput:cnofc name="Main_Incum" flag="K1" property="E02INCTYP" fn_description="D02INCTYP" required="true"/>
                <eibsinput:text name="" property="D02INCTYP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
               <td nowrap width="40%"><div align="right">Motivo  :</div></td> 
              <td nowrap > 
				<eibsinput:cnofc name="Main_Incum" flag="K2" property="E02INCMOT" fn_description="D02INCMOT" required="true"/>
                <eibsinput:text name="" property="D02INCMOT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
                           </td>
				<td nowrap width="40%"><div align="right">Estado: </div></td>
              <td nowrap >
			  <select name="E02INCSTS" >
                    <option value="A" <% if (Main_Incum.getE02OLDSTS().equals("A")) out.print("selected"); %>>Activo</option>
                    <option value="I" <% if (Main_Incum.getE02OLDSTS().equals("I")) out.print("selected"); %>>Inactivo</option>                   
                  </select>
            </tr>
			
          </table>
        </td>
      </tr>
    </table>
<%  }%>     	
  <div align="center"> 
  <%  if ((!Main_Incum.getH02SCRCOD().equals("03"))) {%>  
    	<input id="EIBSBTN" type=submit name="Submit" value="Enviar">
<%  }%>   		
		<input id="EIBSBTN" type=button name="Cancel" value="Cancelar" onClick="javascript:cancel()">
	</div>

</form>
</body>
</html>
