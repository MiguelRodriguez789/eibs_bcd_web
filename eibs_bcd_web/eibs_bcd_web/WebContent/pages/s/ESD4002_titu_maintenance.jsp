<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<html>
<head>
<title>Titulares</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="tituDetails" class="datapro.eibs.beans.ESD400201Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>

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
         
            <% if ("APPROVAL_INQ".equals(userPO.getPurpose())) {%>
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
         
            <% if ("APPROVAL_INQ".equals(userPO.getPurpose())) {%>
                  builtNewMenu(cd_a_opt);
            <% } else { %>
              <% if ("INQUIRY".equals(userPO.getPurpose())) { %>
                     builtNewMenu(cd_i_opt);
              <%} else {%>
                       builtNewMenu(cd_m_opt);
              <% } %>
              
            <% } %>
                   
        <% } %>
        
   
  <%
	 String title = "Titulares";
	 String indtitle = "Titulares";
	
   %>
  
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


<H3 align="center"><%= title %> <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="titu_maintenance.jsp, ESD4002"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD4002" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
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
                <input type="text" name="E06ACC" size="12" maxlength="12" value="<%= userPO.getAccNum()%>" readonly >
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
    
  
 
  
  <h4><%= indtitle %></h4>
  
   <% if (("APPROVAL_INQ".equals(userPO.getPurpose())) || ("INQUIRY".equals(userPO.getPurpose()))) {%>
    
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
      
       	  <tr id="trdark"> 
            <td nowrap width="50%"> 
              <div align="right">Consecutivo <%=indtitle %> :</div>
            </td>
            <td nowrap width="50%"> 
              <eibsinput:text name="tituDetails" property="E01MAN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_SEQUENCE %>"  readonly="true"/>
            </td>
          </tr>
           
          <tr id="trclear"> 
            <td nowrap width="50%"> 
              <div align="right">Cliente :</div>
            </td>
            <td nowrap width="80%" colspan="3"> 
                <eibsinput:text name="tituDetails" property="E01RCN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" required="false" readonly="true"/>
            </td>
          </tr> 
                
       
         <tr id="trdark"> 
           <td nowrap width="50%"> 
             <div align="right">Nombre :</div>
           </td>
           <td nowrap width="50%">
			 <eibsinput:text name="tituDetails" property="E01MA1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false" readonly="true"/>                
		   </td>
         </tr> 
         
         <tr id="trclear"> 
           <td nowrap width="50%"> 
             <div align="right">Identificaci&oacute;n :</div>
           </td>
           <td nowrap width="50%">
			 <eibsinput:text name="tituDetails" property="E01BNI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false" readonly="true"/>                
		   </td>
         </tr> 
          
          <tr id="trdark"> 
           <td nowrap width="50%"> 
             <div align="right">Tipo Relaci&oacute;n :</div>
           </td>
           <td nowrap width="50%">
			 <eibsinput:text name="tituDetails" property="E01TIT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" required="false" readonly="true"/>      
			 <eibsinput:text name="tituDetails" property="D01TIT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false" readonly="true"/>
		   </td>
         </tr> 
         
          <tr id="trclear"> 
           <td nowrap width="50%"> 
             <div align="right">Porcentaje de Relaci&oacute;n :</div>
           </td>
           <td nowrap width="50%">
			 <eibsinput:text name="tituDetails" property="E01AM1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" maxlength="5" size="8" required="false" readonly="true"/>                
		   </td>
         </tr>  
           
        </table>
      </td>
    </tr>
  </table>
  <br>
  
  
  
  <% } else { %>
        
  
    
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
      
       	  <tr id="trdark"> 
            <td nowrap width="50%"> 
              <div align="right">Consecutivo <%=indtitle %> :</div>
            </td>
            <td nowrap width="50%"> 
              <eibsinput:text name="tituDetails" property="E01MAN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_SEQUENCE %>"  readonly="true"/>
            </td>
          </tr>         
           
          <tr id="trclear"> 
          
             <td nowrap width="50%"> 
                <div align="right">Cliente :</div>
             </td>
             <td nowrap width="50%">
              	<eibsinput:help name="tituDetails" property="E01RCN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" fn_param_one="E01RCN" fn_param_two="E01MA1" fn_param_three="E01BNI" help="<%=HelpTypes.CUSTOMER_NUMBER %>" required="true"  readonly="false"/>                  
             </td>
         </tr>   
           
       
         <tr id="trdark"> 
           <td nowrap width="50%"> 
             <div align="right">Nombre :</div>
           </td>
           <td nowrap width="50%">
              <eibsinput:text name="tituDetails" property="E01MA1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false"  readonly="true"/>                
			
		   </td>
         </tr> 
         
         <tr id="trclear"> 
           <td nowrap width="50%"> 
             <div align="right">Identificaci&oacute;n :</div>
           </td>
           <td nowrap width="50%">
             <eibsinput:text name="tituDetails" property="E01BNI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" required="false"  readonly="true"/>    
			
		   </td>
         </tr> 
         
         
         <tr id="trdark"> 
           <td nowrap width="50%"> 
             <div align="right">Tipo de Relaci&oacute;n :</div>
           </td>
           <td nowrap width="50%">
              <eibsinput:cnofc name="tituDetails" property="E01TIT" required="false" flag="T8" fn_code="E01TIT" fn_description="D01TIT"/>
              <eibsinput:text property="D01TIT" name="tituDetails" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true"/> 			
		   </td>
         </tr> 
         
         <tr id="trclear"> 
           <td nowrap width="50%"> 
             <div align="right">Porcentaje de Relaci&oacute;n :</div>
           </td>
           <td nowrap width="50%">
			 <eibsinput:text name="tituDetails" property="E01AM1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" maxlength="6" size="8" required="false" readonly="false"/>                
		   </td>
         </tr> 
           
        </table>
      </td>
    </tr>
  </table>
  <br>
  
     
       <div align="center"> 
           <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
       </div>
    
    <% } %> 
    
      
  </form>
</body>
</HTML>
