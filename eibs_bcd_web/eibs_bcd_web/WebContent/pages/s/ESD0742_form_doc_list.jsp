<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Lista Directorio de Formas para e-IBS</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ESD074201Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
 
 


<script type="text/javascript">
	function goAction(op) {
		document.forms[0].opt.value = "000" + op;
		document.forms[0].submit();
	}

	function goDelete(op) {
		if (confirm("Esta seguro que desea borrar esta forma?")) {
			goAction(op);
		}
	}
	
	function setCurrentRow(value) {
		document.getElementById("currentRow").value = value;
	}

</SCRIPT>  

</head>

<BODY>
<h3 align="center">Lista Directorio de Formas para e-IBS
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="form_doc_list.jsp, ESD0742"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSESD0742" >
  <p> 
    <input type=HIDDEN name="SCREEN" value="300">
    <input type=HIDDEN name="PRODUCT" value="<%=request.getParameter("PRODUCT")%>">
    <input type=HIDDEN name="TYPE" value="<%=request.getParameter("TYPE")%>">
    <input type=HIDDEN id="currentRow" name="ROW" value="0">
    <input type=HIDDEN name="opt">
  </p>
  
  <p> 
    <%
	if ( ESD074201Help.getNoResult() ) {
 %>
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
              <td class=TDBKG width="50%"> 
                <div align="center"><a href="javascript:goAction(1)"><b>Crear</b></a></div>
              </td>
              <td class=TDBKG width="50%"> 
                <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
              </td>
            </tr>
          </table>
          <p>&nbsp;</p>
          
        </div>

	  </TD>
	</TR>
    </TABLE>
	
  <%  
		}
	else {
%> <% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%> 
  <p> 

          
  <table class="tbenter" width=100% align=center height="10%">
    <tr> 
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction(1)"><b>Crear</b></a></div>
      </td>
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction(5)"><b>Modificar</b></a></div>
      </td>
		<td class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goDelete(9)"><b>Borrar</b></a></div>
      </td>      
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </td>
    </tr>
  </table>
  <br>
  <table  id=cfTable class="tableinfo" height="70%">
    <tr height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
        <table id="headTable" width="100%">
          <tr id="trdark"> 
            <th align=CENTER nowrap width="5%">&nbsp;</th>
            <th align=CENTER nowrap width="10%">Producto</th>
            <th align=CENTER nowrap width="10%">C&oacute;digo</th>
            <th align=CENTER nowrap width="10%">Tipo</th>
            <th align=LEFT nowrap width="25%"><div align="center">Descripci&oacute;n</div></th>
            <th align=LEFT nowrap width="20%"><div align="center">Documento</div></th>
            <th align=CENTER nowrap width="10%">Copias</th>
            <th align=CENTER nowrap width="10%">Operaci&oacute;n</th>
          </tr>
        </table>
      </td>
    </tr>    
		  <tr height="95%">    
		    <td>       
		       <div style="width:100%; height:100%; overflow:auto;"> 
		       <table cellspacing="0" cellpadding="1" border="0" width="100%">         
          <%
                ESD074201Help.initRow();
				boolean firstTime = true;
				String chk = "";
        		while (ESD074201Help.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
                  	datapro.eibs.beans.ESD074201Message msgList = (datapro.eibs.beans.ESD074201Message) ESD074201Help.getRecord();
		 %>
          <tr> 
            <td NOWRAP  align=CENTER width="5%"><input type="radio" name="CURRCODE" value="<%=ESD074201Help.getCurrentRow()%>" onclick="setCurrentRow(<%=ESD074201Help.getCurrentRow()%>)" <%=chk%>></td>
            <td NOWRAP  align=CENTER width="10%"><%= msgList.getE01APFPRO() %></td>
            <td NOWRAP  align=CENTER width="10%"><%= msgList.getE01APFFCD() %></td>
            <td NOWRAP  align=CENTER width="10%"><%= msgList.getE01APFFTY() %></td>
            <td NOWRAP  align=LEFT width="25%"><%= msgList.getE01APFDSC() %></td>
            <td NOWRAP  align=LEFT width="20%"><%= msgList.getE01APFPTH() %></td>
            <td NOWRAP  align=CENTER width="10%"><%= msgList.getE01APFCPI() %></td>
            <td NOWRAP  align=CENTER width="10%"><%= msgList.getE01APFCPI() %></td>
          </tr>
          <%
                }
              %>
              </table>
              </div>
              </td>
              </tr>
  </table>
  
  <TABLE  class="tbenter" WIDTH="98%" ALIGN="center"  height="10%">
  	<TR>
  		 <TD WIDTH="50%" ALIGN=LEFT height="25">
  		 <% 
        	if ( ESD074201Help.getShowPrev() ) {
      			int pos = ESD074201Help.getFirstRec() - 51;
      		    out.print("<A HREF=\"" + request.getContextPath() + "/servlet/datapro.eibs.tools.JSESD0742?SCREEN=100&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
        	}
  		 %>
  		 </TD>
  		 <TD WIDTH="50%" ALIGN=RIGHT height="25">
  		 <% 
        	if ( ESD074201Help.getShowNext() ) {
      			int pos = ESD074201Help.getLastRec();
      		    out.print("<A HREF=\"" + request.getContextPath() + "/servlet/datapro.eibs.tools.JSESD0742?SCREEN=100&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
        	}
  		 %>
  		 </TD>
  	</TR>
  </TABLE>
     
<%}%>

  </form>

</body>
</html>
