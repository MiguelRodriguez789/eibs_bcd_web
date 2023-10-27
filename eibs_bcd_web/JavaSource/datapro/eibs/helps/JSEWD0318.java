package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0318DSMessage;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSEWD0318 extends JSEIBSServlet {

	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		main(user, req, res, session);
	}

	private void main(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWD0318", req);
			EWD0318DSMessage msgHelp = (EWD0318DSMessage) mp.getMessageRecord("EWD0318DS");
			msgHelp.setRWDUSR(user.getH01USR());
			try { //Description
				msgHelp.setSWDMSTCUN(req.getParameter("CUSTOMER").trim());
			} catch (Exception e) {
				msgHelp.setSWDMSTCUN("");
			}
			msgHelp.setRWDTYP("");
			try { //From Pos
				msgHelp.setRWDFRC(req.getParameter("Pos").trim());
			} catch (Exception e) {
				msgHelp.setRWDFRC("0");
			}
			
			mp.sendMessage(msgHelp);
			
			JBObjList list = mp.receiveMessageRecordList("EWDOPE", "SWDREC");
			
			if (mp.hasError(list)) {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				session.setAttribute("error", msgError);
				pageName = "error_viewer.jsp";
			} else {
				JBList beanList = new JBList();
				StringBuffer myRow = null;
				list.initRow();
				while (list.getNextRow()) {
					msgHelp = (EWD0318DSMessage) list.getRecord();
					myRow = new StringBuffer("<TR>");
					myRow.append(
							"<TD NOWRAP  ALIGN=CENTER><a href=\"javascript:enter('"
								+ msgHelp.getSWDMSTPRF() //Portfolio
								+ "','"
								+ msgHelp.getSWDMSTIIC() //Instrument Code
								+ "','"
								+ msgHelp.getSWDISIDSC() //Instrument Description
								+ "','"
								+ msgHelp.getSWDMSTCCY() //Instrument Currency
								+ "','"
								+ msgHelp.getSWDMSTCUC() // Custodian Code
								+ "','"
								+ msgHelp.getSWDCUCNME() //Custodian Name
								+ "','"
								+ msgHelp.getSWDISIPTY() //Account Type
								+ "','"
								+ msgHelp.getSWDMSTVNO() //Nominal Value
								+ "','"
								+ msgHelp.getSWDMSTQTY() //Quantity
								+ "','"
								+ msgHelp.getSWDISICUS() //CUSIP
								+ "','"
								+ msgHelp.getSWDISISYM() //Symbol
								+ "','"
								+ msgHelp.getSWDISINUM() //ISIN
								+ "','"
								+ msgHelp.getSWDISIATY() //Accrual Type
								+ "','"
								+ msgHelp.getSWDISIIN1() //Last Interest Payment 1
								+ "','"
								+ msgHelp.getSWDISIIN2() //Last Interest Payment 2
								+ "','"
								+ msgHelp.getSWDISIIN3() //Last Interest Payment 3
								+ "')\">"
								+ msgHelp.getSWDMSTPRF() //Portfolio Number
								+ "</a></td>");
					myRow.append(
						"<TD NOWRAP  ALIGN=LEFT><a href=\"javascript:enter('"
							+ msgHelp.getSWDMSTPRF() //Portfolio
							+ "','"
							+ msgHelp.getSWDMSTIIC() //Instrument Code
							+ "','"
							+ msgHelp.getSWDISIDSC() //Instrument Description
							+ "','"
							+ msgHelp.getSWDMSTCCY() //Instrument Currency
							+ "','"
							+ msgHelp.getSWDMSTCUC() // Custodian Code
							+ "','"
							+ msgHelp.getSWDCUCNME() //Custodian Name
							+ "','"
							+ msgHelp.getSWDISIPTY() //Account Type
							+ "','"
							+ msgHelp.getSWDMSTVNO() //Nominal Value
							+ "','"
							+ msgHelp.getSWDMSTQTY() //Quantity
							+ "','"
							+ msgHelp.getSWDISICUS() //CUSIP
							+ "','"
							+ msgHelp.getSWDISISYM() //Symbol
							+ "','"
							+ msgHelp.getSWDISINUM() //ISIN
							+ "','"
							+ msgHelp.getSWDISIATY() //Accrual Type
							+ "','"
							+ msgHelp.getSWDISIIN1() //Last Interest Payment 1
							+ "','"
							+ msgHelp.getSWDISIIN2() //Last Interest Payment 2
							+ "','"
							+ msgHelp.getSWDISIIN3() //Last Interest Payment 3
							+ "')\">"
							+ msgHelp.getSWDISIDSC() //Instrument Description
							+ "</a></td>");
					myRow.append(
						"<TD NOWRAP  ALIGN=LEFT><a href=\"javascript:enter('"
							+ msgHelp.getSWDMSTPRF() //Portfolio
							+ "','"
							+ msgHelp.getSWDMSTIIC() //Instrument Code
							+ "','"
							+ msgHelp.getSWDISIDSC() //Instrument Description
							+ "','"
							+ msgHelp.getSWDMSTCCY() //Instrument Currency
							+ "','"
							+ msgHelp.getSWDMSTCUC() // Custodian Code
							+ "','"
							+ msgHelp.getSWDCUCNME() //Custodian Name
							+ "','"
							+ msgHelp.getSWDISIPTY() //Account Type
							+ "','"
							+ msgHelp.getSWDMSTVNO() //Nominal Value
							+ "','"
							+ msgHelp.getSWDMSTQTY() //Quantity
							+ "','"
							+ msgHelp.getSWDISICUS() //CUSIP
							+ "','"
							+ msgHelp.getSWDISISYM() //Symbol
							+ "','"
							+ msgHelp.getSWDISINUM() //ISIN
							+ "','"
							+ msgHelp.getSWDISIATY() //Accrual Type
							+ "','"
							+ msgHelp.getSWDISIIN1() //Last Interest Payment 1
							+ "','"
							+ msgHelp.getSWDISIIN2() //Last Interest Payment 2
							+ "','"
							+ msgHelp.getSWDISIIN3() //Last Interest Payment 3
							+ "')\">"
							+ msgHelp.getSWDCUCNME() // Custodian Name
							+ "</a></td>");
					myRow.append(
						"<TD NOWRAP  ALIGN=CENTER><a href=\"javascript:enter('"
							+ msgHelp.getSWDMSTPRF() //Portfolio
							+ "','"
							+ msgHelp.getSWDMSTIIC() //Instrument Code
							+ "','"
							+ msgHelp.getSWDISIDSC() //Instrument Description
							+ "','"
							+ msgHelp.getSWDMSTCCY() //Instrument Currency
							+ "','"
							+ msgHelp.getSWDMSTCUC() // Custodian Code
							+ "','"
							+ msgHelp.getSWDCUCNME() //Custodian Name
							+ "','"
							+ msgHelp.getSWDISIPTY() //Account Type
							+ "','"
							+ msgHelp.getSWDMSTVNO() //Nominal Value
							+ "','"
							+ msgHelp.getSWDMSTQTY() //Quantity
							+ "','"
							+ msgHelp.getSWDISICUS() //CUSIP
							+ "','"
							+ msgHelp.getSWDISISYM() //Symbol
							+ "','"
							+ msgHelp.getSWDISINUM() //ISIN
							+ "','"
							+ msgHelp.getSWDISIATY() //Accrual Type
							+ "','"
							+ msgHelp.getSWDISIIN1() //Last Interest Payment 1
							+ "','"
							+ msgHelp.getSWDISIIN2() //Last Interest Payment 2
							+ "','"
							+ msgHelp.getSWDISIIN3() //Last Interest Payment 3
							+ "')\">"
							+ msgHelp.getSWDMSTCCY() //Instrument Currency
							+ "</a></td>");
					myRow.append(
						"<TD NOWRAP  ALIGN=RIGHT><a href=\"javascript:enter('"
							+ msgHelp.getSWDMSTPRF() //Portfolio
							+ "','"
							+ msgHelp.getSWDMSTIIC() //Instrument Code
							+ "','"
							+ msgHelp.getSWDISIDSC() //Instrument Description
							+ "','"
							+ msgHelp.getSWDMSTCCY() //Instrument Currency
							+ "','"
							+ msgHelp.getSWDMSTCUC() // Custodian Code
							+ "','"
							+ msgHelp.getSWDCUCNME() //Custodian Name
							+ "','"
							+ msgHelp.getSWDISIPTY() //Account Type
							+ "','"
							+ msgHelp.getSWDMSTVNO() //Nominal Value
							+ "','"
							+ msgHelp.getSWDMSTQTY() //Quantity
							+ "','"
							+ msgHelp.getSWDISICUS() //CUSIP
							+ "','"
							+ msgHelp.getSWDISISYM() //Symbol
							+ "','"
							+ msgHelp.getSWDISINUM() //ISIN
							+ "','"
							+ msgHelp.getSWDISIATY() //Accrual Type
							+ "','"
							+ msgHelp.getSWDISIIN1() //Last Interest Payment 1
							+ "','"
							+ msgHelp.getSWDISIIN2() //Last Interest Payment 2
							+ "','"
							+ msgHelp.getSWDISIIN3() //Last Interest Payment 3
							+ "')\">"
							+ Util.fcolorCCY(msgHelp.getSWDMSTVNO()) //Nominal Value
							+ "</a></td>");
					myRow.append(
						"<TD NOWRAP  ALIGN=RIGHT><a href=\"javascript:enter('"
							+ msgHelp.getSWDMSTPRF() //Portfolio
							+ "','"
							+ msgHelp.getSWDMSTIIC() //Instrument Code
							+ "','"
							+ msgHelp.getSWDISIDSC() //Instrument Description
							+ "','"
							+ msgHelp.getSWDMSTCCY() //Instrument Currency
							+ "','"
							+ msgHelp.getSWDMSTCUC() // Custodian Code
							+ "','"
							+ msgHelp.getSWDCUCNME() //Custodian Name
							+ "','"
							+ msgHelp.getSWDISIPTY() //Account Type
							+ "','"
							+ msgHelp.getSWDMSTVNO() //Nominal Value
							+ "','"
							+ msgHelp.getSWDMSTQTY() //Quantity
							+ "','"
							+ msgHelp.getSWDISICUS() //CUSIP
							+ "','"
							+ msgHelp.getSWDISISYM() //Symbol
							+ "','"
							+ msgHelp.getSWDISINUM() //ISIN
							+ "','"
							+ msgHelp.getSWDISIATY() //Accrual Type
							+ "','"
							+ msgHelp.getSWDISIIN1() //Last Interest Payment 1
							+ "','"
							+ msgHelp.getSWDISIIN2() //Last Interest Payment 2
							+ "','"
							+ msgHelp.getSWDISIIN3() //Last Interest Payment 3
							+ "')\">"
							+ msgHelp.getSWDMSTQTY() //Quantity
							+ "</a></td>");
					myRow.append(
						"<TD NOWRAP  ALIGN=RIGHT><a href=\"javascript:enter('"
							+ msgHelp.getSWDMSTPRF() //Portfolio
							+ "','"
							+ msgHelp.getSWDMSTIIC() //Instrument Code
							+ "','"
							+ msgHelp.getSWDISIDSC() //Instrument Description
							+ "','"
							+ msgHelp.getSWDMSTCCY() //Instrument Currency
							+ "','"
							+ msgHelp.getSWDMSTCUC() // Custodian Code
							+ "','"
							+ msgHelp.getSWDCUCNME() //Custodian Name
							+ "','"
							+ msgHelp.getSWDISIPTY() //Account Type
							+ "','"
							+ msgHelp.getSWDMSTVNO() //Nominal Value
							+ "','"
							+ msgHelp.getSWDMSTQTY() //Quantity
							+ "','"
							+ msgHelp.getSWDISICUS() //CUSIP
							+ "','"
							+ msgHelp.getSWDISISYM() //Symbol
							+ "','"
							+ msgHelp.getSWDISINUM() //ISIN
							+ "','"
							+ msgHelp.getSWDISIATY() //Accrual Type
							+ "','"
							+ msgHelp.getSWDISIIN1() //Last Interest Payment 1
							+ "','"
							+ msgHelp.getSWDISIIN2() //Last Interest Payment 2
							+ "','"
							+ msgHelp.getSWDISIIN3() //Last Interest Payment 3
							+ "')\">"
							+ Util.fcolorCCY(msgHelp.getSWDMSTCOA()) //Collateral Amount
							+ "</a></td>");
					myRow.append(
						"<TD NOWRAP  ALIGN=RIGHT><a href=\"javascript:enter('"
							+ msgHelp.getSWDMSTPRF() //Portfolio
							+ "','"
							+ msgHelp.getSWDMSTIIC() //Instrument Code
							+ "','"
							+ msgHelp.getSWDISIDSC() //Instrument Description
							+ "','"
							+ msgHelp.getSWDMSTCCY() //Instrument Currency
							+ "','"
							+ msgHelp.getSWDMSTCUC() // Custodian Code
							+ "','"
							+ msgHelp.getSWDCUCNME() //Custodian Name
							+ "','"
							+ msgHelp.getSWDISIPTY() //Account Type
							+ "','"
							+ msgHelp.getSWDMSTVNO() //Nominal Value
							+ "','"
							+ msgHelp.getSWDMSTQTY() //Quantity
							+ "','"
							+ msgHelp.getSWDISICUS() //CUSIP
							+ "','"
							+ msgHelp.getSWDISISYM() //Symbol
							+ "','"
							+ msgHelp.getSWDISINUM() //ISIN
							+ "','"
							+ msgHelp.getSWDISIATY() //Accrual Type
							+ "','"
							+ msgHelp.getSWDISIIN1() //Last Interest Payment 1
							+ "','"
							+ msgHelp.getSWDISIIN2() //Last Interest Payment 2
							+ "','"
							+ msgHelp.getSWDISIIN3() //Last Interest Payment 3
							+ "')\">"   
							+ Util.fcolorCCY(msgHelp.getSWDMSTMKP()) //Market Price
							+ "</a></td>");		
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				flexLog("Putting java beans into the session");
				session.setAttribute("EWD0318Help", beanList);
				
				pageName = "EWD0318_inv_customer_helpmessage.jsp";
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

}
