<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<html>
<head>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link rel="stylesheet" href="../../theme/Master.css" type="text/css">
<title>Tabla de las Probabilidades de Incumplimiento</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Software Architect">

<jsp:useBean id="EDL0524Record" class="datapro.eibs.beans.EDL052401Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

</head>
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

<H3 align="center">Tabla de las Probabilidades de Incumplimiento<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="failure_probability_table.jsp, EDL0524"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0524" >
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
                <select id="segments" NAME="E01CPITES">
                	<optgroup label="Comercial">
                		<option></option>
						<option value="1"
						<% if(EDL0524Record.getE01CPITES().trim().equals("1")){ out.print("selected"); } %>
						>Gran Empresa</option>
						<option value="2"
						<% if(EDL0524Record.getE01CPITES().trim().equals("2")){ out.print("selected"); } %>
						>Mediana Empresa</option>
						<option value="3"
						<% if(EDL0524Record.getE01CPITES().trim().equals("3")){ out.print("selected"); } %>
						>Pequeña Empresa</option>
						<option value="4"
						<% if(EDL0524Record.getE01CPITES().trim().equals("4")){ out.print("selected"); } %>
						>Persona Natural</option>
					</optgroup>
					<optgroup label="Consumo">
						<option value="A"
						<% if(EDL0524Record.getE01CPITES().trim().equals("A")){ out.print("selected"); } %>
						>CFC-Automoviles</option>
						<option value="B"
						<% if(EDL0524Record.getE01CPITES().trim().equals("B")){ out.print("selected"); } %>
						>CFC-Otros</option>
						<option value="C"
						<% if(EDL0524Record.getE01CPITES().trim().equals("C")){ out.print("selected"); } %>
						>General-Automoviles</option>
						<option value="D"
						<% if(EDL0524Record.getE01CPITES().trim().equals("D")){ out.print("selected"); } %>
						>General-Otros</option>
						<option value="E"
						<% if(EDL0524Record.getE01CPITES().trim().equals("E")){ out.print("selected"); } %>
						>Tarjeta de Credito</option>
					</optgroup>
				</select>
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
            <td nowrap width="40%"> 
              <div align="center"><b> Matriz</b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="center"><b> Calificacion</b></div>
            </td>
            <td nowrap width="28%"> 
              <div align="center"><b>% Incumplimiento</b></div>
            </td>
         </tr>
          <tr id="trclear"> 
            <td nowrap height="23"> 
              <div align="center"> 
              	<select NAME="E01CPIMAT">
                	<option></option>
					<option value="A"
					<% if(EDL0524Record.getE01CPIMAT().trim().equals("A")){ out.print("selected"); } %>	>A</option>
					<option value="B"
					<% if(EDL0524Record.getE01CPIMAT().trim().equals("B")){ out.print("selected"); } %>	>B</option>
              	</select>
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= EDL0524Record.getE01CPICAL().trim()%>" name="E01CPICAL" >
                <a href="javascript:GetCodeCNOFC('E01CPICAL','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0"  ></a> 
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
                <input type="text" name="E01CPIPDI" maxlength="5" size="9" value="<%= EDL0524Record.getE01CPIPDI()%>" >
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
