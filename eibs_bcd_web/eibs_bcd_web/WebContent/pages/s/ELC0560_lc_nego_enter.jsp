<%@page import="datapro.eibs.master.Util"%>
<HTML>
<HEAD>
<TITLE>Negociación de Cartas de Crédito</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<LINK HREF="<%=request.getContextPath()%>/pages/style.css" REL="stylesheet">

<SCRIPT type="text/javascript" SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<jsp:useBean id= "msg01" class= "datapro.eibs.beans.ELC056001Message" scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>


<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0"); 
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 } 
userPO.setPrevPage("ELC0560_lc_nego_enter.jsp");
%>

</HEAD>

<BODY BGCOLOR="#FFFFFF">

<H3 ALIGN="center">Pago/Negociaci&oacute;n de Cartas de Cr&eacute;dito
<IMG SRC="<%=request.getContextPath()%>/images/e_ibs.gif" ALIGN="left"
	NAME="EIBS_GIF" title="ELC0560_lc_nego_enter.jsp"></H3>
<HR SIZE="4">


<FORM METHOD="post" ACTION="<%=userPO.getRedirect()%>">
<INPUT TYPE="HIDDEN" NAME="SCREEN" VALUE="2">
<INPUT TYPE="HIDDEN" NAME="H01OPECOD" VALUE="0001">
<DIV ALIGN="center">
<TABLE CLASS="tbenter" WIDTH="100%" BORDER="0">
	
		<TR>
			<TD HEIGHT="139">
			<TABLE CLASS="tbenter" ALIGN="center">
				
					<TR>
						<TD>
						<DIV ALIGN="right">N&uacute;mero de Carta de Cr&eacute;dito:</DIV>
						</TD>
						<TD>
						<DIV><INPUT TYPE="text" NAME="E01LCRNUM" SIZE="13" MAXLENGTH="12" value="<%=msg01.getE01LCRNUM() %>" onkeypress="enterInteger(event)">
						<A HREF="javascript:GetAccount('E01LCRNUM','','LC','')"> <IMG SRC="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" BORDER="0"></A></DIV>
						</TD>
					</TR>
					<TR>
						<TD>
						<DIV ALIGN="right">Tipo de Negociación:</DIV>
						</TD>
						<TD>
						<DIV><SELECT NAME="E01OPCODE">
							<OPTION VALUE="1">Pago a la Vista</OPTION>
							<OPTION VALUE="2" <% if(msg01.getE01OPCODE().equals("2")) out.print("selected");%>>Aceptación</OPTION>
							<OPTION VALUE="3" <% if(msg01.getE01OPCODE().equals("3")) out.print("selected");%>>Aceptación Descontada</OPTION>
							<OPTION VALUE="4" <% if(msg01.getE01OPCODE().equals("4")) out.print("selected");%>>Pago Diferido</OPTION>
							<OPTION VALUE="5" <% if(msg01.getE01OPCODE().equals("5")) out.print("selected");%>>Refinanciación</OPTION>
							<OPTION VALUE="6" <% if(msg01.getE01OPCODE().equals("6")) out.print("selected");%>>Cancelación</OPTION>
							<OPTION VALUE="9" <% if(msg01.getE01OPCODE().equals("9")) out.print("selected");%>>Solo Commisiones</OPTION>
						</SELECT></DIV>
						</TD>
					</TR>
					<TR>
						<TD>
						<DIV ALIGN="right">Monto:</DIV>
						</TD>
						<TD>
						<DIV><INPUT TYPE="text" NAME="E01DRWAMN" SIZE="20" MAXLENGTH="15" value="<%=Util.formatCCY(msg01.getE01DRWAMN())%>" ONKEYPRESS="enterDecimal(event)"><IMG
							src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0"></DIV>
						</TD>
					</TR>
					<TR>
						<TD>
						<DIV ALIGN="right">Generar Mensaje SWIFT:</DIV>
						</TD>
						<TD>
						<DIV>
							<INPUT type="radio" name="E01SWFMSG" value="Y" <%=msg01.getE01SWFMSG().equals("Y") ? "checked" : "" %>>Si
						    <INPUT type="radio" name="E01SWFMSG" value="N" <%=!msg01.getE01SWFMSG().equals("Y") ? "checked" : "" %>>No
						</DIV>
						</TD>    
					</TR>					
					<TR>
						<TD>
						<DIV ALIGN="right">Mensaje SWIFT:</DIV>
						</TD>
						<TD>
						
							<SELECT name="E01SWFMTP">
				  				<OPTION value=""></OPTION>
                		      	<OPTION value="752" <%=msg01.getE01SWFMTP().equals("752") ? "selected" : "" %>>MT752</OPTION>
        		              	<OPTION value="754" <%=msg01.getE01SWFMTP().equals("754") ? "selected" : "" %>>MT754</OPTION>
        		              	<OPTION value="756" <%=msg01.getE01SWFMTP().equals("756") ? "selected" : "" %>>MT756</OPTION>
        		              	<OPTION value="732" <%=msg01.getE01SWFMTP().equals("732") ? "selected" : "" %>>MT732</OPTION>
        		              	<OPTION value="742" <%=msg01.getE01SWFMTP().equals("742") ? "selected" : "" %>>MT742</OPTION>
		                  	</SELECT>
						</TD>
					</TR>				
					<TR>
						<TD>
						<DIV ALIGN="right">Banco Receptor:</DIV>
						</TD>
						<TD>
						<DIV>
							<INPUT type="text" name="E01SWFRCV" size="14" maxlength="12" value="<%=msg01.getE01SWFRCV()%>">
								<A href="javascript:GetSwiftId('E01SWFRCV')"> 
								<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"  border="0"></A> 
						</DIV>
						</TD>		
					</TR>									
						
					<TR>
						<TD COLSPAN="2">
						<DIV ALIGN="center"><BR>
						<H4 style="text-align:center">
							<INPUT type="checkbox" name="H01FLGWK2" value="A" <% if(msg01.getH01FLGWK2().equals("A")){ out.print("checked");} %>>
      						Aceptar con Advertencias</H4>
						<INPUT ID="EIBSBTN" TYPE="submit" NAME="Submit" VALUE="Enviar"></DIV>
						</TD>
					</TR>
				
			</TABLE>
			</TD>
		</TR>
	
</TABLE>

</DIV>

</FORM>

</BODY>
</HTML>
