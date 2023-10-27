<%@ page import = "datapro.eibs.master.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>
Lista de Documentos
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "docList" class= "datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"></SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
  function goAction(row) {
     document.forms[0].ROW.value = row;
     document.forms[0].submit();
  }

  
<%
boolean bPending = false;
boolean menu = true;
if ( userPO.getPurpose().equals("INQUIRY"))  {
    	if ( userPO.getOption().equals("RT") ) {
%>
	builtNewMenu(rt_i_opt);
<% 		} else if ( userPO.getOption().equals("SV")) { %>
	builtNewMenu(sv_i_opt);
<% 		} else if (userPO.getOption().equals("CD")) { %>
	builtNewMenu(cd_i_opt);
<% } else if ( userPO.getOption().equals("CL")) { %>
		 builtNewMenu(cl_i_opt);	
<% } else if ( userPO.getOption().equals("LC")) { %>
		 builtNewMenu(lc_i_opt);	
<% 		} else if (userPO.getOption().equals("LN")) { 
   			if ( userPO.getHeader23().equals("G") ||  userPO.getHeader23().equals("V")){
%>
	builtNewMenu(ln_i_1_opt);
<% 			} else { %>
	builtNewMenu(ln_i_2_opt);
<% 			} 
		} else if ( userPO.getOption().equals("CLIENT_P")) {
%>
	builtNewMenu(client_inq_personal_opt);
<%  	} else if ( userPO.getOption().equals("CLIENT_C")) { %>
	builtNewMenu(client_inq_corp_opt);
<% 		} else if ( userPO.getOption().equals("CLIENT_SHORT")) {
			if(userPO.getCusType().equals("2")){
%>
		 builtNewMenu("customer_short_i_opt");
<%           } else {%>
		 builtNewMenu("customer_short_corp_i_opt");
<%  		}
		} else if ( userPO.getOption().equals("LC")) { %>
	builtNewMenu(lc_i_opt);
<% 		} else if ( userPO.getOption().equals("DV")) { %>
	builtNewMenu(coll_i_opt);
<%  	} else if ( userPO.getOption().equals("CO")) { %>
	builtNewMenu(colla_i_opt);
<%  	} else if ( userPO.getOption().equals("CR")) { %>
	builtNewMenu(cer_i_opt);
<% 		} else if ( userPO.getOption().equals("ENTITY")) { %>
	builtNewMenu("ent_i_opt");  
<%
   		} else {
   			menu = false;
   		}
} else {
     	if ( userPO.getOption().equals("RT")) {
%>
	builtNewMenu(rt_a_opt);
 <%  	} else if ( userPO.getOption().equals("SV")) { %>
	builtNewMenu(sv_a_opt);
<%  	} else if (userPO.getOption().equals("CD")) { %>
	builtNewMenu(cd_a_opt);
<%  	} else if (userPO.getOption().equals("LN")) { %>
	builtNewMenu(ln_a_opt);
<%      } else if (userPO.getOption().equals("PV")) { %>
	 builtNewMenu(pv_a_opt);
<%  	} else if (userPO.getOption().equals("CO")) { %>
	builtNewMenu(colla_a_opt);
<% } else if ( userPO.getOption().equals("CL")) { %>
		 builtNewMenu(cl_a_opt);
<%      } else if ( userPO.getOption().equals("CLIENT_P")) { %>
	builtNewMenu(client_ap_personal_opt);
<% 		} else if ( userPO.getOption().equals("CLIENT_C")) { %>
	builtNewMenu(client_ap_corp_opt);
<% 		} else if ( userPO.getOption().equals("ENTITY")) { %>
	builtNewMenu("ent_a_opt");  
<%		} else {
			menu = false;
		}
}
%>

function GetInfo(text) {
	if (text.length == 0) text = "SIN COMENTARIOS";
	var pg = "${pageContext.request.contextPath}/pages/s/EDI0010_message_text.jsp?text=" + text;
	CenterNamedWindow(pg, 'Information', 500, 430, 3);           
}
</SCRIPT>

</HEAD>

<BODY>

<% if (menu) { %>
<SCRIPT type="text/javascript">  initMenu(); </SCRIPT>
<% } %>

<h3 align="center">Documentos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="doc_inq_list.jsp, EDI0010"></h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDI0010" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
<INPUT TYPE=HIDDEN NAME="ROW" VALUE="0">

<%
if ( docList.getNoResult() ) {
%>
  
  <TABLE class="tbenter" width=100% height=100%>
    <TR>
      <TD> 
        <div align="center">
          <font size="3"><b>
        	No hay resultados que correspondan a su criterio de búsqueda 
          </b></font>
        </div>
      </TD>
    </TR>
  </TABLE>

<%   		
} else {
%>

<% 
      	String action = "";
	try {
		action = userPO.getHeader20();
		userPO.setHeader20("");
       }
       catch (Exception e) {
       	action = "";
       }
       String pagename = "";
       try {
       	pagename = userPO.getHeader21();
       	userPO.setHeader21("");
       }
       catch (Exception e) {
       	pagename = "";
       }
               
       if ( action.equals("DO_INQ") ) {
              if ( !pagename.equals("") ) {
%>
       			<SCRIPT type="text/javascript">	
					CenterWindow('<%= pagename %>',620,500,2);
              	</SCRIPT>

<%
              }
	}
%> 

  <TABLE class="tbenter">
    <TR>
      <TD ALIGN=CENTER width="15%">
		Tabla : 
      </TD>
      <TD ALIGN=LEFT width="5%">
		<%= userPO.getHeader18() %>
      </TD>
      <TD ALIGN=CENTER width="20%">
		Descripción : 
      </TD>
      <TD ALIGN=LEFT width="40%">
		<%= userPO.getHeader19() %>
      </TD>
      <TD ALIGN="left" nowrap="nowrap" width="40%" colspan="2">
		<span id="labelPending" style="color:red;font-size:13;font-weight:bold;text-align:right; display: none;">
		<label>Pendiente de Aprobación</label>
		</span>
      </TD>
    </TR>
  </TABLE>

  <TABLE class="tableinfo">
    <TR id="trdark"> 
      <TH ALIGN=CENTER>Secuencia:<%=userPO.getOption() %></TH>
      <TH ALIGN=CENTER>Descripción</TH>
      <TH ALIGN=CENTER>Frecuencia</TH>
      <TH ALIGN=CENTER>Status</TH>
      <TH ALIGN=CENTER>Fecha</TH>
      <TH ALIGN=CENTER>Comentarios</TH>
    </TR>
  <%
                int row;
		          try{row = Integer.parseInt(request.getParameter("ROW"));}catch(Exception e){row = 0;}
                docList.initRow();
                while (docList.getNextRow()) {
                		String style = docList.getFlag().equals("M") ? "class=\"CHANGED\"" : "";
                		bPending = !bPending ? docList.getFlag().equals("M") : bPending;
					     if (!docList.getRecord(8).equals("0")) {
  %>

    <TR id="trclear"> 
      <TD NOWRAP ALIGN=CENTER><A HREF="javascript:goAction(<%= docList.getCurrentRow() %>)"><span <%= style %>><%= docList.getRecord(2) %></span></A></TD>
      <TD NOWRAP ALIGN=CENTER><A HREF="javascript:goAction(<%= docList.getCurrentRow() %>)"><span <%= style %>><%= docList.getRecord(3) %></span></A></TD>
      <TD NOWRAP ALIGN=CENTER><A HREF="javascript:goAction(<%= docList.getCurrentRow() %>)"><span <%= style %>>
        <% if (docList.getRecord(4).equals("M")) out.print("MENSUAL");
           else if (docList.getRecord(4).equals("B")) out.print("BIMENSUAL"); 
           else if (docList.getRecord(4).equals("Q")) out.print("CUATRIMESTRAL");
           else if (docList.getRecord(4).equals("S")) out.print("SEMESTRAL"); 
           else if (docList.getRecord(4).equals("X")) out.print("SIN VENCIMIENTO");
           else if (docList.getRecord(4).equals("1")) out.print("CADA UN AÑO");
           else if (docList.getRecord(4).equals("2")) out.print("CADA DOS AÑOS");
           else if (docList.getRecord(4).equals("3")) out.print("CADA TRES AÑOS");        
           else if (docList.getRecord(4).equals("4")) out.print("CADA CUATRO AÑOS");
           else if (docList.getRecord(4).equals("5")) out.print("CADA CINCO AÑOS");
		   else out.print(""); %></span>
	  </A>	
      </TD>
      <TD NOWRAP ALIGN=CENTER><A HREF="javascript:goAction(<%= docList.getCurrentRow() %>)"><span <%= style %>>
        <% if (docList.getRecord(5).equals("CO")) out.print("ESCANEADO");
           else if (docList.getRecord(5).equals("NP")) out.print("NO PRESENTADO");
           else if (docList.getRecord(5).equals("PR")) out.print("PRESENTADO");
           else if (docList.getRecord(5).equals("")) out.print("INCOMPLETO");
           else if (docList.getRecord(5).equals("PD")) out.print("VENCIDO");
           else if (docList.getRecord(5).equals("NA")) out.print("NO APLICABLE");
		   else out.print(""); %></span>
	  </A>
      </TD>
	<TD NOWRAP ALIGN=CENTER>
        <% if (!docList.getRecord(9).equals("0") &&
        		!docList.getRecord(10).equals("0") &&
        			!docList.getRecord(11).equals("0")) { %>
        	<%= Util.formatCustomDate(currUser.getE01DTF(), docList.getRecord(9), docList.getRecord(10), docList.getRecord(11)) %> 
		<% } else {%>
			N/A
		<% } %> 
      </TD>      
      <TD NOWRAP ALIGN=CENTER>
      	<A HREF="javascript:GetInfo('<%= docList.getRecord(12) %>')">
      		<img src="<%=request.getContextPath()%>/images/s/info.gif" title="Mas Información" align="middle" border="0"></A>
      </TD>
    </TR>

  <%
                  }
                  else {
  %>

    <TR id="trclear"> 
      <TD NOWRAP ALIGN=CENTER <%= style %>><%= docList.getRecord(2) %></TD>
      <TD NOWRAP ALIGN=CENTER <%= style %>><%= docList.getRecord(3) %></TD>
      <TD NOWRAP ALIGN=CENTER <%= style %>>
        <% if (docList.getRecord(4).equals("M")) out.print("MENSUAL");
           else if (docList.getRecord(4).equals("B")) out.print("BIMENSUAL"); 
           else if (docList.getRecord(4).equals("Q")) out.print("CUATRIMESTRAL");
           else if (docList.getRecord(4).equals("S")) out.print("SEMESTRAL"); 
           else if (docList.getRecord(4).equals("X")) out.print("SIN VENCIMIENTO");
           else if (docList.getRecord(4).equals("1")) out.print("CADA UN AÑO");
           else if (docList.getRecord(4).equals("2")) out.print("CADA DOS AÑOS");
           else if (docList.getRecord(4).equals("3")) out.print("CADA TRES AÑOS");        
           else if (docList.getRecord(4).equals("4")) out.print("CADA CUATRO AÑOS");
           else if (docList.getRecord(4).equals("5")) out.print("CADA CINCO AÑOS");
		   else out.print(""); %>
      </TD>
      <TD NOWRAP ALIGN=CENTER <%= style %>>
        <% if (docList.getRecord(5).equals("CO")) out.print("ESCANEADO");
           else if (docList.getRecord(5).equals("NP")) out.print("NO PRESENTADO");
           else if (docList.getRecord(5).equals("PR")) out.print("PRESENTADO");
           else if (docList.getRecord(5).equals("")) out.print("INCOMPLETO");
           else if (docList.getRecord(5).equals("PD")) out.print("VENCIDO");
           else if (docList.getRecord(5).equals("NA")) out.print("NO APLICABLE");
		   else out.print(""); %>	
      </TD>
      <TD NOWRAP ALIGN=CENTER>
        <% if (!docList.getRecord(9).equals("0") &&
        		!docList.getRecord(10).equals("0") &&
        			!docList.getRecord(11).equals("0")) { %>
        	<%= Util.formatCustomDate(currUser.getE01DTF(), docList.getRecord(9), docList.getRecord(10), docList.getRecord(11)) %> 
		<% } else {%>
			N/A
		<% } %> 
      </TD>      
      <TD NOWRAP ALIGN=CENTER>
      	<A HREF="javascript:GetInfo('<%= docList.getRecord(12) %>')">
      		<img src="<%=request.getContextPath()%>/images/s/info.gif" title="Mas Información" align="middle" border="0"></A>
      </TD>
    </TR>

  <%
                  }
                }
  %> 
  </TABLE>

<%
}
%>

</FORM>
<script type="text/javascript">
window.onload = function(){
	if(<%=""+bPending %>){
		document.getElementById('labelPending').style.display = 'inline';
	}
}
</script>
</BODY>
</HTML>

