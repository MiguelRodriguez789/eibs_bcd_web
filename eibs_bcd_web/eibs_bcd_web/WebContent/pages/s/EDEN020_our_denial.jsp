<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
 
<html>
<head>
<title>Lista de Control</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 

</head>

<jsp:useBean id="EDEN020Record" class="datapro.eibs.beans.EDEN02001Message"  scope="session" /> 
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
 
<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript">

function chgTipo(p) {
 	if (p == 'N' ) {
		JURIDICO.style.display='none' ;
		NATURAL.style.display='block' ;
	} else {
		NATURAL.style.display='none' ;
		JURIDICO.style.display='block' ;
	}
 }

function chgNme(type) {
 	switch (type){
	// Natural
	case 'N':  
		getElement('NAME').value = getElement('E01ONOM').value + ' ' +
												getElement('E01OAPE').value; 
		break;
	// Juridica o Asociacion	
	case 'J':  
		getElement('NAME').value = getElement('E01ONAME').value; 
	}		
 }	
 
function goAction(op) {
	document.forms[0].SCREEN.value = op;
	if (op == 4) {
		if (!confirm("Desea borrar este registro?")) {
			return;
		}
		document.forms[0].Delete.disabled = true;
	}
	if (op == 5) {
		document.forms[0].Submit.disabled = true;
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
	String read = "";
 	String disabled = "";
 	boolean readOnly=false; 
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" title=\"campo obligatorio\" align=\"bottom\" border=\"0\" >";
 	String tf = "false";
 	
	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) 
		{ read = " readonly ";
		  disabled = " disabled";
		  readOnly=true; 
		  mandatory = "";
		}	
	
%>


<H3 align="center">Mantenimiento de Lista Propia<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="our_denial.jsp, EDEN020"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.ofac.JSEDEN020" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">

<%int row = 0; %>
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="15%" align="right">Código (UID) :</td>
            <td nowrap width="35%" align="left">
				<INPUT type="text" name="E01OCOUN" size="13" maxlength="10" value="<%= EDEN020Record.getE01OCOUN().trim()%>" readonly> 
            <td nowrap width="15%" align="right">Tipo :</td>
			<td nowrap width="35%" align="left">
            	<SELECT name="E01OLGT" onChange="chgTipo(this.value)" onBlur="chgTipo(this.value)" <%= disabled %>>
					<OPTION <%= EDEN020Record.getE01OLGT().trim().equals("N")?"Selected":"" %> value="N">Natural </OPTION>
					<OPTION <%= EDEN020Record.getE01OLGT().trim().equals("J")?"Selected":"" %> value="J">Juridico </OPTION>
					<OPTION <%= EDEN020Record.getE01OLGT().trim().equals("A")?"Selected":"" %> value="A">Agrupación </OPTION>
					<OPTION <%= EDEN020Record.getE01OLGT().trim().equals(" ")?"Selected":"" %> value=" ">Desconocido </OPTION>
				</SELECT>
            	<%=mandatory %>
			</td>
		</tr>
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="15%" align="right">Nombre Completo :</td>
            <td nowrap width="35%" align="left"> 
				<INPUT type="text" name="NAME" id="NAME" size="60" value="<%= EDEN020Record.getE01ONAME().trim()%>" readonly> 
			</td>
            <td nowrap width="15%" align="right"></td>
			<td nowrap width="35%" align="left">
			</td>
		</tr>
        </table>
      </td>
    </tr>
  </table>


<div id="NATURAL" style="position:relative; display:none;">
  <h4>Información Básica</h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="15%" align="right">Nombres :</td>
            <td nowrap width="35%" align="left"> 
               	<input type="text" name="E01ONOM" id="E01ONOM" size="62" maxlength="60" value="<%= EDEN020Record.getE01ONOM().trim()%>" <%=read%> onChange="chgNme('N')" onBlur="chgNme('N')">
               	<%=mandatory %>
            </td>
            <td nowrap width="15%" align="right">Genero :</td>
            <td nowrap width="35%" align="left">
                <p> 
                <input type="radio" name="E01OGEN" value="F" <%if (EDEN020Record.getE01OGEN().equals("F")) out.print("checked"); %> <%= disabled %>>
                Femenino 
                <input type="radio" name="E01OGEN" value="M" <%if (EDEN020Record.getE01OGEN().equals("M")) out.print("checked"); %> <%= disabled %>>
                Masculino 
                <input type="radio" name="E01OGEN" value=" " <%if (EDEN020Record.getE01OGEN().equals(" ")) out.print("checked"); %> <%= disabled %>>
                Desconocido 
                </p>
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="15%" align="right">Apellidos :</td>
            <td nowrap width="35%" align="left">
                <input type="text" name="E01OAPE" id="E01OAPE" size="62" maxlength="60" value="<%= EDEN020Record.getE01OAPE().trim()%>" <%=read%> onChange="chgNme('N')" onBlur="chgNme('N')">
            </td>
            <td nowrap width="15%" align="right"></td>
            <td nowrap width="35%" align="left">
            </td>
         </tr>
       </table>
            
       </td>
       </tr>
    </table>

</div>   
   
<div id="JURIDICO" style="position:relative; display:none;">
  <h4>Información Básica</h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="15%" align="right">Nombre  :</td>
            <td nowrap width="35%" align="left"> 
               	<input type="text" name="E01ONAME" id="E01ONAME" size="46" maxlength="45" value="<%= EDEN020Record.getE01ONAME().trim()%>" <%=read%> onChange="chgNme('J')" onBlur="chgNme('J')">
               	<%=mandatory %>
            </td>
            <td nowrap width="15%" align="right">Tipo de Asociación :</td>
            <td nowrap width="35%" align="left">
              <input type="text" name="E01OTSOC" size="5" maxlength="4" value="<%= EDEN020Record.getE01OTSOC().trim()%>" <%=read%>>
              <input type="text" name="D01ASSNME" size="30" value="<%= EDEN020Record.getD01ASSNME().trim()%>" readonly>
           		<% if( !readOnly){ %>
              <a href="javascript:GetCodeDescCNOFC('E01OTSOC','D01ASSNME','DA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a>
              <%=mandatory%>
              	<% } %>
            </td>	
         </tr>
       </table>
            
       </td>
       </tr>
    </table>
</div>

  <h4>Información Adicional</h4>
    
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
         	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            	<td nowrap width="15%" align="right">Identificación No. :</td>
            	<td nowrap width="35%"> 
              		<input type="text" name="E01OIDN" size="28" maxlength="25" value="<%= EDEN020Record.getE01OIDN().trim()%>" <%=read%>>
            	</td>
            	<td nowrap width="15%" align="right">Tipo Identificación :</td>
            	<td nowrap width="35%"> 
              		<input type="text" name="E01OTID" size="6" maxlength="4" value="<%= EDEN020Record.getE01OTID().trim()%>" <%=read%>>
               		<% if( !readOnly){ %>
              			<a href="javascript:GetCodeAuxCNOFC('E01OTID','34','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></a> 
               		<% }%>
            	</td>
          	</tr>
         	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            	<td nowrap width="15%" align="right">País :</td>
            	<td nowrap width="35%" align="left">
            		<eibsinput:cnofc name="EDEN020Record" property="E01OACCD" value="<%=EDEN020Record.getE01OACCD()%>" size="5" maxlength="2" required="false" flag="03" fn_code="E01OACCD" fn_description="D01CTRNME" readonly="<%=readOnly %>"/>
                	<input type="text" name="D01CTRNME" size="30" value="<%= EDEN020Record.getD01CTRNME().trim()%>" readonly>
            	</td>
            	<td nowrap width="15%" align="right">Departamento / Estado :</td>
            	<td nowrap width="35%" align="left">
            		<input type="text" name="E01OASTA" size="4" maxlength="2" value="<%= EDEN020Record.getE01OASTA().trim()%>" <%=read%>>
            		<input type="text" name="D01STANME" size="30" value="<%= EDEN020Record.getD01STANME().trim()%>" readonly>
                		<% if( !readOnly){ %>
                			<a href="javascript:Get2FilterCodes('E01OASTA','D01STANME','27', '',document.forms[0]['E01OACCD'].value)">
                			<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
                		<% } %>
            	</td>
         	</tr>
        	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              	<td nowrap width="15%" align="right">Ciudad :</td>
              	<td nowrap width="35%" align="left"> 
              		<input type="text" name="E01OADD1" size="62" maxlength="60" value="<%= EDEN020Record.getE01OADD1().trim()%>" <%=read%>>  
              	</td>
              	<td nowrap width="15%" align="right">Dirección  :</td>
              	<td nowrap width="35%" align="left">
					<input type="text" name="E01OADD2" size="62" maxlength="60" value="<%= EDEN020Record.getE01OADD2().trim()%>" <%=read%>>  
              	</td>
            </tr>
        	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              	<td nowrap width="15%" align="right">Nacionalidad / País de Registro :</td>
              	<td nowrap width="35%" align="left"> 
              		<input type="text" name="E01OADD3" size="62" maxlength="60" value="<%= EDEN020Record.getE01OADD3().trim()%>" <%=read%>>  
              	</td>
              	<td nowrap width="15%" align="right"></td>
              	<td nowrap width="35%" align="left">
              	</td>
            </tr>
        	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              	<td nowrap width="15%" align="right">Fecha Nacimiento / Constitución :</td>
              	<td nowrap width="35%" align="left"> 
              		<% if( !readOnly){ %>
                		<eibsinput:date name="EDEN020Record" fn_year="E01ODTEY1" fn_month="E01ODTEM1" fn_day="E01ODTED1" required="false"/> 
              		<% } else { %>
						<%=  Util.formatCustomDate(currUser.getE01DTF(),
													EDEN020Record.getBigDecimalE01ODTEM1().intValue(),
													EDEN020Record.getBigDecimalE01ODTED1().intValue(),
													EDEN020Record.getBigDecimalE01ODTEY1().intValue())%>
              		<% } %>  
              	</td>
              	<td nowrap width="15%" align="right"></td>
              	<td nowrap width="35%" align="left">
              	</td>
            </tr>

        </table>
        </td>
    </tr>
  </table>

  <h4>Causales</h4>
    
  <table class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0"  align="center">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="15%" align="right">Fuente :</td>
            <td nowrap width="35%" align="left">
              <input type="text" name="E01OCSRC" size="5" maxlength="4" value="<%= EDEN020Record.getE01OCSRC().trim()%>" <%=read%>>
              <input type="text" name="D01SRCNME" size="30" value="<%= EDEN020Record.getD01SRCNME().trim()%>" readonly>
           		<% if( !readOnly){ %>
              <a href="javascript:GetCodeDescCNOFC('E01OCSRC','D01SRCNME','DB')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a>
              <%=mandatory%>
              	<% } %>
            </td>
            <td nowrap width="15%" align="right">Tipo de Causal :</td>
            <td nowrap width="35%" align="left">
              <input type="text" name="E01OCTYP" size="5" maxlength="4" value="<%= EDEN020Record.getE01OCTYP().trim()%>" <%=read%>>
              <input type="text" name="D01TYPNME" size="30" value="<%= EDEN020Record.getD01TYPNME().trim()%>" readonly>
           		<% if( !readOnly){ %>
              <a href="javascript:GetCodeDescCNOFC('E01OCTYP','D01TYPNME','DC')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a>
              	<% } %>
            </td>
          </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
           	<td nowrap width="15%" align="right">Hecho :</td>
           	<td nowrap width="35%" align="left"> 
           		<input type="text" name="E01EREM1" size="62" maxlength="60" value="<%= EDEN020Record.getE01EREM1().trim()%>" <%=read%>>   
           	</td>
           	<td nowrap width="15%" align="right">Fecha del hecho :</td>
           	<td nowrap width="35%" align="left">
           		<% if( !readOnly){ %>
              		<eibsinput:date name="EDEN020Record" fn_year="E01ODTEY2" fn_month="E01ODTEM2" fn_day="E01ODTED2" required="false"/> 
           		<% } else { %>
					<%= Util.formatCustomDate(currUser.getE01DTF(),
													EDEN020Record.getBigDecimalE01ODTEM2().intValue(),
													EDEN020Record.getBigDecimalE01ODTED2().intValue(),
													EDEN020Record.getBigDecimalE01ODTEY2().intValue())%>
            	<% } %>  
            </td>
        </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
           	<td nowrap width="15%" align="right">Fecha Inclusión/Fallecimiento :</td>
           	<td nowrap width="35%" align="left"> 
           		<% if( !readOnly){ %>
              		<eibsinput:date name="EDEN020Record" fn_year="E01ODTEY3" fn_month="E01ODTEM3" fn_day="E01ODTED3" required="false"/> 
           		<% } else { %>
					<%= Util.formatCustomDate(currUser.getE01DTF(),
													EDEN020Record.getBigDecimalE01ODTEM3().intValue(),
													EDEN020Record.getBigDecimalE01ODTED3().intValue(),
													EDEN020Record.getBigDecimalE01ODTEY3().intValue())%>
           		<% } %>  
           	</td>
           	<td nowrap width="15%" align="right">Volumen/Página :</td>	 
           	<td nowrap width="35%" align="left">
				<input type="text" name="E01OVOLN" size="3" maxlength="2" value="<%= EDEN020Record.getE01OVOLN().trim()%>" <%=read%>>
           		 / <input type="text" name="E01OPAGE" size="7" maxlength="6" value="<%= EDEN020Record.getE01OPAGE().trim()%>" <%=read%>>              		
           	</td>
    	</tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
           	<td nowrap width="15%" align="right">Comentarios :</td>
           	<td nowrap width="35%" align="left"> 
           		<input type="text" name="E01EREM2" size="62" maxlength="60" value="<%= EDEN020Record.getE01EREM2().trim()%>" <%=read%>>   
           	</td>
           	<td nowrap width="15%" align="right"></td>
           	<td nowrap width="35%" align="left">
            </td>
        </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
           	<td nowrap width="15%" align="right"></td>
           	<td nowrap width="35%" align="left"> 
           		<input type="text" name="E01EREM3" size="62" maxlength="60" value="<%= EDEN020Record.getE01EREM3().trim()%>" <%=read%>>   
           	</td>
           	<td nowrap width="15%" align="right"></td>
           	<td nowrap width="35%" align="left">
            </td>
        </tr>
          
       </table>
      </td>
    </tr>
  </table>
 <br> 
	<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    	<tr bgcolor="#FFFFFF"> 
      		<td width="33%" align="center"><input type="checkbox" name="H01FLGWK2" value="1" >Aceptar con Avisos</td>
    	</tr>
  	</table>    
    
    <table width="100%">		
  	<tr>
  		<td width="33%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goAction(5);" <%= disabled %>>
     	  </div>	
  		</td>
  		<td width="33%"> 
  		  <div align="center"> 
     		<input id="EIBSBTN" type=button name="Delete" value="Borrar" onClick="goAction(4);" <%= disabled %>>
     	  </div>	
  		</td>
  		<td width="34%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type=submit name="Exit" value="Salir" 
			<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
			    onClick="goAction(1);" 
			<% } else { %>
				onClick="goAction(6);" 
			<% } %>>
     	  </div>	
  		</td>

  	</tr>	
  </table>	

  </form>
</body>

<SCRIPT type="text/javascript">

<% 	if (EDEN020Record.getE01OLGT().trim().equals("N")) { %>
		JURIDICO.style.display='none' ;
		NATURAL.style.display='block' ;
<%	} else { %>
		NATURAL.style.display='none' ;
		JURIDICO.style.display='block' ;
<%	} %>
</SCRIPT>
</html>
