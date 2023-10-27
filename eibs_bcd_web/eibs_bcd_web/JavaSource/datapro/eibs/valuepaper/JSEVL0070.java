package datapro.eibs.valuepaper; 

/**
 * Insert the type's description here.
 * Creation date: (6/29/04 5:30:00 PM)
 * @author: Antonio Blanco
 */
import java.io.*;
import java.net.*;
import java.beans.Beans;
import javax.servlet.*;
import javax.servlet.http.*;
import datapro.eibs.beans.*;

import datapro.eibs.master.Util;

import datapro.eibs.sockets.*;

public class JSEVL0070 extends datapro.eibs.master.SuperServlet {

	
	protected static final int R_SEARCH_B = 100;
	protected static final int R_SEARCH_A = 200;
	protected static final int A_SEARCH_B = 300;
	protected static final int A_SEARCH_A = 400;
	
	protected static final int R_SEARCH_B_ANUL = 1000;
	protected static final int A_SEARCH_B_ANUL = 3000;
	protected static final int A_SEARCH_B_ANULA = 6000;

	protected String LangPath = "S";

	/**
	 * JSECLI001 constructor comment.
	 */
	public JSEVL0070() {
		super();
	}
	/**
	 * This method was created by Orestes Garcia.
	 */
	public void destroy() {

		flexLog("free resources used by JSEVL0070");

	}
	/**
	 * This method was created by Orestes Garcia.
	 */
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}
	/**
	 * This method was created in VisualAge.
	 */
	protected void procReqListB(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		ELEERRMessage msgError = null;
		EVL007001Message msgSearch = null;
		EVL007003Message msgList = null;
		
		JBObjList beanList = null;
		UserPos userPO = null;
		boolean IsNotError = false;

		//userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		int posi = 0;
		// Send Initial data
		try {
			flexLog("Send Initial Data");
			msgSearch = (EVL007001Message) mc.getMessageRecord("EVL007001");
			msgSearch.setH01USERID(user.getH01USR());
			msgSearch.setH01PROGRM("EVL0070");
			msgSearch.setH01TIMSYS(getTimeStamp());
			msgSearch.setH01SCRCOD("01");
			msgSearch.setH01OPECOD("0015");
//			all the fields here
			 java.util.Enumeration enu = msgSearch.fieldEnumeration();
			 MessageField field = null;
			 String value = null;
			 while (enu.hasMoreElements()) {
				 field = (MessageField) enu.nextElement();
				 try {
					 value = req.getParameter(field.getTag()).toUpperCase().trim();
					 if (value != null) {
						 field.setString(value);
					 }
				 } catch (Exception e) {
				 }
			 }
		    
			msgSearch.send();
			msgSearch.destroy();
			flexLog("EVL007001 Message Sent");

			// Receive Message
			newmessage = mc.receiveMessage();

			if (newmessage.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage)newmessage;
				IsNotError = msgError.getERRNUM().equals("0");
				flexLog("IsNotError = " + IsNotError);
				ses.setAttribute("error", msgError);
			}
			else
				flexLog("Message " + newmessage.getFormatName() + " received.");

			newmessage = mc.receiveMessage();
		   
		    if (newmessage.getFormatName().equals("EVL007003")) {
		    	
		    	beanList = new JBObjList();
				String marker = "";

				while (true) {

					msgList = (EVL007003Message) newmessage;

					marker = msgList.getH03FLGMAS();

					if (marker.equals("*")) {
						beanList.setShowNext(false);
						break;
					} else {
						beanList.addRow(msgList);
						if (marker.equals("+")) {
							beanList.setShowNext(true);
							break;
						}
					}
					newmessage = mc.receiveMessage();
				}

								
				flexLog("Putting java beans into the session");
				ses.setAttribute("mtList", beanList);				
				
				try {
					if (IsNotError) { // There are no errors
						flexLog("About to call Page: " + LangPath + "EVL0070_value_paper_branch_mov_list.jsp");
						callPage(LangPath + "EVL0070_value_paper_branch_mov_list.jsp", req, res);						
					} else {
						flexLog("About to call Page: " + LangPath + "EVL0070_value_paper_branch_mov_inq.jsp");
						callPage(LangPath + "EVL0070_value_paper_branch_mov_inq.jsp", req, res);
					}
				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
			}
			else if (newmessage.getFormatName().equals("EVL007001")) {
				
				msgSearch = (EVL007001Message) newmessage;
				ses.setAttribute("msgMT", msgSearch);
				
				try {
					flexLog("About to call Page: " + LangPath + "EVL0070_value_paper_branch_mov_inq.jsp");
					callPage(LangPath + "EVL0070_value_paper_branch_mov_inq.jsp", req, res);
				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
			} 
			else {
				flexLog("Message " + newmessage.getFormatName() + " received.");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

	}

	/**
	 * This method was created in VisualAge.
	 */
	protected void procReqListBAnul(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		ELEERRMessage msgError = null;
		EVL007001Message msgSearch = null;
		EVL007003Message msgList = null;
		
		JBObjList beanList = null;
		boolean IsNotError = false;

		UserPos userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		int posi = 0;
		// Send Initial data
		try {
			flexLog("Send Initial Data");
			msgSearch = (EVL007001Message) mc.getMessageRecord("EVL007001");
			msgSearch.setH01USERID(user.getH01USR());
			msgSearch.setH01PROGRM("EVL0070");
			msgSearch.setH01TIMSYS(getTimeStamp());
			msgSearch.setH01SCRCOD("01");
			msgSearch.setH01OPECOD("0035");
//			all the fields here
			 java.util.Enumeration enu = msgSearch.fieldEnumeration();
			 MessageField field = null;
			 String value = null;
			 while (enu.hasMoreElements()) {
				 field = (MessageField) enu.nextElement();
				 try {
					 value = req.getParameter(field.getTag()).toUpperCase().trim();
					 if (value != null) {
						 field.setString(value);
					 }
				 } catch (Exception e) {
				 }
			 }
		    
			 try {userPO.setHeader10(msgSearch.getE01MOVFD1());
				  } catch (Exception e) {userPO.setHeader10("0");
				  }
			 try {userPO.setHeader11(msgSearch.getE01MOVFD2());
			  	  } catch (Exception e) {userPO.setHeader11("0");
			  	  }
			 try {userPO.setHeader12(msgSearch.getE01MOVFD3());
			  	  } catch (Exception e) {userPO.setHeader12("0");
			  	  }
			 try {userPO.setHeader13(msgSearch.getE01MOVTD1());
			  	  } catch (Exception e) {userPO.setHeader13("0");
			  	  }
			 try {userPO.setHeader14(msgSearch.getE01MOVTD2());
			  	  } catch (Exception e) {userPO.setHeader14("0");
			      }
			 try {userPO.setHeader15(msgSearch.getE01MOVTD3());
			  	  } catch (Exception e) {userPO.setHeader15("0");
			  	  }
			 flexLog("Mensaje "+msgSearch);
			 msgSearch.send();
			 msgSearch.destroy();
			 flexLog("EVL007001 Message Sent");

			 // Receive Message
			 newmessage = mc.receiveMessage();

			 if (newmessage.getFormatName().equals("ELEERR")) {
				 msgError = (ELEERRMessage)newmessage;
				 IsNotError = msgError.getERRNUM().equals("0");
				 flexLog("IsNotError = " + IsNotError);
				 ses.setAttribute("error", msgError);
			 } else
				    flexLog("Message " + newmessage.getFormatName() + " received.");

			 newmessage = mc.receiveMessage();
		   
		     if (newmessage.getFormatName().equals("EVL007003")) {
		    	
		    	beanList = new JBObjList();
				String marker = "";

				while (true) {

					msgList = (EVL007003Message) newmessage;

					marker = msgList.getH03FLGMAS();

					if (marker.equals("*")) {
						beanList.setShowNext(false);
						break;
					} else {
						beanList.addRow(msgList);
						if (marker.equals("+")) {
							beanList.setShowNext(true);
							break;
						}
					}
					newmessage = mc.receiveMessage();
				}
								
				flexLog("Putting java beans into the session");
				ses.setAttribute("mtList", beanList);				
				ses.setAttribute("userPo", userPO);				
				
				try {
					if (IsNotError) { // There are no errors
						flexLog("About to call Page: " + LangPath + "EVL0070_value_paper_branch_mov_list_anul.jsp");
						callPage(LangPath + "EVL0070_value_paper_branch_mov_list_anul.jsp", req, res);						
					} else {
						flexLog("About to call Page: " + LangPath + "EVL0070_value_paper_branch_mov_inq_anul.jsp");
						callPage(LangPath + "EVL0070_value_paper_branch_mov_inq_anul.jsp", req, res);
					}
				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
			}
			else if (newmessage.getFormatName().equals("EVL007001")) {				
				msgSearch = (EVL007001Message) newmessage;
				ses.setAttribute("msgMT", msgSearch);				
				try {
					flexLog("About to call Page: " + LangPath + "EVL0070_value_paper_branch_mov_inq_anul.jsp");
					callPage(LangPath + "EVL0070_value_paper_branch_mov_inq_anul.jsp", req, res);
				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
			} 
			else {
				flexLog("Message " + newmessage.getFormatName() + " received.");
			}			
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}
	}

	/**
	 * This method was created in VisualAge.
	 */
	protected void procReqListBAnula(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		EVL007003Message msgMT = null;
		JBObjList beanList= null;
		MessageRecord newmessage = null;
		boolean IsNotError = false;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		try {		
			flexLog("Send Initial Data");
			beanList = (JBObjList) ses.getAttribute("mtList");
			int row = Integer.parseInt(req.getParameter("ROW"));
			beanList.setCurrentRow(row);
			
			msgMT = (EVL007003Message) beanList.getRecord();			
			msgMT.setH03USERID(user.getH01USR());
			msgMT.setH03PROGRM("EVL0070");
			msgMT.setH03TIMSYS(getTimeStamp());
			msgMT.setH03SCRCOD("01");
			msgMT.setH03OPECOD("0035");
						
			flexLog("Envia mensaje anulacion "+msgMT);
			mc.sendMessage(msgMT);
			// Receive Error Message
			newmessage = mc.receiveMessage();
	
			if (newmessage.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage) newmessage;
				IsNotError = msgError.getERRNUM().equals("0");
				flexLog("IsNotError = " + IsNotError);
			} else
				flexLog("Message " + newmessage.getFormatName() + " received.");
			// Receive Data
			newmessage = mc.receiveMessage();
	
			if (newmessage.getFormatName().equals("EVL007003")) {
				msgMT = (EVL007003Message) newmessage;
				if (IsNotError) {
					String href = req.getContextPath() + "/pages/s/MISC_search_wait.jsp?URL='" + req.getContextPath() + "/servlet/datapro.eibs.valuepaper.JSEVL0070?SCREEN=3000'";
					res.sendRedirect(super.srctx + "/servlet/datapro.eibs.valuepaper.JSEVL0070?SCREEN=3000&E01MOVBNK="+msgMT.getE03MOVBNK()+"&E01MOVBRN="+msgMT.getE03MOVBRN()+"&E01MOVTIP="+msgMT.getE03MOVTIP()+"&E01MOVSUB="+msgMT.getE03MOVSUB()+"&E01MOVFD1="+userPO.getHeader10()+"&E01MOVFD2="+userPO.getHeader11()+"&E01MOVFD3="+userPO.getHeader12()+"&E01MOVTD1="+userPO.getHeader13()+"&E01MOVTD2="+userPO.getHeader14()+"&E01MOVTD3="+userPO.getHeader15());
				} else {
					flexLog("Putting java beans into the session");
					ses.setAttribute("error", msgError);
					beanList.setRecord(msgMT,row);
					ses.setAttribute("appList", beanList);
					ses.setAttribute("userPO", userPO);
					try {
						flexLog("About to call Page: " + LangPath + "EVL0070_value_paper_branch_mov_inq_anul.jsp");
						res.sendRedirect(req.getContextPath() + LangPath + "/EVL0070_value_paper_branch_mov_inq_anul.jsp?ROW=" + row);								
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				}
			}
			else
				flexLog("Message " + newmessage.getFormatName() + " received.");
		
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Exception calling page " + e);
		}	
	}

	/**
	 * This method was created in VisualAge.
	 */
	protected void procReqSearchB(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
		
		EVL007001Message msgSearch = new EVL007001Message();
		ses.setAttribute("msgMT", msgSearch);
		
		try {
			flexLog("About to call Page: " + LangPath + "EVL0070_value_paper_branch_mov_inq.jsp");
			callPage(LangPath + "EVL0070_value_paper_branch_mov_inq.jsp", req, res);
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Exception calling page " + e);
		}

	}

	/**
	 * This method was created in VisualAge.
	 */
	protected void procReqSearchBAnul(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
		
		EVL007001Message msgSearch = new EVL007001Message();
		UserPos userPO = new UserPos();
		ses.setAttribute("msgMT", msgSearch);
		ses.setAttribute("userPO", userPO);
		
		try {
			flexLog("About to call Page: " + LangPath + "EVL0070_value_paper_branch_mov_inq_anul.jsp");
			callPage(LangPath + "EVL0070_value_paper_branch_mov_inq_anul.jsp", req, res);
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Exception calling page " + e);
		}
	}

		/**
		 * This method was created in VisualAge.
		 */
		protected void procReqListA(
			MessageContext mc,
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {
	
			MessageRecord newmessage = null;
			ELEERRMessage msgError = null;
			EVL007002Message msgSearch = null;
			EVL007003Message msgList = null;
			
			JBObjList beanList = null;
			UserPos userPO = null;
			boolean IsNotError = false;
	
			//userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
	
			int posi = 0;
			// Send Initial data
			try {
				flexLog("Send Initial Data");
				msgSearch = (EVL007002Message) mc.getMessageRecord("EVL007002");
				msgSearch.setH02USERID(user.getH01USR());
				msgSearch.setH02PROGRM("EVL0070");
				msgSearch.setH02TIMSYS(getTimeStamp());
				msgSearch.setH02SCRCOD("01");
				msgSearch.setH02OPECOD("0015");
	//			all the fields here
				 java.util.Enumeration enu = msgSearch.fieldEnumeration();
				 MessageField field = null;
				 String value = null;
				 while (enu.hasMoreElements()) {
					 field = (MessageField) enu.nextElement();
					 try {
						 value = req.getParameter(field.getTag()).toUpperCase().trim();
						 if (value != null) {
							 field.setString(value);
						 }
					 } catch (Exception e) {
						flexLog("Exception reading field " + field.getTag());
					 }
				 }
			    
				msgSearch.send();
				msgSearch.destroy();
				flexLog("EVL007002 Message Sent");
	
				// Receive Message
				newmessage = mc.receiveMessage();
	
				if (newmessage.getFormatName().equals("ELEERR")) {
					msgError = (ELEERRMessage)newmessage;
					IsNotError = msgError.getERRNUM().equals("0");
					flexLog("IsNotError = " + IsNotError);
					ses.setAttribute("error", msgError);
				}
				else
					flexLog("Message " + newmessage.getFormatName() + " received.");
	
				newmessage = mc.receiveMessage();
			   
			    if (newmessage.getFormatName().equals("EVL007003")) {
			    	
			    	beanList = new JBObjList();
					String marker = "";
	
					while (true) {
	
						msgList = (EVL007003Message) newmessage;
	
						marker = msgList.getH03FLGMAS();
	
						if (marker.equals("*")) {
							beanList.setShowNext(false);
							break;
						} else {
							beanList.addRow(msgList);
							if (marker.equals("+")) {
								beanList.setShowNext(true);
								break;
							}
						}
						newmessage = mc.receiveMessage();
					}
	
									
					flexLog("Putting java beans into the session");
					ses.setAttribute("mtList", beanList);				
					
					try {
						if (IsNotError) { // There are no errors
							flexLog("About to call Page: " + LangPath + "EVL0070_value_paper_agent_mov_list.jsp");
							callPage(LangPath + "EVL0070_value_paper_agent_mov_list.jsp", req, res);						
						} else {
							flexLog("About to call Page: " + LangPath + "EVL0070_value_paper_agent_mov_inq.jsp");
							callPage(LangPath + "EVL0070_value_paper_agent_mov_inq.jsp", req, res);
						}
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				}
				else if (newmessage.getFormatName().equals("EVL007002")) {
					
					msgSearch = (EVL007002Message) newmessage;
					ses.setAttribute("msgMT", msgSearch);
					
					try {
						flexLog("About to call Page: " + LangPath + "EVL0070_value_paper_agent_mov_inq.jsp");
						callPage(LangPath + "EVL0070_value_paper_agent_mov_inq.jsp", req, res);
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				} 
				else {
					flexLog("Message " + newmessage.getFormatName() + " received.");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e);
				throw new RuntimeException("Socket Communication Error");
			}
	
		}
	
	/**
	 * This method was created in VisualAge.
	 */
	protected void procReqSearchA(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
		
		EVL007002Message msgSearch = new EVL007002Message();
		ses.setAttribute("msgMT", msgSearch);
		
		try {
			flexLog("About to call Page: " + LangPath + "EVL0070_value_paper_agent_mov_inq.jsp");
			callPage(LangPath + "EVL0070_value_paper_agent_mov_inq.jsp", req, res);
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Exception calling page " + e);
		}

	}
	
	public void service(HttpServletRequest req, HttpServletResponse res)
		throws ServletException, IOException {

		MessageContext mc = null;

		ESS0030DSMessage msgUser = null;
		HttpSession session = null;

		session = (HttpSession) req.getSession(false);

		if (session == null) {
			try {
				res.setContentType("text/html");
				printLogInAgain(res.getWriter());
			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Exception ocurred. Exception = " + e);
			}
		} else {

			int screen = R_SEARCH_B;

			try {

				msgUser =
					(datapro.eibs.beans.ESS0030DSMessage) session.getAttribute(
						"currUser");

				// Here we should get the path from the user profile
				LangPath = super.rootPath + msgUser.getE01LAN() + "/";

				try {
					flexLog("Opennig Socket Connection");
					mc = new MessageContext(super.getMessageHandler("EVL0070", req));

					try {
						screen = Integer.parseInt(req.getParameter("SCREEN"));
					} catch (Exception e) {
						flexLog("Screen set to default value");
					}

					switch (screen) {
						case R_SEARCH_B :
							procReqSearchB(msgUser, req, res, session);
							break;
						case R_SEARCH_B_ANUL :
							procReqSearchBAnul(msgUser, req, res, session);
							break;
						case A_SEARCH_B :							
							procReqListB(mc, msgUser, req, res, session);
							break;
						case A_SEARCH_B_ANUL :							
							procReqListBAnul(mc, msgUser, req, res, session);
							break;
						case A_SEARCH_B_ANULA :							
							procReqListBAnula(mc, msgUser, req, res, session);
							break;
						case R_SEARCH_A :
							procReqSearchA(msgUser, req, res, session);
							break;
						case A_SEARCH_A :							
							procReqListA(mc, msgUser, req, res, session);
							break;							
						default :
							res.sendRedirect(super.srctx + LangPath + super.devPage);
							break;
					}
				} catch (Exception e) {
					e.printStackTrace();
					int sck = super.iniSocket + 1;
					flexLog("Socket not Open(Port " + sck + "). Error: " + e);
					res.sendRedirect(super.srctx + LangPath + super.sckNotOpenPage);
					//return;
				} finally {
					mc.close();
				}

			} catch (Exception e) {
				flexLog("Error: " + e);
				res.sendRedirect(super.srctx + LangPath + super.sckNotRespondPage);
			}

		}

	}
	
}