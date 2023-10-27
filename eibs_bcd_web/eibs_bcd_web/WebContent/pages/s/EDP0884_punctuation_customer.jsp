<html>
<head>
<title>Calificacion Niveles de Riesgo por Cliente</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id= "trans1" class= "datapro.eibs.beans.JBListRec"  scope="session" /> 
<jsp:useBean id= "trans2" class= "datapro.eibs.beans.JBListRec"  scope="session" /> 
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script type="text/javascript">

function getParams(cod,dsc,i) {
k = <%=trans1.getLastRow()%>+1;
	j = 0;
	if (i != 0) {

		for (j = 0; j < k; j++) {
        	try {
		  		getElement("dataTable2"+j).style.display="none";
		  	} catch(e){}
		}
	}
	
	try {
  		getElement("dataTable2"+i).style.display="";
    	divResize();
	    var dataTab2 = getElement("dataTable2"+i);
     	adjustEquTables( getElement("headTable2"), dataTab2, getElement("dataDiv2"),1,false);
    } catch(e){}
}

function getParams2(p1,p2,p3) {
document.forms[0].E02PTSMOD.value=p2;
document.forms[0].E02PTSSEQ.value=p1;
document.forms[0].E02PTSPTS.value=p3;

}

function goUpdVal(){
document.forms[0].SCREEN.value=300;
document.forms[0].submit();	 
}


</script>

</head>
<body >
<%
	 trans1.initRow();
    int max_row = 9999;
    int row;
    int total_row;
    try {
      row = Integer.parseInt(request.getParameter("ROW"));
    }
    catch (Exception e) {
      row = 0;
    }
    if ( (row == 0) || (row < trans1.getLastRow()) ) {
    }
    else {
		total_row = row;       
    }
%> 

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
%>

<h3 align="center">Mantenimiento Calificación Niveles de Riesgo por Cliente
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="punctuation_customer.jsp,EDP0884"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.creditproposal.JSEDP0884" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="300">
  <input type=HIDDEN name="opt">
  <input type=HIDDEN name="E02PTSMOD">
  <input type=HIDDEN name="E02PTSSEQ">
  <input type=HIDDEN name="E02PTSPTS">
  <INPUT TYPE=HIDDEN NAME="totalRow" VALUE="">
  
  <h4 align="center">
  	<div >Cliente : 
		<INPUT type="text" name="DSC" size="10" maxlength="9" value="<%= userPO.getCusNum().trim()%>" readonly >
		<INPUT type="text" name="DSC1" size="35" maxlength="35" value="<%= userPO.getCusName().trim()%>" readonly>
  	</div> 
  </h4>
  
  <h4>Seleccionar Módulo para Asignar Calificación :</h4>
  
  <table id="mainTable"  class="tableinfo">
  	<tr bordercolor="#FFFFFF"> 
  		<td nowrap>
  			<TABLE id="tbenter" align="center" style="width: 100%" border="0">
  				<tr>
  					<td NOWRAP valign="top" > 
  						<table id="headTable1" >
				          <tr id="trdark"> 
				            <th align=CENTER nowrap >Sel.</th>
				            <th align=CENTER nowrap >Código</th>
				            <th align=CENTER nowrap > <div align="center">Descripción Módulo</div> </th>
				            <th align=CENTER nowrap > <div align="center">Porcentaje</div> </th>
				            <th align=CENTER nowrap > <div align="center">Puntos</div> </th>
				            <th align=CENTER nowrap > <div align="center">Calificación</div> </th>
					      </tr>
						</TABLE>
  					</td>
  				</tr>
  				<tr>
  					<td>
  						<div id="dataDiv1" class="scbarcolor" >
					    <%
							int i = 0;
					    %> 
					    	 <table id="dataTable1" > 
					          <%
						 			trans1.initRow();
						 			boolean firstTime = true;
									String Chk1 = "";
					                while (trans1.getNextRow()) {
										if (firstTime) {
											Chk1 = "checked";
											firstTime = false;
										}else{
											Chk1 = "";
										}
									i++;
							 
							 	if (!trans1.getRecord(1).equals("")) { %>		
							          <tr> 
								        <td align="center" nowrap > 
							            <input type="radio" name="CURRCODE1" value="<%= trans1.getRecord(1) %>" <%=Chk1%> onClick="getParams(this.value,'<%= trans1.getRecord(2) %>','<%=i%>')">
							            </td>
								      	<td align="center" nowrap >  
											<DIV NOWRAP><%=trans1.getRecord(1)%></DIV>
							      		</td>
								      	<td align="center" nowrap >  
											<DIV NOWRAP><%=trans1.getRecord(2)%></DIV>
							      		</td>
								      	<td align="center" nowrap >  
											<DIV NOWRAP><%=trans1.getRecord(3)%></DIV>
							      		</td>
								      	<td align="center" nowrap >  
											<DIV NOWRAP><%=trans1.getRecord(4)%></DIV>
							      		</td>
								      	<td align="center" nowrap >  
											<DIV NOWRAP><%=trans1.getRecord(5)%></DIV>
							      		</td>
							          </tr>
							     <% } else { %>     
							          <tr> 
										<TD ALIGN=CENTER NOWRAP>
										</TD>
										<TD ALIGN=CENTER NOWRAP>
										</TD>
										<TH ALIGN=CENTER NOWRAP>
											<DIV NOWRAP><%=trans1.getRecord(2)%></DIV>
										</TH>
										<TH ALIGN=CENTER NOWRAP>
											<DIV NOWRAP><%=trans1.getRecord(3)%></DIV>
										</TH>
										<TH ALIGN=CENTER NOWRAP>
											<DIV NOWRAP><%=trans1.getRecord(4)%></DIV>
										</TH>
										<TH ALIGN=CENTER NOWRAP>
											<DIV NOWRAP><%=trans1.getRecord(5)%></DIV>
										</TH>
							          </tr>
							      <% } 
							      }
							      %>    
					    	 </table>
  						</div>
  					</td>
  				</tr>
  			</TABLE>
  		</td>
  	</tr>
  </table>
  
  <h4>Asignar Calificación :</h4>
  
  <table id="mainTable2"  class="tableinfo">
  	 <tr bordercolor="#FFFFFF"> 
  	 	<td nowrap> 
  	 		<TABLE id="tbenter" align="center" style="width: 100%" border="0">
  	 			<tr>
  	 				<td NOWRAP valign="top" width="100%"> 
				        <table id="headTable2" >
				          <tr id="trdark"> 
				            <th align=CENTER nowrap >Codigo</th>
				            <th align=CENTER nowrap > <div align="center">Descripcion</div> </th>
				            <th align=CENTER nowrap > <div align="center">Puntos </div> </th>
				            <th align=CENTER nowrap > <div align="center">Calificación</div> </th>
					      </tr>
						</TABLE>
  	 				</td>
  	 			</tr>
  	 			<tr>
  	 				<td>
  	 					<div id="dataDiv2" class="scbarcolor" >
						    <%
								int j = 0;
					 			firstTime = true;
								String brk = "";
								String brk1 = "";
				                while (trans2.getNextRow()) {
									if (firstTime) {
										firstTime = false;
										brk=trans2.getRecord(0);
										brk1=trans2.getRecord(0);
				
										j++;
						    %>
						    			<table id="dataTable2<%= j %>" >
						    				<tr>
						    					<td>
						    <%
						    		} else {
						    			if (!brk.equals(trans2.getRecord(0))) {
											brk=trans2.getRecord(0);
											j++;
							%>
											<table id="dataTable2<%=j%>" style="display: none"> 
							<% 												
						    			}
						    		} 
						    %>			 
									          <tr> 
										      	<td align="center" nowrap >  
									    	      <input type="text" name="E01PTSSEQ_<%= trans2.getCurrentRow() %>"  size="4" maxlength="4"  value="<%= trans2.getRecord(1) %>"  readonly > 
									      		</td>
										      	<td align="center" nowrap >  
									    	      <input type="text" name="E01PTSDSC_<%= trans2.getCurrentRow() %>"  size="50" maxlength="50"  value="<%= trans2.getRecord(2) %>" readonly > 
									      		</td>
										      	<td align="center" nowrap >  
									    	      <input type="text" name="E01PTSPTS_<%= trans2.getCurrentRow() %>"  size="10" maxlength="9"  value="<%= trans2.getRecord(3) %>" readonly > 
									      		</td>
											    <td NOWRAP  align=CENTER width="10%"> 
									              <input type="radio" name="CURRCODE2<%=j%>" value="<%= trans2.getRecord(1) %>" <% if(trans2.getRecord(4).equals("1")){out.print("checked");}%> onClick="getParams2(this.value,'<%= trans2.getRecord(0) %>','<%= trans2.getRecord(3) %>')">
											    </td>
									          </tr>
							<%
								} 
							%>										          
											</table>
											</td>
											</tr>	
						    			</table> 
  	 					</div>
  	 				</td>
  	 			</tr>
  	 		</TABLE>
  	 	</td>
  	 </tr>
  </table>
  
  <br>
  
	<div align="center"> 
		<INPUT id="EIBSBTN0" type="submit" name="Submit0" value="Enviar" onclick="goUpdVal()" >
	</div>

  <SCRIPT type="text/javascript">
     	function resizeDoc() {
    		divResize();
	    	var dataTab1 = getElement("dataTable1");
     		adjustEquTables(getElement("headTable1"), getElement("dataTab1"), getElement("dataDiv1"),1,false);
      	}
     	function resizeDoc2() {
    		divResize();
	    	var dataTab2 = getElement("dataTable21");
     		adjustEquTables(getElement("headTable2"), getElement("dataTab2"), getElement("dataDiv2"),1,false);
      	}
     	resizeDoc();
     	resizeDoc2();
     	window.onresize=resizeDoc;
     	window.onresize=resizeDoc2;
	</SCRIPT>


</form>
</body>
</html>