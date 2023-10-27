<%@ page import ="datapro.eibs.master.Util" %>
<html>
<head>
<title>Mantenimiento de Transferencias Multiples</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id= "msgMTRef" class="datapro.eibs.beans.EPR010002Message" scope="session" />
<jsp:useBean id= "error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id= "userPO" class="datapro.eibs.beans.UserPos" scope="session"/>

<SCRIPT type="text/javascript">
  
  function showTab(index, name){  
  	for(var i=0;i<5;i++){
   		getElement("Tab"+i).className="tabnormal";
   		getElement("dataTab"+i).style.display="none";
   	}
  
    getElement("Tab"+index).className="tabhighlight";  
  	getElement("dataTab"+index).style.display="";
  	getElement(name).focus();
  }
  
</SCRIPT>

</head>
<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT type="text/javascript">
            showErrors();
     </SCRIPT>
 <%
 }

%>

<H3 align="center">Consulta de Transferencias M&uacute;ltiples<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="references_inq,EPR0000"></H3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEPR0000">
 
<INPUT TYPE=HIDDEN ID="SCREEN" NAME="SCREEN" VALUE="100">
<INPUT TYPE=HIDDEN ID="FromRecord" NAME="FromRecord" VALUE="0">
  
<table class="tableinfo">
	<tr> 
   		<td>
    		<TABLE cellspacing=0 cellpadding=2 width="100%" border="0">    
				<TR>
					<TD nowrap width="40%">
						<DIV align="right">N&uacute;mero de Transferencia :</DIV>
					</TD>
					<TD nowrap width="60%">
						<INPUT type="text" id="E02PRMNUM" name="E02PRMNUM" size="10" maxlength="9" value="<%= userPO.getHeader16() %>" readonly> 
					</TD>
				</TR>
				<TR>
					<TD nowrap width="40%">
						<DIV align="right">Formato SWIFT :</DIV>
					</TD>
					<TD nowrap width="60%">
						<INPUT type="text" id="E02PRIFMT" name="E02PRIFMT" size="6" maxlength="5" value="<%= userPO.getHeader17() %>" readonly>  
					</TD>
				</TR>
 			</TABLE>
 	  	</td>
  	 </tr>
</table>
<h4></h4>
<table class="tableinfo">	
	<tr> 
   		<td>
    		<table cellspacing=0 cellpadding=2 width="100%" border="0">
     			<tr id=trdark> 
	      			<td nowrap >
						<div align="right">Secuencia: </div>
		  			</td>
		  			<td nowrap>
						<input type="text" readonly id="E02PRMSQN" name="E02PRMSQN" size="5" maxlength="4" value="<%= msgMTRef.getE02PRMSQN() %>"> 
		  			</td>
     			</tr>
     			<tr id=trclear> 
            		<td nowrap width="39%"> 
              			<div align="right">Referencia Relacionada:</div>
            		</td>
            		<td nowrap colspan="2"> 
              			<input type="text" readonly id="E02PRMRRF" name="E02PRMRRF" size="18" maxlength="16" value="<%= msgMTRef.getE02PRMRRF().trim()%>">
            		</td>
        		</tr>
     			<tr id=trdark>
     				<td nowrap width="39%"> 
              			<div align="right">Moneda:</div>
            		</td>
     				<td>
              			<input type="text" readonly id="E02PRMCCY" name="E02PRMCCY" size="4" maxlength="3" readonly value="<%= msgMTRef.getE02PRMCCY().trim()%>">
           			 </td>
        		</tr>
        		<tr id=trclear>
        			<td nowrap width="39%"> 
              			<div align="right">Monto de la TRansferencia:</div>
            		</td>
     				<td>
              			<input type="text" readonly id="E02PRMAMT" name="E02PRMAMT" size="20" maxlength="17" readonly value="<%= msgMTRef.getE02PRMAMT().trim()%>">
           			 </td>
        		</tr>
     			<tr id=trdark> 
	      			<td nowrap >
						<div align="right">Identificacion del Beneficiario: </div>
		  			</td>
		 			 <td nowrap>
						<input type="text" readonly id="E02PRMBID" name="E02PRMBID" size="18" maxlength="15" value="<%= msgMTRef.getE02PRMBID() %>"> 
		  			</td>
     			</tr>
     			<tr id=trclear> 
            		<td nowrap width="39%"> 
             			 <div align="right">Cuenta del Beneficiario:</div>
            		</td>
            		<td nowrap colspan="2"> 
              			<input type="text" readonly id="E02PRMBAC" name="E02PRMBAC" size="40" maxlength="35" value="<%= msgMTRef.getE02PRMBAC().trim()%>">
            		</td>
        		</tr>
 		   </table>
    	</td>
   	</tr>
</table>
  
<br>
  <table class="tbenter" width="100%" border="0" cellspacing=0 cellpadding=0>
    <tr> 
       <td nowrap> 
           <table id="TableTab" cellspacing=0 cellpadding=2 border="0">
          		<tr>
                 <td nowrap id="Tab0" class="tabnormal" onClick="showTab(0,'E02PRMBC1')"> 
               		<div>Beneficiario</div>
                 </td> 
                  <td nowrap id="Tab1" class="tabnormal" onClick="showTab(1,'E02PRMBB1')"> 
                    <div>Banco del Beneficiario</div>
                  </td>
                  <td nowrap id="Tab2" class="tabnormal" onClick="showTab(2,'E02PRMDT1')"> 
                   	<div>Descripci&oacute;n de la Remesa</div>
                  </td> 
                  <td nowrap id="Tab3" class="tabnormal" onClick="showTab(3,'E02PRMIN1')"> 
                   	<div>Banco Intermediario</div>
                  </td> 
                  <td nowrap id="Tab4" class="tabnormal" onClick="showTab(4,'E02PRMBK1')"> 
                   	<div>Infor. Banco a Banco</div>
                  </td> 
                  <td class="tabempty" width="100%">&nbsp;                       
                  </td> 
                </tr>
        	</table>
       </td>
    </tr>
  </table>
  <table class="tabdata" width="100%">
    <tr>
     	<td nowrap>
            <div id="dataTab0" align=center> 
               <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr id="trdark" > 
                     <td nowrap align=center> 
		                 <div><a href="javascript:GetSwiftIdDesc('E02PRMBC1','E02PRMBC2','E02PRMBC3','E02PRMBC4')"></a>
		                 </div>
                         <input type="text" readonly id="E02PRMBC1" name="E02PRMBC1" size="45" maxlength="35" value="<%= msgMTRef.getE02PRMBC1()%>">
                         <br>
                         <input type="text" readonly id="E02PRMBC2" name="E02PRMBC2" size="45" maxlength="35" value="<%= msgMTRef.getE02PRMBC2()%>">
                         <br>
                         <input type="text" readonly id="E02PRMBC3" name="E02PRMBC3" size="45" maxlength="35" value="<%= msgMTRef.getE02PRMBC3()%>">
                         <br>
                         <input type="text" readonly id="E02PRMBC4" name="E02PRMBC4" size="45" maxlength="35" value="<%= msgMTRef.getE02PRMBC4()%>">
                      </td>
    				</tr>
 				</table>
            </div>         
	        <div id="dataTab1" style="display: none" align=center> 
    	    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
            		<tr id="trdark" > 
                		<td nowrap align=center> 
		            		<div><a href="javascript:GetSwiftIdDesc('E02PRMBB1','E02PRMBB2','E02PRMBB3','E02PRMBB4')"></a>
		            		</div>
                    		<input type="text" readonly id="E02PRMBB1" name="E02PRMBB1" size="45" maxlength="35" value="<%= msgMTRef.getE02PRMBB1()%>">
                    		<br>
                    		<input type="text" readonly id="E02PRMBB2" name="E02PRMBB2" size="45" maxlength="35" value="<%= msgMTRef.getE02PRMBB2()%>">
                    		<br>
                    		<input type="text" readonly id="E02PRMBB3" name="E02PRMBB3" size="45" maxlength="35" value="<%= msgMTRef.getE02PRMBB3()%>">
                    		<br>
                    		<input type="text" readonly id="E02PRMBB4" name="E02PRMBB4" size="45" maxlength="35" value="<%= msgMTRef.getE02PRMBB4()%>">
                		</td>
    				</tr>
 				</table>
 		    </div>
	        <div id="dataTab2" style="display: none" align=center> 
        		<table width="100%" border="0" cellspacing="0" cellpadding="0">
           			<tr id="trdark" > 
                		<td nowrap align=center> 
		            		<div><a href="javascript:GetSwiftIdDesc('E02PRMDT1','E02PRMDT2','E02PRMDT3','E02PRMDT4')"></a>
		            		</div>                        
                    		<input type="text" readonly id="E02PRMDT1" name="E02PRMDT1" size="45" maxlength="35" value="<%= msgMTRef.getE02PRMDT1()%>">
                    		<br>
                    		<input type="text" readonly id="E02PRMDT2" name="E02PRMDT2" size="45" maxlength="35" value="<%= msgMTRef.getE02PRMDT2()%>">
                    		<br>
                    		<input type="text" readonly id="E02PRMDT3" name="E02PRMDT3" size="45" maxlength="35" value="<%= msgMTRef.getE02PRMDT3()%>">
                    		<br>
                    		<input type="text" readonly id="E02PRMDT4" name="E02PRMDT4" size="45" maxlength="35" value="<%= msgMTRef.getE02PRMDT4()%>">
                		</td>
    				</tr>
 				</table>
        	</div>
	        <div id="dataTab3" style="display: none" align=center> 
        		<table width="100%" border="0" cellspacing="0" cellpadding="0">
           			<tr id="trdark" > 
                		<td nowrap align=center> 
		            		<div><a href="javascript:GetSwiftIdDesc('E02PRMIN1','E02PRMIN2','E02PRMIN3','E02PRMIN4')"></a>
		            		</div>                        
                    		<input type="text" readonly name="E02PRMIN1" id="E02PRMIN1" size="45" maxlength="35" value="<%= msgMTRef.getE02PRMIN1()%>">
                    		<br>
                    		<input type="text" readonly name="E02PRMIN2" id="E02PRMIN2" size="45" maxlength="35" value="<%= msgMTRef.getE02PRMIN2()%>">
                    		<br>
                    		<input type="text" readonly name="E02PRMIN3" id="E02PRMIN3"  size="45" maxlength="35" value="<%= msgMTRef.getE02PRMIN3()%>">
                    		<br>
                    		<input type="text" readonly name="E02PRMIN4" id="E02PRMIN4" size="45" maxlength="35" value="<%= msgMTRef.getE02PRMIN4()%>">
                		</td>
    				</tr>
 				</table>
        	</div>
	        <div id="dataTab4" style="display: none" align=center> 
        		<table width="100%" border="0" cellspacing="0" cellpadding="0">
           			<tr id="trdark" > 
                		<td nowrap align=center> 
		            		<div><a href="javascript:GetSwiftIdDesc('E02PRMBK1','E02PRMBK2','E02PRMBK3','E02PRMBK4')"></a>
		            		</div>                        
                    		<input type="text" readonly name="E02PRMBK1" id="E02PRMBK1" size="45" maxlength="35" value="<%= msgMTRef.getE02PRMBK1()%>">
                    		<br>
                    		<input type="text" readonly name="E02PRMBK2" id="E02PRMBK2" size="45" maxlength="35" value="<%= msgMTRef.getE02PRMBK2()%>">
                    		<br>
                    		<input type="text" readonly name="E02PRMBK3" id="E02PRMBK3" size="45" maxlength="35" value="<%= msgMTRef.getE02PRMBK3()%>">
                    		<br>
                    		<input type="text" readonly name="E02PRMBK4" id="E02PRMBK4" size="45" maxlength="35" value="<%= msgMTRef.getE02PRMBK4()%>">
                    		<br>
                    		<input type="text" readonly name="E02PRMBK5" id="E02PRMBK5" size="45" maxlength="35" value="<%= msgMTRef.getE02PRMBK5()%>">
                    		<br>
                    		<input type="text" readonly name="E02PRMBK6" id="E02PRMBK6" size="45" maxlength="35" value="<%= msgMTRef.getE02PRMBK6()%>">
                		</td>
    				</tr>
 				</table>
        	</div>
     	</td>           
    </tr>
</table>                
<BR>                    
  
<p align="center"> 
    <input id="EIBSBTN" type="submit" name="Submit" value="Regresar">
</p>
  
</form>
</body>
</html>
