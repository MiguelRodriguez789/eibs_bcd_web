<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Tablas de prevision</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"></head>

<jsp:useBean id="prevDetails" class="datapro.eibs.beans.EDL052201Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
%>


<H3 align="center">Tabla de Previsi&oacute;n<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="prevision_detail.jsp, EDL0522"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0522" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
  
  <%int row = 0; %>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Tabla :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
               <% if(userPO.getPurpose().equals("NEW")){ %>  
	                <input type="text" name="E01PRVTBL" size="3" maxlength="2"  value="<%= prevDetails.getE01PRVTBL().trim()%>" >
				<% } else { %>
	                <input type="text" name="E01PRVTBL" size="3" maxlength="2"  value="<%= prevDetails.getE01PRVTBL().trim()%>" readonly >
				<% } %>
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Descripci&oacute;n :</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
                <input type="text" name="E01PRVDSC" size="48"  maxlength="45" value="<%= prevDetails.getE01PRVDSC().trim()%>">
                </font></font></font></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>  
<%if(prevDetails.getH01FLGWK1().equals("C")){%>  
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
     
          <%if(prevDetails.getH01FLGWK1().equals("C")){%>  
     
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
      
       	    <td nowrap width="10%"> 
            </td>
      		 <td nowrap width="10%"> 
            </td>
      	    <td nowrap width="20%"> 
              <div align="center"><b>PUNTAJES HASTA---></b></div>
            </td>
           <td nowrap width="10%"> 
            </td>
      	    <td nowrap width="20%"> 
            </td>
      	    <td nowrap width="10%"> 
            </td>
      	    <td nowrap width="20%"> 
            </td>
      	    <td nowrap width="10%"> 
            </td>
      	  
       	  </tr>   
     	 <% } %>	
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="10%"> 
              <div align="center"><b>Nivel</b></div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"><b>Alturas de <br>
                Mora</b></div>
            </td>
             
             <td nowrap width="20%"> 
              <div align="center"><b>General <br>
                Automóviles</b></div>
            </td>
           
             
             <td nowrap width="10%"> 
              <div align="center"><b>General <br>
                Otros</b></div>
            </td>
            
      
             <td nowrap width="20%"> 
              <div align="center"><b>Tarjeta de <br>
                Crédito</b></div>
            </td>
          
	         <td nowrap width="10%"> 
              <div align="center"><b>CFC <br>
                Automóviles</b></div>
            </td>
            
             <td nowrap width="20%"> 
              <div align="center"><b>CFC <br>
                Otros</b></div>
            </td>
          
			<td nowrap width="10%"> 
              <div align="center"><b>% PDI </b></div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"><b>C&oacute;digo <br>
                Calificaci&oacute;n</b></div>
            </td>			
  
            <td nowrap width="10%"> 
              <div align="center"><b>Calificaci&oacute;n<br>
                Homologada</b></div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap height="23"> 
              <div align="center"><b>1</b></div>
            </td>
            <td nowrap height="23"> 
              <div align="center"> 
	               <eibsinput:text	name="prevDetails" property="E01PRVDY1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>
            </td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPG1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVMP1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <%}%>
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPP1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPI1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPO1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
			<td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPD1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA1().trim()%>" name="E01PRVCA1" >
               <a href="javascript:GetCodeCNOFC('E01PRVCA1','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> 
              </div>
            </td>
		
            <%if(currUser.getE01INT().equals("05")){%>  
            <td nowrap height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCH1().trim()%>" name="E01PRVCH1" >
			<a href="javascript:GetCodeCNOFC('E01PRVCH1','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> 	
              </div>
            </td>
            <%}%>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  height="23"> 
              <div align="center"><b>2</b></div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVDY2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>
            </td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPG2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVMP2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <%}%>
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPP2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPI2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
             <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPO2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
			<td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPD2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA2().trim()%>" name="E01PRVCA2" >
                <a href="javascript:GetCodeCNOFC('E01PRVCA2','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> 
              </div>
            </td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <td nowrap height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCH2().trim()%>" name="E01PRVCH2" >
			<a href="javascript:GetCodeCNOFC('E01PRVCH2','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> 	
              </div>
            </td>
            <%}%>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  height="23"> 
              <div align="center"><b>3</b></div>
            </td>
            <td nowrap  height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVDY3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>
            </td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPG3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVMP3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <%}%>
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPP3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap  height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPI3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPO3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
			<td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPD3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA3().trim()%>" name="E01PRVCA3" >
                <a href="javascript:GetCodeCNOFC('E01PRVCA3','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> 
              </div>
            </td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <td nowrap height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCH3().trim()%>" name="E01PRVCH3" >
			<a href="javascript:GetCodeCNOFC('E01PRVCH3','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> 	
              </div>
            </td>
            <%}%>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  height="23"> 
              <div align="center"><b>4</b></div>
            </td>
            <td nowrap  height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVDY4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>
            </td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPG4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVMP4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <%}%>
            <td nowrap  height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPP4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPI4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPO4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
			<td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPD4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA4().trim()%>" name="E01PRVCA4" >
                <a href="javascript:GetCodeCNOFC('E01PRVCA4','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> 
              </div>
            </td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <td nowrap height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCH4().trim()%>" name="E01PRVCH4" >
			<a href="javascript:GetCodeCNOFC('E01PRVCH4','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> 					
              </div>
            </td>
            <%}%>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  height="23"> 
              <div align="center"><b>5</b></div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVDY5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>
            </td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPG5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVMP5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <%}%>
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPP5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPI5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPO5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
			<td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPD5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap  height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA5().trim()%>" name="E01PRVCA5" >
                <a href="javascript:GetCodeCNOFC('E01PRVCA5','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> 
              </div>
            </td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <td nowrap height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCH5().trim()%>" name="E01PRVCH5" >
			<a href="javascript:GetCodeCNOFC('E01PRVCH5','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> 								
              </div>
            </td>
            <%}%>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap height="23"> 
              <div align="center"><b>6</b></div>
            </td>
            <td nowrap  height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVDY6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>
            </td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPG6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVMP6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <%}%>
            <td nowrap  height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPP6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap  height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPI6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
             <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPO6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
			<td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPD6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap  height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA6().trim()%>" name="E01PRVCA6" >
                <a href="javascript:GetCodeCNOFC('E01PRVCA6','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> 
              </div>
            </td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <td nowrap height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCH6().trim()%>" name="E01PRVCH6" >
			<a href="javascript:GetCodeCNOFC('E01PRVCH6','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> 												
              </div>
            </td>
            <%}%>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  height="23"> 
              <div align="center"><b>7</b></div>
            </td>
            <td nowrap  height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVDY7" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>
            </td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPG7" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVMP7" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <%}%>
            <td nowrap  height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPP7" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap  height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPI7" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPO7" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
			<td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPD7" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap  height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA7().trim()%>" name="E01PRVCA7" >
                <a href="javascript:GetCodeCNOFC('E01PRVCA7','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> 
              </div>
            </td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <td nowrap height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCH7().trim()%>" name="E01PRVCH7" >
			<a href="javascript:GetCodeCNOFC('E01PRVCH7','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> 																
              </div>
            </td>
            <%}%>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  height="23"> 
              <div align="center"><b>8</b></div>
            </td>
            <td nowrap  height="23"> 
              <div align="center">
 	               <eibsinput:text	name="prevDetails" property="E01PRVDY8" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>
            </td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPG8" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVMP8" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <%}%>
            <td nowrap  height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPP8" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap  height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPI8" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPO8" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
			<td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPD8" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap width="28%" height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA8().trim()%>" name="E01PRVCA8" >
                <a href="javascript:GetCodeCNOFC('E01PRVCA8','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> 
              </div>
            </td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <td nowrap height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCH8().trim()%>" name="E01PRVCH8" >
			<a href="javascript:GetCodeCNOFC('E01PRVCH8','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> 																				
              </div>
            </td>
            <%}%>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  height="23"> 
              <div align="center"><b>9</b></div>
            </td>
            <td nowrap  height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVDY9" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>
            </td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPG9" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVMP9" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <%}%>
            <td nowrap  height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPP9" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap  height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPI9" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPO9" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
			<td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPD9" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
           <td nowrap  height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA9().trim()%>" name="E01PRVCA9" >
                <a href="javascript:GetCodeCNOFC('E01PRVCA9','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> 
              </div>
            </td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <td nowrap height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCH9().trim()%>" name="E01PRVCH9" >
			<a href="javascript:GetCodeCNOFC('E01PRVCH9','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> 																								
              </div>
            </td>
            <%}%>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<%}%>  
<%if(prevDetails.getH01FLGWK1().equals("L") ){%>  
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
     

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="10%"> 
              <div align="center"><b>Nivel</b></div>            </td>
            <td nowrap width="10%"> 
              <div align="center"><b>D&iacute;as <br>
                Vencimiento</b></div>            </td>
             
            <td nowrap width="10%"> 
              <div align="center"><b>% PDI </b></div>            </td>
            <td nowrap width="10%"> 
              <div align="center"><b>C&oacute;digo <br>
                Calificaci&oacute;n</b></div>            </td>			
  
            <td nowrap width="10%"> 
              <div align="center"><b>Calificaci&oacute;n<br>
              Homologada</b></div>            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap height="23"> 
              <div align="center"><b>1</b></div>            </td>
            <td nowrap height="23"> 
              <div align="center"> 
	               <eibsinput:text	name="prevDetails" property="E01PRVDY1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>            </td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPD1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>            </td>
            <td nowrap height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA1().trim()%>" name="E01PRVCA1" >
               <a href="javascript:GetCodeCNOFC('E01PRVCA1','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>              </div>            </td>
		
            <%if(currUser.getE01INT().equals("05")){%>  
            <td nowrap height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCH1().trim()%>" name="E01PRVCH1" >
			<a href="javascript:GetCodeCNOFC('E01PRVCH1','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>              </div>            </td>
            <%}%>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  height="23"> 
              <div align="center"><b>2</b></div>            </td>
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVDY2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>            </td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPD2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>            </td>
            <td nowrap height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA2().trim()%>" name="E01PRVCA2" >
                <a href="javascript:GetCodeCNOFC('E01PRVCA2','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>              </div>            </td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <td nowrap height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCH2().trim()%>" name="E01PRVCH2" >
			<a href="javascript:GetCodeCNOFC('E01PRVCH2','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>              </div>            </td>
            <%}%>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  height="23"> 
              <div align="center"><b>3</b></div>            </td>
            <td nowrap  height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVDY3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>            </td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPD3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>            </td>
            <td nowrap height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA3().trim()%>" name="E01PRVCA3" >
                <a href="javascript:GetCodeCNOFC('E01PRVCA3','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>              </div>            </td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <td nowrap height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCH3().trim()%>" name="E01PRVCH3" >
			<a href="javascript:GetCodeCNOFC('E01PRVCH3','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>              </div>            </td>
            <%}%>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  height="23"> 
              <div align="center"><b>4</b></div>            </td>
            <td nowrap  height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVDY4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>            </td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPD4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>            </td>
            <td nowrap height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA4().trim()%>" name="E01PRVCA4" >
                <a href="javascript:GetCodeCNOFC('E01PRVCA4','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>              </div>            </td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <td nowrap height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCH4().trim()%>" name="E01PRVCH4" >
			<a href="javascript:GetCodeCNOFC('E01PRVCH4','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>              </div>            </td>
            <%}%>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  height="23"> 
              <div align="center"><b>5</b></div>            </td>
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVDY5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>            </td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPD5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>            </td>
            <td nowrap  height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA5().trim()%>" name="E01PRVCA5" >
                <a href="javascript:GetCodeCNOFC('E01PRVCA5','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>              </div>            </td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <td nowrap height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCH5().trim()%>" name="E01PRVCH5" >
			<a href="javascript:GetCodeCNOFC('E01PRVCH5','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>              </div>            </td>
            <%}%>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap height="23"> 
              <div align="center"><b>6</b></div>            </td>
            <td nowrap  height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVDY6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>            </td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPD6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>            </td>
            <td nowrap  height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA6().trim()%>" name="E01PRVCA6" >
                <a href="javascript:GetCodeCNOFC('E01PRVCA6','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>              </div>            </td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <td nowrap height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCH6().trim()%>" name="E01PRVCH6" >
			<a href="javascript:GetCodeCNOFC('E01PRVCH6','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>              </div>            </td>
            <%}%>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  height="23"> 
              <div align="center"><b>7</b></div>            </td>
            <td nowrap  height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVDY7" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>            </td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPD7" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>            </td>
            <td nowrap  height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA7().trim()%>" name="E01PRVCA7" >
                <a href="javascript:GetCodeCNOFC('E01PRVCA7','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>              </div>            </td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <td nowrap height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCH7().trim()%>" name="E01PRVCH7" >
			<a href="javascript:GetCodeCNOFC('E01PRVCH7','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>              </div>            </td>
            <%}%>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  height="23"> 
              <div align="center"><b>8</b></div>            </td>
            <td nowrap  height="23"> 
              <div align="center">
 	               <eibsinput:text	name="prevDetails" property="E01PRVDY8" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>            </td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPD8" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>            </td>
            <td nowrap width="28%" height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA8().trim()%>" name="E01PRVCA8" >
                <a href="javascript:GetCodeCNOFC('E01PRVCA8','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>              </div>            </td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <td nowrap height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCH8().trim()%>" name="E01PRVCH8" >
			<a href="javascript:GetCodeCNOFC('E01PRVCH8','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>              </div>            </td>
            <%}%>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  height="23"> 
              <div align="center"><b>9</b></div>            </td>
            <td nowrap  height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVDY9" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>            </td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVPD9" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>            </td>
           <td nowrap  height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA9().trim()%>" name="E01PRVCA9" >
                <a href="javascript:GetCodeCNOFC('E01PRVCA9','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>              </div>            </td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <td nowrap height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCH9().trim()%>" name="E01PRVCH9" >
			<a href="javascript:GetCodeCNOFC('E01PRVCH9','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>              </div>            </td>
            <%}%>
          </tr>
        </table>
      </td>
    </tr>
  </table>


  <%}%>
 <%if(prevDetails.getH01FLGWK1().equals("P") ){%>  
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
     

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="10%"> 
              <div align="center"><b>Nivel</b></div>            </td>
            <td nowrap width="10%"> 
              <div align="center"><b>D&iacute;as <br>
                Vencimiento</b></div>            </td>
             
            <td nowrap width="10%"> 
              <div align="center"><b>C&oacute;digo <br>
                Calificaci&oacute;n</b></div>            </td>			
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap height="23"> 
              <div align="center"><b>1</b></div>            </td>
            <td nowrap height="23"> 
              <div align="center"> 
	               <eibsinput:text	name="prevDetails" property="E01PRVDY1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>            </td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
            <td nowrap height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA1().trim()%>" name="E01PRVCA1" >
              </div>            </td>
		
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  height="23"> 
              <div align="center"><b>2</b></div>            </td>
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVDY2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>            </td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
            <td nowrap height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA2().trim()%>" name="E01PRVCA2" >
              </div>            </td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  height="23"> 
              <div align="center"><b>3</b></div>            </td>
            <td nowrap  height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVDY3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>            </td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
            <td nowrap height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA3().trim()%>" name="E01PRVCA3" >
              </div>            </td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  height="23"> 
              <div align="center"><b>4</b></div>            </td>
            <td nowrap  height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVDY4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>            </td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
            <td nowrap height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA4().trim()%>" name="E01PRVCA4" >
              </div>            </td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  height="23"> 
              <div align="center"><b>5</b></div>            </td>
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVDY5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>            </td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
            <td nowrap  height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA5().trim()%>" name="E01PRVCA5" >
              </div>            </td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap height="23"> 
              <div align="center"><b>6</b></div>            </td>
            <td nowrap  height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVDY6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>            </td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
            <td nowrap  height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA6().trim()%>" name="E01PRVCA6" >
              </div>            </td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  height="23"> 
              <div align="center"><b>7</b></div>            </td>
            <td nowrap  height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVDY7" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>            </td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
            <td nowrap  height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA7().trim()%>" name="E01PRVCA7" >
              </div>            </td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  height="23"> 
              <div align="center"><b>8</b></div>            </td>
            <td nowrap  height="23"> 
              <div align="center">
 	               <eibsinput:text	name="prevDetails" property="E01PRVDY8" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>            </td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
            <td nowrap width="28%" height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA8().trim()%>" name="E01PRVCA8" >
              </div>            </td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  height="23"> 
              <div align="center"><b>9</b></div>            </td>
            <td nowrap  height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVDY9" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>            </td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
            <td nowrap  height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA9().trim()%>" name="E01PRVCA9" >
              </div>            </td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
          </tr>
        </table>
      </td>
    </tr>
  </table>


  <%}%> 
  <%if(prevDetails.getH01FLGWK1().equals("M") ){%>  
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
     

          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="10%"> 
              <div align="center"><b>Nivel</b></div>            </td>
            <td nowrap width="10%"> 
              <div align="center"><b>D&iacute;as <br>
Vencimiento</b></div>            </td>
             
            <td nowrap width="20%"><div align="center"><b>% M&iacute;nimo Provisi&oacute;n<br>
              Neto 
              Garant&iacute;a</b></div></td>
            <td nowrap width="10%"><div align="center"><b>% M&iacute;nimo <br>
              Provisi&oacute;n</b></div></td>
            <td nowrap width="10%"><div align="center"><b>C&oacute;digo <br>
              Calificaci&oacute;n</b></div></td>
            <td nowrap width="10%"><div align="center"><b>Calificaci&oacute;n<br>
              Homologada</b></div></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap height="23"> 
              <div align="center"><b>1</b></div>            </td>
            <td nowrap height="23"> 
              <div align="center"> 
	               <eibsinput:text	name="prevDetails" property="E01PRVDY1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>            </td>
            <td nowrap><div align="center">
                <eibsinput:text	name="prevDetails" property="E01PRVPG1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
            </div></td>
            <td nowrap><div align="center">
                <eibsinput:text	name="prevDetails" property="E01PRVMP1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
            </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA1().trim()%>" name="E01PRVCA1" >
            <a href="javascript:GetCodeCNOFC('E01PRVCA1','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0"  ></a> </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCH1().trim()%>" name="E01PRVCH1" >
            <a href="javascript:GetCodeCNOFC('E01PRVCH1','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> </div></td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  height="23"> 
              <div align="center"><b>2</b></div>            </td>
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVDY2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>            </td>
            <td nowrap><div align="center">
                <eibsinput:text	name="prevDetails" property="E01PRVPG2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
            </div></td>
            <td nowrap><div align="center">
                <eibsinput:text	name="prevDetails" property="E01PRVMP2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
            </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA2().trim()%>" name="E01PRVCA2" >
            <a href="javascript:GetCodeCNOFC('E01PRVCA2','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0"  ></a> </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCH2().trim()%>" name="E01PRVCH2" >
            <a href="javascript:GetCodeCNOFC('E01PRVCH2','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> </div></td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  height="23"> 
              <div align="center"><b>3</b></div>            </td>
            <td nowrap  height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVDY3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>            </td>
            <td nowrap><div align="center">
                <eibsinput:text	name="prevDetails" property="E01PRVPG3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
            </div></td>
            <td nowrap><div align="center">
                <eibsinput:text	name="prevDetails" property="E01PRVMP3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
            </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA3().trim()%>" name="E01PRVCA3" >
            <a href="javascript:GetCodeCNOFC('E01PRVCA3','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0"  ></a> </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCH3().trim()%>" name="E01PRVCH3" >
            <a href="javascript:GetCodeCNOFC('E01PRVCH3','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> </div></td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  height="23"> 
              <div align="center"><b>4</b></div>            </td>
            <td nowrap  height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVDY4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>            </td>
            <td nowrap><div align="center">
                <eibsinput:text	name="prevDetails" property="E01PRVPG4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
            </div></td>
            <td nowrap><div align="center">
                <eibsinput:text	name="prevDetails" property="E01PRVMP4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
            </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA4().trim()%>" name="E01PRVCA4" >
            <a href="javascript:GetCodeCNOFC('E01PRVCA4','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0"  ></a> </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCH4().trim()%>" name="E01PRVCH4" >
            <a href="javascript:GetCodeCNOFC('E01PRVCH4','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> </div></td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  height="23"> 
              <div align="center"><b>5</b></div>            </td>
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVDY5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>            </td>
            <td nowrap><div align="center">
                <eibsinput:text	name="prevDetails" property="E01PRVPG5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
            </div></td>
            <td nowrap><div align="center">
                <eibsinput:text	name="prevDetails" property="E01PRVMP5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
            </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA5().trim()%>" name="E01PRVCA5" >
            <a href="javascript:GetCodeCNOFC('E01PRVCA5','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0"  ></a> </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCH5().trim()%>" name="E01PRVCH5" >
            <a href="javascript:GetCodeCNOFC('E01PRVCH5','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> </div></td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap height="23"> 
              <div align="center"><b>6</b></div>            </td>
            <td nowrap  height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVDY6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>            </td>
            <td nowrap><div align="center">
                <eibsinput:text	name="prevDetails" property="E01PRVPG6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
            </div></td>
            <td nowrap><div align="center">
                <eibsinput:text	name="prevDetails" property="E01PRVMP6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
            </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA6().trim()%>" name="E01PRVCA6" >
            <a href="javascript:GetCodeCNOFC('E01PRVCA6','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0"  ></a> </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCH6().trim()%>" name="E01PRVCH6" >
            <a href="javascript:GetCodeCNOFC('E01PRVCH6','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> </div></td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  height="23"> 
              <div align="center"><b>7</b></div>            </td>
            <td nowrap  height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVDY7" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>            </td>
            <td nowrap><div align="center">
                <eibsinput:text	name="prevDetails" property="E01PRVPG7" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
            </div></td>
            <td nowrap><div align="center">
                <eibsinput:text	name="prevDetails" property="E01PRVMP7" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
            </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA7().trim()%>" name="E01PRVCA7" >
            <a href="javascript:GetCodeCNOFC('E01PRVCA7','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0"  ></a> </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCH7().trim()%>" name="E01PRVCH7" >
            <a href="javascript:GetCodeCNOFC('E01PRVCH7','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> </div></td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  height="23"> 
              <div align="center"><b>8</b></div>            </td>
            <td nowrap  height="23"> 
              <div align="center">
 	               <eibsinput:text	name="prevDetails" property="E01PRVDY8" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>            </td>
            <td nowrap><div align="center">
                <eibsinput:text	name="prevDetails" property="E01PRVPG8" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
            </div></td>
            <td nowrap><div align="center">
                <eibsinput:text	name="prevDetails" property="E01PRVMP8" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
            </div></td>
            <td nowrap width="28%"><div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA8().trim()%>" name="E01PRVCA8" >
            <a href="javascript:GetCodeCNOFC('E01PRVCA8','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0"  ></a> </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCH8().trim()%>" name="E01PRVCH8" >
            <a href="javascript:GetCodeCNOFC('E01PRVCH8','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> </div></td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  height="23"> 
              <div align="center"><b>9</b></div>            </td>
            <td nowrap  height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVDY9" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>            </td>
            <td nowrap><div align="center">
                <eibsinput:text	name="prevDetails" property="E01PRVPG9" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
            </div></td>
            <td nowrap><div align="center">
                <eibsinput:text	name="prevDetails" property="E01PRVMP9" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
            </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA9().trim()%>" name="E01PRVCA9" >
            <a href="javascript:GetCodeCNOFC('E01PRVCA9','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0"  ></a> </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCH9().trim()%>" name="E01PRVCH9" >
            <a href="javascript:GetCodeCNOFC('E01PRVCH9','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> </div></td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
          </tr>
        </table>
      </td>
    </tr>
  </table>
 <%}%> 
  <%if(prevDetails.getH01FLGWK1().equals("H") ){%>  
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
     

          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="10%"> 
              <div align="center"><b>Nivel</b></div>            </td>
            <td nowrap width="10%"> 
              <div align="center"><b>D&iacute;as <br>
Vencimiento</b></div>            </td>
             
            <td nowrap width="20%"><div align="center"><b>% Provisi&oacute;n Sobre <br>
               Parte Garantizada</b></div></td>
            <td nowrap width="10%"><div align="center"><b>% Provisi&oacute;n Sobre <br>
Parte NO Garantizada</b></div></td>
            <td nowrap width="10%"><div align="center"><b>C&oacute;digo <br>
              Calificaci&oacute;n</b></div></td>
            <td nowrap width="10%"><div align="center"><b>Calificaci&oacute;n<br>
              Homologada</b></div></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap height="23"> 
              <div align="center"><b>1</b></div>            </td>
            <td nowrap height="23"> 
              <div align="center"> 
	               <eibsinput:text	name="prevDetails" property="E01PRVDY1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>            </td>
            <td nowrap><div align="center">
                <eibsinput:text	name="prevDetails" property="E01PRVPG1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
            </div></td>
            <td nowrap><div align="center">
                <eibsinput:text	name="prevDetails" property="E01PRVMP1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
            </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA1().trim()%>" name="E01PRVCA1" >
            <a href="javascript:GetCodeCNOFC('E01PRVCA1','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0"  ></a> </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCH1().trim()%>" name="E01PRVCH1" >
            <a href="javascript:GetCodeCNOFC('E01PRVCH1','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> </div></td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  height="23"> 
              <div align="center"><b>2</b></div>            </td>
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVDY2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>            </td>
            <td nowrap><div align="center">
                <eibsinput:text	name="prevDetails" property="E01PRVPG2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
            </div></td>
            <td nowrap><div align="center">
                <eibsinput:text	name="prevDetails" property="E01PRVMP2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
            </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA2().trim()%>" name="E01PRVCA2" >
            <a href="javascript:GetCodeCNOFC('E01PRVCA2','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0"  ></a> </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCH2().trim()%>" name="E01PRVCH2" >
            <a href="javascript:GetCodeCNOFC('E01PRVCH2','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> </div></td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  height="23"> 
              <div align="center"><b>3</b></div>            </td>
            <td nowrap  height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVDY3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>            </td>
            <td nowrap><div align="center">
                <eibsinput:text	name="prevDetails" property="E01PRVPG3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
            </div></td>
            <td nowrap><div align="center">
                <eibsinput:text	name="prevDetails" property="E01PRVMP3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
            </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA3().trim()%>" name="E01PRVCA3" >
            <a href="javascript:GetCodeCNOFC('E01PRVCA3','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0"  ></a> </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCH3().trim()%>" name="E01PRVCH3" >
            <a href="javascript:GetCodeCNOFC('E01PRVCH3','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> </div></td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  height="23"> 
              <div align="center"><b>4</b></div>            </td>
            <td nowrap  height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVDY4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>            </td>
            <td nowrap><div align="center">
                <eibsinput:text	name="prevDetails" property="E01PRVPG4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
            </div></td>
            <td nowrap><div align="center">
                <eibsinput:text	name="prevDetails" property="E01PRVMP4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
            </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA4().trim()%>" name="E01PRVCA4" >
            <a href="javascript:GetCodeCNOFC('E01PRVCA4','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0"  ></a> </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCH4().trim()%>" name="E01PRVCH4" >
            <a href="javascript:GetCodeCNOFC('E01PRVCH4','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> </div></td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  height="23"> 
              <div align="center"><b>5</b></div>            </td>
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVDY5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>            </td>
            <td nowrap><div align="center">
                <eibsinput:text	name="prevDetails" property="E01PRVPG5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
            </div></td>
            <td nowrap><div align="center">
                <eibsinput:text	name="prevDetails" property="E01PRVMP5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
            </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA5().trim()%>" name="E01PRVCA5" >
            <a href="javascript:GetCodeCNOFC('E01PRVCA5','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0"  ></a> </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCH5().trim()%>" name="E01PRVCH5" >
            <a href="javascript:GetCodeCNOFC('E01PRVCH5','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> </div></td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap height="23"> 
              <div align="center"><b>6</b></div>            </td>
            <td nowrap  height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVDY6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>            </td>
            <td nowrap><div align="center">
                <eibsinput:text	name="prevDetails" property="E01PRVPG6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
            </div></td>
            <td nowrap><div align="center">
                <eibsinput:text	name="prevDetails" property="E01PRVMP6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
            </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA6().trim()%>" name="E01PRVCA6" >
            <a href="javascript:GetCodeCNOFC('E01PRVCA6','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0"  ></a> </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCH6().trim()%>" name="E01PRVCH6" >
            <a href="javascript:GetCodeCNOFC('E01PRVCH6','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> </div></td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  height="23"> 
              <div align="center"><b>7</b></div>            </td>
            <td nowrap  height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVDY7" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>            </td>
            <td nowrap><div align="center">
                <eibsinput:text	name="prevDetails" property="E01PRVPG7" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
            </div></td>
            <td nowrap><div align="center">
                <eibsinput:text	name="prevDetails" property="E01PRVMP7" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
            </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA7().trim()%>" name="E01PRVCA7" >
            <a href="javascript:GetCodeCNOFC('E01PRVCA7','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0"  ></a> </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCH7().trim()%>" name="E01PRVCH7" >
            <a href="javascript:GetCodeCNOFC('E01PRVCH7','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> </div></td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  height="23"> 
              <div align="center"><b>8</b></div>            </td>
            <td nowrap  height="23"> 
              <div align="center">
 	               <eibsinput:text	name="prevDetails" property="E01PRVDY8" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>            </td>
            <td nowrap><div align="center">
                <eibsinput:text	name="prevDetails" property="E01PRVPG8" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
            </div></td>
            <td nowrap><div align="center">
                <eibsinput:text	name="prevDetails" property="E01PRVMP8" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
            </div></td>
            <td nowrap width="28%"><div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA8().trim()%>" name="E01PRVCA8" >
            <a href="javascript:GetCodeCNOFC('E01PRVCA8','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0"  ></a> </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCH8().trim()%>" name="E01PRVCH8" >
            <a href="javascript:GetCodeCNOFC('E01PRVCH8','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> </div></td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  height="23"> 
              <div align="center"><b>9</b></div>            </td>
            <td nowrap  height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRVDY9" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>            </td>
            <td nowrap><div align="center">
                <eibsinput:text	name="prevDetails" property="E01PRVPG9" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
            </div></td>
            <td nowrap><div align="center">
                <eibsinput:text	name="prevDetails" property="E01PRVMP9" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
            </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCA9().trim()%>" name="E01PRVCA9" >
            <a href="javascript:GetCodeCNOFC('E01PRVCA9','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0"  ></a> </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVCH9().trim()%>" name="E01PRVCH9" >
            <a href="javascript:GetCodeCNOFC('E01PRVCH9','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> </div></td>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
            <%if(currUser.getE01INT().equals("05")){%>  
            <%}%>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <%}%>    
  <%if(!prevDetails.getH01FLGWK1().equals("P") ){%>  
  <br>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
                Clase de Credito: 
                     <input type="text" name="E01PRVTCR" maxlength="1" size="5" value="<%= prevDetails.getE01PRVTCR()%>" >
                <a
					href="javascript:GetCode('E01PRVTCR','STATIC_ln_prod_sup.jsp')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" title=". . ."
					align="bottom" border="0"></a>
              <%if(!prevDetails.getH01FLGWK1().equals("M") && !prevDetails.getH01FLGWK1().equals("H") ){%>
			  Tabla PDI sin Garantia: 
                        <input type="text" maxlength="4" size="5" value="<%= prevDetails.getE01PRVPGA().trim()%>" name="E01PRVPGA" >
<a href="javascript:GetLoanTablePDI('E01PRVPGA',document.forms[0].E01PRVTCR.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a>
			Tabla PDI Codeudores: 
                        <input type="text" maxlength="4" size="5" value="<%= prevDetails.getE01PRVPCO().trim()%>" name="E01PRVPCO" >
<a href="javascript:GetLoanTablePDI('E01PRVPCO',document.forms[0].E01PRVTCR.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a>
  <%}%>
			  </font></font></font>
			  </div>
			  
            </td>
			
          </tr>
		   <%if(!currUser.getE01INT().equals("05")){%>  
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
                Calificaci&oacute;n que indica Previsi&oacute;n/Calificaci&oacute;n 
                Global Cliente : 
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRVLMC().trim()%>" name="E01PRVLMC" >
                <a href="javascript:GetCodeCNOFC('E01PRVLMC','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> 
                </font></font></font></div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap colspan="3" >(Si la Previsi&oacute;n es por Cr&eacute;ditos 
              Individuales, basados en su <b>n&uacute;mero de nivel</b>,</td>
          </tr>
          <tr id="trdark">
            <td nowrap colspan="3" >dejar el <b>campo en blanco</b>, si es por 
              Cliente/Calificaci&oacute;n, entre el<b> c&oacute;digo correspondiente</b>)</td>
          </tr>
		     <%}%>  
        </table>
      </td>
    </tr>
  </table>
    <%}%>    
  <p><br>
  </p>
  <div align="center"> 
            <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>
</form>
</body>
</html>
