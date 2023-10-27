<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>


<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<html>
<head>
<title>References</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="reference" class="datapro.eibs.beans.ESD401001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
 
 
 <SCRIPT type="text/javascript">
 	var jsIsCustomer = "";
 
 <% 
 	boolean isApprovalInquiry = userPO.getPurpose().equals("APPROVAL_INQ");
 	boolean isInquiry = userPO.getPurpose().equals("INQUIRY");
 	boolean isReadOnly = isApprovalInquiry || isInquiry;
 	boolean isCustomer = !reference.getField("E01RCN").getString().trim().equals("0");  
    String country = reference.getField("E01INT").toString().trim();    	
 
 	if (isApprovalInquiry) {%>
		<% if ( userPO.getOption().equals("CLIENT_P") ) { %>
		     builtNewMenu(client_ap_personal_opt);
         <% } else {  %>
		     builtNewMenu(client_ap_corp_opt);
         <% } %>
   <% } else if (isInquiry) { %>
	    <% if ( userPO.getOption().equals("CLIENT_P") ) { %>
		     builtNewMenu(client_inq_personal_opt);
         <% } else {  %>
		     builtNewMenu(client_inq_corp_opt);
         <% } %>	 
   <%} else {%>
         <% if ( userPO.getOption().equals("CLIENT_P") ) { %>
		     builtNewMenu(client_personal_opt);
         <% } else {  %>
		     builtNewMenu(client_corp_opt);
         <% } %>
   <% } %> 
 </SCRIPT>  
<%  
	 String title = "Referencias";
	 String subtitle = " ";
	 if ( userPO.getHeader10().equals("6") ) {
	 	subtitle = " Bancarias";
	 }
	 if ( userPO.getHeader10().equals("7") ) {
	 	subtitle = " Comerciales";
	 }
	 if ( userPO.getHeader10().equals("P") ) {
          if ( userPO.getOption().equals("CLIENT_P") ) { 	
		 	subtitle = " Personales";
		  }
	      else {	
		 	subtitle = " ";
		  }
	 }
	 if ( userPO.getHeader10().equals("F") ) {
          if ( userPO.getOption().equals("CLIENT_P") ) { 	
		 	subtitle = " Familiares";
		  }
	      else {	
		 	subtitle = " ";
		  }
	 }
%>

<%  
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    out.println("<SCRIPT> initMenu(); </SCRIPT>");  
%>


<H3 align="center"><%= title %> <%= subtitle %><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="reference_maintenance.jsp, ESD4010"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD4010" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
  <input type=HIDDEN name="E01MAN"  value="<%= reference.getE01MAN().trim()%>">
  
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr>
             <td nowrap width="10%" align="right"> Cliente: 
              </td>
             <td nowrap width="12%" align="left">
      			<%= userPO.getHeader1()%>
             </td>
             <td nowrap width="6%" align="right">ID:  
             </td>
             <td nowrap width="14%" align="left">
      			<%= userPO.getHeader2()%>
             </td>
             <td nowrap width="8%" align="right"> Nombre: 
               </td>
             <td nowrap width="50%"align="left">
      			<%= userPO.getHeader3()%>
             </td>
        </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4> <%= title + " : " + reference.getE01MAN() %> </h4>
    
   <% if (!reference.getE01RTP().equals("1")) { //Others %>

	  <table  class="tableinfo">
	    <tr bordercolor="#FFFFFF"> 
	      <td nowrap> 
	        <table cellspacing="0" cellpadding="2" width="100%" border="0">


          <tr id="trdark"> 
            <td nowrap width="38%"> 
              <div align="right">Entidad Financiera :</div>
            </td>
             <td nowrap colspan="2" width="62%">         
                 <eibsinput:cnofc name="reference" property="E01CTY" required="false" flag="X3" fn_code="E01CTY" fn_description="E01MA1" readonly="<%=isReadOnly %>"/>
                 <eibsinput:text property="E01MA1" name="reference" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true"/>
               </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="38%"> 
              <div align="right">Oficial/Contacto 
                :</div>
            </td>
           <td nowrap colspan="2" width="62%">
			 <eibsinput:text name="reference" property="E01MA3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" required="false" readonly="<%=isReadOnly %>"/>                
		   </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="38%"> 
              <div align="right">N&uacute;mero 
                de Tel&eacute;fono :</div>
            </td>
              <td nowrap colspan="2" width="62%">         
				  <eibsinput:text name="reference" property="E01HPN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE %>" required="false"  readonly="<%=isReadOnly%>"/>                
               </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="38%"> 
              <div align="right">Tipo de Cuenta :</div>
            </td>
              <td nowrap colspan="2" width="62%">   
            <SELECT name="E01BNC" <%=isReadOnly?"disabled":""%>>
                    <OPTION value="">--Seleccione--</OPTION>
					<OPTION value="CC" <%if(reference.getE01BNC().equals("CC"))out.print("selected"); %>>Cuenta Corriente</OPTION>
					<OPTION value="CV" <%if(reference.getE01BNC().equals("CV"))out.print("selected"); %>>Cuenta Vista</OPTION>
					<OPTION value="AH" <%if(reference.getE01BNC().equals("AH"))out.print("selected"); %>>Cuenta de Ahorro</OPTION>
			</SELECT>              
            </td>
            </tr> 
            <tr id="trdark"> 
            <td nowrap width="38%"> 
              <div align="right">N&uacute;mero de Cuenta :</div>
            </td>
            <td nowrap colspan="2" width="62%">
			 <eibsinput:text name="reference" property="E01MA2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" required="false"  readonly="<%=isReadOnly %>"/>                
		   </td>           
		    </tr>
	        <tr id="trclear"> 
          <td nowrap width="38%"> 
            <div align="right">Inicio Mandato :</div>
          </td>
            <td nowrap colspan="2" width="62%"> 
          	 <eibsinput:date name="reference"  fn_day="E01DTD" fn_month="E01DTM" fn_year="E01DTY"  readonly="<%=isReadOnly %>"></eibsinput:date>           
          </td>
        </tr>
          <tr id="trdark"> 
            <td nowrap width="38%"> 
              <div align="right">Estado del Mandato :</div>
            </td>
            <td nowrap colspan="2" width="62%"> 
            <SELECT name="E01RTY" <%=isReadOnly?"disabled":""%>>
                    <OPTION value="">--Seleccione--</OPTION>
                    <option value="A" <%if (reference.getE01RTY().equals("A")) out.print("selected"); %>>Activo</OPTION>
					<OPTION value="I" <%if (reference.getE01RTY().equals("I"))out.print("selected"); %>>Inactivo</OPTION>
			</SELECT>              
            </td>
           </tr>             
          <tr id="trclear"> 
            <td nowrap width="38%"> 
              <div align="right">Saldo 
                Promedio:</div>
            </td>
            <td nowrap colspan="2" width="62%"> 
            <SELECT name="E01BSX" <%=isReadOnly?"disabled":""%>>
                    <OPTION value="">--Seleccione--</OPTION>
					<OPTION value="3" <%if(reference.getField("E01BSX").getString().trim().equals("3")){%> selected <%}%> >3 cifras</OPTION>
					<OPTION value="4" <%if(reference.getField("E01BSX").getString().trim().equals("4")){%> selected <%}%>>4 cifras</OPTION>
					<OPTION value="5" <%if(reference.getField("E01BSX").getString().trim().equals("5")){%> selected <%}%>>5 cifras</OPTION>
					<OPTION value="6" <%if(reference.getField("E01BSX").getString().trim().equals("6")){%> selected <%}%>>6 cifras</OPTION>
					<OPTION value="7" <%if(reference.getField("E01BSX").getString().trim().equals("7")){%> selected <%}%>>7 cifras</OPTION>
					<OPTION value="8" <%if(reference.getField("E01BSX").getString().trim().equals("8")){%> selected <%}%>>8 cifras</OPTION>
					<OPTION value="9" <%if(reference.getField("E01BSX").getString().trim().equals("9")){%> selected <%}%>>9 cifras</OPTION>
					<OPTION value="0" <%if(reference.getField("E01BSX").getString().trim().equals("0")){%> selected <%}%>>10 cifras</OPTION>
					<OPTION value="1" <%if(reference.getField("E01BSX").getString().trim().equals("1")){%> selected <%}%>>11 cifras</OPTION>
					<OPTION value="2" <%if(reference.getField("E01BSX").getString().trim().equals("2")){%> selected <%}%>>12 cifras</OPTION>
			</SELECT>
			<SELECT	name="E01BMS" <%=isReadOnly?"disabled":""%>>
			        <OPTION value="">--Seleccione--</OPTION>
					<OPTION value="A" <%if(reference.getField("E01BMS").getString().trim().equals("A")){%> selected <%}%> >Altas</OPTION>
					<OPTION value="M" <%if(reference.getField("E01BMS").getString().trim().equals("M")){%> selected <%}%> >Medias</OPTION>
					<OPTION value="B" <%if(reference.getField("E01BMS").getString().trim().equals("B")){%> selected <%}%> >Bajas</OPTION>
				</SELECT></td>
          </tr>
       <%if  (isReadOnly) { %>
            <tr id="trdark"> 
          <td nowrap width="38%"> 
            <div align="right">Suc/Usuario Mandato :</div>
          </td>
            <td nowrap colspan="2" width="62%"> 
			 <eibsinput:text name="reference" property="E01UC1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BATCH %>" required="false"  readonly="true"/>   
			 <eibsinput:text name="reference" property="E01POB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DOCUMENT_CODE %>" required="false"  readonly="true"/>                                           
          </td>
           </tr>
        <%} %>
	    </table>
	      </td>
	    </tr>
	  </table>
	        
   <%} %>
  
  <br>
  
  
     <%if  (!isReadOnly) { %>
       <div align="center"> 
           <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
       </div>
     <% } %>  
     
  </form>
</body>
</HTML>
