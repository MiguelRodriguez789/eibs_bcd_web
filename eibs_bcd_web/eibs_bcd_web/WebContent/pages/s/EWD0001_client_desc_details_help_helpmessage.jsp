<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>

<%@ page import="datapro.eibs.master.Util"%>
<jsp:useBean id="ewd0001Help" class="datapro.eibs.beans.JBList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos"	scope="session" />

<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript">

function enter(code1,code2,code3,code4,code5,code6,code7,code8,code9,code10,code11,code12,code13,code14,code15,code16,code17,code18) {

	var oForm = top.opener.document.forms[0];

  	if (isValidObject(oForm[top.opener.fieldAux1])) { 
  		oForm[top.opener.fieldAux1].value = code1; 
  		triggerOnchangeOpener(top.opener.fieldAux1);
  	}
  	if (isValidObject(oForm[top.opener.fieldAux2]))	oForm[top.opener.fieldAux2].value = code2; 
  	if (isValidObject(oForm[top.opener.fieldAux3])) oForm[top.opener.fieldAux3].value = code3; 
  	if (isValidObject(oForm[top.opener.fieldAux4])) {
  		if( top.opener.fieldAux4 != 'C' && top.opener.fieldAux4 != '4' && top.opener.fieldAux4 != '5') { 
  			oForm[top.opener.fieldAux4].value = code4; 
  		}
  	} 
  	if (isValidObject(oForm[top.opener.fieldAux5])) oForm[top.opener.fieldAux5].value = code5; 
  	if (isValidObject(oForm[top.opener.fieldAux6])) oForm[top.opener.fieldAux6].value = code6; 
  	if (isValidObject(oForm[top.opener.fieldAux7])){
  		if(oForm[top.opener.fieldAux7].value.lenght > 20) { 
  			oForm[top.opener.fieldAux7].value = code7.substr(16,5); 
  		}
  	}
  	if (isValidObject(oForm[top.opener.fieldAux8])) oForm[top.opener.fieldAux8].value = code8; 
  	if (isValidObject(oForm[top.opener.fieldAux9])) oForm[top.opener.fieldAux9].value = code9; 
  	if (isValidObject(oForm[top.opener.fieldAux10])) oForm[top.opener.fieldAux10].value = code10; 
  	if (isValidObject(oForm[top.opener.fieldAux11])) oForm[top.opener.fieldAux11].value = code11; 
  	if (isValidObject(oForm[top.opener.fieldAux12])) oForm[top.opener.fieldAux12].value = code12; 
  	if (isValidObject(oForm[top.opener.fieldAux13])) oForm[top.opener.fieldAux13].value = code13; 
  	if (isValidObject(oForm[top.opener.fieldAux14])) oForm[top.opener.fieldAux14].value = code14; 
  	if (isValidObject(oForm[top.opener.fieldAux15])) oForm[top.opener.fieldAux15].value = code15; 
  	if (isValidObject(oForm[top.opener.fieldAux16])) oForm[top.opener.fieldAux16].value = code16; 
  	if (isValidObject(oForm[top.opener.fieldAux17])) oForm[top.opener.fieldAux17].value = code17; 
  	if (isValidObject(oForm[top.opener.fieldAux18])) oForm[top.opener.fieldAux18].value = code18; 
  	if (isValidObject(oForm[top.opener.fieldAux19])){
  		if(isValidObject(code7.value.lenght > 35)) { 
  				oForm[top.opener.fieldAux19].value = code7.substr(21,15); 
  		}
  	}
  		
  	top.close();
}


</script>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<body>


<FORM>
<%
	if ( ewd0001Help.getNoResult() ) {
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

		<div align="center"><b> <%= sMsg %></b></div>
		</TD>
	</TR>
</TABLE>
<%
	}
	else {
%>

<TABLE class="tableinfo" align="center" style="width: '95%'">
	<TR id="trdark">
		<TH ALIGN=CENTER nowrap width="10%">Cliente</TH>
		<TH ALIGN=CENTER nowrap width="50%">Nombre Corto</TH>
		<TH ALIGN=CENTER nowrap width="20%">Identificación</TH>
	</TR>
	<%
                String Type = (String)request.getAttribute("Type");
                String NameSearch = (String)request.getAttribute("NameSearch");
                ewd0001Help.initRow();
                while (ewd0001Help.getNextRow()) {
                    if (ewd0001Help.getFlag().equals("")) {
                    		out.println(ewd0001Help.getRecord());
                    }
                }
              %>
</TABLE>
<TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
	<TR>
		<TD WIDTH="50%" ALIGN=LEFT height="25">
		<%
        if ( ewd0001Help.getShowPrev() ) {
      			int pos =ewd0001Help.getFirstRec() - 21;
      			   out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0001D?NameSearch=" + NameSearch + "&FromRecord=" + pos + "&Type=" + Type + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
        }
%>
		</TD>
		<TD WIDTH="50%" ALIGN=RIGHT height="25">
		<%       
        if ( ewd0001Help.getShowNext() ) {
      			int pos = ewd0001Help.getLastRec();
      			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0001D?NameSearch=" + NameSearch + "&FromRecord=" + pos + "&Type=" + Type + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");

        }
%>
		</TD>
	</TR>
</TABLE>
<%      
  }
%>
</FORM>

</BODY>
</HTML>

