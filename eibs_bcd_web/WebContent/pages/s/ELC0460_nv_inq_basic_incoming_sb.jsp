<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Consulta de Cartas de Credito</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="msg046001" class="datapro.eibs.beans.ELC046001Message"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
  <% if(request.getParameter("OPTMENU") != null) { %>
   		builtNewMenu(<%= request.getParameter("OPTMENU")%>);
   <%} else {%>
   builtNewMenu(nv_i_opt);
<%}%>

</SCRIPT>

</head>

<body bgcolor="#FFFFFF">

<%@ page import = "datapro.eibs.master.Util" %>
<SCRIPT> initMenu(); </SCRIPT>

<H3 align="center">Consulta de Historial Garantias Navieras<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="nv_inq_basic_incoming_sb.jsp,ELC0460"></h3>

<hr size="4">

<form method="post">
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="">
 
  <table class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0" >
    <tr id="trdark">
      <td width="18%" align="right"><b>Tipo de Operacion :</b></td>
      <td width="18%"><input name="E01LCMBNK" type="text" id="E01LCMBNK" value="<%= userPO.getHeader1() %>" size="30" maxlength="30" readonly></td>
      <td height="18%" align="right"><b>Operador  :</b></td>
      <td width="18%"><input type="text" name="E02ACC" size="25"
			maxlength="30" value="<%= userPO.getHeader2() %>" readonly></td>
      <td height="18%" align="right"><b>Fecha y Hora  :</b></td>
      <td width="18%"><input type="text" name="E02ACC" size="20" maxlength="12" value="<%= userPO.getHeader3() %>" readonly></td>
    </tr>

    <tr id="trdark">
      <td width="18%" align="right"><b>Aprobación :</b></td>
      <td width="18%"><input name="E01LCMBNK" type="text" id="E01LCMBNK" value="<%= userPO.getHeader4() %>" size="30" maxlength="30" readonly></td>
      <td height="18%" align="right"><b>Supervisor  :</b></td>
      <td width="18%"><input type="text" name="E02ACC" size="25"
			maxlength="30" value="<%= userPO.getHeader5() %>" readonly></td>
      <td height="18%" align="right"><b>Fecha y Hora  :</b></td>
      <td width="18%"><input type="text" name="E02ACC" size="20" maxlength="12" value="<%= userPO.getHeader6() %>" readonly></td>
    </tr>
  </table>
  <BR>
  <TABLE cellspacing="0" cellpadding="2" width="100%" border="0" class="tableinfo" id="trclear">
  <TR id="trdark">
  	<TD nowrap width="16%" align="right"><B>Banco : </B> </TD>
    <TD nowrap width="20%" align="left"><INPUT type="text" name="E01LCMBNK" readonly size="4" maxlength="2" value="<%= msg046001.getE01LCMBNK().trim()%>"></TD>
    <TD nowrap width="16%" align="right"><B>Número de Garantia : </B> </TD>
    <TD nowrap width="16%" align="left"><B> <B>
    	<INPUT type="text" name="E01LCMACC" size="15" maxlength="12" value="<%= msg046001.getE01LCMACC().trim()%>" readonly>
        </B></B>
    </TD>
  </TR>
  <TR>
    <TD nowrap width="16%" align="right"><B>Nuestra Referencia : </B> </TD>
    <TD nowrap width="20%" align="left"><INPUT name="E01LCMORF" type="text" value="<%= msg046001.getE01LCMORF().trim()%>" size="20"	maxlength="16" readonly="readonly">
    </TD>
    <TD nowrap width="16%" align="right"><B>Producto : </B> </TD>
    <TD nowrap width="16%" align="left"><B>
    	<INPUT type="text" name="E01LCMPRO" size="4" maxlength="4" value="<%= msg046001.getE01LCMPRO().trim()%>" readonly></B> 
    </TD>
  </TR>
  <TR id="trdark">
  	<TD nowrap width="16%" align="right"><B>Referencia del Otro Banco : </B> </TD>
    <TD nowrap width="16%" align="left"><B>
    	<INPUT name="E01LCMTRF" type="text" value="<%=msg046001.getE01LCMTRF().trim()%>" size="20" maxlength="16" readonly="readonly"></B> 
    </TD>
    <TD nowrap width="16%" align="right"><B>Descripción del Producto : </B> </TD>
    <TD nowrap width="16%" align="left"><B>
        <INPUT type="text" name="E01DSCPRO" size="40" maxlength="35" value="<%=msg046001.getE01DSCPRO().trim()%>" readonly><%userPO.setHeader22(msg046001.getE01DSCPRO().trim()); %></B> 
    </TD>
  </TR>
  </TABLE>
<BR>
<TABLE class="tableinfo" cellspacing="0" cellpadding="2" border="0" width="100%" align="center">
  <TR id="trdark">
    <TD colspan="2" align="center" valign="middle"><FONT size="medium"><B>Agencia Naviera </B></FONT></TD>
  </TR>
  <TR id="">
    <TD align="right">Número de Cliente o Cuenta: </TD>
    <TD nowrap><SELECT name="E01LCMAF2" disabled>
        <OPTION value=" "<%if (!(msg046001.getE01LCMAF2().equals("C") || msg046001.getE01LCMAF2().equals("A"))) out.print("selected");%>
								selected></OPTION>
        <OPTION value="C" <%if (msg046001.getE01LCMAF2().equals("C")) out.print("selected");%>>Cliente</OPTION>
        <OPTION value="A" <%if (msg046001.getE01LCMAF2().equals("A")) out.print("selected");%>>Cuenta</OPTION>
      			</SELECT>
        <INPUT name="E01LCMAPA" type="text" value="<%=msg046001.getE01LCMAPA()%>" size="12"	maxlength="12" readonly="readonly">
    </TD>
  </TR>
  <TR id="">
    <TD width="35%" align="right">Nombre: </TD>
    <TD align="left"><INPUT <%if (msg046001.getF01LCMAP1().equals("Y")) out.print("class=\"txtchanged\"");%> name="E01LCMAP1" type="text" value="<%=msg046001.getE01LCMAP1()%>" size="45" maxlength="35" readonly="readonly">    
		<IMG src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0"></TD>
  </TR>
  <TR id="">
    <TD align="right">Dirección: </TD>
    <TD align="left"><INPUT <%if (msg046001.getF01LCMAP2().equals("Y")) out.print("class=\"txtchanged\"");%> name="E01LCMAP2" type="text" value="<%=msg046001.getE01LCMAP2()%>" size="45"
					maxlength="35" readonly="readonly">    </TD>
  </TR>
  <TR id="">
    <TD></TD>
    <TD align="left"><INPUT <%if (msg046001.getF01LCMAP3().equals("Y")) out.print("class=\"txtchanged\"");%> name="E01LCMAP3" type="text" value="<%=msg046001.getE01LCMAP3()%>" size="45"
					maxlength="35" readonly="readonly">    </TD>
  </TR>
  <TR id="">
    <TD></TD>
    <TD align="left"><INPUT <%if (msg046001.getF01LCMAP4().equals("Y")) out.print("class=\"txtchanged\"");%> name="E01LCMAP4" type="text" value="<%=msg046001.getE01LCMAP4()%>" size="45"
					maxlength="35" readonly="readonly">    </TD>
  </TR>
  <TR id="">
    <TD align="right">Estado: </TD>
    <TD align="left"><INPUT <%if (msg046001.getF01LCMAP5().equals("Y")) out.print("class=\"txtchanged\"");%> name="E01LCMAP5" type="text"
							value="<%=msg046001.getE01LCMAP5()%>" size="4" maxlength="4" readonly="readonly">
      Código Postal
      <INPUT <%if (msg046001.getF01LCMAP6().equals("Y")) out.print("class=\"txtchanged\"");%> name="E01LCMAP6" type="text"
							value="<%=msg046001.getE01LCMAP6()%>" size="11" maxlength="10" readonly="readonly">
      País
      <INPUT <%if (msg046001.getF01LCMAP7().equals("Y")) out.print("class=\"txtchanged\"");%>
							name="E01LCMAP7" type="text"
							value="<%=msg046001.getE01LCMAP7()%>" size="4" maxlength="4" readonly="readonly"></TD>
  </TR>
</TABLE>
<BR>
<TABLE class="tableinfo"  cellspacing="0" cellpadding="2" border="0" width="100%" align="center">
  <TR id="trdark">
    <TD colspan="2" align="center" valign="middle"><FONT size="medium"><B>Beneficiario</B></FONT></TD>
  </TR>
  <TR id="">
    <TD align="right">Número de Cliente o Cuenta: </TD>
    <TD nowrap><SELECT name="E01LCMAF3" disabled>
        <OPTION value=" " <%if (!(msg046001.getE01LCMAF3().equals("C") || msg046001.getE01LCMAF3().equals("A"))) out.print("selected");%>></OPTION>
        <OPTION value="C" <%if (msg046001.getE01LCMAF3().equals("C")) out.print("selected");%>>Cliente</OPTION>
        <OPTION value="A" <%if (msg046001.getE01LCMAF3().equals("A")) out.print("selected");%>>Cuenta</OPTION>
      </SELECT>
        <INPUT <%if (msg046001.getF01LCMBAC().equals("Y")) out.print("class=\"txtchanged\"");%> name="E01LCMBAC" type="text" value="<%=msg046001.getE01LCMBAC()%>" size="12" maxlength="12" readonly="readonly"></TD>
  </TR>
  <TR id="">
    <TD width="35%" align="right">Nombre: </TD>
    <TD align="left"><INPUT <%if (msg046001.getF01LCMBN1().equals("Y")) out.print("class=\"txtchanged\"");%> name="E01LCMBN1" type="text" value="<%=msg046001.getE01LCMBN1()%>" size="45"
					maxlength="35" readonly="readonly">
        <IMG
					src="<%=request.getContextPath()%>/images/Check.gif"
					title="campo obligatorio" border="0"></TD>
  </TR>
  <TR id="">
    <TD align="right">Dirección: </TD>
    <TD align="left"><INPUT <%if (msg046001.getF01LCMBN2().equals("Y")) out.print("class=\"txtchanged\"");%> name="E01LCMBN2" type="text" value="<%=msg046001.getE01LCMBN2()%>" size="45"
					maxlength="35" readonly="readonly">    </TD>
  </TR>
  <TR id="">
    <TD></TD>
    <TD align="left"><INPUT <%if (msg046001.getF01LCMBN3().equals("Y")) out.print("class=\"txtchanged\"");%> name="E01LCMBN3" type="text" value="<%=msg046001.getE01LCMBN3()%>" size="45"
					maxlength="35" readonly="readonly">    </TD>
  </TR>
  <TR id="">
    <TD></TD>
    <TD align="left"><INPUT <%if (msg046001.getF01LCMBN4().equals("Y")) out.print("class=\"txtchanged\"");%> name="E01LCMBN4" type="text" value="<%=msg046001.getE01LCMBN4()%>" size="45"
					maxlength="35" readonly="readonly">    </TD>
  </TR>
  <TR id="">
    <TD align="right">Estado: </TD>
    <TD align="left"><INPUT <%if (msg046001.getF01LCMBN5().equals("Y")) out.print("class=\"txtchanged\"");%> name="E01LCMBN5" type="text"
							value="<%=msg046001.getE01LCMBN5()%>" size="2" maxlength="2" readonly="readonly">
      Código Postal
      <INPUT <%if (msg046001.getF01LCMBN6().equals("Y")) out.print("class=\"txtchanged\"");%>
							name="E01LCMBN6" type="text"
							value="<%=msg046001.getE01LCMBN6()%>" size="11" maxlength="10" readonly="readonly">
      País
      <INPUT <%if (msg046001.getF01LCMBN7().equals("Y")) out.print("class=\"txtchanged\"");%>
							name="E01LCMBN7" type="text"
							value="<%=msg046001.getE01LCMBN7()%>" size="4" maxlength="4" readonly="readonly">
     </TD>
  </TR>
</TABLE>
<BR>
<H4>Información de la Garantia</H4> 
  <TABLE class="tableinfo"  cellspacing="0" cellpadding="2" border="0" width="100%" align="center">
    <TR > 
      <TD nowrap> 
        <TABLE cellpadding="2" cellspacing="0" width="100%" border="0">
          <TBODY>
            <TR id="trdark"> 
            	<TD nowrap width="25%" align="right">Fecha de Emisión: </TD>
            	<TD nowrap width="25%"> 
            		<eibsinput:date name="msg046001" fn_month="E01LCMTDM" fn_day="E01LCMTDD" fn_year="E01LCMTDY" readonly="true" />
				</TD>
            	<TD nowrap width="25%" align="right"> Fecha de Expiración: </TD>
            	<TD nowrap width="27%"> 
            		<eibsinput:date name="msg046001" fn_month="E01LCMADM" fn_day="E01LCMADD" fn_year="E01LCMADY" readonly="true" />
            	</TD>	
          	</TR>  
            <TR id="trclear"> 
		       	<TD nowrap width="16%"align="right">
              Fecha Estimada de Arribo (ETA): </TD>
			  	<TD nowrap width="20%">
            		<eibsinput:date name="msg046001" fn_month="E01LCMLAM" fn_day="E01LCMLAD" fn_year="E01LCMLAY" readonly="true" />
              	</TD>
          	</TR>   
          	<TR id="trdark"> 
			  <TD nowrap width="25%" align="right">Moneda extranjera y Tipo de Cambio: </TD>
              <TD nowrap width="25%"><INPUT type="text" name="E01LCMSMT" size="4" maxlength="4" value="<%= msg046001.getE01LCMSMT().trim()%>" readonly> 
                  <INPUT type="text" name="E01LCMOFX" size="9" maxlength="8" value="<%= msg046001.getE01LCMOFX().trim() %>" readonly>
              </TD>
              <TD nowrap width="25%" align="right">Monto de la Garant&iacute;a: </TD>
              <TD nowrap width="27%">
               <input type="text" name="E01LCMOAM" size="17" 
						maxlength="16" value="<%= msg046001.getE01LCMOAM().trim()%>" readonly
						><IMG src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0"></TD>
          	</TR>   
          	<TR id="trclear">
				<TD nowrap width="25%" align="right">Centro de Costo: </TD>
              	<TD nowrap width="27%">
              	<INPUT type="text" name="E01LCMCCN" size="9" maxlength="8" 
              	value="<%= msg046001.getE01LCMCCN().trim()%>" readonly> 
              	</TD>
              	<TD nowrap width="25%" align="right">Cuenta Cliente Garantía Efectivo: </TD>
              	<TD nowrap width="27%"> 
  			       <INPUT name="E01LCMCCA" type="text" value="<%= msg046001.getE01LCMCCA().trim()%>" size="18" maxlength="16" readonly >
  			  	</TD>
          	</TR>   
		  	<TR id="trdark"> 
            	<TD nowrap width="25%" align="right">Tarifa del Cliente: </TD>
            	<TD nowrap width="25%"> 
					<INPUT type="text" name="E01LCMTAR" size="2" maxlength="2" value="<%= msg046001.getE01LCMTAR().trim()%>" readonly>
             		<IMG src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0"></TD>
             
            	<TD nowrap align="right">Linea de Crédito del Cliente: </TD>
            	<TD nowrap><INPUT type="text" name="E01LCMRBC" size="10" maxlength="9" value="<%= msg046001.getE01LCMRBC().trim()%>" readonly>
                	<INPUT type="text" name="E01LCMCBC" size="4" maxlength="4" value="<%= msg046001.getE01LCMCBC().trim()%>" onKeyPress="enterInteger(event)">
				</TD> 
		  	</TR>   
		  	<TR id="trclear"> 
    			<TD align="right" nowrap>Referencia ACP: </TD>
    			<TD><B>
      				<INPUT type="text" name="E01LCMRF2" size="20" maxlength="16" value="<%=msg046001.getField("E01LCMRF2")%>" readonly>
    				</B>
    			</TD>
		  	</TR>
		  </TBODY>	  
		</TABLE>  
	  </TD>
	</TR> 
  </TABLE>
<BR>

</form>
</body>
</html>
