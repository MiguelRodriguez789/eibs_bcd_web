package datapro.eibs.helps;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0026DSMessage;
import datapro.eibs.beans.JBListRec;
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
public class JSEWD0026 extends JSEIBSServlet {

	
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
			mp = getMessageProcessor("EWD0026", req);
			EWD0026DSMessage msgHelp = (EWD0026DSMessage) mp.getMessageRecord("EWD0026DS");
			try {
				msgHelp.setEWDACC(req.getParameter("CustNum").trim());
			} catch (Exception e) {
				msgHelp.setEWDACC("");
			}
			try {
				msgHelp.setEWDADF(req.getParameter("type").trim());
			} catch (Exception e) {
				msgHelp.setEWDADF(" ");
			}
			
			mp.sendMessage(msgHelp);
			
			JBObjList list = mp.receiveMessageRecordList("EWDOPE");
			
			if (mp.hasError(list)) {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				session.setAttribute("error", msgError);
				pageName = "error_viewer.jsp";
			} else {
				int colNum = 27;
				String myRow[] = new String[colNum];
				for (int i = 0; i < colNum; i++) {
					myRow[i] = "";
				}
				JBListRec beanListRec = new JBListRec(); 
				beanListRec.init(colNum);
				list.initRow();
				while (list.getNextRow()) {
					msgHelp = (EWD0026DSMessage) list.getRecord();
					myRow[0] = msgHelp.getEWDMAN();
					myRow[1] = msgHelp.getEWDACC();
					myRow[2] = msgHelp.getEWDMA1();
					myRow[3] = msgHelp.getEWDMA2();
					myRow[4] = msgHelp.getEWDMA3();
					myRow[5] = msgHelp.getEWDMA4();
					myRow[6] = msgHelp.getEWDCTY();
					myRow[7] = msgHelp.getEWDSTE();
					myRow[8] = msgHelp.getEWDCTR();
					myRow[9] = msgHelp.getEWDZPC();
					myRow[10] = msgHelp.getEWDPOB();
					//Only to Corpbanca
					myRow[11] = msgHelp.getEWDPID(); 
					myRow[12] = msgHelp.getEWDDSC(); 
					myRow[13] = msgHelp.getEWDTID(); 
					myRow[14] = msgHelp.getEWDFL1(); //Type Address
					myRow[15] = msgHelp.getEWDFL2(); //Verificacion
					myRow[16] = msgHelp.getEWDFL3(); //Vigencia
					myRow[17] =
						Util.formatDate(
							msgHelp.getEWDDT1(),
							msgHelp.getEWDDT2(),
							msgHelp.getEWDDT3());
					//Verif. Date
					myRow[18] = msgHelp.getEWDBSX(); //Modo Verif.
					myRow[19] = msgHelp.getEWDHPN(); //Phone
						
					myRow[20] = msgHelp.getEWDNST(); 
					myRow[21] = msgHelp.getEWDADT(); //Tipo direccion
					myRow[22] = msgHelp.getDWDADT(); 
					myRow[23] = msgHelp.getEWDCOM(); 
					myRow[24] = msgHelp.getDWDCOM(); 
					myRow[25] = msgHelp.getEWDADF(); 
					myRow[26] = msgHelp.getDWDADF(); 
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     								
					beanListRec.addRow("", myRow);
				}
				
				flexLog("Putting java beans into the session");
				session.setAttribute("ewd0026Help", beanListRec);
				session.setAttribute("error", new ELEERRMessage());
				
				pageName = "EWD0026_client_mailing_address_helpmessage.jsp";
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

}
