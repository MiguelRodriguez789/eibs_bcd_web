<%

  datapro.eibs.sockets.MessageRecord emp;
  String READ="";
 
  // PARAMETROS 
  String suffix, suffixMod ;
  String messageName;
  boolean readOnly=false ;  
   
   // Determina si es solo lectura
   if (request.getParameter("readOnly") != null ){
     readOnly=Boolean.valueOf( request.getParameter("readOnly").toString() ).
     					booleanValue() ;
     READ = readOnly?"readonly":"";
   }
   // Obtiene el mensaje a desplegar
   messageName = request.getParameter("messageName");
   emp = (datapro.eibs.sockets.MessageRecord) session.getAttribute(messageName);      
   
   if (request.getParameter("suffix") != null){
   		suffix = request.getParameter("suffix") ;
   }else{
   		suffix = "E06" ;
   }
   suffixMod = "F" + suffix.substring(1) ;

  // NOMBRES DE CAMPOS
    String uc5 = suffix + "UC5";		// Ocupacion
	String empresa = suffix + "CP1";	// Nombre de Empresa
	String dir = suffix + "CP2";		// Direccion
	String ept = suffix + "EPT";		// Actividad Economica
	String uc4 = suffix + "UC4";		// Departamento
	String nm4 = suffix + "NM4";		// Descripcion de Departamento
	String f01 = suffix + "F01";   		// Ciudad	 
    String nm5 = suffix + "NM5";		// Descripcion de Ciudad
    String cp3 = suffix + "CP3";		// Cargo / Carrera
    String con = suffix + "CON";		// Telefono / Fax
    String amt = suffix + "AMT";		// Ingresos Mensuales
    String am1 = suffix + "AM1";		// Egresos Mensuales
    String am2 = suffix + "AM2";		// Activos
    String am3 = suffix + "AM3";		// Pasivos
    String am4 = suffix + "AM4";		// Otros Ingresos
    String am5 = suffix + "AM5";		// Patrimonio
    String ds1 = suffix + "DS1";		// Descripcion de Otros Ingresos

	// Flag Modificacion para consulta de aprobacion  
	String uc5F = suffixMod + "UC5";
	String empresaF = suffixMod + "CP1";
	String dirF = suffixMod + "CP2";
	String eptF = suffixMod + "EPT";		
	String uc4F = suffixMod + "UC4";		
	String nm4F = suffixMod + "NM4";		
	String f01F = suffixMod + "F01";   			 
    String nm5F = suffixMod + "NM5";		
    String cp3F = suffixMod + "CP3";		
    String conF = suffixMod + "CON";		
    String amtF = suffixMod + "AMT";		
    String am1F = suffixMod + "AM1";		
    String am2F = suffixMod + "AM2";		
    String am3F = suffixMod + "AM3";		
    String am4F = suffixMod + "AM4";		
    String am5F = suffixMod + "AM5";		
    String ds1F = suffixMod + "DS1";

%>
<h4>Actividad Económica</h4>
 <table class="tableinfo" >
    <tr > 
      <td>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="center">
          
          <tr id="trclear"> 
            <td nowrap align="right">Ocupación : </td>
            <td nowrap align="left"> 
              <input type="text" name="<%=uc5%>" size="5" maxlength="4" value="<%=emp.getField(uc5).getString()%>" readonly
              <%=(emp.getField(uc5F).getString().equals("Y"))?"class=\"txtchanged\"":"" %>>
              <% if ( !readOnly ) {%>
              <a href="javascript:GetCodeCNOFC('<%=uc5%>','C4')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0">
              <% } %>
            </td>
            <td nowrap align="right">Entidad : </td>
            <td nowrap align="left">
            	<input type="text" name="<%=empresa%>" size="46" maxlength="45" value="<%= emp.getField(empresa).getString()%>" <%=READ%>
            	<%=(emp.getField(empresaF).getString().equals("Y"))?"class=\"txtchanged\"":"" %>>
            </td>
          </tr>
          
          <tr id="trdark"> 
            <td nowrap align="right">Dirección : </td>
            <td nowrap align="left"> 
              <input type="text" name="<%=dir%>" size="46" maxlength="45" value="<%= emp.getField(dir).getString()%>" <%=READ%>
              <%=(emp.getField(dirF).getString().equals("Y"))?"class=\"txtchanged\"":"" %>>
            </td>
            <td nowrap align="right"> 
            </td>
            <td nowrap align="left"> 
            </td>
          </tr>
          
          <tr id="trclear"> 
            <td nowrap align="right">Departamento : </td>
            <td nowrap align="left"> 
              <input type="text" name="<%=uc4%>" size="3" maxlength="2" value="<%= emp.getField(uc4).getString()%>" readonly 
              <%=(emp.getField(uc4F).getString().equals("Y"))?"class=\"txtchanged\"":"" %>>
              <input type="text" name="<%=nm4%>" size="46" maxlength="45" value="<%= emp.getField(nm4).getString()%>" readonly 
              <%=(emp.getField(nm4F).getString().equals("Y"))?"class=\"txtchanged\"":"" %>>
              <% if ( !readOnly ) {%>
              <a href="javascript:GetCodeDescCNOFC('<%=uc4%>','<%=nm4%>','27')" >
              <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a>
              <% } %>
            </td>
 			<td nowrap align="right">Ciudad : </td>
            <td nowrap align="left"> 
              <input type="text" name="<%=f01%>" size="4" maxlength="3" value="<%= emp.getField(f01).getString()%>" readonly
              <%=(emp.getField(f01F).getString().equals("Y"))?"class=\"txtchanged\"":"" %>>
              <input type="text" name="<%=nm5%>" size="46" maxlength="45" value="<%= emp.getField(nm5).getString()%>" readonly
              <%=(emp.getField(nm5F).getString().equals("Y"))?"class=\"txtchanged\"":"" %>>
              <% if ( !readOnly ) {%>
              <a href="javascript:Get2FilterCodes('<%=f01%>','<%=nm5%>','84', ' ',document.forms[0]['<%=uc4%>'].value)">
			  <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a>
			  <% } %>
            </td>
          </tr>
          
          <tr id="trdark"> 
            <td nowrap align="right">Actividad Económica Entidad : </td>
            <td nowrap > 
              <input type="text" name="<%=ept%>" size="5" maxlength="4" value="<%= emp.getField(ept).getString()%>" readonly
              <%=(emp.getField(eptF).getString().equals("Y"))?"class=\"txtchanged\"":"" %>>
              <% if ( !readOnly ) {%>
              <a href="javascript:GetCodeCNOFC('<%=ept%>','12')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a>
              <% } %>
            </td>
            <td nowrap align="right">Cargo / Carrera : </td>
            <td nowrap align="left"> 
              <input type="text" name="<%=cp3%>" value="<%= emp.getField(cp3).getString()%>" size="46" maxlength="45" <%=READ%>
              <%=(emp.getField(cp3F).getString().equals("Y"))?"class=\"txtchanged\"":"" %>>
            </td>
          </tr>
          
          <tr id="trclear"> 
            <td nowrap align="right">Telefono / Fax : </td>
            <td nowrap align="left"> 
              <input type="text" name="<%=con%>" size="46" maxlength="45" value="<%= emp.getField(con).getString()%>" <%=READ%>
              <%=(emp.getField(conF).getString().equals("Y"))?"class=\"txtchanged\"":"" %>>
            </td>
            <td nowrap align="right"></td>
            <td nowrap align="left">               
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
    
 <br>
 <h4>Información de Ingresos y Egresos</h4>
  <table class="tableinfo" >
    <tr > 
      <td nowrap > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="center">
          
          <tr id="trdark"> 
            <td nowrap align="right">Ingresos Mensuales : </td>
            <td nowrap align="left"> 
              	<input type="text" name="<%=amt%>" size="22" maxlength="20" value="<%= emp.getField(amt).getString()%>" onKeypress="enterDecimal()" <%=READ%>
              	<%=(emp.getField(amtF).getString().equals("Y"))?"class=\"txtchanged\"":"" %>>
              	<% if ( !readOnly ) {%>
                <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0">
              	<% } %>
            </td>
            <td nowrap align="right">Egresos Mensuales : </td>
            <td nowrap align="left">
				<input type="text" name="<%=am1%>" size="22" maxlength="20" value="<%= emp.getField(am1).getString()%>" onKeypress="enterDecimal()" <%=READ%>
				<%=(emp.getField(am1F).getString().equals("Y"))?"class=\"txtchanged\"":"" %>> 
				<% if ( !readOnly ) {%>
                <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0">
              	<% } %>
			</td>	
		  </tr>

          <tr id="trclear"> 
            <td nowrap align="right">Total Activos : </td>
            <td nowrap align="left"> 
              	<input type="text" name="<%=am2%>" size="22" maxlength="20" value="<%= emp.getField(am2).getString()%>" onKeypress="enterDecimal()" <%=READ%>
              	<%=(emp.getField(am2F).getString().equals("Y"))?"class=\"txtchanged\"":"" %>>
              	<% if ( !readOnly ) {%>
                <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0">
              	<% } %>
            </td>
            <td nowrap align="right">Total Pasivos : </td>
            <td nowrap align="left">
				<input type="text" name="<%=am3%>" size="22" maxlength="20" value="<%= emp.getField(am3).getString()%>" onKeypress="enterDecimal()" <%=READ%>
				<%=(emp.getField(am3F).getString().equals("Y"))?"class=\"txtchanged\"":"" %>>
				<% if ( !readOnly ) {%>
                <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0">
              	<% } %>
			</td>	
          </tr>

          <tr id="trdark"> 
            <td nowrap align="right">Otros Ingresos : </td>
            <td nowrap align="left"> 
              	<input type="text" name="<%=am4%>" size="22" maxlength="20" value="<%= emp.getField(am4).getString()%>" onKeypress="enterDecimal()" <%=READ%>
              	<%=(emp.getField(am4F).getString().equals("Y"))?"class=\"txtchanged\"":"" %>>
            </td>
            <td nowrap align="right">Patrimonio : </td>
            <td nowrap align="left">
				<input type="text" name="<%=am5%>" size="22" maxlength="20" value="<%= emp.getField(am5).getString()%>" onKeypress="enterDecimal()" <%=READ%>
				<%=(emp.getField(am5F).getString().equals("Y"))?"class=\"txtchanged\"":"" %>>
				<% if ( !readOnly ) {%>
                <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0">
              	<% } %>
			</td>	
          </tr>          

          <tr id="trclear">
          	<td nowrap align="right" height="47">Descripcion de Otros Ingresos : </td>
            <td nowrap align="left" height="47"> 
              	<input type="text" name="<%=ds1%>" size="61" maxlength="60" value="<%= emp.getField(ds1).getString()%>" <%=READ%>
              	<%=(emp.getField(ds1F).getString().equals("Y"))?"class=\"txtchanged\"":"" %>>
            </td>
            <td nowrap align="right" height="47"></td>
            <td nowrap align="left" height="47">
			</td> 
          </tr>
        </table>
      </td>
    </tr>
  </table>
