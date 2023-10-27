package datapro.eibs.params;

/**
 * Insert the type's description here.
 * Creation date: (1/19/00 6:08:55 PM)
 * @author: David Mavilla
 */
import java.io.*;
import java.net.*;
import java.beans.Beans;
import javax.servlet.*;
import javax.servlet.http.*;
import datapro.eibs.beans.*;

import datapro.eibs.master.Util;

import datapro.eibs.sockets.*;

public class JSEDL0170 extends datapro.eibs.master.SuperServlet {

	// Action 

	protected static final int A_POSITION = 800;

	protected static final int R_PROD_LIST = 400;
	protected static final int R_INQ_PARM  = 200;

	protected static final int R_ENTER = 1;
	
	protected static final int R_NEW = 300;
	protected static final int A_NEW = 350;
	
	protected static final int R_MAINTENANCE = 500;
	protected static final int A_MAINTENANCE = 600;

	protected String LangPath = "S";

	/**
	 * JSEIE00000 constructor comment.
	 */
	public JSEDL0170() {
		super();
	}

	/**
	 * This method was created by Orestes Garcia.
	 */
	public void destroy() {

		flexLog("free resources used by JSEIE00000");

	}
	/**
	 * This method was created by David Mavilla.
	 * 
	 */

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}

	protected void procActionPos(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = false;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		int inptOPT = 0;

		inptOPT = Integer.parseInt(req.getParameter("opt"));

		userPO.setHeader5(req.getParameter("opt"));
		
		switch (inptOPT) {
			case 1 : //Enviar
				procReqMaintenance(mc, user, req, res, ses);
//				res.sendRedirect(
//					super.srctx
//						+ "/servlet/datapro.eibs.params.JSEDL0170?SCREEN=300");
				break;
			case 2 : //Recibir
				procReqMaintenance(mc, user, req, res, ses);
				break;

			case 3 : //Eliminar
				procReqMaintenance(mc, user, req, res, ses);
//				procActionDelete(mc, user, req, res, ses);
				break;

			case 4 : //Consulta
				procReqInquiry(mc, user, req, res, ses);
				break;

			default :
				res.sendRedirect(
					super.srctx
						+ "/servlet/datapro.eibs.params.JSEDL0170?SCREEN=400&ACCION=C");
				break;
		}
	}

	protected void procReqInqParm(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
	throws ServletException, IOException {

		MessageRecord newmessage = null;
		ELEERRMessage msgError = null;
		EDL017001Message msgRT = null;
		UserPos userPO = null;
		boolean IsNotError = false;

		try {flexLog("About to call Page: "
					+ LangPath
					+ "EDL0170_enter_inquiry_doc.jsp");
			callPage(LangPath + "EDL0170_enter_inquiry_doc.jsp", req, res);
			} catch (Exception e) {flexLog("Exception calling page " + e);
					  		  		}
	}

	protected void procReqProdList(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		EDL017001Message msgList = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = false;

		try {msgError = (datapro.eibs.beans.ELEERRMessage) Beans.instantiate(getClass().getClassLoader(),
					    "datapro.eibs.beans.ELEERRMessage");
		    } catch (Exception ex) {flexLog("Error: " + ex);
		                           }

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		// Send Initial data
		try {msgList = (EDL017001Message) mc.getMessageRecord("EDL017001");
			 msgList.setH01USERID(user.getH01USR());
			 msgList.setH01PROGRM("EDL0170");
			 msgList.setH01TIMSYS(getTimeStamp());
			 msgList.setH01SCRCOD("01");
			 msgList.setH01OPECOD("0015");
			 msgList.setE01ACTION(req.getParameter("ACCION"));			
				
			 try {msgList.setE01PFDBNK(req.getParameter("E01PFDBNK").toUpperCase());
				} catch (Exception e) {msgList.setE01PFDBNK("");}
			 try {msgList.setE01PFDBRN(req.getParameter("E01PFDBRN").toUpperCase());
				} catch (Exception e) {msgList.setE01PFDBRN("0");}
			 try {msgList.setE01PFDSTS(req.getParameter("E01PFDSTS").toUpperCase());
				} catch (Exception e) {msgList.setE01PFDSTS("");}
			 try {msgList.setE01PFDINI(req.getParameter("E01PFDINI").toUpperCase());
				} catch (Exception e) {msgList.setE01PFDINI("0");}

			 flexLog("EDL017001 Message Sent "+msgList);
			 msgList.send();
			 msgList.destroy();
		    } catch (Exception e) {e.printStackTrace();
			                       flexLog("Error: " + e);
			                       throw new RuntimeException("Socket Communication Error");
		                          }

		// Receive Data
		try {newmessage = mc.receiveMessage();
			if (newmessage.getFormatName().equals("ELEERR")) {
				try {msgError = (datapro.eibs.beans.ELEERRMessage) Beans.instantiate(getClass().getClassLoader(),
							                       "datapro.eibs.beans.ELEERRMessage");
				    } catch (Exception ex) {flexLog("Error: " + ex);
				                           }

				msgError = (ELEERRMessage) newmessage;

				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);
			}
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e + newmessage);
			throw new RuntimeException("Socket Communication Error Receiving");
		}

		try {newmessage = mc.receiveMessage();
			if (newmessage.getFormatName().equals("EDL017001")) {
				JBObjList beanList = new JBObjList();
				boolean firstTime = true;
				String marker = "";
				String chk = "";
				while (true) {
					msgList = (EDL017001Message) newmessage;

					marker = msgList.getE01ENDFLD();

					if (firstTime) {
						firstTime = false;
						chk = "checked";	
						userPO.setHeader10(msgList.getE01PFDINI());
//						userPO.setHeader5(msgList.getE01PFDSUC());
						userPO.setHeader14(msgList.getE01PFDBRN());
						userPO.setHeader11(msgList.getE01PFDFIN());
  						userPO.setHeader12(msgList.getE01PFDTOT());
						userPO.setHeader13(msgList.getD01PFDSTS());
						userPO.setHeader15(msgList.getE01PFDSUC());
					} else {
							chk = "";
							}

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
				ses.setAttribute("EDL017001", beanList);
				ses.setAttribute("userPO", userPO);
				
				if (req.getParameter("ACCION").equals("E")) {
				try {flexLog("About to call Page: "	+ LangPath + "EDL0170_send_list.jsp");
					 callPage(LangPath + "EDL0170_send_list.jsp", req, res);} 
				catch (Exception e) {flexLog("Exception calling page " + e);}
				} else {
					if (req.getParameter("ACCION").equals("R")) {
						try {flexLog("About to call Page: "	+ LangPath + "EDL0170_recep_list.jsp");
							 callPage(LangPath + "EDL0170_recep_list.jsp", req, res);} 
						catch (Exception e) {flexLog("Exception calling page " + e);}
						} else {
							if (req.getParameter("ACCION").equals("L")) {
								try {flexLog("About to call Page: "	+ LangPath + "EDL0170_del_list.jsp");
									 callPage(LangPath + "EDL0170_del_list.jsp", req, res);} 
								catch (Exception e) {flexLog("Exception calling page " + e);}
							} else {
								if (req.getParameter("ACCION").equals("C")) {
									try {flexLog("About to call Page: "	+ LangPath + "EDL0170_inquiry_list.jsp");
									 	callPage(LangPath + "EDL0170_inquiry_list.jsp", req, res);} 
									catch (Exception e) {flexLog("Exception calling page " + e);}
									}
							}
					}
				}
			} else
				flexLog("Message " + newmessage.getFormatName() + " received.");

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Data Receiving");
		}
	}
	
	
	protected void procActionMaintenance(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		EDL017001Message msgRT = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = false;
		int acctype = 0;

		try {msgError = new datapro.eibs.beans.ELEERRMessage();
		    } catch (Exception ex) {
			                        flexLog("Error: " + ex);
		                           }

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		// Send Initial data
		try {
//			JBObjList bl = (JBObjList) ses.getAttribute("EDL017001");
//			int idx = Integer.parseInt(req.getParameter("CURRCODE").trim());
//			bl.setCurrentRow(idx);
			
			flexLog("Send Initial Data");
			msgRT = (EDL017001Message) ses.getAttribute("refCodes");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EDL0170");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");			
			msgRT.setH01OPECOD("0010");

			// all the fields here       

			java.util.Enumeration enu = msgRT.fieldEnumeration();
			MessageField field = null;
			String value = null;
			while (enu.hasMoreElements()) {
				field = (MessageField) enu.nextElement();
				try {
					value = req.getParameter(field.getTag()).toUpperCase();
					if (value != null) {
						field.setString(value);
						}
					} catch (Exception e) {
										  }    
			}

			try {msgRT.setE01ACTION(userPO.getHeader5());
			} catch (Exception e) {}
			
//				try {msgRT.setE01CNTPRO(req.getParameter("E01CNTPRO").toUpperCase());
//					} catch (Exception e) {}
//				try {msgRT.setE01CNTPDE(req.getParameter("E01CNTPDE").toUpperCase());
//				} catch (Exception e) {}
//				try {msgRT.setE01CNTFOR(req.getParameter("E01CNTFOR").toUpperCase());
//				} catch (Exception e) {}
									
			mc.sendMessage(msgRT);
			flexLog("EDL017001 Message Sent "+msgRT);
			msgRT.destroy();
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Error Message
		try {newmessage = mc.receiveMessage();
			if (newmessage.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage) newmessage;
				IsNotError = msgError.getERRNUM().equals("0");
				flexLog("IsNotError = " + IsNotError);
				showERROR(msgError);
				} else
					flexLog("Message " + newmessage.getFormatName() + " received.");
			} catch (Exception e) {
									e.printStackTrace();
									flexLog("Error: " + e);
									throw new RuntimeException("Socket Communication Error");
									}

		// Receive Data
		try {newmessage = mc.receiveMessage();
			if (newmessage.getFormatName().equals("EDL017001")) {
				try {msgRT = new EDL017001Message();
					 flexLog("EDL017001 Message Received" + newmessage.toString());
				    } catch (Exception ex) {
					                        flexLog("Error: " + ex);
				                           }

				msgRT = (EDL017001Message) newmessage;

				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("refCodes", msgRT);
				ses.setAttribute("userPO", userPO);
				if (IsNotError) { // There are no errors
					flexLog("sendRedirect ");
					if (msgRT.getE01ACTION().equals("1")) {
						res.sendRedirect(
								super.srctx	+ "/servlet/datapro.eibs.params.JSEDL0170?SCREEN=400&ACCION=E");
					} else {
						if (msgRT.getE01ACTION().equals("2")) {
							res.sendRedirect(
									super.srctx	+ "/servlet/datapro.eibs.params.JSEDL0170?SCREEN=400&ACCION=R");
						} else {
							if (msgRT.getE01ACTION().equals("3")) {
								res.sendRedirect(
										super.srctx	+ "/servlet/datapro.eibs.params.JSEDL0170?SCREEN=400&ACCION=L");
							}
						}
					}
				} else { // There are errors
					flexLog("About to call Page: " + LangPath + "EDL0170_cntin_maintenance_details.jsp");
					callPage(LangPath + "EDL0170_cntin_maintenance_details.jsp", req, res);
				}
			} else
				flexLog("Message " + newmessage.getFormatName() + " received.");

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

	}

	protected void procActionDelete(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
		throws ServletException, IOException {
	
		MessageRecord newmessage = null;
		EDL017001Message msgRT = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = false;
		int acctype = 0;
	
		try {msgError = new datapro.eibs.beans.ELEERRMessage();
			} catch (Exception ex) {
									flexLog("Error: " + ex);
									}
	
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		try {JBObjList bl = (JBObjList) ses.getAttribute("EDL017001");
			 int idx = Integer.parseInt(req.getParameter("CURRCODE").trim());
			 bl.setCurrentRow(idx);	
			 msgRT = (EDL017001Message) bl.getRecord();								
			} catch (Exception e) {
									e.printStackTrace();
									flexLog("Error: " + e);
									throw new RuntimeException("Socket Communication Error");
								  }		
	
		// Send Initial data
		try {
			flexLog("Send Initial Data");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EDL017001");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01OPECOD("0009");
			// all the fields here
			java.util.Enumeration enu = msgRT.fieldEnumeration();
			MessageField field = null;
			String value = null;
			while (enu.hasMoreElements()) {
				field = (MessageField) enu.nextElement();
				try {
					value = req.getParameter(field.getTag()).toUpperCase();
					if (value != null) {
						field.setString(value);
					}
				} catch (Exception e) {
				}
			}
	
			mc.sendMessage(msgRT);
			msgRT.destroy();
			flexLog("EDL017001 Message Sent");
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}
	
		// Receive Error Message
		try {newmessage = mc.receiveMessage();
			if (newmessage.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage) newmessage;
				IsNotError = msgError.getERRNUM().equals("0");
				flexLog("IsNotError = " + IsNotError);
				showERROR(msgError);
				} else
						flexLog("Message " + newmessage.getFormatName() + " received.");
			
			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);
			ses.setAttribute("userPO", userPO);

			if (IsNotError) { // There are no errors
				res.sendRedirect(super.srctx + "/servlet/datapro.eibs.params.JSEDL0170?SCREEN=400&ACCION=L");
			}
			else { // There are errors
				flexLog("About to call Page: " + LangPath + "EDL0170_cntin_maintenance_list.jsp");
				callPage(LangPath + "EDL0170_cntin_maintenance_list.jsp", req, res);
			     }	
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}	
	}

	protected void procReqNew(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		ELEERRMessage msgError = null;
		EDL017001Message msgRT = null;
		UserPos userPO = null;
		boolean IsNotError = false;
	
		try {flexLog("About to call Page: "
					+ LangPath
					+ "EDL0170_pfpvd_new_details.jsp");
			callPage(LangPath + "EDL0170_pfpvd_new_details.jsp", req, res);
			} catch (Exception e) {
						   			flexLog("Exception calling page " + e);
						  		  }
	}

	protected void procReqNewMessage(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
	throws ServletException, IOException {

		MessageRecord newmessage = null;
		EDL017001Message msgRT = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = false;

		try {msgError =	(datapro.eibs.beans.ELEERRMessage) Beans.instantiate(
									getClass().getClassLoader(),
								"datapro.eibs.beans.ELEERRMessage");
			} catch (Exception ex) {
									flexLog("Error: " + ex);
									}
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		// Send Initial data
		try {
			msgRT = (EDL017001Message) mc.getMessageRecord("EDL017001");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EDL017001");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01OPECOD("0001");

			try {msgRT.setE01PFDBNK(req.getParameter("E01PFDBNK"));
				} catch (Exception e) {
									  }
			try {msgRT.setE01PFDBRN(req.getParameter("E01PFDBRN"));
				} catch (Exception e) {
									  }
			try {msgRT.setE01PFDINI(req.getParameter("E01PFDINI"));
				} catch (Exception e) {
									  }
			try {msgRT.setE01PFDFIN(req.getParameter("E01PFDFIN"));
				} catch (Exception e) {
									  }
				flexLog("EDL017001 Message Sent "+msgRT);
			
			msgRT.send();
			msgRT.destroy();
			flexLog("EDL017001 Message Sent");
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Data
		try {newmessage = mc.receiveMessage();
			if (newmessage.getFormatName().equals("ELEERR")) {
				try {msgError =
						(datapro.eibs.beans.ELEERRMessage) Beans.instantiate(
							getClass().getClassLoader(),
							"datapro.eibs.beans.ELEERRMessage");
				    } catch (Exception ex) {
					                        flexLog("Error: " + ex);
				                           }

				msgError = (ELEERRMessage) newmessage;
				IsNotError = msgError.getERRNUM().equals("0");

				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);
				
				if (IsNotError) { // There are no errors
					res.sendRedirect(super.srctx + "/servlet/datapro.eibs.params.JSEDL0170?SCREEN=300");
				}
				else { // There are errors
					flexLog("About to call Page: " + LangPath + "EDL0170_pfpvd_new_details.jsp");
					callPage(LangPath + "EDL0170_pfpvd_new_details.jsp", req, res);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e + newmessage);
			throw new RuntimeException("Socket Communication Error Receiving");
		}
}
	
	
	protected void procReqMaintenance(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		EDL017001Message msgList = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = false;

		try {msgError =	(datapro.eibs.beans.ELEERRMessage) Beans.instantiate(
									getClass().getClassLoader(),
								"datapro.eibs.beans.ELEERRMessage");
			} catch (Exception ex) {
									flexLog("Error: " + ex);
									}
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		// Send Initial data
		try {msgList = (EDL017001Message) mc.getMessageRecord("EDL017001");
			 msgList.setH01USERID(user.getH01USR());
			 msgList.setH01PROGRM("EDL017001");
			 msgList.setH01TIMSYS(getTimeStamp());
			 msgList.setH01SCRCOD("01");			 
			 msgList.setH01OPECOD("0010");
			 try {msgError = new datapro.eibs.beans.ELEERRMessage();
			      } catch (Exception ex) {flexLog("Error: " + ex);
									     }

			 userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		     try {JBObjList bl = (JBObjList) ses.getAttribute("EDL017001");
			      int idx = Integer.parseInt(req.getParameter("CURRCODE").trim());
			      bl.setCurrentRow(idx);	
			      msgList = (EDL017001Message) bl.getRecord();								
			     } catch (Exception e) {e.printStackTrace();
									    flexLog("Error: " + e);
									    throw new RuntimeException("Socket Communication Error");
								       }		
	
		     // Send Initial data
		     try {// all the fields here
			      java.util.Enumeration enu = msgList.fieldEnumeration();
			      MessageField field = null;
			      String value = null;
			      while (enu.hasMoreElements()) {
			    	  field = (MessageField) enu.nextElement();
			    	  try {value = req.getParameter(field.getTag()).toUpperCase();
			    	  if (value != null) {
			    		  field.setString(value);
							}
			    	  	} catch (Exception e) {
											}
			       }				
			      ses.setAttribute("refCodes", msgList);	
			      flexLog("About to call Page: " + LangPath + "EDL0170_maintenance_details.jsp");
			      callPage(LangPath + "EDL0170_maintenance_details.jsp", req, res);			
			     } catch (Exception e) {e.printStackTrace();
									    flexLog("Error: " + e);
									    throw new RuntimeException("Socket Communication Error");
								       }
	     } catch (Exception e) {e.printStackTrace();
		    flexLog("Error: " + e);
		    throw new RuntimeException("Socket Communication Error");
	       }
	}

	protected void procReqInquiry(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
	throws ServletException, IOException {

		MessageRecord newmessage = null;
		EDL017001Message msgList = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = false;

		try {msgError =	(datapro.eibs.beans.ELEERRMessage) Beans.instantiate(
								getClass().getClassLoader(),
							"datapro.eibs.beans.ELEERRMessage");
			} catch (Exception ex) {
								flexLog("Error: " + ex);
								}
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		// Send Initial data
		try {msgList = (EDL017001Message) mc.getMessageRecord("EDL017001");
		 	msgList.setH01USERID(user.getH01USR());
		 	msgList.setH01PROGRM("EDL017001");
		 	msgList.setH01TIMSYS(getTimeStamp());
		 	msgList.setH01SCRCOD("01");			 
		 	msgList.setH01OPECOD("0010");
		 	try {msgError = new datapro.eibs.beans.ELEERRMessage();
		      	} catch (Exception ex) {flexLog("Error: " + ex);
								     }

		    userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
	
		    try {JBObjList bl = (JBObjList) ses.getAttribute("EDL017001");
		      	int idx = Integer.parseInt(req.getParameter("CURRCODE").trim());
		      	bl.setCurrentRow(idx);	
		      	msgList = (EDL017001Message) bl.getRecord();								
		     	} catch (Exception e) {e.printStackTrace();
								    flexLog("Error: " + e);
								    throw new RuntimeException("Socket Communication Error");
							       }		

		    // Send Initial data
		    try {// all the fields here
		    	java.util.Enumeration enu = msgList.fieldEnumeration();
		    	MessageField field = null;
		    	String value = null;
		    	while (enu.hasMoreElements()) {
		    	  field = (MessageField) enu.nextElement();
		    	  try {value = req.getParameter(field.getTag()).toUpperCase();
		    	  if (value != null) {
		    		  field.setString(value);
						}
		    	  	} catch (Exception e) {
										}
		    	}				
		    	ses.setAttribute("refCodes", msgList);	
		    	flexLog("About to call Page: " + LangPath + "EDL0170_inquiry_details.jsp");
		    	callPage(LangPath + "EDL0170_inquiry_details.jsp", req, res);			
		     	} catch (Exception e) {e.printStackTrace();
								    flexLog("Error: " + e);
								    throw new RuntimeException("Socket Communication Error");
							       }
		} catch (Exception e) {e.printStackTrace();
	    	flexLog("Error: " + e);
	    	throw new RuntimeException("Socket Communication Error");
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

			int screen = A_POSITION;

			try {

				msgUser =
					(datapro.eibs.beans.ESS0030DSMessage) session.getAttribute(
						"currUser");

				// Here we should get the path from the user profile
				LangPath = super.rootPath + msgUser.getE01LAN() + "/";

				try {
					flexLog("Opennig Socket Connection");
					mc = new MessageContext(super.getMessageHandler("EDL0170", req));

					try {
						screen = Integer.parseInt(req.getParameter("SCREEN"));
					} catch (Exception e) {
						flexLog("Screen set to default value");
					}

					switch (screen) {

						//Request

						case R_INQ_PARM :
							procReqInqParm(mc, msgUser, req, res, session);
							break;
						case R_PROD_LIST :
							procReqProdList(mc, msgUser, req, res, session);
							break;
						case R_NEW :
							procReqNew(mc, msgUser, req, res, session);
							break;
						case R_MAINTENANCE :
							procReqMaintenance(mc, msgUser, req, res, session);
							break;

							// Action
						case A_NEW :
							procReqNewMessage(mc, msgUser, req, res, session);
							break;
						case A_POSITION :
							procActionPos(mc, msgUser, req, res, session);
							break;
						case A_MAINTENANCE :
							procActionMaintenance(mc, msgUser, req, res, session);
							break;

							// END Entering

						default :
							res.sendRedirect(
								super.srctx + LangPath + super.devPage);
							break;
					}

				} catch (Exception e) {
					e.printStackTrace();
					int sck = getInitSocket(req) + 1;
					flexLog("Socket not Open(Port " + sck + "). Error: " + e);
					res.sendRedirect(
						super.srctx + LangPath + super.sckNotOpenPage);
					//return;
				} finally {
					mc.close();
				}
			} catch (Exception e) {
				flexLog("Error: " + e);
				res.sendRedirect(
					super.srctx + LangPath + super.sckNotRespondPage);
			}

		}

	}
	protected void showERROR(ELEERRMessage m) {
		if (logType != NONE) {

			flexLog("ERROR received.");

			flexLog("ERROR number:" + m.getERRNUM());
			flexLog("ERR001 = " + m.getERNU01() + " desc: " + m.getERDS01());
			flexLog("ERR002 = " + m.getERNU02() + " desc: " + m.getERDS02());
			flexLog("ERR003 = " + m.getERNU03() + " desc: " + m.getERDS03());
			flexLog("ERR004 = " + m.getERNU04() + " desc: " + m.getERDS04());
			flexLog("ERR005 = " + m.getERNU05() + " desc: " + m.getERDS05());
			flexLog("ERR006 = " + m.getERNU06() + " desc: " + m.getERDS06());
			flexLog("ERR007 = " + m.getERNU07() + " desc: " + m.getERDS07());
			flexLog("ERR008 = " + m.getERNU08() + " desc: " + m.getERDS08());
			flexLog("ERR009 = " + m.getERNU09() + " desc: " + m.getERDS09());
			flexLog("ERR010 = " + m.getERNU10() + " desc: " + m.getERDS10());

		}
	}

}
