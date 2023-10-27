<HTML>
<HEAD>
<TITLE>
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "clList" class= "datapro.eibs.beans.JBList"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

  function goAction(op) {
     document.forms[0].opt.value = op;
     var formLength= document.forms[0].elements.length;
     var ok = false;
     var cus = ' ';
     
     for(n=0;n<formLength;n++)
     {
      	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "CUS_LINE" && document.forms[0].elements[n].checked) 
      	{
            	cus = document.forms[0].elements[n].value;
        		ok = true;
        		break;
      	}
      }
	  if ( ok ) {
		if (document.forms[0].type.value == "FGAR" && (op =='2')){
			getInquiry(document.forms[0].cus.value,document.forms[0].line.value);
		}else{
    	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.credit.JSELN0110?SCREEN=2";
    	params = "&opt="+op+"&CUS_LINE="+cus;
  		CenterWindow(page+params,550,450,2);
		}
     }
     else {
			alert("Seleccione un cliente antes de realizar esta operación");	   
     }

  }
  function getParams(cus,line,type) {
     document.forms[0].cus.value = cus;
     document.forms[0].line.value = line;
     document.forms[0].type.value = type;
}

function getInquiry(cun,line) {
	var page = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0103?&OPECOD=0015&cun="+cun+"&line="+line;
	CenterNamedWindow(page,'Information',1200,500,2);
}

builtNewMenu(ecif10_i_opt);  
 
  
</script>

</head>

<BODY>

<SCRIPT> initMenu(); </SCRIPT>


<h3 align="center">Consulta de Lineas de Cr&eacute;dito<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cl_list_by_customer.jsp,ELN0110"></h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.credit.JSELN0110" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
<INPUT TYPE=HIDDEN NAME="opt" VALUE="1">
<INPUT TYPE=HIDDEN NAME="cus" VALUE="">
<INPUT TYPE=HIDDEN NAME="line" VALUE="">
<INPUT TYPE=HIDDEN NAME="type" VALUE="">

<%
	if ( clList.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
        <div align="center">
        		<font size="3"><b>
        				No hay resultados que correspondan a su criterio de búsqueda 
        		</b></font>
        	</div>
      </TD></TR>
   		</TABLE>
<%   		
	}
	else {
%>
  <table class="tableinfo">
    <tr > 
      <td nowrap>
        
      <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
        <tr id="trdark"> 
          <TD ALIGN=RIGHT WIDTH=20%> Cliente : </TD>
          <TD ALIGN=LEFT WIDTH=10%><%= userPO.getCusNum() %> </TD>
          <TD ALIGN=LEFT WIDTH=70%><%= userPO.getCusName() %> </TD>
        </TR>
      </TABLE>
	  </TD>
    </TR>
  </TABLE>
<h4></h4>
  
  <TABLE class="tbenter">
    <TR>
      <TD class=TDBKG> 
        <div align="center"><a href="javascript:goAction(1)"><b>Consulta</b></a></div>
      </TD>
      <TD class=TDBKG> 
        <div align="center"><a href="javascript:goAction(2)"><b>Actividad</b></a></div>
      </TD>
      <TD class=TDBKG> 
        <div align="center"><a href="javascript:goAction(3)"><b>Garantías</b></a></div>
      </TD>
      <TD class=TDBKG> 
        <div align="center"><a href="javascript:goAction(4)"><b>Relaciones</b></a></div>
      </TD>
      <TD class=TDBKG> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </TD>
    </TR>
  </TABLE>
        
  
<TABLE class="tableinfo">
  <TR> 
    <TH ALIGN=CENTER></TH>
    <TH ALIGN=CENTER rowspan="2">Número</TH>
    <TH ALIGN=CENTER rowspan="2">Tipo</TH>
    <TH ALIGN=CENTER rowspan="2">Fecha de<br>
      Vencimiento</TH>
    <TH ALIGN=CENTER rowspan="2">MDA</TH>
    <TH ALIGN=CENTER colspan="3">Importe</TH>
    <TH ALIGN=CENTER rowspan="2">Garant&iacute;as <br>
      en Custodio</TH>
  </TR>
  <TR> 
    <TH ALIGN=CENTER></TH>
    <TH ALIGN=CENTER>Aprobado</TH>
    <TH ALIGN=CENTER>Disponible</TH>
    <TH ALIGN=CENTER>Garant&iacute;as</TH>
  </TR>
  <%
                clList.initRow();
                while (clList.getNextRow()) {
                    if (clList.getFlag().equals("")) {
                    		out.println(clList.getRecord());
                    }
                }
    %> 
</TABLE>
 <BR>
  
 <TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
 <TR>
 <TD WIDTH="50%" ALIGN=LEFT>

<%
        if ( clList.getShowPrev() ) {
      			int pos = clList.getFirstRec() - 51;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.credit.JSELN0110?SCREEN=1&Pos=" + pos + "\"><img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
        }
 %> 
	</TD>
 	<TD WIDTH="50%" ALIGN=RIGHT>
 <%      
        if ( clList.getShowNext() ) {
      			int pos = clList.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.credit.JSELN0110?SCREEN=1&Pos=" + pos + "\"><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
        }
 %>
 	</TD>
 	</TR>
 	</TABLE>
  
  <%       
  		}
  %>

</FORM>
<SCRIPT type="text/javascript">
	showChecked("CUS_LINE");  
</SCRIPT>

</BODY>
</HTML>
