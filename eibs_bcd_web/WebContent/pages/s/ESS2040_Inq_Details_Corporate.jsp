<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<title>Corporate User</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id="userDetail" class="datapro.eibs.beans.ESS204002Message" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<style TYPE="text/css">
.textchanged
{
	font-family: "Verdana, Arial, Helvetica, sans-serif";
	font-size:8pt;
	color:#01016E;
	background-color:#FFFF80;
}
</style>
<SCRIPT type="text/javascript">
  function Action(op){
     document.forms[0].ACTION.value = op;
     document.forms[0].submit();
  }
</SCRIPT>
</head>

<body bgcolor="#FFFFFF">

<%
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0") ;
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 %>


<h3 align="center">Usuario Moral<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cliente_corporate_new_data, ESS2000" ></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/com.datapro.eibs.internet.JSESS2040" onsubmit="return FieldNotBlank(this)">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
  <INPUT TYPE=HIDDEN NAME="ACTION" VALUE="X">
  <table class="tableinfo">
      <tr >
        <td nowrap>

        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
          <tr id="trdark">
            <td nowrap width="40%" ><div align="right">Entidad :</div></td>
            <td nowrap width="60%" ><div align="left"> <input READONLY type="text" ID="MANDATORY" name="E02EUSUSR" class="<%= userDetail.getF02EUSUSR().equals("Y")?"textchanged":"" %>" size="35" maxlength="10" READONLY value="<%= userDetail.getE02EUSUSR().trim()%>">
                                    <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0"  ></div></td>
          </tr>
          <tr id="teclear">
            <td nowrap width="40%" ><div align="right">Administrador :</div></td>
            <td nowrap width="60%" ><div align="left"> <input READONLY type="text" <% if(userPO.getPurpose().equals("MAINT")){ %> READONLY <% } %> ID="MANDATORY" name="E02EUSENT" class="<%= userDetail.getF02EUSENT().equals("Y")?"textchanged":"" %>" size="35" maxlength="10" value="<%= userDetail.getE02EUSENT().trim()%>"></div></td>
          </tr>
          <tr id="trdark">
            <td nowrap width="40%" ><div align="right"> Password :</div></td>
            <td nowrap width="60%" ><div align="left"> <input READONLY type="password" ID="MANDATORY" name="E02EUSACP" class="<%= userDetail.getF02EUSACP().equals("Y")?"textchanged":"" %>" size="35" maxlength="10" value="<%= userDetail.getE02EUSACP().trim()%>"></div></td>
          </tr>
          <!-- tr id="teclear">
            <td nowrap width="40%" ><div align="right">Administrator User Status :</div></td>
            <td nowrap width="60%" ><div align="left"><SELECT DISABLED NAME="E02EUSSTS">
             <OPTION VALUE="1" <%if (userDetail.getE02EUSSTS().equals("1")) {out.print("selected"); }%>>ACTIVE</OPTION>
             <OPTION VALUE="2" <%if (userDetail.getE02EUSSTS().equals("2")) {out.print("selected"); }%>>INACTIVE</OPTION>
             <OPTION VALUE="3" <%if (userDetail.getE02EUSSTS().equals("3")) {out.print("selected"); }%>>SUSPENDED</OPTION>
             <OPTION VALUE="4" <%if (userDetail.getE02EUSSTS().equals("4")) {out.print("selected"); }%>>PENDING ACTIVATION</OPTION>
             </SELECT></div></td>
          </tr -->
          <tr id="trdark">
            <td nowrap width="40%" ><div align="right">Numero de Cliente :</div></td>
            <td nowrap width="60%" ><div align="left"> <input READONLY type="text" ID="MANDATORY" name="E02EUSCUN" class="<%= userDetail.getF02EUSCUN().equals("Y")?"textchanged":"" %>" size="35" maxlength="9" value="<%= userDetail.getE02EUSCUN().trim()%>">
                                    <a href="javascript:GetCustomerDescId('E02EUSCUN','E02EUSCON','')"></a></div></td>
          </tr>
          <tr id="teclear">
            <td nowrap width="40%" ><div align="right">Cuenta Primaria :</div></td>
            <td nowrap width="60%" ><div align="left"> <input READONLY type="text" ID="MANDATORY" name="E02EUSACC" class="<%= userDetail.getF02EUSACC().equals("Y")?"textchanged":"" %>" size="35" maxlength="9" value="<%= userDetail.getE02EUSACC().trim()%>" onkeypress="enterInteger(event)">
                                    <a href="javascript:GetAccount('E02EUSACC','','','')"></a></div></td>
          </tr>
          <tr id="trdark">
            <td nowrap width="40%" ><div align="right">Maximos Acumulados :</div></td>
            <td nowrap width="60%" ><div align="left"> <SELECT DISABLED NAME="E02EUSMXT" class="<%= userDetail.getF02EUSMXT().equals("Y")?"textchanged":"" %>">
             <OPTION VALUE="1" <%if (userDetail.getE02EUSMXT().equals("1")) {out.print("selected"); }%>>MAXIMO DIARIO</OPTION>
             <OPTION VALUE="2" <%if (userDetail.getE02EUSMXT().equals("2")) {out.print("selected"); }%>>MAXIMO SEMANAL</OPTION>
             </SELECT></div></td>
          </tr>
          <tr id="teclear">
            <td nowrap width="40%" colspan="2" align="center">
				   <TABLE width="70%">
				      <TR>
				         <TD colspan="4" align="center" ><b>PERMISOS</b></TD>
				      </TR>
					  <tr align="center" id="trdark">
					     <TD>Transaccion</TD>
					     <TD>Permite</TD>
					     <TD>Limite por Transaccion</TD>
					     <TD>Limite Acumulado</TD>
					  </tr>
					  <tr align="center">
					     <TD align="right">Transferencia entre Mis Cuentas :</TD>
					     <TD> <SELECT DISABLED NAME="E02EUSTRA" class="<%= userDetail.getF02EUSTRA().equals("Y")?"textchanged":"" %>">
             					 <OPTION VALUE="N" <%if (userDetail.getE02EUSTRA().equals("N")) {out.print("selected"); }%>>NO</OPTION>
                                 <OPTION VALUE="Y" <%if (userDetail.getE02EUSTRA().equals("Y")) {out.print("selected"); }%>>SI</OPTION>
             				  </SELECT>
             			 </TD>
					     <TD><input READONLY type="text" name="E02EUSMAX" size="25" maxlength="13" value="<%= userDetail.getE02EUSMAX().trim()%>"></TD>
					     <TD><input READONLY type="text" name="E02EUSAMX" size="25" maxlength="13" value="<%= userDetail.getE02EUSAMX().trim()%>"></TD>
					  </tr>					  
					  <tr align="center">
					     <TD align="right">Transferencia a Terceros en BNP :</TD>
					     <TD> <SELECT DISABLED NAME="E02EUSTPT" class="<%= userDetail.getF02EUSTPT().equals("Y")?"textchanged":"" %>">
             					 <OPTION VALUE="N" <%if (userDetail.getE02EUSTPT().equals("N")) {out.print("selected"); }%>>NO</OPTION>					     
                                 <OPTION VALUE="Y" <%if (userDetail.getE02EUSTPT().equals("Y")) {out.print("selected"); }%>>SI</OPTION>
             				  </SELECT>
             			 </TD>
					     <TD><input READONLY type="text" name="E02EUSTTL" size="25" maxlength="13" value="<%= userDetail.getE02EUSTTL().trim()%>"></TD>
					     <TD><input READONLY type="text" name="E02EUSTAL" size="25" maxlength="13" value="<%= userDetail.getE02EUSTAL().trim()%>"></TD>
					  </tr>					  
					  <tr align="center">
					     <TD align="right">Transferencia  Internacionales :</TD>
					     <TD> <SELECT DISABLED NAME="E02EUSEXT" class="<%= userDetail.getF02EUSEXT().equals("Y")?"textchanged":"" %>">
             					 <OPTION VALUE="N" <%if (userDetail.getE02EUSEXT().equals("N")) {out.print("selected"); }%>>NO</OPTION>					     
                                 <OPTION VALUE="Y" <%if (userDetail.getE02EUSEXT().equals("Y")) {out.print("selected"); }%>>SI</OPTION>
             				  </SELECT>
             			 </TD>
					     <TD><input READONLY type="text" name="E02EUSETL" size="25" maxlength="13" value="<%= userDetail.getE02EUSETL().trim()%>"></TD>
					     <TD><input READONLY type="text" name="E02EUSEAL" size="25" maxlength="13" value="<%= userDetail.getE02EUSEAL().trim()%>"></TD>
					  </tr>					  
					  <tr align="center">
					     <TD align="right">Permite Pagos a Terceros Otros Bancos :</TD>
					     <TD> <SELECT DISABLED NAME="E02EUSBPA" class="<%= userDetail.getF02EUSBPA().equals("Y")?"textchanged":"" %>">
             					 <OPTION VALUE="N" <%if (userDetail.getE02EUSBPA().equals("N")) {out.print("selected"); }%>>NO</OPTION>					     
                                 <OPTION VALUE="Y" <%if (userDetail.getE02EUSBPA().equals("Y")) {out.print("selected"); }%>>SI</OPTION>
             				  </SELECT>
             			 </TD>
					     <TD><input READONLY type="text" name="E02EUSBPL" size="25" maxlength="13" value="<%= userDetail.getE02EUSBPL().trim()%>"></TD>
					     <TD><input READONLY type="text" name="E02EUSBAA" size="25" maxlength="13" value="<%= userDetail.getE02EUSBAA().trim()%>"></TD>
					  </tr>					  
					  <!--  tr align="center">
					     <TD align="right">Permite Cartas de Credito :</TD>
					     <TD> <SELECT DISABLED NAME="E02EUSLCA" class="<%= userDetail.getF02EUSLCA().equals("Y")?"textchanged":"" %>">
             					 <OPTION VALUE="N" <%if (userDetail.getE02EUSLCA().equals("N")) {out.print("selected"); }%>>NO</OPTION>					     
                                 <OPTION VALUE="Y" <%if (userDetail.getE02EUSLCA().equals("Y")) {out.print("selected"); }%>>SI</OPTION>
             				  </SELECT>
             			 </TD>
					     <TD><input READONLY type="text" name="E02EUSLCL" size="25" maxlength="13" value="<%= userDetail.getE02EUSLCL().trim()%>"></TD>
					     <TD><input READONLY type="text" name="E02EUSLAA" size="25" maxlength="13" value="<%= userDetail.getE02EUSLAA().trim()%>"></TD>
					  </tr -->					  
					  <tr align="center">
					     <TD align="right">Permite Pagos de Préstamos : </TD>
					     <TD> <SELECT DISABLED NAME="E02EUSLNA" class="<%= userDetail.getF02EUSLNA().equals("Y")?"textchanged":"" %>">
             					 <OPTION VALUE="N" <%if (userDetail.getE02EUSLNA().equals("N")) {out.print("selected"); }%>>NO</OPTION>					     
                                 <OPTION VALUE="Y" <%if (userDetail.getE02EUSLNA().equals("Y")) {out.print("selected"); }%>>SI</OPTION>
             				  </SELECT>
             			 </TD>
					     <TD></TD>
					     <TD></TD>
					  </tr>					  
					  <tr align="center">
					     <TD align="right">Permite Pagos a Tarjeta de Credito : </TD>
					     <TD> <SELECT DISABLED NAME="E02EUSCCP" class="<%= userDetail.getF02EUSCCP().equals("Y")?"textchanged":"" %>">
             					 <OPTION VALUE="N" <%if (userDetail.getE02EUSCCP().equals("N")) {out.print("selected"); }%>>NO</OPTION>					     
                                 <OPTION VALUE="Y" <%if (userDetail.getE02EUSCCP().equals("Y")) {out.print("selected"); }%>>SI</OPTION>
             				  </SELECT>
             			 </TD>
					     <TD></TD>
					     <TD></TD>
					  </tr>					  
				   </TABLE>            
            </td>
          </tr>
          <!--  tr id="trdark">
            <td nowrap width="40%" ><div align="right">Operational Password Required :</div></td>
            <td nowrap width="60%" ><div align="left"> <SELECT DISABLED NAME="E02EUSOPR" class="<%= userDetail.getF02EUSOPR().equals("Y")?"textchanged":"" %>">
                                                        <OPTION VALUE="0" <%if (userDetail.getE02EUSOPR().equals("0")) {out.print("selected"); }%>>NO</OPTION>
             					 						<OPTION VALUE="1" <%if (userDetail.getE02EUSOPR().equals("1")) {out.print("selected"); }%>>SI</OPTION>
             				 							 </SELECT>             			               			
	 			</div>				 
            </td>
          </tr>  
          <tr id="teclear">
            <td nowrap width="40%" ><div align="right">Operational Password :</div></td>
            <td nowrap width="60%" ><div align="left"> <input READONLY type="PASSWORD" name="E02EUSOPP" class="<%= userDetail.getF02EUSOPP().equals("Y")?"textchanged":"" %>" size="15" maxlength="10" value="<%= userDetail.getE02EUSOPP() %>"></div></td>
          </tr -->
          <tr id="trdark"> 
            <td nowrap width="40%" ><div align="right">Tarifa Mensual Pagos Multiples :</div></td>
            <td nowrap width="60%" ><div align="left"> <input type="text" name="E01EUSLCL" size="15" maxlength="13" value="<%= userDetail.getE02EUSLCL().trim()%>" READONLY></div></td>
          </tr>
          <tr id="teclear"> 
            <td nowrap width="40%" ><div align="right">Comision  por Transaccion sobre Limite :</div></td>
            <td nowrap width="60%" ><div align="left"> <input type="text" name="E01EUSLAA" size="15" maxlength="13" value="<%= userDetail.getE02EUSLAA().trim()%>" READONLY></div></td>
          </tr>
                    
          <tr id="trdark">
            <td nowrap width="40%" ><div align="right">Persona Responsible :</div></td>
            <td nowrap width="60%" ><div align="left"> <input READONLY type="text" name="E02EUSCON" class="<%= userDetail.getF02EUSCON().equals("Y")?"textchanged":"" %>" size="35" maxlength="30" value="<%= userDetail.getE02EUSCON().trim()%>"></div></td>
          </tr>
          <tr id="teclear">
            <td nowrap width="40%" ><div align="right">E-Mail  :</div></td>
            <td nowrap width="60%" ><div align="left"> <input READONLY type="text" ID="MANDATORY" name="E02EUSIAD" class="<%= userDetail.getF02EUSIAD().equals("Y")?"textchanged":"" %>" size="35" maxlength="45" value="<%= userDetail.getE02EUSIAD().trim()%>">
                                    <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0"  ></div></td>
          </tr>
        </table>
        </td>
      </tr>
    </table>
  <table border="0" width="95%">
    <tr align="center">
       <td><INPUT id="EIBSBTN" type=BUTTON name="Submit" value="Aceptar" onclick="JavaScript:windows.close()"></td>
    </tr>
  </table>
</form>
</body>
</html>
