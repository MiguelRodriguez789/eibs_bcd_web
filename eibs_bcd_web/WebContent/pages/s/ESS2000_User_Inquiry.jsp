<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<title>Corporate User</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id="cusdata" class="datapro.eibs.beans.ESS200001Message" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script type="text/javascript">
  function SelCuentaCli(CampoDest,Campo1,Campo2,Campo3,Cliente){
     if(Cliente =="" || Cliente=="0"){
        alert("No. de Cliente debe ser Seleccionado");
        return;
     }
     GetAccByClient(CampoDest,'','','',document.forms[0].E01EUSCUN.value)
  }
  
  function GeneratePassword(){
     if(confirm("Esta seguro que desea generar una nueva contrasena para este usuario")){
        //page = "${pageContext.request.contextPath}/servlet/com.datapro.eibs.internet.JSESS2000?SCREEN=425&E01EUSUSR="+document.forms[0].E01EUSUSR.value;
        page = "${pageContext.request.contextPath}/pages/s/ESS2000_personal_password_generated.jsp?E01EUSUSR="+document.forms[0].E01EUSUSR.value;
        //page = "${pageContext.request.contextPath}/servlet/com.datapro.eibs.internet.SilentPrintServlet";
        CenterWindow(page,600,450,1);
     }
  }
</script>
 
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
 
 
<h3 align="center">Usuario Personal Internet<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cliente_personal_new_data, ESS2000" ></h3>
<hr size="4">
<form method="post" action="">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="201">
  <INPUT TYPE=HIDDEN NAME="E01EUSCTY" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="E01EUSOPR" VALUE="0">
  <h4>General Information</h4>
  <table class="tableinfo">
      <tr > 
        <td nowrap> 
          
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
          <tr id="trdark"> 
            <td nowrap width="40%" ><div align="right">Usuario :</div></td>
            <td nowrap width="60%" ><div align="left"> <input readonly type="text" READONLY ID="MANDATORY" name="E01EUSUSR" size="35" maxlength="10" READONLY value="<%= cusdata.getE01EUSUSR().trim()%>"></div></td>
          </tr>                   
          <tr id="trdark"> 
            <td nowrap width="40%" ><div align="right">Estado Usuario :</div></td>
            <td nowrap width="60%" ><div align="left"><SELECT NAME="E01EUSSTS" disabled>
             <OPTION VALUE="1" <%if (cusdata.getE01EUSSTS().equals("1")) {out.print("selected"); }%>>ACTIVO</OPTION>
             <OPTION VALUE="2" <%if (cusdata.getE01EUSSTS().equals("2")) {out.print("selected"); }%>>INACTIVO</OPTION>
             <OPTION VALUE="3" <%if (cusdata.getE01EUSSTS().equals("3")) {out.print("selected"); }%>>SUSPENDIDO</OPTION>
             <OPTION VALUE="4" <%if (cusdata.getE01EUSSTS().equals("4")) {out.print("selected"); }%>>PENDIENTE ACTIVACION</OPTION>
             </SELECT></div></td>
          </tr>
          <tr id="teclear"> 
            <td nowrap width="40%" ><div align="right">No. Cliente :</div></td>
            <td nowrap width="60%" ><div align="left"> <input readonly type="text" ID="MANDATORY" name="E01EUSCUN" size="35" maxlength="9" value="<%= cusdata.getE01EUSCUN().trim()%>" <%= !cusdata.getE01EUSCUN().trim().equals("0")?"readonly":"" %>>
                                    <a href="javascript:GetCustomerDescId('E01EUSCUN','E01EUSCON','')"></a>
             </div>
           </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%" ><div align="right">Cuenta Primaria :</div></td>
            <td nowrap width="60%" ><div align="left"> <input readonly type="text" ID="MANDATORY" name="E01EUSACC" size="35" maxlength="9" readonly value="<%= cusdata.getE01EUSACC().trim()%>" onkeypress="enterInteger(event)">
                                    
                                    <a href="javascript:SelCuentaCli('E01EUSACC','','','',document.forms[0].E01EUSCUN.value)"></a></div></td> 
          </tr>
          <tr id="teclear"> 
            <td nowrap width="40%" ><div align="right">Requiere Tarjeta de Vectores :</div></td>
            <td nowrap width="60%" ><div align="left"><SELECT NAME="E01EUSOPR" disabled="disabled">
             <OPTION VALUE="0" <%if (cusdata.getE01EUSOPR().equals("0")) {out.print("selected"); }%>>No Requiere</OPTION>
             <OPTION VALUE="1" <%if (cusdata.getE01EUSOPR().equals("1")) {out.print("selected"); }%>>Si Requiere</OPTION>
             </SELECT></div></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%" ><div align="right">Tarjeta Vectores :</div></td>
            <td nowrap width="60%" ><div align="left"> 
            <input type="text" ID="MANDATORY" name="E01EUSOPP" readonly="readonly" size="35" maxlength="10" value="<%= cusdata.getE01EUSOPP().trim()%>">
             </div>
           </td>
          </tr>
          
          <tr id="teclear"> 
            <td nowrap width="40%" ><div align="right">Tipo Acumulaci�n :</div></td>
            <td nowrap width="60%" ><div align="left"> <SELECT NAME="E01EUSMXT" disabled>
             <OPTION VALUE="1" <%if (cusdata.getE01EUSMXT().equals("1")) {out.print("selected"); }%>>DIARIO</OPTION>
             <OPTION VALUE="2" <%if (cusdata.getE01EUSMXT().equals("2")) {out.print("selected"); }%>>SEMANAL</OPTION>
             </SELECT></div></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%" ><div align="right">Permite Transferencias Internas :</div></td>
            <td nowrap width="60%" ><div align="left"> <SELECT NAME="E01EUSTRA" disabled>
             <OPTION VALUE="Y" <%if (cusdata.getE01EUSTRA().equals("Y")) {out.print("selected"); }%>>SI</OPTION>
             <OPTION VALUE="N" <%if (cusdata.getE01EUSTRA().equals("N")) {out.print("selected"); }%>>NO</OPTION>
             </SELECT></div></td>
          </tr>
          <tr id="teclear"> 
            <td nowrap width="40%" ><div align="right">Permite Transferencias a Terceros :</div></td>
            <td nowrap width="60%" ><div align="left"><SELECT NAME="E01EUSTPT" disabled>
             <OPTION VALUE="Y" <%if (cusdata.getE01EUSTPT().equals("Y")) {out.print("selected"); }%>>SI</OPTION>
             <OPTION VALUE="N" <%if (cusdata.getE01EUSTPT().equals("N")) {out.print("selected"); }%>>NO</OPTION>
             </SELECT></div></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%" ><div align="right">Permite Transferencias Externas :</div></td>
            <td nowrap width="60%" ><div align="left"><SELECT NAME="E01EUSEXT" disabled>
             <OPTION VALUE="Y" <%if (cusdata.getE01EUSEXT().equals("Y")) {out.print("selected"); }%>>SI</OPTION>
             <OPTION VALUE="N" <%if (cusdata.getE01EUSEXT().equals("N")) {out.print("selected"); }%>>NO</OPTION>
             </SELECT></div></td>
          </tr>
          <tr id="teclear"> 
            <td nowrap width="40%" ><div align="right">Permite Pagos a Cuentas  :</div></td>
            <td nowrap width="60%" ><div align="left"><SELECT NAME="E01EUSBPA" disabled>
             <OPTION VALUE="Y" <%if (cusdata.getE01EUSBPA().equals("Y")) {out.print("selected"); }%>>SI</OPTION>
             <OPTION VALUE="N" <%if (cusdata.getE01EUSBPA().equals("N")) {out.print("selected"); }%>>NO</OPTION>
             </SELECT></div></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%" ><div align="right">Permite Cartas de Cr�ditos :</div></td>
            <td nowrap width="60%" ><div align="left"><SELECT NAME="E01EUSLCA" disabled>
             <OPTION VALUE="Y" <%if (cusdata.getE01EUSLCA().equals("Y")) {out.print("selected"); }%>>SI</OPTION>
             <OPTION VALUE="N" <%if (cusdata.getE01EUSLCA().equals("N")) {out.print("selected"); }%>>NO</OPTION>
             </SELECT></div></td>
          </tr>
           <tr id="teclear"> 
            <td nowrap width="40%" ><div align="right">Permite Pagos Pr�stamos :</div></td>
            <td nowrap width="60%" ><div align="left"><SELECT NAME="E01EUSLNA" disabled>
             <OPTION VALUE="Y" <%if (cusdata.getE01EUSLNA().equals("Y")) {out.print("selected"); }%>>SI</OPTION>
             <OPTION VALUE="N" <%if (cusdata.getE01EUSLNA().equals("N")) {out.print("selected"); }%>>NO</OPTION>
             </SELECT></div></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%" ><div align="right">Permite Pagos de Tarjetas :</div></td>
            <td nowrap width="60%" ><div align="left"><SELECT NAME="E01EUSCCP" disabled>
             <OPTION VALUE="Y" <%if (cusdata.getE01EUSCCP().equals("Y")) {out.print("selected"); }%>>SI</OPTION>
             <OPTION VALUE="N" <%if (cusdata.getE01EUSCCP().equals("N")) {out.print("selected"); }%>>NO</OPTION>
             </SELECT></div></td>
          </tr>
          <tr id="teclear"> 
            <td nowrap width="40%" ><div align="right">Monto M�ximo Transferencias Internas :</div></td>
            <td nowrap width="60%" ><div align="left"> <input readonly type="text" name="E01EUSMAX" size="35" maxlength="13" value="<%= cusdata.getE01EUSMAX().trim()%>"></div></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%" ><div align="right">Monto M�ximo Acumulado Transferencias Internas :</div></td>
            <td nowrap width="60%" ><div align="left"> <input readonly type="text" name="E01EUSAMX" size="35" maxlength="13" value="<%= cusdata.getE01EUSAMX().trim()%>"></div></td>
          </tr>
          <tr id="teclear"> 
            <td nowrap width="40%" ><div align="right">Monto M�ximo Transferencias a Terceros :</div></td>
            <td nowrap width="60%" ><div align="left"> <input readonly type="text" name="E01EUSTTL" size="35" maxlength="13" value="<%= cusdata.getE01EUSTTL().trim()%>"></div></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%" ><div align="right">Monto M�ximo Acumulado Transferencias a Terceros :</div></td>
            <td nowrap width="60%" ><div align="left"> <input readonly type="text" name="E01EUSTAL" size="35" maxlength="13" value="<%= cusdata.getE01EUSTAL().trim()%>"></div></td>
          </tr>
          <tr id="teclear"> 
            <td nowrap width="40%" ><div align="right">Monto M�ximo Transferencias Externas :</div></td>
            <td nowrap width="60%" ><div align="left"> <input readonly type="text" name="E01EUSETL" size="35" maxlength="13" value="<%= cusdata.getE01EUSETL().trim()%>"></div></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%" ><div align="right">Monto M�ximo Acumulado Transferencias Externas :</div></td>
            <td nowrap width="60%" ><div align="left"> <input readonly type="text" name="E01EUSEAL" size="35" maxlength="13" value="<%= cusdata.getE01EUSEAL().trim()%>"></div></td>
          </tr>
          <tr id="teclear"> 
            <td nowrap width="40%" ><div align="right">Persona Responsable :</div></td>
            <td nowrap width="60%" ><div align="left"> <input readonly type="text" name="E01EUSCON" size="35" maxlength="30" value="<%= cusdata.getE01EUSCON().trim()%>"></div></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%" ><div align="right">Correo Electr�nico :</div></td>
            <td nowrap width="60%" ><div align="left"> <input readonly type="text" ID="MANDATORY" name="E01EUSIAD" size="35" maxlength="45" value="<%= cusdata.getE01EUSIAD().trim()%>"></div></td>
          </tr>
          <tr id="teclear"> 
            <td nowrap width="40%" ><div align="right">Tipo Confirmaci�n :</div></td>
            <td nowrap width="60%" ><div align="left"><SELECT NAME="E01EUSCFM" disabled>
             <OPTION VALUE="1" <%if (cusdata.getE01EUSCFM().equals("1")) {out.print("selected"); }%>>NO CONFIRMATION REQUERIDA</OPTION>
             <OPTION VALUE="2" <%if (cusdata.getE01EUSCFM().equals("2")) {out.print("selected"); }%>>CONFIRMACION TELEFONICA</OPTION>
             <OPTION VALUE="3" <%if (cusdata.getE01EUSCFM().equals("3")) {out.print("selected"); }%>>AVISO POR INTERNET</OPTION>
             <OPTION VALUE="4" <%if (cusdata.getE01EUSCFM().equals("4")) {out.print("selected"); }%>>E-MAIL AL CLIENTE</OPTION>
             </SELECT></div></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%" ><div align="right">Incluir/Excluir Cuentas :</div></td>
            <td nowrap width="60%" ><div align="left"><SELECT NAME="E01EUSIEF" disabled>
             <OPTION VALUE=" " <%if (cusdata.getE01EUSIEF().equals(""))  {out.print("selected"); }%>>NO</OPTION>
             <OPTION VALUE="I" <%if (cusdata.getE01EUSIEF().equals("I")) {out.print("selected"); }%>>INCLUIR</OPTION>
             <OPTION VALUE="E" <%if (cusdata.getE01EUSIEF().equals("E")) {out.print("selected"); }%>>EXCLUIR</OPTION>
             </SELECT></div></td>
          </tr>
          <tr id="teclear"> 
            <td nowrap width="40%" ><div align="right">Cuenta Acceso #1 :</div></td>
            <td nowrap width="60%" >
               <div align="left">
                 <input readonly type="text" name="E01EUSA01" size="15" maxlength="12" value="<%= cusdata.getE01EUSA01().trim()%>" readonly>
                 <a href="javascript:SelCuentaCli('E01EUSA01','','','',document.forms[0].E01EUSCUN.value)"></a>
               </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%" ><div align="right">Cuenta Acceso #2 :</div></td>
            <td nowrap width="60%" ><div align="left">
               <input readonly type="text" name="E01EUSA02" size="15" maxlength="12" value="<%= cusdata.getE01EUSA02().trim()%>" readonly>
               <a href="javascript:SelCuentaCli('E01EUSA02','','','',document.forms[0].E01EUSCUN.value)"></a>                             
               </div></td>
          </tr>
          <tr id="teclear"> 
            <td nowrap width="40%" ><div align="right">Cuenta Acceso #3 :</div></td>
            <td nowrap width="60%" ><div align="left"> <input readonly type="text" name="E01EUSA03" size="15" maxlength="12" value="<%= cusdata.getE01EUSA03().trim()%>" readonly>
			<a href="javascript:SelCuentaCli('E01EUSA03','','','',document.forms[0].E01EUSCUN.value)"></a>                                         
            </div></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%" ><div align="right">Cuenta Acceso #4 :</div></td>
            <td nowrap width="60%" ><div align="left"> <input readonly type="text" name="E01EUSA04" size="15" maxlength="12" value="<%= cusdata.getE01EUSA04().trim()%>" readonly>
            <a href="javascript:SelCuentaCli('E01EUSA04','','','',document.forms[0].E01EUSCUN.value)"></a>                             
            </div></td>
          </tr>
          <tr id="teclear"> 
            <td nowrap width="40%" ><div align="right">Cuenta Acceso #5 :</div></td>
            <td nowrap width="60%" ><div align="left"> <input readonly type="text" name="E01EUSA05" size="15" maxlength="12" value="<%= cusdata.getE01EUSA05().trim()%>" readonly>
            <a href="javascript:SelCuentaCli('E01EUSA05','','','',document.forms[0].E01EUSCUN.value)"></a>                             
            </div></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%" ><div align="right">Cuenta Acceso #6 :</div></td>
            <td nowrap width="60%" ><div align="left"> <input readonly type="text" name="E01EUSA06" size="15" maxlength="12" value="<%= cusdata.getE01EUSA06().trim()%>" readonly>
            <a href="javascript:SelCuentaCli('E01EUSA06','','','',document.forms[0].E01EUSCUN.value)"></a>                             
            </div></td>
          </tr>
          <tr id="teclear"> 
            <td nowrap width="40%" ><div align="right">Cuenta Acceso #7 :</div></td>
            <td nowrap width="60%" ><div align="left"> <input readonly type="text" name="E01EUSA07" size="15" maxlength="12" value="<%= cusdata.getE01EUSA07().trim()%>" readonly>
            <a href="javascript:SelCuentaCli('E01EUSA07','','','',document.forms[0].E01EUSCUN.value)"></a>                             
            </div></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%" ><div align="right">Cuenta Acceso #8 :</div></td>
            <td nowrap width="60%" ><div align="left"> <input readonly type="text" name="E01EUSA08" size="15" maxlength="12" value="<%= cusdata.getE01EUSA08().trim()%>" readonly>
            <a href="javascript:SelCuentaCli('E01EUSA08','','','',document.forms[0].E01EUSCUN.value)"></a>                             
            </div></td>
          </tr>
          <tr id="teclear"> 
            <td nowrap width="40%" ><div align="right">Cuenta Acceso #9 :</div></td>
            <td nowrap width="60%" ><div align="left"> <input readonly type="text" name="E01EUSA09" size="15" maxlength="12" value="<%= cusdata.getE01EUSA09().trim()%>" readonly>
            <a href="javascript:SelCuentaCli('E01EUSA09','','','',document.forms[0].E01EUSCUN.value)"></a>                             
            </div></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%" ><div align="right">Cuenta Acceso #10 :</div></td>
            <td nowrap width="60%" ><div align="left"> <input readonly type="text" name="E01EUSA10" size="15" maxlength="12" value="<%= cusdata.getE01EUSA10().trim()%>" readonly>
            <a href="javascript:SelCuentaCli('E01EUSA10','','','',document.forms[0].E01EUSCUN.value)"></a>                             
            </div></td>
          </tr>
        </table>
        </td>
      </tr>
    </table>
</form>
</body>
</html>
