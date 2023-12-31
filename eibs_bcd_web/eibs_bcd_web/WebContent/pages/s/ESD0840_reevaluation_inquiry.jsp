<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>

<%@ page import = "java.io.*" %>
<%@ page import = "java.net.*" %>
<%@ page import = "datapro.eibs.beans.*" %>
<%@ page import = "datapro.eibs.sockets.*" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import = "datapro.eibs.master.JSEIBSProp" %>
<%@ page import = "datapro.eibs.master.MessageProcessor" %>

<%
  String flag = request.getParameter("flag");	

  if (flag.equals("R")) {
	MessageContext mc = null;
	MessageRecord newmessage = null;
	ESD084001Message msgCorrection = null;
	ESS0030DSMessage msgUser = null;
	ELEERRMessage msgError = null;
	JBList beanList = null;
	UserPos usrPO = null;

	// session = (HttpSession)req.getSession(false);
	
	if (session == null) {
		try {
			// res.setContentType("text/html");
			// printLogInAgain(res.getWriter());
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	else {

		usrPO = (UserPos) session.getAttribute("userPO");
		msgUser = (ESS0030DSMessage)session.getAttribute("currUser");
		String Language = msgUser.getE01LAN();
		String LangPath = JSEIBSProp.getRootPath() + Language + "/";

		try {
			mc = new MessageContext(new MessageProcessor("ESD0840").getMessageHandler());
		}
		catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			response.sendRedirect(LangPath + JSEIBSProp.getSckNotOpenPage());
			return;
		}
		 
	  	try {
			msgCorrection = (ESD084001Message)mc.getMessageRecord("ESD084001");
	 		msgCorrection.setH01USERID(msgUser.getH01USR());
	 		msgCorrection.setH01PROGRM("ESD0840");
	 		// msgCorrection.setH01TIMSYS("");
	 		// msgCorrection.setH01SCRCOD("");
	 		// msgCorrection.setH01OPECOD("");
			try {
				msgCorrection.setE01GLRACC(request.getParameter("ACCNUM"));
			}
			catch (Exception e) {
				System.out.println(e);
				msgCorrection.setE01GLRACC(usrPO.getIdentifier());
			}
			msgCorrection.send();	
		 	msgCorrection.destroy();
		}		
		catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			response.sendRedirect(LangPath + JSEIBSProp.getSckNotRespPage());
			return;
		}
			
		// Receiving
		try
		{
	  		newmessage = mc.receiveMessage();

		  	if (newmessage.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage)newmessage;
				msgError.setERRNUM("0");
				
				session.setAttribute("error", msgError);

     				out.println("<SCRIPT Language=\"Javascript\">");
     				out.println("       showErrors()");
     				out.println("</SCRIPT>");
 				
		  	}	 		  
		  	else if (newmessage.getFormatName().equals("ESD084001")) {
				msgCorrection = (ESD084001Message)newmessage;
%>

  <h4>Reajuste por Correcci&oacute;n Monetaria</h4> 
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap height="35" colspan="2"> 
              <div align="right">Ultimo Reajuste :</div>
            </td>
            <td nowrap width="23%" height="35"> 
				<eibsinput:date name="msgCorrection" fn_year="E01GLRLRY" fn_month="E01GLRLRM" fn_day="E01GLRLRD" readonly="true"/>
            </td>
            <td nowrap width="19%" height="35"> 
              <div align="right">Tasa Original del <%= msgCorrection.getE01DSCREV().trim()%> 
                :</div>
            </td>
            <td nowrap width="26%" height="35"> 
              <input type="text" readonly  name="E02DEAEXR25532" size="15" maxlength="18" value="<%= msgCorrection.getE01GLROEX().trim()%>" class="txtright">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap colspan="2"> 
              <div align="right"></div>
            </td>
            <td nowrap width="23%">&nbsp; </td>
            <td nowrap width="19%"> 
              <div align="right">Tasa Ultima del <%= msgCorrection.getE01DSCREV().trim()%> 
                :</div>
            </td>
            <td nowrap width="26%"> 
              <input type="text" readonly  name="E02DEAEXR255322" size="15" maxlength="18" value="<%= msgCorrection.getE01GLREXR().trim()%>" class="txtright">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap colspan="5" height="23"> 
              <div align="right"></div>
              <div align="center"></div>
              <div align="center"></div>
              <div align="center"></div>
              <div align="center"></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="21%" height="23"> 
              <div align="right"><b>Concepto </b></div>
            </td>
            <td nowrap height="23" width="11%"> 
              <div align="center"><b><%= msgCorrection.getE01GLRCCY().trim()%></b></div>
            </td>
            <td nowrap width="23%" height="23"> 
              <div align="center"><b><%= msgCorrection.getE01DSCREV().trim()%></b></div>
            </td>
            <td nowrap width="19%" height="23"> 
              <div align="center"><b>Convertido </b></div>
            </td>
            <td nowrap width="26%" height="23"> 
              <div align="center"><b>Diferencial </b></div>
            </td>
          </tr>
		  <% if(msgCorrection.getBigDecimalE01GLRSPR().doubleValue() != 0){ %>
          <tr id="trdark"> 
            <td nowrap width="21%" height="19"> 
              <div align="right">Capital </div>
            </td>
            <td nowrap height="19" width="11%"> 
              <div align="center">
                <input type="text" readonly  name="E02DEAEXR2552" size="21" maxlength="18" value="<%= msgCorrection.getE01GLRPRV().trim()%>" class="txtright">
              </div>
            </td>
            <td nowrap width="23%" height="19"> 
              <div align="center">
                <input type="text" readonly  name="E02DEAEXR2553" size="21" maxlength="18" value="<%= msgCorrection.getE01GLRSPR().trim()%>" class="txtright">
              </div>
            </td>
            <td nowrap width="19%" height="19"> 
              <div align="center">
                <input type="text" readonly  name="E02DEAEXR2554" size="21" maxlength="18" value="<%= msgCorrection.getE01GLRPRC().trim()%>" class="txtright">
              </div>
            </td>
            <td nowrap width="26%" height="19"> 
              <div align="center">
                <input type="text" readonly  name="E02DEAEXR2555" size="21" maxlength="18" value="<%= msgCorrection.getE01GLRPRD().trim()%>" class="txtright">
              </div>
            </td>
          </tr>
		  <%}%>
		  <% if(msgCorrection.getBigDecimalE01GLRSIN().doubleValue() != 0){ %>
          <tr id="trclear"> 
            <td nowrap width="21%" height="19"> 
              <div align="right">Intereses</div>
            </td>
            <td nowrap height="19" width="11%"> 
              <div align="center">
                <input type="text" readonly  name="E02DEAEXR255" size="21" maxlength="18" value="<%= msgCorrection.getE01GLRIRV().trim()%>" class="txtright">
              </div>
            </td>
            <td nowrap width="23%" height="19"> 
              <div align="center"> 
                <input type="text" readonly  name="E02DEAEXR256" size="21" maxlength="18" value="<%= msgCorrection.getE01GLRSIN().trim()%>" class="txtright">
              </div>
            </td>
            <td nowrap width="19%" height="19"> 
              <div align="center">
                <input type="text" readonly  name="E02DEAEXR257" size="21" maxlength="18" value="<%= msgCorrection.getE01GLRIRC().trim()%>" class="txtright">
              </div>
            </td>
            <td nowrap width="26%" height="19"> 
              <div align="center">
                <input type="text" readonly  name="E02DEAEXR258" size="21" maxlength="18" value="<%= msgCorrection.getE01GLRIRD().trim()%>" class="txtright">
              </div>
            </td>
          </tr>
          <%}%>
		  <% if(msgCorrection.getBigDecimalE01GLRSMR().doubleValue() != 0){ %>
          <tr id="trdark"> 
            <td nowrap height="19" width="21%"> 
              <div align="right">Mora</div>
            </td>
            <td nowrap height="19" width="11%"> 
              <div align="center">
                <input type="text" readonly  name="E02DEAEXR25" size="21" maxlength="18" value="<%= msgCorrection.getE01GLRDRV().trim()%>" class="txtright">
              </div>
            </td>
            <td nowrap width="23%" height="19"> 
              <div align="center"> 
                <input type="text" readonly  name="E02DEAEXR252" size="21" maxlength="18" value="<%= msgCorrection.getE01GLRSMR().trim()%>" class="txtright">
              </div>
            </td>
            <td nowrap width="19%" height="19"> 
              <div align="center">
                <input type="text" readonly  name="E02DEAEXR253" size="15" maxlength="18" value="<%= msgCorrection.getE01GLRDRC().trim()%>" class="txtright">
              </div>
            </td>
            <td nowrap width="26%" height="19"> 
              <div align="center">
                <input type="text" readonly  name="E02DEAEXR254" size="21" maxlength="18" value="<%= msgCorrection.getE01GLRDRD().trim()%>" class="txtright">
              </div>
            </td>
          </tr>
		  <%}%>
          <tr id="trclear"> 
            <td nowrap height="19" colspan="5"> 
              <div align="right"></div>
              <div align="right"></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap height="19" width="21%"> 
              <div align="right"><b>Totales</b></div>
            </td>
            <td nowrap height="19" width="11%"> 
              <div align="center"> 
                <input type="text" readonly  name="E01TOTAL1" size="21" maxlength="18" value="<%= msgCorrection.getE01TOTAL1().trim()%>" class="txtright">
              </div>
            </td>
            <td nowrap width="23%" height="19"> 
              <div align="center"> 
                <input type="text" readonly  name="E01TOTAL2" size="21" maxlength="18" value="<%= msgCorrection.getE01TOTAL2().trim()%>" class="txtright">
              </div>
            </td>
            <td nowrap width="19%" height="19"> 
              <div align="center"> 
                <input type="text" readonly  name="E01TOTAL3" size="21" maxlength="18" value="<%= msgCorrection.getE01TOTAL3().trim()%>" class="txtright">
              </div>
            </td>
            <td nowrap width="26%" height="19"> 
              <div align="center"> 
                <input type="text" readonly  name="E01TOTAL4" size="21" maxlength="18" value="<%= msgCorrection.getE01TOTAL4().trim()%>" class="txtright">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<%
	  		}
		}
		catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			response.sendRedirect(LangPath + JSEIBSProp.getSckNotRespPage());
		}	

		try {
			mc.close();
		}
		catch (Exception e) {
			System.out.println(e);
		}
	}
  }
%>
