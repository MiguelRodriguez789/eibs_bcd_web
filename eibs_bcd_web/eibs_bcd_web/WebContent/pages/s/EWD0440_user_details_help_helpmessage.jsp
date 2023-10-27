<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>

<%@ page import = "datapro.eibs.master.Util" %>
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script language="javascript">
//<!-- Hide from old browsers
//fieldAux1 = cus -- NUMERO CLIENTE				
//fieldAux2 = nme -- NOMBRE						
//fieldAux3 = idn -- IDENTIFICACION				
//fieldAux4 = idt -- TIPO IDENTIFICACION			
//fieldAux5 = dti -- DESCRIPCION TIPO IDENTIFICACION	
//fieldAux6 = cpa -- PAIS								
//fieldAux7 = dpa -- DESCRIPCION PAIS
//fieldAux8 = bth -- NUMERO LOTE USUARIO					

function enter(code1,code2,code3,code4, code5, code6, code7, code8) {

	var oForm = top.opener.document.forms[0];
	
	if(top.opener.fieldAux1 != "" && oForm[top.opener.fieldAux1]){
	   oForm[top.opener.fieldAux1].value = code1;
	}
 	if(top.opener.fieldAux2 != "" && oForm[top.opener.fieldAux2]){
 		oForm[top.opener.fieldAux2].value = code2;
 	}
	if(top.opener.fieldAux3 != "" && oForm[top.opener.fieldAux3]){
		oForm[top.opener.fieldAux3].value = code3;
	}	
	if(top.opener.fieldAux4 != "" && oForm[top.opener.fieldAux4]){
  		if (code4 != "") {
    		oForm[top.opener.fieldAux4].value = code4;
  			}
	}
	if(top.opener.fieldAux5 != "" && oForm[top.opener.fieldAux5]){
		if (code5 != "") {
			oForm[top.opener.fieldAux5].value = code5;
		}
	}
	if(top.opener.fieldAux6 != "" && oForm[top.opener.fieldAux6]){
		if (code6 != "") {
			oForm[top.opener.fieldAux6].value = code6;
		}
	}
	if(top.opener.fieldAux7 != "" && oForm[top.opener.fieldAux7]){
		if (code7 != "") {
			oForm[top.opener.fieldAux7].value = code7;
		}
	}
	if(top.opener.fieldAux8 != "" && oForm[top.opener.fieldAux8]){
		if (code8 != "") {
			oForm[top.opener.fieldAux8].value = code8;
		}
	}

	top.close();
 }


//-->
</script>
</head>

<jsp:useBean id= "EWD0440Help" class= "datapro.eibs.beans.JBList"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<body>
 
 <script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<FORM>
<%
	if ( EWD0440Help.getNoResult() ) {
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
      <TH ALIGN=CENTER  nowrap width="10%">Usuario</TH>
      <TH ALIGN=CENTER  nowrap width="35%">Nombre</TH>
      <TH ALIGN=CENTER  nowrap width="25%">Tipo Identificacion</TH>
      <TH ALIGN=CENTER  nowrap width="15%">Identificación</TH>
      <TH ALIGN=CENTER  nowrap width="15%">Pais</TH>
    </TR>
    <%
                String Type = (String)session.getAttribute("Type");
                String NameSearch = (String)session.getAttribute("NameSearch");
                EWD0440Help.initRow();
                while (EWD0440Help.getNextRow()) {
                    if (EWD0440Help.getFlag().equals("")) {
                    		out.println(EWD0440Help.getRecord());
                    }
                }
              %> 
  </TABLE>
  <TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
    <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> <%
        if ( EWD0440Help.getShowPrev() ) {
      			int pos =EWD0440Help.getFirstRec() - 81;
      			   out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0440?NameSearch=" + NameSearch + "&FromRecord=" + pos + "&Type=" + Type + "\" > <img src=\""+request.getContextPath()+"/images/s/Regresar.gif\" border=0></A>");
        }
%> </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> <%       
        if ( EWD0440Help.getShowNext() ) {
      			int pos = EWD0440Help.getLastRec();
      			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0440?NameSearch=" + NameSearch + "&FromRecord=" + pos + "&Type=" + Type + "\" ><img src=\""+request.getContextPath()+"/images/s/Avanzar.gif\" border=0></A>");

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

