<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import="datapro.eibs.master.Util" %>
<HTML>
<HEAD>
<META http-equiv="Pragma" content="No-cache">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id="msgRT" class="datapro.eibs.beans.ERA011001Message"	scope="session" />
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript">
<% String more = "+"; %>
function hideUnHide(fld){
//alert(fld);
//alert(getElement(fld).value);
var j = getElement(fld).value;
    try {
        var myTable = document.all['select'];
     	maxRow = myTable.rows.length;
     	for (i= 0; i < maxRow;i++) {
		var fld2 = fld+i;
	    try {
			if	(j =="+") {
				getElement(fld2).style.display="";
			}else{
				getElement(fld2).style.display="none";
			}
		    }
		    catch(e) {
		    }
      	}     	
    }
    catch(e) {
    }
    try {
		if	(j =="+") {
			getElement(fld).value="-";
		}else{
			getElement(fld).value="+";
		}
	    }
	    catch(e) {
	    }
}

function asigChk(chk, fld) {	
	var CHK = "document.forms[0]."+chk+".checked" ;

    try {
        var myTable = document.all['select'];
     	maxRow = myTable.rows.length;
     	for (i= 0; i < maxRow;i++) {
	    try {
			if (eval(CHK) == true) {
				eval("document.forms[0].CHK"+fld+i+".checked = true");
			} else {
				eval("document.forms[0].CHK"+fld+i+".checked = false");
			}
	    }
		    catch(e) {
	    }
      	}     	
    }
    catch(e) {
    }
}

function GetTableLevels(codtbl, tablv1, dtablv1, tablv2, dtablv2, tablv3, dtablv3, tablv4, dtablv4, tablv5, dtablv5, parm1, parm2) {
   	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0720?codtbl=" + codtbl+"&parm1=" + parm1+"&parm2=" + parm2;
	fieldName = codtbl;
	fieldAux1 = tablv1;
	fieldAux2 = dtablv1;
	fieldAux3 = tablv2;
	fieldAux4 = dtablv2;
	fieldAux5 = tablv3;
	fieldAux6 = dtablv3;
	fieldAux7 = tablv4;
	fieldAux8 = dtablv4;
	fieldAux9 = tablv5;
	fieldAux10 = dtablv5;
	CenterWindow(page, 600, 300, 2);
}
	
function goConfirm() {	
	document.forms[0].submit();		  	
}

</script>
<TITLE></TITLE>
</HEAD>
<jsp:useBean id= "EDP0183HELP" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<BODY>
<h3 align="center">Selección de Garantías para Generar Reporte en Excel
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="select_proposals_inq,ERA0110"></h3>
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0110" >
  <p> 
    <input type=HIDDEN name="SCREEN" value="2">
  </p>
<%
	if ( EDP0183HELP.getNoResult() ) {
%>
 		<TABLE class="tbenter" width=100% height=100%>
 		<TR>
      <TD> 
        
      <div align="center"> <font size="3"><b> No hay datos que correspondan con su criterio de Búsqueda</b></font> 
      </div>
      </TD></TR>
   		</TABLE>
<%
	}
	else {
%>
     <table cellspacing="0" cellpadding="2" class="tbenter"  border=0  width=70% align="center" >
      <tr valign="middle"> 
        <td nowrap colspan="2">&nbsp;</td>
      </tr>
       <tr valign="middle"> 
        <td nowrap width=30% align="right" >
          N&uacute;mero de Cliente : 
        </td>
        <td nowrap width=70% align="left"> 
            <input type=TEXT name="E01CUSNUM" size=16 maxlength=9 onKeypress="enterInteger()">
            <input type=TEXT name="D01CUSNUM" size=60 maxlength=60 readonly>
            <a href="javascript:GetCustomerDescId('E01CUSNUM','D01CUSNUM','')">
            <img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." border="0" ></a>
        </td>
      </tr>
      <tr valign="middle"> 
        <td nowrap width=30% align="right" >
          Rango de Montos de Garantía. Mínimo : 
        </td>
        <td nowrap width=70% align="left"> 
		<eibsinput:text property="E01MCOLIN" name="E01MCOLIN" size="17" maxlength="17" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DECIMAL %>" />
		Máximo :
		<eibsinput:text property="E01MCOLSU" name="E01MCOLSU" size="17" maxlength="17" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DECIMAL %>" />
        </td>
      </tr>
      <tr valign="middle"> 
        <td nowrap width=30% align="right" >
          % Cobertura Garantía. Mínimo : 
        </td>
        <td nowrap width=70% align="left">
		<eibsinput:text property="E01PCOBIN" name="E01PCOBIN" size="7" maxlength="6" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DECIMAL %>" />
		Máximo :
		<eibsinput:text property="E01PCOBSU" name="E01PCOBSU" size="7" maxlength="6" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DECIMAL %>" />
        </td>
      </tr>
      <tr valign="middle"> 
        <td nowrap width=30% align="right" >
          Rango de Saldos de Garantía. Mínimo : 
        </td>
        <td nowrap width=70% align="left"> 
		<eibsinput:text property="E01BCOLIN" name="E01BCOLIN" size="17" maxlength="17" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DECIMAL %>" />
		Máximo :
		<eibsinput:text property="E01BCOLSU" name="E01BCOLSU" size="17" maxlength="17" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DECIMAL %>" />
        </td>
      </tr>
      <tr valign="middle"> 
        <td nowrap width=30% align="right" >
          Rango de Fecha Revisión. Inicial : 
        </td>
        <td nowrap width=70% align="left"> 
			<input type=TEXT name="E01FREVDI" value="<%= msgRT.getE01FREVDI() %>" size=3 maxlength=2 onKeypress="enterInteger()" >  
            <input type=TEXT name="E01FREVMI" value="<%= msgRT.getE01FREVMI() %>" size=3 maxlength=2 onKeypress="enterInteger()" > 
            <input type=TEXT name="E01FREVYI" value="<%= msgRT.getE01FREVYI() %>" size=5 maxlength=4 onKeypress="enterInteger()" >
            <A href="javascript:DOBPicker(document.forms[0].E01FREVMI,document.forms[0].E01FREVDI,document.forms[0].E01FREVYI)"><IMG
			src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" border="0"> </A>
          Final : 
			<input type=TEXT name="E01FREVDF" value="<%= msgRT.getE01FREVDF() %>" size=3 maxlength=2 onKeypress="enterInteger()" >  
            <input type=TEXT name="E01FREVMF" value="<%= msgRT.getE01FREVMF() %>" size=3 maxlength=2 onKeypress="enterInteger()" > 
            <input type=TEXT name="E01FREVYF" value="<%= msgRT.getE01FREVYF() %>" size=5 maxlength=4 onKeypress="enterInteger()" >
            <A href="javascript:DOBPicker(document.forms[0].E01FREVMF,document.forms[0].E01FREVDF,document.forms[0].E01FREVYF)"><IMG
			src="<%=request.getContextPath()%>/images/calendar.gif" alt="help"> </A>
        </td>
      </tr>

      <tr valign="middle"> 
        <td nowrap width=30% align="right" >
              <div align="right">Ubicación Garantía : </div>
        </td>
        <td nowrap width=70% align="left"> 
<%-- 
            <eibsinput:cnofc name="msgRT" flag="03" property="E01DIRCOU" fn_description="D01DIRCOU" value="CO" />
            Parroquia:
            <input type="text" name="E01DIRPAR" size="5" maxlength="4" />
			<a href="javascript:GetTableLevels('85','E01DIRPRO','D01DIRPRO','E01DIRCAN','D01DIRCAN','E01DIRPAR','D01DIRPAR','','','','',document.forms[0]['E01DIRCOU'].value,'')">
			<img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a>
--%>
			Departamento :
			<input type="text" name="E01DIRPRO" size="5" maxlength="4" value="" />
   			<a href="javascript:Get2FilterCodes('E01DIRPRO','D01R01DPR','27','','')">
			<img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0">
			</a>
			<input type="text" name="D01R01DPR" size="25" maxlength="25" value="" readonly/>
			Ciudad :
			<input type="text" name="E01DIRCAN" size="6" maxlength="5" />
   			<a href="javascript:Get2FilterCodes('E01DIRCAN','D01DIRCAN','84',' ',document.forms[0].E01DIRPRO.value)">
			<img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0">
			</a>
			<input type="text" name="D01DIRCAN" size="25" maxlength="25" value="" readonly/>
        </td>
      </tr>
      <tr valign="middle"> 
        <td nowrap width=30% align="right" >
        </td>
        <td nowrap width=70% align="left"> 
          <eibsinput:text name="msgRT" property="D01DIRCOU" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT %>" readonly="true" />
          <eibsinput:text name="msgRT" property="D01DIRPAR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT %>" readonly="true" />
          <eibsinput:text name="msgRT" property="D01DIRCAN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT %>" readonly="true" />
          <eibsinput:text name="msgRT" property="D01DIRPRO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT %>" readonly="true"/>
        </td>
      </tr>
      <tr valign="middle"> 
        <td nowrap width=30% align="right" >
              <div align="right">Número de Notaría : </div>
        </td>
        <td nowrap width=70% align="left"> 
		<eibsinput:text name="msgRT" property="E01NUMNOT"  eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>"/>
        </td>
      </tr>
      <tr valign="middle"> 
        <td nowrap width=30% align="right" >
          Rango Fecha de Constitución. Inicial : 
        </td>
        <td nowrap width=70% align="left"> 
			<input type=TEXT name="E01FCONDI" value="<%= msgRT.getE01FCONDI() %>" size=3 maxlength=2 onKeypress="enterInteger()" >  
            <input type=TEXT name="E01FCONMI" value="<%= msgRT.getE01FCONMI() %>" size=3 maxlength=2 onKeypress="enterInteger()" > 
            <input type=TEXT name="E01FCONYI" value="<%= msgRT.getE01FCONYI() %>" size=5 maxlength=4 onKeypress="enterInteger()" >
            <A href="javascript:DOBPicker(document.forms[0].E01FCONMI,document.forms[0].E01FCONDI,document.forms[0].E01FCONYI)"><IMG
			src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" border="0"> </A>
          Final : 
			<input type=TEXT name="E01FCONDF" value="<%= msgRT.getE01FCONDF() %>" size=3 maxlength=2 onKeypress="enterInteger()" >  
            <input type=TEXT name="E01FCONMF" value="<%= msgRT.getE01FCONMF() %>" size=3 maxlength=2 onKeypress="enterInteger()" > 
            <input type=TEXT name="E01FCONYF" value="<%= msgRT.getE01FCONYF() %>" size=5 maxlength=4 onKeypress="enterInteger()" >
            <A href="javascript:DOBPicker(document.forms[0].E01FCONMF,document.forms[0].E01FCONDF,document.forms[0].E01FCONYF)"><IMG
			src="<%=request.getContextPath()%>/images/calendar.gif" alt="help"> </A>
        </td>
      </tr>
      <tr valign="middle"> 
        <td nowrap width=30% align="right" >
          Rango de Costos Legales. Mínimo : 
        </td>
        <td nowrap width=70% align="left"> 
		<eibsinput:text property="E01MLCOIN" name="E01MLCOIN" size="17" maxlength="17" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DECIMAL %>" />
		Máximo :
		<eibsinput:text property="E01MLCOSU" name="E01MLCOSU" size="17" maxlength="17" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DECIMAL %>" />
        </td>
      </tr>
      <tr valign="middle"> 
        <td nowrap width=30% align="right" >
          Vigencia de Seguros Relacionados Desde: 
        </td>
        <td nowrap width=70% align="left"> 
			<input type=TEXT name="E01FVINDI" value="<%= msgRT.getE01FVINDI() %>" size=3 maxlength=2 onKeypress="enterInteger()" >  
            <input type=TEXT name="E01FVINMI" value="<%= msgRT.getE01FVINMI() %>" size=3 maxlength=2 onKeypress="enterInteger()" > 
            <input type=TEXT name="E01FVINYI" value="<%= msgRT.getE01FVINYI() %>" size=5 maxlength=4 onKeypress="enterInteger()" >
            <A href="javascript:DOBPicker(document.forms[0].E01FVINMI,document.forms[0].E01FVINDI,document.forms[0].E01FVINYI)"><IMG
			src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" border="0"> </A>
          Hasta : 
			<input type=TEXT name="E01FVINDF" value="<%= msgRT.getE01FVINDF() %>" size=3 maxlength=2 onKeypress="enterInteger()" >  
            <input type=TEXT name="E01FVINMF" value="<%= msgRT.getE01FVINMF() %>" size=3 maxlength=2 onKeypress="enterInteger()" > 
            <input type=TEXT name="E01FVINYF" value="<%= msgRT.getE01FVINYF() %>" size=5 maxlength=4 onKeypress="enterInteger()" >
            <A href="javascript:DOBPicker(document.forms[0].E01FVINMF,document.forms[0].E01FVINDF,document.forms[0].E01FVINYF)"><IMG
			src="<%=request.getContextPath()%>/images/calendar.gif" alt="help"> </A>
        </td>
      </tr>
      <tr valign="middle"> 
        <td nowrap width=30% align="right" >
          Rango de Primas de Seguros. Mínimo : 
        </td>
        <td nowrap width=70% align="left"> 
		<eibsinput:text property="E01MPININ" name="E01MPININ" size="17" maxlength="17" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DECIMAL %>" />
		Máximo :
		<eibsinput:text property="E01MPINSU" name="E01MPINSU" size="17" maxlength="17" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DECIMAL %>" />
        </td>
      </tr>
      <tr valign="middle"> 
        <td nowrap width=30% align="right" > 
          Relacionar Documentos Digitalizados de Garantías : 
        </td>
        <td nowrap width=70% align="left">  
   		<INPUT type="checkbox" name="E01INCDDG"  value="1">
		</td>
      </tr>

 </table>
 <br>
 <h3>Selección Multiple </h3>
  <TABLE class="tableinfo" id = "select" style="width:95%" ALIGN=CENTER>
  
     	<%
        EDP0183HELP.initRow(); 
		boolean firstTime = true;
		String chk = "";
		String level = "";
		int i = 0;
        while (EDP0183HELP.getNextRow()) {
			if (firstTime) {
				firstTime = false;
				chk = "checked";
			} else {
				chk = "";
			}
           datapro.eibs.beans.EDP018301Message msg = (datapro.eibs.beans.EDP018301Message) EDP0183HELP.getRecord();
			if (level == "") {
				level = msg.getE01TABLVL();
			}
     	%>               
        
<%-- 
<table id="lev1<%= i %>" style="display:''">
--%>

<% 
  if (msg.getE01TABLVL().trim().equals("1")) {
%>
<tr id="TRH<%= msg.getE01TABCFL()%><%=i %>" style="display:''">
<%}else{ %>
<tr id="TR<%= msg.getE01TABCFL()%><%=i %>" style="display:none">
<%} %>
			<td NOWRAP>
			<div align="center">
<% 
  if (msg.getE01TABLVL().trim().equals("1")) {
%>
			<input type=hidden name="TR<%= msg.getE01TABCFL()%>" size="1" value="<%= more%>" > 
			<a href="javascript:hideUnHide('TR<%= msg.getE01TABCFL()%>')"><b><img src="<%=request.getContextPath()%>/images/ico3.gif" alt=". . ." border="0" ></b> </a>
<%} %>
			</div>
			</td>
			<td NOWRAP>
			<input type=HIDDEN name="TAB<%=i %>" value="<%= msg.getE01TABCFL()%>"> 
<% 
  if (msg.getE01TABLVL().trim().equals("1")) {
%>
      		<INPUT type="checkbox" name="CHKH<%= i %>" 
   			<%if (msg.getField("E01TABSEL").getString().trim().equals("1")) out.print("checked");%> checked onClick="asigChk('CHKH<%= i %>','<%= msg.getE01TABCFL()%>');">
<%} %>
   			</td>
			<td NOWRAP>
<% 
  if (msg.getE01TABLVL().trim().equals("2")) {
%>
      		<INPUT type="checkbox" name="CHK<%= msg.getE01TABCFL()%><%= i %>" onClick="deAsigChk('CHKH<%= i %>','<%= msg.getE01TABCFL()%>');"
   			<%if (msg.getField("E01TABSEL").getString().trim().equals("1")) out.print("checked");%> >
<%} %>
   			</td>
			<input type=HIDDEN name="RECTAB<%=i %>" value="<%= msg.getE01TABRCD()%>"> 
			<td NOWRAP><%=Util.formatCell(msg.getE01TABRCD())%></td>
<% 
  if (msg.getE01TABLVL().trim().equals("1")) {
%>
			<td NOWRAP><h4><%=Util.formatCell(msg.getE01TABDSC())%></h4></td>
<%}else{ %>
			<td NOWRAP><%=Util.formatCell(msg.getE01TABDSC())%></td>
<%} %>
	</tr>
   	<%i++;}%>   
	         <input type="HIDDEN" name="RECNUM" value="<%= i %>">
  </TABLE>
   	<%}%>   
      <tr> 
        <td nowrap colspan="2" valign="middle" height="100"> 
			<div align="center"> 
			<INPUT id="EIBSBTN" type="button" name="Submit" value="Enviar" onclick="goConfirm()"></div>
        </td>
      </tr>
      <tr> 
        <td nowrap colspan="2" valign="middle">&nbsp;</td>
      </tr>

<h3 align="center">El resultado de la lista de garantías se generara en Excel en la bandeja de impresion</h3>
</FORM>

</BODY>
</HTML>