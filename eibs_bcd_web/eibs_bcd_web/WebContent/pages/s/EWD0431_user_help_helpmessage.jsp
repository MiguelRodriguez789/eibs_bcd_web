<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="../style.css" rel="stylesheet">

<script type="text/javascript">

 function buscar(){
   
   getElement("SWDUSR").value=getElement("USR").value;
   document.forms[0].submit();
 }

 function changeLabel(radioObj){
   
   if(!radioObj)
		return;
	var type = radioObj.value;
	if (type=='U'){
	  getElement("searchLabel").innerHTML="Por Usuario :";
	  getElement("SWDTYP").value='U';
	} 
	else{
	  getElement("searchLabel").innerHTML="Por Grupo :";
	  getElement("SWDTYP").value='G';
	}  
	  
 }
 
//<!-- Hide from old browsers
function enter(code1,code2) {
  top.opener.document.forms[0][top.opener.fieldName].value = code1;
  if (top.opener.fieldAux1.trim() != "") {
  	top.opener.document.forms[0][top.opener.fieldAux1].value = code2;
  }
  top.close();
 }

//-->
</script>
<TITLE>Ayuda de Usuario</TITLE>
</head>
<jsp:useBean id= "ewd0431Help" class= "datapro.eibs.beans.JBList"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<body>
 
 <script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>


<FORM action="<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0431?" method="post">
    <input type="hidden" id="SWDUSR" name="SWDUSR" value='<%=request.getAttribute("SWDUSR")!= null? request.getAttribute("SWDUSR"):""%>' />
    <input type="hidden" id="SWDTYP" name="SWDTYP" value='<%=request.getAttribute("SWDTYP")!= null? request.getAttribute("SWDTYP"):"U"%>' />
 
   <table>
     <tr>
       <td colspan="2" align="left">
         <h3 > Busqueda de usuarios </h3>
       </td>
     </tr>
     <tr>
        <td align="right" >
          Tipo de Busqueda :
        </td>
        <td>
          <input type="radio" id="TYP" name="TYP" value="U" checked onclick="changeLabel(this);">Por Usuario 
          <input type="radio" id="TYP" name="TYP" value="G" onclick="changeLabel(this);">Por Grupo 
       </td>
     </tr>
     <tr>  
        <td align="right">
          <span id="searchLabel">Por Usuario : </span>
       </td>
       <td >
          <input type="text" id="USR" name="USR" value="" size="11" maxlength="10" /> 
         
       </td>
    </tr>
    <tr>
      
      <td></td>
      <td colspan="2" align="center">
         <input type="button" name="Buscar" value="Buscar" onclick="buscar();" />
       </td>
    </tr>
    
  </table>
  
<%
	if ( ewd0431Help.getNoResult() ) {
%>
 		<TABLE class="tbenter" width=100% height=100%>
 		<TR>
      <TD> 
        
      <div align="center"><b>No hay criterio de busqueda</b> 
      </div>
      </TD></TR>
   		</TABLE>
<%
	}
	else {
%>
 
  <TABLE class="tableinfo" align="center" style="width:'95%'">
    <TR id="trdark"> 
      <TH ALIGN=CENTER nowrap>Codigo</TH>
      <TH ALIGN=CENTER nowrap>Descripcion</TH>
      <TH ALIGN=CENTER nowrap>Grupo</TH>
    </TR>
    <%
                String usr = (String)session.getAttribute("shrType");
                ewd0431Help.initRow();
                while (ewd0431Help.getNextRow()) {
                    if (ewd0431Help.getFlag().equals("")) {
                    		out.println(ewd0431Help.getRecord());
                    }
                }
              %> 
  </TABLE>
  <TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
    <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> <%
        if ( ewd0431Help.getShowPrev() ) {
      			int pos =ewd0431Help.getFirstRec() - 21;
      			   out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0431?FromRecord=" + pos +  "&USR=" + usr + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
        }
%> </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> <%       
        if ( ewd0431Help.getShowNext() ) {
      			int pos = ewd0431Help.getLastRec();
      			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0431?FromRecord=" + pos +  "&USR=" + usr + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");

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