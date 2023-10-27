<%@page import="com.datapro.constants.Entities"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import = "java.io.*,java.net.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*" %>

<jsp:useBean id="entity" class="datapro.eibs.beans.EDD001001Message"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<%

boolean isReadOnly = userPO.getPurpose().equals("I") ||userPO.getPurpose().equals("D") ? true:false;

%> 
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right"><b>Codigo :</b></div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
            	  <eibsinput:text name="entity" property="E01AHGNUM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true" />
            	  <%if (userPO.getHeader10().equals("N")) out.print("Nuevo"); %>
              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="right"><b>Oficina : </b></div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"><b> 
                  <input type="text" name="E01AHGBRN" size="5" maxlength="4"  value ="<%=userPO.getBranch() %>" 
                    readonly="true" />
                  <input type="text" name="E01AHGDSB" size="25" maxlength="24"  value ="<%=userPO.getHeader4() %>" 
                    readonly="true" />
                  
                </b> </div>
            </td>
          </tr>
          <tr id="trdark">
          	 <td nowrap width="25%"> 
              <div align="right"><b>Descripción : </b></div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"><b> 
                <eibsinput:text name="entity" property="E01AHGDSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NARRATIVE %>" 
                 required="true"  readonly="<%=isReadOnly%>"/>
                </b> </div>
            </td>
             <td nowrap width="25%"> 
              <div align="right"><b>Fecha de Inicio :</b></div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
               <eibsinput:date name="entity" fn_year="E01AHGSTY" fn_month="E01AHGSTM" fn_day="E01AHGSTD"
				required="true"  readonly="<%=isReadOnly%>"  /></td>
              </div>
            </td>
          </tr>
           <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right"><b>Termino o Plazo : </b></div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"><b> 
               	<eibsinput:text name="entity" property="E01AHGTRM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_QUANTITY %>" 
               	required="true" readonly="<%=isReadOnly%>" />
                </b> </div>
            </td>
            <td nowrap width="25%"> 
           		<div align="right"><b>Dia Limite del Mes : </b></div>
            </td>
            <td nowrap width="25%"> 
            	 <eibsinput:text name="entity" property="E01AHGDAP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DAY %>" 
             	  readonly="<%=isReadOnly%>" /> 
              </td>
          </tr>
           <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right"><b>Oficial : </b></div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"><b> 
               	<eibsinput:cnofc name="entity" property="E01AHGOFC" flag="15" fn_code="E01AHGOFC" fn_description= "E01AHGDSO" readonly="<%=isReadOnly%>" />
               	<eibsinput:text name="entity" property="E01AHGDSO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NARRATIVE %>" 
               	required="true" readonly="true" />
                </b> </div>
            </td>
            <%if(!userPO.getHeader10().equals("N")){ %>
            <td nowrap align=right width="10%"> 
   				<b>ESTADO :</b>
    		</td>
  			<td nowrap width="20%"> 
   				<b><font color="#ff6600"><% if(!entity.getE01AHGSTS().equals("3")){
   												out.print("Vigente"); 
   											}else{ out.print("Vencido");}%></font></b>
 	    	</td>
 	    	<%}else{ %>
 	    	<td nowrap> 
   			</td>
  			<td nowrap width="20%"> 
   			</td>
   			<%} %>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <%if(!userPO.getHeader10().equals("N")){ %> 
   <h4>Cuentas de Ahorro</h4>
  <TABLE  id="mainTable" class="tableinfo" style="height:106px;">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="98%">
			<tr id="trdark">
	            <th nowrap width="16%" align="center">Cuenta</th>
	            <th nowrap width="30%" align="center">Nombre</th>
	       </tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:106px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
          <%
           int k = 0;
           for (int i=0;i<10;i++) {
             k++;
          %> 
          <tr id="trclear"> 
            <td nowrap width="16%" align="center"> 
   				<%= k %>
				<input type=text name="<%="E01ACMAC"+i%>" size="13" maxlength="12" value="<%=entity.getFieldString("E01ACMAC"+i) %>" 
				<% if(!isReadOnly){%>  class="context-menu-help" onmousedown="init(accountHelp,this.name,document.forms[0].H01BNK.value,'','','','04')"<% }%> readonly></td>
            <td nowrap width="30%"  align="center"> 
				<input type="text" name="<%="E01CUSNA"+i %>" size="45" maxlength="44" value="<%=entity.getFieldString("E01CUSNA"+i) %>" readonly>
				    <input class="styled-button-Search" id="garbtn<%=i%>" type=button name="Submit" value="Consulta" onClick="showBasicAccount(getElement('E01ACMAC<%=i%>').value.trim())" >
			</td>
          </tr> 
   		  <%}%>
        </table>
      </div>
	 </td>
	</tr>
 </table>
 <%} %>

  <h4>Información de Auditoria</h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Usuario Creador : </td>
            <td nowrap align="left" width="35%">
            	<%= entity.getE01AHGCRU()%>
			</td>
            <td nowrap width="15%" align="right">Usuario último Cambio : </td>
            <td nowrap width="35%" align="left">
            	<%= entity.getE01AHGLMU()%>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" align="right">Fecha de Proceso - Creación : </td>
			<td nowrap width="35%" align="left"> 
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),
                		Integer.parseInt(entity.getE01AHGCRM()),Integer.parseInt(entity.getE01AHGCRD()),Integer.parseInt(entity.getE01AHGCRY()))%>
            </td>
            <td nowrap width="15%" align="right">Fecha de Proceso - Cambio : </td>
			<td nowrap width="35%" align="left">
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),
                	Integer.parseInt(entity.getE01AHGLMM()),Integer.parseInt(entity.getE01AHGLMD()),Integer.parseInt(entity.getE01AHGLMY()))%>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Fecha / Hora - Creación : </td>
			<td nowrap width="35%" align="left">
				<%= entity.getE01AHGCRT()%>
            </td>
            <td nowrap width="15%" align="right">Fecha / Hora - Cambio : </td>
			<td nowrap width="35%" align="left"> 
            	<%= entity.getE01AHGLMT()%>
			</td>
          </tr>
        </table> 
      </td>  
    </tr>
  </table>
  <script>
  
  
 function showBasicAccount(acc) {
				var url = "${pageContext.request.contextPath} /servlet/datapro.eibs.products.JSEDD0010?SCREEN=32&ACC="+acc;
				CenterWindow(url, 1070, 660, 2);
			}
			
</script>
