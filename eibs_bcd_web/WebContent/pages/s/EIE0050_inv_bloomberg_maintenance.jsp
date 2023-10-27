<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Sistema Administración Portafolio</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">



<jsp:useBean id="invInst" class="datapro.eibs.beans.EIE005002Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
<% if (userPO.getPurpose().equals("M") ) { %>
      builtNewMenu(inst_basic_opt);
 	  initMenu();
<% } %>
 	  
function goAction(op) {
	document.forms[0].SCREEN.value = op;
	submitForm();
 	  
</SCRIPT> 

</head>
<body >
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

 
%>

<div align="center"> 
  <h3>Actualizacion de Producto Bloomberg <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="inv_bloomberg_list.jsp, EIE0050"> 
  </h3>
</div>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0050" >
  <input type="hidden" name="SCREEN"  value="500">

 
   <h4>Información Básica</h4>
   <TABLE class="tableinfo" width="100%">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Código del Instrumento :</div>
            </td>
            <td nowrap width="25%" > 
             	<input type="text" name="E02ISIIIC"  value="<%= invInst.getE02ISIIIC()%>" readonly="readonly">
             </td>
             <td nowrap width="25%" > 
              <div align="right">Descripción del Instrumento :</div>
            </td>
            <td nowrap width="25%" > 
             	<input type="text" name="E02ISIDSC"  value="<%= invInst.getE02ISIDSC()%>" readonly="readonly">
             </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Numero ISIN :</div>
            </td>
            <td nowrap width="25%" > 
             	<input type="text" name="E02ISINUM"  value="<%= invInst.getE02ISINUM()%>" readonly="readonly">
             </td>
             <td nowrap width="25%" > 
              <div align="right">Serie :</div>
            </td>
            <td nowrap width="25%" > 
             	<input type="text" name="E02ISISER"  value="<%= invInst.getE02ISISER()%>" readonly="readonly">
             </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Número CUSIP:</div>
            </td>
            <td nowrap width="25%" > 
             	<input type="text" name="E02ISICUS"  value="<%= invInst.getE02ISICUS()%>" readonly="readonly">
             </td>
             <td nowrap width="25%" > 
              <div align="right">Descripción del Instrumento :</div>
            </td>
            <td nowrap width="25%" > 
             	<input type="text" name="E02ISISYM"  value="<%= invInst.getE02ISISYM()%>" readonly="readonly">
             </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Tipo de Producto :</div>
            </td>
            <td nowrap width="25%" > 
   	    	     <SELECT name="E01ISIPTY" disabled>
					<OPTION value="ACD" <%if (invInst.getE02ISIPTY().equals("ACD")) { out.print("selected"); }%>>Productos(Commodities)</OPTION>
					<OPTION value="EQT" <%if (invInst.getE02ISIPTY().equals("EQT")) { out.print("selected"); }%>>Acciones</OPTION>
					<OPTION value="MUT" <%if (invInst.getE02ISIPTY().equals("MUT")) { out.print("selected"); }%>>Fondos Mutuales</OPTION>
					<OPTION value="BND" <%if (invInst.getE02ISIPTY().equals("BND")) { out.print("selected"); }%>>Bonos</OPTION>
					<OPTION value="PFS" <%if (invInst.getE02ISIPTY().equals("PFS")) { out.print("selected"); }%>>Acciones Preferentes</OPTION>
				</SELECT>
            </td>
            <td nowrap width="25%" > 
              <div align="right">Nuevo Tipo de Producto :</div>
            </td>
            <td nowrap width="25%" > 
              <SELECT name="E02NEWPTY">
						<OPTION value="ACD" <%if (invInst.getE02NEWPTY().equals("ACD")) { out.print("selected"); }%>>Productos(Commodities)</OPTION>
						<OPTION value="EQT" <%if (invInst.getE02NEWPTY().equals("EQT")) { out.print("selected"); }%>>Acciones</OPTION>
						<OPTION value="MUT" <%if (invInst.getE02NEWPTY().equals("MUT")) { out.print("selected"); }%>>Fondos Mutuales</OPTION>
						<OPTION value="BND" <%if (invInst.getE02NEWPTY().equals("BND")) { out.print("selected"); }%>>Bonos</OPTION>
						<OPTION value="PFS" <%if (invInst.getE02NEWPTY().equals("PFS")) { out.print("selected"); }%>>Acciones Preferentes</OPTION>

			  </SELECT>
             </td>
          </tr>
          
        </table>
      </td>
    </tr>
  </table>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td width="33%"> 
  <div align="center"> 
	   <input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goAction(500);" >
  </div>      
  		</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td> 
        <div align="center"> </div>
      </td>
    </tr>
  </table>

<br>
 
 
  </form>
</body>
</html>
