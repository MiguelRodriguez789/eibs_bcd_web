<html>
<head>
<title>Bank Reference</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</head>

<jsp:useBean id= "bankRef" class= "datapro.eibs.beans.ESD000004Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
 
 


<SCRIPT type="text/javascript">

     <% 
   if ( userPO.getOption().equals("CLIENT_P") ) {
   %>
		builtNewMenu(client_personal_opt);
  <%      
   }
   else
   {
   %>
		builtNewMenu(client_corp_opt);
   <%
   }
   %>

</SCRIPT>

<body bgcolor="#FFFFFF">



 <% 
 if ( !error.getERRNUM().equals("0")  ) {
 		error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
  if ( !userPO.getPurpose().equals("NEW") ) {
    out.println("<SCRIPT> initMenu(); </SCRIPT>");
 }
%>

<h3 align="center">Referencias Bancarias 
  <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_both_bank_ref, ESD0080"></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="40">
  

<table class="tableinfo">
  <tr > 
    <td nowrap> 
      <table cellspacing="0" cellpadding="2"  width="100%" class=tbhead  align="center">
        <tr>
            <td nowrap width="10%" align="right"> Cliente: 
               </td>
          <td nowrap width="12%" align="left">
      			<%= userPO.getHeader1()%>
          </td>
            <td nowrap width="6%" align="right">ID:  
            </td>
          <td nowrap width="14%" align="left">
      			<%= userPO.getHeader2()%>
          </td>
            <td nowrap width="8%" align="right"> Nombre: 
               </td>
          <td nowrap width="50%"align="left">
      			<%= userPO.getHeader3()%>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<br>

<div id="dataDiv" align="center" style="height:351; overflow-y:scroll; width:90%; padding-left:50; padding-right:5" class="scbarcolor">
<%
  int bene_amount = 10;
  String name;
  for ( int i=1; i<=bene_amount; i++ ) {
    if ( i == 10 ) {
      name = "A"; 
    }
    else {
      name = i + "";
    }
    
    out.println("<table class=\"tbenter\" border=\"0\" width=\"100%\">");
    out.println("<tr>");
    
    switch ( i ) {
        case 1 :     
%> 
 <td align="left"><h4>Primera</h4></td>
<%          
           break;
        case 2 : 
%> 
 <td align="left"><h4>Segunda</h4></td>
<%          
           break;
        case 3 : 
%> 
<td align="left"><h4>Tercera</h4></td>
<%          
           break;
        case 4 : 
%> 
<td align="left"><h4>Cuarta</h4></td>
<%          
           break;
        case 5 : 
%> 
<td align="left"><h4>Quinta</h4></td>
<%          
           break;
        case 6 : 
%> 
<td align="left"><h4>Sexta</h4></td>
<%          
           break;
        case 7 : 
%> 
<td align="left"><h4>S�ptima</h4></td>
<%          
           break;
        case 8 : 
%> 
<td align="left"><h4>Octava</h4></td>
<%          
           break;
        case 9 : 
%> 
<td align="left"><h4>Novena</h4></td>
<%          
           break;
        case 10 : 
%> 
<td align="left"><h4>D�cima</h4></td>
<%          
           break;
     }
  out.println("<td width=\"30%\" align=\"right\">");
  out.println("<h4>");
  out.print("<A href=\"javascript:go(1)\">1</A>,<A href=\"javascript:go(2)\">2</A>,<A href=\"javascript:go(3)\">3</A>,<A href=\"javascript:go(4)\">4</A>,<A href=\"javascript:go(5)\">5</A>,");
  out.print("<A href=\"javascript:go(6)\">6</A>,<A href=\"javascript:go(7)\">7</A>,<A href=\"javascript:go(8)\">8</A>,<A href=\"javascript:go(9)\">9</A>,<A href=\"javascript:go(10)\">10</A>");
   out.println("</h4>"); 
  out.println("</td>");   
  out.println("</tr>");
  out.println("</table>"); 
%>

  <table id="mainTable<%= name %>" class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap > 
        <table cellspacing="0" cellpadding="2"  width="100%" border="0" align="center">
          <tr id="trdark"> 
            <td nowrap width="38%" > 
              <div align="right">Entidad 
                Financiera :</div>
            </td>
            <td nowrap width="62%"> 
              <input type="text" name="E<%= name %>4MA1" maxlength="45" size="46" value="<%= bankRef.getField("E" + name + "4MA1").getString().trim()%>">
            </td>
          </tr>
          <tr id=trclear> 
            <td nowrap width="38%"> 
              <div align="right">Oficial/Contacto 
                :</div>
            </td>
            <td nowrap width="62%"> 
              <input type="text" name="E<%= name %>4MA3" maxlength="35" size="36" value="<%= bankRef.getField("E" + name + "4MA3").getString().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="38%"> 
              <div align="right">N&uacute;mero 
                de Tel&eacute;fono :</div>
            </td>
            <td nowrap width="62%"> 
              <input type="text" name="E<%= name %>4HPN" maxlength="11" size="12" value="<%= bankRef.getField("E" + name + "4HPN").getString().trim()%>">
            </td>
          </tr>
          <tr id=trclear> 
            <td nowrap width="38%"> 
              <div align="right">Tipo y N&uacute;mero de Cuenta :</div>
            </td>
            <td nowrap width="62%"> 
              <input type="text" name="E<%= name %>4MA2" maxlength="35" size="36" value="<%= bankRef.getField("E" + name + "4MA2").getString().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="38%"> 
              <div align="right">Saldo 
                Promedio:</div>
            </td>
            <td nowrap width="62%">
            <SELECT name="E<%=name%>4BSX">
                    <OPTION value="">--Seleccione--</OPTION>
					<OPTION value="3" <%if(bankRef.getField("E" + name + "4BSX").getString().trim().equals("3")){%> selected <%}%> >3 cifras</OPTION>
					<OPTION value="4" <%if(bankRef.getField("E" + name + "4BSX").getString().trim().equals("4")){%> selected <%}%>>4 cifras</OPTION>
					<OPTION value="5" <%if(bankRef.getField("E" + name + "4BSX").getString().trim().equals("5")){%> selected <%}%>>5 cifras</OPTION>
					<OPTION value="6" <%if(bankRef.getField("E" + name + "4BSX").getString().trim().equals("6")){%> selected <%}%>>6 cifras</OPTION>
					<OPTION value="7" <%if(bankRef.getField("E" + name + "4BSX").getString().trim().equals("7")){%> selected <%}%>>7 cifras</OPTION>
					<OPTION value="8" <%if(bankRef.getField("E" + name + "4BSX").getString().trim().equals("8")){%> selected <%}%>>8 cifras</OPTION>
					<OPTION value="9" <%if(bankRef.getField("E" + name + "4BSX").getString().trim().equals("9")){%> selected <%}%>>9 cifras</OPTION>
					<OPTION value="0" <%if(bankRef.getField("E" + name + "4BSX").getString().trim().equals("0")){%> selected <%}%>>10 cifras</OPTION>
					<OPTION value="1" <%if(bankRef.getField("E" + name + "4BSX").getString().trim().equals("1")){%> selected <%}%>>11 cifras</OPTION>
					<OPTION value="2" <%if(bankRef.getField("E" + name + "4BSX").getString().trim().equals("2")){%> selected <%}%>>12 cifras</OPTION>
			</SELECT>
			<SELECT	name="E<%=name%>4BMS">
			        <OPTION value="">--Seleccione--</OPTION>
					<OPTION value="A" <%if(bankRef.getField("E" + name + "4BMS").getString().trim().equals("A")){%> selected <%}%> >Altas</OPTION>
					<OPTION value="M" <%if(bankRef.getField("E" + name + "4BMS").getString().trim().equals("M")){%> selected <%}%> >Medias</OPTION>
					<OPTION value="B" <%if(bankRef.getField("E" + name + "4BMS").getString().trim().equals("B")){%> selected <%}%> >Bajas</OPTION>
				</SELECT></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<%
  }
%>
</div>
<SCRIPT type="text/javascript">
   getElement('dataDiv').style.height=  getElement('mainTable1').offsetTop + getElement("mainTable1").offsetHeight +"";
</SCRIPT>  
  

  <div align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>

</form>
</body>
</html>
