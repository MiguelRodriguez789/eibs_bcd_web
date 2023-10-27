package datapro.eibs.products;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EDD550001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.MessageProcessor;
/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSEDD5500I extends JSEDD5500 {
	
	/**
	 * JSEDD5500I constructor comment.
	 */
	public JSEDD5500I() {
		super();
	}
	
	protected void procReqSignerList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		UserPos userPO = getUserPos(req);
		String PageToCall = "";
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD5500", req);
			EDD550001Message msgRT = (EDD550001Message) mp.getMessageRecord("EDD550001", user.getH01USR(), "");
			msgRT.setH01USR(user.getH01USR());
			msgRT.setH01PGM("EDD5500");
			msgRT.setH01TIM(getTimeStamp());
			msgRT.setH01SCR("01");
			msgRT.setH01OPE("0004");
			
			msgRT.setE01CUN(req.getParameter("ACCNUM") == null ? userPO.getAccNum() : req.getParameter("ACCNUM"));
			msgRT.setE01RTP("S");
			
			mp.sendMessage(msgRT);
			
			JBObjList list = mp.receiveMessageRecordList("H01MAS");
			ELEERRMessage msgError = new ELEERRMessage(); 
			if (mp.hasError(list)) {
				msgError = (ELEERRMessage) mp.getError(list);
				PageToCall = "EDD0000_rt_inq_balances.jsp";
			} else {
				if (!list.isEmpty()) {
					msgRT = (EDD550001Message) list.get(0);
					if (userPO.getCusNum() == null) {
						userPO.setCusNum(msgRT.getE01CUS());
						userPO.setCusName(msgRT.getE01NA1());						
					}
					if (userPO.getCurrency() == null) {
						userPO.setCurrency(msgRT.getE01CCY());						
					}
					if (userPO.getProdCode() == null) {
						userPO.setProdCode(msgRT.getE01PRD());						
					}
				}
				session.setAttribute("signersList", list);
				PageToCall = "EDD0000_rt_inq_signers_list.jsp";
			}

			session.setAttribute("userPO", userPO);
			session.setAttribute("error", msgError);
			
			forward(PageToCall, req, res);
			
		} finally {
			if (mp != null)	mp.close();
		}
	}

}
