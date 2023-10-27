<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<html>
<head>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link rel="stylesheet" href="../../theme/Master.css" type="text/css">
<title>Tabla de los Factores Formulas Segmentos</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Software Architect">

<jsp:useBean id="EDL0523Record" class="datapro.eibs.beans.EDL052301Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

</head>
<body>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
%>


<H3 align="center">Tabla Factores de Formula<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="formula_factors_table.jsp, EDL0523"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0523" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Descripci&oacute;n :</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
                <select id="segments" NAME="E01FFSSEG">
                	<optgroup label="Consumo">
                		<option></option>
						<option value="A"
						<% if(EDL0523Record.getE01FFSSEG().trim().equals("A")){ out.print("selected"); } %>
						>CFC-Automoviles</option>
						<option value="B"
						<% if(EDL0523Record.getE01FFSSEG().trim().equals("B")){ out.print("selected"); } %>
						>CFC-Otros</option>
						<option value="C"
						<% if(EDL0523Record.getE01FFSSEG().trim().equals("C")){ out.print("selected"); } %>
						>General-Automoviles</option>
						<option value="D" 
						<% if(EDL0523Record.getE01FFSSEG().trim().equals("D")){ out.print("selected"); } %>
						>General-Otros</option>
						<option value="E"
						<% if(EDL0523Record.getE01FFSSEG().trim().equals("E")){ out.print("selected"); } %>
						>Tarjeta de Credito</option>
					</optgroup>
				</select>
                </font></font></font></div>
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
            <td nowrap width="20%"> 
              <div align="center"><b>F1</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="center"><b>F2</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="center"><b>F3</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="center"><b>F4</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="center"><b>F5</b></div>
            
         </tr>
          <tr id="trclear"> 
            <td nowrap height="23"> 
              <div align="center"> 
              	<eibsinput:text name="EDL0523Record" property="E01FFSFF1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_REFERENCE %>" />
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
              	<eibsinput:text name="EDL0523Record" property="E01FFSFF2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_REFERENCE %>" />
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
                <eibsinput:text name="EDL0523Record" property="E01FFSFF3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_REFERENCE %>" />
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
                <eibsinput:text name="EDL0523Record" property="E01FFSFF4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_REFERENCE %>" />
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
                <eibsinput:text name="EDL0523Record" property="E01FFSFF5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_REFERENCE %>" />
              </div>
            </td>
          </tr>
        <tr id="trdark"> 
        	<td nowrap width="20%"> 
              <div align="center"><b>F6</b></div>
            </td>
            <td>
              <div align="center"><b>F7</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="center"><b>F8</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="center"><b>F9</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="center"><b>F10</b></div>
            </td>
            </tr>
            <tr id="trclear"> 
            <td nowrap height="23"> 
              <div align="center"> 
              	<eibsinput:text name="EDL0523Record" property="E01FFSFF6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_REFERENCE %>" />
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
                <eibsinput:text name="EDL0523Record" property="E01FFSFF7" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_REFERENCE %>" />
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
                <eibsinput:text name="EDL0523Record" property="E01FFSFF8" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_REFERENCE %>" />
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
                <eibsinput:text name="EDL0523Record" property="E01FFSFF9" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_REFERENCE %>" />
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
                <eibsinput:text name="EDL0523Record" property="E01FFSF10" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_REFERENCE %>" />
              </div>
            </td>
          </tr>
           <tr id="trdark"> 
            <td nowrap width="20%"> 
              <div align="center"><b>F11</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="center"><b>F12</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="center"><b>F13</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="center"><b>F14</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="center"><b>F15</b></div>
            </td>
        </tr> 
        <tr id="trclear"> 
            <td nowrap height="23"> 
              <div align="center"> 
              	<eibsinput:text name="EDL0523Record" property="E01FFSF11" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_REFERENCE %>" />
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
                <eibsinput:text name="EDL0523Record" property="E01FFSF12" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_REFERENCE %>" />
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
                <eibsinput:text name="EDL0523Record" property="E01FFSF13" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_REFERENCE %>" />
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
                <eibsinput:text name="EDL0523Record" property="E01FFSF14" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_REFERENCE %>" />
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
                <eibsinput:text name="EDL0523Record" property="E01FFSF15" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_REFERENCE %>" />
              </div>
            </td>
          </tr>
        <tr id="trdark"> 
        <td nowrap width="20%"> 
              <div align="center"><b>F16</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="center"><b>F17</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="center"><b>F18</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="center"><b>F19</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="center"><b>F20</b></div>
            </td>
        </tr>
        <tr id="trclear"> 
            <td nowrap height="23"> 
              <div align="center"> 
              	<eibsinput:text name="EDL0523Record" property="E01FFSF16" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_REFERENCE %>" />
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
                <eibsinput:text name="EDL0523Record" property="E01FFSF17" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_REFERENCE %>" />
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
                <eibsinput:text name="EDL0523Record" property="E01FFSF18" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_REFERENCE %>" />
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
                <eibsinput:text name="EDL0523Record" property="E01FFSF19" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_REFERENCE %>" />
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
                <eibsinput:text name="EDL0523Record" property="E01FFSF20" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_REFERENCE %>" />
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