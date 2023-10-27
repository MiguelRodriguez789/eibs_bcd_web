<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import ="datapro.eibs.master.Util" %>
<HTML>
<HEAD>
<TITLE>
Lista de Cuentas
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "chkbList" class= "datapro.eibs.beans.JBObjList"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>


<SCRIPT type="text/javascript">
  
  function goAction() {
     
     var formLength= document.forms[0].elements.length;
     var ok = false;
     for(var n=0;n<formLength;n++)
      {
      	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "ROW") 
      	{
        		ok = true;
        		break;
      	}
      }
      if ( ok ) 
      {          
      	if (document.forms[0].E02CHUENT.value.trim() != "")      
      	{
	      	if (document.forms[0].E02CHUEIDN.value.trim() != "")
		 	{
			<% if (currUser.getE01INT().equals("18")) {%> 			 	
	 			if (Fun_Valida_Rut())
	 			{
	 	 	      document.forms[0].submit();
	 	  	    }
 	
			<%} else {%> 
                document.forms[0].submit(); 
			<%}%>  	  	 	  	    
	 	  	 }
	 	  	 else
	 	  	 {
			 	window.document.forms[0].E02CHUEIDN.focus();
				window.document.forms[0].E02CHUEIDN.select();
			<% if (currUser.getE01INT().equals("18")) {%>  				
				alert("Debe ingresar el Rut");
			<%} else {%>  
                alert("Debe ingresar la Identificación");
			<%}%>  					   	 	  	 
	 	  	 }
	 	  	 
 	    }
 	    else
		  	if (document.forms[0].E02CHUEIDN.value.trim() != "")
		 	{ 	    
			 	window.document.forms[0].E02CHUENT.focus();
				window.document.forms[0].E02CHUENT.select();
				alert("Debe ingresar el nombre");
 	    	}
 	    
 	  else
 	   {
	 	       document.forms[0].submit(); 	    
 	    }
      }
      else {
 		alert("Seleccione una chequera antes de realizar esta operacion");	   
      }

 }
  
 function goExit(){
    window.location.href="<%=request.getContextPath()%>/pages/background.jsp";
 }
 
 function showAddInfo(idxRow){
   var myTable = getElement("dataTable");
   for ( var i=1; i< myTable.rows.length; i++ ) {
       myTable.rows[i].className="trnormal";
    }    
   myTable.rows[idxRow + 1].className="trhighlight";
   document.forms[0].E02CHUENT.focus();
  } 
    
<% if (currUser.getE01INT().equals("18")) {%>   

function Fun_Valida_Rut()
{	
	var Str_Temp = "";
	var Str_RutInvertido = "";
	var Str_Dtexto = "";


	Str_TextoRut = document.forms[0].E02CHUEIDN.value;
 			 			 
	if (Str_TextoRut == '')
	{//	window.document.forms[0].E02CHUEIDN.focus();
	//	window.document.forms[0].E02CHUEIDN.select();
		return false;
	}
	//Reupera Rut sin puntos ni guiones //
	for ( i=0; i < Str_TextoRut.length ; i++ )
		if ( Str_TextoRut.charAt(i) != ' ' && Str_TextoRut.charAt(i) != '.' && Str_TextoRut.charAt(i) != '-' )
			Str_Temp = Str_Temp + Str_TextoRut.charAt(i);
		         	
	Str_TextoRut = Str_Temp;
	Int_Largo = Str_TextoRut.length;	 
	if (Int_Largo < 2 ) 
	{	alert("Debe ingresar un R.U.T completo.");
		window.document.forms[0].E02CHUEIDN.focus();
		window.document.forms[0].E02CHUEIDN.select();
		return false;
	}
	for (i=0; i < Int_Largo ; i++ )	
	{	if ( Str_TextoRut.charAt(i) !="0" && Str_TextoRut.charAt(i) != "1" && Str_TextoRut.charAt(i) !="2" && Str_TextoRut.charAt(i) != "3" && Str_TextoRut.charAt(i) != "4" && Str_TextoRut.charAt(i) !="5" && Str_TextoRut.charAt(i) != "6" && Str_TextoRut.charAt(i) != "7" && Str_TextoRut.charAt(i) !="8" && Str_TextoRut.charAt(i) != "9" && Str_TextoRut.charAt(i) !="k" && Str_TextoRut.charAt(i) != "K" )
		{	alert("El valor no corresponde a un R.U.T");
			window.document.forms[0].E02CHUEIDN.focus();
			window.document.forms[0].E02CHUEIDN.select();
			return false;
		}
	}
	//Invertir Rut                
	for ( i=(Int_Largo-1); i>=0; i--)
		Str_RutInvertido = Str_RutInvertido + Str_TextoRut.charAt(i);
                 
	Str_Dtexto = Str_Dtexto + Str_RutInvertido.charAt(0);
	Str_Dtexto = Str_Dtexto + '-';
             
	Int_Cnt = 0;
	for ( i=1; i<Int_Largo; i++)  
	{	if ( Int_Cnt == 3 ) 
		{	Str_Dtexto = Str_Dtexto + '.';
			Str_Dtexto = Str_Dtexto + Str_RutInvertido.charAt(i);
			Int_Cnt = 1;
		}
		else 
		{	Str_Dtexto = Str_Dtexto + Str_RutInvertido.charAt(i);
			Int_Cnt++;
		}
	}               
	Str_RutAux = "";
	for ( i=(Str_Dtexto.length-1); i>=0;i--)
		Str_RutAux = Str_RutAux + Str_Dtexto.charAt(i);
	         
	//window.document.forms[0].NameSearch.value  = Str_RutAux;  

	if ( Fun_Chequea_DigVer(Str_TextoRut) )
	{	//window.document.forms[0].NameSearch = Str_TextoRut;  
		//window.document.forms[0].NameSearch.value  = Str_RutAux;  
		return true;
	}
	return false;
}

function Fun_Chequea_DigVer( Str_RutPar )
{	Int_Largo = Str_RutPar.length;

	if ( Int_Largo < 2 )
	{	alert("Debe ingresar un R.U.T completo.");
		window.document.forms[0].E02CHUEIDN.focus();
		window.document.forms[0].E02CHUEIDN.select();
		return false;
	}

	if ( Int_Largo > 2 )
		Str_Rut = Str_RutPar.substring(0, Int_Largo - 1);
	else
		Str_Rut = Str_RutPar.charAt(0);
            
	Str_DigVer = Str_RutPar.charAt(Int_Largo-1);
    
	Fun_Chequea_Valor_DigVer( Str_DigVer );
	if ( Str_Rut == null || Str_DigVer == null )
		return false;

	var Str_DigVer_Valido = '0';
	Int_Suma = 0;
	Int_Multiplo  = 2;

	for (i= Str_Rut.length -1 ; i >= 0; i--)
	{	Int_Suma = Int_Suma + Str_Rut.charAt(i) * Int_Multiplo;
		if (Int_Multiplo == 7)
			Int_Multiplo = 2;
		else    
			Int_Multiplo++;
	}

	Int_Resto = Int_Suma % 11;
	
	if (Int_Resto==1)
		Str_DigVer_Valido = 'k';
	else 
		if (Int_Resto==0)
			Str_DigVer_Valido = '0';
 		else 
		{	Inr_DigVer_Valido = 11-Int_Resto;
			Str_DigVer_Valido = Inr_DigVer_Valido + "";
		}

	if ( Str_DigVer_Valido != Str_DigVer.toLowerCase() )  
	{	alert("El Rut es incorrecto.");
		window.document.forms[0].E02CHUEIDN.focus();
		window.document.forms[0].E02CHUEIDN.select();
		return false;
	}
	return true;
}

function Fun_Chequea_Valor_DigVer( Str_DigVer )
{	Str_DigVerAux = Str_DigVer + "";
	
	if ( Str_DigVerAux != '0' && Str_DigVerAux != '1' && Str_DigVerAux != '2' && Str_DigVerAux != '3' && Str_DigVerAux != '4' && Str_DigVerAux != '5' && Str_DigVerAux != '6' && Str_DigVerAux != '7' && Str_DigVerAux != '8' && Str_DigVerAux != '9' && Str_DigVerAux != 'k'  && Str_DigVerAux != 'K')
	{	alert("Debe ingresar un digito verificador valido.");
		window.document.forms[0].E02CHUEIDN.focus();
		window.document.forms[0].E02CHUEIDN.select();
		return false;
	}
	return true;
}
      

<%}%>  
	
</SCRIPT>

</HEAD>

<BODY>

<% 
 boolean firstTime = true;
 String chk = "";
 int row;
 try {
	  	row = Integer.parseInt(request.getParameter("ROW"));
	  	firstTime = false;
	} 
 catch (Exception e) {
		row = 0;
		firstTime = true;		
	}
	
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     //firstTime = false;
 } 
%>


<h3 align="center">Entrega de Chequera Universal a Clientes
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="chb_delivery_list.jsp,ECH0220">
</h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECH0220" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="9"> 
<%
	if ( chkbList.getNoResult() ) {
%> 

  <TABLE class="tbenter" width=100% height=40%>
   	<TR>
      <TD> 
        <div align="center"> 
          <p>
            <b>No hay resultados que correspondan a su criterio de búsqueda</b>
            <br>
          </p>          
        </div>
      </TD>
     </TR>
   </TABLE>
  <%   		
	}
	else { 
	
	chkbList.initRow();
	chkbList.getNextRow();
	datapro.eibs.beans.ECH022002Message msgChkB = (datapro.eibs.beans.ECH022002Message) chkbList.getRecord();

  %>
  
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <input type="text" name="E02CHUCUN" size="10" maxlength="9" readonly value="<%= msgChkB.getE02CHUCUN().trim()%>">
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E02CHUNA1" size="45" maxlength="45" readonly value="<%= msgChkB.getE02CHUNA1().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E02CHUACC" size="13" maxlength="12" value="<%= msgChkB.getE02SELACC().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E02CHUCCY" size="3" maxlength="3" value="<%= msgChkB.getE02CHUCCY().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E02CHUPRO" size="4" maxlength="4" readonly value="<%= msgChkB.getE02CHUPRO().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <H4>Informaci&oacute;n Relevante</H4>
  <table  class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Cliente ID.</div>
            </td>
            <td nowrap> 
              <input type="text" name="E02CHUIDN" size="15" readonly value="<%= msgChkB.getE02CHUIDN().trim()%>">
            </td>
            <td nowrap> 
              <div align="right">Tipo ID. :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E02CHUTID" size="4" readonly value="<%= msgChkB.getE02CHUTID().trim()%>">
            </td>
            <td nowrap> 
              <div align="right">Pais :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E02CHUPID" size="4" readonly value="<%= msgChkB.getE02CHUPID().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Stock Minimo :</div>
            </td>
            <td nowrap colspan=2> 
              <input type="text" name="E02CHUMSK" size="10" value="<%= msgChkB.getE02CHUMSK().trim()%>" readonly>
            </td>
            <td nowrap> 
              <div align="right">Saldo Contable :</div>
            </td>
            <td nowrap colspan=2> 
              <input type="text" name="E02CHUMGB" size="10" value="<%= msgChkB.getE02CHUMGB().trim()%>" readonly>
            </td>            
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Stock Actual :</div>
            </td>
            <td nowrap colspan=2> 
              <input type="text" name="E02CHUASK" size="10" value="<%= msgChkB.getE02CHUASK().trim()%>" readonly>
            </td>
            <td nowrap> 
              <div align="right">Saldo Disponible :</div>
            </td>
            <td nowrap colspan=2> 
              <input type="text" name="E02CHUMNB" size="10" value="<%= msgChkB.getE02CHUMNB().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Veces Sobregiro :</div>
            </td>
            <td nowrap colspan=2> 
              <input type="text" name="E02CHUNRY" size="10" value="<%= msgChkB.getE02CHUNRY().trim()%>" readonly>
            </td>
            <td nowrap> 
              <div align="right">Fecha Sobregiro :</div>
            </td>
            <td nowrap colspan=2>
            	<eibsinput:date name="msgChkB" fn_month="E02LSTODM" fn_day="E02LSTODD" fn_year="E02LSTODY" readonly="true" /> 
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap > 
              <div align="right">Con Cobro :</div>
            </td>
            <td nowrap colspan=2>
              <select name="E02CHUCBC">
                <option value="N" <%if (msgChkB.getE02CHUCBC().equals("N")) out.print("selected"); %>>NO</option>
                <option value="Y" <% if (msgChkB.getE02CHUCBC().equals("Y")) out.print("selected"); %>>SI</option>
              </select>
            </td>
            <td nowrap> 
              <div align="right">Fecha Apertura :</div>
            </td>
            <td nowrap colspan=2> 
            	<eibsinput:date name="msgChkB" fn_month="E02OPNDTM" fn_day="E02OPNDTD" fn_year="E02OPNDTY" readonly="true" /> 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
     
  <TABLE class="tbenter" width="60%" align=center>
    <TR> 
      <TD class=TDBKG width="50%"> 
        <div align="center"><a href="javascript:goAction('A')" id="linkApproval">Entregar</a> 
        </div>
      </TD>
      <TD class=TDBKG width="50%"> 
        <div align="center"><a href="javascript:goExit()">Salir</a> </div>
      </TD>
    </TR>
  </TABLE>
  
 <TABLE  id="mainTable" class="tableinfo" >
 <TR> 
    <TD NOWRAP valign=top>
  	 <TABLE id="dataTable" width="100%">
  		<TR id="trdark"> 
    		<TH ALIGN=CENTER ></TH>
    		<TH ALIGN=CENTER >Tipo<br>Chequera</TH>
    		<TH ALIGN=CENTER >Cheques</TH>    
    		<TH ALIGN=CENTER >Número<br>de Chequera</TH>
    		<TH ALIGN=CENTER >Cheque<br>Inicial</TH>
    		<TH ALIGN=CENTER >Cheque<br>Final</TH>
  		</TR>
     <%
                chkbList.initRow();                
                while (chkbList.getNextRow()) {
                  if (firstTime) {
						firstTime = false;
						chk = "checked";
				  }
				  else {
						if (chkbList.getCurrentRow() == row )
							chk = "checked";
						else 
							chk = "";
				  }
                  msgChkB = (datapro.eibs.beans.ECH022002Message) chkbList.getRecord();
     %>               
        <TR>
			<TD NOWRAP width="2%"><input type="radio" name="ROW" value="<%= chkbList.getCurrentRow()%>" <%=chk%>  onclick="showAddInfo(<%= chkbList.getCurrentRow()%>)"></TD>
			<TD NOWRAP ALIGN="CENTER"><%= Util.formatCell(msgChkB.getE02CHUTCB())%></TD>
			<TD NOWRAP ALIGN="CENTER"><%= Util.formatCell(msgChkB.getE02CHUNTC())%></TD>
			<TD NOWRAP ALIGN="CENTER"><%= Util.formatCell(msgChkB.getE02CHUNCB())%></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgChkB.getE02CHUICK())%></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgChkB.getE02CHUFCK())%></TD>
		</TR>    		
    <%                  
                }
    %> 
   
  </TABLE>
    </TD>
     <TD valign=top>
        <TABLE  border = "0" width="100%" >
          <TR id="trdark"> 
            <TH ALIGN=CENTER colspan=2>Entregado a 
               </TH>
          </TR>
          <TR> 
            <td ALIGN=right>Nombre</td>
            <td> 
              <input type="text" name="E02CHUENT" size="60" maxlength="60" value="<%= msgChkB.getE02CHUENT().trim()%>">
            </td>
          </TR>
          <TR> 

		<% if (currUser.getE01INT().equals("18")) {%> 
            <td ALIGN=right>Rut</td>
            <td> 
              <input type="text" name="E02CHUEIDN" size="15" maxlength="15" onblur="Fun_Valida_Rut();">
            </td>
        <%} else {%>           
            <td ALIGN=right>Identificaci&oacute;n</td>
            <td> 
              <input type="text" name="E02CHUEIDN" size="15" maxlength="15" value="<%= msgChkB.getE02CHUEIDN().trim()%>">
            </td>
		<%}%> 
          </TR>
          <TR> 
            <td ALIGN=right></td>
            <td> 
              <input type="hidden" name="E02CHUETID" size="4" maxlength="4" value="<%= msgChkB.getE02CHUETID().trim()%>">
              <!--    		    <a href="javascript:GetCodeCNOFC('E02CHUETID','34')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a>           --> 
            </td>
          </TR>
          <TR> 
            <td  ALIGN=right ></td>
            <td> 
<%--               <input type="hidden" name="E02CHUEIDN" size="4" maxlength="4" value="<%= msgChkB.getE02CHUEIDN().trim()%>">
 --%>              <!--    		    <a href="javascript:GetCodeCNOFC('E02CHUEPID','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a>             --> 
            </td>
          </TR>
        </TABLE>
            </TD>
        </TR>	
</TABLE>

<SCRIPT type="text/javascript">
  showChecked("ROW");       
</SCRIPT>

<%   		
	} 
 %>
</FORM>

</BODY>
</HTML>
