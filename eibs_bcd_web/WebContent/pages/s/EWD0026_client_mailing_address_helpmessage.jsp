<html>
<head><title>Direcciones del Cliente</title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ewd0026Help" class= "datapro.eibs.beans.JBListRec"   scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<SCRIPT type="text/javascript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>);
</SCRIPT>
<script type="text/javascript">
	function enter(code) {
		var formLength= top.opener.document.forms[0].elements.length;
		for(n=0;n<formLength;n++){
			var elementName= top.opener.document.forms[0].elements[n].name;
			if(elementName == top.opener.fieldName){
  				top.opener.document.forms[0].elements[n].value = code;
  				break;
			}
 		}
		top.close();
 	}
</script>
</head>
<body>
<%
	if ( ewd0026Help.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
      <div align="center"> <font size="3"><b> No hay resultados para su criterio 
        de busqueda  </b></font></div>
      </TD></TR>
   		</TABLE>
<%   		
	}
	else {
	      ewd0026Help.initRow();
         while (ewd0026Help.getNextRow()) {
            if (ewd0026Help.getFlag().equals("")) {
%>
       <%  if (currUser.getE01INT().trim().equals("18")) {%>		

					  <BR>
					  <TABLE class="tableinfo" style="width:95%" ALIGN=CENTER>
						 <TR id = "trdark">
						 <td width=30%>Direccion No.</td>
					   <td width=70%><a href= "javascript:enter('<%=ewd0026Help.getRecord(0)%>')"><%=ewd0026Help.getRecord(0)%></a></td>
						</TR>
						<TR>
						 <td width=30% >Nombre</td>
						<td width=70%><a href= "javascript:enter('<%=ewd0026Help.getRecord(0)%>')"><%=ewd0026Help.getRecord(2)%></a></td>
						</TR>
						<TR>
						 <td width=30% >Tipo Direccion</td>
						<td width=70%><a href= "javascript:enter('<%=ewd0026Help.getRecord(0)%>')"><%=ewd0026Help.getRecord(21) +" - "+ ewd0026Help.getRecord(22)%></a></td>
						</TR>
						<TR>
						 <td width=30% >Comuna</td>
						<td width=70%><a href= "javascript:enter('<%=ewd0026Help.getRecord(0)%>')"><%=ewd0026Help.getRecord(23) +" - "+ ewd0026Help.getRecord(24)%></a></td>
						</TR>
						<TR>
						 <td width=30% >Numero</td>
						<td width=70%><a href= "javascript:enter('<%=ewd0026Help.getRecord(0)%>')"><%=ewd0026Help.getRecord(20)%></a></td>
						</TR>
						<TR>
						 <td width=30% >Casa/Depto</td>
						<td width=70%><a href= "javascript:enter('<%=ewd0026Help.getRecord(0)%>')"><%=ewd0026Help.getRecord(5)%></a></td>
						</TR>
						<TR>
						 <td width=30% >Referencia</td>
						<td width=70%><a href= "javascript:enter('<%=ewd0026Help.getRecord(0)%>')"><%=ewd0026Help.getRecord(8)%></a></td>
						</TR>
						<TR>
						 <td width=30%>Codigo Postal</td>
						 <td width=70%><a href= "javascript:enter('<%=ewd0026Help.getRecord(0)%>')"><%=ewd0026Help.getRecord(9)%></a></td>
						</TR>
						<TR>
						 <td width=30%>Fecha Actualizacion</td>
						 <td width=70%><a href= "javascript:enter('<%=ewd0026Help.getRecord(0)%>')"><%=ewd0026Help.getRecord(17)%></a></td>
						</TR>
						<TR>
						 <td width=30% >Verificado Por</td>
						<td width=70%><a href= "javascript:enter('<%=ewd0026Help.getRecord(0)%>')"><%=ewd0026Help.getRecord(25) +" - "+ ewd0026Help.getRecord(26)%></a></td>
						</TR>

					</TABLE>				
					<BR>

		<% } else {%> 	
					  <BR>
					  <TABLE class="tableinfo" style="width:95%" ALIGN=CENTER>
						 <TR id = "trdark">
						 <td width=30%>Direccion No.</td>
					   <td width=70%><a href= "javascript:enter('<%=ewd0026Help.getRecord(0)%>')"><%=ewd0026Help.getRecord(0)%></a></td>
						</TR>
						<TR>
						 <td width=30% >Cliente</td>
						<td width=70%><a href= "javascript:enter('<%=ewd0026Help.getRecord(0)%>')"><%=ewd0026Help.getRecord(1)%></a></td>
						</TR>
						<TR id = "trdark">
						 <td width=30% >Nombre </td>
						<td width=70%><a href= "javascript:enter('<%=ewd0026Help.getRecord(0)%>')"><%=ewd0026Help.getRecord(2)%></a></td>
						</TR>
						<TR>
						 <td width=30%> Direccion</td>
						 <td width=70%><a href= "javascript:enter('<%=ewd0026Help.getRecord(0)%>')">
						   <%=ewd0026Help.getRecord(3)%><BR>
						   <%=ewd0026Help.getRecord(4)%><BR>
						   <%=ewd0026Help.getRecord(5)%></a></td>
						<TR id = "trdark">
						 <td width=30%> Ciudad</td>
						 <td width=70%><a href= "javascript:enter('<%=ewd0026Help.getRecord(0)%>')"><%=ewd0026Help.getRecord(6)%></a></td>
						</TR>
						<TR>
						 <td width=30%> Estado </td>
						 <td width=70%><a href= "javascript:enter('<%=ewd0026Help.getRecord(0)%>')"><%=ewd0026Help.getRecord(7)%></a></td>
						</TR>
						<TR id = "trdark">
						 <td width=30%>Pais </td>
						 <td width=70%><a href= "javascript:enter('<%=ewd0026Help.getRecord(0)%>')"><%=ewd0026Help.getRecord(8)%></a></td>
						</TR>
						<TR>
						 <td width=30%>Codigo Postal</td>
						 <td width=70%><a href= "javascript:enter('<%=ewd0026Help.getRecord(0)%>')"><%=ewd0026Help.getRecord(9)%></a></td>
						</TR>
						<TR id = "trdark">
						 <td width=30%>Apartado Postal</td>
						 <td width=70%><a href= "javascript:enter('<%=ewd0026Help.getRecord(0)%>')"><%=ewd0026Help.getRecord(10)%></a></td>
						</TR>
					</TABLE>				
					<BR>
				<%} %>   

  <%
                    }
                }
            }    
  %> 
</body>
</html>