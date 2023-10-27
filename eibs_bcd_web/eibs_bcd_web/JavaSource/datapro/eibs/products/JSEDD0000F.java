 package datapro.eibs.products;

/**
 * Insert the type's description here.
 * Creation date: (2/20/07 6:53:55 PM)
 * @author: Ramses Amaro
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datapro.exception.ServiceLocatorException;
import com.datapro.services.ServiceLocator;

import datapro.eibs.beans.DataSignRule;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0002DSMessage;
import datapro.eibs.beans.EDD550001Message;

import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSProp;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageRecord;

@SuppressWarnings("serial")
public class JSEDD0000F extends JSEIBSServlet {
	
	// RETAIL ACCOUNTS
	
	protected static final int R_RT_SIGN_RULES = 1;
	protected static final int A_RT_SIGN_RULES = 2;
	protected static final int I_RT_SIGN_RULES = 3;
	protected static final int R_RT_SIGNERS = 19;
	protected static final int A_RT_SIGNERS = 20;
	
	protected void getSignCategories(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses) 
		throws ServletException, IOException {
			
		MessageProcessor mp = null;
		String codeflag = "";
		
		codeflag = req.getParameter("Type");
		if ( codeflag == null) codeflag = "FI";
		
		String marker = "";
		String selNew = "";
		String selOld = "";
		String fromRec = "0";
		
		try {				
		
			mp = getMessageProcessor("EWD0002", req);
			MessageRecord newmessage = null;
			EWD0002DSMessage msgHelp = (EWD0002DSMessage)mp.getMessageRecord("EWD0002DS");
			msgHelp.setEWDTBL(codeflag);         	 	
			msgHelp.setEWDSHO(selOld);
			msgHelp.setEWDSHN(selNew);
			msgHelp.setEWDREC(fromRec);
			mp.sendMessage(msgHelp);
						
			newmessage = mp.receiveMessageRecord();
							   
			if (newmessage.getFormatName().equals("EWD0002DS")) {
				
				JBObjList beanList = new JBObjList();
								
				while(true) {
													   
                  	 msgHelp =  (EWD0002DSMessage)newmessage;
					 marker = msgHelp.getEWDOPE();
                           
					 if ( marker.equals("*") ) break;
																			 
					 beanList.addRow(msgHelp);
															  
					 newmessage = mp.receiveMessageRecord();
													
				}
				
				ses.setAttribute("categList", beanList);
			}
			
		} finally {
			if(null != mp){
				mp.close();
			}
		}
	}
	
		
	protected void procReqSignRules(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {
			
			JBObjList beanList = new JBObjList();
			
				
			UserPos	userPO = null;
			Connection cnx = null;
			
			if (!JSEIBSProp.getImgToIFS()) {
				try {
										
					userPO = (datapro.eibs.beans.UserPos)ses.getAttribute("userPO");
					try {
						cnx = ServiceLocator.getInstance().getDBConn("IBS-IMAGE");
					} catch (Exception e) {
						cnx = ServiceLocator.getInstance().newJDBCCon("IBS-IMAGE");
					}
					
					Statement st = cnx.createStatement();
					ResultSet rs = st.executeQuery(
							"SELECT * FROM SCNSIGRULES WHERE ACCUID = " + userPO.getAccNum());
					
					while (rs.next()) {
						DataSignRule dsr = new DataSignRule();
						dsr.setAccUid(rs.getString("ACCUID"));
						dsr.setSigRule(rs.getString("SIGRULE").trim());
						dsr.setAmount(rs.getString("AMOUNT"));
						dsr.setCCYCode(rs.getString("CCYCODE"));
						dsr.setDayTo(rs.getString("dayTo"));
						dsr.setMonthTo(rs.getString("monthTo"));
						dsr.setYearTo(rs.getString("yearTo"));
						dsr.setDayFrom(rs.getString("dayFrom"));
						dsr.setMonthFrom(rs.getString("monthFrom"));
						dsr.setYearFrom(rs.getString("yearFrom"));
						dsr.setStatus(rs.getString("STATUS"));
						
						dsr.setBranch((rs.getString("BRANCH") != null) ? rs.getString("BRANCH") : "");
						dsr.setDocNum((rs.getString("DOCNUM") != null) ? rs.getString("DOCNUM") : "");						
											
						beanList.addRow(dsr);
					}
					rs.close();
					rs = null;
					st.close();
					st = null;
	
					
					
				} catch (SQLException e) {
					flexLog("Error: " + e );
					forward(devPage, req, res);
				} catch (ServiceLocatorException e) {
					flexLog("Error: " + e);
					forward(devPage, req, res);
				} catch (Exception e) {
					flexLog("Error: " + e);
					forward(devPage, req, res);
				} finally {
					try {
						cnx.close();
					} catch (SQLException e) {
						flexLog("Error: " + e);
					}
				}
	
				ses.setAttribute("rulesList", beanList);
				try {
					forward("EDD0000_rt_sign_rules_list.jsp", req, res);
				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
			}

		}
		
	protected void procActSignRules(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

			UserPos userPO = null;
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
			JBObjList rulesList = (JBObjList)ses.getAttribute("rulesList");
			Connection cnx = null;
			String sql = "";
			PreparedStatement ps = null;
			String acc = "";
			String rule = "";
			String ccycode = "";
			String amount = "";
			String dayto = "";
			String monthto = "";
			String yearto = "";
			String yearfrom = "";
			String monthfrom = "";
			String dayfrom = "";
			String status = "";
			String branch = "";
			String docnum = "";
			
			int action = 0;
			int idx = 0;
			int error = 0;
			DataSignRule dsr;
			
			try {
				action = Integer.parseInt(req.getParameter("action"));
			} catch (Exception e) {
				action = 0;
			}
			try {
				idx = Integer.parseInt(req.getParameter("ROW"));
			} catch (Exception e) {
				idx = 0;
			}			
			if (action != 3) {
				try {
					acc = req.getParameter("ACCUID");
					rule = req.getParameter("SIGRULE");
					amount = req.getParameter("AMOUNT");
					ccycode = req.getParameter("CCYCODE");
					yearto = "" + Integer.parseInt(req.getParameter("yearTo"));
					monthto = "" + Integer.parseInt(req.getParameter("monthTo"));
					dayto = "" + Integer.parseInt(req.getParameter("dayTo"));					
					yearfrom = "" + Integer.parseInt(req.getParameter("yearFrom"));
					monthfrom = "" + Integer.parseInt(req.getParameter("monthFrom"));
					dayfrom = "" + Integer.parseInt(req.getParameter("dayFrom"));					
					branch = req.getParameter("BRANCH");
					status = req.getParameter("STATUS");
					docnum = req.getParameter("DOCNUM");
					 
					double damt = Util.parseCCYtoDouble(amount);
					amount = new BigDecimal(damt).setScale(2,BigDecimal.ROUND_CEILING).toString();
					
				} catch (Exception e) {
					amount ="0";
				}
			}
			
			try {
										
				try {
					cnx = ServiceLocator.getInstance().getDBConn("IBS-IMAGE");
				} catch (Exception e) {
					cnx = ServiceLocator.getInstance().newJDBCCon("IBS-IMAGE");
				}
				 
				switch (action){
					case 1: // New
					      if (verifyDuplicateKeyJDBC(cnx,acc,rule,ccycode)) error = 1;
					      else {
							sql = "INSERT INTO SCNSIGRULES (ACCUID, SIGRULE, CCYCODE, AMOUNT, DAYFROM, MONTHFROM, YEARFROM, DAYTO, MONTHTO, YEARTO, STATUS, BRANCH, DOCNUM, TYPEMAINT, RULELMU, RULELMD, RULELMM, RULELMY) " +
							"VALUES (" + acc + ",'" + rule + "','" + ccycode + "'," + amount + "," + dayfrom + "," + monthfrom + "," + yearfrom + "," + dayto + "," + monthto + "," + yearto + "," + status + ",'" + branch + "'," +
									"" + docnum + ", 'I','"+user.getH01USR()+"',"+user.getE01RDD()+","+user.getE01RDM()+","+user.getE01RDY()+")" ;
							ps = cnx.prepareStatement(sql);
							ps.executeUpdate();
							
							saveHistoryU(user, userPO, cnx, ps, acc, rule, ccycode);
							
						  }
					      break;
					case 2: // Maintenance 
					      rulesList.setCurrentRow(idx-1);
						  dsr = (DataSignRule) rulesList.getRecord();
						  if (dsr.getSigRule().equals(rule) && dsr.getCCYCode().equals(ccycode)) { // Update rule
							  
							saveHistoryU(user, userPO,cnx, ps, acc, dsr.getSigRule(), dsr.getCCYCode());  
							
							sql = "UPDATE SCNSIGRULES SET Amount = " + amount + 
								  ", DayFrom = " + dayfrom + ", MonthFrom = " + monthfrom + ", YearFrom = " + yearfrom +
								  ", DayTo = " + dayto + ", MonthTo = " + monthto + ", YearTo = " + yearto +
								  ", Status = " + status +
								  ", Branch = '" + branch + "'" +
								  ", DocNum = " + docnum +
								  ", TypeMaint = 'U'" + 
								  ", Rulelmu = "+"'"+user.getH01USR()+"'"+
								  ", Rulelmd = " + user.getE01RDD().trim() +
								  ", Rulelmm = " + user.getE01RDM().trim() +
								  ", Rulelmy = " + user.getE01RDY().trim() +
								  ", Rulelmt = GETDATE()" +
								  " WHERE ACCUID =" + acc + " AND SIGRULE = '" + rule +"' AND CCYCODE = '" + ccycode +"' "; 
							ps = cnx.prepareStatement(sql);
							ps.executeUpdate(); 
							
							saveHistoryU(user, userPO,cnx, ps, acc, dsr.getSigRule(), dsr.getCCYCode());
							
						  } else { //Modifify rule
							if (verifyDuplicateKeyJDBC(cnx,acc,rule,ccycode)) error = 1;
							else {
								
								sql = "DELETE FROM SCNSIGRULES WHERE ACCUID =" + acc + " AND SIGRULE = '" + dsr.getSigRule() +"' AND CCYCODE = '" + dsr.getCCYCode().trim()+"'";
								ps = cnx.prepareStatement(sql);
								ps.executeUpdate();
								// Insert 
								sql = "INSERT INTO SCNSIGRULES (ACCUID, SIGRULE, CCYCODE, AMOUNT, DAYFROM, MONTHFROM, YEARFROM, DAYTO, MONTHTO, YEARTO, STATUS, BRANCH, DOCNUM) " +
								"VALUES (" + acc + ",'" + rule + "','" + ccycode + "'," + amount + "," + dayfrom + "," + monthfrom + "," + yearfrom + "," + dayto + "," + monthto + "," + yearto + "," + status + ",'" + branch + "'," + docnum + ")" ;
								ps = cnx.prepareStatement(sql);
								ps.executeUpdate();
								
								saveHistoryU(user, userPO, cnx, ps, acc, dsr.getSigRule(), dsr.getCCYCode());
								
							}
						  }					     
						 break;
					case 3: // Delete
					     rulesList.setCurrentRow(idx);
					     dsr = (DataSignRule) rulesList.getRecord();
					     
					     saveHistoryD(user, userPO, cnx, ps, dsr.getAccUid().trim(), dsr.getSigRule(), dsr.getCCYCode());
					     
						 sql = "DELETE FROM SCNSIGRULES WHERE ACCUID =" + dsr.getAccUid().trim() + " AND SIGRULE = '" + dsr.getSigRule().trim()+"' AND CCYCODE = '" + dsr.getCCYCode().trim()+"'";
						 ps = cnx.prepareStatement(sql);
						 ps.executeUpdate();
						 break;
					default :
						forward(devPage, req, res);
						break;
				}
								
			} catch (SQLException e) {
				flexLog("\n Error: " + e  + "sql : " + sql);
				forward(devPage, req, res);
				error = 2;
			} catch (ServiceLocatorException e) {
				flexLog("\n Error: " + e + "sql : " + sql);
				forward(devPage, req, res);
				error = 2;
			} catch (Exception e) {
				flexLog("\n Error: " + e + "sql : " + sql);
				//change to page of sql error
				forward(devPage, req, res);
				error = 2;
			} finally {
				try {
					cnx.close();
				} catch (SQLException e) {
					flexLog("\n Error: " + e + "sql : " + sql);
				}
			}    
			
			switch (action) {
				case 1 :
				case 2 :
						if (error == 0 )	{
								res.setContentType("text/html");
								PrintWriter out = res.getWriter();
								out.println("<HTML>");
								out.println("<HEAD>");
								out.println("<TITLE>Close</TITLE>");
								out.println("</HEAD>");
								out.println("<BODY>");
								out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
								out.println("		top.opener.document.forms[0].SCREEN.value = '3';");
								out.println("		top.opener.document.forms[0].submit();");
								out.println("		top.close();");
								out.println("</SCRIPT>");
								out.println("<P>Close it!!!</P>");
								out.println("</BODY>");
								out.println("</HTML>");
								out.close();		
						} else {
							String urlpage = "EDD0000_rt_sign_rules_maint.jsp?ERROR="+ error + 
							   				"&RULE=" + rule + "&AMOUNT=" + amount;
							 if (action == 2) urlpage = urlpage + "&ROW=" + idx;
							forward(urlpage, req, res);
						}
						break;
				case 3 :
						if (error != 0 ){
							String urlpage = "EDD0000_rt_sign_rules_list.jsp?ERROR="+ error;
							forward(urlpage, req, res);
						} else 
							procReqSignRules(user, req, res, ses);
						break;
			}
		}

	protected boolean verifyDuplicateKey(JBObjList list, String acc, String rule, String ccycode) {
		boolean duplicate = false;
		if (!list.getNoResult()) {
			list.initRow();
			while (list.getNextRow()) {
				DataSignRule dsr = (DataSignRule) list.getRecord();
				if (dsr.getAccUid().equals(acc) && dsr.getSigRule().equals(rule) && dsr.getCCYCode().equals(ccycode)) {
					duplicate =true;
					break;
				}
			}
		}
		return duplicate;
	}
	
	protected boolean verifyDuplicateKeyJDBC(Connection cnx, String acc, String rule, String ccycode) {
		boolean duplicate = false;
		String sql="";
		try{			
			Statement st = cnx.createStatement();
			sql = "SELECT * FROM SCNSIGRULES WHERE ACCUID = " + acc + " AND SIGRULE = '" + rule + "' AND CCYCODE = '" + ccycode + "'";
			ResultSet rs = st.executeQuery(sql);
			if (rs.next()) duplicate = true;
			rs.close();
			rs = null;
			st.close();
			st = null;
		} catch (SQLException e) {
			flexLog("\n Error: " + e + "sql :" + sql );
			duplicate =true;
		}
		return duplicate;
	}
	
	/**
		 * This method was created in VisualAge.
		 */
		protected void procReqSignerList(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			EDD550001Message msgRT = null;
			ELEERRMessage msgError = null;
			UserPos userPO = null;
			
			msgError = new datapro.eibs.beans.ELEERRMessage();
			
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

			String opCode = null;
			opCode = "0004";

			// Send Initial data
			try {
				mp = getMessageProcessor("EDD5500", req);
				msgRT = (EDD550001Message) mp.getMessageRecord("EDD550001");
				msgRT.setH01USR(user.getH01USR());
				msgRT.setH01PGM("EDD5500");
				msgRT.setH01TIM(getTimeStamp());
				msgRT.setH01SCR("01");
				msgRT.setH01OPE(opCode);
				msgRT.setE01CUN(userPO.getAccNum());
				msgRT.setE01RTP("S");
				mp.sendMessage(msgRT);

				// Receive Error or Data Message
				
				newmessage = mp.receiveMessageRecord();
	
				if (newmessage.getFormatName().equals("ELEERR")) {
	
					msgError = (ELEERRMessage) newmessage;
					ses.setAttribute("error", msgError);
					
					if (userPO.getOption().equals("RT")) {
						try {
							forward("EDD0000_rt_basic.jsp", req, res);
						} catch (Exception e) {
							flexLog("Exception calling page " + e);
						}
					} else if (userPO.getOption().equals("SV")) {
						try {
							forward("EDD0000_sv_basic.jsp", req, res);
						} catch (Exception e) {
							flexLog("Exception calling page " + e);
						}
					}
				} 
				else if (newmessage.getFormatName().equals("EDD550001")) {
	
				
					JBObjList beanList = new datapro.eibs.beans.JBObjList();
				
					//boolean firstTime;
					String marker = "";
	
					while (true) {
						
						msgRT = (EDD550001Message) newmessage;
										
						marker = msgRT.getH01MAS();
		
						if (marker.equals("*")) {
							beanList.setShowNext(false);
							break;
						} else {
							beanList.addRow(msgRT);
						}
						newmessage = mp.receiveMessageRecord();
					}
	
				
					
					flexLog("Putting java beans into the session");
					//ses.setAttribute("userPO", userPO);
					ses.setAttribute("signersList", beanList);
					ses.setAttribute("error", msgError);
					
					try {
						forward("EDD0000_rt_signers_list.jsp", req, res);
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
					
				} else
						flexLog("Message " + newmessage.getFormatName() + " received.");

			} finally{
				if(null != mp){
					mp.close();
				}
			}

		}
		
	/**
		 * This method was created in VisualAge.
		 */
		protected void procActionSigners(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			EDD550001Message msgRT = null;
			ELEERRMessage msgError = null;
			UserPos userPO = null;
			boolean IsNotError = false;

			JBObjList signersList = (datapro.eibs.beans.JBObjList) ses.getAttribute("signersList");
			msgError = new datapro.eibs.beans.ELEERRMessage();			
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			String opt = req.getParameter("OPTION").trim(); 
			String opecode = "000" + opt; 
			int row = Integer.parseInt(req.getParameter("ROW")); 
			String prevStatus = "";
			// Send Initial data
			// 0009 - Delete
			// 0001 - New
			// 0002 - Maintenance
			
			try {
				mp = getMessageProcessor("EDD5500", req);
				if (opecode.equals("0009")) {
					
					signersList.setCurrentRow(row);
					msgRT = (datapro.eibs.beans.EDD550001Message ) signersList.getRecord(); 
					msgRT.setH01USR(user.getH01USR());
					msgRT.setH01PGM("EDD5500");
					msgRT.setH01TIM(getTimeStamp());
					msgRT.setH01SCR("01");
					msgRT.setH01OPE(opecode);
					msgRT.setE01RTP("S");
					prevStatus = msgRT.getE01RTY();
					msgRT.setE01RTY("D"); //Delete
					
				} else {
				
					msgRT = (EDD550001Message) mp.getMessageRecord("EDD550001");
					msgRT.setH01USR(user.getH01USR());
					msgRT.setH01PGM("EDD5500");
					msgRT.setH01TIM(getTimeStamp());
					msgRT.setH01SCR("01");
					msgRT.setH01OPE(opecode);
					msgRT.setE01RTP("S");
					
					prevStatus = req.getParameter("E01RTY");
					setMessageRecord(req, msgRT);
					if (!prevStatus.equals("N")) msgRT.setE01RTY("M"); //Maintenance  
				}
				//msgRT.send();
				mp.sendMessage(msgRT);

			// Receive Error Message
			
				newmessage = mp.receiveMessageRecord();

				if (newmessage.getFormatName().equals("ELEERR")) {
					msgError = (ELEERRMessage) newmessage;
					IsNotError = msgError.getERRNUM().equals("0");
					flexLog("IsNotError = " + IsNotError);
				} else
					flexLog("Message " + newmessage.getFormatName() + " received.");

			

			// Receive Data
			
				newmessage = mp.receiveMessageRecord();

				if (newmessage.getFormatName().equals("EDD550001")) {
					
					msgRT = (EDD550001Message) newmessage;
					
					flexLog("Putting java beans into the session");
					
					ses.setAttribute("userPO", userPO);
					ses.setAttribute("error", msgError);
					
					if (opecode.equals("0009")) {
						
						if (IsNotError) { // There are no errors
							signersList.setRecord(msgRT,row);
							ses.setAttribute("signersList", signersList);
						}
						
						try {	
							forward("EDD0000_rt_signers_list.jsp", req, res);
	
						} catch (Exception e) {
							flexLog("Exception calling page " + e);
						}
					} else {
						
					      if (IsNotError) { // There are no errors
						
							if (opecode.equals("0001")) signersList.addRow(msgRT);
							else signersList.setRecord(msgRT,row);
							ses.setAttribute("signersList", signersList);
							
							res.setContentType("text/html");
							PrintWriter out = res.getWriter();
							out.println("<HTML>");
							out.println("<HEAD>");
							out.println("<TITLE>Close</TITLE>");
							out.println("</HEAD>");
							out.println("<BODY>");
							out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
							out.println("		top.opener.document.location = '" + super.srctx + getLangPath(user) + "EDD0000_rt_signers_list.jsp'");
							//out.println("		top.opener.document.forms[0].submit();");
							out.println("		top.close();");
							out.println("</SCRIPT>");
							out.println("<P>Close it!!!</P>");
							out.println("</BODY>");
							out.println("</HTML>");
							out.close();
							
						  } else { // There are errors
								    
								ses.setAttribute("rtFirm", msgRT);
								try {
									forward("EDD0000_rt_signers.jsp?OPTION=" + opt, req, res);
								} catch (Exception e) {
									flexLog("Exception calling page " + e);
								}
		
						  }
					}
				} else
					flexLog("Message " + newmessage.getFormatName() + " received.");

			} finally {
				if(null != mp){
					mp.close();
				}
			}
		}
		
		public void saveHistoryU(ESS0030DSMessage user, UserPos userPO, Connection cnx, PreparedStatement ps,String acc, 
				String rule, String ccycode){
			
			// Insert 
			String sqlin=" SELECT" +
					" ACCUID, SIGRULE, CCYCODE, AMOUNT, DAYFROM, MONTHFROM, YEARFROM, DAYTO, MONTHTO, YEARTO, STATUS, BRANCH, DOCNUM, " +
					" TYPEMAINT, RULELMU, RULELMM, RULELMD, RULELMY" +
					" FROM SCNSIGRULES WHERE ACCUID = " + acc + " AND SIGRULE = '" + rule + "' AND CCYCODE = '" + ccycode + "'";
			String sql = "INSERT INTO SCNSIGRULHI (" +
					"ACCUID, SIGRULE, CCYCODE, AMOUNT, DAYFROM, MONTHFROM, YEARFROM, DAYTO, MONTHTO, YEARTO, STATUS, BRANCH, DOCNUM, " +
					" TYPEMAINT, RULELMU, RULELMM, RULELMD, RULELMY)" +
					" "+sqlin+";";
			
			try {
				ps = cnx.prepareStatement(sql);
				ps.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}	
		
		public void saveHistoryD(ESS0030DSMessage user, UserPos userPO, Connection cnx, PreparedStatement ps,String acc, 
				String rule, String ccycode){
			
			// Insert 
			String sqlin=" SELECT" +
					" ACCUID, SIGRULE, CCYCODE, AMOUNT, DAYFROM, MONTHFROM, YEARFROM, DAYTO, MONTHTO, YEARTO, STATUS, BRANCH, DOCNUM, " +
					" 'D', RULELMU, RULELMM, RULELMD, RULELMY " +
					" FROM SCNSIGRULES WHERE ACCUID = " + acc + " AND SIGRULE = '" + rule + "' AND CCYCODE = '" + ccycode + "'";
			String sql = "INSERT INTO SCNSIGRULHI (" +
					"ACCUID, SIGRULE, CCYCODE, AMOUNT, DAYFROM, MONTHFROM, YEARFROM, DAYTO, MONTHTO, YEARTO, STATUS, BRANCH, DOCNUM, " +
					" TYPEMAINT, RULELMU, RULELMM, RULELMD, RULELMY)" +
					" "+sqlin+";";
			
			try {
				ps = cnx.prepareStatement(sql);
				ps.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}

	@Override
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
				switch (screen) {
				
				case R_RT_SIGN_RULES :
				    getSignCategories(user, req, res, session);
					procReqSignRules(user, req, res, session);
					break;					
				case A_RT_SIGN_RULES :
					procActSignRules(user, req, res, session);
					break;
				case I_RT_SIGN_RULES :
					procReqSignRules(user, req, res, session);
					break;
				case R_RT_SIGNERS :
					procReqSignerList(user, req, res, session);
					break;
				case A_RT_SIGNERS :
					procActionSigners(user, req, res, session);
				    break;		
			}
	}
}