<html>
<head> 
<title>Reasignacion Stock de Sucursales</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import ="datapro.eibs.master.Util" %>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT Language="Javascript">
            showErrors();
     </SCRIPT>
 <%
 }

   int row = 0;
   try { row = Integer.parseInt(request.getParameter("ROW"));} catch (Exception e) {}
   appList.setCurrentRow(row);
   datapro.eibs.beans.EVL002004Message msgMT = (datapro.eibs.beans.EVL002004Message) appList.getRecord();
   
%>

<script type="text/javascript">

function goAction(){
	document.forms[0].action = "<%=request.getContextPath()%>/servlet/datapro.eibs.valuepaper.JSEVL0020?SCREEN=6000";
	document.forms[0].submit();	
}

</script>

</head>
<body>

<H3 align="center">Reasignacion Saldos de Oficina<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="value_paper_bal_update_detail_reasigna,EVL0020"></H3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.valuepaper.JSEVL0020">
  
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="6000">
  <INPUT TYPE=HIDDEN NAME="ROW" VALUE="<%= row%>">
  <table class="tableinfo">
   <tr> 
   <td>
    <table cellspacing=0 cellpadding=2 width="100%" border="0">    
     	<tr id=trdark> 
	      <td nowrap> 
	        <div align="right">Banco/Oficina : </div>
	      </td>
	      <td nowrap>
	      	<input type="text" name="E04BALBNK" size="3" maxlength="2" readonly value="<%= msgMT.getE04BALBNK() %>"><b>-</b> 
	        <input type="text" name="E04BALBRN" size="5" maxlength="4" readonly value="<%= msgMT.getE04BALBRN() %>">
	      </td>
     	</tr>
     	<tr id=trclear> 
		  <td>  
		     <div align="right">Tipo Papel : </div>        
		  </td>
      	  <td nowrap> 
      	    <input type="text" name="E04BALTIP" size="5" maxlength="4" readonly value="<%= msgMT.getE04BALTIP() %>">
      	    <input type="text" name="E04BALTIN" size="35" maxlength="35" readonly value="<%= msgMT.getE04BALTIN() %>">
      	  </td>     
      	</tr>
      	<tr id=trdark>
          <td nowrap>
              <div align="right">Subtipo Papel : </div>
          </td>
          <td nowrap>
              <input type="text" name="E04BALSUB" size="5" maxlength="4" readonly value="<%= msgMT.getE04BALSUB() %>">
              <input type="text" name="E04BALSUN" size="35" maxlength="35" readonly value="<%= msgMT.getE04BALSUN() %>"> 
          </td>
        </tr>
        <tr id=trclear> 
		  <td> 
		     <div align="right">Serial : </div>        
		  </td>
      	  <td nowrap> 
      	    <input type="text" name="E04BALSER" size="12" maxlength="10" readonly value="<%= msgMT.getE04BALSER() %>">
      	  </td>     
      	</tr>
     	<tr id=trdark>
          <td nowrap>
             <div align="right">Cantidad Disponible : </div>
          </td>
          <td nowrap>
             <input type="text" name="E04BALBAL" value ="<%= msgMT.getE04BALBAL() %>" readonly>             
          </td>
        </tr>
      	<tr id=trclear>
          <td nowrap>
             <div align="right">Numero Inicial Disponible : </div>
          </td>
          <td nowrap>
             <input type="text" name="E04BALINI" value ="<%= msgMT.getE04BALINI() %>" readonly>             
          </td>
        </tr>
        <tr id=trdark>
          <td nowrap>
             <div align="right">Numero Final Disponible : </div>
          </td>
          <td nowrap>
             <input type="text" name="E04BALFIN" value ="<%= msgMT.getE04BALFIN() %>" readonly>             
          </td>
        </tr>
        <tr id=trclear>
          <td nowrap>
             <div align="right">Sucursal que recibe : </div>
          </td>
          <td nowrap>
             <input type="text" name="E04BALNBR" size="06" maxlength="04" value ="<%= msgMT.getE04BALNBR() %>" onkeypress="enterInteger(event)">
       	 		<a href="javascript:GetBranch('E04BALNBR','<%= msgMT.getE04BALBNK() %>',document.forms[0].E04BALNBR.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a> 
                <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20">             
          </td>
        </tr>
        <tr id=trdark>
          <td nowrap>
             <div align="right">Cantidad a Reasignar : </div>
          </td>
          <td nowrap>
             <input type="text" name="E04BALAQT" size="13" maxlength="13" value ="<%= msgMT.getE04BALAQT() %>" onkeypress="enterInteger(event);">
             <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20">             
          </td>
        </tr>
        <tr id=trclear>
          <td nowrap>
             <div align="right">Numero Inicial a Reasignar : </div>
          </td>
          <td nowrap>
          	 <input type="text" name="E04BALAIN" value ="<%= msgMT.getE04BALAIN() %>"  onkeypress="enterInteger(event);">
             <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20">             
          </td>
        </tr>
        <tr id=trdark>
          <td nowrap>
             <div align="right">Numero Final a Reasignar : </div>
          </td>
          <td nowrap>
             <input type="text" name="E04BALAFI" value ="<%= msgMT.getE04BALAFI() %>"  onkeypress="enterInteger(event);">
             <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20">             
          </td>
        </tr>
        <tr id=trclear>
          <td nowrap>
             <div align="right">Motivo de Actualizacion : </div>
          </td>
          <td nowrap>
      	    <input type="text" name="E04BALMOT" size="5" maxlength="4" value="<%= msgMT.getE04BALMOT() %>">
      	   <input type="text" name="E04BALMON" size="35" maxlength="35" value="<%= msgMT.getE04BALMON() %>" readonly>
      	    <a href="javascript:GetCodeDescCNOFC('E04BALMOT','E04BALMON','YD')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a>
      	    <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"> 
      	    <input type="HIDDEN" name="E04BALLOT" size="11" maxlength="9" value="<%= msgMT.getE04BALLOT() %>">
          </td>
        </tr>
     </table>
    </td>
   </tr>
  </table>
  
  <p align="center"> 
    <input id="EIBSBTN" type="submit" name="Submit" value="Actualizar" onclick="goAction()">
  </p>
  
</form>
</body>
</html>
