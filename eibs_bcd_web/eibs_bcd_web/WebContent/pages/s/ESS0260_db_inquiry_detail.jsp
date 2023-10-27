<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>

<html>
<head>
<title>Consulta Auditoria</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 

</head>

<jsp:useBean id="ESS0260Record" class="datapro.eibs.beans.ESS026001Message"  scope="session" /> 
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
 
<body>

<script language="Javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="JavaScript">

</SCRIPT>  
 

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
%>


<H3 align="center">Consulta de Auditoria - Detallada<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="db_inquiry_detail.jsp, ESS0260"></H3>
<hr size="4">
<form method="post">

  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
        <tr id="trdark"> 
            <td nowrap width="15%" align="right">Número Interno :</td>
            <td nowrap width="35%" align="left">
				<%= ESS0260Record.getE01MNPREF().trim()%> 
			</td>
            <td nowrap width="15%" align="right">Secuencia :</td>
			<td nowrap width="35%" align="left">
				<%= ESS0260Record.getE01MNPSEC().trim()%> 
			</td>
		</tr>
		<tr id="trclear"> 
            <td nowrap width="15%" align="right"> </td>
            <td nowrap width="35%" align="left"> 
				
			</td>
            <td nowrap width="15%" align="right"></td>
			<td nowrap width="35%" align="left">
			</td>
		</tr>
        </table>
      </td>
    </tr>
  </table>



  <h4>Información Básica</h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Programa :</td>
            <td nowrap width="35%" align="left"> 
               	<%= ESS0260Record.getE01MNPPRG().trim()%>
            </td>
            <td nowrap width="15%" align="right"></td>
            <td nowrap width="35%" align="left">
                <%= ESS0260Record.getD01MNPPRG().trim()%>
            </td>
         </tr>
         <tr id="trclear"> 
            <td nowrap width="15%" align="right">Archivo :</td>
            <td nowrap width="35%" align="left">
                <%= ESS0260Record.getE01MNPFIL().trim()%>
            </td>
            <td nowrap width="15%" align="right"></td>
            <td nowrap width="35%" align="left">
            	 <%= ESS0260Record.getD01MNPFIL().trim()%>
            </td>
         </tr>
         <tr id="trdark"> 
            <td nowrap width="15%" align="right">Operación :</td>
            <td nowrap width="35%" align="left"> 
               	<%= ESS0260Record.getE01MNPUSA().trim()%>
            </td>
            <td nowrap width="15%" align="right">Usuario :</td>
            <td nowrap width="35%" align="left">
				<%= ESS0260Record.getE01MNPUSR().trim()%>
            </td>
         </tr>
         <tr id="trclear"> 
            <td nowrap width="15%" align="right">Fecha : </td>
            <td nowrap width="35%" align="left"> 
            	<%= ESS0260Record.getE01MNPSDY().trim()%>/<%= ESS0260Record.getE01MNPSDM().trim()%>/<%= ESS0260Record.getE01MNPSDD().trim()%>

            </td>
            <td nowrap width="15%" align="right">Hora : </td>
            <td nowrap width="35%" align="left">
               	<%= ESS0260Record.getE01MNPSYT().trim()%>               	
            </td>
         </tr>
         
       </table>
            
       </td>
       </tr>
    </table>

  <h4>Información Campos </h4>
    
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
        	<tr id="trdark"> 
            	<td nowrap width="15%" align="right"><%= ESS0260Record.getE01MNPFL1().trim()%>: </td>
            	<td nowrap width="35%" align="left">
               		<%= ESS0260Record.getD01MNPFL1().trim()%>
            	</td>
            	<td nowrap width="15%" align="right">
            		<%if (!ESS0260Record.getE01MNPUSA().trim().equals("ACTUALIZAR")) out.print(" "); 
                    	else  out.print("Valor Antes : ");
               		 %>
            	</td>
            	<td nowrap width="35%" align="left">
                	<%= ESS0260Record.getE01MNPVB1().trim()%>
                </td>
            </tr>

			<tr id="trclear"> 
            	<td nowrap width="15%" align="right"></td>
            	<td nowrap width="35%" align="left">
            	</td>
            	<td nowrap width="15%" align="right">
            		<%if (!ESS0260Record.getE01MNPUSA().trim().equals("ACTUALIZAR")) out.print(" "); 
                    	else out.print("Valor Despues : "); 
                	%>
				</td>
            	<td nowrap width="35%" align="left">
            	 <%= ESS0260Record.getE01MNPVA1().trim()%>
            	</td>
			</tr>
		<%if (!ESS0260Record.getE01MNPFL2().equals("")) {%>
         	<tr id="trdark"> 
            	<td nowrap width="15%" align="right"><%= ESS0260Record.getE01MNPFL2().trim()%> : </td>
            	<td nowrap width="35%"> 
              		<%= ESS0260Record.getD01MNPFL2().trim()%>
            	</td>
            	<td nowrap width="15%" align="right">Valor Antes : </td>
            	<td nowrap width="35%"> 
              		<%= ESS0260Record.getE01MNPVB2().trim()%>
            	</td>
          	</tr>
         	<tr id="trclear"> 
            	<td nowrap width="15%" align="right"></td>
            	<td nowrap width="35%" align="left">
                	
            	</td>
            	<td nowrap width="15%" align="right">Valor Despues : </td>
            	<td nowrap width="35%" align="left">
            		<%= ESS0260Record.getE01MNPVA2().trim()%>
            	</td>
         	</tr>
        <%} %>
        <%if (!ESS0260Record.getE01MNPFL3().equals("")) {%>
        	<tr id="trdark"> 
            	<td nowrap width="15%" align="right"><%= ESS0260Record.getE01MNPFL3().trim()%> : </td>
            	<td nowrap width="35%"> 
              		<%= ESS0260Record.getD01MNPFL3().trim()%>
            	</td>
            	<td nowrap width="15%" align="right">Valor Antes : </td>
            	<td nowrap width="35%"> 
              		<%= ESS0260Record.getE01MNPVB3().trim()%>
            	</td>
          	</tr>
         	<tr id="trclear"> 
            	<td nowrap width="15%" align="right"></td>
            	<td nowrap width="35%" align="left">
                	
            	</td>
            	<td nowrap width="15%" align="right">Valor Despues : </td>
            	<td nowrap width="35%" align="left">
            		<%= ESS0260Record.getE01MNPVA3().trim()%>
            	</td>
         	</tr>
         	<%} %>
         	<%if (!ESS0260Record.getE01MNPFL4().equals("")) {%>
         	<tr id="trdark"> 
            	<td nowrap width="15%" align="right"><%= ESS0260Record.getE01MNPFL4().trim()%> : </td>
            	<td nowrap width="35%"> 
              		<%= ESS0260Record.getD01MNPFL4().trim()%>
            	</td>
            	<td nowrap width="15%" align="right">Valor Antes : </td>
            	<td nowrap width="35%"> 
              		<%= ESS0260Record.getE01MNPVB4().trim()%>
            	</td>
          	</tr>
         	<tr id="trclear"> 
            	<td nowrap width="15%" align="right"></td>
            	<td nowrap width="35%" align="left">
                	
            	</td>
            	<td nowrap width="15%" align="right">Valor Despues : </td>
            	<td nowrap width="35%" align="left">
            		<%= ESS0260Record.getE01MNPVA4().trim()%>
            	</td>
         	</tr>
         	<%} %>
         	<%if (!ESS0260Record.getE01MNPFL5().equals("")) {%>
         	<tr id="trdark"> 
            	<td nowrap width="15%" align="right"><%= ESS0260Record.getE01MNPFL5().trim()%> : </td>
            	<td nowrap width="35%"> 
              		<%= ESS0260Record.getD01MNPFL5().trim()%>
            	</td>
            	<td nowrap width="15%" align="right">Valor Antes : </td>
            	<td nowrap width="35%"> 
              		<%= ESS0260Record.getE01MNPVB5().trim()%>
            	</td>
          	</tr>
         	<tr id="trclear"> 
            	<td nowrap width="15%" align="right"></td>
            	<td nowrap width="35%" align="left">
                	
            	</td>
            	<td nowrap width="15%" align="right">Valor Despues : </td>
            	<td nowrap width="35%" align="left">
            		<%= ESS0260Record.getE01MNPVA5().trim()%>
            	</td>
         	</tr>
         	<%} %>
         	<%if (!ESS0260Record.getE01MNPFL6().equals("")) {%>
         	<tr id="trdark"> 
            	<td nowrap width="15%" align="right"><%= ESS0260Record.getE01MNPFL6().trim()%> : </td>
            	<td nowrap width="35%"> 
              		<%= ESS0260Record.getD01MNPFL6().trim()%>
            	</td>
            	<td nowrap width="15%" align="right">Valor Antes : </td>
            	<td nowrap width="35%"> 
              		<%= ESS0260Record.getE01MNPVB6().trim()%>
            	</td>
          	</tr>
         	<tr id="trclear"> 
            	<td nowrap width="15%" align="right"></td>
            	<td nowrap width="35%" align="left">
                	
            	</td>
            	<td nowrap width="15%" align="right">Valor Despues : </td>
            	<td nowrap width="35%" align="left">
            		<%= ESS0260Record.getE01MNPVA6().trim()%>
            	</td>
         	</tr>
         	<%} %>
         	<%if (!ESS0260Record.getE01MNPFL7().equals("")) {%>
         	<tr id="trdark"> 
            	<td nowrap width="15%" align="right"><%= ESS0260Record.getE01MNPFL7().trim()%> : </td>
            	<td nowrap width="35%"> 
              		<%= ESS0260Record.getD01MNPFL7().trim()%>
            	</td>
            	<td nowrap width="15%" align="right">Valor Antes : </td>
            	<td nowrap width="35%"> 
              		<%= ESS0260Record.getE01MNPVB7().trim()%>
            	</td>
          	</tr>
         	<tr id="trclear"> 
            	<td nowrap width="15%" align="right"></td>
            	<td nowrap width="35%" align="left">
                	
            	</td>
            	<td nowrap width="15%" align="right">Valor Despues : </td>
            	<td nowrap width="35%" align="left">
            		<%= ESS0260Record.getE01MNPVA7().trim()%>
            	</td>
         	</tr>
         	<%} %>
         	<%if (!ESS0260Record.getE01MNPFL8().equals("")) {%>
        	<tr id="trdark"> 
            	<td nowrap width="15%" align="right"><%= ESS0260Record.getE01MNPFL8().trim()%> : </td>
            	<td nowrap width="35%"> 
              		<%= ESS0260Record.getD01MNPFL8().trim()%>
            	</td>
            	<td nowrap width="15%" align="right">Valor Antes : </td>
            	<td nowrap width="35%"> 
              		<%= ESS0260Record.getE01MNPVB8().trim()%>
            	</td>
          	</tr>
         	<tr id="trclear"> 
            	<td nowrap width="15%" align="right"></td>
            	<td nowrap width="35%" align="left">
                	
            	</td>
            	<td nowrap width="15%" align="right">Valor Despues : </td>
            	<td nowrap width="35%" align="left">
            		<%= ESS0260Record.getE01MNPVA8().trim()%>
            	</td>
         	</tr>
         	<%} %>
         	<%if (!ESS0260Record.getE01MNPFL9().equals("")) {%>
         	<tr id="trdark"> 
            	<td nowrap width="15%" align="right"><%= ESS0260Record.getE01MNPFL9().trim()%> : </td>
            	<td nowrap width="35%"> 
              		<%= ESS0260Record.getD01MNPFL9().trim()%>
            	</td>
            	<td nowrap width="15%" align="right">Valor Antes : </td>
            	<td nowrap width="35%"> 
              		<%= ESS0260Record.getE01MNPVB9().trim()%>
            	</td>
          	</tr>
         	<tr id="trclear"> 
            	<td nowrap width="15%" align="right"></td>
            	<td nowrap width="35%" align="left">
                	
            	</td>
            	<td nowrap width="15%" align="right">Valor Despues : </td>
            	<td nowrap width="35%" align="left">
            		<%= ESS0260Record.getE01MNPVA9().trim()%>
            	</td>
         	</tr>
         	<%} %>
         	<%if (!ESS0260Record.getE01MNPFL0().equals("")) {%>
         	<tr id="trdark"> 
            	<td nowrap width="15%" align="right"><%= ESS0260Record.getE01MNPFL0().trim()%> : </td>
            	<td nowrap width="35%"> 
              		<%= ESS0260Record.getD01MNPFL0().trim()%>
            	</td>
            	<td nowrap width="15%" align="right">Valor Antes : </td>
            	<td nowrap width="35%"> 
              		<%= ESS0260Record.getE01MNPVB0().trim()%>
            	</td>
          	</tr>
         	<tr id="trclear"> 
            	<td nowrap width="15%" align="right"></td>
            	<td nowrap width="35%" align="left">
                	
            	</td>
            	<td nowrap width="15%" align="right">Valor Despues : </td>
            	<td nowrap width="35%" align="left">
            		<%= ESS0260Record.getE01MNPVA0().trim()%>
            	</td>
         	</tr>
         	<%} %>
         </table>
       </td>
    </tr>
  </table>

 <br> 
 <%if (!ESS0260Record.getE01MNPACC().equals("0") || !ESS0260Record.getE01MNPCUN().equals("0") || !ESS0260Record.getE01MNPSAC().equals("0"))  {%>
 <h4>Información Complementaria </h4>
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
        	<%if (!ESS0260Record.getE01MNPACC().equals("0")) {%>
        	<tr id="trdark"> 
            	<td nowrap width="15%" align="right">Cuenta : </td>
            	<td nowrap width="35%" align="left">
               		<%= ESS0260Record.getE01MNPACC().trim()%>
            	</td>
            	<td nowrap width="15%" align="right">
            	</td>
            	<td nowrap width="35%" align="left">
                	
                </td>
            </tr>
            <%} %>
            <%if (!ESS0260Record.getE01MNPCUN().equals("0")) {%>
			<tr id="trclear"> 
            	<td nowrap width="15%" align="right">Cliente : </td>
            	<td nowrap width="35%" align="left">
            		<%= ESS0260Record.getE01MNPCUN().trim()%>
            	</td>
            	<td nowrap width="15%" align="right">
            		<%= ESS0260Record.getD01MNPCUN().trim()%>
				</td>
            	<td nowrap width="35%" align="left">
            	</td>
			</tr>
			<%} %>
			<%if (!ESS0260Record.getE01MNPSAC().equals("0")) {%>
         	<tr id="trdark"> 
            	<td nowrap width="15%" align="right"></td>
            	<td nowrap width="35%"> 
              		<%= ESS0260Record.getE01MNPSAC().trim()%>
            	</td>
            	<td nowrap width="15%" align="right"></td>
            	<td nowrap width="35%"> 
              		<%= ESS0260Record.getE01MNPIDE().trim()%>
            	</td>
          	</tr>
         	<tr id="trclear"> 
            	<td nowrap width="15%" align="right"></td>
            	<td nowrap width="35%" align="left">
                	
            	</td>
            	<td nowrap width="15%" align="right"></td>
            	<td nowrap width="35%" align="left">
            		
            	</td>
         	</tr>
        <%} %>
         </table>
       </td>
    </tr>
 </table>
 <%} %>
    <table width="100%">		
		<tr>
			<td width="100%">
				<div align="center"> 
					<input id="EIBSBTN" type=submit name="Exit" value="Cerrar" onClick="this.window.close();">
				</div>	
			</td>
		</tr>	
	</table>	

</form>
</body>

<SCRIPT Language="Javascript">


</SCRIPT>
</html>
