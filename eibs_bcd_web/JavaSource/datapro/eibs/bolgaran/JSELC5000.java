package datapro.eibs.bolgaran;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELC500001Message;
import datapro.eibs.beans.ELC500002Message;
import datapro.eibs.beans.ELC500003Message;
import datapro.eibs.beans.ELC500004Message;
import datapro.eibs.beans.ELC500005Message;
import datapro.eibs.beans.ELC500006Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSELC5000 extends JSEIBSServlet {

	//Mantenedor de Boletas
	protected static final int R_ENTER_MANT = 200;
	protected static final int R_ENTER_BLOCK = 210;
	protected static final int R_NEW_BG = 100;
	protected static final int R_ENTER_INQ = 300;
	protected static final int R_APROBAR = 400;

	//Mantenedor de Aval
	protected static final int R_LIST_AVAL = 1;

	//Mantenedor de prorroga	
	protected static final int R_PRORROGA = 3;

	// actions
	protected static final int A_LIST_AVAL = 2;
	protected static final int A_PRORROGA = 4;
	protected static final int A_BOLETA = 5;
	protected static final int A_BOLETA_BLOCK = 15;
	
	protected static final int A_AVAL = 6;
	protected static final int A_ENTER_INQ = 7;
	protected static final int A_ENTER_MANT = 8;
	protected static final int A_ENTER_BLOCK = 18;
	protected static final int A_APROBAR = 9;
	protected static final int R_AVI_BEN = 20;
	protected static final int A_AVI_BEN = 21;
	
	protected static final int PLAN_DISMINUCION_LISTAR		= 310;
	protected static final int PLAN_DISMINUCION_GRABAR		= 320;
	protected static final int PLAN_DISMINUCION_CANCELAR	= 330;
	
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			case R_ENTER_MANT :
				procReqEnterMaint(user, req, res, session);
				break;
			case R_ENTER_BLOCK :
				procReqEnterBlock(user, req, res, session);
				break;
			case R_ENTER_INQ :
				procReqEnterInq(user, req, res, session);
				break;
			case R_NEW_BG :
				procReqNewBoleta(user, req, res, session);
				break;
			case R_LIST_AVAL :
				procReqListAval(user, req, res, session);
				break;
			case R_PRORROGA :
				procReqProrroga(user, req, res, session);
				break;
			case R_AVI_BEN :
				procReqAvisoBen(user, req, res, session);
				break;
			case A_BOLETA :
				procActionBoleta(user, req, res, session);
				break;
			case A_BOLETA_BLOCK :
				procActionBoleta_Block(user, req, res, session);
				break;
				
				
			case A_AVAL :
				procActionAval(user, req, res, session);
				break;
			case A_LIST_AVAL :
				procActionListAval(user, req, res, session);
				break;
			case A_ENTER_MANT :
				procActionEnterMaint(user, req, res, session);
				break;
			case A_ENTER_BLOCK :
				procActionEnterBlock(user, req, res, session);
				break;
				
			case A_ENTER_INQ :
				procActionEnterInq(user, req, res, session);
				break;
			case A_PRORROGA :
				procActionPrga(user, req, res, session);
				break;
			case A_AVI_BEN :
				procActionAvisoBen(user, req, res, session);
				break;
			case PLAN_DISMINUCION_LISTAR :
				procListarPlanDisminucion(user, req, res, session);
				break;
			case PLAN_DISMINUCION_GRABAR :
				procGrabarPlanDisminucion(user, req, res, session);
				break;							
			case PLAN_DISMINUCION_CANCELAR :
				procCancelarPlanDisminucion(user, req, res, session);
				break;							
			default :
				forward("MISC_not_available.jsp", req, res);
				break;
		}
	}


	private void procCancelarPlanDisminucion(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		forward("ELC5000_bg_basic.jsp", req, res);
	}


	private void procGrabarPlanDisminucion(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		ELC500005Message planDis = new ELC500005Message();
		planDis.setH05USERID(user.getH01USR());
		planDis.setH05PROGRM("ELC5000");
		planDis.setH05SCRCOD("01");
		planDis.setH05OPECOD("0005");
		// all the fields here
		setMessageRecord(req, planDis);
		
		session.setAttribute("planDis", planDis);
		forward("ELC5000_bg_basic.jsp", req, res);
	}


	private void procListarPlanDisminucion(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		ELC500001Message bolgaran = (ELC500001Message) session.getAttribute("bolgaran");
		bolgaran.setH01USERID(user.getH01USR());
		bolgaran.setH01PROGRM("ELC5000");
		bolgaran.setH01SCRCOD("01");
		bolgaran.setH01OPECOD("0005");
		
		String _E06SPIM01 = req.getParameter("E06SPIM01") == null ? "" : req.getParameter("E06SPIM01");
		req.setAttribute("E06SPIM01", _E06SPIM01);
		
		ELC500006Message garantizaBean = new ELC500006Message();
		garantizaBean.setE06SPIM01( _E06SPIM01 );				
		// all the fields here
		setMessageRecord(req, garantizaBean);
		
		session.setAttribute("bolgaran", bolgaran);
		session.setAttribute("garantizaBean", garantizaBean);
		
		ELC500005Message beanPlasDis = (ELC500005Message) session.getAttribute("planDis");
		if (beanPlasDis == null) {
			session.setAttribute("planDis", new ELC500005Message());
		} else {
			session.setAttribute("planDis", beanPlasDis);
		}
		
		forward("ELC5000_datos_plan_disminucion.jsp", req, res);
	}


	private void procActionAvisoBen(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ELC5000", req);
			ELC500004Message msgAviBen = (ELC500004Message) mp.getMessageRecord("ELC500004", user.getH01USR(), "0005");
			msgAviBen.setH04SCRCOD("01");
			
			setMessageRecord(req, msgAviBen);
			
			mp.sendMessage(msgAviBen);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgAviBen = (ELC500004Message) mp.receiveMessageRecord("ELC500004");
			
			if (mp.hasError(msgError)) {
				pageName = "ELC5000_bg_aviso_bene.jsp";
			} else {
				pageName = "ELC5000_bg_basic.jsp";
			}
			session.setAttribute("error", msgError);
			session.setAttribute("bolprga", msgAviBen);
			
			forward(pageName, req, res);
			
		} finally {
			if (mp != null)	mp.close();
		}
	}


	private void procActionPrga(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ELC5000", req);
			ELC500003Message msgPrga = (ELC500003Message) mp.getMessageRecord("ELC500003", user.getH01USR(), "0005");
			msgPrga.setH03SCRCOD("01");
			
			setMessageRecord(req, msgPrga);
			
			mp.sendMessage(msgPrga);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgPrga = (ELC500003Message) mp.receiveMessageRecord("ELC500003");
			
			if (mp.hasError(msgError)) {
				pageName = "ELC5000_bg_prorroga.jsp";
			} else {
				pageName = "ELC5000_bg_basic.jsp";
			}
			session.setAttribute("error", msgError);
			session.setAttribute("bolprga", msgPrga);
			
			forward(pageName, req, res);
			
		} finally {
			if (mp != null)	mp.close();
		}
	}


	private void procActionEnterInq(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		if (req.getParameter("E01LCMACC") != null) {
			userPO.setIdentifier(req.getParameter("E01LCMACC"));
		}
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ELC5000", req);
			ELC500001Message msgBG = (ELC500001Message) mp.getMessageRecord("ELC500001");
			msgBG.setH01USERID(user.getH01USR());
			msgBG.setH01OPECOD("0004");
			msgBG.setH01SCRCOD("01");
			msgBG.setE01LCMACC(userPO.getIdentifier().trim());
			
			mp.sendMessage(msgBG);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			
			if (mp.hasError(msgError)) {
				if (userPO.getPurpose().equals("APPROVAL_INQ")) {
					pageName = "error_viewer.jsp";
				} else {
					pageName = "ELC5000_bg_enter_inq.jsp";
				}
			} else {

				JBObjList list = mp.receiveMessageRecordList("H02FLGMAS");
				list.initRow();
				JBObjList bolaval = new JBObjList();
				while (list.getNextRow()) {
					MessageRecord msg = (MessageRecord) list.getRecord();
					if (msg.getFormatName().equals("ELC500001")) {
						session.setAttribute("bolgaran", msg);
					} else if (msg.getFormatName().equals("ELC500002")) {
						bolaval.addRow(msg);
					} else if (msg.getFormatName().equals("ELC500003")) {
						session.setAttribute("bolprga", msg);
					} else if (msg.getFormatName().equals("ELC500004")) {
						session.setAttribute("bolaviben", msg);
					} else if (msg.getFormatName().equals("ELC500005")) {
						session.setAttribute("planDis", msg);
					} else if (msg.getFormatName().equals("ELC500006")) {
						session.setAttribute("garantizaBean", msg);
					}
				}
				session.setAttribute("bolaval", bolaval);
				
				pageName = "ELC5000_bg_inq_basic.jsp";
			}
			
			session.setAttribute("error", msgError);
			
			forward(pageName, req, res);
			
		} finally {
			if (mp != null)	mp.close();
		}
	}


	private void procActionEnterMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ELC5000", req);
			ELC500001Message msgBol = (ELC500001Message) mp.getMessageRecord("ELC500001", user.getH01USR(), "0002");
			msgBol.setH01SCRCOD("01");
			msgBol.setE01LCMACD("43");
			try {
				userPO.setIdentifier(req.getParameter("E01LCMACC").trim());
			} catch (Exception e) {
			}
			msgBol.setE01LCMACC(userPO.getIdentifier());
			
			mp.sendMessage(msgBol);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgBol = (ELC500001Message) mp.receiveMessageRecord("ELC500001");
			//ELC500006Message garantizaBean = (ELC500006Message) mp.receiveMessageRecord("ELC500006");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("bolgaran", msgBol);
				pageName = "ELC5000_bg_enter_maint.jsp";
			} else {
				ELC500006Message garantizaBean = (ELC500006Message) mp.receiveMessageRecord("ELC500006");
				session.setAttribute("bolgaran", msgBol);
				session.setAttribute("garantizaBean", garantizaBean);
				pageName = "ELC5000_bg_basic.jsp";
			}
			
			if (user.getE01INT().equals("18")) { // Chile
				ELC500005Message planDis = (ELC500005Message) mp.receiveMessageRecord("ELC500005");
				session.setAttribute("planDis", planDis);
			}
			
			session.setAttribute("error", msgError);
			
			forward(pageName, req, res);
			
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procActionEnterBlock(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ELC5000", req);
			ELC500001Message msgBol = (ELC500001Message) mp.getMessageRecord("ELC500001", user.getH01USR(), "0006");
			msgBol.setH01SCRCOD("01");
			msgBol.setE01LCMACD("43");
			try {
				userPO.setIdentifier(req.getParameter("E01LCMACC").trim());
			} catch (Exception e) {
			}
			msgBol.setE01LCMACC(userPO.getIdentifier());
			
			mp.sendMessage(msgBol);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgBol = (ELC500001Message) mp.receiveMessageRecord("ELC500001");
			
			
			if (mp.hasError(msgError)) {
				session.setAttribute("bolgaran", msgBol);
				pageName = "ELC5000_bg_enter_block.jsp";
			} else {
				session.setAttribute("bolgaran", msgBol);
				pageName = "ELC5000_bg_block.jsp";
			}
			
			session.setAttribute("error", msgError);
			
			forward(pageName, req, res);
			
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procActionListAval(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		JBObjList bolaval = (JBObjList) session.getAttribute("bolaval");
		
		int option = 0;
		try {
			 option = Integer.parseInt(req.getParameter("opt"));
		} catch (Exception e) {
			option = 0;
		}
		int row = 0;
		try {
			row = Integer.parseInt(req.getParameter("ROW"));
		} catch (Exception e) {
			row = 0;
		}
		
		ELC500002Message msgAval = null;
		switch (option) {
			case 1 : // New
				userPO.setHeader20("DO_NEW");
				msgAval = new ELC500002Message();
				userPO.setHeader21(webAppPath + getLangPath(user) + "ELC5000_bg_aval.jsp?seq=0");
				session.setAttribute("userPO", userPO);
				session.setAttribute("msgAval", msgAval);
				forward("ELC5000_bg_list_aval.jsp?ROW=" + row, req, res);
				break;
			case 2 : // Maintenance
				userPO.setHeader20("DO_MAINT");
				userPO.setHeader21(webAppPath + getLangPath(user) + "ELC5000_bg_aval.jsp?ROW=" + row);
				session.setAttribute("userPO", userPO);
				forward("ELC5000_bg_list_aval.jsp?ROW=" + row, req, res);
				break;
			case 3 : // Delete
				MessageProcessor mp = null;
				try {
					mp = getMessageProcessor("ELC5000", req);
					msgAval = (ELC500002Message) bolaval.get(row);
					msgAval.setH02OPECOD("0009");
					
					mp.sendMessage(msgAval);
					
					ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
					if (mp.hasError(msgError)) {
						forward("ELC5000_bg_list_aval.jsp?ROW=" + row, req, res);
					} else {
						procReqListAval(user, req, res, session);
					}
				} finally {
					if (mp != null)	mp.close();
				}
				break;
		}
	}


	private void procActionAval(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ELC5000", req);
			ELC500002Message msgAval = (ELC500002Message) mp.getMessageRecord("ELC500002", user.getH01USR(), "0005");
			msgAval.setH02SCRCOD("01");
			
			setMessageRecord(req, msgAval);
			
			mp.sendMessage(msgAval);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgAval = (ELC500002Message) mp.receiveMessageRecord("ELC500002");
			
			if (mp.hasError(msgError)) {
				int row = 0;
				session.setAttribute("error", msgError);
				if (userPO.getHeader20().equals("DO_MAINT")) {
					JBObjList bolaval = (JBObjList) session.getAttribute("bolaval");
					try {
						row = Integer.parseInt(req.getParameter("ROW"));
					} catch (Exception ex) {
						row = 0;
					}
					bolaval.setRecord(msgAval, row);
					session.setAttribute("bolaval", bolaval);
				} else {
					session.setAttribute("msgAval", msgAval);
				}
				forward("ELC5000_bg_aval.jsp?ROW=" + row, req, res);
			} else {
				res.setContentType("text/html");
				PrintWriter out = res.getWriter();
				out.println("<HTML>");
				out.println("<HEAD>");
				out.println("<TITLE>Close</TITLE>");
				out.println("</HEAD>");
				out.println("<BODY>");
				out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
				out.println("		top.opener.window.location.href='"
							+ webAppPath
							+ "/servlet/datapro.eibs.bolgaran.JSELC5000?SCREEN=1'");
				out.println("		top.close();");
				out.println("</SCRIPT>");
				out.println("<P>Close it!!!</P>");
				out.println("</BODY>");
				out.println("</HTML>");
				out.close();
			}
			
		} finally {
			if (mp != null)	mp.close();
		}
	}


	private void procActionBoleta(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		String _E06SPIM01 = req.getParameter("E06SPIM01") == null ? "" : req.getParameter("E06SPIM01");
		ELC500001Message bolgaran = (ELC500001Message) session.getAttribute("bolgaran");
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ELC5000", req);
			bolgaran.setH01USERID(user.getH01USR());
			bolgaran.setH01TIMSYS(getTimeStamp());
			bolgaran.setH01OPECOD("0003"); // Validate
			
			setMessageRecord(req, bolgaran);
			
			mp.sendMessage(bolgaran);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			bolgaran = (ELC500001Message) mp.receiveMessageRecord("ELC500001");
			
			if (mp.hasError(msgError)) {
				if (user.getE01INT().equals("18")) { // Chile
					ELC500005Message planDis = null;
					if (bolgaran.getE01LCMFDI().equals("Y")) {
						planDis = (ELC500005Message) session.getAttribute("planDis");
					}
					session.setAttribute("planDis", planDis);
				}
				ELC500006Message garantizaBean = new ELC500006Message();
				garantizaBean.setE06SPIM01( _E06SPIM01 );
				
				session.setAttribute("bolgaran", bolgaran);
				session.setAttribute("garantizaBean", garantizaBean);
				
				pageName = "ELC5000_bg_basic.jsp";
			} else {
				if (user.getE01INT().equals("18")) { // Chile
					ELC500005Message planDis = null;
					if (bolgaran.getE01LCMFDI().equals("Y")) {
						planDis = (ELC500005Message) session.getAttribute("planDis");
						planDis.setH05OPECOD("0003");
					} else {
						planDis = new ELC500005Message();
						planDis = (ELC500005Message) mp.getMessageRecord("ELC500005", user.getH01USR(), "0003");
					}
					planDis.setH05SCRCOD("01");
					planDis.setE05LCPBNK( bolgaran.getE01LCMBNK() );
					planDis.setE05LCPBRN( bolgaran.getE01LCMBRN() );
					planDis.setE05LCPCCY( bolgaran.getE01LCMCCY() );// Currency
					planDis.setE05LCPMAC( bolgaran.getE01LCMACC() );
					planDis.setE05LCPCUN( bolgaran.getE01LCMCUN() );
					planDis.setE05LCPMNT( bolgaran.getE01LCMC10() );
					// Issue					           
					planDis.setE05LCPISM( bolgaran.getE01LCMIDD() ); 
					planDis.setE05LCPISD( bolgaran.getE01LCMIDM() ); 
					planDis.setE05LCPISA( bolgaran.getE01LCMIDY() );
					// Expiration
					planDis.setE05LCPEXM( bolgaran.getE01LCMEXD() ); 
					planDis.setE05LCPEXD( bolgaran.getE01LCMEXM() ); 
					planDis.setE05LCPEXY( bolgaran.getE01LCMEXY() );
					
					mp.sendMessage(planDis);
					
					msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
					planDis = (ELC500005Message) mp.receiveMessageRecord("ELC500005");
					
					if (mp.hasError(msgError)) {
						ELC500006Message garantizaBean = new ELC500006Message();
						garantizaBean.setE06SPIM01( _E06SPIM01 );
						
						session.setAttribute("bolgaran", bolgaran);
						session.setAttribute("planDis", planDis);
						session.setAttribute("garantizaBean", garantizaBean);
						
						pageName = "ELC5000_bg_basic.jsp";
					} else { // Save Data
						bolgaran.setH01OPECOD("0005");
						
						mp.sendMessage(bolgaran);
						
						msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
						bolgaran = (ELC500001Message) mp.receiveMessageRecord("ELC500001");
						
						session.setAttribute("bolgaran", bolgaran);
						
						// Sending Bean Plan Disminucion
						planDis.setE05LCPMAC( bolgaran.getE01LCMACC() );
						planDis.setH05OPECOD("0005");
						
						mp.sendMessage(planDis);
						
						msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
						planDis = (ELC500005Message) mp.receiveMessageRecord("ELC500005");
						
						session.setAttribute("planDis", planDis);
					}	
				}
					
				// Sending Bean with Campo garantizado
				ELC500006Message garantizaBean =  (ELC500006Message) mp.getMessageRecord("ELC500006", user.getH01USR(), "0005");
				garantizaBean.setH06SCRCOD("01");
				garantizaBean.setE06SPIACC( bolgaran.getE01LCMACC() );
				garantizaBean.setE06SPIM01( _E06SPIM01 );
				
				mp.sendMessage(garantizaBean);

				msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
				garantizaBean = (ELC500006Message) mp.receiveMessageRecord("ELC500006");
				
				session.setAttribute("bolgaran", bolgaran);
				session.setAttribute("garantizaBean", garantizaBean);
				
				if (mp.hasError(msgError)) {
					pageName = "ELC5000_bg_basic.jsp";
				} else {
					if (userPO.getPurpose().equals("NEW")) {
						bolgaran = (ELC500001Message) session.getAttribute("bolgaran");
						
						userPO.setIdentifier(bolgaran.getE01LCMACC());
						userPO.setPurpose("MAINTENANCE");
						session.setAttribute("userPO", userPO);
						
						pageName = "ELC5000_bg_basic.jsp";
					} else {
						req.setAttribute("E06SPIM01", _E06SPIM01);
						pageName = "ELC5000_bg_enter_maint.jsp";
					}
				}
			}
			
			session.setAttribute("error", msgError);
			
			forward(pageName, req, res);
		
		} finally {
			if (mp != null)	mp.close();
		}
	}



	private void procActionBoleta_Block(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		ELC500001Message bolgaran = (ELC500001Message) session.getAttribute("bolgaran");
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ELC5000", req);
			bolgaran.setH01OPECOD("0007"); // Validate
			
			setMessageRecord(req, bolgaran);
			
			mp.sendMessage(bolgaran);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			bolgaran = (ELC500001Message) mp.receiveMessageRecord("ELC500001");
	
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			
			if (mp.hasError(msgError)) {
				session.setAttribute("bolgaran", bolgaran);
				pageName = "ELC5000_bg_block.jsp";
			} else {
				pageName = "ELC5000_bg_enter_block.jsp";
			}
			
			
			forward(pageName, req, res);
		
		} finally {
			if (mp != null)	mp.close();
		}
	}

	
	
	private void procReqAvisoBen(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		ELC500001Message msgBol = (ELC500001Message) session.getAttribute("bolgaran");
			
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ELC5000", req);
			ELC500004Message msgAviBen = (ELC500004Message) mp.getMessageRecord("ELC500004", user.getH01USR(), "0002");
			msgAviBen.setH04SCRCOD("01");
			msgAviBen.setE04LCMACC(msgBol.getE01LCMACC());
			
			mp.sendMessage(msgAviBen);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgAviBen = (ELC500004Message) mp.receiveMessageRecord("ELC500004");
			
			if (mp.hasError(msgError)) {
				pageName = "ELC5000_bg_basic.jsp";
			} else {
				pageName = "ELC5000_bg_aviso_bene.jsp";
			}
			session.setAttribute("bolprga", msgAviBen);
			session.setAttribute("error", msgError);
			
			forward(pageName, req, res);
			
		} finally {
			if (mp != null)	mp.close();
		}
	}


	private void procReqProrroga(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		String pageName = "";
		ELC500001Message msgBol = (ELC500001Message) session.getAttribute("bolgaran");
			
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ELC5000", req);
			ELC500003Message msgPrga = (ELC500003Message) mp.getMessageRecord("ELC500003", user.getH01USR(), "0002");
			msgPrga.setH03SCRCOD("01");
			msgPrga.setE03LCMACC(msgBol.getE01LCMACC());
			
			mp.sendMessage(msgPrga);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgPrga = (ELC500003Message) mp.receiveMessageRecord("ELC500003");
			
			if (mp.hasError(msgError)) {
				pageName = "ELC5000_bg_basic.jsp";
			} else {
				pageName = "ELC5000_bg_prorroga.jsp";
			}
			session.setAttribute("bolprga", msgPrga);
			session.setAttribute("error", msgError);
			
			forward(pageName, req, res);
			
		} finally {
			if (mp != null)	mp.close();
		}
	}


	private void procReqListAval(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		String pageName = "";
		ELC500001Message msgBol = (ELC500001Message) session.getAttribute("bolgaran");
			
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ELC5000", req);
			ELC500002Message msgAval = (ELC500002Message) mp.getMessageRecord("ELC500002", user.getH01USR(), "0002");
			msgAval.setH02SCRCOD("01");
			msgAval.setE02LCMACC(msgBol.getE01LCMACC());
			
			mp.sendMessage(msgAval);
			
			JBObjList list = mp.receiveMessageRecordList("H02FLGMAS");
			ELEERRMessage msgError = new ELEERRMessage();
			
			if (mp.hasError(list)) {
				msgError = (ELEERRMessage) mp.getError(list);
				pageName = "ELC5000_bg_basic.jsp";
			} else {
				pageName = "ELC5000_bg_list_aval.jsp";
			}
			session.setAttribute("bolaval", list);
			session.setAttribute("error", msgError);
		
			forward(pageName, req, res);
			
		} finally {
			if (mp != null)	mp.close();
		}
	}


	private void procReqNewBoleta(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = new UserPos();
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ELC5000", req);
			ELC500001Message msgBG = (ELC500001Message) mp.getMessageRecord("ELC500001", user.getH01USR(), "0001");
			msgBG.setE01LCMACD("43");
			msgBG.setE01LCMPRO(req.getParameter("E01LCMPRO") == null ? "0" : req.getParameter("E01LCMPRO"));
			msgBG.setE01LCMACC(req.getParameter("E01LCMACC") == null ? "" : req.getParameter("E01LCMACC"));
			
			mp.sendMessage(msgBG);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgBG = (ELC500001Message) mp.receiveMessageRecord("ELC500001");
			
			session.setAttribute("error", msgError);
			session.setAttribute("bolgaran", msgBG);
			
			if (mp.hasError(msgError)) { // There are errors
				flexLog("About to call Page: /servlet/datapro.eibs.products.JSESD0711?TYPE=43");
				String firstLink =
						webAppPath
						+ getLangPath(user)
						+ "ESD0711_products_detail.jsp?appcode="
						+ req.getParameter("appcode").trim()
						+ "&typecode="
						+ req.getParameter("typecode").trim()
						+ "&generic="
						+ req.getParameter("generic").trim()
						+ "&title="
						+ req.getParameter("title").trim()
						+ "&bank="
						+ req.getParameter("bank").trim();
				res.setContentType("text/html");
				res.setHeader("Pragma", "No-cache");
				res.setDateHeader("Expires", 0);
				res.setHeader("Cache-Control", "no-cache");
				PrintWriter out = res.getWriter();
				printProdFrame(out, firstLink, getLangPath(user));
			} else { // There are no errors
				userPO.setPurpose("NEW");
				session.setAttribute("userPO", userPO);
				
				forward("ELC5000_bg_basic.jsp", req, res);
			}
		
		} finally {
			if (mp != null)	mp.close();
		}
	}


	private void procReqEnterInq(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setPurpose("INQUIRY");
		session.setAttribute("userPO", userPO);
		
		session.setAttribute("bolgaran", new ELC500001Message());
		
		forward("ELC5000_bg_enter_inq.jsp", req, res);
	}


	private void procReqEnterMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setPurpose("MAINTENANCE");
		session.setAttribute("userPO", userPO);
		
		session.setAttribute("bolgaran", new ELC500001Message());
		
		forward("ELC5000_bg_enter_maint.jsp", req, res);
	}

	private void procReqEnterBlock(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setPurpose("MAINTENANCE");
		session.setAttribute("userPO", userPO);
		
		session.setAttribute("bolgaran", new ELC500001Message());
		
		forward("ELC5000_bg_enter_block.jsp", req, res);
	}
	
	
	
}
