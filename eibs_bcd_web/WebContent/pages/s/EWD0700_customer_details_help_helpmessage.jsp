<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>

<%@ page import = "datapro.eibs.master.Util" %>
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript">
//<!-- Hide from old browsers

function enter(code1,code2,code3,code4,code5,code6,code7,code8,code9,code10,code11,code12,code13,code14,code15,code16,code17,code18,code19,code20,code21,code22,code23,code24) {

	var oForm = top.opener.document.forms[0];
	if(top.opener.fieldAux1.trim() != "" && oForm[top.opener.fieldAux1]){oForm[top.opener.fieldAux1].value = code1;}
 	if(top.opener.fieldAux2.trim() != "" && oForm[top.opener.fieldAux2]){oForm[top.opener.fieldAux2].value = code2;}
	if(top.opener.fieldAux3.trim() != "" && oForm[top.opener.fieldAux3]){oForm[top.opener.fieldAux3].value = code3;}
	if(top.opener.fieldAux4.trim() != "" && oForm[top.opener.fieldAux4] 
		&& top.opener.fieldAux4 != 'C' && top.opener.fieldAux4 != '4' 
		&& top.opener.fieldAux4 != '5')	{oForm[top.opener.fieldAux4].value = code4;}
  	if(top.opener.fieldAux5.trim() != "" && oForm[top.opener.fieldAux5]){oForm[top.opener.fieldAux5].value = code5;}
	if(top.opener.fieldAux6.trim() != "" && oForm[top.opener.fieldAux6]){oForm[top.opener.fieldAux6].value = code6;}
	if(top.opener.fieldAux7.trim() != "" && oForm[top.opener.fieldAux7]){oForm[top.opener.fieldAux7].value = code7;}
	if(top.opener.fieldAux8.trim() != "" && oForm[top.opener.fieldAux8]){oForm[top.opener.fieldAux8].value = code8;}
	if(top.opener.fieldAux9.trim() != "" && oForm[top.opener.fieldAux9]){oForm[top.opener.fieldAux9].value = code9;}
	if(top.opener.fieldAux10.trim() != "" && oForm[top.opener.fieldAux10]){oForm[top.opener.fieldAux10].value = code10;}
	if(top.opener.fieldAux11.trim() != "" && oForm[top.opener.fieldAux11]){oForm[top.opener.fieldAux11].value = code11;}
	if(top.opener.fieldAux12.trim() != "" && oForm[top.opener.fieldAux12]){oForm[top.opener.fieldAux12].value = code12;}
	if(top.opener.fieldAux13.trim() != "" && oForm[top.opener.fieldAux13]){oForm[top.opener.fieldAux13].value = code13;}
	if(top.opener.fieldAux14.trim() != "" && oForm[top.opener.fieldAux14]){oForm[top.opener.fieldAux14].value = code14;}
	if(top.opener.fieldAux15.trim() != "" && oForm[top.opener.fieldAux15]){oForm[top.opener.fieldAux15].value = code15;}
	if(top.opener.fieldAux16.trim() != "" && oForm[top.opener.fieldAux16]){oForm[top.opener.fieldAux16].value = code16;}
	if(top.opener.fieldAux17.trim() != "" && oForm[top.opener.fieldAux17]){oForm[top.opener.fieldAux17].value = code17;}
	if(top.opener.fieldAux18.trim() != "" && oForm[top.opener.fieldAux18]){oForm[top.opener.fieldAux18].value = code18;}
	if(top.opener.fieldAux19.trim() != "" && oForm[top.opener.fieldAux19]){oForm[top.opener.fieldAux19].value = code19;}
	if(top.opener.fieldAux20.trim() != "" && oForm[top.opener.fieldAux20]){oForm[top.opener.fieldAux20].value = code20;}
	if(top.opener.fieldAux21.trim() != "" && oForm[top.opener.fieldAux21]){oForm[top.opener.fieldAux21].value = code21;}
	if(top.opener.fieldAux22.trim() != "" && oForm[top.opener.fieldAux22]){oForm[top.opener.fieldAux22].value = code22;}
	if(top.opener.fieldAux23.trim() != "" && oForm[top.opener.fieldAux23]){oForm[top.opener.fieldAux23].value = code23;}
	if(top.opener.fieldAux24.trim() != "" && oForm[top.opener.fieldAux24]){oForm[top.opener.fieldAux24].value = code24;}
  
	top.close();
 }


//-->
</script>
</head>

<jsp:useBean id= "EWD0700Help" class= "datapro.eibs.beans.JBList"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<body>
 
 <script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<FORM>
<%
	if ( EWD0700Help.getNoResult() ) {
		String sMsg = "";
		if (userPO.getHeader1().equals("*")) {
			sMsg = "Usuario no tiene permisos para ver este Cliente";
		} else {
			//sMsg = "There is no match for your search criteria";
			sMsg = "No hay datos que correspondan con su criterio de busqueda";
		}	
%>
 		<TABLE class="tbenter" width=100% height=100%>
 		<TR>
      <TD> 
        
      <div align="center"> <b> <%= sMsg %></b> 
      </div>
      </TD></TR>
   		</TABLE>
<%
	}
	else {
%>
 
  <TABLE class="tableinfo" align="center" style="width:'95%'">
    <TR id="trdark"> 
      <TH ALIGN=CENTER  nowrap width="10%">Cliente</TH>
      <TH ALIGN=CENTER  nowrap width="50%">Nombre Corto</TH>
      <TH ALIGN=CENTER  nowrap width="20%">Identificación</TH>
    </TR>
    <%
                String Type = (String)session.getAttribute("Type");
                String NameSearch = (String)session.getAttribute("NameSearch");
                EWD0700Help.initRow();
                while (EWD0700Help.getNextRow()) {
                    if (EWD0700Help.getFlag().equals("")) {
                    		out.println(EWD0700Help.getRecord());
                    }
                }
              %> 
  </TABLE>
  <TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
    <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> <%
        if ( EWD0700Help.getShowPrev() ) {
      			int pos =EWD0700Help.getFirstRec() - 81;
      			   out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0700?NameSearch=" + NameSearch + "&FromRecord=" + pos + "&Type=" + Type + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
        }
%> </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> <%       
        if ( EWD0700Help.getShowNext() ) {
      			int pos = EWD0700Help.getLastRec();
      			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0700?NameSearch=" + NameSearch + "&FromRecord=" + pos + "&Type=" + Type + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");

        }
%> </TD>
	 </TR>
	 </TABLE>
<%      
  }
%> 
</FORM>

</BODY>
</HTML>

