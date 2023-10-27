<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>
 
<html>
<head>
<title>Lista de Control</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 

</head>

<jsp:useBean id="EDEN000Record" class="datapro.eibs.beans.EDEN000DSMessage"  scope="session" /> 
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
 
<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript">

</SCRIPT>  
 

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
%>


<H3 align="center">Lista de Control - Consulta Detallada<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="denial_detail.jsp, EDEN000"></H3>
<hr size="4">
<form method="post">

  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
        <tr id="trdark"> 
            <td nowrap width="15%" align="right">Código (UID) :</td>
            <td nowrap width="35%" align="left">
				<%= EDEN000Record.getE01DCOUN().trim()%> 
			</td>
            <td nowrap width="15%" align="right">Tipo :</td>
			<td nowrap width="35%" align="left">
				<%if (EDEN000Record.getE01DLGT().equals("N")) out.print("Natural"); 
                    else if (EDEN000Record.getE01DLGT().equals("J")) out.print("Juridico");
                    else if (EDEN000Record.getE01DLGT().equals("A")) out.print("Agrupación");
                    else out.print("Desconocido"); 
                %>
			</td>
		</tr>
		<tr id="trclear"> 
            <td nowrap width="15%" align="right">Nombre Completo :</td>
            <td nowrap width="35%" align="left"> 
				<%= EDEN000Record.getE01DNAME().trim()%> 
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
          
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Nombres :</td>
            <td nowrap width="35%" align="left"> 
               	<%= EDEN000Record.getE01DNOM().trim()%>
            </td>
            <td nowrap width="15%" align="right">Genero :</td>
            <td nowrap width="35%" align="left">
                <%if (EDEN000Record.getE01DGEN().equals("F")) out.print("Femenino"); 
                    else if (EDEN000Record.getE01DGEN().equals("M")) out.print("Masculino");
                    else out.print("Desconocido"); 
                %>
            </td>
         </tr>
         <tr id="trclear"> 
            <td nowrap width="15%" align="right">Apellidos :</td>
            <td nowrap width="35%" align="left">
                <%= EDEN000Record.getE01DAPE().trim()%>
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
          
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Nombre  :</td>
            <td nowrap width="35%" align="left"> 
               	<%= EDEN000Record.getE01DNAME().trim()%>
            </td>
            <td nowrap width="15%" align="right">Tipo de Asociación :</td>
            <td nowrap width="35%" align="left">
              <%= EDEN000Record.getE01DTSOC().trim()%> - <%= EDEN000Record.getD01ASSNME().trim()%>
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
         	<tr id="trdark"> 
            	<td nowrap width="15%" align="right">Identificación No. :</td>
            	<td nowrap width="35%"> 
              		<%= EDEN000Record.getE01DIDN().trim()%>
            	</td>
            	<td nowrap width="15%" align="right">Tipo Identificación :</td>
            	<td nowrap width="35%"> 
              		<%= EDEN000Record.getE01DTID().trim()%>
            	</td>
          	</tr>
         	<tr id="trclear"> 
            	<td nowrap width="15%" align="right">País :</td>
            	<td nowrap width="35%" align="left">
                	<%= EDEN000Record.getE01DACCD().trim()%> - <%= EDEN000Record.getD01CTRNME().trim()%>
            	</td>
            	<td nowrap width="15%" align="right">Departamento / Estado :</td>
            	<td nowrap width="35%" align="left">
            		<%= EDEN000Record.getE01DASTA().trim()%> - <%= EDEN000Record.getD01STANME().trim()%>
            	</td>
         	</tr>
        	<tr id="trdark"> 
              	<td nowrap width="15%" align="right">Ciudad :</td>
              	<td nowrap width="35%" align="left"> 
              		<%= EDEN000Record.getE01DADD1().trim()%>
              	</td>
              	<td nowrap width="15%" align="right">Dirección  :</td>
              	<td nowrap width="35%" align="left">
					<%= EDEN000Record.getE01DADD2().trim()%>  
              	</td>
            </tr>
        	<tr id="trclear"> 
              	<td nowrap width="15%" align="right">Nacionalidad / País de Registro :</td>
              	<td nowrap width="35%" align="left"> 
              		<%= EDEN000Record.getE01DADD3().trim()%>  
              	</td>
              	<td nowrap width="15%" align="right"></td>
              	<td nowrap width="35%" align="left">
              	</td>
            </tr>
        	<tr id="trdark"> 
              	<td nowrap width="15%" align="right">Fecha Nacimiento / Constitución :</td>
              	<td nowrap width="35%" align="left"> 
						<%=  Util.formatCustomDate(currUser.getE01DTF(),
													EDEN000Record.getBigDecimalE01DDTEM1().intValue(),
													EDEN000Record.getBigDecimalE01DDTED1().intValue(),
													EDEN000Record.getBigDecimalE01DDTEY1().intValue())%>
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
          <tr id="trclear"> 
            <td nowrap width="15%" align="right">Fuente :</td>
            <td nowrap width="35%" align="left">
              <%= EDEN000Record.getE01DCSRC().trim()%> - <%= EDEN000Record.getD01SRCNME().trim()%>
            </td>
            <td nowrap width="15%" align="right">Tipo de Causal :</td>
            <td nowrap width="35%" align="left">
              <%= EDEN000Record.getE01DCTYP().trim()%> - <%= EDEN000Record.getD01TYPNME().trim()%>
            </td>
          </tr>
        <tr id="trdark"> 
           	<td nowrap width="15%" align="right">Hecho :</td>
           	<td nowrap width="35%" align="left"> 
           		<%= EDEN000Record.getE01DREM1().trim()%>   
           	</td>
           	<td nowrap width="15%" align="right">Fecha de Actualización :</td>
           	<td nowrap width="35%" align="left">
					
					<%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),
												EDEN000Record.getBigDecimalE01DDTEM2().intValue(),
												EDEN000Record.getBigDecimalE01DDTED2().intValue(),
												EDEN000Record.getBigDecimalE01DDTEY2().intValue())%>
            </td>
        </tr>
        <tr id="trclear"> 
           	<td nowrap width="15%" align="right">Fecha Inclusión/Fallecimiento :</td>
           	<td nowrap width="35%" align="left"> 
					<%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),
												EDEN000Record.getBigDecimalE01DDTEM3().intValue(),
												EDEN000Record.getBigDecimalE01DDTED3().intValue(),
												EDEN000Record.getBigDecimalE01DDTEY3().intValue())%>
           	</td>
           	<td nowrap width="15%" align="right">Volumen/Página :</td>	 
           	<td nowrap width="35%" align="left">
				<%= EDEN000Record.getE01DVOLN().trim()%> / <%= EDEN000Record.getE01DPAGE().trim()%>
           	</td>
    	</tr>
        <tr id="trdark"> 
           	<td nowrap width="15%" align="right">Comentarios :</td>
           	<td nowrap width="35%" align="left"> 
           		<%= EDEN000Record.getE01DREM2().trim()%>   
           	</td>
           	<td nowrap width="15%" align="right"></td>
           	<td nowrap width="35%" align="left">
            </td>
        </tr>
        <tr id="trclear"> 
           	<td nowrap width="15%" align="right"></td>
           	<td nowrap width="35%" align="left"> 
           		<%= EDEN000Record.getE01DREM3().trim()%>   
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
    
    <table width="100%">		
  	<tr>
  		<td width="100%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type=submit name="Exit" value="Cerrar" onClick="self.close();">
     	  </div>	
  		</td>

  	</tr>	
  </table>	

  </form>
</body>

<SCRIPT type="text/javascript">

<% 	if (EDEN000Record.getE01DLGT().trim().equals("N")) { %>
		getElement('JURIDICO').style.display='none' ;
		getElement('NATURAL').style.display='block' ;
<%	} else { %>
		getElement('NATURAL').style.display='none' ;
		getElement('JURIDICO').style.display='block' ;
<%	} %>
</SCRIPT>
</html>
