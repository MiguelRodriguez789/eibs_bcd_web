<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="datapro.eibs.master.*"%>
<%@ page import="datapro.eibs.beans.*" %>

<%!
  /*Row Color Logic  */
  String color1="trdark", color2="trclear";
  //Indice para identificar los colores de las filas
  int row = 0 ;
  
  public String getRowColor( ){
		return (row++ % 2) == 0 ? color1 : color2 ;
  }  

  
  
%>

<%
	row = 0 ;
	boolean bReadonly = Boolean.parseBoolean( request.getParameter("inquiry") ) ; 
	String readonly = bReadonly?"readonly='readonly'":"";
	
  /* Determine Which Session Class to use */
  String suffix = Util.getReqParameter("suffix", request, "E01");
  request.setAttribute("suffix",suffix);
  datapro.eibs.sockets.MessageRecord mr = (datapro.eibs.sockets.MessageRecord) session.getAttribute("client");
  boolean shortcust = !suffix.equals("E01");
  String tablewidth = shortcust ? "100" : "80";
%>

<% if( bReadonly ){ %>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"> </SCRIPT>
<script type="text/javascript">
	readOnlyPage();
</script>
<% } 
	if(shortcust){
%>
	<br>
	<h4>PEP</h4>
<%}%>
  <table class="tableinfo" cellspacing="0" cellpadding="5" style="margin: 5px; align: center; width: <%=tablewidth%>%;" >
        <tr id="<%=getRowColor()%>" > 
              <td nowrap="nowrap" align="right">Tipo Relaci&oacute;n :</td>
              <td nowrap="nowrap">
                  <select name="<%= suffix %>RELP" id="<%= suffix %>RELP"  >
                    
                    <% int pepValue = Integer.parseInt("".equals( mr.getField(suffix + "RELP").getString()) ? "-1" : mr.getField(suffix + "RELP").getString());
                       boolean noSelected = pepValue < 0 || pepValue > 9 ; %>
                       
                    <option value=" " <%= noSelected ? "selected='selected'" : "" %> > 
                    </option>
                    <option value="1" <% if (pepValue == 1) out.print("selected"); %>>Jefe de estado o de Gobierno</option>
                    <option value="2" <% if (pepValue == 2) out.print("selected"); %>>L&iacute;­der Pol&iacute;­tico</option>                   
                    <option value="3" <% if (pepValue == 3) out.print("selected"); %>>Funcionario Gubernamental de alta jerarqu&iacute;­a</option>
                    <option value="4" <% if (pepValue == 4) out.print("selected"); %>>Funcionario Judicial de alta jerarqu&iacute;­a</option>
                    <option value="5" <% if (pepValue == 5) out.print("selected"); %>>Funcionario Militar de alta jerarqu&iacute;­a</option>
                    <option value="6" <% if (pepValue == 6) out.print("selected"); %>>Alto ejecutivo de empresa estatal</option>
                    <option value="7" <% if (pepValue == 7) out.print("selected"); %>>Funcionario o miembro importante de partido pol&iacute;­tico</option>
                    <option value="8" <% if (pepValue == 8) out.print("selected"); %>>C&oacute;nyuge, concubina o concubinario de un PEP</option>
                    <option value="9" <% if (pepValue == 9) out.print("selected"); %>>Pariente por consanguinidad o afinidad hasta 2do grado de un PEP</option>
                    <option value="0" <% if (pepValue == 0) out.print("selected"); %>>Persona Moral con v&iacute;­nculos patrimoniales con un PEP</option>
                  </select>
              </td>
        </tr>
        <tr id="<%=getRowColor()%>" > 
              <td nowrap="nowrap" align="right">Nombre Completo :</td>
              <td nowrap="nowrap" > 
                <eibsinput:text property="${suffix}NMEP" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="60" maxlength="62"    />
              </td>
        </tr>
        <tr id="<%=getRowColor()%>" > 
              <td nowrap="nowrap" align="right">Identificaci&oacute;n :</td>
              <td nowrap="nowrap"> 
              	<eibsinput:text property="${suffix}IDNP" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="25" maxlength="27"  />
              </td>
        </tr>
        <tr id="<%=getRowColor()%>" > 
              <td nowrap="nowrap" align="right">Nacionalidad :</td>
              <td nowrap="nowrap"> 
                <eibsinput:text property="${suffix}NATP" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="4" maxlength="6"  />
                <% if( !bReadonly ){ %>
                <a href="javascript:GetCodeCNOFC('${suffix}NATP','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a>
                <% } %>
              </td>
        </tr>
        <tr id="<%=getRowColor()%>" > 
              <td nowrap="nowrap" align="right">Cargo P&uacute;blico : </td>
              <td nowrap="nowrap">
              	<eibsinput:text property="${suffix}CAPP" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="50" maxlength="52"  />
              </td>
        </tr>            
        <tr id="<%=getRowColor()%>" > 
              <td nowrap="nowrap" align="right">Observaciones :</td>
              <td nowrap="nowrap">
              	<textarea rows="4" cols="50" name="<%= suffix %>DSCP" name="id" maxlength="200"  ><%=mr.getField(suffix + "DSCP").getString()%></textarea>
              </td>
        </tr>   
<%if(Boolean.valueOf(JSEIBSProp.getProperty("eIBS.showPepExpiration"))) {%>  
        <tr id="<%=getRowColor()%>" > 
              <td nowrap="nowrap" align="right">Fecha de Vencimiento(PEP) :</td>
              <td nowrap="nowrap">
				<eibsinput:date name="client" fn_month="${suffix}CUFD3M" fn_day="${suffix}CUFD3D" fn_year="${suffix}CUFD3Y"/>
              </td>
        </tr>            
<% } %>        
</table>
   
   
