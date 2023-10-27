<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="datapro.eibs.master.Util"%>
<html>
<head>
<title>Solicitudes</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EDD1500Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>	
<jsp:useBean id="cpBasic" class="datapro.eibs.beans.EDD150001Message" scope="session" />

<script type="text/javascript">


function goAction(op) {
        if ((op == 9) && (document.forms[0].APC.value != 'FA'))
        	{
        	     alert("Comprobante solo para Solicitud de Fallecido ");
        	}	  
        else
            {
               	document.forms[0].opt.value = op;
				document.forms[0].submit();
			}	
}

function setInfo(value) {
		document.forms[0].APC.value = value;		
}

  function goActionDocuments() {
	var ok = false;
	var cun = "";
	var pg = "";
	var cosnum = '0';
	
	 	for(n=0; n<document.forms[0].elements.length; n++)
	    {
	      	var element = document.forms[0].elements[n];
	      	if(element.name == "CURRCODE") 
	      	{	
	      		if (element.checked == true) {
        			ok = true;   			
        			cosnum =  eval("document.forms[0].REQ"+element.value+".value");
        			break;
				}
	      	}
	     }
      
      if ( ok ) {
      	var url_doc = '<%=request.getContextPath()%>/pages/s/EFRM000C_pdf_form.jsp?SCREEN=1&OPE_CODE=88&CUST_NUMBER='+document.forms[0].E01REQCUN.value+'&REQ_NUMBER='+cosnum;      	
      	//alert(url_doc);
      	getPdfForms(url_doc);
     } else {
		alert("Debe seleccionar un convenio para continuar.");	   
	 }
      
	}
	
</SCRIPT>  

</head>

<BODY>
<h3 align="center">Mantenimiento Solicitudes de Clientes<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="sol_request_list.jsp,EDD1500"> 
<hr size="4"></h3>
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD1500" >
  <input type=HIDDEN name="SCREEN" value="2">
  <input type=HIDDEN name="opt" value="1">
  <input type=HIDDEN name="totalRow" value="0">
  <input type=HIDDEN name="CCY" value="">
  <input type=HIDDEN name="BNK" value="">
  <input type=HIDDEN name="APC" value="">  
  <table class="tableinfo">
	<tr bordercolor="#FFFFFF">
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0"
			class="tbhead">
			<tr id="trdark">
				<td nowrap width="16%">
				<div align="right"><b>Cliente :</b></div>
				</td>
				<td nowrap width="20%">
				<div align="left"><input type="text" name="E01REQCUN"
					size="10" maxlength="9" value="<%=userPO.getHeader1()%>">
				</div>
				</td>
				<td nowrap width="16%">
				<div align="right"><b>Nombre :</b></div>
				</td>
				<td nowrap colspan="3">
				<div align="left"><font face="Arial"><font face="Arial"><font
					size="2"> <input type="text" name="E01CUSNA1" size="45"
					maxlength="45" value="<%=userPO.getHeader2()%>">
				</font></font></font></div>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
  
  
  <%
	if ( EDD1500Help.getNoResult() ) {
 %>
  
  <TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>No hay resultados para su b&uacute;squeda</b></p>
          <table class="tbenter" width=100% align=center>
           <tr>
            <td class=TDBKG>
                <div align="center" style="cursor:hand" ><a href="javascript:goAction(1)"><b>Crear</b></a></div>
              </td>
              <td class=TDBKG>
                <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
              </td>
           </tr>
         </table>
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


          
  <table class="tbenter" width=100% align=center>
    <tr> 
      <td class=TDBKG width="20%"> 
        <div align="center" style="cursor:hand" ><a href="javascript:goAction(1)"><b>Crear</b></a></div>
      </td>
      <td class=TDBKG width="20%"> 
        <div align="center"><a href="javascript:goAction(2)"><b>Modificar</b></a></div>
      </td>
      <td class=TDBKG width="20%"> 
        <div align="center"><a href="javascript:goAction(9)"><b>Comprobante<br>Fallecido</b></a></div>
      </td>
	 <td align="center" class="tdbkg" width="15%"><a
			href="javascript:goActionDocuments()"> <b>Formularios PDF</b> </a></td>		           
      <td class=TDBKG width="20%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </td>
    </tr>
  </table>
  <br>  
  <TABLE  id=cfTable class="tableinfo">
 <TR > 
    <TD NOWRAP valign="top" width="100%">
        <table id="headTable" width="100%">
          <tr id="trdark"> 
            <th align=CENTER nowrap width="10%">&nbsp;</th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center">Numero</div>
            </th>
            <th align=CENTER nowrap width="30%"> 
              <div align="center"> Tipo Solicitud </div>
            </th>
            <th align=CENTER nowrap width="30%"> 
              <div align="center"> Motivo </div>
            </th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center"> Fecha Ingreso </div>
            </th>
             <th align=CENTER nowrap width="10%"> 
              <div align="center"> Fecha Vencimiento </div>
            </th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center">  Estado </div>
            </th>
          </tr>
          <%
                EDD1500Help.initRow();
				boolean firstTime = true;
				String chk = "";
				int idx = 0;
				String valStyle = "";
        		while (EDD1500Help.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
					if (idx++ % 2 != 0)
						valStyle = "trdark";
					else
						valStyle = "trclear";
                  	datapro.eibs.beans.EDD150001Message msgList = (datapro.eibs.beans.EDD150001Message) EDD1500Help.getRecord();
		 %>
				<TR id="<%= valStyle %>">
						
					<TD NOWRAP  ALIGN=CENTER width="10%" >
					<input type="radio" name="CURRCODE" value="<%= EDD1500Help.getCurrentRow() %>"  <%=chk%> onClick="setInfo('<%= msgList.getE01REQAPC().trim()%>')" >
					<INPUT type="HIDDEN" name="E01REQAPC" size="2" value="<%= msgList.getE01REQAPC().trim()%>">
					</TD>				
					<TD NOWRAP  ALIGN=CENTER width=\"10%\"><input type="hidden" name="REQ<%=EDD1500Help.getCurrentRow()%>" value="<%=msgList.getE01REQNUM()%>">
					<%= msgList.getE01REQNUM() %></td>
					<TD NOWRAP  ALIGN=left width=\"15%\"><%= msgList.getD01REQTYP() %></td>
					<TD NOWRAP  ALIGN=left width=\"15%\"><%= msgList.getD01REQCAU() %></td>
			        <TD NOWRAP align="center" width=\"10%\" ><%= Util.formatCustomDate(currUser.getE01DTF(),
			        		msgList.getBigDecimalE01REQSMM().intValue(),
			        		msgList.getBigDecimalE01REQSDD().intValue(),
			        		msgList.getBigDecimalE01REQSYY().intValue())%></td>
			        <TD NOWRAP align="center" width=\"10%\" ><%= Util.formatCustomDate(currUser.getE01DTF(),
			        		msgList.getBigDecimalE01REQMMM().intValue(),
			        		msgList.getBigDecimalE01REQMDD().intValue(),
			        		msgList.getBigDecimalE01REQMYY().intValue())%></td>
			        <TD nowrap width="35%" align="left">
				        <INPUT type="HIDDEN" name="E01REQSTS" size="1" value="<%= msgList.getE01REQSTS().trim()%>">
							<% if (msgList.getE01REQSTS().equals("I")) out.print("INGRESADA");
								 else if (msgList.getE01REQSTS().equals("O")) out.print("Ing. con Obs.");
			   					 else if (msgList.getE01REQSTS().equals("A")) out.print("APROBADA");
			   					 else if (msgList.getE01REQSTS().equals("P")) out.print("PAGADA");
			   					 else if (msgList.getE01REQSTS().equals("R")) out.print("RECHAZADA");
			    				 else if (msgList.getE01REQSTS().equals("V")) out.print("VENCIDA"); %>
	 		       </TD>
 				</TR>
		 <%
                }
              %>
        </table>
        </TD>
        </TR>
    </table>
     
  <%}%>

<SCRIPT type="text/javascript">
  
  showChecked("CURRCODE");
  
 function tableresize() {
    adjustEquTables(headTable,dataTable,dataDiv,0,true);
   }
  tableresize();
  window.onresize=tableresize;   
</SCRIPT>
</form>

</body>
</html>
