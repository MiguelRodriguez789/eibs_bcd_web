<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Datos de Comunicaciones</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 

</head>

<jsp:useBean id="ESD0097Record" class="datapro.eibs.beans.ESD009701Message"  scope="session" /> 
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
 
<body>

<script language="Javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<SCRIPT Language="javascript">
<%
 	boolean isApprovalInquiry = userPO.getPurpose().equals("APPROVAL_INQ");
 	boolean isInquiry = userPO.getPurpose().equals("INQUIRY");
 	//boolean isReadOnly = isApprovalInquiry || isInquiry;
 	boolean isReadOnly = isApprovalInquiry;
 	String legtyp = (ESD0097Record.getH01LGT().equals("1")?"JURIDICO":"PERSONA");  
	String Readonly = "";
 	String disabled = "";
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"campo obligatorio\" align=\"bottom\" border=\"0\" >";
 	String tf = "false";
 	
	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) 
		{ Readonly= " readonly ";
		  disabled = " disabled";
		  tf = "true";
		  mandatory = "";
		}	
    if (isApprovalInquiry) {%>
		<% if (!ESD0097Record.getH01LGT().equals("1") ) { %>
		     builtNewMenu(client_ap_personal_opt);
         <% } else {  %>
		     builtNewMenu(client_ap_corp_opt);
         <% } %>
   <% } else { %>

   <% if (isInquiry) { %>
	    <% if (!ESD0097Record.getH01LGT().equals("1") ) { %>
		     builtNewMenu(client_inq_personal_opt);
         <% } else {  %>
		     builtNewMenu(client_inq_corp_opt);
         <% } %>	 
   <%} else {%>
         <% if (!ESD0097Record.getH01LGT().equals("1") ) { %>
		     builtNewMenu(client_personal_opt);
         <% } else {  %>
		     builtNewMenu(client_corp_opt);
         <% } %>
   <% } %> 
   <% } %>  
 
function goAction(op) {
	document.forms[0].SCREEN.value = op;
	if (op == 4) {
		if (!confirm("Desea borrar este registro?")) {
			return;
		}
	}
	document.forms[0].submit();
}
 
</SCRIPT>  
 

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    out.println("<SCRIPT> initMenu(); </SCRIPT>");
    
%>

<H3 align="center">Comunicaciones<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_comm.jsp, ESD0097"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0097" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
    
 <table class="tableinfo">
  <tr> 
    <td nowrap> 
      <table  class="tableinfo" width="100%">  <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" class="tbhead" bgcolor="#FFFFFF" bordercolor="#FFFFFF" align="center">
        <tr id="trdark"> 
            <td nowrap width="10%" align="right">Tipo Legal : </td>
            <td nowrap width="20%" align="left" > <%=legtyp%></td>
            <td nowrap width="10%" align="right">Estado : </td>
			<td nowrap width="60%" align="left" style="color:red;font-size:12;">
				<b><%= ESD0097Record.getD01STS().trim()%></b>		
			</td>
		</tr>
		<tr id="trclear"> 
            <td nowrap width="10%" align="right">Código :</td>
            <td nowrap width="20%" align="left"><b><%= ESD0097Record.getH01CUN().trim()%></b></td>
            <td nowrap width="10%" align="right">Nombre Legal :</td>
			<td nowrap width="60%" align="left"><b><%= ESD0097Record.getH01NA1().trim()%></b></td>
		</tr>
		<tr id="trdark"> 
            <td nowrap width="10%" align="right">ID : </td>
            <td nowrap width="20%" align="left">
            	<b><%=ESD0097Record.getH01PID().trim()%> - <%=ESD0097Record.getH01TID().trim()%> - <%= ESD0097Record.getH01IDN().trim()%></b> 
			</td>
            <td nowrap width="10%" align="right"></td>
			<td nowrap width="60%" align="left"></td>
		</tr>
        </table>
	</td>
  </tr>
</table>  
    </td>
  </tr>
 </table>
   
<h4>Datos Principales</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="center">
          <tr id=trdark> 
            <td nowrap width="29%"> 
              <div align="right">N&uacute;mero de A.B.A. 
                :</div>
            </td>
            <td nowrap width="24%" > 
              <input type="text" name="E01ABA" size="13" maxlength="12" value="<%= ESD0097Record.getE01ABA().trim()%>">
            </td>
            <td nowrap width="47%" > 
              <input type="text" name="E01ANM" size="19" maxlength="18" value="<%= ESD0097Record.getE01ANM().trim()%>">
            </td>
          </tr>
          <tr> 
            <td nowrap width="29%" > 
              <div align="right"> Identificaci&oacute;n del SWIFT 
                :</div>
            </td>
            <td nowrap width="24%"> 
              <input type="text" name="E01SWI" size="13" maxlength="12" value="<%= ESD0097Record.getE01SWI().trim()%>">
            </td>
            <td nowrap width="47%" >&nbsp;</td>
          </tr>
          <tr id=trdark> 
            <td nowrap width="29%"> 
              <div align="right">Cuenta Corriente / Ahorros :</div>
            </td>
            <td nowrap width="24%"> 
              <input type="text" name="E01DDA" size="13" maxlength="12" value="<%= ESD0097Record.getE01DDA().trim()%>">
            </td>
            <td nowrap width="47%">&nbsp;</td>
          </tr>
        </table>
        </td>
    </tr>
  </table>
  <h4>N&uacute;meros de Telex</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="center">
          <tr id=trdark> 
            <td nowrap width="29%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="27%"> 
              <div align="left">N&uacute;meros de Telex</div>
            </td>
            <td nowrap width="44%"> 
              <div align="left">Respuesta</div>
            </td>
          </tr>
          <tr> 
            <td nowrap width="29%" > 
              <div align="right">Carta de Cr&eacute;dito 
                :</div>
            </td>
            <td nowrap width="27%" > 
              <div align="left"> 
                <input type="text" name="E01TN1" size="16" maxlength="15" value="<%= ESD0097Record.getE01TN1().trim()%>">
              </div>
            </td>
            <td nowrap width="44%"> 
              <div align="left"> 
                <input type="text" name="E01AB1" size="18" maxlength="17" value="<%= ESD0097Record.getE01AB1().trim()%>">
              </div>
            </td>
          </tr>
          <tr id=trdark> 
            <td nowrap width="29%"> 
              <div align="right">Operaciones :</div>
            </td>
            <td nowrap width="27%"> 
              <div align="left"> 
                <input type="text" name="E01TN2" size="16" maxlength="15" value="<%= ESD0097Record.getE01TN2().trim()%>">
              </div>
            </td>
            <td nowrap width="44%"> 
              <div align="left"> 
                <input type="text" name="E01AB2" size="18" maxlength="17" value="<%= ESD0097Record.getE01AB2().trim()%>">
              </div>
            </td>
          </tr>
          <tr> 
            <td nowrap width="29%"> 
              <div align="right">Inversiones :</div>
            </td>
            <td nowrap width="27%"> 
              <div align="left"> 
                <input type="text" name="E01TN3" size="16" maxlength="15" value="<%= ESD0097Record.getE01TN3().trim()%>">
              </div>
            </td>
            <td nowrap width="44%"> 
              <div align="left"> 
                <input type="text" name="E01AB3" size="18" maxlength="17" value="<%= ESD0097Record.getE01AB3().trim()%>">
              </div>
            </td>
          </tr>
          <tr id=trdark> 
            <td nowrap width="29%"> 
              <div align="right">Moneda Extranjera 
                :</div>
            </td>
            <td nowrap width="27%"> 
              <div align="left"> 
                <input type="text" name="E01TN4" size="16" maxlength="15" value="<%= ESD0097Record.getE01TN4().trim()%>">
              </div>
            </td>
            <td nowrap width="44%"> 
              <div align="left"> 
                <input type="text" name="E01AB4" size="18" maxlength="17" value="<%= ESD0097Record.getE01AB4().trim()%>">
              </div>
            </td>
          </tr>
          <tr id=trclear> 
            <td nowrap width="29%"> 
              <div align="right">Por Omisi&oacute;n :</div>
            </td>
            <td nowrap width="27%"> 
              <div align="left"> 
                <input type="text" name="E01TLN" size="16" maxlength="15" value="<%= ESD0097Record.getE01TLN().trim()%>">
              </div>
            </td>
            <td nowrap width="44%"> 
              <div align="left"> 

              </div>
            </td>
          </tr>
        </table>
        </td>
    </tr>
  </table>
  <h4>N&uacute;meros de Fax</h4>
  <table class="tableinfo">
    <tr  > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="center">
          <tr id=trdark> 
            <td nowrap width="46%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="54%"> 
              <div align="left"> N&uacute;meros de Fax</div>
            </td>
          </tr>
          <tr id=trclear> 
            <td nowrap width="46%"> 
              <div align="right">Carta de Cr&eacute;dito :</div>
            </td>
            <td nowrap width="54%" > 
              <div align="left"> 
                <input type="text" name="E01FX1" size="16" maxlength="15" value="<%= ESD0097Record.getE01FX1().trim()%>">
              </div>
            </td>
          </tr>
          <tr id=trdark> 
            <td nowrap width="46%"> 
              <div align="right">Operaciones :</div>
            </td>
            <td nowrap width="54%"> 
              <div align="left"> 
                <input type="text" name="E01FX2" size="16" maxlength="15" value="<%= ESD0097Record.getE01FX2().trim()%>">
              </div>
            </td>
          </tr>
          <tr id=trclear> 
            <td nowrap width="46%"> 
              <div align="right">Inversiones :</div>
            </td>
            <td nowrap width="54%"> 
              <div align="left"> 
                <input type="text" name="E01FX3" size="16" maxlength="15" value="<%= ESD0097Record.getE01FX3().trim()%>">
              </div>
            </td>
          </tr>
          <tr id=trdark> 
            <td nowrap width="46%"> 
              <div align="right">Moneda Extranjera 
                :</div>
            </td>
            <td nowrap width="54%"> 
              <div align="left"> 
                <input type="text" name="E01FX4" size="16" maxlength="15" value="<%= ESD0097Record.getE01FX4().trim()%>">
              </div>
            </td>
          </tr>
          <tr id=trclear> 
            <td nowrap width="46%"> 
              <div align="right">Por Omision 
                :</div>
            </td>
            <td nowrap width="54%"> 
              <div align="left"> 
              <input type="text" name="E01FAX" size="16" maxlength="15" value="<%= ESD0097Record.getE01FAX().trim()%>">
              </div>
            </td>
          </tr>
          
         </table>
        </td>
    </tr>
  </table>
  <h4>Cuenta de Contrapartida</h4>
  <table class="tableinfo">
    <tr  > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="center">
          <tr> 
            <td nowrap width="46%"> 
              <div align="right">Cuenta Contable:</div>
            </td>
            <td nowrap width="54%"> 
              <div align="left"> 
                <input type="text" name="E01ABK" size="18" maxlength="16" value="<%= ESD0097Record.getE01ABK().trim()%>">
                <a href="javascript:GetLedger('E01ABK','<%=userPO.getBank().trim()%>','<%= userPO.getCurrency().trim()%>','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
              </div>
            </td>
          </tr>
        </table>
        </td>
    </tr>
  </table>  
            
 <br> 
	   
    <table width="100%">		
  	<tr>
  		<td width="100%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goAction(5);" <%= disabled %>>
     	  </div>	
  		</td>
  	</tr>	
  </table>	

  </form>
</body>

<SCRIPT Language="Javascript">
	
</SCRIPT>
</html>
