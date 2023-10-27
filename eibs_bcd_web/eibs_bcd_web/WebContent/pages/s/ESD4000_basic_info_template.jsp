<%@page import="com.datapro.constants.Entities"%>
<%@page import="datapro.eibs.sockets.*, datapro.eibs.beans.* , datapro.eibs.master.*" %>
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="datapro.eibs.services.ParametersServices"%>
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="entity" class="datapro.eibs.beans.ESD400001Message"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<% int row = 0;
   boolean isApprovalInquiry = userPO.getPurpose().equals("APPROVAL_INQ");
   boolean isInquiry = userPO.getPurpose().equals("INQUIRY");
   boolean isReadOnly = isApprovalInquiry || isInquiry;
   String type = userPO.getHeader10();	
%>
	  <table  class="tableinfo">
	    <tr > 
	      <td nowrap> 
	        <table style="padding: 0px; border-spacing: 0; border: 0px; width: 100%;" >

	<%if(type.equals(Entities.ENTITY_TYPE_CUSTOMER_ASSETS)){ %>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
       		<td nowrap width="20%"> 
              <div align="right" style="font-weight: bold;">Secuencia : </div>
           </td>
            <td nowrap width="80%"> 
				<eibsinput:text name="entity" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" property="E01RNU"  readonly="true"/>
           </td>
        </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
       		<td nowrap width="20%"> 
              <div align="right">Descripcion : </div>
           </td>
            <td nowrap width="80%"> 
				<eibsinput:text name="entity" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" property="E01DSC" modified="F01DSC" readonly="<%=isReadOnly%>"/>
           </td>
        </tr>
		  <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
			<td nowrap width="20%">
				<div align="right"><%= ParametersServices.getCnofTableDesc(request, "86")  + " :"%>  </div>
			</td>
		    <td nowrap width="80%"> 
				<eibsinput:cnofc name="entity" property="E01UC1" flag="86" fn_code="E01UC1" fn_description= "D01UC1" readonly="<%=isReadOnly%>" />
				<eibsinput:text name="entity" property="D01UC1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"  modified="E01UC1"/>
		    </td>
		  </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
       		<td nowrap width="20%"> 
              <div align="right">Valor de Compra : </div>
           </td>
            <td nowrap width="80%"> 
				<eibsinput:text name="entity" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" property="E01AMT" modified="F01AMT" readonly="<%=isReadOnly%>"/>
           </td>
        </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
       		<td nowrap width="20%"> 
              <div align="right">Fecha de Compra : </div>
           </td>
            <td nowrap width="80%"> 
				<eibsinput:date name="entity" fn_day="E01IDD" fn_month="E01IDM" fn_year="E01IDY" modified="F01IDD;F01IDM;F01IDY" readonly="<%=isReadOnly%>"/>
           </td>
        </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
       		<td nowrap width="20%"> 
              <div align="right">Valor de Actual : </div>
           </td>
            <td nowrap width="80%"> 
				<eibsinput:text name="entity" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" property="E01AM1" modified="F01AM1" readonly="<%=isReadOnly%>"/>
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

	<% } else if(type.equals(Entities.ENTITY_TYPE_CUSTOMER_LIABILITIES)){ %> 
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
       		<td nowrap width="20%"> 
              <div align="right" style="font-weight: bold;">Secuencia : </div>
           </td>
            <td nowrap width="80%"> 
				<eibsinput:text name="entity" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" property="E01RNU" readonly="true"/>
           </td>
        </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
       		<td nowrap width="20%"> 
              <div align="right">Acreedor : </div>
           </td>
            <td nowrap width="80%"> 
				<eibsinput:text name="entity" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" property="E01DSC" modified="F01DSC" readonly="<%=isReadOnly%>"/>
           </td>
        </tr>
		  <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
			<td nowrap width="20%">
				<div align="right"><%= ParametersServices.getCnofTableDesc(request, "87")  + " :"%>  </div>
			</td>
		    <td nowrap width="80%"> 
				<eibsinput:cnofc name="entity" property="E01UC1" flag="87" fn_code="E01UC1" fn_description= "D01UC1" readonly="<%=isReadOnly%>" />
				<eibsinput:text name="entity" property="D01UC1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true" modified="F01UC1" />
		    </td>
		  </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
       		<td nowrap width="20%"> 
              <div align="right">Valor del Pasivo : </div>
           </td>
            <td nowrap width="80%"> 
				<eibsinput:text name="entity" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" property="E01AMT" modified="F01AMT" readonly="<%=isReadOnly%>"/>
           </td>
        </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
       		<td nowrap width="20%"> 
              <div align="right">Fecha : </div>
           </td>
            <td nowrap width="80%"> 
				<eibsinput:date name="entity" fn_day="E01IDD" fn_month="E01IDM" fn_year="E01IDY" modified="F01IDD;F01IDM;F01IDY" readonly="<%=isReadOnly%>"/>
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

	<% } else if(type.equals(Entities.ENTITY_TYPE_BANK_REFERENCES)){ %> 
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
       		<td nowrap width="20%"> 
              <div align="right" style="font-weight: bold;">Secuencia : </div>
           </td>
            <td nowrap width="80%"> 
				<eibsinput:text name="entity" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" property="E01RNU" readonly="true"/>
           </td>
        </tr>
		  <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
			<td nowrap width="20%">
				<div align="right"><%= ParametersServices.getCnofTableDesc(request, "X3")  + " :"%>  </div>
			</td>
		    <td nowrap width="80%"> 
				<eibsinput:cnofc name="entity" property="E01UC1" flag="X3" fn_code="E01UC1" fn_description= "D01UC1" readonly="<%=isReadOnly%>" />
				<eibsinput:text name="entity" property="D01UC1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true" modified="F01UC1" />
		    </td>
		  </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
       		<td nowrap width="20%"> 
              <div align="right">Oficial de Contacto : </div>
           </td>
            <td nowrap width="80%"> 
				<eibsinput:text name="entity" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" property="E01DSC" modified="F01DSC" readonly="<%=isReadOnly%>"/>
           </td>
        </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
       		<td nowrap width="20%"> 
              <div align="right">Telefono : </div>
           </td>
            <td nowrap width="80%"> 
				<eibsinput:text name="entity" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE %>" property="E01RE1" modified="F01RE1" readonly="<%=isReadOnly%>"/>
           </td>
        </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
       		<td nowrap width="20%"> 
              <div align="right">Numero de Cuenta : </div>
           </td>
            <td nowrap width="80%"> 
				<eibsinput:text name="entity" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_REFERENCE %>" property="E01REF" modified="F01REF" readonly="<%=isReadOnly%>"/>
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
	  	  
	<% } else {%>
 
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
       		<td nowrap width="20%"> 
              <div align="right" style="font-weight: bold;">N&uacute;mero de entidad : </div>
           </td>
            <td nowrap width="30%"> 
				<eibsinput:text name="entity" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" property="E01RNU" readonly="true"/>
           </td>
			<td nowrap width="20%">
              <div align="right">Pais :</div>
			 </td>
			<td nowrap width="30%">
	            <eibsinput:text name="entity" property="E01PID" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
			</td> 
        </tr>

         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
       		<td nowrap width="20%"> 
              <div align="right">Identificaci&oacute;n :</div>
           </td>
            <td nowrap width="30%"> 
			  <eibsinput:text name="entity" property="E01IDN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>"  readonly="true"/>                
		   </td>
			<td nowrap width="20%">
              <div align="right">Tipo :</div>
			 </td>
			<td nowrap width="30%">
	            <eibsinput:text name="entity" property="E01TID" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
			</td> 
          </tr> 
		     <%if(entity.getE01LGT().equals("2")){%>   
		        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		       		<td nowrap width="20%"> 
		                  <div align="right">Primer Nombre :</div>
		                </td>
		            <td nowrap width="30%"> 
		                	<eibsinput:text property="E01FNA" name="entity" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME %>"  readonly="true"/>
		                </td>
		       		<td nowrap width="20%"> </td>
					<td nowrap width="30%"></td> 
		        </tr>
		        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		       		<td nowrap width="20%"> 
		                  <div align="right">Segundo Nombre :</div>
		                </td>
		            <td nowrap width="30%"> 
		                	<eibsinput:text property="E01FN2" name="entity" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME %>"  readonly="true"/>
		       		<td nowrap width="20%"> </td>
					<td nowrap width="30%"></td> 
		        </tr>
		        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		       		<td nowrap width="20%"> 
		                  <div align="right">Primer Apellido :</div>
		                </td>
		            <td nowrap width="30%"> 
		                	<eibsinput:text property="E01LN1" name="entity" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME %>"   readonly="true"/>
		                </td>
		       		<td nowrap width="20%"> </td>
					<td nowrap width="30%"></td> 
				</tr>
		        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		            <td nowrap width="20%"> 
		                  <div align="right">Segundo Apellido :</div>
		            </td>
		            <td nowrap width="30%"> 
		                	<eibsinput:text property="E01LN2" name="entity" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/>
		            </td>
		       		<td nowrap width="20%"> </td>
					<td nowrap width="30%"></td> 
				</tr>       
		           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		       		<td nowrap width="20%"> 
		            	<div align="right">Nacionalidad :</div>
		            </td>
		       		<td nowrap width="30%"> 
						<eibsinput:cnofc name="entity" property="E01CCS" flag="03" fn_code="E01CCS" fn_description= "D01CCS"  readonly="true"/>
			            <eibsinput:text name="entity" property="D01CCS" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true" />
		          	</td>
		            <td nowrap width="20%"> 
		                    <div align="right">Fecha Nacimiento :</div>
		           </td>
		           <td nowrap width="30%"> 
		           		<eibsinput:date  name="entity" fn_month="E01BDM" fn_day="E01BDD" fn_year="E01BDY" readonly="true"/>
		           </td>
		           </tr>    
		           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		       		<td nowrap width="20%"> 
		                    <div align="right">Estado Civil :</div>
		            </td>
		       		<td nowrap width="30%"> 
		                  <select name="E01MST" disabled>
		                    <option value=" " <% if (!(entity.getE01MST().equals("1")||entity.getE01MST().equals("2") || entity.getE01MST().equals("3")||entity.getE01MST().equals("4")||entity.getE01MST().equals("5"))) out.print("selected"); %>> 
		                    </option>
		                    <% if (currUser.getE01INT().equals("07")) { %>
		                    <option value="1" <% if (entity.getE01MST().equals("1")) out.print("selected"); %>>Soltero(a)</option>
		                    <option value="2" <% if (entity.getE01MST().equals("2")) out.print("selected"); %>>Casado(a)</option>                   
		                    <%} else if (currUser.getE01INT().equals("18")) { %>
		                    <option value="1" <% if (entity.getE01MST().equals("1")) out.print("selected"); %>>Soltero(a)</option>
		                    <option value="2" <% if (entity.getE01MST().equals("2")) out.print("selected"); %>>Casado(a) - Separacion de Bienes</option>                   
		                    <option value="3" <% if (entity.getE01MST().equals("3")) out.print("selected"); %>>Casado(a) - Sociedad Conyugal</option>
		                    <option value="4" <% if (entity.getE01MST().equals("4")) out.print("selected"); %>>Casado(a) - Participacion</option>
		                    <option value="5" <% if (entity.getE01MST().equals("5")) out.print("selected"); %>>Viudo</option>
		                    <option value="6" <% if (entity.getE01MST().equals("6")) out.print("selected"); %>>Seperado</option>
		                    <option value="7" <% if (entity.getE01MST().equals("7")) out.print("selected"); %>>Otro</option>
							<%} else { %>
		                    <option value="1" <% if (entity.getE01MST().equals("1")) out.print("selected"); %>>Soltero(a)</option>
		                    <option value="2" <% if (entity.getE01MST().equals("2")) out.print("selected"); %>>Casado(a)</option>                   
		                    <option value="3" <% if (entity.getE01MST().equals("3")) out.print("selected"); %>>Divorciado(a)</option>
		                    <option value="4" <% if (entity.getE01MST().equals("4")) out.print("selected"); %>>Viudo(a)</option>
		                    <option value="5" <% if (entity.getE01MST().equals("5")) out.print("selected"); %>>Otro</option>
		                    <option value="6" <% if (entity.getE01MST().equals("6")) out.print("selected"); %>>Unión Libre</option>
							<% } %>
		                  </select>
		                </td>
		 				<td nowrap width="20%">
		                     <div align="right">Sexo :</div>
		                </td>
		 				<td nowrap width="30%">
		 			       <p> 
		                    <input type="radio" name="E01GEN" disabled value="F" <%if (entity.getE01GEN().equals("F")) out.print("checked"); %>>
		                    Femenino 
		                    <input type="radio" name="E01GEN" disabled value="M" <%if (entity.getE01GEN().equals("M")) out.print("checked"); %>>
		                    Masculino 
		                    </p> 
		               </td>
		            </tr>    
			<%} else  {%>	     
		           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
		       		<td nowrap width="20%"> 
		              <div align="right">Nombre :</div>
		           </td>
		           <td nowrap width="30%">
					 <eibsinput:text name="entity" property="E01NME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>"  readonly="true"/>                
				   </td>
		        	   <td nowrap width="20%"> </td>
				       <td nowrap width="30%"></td> 
		           </tr> 	
		           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		       		<td nowrap width="20%"> 
		            	<div align="right">Pais Empresa :</div>
		            </td>
		       		<td nowrap width="30%"> 
						<eibsinput:cnofc name="entity" property="E01CCS" flag="03" fn_code="E01CCS" fn_description= "D01CCS" readonly="true"/>
			            <eibsinput:text name="entity" property="D01CCS" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true" />
		          	</td>
		            <td nowrap width="20%"> 
		                    <div align="right">Fecha Fundacion :</div>
		           </td>
		           <td nowrap width="30%"> 
		           </td>
		           </tr>    
			<% } %>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
    	   <td nowrap width="20%">
                   <div align="right">Email :</div>
		   </td>
		   <td nowrap width="30%">
				  <eibsinput:text name="entity" property="E01IAD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EMAIL %>"  readonly="true"/>                
		   </td> 
       		<td nowrap width="20%"> 
                   <div align="right">Telefono :</div>
               </td>
       		<td nowrap width="30%"> 
				  <eibsinput:text name="entity" property="E01PHN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE %>"  readonly="true"/>                
               </td>
		  </tr>   
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
    	   <td nowrap width="20%"  style="vertical-align:text-top; padding-top: 5px ">
                   <div align="right">Direccion:</div>
		   </td>
		   <td nowrap width="30%">
				  <eibsinput:text name="entity" property="E01MA1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>"  readonly="true"/><br>   
				  <eibsinput:text name="entity" property="E01MA2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>"  readonly="true"/><br>                
				  <eibsinput:text name="entity" property="E01MA3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>"  readonly="true"/><br>                
				  <eibsinput:text name="entity" property="E01MA4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>"  readonly="true"/>                
		   </td> 
       		<td nowrap width="20%"> 
               </td>
       		<td nowrap width="30%"> 
               </td>
		  </tr>   		  
		<% } %>
		</table>
		</td>
		</tr>
</table>	