<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import ="datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<HTML>
<HEAD>
<TITLE>
Reglas de Firmas
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "rulesList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "categList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
<% 
 boolean newRule = true;
 int row;
 boolean isReadOnly = userPO.getHeader11().equals("C")?true:false;
 datapro.eibs.beans.DataSignRule dsr = new datapro.eibs.beans.DataSignRule();
 dsr.setAccUid(userPO.getIdentifier());
 
 String error = request.getParameter("ERROR");
 
 if (error != null) {
    dsr.setSigRule(request.getParameter("RULE"));
    dsr.setAmount(request.getParameter("AMOUNT"));
    try {
		  	row = Integer.parseInt(request.getParameter("ROW")); 
            newRule = false;
	} catch (Exception e) {
			row = (rulesList.getNoResult()) ? 1 : rulesList.getLastRec() + 2;	    
	}
 } else {
	try {
		row = Integer.parseInt(request.getParameter("ROW")); 
		rulesList.setCurrentRow(row);
	    dsr = (datapro.eibs.beans.DataSignRule) rulesList.getRecord();
	    request.setAttribute("dsr", dsr); 
	    row++;
		newRule = false;
	} catch (Exception e) {
		row = (rulesList.getNoResult()) ? 1 : rulesList.getLastRec() + 2;	    
	}
 }
 
 char[] rule = dsr.getSigRule().trim().toCharArray(); 
   
%>

//new code to sort options
function compareText (option1, option2) {
  return option1.text < option2.text ? -1 :
    option1.text > option2.text ? 1 : 0;
}

function sortSelect (select, compareFunction) {
  if (!compareFunction)
    compareFunction = compareText;
  var options = new Array (select.options.length);
  for (var i = 0; i < options.length; i++)
    options[i] = 
      new Option (
        select.options[i].text,
        select.options[i].value,
        select.options[i].defaultSelected,
        select.options[i].selected
      );
  options.sort(compareFunction);
  select.options.length = 0;
  for (var i = 0; i < options.length; i++)
    select.options[i] = options[i];
}



function addCateg(){
  		var fromList = document.forms[0]["CATEG"];
    	var toList = document.forms[0]["SELCATEG"];
  		var ln = toList.options.length;
  		var idx = fromList.selectedIndex;
        toList.options[ln] = new Option(fromList.options[idx].text,fromList.options[idx].value);
        toList.options[ln].id=idx;
        toList.selectedIndex = ln;
        sortSelect(toList);
        concatRule();
        
  }

function delCateg(){
	var toList = document.forms[0]["SELCATEG"];
	var idx = toList.selectedIndex;
	toList.options[idx]=null;
	if (idx > 0) {
       	  idx--;
		  toList.selectedIndex = idx;
	}
	sortSelect(toList);
	concatRule();
}

function concatRule() {
    var toList = document.forms[0]["SELCATEG"];
    var rule = "";
    for (var i = 0; i < toList.length; i++)
       rule = rule + toList.options[i].value;   
    document.forms[0]["SIGRULE"].value = rule;   

}

function setInfo(val) {
   if (val == 2) {   
      document.forms[0]["AMOUNT"].value = "0.00";
      document.forms[0]["AMOUNT"].style.visibility = "hidden";
   } else {
      document.forms[0]["AMOUNT"].style.visibility = "visible";
      document.forms[0]["AMOUNT"].focus();
   }
}
 
function  checkValues() {

   if (document.forms[0]["SIGRULE"].value == "" ) {
      alert("No pueden existir reglas , sin categorias.");
      return false;
   }
   
   if (document.forms[0]["TYPEAMT"][0].checked == true ) {
      if (document.forms[0]["AMOUNT"].value == "" || document.forms[0]["AMOUNT"].value == "0.00" ||
          document.forms[0]["AMOUNT"].value == "0,00") {
      	alert("El monto de la regla no puede ser 0 o vacio.");
      	return false;
      }
   }
     
    if (document.forms[0]["CCYCODE"].value == "" ) {
      	alert("Codigo de Moneda incorrecto");
      	return false;
    }
    
	
    
    if (document.forms[0]["dayFrom"].value == "" || document.forms[0]["monthFrom"].value == "" ||
          document.forms[0]["yearFrom"].value == "") {
      	alert("Fecha Vigente Desde : Incorrecta");
      	return false;
    }
    
//    if (document.forms[0]["DAYTO"].value == "" || document.forms[0]["MONTHTO"].value == "" ||
//      document.forms[0]["YEARTO"].value == "") {
//  		alert("Fecha Vigente Hasta : Incorrecta");
//  		return false;
//	}
	
    var isMenor = compareUTCDates(document.forms[0]["yearFrom"].value,document.forms[0]["monthFrom"].value,document.forms[0]["dayFrom"].value,
    document.forms[0]["yearTo"].value,document.forms[0]["monthTo"].value, document.forms[0]["dayTo"].value);
    
//    if (!isMenor) {
//    	alert("Fecha Vigente Hasta debe ser mayor a la Fecha Vigente Desde ");
//  		return false;
//    }
    
    if (document.forms[0]["DOCNUM"].value == "" ) {
      	document.forms[0]["DOCNUM"].value = "0";
    }
       
   return true;
}

function compareUTCDates(yearFrom,monthFrom,dayFrom,yearTo,monthTo,dayTo) {

  var isMenor = false;
  var yF = Number(yearFrom);
  var mF = Number(monthFrom) - 1;
  var dF = Number(dayFrom);
  var yT = Number(yearTo);
  var mT = Number(monthTo)-1;
  var dT = Number(dayTo);
  
  // UTC year,month,day
  var dFrom = Date.UTC(yF,mF,dF);
  var dTo = Date.UTC(yT,mT,dT);
  
  if ( dFrom < dTo) {
	isMenor = true
  }
  
  return isMenor
}


</SCRIPT>
</HEAD> 
<BODY >
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000F" onsubmit="return(checkValues())">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
<INPUT TYPE=HIDDEN NAME="action" VALUE="<% if (newRule) out.print("1"); else out.print("2"); %>">
<INPUT TYPE=HIDDEN NAME="SIGRULE" VALUE="<%= dsr.getSigRule().trim() %>">
<INPUT TYPE=HIDDEN NAME="ACCUID" VALUE="<%= dsr.getAccUid().trim() %>">
 <h3 align="center">
  <% if (newRule) out.print("Nueva"); 
  	 else if(!isReadOnly) out.print("Mantenimiento de");
  	 else out.print("Consulta de");
  %> Regla de Firma 
 <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_sign_rules_maint.jsp,EDD0000"> 
    </h3>
   <hr size="4">
   
  
  <BR>
  
 <TABLE  id="mainTable" class="tableinfo"  > 
 <TR id="trdark">	
  	<td nowrap > 
      <div align="right">Regla : </div>
    </td>
	<td nowrap colspan=2> 
	  <input type="text" name="ROW" size="15" maxlength="15" value="<%= row%>" readonly>
	</td>
 </TR>
 <TR>	
  	<td nowrap > 
      <div align="center">Categorias </div>
    </td>
	<td nowrap > 
      <div align="right"></div>
    </td>
    <td nowrap > 
      <div align="center">Seleccion </div>
    </td>
 </TR>	
 
 <TR > 
  <TD NOWRAP valign="top" width="45%" align="center">
   
              <select name="CATEG" size="6" <%if(isReadOnly) out.print("disabled");%>>
               <%
		         categList.initRow();		         
		         while ( categList.getNextRow()) {		            
            		datapro.eibs.beans.EWD0002DSMessage msgHelp = (datapro.eibs.beans.EWD0002DSMessage) categList.getRecord();
     			    if (!msgHelp.getEWDCOD().trim().equals("")) {
     			%>
		              <option value="<%= msgHelp.getEWDCOD().trim() %>">  <%= msgHelp.getEWDCOD().trim() %>  </option>
		        <% } 		      	        
		        }
		        %>                
              </select>  
  </TD>
  <TD width="10%" align="center">
    <input type="button" name="add" value="&gt;&gt;" onclick="addCateg()" <%if(isReadOnly) out.print("readonly");%>> <BR><BR>
    <input type="button" name="remove" value="&lt;&lt;" onclick="delCateg()" <%if(isReadOnly) out.print("readonly");%>>
  </TD>
  
  <TD nowrap width="45%" align="center"> 
              <select name="SELCATEG" size="6" <%if(isReadOnly) out.print("disabled");%>>
              <%                
                 if (!newRule) {
                  for (int i=0;i< rule.length;i++) {          
              %>
		           <option value="<%= rule[i] %>">  <%= rule[i] %>  </option>
              <%   
                  }
                 }                
              %>       
              </select>
  </TD>
  </TR>	
  <TR id="trdark">	
  	<td nowrap > 
      <div align="right">Monto :</div>
    </td>
	<td nowrap colspan=2>
	   <input type="radio" name="TYPEAMT" value="1" <% if (!(dsr.getAmount().equals("0.00") || dsr.getAmount().equals("0"))) out.print("checked");%> onclick="setInfo(this.value)"  <%if(isReadOnly) out.print("disabled"); %>> Valor&nbsp;&nbsp;  
	   <input type="text" name="AMOUNT" size="15" maxlength="15" value="<%= Util.formatCCY(dsr.getAmount()) %>" onKeypress="enterDecimal(event, 2)" <%if(isReadOnly) out.print("disabled"); %> ><br>
	   <input type="radio" name="TYPEAMT" value="2" <% if (dsr.getAmount().equals("0.00") || dsr.getAmount().equals("0")) out.print("checked");%> onclick="setInfo(this.value)" <%if(isReadOnly) out.print("disabled");%>> Sin Limite 
	</td>
 </TR>
 <TR>	
  	<td nowrap > 
      <div align="right">Moneda : </div>
    </td>
	<td nowrap colspan=2> 
	  <input type="text" name="CCYCODE" size="4" maxlength="3" value="<%= dsr.getCCYCode()%>" readonly>
	  <%if(!isReadOnly){ %>
	  <a href="javascript:GetCurrency('CCYCODE','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0" ></a>
	  <%} %>             
	</td>
 </TR>
 <TR id="trdark">
	<td nowrap > 
      <div align="right">Fecha de Vigencia </div>
    </td>
	<td nowrap > 
      <div align="right">Desde : </div>
    </td>
    <td>
       <eibsinput:date name="dsr"  fn_month="monthFrom" fn_day="dayFrom" fn_year="yearFrom" readonly="<%= isReadOnly%>" /> 
    </td> 
 </TR>
 <TR id="trdark"> 
    <td nowrap >       
    </td>                  
    <td nowrap > 
      <div align="right">Hasta : </div>
    </td>
    <td>
       <eibsinput:date name="dsr" fn_month="monthTo" fn_day="dayTo" fn_year="yearTo" readonly="<%= isReadOnly%>"/> 
	</td>
 </TR>
 <TR >	
  	<td nowrap > 
      <div align="right">Status : </div>
    </td>
	<td nowrap colspan=2> 
	  <select name="STATUS" <%if(isReadOnly) out.print("disabled");%>>
	  		<option value="1" <% if (!dsr.getStatus().equals("0")) out.print("selected");%>>  Activa  </option> 
		    <option value="0" <% if (dsr.getStatus().equals("0")) out.print("selected");%>>  InActiva  </option> 
      </select>
	</td>
 </TR>
 <TR id="trdark">                    
    <td nowrap > 
      <div align="right">Restringida hasta Nro. Documento : </div>
    </td>
    <td COLSPAN=2>
      <input type="text" name="DOCNUM" size="10" maxlength="8" value="<%= dsr.getDocNum()%>" onKeypress="enterInteger(event)" <%if(isReadOnly) out.print("readonly");%>>
    </td>
 </TR>
 <TR >	
  	<td nowrap > 
      <div align="right">Restringida a la Agencia : </div>
    </td>
	<td nowrap colspan=2> 
      <input type="text" name="BRANCH" size="4" maxlength="4" value="<%= dsr.getBranch()%>" <%if(isReadOnly) out.print("readonly");%>>
       <%if(!isReadOnly){ %>
	  <a href="javascript:GetBranch('BRANCH','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0" ></a>
	  <%} %>
    </td>
 </TR>	        	
</TABLE>
	<br>
 <%if(!isReadOnly){ %>	
  <div align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>
  <%} %>

<SCRIPT type="text/javascript">

 showChecked("TYPEAMT");    
 
 <%                
 if ( error != null ) {
 
     if (!error.equals("1")) {
      	out.println("alert(\" Error de actualizacion. Por favor contacte con el Administardor de sistema\")");
     } else {
        out.println("alert(\" Regla ya existente. Por favor haga otra seleccion\" )");   
 	 }
 	 
 }
 %>
 
</SCRIPT>                

</FORM>

</BODY>
</HTML>
