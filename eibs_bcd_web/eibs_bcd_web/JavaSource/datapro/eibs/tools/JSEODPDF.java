package datapro.eibs.tools;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datapro.exception.ServiceLocatorException;
import com.datapro.services.ServiceLocator;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBList;
import datapro.eibs.generic.JBParseTree;
import datapro.eibs.master.JSEIBSMSGProp;
import datapro.eibs.master.JSEIBSProp;
import datapro.eibs.master.JSEIBSServlet;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSEODPDF extends JSEIBSServlet {

	boolean isDataSource = false;

	protected static final int R_INQ_USERS 			= 7;
	protected static final int R_INQ_REPXUSER 		= 5;
	protected static final int R_INQ_REPORTSDB 		= 11;
	protected static final int R_INQ_NEW_REPXUSER 	= 10;
	protected static final int R_INQ_REPORTS 		= 9;
	protected static final int R_INQ_REPSEARCH 		= 3;
	
	protected static final int A_DEL_REPXUSER 		= 4;
	protected static final int A_MOD_REPXUSER 		= 6;
	protected static final int A_NEW_REPXUSER 		= 8;
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);		
		isDataSource = JSEIBSProp.getEODDataSource();
	}
	
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		switch (screen) {
			case R_INQ_USERS :
				procReqUsers(user, req, res, session);
				break;
			case R_INQ_REPXUSER :
				procReqReportsxUserDB(user, req, res, session);
				break;
			case R_INQ_REPORTSDB :
				procReqReportsxUser(user, req, res, session, screen);
				break;
			case R_INQ_NEW_REPXUSER :
				procReqReportsxUserFS(user, screen, req, res, session);
				break;
			case R_INQ_REPORTS :
				procReqReportsAll(user, req, res, session);
				break;
			case R_INQ_REPSEARCH :
				procReqReportsSearch(user, req, res, session);
				break;
			case A_DEL_REPXUSER :
			case A_MOD_REPXUSER :
			case A_NEW_REPXUSER :
				procActMantData(user, screen, req, res, session);
				break;
		
			default :
				forward("MISC_not_available.jsp", req, res);
				break;
		}
	}
	
	protected Connection getConnection() throws ServletException {
		Connection cnx = null;
		try {
			if (isDataSource) {
				cnx = ServiceLocator.getInstance().getDBConn("eibs-server");
			} else {
				cnx = ServiceLocator.getInstance().newJDBCCon("eibs-server");
			}
			return cnx;
		} catch (ServiceLocatorException e) {
			flexLog("Error: " + e.getClass().getName() + " --> " + e);
			throw new ServletException(e.getMessage());
		}
	}
	
	protected ELEERRMessage getSQLError(ELEERRMessage m, String msgReport) {
		m.setERRNUM("1");
		m.setERDF01("REPNUM");
		m.setERDR01("0");
		m.setERNU01("9400");
		m.setERDS01("Report already assign to this user: " + msgReport);
		return m;
	}
	
	protected int getDate(ESS0030DSMessage user, String date) {
		int result = 0;
		int intDTFMT =
			((user.getE01DTF().equals("DMY"))
				? 1
				: ((user.getE01DTF().equals("MDY"))
					? 2
					: ((user.getE01DTF().equals("YMD")) ? 3 : 0)));
		
		if (date != null && !date.trim().equals("")) {
			// range of dates
			switch (intDTFMT) {
				case 1 :
					result =
						Integer.parseInt(
							date.substring(6, 10)
								+ date.substring(3, 5)
								+ date.substring(0, 2));
					break;
				case 2 :
					result =
						Integer.parseInt(
							date.substring(6, 10)
								+ date.substring(0, 2)
								+ date.substring(3, 5));
					break;
				case 3 :
					result =
						Integer.parseInt(
							date.substring(0, 4)
								+ date.substring(5, 7)
								+ date.substring(8, 10));
					break;
			}
		} else {
			result = 0;
		}
		return result;
	}
	

	private void procActMantData(ESS0030DSMessage user, int screen, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		String usercode = req.getParameter("usercode") == null ? user.getH01USR() : req.getParameter("usercode");
		String reportName = req.getParameter("REPNAME") == null ? "" : req.getParameter("REPNAME");
		String[] reportArrayNames = req.getParameterValues("REPNAME");
		String reportNameAnt = req.getParameter("REPNAMEANT") == null ? "" : req.getParameter("REPNAMEANT");
		Connection cnx = null;
		try {
			cnx = getConnection();
			Statement st = cnx.createStatement();
			ResultSet rs =
				st.executeQuery(
						"SELECT CASE WHEN TRIM(BTHGRP) = '' then 'ITEMFOLDER' ELSE TRIM(SUBSTRING(BTHGRP FROM 1 FOR 10)) END AS ITEMFOLDER, BTHUSR " +
						"FROM CNTRLBTH " +
						"WHERE BTHUSR = '" + usercode + "'");
			ArrayList listOfGroups = new ArrayList();
			listOfGroups.add(usercode);
			while (rs.next()) {
				String folder =	(rs.getString(1).trim().equals("ITEMFOLDER") ? "" : rs.getString(1).trim());
				if (!"".equals(folder)) {
					listOfGroups.add(folder.trim());
				}
			}
			if (st != null) st.close();
/*			
			listOfGroups =
				(listOfGroups.length() > 0
					? listOfGroups.substring(0, listOfGroups.length() - 1)
					: "");
*/			
			// check names of tables and fields ...
			ELEERRMessage msgError = new ELEERRMessage(); 
			msgError.setERRNUM("0");
			
			switch (screen) {
				case A_DEL_REPXUSER :
					{
						int j = 0;
						String totalRow = req.getParameter("totalRow") == null ? "0" : req.getParameter("totalRow");
						int counter = Integer.parseInt(totalRow);
						reportArrayNames = new String[counter];
						for (StringTokenizer tk = new StringTokenizer(reportName, "_"); tk.hasMoreElements();) {
							reportArrayNames[j++] = (String) tk.nextElement();
						}
						
						String sql = "DELETE FROM USRRPT WHERE USRUID = ? AND USRRPN = ?";
						PreparedStatement ps = cnx.prepareStatement(sql);
						
						for (int i = 0; i < reportArrayNames.length; i++) {
							ps.setString(1, usercode.trim());
							ps.setString(2, reportArrayNames[i].trim());
							ps.executeUpdate();
						}		
					}
					break;
				case A_MOD_REPXUSER :
					{
						String sql = "UPDATE USRRPT SET USRRPN = ? WHERE USRUID = ? AND USRRPN = ?";
						PreparedStatement ps = cnx.prepareStatement(sql);
						ps.setString(1, reportName.trim());
						ps.setString(2, usercode.trim());
						ps.setString(3, reportNameAnt.trim());
						ps.executeUpdate();
					}
					break;
				case A_NEW_REPXUSER :
					{
						String users = "?";
						for (int i = 1; i < listOfGroups.size(); i++) {
							users += ",?";
						}
						users = "(" + users + ")";
						String sql = "SELECT COUNT(*) FROM USRRPT WHERE USRUID IN " + users + " AND USRRPN = ?";
						PreparedStatement ps1 = cnx.prepareStatement(sql);
						sql = "INSERT INTO USRRPT (USRUID,USRRPN) VALUES (?, ?)";
						PreparedStatement ps2 = cnx.prepareStatement(sql);
						for (int i = 0; i < reportArrayNames.length; i++) {
							ps1.clearParameters();
							int j = 0;
							for (j = 0; j < listOfGroups.size(); j++) {
								ps1.setString(j+1, ((String) listOfGroups.get(j)).trim());
							}
							//ps1.setString(1, listOfGroups.trim());
							ps1.setString(j+1, reportArrayNames[i].trim());
							rs = ps1.executeQuery();
							rs.next();
							if (rs.getInt(1) > 0) {
								//getSQLError(msgError, reportArrayNames[i].trim());	
								rs.close();
								continue;
							}
							rs.close();

							ps2.clearParameters();
							ps2.setString(1, usercode.trim());
							ps2.setString(2, reportArrayNames[i].trim());
							ps2.executeUpdate();
						}
					}
					break;
			}
			session.setAttribute("error", msgError);
			
			if (msgError.getERRNUM().equals("0")) {
				procReqReportsDetails(req, res, usercode, screen);
			} else {
				req.setAttribute("SCREENACT", "" + screen);
				procReqReportsAll(user, req, res, session);			
			}
			
			
			
		} catch (SQLException e) {
			flexLog("Error: " + e.getClass().getName() + " --> " + e);
			throw new ServletException(e.getMessage());
		} finally {
			try {
				if (cnx != null) cnx.close();
			} catch (SQLException e) {
				flexLog("Error: " + e);
			}
		}
	}

	private void procReqReportsDetails(HttpServletRequest req, HttpServletResponse res, String usercode, int screen) throws ServletException, IOException {
		String reportName = req.getParameter("REPNAME");
		
		switch (screen) {
			case 4:
			case 6:
			case 8:
				String servletName = "/servlet/datapro.eibs.tools.JSEODPDF?usercode="
									+ usercode
									+ "&SCREEN=" + R_INQ_NEW_REPXUSER //R_INQ_REPXUSER
									+ "&REPNAME="
									+ reportName;
				redirect(servletName, res);
				break;
	
			default:
				String PageToCall = "EODPDF_user_reports_detail.jsp?usercode="
									+ usercode
									+ "&SCREEN="
									+ screen
									+ "&REPNAME="
									+ reportName;
				forward(PageToCall, req, res);
				break;
		}
	}

	private void procReqReportsSearch(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		String usercode = req.getParameter("usercode") == null ? user.getH01USR() : req.getParameter("usercode");
		Connection cnx = null;
		try {
			cnx = getConnection();
			Statement st = cnx.createStatement();
			ResultSet rs =
				st.executeQuery(
						"SELECT TRIM(SUBSTRING(BTHGRP FROM 1 FOR 10)) FROM CNTRLBTH WHERE BTHUSR = \'" + usercode + "\' ");
		
			String groupUsr = "";
			while (rs.next()) {
				groupUsr = rs.getString(1).trim();
			}
			
			if (st != null) st.close();
			
			st = cnx.createStatement();
			// Table names : USRRPT , IBSRPT
			rs = st.executeQuery(
								"SELECT DISTINCT A.USRRPN, B.IBSDSC FROM "
									+ "USRRPT A, "
									+ "IBSRPT B WHERE (A.USRUID = \'" + usercode + "\' " 
									+ "OR A.USRUID = \'" + groupUsr + "\') " 									
									+ "AND A.USRRPN = B.IBSRPN AND B.IBSLIF = \'" + user.getE01LAN().toUpperCase() + "\' " 
									+ "ORDER BY A.USRRPN");
			
			JBList beanListRepUser = new JBList();
			while (rs.next()) {
				//Radio button generated in JSP
				String colData = rs.getString(1).concat("          ").substring(0, 10)
						+ " - "
						+ rs.getString(2).trim();
				beanListRepUser.addRow("", colData);
			}
			if (st != null) st.close();
			
			session.setAttribute("beanListRepUser", beanListRepUser);
			forward("EODPDF_report_inq.jsp", req, res);
			
		} catch (SQLException e) {
			flexLog("Error: " + e.getClass().getName() + " --> " + e);
			throw new ServletException(e.getMessage());
		} finally {
			try {
				if (cnx != null) cnx.close();
			} catch (SQLException e) {
				flexLog("Error: " + e);
			}
		}
	}

	private void procReqReportsAll(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		Connection cnx = null;
		try {
			cnx = getConnection();
			Statement st = cnx.createStatement();
			ResultSet rs =
				st.executeQuery(
						"SELECT IBSRPN, IBSDSC FROM IBSRPT WHERE IBSLIF = \'"
							+ user.getE01LAN().toUpperCase()
							+ "\' ORDER BY IBSRPN");
			
			JBList beanListRep = new JBList(); 
			while (rs.next()) {
				String myRow = rs.getString(1).trim().concat("          ").substring(0, 10)
						+ " - "
						+ rs.getString(2).trim();
				beanListRep.addRow("", myRow);
			}
			session.setAttribute("beanListRep", beanListRep);
			
			if (st != null) st.close();
			
			String usercode = req.getParameter("usercode") == null ? user.getH01USR() : req.getParameter("usercode");
			String reportName = req.getParameter("REPNAME");
			String screenAct = req.getParameter("SCREENACT") == null ? (String )req.getAttribute("SCREENACT") : req.getParameter("SCREENACT");
			if (screenAct.equals("4")) { //Delete
				String totalRow = req.getParameter("totalRow");
				String areports = req.getParameter("AREPNAME");
				redirect("/servlet/datapro.eibs.tools.JSEODPDF?SCREEN=" + screenAct + "&usercode=" + usercode + "&REPNAME=" + areports + "&totalRow=" + totalRow, res);
			} else {
				String PageToCall = "EODPDF_report_sel.jsp?usercode="
					+ usercode
					+ "&SCREEN="
					+ screenAct
					+ "&REPNAME="
					+ reportName;
				forward(PageToCall, req, res);
			}
			
		} catch (SQLException e) {
			flexLog("Error: " + e.getClass().getName() + " --> " + e);
			throw new ServletException(e.getMessage());
		} finally {
			try {
				if (cnx != null) cnx.close();
			} catch (SQLException e) {
				flexLog("Error: " + e);
			}
		}
	}

	protected boolean isFileInRange(String reportFile, String dateFrom,	String dateTo, String DTFMT, String reportName,	String reportActual) {
		boolean result = false;
		// range of dates
		String ddFrom = "";
		String ddTo = "";
		String mmFrom = "";
		String mmTo = "";
		String yyFrom = "";
		String yyTo = "";

		int intDTFMT =
			((DTFMT.equals("DMY"))
				? 1
				: ((DTFMT.equals("MDY"))
					? 2
					: ((DTFMT.equals("YMD")) ? 3 : 0)));
		
		switch (intDTFMT) {
			case 1 :
				ddFrom = dateFrom.substring(0, 2);
				mmFrom = dateFrom.substring(3, 5);
				yyFrom = dateFrom.substring(6, 10);
				ddTo = dateTo.substring(0, 2);
				mmTo = dateTo.substring(3, 5);
				yyTo = dateTo.substring(6, 10);
				break;
			case 2 :
				ddFrom = dateFrom.substring(3, 5);
				mmFrom = dateFrom.substring(0, 2);
				yyFrom = dateFrom.substring(6, 10);
				ddTo = dateTo.substring(3, 5);
				mmTo = dateTo.substring(0, 2);
				yyTo = dateTo.substring(6, 10);
				break;
			case 3 :
				ddFrom = dateFrom.substring(8, 10);
				mmFrom = dateFrom.substring(5, 7);
				yyFrom = dateFrom.substring(0, 4);
				ddTo = dateTo.substring(8, 10);
				mmTo = dateTo.substring(5, 7);
				yyTo = dateTo.substring(0, 4);
				break;
		}
		// calculate century
		int year = Integer.parseInt(reportFile.substring(7, 9), 10);
		String century = (year > 50) ? "19" : "20";
		
		String dateOfFile =	century	+ reportFile.substring(7, 9) + reportFile.substring(3, 5) + reportFile.substring(5, 7);
		
		boolean ok = true;
		if (reportName.trim().equals("")
			&& reportActual.trim().equals (	reportFile.substring(10, reportFile.length()).trim()))
			ok = true;
		else if (!reportName.equals("")
				&& reportName.trim().equals(reportFile.substring(10, reportFile.length()).trim())
				&& reportName.trim().equals(reportActual.trim()))
				ok = true;
		else ok = false;

		result = (Integer.parseInt(dateOfFile, 10) >= Integer.parseInt(yyFrom + mmFrom + ddFrom, 10)
			&& Integer.parseInt(dateOfFile, 10)	<= Integer.parseInt(yyTo + mmTo + ddTo, 10)
			&& ok);
		
		return result;
	}
	
	private void procReqReportsxUserFS(ESS0030DSMessage user, int screen, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		String usercode = req.getParameter("usercode") == null ? user.getH01USR() : req.getParameter("usercode");
		String dateFrom = req.getParameter("DATEFROM") == null ? "" : req.getParameter("DATEFROM");
		String dateTo = req.getParameter("DATETO") == null ? "" : req.getParameter("DATETO");
		String reportName = req.getParameter("REPNAME") == null ? "" : req.getParameter("REPNAME");
		JBList beanList = new JBList();
		JBList beanListRepGrp = new JBList();

		Connection cnx = null;
		try {
			cnx = getConnection();
			Statement st = cnx.createStatement();
			ResultSet rs =
				st.executeQuery("SELECT CASE WHEN TRIM(BTHGRP) = '' THEN 'ITEMFOLDER' ELSE TRIM(SUBSTRING(BTHGRP FROM 1 FOR 10)) END AS ITEMFOLDER, BTHUSR " +
								"FROM CNTRLBTH " +
								"WHERE BTHUSR = '" + usercode + "' " + 
								"ORDER BY ITEMFOLDER");
			
			String listOfGroups = "";
			while (rs.next()) {
				String folder =	(rs.getString(1).trim().equals("ITEMFOLDER") ? "" : rs.getString(1).trim());
				if (!"".equals(folder)) {
					listOfGroups += ",'"
						+ folder.trim()
						+ "'";
				}
			}

			if (st != null) st.close();
			
/*
			listOfGroups =
				(listOfGroups.length() > 0
					? listOfGroups.substring(0, listOfGroups.length() - 1)
					: "");
*/
			//capture all reports description from database....

			// Table names : USRRPT , IBSRPT
			st = cnx.createStatement();
			rs =
				st.executeQuery(
					"SELECT DISTINCT A.USRRPN, B.IBSDSC, A.USRUID FROM "
						+ "USRRPT A, "
						+ "IBSRPT B WHERE A.USRUID IN ('"
						+ usercode
						+ (listOfGroups.length() > 0
							? "'" + listOfGroups
							: "'")
						+ ") "
						+ "AND A.USRRPN = B.IBSRPN AND B.IBSLIF = '"
						+ user.getE01LAN().toUpperCase()
						+ "'");

			// Receiving
			//ini ListRec
			String colData = "";
			String rowHTML = "";

			File dir = new File(JSEIBSProp.getEODPDFPath());
			String[] filesList = dir.list();

			while (rs.next()) {
				//Radio button generated in JSP
				if (dateFrom.equals("")) {
					colData = rs.getString(1).trim();
					if (colData.equals(""))	colData = "&nbsp;";
					rowHTML =
						"<td nowrap>"
							+ colData.concat("          ").substring(0, 10)
							+ "</td>";
					// Report name
					colData = rs.getString(2).trim();
					if (colData.equals(""))	colData = "&nbsp;";
					rowHTML += "<td nowrap><div nowrap>"
						+ colData
						+ "</div></td>";
					// Description
					beanList.addRow("", rowHTML);
					beanListRepGrp.addRow("", rs.getString(3).trim());
				} else {
					for (int i = 0; i < filesList.length; i++) {
						colData = rs.getString(1).trim();
						if (isFileInRange(filesList[i].trim(),
							dateFrom,
							dateTo,
							user.getE01DTF(),
							reportName,
							colData)) {
							rowHTML =
								"<td nowrap>"
									+ "<a href=\"javascript:openFile('"
									+ filesList[i].trim()
									+ "')\" title=\""
									+ filesList[i].trim()
									+ "\" >"
									+ filesList[i].trim()
									+ "</a></td>";
							colData = rs.getString(2).trim();
							if (colData.equals(""))
								colData = "&nbsp;";
							rowHTML += "<td nowrap><div nowrap>"
								+ colData
								+ "</div></td>";
							// Description
							beanList.addRow("", rowHTML);
						}
					}
				}
			}
			
			if (st != null) st.close();
			
			session.setAttribute("beanList", beanList);
			session.setAttribute("beanListRepGrp", beanListRepGrp);
			procReqReportsDetails(req, res, usercode, screen);
			
		} catch (SQLException e) {
			flexLog("Error: " + e.getClass().getName() + " --> " + e);
			throw new ServletException(e.getMessage());
		} finally {
			try {
				if (cnx != null) cnx.close();
			} catch (SQLException e) {
				flexLog("Error: " + e);
			}
		}
	}

	private void procReqReportsxUser(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		String usercode = req.getParameter("usercode") == null ? user.getH01USR() : req.getParameter("usercode");
		String dateFrom = req.getParameter("DATEFROM") == null ? "" : req.getParameter("DATEFROM");
		String dateTo = req.getParameter("DATETO") == null ? "" : req.getParameter("DATETO");
		String reportName = req.getParameter("REPNAME") == null ? "" : req.getParameter("REPNAME");
		
		int from = getDate(user, dateFrom);
		int to = getDate(user, dateTo);
		if (to == 0) to = 99999999;
		
		JBList beanList = new JBList();
		JBList beanListRepGrp = new JBList();

		Connection cnx = null;
		try {
			cnx = getConnection();
			Statement st = cnx.createStatement();
			ResultSet rs =
				st.executeQuery("SELECT TRIM(SUBSTRING(BTHGRP FROM 1 FOR 10)) FROM CNTRLBTH WHERE BTHUSR = \'" + usercode + "\' ");

			String group = "";
			while (rs.next()) {
				group =	(rs.getString(1).trim().equals("ITEMFOLDER") ? "" : rs.getString(1).trim());
			}
			if (st != null) st.close();
			
			st = cnx.createStatement();
			
			String query = "SELECT E.EDPDTY, E.EDPDTM, E.EDPDTD, "
				+ "A.USRRPN, E.EDPPTH, B.IBSDSC, A.USRUID FROM "
				+ "EODPDF E, "
				+ "USRRPT A, "
				+ "IBSRPT B WHERE A.USRUID IN (\'"
				+ usercode
				+ (group.length() > 0
					? "\'," + "\'" + group + "\'"
					: "'")
				+ ") "
				+ "AND A.USRRPN = B.IBSRPN AND B.IBSLIF = \'"
				+ user.getE01LAN().toUpperCase()
				+ "\' "
				+ "AND ((10000*(E.EDPDTY+2000))+(100*E.EDPDTM)+(E.EDPDTD) >= "
				+ from
				+ ") "
				+ "AND ((10000*(E.EDPDTY+2000))+(100*E.EDPDTM)+(E.EDPDTD) <= "
				+ to
				+ ") AND EDPRPN = B.IBSRPN ORDER BY A.USRRPN";
			
			rs =
				st.executeQuery(query);
			
			String myFlag = "";
			String colData = "";
			String rowHTML = "";
			String prevColData = "";
			while (rs.next()) {
				if (dateFrom.equals("")) {
					colData = rs.getString(4).trim();
					if (colData.equals(""))	colData = "&nbsp;";
					rowHTML =
						"<td nowrap>"
							+ colData.concat("          ").substring(0, 10)
							+ "</td>";
					// Report name
					colData = rs.getString(6).trim();
					if (colData.equals(""))	colData = "&nbsp;";
					rowHTML += "<td nowrap><div nowrap>"
						+ colData
						+ "</div></td>";
					// Description
					if (prevColData.trim().equals("")
						|| !prevColData.trim().equals(colData.trim())) {
						prevColData = colData;
						beanList.addRow(myFlag, rowHTML);
						beanListRepGrp.addRow(myFlag, rs.getString(7).trim());
					}
				} else {
					colData =
						rs.getString(4).trim()
							+ "("
							+ (rs.getString(1).trim().length() < 2
								? "0" + rs.getString(1).trim()
								: rs.getString(1).trim())
							+ "/"
							+ (rs.getString(2).trim().length() < 2
								? "0" + rs.getString(2).trim()
								: rs.getString(2).trim())
							+ "/"
							+ (rs.getString(3).trim().length() < 2
								? "0" + rs.getString(3).trim()
								: rs.getString(3).trim())
							+ ")";

					String url = /*JSEIBSProp.getEODPDFURL()+*/ "/"	+ rs.getString(5).trim();
									    		
					rowHTML =
						"<td nowrap>"
							+ "<a href=\"javascript:openFile('"
							+ url
							+ "')"
							+ "\" title=\"" + colData	+ "\"" +
					     	">"+
							colData +
							 "</a></td>";
					/*rowHTML =
						"<td nowrap>"
							+ "<a href=\"javascript:CenterWindow('"
							+ url
							+ "',600,500,2)"
							+ "\" title=\""
							+ colData
							+ "\" >"
							+ colData
							+ "</a></td>";*/
					colData = rs.getString(6).trim();
					if (colData.equals(""))	colData = "&nbsp;";
					rowHTML += "<td nowrap><div nowrap>"
						+ colData
						+ "</div></td>";
					// Description
					if (reportName.trim().equals("")) {
						beanListRepGrp.addRow(myFlag, rs.getString(7).trim());
						beanList.addRow(myFlag, rowHTML);
					} else if (reportName.trim().equals(rs.getString(4).trim())) {
						beanListRepGrp.addRow(myFlag, rs.getString(7).trim());
						beanList.addRow(myFlag, rowHTML);
					}
				}
			}
			if (st != null) st.close();
			
			session.setAttribute("beanList", beanList);
			session.setAttribute("beanListRepGrp", beanListRepGrp);
			
			procReqReportsDetails(req, res, req.getParameter("usercode"), screen);
			
			
		} catch (SQLException e) {
			flexLog("Error: " + e.getClass().getName() + " --> " + e);
			throw new ServletException(e.getMessage());
		}  finally {
			try {
				if (cnx != null) cnx.close();
			} catch (SQLException e) {
				flexLog("Error: " + e);
			}
		}
	}

	private void procReqReportsxUserDB(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException {
		String usercode = req.getParameter("usercode") == null ? user.getH01USR() : req.getParameter("usercode");
		String dateFrom = req.getParameter("DATEFROM") == null ? "" : req.getParameter("DATEFROM");
		String dateTo = req.getParameter("DATETO") == null ? "" : req.getParameter("DATETO");
		String reportName = req.getParameter("REPNAME") == null ? "" : req.getParameter("REPNAME");
		
		int from = getDate(user, dateFrom);
		int to = getDate(user, dateTo);
		if (to == 0) to = 99999999;
		
		JBList beanList = new JBList();
		JBList beanListRepGrp = new JBList();

		Connection cnx = null;
		try {
			cnx = getConnection();
			Statement st = cnx.createStatement();
			ResultSet rs =
				st.executeQuery(
					"SELECT CASE WHEN TRIM(BTHGRP) = '' THEN 'ITEMFOLDER' ELSE TRIM(SUBSTRING(BTHGRP FROM 1 FOR 10)) END AS ITEMFOLDER, BTHUSR " +
					"FROM CNTRLBTH " + 
					"WHERE BTHUSR = '" + usercode + "' " + 
					"ORDER BY ITEMFOLDER");
			
			String listOfGroups = "";
			while (rs.next()) {
				String folder =	(rs.getString(1).trim().equals("ITEMFOLDER") ? "" : rs.getString(1).trim());
				if (!"".equals(folder)) {
					listOfGroups += ",'"
						+ folder.trim()
						+ "'";
				}
			}
			if (st != null) st.close();
			
/*
			listOfGroups =
				(listOfGroups.length() > 0
					? listOfGroups.substring(0, listOfGroups.length() - 1)
					: "");
*/			
			st = cnx.createStatement();
			rs = st.executeQuery(
					"SELECT E.EDPDTY, E.EDPDTM, E.EDPDTD, "
						+ "A.USRRPN, E.EDPPTH, B.IBSDSC, A.USRUID FROM "
						+ "EODPDF E, "
						+ "USRRPT A, "
						+ "IBSRPT B WHERE A.USRUID IN ('" 
						+ usercode  
						+ (listOfGroups.length() > 0
								? "'" + listOfGroups
								: "'")
						+ ") "
						+ "AND A.USRRPN = B.IBSRPN AND B.IBSLIF = \'" + user.getE01LAN().toUpperCase() + "\' "
						+ "AND ((10000*(E.EDPDTY+2000))+(100*E.EDPDTM)+(E.EDPDTD) >= "
						+ from
						+ ") "
						+ "AND ((10000*(E.EDPDTY+2000))+(100*E.EDPDTM)+(E.EDPDTD) <= "
						+ to
						+ ") AND EDPRPN = B.IBSRPN ORDER BY A.USRRPN");
			
			String colData = "";
			String prevColData = "";
			String rowHTML = "";
			while (rs.next()) {
				if (dateFrom.equals("")) {
					colData = rs.getString(4).trim();
					if (colData.equals(""))	colData = "&nbsp;";
					rowHTML =
						"<td nowrap>"
							+ colData.concat("          ").substring(0, 10)
							+ "</td>";
					// Report name
					colData = rs.getString(6).trim();
					if (colData.equals(""))	colData = "&nbsp;";
					rowHTML += "<td nowrap><div nowrap>"
						+ colData
						+ "</div></td>";
					// Description
					if (prevColData.trim().equals("")
						|| !prevColData.trim().equals(colData.trim())) {
						prevColData = colData;
						beanList.addRow("", rowHTML);
						beanListRepGrp.addRow("", rs.getString(7).trim());
					}
				} else {
					colData =
						rs.getString(4).trim()
							+ "("
							+ (rs.getString(1).trim().length() < 2
								? "0" + rs.getString(1).trim()
								: rs.getString(1).trim())
							+ "/"
							+ (rs.getString(2).trim().length() < 2
								? "0" + rs.getString(2).trim()
								: rs.getString(2).trim())
							+ "/"
							+ (rs.getString(3).trim().length() < 2
								? "0" + rs.getString(3).trim()
								: rs.getString(3).trim())
							+ ")";
					String url =
						JSEIBSProp.getEODPDFURL()
							+ "/"
							+ rs.getString(5).trim();
					String agency="";
					int agIdx =	url.indexOf('_');
					if (agIdx > 0 && url.substring(agIdx+1).indexOf('_') > 0 
						&& (url.trim().endsWith("pdf") || url.trim().endsWith("PDF")))
				      agency= url.substring(agIdx+1, agIdx+4);
				    
				    rowHTML = "<td nowrap>"+ agency + "</td>";	
				    		
					rowHTML +=
						"<td nowrap>"
							+ "<a href=\"javascript:openFile('"
							+ url
							+ "')"
							+ "\" title=\"" + colData	+ "\"" +
					        " title=\"" + agency	+ "\"" +
							">"+
							colData +
							 "</a></td>";
				/*	rowHTML =
						"<td nowrap>"
							+ "<a href=\"javascript:CenterWindow('"
							+ url
							+ "',600,500,2)"
							+ "\" title=\""
							+ colData
							+ "\" >"
							+ colData
							+ "</a></td>";*/
					colData = rs.getString(6).trim();
					if (colData.equals(""))	colData = "&nbsp;";
					rowHTML += "<td nowrap><div nowrap>"
						+ colData
						+ "</div></td>";
					// Description
					if (reportName.trim().equals("")) {
						beanListRepGrp.addRow("", rs.getString(7).trim());
						beanList.addRow("", rowHTML);
					} else if (reportName.trim().equals(rs.getString(4).trim())) {
						beanListRepGrp.addRow("", rs.getString(7).trim());
						beanList.addRow("", rowHTML);
					}
				}
			}
			if (st != null) st.close();
			
		} catch (SQLException e) {
			flexLog("Error: " + e.getClass().getName() + " --> " + e);
			throw new ServletException(e.getMessage());
		} finally {
			try {
				if (cnx != null) cnx.close();
			} catch (SQLException e) {
				flexLog("Error: " + e);
			}
		}
	}

	private String getTree(ESS0030DSMessage user, HttpServletRequest req, String string, StringBuffer link, boolean bygroup) throws ServletException {
		String outParams = "";
		String where = string.equals("") ? "" : (bygroup ? "WHERE ITEMFOLDER LIKE '" + string.toUpperCase() + "%' " : "WHERE BTHUSR LIKE '" + string.toUpperCase() + "%' ");
		Connection cnx = null;
		try {
			cnx = getConnection();
			Statement st = cnx.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM(" +
					   "SELECT CASE WHEN TRIM(BTHGRP) = '' THEN 'ITEMFOLDER' " +
					   "ELSE TRIM(SUBSTRING(BTHGRP FROM 1 FOR 10)) " +
					   "END as ITEMFOLDER, BTHUSR " +
					   "FROM CNTRLBTH) AS U " +
					   where + 
					   "ORDER BY ITEMFOLDER, BTHUSR");

			String imageUrl = getServerRoot(req) + webAppPath + "/images/";
			JSEIBSMSGProp.setPropertyFileLang(user.getE01LAN().toUpperCase());
			String titleFolder = JSEIBSMSGProp.getMSG0002();
			String titleDescription = JSEIBSMSGProp.getMSG0003();
			boolean firstTime = true;
			
			//create tree structure
			JBParseTree dataTree = new JBParseTree();
			dataTree.init();
			dataTree.setRootFont("Dialog", "bold", "12", "0D23B5");
			dataTree.setFolderFont("Dialog", "plain", "10", "000033");
			dataTree.setItemFont("Small", "plain", "10", "000033");
			dataTree.setImageUrl(imageUrl);

			dataTree.setRootImage("cube.gif", "cubeover.gif");
			dataTree.setFolderImage("cone.gif", "coneover.gif");
			dataTree.setItemImage("ball.gif", "ballover.gif");

			dataTree.setRootTitle(titleFolder, titleDescription);
			dataTree.setTargetLink("detail");
			
			while (rs.next()) {
				String item = rs.getString(2).trim();
				String thisLink =
					getServerRoot(req)
						+ webAppPath
						+ "/servlet/datapro.eibs.tools.JSEODPDF?usercode="
						+ item
						+ "&SCREEN=" + R_INQ_NEW_REPXUSER;
				String folder = (rs.getString(1).trim().equals("ITEMFOLDER") ? "" : rs.getString(1).trim());
				String thisLinkFolder = "";
				if (!folder.trim().equals("")) {
					thisLinkFolder =
						getServerRoot(req)
							+ webAppPath
							+ "/servlet/datapro.eibs.tools.JSEODPDF?usercode="
							+ folder
							+ "&SCREEN=" + R_INQ_NEW_REPXUSER;
				}
				if (firstTime) {
					firstTime = false;
					link.append(thisLinkFolder == "" ? thisLink : thisLinkFolder);
				}
				dataTree.addRow(item, folder, thisLink, thisLinkFolder);
			}
			if (st != null) st.close();
			
			outParams = dataTree.getTree();
			
		} catch (SQLException e) {
			flexLog("Error: " + e.getClass().getName() + " --> " + e);
			throw new ServletException(e.getMessage());
		} finally {
			try {
				if (cnx != null) cnx.close();
			} catch (SQLException e) {
				flexLog("Error: " + e);
			}
		}
		
		return outParams;
	}

	private void procReqUsers(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		StringBuffer firstLink = new StringBuffer();
		String search = req.getParameter("USER") == null ? "?" : req.getParameter("USER");
		boolean byGroup = req.getParameter("TYPE") != null && req.getParameter("TYPE").equals("U") ? false : true;
		String outParams = getTree(user, req, search, firstLink, byGroup);
		session.setAttribute("offerParams", outParams);
		
		res.setContentType("text/html");
		res.setHeader("Pragma", "No-cache");
		res.setDateHeader("Expires", 0);
		res.setHeader("Cache-Control", "no-cache");
		PrintWriter out = res.getWriter();
		out.println("<!-- frames -->");
		out.println("<frameset cols=\"28%,*\">");
		out.println(
			"<frame name=\"list\" src=\""
				+ webAppPath
				+ getLangPath(user)
				+ "EODPDF_users_tree_view.jsp\" marginwidth=\"10\" marginheight=\"10\" scrolling=\"NO\" frameborder=\"NO\">");
		if (firstLink.length() > 0) {
			out.println(
					"<frame name=\"detail\" src=\""
						+ firstLink
						+ "\" marginwidth=\"10\" marginheight=\"10\" scrolling=\"auto\" frameborder=\"NO\">");
		}
		out.println("</frameset>");
		out.close();
	}


}
