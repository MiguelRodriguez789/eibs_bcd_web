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
 
 
<h3 align="center">Usuario Corporativo Internet<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cliente_corporate_new_data, ESS2000" ></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/com.datapro.eibs.internet.JSESS2000" onsubmit="return FieldNotBlank(this)">
  <INPUT TYPE=HIDDEN id="SCREEN" NAME="SCREEN" VALUE="101">
  <INPUT TYPE=HIDDEN id="E01EUSCTY" NAME="E01EUSCTY" VALUE="1">
  <INPUT TYPE=HIDDEN id="E01EUSCFM" NAME="E01EUSCFM" VALUE="1">
  <INPUT TYPE=HIDDEN id="E01EUSTPT" NAME="E01EUSTPT" VALUE="N">
  <INPUT TYPE=HIDDEN id="E01EUSOPR" NAME="E01EUSOPR" VALUE="2">
  
  <h4>Información General</h4>
  <table class="tableinfo">
      <tr > 
        <td nowrap> 
          
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
          <tr id="trdark"> 
            <td nowrap width="40%" ><div align="right">Entidad :</div></td>
            <td nowrap width="60%" ><div align="left"> 
            	<input type="text" ID="MANDATORY" name="E01EUSUSR" size="35" maxlength="10" READONLY value="<%= cusdata.getE01EUSUSR().trim()%>">
                                    <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0"  ></div></td>
          </tr>
          <tr id="teclear"> 
            <td nowrap width="40%" ><div align="right">Usuario Administrador :</div></td>
            <td nowrap width="60%" ><div align="left"> 
            	<input type="text" <% if(userPO.getPurpose().equals("MAINT")){ %> READONLY <% } %> ID="MANDATORY" name="E01EUSENT" size="35" maxlength="10" value="<%= cusdata.getE01EUSENT().trim()%>">
                                    <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0"  ></div></td>
          </tr>
<%if(userPO.getPurpose().equals("")){ %>           
          <tr id="trdark"> 
            <td nowrap width="40%" ><div align="right">Contraseña Usuario Administrador :</div></td>
            <td nowrap width="60%" ><div align="left"> 
            	<input type="password" ID="MANDATORY" name="E01EUSACP" size="35" maxlength="10" value="<%= cusdata.getE01EUSACP().trim()%>">
                                    <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0"  ></div>
                  <INPUT TYPE=HIDDEN id="NEWUSER" NAME="NEWUSER" VALUE="Y">                                    
                                    </td>
          </tr>
<% } else{ %>   
          <tr id="trdark"> 
            <td nowrap width="40%" ><div align="right">Contraseña Usuario Administrador :</div></td>
            <td nowrap width="60%" ><div align="left"> 
            	<input type="password" id="E01EUSACP" name="E01EUSACP" size="35" maxlength="10" value="<%= cusdata.getE01EUSACP().trim()%>"></div>
            <INPUT TYPE=HIDDEN id="NEWUSER" NAME="NEWUSER" VALUE="N">
            </td>
          </tr>
<% } %>        
          <tr id="teclear"> 
            <td nowrap width="40%" ><div align="right">Estado Usuario Administrador :</div></td>
            <td nowrap width="60%" ><div align="left">
            <SELECT id="E01EUSSTS" NAME="E01EUSSTS">
             <OPTION VALUE="1" <%if (cusdata.getE01EUSSTS().equals("1")) {out.print("selected"); }%>>ACTIVO</OPTION>
             <OPTION VALUE="2" <%if (cusdata.getE01EUSSTS().equals("2")) {out.print("selected"); }%>>INACTIVO</OPTION>
             <OPTION VALUE="3" <%if (cusdata.getE01EUSSTS().equals("3")) {out.print("selected"); }%>>SUSPENDIDO</OPTION>
             <OPTION VALUE="4" <%if (cusdata.getE01EUSSTS().equals("4")) {out.print("selected"); }%>>PENDIENTE ACTIVACION</OPTION>
             </SELECT></div></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%" ><div align="right">No. Cliente :</div></td>
            <td nowrap width="60%" ><div align="left">
				<input type="text" ID="MANDATORY" name="E01EUSCUN" size="35" maxlength="9" value="<%= cusdata.getE01EUSCUN().trim()%>">
                                    <a href="javascript:GetCustomerDescId('E01EUSCUN','E01EUSCON','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0" ></a>
                                    <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0"  ></div></td>
          </tr>
          <tr id="teclear"> 
            <td nowrap width="40%" ><div align="right">Cuenta Primaria :</div></td>
            <td nowrap width="60%" ><div align="left"> 
            	<input type="text" ID="MANDATORY" name="E01EUSACC" size="35" maxlength="9" value="<%= cusdata.getE01EUSACC().trim()%>" onkeypress="enterInteger(event)">
                                    <a href="javascript:GetAccount('E01EUSACC','','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a>
                                    <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0"  ></div></td> 
          </tr>
         
          <tr id="trdark"> 
            <td nowrap width="40%" ><div align="right">Tipo Acumulación :</div></td>
            <td nowrap width="60%" ><div align="left"> 
            <SELECT id="E01EUSMXT" NAME="E01EUSMXT">
             <OPTION VALUE="1" <%if (cusdata.getE01EUSMXT().equals("1")) {out.print("selected"); }%>>DIARIO</OPTION>
             <OPTION VALUE="2" <%if (cusdata.getE01EUSMXT().equals("2")) {out.print("selected"); }%>>SEMANAL</OPTION>
             </SELECT></div></td>
          </tr>
          
          <tr id="teclear"> 
            <td nowrap width="40%" ><div align="right">Monto Máximo Transferencias Internas :</div></td>
            <td nowrap width="60%" ><div align="left"> 
            	<input type="text" id="E01EUSMAX" name="E01EUSMAX" size="35" maxlength="13" value="<%= cusdata.getE01EUSMAX().trim()%>"></div></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%" ><div align="right">Monto Máximo Acumulado Transferencias Internas :</div></td>
            <td nowrap width="60%" ><div align="left"> 
            	<input type="text" id="E01EUSAMX" name="E01EUSAMX" size="35" maxlength="13" value="<%= cusdata.getE01EUSAMX().trim()%>"></div></td>
          </tr>
          <tr id="teclear"> 
            <td nowrap width="40%" ><div align="right">Monto Máximo Transferencias a Terceros :</div></td>
            <td nowrap width="60%" ><div align="left"> 
            	<input type="text" id="E01EUSTTL" name="E01EUSTTL" size="35" maxlength="13" value="<%= cusdata.getE01EUSTTL().trim()%>"></div></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%" ><div align="right">Monto Máximo Acumulado Transferencias a Terceros :</div></td>
            <td nowrap width="60%" ><div align="left"> 
            	<input type="text" id="E01EUSTAL" name="E01EUSTAL" size="35" maxlength="13" value="<%= cusdata.getE01EUSTAL().trim()%>"></div></td>
          </tr>
          <tr id="teclear"> 
            <td nowrap width="40%" ><div align="right">Monto Máximo Transferencias Externas :</div></td>
            <td nowrap width="60%" ><div align="left">
            	 <input type="text" id="E01EUSETL" name="E01EUSETL" size="35" maxlength="13" value="<%= cusdata.getE01EUSETL().trim()%>"></div></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%" ><div align="right">Monto Máximo Acumulado Transferencias Externas :</div></td>
            <td nowrap width="60%" ><div align="left"> 
            	<input type="text" id="E01EUSEAL" name="E01EUSEAL" size="35" maxlength="13" value="<%= cusdata.getE01EUSEAL().trim()%>"></div></td>
          </tr>
          <tr id="teclear"> 
            <td nowrap width="40%" ><div align="right">Persona Responsable :</div></td>
            <td nowrap width="60%" ><div align="left"> 
            	<input type="text" id="E01EUSCON" name="E01EUSCON" size="35" maxlength="30" value="<%= cusdata.getE01EUSCON().trim()%>"></div></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%" ><div align="right">Correo Electrónico :</div></td>
            <td nowrap width="60%" ><div align="left"> 
            	<input type="text" ID="MANDATORY" name="E01EUSIAD" size="35" maxlength="45" value="<%= cusdata.getE01EUSIAD().trim()%>">
                                    <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0"  ></div></td>
          </tr>
          <tr id="teclear"> 
            <td nowrap width="40%" ><div align="right"> :</div> </td>
            <td nowrap width="60%" >  </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%" ><div align="right">Lista de Clientes o Cuentas :</div></td>
            <td nowrap width="60%" ><div align="left"> </div></td>
            <!--  <td nowrap width="40%" ><div align="right">Incluir/Excluir Cuentas :</div></td>
            <td nowrap width="60%" ><div align="left"><SELECT NAME="E01EUSIEF">
             <OPTION VALUE=" " <%if (cusdata.getE01EUSIEF().equals(""))  {out.print("selected"); }%>>NO</OPTION>
             <OPTION VALUE="I" <%if (cusdata.getE01EUSIEF().equals("I")) {out.print("selected"); }%>>INCLUIR</OPTION>
             <OPTION VALUE="E" <%if (cusdata.getE01EUSIEF().equals("E")) {out.print("selected"); }%>>EXCLUIR</OPTION>
             </SELECT></div></td>
              -->
          </tr>
          <tr id="teclear"> 
            <td nowrap width="40%" ><div align="right">No. Cliente o Cuenta #1 :</div></td>
            <td nowrap width="60%" >
               <div align="left">
                 <input type="text" id="E01EUSA01" name="E01EUSA01" size="15" maxlength="12" value="<%= cusdata.getE01EUSA01().trim()%>" >
                 <a href="javascript:SelCuentaCli('document.getElementById('E01EUSA01')','','','',document.forms[0].E01EUSCUN.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a>
               </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%" ><div align="right">No. Cliente o Cuenta #2 :</div></td>
            <td nowrap width="60%" ><div align="left">
               <input type="text" id="E01EUSA02" name="E01EUSA02" size="15" maxlength="12" value="<%= cusdata.getE01EUSA02().trim()%>" >
               <a href="javascript:SelCuentaCli('document.getElementById('E01EUSA02')','','','',document.forms[0].E01EUSCUN.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a>                             
               </div></td>
          </tr>
          <tr id="teclear"> 
            <td nowrap width="40%" ><div align="right">No. Cliente o Cuenta #3 :</div></td>
            <td nowrap width="60%" ><div align="left"> <input type="text" id="E01EUSA03" name="E01EUSA03" size="15" maxlength="12" value="<%= cusdata.getE01EUSA03().trim()%>" >
			<a href="javascript:SelCuentaCli('document.getElementById('E01EUSA03')','','','',document.forms[0].E01EUSCUN.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a>                                         
            </div></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%" ><div align="right">No. Cliente o Cuenta #4 :</div></td>
            <td nowrap width="60%" ><div align="left"> <input type="text" id="E01EUSA04" name="E01EUSA04" size="15" maxlength="12" value="<%= cusdata.getE01EUSA04().trim()%>" >
            <a href="javascript:SelCuentaCli('document.getElementById('E01EUSA04')','','','',document.forms[0].E01EUSCUN.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a>                             
            </div></td>
          </tr>
          <tr id="teclear"> 
            <td nowrap width="40%" ><div align="right">No. Cliente o Cuenta #5 :</div></td>
            <td nowrap width="60%" ><div align="left"> <input type="text" id="E01EUSA05" name="E01EUSA05" size="15" maxlength="12" value="<%= cusdata.getE01EUSA05().trim()%>" >
            <a href="javascript:SelCuentaCli('document.getElementById('E01EUSA05')','','','',document.forms[0].E01EUSCUN.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a>                             
            </div></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%" ><div align="right">No. Cliente o Cuenta #6 :</div></td>
            <td nowrap width="60%" ><div align="left"> <input type="text" id="E01EUSA06" name="E01EUSA06" size="15" maxlength="12" value="<%= cusdata.getE01EUSA06().trim()%>" >
            <a href="javascript:SelCuentaCli('document.getElementById('E01EUSA06')','','','',document.forms[0].E01EUSCUN.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a>                             
            </div></td>
          </tr>
          <tr id="teclear"> 
            <td nowrap width="40%" ><div align="right">No. Cliente o Cuenta #7 :</div></td>
            <td nowrap width="60%" ><div align="left"> <input type="text" id="E01EUSA07" name="E01EUSA07" size="15" maxlength="12" value="<%= cusdata.getE01EUSA07().trim()%>" >
            <a href="javascript:SelCuentaCli('document.getElementById('E01EUSA07')','','','',document.forms[0].E01EUSCUN.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a>                             
            </div></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%" ><div align="right">No. Cliente o Cuenta #8 :</div></td>
            <td nowrap width="60%" ><div align="left"> <input type="text" id="E01EUSA08" name="E01EUSA08" size="15" maxlength="12" value="<%= cusdata.getE01EUSA08().trim()%>" >
            <a href="javascript:SelCuentaCli('document.getElementById('E01EUSA08')','','','',document.forms[0].E01EUSCUN.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a>                             
            </div></td>
          </tr>
          <tr id="teclear"> 
            <td nowrap width="40%" ><div align="right">No. Cliente o Cuenta #9 :</div></td>
            <td nowrap width="60%" ><div align="left"> <input type="text" id="E01EUSA09" name="E01EUSA09" size="15" maxlength="12" value="<%= cusdata.getE01EUSA09().trim()%>" >
            <a href="javascript:SelCuentaCli('document.getElementById('E01EUSA09')','','','',document.forms[0].E01EUSCUN.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a>                             
            </div></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%" ><div align="right">No. Cliente o Cuenta #10 :</div></td>
            <td nowrap width="60%" ><div align="left"> <input type="text" id="E01EUSA10" name="E01EUSA10" size="15" maxlength="12" value="<%= cusdata.getE01EUSA10().trim()%>" >
            <a href="javascript:SelCuentaCli('document.getElementById('E01EUSA10')','','','',document.forms[0].E01EUSCUN.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a>                             
            </div></td>
          </tr>
          
        </table>
        </td>
      </tr>
    </table>
    
  <p align="center"> <input id="EIBSBTN" type=submit name="Submit" value="Enviar"> </p>
</form>
</body>
</html>
