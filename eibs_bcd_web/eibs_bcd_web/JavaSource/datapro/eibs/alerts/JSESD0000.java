package datapro.eibs.alerts;

/**
 * Insert the type's description here.
 * Creation date: (9/13/2001 9:24:07 AM)
 * @author: Ramses Amaro
 */
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import datapro.eibs.beans.*;
import datapro.eibs.sockets.*;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
 
public class JSESD0000 extends JSEIBSServlet {
	
	protected static final int R_SPINS = 100;
	protected static final int A_SPINS = 1000;

	
	@Override
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen)
			throws ServletException, IOException {
		
		switch (screen) {
			case R_SPINS :
				procReqSpclInstrc(user, req, res, session, screen);
				break;
			case A_SPINS :
				procActionEspInst(user, req, res, session);
				break;
			default :
				defaultOldLegacy(user, req, res, session);
				break;
		}
		
		
	}
	
	private String getBasicPage(UserPos userPO) {
		String pageName = "";
		 if ( userPO.getOption().equals("CLIENT_P")) { 
			 pageName = "ESD1080_client_basic.jsp"; 
		 } else if ( userPO.getOption().equals("CLIENT_C")) {
		 	pageName = "ESD1080_client_basic.jsp"; 
		 } else if ( userPO.getOption().equals("ENTITY")) { 
			 pageName = "ESD2080_entity_maintenance.jsp"; 
	     } else if ( userPO.getOption().equals("RT")){
			 pageName = "EDD0000_rt_basic.jsp"; 
	     } else if (userPO.getOption().equals("SV")) {
			 pageName = "EDD0000_sv_basic.jsp"; 
	     } else if (userPO.getOption().equals("CD")) { 
			 pageName = "EDL0130_cd_maint.jsp"; 
	     } else if (userPO.getOption().equals("LN")) { 
			if ("NEW".equals(userPO.getPurpose())) {
				if("FACT".equals(userPO.getSource())){
					pageName = "EDL0800_dft_new_transac.jsp"; 
				} else {
					pageName = "EDL0150_ln_new_transac.jsp"; 
				}
			} else {
				if("FACT".equals(userPO.getSource())){
					pageName  = "EDL0800_dft_basic.jsp";
				} else {
					pageName  = "EPV0150_loans_basic_information.jsp";
				}
			}
		 } else if (userPO.getOption().equals("PV")) { 
			if ("NEW".equals(userPO.getPurpose())) {
				if("FACT".equals(userPO.getSource())){
					pageName = "EDL0800_dft_new_transac.jsp"; 
				} else {
					pageName = "EDL0150_ln_new_transac.jsp"; 
				}
			} else {
				if("FACT".equals(userPO.getSource())){
					pageName  = "EDL0800_dft_basic.jsp";
				} else {
					pageName  = "EPV0150_loans_basic_information.jsp";
				}
			}
		 } else if ( userPO.getOption().equals("LC")) { 
			 if("JSELC0500".equals(userPO.getSource())){
				pageName  = "servlet/datapro.eibs.products.JSELC0500?SCREEN=5";
			 } else if("JSELC0510".equals(userPO.getSource())){
				pageName  = "servlet/datapro.eibs.products.JSELC0510?SCREEN=5";
			 }
			 
		 } else if (userPO.getOption().equals("CO")) { 
			pageName  = "ERA0050_ga_basic.jsp";
		 } else if ( userPO.getOption().equals("CLIENT_SHORT")) {
				if(userPO.getCusType().equals("2")){
					pageName  = "ESD1080_client_inq_basic.jsp";
				} else { 
					pageName  = "ESD1080_client_inq_basic.jsp";
				}
		 } else if(userPO.getSource().endsWith("COBRANZA")){
			pageName  = "EDC0000_dc_opening.jsp";
		 } else if(userPO.getSource().endsWith("COBRANZA_SIMPLE")){
			pageName  = "EDC0010_dc_opening.jsp";
		 }
		return pageName;
	}	
	
	
	private String getAS400Option(UserPos userPO) {
		String option = "";
		if("APPROVAL_INQ".equals(userPO.getPurpose()) || "APPROVAL".equals(userPO.getPurpose())){
			option = "A";
		} else if ("INQUIRY".equals(userPO.getPurpose())){
			option = "I";
		} else {
			option = "M";
		}
		return option;
	}
	
	private boolean isInquiry(UserPos userPO) {
		boolean isInq = false;
		if("APPROVAL_INQ".equals(userPO.getPurpose()) || "APPROVAL".equals(userPO.getPurpose())){
			isInq = true;
		} else if ("INQUIRY".equals(userPO.getPurpose())){
			isInq = true;
		} 
		return isInq;
	}
	
	
	private void procReqSpclInstrc(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
			throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		MessageRecord mr = null;
		ELEERRMessage msgError = null;
		String pageName;

		try {
			mp = getMessageProcessor("ESD0000", req);
			ESD000005Message msg = (ESD000005Message) mp.getMessageRecord("ESD000005");
			msg.setH05USR(user.getH01USR());
			msg.setH05PGM("ESD0000");
			msg.setH05TIM(getTimeStamp()); 
			msg.setH05SCR("01");
			msg.setH05OPE("APPROVAL_INQ".equals(userPO.getPurpose()) ? "0004" : "0002");
			msg.setE05ACC(userPO.isCustomer() ?  userPO.getCusNum() : ("".equals(userPO.getAccNum()) ? userPO.getIdentifier() : userPO.getAccNum()) ) ;
			msg.setE05ACD(userPO.getApplicationCode());
			msg.setH05WK1(isInquiry(userPO) ? getAS400Option(userPO) : "");

			mp.sendMessage(msg);
			mr = mp.receiveMessageRecord();
			
			if(mr instanceof ELEERRMessage){
				msgError = (ELEERRMessage) mr;
			} else {
				msg = (ESD000005Message) mr;
			}			
			
			session.setAttribute("error", msgError);
			session.setAttribute("specInst", msg);
			session.setAttribute("userPO", userPO);
			
			if (mp.hasError(msgError)) {
				pageName = getBasicPage(userPO);
			} else {
				if (isInquiry(userPO)) {
					pageName = "ESD0000_inq_special_inst.jsp";
				} else {
					pageName = "ESD0000_special_inst.jsp";
				}
			}

			if(pageName.contains(".jsp")){
				forward(pageName, req, res);
			} else {
				res.sendRedirect(srctx + pageName);
			}
		} finally {
			if (mp != null) mp.close();
		}
	}	
	

	private void procActionEspInst(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		String pageName = devPage;
		try {
			mp = getMessageProcessor("ESD0000", req);
			ESD000005Message msg = (ESD000005Message) session.getAttribute("specInst");
			msg.setH05USR(user.getH01USR());
			msg.setH05PGM("ESD0000");
			msg.setH05TIM(getTimeStamp());
			msg.setH05SCR("01");
			msg.setH05OPE("0005");
			msg.setE05ACC(userPO.isCustomer() ? userPO.getCusNum() : userPO.getAccNum()) ;
			msg.setE05ACD(userPO.isCustomer() ? "C1" : userPO.getApplicationCode());
			msg.setH05WK1(getAS400Option(userPO));
			
			setMessageRecord(req, msg);

			mp.sendMessage(msg);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (ESD000005Message) mp.receiveMessageRecord("ESD000005");

			session.setAttribute("error", msgError);
			session.setAttribute("specInst", msg);
			session.setAttribute("userPO", userPO);

			if (mp.hasError(msgError)) {
				pageName = "ESD0000_special_inst.jsp"; 
			} else {
				pageName = getBasicPage(userPO);

				if(pageName.contains(".jsp")){
					forward(pageName, req, res);

				} else {
					res.sendRedirect(srctx + pageName);
					
				}
			}
		} finally {
			if (mp != null) mp.close();
		}
	}
	
	public void defaultOldLegacy(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {
		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		ESD000012Message msgHelp = null;
		JBList beanList = null;
	
		try {
			mp = getMessageProcessor("ESD0000", req);
			msgHelp = (ESD000012Message) mp.getMessageRecord("ESD000012");
			msgHelp.setE12ACC(Util.getReqParameter("ACCNUM", req));
			msgHelp.setE12ACD("W1");
			msgHelp.setH12PGM("ESD0000");
			msgHelp.setH12USR(user.getH01USR());
			msgHelp.setH12TIM(getTimeStamp());
			mp.sendMessage(msgHelp);
	
			newmessage = mp.receiveMessageRecord();
		  
	  		if (newmessage instanceof ESD000012Message) {
				beanList = new JBList();
				String marker = "";
				String myFlag = "";
				String myRow = "";
	
				while (true) {
					msgHelp = (ESD000012Message)newmessage;
					marker = msgHelp.getH12MAS();
					if (marker.equals("*")) {
						beanList.setShowNext(false);
						break;
					} else {
						myRow =  "<TR valign=TOP height=\"2%\">";
						myRow += "<td nowrap><IMG border=\"0\" src=\"" + req.getContextPath() + "/images/warning01.gif\"></td>";
						myRow += "<td nowrap>" + msgHelp.getE12DSC() + "</td>";
						myRow += "</TR>";
						beanList.addRow(myFlag, myRow);
					}
				
					newmessage = mp.receiveMessageRecord();
				}
							
				session.setAttribute("warnings", beanList);
				session.setAttribute("userPO", getUserPos(req));
	
				if ("".equals(Util.getReqParameter("APP", req))) {
					forward("warning_viewer.jsp", req, res);
				} else {
					forward("warning_ap_viewer.jsp", req, res);
				}
			} else {
				forward(devPage , req, res);
			}
		}finally{
			if(null != mp){
				mp.close();
			}
		}
	}
}
