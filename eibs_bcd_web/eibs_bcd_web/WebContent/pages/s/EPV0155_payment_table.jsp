<%@ page import="datapro.eibs.sockets.DecimalField" %>
<jsp:useBean id="header" class="datapro.eibs.beans.EPV015501Message" scope="session" />
<jsp:useBean id="list" class="datapro.eibs.beans.JBListRec" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<table class="tableinfo" style="max-height:400px">
   <tr > 
     <td NOWRAP valign="top" width="100%"> 
    	<table id="headTable" width="100%">
	    <tr id="trdark">
	      <th align=center width="5%">
	        <input type="checkbox" name="SELALL" value="" onclick="setSelection(this.checked)">
	      </th>
	      <th nowrap width="5%"> 
	        <div align="center">N&uacute;mero</div>
	      </th>
	      <th nowrap width="15%"> 
	        <div align="center">Fecha</div>
	      </th> 
	      <th nowrap width="15%"> 
	        <div align="center">Valor</div>
	      </th>      
	      <th nowrap width="15%"> 
	        <div align="center">Distribuci&oacute;n</div>
	      </th>        
	      <th nowrap width="15%"> 
	        <div align="center">Principal</div>
	      </th>
	      <th nowrap width="15%">
	        <div align="center">Inter&eacute;s</div>
	      </th>
	      <th nowrap width="15%">
	        <div align="center">Saldo</div>
	      </th>      
	    </tr>
	    </table>
	 </td> 
   <tr height="95%">    
	    <td nowrap="nowrap">      
	       <div id="dataDiv1" style="max-height:400px; overflow:auto;"> 
	       <table id="DINTABLE" style="border: 0; max-height:400px" cellspacing="0" cellpadding="1" border="0" width="100%">         
    
<%
    list.initRow();
	String readonly;
	String disabled = "";
	
    int actrow = 0;
    int row = list.getNoResult() ? 0 : list.getLastRow() + 1;
    double suma = 0;  double sumCapital = 0;  double sumInt = 0;

    double valor = 0;
    
    while (list.getNextRow()) {
      actrow++;
      try {
        valor = Double.parseDouble(list.getRecord(4));
      } catch (NumberFormatException e1) {
        try {
          valor = DecimalField.parseDouble(list.getRecord(4));
        } catch (NumberFormatException e2) {
          valor = 0;
        }
      }
      suma = suma + valor;
      
      try {
          valor = Double.parseDouble(list.getRecord(6));
        } catch (NumberFormatException e1) {
          try {
            valor = DecimalField.parseDouble(list.getRecord(6));
          } catch (NumberFormatException e2) {
            valor = 0;
          }
        }

      sumCapital += valor;
      
      try {
          valor = Double.parseDouble(list.getRecord(7));
        } catch (NumberFormatException e1) {
          try {
            valor = DecimalField.parseDouble(list.getRecord(7));
          } catch (NumberFormatException e2) {
            valor = 0;
          }
        }

      sumInt += valor;
      
      if (!list.getRecord(5).equals("Y")){
    	  readonly = "readonly";
      }else{
    	  readonly = "";
      }
      
      if(list.getRecord(9).equals("P")){
        	disabled = "disabled=\"disabled\"";
      } else {
  			disabled = "";
      }      
      
      
	%> 
    <tr id="trclear">
      <td align=center width="5%">
        <input type="hidden" name="FLGPRO_<%= actrow %>"  value="<%= list.getRecord(9)%>">
        <input type="checkbox" name="ROWSEL" value="<%= actrow %>" <%= disabled %>>
      </td>
      <td nowrap width="5%">
        <div align="center"> 
          <input type="text" name="DLPPNU_<%= actrow %>" size="4" maxlength="3"  value="<%= list.getRecord(0) %>" readonly >
        </div>
      </td>
      <td nowrap width="15%">
        <div align="center"> 
        <%
            if ( currUser.getE01DTF().equals("YMD") ) {
        %> 
	      <input type="text" name="DLPPD3_<%= actrow %>" id="MANDATORY" size="3" maxlength="2" <%= disabled %>  value="<%= list.getRecord(3) %>" onKeypress="enterInteger(event)">
	      <input type="text" name="DLPPD1_<%= actrow %>" id="MANDATORY" size="3" maxlength="2" <%= disabled %>  value="<%= list.getRecord(1) %>" onKeypress="enterInteger(event)">
	      <input type="text" name="DLPPD2_<%= actrow %>" id="MANDATORY" size="3" maxlength="2" <%= disabled %>  value="<%= list.getRecord(2) %>" onKeypress="enterInteger(event)">
          <%
              }
              else if ( currUser.getE01DTF().equals("MDY") ) {
                %>
	      <input type="text" name="DLPPD1_<%= actrow %>" id="MANDATORY" size="3" maxlength="2" <%= disabled %> value="<%= list.getRecord(1) %>" onKeypress="enterInteger(event)">
	      <input type="text" name="DLPPD2_<%= actrow %>" id="MANDATORY" size="3" maxlength="2" <%= disabled %> value="<%= list.getRecord(2) %>" onKeypress="enterInteger(event)">
	      <input type="text" name="DLPPD3_<%= actrow %>" id="MANDATORY" size="3" maxlength="2" <%= disabled %> value="<%= list.getRecord(3) %>" onKeypress="enterInteger(event)">
                <%
              }
              else {
                %>
	      <input type="text" name="DLPPD2_<%= actrow %>" id="MANDATORY" size="3" maxlength="2" <%= disabled %> value="<%= list.getRecord(2) %>" onKeypress="enterInteger(event)">
	      <input type="text" name="DLPPD1_<%= actrow %>" id="MANDATORY" size="3" maxlength="2" <%= disabled %> value="<%= list.getRecord(1) %>" onKeypress="enterInteger(event)">
	      <input type="text" name="DLPPD3_<%= actrow %>" id="MANDATORY" size="3" maxlength="2" <%= disabled %> value="<%= list.getRecord(3) %>" onKeypress="enterInteger(event)">
                <%
              }
              %>
	    </div>
      </td>
      <td nowrap width="15%"> 
        <div align="center"> 
          <input type="text" name="DLPAMT_<%= actrow %>" id="MANDATORY" style ="text-align: right" size="21" maxlength="21" <%= disabled %> value="<%= list.getRecord(5).equals("I") ? "0.00"  : list.getRecord(4) %>" onblur="this.value = formatCCY(this.value)" onKeypress="enterDecimal(event, 2)" onchange="updateTotal();">
        </div>
      </td>
      <td nowrap width="15%"> 
        <div align="center"> 
          <select name="DLPIIP_<%= actrow %>" <%= disabled %> 	style="<%= !disabled.trim().equals("") ? "display:none" : "display:" %>" >
            <option value="F" <% if (list.getRecord(5).equals("F")) out.print("selected"); %>>Cuota Fija</option>
            <option value="Y" <% if (list.getRecord(5).equals("Y")) out.print("selected"); %>>Capital + Inter&eacute;s</option>
            <option value="N" <% if (list.getRecord(5).equals("N")) out.print("selected"); %>>Capital Solamente</option>
            <option value="I" <% if (list.getRecord(5).equals("I")) out.print("selected"); %>>Inter&eacute;s Solamente</option>
       	 </select>        
        
		<%if( !disabled.trim().equals("") ) {%>
          <select name="PAID__<%= actrow %>" <%= disabled %> >
            <option value="PAID" selected> PAGADO </option>
            <option value="F" >Cuota Fija</option>
            <option value="Y" >Capital + Inter&eacute;s</option>
            <option value="N" >Capital Solamente</option>
            <option value="I" >Inter&eacute;s Solamente</option>       	 </select>        
        <% } %>  
        </div>
      </td>      
      <td nowrap width="15%"> 
        <div align="center"> 
          <input type="text" name="DLPPRI_<%= actrow %>" style ="text-align: right" size="21" maxlength="20" value="<%= list.getRecord(6) %>" readonly>
        </div>
      </td>
        <td nowrap width="15%">
          <div align="center">
            <input type="text" name="DLPINT_<%= actrow %>" size="21" maxlength="20" value="<%= list.getRecord(7) %>" class="txtright" <%=readonly%> <%= disabled %> >
          </div>
      </td>
        <td nowrap width="15%">
          <div align="center">
            <input type="text" name="DLPSAL_<%= actrow %>" size="21" maxlength="21" value="<%= list.getRecord(8) %>" class="txtright" readonly >
          </div>
      </td>      
    </tr>
<%
    }
%> 
           </table>
         </div>
       </td>
     </tr>
</table>
  
  <br>
  <table id="RESUMEN" class="tbenter" >
    <tr>
      <td width="5%">&nbsp;</td>
      <td width="5%">&nbsp;</td>						
      <td align="right" nowrap width="15%"><b>TOTAL : </b></td>
      <td align="right" nowrap width="15%"><b><%=datapro.eibs.master.Util.formatCCY(suma)%></b></td>
      <td width="15%">&nbsp;</td>
      <td width="15%" align="right"><b><%=datapro.eibs.master.Util.formatCCY(sumCapital)%></b></td>
      <td width="15%" align="right"><b><%=datapro.eibs.master.Util.formatCCY(sumInt)%></b></td>
      <td width="15%">&nbsp;</td>
    </tr>		
  </table>    
  
  <br>
  <table class="tbenter" >
    <tr> 
      <td nowrap width="1%"> 
        <div>Cantidad de Registros a A&ntilde;adir : 
          <input type="text" name="TEMP_ROW" size="4" maxlength="3" value="1" onBlur="checkRowValue()" onKeypress="enterInteger(event)">
        </div>
      </td>
      <td class="TDBKG" width="1%">
        <a href="javascript:AddRow('DINTABLE', document.forms[0].TEMP_ROW.value,'')">A&ntilde;adir</a>
      </td>
      <td>&nbsp;</td>
    </tr>
  </table>  
