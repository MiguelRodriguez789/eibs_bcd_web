<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Emisión de Giros</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id= "offBasic" class= "datapro.eibs.beans.EOF011501Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>



<SCRIPT type="text/javascript">

<%
// 	String rd = "" ;
//	try{
//		rd = (request.getParameter("RD")==null?"":request.getParameter("RD")) ;
//	}catch(Exception e){}

//	if( !userPO.getPurpose().equals("NEW") || 
//		( userPO.getPurpose().equals("NEW") && rd.equals("1") ) ) { 
%>
//			builtNewMenu(of_np_opt);
//			initMenu();
<%//} %> 

 function loadBeneficiary(){
   
   var beneficiary = document.getElementById("Aux_E01OFMBNF").value;
   var BN1 = document.getElementById("E01OFMBNF");
   var BN2 = document.getElementById("E01OFMBN1");
   var BN3 = document.getElementById("E01OFMBN2");
   
   BN1.value = ' ';
   BN2.value=' ';
   BN3.value=' ' ;

   if (beneficiary.length > 0 && beneficiary.length <= 30)
     BN1.value=beneficiary.substring(0,beneficiary.length);

   
   if (beneficiary.length > 30 && beneficiary.length <= 60){

     BN1.value=beneficiary.substring(0,30);
     /*
     if (BN1.value.charAt(29) == ' ')
       BN1.value = BN1.value.substring(0,29) + '*';
     */  
     BN2.value=beneficiary.substring(30,beneficiary.length);
     /*
      if (BN2.value.charAt(0) == ' ')
       BN2.value = '*' + BN2.value.substring(1,BN2.value.length);
       */
   }
     
   if (beneficiary.length > 60 ){
     BN1.value=beneficiary.substring(0,30);
     BN2.value=beneficiary.substring(30,60);
     BN3.value=beneficiary.substring(60,beneficiary.length);
     /*
     if (BN1.value.charAt(29) == ' ')
       BN1.value = BN1.value.substring(0,29) + '*';
       
     if (BN2.value.charAt(0) == ' ')
       BN2.value = '*' + BN2.value.substring(1,BN2.value.length);
     if (BN2.value.charAt(29) == ' ')
       BN2.value = BN2.value.substring(0,BN2.value.length - 1) + '*'; 
       
      if (BN3.value.charAt(0) == ' ')
       BN3.value = '*' + BN3.value.substring(1,BN3.value.length);   
       */
   } 
    //alert(BN1.value + BN2.value+BN3.value);
    return true;

 }
 
 function unLoadBeneficiary(){
   //var BN1 = document.getElementById("E01OFMBNF").value;
   //var BN2 = document.getElementById("E01OFMBN1").value;
   //var BN3 = document.getElementById("E01OFMBN2").value;
   <%
     String concatValue = offBasic.getE01OFMBNF()+offBasic.getE01OFMBN1()+offBasic.getE01OFMBN2();
     concatValue=concatValue.replace('*',' ');
   %>
   document.getElementById("Aux_E01OFMBNF").value='<%=concatValue%>';
 } 
 

function delEnterKey(evt){
    evt = (evt)? evt: ((window.event) ? window.event : "");
    var key = 0;
    key = (evt.keyCode)? evt.keyCode: evt.charCode ;
    // Verifica que el usuarion no teclee enter.
    if (key >= 9 && key <=13){
     //alert ("key :"+key+ ", lenght :"+this.value.length);
     this.value= this.value.substring(0,this.value.length - 1);
    }
    
    if ( key == 32  && this.value.charAt(this.value.length - 2) == ' ')
      this.value= this.value.substring(0,this.value.length - 1);
    
   if (key == 188){
     this.value= this.value + ' ';
   }
   
   checkMaxLength(evt);
   
}
 
 function checkMaxLength(evt)
{
    //alert ("in");
    evt = (evt)? evt: ((window.event) ? window.event : "");
 
	var maxLength = this.getAttribute('maxlength');
	var currentLength =  this.value.length;
	if (currentLength > maxLength - 1 )
		this.value = this.value.substring(0,maxLength-1);
}
 
   
</SCRIPT>

</head>


<body >
<% 
 if ( !error.getERRNUM().equals("0")  ) {
 	  error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%> 
 
<% int row = 0;%>
 
<H3 align="center">Ingreso de Orden de Pago<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="of_chk_basic_giro.jsp, EOF0115"> 
</H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEOF0115">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Formato :</b></div>
            </td>
            <td nowrap width="7%" > 
              <div align="left"> 
  		          <eibsinput:text 	name="offBasic" property="E01OFMFTY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_TABLE %>" readonly="true"/>
              </div>
            </td>
            <td nowrap colspan="3" width="77%" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
       	       <eibsinput:text 	name="offBasic" property="E01OFMDSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
  
                </font></font></font></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
 <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%"> 
              <div align="right">Orden No. :</div>
            </td>
            <td nowrap width="30%">
               <eibsinput:text 	name="offBasic" property="E01OFMCKN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHECK_NUMBER %>" readonly="true"/>
            </td>
            <td nowrap width="20%"> 
              <div align="right">Fecha :</div>
            </td>
            <td nowrap width="30%"> 
				<eibsinput:date name="offBasic" fn_day="E01OFMEMD" fn_month="E01OFMEMM" fn_year="E01OFMEMY" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%"> 
              <div align="right">Banco / Sucursal : </div>
            </td>
            <td nowrap width="30%">
        	 <eibsinput:text 	name="offBasic" property="E01OFMBNK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" readonly="true"/>
              / 
       	     <eibsinput:text 	name="offBasic" property="E01OFMBRN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>" readonly="true"/>
                </td>
            <td nowrap width="20%">
              <div align="right">Moneda : </div>
            </td>
            <td nowrap width="30%">
      	       <eibsinput:text 	name="offBasic" property="E01OFMCCY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true"/>
             </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

<h4>Beneficiario</h4>
 <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%"> 
              <div align="right">Pagar a la Orden de :</div>
            </td>
			<td nowrap width="30%">
	           <eibsinput:text 	name="offBasic" property="E01OFMBNF" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NARRATIVE%>" readonly="false"/>
				<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" > <br>   
       	       <eibsinput:text 	name="offBasic" property="E01OFMBN1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NARRATIVE %>" readonly="false"/> <br>
       	       <eibsinput:text 	name="offBasic" property="E01OFMBN2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NARRATIVE%>" readonly="false"/>      	       
			</td>
            <td nowrap width="20%"> 
              <div align="right"> </div>
            </td>
            <td nowrap width="30%"> 
 	       </td>
			</tr>           
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%"> 
              <div align="right">Identificación :</div>
            </td>
            <td nowrap width="30%">
             <eibsinput:cnofc name="offBasic" flag="34" property="E01OFMTIB" fn_description="" required="false"/>
             <eibsinput:text	name="offBasic" property="E01OFMBID" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION%>" readonly="false"/>
				<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" >             
             </td>
            <td nowrap width="20%"> 
              <div align="right"> </div>
            </td>
            <td nowrap width="30%"> 
 	       </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%"> 
              <div align="right">La suma de :</div>
            </td>
            <td nowrap width="30%" > 
             <eibsinput:text	name="offBasic" property="E01OFMAMT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="false"/>
			<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" >             
         	 </td>
            <td nowrap width="20%"> 
              <div align="right"> </div>
            </td>
            <td nowrap width="30%"> 
 	       </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

<h4>Datos de la Transacci&oacute;n</h4>
<table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%"> 
              <div align="right">Identificaci&oacute;n del Aplicante :</div>
            </td>
            <td nowrap width="30%">
             <eibsinput:text	name="offBasic" property="E01OFMAID" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION%>" readonly="true"/>
          </td>
            <td nowrap width="20%"> 
              <div align="right">Cliente :</div>
            </td>
            <td nowrap width="30%"> 
              <eibsinput:help name="offBasic" property="E01OFMCUN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER%>" 
          	    	fn_param_one="E01OFMCUN" fn_param_two="E01OFMAPL" fn_param_three="E01OFMAID" />
			<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" >          	    	
			</td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%"> 
              <div align="right">Nombre del Aplicante :</div>
            </td>
            <td nowrap width="30%" colspan="3">
             <eibsinput:text	name="offBasic" property="E01OFMAPL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NARRATIVE%>" readonly="true"/>
           </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%"> 
              <div align="right">Motivo :</div>
            </td>
            <td nowrap width="30%" colspan="3">
               <eibsinput:cnofc name="offBasic" flag="MO" property="E01OFMCTY" fn_description="D01OFMCTY" required="true"/>
               <eibsinput:text name="offBasic" property="D01OFMCTY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%"> 
              <div align="right"> </div>
            </td>
            <td nowrap width="30%"> 
 	       </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            	<td nowrap width="20%"> 
              		<div align="right">Cuenta de Pago :</div>
            	</td>	  
          	  <td nowrap colspan="3"> 
          	  <table class="tableinfo" style="filter:''">
	          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            		<td width="31%"> 
              		<div align="center">Concepto</div>
            		</td>
            		<td width="5%"> 
              		<div align="center">Banco</div>
            		</td>
            		<td width="13%" > 
              		<div align="center">Sucursal</div>
            		</td>
            		<td width="12%" > 
              		<div align="center">Moneda</div>
            		</td>
            		<td width="21%" > 
              		<div align="center">Referencia</div>
            		</td>
          		</tr>
	          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            		<td width="31%" > 
              		<div align="center" > 
                		<input type=text name="E01DEBOPC" id="E01DEBOPC" value="<%= offBasic.getE01DEBOPC().trim()%>" size="3" maxlength="3">
                		<input type=HIDDEN name="E01DEBGLN" value="<%= offBasic.getE01DEBGLN().trim()%>">
                		<input type="text" name="E01DEBCON" size="25" maxlength="25" readonly value="<%= offBasic.getE01DEBCON().trim()%>" >
              		</div>
            		</td>
            		<td width="5%" > 
              		<div align="center"> 
                		<input type="text" name="E01DEBBNK" id="E01DEBBNK" size="2" maxlength="2" value="<%= offBasic.getE01DEBBNK().trim()%>">
              		</div>
            		</td>
            		<td width="13%"> 
              		<div align="center"> 
                		<input type="text" name="E01DEBBRN" size="4" maxlength="4" value="<%= offBasic.getE01DEBBRN().trim()%>"
						class="context-menu-help" onmousedown="init(branchHelp,this.name,document.getElementById('E01DEBBNK').value,'','','','')">
              		</div>
            		</td>
            		<td width="12%" > 
              		<div align="center">
                		<input type="text" name="E01DEBCCY" size="3" maxlength="3" value="<%= offBasic.getE01DEBCCY().trim()%>"
                		class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.getElementById('E01DEBBNK').value,'','','','')"> 
              		</div>
            		</td>
            		<td width="21%" > 
              		<div align="center"> 
                		<input type="text" name="E01DEBACC" size="14" maxlength="12" value="<%= offBasic.getE01DEBACC().trim()%>" onKeypress="enterInteger(event)"
                 		class="context-menu-help" onmousedown="init(accountHelp,this.name,document.getElementById('E01DEBBNK').value,'','','','RT')">
              		 </div>
            		</td>
          		</tr>
        	</table>
        	</td>
           </tr>
        </table>
        
      </td>
    </tr>
  </table>

	    <div align="center"> 
    	  <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
   		</div>

</form>
<script type="text/javascript">
  //window.onload=unLoadBeneficiary;
  //document.forms[0].onsubmit=loadBeneficiary;
  //document.getElementById("Aux_E01OFMBNF").onkeypress=checkMaxLength;
  //document.getElementById("Aux_E01OFMBNF").onkeyup=delEnterKey;
</script>
</body>
</html>
