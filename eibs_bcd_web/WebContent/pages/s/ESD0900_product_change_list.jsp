<%@ page import ="datapro.eibs.master.Util" %>
<html>
<head>
<title>Lista Cuentas para Cambio Producto</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ESD090001Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

function goAction(op) {
	if (op == "3") {
    	ok = confirm("¿Está seguro de que desea eliminar el registro seleccionado?");
		if (ok) 
	    {
	    	document.getElementById("opt").value = op;
	    	document.forms[0].submit();
	    }  
	}
	else {
		document.getElementById("opt").value = op;
		document.forms[0].submit();
	}
}

function getParams(currrow,acd,acc,oldvalue,newvalue,type) {
	document.getElementById("CURRENTROW").value = currrow;
    document.getElementById("ACD").value = acd;
    document.getElementById("ACC").value = acc;
    document.getElementById("OLD").value = oldvalue;
    document.getElementById("NEW").value = newvalue;
    document.getElementById("TYPE").value = type;
}


</SCRIPT>  

</head>

<BODY>
<h3 align="center">Cambio de Producto <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="product_change_list.jsp, ESD0900"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0900" >
  <p> 
    <INPUT TYPE=HIDDEN NAME="CURRENTROW" id="CURRENTROW" VALUE="0"> 
    <input type=HIDDEN name="SCREEN" id="SCtotalRowREEN" value="800">
    <input type=HIDDEN name="totalRow" id="" value="0">
    <input type=HIDDEN name="ACD" id="ACD" value="">
    <input type=HIDDEN name="ACC" id="ACC" value="">
    <input type=HIDDEN name="OLD" id="OLD" value="">
    <input type=HIDDEN name="NEW" id="NEW" value="">
    <input type=HIDDEN name="TYPE" id="TYPE" value="">
    <input type=HIDDEN name="opt" id="opt">
  </p>

  <p> 
  <% if ( ESD090001Help.getNoResult() ) { %>
  </p>

  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>No hay resultados para su b&uacute;squeda</b></p>
          <table class="tbenter" width=100% align=center>
            <tr> 
              <td class=TDBKG width="30%"> 
                <div align="center"><a href="javascript:goAction(0)"><b>Nuevo Cambio<br>Individual en Cuenta</b></a></div>
              </td>
              <td class=TDBKG width="30%"> 
                <div align="center"><a href="javascript:goAction(1)"><b>Nuevo Cambio Masivo</b></a></div>
              </td>
              <td class=TDBKG width="30%"> 
                <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
              </td>
            </tr>
          </table>
          <p>&nbsp;</p>
          
        </div>

	  </TD>
	</TR>
    </TABLE>
	
 <% } else {%>

 <% 

 String chk = "";
 String changeType = "";
 String previousValue = "";
 String newValue = "";
 String name = "";
 String modulo = "";

 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%> 
  <p> 

          
  <table class="tbenter" width=100% align=center>
    <tr> 
      <td class=TDBKG width="20%"> 
        <div align="center"><a href="javascript:goAction(0)"><b>Nuevo Cambio<br>Individual en Cuenta</b></a></div>
      </td>
      <td class=TDBKG width="20%"> 
        <div align="center"><a href="javascript:goAction(1)"><b>Nuevo Cambio Masivo</b></a></div>
      </td>
	  <td class=TDBKG width="20%">
        <div align="center"><a href="javascript:goAction(2)"><b>Modificar</b></a></div> 
      </td> 
	  <td class=TDBKG width="20%"> 
        <div align="center"><a href="javascript:goAction(3)"><b>Eliminar</b></a></div>
      </td>
      <td class=TDBKG width="20%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </td>
    </tr>
  </table>
   
  <br>
  <TABLE  id="mainTable" class="tableinfo">
	 <tr height="5%">
		<td NOWRAP valign="top" width="80%">
	  		<TABLE id="headTable" width="100%" >
			<TR id="trdark"> 
	            <th align="center" nowrap width="2%">&nbsp;</th>
	            <th align="center" nowrap width="8%">Módulo</th>
	            <th align="center" nowrap width="12%"> 
	              <div >Descripción</div>
	            </th>
	            <th align="center" nowrap width="10%"> 
	              <div >Tipo<br>Cambio</div>
	            </th>
	            <th align="center" nowrap width="10%"> 
	              <div >Referencia</div>
	            </th>
	            <th align="center" nowrap width="28%"> 
	              <div >Nombre</div>
	            </th>
	            <th align="center" nowrap width="5%"> 
	              <div >Tipo<br>Producto</div>
	            </th>
	            <th align="center" nowrap width="5%"> 
	              <div >Valor<br>Anterior</div>
	            </th>
	            <th align="center" nowrap width="5%"> 
	              <div >Valor<br>Nuevo</div>
	            </th>
	            <th align="center" nowrap width="5%"> 
	              <div >Usuario</div>
	            </th>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <TD NOWRAP valign="top" width="80%">      
		       <div id="dataDiv1" style="height:400px; overflow:auto;"> 
		       <table id="dataTable" width="100%">         
          <%
                ESD090001Help.initRow();
                chk = "checked";
                while (ESD090001Help.getNextRow()) {
                 
				 datapro.eibs.beans.ESD090001Message msgList = (datapro.eibs.beans.ESD090001Message) ESD090001Help.getRecord();
				  if (msgList.getE01MODDSC().length() > 20) {
                  	modulo = msgList.getE01MODDSC().substring(0,20);	  
				  } else {
                  	modulo = msgList.getE01MODDSC();	  
				  }					  
				  
                  if (msgList.getE01CHGTYP().equals("1")) {
                  	changeType = "Individual en Cuenta";
                  	previousValue = msgList.getE01CHGPRO();
                  	newValue = msgList.getE01CHGPRC();
                  	name = msgList.getE01CUSNA1();
                  }
                  else if (msgList.getE01CHGTYP().equals("2")) {
                  	changeType = "Masivo en Producto";
                  	previousValue = msgList.getE01CHGPRO();
                  	newValue = msgList.getE01CHGPRC();
                  	name = msgList.getE01PRDDSC();
                  }
                  else if (msgList.getE01CHGTYP().equals("3")) {
                  	changeType = "Masivo en Sucursal";
                  	previousValue = msgList.getE01CHGOBR();
                  	newValue = msgList.getE01CHGNBR();
                  	name = msgList.getE01OLDBRN();
                  }
                  else if (msgList.getE01CHGTYP().equals("4")) {
                  	changeType = "Masivo en Oficial";
                  	previousValue = msgList.getE01CHGOFC();
                  	newValue = msgList.getE01CHGNFC();
                   	name = msgList.getE01OLDOFN();
                  }
                  else {
                  	changeType = "";
                  	previousValue = "";
                  	newValue = "";
                  	name = "";
                  }
		 %>
          <tr id="dataTable<%= ESD090001Help.getCurrentRow() %>">
            <td NOWRAP  align="center" width="2%"> 
              <input type="radio" name="CURRCODE" value="<%= ESD090001Help.getCurrentRow() %>" <%=chk%> onClick="highlightRow('dataTable', <%= ESD090001Help.getCurrentRow() %>)" >
            </td>
            <td NOWRAP  align="center" width="8%"><%= msgList.getE01CHGACD() %></td>
			<td NOWRAP  align="left" width="12%"><%= modulo %></td>
            <td NOWRAP  align="center" width="10%"><%= changeType %></td>
            <td NOWRAP  align="center" width="10%"><%= msgList.getE01CHGACC() %></td>
            <td NOWRAP  align="left" width="28%"><%= name %></td>
            <td NOWRAP  align="center" width="5%"><%= msgList.getE01CHGPRT() %></td>
            <td NOWRAP  align="center" width="5%"><%= previousValue %></td>
            <td NOWRAP  align="center" width="5%"><%= newValue %></td>
            <td NOWRAP  align="center" width="5%"><%= msgList.getE01CHGIUS() %></td>

         </tr>
          <% chk = "";     
             } %>
            </table>
		    </div>
   			</TD>
    		</TR>	
         </TABLE>
  
     
  <SCRIPT type="text/javascript">
 showChecked("CURRCODE");
     
</SCRIPT>

<%}%>


  </form>

</body>
</html>
