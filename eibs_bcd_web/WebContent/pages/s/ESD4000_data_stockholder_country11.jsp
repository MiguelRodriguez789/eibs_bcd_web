<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@page import="com.datapro.constants.EibsFields"%>

<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<jsp:useBean id="entity" class="datapro.eibs.beans.ESD400001Message"  scope="session" />

<%!
	boolean readOnly=false;
%> 
          
<%
	// Determina si es solo lectura
	if (request.getParameter("readOnly") != null ){
		if (request.getParameter("readOnly").toLowerCase().equals("true")){
			readOnly=true;
		} else {
			readOnly=false;
		}
	}
	int row = 0;
%>
   

     <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
        <td nowrap width="50%"> 
            <div align="right">Nacionalidad :</div>
        </td>
        <td nowrap width="50%"> 
           <eibsinput:cnofc name="entity" property="E01BNC" required="false" flag="03" fn_code="E01BNC" required="false" />
        </td>
     </tr>     
     <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
         <td nowrap width="50%"> 
           <div align="right">Estado Civil :</div>
         </td>
         <td nowrap width="50%"> 
          <% if ( !readOnly ) { %>
           <select name="E01BMS">
             <option value=1 <% if (entity.getField("E01BMS").getString().equals("1")) out.print("selected"); %>>Casado(a)</option>
             <option value=2 <% if (entity.getField("E01BMS").getString().equals("2")) out.print("selected"); %>>Soltero(a)</option>
             <option value=3 <% if (entity.getField("E01BMS").getString().equals("3")) out.print("selected"); %>>Divorciado(a)</option>
             <option value=4 <% if (entity.getField("E01BMS").getString().equals("4")) out.print("selected"); %>>Viudo(a)</option>
             <option value=5 <% if (entity.getField("E01BMS").getString().equals("5")) out.print("selected"); %>>Otros</option>
             <option value=0 <% if ( !(entity.getField("E01BMS").getString().equals("1") || entity.getField("E01BMS").getString().equals("2") || entity.getField("E01BMS").getString().equals("3") || entity.getField("E01BMS").getString().equals("4") || entity.getField("E01BMS").getString().equals("5"))) out.print("selected"); %>></option>
           </select>
             <% } else {  %>   
           <% } %>
         </td>
       </tr>
          
       <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
          <td nowrap width="50%"> 
            <div align="right">Sexo :</div>
          </td>
          <td nowrap width="50%"> 
           <% if ( !readOnly ) { %>
              <input type="radio" name="E01BSX" value="F" <% if (entity.getField("E01BSX").getString().equals("F")) out.print("checked"); %> checked>
              Femenino 
              <input type="radio" name="E01BSX" value="M" <% if (entity.getField("E01BSX").getString().equals("M")) out.print("checked"); %>>
              Masculino 
             <% } else {  %>      
             <input type="radio" readonly name="E01BSX" value="F" <% if (entity.getField("E01BSX").getString().equals("F")) out.print("checked"); %> checked>
              Femenino 
              <input type="radio" readonly name="E01BSX" value="M" <% if (entity.getField("E01BSX").getString().equals("M")) out.print("checked"); %>>
              Masculino  
           <% } %>   
          </td>   
        </tr>
         
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
          <td nowrap width="50%"> 
            <div align="right">Tel&eacute;fono :</div>
          </td>
          <td nowrap width="50%"> 
             <eibsinput:text name="entity" property="E01HPN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE %>" required="false"  readonly="<%=readOnly %>"/>
          </td>
        </tr>
                 
       <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
          <td nowrap width="50%"> 
            <div align="right">Tipo :</div>
          </td>
          <td nowrap width="50%">
          <% if ( !readOnly ) { %>
               <eibsinput:cnofc name="entity" property="E01TID" required="false" flag="34" fn_code="E01TID" fn_description="D01TID"/>
            <% } %>
              <eibsinput:text property="D01TID" name="entity" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true"/> 
        
          </td>
        </tr>
        
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
          <td nowrap width="50%"> 
            <div align="right">Pa&iacute;s :</div>
          </td>
          <td nowrap width="50%"> 
             <% if ( !readOnly ) { %>
               <eibsinput:cnofc name="entity" property="E01PID" required="false" flag="03" fn_code="E01PID" fn_description="D01PID"/>
            <% } %>
              <eibsinput:text property="D01PID" name="entity" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true"/>
          
          </td>
        </tr>

     
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
          <td nowrap width="50%"> 
            <div align="right">Fecha :</div>
          </td>
          <td nowrap width="50%"> 
          	 <eibsinput:date name="entity"  fn_day="E01DTD" fn_month="E01DTM" fn_year="E01DTY"  readonly="<%=readOnly %>"></eibsinput:date>           
          </td>
        </tr>
     
     
          