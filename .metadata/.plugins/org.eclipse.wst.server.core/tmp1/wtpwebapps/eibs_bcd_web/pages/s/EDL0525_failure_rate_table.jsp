<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<html>
<head>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link rel="stylesheet" href="../../theme/Master.css" type="text/css">
<title>Tabla del Porcentaje de Incumplimiento de Garantias</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Software Architect">

<jsp:useBean id="EDL0525Record" class="datapro.eibs.beans.EDL052501Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

</head>
<body>
<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
%>

<H3 align="center">Tabla del Porcentaje de Incumplimiento de Garantias<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="failure_rate_table.jsp, EDL0525"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0525" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
  <INPUT TYPE=HIDDEN NAME="D01GPITGA" VALUE=" ">
 
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Tipo de Garant&iacute;a:</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
              	<input type="text" name="E01GPITGA" maxlength="4" size="5" value="<%= EDL0525Record.getE01GPITGA()%>" >
              	<a href="javascript:GetCodeDescCNOFC('E01GPITGA','D01GPITGA','K5')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda"
					align="bottom" border="0"></a>
              	</font></font></font>
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Clase de Cr&eacute;dito:</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
              	<input type="text" name="E01GPITPC" maxlength="1" size="2" value="<%= EDL0525Record.getE01GPITPC()%>" >
              	<a
					href="javascript:GetCode('E01GPITPC','STATIC_ln_prod_sup.jsp')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" title=". . ."
					align="bottom" border="0"></a>
              	</font></font></font>
              </div>
             </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>  
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="33%"> 
              <div align="center"><b>PDI Porcentaje Base</b></div>            </td>
        </tr>
          <tr id="trclear"> 
            <td nowrap height="23"> 
              <div align="center">
                <eibsinput:text name="EDL0525Record" property="E01GPIPDI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" />
                </div>            </td>
          </tr>
          </table>
          <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
          	<td nowrap width="25%"> 
              <div align="center"><b>Dias de Incumplimiento 1</b></div>
            </td>
            <td nowrap width="25%"> 
              <div align="center"><b>PDI Porcentaje de Incumplimiento 1</b></div>
            </td>
            <td nowrap width="25%"> 
              <div align="center"><b> Dias de Incumplimiento 2</b></div>
            </td>
            <td nowrap width="25%"> 
              <div align="center"><b>PDI Porcentaje de Incumplimiento 2</b></div>
            </td>
            
         </tr>
          <tr id="trclear"> 
          <td nowrap height="23"> 
              <div align="center">
              <eibsinput:text name="EDL0525Record" property="E01GPIDI1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_TERM %>" />
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
                <eibsinput:text name="EDL0525Record" property="E01GPIPI1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" />
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center"> 
              	 <eibsinput:text name="EDL0525Record" property="E01GPIDI2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_TERM %>" />
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
             <eibsinput:text name="EDL0525Record" property="E01GPIPI2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" />
            
              </div>
        </tr>
          <tr id="trdark"> 
          <td nowrap width="25%"> 
              <div align="center"><b>Dias de Incumplimiento 3</b></div>
            </td>
            <td nowrap width="25%"> 
              <div align="center"><b>PDI Porcentaje de Incumplimiento 3</b></div>
            </td>
          <td nowrap width="25%"> 
              <div align="center"><b>Dias de Incumplimiento 4</b></div>
            </td>
            <td nowrap width="25%"> 
              <div align="center"><b>PDI Porcentaje de Incumplimiento 4</b></div>
            </td>
         </tr>
          <tr id="trclear"> 
            <td nowrap height="23"> 
              <div align="center"> 
              	 <eibsinput:text name="EDL0525Record" property="E01GPIDI3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_TERM %>" />
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
                <eibsinput:text name="EDL0525Record" property="E01GPIPI3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" />
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
                 <eibsinput:text name="EDL0525Record" property="E01GPIDI4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_TERM %>" />
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
             <eibsinput:text name="EDL0525Record" property="E01GPIPI4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" />
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
          <td nowrap width="25%"> 
              <div align="center"><b>Dias de Incumplimiento 5</b></div>
            </td>
            <td nowrap width="25%"> 
              <div align="center"><b>PDI Porcentaje de Incumplimiento 5</b></div>
            </td>
          <td nowrap width="25%"> 
              <div align="center"><b>Dias de Incumplimiento 6</b></div>
            </td>
            <td nowrap width="25%"> 
              <div align="center"><b>PDI Porcentaje de Incumplimiento 6</b></div>
            </td>
         </tr>
         <tr id="trclear"> 
            <td nowrap height="23"> 
              <div align="center"> 
              	 <eibsinput:text name="EDL0525Record" property="E01GPIDI5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_TERM %>" />
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
              <eibsinput:text name="EDL0525Record" property="E01GPIPI5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" />
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
                 <eibsinput:text name="EDL0525Record" property="E01GPIDI6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_TERM %>" />
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
                       <eibsinput:text name="EDL0525Record" property="E01GPIPI6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" />
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <p>
  <br>
  </p>
  <div align="center"> 
  	<input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>
  </form>
</body>
</html>
