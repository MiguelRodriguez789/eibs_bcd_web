<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Split</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="invSplit" class="datapro.eibs.beans.EIE022001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
 
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
<div align="center">
  <h3> Split Inquiry<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="inv_split_inq.jsp,EIE0240"></h3>
</div>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0240" >
    <input type="hidden" name="SCREEN"  value="400" >

<h4>Instrument Information</h4>
	<table>
	<TR>
		<TD nowrap height="222">
			<TABLE class="tableinfo" cellpadding="2" cellspacing="0" width="100%" border="0">
				<TBODY>

				<TR id="trdark">
					<TD nowrap width="17%">
						<DIV align="right">  Instrument :</DIV>
					</TD>
					<TD nowrap width="56%">
						<INPUT type="text" name="E01ISIIIC" readonly size="4" maxlength="3" value="<%= invSplit.getE01ISIIIC()%>" onkeypress="enterDecimal(event, 2)">
						<INPUT type="text" name="E01ISIDSC" readonly size="35" maxlength="30" value="<%= invSplit.getE01ISIDSC()%>" onkeypress="enterDecimal(event, 2)">
						 
					</TD>
				</TR>
				<TR id="trclear">
					<TD nowrap width="17%" height="33">
						<DIV align="right">Instrument Type :</DIV>
					</TD>
					<TD nowrap height="33" width="56%"><input type="text" name="E01ISIPTY" readonly size="15" maxlength="15" value="<%= invSplit.getE01ISIPTY()%>" onKeyPress="enterDecimal(event, 2)"> Currency: 
						<INPUT type="text" name="E01ISICCY" readonly size="15" maxlength="15"
						value="<%= invSplit.getE01ISICCY()%>" onkeypress="enterDecimal(event, 2)">
					</TD>
				</TR>

        	</table>
      	</td>
    </tr>
  </table>
<h4>Outstanding Balance</h4>

	<TABLE class="tableinfo" cellpadding="2" cellspacing="0" width="100%" border="0">
		<TBODY>
		<TR id="trdark">

			<TD nowrap width="17%" >
				<DIV align="right"><A href="javascript:showOpenDetailInstrument(document.forms[0].E01ISIIIC.value)"><IMG src="<%=request.getContextPath()%>/images/aquire.gif" title="Help" border="0" > Current Quantity :</A></DIV>
			</TD>
			<TD nowrap height="35" width="56%">
				<input type="text" name="E01QUANTY" readonly size="17" maxlength="15" value="<%= invSplit.getE01QUANTY()%>" onKeyPress="enterDecimal(event, 2)">
			</TD>
		</TR>
		<TR id="trclear">
			<TD nowrap width="17%" height="40">
				<DIV align="right">Market Price :</DIV>
			</TD>
			<TD nowrap height="40" width="56%">
				<input type="text" name="E01UNTPRI" readonly size="17" maxlength="15" value="<%= invSplit.getE01UNTPRI()%>" onKeyPress="enterDecimal(event, 2)">
			</TD>
		</TR>

		<TR id="trdark">
			<TD nowrap width="17%" height="40">
				<DIV align="right">Market Value :</DIV>
			</TD>
			<TD nowrap height="40" width="56%">
				<input type="text" name="E01NOMVAL" readonly size="17" maxlength="15" value="<%= invSplit.getE01NOMVAL()%>" onKeyPress="enterDecimal(event, 2)">
			</TD>
		</TR>
		</TBODY>
	</TABLE>

<h4>Split Information</h4>
	<TABLE class="tableinfo" cellpadding="2" cellspacing="0" width="100%" border="0">
		<TBODY>
		<TR id="trclear">
			<TD nowrap width="17%">
				<DIV align="right">Split Number :</DIV>
			</TD>
			<TD nowrap width="56%">
				<input type="text" name="E01SPLNUM"  readonly size="9" maxlength="9" value="<%= invSplit.getE01SPLNUM()%>" onKeyPress="enterDecimal(event, 2)">
			</TD>
		</TR>
		<TR id="trdark">
			<TD nowrap width="17%">
				<DIV align="right">Factor :</DIV>
			</TD>
			<TD nowrap width="56%">
				<input type="text" name="E01SCRFAC" readonly  size="11" maxlength="15" value="<%= invSplit.getE01SCRFAC()%>" onKeyPress="enterDecimal(event, 2)">
			</TD>
		</TR>
		<TR id="trclear">
			<TD nowrap width="17%">
				<DIV align="right">New Market Price :</DIV>
			</TD>
			<TD nowrap width="56%">
				<INPUT type="text" name="E01NEWMKP" readonly  size="17" maxlength="15" value="<%= invSplit.getE01NEWMKP()%>" onkeypress="enterDecimal(event, 2)">
			</TD>
		</TR>
		
		<TR id="trdark">
            <td nowrap width="18%" > 
              <div align="left">Record   Date :</div>
            </td> 
            <td nowrap colspan="3" >     
				<eibsinput:date name="invSplit" fn_month="E01RECDTM" fn_day="E01RECDTD" fn_year="E01RECDTY" readonly="TRUE"/>              
           <td >
        </tr >         
       
		<TR id="trdark">
            <td nowrap width="18%" > 
              <div align="left">Effecctive   Date :</div>
            </td> 
            <td nowrap colspan="3" >     
				<eibsinput:date name="invSplit" fn_month="E01PAYDTM" fn_day="E01PAYDTD" fn_year="E01PAYDTY" readonly="TRUE"/>              
           <td >
        </tr >         
           
		</TBODY>
	</TABLE> 
<h4>Audit Information</h4>
	<table>
	<TR>
		<TD nowrap height="222">
			<TABLE class="tableinfo" cellpadding="2" cellspacing="0" width="100%" border="0">
				<TBODY>

				<TR id="trdark">
					<TD nowrap width="17%">
						<DIV align="right">  User :</DIV>
					</TD>
					<TD nowrap width="56%">
						<INPUT type="text" name="E01SPLUSR" readonly size="15" maxlength="15" value="<%= invSplit.getE01SPLUSR()%>">
 					 
					</TD>
				</TR>
				<TR id="trclear">
					<TD nowrap width="17%" height="33">
						<DIV align="right">Request Date :</DIV>
					</TD>
					<td nowrap colspan="3" >     
						<eibsinput:date name="invSplit" fn_month="E01SPLUPM" fn_day="E01SPLUPD" fn_year="E01SPLUPY" readonly="TRUE"/>              
           			<td >
				</TR>

        	</table>
      	</td>
    </tr>
  </table>


  </form>
</body>
</html>

