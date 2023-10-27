package datapro.eibs.products;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
import java.io.IOException;
import java.math.BigDecimal;
import java.util.Collections;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ERC004001Message;
import datapro.eibs.beans.ERC004002Message;
import datapro.eibs.beans.ERC004003Message;
import datapro.eibs.beans.ERC004004Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.DecimalField;
import datapro.eibs.sockets.MessageRecord;
import datapro.eibs.sockets.MessageRecordComparator;

public class JSERC0040 extends JSEIBSServlet {

	protected static final int R_STATEMENT_ENTER 	= 100;
	protected static final int A_STATEMENT_ENTER 	= 200;
	protected static final int A_STATEMENT_ORDER 	= 300;
	protected static final int A_STATEMENT_SUBMIT 	= 400;
	protected static final int A_UPDATE_IBS_ADD 	= 500;
	protected static final int A_UPDATE_IBS_SUB 	= 501;
	protected static final int A_UPDATE_CAR_ADD 	= 600;
	protected static final int A_UPDATE_CAR_SUB 	= 601;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		
		switch (screen) {
			case R_STATEMENT_ENTER:
				procReqStatementEnter(user, req, res, session);
				break;
			case A_STATEMENT_ENTER:
				procActStatementEnter(user, req, res, session);
				break;
			case A_STATEMENT_ORDER:
				procActStatementOrder(user, req, res, session);
				break;
			case A_STATEMENT_SUBMIT:
				procActStatement(user, req, res, session);
				break;
			case A_UPDATE_IBS_ADD:
			case A_UPDATE_IBS_SUB:
			case A_UPDATE_CAR_ADD:
			case A_UPDATE_CAR_SUB:
				procActUpdateTotal(user, req, res, session, screen);
				break;
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}		
	}

	private void procActUpdateTotal(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws IOException {
		
		JBObjList ibslist = (JBObjList) session.getAttribute("ibsList");
		JBObjList carlist = (JBObjList) session.getAttribute("carList");
		StringBuffer buffer = new StringBuffer();
		try {
			int row = Integer.parseInt(req.getParameter("row"));
			BigDecimal debit = new BigDecimal("0.00");
			BigDecimal credit = new BigDecimal("0.00");
			ERC004002Message ibsmsg = null;
			ERC004003Message carmsg = null;
			String id = "";
			switch (screen) {
				case A_UPDATE_IBS_ADD:
					id = "IBS_TOTAL";
					try {
						debit = new BigDecimal(Util.parseCCYtoDouble(req.getParameter("debit"))); 
					} catch (Exception e) {
						debit = new BigDecimal("0.00");
					}
					try {
						credit = new BigDecimal(Util.parseCCYtoDouble(req.getParameter("credit"))); 
					} catch (Exception e) {
						credit = new BigDecimal("0.00");
					}
					ibsmsg = (ERC004002Message) ibslist.get(row);
					debit = debit.add(ibsmsg.getBigDecimalE02RCTAMD());
					credit = credit.add(ibsmsg.getBigDecimalE02RCTAMC());
					break;
				case A_UPDATE_IBS_SUB:
					id = "IBS_TOTAL";
					try {
						debit = new BigDecimal(Util.parseCCYtoDouble(req.getParameter("debit"))); 
					} catch (Exception e) {
						debit = new BigDecimal("0.00");
					}
					try {
						credit = new BigDecimal(Util.parseCCYtoDouble(req.getParameter("credit"))); 
					} catch (Exception e) {
						credit = new BigDecimal("0.00");
					}
					ibsmsg = (ERC004002Message) ibslist.get(row);
					debit = debit.subtract(ibsmsg.getBigDecimalE02RCTAMD());
					credit = credit.subtract(ibsmsg.getBigDecimalE02RCTAMC());
					break;
				case A_UPDATE_CAR_ADD:
					id = "CAR_TOTAL";
					try {
						debit = new BigDecimal(Util.parseCCYtoDouble(req.getParameter("debit"))); 
					} catch (Exception e) {
						debit = new BigDecimal("0.00");
					}
					try {
						credit = new BigDecimal(Util.parseCCYtoDouble(req.getParameter("credit"))); 
					} catch (Exception e) {
						credit = new BigDecimal("0.00");
					}
					carmsg = (ERC004003Message) carlist.get(row);
					debit = debit.add(carmsg.getBigDecimalE03RCSAMD());
					credit = credit.add(carmsg.getBigDecimalE03RCSAMC());
					break;
				case A_UPDATE_CAR_SUB:
					id = "CAR_TOTAL";
					try {
						debit = new BigDecimal(Util.parseCCYtoDouble(req.getParameter("debit"))); 
					} catch (Exception e) {
						debit = new BigDecimal("0.00");
					}
					try {
						credit = new BigDecimal(Util.parseCCYtoDouble(req.getParameter("credit"))); 
					} catch (Exception e) {
						credit = new BigDecimal("0.00");
					}
					carmsg = (ERC004003Message) carlist.get(row);
					debit = debit.subtract(carmsg.getBigDecimalE03RCSAMD());
					credit = credit.subtract(carmsg.getBigDecimalE03RCSAMC());
					break;
				default:
					break;
			}
			
			buffer.append("<div id=\"" + id + "\">");
			buffer.append("<table class=\"tableinfo\" cellspacing=\"0\" cellpadding=\"2\" width=\"100%\" border=\"0\">");
			buffer.append("<tr>");
			buffer.append("<td align=\"center\" width=\"62%\">");
			buffer.append("<div>  </div>");
			buffer.append("</td>");
			//Debit
			buffer.append("<td align=\"right\" width=\"19%\">");
			buffer.append("<input id=\"" + id + "_DT\" size=\"16\" value=\"" + Util.formatCCY(debit.toString()) + "\" readonly=\"readonly\"/>");
			buffer.append("</td>");
			//Credit
			buffer.append("<td align=\"right\" width=\"19%\">");
			buffer.append("<input id=\"" + id + "_CT\" size=\"16\" value=\"" + Util.formatCCY(credit.toString()) + "\" readonly=\"readonly\"/>");
			buffer.append("</td>");
			buffer.append("</tr>");
			buffer.append("</table>");
			buffer.append("</div>");
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		sendXMLResponse(res, buffer);
	}

	private void procActStatement(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		String[] car = req.getParameterValues("rowcar");
		String[] ibs = req.getParameterValues("rowibs");
		
		JBObjList ibslist = (JBObjList) session.getAttribute("ibsList");
		JBObjList carlist = (JBObjList) session.getAttribute("carList");
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ERC0040", req);
			ERC004004Message msg = (ERC004004Message) mp.getMessageRecord("ERC004004");
			msg.setH04USERID(user.getH01USR());
			msg.setH04PROGRM("ERC0040");
			msg.setH04OPECOD("0015");
			msg.setH04TIMSYS(getTimeStamp());
		
			for (int i = 0; i < car.length; i++) {
				int index = com.datapro.generic.tool.Util.parseInt(car[i]);
				ERC004003Message carmsg = (ERC004003Message) carlist.get(index);
				String tag = "E04SUID" + Util.addLeftChar('0', 2, String.valueOf(i + 1));
				DecimalField field = (DecimalField) msg.getField(tag);
				field.setBigDecimal(carmsg.getBigDecimalE03RCSUID());
			}
			for (int i = 0; i < ibs.length; i++) {
				int index = com.datapro.generic.tool.Util.parseInt(ibs[i]);
				ERC004002Message ibsmsg = (ERC004002Message) ibslist.get(index);
				String tag = "E04TUID" + Util.addLeftChar('0', 2, String.valueOf(i + 1));
				DecimalField field = (DecimalField) msg.getField(tag);
				field.setBigDecimal(ibsmsg.getBigDecimalE02RCTUID());
			}
			
			mp.sendMessage(msg);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("ERC0040_rcbank_list_selection.jsp", req, res);
			} else {
//				forward("ERC0040_confirm_message.jsp", req, res);
				procActStatementEnter(user, req, res, session);				
			}
		
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procActStatementOrder(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		
		String order = req.getParameter("orderBy") == null ? "" : req.getParameter("orderBy");
		String type = req.getParameter("type");
		String tag = "";
		
		JBObjList ibslist = (JBObjList) session.getAttribute("ibsList");
		JBObjList carlist = (JBObjList) session.getAttribute("carList");
		int rows = 0;
		int start = 0;
		String id = "";
		JBObjList list = null;
		if ("ibs".equals(type)) {
			list = ibslist;
			if ("date".equals(order)) {
				Collections.sort(list, new MessageRecordComparator("E02RCTBD", "YMD"));
			} else if ("reference".equals(order)) {
				Collections.sort(list, new MessageRecordComparator("E02RCTCKN"));
			} else if ("code".equals(order)) {
				Collections.sort(list, new MessageRecordComparator("E02RCTCDE"));
			} else if ("debit".equals(order)) {
				Collections.sort(list, new MessageRecordComparator("E02RCTAMD"));
			} else if ("credit".equals(order)) {
				Collections.sort(list, new MessageRecordComparator("E02RCTAMC"));
			}
			rows = carlist.size() - ibslist.size();
			if (rows > 0) {
				start = ibslist.size();
				rows = ibslist.size() + rows;
			}
			id = "rowibs";
			session.setAttribute("ibsList", list);
		} else {
			list = carlist;
			if ("date".equals(order)) {
				Collections.sort(list, new MessageRecordComparator("E03RCSBD", "YMD"));
			} else if ("reference".equals(order)) {
				Collections.sort(list, new MessageRecordComparator("E03RCSCKN"));
			} else if ("code".equals(order)) {
				Collections.sort(list, new MessageRecordComparator("E03RCSCDE"));
			} else if ("debit".equals(order)) {
				Collections.sort(list, new MessageRecordComparator("E03RCSAMD"));
			} else if ("credit".equals(order)) {
				Collections.sort(list, new MessageRecordComparator("E03RCSAMC"));
			}
			rows = ibslist.size() - carlist.size();
			if (rows > 0) {
				start = carlist.size();
				rows = carlist.size() + rows;
			}
			id = "rowcar";
			session.setAttribute("carList", list);
		}
		//Sort list
		ERC004002Message ibs;
		ERC004003Message car;
		StringBuffer buffer = new StringBuffer();
		buffer.append("<table id=\"" + type + "\" width=\"100%\">");
		
		list.initRow();
		while (list.getNextRow()) {
			MessageRecord msg = (MessageRecord) list.getRecord();
			buffer.append("<tr>");
			if (msg.getFormatName().equals("ERC004002")) {
				ibs = (ERC004002Message) msg;
				buffer.append("<td align=\"center\" width=\"5%\">");
				buffer.append("<input type=\"checkbox\" id=\"rowibs\" name=\"rowibs\" value=\"" + list.getCurrentRow() + "\" onclick=\"update(this)\"/>");
				buffer.append("</td>");
				//Date
				buffer.append("<td align=\"center\" width=\"19%\">");
				buffer.append("<div>" + Util.formatCustomDate(user.getE01DTF(),ibs.getE02RCTBDM(), ibs.getE02RCTBDD(),  ibs.getE02RCTBDY()) + "</div>");
				buffer.append("</td>");
				//Reference
				buffer.append("<td align=\"center\" width=\"19%\">");
				buffer.append("<div>" + Util.formatCell(ibs.getE02RCTCKN()) + "</div>");
				buffer.append("</td>");
				//Code
				buffer.append("<td align=\"center\" width=\"19%\">");
				buffer.append("<div>" + Util.formatCell(ibs.getE02RCTCDE()) + "</div>");
				buffer.append("</td>");
				//Debit
				buffer.append("<td align=\"right\" width=\"19%\">");
				buffer.append("<div>" + Util.formatCCY(ibs.getE02RCTAMD()) + "</div>");
				buffer.append("</td>");
				//Credit
				buffer.append("<td align=\"right\" width=\"19%\">");
				buffer.append("<div>" + Util.formatCCY(ibs.getE02RCTAMC()) + "</div>");
				buffer.append("</td>");
			} else {
				car = (ERC004003Message) msg;
				buffer.append("<td align=\"center\" width=\"5%\">");
				buffer.append("<input type=\"checkbox\" id=\"rowcar\" name=\"rowcar\" value=\"" + list.getCurrentRow() + "\" onclick=\"update(this)\"/>");
				buffer.append("</td>");
				//Date
				buffer.append("<td align=\"center\" width=\"19%\">");
				buffer.append("<div>" + Util.formatCustomDate(user.getE01DTF(), car.getE03RCSBDM(), car.getE03RCSBDD(), car.getE03RCSBDY()) + "</div>");
				buffer.append("</td>");
				//Reference
				buffer.append("<td align=\"center\" width=\"19%\">");
				buffer.append("<div>" + Util.formatCell(car.getE03RCSCKN()) + "</div>");
				buffer.append("</td>");
				//Code
				buffer.append("<td align=\"center\" width=\"19%\">");
				buffer.append("<div>" + Util.formatCell(car.getE03RCSCDE()) + "</div>");
				buffer.append("</td>");
				//Debit
				buffer.append("<td align=\"right\" width=\"19%\">");
				buffer.append("<div>" + Util.formatCCY(car.getE03RCSAMD()) + "</div>");
				buffer.append("</td>");
				//Credit
				buffer.append("<td align=\"right\" width=\"19%\">");
				buffer.append("<div>" + Util.formatCCY(car.getE03RCSAMC()) + "</div>");
				buffer.append("</td>");
			}
			buffer.append("</tr>");
		}
		if (rows > 0) {
			for (int i = start; i < rows; i++) {
				buffer.append("<tr>");
				buffer.append("<td align=\"center\" width=\"5%\">");
				buffer.append("<input type=\"checkbox\" id=\"" + id + "\" name=\"" + id + "\" value=\"" + i + "\" disabled=\"disabled\" />");
				buffer.append("</td>");
				//Date
				buffer.append("<td align=\"center\" width=\"19%\">");
				buffer.append("<div> </div>");
				buffer.append("</td>");
				//Reference
				buffer.append("<td align=\"center\" width=\"19%\">");
				buffer.append("<div> </div>");
				buffer.append("</td>");
				//Code
				buffer.append("<td align=\"center\" width=\"19%\">");
				buffer.append("<div> </div>");
				buffer.append("</td>");
				//Debit
				buffer.append("<td align=\"right\" width=\"19%\">");
				buffer.append("<div> </div>");
				buffer.append("</td>");
				//Credit
				buffer.append("<td align=\"right\" width=\"19%\">");
				buffer.append("<div> </div>");
				buffer.append("</td>");
				buffer.append("</tr>");
			}
		}
		buffer.append("</table>");
		
		sendXMLResponse(res, buffer);
	}

	private void procActStatementEnter(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ERC0040", req);
			ERC004001Message msg = (ERC004001Message) mp.getMessageRecord("ERC004001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ERC0040");
			msg.setH01OPECOD("0015");
			msg.setH01TIMSYS(getTimeStamp());
			
			try {
				msg.setE01BRMEID(req.getParameter("E01BRMEID").trim());
				userPO.setBank(req.getParameter("E01BRMEID").trim());
			} catch (Exception e) {
				msg.setE01BRMEID(userPO.getBank());
			}
			
			try {
				msg.setE01BRMCTA(req.getParameter("E01BRMCTA").trim());
				userPO.setAccNum(req.getParameter("E01BRMCTA").trim());
			} catch (Exception e) {
				msg.setE01BRMCTA(userPO.getAccNum());
			}
			
			mp.sendMessage(msg);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("ERC0040_rcbank_enter_selection.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				msg = (ERC004001Message) mp.receiveMessageRecord("ERC004001");
				JBObjList ibsList = mp.receiveMessageRecordList("H02FLGMAS");
				JBObjList carList = mp.receiveMessageRecordList("H03FLGMAS");
				session.setAttribute("msg", msg);
				session.setAttribute("ibsList", ibsList);
				session.setAttribute("carList", carList);
				forward("ERC0040_rcbank_list_selection.jsp", req, res);
			}
			
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procReqStatementEnter(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		forward("ERC0040_rcbank_enter_selection.jsp", req, res);
	}

}
