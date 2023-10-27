<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import = "datapro.eibs.master.Util" %>

<html>
<head>
<title>Cambios Estado de Cuenta</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript">

function enviar(){ 

	valor = "";
   	estado=document.getElementsByName("CE02ACMADT");
   	for(var i=0;i<estado.length;i++)
     {
         if(estado[i].checked){
             valor=estado[i].value;
             break;
         }
     } 
    document.forms[0].E02ACMADT.value=valor; 
   	document.forms[0].E02ACMAST.value=document.forms[0].CE02ACMAST.value;	 
   	document.forms[0].submit();
   	
   	
} 



</script>


</head>

<jsp:useBean id="rtStatus" class="datapro.eibs.beans.EDD000002Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
    out.println("<SCRIPT> initMenu(); </SCRIPT>");
%>

<%int row = 0; %>
<H3 align="center">Cambios Estado de Cuenta y Bloqueos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_ap_chg_acc_status, EDD0000"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDD0000" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="316">
  <input type="hidden" name="E02ACMAST"  value="<%= rtStatus.getE02ACMAST().trim()%>">
  <input type="hidden" name="E02ACMADT"  value="<%= rtStatus.getE02ACMADT().trim()%>">
  <input type="hidden" name="FLAG"  value="<%= rtStatus.getH02FLGWK2().trim()%>">
  
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">  
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
              	<eibsinput:text property="E02ACMCUN" name="rtStatus" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
              	<eibsinput:text property="E02CUSNA1" name="rtStatus" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/>
              </div>
            </td>
          </tr>
          <tr id="trdark">  
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
              	<eibsinput:text property="E02ACMACC" name="rtStatus" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true"/>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
              	<eibsinput:text property="E02ACMPRO" name="rtStatus" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"> </div>
            </td>
          </tr>
          <tr id="trdark">  
            <td nowrap width="16%"> 
              <div align="right"><b>Estado de la Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
              <input type="text" readonly name="E02ADECRI1" size="65" maxlength="64" value="<%= rtStatus.getE02ADECRI().trim()%>">
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"> </div>
            </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>
  <BR>


<H4>Cambio Estado</H4>
 <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trclear" : "trdark" %><%row++;%>"> 
            <td nowrap width="41%"> 
              <div align="right">Estado:</div>
            </td>
            <td nowrap width="59%"> 
              <select name="CE02ACMAST" disabled="disabled" <% if (rtStatus.getF02ACMAST().equals("Y")) out.print("class=\"txtchanged\""); %>>
                <option value="<%=rtStatus.getE02ACMAST().trim() %> " ><% if (rtStatus.getE02ACMAST().equals("A") || rtStatus.getE02ACMAST().equals("")) 
								out.print("Activa");	
							else if (rtStatus.getE02ACMAST().equals("E")) 	
									out.print("Embargada");	
							else if (rtStatus.getE02ACMAST().equals("I")) 	
									out.print("Inactiva");
							else if (rtStatus.getE02ACMAST().equals("D")) 
									out.print("Inactiva 2");
							else if (rtStatus.getE02ACMAST().equals("C"))
									out.print("Cerrada");%></option>
                <% if (rtStatus.getE02ACMAST().equals("A") || rtStatus.getE02ACMAST().equals(" ")){ %>
					<option value="E" >Embargada</option>
				<% }else if(rtStatus.getE02ACMAST().equals("E")){ %>
				    <option value="A" >Activa</option>
				<% }else {%>
					<option value="A" >Activa</option>
					<option value="E" >Embargada</option>
				<% } %>
              </select>
            </td>
          </tr>
         
        </table>
      </td>
    </tr>
  </table>
 
<H4>Bloqueos</H4>
 <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

          <tr id="<%= (row % 2 == 1) ? "trclear" : "trdark" %><%row++;%>">  
            <td nowrap width="41%"> 
              <div align="right">Tipo :</div>
            </td>
            <td nowrap width="59%"> 
              <input type="radio" name="CE02ACMADT" value="D" <%if(rtStatus.getE02ACMADT().equals("D")) out.print("checked");%> disabled="disabled">  
			  Débito
			  <% if (rtStatus.getE02ACMADT().equals("D") && rtStatus.getF02ACMADT().equals("Y")){ %>
			  		<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo modificado" border="0" >
			  	<%} %> 
              <input type="radio" name="CE02ACMADT" value="C" <%if(rtStatus.getE02ACMADT().equals("C")) out.print("checked");%> disabled="disabled"> 
			  Crédito
              <% if (rtStatus.getE02ACMADT().equals("C") && rtStatus.getF02ACMADT().equals("Y")){ %>
			  		<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo modificado" border="0" >
			  	<%} %>
              <input type="radio" name="CE02ACMADT" value="B" <%if(rtStatus.getE02ACMADT().equals("B")) out.print("checked");%> disabled="disabled">  
			  Ambos
              <% if (rtStatus.getE02ACMADT().equals("B") && rtStatus.getF02ACMADT().equals("Y")){ %>
			  		<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo modificado" border="0" >
			  	<%} %>
              <input type="radio" name="CE02ACMADT" value="N" <%if(rtStatus.getE02ACMADT().equals("N")) out.print("checked");%> disabled="disabled" >
			  Desbloqueo
			  <% if (rtStatus.getE02ACMADT().equals("N") && rtStatus.getF02ACMADT().equals("Y")){ %>
			  		<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo modificado" border="0" >
			  	<%} %>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

<H4>Motivo</H4>
<table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          
          <tr id="trclear"> 
            <td nowrap width="41%"> 
              <div align="right">Cambiado por (Funcionario):</div>
            </td>
            <td nowrap width="59%"> 
              <input type="text" name="E02ACMUIN" size="5" maxlength="4" value="<%= rtStatus.getE02ACMUIN().trim()%>" readonly="readonly"
              	<% if (rtStatus.getF02ACMUIN().equals("Y")) out.print("class=\"txtchanged\""); %>>
              <input type="text" name="E02USRNAM" size="65" maxlength="64" value="<%= rtStatus.getE02USRNAM().trim()%>" readonly="readonly"
              	<% if (rtStatus.getF02ACMUIN().equals("Y")) out.print("class=\"txtchanged\""); %>>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trclear" : "trdark" %><%row++;%>">  
            <td nowrap width="41%"> 
              <div align="right">Descripcion :</div>
            </td>
            <td nowrap width="59%"> 
              <input type="text" name="E02ACMF04" size="5" maxlength="4" value="<%= rtStatus.getE02ACMF04().trim()%>" readonly="readonly"
              	<% if (rtStatus.getF02ACMF04().equals("Y")) out.print("class=\"txtchanged\""); %>>
              <input type="text" name="E02ADESCR" size="65" maxlength="64" value="<%= rtStatus.getE02ADESCR().trim()%>" readonly="readonly"
              	<% if (rtStatus.getF02ACMF04().equals("Y")) out.print("class=\"txtchanged\""); %>>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <br>

   </form>
</body>
</html>
