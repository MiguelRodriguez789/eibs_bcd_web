<HTML>
<HEAD>
<TITLE>Negociación de Cartas de Crédito</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<LINK HREF="<%=request.getContextPath()%>/pages/style.css" REL="stylesheet">

<SCRIPT type="text/javascript" SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<jsp:useBean id="msg01" class="datapro.eibs.beans.ELC020001Message" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />


<%if (!error.getERRNUM().equals("0"))
{
	error.setERRNUM("0");
	out.println("<SCRIPT Language=\"Javascript\">");
	out.println("       showErrors()");
	out.println("</SCRIPT>");
}
%>

</HEAD>

<BODY BGCOLOR="#FFFFFF">

<H3 ALIGN="center">Historial de Documentos Recibidos <IMG SRC="<%=request.getContextPath()%>/images/e_ibs.gif" ALIGN="left"
	NAME="EIBS_GIF" title="lc_doc_info_readonly_hist.jsp, ELC0220"></H3>
<HR SIZE="4">
<BR>


<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0200">
<INPUT TYPE="HIDDEN" NAME="SCREEN" VALUE="5">
<INPUT TYPE="HIDDEN" NAME="E01LCIDNO" VALUE="<%=msg01.getE01LCIDNO().trim()%>">

<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0" >
    <tr id="trdark">
      <td width="18%" align="right"><b>Tipo de Operacion :</b></td>
      <td width="18%"><input name="E01LCMBNK" type="text" id="E02LCMBNK" value="<%= userPO.getHeader1() %>" size="30" maxlength="30" readonly></td>
      <td height="18%" align="right"><b>Operador  :</b></td>
      <td width="18%"><input type="text" name="E02ACC" size="30" maxlength="30" value="<%= userPO.getHeader2() %>" readonly></td>
      <td height="18%" align="right"><b>Fecha y Hora  :</b></td>
      <td width="18%"><input type="text" name="E02ACC" size="20" maxlength="12" value="<%= userPO.getHeader3() %>" readonly></td>
    </tr>

    <tr id="trdark">
      <td width="18%" align="right"><b>Aprobación :</b></td>
      <td width="18%"><input name="E01LCMBNK" type="text" id="E01LCMBNK" value="<%= userPO.getHeader4() %>" size="30" maxlength="30" readonly></td>
      <td height="18%" align="right"><b>Supervisor  :</b></td>
      <td width="18%"><input type="text" name="E02ACC" size="30" maxlength="30" value="<%= userPO.getHeader5() %>" readonly></td>
      <td height="18%" align="right"><b>Fecha y Hora  :</b></td>
      <td width="18%"><input type="text" name="E02ACC" size="20" maxlength="12" value="<%= userPO.getHeader6() %>" readonly></td>
    </tr>
  </table>
  <BR>
<TABLE width="100%" border="0" class="tableinfo" id="trdark" align="center">
  <TR>
    <TD nowrap align="right"><B>Banco : </B></TD>
    <TD nowrap width="188"><INPUT name="E01LCMBNK" value="<%=msg01.getE01LCMBNK()%>" size="4" maxlength="4" readonly></TD>
    <TD nowrap colspan="2" align="right" width="271"><B>N&uacute;mero de Carta de Cr&eacute;dito : </B></TD>
    <TD nowrap><INPUT name="E01LCMACC" value="<%=msg01.getE01LCMACC()%>" size="15" readonly></TD>
  </TR>
  <TR>
    <TD nowrap align="right"><B>Nuestra Referencia : </B></TD>
    <TD nowrap colspan="2" width="271"><INPUT name="E01LCMORF" value="<%=msg01.getE01LCMORF()%>" size="18" maxlength="18" readonly></TD>
    <TD nowrap align="right"><B>Nombre del Cliente : </B></TD>
    <TD nowrap><INPUT name="E01CUSNA1" value="<%=msg01.getE01CUSNA1()%>" size="46" maxlength="46" readonly></TD>
  </TR>
  <TR>
    <TD nowrap align="right"><B>Referencia del Otro Banco : </B></TD>
    <TD nowrap colspan="2" width="271"><INPUT name="E01LCMTRF" value="<%=msg01.getE01LCMTRF()%>" size="18" maxlength="18" readonly></TD>
    <TD nowrap align="right"><B>Nombre del Beneficiario : </B></TD>
    <TD nowrap><INPUT name="E01LCMBN1" value="<%=msg01.getE01LCMBN1()%>" size="46" maxlength="40" readonly></TD>
  </TR>
</TABLE>

<BR>
<TABLE class="tableinfo" id="trclear" cellspacing="0" cellpadding="2" width="100%" border="0" > 
    <TR id="trdark">
	    <TD nowrap align="right">Fecha y Hora Recibidos: </TD>
		<TD nowrap align="left">
			<INPUT name="E01LCIRDM" value="<%=msg01.getE01LCIRDM()%>" size="2" maxlength="2" readonly="readonly"> 
			<INPUT name="E01LCIRDD" value="<%=msg01.getE01LCIRDD()%>" size="2" maxlength="2" readonly="readonly"> 
			<INPUT name="E01LCIRDY" value="<%=msg01.getE01LCIRDY()%>" size="2" maxlength="2" readonly="readonly"> 
			<INPUT name="E01LCIRTI" value="<%=msg01.getE01LCIRTI()%>" size="7" maxlength="6" readonly="readonly"></TD>
		<TD align="right" nowrap>Moneda e Importe: </TD>
		<TD nowrap><INPUT name="E01LCICCY" value="<%=msg01.getE01LCICCY()%>" size="3" maxlength="3" readonly="readonly">
			<INPUT name="E01LCIAMN" value="<%=msg01.getE01LCIAMN()%>" size="15" maxlength="15" readonly="readonly">
			<IMG src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0"></TD>
	</TR>
	<TR>
		<TD align="right" nowrap>Tipo de Transaccion: </TD>
		<TD nowrap align="left">
		    <SELECT name="E01LCINTY" disabled>
			   	<OPTION>&nbsp;</OPTION>
				<OPTION value="1" <%if(msg01.getE01LCINTY().equals("1")) out.print("selected");%>>Pago a la Vista</OPTION>
				<OPTION value="2" <%if(msg01.getE01LCINTY().equals("2")) out.print("selected");%>>Aceptacion</OPTION>
				<OPTION value="3" <%if(msg01.getE01LCINTY().equals("3")) out.print("selected");%>>Aceptacion Descontada</OPTION>
				<OPTION value="4" <%if(msg01.getE01LCINTY().equals("4")) out.print("selected");%>>Pago Diferido</OPTION>
				<OPTION value="5" <%if(msg01.getE01LCINTY().equals("5")) out.print("selected");%>>Refinanciacion</OPTION>
				<OPTION value="M" <%if(msg01.getE01LCINTY().equals("M")) out.print("selected");%>>Pago Mixto</OPTION>
				<OPTION value="N" <%if(msg01.getE01LCINTY().equals("N")) out.print("selected");%>>Negociacion</OPTION>
			</SELECT>
				<IMG src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0"></TD>
		<TD nowrap align="right">Referencia del Banco Presentador: </TD>
		<TD nowrap><INPUT name="E01LCIBRE" value="<%=msg01.getE01LCIBRE()%>" size="16, 18" readonly="readonly"></TD>
	</TR>
	<TR id="trdark">
		<TD nowrap align="right">Documentos Asignados a: </TD>
		<TD nowrap><INPUT name="E01LCIAST" value="<%=msg01.getE01LCIAST()%>" size="40" maxlength="30" readonly="readonly"></TD>
		<TD nowrap align="right">Estado / Situaci&oacute;n: </TD>
		<TD nowrap>
		    <SELECT name="E01LCISTA" disabled>
                <OPTION value=" "></OPTION>
                <OPTION value="D" <% if(msg01.getE01LCISTA().equals("D")) out.print("selected");%>>Documentos con Discrepancias</OPTION>
                <OPTION value="A" <% if(msg01.getE01LCISTA().equals("A")) out.print("selected");%>>Discrepancia Autorizada</OPTION>
                <OPTION value="R" <% if(msg01.getE01LCISTA().equals("R")) out.print("selected");%>>Discrepancia Denegada</OPTION>
                <OPTION value="O" <% if(msg01.getE01LCISTA().equals("O")) out.print("selected");%>>Documentos en Orden</OPTION>
            </SELECT></TD>
	</TR>
	<TR id="trclear">
		<TD nowrap align="right">Aviso sin Documentos: </TD>
		<TD nowrap colspan="3">
		    <SELECT name="E01LCINDF" disabled>
                <OPTION value=" "></OPTION>
                <OPTION value="D" <% if(msg01.getE01LCINDF().equals("D")) out.print("selected");%>>Aviso de Disrepancias sin Documentos</OPTION>
                <OPTION value="A" <% if(msg01.getE01LCINDF().equals("A")) out.print("selected");%>>Aviso de Negociacion sin Documentos</OPTION>
            </SELECT></TD>
	</TR>
</TABLE>

<BR>
<TABLE width="100%" border="0" class="tableinfo" id="trclear">
	<TR id="trdark">
    	<TD colspan="4" align="center"><FONT size="medium"><B>Generación de Mensaje Swift</B></FONT></TD>
  	</TR>
	<tr id="trclear">
	  	<TD align="right" nowrap>Mensaje Swift: </TD>
		<TD align="left" nowrap>
		  	<SELECT name="E01LCISMT" disabled>
		  		<OPTION value="" <%= msg01.getE01LCISMT().equals("")?"selected":"" %>>NO</OPTION>
               	<OPTION value="734" <%= msg01.getE01LCISMT().equals("734")?"selected":"" %>>MT734</OPTION>
               	<OPTION value="750" <%= msg01.getE01LCISMT().equals("750")?"selected":"" %>>MT750</OPTION>
               	<OPTION value="752" <%= msg01.getE01LCISMT().equals("752")?"selected":"" %>>MT752</OPTION>
           	</SELECT>
    	</TD>
	    <TD align="right" nowrap>Banco Receptor: </TD>
	    <TD align="left" nowrap>
	    	<INPUT type="text" name="E01LCIRID" size="14" maxlength="12" value="<%= msg01.getE01LCIRID()%>" readonly="readonly">
      		 
   		</TD>
	</Tr>	
	<tr id="trclear">
	    <TD align="right" nowrap>Fecha de Aviso Discrepancia: </TD>
		<TD nowrap>
			<INPUT name="E01LCIDAM" value="<%=msg01.getE01LCIDAM()%>" size="2" maxlength="2" readonly="readonly">  
			<INPUT name="E01LCIDAD" value="<%=msg01.getE01LCIDAD()%>" size="2" maxlength="2" readonly="readonly">  
			<INPUT name="E01LCIDAY" value="<%=msg01.getE01LCIDAY()%>" size="2" maxlength="2" readonly="readonly"> 
			
		</TD>
	    <TD align="right" nowrap>Monto Total del Pago: </TD>
		<TD nowrap>
		  	<INPUT name="E01LCIPAM" value="<%=msg01.getE01LCIPAM()%>" size="15" maxlength="15" readonly="readonly">
		</TD>
	</Tr>	
	<tr id="trclear">
	    <TD align="right" nowrap>Fecha Valor: </TD>
		<TD nowrap>
			<INPUT name="E01LCIVDM" value="<%=msg01.getE01LCIVDM()%>" size="2" maxlength="2" readonly="readonly">  
			<INPUT name="E01LCIVDD" value="<%=msg01.getE01LCIVDD()%>" size="2" maxlength="2" readonly="readonly">  
			<INPUT name="E01LCIVDY" value="<%=msg01.getE01LCIVDY()%>" size="2" maxlength="2" readonly="readonly"> 
			
		</TD>
	  	<TD align="right" nowrap>Manejo de Documentos: </TD>
		<TD align="left" nowrap>
		  	<SELECT name="E01LCIDDF" disabled>
		  		<OPTION value="" <%= msg01.getE01LCIDDF().equals("")?"selected":"" %>></OPTION>
               	<OPTION value="H" <%= msg01.getE01LCIDDF().equals("H")?"selected":"" %>>Retenidos a su Disposición</OPTION>
               	<OPTION value="N" <%= msg01.getE01LCIDDF().equals("N")?"selected":"" %>>Retenidos en Espera de Instrucciones</OPTION>
               	<OPTION value="P" <%= msg01.getE01LCIDDF().equals("P")?"selected":"" %>>De Acuerdo a Instrucciones Previas</OPTION>
               	<OPTION value="R" <%= msg01.getE01LCIDDF().equals("R")?"selected":"" %>>Devueltos / A Devolver</OPTION>
           	</SELECT>
    	</TD>
	</Tr>	
	<tr id="trclear">
	  	<TD align="right" nowrap>Autorización / Acción: </TD>
		<TD align="left" nowrap>
		  	<SELECT name="E01LCIAUF" disabled>
		  		<OPTION value="" <%= msg01.getE01LCIAUF().equals("")?"selected":"" %>></OPTION>
               	<OPTION value="A" <%= msg01.getE01LCIAUF().equals("A")?"selected":"" %>>Aceptar</OPTION>
               	<OPTION value="D" <%= msg01.getE01LCIAUF().equals("D")?"selected":"" %>>Debitar Nuestra Cuenta</OPTION>
               	<OPTION value="N" <%= msg01.getE01LCIAUF().equals("N")?"selected":"" %>>Negociar</OPTION>
               	<OPTION value="R" <%= msg01.getE01LCIAUF().equals("R")?"selected":"" %>>Solicitar Reembolso</OPTION>
               	<OPTION value="P" <%= msg01.getE01LCIAUF().equals("P")?"selected":"" %>>Remitir Fondos</OPTION>
               	<OPTION value="S" <%= msg01.getE01LCIAUF().equals("S")?"selected":"" %>>Instrucciones Especiales</OPTION>
           	</SELECT>
    	</TD>
	    <TD align="right" nowrap></TD>
	    <TD align="right" nowrap></TD>
	</Tr>	
</TABLE>
<BR>

<TABLE width="70%" border="0" class="tableinfo">
  <TR id="trdark">
		<TD colspan="6" align="center"><B><FONT size="medium">Documentos Recibidos</FONT>
		</B></TD>
	</TR>
  <TR id="trclear">
    <TD align="center">
    <TABLE border="0" class="tableinfo">
    <TR align="center">
    <TD width="8%" align="center"></TD>
		<TD align="center" width="320"></TD>
		<TD colspan="2" align="center">Requeridos</TD><TD colspan="2" align="center">Recibidos</TD></TR>
	<TR align="center">
		<TD align="center">Cod. Documento</TD>
		<TD align="center" width="320">Descripcion</TD>
		<TD align="center" width="84">Originales</TD>
		<TD align="center" width="85">Copias</TD>
		<TD align="center" width="82">Originales</TD>
		<TD align="center" width="85">Copias</TD>
	</TR>
	<TR align="center">
      <TD align="center"><INPUT type="text" name="E01LCMDD1" value="<%=msg01.getE01LCMDD1()%>" size="4" maxlength="5" readonly></TD>
	  <TD align="center" width="320"><INPUT type="text" name="E01LCMDS1" value="<%=msg01.getE01LCMDS1()%>" size="35" maxlength="35" readonly></TD>
	  <TD align="center" width="84"><INPUT type="text" name="E01LCMDO1" value="<%=msg01.getE01LCMDO1()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01LCMDC1" value="<%=msg01.getE01LCMDC1()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="82"><INPUT type="text" name="E01RCVDO1" value="<%=msg01.getE01RCVDO1()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01RCVDC1" value="<%=msg01.getE01RCVDC1()%>" size="2" maxlength="1" readonly></TD>
	</TR>
	<TR align="center">
      <TD align="center"><INPUT type="text" name="E01LCMDD2" value="<%=msg01.getE01LCMDD2()%>" size="4" maxlength="5" readonly></TD>
	  <TD align="center" width="320"><INPUT type="text" name="E01LCMDS2" value="<%=msg01.getE01LCMDS2()%>" size="35" maxlength="35" readonly></TD>
	  <TD align="center" width="84"><INPUT type="text" name="E01LCMDO2" value="<%=msg01.getE01LCMDO2()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01LCMDC2" value="<%=msg01.getE01LCMDC2()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="82"><INPUT type="text" name="E01RCVDO2" value="<%=msg01.getE01RCVDO2()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01RCVDC2" value="<%=msg01.getE01RCVDC2()%>" size="2" maxlength="1" readonly></TD>
	</TR>
	<TR align="center">
      <TD align="center"><INPUT type="text" name="E01LCMDD3" value="<%=msg01.getE01LCMDD3()%>" size="4" maxlength="5" readonly></TD>
	  <TD align="center" width="320"><INPUT type="text" name="E01LCMDS3" value="<%=msg01.getE01LCMDS3()%>" size="35" maxlength="35" readonly></TD>
	  <TD align="center" width="84"><INPUT type="text" name="E01LCMDO3" value="<%=msg01.getE01LCMDO3()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01LCMDC3" value="<%=msg01.getE01LCMDC3()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="82"><INPUT type="text" name="E01RCVDO3" value="<%=msg01.getE01RCVDO3()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01RCVDC3" value="<%=msg01.getE01RCVDC3()%>" size="2" maxlength="1" readonly></TD>
	</TR>
	<TR align="center">
      <TD align="center"><INPUT type="text" name="E01LCMDD4" value="<%=msg01.getE01LCMDD4()%>" size="4" maxlength="5" readonly></TD>
	  <TD align="center" width="320"><INPUT type="text" name="E01LCMDS4" value="<%=msg01.getE01LCMDS4()%>" size="35" maxlength="35" readonly></TD>
	  <TD align="center" width="84"><INPUT type="text" name="E01LCMDO4" value="<%=msg01.getE01LCMDO4()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01LCMDC4" value="<%=msg01.getE01LCMDC4()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="82"><INPUT type="text" name="E01RCVDO4" value="<%=msg01.getE01RCVDO4()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01RCVDC4" value="<%=msg01.getE01RCVDC4()%>" size="2" maxlength="1" readonly></TD>
	</TR>
	<TR align="center">
      <TD align="center"><INPUT type="text" name="E01LCMDD5" value="<%=msg01.getE01LCMDD5()%>" size="4" maxlength="5" readonly></TD>
	  <TD align="center" width="320"><INPUT type="text" name="E01LCMDS5" value="<%=msg01.getE01LCMDS5()%>" size="35" maxlength="35" readonly></TD>
	  <TD align="center" width="84"><INPUT type="text" name="E01LCMDO5" value="<%=msg01.getE01LCMDO5()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01LCMDC5" value="<%=msg01.getE01LCMDC5()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="82"><INPUT type="text" name="E01RCVDO5" value="<%=msg01.getE01RCVDO5()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01RCVDC5" value="<%=msg01.getE01RCVDC5()%>" size="2" maxlength="1" readonly></TD>
	</TR>
	<TR align="center">
      <TD align="center"><INPUT type="text" name="E01LCMDD6" value="<%=msg01.getE01LCMDD6()%>" size="4" maxlength="5" readonly></TD>
	  <TD align="center" width="320"><INPUT type="text" name="E01LCMDS6" value="<%=msg01.getE01LCMDS6()%>" size="35" maxlength="35" readonly></TD>
	  <TD align="center" width="84"><INPUT type="text" name="E01LCMDO6" value="<%=msg01.getE01LCMDO6()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01LCMDC6" value="<%=msg01.getE01LCMDC6()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="82"><INPUT type="text" name="E01RCVDO6" value="<%=msg01.getE01RCVDO6()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01RCVDC6" value="<%=msg01.getE01RCVDC6()%>" size="2" maxlength="1" readonly></TD>	  
	</TR>
	<TR align="center">
      <TD align="center"><INPUT type="text" name="E01LCMDD7" value="<%=msg01.getE01LCMDD7()%>" size="4" maxlength="5" readonly></TD>
	  <TD align="center" width="320"><INPUT type="text" name="E01LCMDS7" value="<%=msg01.getE01LCMDS7()%>" size="35" maxlength="35" readonly></TD>
	  <TD align="center" width="84"><INPUT type="text" name="E01LCMDO7" value="<%=msg01.getE01LCMDO7()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01LCMDC7" value="<%=msg01.getE01LCMDC7()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="82"><INPUT type="text" name="E01RCVDO7" value="<%=msg01.getE01RCVDO7()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01RCVDC7" value="<%=msg01.getE01RCVDC7()%>" size="2" maxlength="1" readonly></TD>	  
	</TR>
	<TR align="center">
      <TD align="center"><INPUT type="text" name="E01LCMDD8" value="<%=msg01.getE01LCMDD8()%>" size="4" maxlength="5" readonly></TD>
	  <TD align="center" width="320"><INPUT type="text" name="E01LCMDS8" value="<%=msg01.getE01LCMDS8()%>" size="35" maxlength="35" readonly></TD>
	  <TD align="center" width="84"><INPUT type="text" name="E01LCMDO8" value="<%=msg01.getE01LCMDO8()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01LCMDC8" value="<%=msg01.getE01LCMDC8()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="82"><INPUT type="text" name="E01RCVDO8" value="<%=msg01.getE01RCVDO8()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01RCVDC8" value="<%=msg01.getE01RCVDC8()%>" size="2" maxlength="1" readonly></TD>	  
	</TR>
	<TR align="center">
      <TD align="center"><INPUT type="text" name="E01LCMDD9" value="<%=msg01.getE01LCMDD9()%>" size="4" maxlength="5" readonly></TD>
	  <TD align="center" width="320"><INPUT type="text" name="E01LCMDS9" value="<%=msg01.getE01LCMDS9()%>" size="35" maxlength="35" readonly></TD>
	  <TD align="center" width="84"><INPUT type="text" name="E01LCMDO9" value="<%=msg01.getE01LCMDO9()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01LCMDC9" value="<%=msg01.getE01LCMDC9()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="82"><INPUT type="text" name="E01RCVDO9" value="<%=msg01.getE01RCVDO9()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01RCVDC9" value="<%=msg01.getE01RCVDC9()%>" size="2" maxlength="1" readonly></TD>	  
	</TR>
	</TABLE>
	</TD>
	</TR>					
</TABLE>

<BR>

<TABLE width="100%" border="0" class="tableinfo">
  <TR id="trdark">
    <TD colspan="2" align="center"><B><FONT size="medium">Banco Autorizado a Pagar / Negociar</FONT> </B></TD>
  </TR>
  <TR>
    <TD width="40%" align="right">Codigo Swift: </TD>
    <TD width="60%"><INPUT name="E01LCINBI" value="<%=msg01.getE01LCINBI()%>" size="12" readonly="readonly"></TD>
  </TR>
  <TR>
    <TD align="right">Nombre: </TD>
    <TD><INPUT name="E01LCINB1" value="<%=msg01.getE01LCINB1()%>" maxlength="35" size="37" readonly="readonly"></TD>
  </TR>
  <TR>
    <TD align="right">Direcci&oacute;n: </TD>
    <TD><INPUT name="E01LCINB2" value="<%=msg01.getE01LCINB2()%>" maxlength="35" size="37" readonly="readonly"></TD>
  </TR>
  <TR>
    <TD align="right">&nbsp;</TD>
    <TD><INPUT name="E01LCINB3" value="<%=msg01.getE01LCINB3()%>" maxlength="35" size="37" readonly="readonly"></TD>
  </TR>
  <TR>
    <TD align="right">&nbsp;</TD>
    <TD><INPUT name="E01LCINB4" value="<%=msg01.getE01LCINB4()%>" size="37" maxlength="35" readonly="readonly"></TD>
  </TR>
  <TR>
    <TD align="right">Estado: </TD>
    <TD><INPUT name="E01LCINB5" value="<%=msg01.getE01LCINB5()%>" maxlength="2" size="2" readonly="readonly"> 
    C&oacute;digo Postal 
	    <INPUT name="E01LCINB6" value="<%=msg01.getE01LCINB6()%>" size="10" maxlength="10" readonly="readonly">&nbsp; 
	Pais  
	    <INPUT name="E01LCINB7" value="<%=msg01.getE01LCINB7()%>" maxlength="4" size="4" readonly="readonly"></TD>
  </TR>
</TABLE>

<BR>
<TABLE width="100%" border="0" class="tableinfo" id="trclear">
  <TR id="trdark">
    <TD colspan="2" align="center"><FONT size="medium"><B>Banco Reembolsador</B></FONT></TD>
  </TR>
  <TR>
    <TD width="40%" align="right">Codigo Swift: </TD>
    <TD width="60%"><INPUT name="E01LCIRBI" value="<%=msg01.getE01LCIRBI()%>" size="12" readonly="readonly"></TD>
  </TR>
  <TR>
    <TD align="right">Nombre: </TD>
    <TD><INPUT name="E01LCIRB1" value="<%=msg01.getE01LCIRB1()%>" maxlength="35" size="37" readonly="readonly"></TD>
  </TR>
  <TR>
    <TD align="right">Direcci&oacute;n: </TD>
    <TD><INPUT name="E01LCIRB2" value="<%=msg01.getE01LCIRB2()%>" maxlength="35" size="37" readonly="readonly"></TD>
  </TR>
  <TR>
    <TD align="right">&nbsp;</TD>
    <TD><INPUT name="E01LCIRB3" value="<%=msg01.getE01LCIRB3()%>" maxlength="35" size="37" readonly="readonly"></TD>
  </TR>
  <TR>
    <TD align="right">&nbsp;</TD>
    <TD><INPUT name="E01LCIRB4" value="<%=msg01.getE01LCIRB4()%>" size="25" maxlength="37" readonly="readonly"></TD>
  </TR>
  <TR>
    <TD align="right">Estado: </TD>
    <TD><INPUT name="E01LCIRB5" value="<%=msg01.getE01LCIRB5()%>" maxlength="2" size="2" readonly="readonly"> 
    C&oacute;digo Postal  
        <INPUT name="E01LCIRB6" value="<%=msg01.getE01LCIRB6()%>" size="10" readonly="readonly">&nbsp;
    Pais 
        <INPUT name="E01LCIRB7" value="<%=msg01.getE01LCIRB7()%>" size="4" readonly="readonly"></TD>
  </TR>
</TABLE>
<BR>
<TABLE width="100%" border="0" class="tableinfo" id="trclear">
  <TR id="trdark">
    <TD colspan="2" align="center"><FONT size="medium"><B>Banco del Beneficiario</B></FONT></TD>
  </TR>
  <TR>
    <TD width="40%" align="right">Codigo Swift: </TD>
    <TD width="60%"><INPUT name="E01LCIBBI" value="<%=msg01.getE01LCIBBI()%>" size="12" readonly="readonly"></TD>
  </TR>
  <TR>
    <TD align="right">Nombre: </TD>
    <TD><INPUT name="E01LCIBB1" value="<%=msg01.getE01LCIBB1()%>" maxlength="35" size="37" readonly="readonly"></TD>
  </TR>
  <TR>
    <TD align="right">Direcci&oacute;n: </TD>
    <TD><INPUT name="E01LCIBB2" value="<%=msg01.getE01LCIBB2()%>" maxlength="35" size="37" readonly="readonly"></TD>
  </TR>
  <TR>
    <TD align="right">&nbsp;</TD>
    <TD><INPUT name="E01LCIBB3" value="<%=msg01.getE01LCIBB3()%>" maxlength="35" size="37" readonly="readonly"></TD>
  </TR>
  <TR>
    <TD align="right">&nbsp;</TD>
    <TD><INPUT name="E01LCIBB4" value="<%=msg01.getE01LCIBB4()%>" size="25" maxlength="37" readonly="readonly"></TD>
  </TR>
  <TR>
    <TD align="right">Estado: </TD>
    <TD><INPUT name="E01LCIBB5" value="<%=msg01.getE01LCIBB5()%>" maxlength="2" size="2" readonly="readonly"> 
    C&oacute;digo Postal  
        <INPUT name="E01LCIBB6" value="<%=msg01.getE01LCIBB6()%>" size="10" readonly="readonly">&nbsp;
    Pais  
        <INPUT name="E01LCIBB7" value="<%=msg01.getE01LCIBB7()%>" size="4" readonly="readonly"></TD>
  </TR>
</TABLE>
<BR>

</FORM>

</BODY>
</HTML>
