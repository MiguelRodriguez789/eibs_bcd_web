<%@ page import="datapro.eibs.master.Util" %>
<%@ page import="datapro.eibs.beans.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META http-equiv="Pragma" content="No-cache">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<style type="text/css">
ul.addressList{
	list-style-type: none;
}


ul.addressList{
	font-weight: bold;
	font-style : italic;
	cursor: pointer;
}

ul.addressList:HOVER{
	color: #2726CD;
	font-weight: normal;
	cursor: pointer;
	font-style: normal;
}
</style>

<jsp:useBean id= "ewd0140Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script type="text/javascript">
function enter(code,nda,cust,man) {
	var topForm = top.opener.document.forms[0];
	var fieldAux1 = top.opener.fieldAux1
	var fieldAux5 = top.opener.fieldAux5
	var fieldName = top.opener.fieldName;
	
	if(isValidObject(topForm[fieldAux1])){
		setField(topForm[fieldAux1], nda)
	}

	if(isValidObject(topForm[fieldAux5])){
		setField(topForm[fieldAux5], man)
	}
	
	if(isValidObject(topForm[fieldName])){
		setField(topForm[fieldName], code)
	}	
		
	top.close();
}
</script>
<TITLE></TITLE>
</HEAD>

<BODY>


<FORM>
<%
	if ( ewd0140Help.getNoResult() ) {
%>
 		<TABLE class="tbenter" width=100% height=100%>
 		<TR>
      <TD> 
        
      <div align="center"> <font size="3"><b> No hay datos que correspondan con su criterio de busqueda</b></font> 
      </div>
      </TD></TR>
   		</TABLE>
<%
	}
	else {
%>
 
  <TABLE class="tableinfo" style="width:95%" ALIGN=CENTER>
    <TR id="trdark">
      <TH ALIGN=CENTER  nowrap width="20%">Numero</TH>
      <TH ALIGN=CENTER  nowrap width="80%">Direccion</TH>
    </TR>
    <%
                String NameSearch = (String)request.getAttribute("NameSearch");
                String FromRecord = (String)request.getAttribute("FromRecord");
             	String arguments;
		        StringBuilder sb = new StringBuilder();                
				EWD0140DSMessage msgHelp;	
                ewd0140Help.initRow();
                while (ewd0140Help.getNextRow()) {
                    msgHelp = (EWD0140DSMessage) ewd0140Help.getRecord();			 
                    sb.append("'").append(msgHelp.getE01CUMMAN()).append("',");
                    sb.append("'").append(msgHelp.getE01CUMMA1()).append("',");
                    sb.append("'").append(msgHelp.getE01CUMCUN()).append("',");
                    sb.append("'").append(msgHelp.getE01CUMMAN()).append("'");
		            arguments = sb.toString();
                
	%> 
	<TR style="vertical-align: top;">
		<td NOWRAP align="center">
			<a href="javascript:enter(<%= arguments%>)">
				<%=Util.formatCell(msgHelp.getE01CUMMAN())%>
			</a>
		</td>
		<TD nowrap>
				<ul class="addressList" onclick="javascript:enter(<%= arguments%>)"> 
					<li><%= msgHelp.getE01CUMMA1() %> 
						<% if( !"".equals(msgHelp.getE01CUMMA1().trim())){ %>
						 <i class="fa fa-plus-square fa-fw plusIcon" > ...</i>
						 <% } %>
					</li>
					<% if( !"".equals(msgHelp.getE01CUMMA2().trim())){ %><li><%= msgHelp.getE01CUMMA2() %></li> <% } %>
					<% if( !"".equals(msgHelp.getE01CUMMA3().trim())){ %><li><%= msgHelp.getE01CUMMA3() %></li> <% } %>
					<% if( !"".equals(msgHelp.getE01CUMMA4().trim())){ %><li><%= msgHelp.getE01CUMMA4() %></li> <% } %>
				</ul>           
		</TD>
	</TR>
	<%  
	 	 sb.setLength(0); // set length of buffer to 0
		 sb.trimToSize(); // trim the underlying buffer
	     }
              %>
</TABLE>  
  
  <TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
    <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> <%
        if ( ewd0140Help.getShowPrev() ) {
      			int pos = ewd0140Help.getFirstRec() - 21;
      			 out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0140?NameSearch=" + NameSearch + "&FromRecord=" + pos +  "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
        }
%> </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> <%       
        if ( ewd0140Help.getShowNext() ) {
      			int pos = ewd0140Help.getLastRec();
      			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0140?NameSearch=" + NameSearch + "&FromRecord=" + pos +  "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");

        }
%> </TD>
	 </TR>
	 </TABLE>
<%      
  }
%> 
	

<SCRIPT type="text/javascript">
	var hideAddress = function(){
		$(".addressList ").each(function(index) {
			$(this).find('li').each(function(index){
				if(index >= 1){
		    		$(this).hide();
				}
			});
		});
		$('.plusIcon').show();
	};
	
	var showAddress = function(){
		$(this).find('li').show();
		$(this).find('.plusIcon').hide();
	};
	
	$().ready(function(){   
		hideAddress();
		$('.plusIcon').show();
		$(".addressList").hover(showAddress, hideAddress);
	}); 
</SCRIPT>	


</FORM>

</BODY>
</HTML>