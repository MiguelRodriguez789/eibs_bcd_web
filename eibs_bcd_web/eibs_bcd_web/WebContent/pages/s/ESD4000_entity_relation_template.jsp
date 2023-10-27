<%@page import="com.datapro.constants.Entities"%>
<%@page import="datapro.eibs.sockets.*, datapro.eibs.beans.* , datapro.eibs.master.*" %>
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="datapro.eibs.services.ParametersServices"%>
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="entity" class="datapro.eibs.beans.ESD400001Message"  scope="session" />

<% int row = 0;
   boolean isApprovalInquiry = userPO.getPurpose().equals("APPROVAL_INQ");
   boolean isInquiry = userPO.getPurpose().equals("INQUIRY");
   boolean isReadOnly = isApprovalInquiry || isInquiry;
   String type = userPO.getHeader10();	
%>
	<table class="tableinfo" style="width: 100%;">
	<%if(type.equals(Entities.ENTITY_TYPE_CUSTOMER_BENEFICIARIES) || type.equals(Entities.ENTITY_TYPE_ACCOUNT_BENEFICIARIES) ){ %>
	  <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="20%">
			<div align="right"><%= ParametersServices.getCnofTableDesc(request, "IN")   + " :"%> </div>
		</td> 
	    <td nowrap width="80%"> 
			<eibsinput:cnofc name="entity" property="E01UC1" flag="IN" fn_code="E01UC1" fn_description= "D01UC1" readonly="<%=isReadOnly%>"/>
			<eibsinput:text name="entity" property="D01UC1" modified="F01UC1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true" />
	    </td>
	  </tr>
	  <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="20%">
			<div align="right"><%= ParametersServices.getCnofTableDesc(request, "9W")  + " :"%>  </div>
		</td>
	    <td nowrap width="80%"> 
			<eibsinput:cnofc name="entity" property="E01UC2" flag="9W" fn_code="E01UC2" fn_description= "D01UC2" readonly="<%=isReadOnly%>"/>
			<eibsinput:text name="entity" property="D01UC2" modified="F01UC2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true" />
	    </td>
	  </tr>
	  <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="20%">
			<div align="right">Porcentaje :</div>
		</td>
	    <td nowrap width="80%"> 
			<eibsinput:text name="entity" property="E01PER" modified="F01PER" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE%>" readonly="<%=isReadOnly%>" />
	    </td>
	  </tr>	 	
	  <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="20%">
			<div align="right">Comentarios :</div>
		</td>
	    <td nowrap width="80%"> 
			<textarea name="E01RMK" class="<%= entity.getF01RMK().equals("Y") ? "txtchanged" : ""%>" cols="70" rows="4" <%=isReadOnly?"readonly":""%> ><%=Util.formatCell(entity.getE01RMK().trim())%></textarea>
	    </td>
	  </tr>	 	  
	    
	<% } else if(type.equals(Entities.ENTITY_TYPE_ACCOUNT_SIGNER)){ %> 
	  <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="20%">
			<div align="right"> Tipo de Firma :</div>
		</td> 
	    <td nowrap width="80%"> 
            <select name="E01FL1" <%=isReadOnly?"disabled":""%> class="<%= entity.getF01FL1().equals("Y") ? "txtchanged" : ""%>">
               <option value=" " <% if (!(entity.getE01FL1().equals("1")||entity.getE01FL1().equals("2") || entity.getE01FL1().equals("3") || entity.getE01FL1().equals("4"))) out.print("selected"); %>> 
               <option value="1" <% if (entity.getE01FL1().equals("1")) out.print("selected"); %>>FIRMA UNICA</option>
               <option value="2" <% if (entity.getE01FL1().equals("2")) out.print("selected"); %>>FIRMA CONJUNTA</option>
               <option value="3" <% if (entity.getE01FL1().equals("3")) out.print("selected"); %>>FIRMA INDIVIDUAL</option>
               <option value="4" <% if (entity.getE01FL1().equals("4")) out.print("selected"); %>>SELLO</option>
            </select>  
	    </td>
	  </tr>
	  <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="20%">
			<div align="right"><%= ParametersServices.getCnofTableDesc(request, "FI")  + " :"%>  </div>
		</td>
	    <td nowrap width="80%"> 
			<eibsinput:cnofc name="entity" property="E01UC1" flag="FI" fn_code="E01UC1" fn_description= "D01UC1" readonly="<%=isReadOnly%>" />
			<eibsinput:text name="entity" property="D01UC1" modified="F01UC1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true" />
	    </td>
	  </tr>
	  <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
	  	 <td nowrap width="20%">
			<div align="right">Imagen Firma (secuencia):  </div>
		</td>
	    <td nowrap width="80%"> 
			<eibsinput:text name="entity" property="E01SEQ" modified="F01SEQ" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_TEXT%>" size="3" maxlength="2" readonly="true" />
				<a href="javascript:GetDocImg('E01SEQ','A','<%= userPO.getAccNum().trim()%>', 'SC')"> 	
				<% if (!isReadOnly){ %>
            	<img src="<%=request.getContextPath()%>/images/1b.gif" alt="ayuda" align="bottom" border="0" ></a>
            	<%} %>
        </td>
      </tr>
	  <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="20%">
			<div align="right">Monto Limite :</div>
		</td>
	    <td nowrap width="80%"> 
			<eibsinput:text name="entity" property="E01AMT" modified="F01AMT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="<%=isReadOnly%>"/>
	    </td>
	  </tr>	 	  
	  <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="20%">
			<div align="right">Comentarios :</div>
		</td>
	    <td nowrap width="80%"> 
			<textarea name="E01RMK" class="<%= entity.getF01RMK().equals("Y") ? "txtchanged" : ""%>" cols="70" rows="4" <%=isReadOnly?"readonly":""%> ><%=Util.formatCell(entity.getE01RMK().trim())%></textarea>
	    </td>
	  </tr>
	  
	<% } else if(type.equals(Entities.ENTITY_TYPE_ACCOUNT_HOLDERS)){ %> 
	  <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="20%">
			<div align="right"><%= ParametersServices.getCnofTableDesc(request, "T8")  + " :"%>  </div>
		</td>
	    <td nowrap width="80%"> 
			<eibsinput:cnofc name="entity" property="E01UC1" flag="T8" fn_code="E01UC1" fn_description= "D01UC1" readonly="<%=isReadOnly%>" />
			<eibsinput:text name="entity" property="D01UC1" modified="F01UC1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true" />
	    </td>
	  </tr>
	  <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="20%">
			<div align="right">Porcentaje :</div>
		</td>
	    <td nowrap width="80%"> 
			<eibsinput:text name="entity" property="E01PER" modified="F01PER" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE%>" readonly="<%=isReadOnly%>"/>
	    </td>
	  </tr>	 	  

	<% } else if(type.equals(Entities.ENTITY_TYPE_STOCK_HOLDER)){ %> 
	  <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="20%">
			<div align="right"><%= ParametersServices.getCnofTableDesc(request, "TA")  + " :"%>  </div>
		</td>
	    <td nowrap width="80%"> 
			<eibsinput:cnofc name="entity" property="E01UC1" flag="TA" fn_code="E01UC1" fn_description= "D01UC1" readonly="<%=isReadOnly%>" />
			<eibsinput:text name="entity" property="D01UC1" modified="F01UC1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true" />
	    </td>
	  </tr>
	  <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="20%">
			<div align="right">Porcentaje de Acciones :</div>
		</td>
	    <td nowrap width="80%"> 
			<eibsinput:text name="entity" property="E01PER" modified="F01PER" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE%>" readonly="<%=isReadOnly%>"/>
	    </td>
	  </tr>	 	  
	  <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="20%">
			<div align="right">Cantidad de Acciones :</div>
		</td>
	    <td nowrap width="80%"> 
			<eibsinput:text name="entity" property="E01CON" modified="F01CON" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="9" maxlength="7" readonly="<%=isReadOnly%>"/>
	    </td>
	  </tr>	 	  
	  <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="20%">
			<div align="right">Valor de las Acciones :</div>
		</td>
	    <td nowrap width="80%"> 
			<eibsinput:text name="entity" property="E01AMT" modified="F01AMT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="<%=isReadOnly%>"/>
	    </td>
	  </tr>	 	  

	<% } else if(type.equals(Entities.ENTITY_TYPE_BOARD_OF_DIRECTORS)){ %> 
	  <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="20%">
			<div align="right"><%= ParametersServices.getCnofTableDesc(request, "32")  + " :"%>  </div>
		</td>
	    <td nowrap width="80%"> 
			<eibsinput:cnofc name="entity" property="E01UC1" flag="32" fn_code="E01UC1" fn_description= "D01UC1" readonly="<%=isReadOnly%>" />
			<eibsinput:text name="entity" property="D01UC1" modified="F01UC1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true" />
	    </td>
	  </tr>
	  <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="20%">
			<div align="right"><%= ParametersServices.getCnofTableDesc(request, "33")  + " :"%>  </div>
		</td>
	    <td nowrap width="80%"> 
			<eibsinput:cnofc name="entity" property="E01UC2" flag="33" fn_code="E01UC2" fn_description= "D01UC2" readonly="<%=isReadOnly%>" />
			<eibsinput:text name="entity" property="D01UC2" modified="F01UC2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true" />
	    </td>
	  </tr>

	<% } else if(type.equals(Entities.ENTITY_TYPE_FAMILY_REFERENCES)){ %> 
	  <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="20%">
			<div align="right"><%= ParametersServices.getCnofTableDesc(request, "9W")  + " :"%>  </div>
		</td>
	    <td nowrap width="80%"> 
			<eibsinput:cnofc name="entity" property="E01UC1" flag="9W" fn_code="E01UC1" fn_description= "D01UC1" readonly="<%=isReadOnly%>" />
			<eibsinput:text name="entity" property="D01UC1" modified="F01UC1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true" />
	    </td>
	  </tr>

	<% } else if(type.equals(Entities.ENTITY_TYPE_COMMERCIAL_REFERENCES)){ %> 
	  <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="20%">
			<div align="right"><%= ParametersServices.getCnofTableDesc(request, "33")  + " :"%>  </div>
		</td>
	    <td nowrap width="80%"> 
			<eibsinput:cnofc name="entity" property="E01UC1" flag="33" fn_code="E01UC1" fn_description= "D01UC1" readonly="<%=isReadOnly%>" />
			<eibsinput:text name="entity" property="D01UC1" modified="F01UC1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true" />
	    </td>
	  </tr>

	<% } else if(type.equals(Entities.ENTITY_TYPE_ACCOUNT_LEGAL_REPRESENTATIVES) || type.equals(Entities.ENTITY_TYPE_CUSTOMER_LEGAL_REPRESENTATIVES)){ %> 
	  <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="20%">
			<div align="right"><%= ParametersServices.getCnofTableDesc(request, "32")  + " :"%>  </div>
		</td>
	    <td nowrap width="80%"> 
			<eibsinput:cnofc name="entity" property="E01UC1" flag="32" fn_code="E01UC1" fn_description= "D01UC1" readonly="<%=isReadOnly%>" />
			<eibsinput:text name="entity" property="D01UC1" modified="F01UC1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true" />
	    </td>
	  </tr>


	<% } else { %> 
	  <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="20%">
			<div align="right"><%= ParametersServices.getCnofTableDesc(request, "9W")  + " :"%>  </div>
		</td>
	    <td nowrap width="80%"> 
			<eibsinput:cnofc name="entity" property="E01UC1" flag="9W" fn_code="E01UC1" fn_description= "D01UC1" readonly="<%=isReadOnly%>" />
			<eibsinput:text name="entity" property="D01UC1" modified="F01UC1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true" />
	    </td>
	  </tr>
	
	<% } %>
</table>

<%if(type.equals(Entities.ENTITY_TYPE_ACCOUNT_SIGNER)){ %>
	<%if(entity.getH01WK2().equals("G")){ %>
	<h4>Vinculación Firmante de Cheques de Gerencia</h4>
	<%}else{ %>
	<h4>Vinculación Firmante</h4>
	<% }%>
	<table class="tableinfo" style="width: 100%;">
	  <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
	  	<td nowrap width="20%">
			<div align="right">Fecha Inicio:  </div>
		</td>
		<td nowrap width="24%">
			<eibsinput:date name="entity" fn_year="E01IDY" fn_month="E01IDM" fn_day="E01IDD"
				required="true" readonly="<%=isReadOnly%>" 
				modified="F01IDD"/>
					</td>
		<td nowrap width="24%">
			<div align="right">Fecha Fin:  </div>
		</td>
		<td nowrap width="26%" height="19">
			<eibsinput:date name="entity" fn_year="E01DTY" fn_month="E01DTM" fn_day="E01DTD"
				required="true"  readonly="<%=isReadOnly%>" modified="F01DTD" /></td>
		</td>
	  </tr>	
	</table>	  
<% }%>