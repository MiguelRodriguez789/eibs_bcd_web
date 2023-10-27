<html>
<head>
<title>Activos del Cliente</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id= "assets" class= "datapro.eibs.beans.ESD000004Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />


<SCRIPT type="text/javascript">

  <% 
   if ( userPO.getOption().equals("CLIENT_P") ) {
   %>
		builtNewMenu(client_inq_personal_opt);
  <%      
   }
   else
   {
   %>
   builtNewMenu(client_inq_corp_opt);
 
    <%
   }
   %>
   

</SCRIPT>

</head>

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
<h3 align="center">Activos del Cliente <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_corp_assets, ESD0080"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080">
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="18">

   
<table class="tableinfo">
  <tr > 
    <td> 
      <table cellspacing="0" cellpadding="2" width="100%" class="tbhead"   align="center">
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
 <td align="left"><h4>Primero</h4></td>
<%          
           break;
        case 2 : 
%> 
 <td align="left"><h4>Segundo</h4></td>
<%          
           break;
        case 3 : 
%> 
<td align="left"><h4>Tercero</h4></td>
<%          
           break;
        case 4 : 
%> 
<td align="left"><h4>Cuarto</h4></td>
<%          
           break;
        case 5 : 
%> 
<td align="left"><h4>Quinto</h4></td>
<%          
           break;
        case 6 : 
%> 
<td align="left"><h4>Sexto</h4></td>
<%          
           break;
        case 7 : 
%> 
<td align="left"><h4>S�ptimo</h4></td>
<%          
           break;
        case 8 : 
%> 
<td align="left"><h4>Octavo</h4></td>
<%          
           break;
        case 9 : 
%> 
<td align="left"><h4>Noveno</h4></td>
<%          
           break;
        case 10 : 
%> 
<td align="left"><h4>D�cimo</h4></td>
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
    <tr bgcolor="#FFFFFF" bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" name="TB_BENEFICIARY_CORP" bgcolor="#FFFFFF" bordercolor="#FFFFFF" bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF"  align="center">
          <tr id="trdark"> 
            <td nowrap width="34%" > 
              <div align="right">Descripcion :</div>
            </td>
            <td nowrap width="66%" > 
              <input type="text" readonly name="E<%= name %>4MA1" maxlength="45" size="50" value="<%= assets.getField("E" + name + "4MA1").getString().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%"> 
              <div align="right">Direcci&oacute;n :</div>
            </td>
            <td nowrap width="66%"> 
              <input type="text" readonly name="E<%= name %>4MA2" maxlength="45" size="50" value="<%= assets.getField("E" + name + "4MA2").getString().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="34%"> 
              <div align="right"> </div>
            </td>
            <td nowrap width="66%" > 
              <input type="text" readonly name="E<%= name %>4MA3" maxlength="45" size="50" value="<%= assets.getField("E" + name + "4MA3").getString().trim()%>">
            </td>
          </tr>

		 <%if(currUser.getE01INT().equals("18")){%> 
          <tr id="trclear"> 
            <td nowrap width="34%" > 
              <div align="right">C�digo de Ciudad :</div>
            </td>
            <td nowrap width="66%">
              <input type="text" readonly name="E<%= name %>4TID" maxlength="5" size="5" value="<%= assets.getField("E" + name + "4TID").getString().trim()%>">
              
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="34%"> 
              <div align="right">Comuna :</div>
            </td>
            <td nowrap width="66%">
              <input type="text" readonly name="E<%= name %>4PID" maxlength="5" size="5" value="<%= assets.getField("E" + name + "4PID").getString().trim()%>">
 
            </td>
          </tr>
		  <%} else {%>

          <tr id="trdark"> 
            <td nowrap width="34%"> 
              <div align="right">Ciudad :</div>
            </td>
            <td nowrap width="66%"> 
              <input type="text" readonly name="E<%= name %>4CTY" maxlength="30" size="35" value="<%= assets.getField("E" + name + "4CTY").getString().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%"> 
              <div align="right">Estado :</div>
            </td>
            <td nowrap width="66%" > 
              <input type="text" readonly name="E<%= name %>4STE" maxlength="4" size="5" value="<%= assets.getField("E" + name + "4STE").getString().trim()%>">
            </td>
          </tr>
		  <%}%>
          <tr id="trclear"> 
            <td nowrap width="34%" > 
              <div align="right">Pa&iacute;s :</div>
            </td>
            <td nowrap width="66%" >
              <input type="text" readonly name="E<%= name %>4CTR" maxlength="30" size="35" value="<%= assets.getField("E" + name + "4CTR").getString().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="34%" > 
              <div align="right">Apartado Postal :</div>
            </td>
            <td nowrap width="66%">
              <input type="text" readonly name="E<%= name %>4ZPC" maxlength="15" size="16" value="<%= assets.getField("E" + name + "4ZPC").getString().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%"> 
              <div align="right">Tel&eacute;fono :</div>
            </td>
            <td nowrap width="66%">
              <input type="text" readonly name="E<%= name %>4HPN" maxlength="15" size="16" value="<%= assets.getField("E" + name + "4HPN").getString().trim()%>">
            </td>
          </tr>

          
          <tr id="trdark"> 
            <td nowrap width="34%"> 
              <div align="right">Valor Compra :</div>
            </td>
            <td nowrap width="66%">
              <input type="text" readonly name="E<%= name %>4AM1" maxlength="15" size="16" value="<%= assets.getField("E" + name + "4AM1").getString().trim()%>" class="txtright">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%"> 
              <div align="right">Valor Actual :</div>
            </td>
            <td nowrap width="66%" >
              <input type="text" readonly name="E<%= name %>4AM2" maxlength="15" size="16" value="<%= assets.getField("E" + name + "4AM2").getString().trim()%>" class="txtright">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="34%">
              <div align="right">Fecha Compra :</div>
            </td>
            <td nowrap width="66%" >
              <div align="left">
                <input type="text" readonly name="E<%= name %>4DT1" size="3" maxlength="2" value="<%= assets.getField("E" + name + "4DT1").getString().trim()%>" class="txtright">
                <input type="text" readonly name="E<%= name %>4DT2" size="3" maxlength="2" value="<%= assets.getField("E" + name + "4DT2").getString().trim()%>" class="txtright">
                <input type="text" readonly name="E<%= name %>4DT3" size="5" maxlength="4" value="<%= assets.getField("E" + name + "4DT3").getString().trim()%>" class="txtright">
              </div>
            </td>
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
 
</form>
</body>
</html>
