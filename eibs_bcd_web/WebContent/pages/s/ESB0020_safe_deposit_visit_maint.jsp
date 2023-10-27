<html>
<head>
<title></title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import ="datapro.eibs.master.Util" %>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "msgPart" 	class= "datapro.eibs.beans.ESB002001Message"  	scope="session" />
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

<H3 align="center">Consulta Log Caja de Seguridad<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="safe_deposit_visit_maint, ESB0020"></H3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.safedeposit.JSESB0020">
 
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
					<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0" > 
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
					maxlength="14" value="<%= msgPart.getE01SBLDEP() %>" readonly="readonly" > 
					<!-- <a href="javascript:GetDepositNumber('E01SBLDEP','D01SBTDSC','D01LOCNME','D01CUSNA1')"> 
					<img src="<%//request.getContextPath()%>/images/1b.gif" title="Help" align="bottom" border="0"></a> -->
					<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0" > 
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
					value="<%= msgPart.getD01LOCNME() %>" readonly><A
					href="javascript:GetVendor('E01SBTVEN')"></A> 
				</td>
			</tr>
     	<tr id=trclear> 
	      <td nowrap> 
	        <div align="right">Cliente : </div>
	      </td>
	      <td nowrap><div align="left">
	      	<input type="text" name="D01CUSNA1" size="47" maxlength="45" value="<%= msgPart.getD01CUSNA1() %>" readonly >
      	    <a href="javascript:GetVendor('E01SBTVEN')"></a> 
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
                  <input type="text" name="E01SBLVD1" size="2" maxlength="2" value="<%= msgPart.getE01SBLVD1().trim()%>" readonly="readonly">
                  <input type="text" name="E01SBLVD2" size="2" maxlength="2" value="<%= msgPart.getE01SBLVD2().trim()%>" readonly="readonly">
                  <input type="text" name="E01SBLVD3" size="5" maxlength="4" value="<%= msgPart.getE01SBLVD3().trim()%>" readonly="readonly">
                  <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0" > 
                </div>
              </td>
     	</TR>
     	<tr id=trclear> 
            <td nowrap width="17%" >
              <div align="right">En Hora :</div>
            </td>
              <td nowrap > 
                <div align="left"> 
                  <input type="text" name="E01SBLITH" size="2" maxlength="2" value="<%= msgPart.getE01SBLITH().trim()%>" readonly="readonly"> : 
                  <input type="text" name="E01SBLITM" size="2" maxlength="2" value="<%= msgPart.getE01SBLITM().trim()%>" readonly="readonly"> : 
                  <input type="text" name="E01SBLITS" size="2" maxlength="2" value="<%= msgPart.getE01SBLITS().trim()%>" readonly="readonly"> 
                  <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0" > 
                </div>                
              </td>
			</tr>
     	<tr id=trdark> 
            <td nowrap width="17%" >
              <div align="right">Fuera de Hora :</div>
            </td>
              <td nowrap > 
                <div align="left"> 
                  <input type="text" name="E01SBLOTH" size="2" maxlength="2" value="<%= msgPart.getE01SBLOTH().trim()%>" readonly="readonly"> : 
                  <input type="text" name="E01SBLOTM" size="2" maxlength="2" value="<%= msgPart.getE01SBLOTM().trim()%>" readonly="readonly"> : 
                  <input type="text" name="E01SBLOTS" size="2" maxlength="2" value="<%= msgPart.getE01SBLOTS().trim()%>" readonly="readonly"> 
                </div>
              </td>
			</tr>			
     	<tr id=trclear> 
	      <td nowrap> 
	        <div align="right">Iniciales Oficial : </div>
	      </td>
	      <td nowrap><div align="left">
	      	<input type="text" name="E01SBLOFC" size="4" maxlength="4" value="<%= msgPart.getE01SBLOFC() %>">
      	    <a href="javascript:GetVendor('E01SBTVEN')"></a>
      	    <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0" > 
      	    </div>
		  </td>
     	</TR>
     	<tr id=trdark> 
		  <td> 
		     <div align="right">Comentarios : </div>        
		  </td>
      	  <td nowrap> 
      	    <input type="text" name="E01SBLRM1" size="52" maxlength="50" value="<%= msgPart.getE01SBLRM1() %>">
      	  </td>
      	</TR>
     	<tr id=trclear> 
            <td nowrap width="17%" >
              <div align="right"></div>
            </td>
      	  <td nowrap> 
      	    <input type="text" name="E01SBLRM2" size="52" maxlength="50" value="<%= msgPart.getE01SBLRM2() %>">
      	  </td>
			</TR>
     	<tr id=trdark> 
            <td nowrap width="17%" >
              <div align="right"></div>
            </td>
      	  <td nowrap> 
      	    <input type="text" name="E01SBLRM3" size="52" maxlength="50" value="<%= msgPart.getE01SBLRM3() %>">
      	  </td>
			</TR>
     	<tr id=trclear> 
				<TD nowrap width="17%"></TD>
				<TD nowrap><INPUT type="text" name="E01SBLRM4" size="52"
					maxlength="50" value="<%= msgPart.getE01SBLRM4() %>"></TD>
			</TR>
     	<tr id=trdark> 
				<TD nowrap width="17%"></TD>
				<TD nowrap><INPUT type="text" name="E01SBLRM5" size="52"
					maxlength="50" value="<%= msgPart.getE01SBLRM5() %>"></TD>
			</TR></table>
    </td>
   </tr>
  </table>  
  <br>
  
  <p align="center"> 
    <input id="ESBSBTN" type="submit" name="Submit" value="Enviar">
  </p>
</form>
</body>
</html>
