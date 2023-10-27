<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@page import="com.datapro.constants.EibsFields"%>

<%@page import="datapro.eibs.sockets.MessageRecord"%>

<%@page import="datapro.eibs.beans.ESD400201Message"%>

<html>
<head>
  
<title>Titulares</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ESD400201List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

  
         <% if ( userPO.getOption().equals("RT") ) { %>
         
            <% if ("APPROVAL_INQ".equals(userPO.getPurpose())) {%>
                  builtNewMenu(rt_a_opt);
            <% } else { %>
              <% if ("INQUIRY".equals(userPO.getPurpose())) { %>
                     builtNewMenu(rt_i_opt);
              <%} else {%>
                       builtNewMenu(rt_m_opt);
              <% } %>
              
            <% } %>
                   
        <% } %>
        
        <% if ( userPO.getOption().equals("SV") ) { %>
         
            <% if ("APPROVAL_INQ".equals(userPO.getPurpose())) { %>
                  builtNewMenu(sv_a_opt);
            <% } else { %>
              <% if ("INQUIRY".equals(userPO.getPurpose())) { %>
                     builtNewMenu(sv_i_opt);
              <%} else {%>
                       builtNewMenu(sv_m_opt);
              <% } %>
              
            <% } %>
                   
        <% } %>
        
        <% if ( userPO.getOption().equals("CD") ) { %>
         
            <% if ("APPROVAL_INQ".equals(userPO.getPurpose())) { %>
                  builtNewMenu(cd_a_opt);
            <% } else { %>
              <% if ("INQUIRY".equals(userPO.getPurpose())) { %>
                     builtNewMenu(cd_i_opt);
              <%} else {%>
                       builtNewMenu(cd_m_opt);
              <% } %>
              
            <% } %>
                   
        <% } %>
        
         
        <% if (userPO.getOption().equals("LN") && !"FACT".equals(userPO.getSource())) { %>
         
            <% if ("APPROVAL_INQ".equals(userPO.getPurpose())) { %>
                  builtNewMenu(ln_a_opt);
            <% } else { %>
              <% if ("INQUIRY".equals(userPO.getPurpose())) { %>
                     builtNewMenu(ln_i_1_opt);
              <%} else {%>
                       builtNewMenu(ln_m_opt);
              <% } %>
              
            <% } %>
                   
        <% } %>
        
  		<% if (userPO.getOption().equals("DFT") || "FACT".equals(userPO.getSource())) { %>
         
            <% if ("APPROVAL_INQ".equals(userPO.getPurpose()) || "APPROVAL".equals(userPO.getPurpose())) {%>
                  builtNewMenu(dft_a_opt);
            <% } else { %>
              <% if ("INQUIRY".equals(userPO.getPurpose())) { %>
                     builtNewMenu(dft_i_opt);
              <%} else {%>
                       builtNewMenu(dft_m_opt);
              <% } %>
              
            <% } %>
                   
        <% } %>

function goNew() {
	document.forms[0].SCREEN.value="300";
	document.forms[0].submit();
}

function goMant() {
	document.forms[0].SCREEN.value="500";
	document.forms[0].submit();
}

function goInquiry() {
	var row = document.forms[0].ROW.value;
	var pg = "";
	pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD4002?SCREEN=900&ROW="+row;  
	CenterWindow(pg,600,500,2);
}


function goApproval() {
	var row = document.forms[0].ROW.value;
    var pg = "";
	pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD4002?SCREEN=500&ROW="+row;  
	CenterWindow(pg,600,500,2);	
}


function goDelete() {
 	if (!confirm("Desea eliminar este registro seleccionado?")) {
		return;
 	}
	document.forms[0].SCREEN.value="700";
	document.forms[0].submit();
}


<%  
 String title = "Titulares";
%>


</SCRIPT>  

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
    out.println("<SCRIPT> initMenu(); </SCRIPT>");
%>

</head>

<BODY>
<h3 align="center"> <%= title %><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="titu_list.jsp, ESD4002"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD4002" >
  <p> 
   <input type=HIDDEN name="SCREEN" value="800">
   <input type=HIDDEN name="TOTROWS" value="0">
   <input type=HIDDEN name="opt" value="1">
   <INPUT TYPE=HIDDEN name="actRow" value="0">
   <INPUT TYPE=HIDDEN name="NEXTROWS" value="0">
   <INPUT TYPE=HIDDEN name="CURRROWS" value="0">
   <INPUT TYPE=HIDDEN name="FromRecord" value="0"> 
   <INPUT TYPE=HIDDEN name="num" value="0"> 
  </p>

<%if  (userPO.getOption().equals("LN")) { %>
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="14%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="9%" > 
              <div align="left"> 
                <input type="text" name="E02CUN2" size="10" maxlength="9" readonly value="<%= userPO.getCusNum().trim()%>">
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E02NA12" size="45" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap ><b> 
              <input type="text" name="E02PTYP" size="4" maxlength="4" readonly value="<%= userPO.getType().trim()%>">
              <input type="text" name="E02PRO2" size="4" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>">
              </b></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="14%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"> 
                <input type="text" name="E02ACC" size="13" maxlength="12" value="<%= userPO.getAccNum().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%"> 
              <div align="right">Oficial :</div>
            </td>
            <td nowrap width="33%"> 
              <div align="left"><b> 
                <input type="text" name="E02NA122" size="45" maxlength="45" readonly value="<%= userPO.getOfficer().trim()%>">
                </b> </div>
            </td>
            <td nowrap width="11%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="21%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY" size="4" maxlength="3" readonly value="<%= userPO.getCurrency().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

<% } else {%>
 <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
         <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E04DEACUN" size="9" maxlength="9" readonly value="<%= userPO.getCusNum().trim() %>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E04CUSNA1" size="45" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
             <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="prodtyp" id="product" size="4" maxlength="4" readonly value="<%= userPO.getType()%>">
                <input type="text" name="product" id="product" size="4" maxlength="4" readonly value="<%= userPO.getProdCode()%>">
                </b> </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E06ACC" size="12" maxlength="12" value="<%= userPO.getAccNum().trim()%>" readonly >
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda :</b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b></b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
              </div>
            </td>
          </tr>
      </table>
    </td>
  </tr>
 </table>
<% } %>
 
  <p> 
 <%
	if ( ESD400201List.getNoResult() ) {
 %>
  </p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>No hay resultados para su b&uacute;squeda</b></p>
          <table class="tbenter" width=100% align=center>
          
            <%if  ((userPO.getOption().equals("RT")) || (userPO.getOption().equals("SV"))) { %>          
               
                <% if ("APPROVAL_INQ".equals(userPO.getPurpose()) || "APPROVAL".equals(userPO.getPurpose())) {%>
                <% if (!userPO.getSource().equals("FACT")) { %>
                    <tr>
                      <td class=TDBKG width="30%"> 
                        <div align="center"><a href="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000A?SCREEN=3"><b>Regresar</b></a></div>
                     </td>
                   </tr>
                   <% } %>
               <% } else { %>
             
                     <% if ("INQUIRY".equals(userPO.getPurpose())) { %>  
                      <tr>
                        <td class=TDBKG width="30%"> 
                           <div align="center"><a href="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000I?SCREEN=31"><b>Regresar</b></a></div>
                       </td>
                      </tr>  
                     <%} else {%>
                     <tr>
                        <td class=TDBKG width="30%"> 
                           <div align="center"><a href="javascript:goNew()"><b>Crear</b></a></div>              
                        </td>
                        <td class=TDBKG width="30%"> 
                          <div align="center"><a href="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDD0000?SCREEN=3"><b>Regresar</b></a></div>
                        </td>
                     </tr>           
                    <% } %>
            
               <% } %>
                
            <% } %>      
             
           
             <%if  (userPO.getOption().equals("CD")) { %>          
               
                <% if ("APPROVAL_INQ".equals(userPO.getPurpose()) || "APPROVAL".equals(userPO.getPurpose())) {%>
                    <tr>
                      <td class=TDBKG width="30%"> 
                        <div align="center"><a href="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130A?SCREEN=3"><b>Regresar</b></a></div>
                     </td>
                   </tr>
               <% } else { %>
             
                     <% if ("INQUIRY".equals(userPO.getPurpose())) { %>  
                      <tr>
                        <td class=TDBKG width="30%"> 
                           <div align="center"><a href="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130I?SCREEN=41"><b>Regresar</b></a></div>
                       </td>
                      </tr>  
                     <%} else {%>
                     <tr>
                        <td class=TDBKG width="30%"> 
                           <div align="center"><a href="javascript:goNew()"><b>Crear</b></a></div>              
                        </td>
                        <td class=TDBKG width="30%"> 
                          <div align="center"><a href="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130?SCREEN=3"><b>Regresar</b></a></div>
                        </td>
                     </tr>           
                    <% } %>
            
               <% } %>
                
            <% } %>      
           
           
               <%if  (userPO.getOption().equals("LN") && !"FACT".equals(userPO.getSource())) { %>
               
                <% if ("APPROVAL_INQ".equals(userPO.getPurpose()) || "APPROVAL".equals(userPO.getPurpose())) {%>
                <% if (0 > 1) { %>
                    <tr>
                      <td class=TDBKG width="30%"> 
                        <div align="center"><a href="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0150A?SCREEN=3"><b>Regresar</b></a></div>
                     </td>
                   </tr>
                   <% } %>
               <% } else { %>
             
                     <% if ("INQUIRY".equals(userPO.getPurpose())) { %>  
                      <tr>
                        <td class=TDBKG width="30%"> 
                           <div align="center"><a href="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDL0160?SCREEN=1"><b>Regresar</b></a></div>
                       </td>
                      </tr>  
                     <%} else {%>
                     <tr>
                        <td class=TDBKG width="30%"> 
                           <div align="center"><a href="javascript:goNew()"><b>Crear</b></a></div>              
                        </td>
                        <td class=TDBKG width="30%"> 
                          <div align="center"><a href="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0150?SCREEN=3"><b>Regresar</b></a></div>
                        </td>
                     </tr>           
                    <% } %>
            
               <% } %>
                
            <% } %>   
            
     		 <%if  (userPO.getOption().equals("DFT") || "FACT".equals(userPO.getSource())) { %>
               
                <% if ("APPROVAL_INQ".equals(userPO.getPurpose()) || "APPROVAL".equals(userPO.getPurpose())) {%>
                    <% if (0 > 1) { %>
                    <tr>
                      <td class=TDBKG width="30%"> 
                        <div align="center"><a href="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0800?SCREEN=1200"><b>Regresar</b></a></div>
                     </td>
                   </tr>
                   <% } %>
               <% } else { %>
             
                     <% if ("INQUIRY".equals(userPO.getPurpose())) { %>  
                      <tr>
                        <td class=TDBKG width="30%"> 
                           <div align="center"><a href="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0800?SCREEN=1400"><b>Regresar</b></a></div>
                       </td>
                      </tr>  
                     <%} else {%>
                     <tr>
                        <td class=TDBKG width="30%"> 
                           <div align="center"><a href="javascript:goNew()"><b>Crear</b></a></div>
                        </td>
                        <td class=TDBKG width="30%"> 
                          <div align="center"><a href="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0800?SCREEN=400"><b>Regresar</b></a></div>
                        </td>
                     </tr>           
                    <% } %>
            
               <% } %>
                
            <% } %>    
           
               
          </table>
          <p>&nbsp;</p>
          
        </div>

	   </TD>
	 </TR>
   </TABLE>
	
  <%}
	else {%> <% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%> 
  <p> 
          
  <table class="tbenter" width=100% align=center>

      <%if  ((userPO.getOption().equals("RT")) || (userPO.getOption().equals("SV"))) { %>          
               
            <% if ("APPROVAL_INQ".equals(userPO.getPurpose())) {%>
              <tr> 
                <td class=TDBKG width="30%"> 
		           <div align="center"><a href="javascript:goApproval()"><b>Visualizar</b></a></div>
                </td>
              </tr>
            <% } else { %>
                 <% if ("INQUIRY".equals(userPO.getPurpose())) { %>    
                    <tr> 
                       <td class=TDBKG width="30%"> 
		                 <div align="center"><a href="javascript:goInquiry()"><b>Consultar</b></a></div>
                       </td>
                   </tr>   
                 <%} else {%>   
                    <tr> 
                      <td class=TDBKG width="30%"> 
		                 <div align="center"><a href="javascript:goNew()"><b>Crear</b></a></div>
                      </td>
		              <td class=TDBKG width="30%"> 
                         <div align="center"><a href="javascript:goMant()"><b>Modificar</b></a></div>
                      </td>
	                  <td class=TDBKG width="30%"> 
                        <div align="center"><a href="javascript:goDelete()"><b>Borrar</b></a></div>
                     </td>
                     <% if ( userPO.getOption().equals("RT") ) { %>
                       <td class=TDBKG width="30%"> 
                         <div align="center"><a href="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDD0000?SCREEN=3"><b>Salir</b></a></div>
                       </td>
                     <% } else if ( userPO.getOption().equals("SV") ) { %>
                       <td class=TDBKG width="30%"> 
                         <div align="center"><a href="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDD0000?SCREEN=27"><b>Salir</b></a></div>
                       </td>
                     <% } %>       
                   </tr>                   
                   <% } %>
               <% } %>
         <% } %>         
        
        
        
          <%if  (userPO.getOption().equals("CD")) { %>          
               
            <% if ("APPROVAL_INQ".equals(userPO.getPurpose())) {%>
              <tr> 
                <td class=TDBKG width="30%"> 
		           <div align="center"><a href="javascript:goApproval()"><b>Visualizar</b></a></div>
                </td>
              </tr>
            <% } else { %>
                 <% if ("INQUIRY".equals(userPO.getPurpose())) { %>    
                    <tr> 
                       <td class=TDBKG width="30%"> 
		                 <div align="center"><a href="javascript:goInquiry()"><b>Consultar</b></a></div>
                       </td>
                   </tr>   
                 <%} else {%>   
                    <tr> 
                      <td class=TDBKG width="30%"> 
		                 <div align="center"><a href="javascript:goNew()"><b>Crear</b></a></div>
                      </td>
		              <td class=TDBKG width="30%"> 
                         <div align="center"><a href="javascript:goMant()"><b>Modificar</b></a></div>
                      </td>
	                  <td class=TDBKG width="30%"> 
                        <div align="center"><a href="javascript:goDelete()"><b>Borrar</b></a></div>
                     </td>
                     <td class=TDBKG width="30%"> 
                        <div align="center"><a href="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDL0130?SCREEN=3"><b>Salir</b></a></div>
                     </td>
                   </tr>
                      <% } %>
               <% } %>
            <% } %>         
    
          <%if  (userPO.getOption().equals("LN") && !"FACT".equals(userPO.getSource())) { %>
               
            <% if ("APPROVAL_INQ".equals(userPO.getPurpose())) {%>
              <tr> 
                <td class=TDBKG width="30%"> 
		           <div align="center"><a href="javascript:goApproval()"><b>Visualizar</b></a></div>
                </td>
              </tr>
            <% } else { %>
                 <% if ("INQUIRY".equals(userPO.getPurpose())) { %>    
                    <tr> 
                       <td class=TDBKG width="30%"> 
		                 <div align="center"><a href="javascript:goInquiry()"><b>Consultar</b></a></div>
                       </td>
					   <td class=TDBKG width="30%"> 
						   <div align="center"><a href="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDL0160?SCREEN=1"><b>Regresar</b></a></div>
                       </td>
                   </tr>   
                 <%} else {%>   
                    <tr> 
                      <td class=TDBKG width="30%"> 
		                 <div align="center"><a href="javascript:goNew()"><b>Crear</b></a></div>
                      </td>
		              <td class=TDBKG width="30%"> 
                         <div align="center"><a href="javascript:goMant()"><b>Modificar</b></a></div>
                      </td>
	                  <td class=TDBKG width="30%"> 
                        <div align="center"><a href="javascript:goDelete()"><b>Borrar</b></a></div>
                     </td>
                     <td class=TDBKG width="30%"> 
                        <div align="center"><a href="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDL0150?SCREEN=3"><b>Salir</b></a></div>
                     </td>
                   </tr>
                      <% } %>
               <% } %>
            <% } %>         
            
          <%if  (userPO.getOption().equals("DFT") || "FACT".equals(userPO.getSource())) { %>
               
            <% if ("APPROVAL_INQ".equals(userPO.getPurpose()) || "APPROVAL".equals(userPO.getPurpose())) {%>
              <tr> 
                <td class=TDBKG width="30%"> 
		           <div align="center"><a href="javascript:goApproval()"><b>Visualizar</b></a></div>
                </td>
              </tr>
            <% } else { %>
                 <% if ("INQUIRY".equals(userPO.getPurpose())) { %>    
                    <tr> 
                       <td class=TDBKG width="30%"> 
		                 <div align="center"><a href="javascript:goInquiry()"><b>Consultar</b></a></div>
                       </td>
					   <td class=TDBKG width="30%"> 
						   <div align="center"><a href="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0800?SCREEN=1400"><b>Regresar</b></a></div>
                       </td>
                   </tr>   
                 <%} else {%>   
                    <tr> 
                      <td class=TDBKG width="30%"> 
		                 <div align="center"><a href="javascript:goNew()"><b>Crear</b></a></div>
                      </td>
		              <td class=TDBKG width="30%"> 
                         <div align="center"><a href="javascript:goMant()"><b>Modificar</b></a></div>
                      </td>
	                  <td class=TDBKG width="30%"> 
                        <div align="center"><a href="javascript:goDelete()"><b>Borrar</b></a></div>
                     </td>
                     <td class=TDBKG width="30%"> 
                        <div align="center"><a href="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0800?SCREEN=400"><b>Salir</b></a></div>
                     </td>
                   </tr>
                      <% } %>
               <% } %>
            <% } %>    
        
        
  </table>
   
  <br>
  <table  id=cfTable class="tableinfo">
    <tr > 
      <td NOWRAP valign="top" width="100%"> 
        <table id="dataTable" width="100%">
          <tr id="trdark"> 
            <th align=center nowrap width="5%">&nbsp;</th>
            <th align=center nowrap width="5%"> N&uacute;mero Titular</th>
            <th align=center nowrap width="10%"> Cliente</th>
            <th align=center nowrap width="30%"> Nombre</th>
            <th align=center nowrap width="15%"> Tipo Relaci&oacute;n</th>
            <th align=center nowrap width="5%"> Estado Registro</th>
          </tr>
          
          <%
    	  int i = 0;
          ESD400201List.initRow();    
          while (ESD400201List.getNextRow()) {
            ESD400201Message msgList = (ESD400201Message) ESD400201List.getRecord();	 
         %>   
             
          
          <tr id="dataTable<%= ESD400201List.getCurrentRow() %>"> 
            
            <td NOWRAP align="center" width="5%">
           	  <INPUT TYPE="radio" name="ROW"  value="<%= msgList.getE01MAN()%>" 
           	  	onclick="highlightRow('dataTable', <%= ESD400201List.getCurrentRow() %>);"
           	  	<% if (ESD400201List.getCurrentRow() == 0) out.print(" checked"); %>>
		    </td>
		    <td NOWRAP  align=center width="10%"><%= msgList.getE01MAN() %></td>
            <td NOWRAP  align=center width="10%"><%= msgList.getE01RCN() %></td>
            <td NOWRAP  align=center width="10%"><%= msgList.getE01MA1() %></td>
            <td NOWRAP  align=center width="10%"><%= msgList.getD01TIT() %></td>
            <td NOWRAP  align=center width="40%"><%= msgList.getD01RTY() %></td>
            
          </tr>
          
            <% 
       	       i++; 
              } 
             %> 
        </table>
  </table>
     
<SCRIPT type="text/javascript">
   showChecked("ROW");     
</SCRIPT>

<%}%>
	

  </form>

</body>
</html>
