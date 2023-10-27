<html>
<head><title>Foreign Exchange </title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EWD0308Help" class= "datapro.eibs.beans.JBList"   scope="session"/>

<SCRIPT type="text/javascript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>);
</SCRIPT>

<script type="text/javascript">
//<!-- Hide from old browsers
function enter(code1,code2,code3,code4,code5,code6,code7) {

  top.opener.document.forms[0][top.opener.fieldName].value = code1;
  if(top.opener.fieldDesc.trim() !== ""){top.opener.document.forms[0][top.opener.fieldDesc].value = code2};
  if(top.opener.fieldisin.trim() !== ""){top.opener.document.forms[0][top.opener.fieldisin].value = code3};
  if(top.opener.fieldinstype.trim() !== ""){top.opener.document.forms[0][top.opener.fieldinstype].value = code4};
  if(top.opener.fieldquantity.trim() !== ""){top.opener.document.forms[0][top.opener.fieldquantity].value = code5};
  if(top.opener.fieldmarketprice.trim() !== ""){top.opener.document.forms[0][top.opener.fieldmarketprice].value = code6};
  if(top.opener.fieldmarketvalue.trim() !== ""){top.opener.document.forms[0][top.opener.fieldmarketvalue].value = code7};
  
  top.close();
 }
//-->
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
      <div align="center"> <b> There is no match for your search 
        criteria </b></div>
      </TD></TR>
   		</TABLE>
<%  
		}
	else {
%> 
<div align="center"><h4>Instrument List </h4></div>
<TABLE class="tableinfo" align="center" style="width:'95%'">
  <TR id="trdark"> 
    <th >Code </th>
    <th> 
      <div align="left">Description </div>
    </th>
    <th> 
      <div align="center">Type</div>
    </th>
    <th> 
      <div align="left">ISIN </div>
    </th>
    <th> 
      <div align="left">Current Quantity </div>
    </th>
    <th> 
      <div align="left">Market Price </div>
    </th>
    <th> 
      <div align="left">Market Value </div>
    </th>
  </tr>
  <%
              String des = (String)session.getAttribute("DESCRIPTION");  
              String insttype = (String)session.getAttribute("INTSTYPE");
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
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0308I?DESCRIPTION=" + des +"&Pos=" + pos +"&INSTTYPE=" + insttype +"\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/s/previous_records.gif\" ></A>");
        }
   %>  
  </TD>
  <TD WIDTH="50%" ALIGN=RIGHT>     
 <% 
        if ( EWD0308Help.getShowNext() ) {
      			int pos = EWD0308Help.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0308I?DESCRIPTION=" + des +"&Pos=" + pos +"&INSTTYPE=" + insttype +"\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/s/next_records.gif\" ></A>");
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