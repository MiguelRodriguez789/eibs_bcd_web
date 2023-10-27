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
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"   scope="session"/>
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"></SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
  	
  	var reason = '';
	
	function goAction(op) {
		if (op == 4) {
	 		if (!confirm("¿Está seguro que quiere eliminar los documentos?")) {
	 			return;
	 		}
	 	}

     	document.forms[0].opt.value = op;
     	var row = getElementChecked("ROW").value;
		var en = 'E01DCISTA_' + row;
     
       	if (op == 2 || op == 4) {
     		var formLength = document.forms[0].elements.length;
			for (var n=0; n<formLength; n++) {
      			var l = document.forms[0].elements[n].name;
      			if (l == en) {
      				if (op == 2) {
      					document.getElementById("reason").value = reason;
						document.forms[0].elements[n].value = 'CO';
					} else if (op == 4) {
						document.forms[0].elements[n].value = '';
					}
					break;
				}	
			}
		}
		document.forms[0].submit();
	}
 
	function AddRow(tableName){  
   		var maxcell = 6;
   		var idxrow;
   		var okdel = false;
   		var sufix = "";
   		var addseq;
   
    	try {
        	var myTable = getElement(tableName);
	    	myTable.insertRow();
	 		idxrow = myTable.rows.length -1;
	 		sufix = "" + (idxrow - 1);
	 	
	 		for (var i=0; i<maxcell; i++) {
	      		myTable.rows[idxrow].insertCell();
	      		myTable.rows[idxrow].cells[i].align = "center";
	   		}   
	   	
	   		addseq = parseInt(document.forms[0].SEQ.value) + 1;    	
	   		myTable.rows[idxrow].cells[0].innerHTML = "<input type='radio' name='ROW' value='" + sufix + "'>";
	  	
	  		myTable.rows[idxrow].cells[1].innerHTML = "<input type='text' name='E01DCISEQ_" + sufix + "' size='2' maxlength='4'  value='" + addseq + "' readonly>";
	    
	    	myTable.rows[idxrow].cells[2].innerHTML = "<input type='text' name='E01DCIDES_" + sufix + "' size='35' maxlength='35'  value='' >";
	    
	    	myTable.rows[idxrow].cells[3].innerHTML = "<select name='E01DCIFRE_" + sufix + "' >" +
	    										  	" <option value=' ' selected ></option>" +
	    											" <option value='M' >MENSUAL</option>" +
	    											" <option value='B' >BIMENSUAL</option>" +
	    											" <option value='Q' >CUATRIMESTRAL</option>" +
	    											" <option value='S' >SEMESTRAL</option>" +
	    											" <option value='X' >SIN VENCIMIENTO</option>" +
	    											" <option value='1' >CADA UN AÑO</option>" +
	    											" <option value='2' >CADA DOS AÑOS</option>" +
	    											" <option value='3' >CADA TRES AÑOS</option>" +
	    											" <option value='4' >CADA CUATRO AÑOS</option>" +
	    											" <option value='5' >CADA CINCO AÑOS</option></select>";
	    											
	    	myTable.rows[idxrow].cells[4].innerHTML = "<select name='E01DCISTA_" + sufix + "' >" +
	    										  	" <option value='XX' ></option>" +
	    											" <option value='CO'>ESCANEADO</option>" +
	    											" <option value='NP'>NO PRESENTADO</option>" +
	    											" <option value='' selected >INCOMPLETO</option>" +
	    											" <option value='PD' >VENCIDO</option>" +
	    											" <option value='NA' >NO APLICABLE</option></select>";											
<%if(currUser.getE01DTF().equals("DMY")) {%> 
	    	myTable.rows[idxrow].cells[5].innerHTML = "<input type='text' name='E01DCIEXD_" + sufix + "' size='3' maxlength='2'  value='' onKeypress='enterInteger(event)'>" +
		      " <input type='text' name='E01DCIEXM_" + sufix + "' size='3' maxlength='2'  value='' onKeypress='enterInteger(event)'>" +
		      " <input type='text' name='E01DCIEXY_" + sufix + "' size='5' maxlength='4'  value='' onKeypress='enterInteger(event)'>" +
		      " <a href='javascript:DatePicker(document.forms[0].E01DCIEXD_" + sufix + ",document.forms[0].E01DCIEXM_" + sufix + ",document.forms[0].E01DCIEXY_" + sufix + ")'>" + 
		      " <img src='<%=request.getContextPath()%>/images/calendar.gif' title='help' align='middle' border='0'></a>";
<% } else if(currUser.getE01DTF().equals("YMD")) {  %>
	    	myTable.rows[idxrow].cells[5].innerHTML = " <input type='text' name='E01DCIEXY_" + sufix + "' size='5' maxlength='4'  value='' onKeypress='enterInteger(event)'>" +
		      " <input type='text' name='E01DCIEXM_" + sufix + "' size='3' maxlength='2'  value='' onKeypress='enterInteger(event)'>" +
	    	  "<input type='text' name='E01DCIEXD_" + sufix + "' size='3' maxlength='2'  value='' onKeypress='enterInteger(event)'>" +
		      " <a href='javascript:DatePicker(document.forms[0].E01DCIEXY_" + sufix + ",document.forms[0].E01DCIEXM_" + sufix + ",document.forms[0].E01DCIEXD_" + sufix + ")'>" + 
		      " <img src='<%=request.getContextPath()%>/images/calendar.gif' title='help' align='middle' border='0'></a>";
<% } else {%>
	    	myTable.rows[idxrow].cells[5].innerHTML = "<input type='text' name='E01DCIEXM_" + sufix + "' size='3' maxlength='2'  value='' onKeypress='enterInteger(event)'>" +
		      " <input type='text' name='E01DCIEXD_" + sufix + "' size='3' maxlength='2'  value='' onKeypress='enterInteger(event)'>" +
		      " <input type='text' name='E01DCIEXY_" + sufix + "' size='5' maxlength='4'  value='' onKeypress='enterInteger(event)'>" +
		      " <a href='javascript:DatePicker(document.forms[0].E01DCIEXM_" + sufix + ",document.forms[0].E01DCIEXD_" + sufix + ",document.forms[0].E01DCIEXY_" + sufix + ")'>" + 
		      " <img src='<%=request.getContextPath()%>/images/calendar.gif' title='help' align='middle' border='0'></a>";
<% } %>	 	
	 		myTable.refresh();
	 		document.forms[0].SEQ.value = addseq;
	 		document.forms[0].TOTALROW.value = idxrow;
	    	getElement("E01DCIDES_" + sufix).focus();
	         
    	} catch(e) {
    	}
  	}
  	
  <% if ( userPO.getOption().equals("RT")) { %>
	 builtNewMenu(rt_m_opt);
<% } else if ( userPO.getOption().equals("SV")) { %>
	 builtNewMenu(sv_m_opt);
<% } else if (userPO.getOption().equals("CD")) { %>
	 builtNewMenu(cd_m_opt);
<% } else if (userPO.getOption().equals("LN")) { %>
	 builtNewMenu(ln_m_opt);
<% } else if (userPO.getOption().equals("PV")) { %>
	 builtNewMenu(pv_m_opt);
<% } else if (userPO.getOption().equals("CL")) { %>
	 builtNewMenu(cl_m_opt);	 
<% } else if ( userPO.getOption().equals("CLIENT_P")) { %>
		 builtNewMenu(client_personal_opt);
<% } else if ( userPO.getOption().equals("CLIENT_C")) { %>
		 builtNewMenu(client_corp_opt);
<% } else if ( userPO.getOption().equals("LC")) { %>
		 builtNewMenu(lc_m_opt);
<% } else if ( userPO.getOption().equals("DV")) { %>
		 builtNewMenu(coll_i_opt);
<% } else if (userPO.getOption().equals("CO")) { %>
	builtNewMenu(colla_M_opt);
<% } else if ( userPO.getOption().equals("CLIENT_P_NC")) { %>
		 builtNewMenu(client_personal_opt_nc);
<% } else if ( userPO.getOption().equals("CLIENT_C_NC")) { %>
		 builtNewMenu(client_corp_opt_nc);
<% } else if ( userPO.getOption().equals("CR")) { %>
		 builtNewMenu(cer_m_opt);
<% } else if ( userPO.getOption().equals("ENTITY")) { %>
		 builtNewMenu("ent_m_opt");
<% } else if ( userPO.getOption().equals("CLIENT_SHORT")) {
		if(userPO.getCusType().equals("2")){
%>
		 builtNewMenu("customer_short_m_opt");
<%		} else { %>
		 builtNewMenu("customer_short_corp_m_opt");
<%  	}
	}
 %>  	

</SCRIPT>

</HEAD>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>


<BODY >


<SCRIPT type="text/javascript"> 
   initMenu(); 
   
   MM_preloadImages('<%=request.getContextPath()%>/images/s/exit_over.gif','<%=request.getContextPath()%>/images/s/scan_over.gif','<%=request.getContextPath()%>/images/s/view_over.gif','<%=request.getContextPath()%>/images/s/update_over.gif');
   
   function showAddInfo(idxRow){
   	var dataTable = document.getElementById("dataTable");
   	for ( var i=0; i<dataTable.rows.length; i++ ) {
    	dataTable.rows[i].className = "trnormal";
    }
   	dataTable.rows[idxRow].className = "trhighlight";
  }   
</SCRIPT>

<h3 align="center">
<% if ( userPO.getHeader22().equals("C")  || userPO.getHeader22().equals("P")) { %>
	 Documentos para Cliente <%= userPO.getCusNum()%>
<% } else { %>
	 Documentos para Cuenta <%= userPO.getIdentifier()%>
<% } %>
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="doc_list.jsp, EDI0010">
</h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDI0010" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
<INPUT TYPE=HIDDEN NAME="opt" VALUE="1">
<INPUT TYPE=HIDDEN NAME="Type" VALUE="<%= userPO.getHeader22()%>">
<INPUT TYPE=HIDDEN NAME="SEQ" VALUE="0">
<INPUT TYPE=HIDDEN NAME="TOTALROW" VALUE="0">
<INPUT TYPE=HIDDEN NAME="reason" id="reason">

  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
<%
if (userPO.getCusNum() != null && !userPO.getCusNum().equals("")) {
%>

          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E02CUN" size="9" maxlength="9" readonly value="<%= userPO.getCusNum().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E02NA1" size="45" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
              </div>
            </td>
          </tr>
<%
}
%>
<%
if ( userPO.getOption().equals("RT")||userPO.getOption().equals("SV") ) {
%>

          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E04CUN" size="12" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E02PRO" size="4" maxlength="4" readonly value="<%= userPO.getHeader1().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
<%
}
%>

  </table>

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
              	String row = "";
		  		try {
					row = "&ROW=" + request.getParameter("ROW").trim();		
		  		} catch(Exception e){
				}  
%>
       	<SCRIPT type="text/javascript">
	   		CenterWindow('<%= pagename + row %>',620,600,2);
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
      <TD ALIGN=LEFT width="60%">
		<%= userPO.getHeader19() %>
      </TD>
    </TR>
  </TABLE>

  <TABLE class="tbenter" width="100%">
    <TR> 
      <TD ALIGN=CENTER  class=TDBKG> <a href="javascript:goAction(1)"><b>Actualizar</b></a> 
      </TD>
      <TD ALIGN=CENTER  class=TDBKG> <a href="javascript:enterReason(2)"><b>Escanear</b></a> 
      </TD>
      <TD ALIGN=CENTER   class=TDBKG> <a href="javascript:goAction(3)"><b>Visualizar</b></a> 
      </TD>
		<%-- <TD ALIGN=CENTER   class=TDBKG> <a href="javascript:AddRow('dataTable')"><b>Agregar</b></a> 
      </TD>   --%>	      
      <TD ALIGN=CENTER   class=TDBKG> <a href="javascript:goAction(4)"><b>Limpiar</b></a> 
      </TD>
      <TD ALIGN=CENTER  class=TDBKG> <a href="<%=request.getContextPath()%>/pages/background.jsp" ><b>Salir</b></a> 
      </TD>
    </TR>
  </TABLE>
  
<TABLE  id="mainTable" class="tableinfo"  >
 <TR> 
      <TD NOWRAP valign="top" width="100%" > 
        <div id="dataDiv1" class="scbarcolor" style="padding:0">
          <table id="dataTable" width="100%"  >
            <TR id="trclear"> 
              <TD NOWRAP ALIGN=CENTER colspan="2"><b>Sec.</b></TD>
              <TD NOWRAP ALIGN=CENTER><b>Descripción</b></TD>
              <TD NOWRAP ALIGN=CENTER><b>Frecuencia</b></TD>
              <TD NOWRAP ALIGN=CENTER><b>Estado</b></TD>
              <TD NOWRAP ALIGN=CENTER><b>Fecha Venc.</b></TD>
            </TR>
            <%
                int row;
		  		try {
					row = Integer.parseInt(request.getParameter("ROW"));		
		  		} catch(Exception e){
					row = 0;
				}  
                docList.initRow();
                int k=0;
                int seq=0;
                while (docList.getNextRow()) {
                    if (docList.getFlag().equals("")) {
  %>
            <TR id="trclear"> 
              <TD NOWRAP ALIGN=CENTER><INPUT TYPE="radio" NAME="ROW" VALUE="<%= docList.getCurrentRow() %>" <% if (docList.getCurrentRow() == row) out.print("checked"); %> onClick="showAddInfo(<%= docList.getCurrentRow() %>)"></TD>
              <TD NOWRAP ALIGN=CENTER><INPUT TYPE="TEXT" NAME="E01DCISEQ_<%= docList.getCurrentRow() %>" VALUE="<%= docList.getRecord(2) %>" SIZE=2 MAXLENGTH=4 READONLY></TD>
              <TD NOWRAP ALIGN=CENTER><INPUT TYPE="TEXT" NAME="E01DCIDES_<%= docList.getCurrentRow() %>" VALUE="<%= docList.getRecord(3) %>" SIZE=35 MAXLENGTH=35 READONLY></TD>
              <TD NOWRAP ALIGN=CENTER> 
                <SELECT NAME="E01DCIFRE_<%= docList.getCurrentRow() %>">
                  <OPTION value="M" <% if (docList.getRecord(4).equals("M")) out.print("selected"); %>>MENSUAL</OPTION>
                  <OPTION value="B" <% if (docList.getRecord(4).equals("B")) out.print("selected"); %>>BIMENSUAL</OPTION>
                  <OPTION value="Q" <% if (docList.getRecord(4).equals("Q")) out.print("selected"); %>>CUATRIMESTRAL</OPTION>
                  <OPTION value="S" <% if (docList.getRecord(4).equals("S")) out.print("selected"); %>>SEMESTRAL</OPTION>
                  <OPTION value="X" <% if (docList.getRecord(4).equals("X")) out.print("selected"); %>>SIN VENCIMIENTO</OPTION>
                  <OPTION value="1" <% if (docList.getRecord(4).equals("1")) out.print("selected"); %>>CADA UN AÑO</OPTION>
                  <OPTION value="2" <% if (docList.getRecord(4).equals("2")) out.print("selected"); %>>CADA DOS AÑOS</OPTION>
				  <OPTION value="3" <% if (docList.getRecord(4).equals("3")) out.print("selected"); %>>CADA TRES AÑOS</OPTION>
                  <OPTION value="4" <% if (docList.getRecord(4).equals("4")) out.print("selected"); %>>CADA CUATRO AÑOS</OPTION>
                  <OPTION value="5" <% if (docList.getRecord(4).equals("5")) out.print("selected"); %>>CADA CINCO AÑOS</OPTION>
                </SELECT>
              </TD>
              <TD NOWRAP ALIGN=CENTER> 
                <SELECT NAME="E01DCISTA_<%= docList.getCurrentRow() %>">
                  <OPTION value="CO" <% if (docList.getRecord(5).equals("CO")) out.print("selected"); %>>ESCANEADO</OPTION>
                  <OPTION value="NP" <% if (docList.getRecord(5).equals("NP")) out.print("selected"); %>>NO PRESENTADO</OPTION>
                  <OPTION value=""   <% if (docList.getRecord(5).equals("")) out.print("selected"); %>>INCOMPLETO</OPTION>
                  <OPTION value="PD" <% if (docList.getRecord(5).equals("PD")) out.print("selected"); %>>VENCIDO</OPTION>
                  <OPTION value="NA" <% if (docList.getRecord(5).equals("NA")) out.print("selected"); %>>NO APLICABLE</OPTION>
                </SELECT>
              </TD>
              <TD NOWRAP ALIGN=CENTER>
              <%if(currUser.getE01DTF().equals("DMY")) {%> 
				<INPUT TYPE="TEXT" NAME="E01DCIEXD_<%= docList.getCurrentRow() %>" VALUE="<%= docList.getRecord(10) %>" SIZE=3 MAXLENGTH=2 onkeypress="enterInteger(event)" readonly>
              	<INPUT TYPE="TEXT" NAME="E01DCIEXM_<%= docList.getCurrentRow() %>" VALUE="<%= docList.getRecord(9)  %>" SIZE=3 MAXLENGTH=2 onkeypress="enterInteger(event)" readonly>
              	<INPUT TYPE="TEXT" NAME="E01DCIEXY_<%= docList.getCurrentRow() %>" VALUE="<%= docList.getRecord(11) %>" SIZE=5 MAXLENGTH=4 onkeypress="enterInteger(event)" readonly>              
                <a href="javascript:DatePicker(document.forms[0].E01DCIEXD_<%= docList.getCurrentRow() %>,document.forms[0].E01DCIEXM_<%= docList.getCurrentRow() %>,document.forms[0].E01DCIEXY_<%= docList.getCurrentRow() %>)"><img src="<%=request.getContextPath()%>/images/calendar.gif" title="help" align="middle" border="0"></a>             
              <% } else if(currUser.getE01DTF().equals("YMD")) {  %>
              	<INPUT TYPE="TEXT" NAME="E01DCIEXY_<%= docList.getCurrentRow() %>" VALUE="<%= docList.getRecord(11) %>" SIZE=5 MAXLENGTH=4 onkeypress="enterInteger(event)" readonly>              
              	<INPUT TYPE="TEXT" NAME="E01DCIEXM_<%= docList.getCurrentRow() %>" VALUE="<%= docList.getRecord(9) %>" SIZE=3 MAXLENGTH=2 onkeypress="enterInteger(event)" readonly>
				<INPUT TYPE="TEXT" NAME="E01DCIEXD_<%= docList.getCurrentRow() %>" VALUE="<%= docList.getRecord(10) %>" SIZE=3 MAXLENGTH=2 onkeypress="enterInteger(event)" readonly>
                <a href="javascript:DatePicker(document.forms[0].E01DCIEXY_<%= docList.getCurrentRow() %>,document.forms[0].E01DCIEXM_<%= docList.getCurrentRow() %>,document.forms[0].E01DCIEXD_<%= docList.getCurrentRow() %>)"><img src="<%=request.getContextPath()%>/images/calendar.gif" title="help" align="middle" border="0"></a>             
              <% } else {%>
				<INPUT TYPE="TEXT" NAME="E01DCIEXM_<%= docList.getCurrentRow() %>" VALUE="<%= docList.getRecord(9) %>" SIZE=3 MAXLENGTH=2 onkeypress="enterInteger(event)" readonly>
              	<INPUT TYPE="TEXT" NAME="E01DCIEXD_<%= docList.getCurrentRow() %>" VALUE="<%= docList.getRecord(10) %>" SIZE=3 MAXLENGTH=2 onkeypress="enterInteger(event)" readonly>
              	<INPUT TYPE="TEXT" NAME="E01DCIEXY_<%= docList.getCurrentRow() %>" VALUE="<%= docList.getRecord(11) %>" SIZE=5 MAXLENGTH=4 onkeypress="enterInteger(event)" readonly>              
                <a href="javascript:DatePicker(document.forms[0].E01DCIEXM_<%= docList.getCurrentRow() %>,document.forms[0].E01DCIEXD_<%= docList.getCurrentRow() %>,document.forms[0].E01DCIEXY_<%= docList.getCurrentRow() %>)"><img src="<%=request.getContextPath()%>/images/calendar.gif" title="help" align="middle" border="0"></a>             
              <% } %>
              </TD > 
            </TR>
            		
            <%
            		
                   k++;
                   seq = Integer.parseInt(docList.getRecord(2));
                    }        
                }
                  
      %>
          </table>
   </div>
   </TD>
  </TR>	
</TABLE>
      
<SCRIPT type="text/javascript">
     document.forms[0].SEQ.value="<%= seq %>";
     document.forms[0].TOTALROW.value="<%= k %>";
</SCRIPT>
 
<%
}
%>

</FORM>

</BODY>
</HTML>
