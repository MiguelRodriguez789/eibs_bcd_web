package datapro.eibs.creditproposal;

/** 
 * Insert the type's description here.
 * Creation date: (1/19/00 6:08:55 PM)
 * @author: David Mavilla???????????????????????????
 */
import java.io.IOException;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EDP088301Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBListRec;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;

public class JSEDP0883 extends JSEIBSServlet {

	protected static final int R_GET_LIST = 100;
	final int A_TRANSACTION = 300;
	
	@Override
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		
		switch (screen) {

		//Request
		// First screen, only list data
		case R_GET_LIST :
			procGetList(user, req, res, session);
			break;
		// Action
		case A_TRANSACTION :
			procUpdAcc(user, req, res, session);
			break;
		default :
			forward(devPage, req, res);
			break;
		}
	}

	private void procUpdAcc(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		
		int numrec = 0;
		try {
			numrec = Integer.parseInt(req.getParameter("RECNUM"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		ELEERRMessage msgError = null;
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDP0883", req);
			
			for (int i = 1; i < numrec; i++) {
				if (req.getParameter("PTSSEQ_"+i) != null) {
					if (req.getParameter("PTSSEQ_"+i).equals("1")) {
						EDP088301Message Edp088301 = (EDP088301Message) mp.getMessageRecord("EDP088301");
						Edp088301.setH01USERID(user.getH01USR());
						Edp088301.setH01PROGRM("EDP0883");
						Edp088301.setH01TIMSYS(getTimeStamp());
						Edp088301.setH01OPECOD("0005");
						Edp088301.setE01CPTCUN(userPO.getCusNum());
						try {
							Edp088301.setE01MODCOD(req.getParameter("MODCOD_" + i).trim());
						} catch (Exception e) {
							// TODO: handle exception
						}
						try {
							Edp088301.setE01PTSSEQ(req.getParameter("E01PTSSEQ_" + i).trim());
						} catch (Exception e) {
							// TODO: handle exception
						}
						try {
							Edp088301.setE01PTSPTS(req.getParameter("E01PTSPTS_" + i).trim());
						} catch (Exception e) {
							// TODO: handle exception
						}
						
						mp.sendMessage(Edp088301);
						MessageRecord msg = mp.receiveMessageRecord();

						if (mp.hasError(msg)) {
							msgError = (ELEERRMessage) msg;
							break;
						}
					}
				}
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);

			res.sendRedirect(srctx	+ "/servlet/datapro.eibs.creditproposal.JSEDP0883?SCREEN=100&validate=0020");
		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procGetList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDP0883", req);
			EDP088301Message Edp088301 = (EDP088301Message) mp.getMessageRecord("EDP088301");
			Edp088301.setH01USERID(user.getH01USR());
			Edp088301.setH01PROGRM("EDP0883");
			Edp088301.setH01TIMSYS(getTimeStamp());
			Edp088301.setE01CPTCUN(userPO.getCusNum());
			Edp088301.setH01SCRCOD("01");
			Edp088301.setH01OPECOD("0015");
			if (req.getParameter("validate") != null) {
				Edp088301.setH01OPECOD("0020");
			}

			mp.sendMessage(Edp088301);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			JBObjList list = mp.receiveMessageRecordList("E01OPECDE");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				pageName = "EDP0883_punctuation_customer.jsp";
			} else {
				String myFlag = "";
				int idxOpt = -1;
				int idxGrp = -1;
				int idxAcc = -1;
				int colNum = 5;
				int colNumAcc = 12;
				JBListRec grpAccList1 = new JBListRec();
				grpAccList1.init(colNumAcc);
				String myGrp[] = new String[colNum];
				String myGrpAcc[] = new String[colNumAcc];
				String myOption[] = new String[colNum];
				for (int i = 0; i < colNum; i++) {
					myGrp[i] = "";
					myOption[i] = "";
				}
				for (int i = 0; i < colNumAcc; i++) {
					myGrpAcc[i] = "";
				}
				
				Iterator iterator = list.iterator();
				while (iterator.hasNext()) {
					Edp088301 = (EDP088301Message) iterator.next();
					myFlag = "" + idxOpt + "" + idxGrp;
					idxAcc++;
					myGrpAcc[0] = Edp088301.getE01MODLGT();
					myGrpAcc[1] = Edp088301.getE01MODCOD();
					myGrpAcc[2] = Edp088301.getE01MODDSC();
					myGrpAcc[3] = Edp088301.getE01PTSSEQ();
					myGrpAcc[4] = Edp088301.getE01PTSPTS();
					myGrpAcc[5] = Edp088301.getE01PTSFLG();
					myGrpAcc[6] = Edp088301.getE01MODPER();
					myGrpAcc[7] = Edp088301.getE01MODPTS();
					myGrpAcc[8] = Edp088301.getE01MODCAT();
					myGrpAcc[9] = Edp088301.getE01MODFL1();
					grpAccList1.addRow(myFlag, myGrpAcc);
				}
				session.setAttribute("trans1", grpAccList1);
				pageName = "EDP0883_punctuation_customer.jsp?ROW=" + idxAcc;
			}

			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

}
