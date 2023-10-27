<html>
<head><title>Instrumentos </title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript"
	src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<jsp:useBean id= "EWD0308Help" class= "datapro.eibs.beans.JBList"   scope="session"/>

<SCRIPT type="text/javascript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>);
</SCRIPT>

<script type="text/javascript">
	function enter(code1,code2,code3,code4,code5,code6,code7,code8,code9,code10,code11,code12,code13,code14,code15) {
		var form = top.opener.document.forms[0];
	  	if (isValidObject(form[top.opener.fieldName])) form[top.opener.fieldName].value = code1;
	  	if (isValidObject(form[top.opener.fieldDesc])) {form[top.opener.fieldDesc].value = code2;}
	  	if (isValidObject(form[top.opener.fieldId])) {form[top.opener.fieldId].value = code3;}
	  	if (isValidObject(form[top.opener.fieldAux1])) {form[top.opener.fieldAux1].value = code4;}
	  	if (isValidObject(form[top.opener.fieldAux2])) {form[top.opener.fieldAux2].value = code5;}
	  	if (isValidObject(form[top.opener.fieldDate1])) {form[top.opener.fieldDate1].value = code6;}
	  	if (isValidObject(form[top.opener.fieldDate2])) {form[top.opener.fieldDate2].value = code7;}
	  	if (isValidObject(form[top.opener.fieldAux3])) {form[top.opener.fieldAux3].value = code8;}
	  	if (isValidObject(form[top.opener.fieldAux4])) {form[top.opener.fieldAux4].value = code9;}
	  	if (isValidObject(form[top.opener.fieldAux5])) {form[top.opener.fieldAux5].value = code10;}
	  	if (isValidObject(form[top.opener.fieldAux6])) {form[top.opener.fieldAux6].value = code11;}
	  	if (isValidObject(form[top.opener.fieldAux7])) {form[top.opener.fieldAux7].value = code12;}
	  	if (isValidObject(form[top.opener.fieldAux8])) {form[top.opener.fieldAux8].value = code13;}
	  	if (isValidObject(form[top.opener.fieldAux9])) {form[top.opener.fieldAux9].value = code14;}
	  	if (isValidObject(form[top.opener.fieldAux10])) {
	  		form[top.opener.fieldAux10].value = code15;
	  		form[top.opener.fieldAux10].onchange();
	  	}
	  	top.close();
	 }
</script>
</head>
<body>
<%
	if ( EWD0308Help.getNoResult() ) {
 %>
   		
<h4 align="center">&nbsp;</h4>
<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
      <div align="center"> <b>No hay resultados que correspondan a su criterio búsqueda</b></div>
      </TD></TR>
   		</TABLE>
<%  
		}
	else {
%> 
<div align="center"><h4>Lista de Instrumentos </h4></div>
<TABLE class="tableinfo" align="center" style="width:'95%'">
  <TR id="trdark"> 
    <th >Código </th>
    <th> 
      <div align="left">Descripción </div>
    </th>
    <th>Moneda</th>
    <th> 
      <div align="center">Tipo</div>
    </th>
    <th> 
      <div align="left">Símbolo </div>
    </th>
    <th> 
      <div align="left">ISIN </div>
    </th>
    <th> 
      <div align="left">CUSIP </div>
    </th>
    <th> 
      <div align="left">Estado </div>
    </th>
    <th> 
      <div align="left">Emisor </div>
    </th>
    <th> 
      <div align="left">Fecha de <br> Emisión<br>
        </div>
    </th>
  </tr>
  <%
              String des = (String)request.getAttribute("DESCRIPTION");  
              String insttype = (request.getParameter("INSTTYPE") == null)
								? ""
								: request.getParameter("INSTTYPE");
			  EWD0308Help.initRow();
                while (EWD0308Help.getNextRow()) {
                    if (EWD0308Help.getFlag().equals("")) {
                    		out.println(EWD0308Help.getRecord());
                    }
                }
    %> 
</TABLE>

<TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>
  <%
        if ( EWD0308Help.getShowPrev() ) {
      			int pos = EWD0308Help.getFirstRec() - 51;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0308F?DESCRIPTION=" + des +"&Pos=" + pos +"&INSTTYPE=" + insttype +"\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/s/previous_records.gif\" ></A>");
        }
   %>  
  </TD>
  <TD WIDTH="50%" ALIGN=RIGHT>     
 <% 
        if ( EWD0308Help.getShowNext() ) {
      			int pos = EWD0308Help.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0308F?DESCRIPTION=" + des +"&Pos=" + pos +"&INSTTYPE=" + insttype +"\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/s/next_records.gif\" ></A>");
        }
  %> 
   </TD>
 	</TR>
 	</TABLE>

<%
   }  
%>
</body>
</html>