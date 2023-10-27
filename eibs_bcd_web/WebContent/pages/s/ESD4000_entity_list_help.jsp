<%@page import="com.datapro.constants.Entities"%>
<%@page import="com.datapro.constants.EntitiesHtml"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="datapro.eibs.sockets.MessageRecord"%>
<%@page import="datapro.eibs.beans.ESD400001Message"%>

<jsp:useBean id= "ESD400001List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<html>
<head>  
<title>Entity List</title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link Href="<%=request.getContextPath()%>/fonts/css/font-awesome.min.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<style type="text/css">
label:after {
    content: "\A";
    white-space: pre;
    margin-bottom: 10px;
}

input[type="radio"]{
    vertical-align: baseline;
}
</style>

<script type="text/javascript">
	

function goInquiry() {
	var page = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD4000?SCREEN=900&ROW="+getElementChecked('ROW').value;  
	CenterWindow(page, 1000, 550, 2);
}


</SCRIPT>  

<% 
 boolean isPerson = userPO.getOption().equals("CLIENT_P");
 boolean emptyList = ESD400001List.getNoResult();
 int totalRows = 0;
 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

</head>

<BODY>
<% String type = userPO.getHeader10(); %>
<h3 align="center"> <%= EntitiesHtml.getTitle(type) %><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="entity_list_help.jsp, ESD4000"></h3>
<hr size="4">
<FORM name="form1"  >
  <p> 
    <input type=HIDDEN name="TOTROWS" id="TOTROWS" value="0">
    <input type=HIDDEN name="opt" id="opt" value="1">
	<INPUT TYPE=HIDDEN name="actRow" id="actRow" value="0">
	<INPUT TYPE=HIDDEN name="NEXTROWS" id="NEXTROWS" value="<%= ESD400001List.getLastRec()%>;">
	<INPUT TYPE=HIDDEN name="CURRROWS" id="CURRROWS" value="<%= ESD400001List.getFirstRec()%>">
	<INPUT TYPE=HIDDEN name="FromRecord" id="FromRecord" value="0"> 
	<INPUT TYPE=HIDDEN name="num" id="num" value="0"> 
	<INPUT TYPE=HIDDEN name="TYPE" id="TYPE" value="C"> 
  </p>
  

<% if(userPO.getAccNum() == null || userPO.getAccNum().trim().equals("")){ %>
 <table class="tableinfo">
  <tr > 
    <td nowrap> 
      <table cellspacing="0" cellpadding="2" style="width: 100%; margin:0 auto;"  class="tbhead" >
        <tr>
			<td nowrap width="10%" align="right"> Cliente:</td>
			<td nowrap width="12%" align="left"><%= userPO.getCusNum()%></td>
            <td nowrap width="6%" align="right">ID:  </td>
			<td nowrap width="14%" align="left"><%= userPO.getID()%></td>
			<td nowrap width="8%" align="right"> Nombre: </td>
          <td nowrap width="50%"align="left"><%= userPO.getCusName()%></td>
        </tr>
      </table>
      </td>
      </tr>
 </table>
 <% } else { %>
   <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" style="width: 100%; margin:0 auto; border: 0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="customerNumber" id="customerNumber" size="10" maxlength="9" value="<%= userPO.getCusNum()%>">
               </div> 
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="customerName" id="customerName" size="45" maxlength="45" readonly value="<%= userPO.getCusName()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="accountNumber" id="accountNumber" size="13" maxlength="12" value="<%= userPO.getAccNum().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="currency" id="currency" size="3" maxlength="3" value="<%= userPO.getCurrency()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="product" id="product" size="4" maxlength="4" readonly value="<%= userPO.getProdCode()%>">
                </b> </div>
            </td>
          </tr>
        </table>
        </td>
        </tr>
  </table>
  <% } %>
  
  
  <br>
  <table  id=cfTable class="tableinfo">
    <tr > 
      <td NOWRAP valign="top" style="width: 100%"> 
        <table id="headTable" style="width: 100%">
          <tr id="trdark"> 
            <th align=center nowrap width="5%">&nbsp;</th>
		  <%if(type.equals(Entities.ENTITY_TYPE_CUSTOMER_ASSETS)){ %>
            <th align=center nowrap width="10%"> Referencia</th>
            <th align=center nowrap width="50%"> Descripcion</th>
            <th align=center nowrap width="20%"> Valor</th>
		  <% } else if(type.equals(Entities.ENTITY_TYPE_BANK_REFERENCES)){ %>
            <th align=center nowrap width="10%"> Referencia</th>
            <th align=center nowrap width="50%"> Institucion Financiera</th>
            <th align=center nowrap width="20%"> Numero Cuenta</th>
		   <% } else {%>
            <th align=center nowrap width="10%"> Tipo-Numero</th>
            <th align=center nowrap width="50%"> Nombre</th>
            <th align=center nowrap width="20%"> Identificación</th>
          <% } %> 
    	  <%if ("MAINTENANCE".equals(userPO.getPurpose()) || "APPROVAL_INQ".equals(userPO.getPurpose())) { %>
	       	<th align=center nowrap width="10%"> Accion</th> 
		  <% } %>    	
		</tr>
        </table>
      </td>
    </tr>    
  	<% if (emptyList) { %>
      <tr id="dataTable"> 
		<TD ALIGN="CENTER" nowrap width="35%" style="color:#d0122c" colspan="5">
			<br><br><br><br> <font size=3>No hay resultados para su búsqueda.</font>
		</TD>          
	 </tr>
	 <% } else {%>     
    
		  <tr>    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:300px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" style="width: 100%; border: 0">
          <%
    	  int i = 0;
          ESD400001List.initRow();
				boolean firstTime = true;
				String chk = "";
          while (ESD400001List.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
            ESD400001Message msgList = (ESD400001Message) ESD400001List.getRecord();	 

         %>   
			<tr id="dataTable<%= ESD400001List.getCurrentRow() %>">
				<td nowrap align="center" width="5%"><input type="radio" name="ROW" value="<%=ESD400001List.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= ESD400001List.getCurrentRow() %>)"/></td>
			  <%if(type.equals(Entities.ENTITY_TYPE_CUSTOMER_ASSETS) || type.equals(Entities.ENTITY_TYPE_CUSTOMER_LIABILITIES)){ %>
	            <td NOWRAP  align='left' width="10%"> <a onclick="retRelationshipNum('<%= msgList.getE01RNU() %>')"><%= msgList.getE01RNU()%> </a></td>
	            <td NOWRAP  align='left' width="50%"> <a onclick="retRelationshipNum('<%= msgList.getE01RNU() %>')"><%= msgList.getE01DSC()%> </a></td>
	            <td NOWRAP  align='right' width="20%"> <a onclick="retRelationshipNum('<%= msgList.getE01RNU() %>')"><%= msgList.getE01AMT()%> </a></td>
			  <% } else if(type.equals(Entities.ENTITY_TYPE_BANK_REFERENCES)){ %>
	            <td NOWRAP  align='left' width="10%"> <a onclick="retRelationshipNum('<%= msgList.getE01RNU() %>')"><%= msgList.getE01RNU()%> </a></td>
	            <td NOWRAP  align='left' width="50%"> <a onclick="retRelationshipNum('<%= msgList.getE01RNU() %>')"><%= msgList.getD01UC1()%> </a></td>
	            <td NOWRAP  align='left' width="20%"> <a onclick="retRelationshipNum('<%= msgList.getE01RNU() %>')"><%= msgList.getE01REF()%> </a></td>
			  <% } else {%>
	            <td NOWRAP  align='left' width="10%"> <a onclick="retRelationshipNum('<%= msgList.getE01RNU() %>')"><%= msgList.getE01RCN().equals("C") ? "Cliente-" : msgList.getE01RCN().equals("N") ?  "Entidad-": " "%> <%= msgList.getE01RNU() %> </a></td>
	            <td NOWRAP  align='left' width="50%"> <a onclick="retRelationshipNum('<%= msgList.getE01RNU() %>')"><%= msgList.getE01NME()%> </a></td>
	            <td NOWRAP  align='left' width="20%"> <a onclick="retRelationshipNum('<%= msgList.getE01RNU() %>')"><%= msgList.getE01IDN()%> </a></td>
	          <% } %>
	          <%if ("MAINTENANCE".equals(userPO.getPurpose()) || "APPROVAL_INQ".equals(userPO.getPurpose())) { %>
		         <td NOWRAP  align='left' width="10%"> <%= msgList.getD01RTY().trim()%> </td>
	          <% } %>
	            
	          </tr>
	          
	            <% i++;  
	            } %> 
	             </table>
	        	</div>
	    	</td>
		</tr>
	<% } %>
</table>
<p> 


<SCRIPT type="text/javascript">

showChecked("ROW");
document.getElementById("TOTROWS").value = <%= totalRows %>;

function retRelationshipNum(num){
	var form = top.opener.document.forms[0];
	
	if (isValidObject(form[top.opener.fieldName])) {
		setField(form[top.opener.fieldName], num);
		 top.opener.fieldName = "";	 
	}
	self.close();
}

</SCRIPT>
</form>
</body>
</html>
