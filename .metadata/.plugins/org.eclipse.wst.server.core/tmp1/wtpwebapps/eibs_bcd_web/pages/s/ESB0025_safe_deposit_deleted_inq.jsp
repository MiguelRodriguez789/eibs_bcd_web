
<%@page import="datapro.eibs.beans.ESB002501Message"%><html>
<head>
<title></title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import ="datapro.eibs.master.Util" %> 

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "msgPart" 	class= "datapro.eibs.beans.ESB002501Message"  	scope="session" />
<jsp:useBean id= "error" 	class= "datapro.eibs.beans.ELEERRMessage"  		scope="session" />
<jsp:useBean id= "userPO" 	class= "datapro.eibs.beans.UserPos"  			scope="session"/>

<% 
if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
%>
<SCRIPT type="text/javascript">
        showErrors();
</SCRIPT>
<%}%>

</head>
<body>

<H3 align="center">Consulta Historica de Logs de Caja de Seguridad <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="safe_deposit_deleted_inq, ESB0025"></H3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.safedeposit.JSESB0025">
 
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="500">
  
  <table class="tableinfo" width="100%">
   <tr> 
   <td>
    <table cellspacing=0 cellpadding=2 width="100%" border="0">    
     	<tr id=trclear> 
	      <td nowrap width="40%"> 
	        <div align="right">No. Log : </div>
	      </td>
		  <td nowrap width="60%"><input type="text"
					name="E01SBLLOG" size="26" maxlength="26"
					value="<%= msgPart.getE01SBLLOG() %>" readonly>
					
		  </td>
			</tr></table>
    </td>
   </tr>
  </table>  
  <h4>Información Caja de Seguridad :</h4>
  <table class="tableinfo" width="100%">
   <tr> 
   <td>
    <table cellspacing=0 cellpadding=2 width="100%" border="0">    
     	
     	<tr id=trdark> 
	      <td nowrap> 
	        <div align="right">No. Caja : </div>
	      </td>
				<td nowrap colspan="3">
					<div align="left">
					<input type="text" name="E01SBLDEP" size="16"
					maxlength="14" value="<%= msgPart.getE01SBLDEP() %>" readonly="readonly"> 
					</div>
				</td>

			</tr>
     	<tr id=trclear> 
     		      <td nowrap> 
	        <div align="right">Tipo : </div>
	      </td>
				<td nowrap colspan="3">
				<div align="left">
				<input type="text" name="D01SBTDSC" size="32"
					maxlength="30" value="<%= msgPart.getD01SBTDSC() %>" readonly> 
				</div>
		</td>

     	</TR>
     	<tr id=trdark> 
	      <td nowrap> 
	        <div align="right">Ubicación : </div>
	      </td>
				<td nowrap colspan="3"><input
					type="text" name="D01LOCNME" size="22" maxlength="20"
					value="<%= msgPart.getD01LOCNME() %>" readonly> 
				</td>
			</tr>
     	<tr id=trclear> 
	      <td nowrap> 
	        <div align="right">Cliente : </div>
	      </td>
	      <td nowrap><div align="left">
	      	<input type="text" name="D01CUSNA1" size="47" maxlength="45" value="<%= msgPart.getD01CUSNA1() %>" readonly >
      	    </div>
		  </td>
     	</TR></table>
    </td>
   </tr>
  </table>
  <h4>Información Consulta </h4>
  <table class="tableinfo">
   <tr> 
   <td>
    <table cellspacing=0 cellpadding=2 width="100%" border="0">    
     	
     	<tr id=trdark> 
            <td nowrap width="17%" >
              <div align="right"> Fecha :</div>
            </td>
              <td nowrap > 
                <div align="left"> 
                  <input type="text" name="E01SBLVD1" size="2" maxlength="2" value="<%= msgPart.getE01SBLVD1().trim()%>" onkeypress="enterInteger(event)" readonly="readonly">
                  <input type="text" name="E01SBLVD2" size="2" maxlength="2" value="<%= msgPart.getE01SBLVD2().trim()%>" onkeypress="enterInteger(event)" readonly="readonly">
                  <input type="text" name="E01SBLVD3" size="4" maxlength="4" value="<%= msgPart.getE01SBLVD3().trim()%>" onkeypress="enterInteger(event)" readonly="readonly">                  
                </div>
              </td>
     	</TR>
     	<tr id=trclear> 
            <td nowrap width="17%" >
              <div align="right">En Hora :</div>
            </td>
              <td nowrap > 
                <div align="left"> 
                  <input type="text" name="E01SBLITH" size="2" maxlength="2" value="<%= msgPart.getE01SBLITH().trim()%>" onkeypress="enterInteger(event)" readonly="readonly"> : 
                  <input type="text" name="E01SBLITM" size="2" maxlength="2" value="<%= msgPart.getE01SBLITM().trim()%>" onkeypress="enterInteger(event)" readonly="readonly"> : 
                  <input type="text" name="E01SBLITS" size="2" maxlength="2" value="<%= msgPart.getE01SBLITS().trim()%>" onkeypress="enterInteger(event)" readonly="readonly"> 
                </div>                
              </td>
			</tr>
     	<tr id=trdark> 
            <td nowrap width="17%" >
              <div align="right">Fuera de Hora :</div>
            </td>
              <td nowrap > 
                <div align="left"> 
                  <input type="text" name="E01SBLOTH" size="2" maxlength="2" value="<%= msgPart.getE01SBLOTH().trim()%>" onkeypress="enterInteger(event)" readonly="readonly"> : 
                  <input type="text" name="E01SBLOTM" size="2" maxlength="2" value="<%= msgPart.getE01SBLOTM().trim()%>" onkeypress="enterInteger(event)" readonly="readonly"> : 
                  <input type="text" name="E01SBLOTS" size="2" maxlength="2" value="<%= msgPart.getE01SBLOTS().trim()%>" onkeypress="enterInteger(event)" readonly="readonly"> 
                </div>
              </td>
			</tr>			
     	<tr id=trclear> 
	      <td nowrap> 
	        <div align="right">Iniciales Oficial : </div>
	      </td>
	      <td nowrap>
	      	<div align="left">
	      		<input type="text" name="E01SBLOFC" size="4" maxlength="4" value="<%= msgPart.getE01SBLOFC() %>" readonly="readonly">
	      	</div>      	  
		  </td>
     	</TR>
     	<tr id=trdark> 
		  <td> 
		     <div align="right">Comentarios : </div>        
		  </td>
      	  <td nowrap> 
      	    <input type="text" name="E01SBLRM1" size="55" maxlength="50" value="<%= msgPart.getE01SBLRM1() %>" readonly="readonly">
      	  </td>
      	</TR>
     	<tr id=trclear> 
            <td nowrap width="17%" >
              <div align="right"></div>
            </td>
      	  <td nowrap> 
      	    <input type="text" name="E01SBLRM2" size="55" maxlength="50" value="<%= msgPart.getE01SBLRM2() %>" readonly="readonly">
      	  </td>
			</TR>
     	<tr id=trdark> 
            <td nowrap width="17%" >
              <div align="right"></div>
            </td>
      	  <td nowrap> 
      	    <input type="text" name="E01SBLRM3" size="55" maxlength="50" value="<%= msgPart.getE01SBLRM3() %>" readonly="readonly">
      	  </td>
			</TR>
     	<tr id=trclear> 
				<TD nowrap width="17%"></TD>
				<TD nowrap><INPUT type="text" name="E01SBLRM4" size="55"
					maxlength="50" value="<%= msgPart.getE01SBLRM4() %>" readonly="readonly"></TD>
			</TR>
     	<tr id=trdark> 
				<TD nowrap width="17%"></TD>
				<TD nowrap><INPUT type="text" name="E01SBLRM5" size="55"
					maxlength="50" value="<%= msgPart.getE01SBLRM5() %>" readonly="readonly"></TD>
			</TR></table>
    </td>
   </tr>
  </table>  
  <br>
</form>
</body>
</html>
