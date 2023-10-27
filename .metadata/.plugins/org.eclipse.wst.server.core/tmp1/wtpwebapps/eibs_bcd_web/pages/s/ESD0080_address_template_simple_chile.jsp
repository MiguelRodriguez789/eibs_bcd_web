<%@ page import="datapro.eibs.sockets.*, datapro.eibs.beans.*" %>

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<%!
	datapro.eibs.sockets.MessageRecord mr;
 
	String title;
	String messageName;
	String suffix = ""; // Este template se usa para los que no son datos básicos
	boolean readOnly=false;
	String READ_ONLY_TAG=""; 
%> 

<%
   //Obtiene el titulo del segmento de direccion
	title = request.getParameter("title");
	if (title == null ) title = "Dirección";

   // Obtiene el sufijo de los campos dependiendo del tipo de mensaje a desplegar.
   // Por ejemplo, si el mensaje es del tipo ESD008001, el sufijo enviado es E01, si el tipo es ESD008002 
   // el sufijo enviado ed E02
   

   // Obtiene el mensaje a desplegar
	messageName = request.getParameter("messageName");
	mr = (datapro.eibs.sockets.MessageRecord) session.getAttribute(messageName);
   
	// Determina si es solo lectura
	if (request.getParameter("readOnly") != null )
		if (request.getParameter("readOnly").toLowerCase().equals("true")){
			readOnly=true;
			READ_ONLY_TAG="readonly";
		} else {
			readOnly=false;
			READ_ONLY_TAG="";
		}
	else READ_ONLY_TAG="";


	String index = "" ;
	if( request.getParameter("index") != null ){
		index = request.getParameter("index")  ;
		if(index.length() == 1)
			suffix = "4";
	} else if( request.getParameter("suffix") != null ){
		suffix = request.getParameter("suffix")  ;
	} else {
		index = "0";
	}
	
%>

            <tr id="trdark"> 
              <td nowrap width="39%"> 
                <div align="right">Tipo Direccion :</div>
              </td>
              <td nowrap width="61%">  
                <input type="text" name="<%= "E" + index + suffix %>ADT" size="5" maxlength="4" value="<%= mr.getField("E" + index + suffix +  "ADT").getString().trim()%>" <%=READ_ONLY_TAG %> >
                <input type="text" name="<%= "D" + index + suffix %>ADT" size="55" maxlength="45" value="<%= mr.getField("D" + index + suffix +  "ADT").getString().trim()%>" readonly >
                <% if ( !readOnly ) { %>
	                <a href="javascript:GetCodeDescCNOFC('<%= "E" + index + suffix %>ADT','<%= "D" + index + suffix %>ADT','DT')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a> 
    	        <% } %>
			  </td>
            </tr>

            <tr id="trclear"> 
              <td nowrap width="39%"> 
                <div align="right">Comuna :</div>
              </td>
              <td nowrap width="61%">  
                <input type="text" name="<%= "E" + index + suffix %>COM" size="5" maxlength="4" value="<%= mr.getField("E" + index + suffix +  "COM").getString().trim()%>" <%=READ_ONLY_TAG %> >
                <input type="text" name="<%= "D" + index + suffix %>COM" size="55" maxlength="45" value="<%= mr.getField("D" + index + suffix +  "COM").getString().trim()%>" readonly >
                <% if ( !readOnly ) { %>
	                <a href="javascript:GetCodeDescCNOFC('<%= "E" + index + suffix %>COM','<%= "D" + index + suffix %>COM','80')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a> 
    	        <% } %>
			  </td>
            </tr>

            <tr id="trdark"> 
              <td nowrap width="39%"> 
                <div align="right">Calle :</div>
              </td>
              <td nowrap width="61%">  
                <input type="text" name="<%= "E" + index + suffix %>MA2" size="55" maxlength="45" value="<%= mr.getField("E" + index + suffix +  "MA2").getString().trim()%>" <%=READ_ONLY_TAG %> >
			  </td>
            </tr>

            <tr id="trclear"> 
              <td nowrap width="39%"> 
                <div align="right"> </div>
              </td>
              <td nowrap width="61%">  
                <input type="text" name="<%= "E" + index + suffix %>MA3" size="55" maxlength="45" value="<%= mr.getField("E" + index + suffix +  "MA3").getString().trim()%>" <%=READ_ONLY_TAG %> >
			  </td>
            </tr>
   
            <tr id="trdark"> 
              <td nowrap width="39%"> 
                <div align="right"> N&uacute;mero :</div>
              </td>
              <td nowrap width="61%">  
                <input type="text" name="<%= "E" + index + suffix %>NST" size="10" maxlength="10" value="<%= mr.getField("E" + index + suffix +  "NST").getString().trim()%>" onKeypress="enterInteger(event)" <%=READ_ONLY_TAG %> >
			  </td>
            </tr>
   
            <tr id="trclear"> 
              <td nowrap width="39%"> 
                <div align="right"> Casa/Depto :</div>
              </td>
              <td nowrap width="61%">  
				<input type="text" name="<%= "E" + index + suffix %>MA4" size="55" maxlength="45" value="<%= mr.getField("E" + index + suffix +  "MA4").getString().trim()%>" <%=READ_ONLY_TAG %> >
			  </td>
            </tr>
   
            <tr id="trdark"> 
              <td nowrap width="39%"> 
                <div align="right"> Referencia :</div>
              </td>
              <td nowrap width="61%">  
 				<input type="text" name="<%= "E" + index + suffix %>CTR" size="55" maxlength="45" value="<%= mr.getField("E" + index + suffix +  "CTR").getString().trim()%>" <%=READ_ONLY_TAG %> >
			  </td>
            </tr>

            <tr id="trclear"> 
              <td nowrap width="39%"> 
                <div align="right">C&oacute;digo Postal :</div>
              </td>
              <td nowrap width="61%">  
                <input type="text" name="<%= "E" + index + suffix %>ZPC" size="16" maxlength="15" value="<%= mr.getField("E" + index + suffix +  "ZPC").getString().trim()%>" <%=READ_ONLY_TAG %> >
                </td>
            </tr>

            <tr id="trdark"> 
              <td nowrap width="39%"> 
                <div align="right">Fecha Actualizaci&oacute;n :</div>
              </td>
              <td nowrap width="61%">  
                <input type="text" name="<%= "E" + index + suffix %>DT1" size="3" maxlength="2" value="<%= mr.getField("E" + index + suffix +  "DT1").getString().trim()%>" onKeypress="enterInteger(event)" <%=READ_ONLY_TAG %> >
                <input type="text" name="<%= "E" + index + suffix %>DT2" size="3" maxlength="2" value="<%= mr.getField("E" + index + suffix +  "DT2").getString().trim()%>" onKeypress="enterInteger(event)" <%=READ_ONLY_TAG %> >
                <input type="text" name="<%= "E" + index + suffix %>DT3" size="5" maxlength="4" value="<%= mr.getField("E" + index + suffix +  "DT3").getString().trim()%>" onKeypress="enterInteger(event)" <%=READ_ONLY_TAG %> >
                </td>
            </tr>

            <tr id="trclear"> 
              <td nowrap width="39%"> 
                <div align="right">Verificado por :</div>
              </td>
              <td nowrap width="61%">  
                <input type="text" name="<%= "E" + index + suffix %>ADF" size="5" maxlength="4" value="<%= mr.getField("E" + index + suffix +  "ADF").getString().trim()%>" <%=READ_ONLY_TAG %> >
                <input type="text" name="<%= "D" + index + suffix %>ADF" size="55" maxlength="45" value="<%= mr.getField("D" + index + suffix +  "ADF").getString().trim()%>" readonly >
                <% if ( !readOnly ) { %>
	                <a href="javascript:GetCodeDescCNOFC('<%= "E" + index + suffix %>ADF','<%= "D" + index + suffix %>ADF','43')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a> 
    	        <% } %>
			  </td>
            </tr>

            <tr id="trdark"> 
              <td nowrap width="39%"> 
                <div align="right">Estado Vigente :</div>
              </td>
              <td nowrap width="61%">  
                <% if ( !readOnly ) { %>
                <input type="radio" name="<%= "E" + index + suffix %>FL1" value="Y" <%if (mr.getField("E" + index + suffix +  "FL1").getString().equals("Y")) out.print("checked"); %>>Sí
                <input type="radio" name="<%= "E" + index + suffix %>FL1" value="N" <%if (!mr.getField("E" + index + suffix +  "FL1").getString().equals("Y")) out.print("checked"); %>>No
    	        <%} else {%>
                <input type="radio" disabled name="<%= "E" + index + suffix %>FL1" value="Y" <%if (mr.getField("E" + index + suffix +  "FL1").getString().equals("Y")) out.print("checked"); %>>Sí
                <input type="radio" disabled name="<%= "E" + index + suffix %>FL1" value="N" <%if (!mr.getField("E" + index + suffix +  "FL1").getString().equals("Y")) out.print("checked"); %>>No
    	        <% } %>
                </td>
            </tr>

