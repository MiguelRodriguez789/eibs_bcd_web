<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Emisión de Cheques por Desembolso</title>
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
	String rd = "" ;
	try{
		rd = (request.getParameter("RD")==null?"":request.getParameter("RD")) ;
	}catch(Exception e){}

	if( !userPO.getPurpose().equals("NEW") || 
		( userPO.getPurpose().equals("NEW") && rd.equals("1") ) ) { 
%>
<%	} %> 
 
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
     BN2.value=beneficiary.substring(30,beneficiary.length);
   }
     
   if (beneficiary.length > 60 ){
     BN1.value=beneficiary.substring(0,30);
     BN2.value=beneficiary.substring(30,60);
     BN3.value=beneficiary.substring(60,beneficiary.length);
   } 
    return true;

 }
 
 function unLoadBeneficiary(){
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
 
<H3 align="center">
<% if (userPO.getSource().equals("FACT")) {
	out.print("Modificación de Emisi&oacute;n Cheques de Gerencia por Desembolso de Descuento de Documentos"); 
	} else {
	out.print("Modificación de Emisi&oacute;n Cheques de Gerencia por Desembolso de Préstamos");
 } %>

<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="of_chk_basic_lns_mnt.jsp, EOF0115"> 
</H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEOF0115">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="900">
  <input type="hidden" id="E01OFMPTH" name="E01OFMPTH" value="<%=offBasic.getE01OFMPTH()%>" >
  
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Formato :</b></div>
            </td>
            <td nowrap width="7%" > 
              <div align="left"> 
	     	       <eibsinput:text 	name="offBasic" property="E01OFMFTY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CODE %>" readonly="true"/>
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
          <tr id="trdark"> 
            <td nowrap width="26%"> 
              <div align="right">Cheque No. :</div>
            </td>
            <td nowrap width="27%">
     	       <eibsinput:text 	name="offBasic" property="E01OFMCKN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHECK_NUMBER %>" readonly="true"/>
         </td>
            <td nowrap width="24%"> 
              <div align="right">Fecha :</div>
            </td>
            <td nowrap width="23%"> 
				<eibsinput:date name="offBasic" fn_day="E01OFMEMD" fn_month="E01OFMEMM" fn_year="E01OFMEMY" readonly="true"/>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="26%"> 
              <div align="right">Banco / Sucursal : </div>
            </td>
            <td nowrap>
       	       <eibsinput:text 	name="offBasic" property="E01OFMBNK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" readonly="true"/>
              / 
       	       <eibsinput:text 	name="offBasic" property="E01OFMBRN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>" readonly="true"/>
             </td>
            <td nowrap>
              <div align="right">Moneda : </div>
            </td>
            <td nowrap>
       	       <eibsinput:text 	name="offBasic" property="E01OFMCCY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true"/>
           </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="26%" height="19"> 
              <div align="right">Clase de Cheque :</div>
            </td>
            <td nowrap height="19"> 
              <input type="text" readonly name="E01OFMCLS" size="2" maxlength="1" value="<%= offBasic.getE01OFMCLS().trim()%>">
              <a href="javascript:getOffClass('E01OFMCLS','STATIC_of_chk_class.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"  ></a> 
            </td>
            <td nowrap width="26%" height="19"> 
              <div align="right">Cobrar IDB :</div>
            </td>
            <td nowrap width="28%" height="19"> 
              <input type="radio" readonly name="E01OFMFL2" value="Y"  >
              Si 
              <input type="radio" readonly name="E01OFMFL2" value="N" checked >
              No
             </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="26%"> 
              <div align="right">Pagar a la Orden de :</div>
            </td>
			<td nowrap colspan="3">
              <eibsinput:text 	name="offBasic" property="E01OFMBNF" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="false"/>
       	      <BR>
       	       <eibsinput:text 	name="offBasic" property="E01OFMBN1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="false"/>
       	      <Br>
       	       <eibsinput:text 	name="offBasic" property="E01OFMBN2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="false"/>
					<!--textArea id="Aux_E01OFMBNF" name="Aux_E01OFMBNF" cols="80" rows="2" maxlength="90" >
                   <%=offBasic.getE01OFMBNF()+offBasic.getE01OFMBN1()+offBasic.getE01OFMBN2()%>
				</textArea-->
			</td>
			</tr>
          <tr id="trdark"> 
            <td nowrap width="26%" height="23"> 
              <div align="right">Identificación :</div>
            </td>
            <td nowrap height="23" colspan="3">
            <eibsinput:cnofc name="offBasic" flag="34" property="E01OFMTIB" fn_description="" required="false"/>
	         <eibsinput:text	name="offBasic" property="E01OFMBID" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION%>" readonly="false"/>
			</td>
           </tr>
          <tr id="trclear"> 
            <td nowrap width="26%" height="19"> 
              <div align="right">La suma de :</div>
            </td>
            <td nowrap height="19" colspan="3"> 
           <eibsinput:text	name="offBasic" property="E01OFMAMT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="false"/>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="26%" height="19"> 
              <div align="right">Origen/Destino :</div>
            </td>
            <td nowrap height="19" colspan="3">
              <eibsinput:cnofc property="E01OFMCTY" name="offBasic" flag="MO" fn_code="E01OFMCTY" fn_description="D01OFMCTY"/>
			<eibsinput:text property="D01OFMCTY" name="offBasic" readonly="true"/>
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
          <tr id="trdark">  
            <td nowrap width="19%"> 
              <div align="right">Identificaci&oacute;n del Aplicante :</div>
            </td>
            <td nowrap width="22%">
           <eibsinput:text	name="offBasic" property="E01OFMAID" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION%>" readonly="false"/>
           </td>
            <td nowrap width="18%"> 
              <div align="right">Cliente :</div>
            </td>
            <td nowrap width="41%"> 
              <eibsinput:help name="offBasic" property="E01OFMCUN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER%>" 
          	    	fn_param_one="E01OFMCUN" fn_param_two="E01OFMAPL" fn_param_three="E01OFMAID"/>
			</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="19%"> 
              <div align="right">Nombre del Aplicante :</div>
            </td>
            <td nowrap colspan="3">
            <eibsinput:text	name="offBasic" property="E01OFMAPL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="false"/>
             </td>
          </tr>
		  <tr id="trdark"> 
            <td nowrap width="19%"> 
              <div align="right"> </div>
            </td>
            <td nowrap colspan="3"> 
             <eibsinput:text	name="offBasic" property="E01OFMAP1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="false"/>
           </td>
          </tr>

          <tr id="trcleark"> 
            <td nowrap width="19%"> 
              <div align="right">Descripci&oacute;n :</div>
            </td>

<%			if (!offBasic.getE01SELFMT().equals("1")) {  %>
	
            <td nowrap colspan="3"> 
            <eibsinput:text	name="offBasic" property="E01OFMCO1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="false"/>
            </td>

<%			} else {	%>

            <td nowrap colspan="3"> 
           <eibsinput:text	name="offBasic" property="E01OFMCO1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="false"/>
             </td>

<%			} 	%>
         </tr>
 
          <tr id="trdark"> 
            <td nowrap width="19%"> 
              <div align="right">Direcci&oacute;n :</div>
            </td>
            <td nowrap colspan="3">
          <eibsinput:text	name="offBasic" property="E01OFMAD1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="false"/>
              </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="19%"> 
              <div align="right"></div>
            </td>
            <td nowrap colspan="3">
         <eibsinput:text	name="offBasic" property="E01OFMAD2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="false"/>
               </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="19%"> 
              <div align="right"></div>
            </td>
            <td nowrap colspan="3">
          <eibsinput:text	name="offBasic" property="E01OFMAD3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="false"/>
              </td>
          </tr>
          <% if(!userPO.getSource().equals("FACT")) { %>
          <tr id="trclear"> 
            	<td nowrap> 
              		<div align="right">Cuenta de Pago :</div>
            	</td>	  
          	  <td nowrap colspan="3"> 
          	  <table class="tableinfo" style="filter:''">
          		<tr id="trdark"> 
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
          		<tr id="trclear"> 
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
           <% } %>
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
