package datapro.eibs.tools;

/**
 * Insert the type's description here.
 * Creation date: (9/17/2001 1:57:32 PM)
 * @author: Ramses Amaro
 */
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datapro.eibs.facade.FAImage;
import com.datapro.eibs.images.vo.SCNIMGViewSignature;
import com.datapro.generic.beanutil.BeanList;

import datapro.eibs.beans.JBListRec;
import datapro.eibs.beans.UserPos;

public class JSSignatureImage extends datapro.eibs.master.SuperServlet {
	/**
	 * service method comment.
	 */
	public void service(HttpServletRequest req, HttpServletResponse res)
			throws javax.servlet.ServletException, java.io.IOException {

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
			datapro.eibs.beans.ESS0030DSMessage msgUser = 
				(datapro.eibs.beans.ESS0030DSMessage) session.getAttribute("currUser");
			// Here we should get the path from the user profile
			String LangPath = super.rootPath + msgUser.getE01LAN() + "/";
			
			UserPos userPO = (UserPos) session.getAttribute("userPO");
			if (userPO == null) {
				userPO = new UserPos();
			}
			userPO.setPurpose("INQUIRY");

			FAImage facade = new FAImage();
			try {
				boolean isCustomer = false;
				BeanList list = null;
				if (req.getParameter("ACCOUNT") != null) {
					list = facade.getSignatures("A", req.getParameter("ACCOUNT"));
				}
				if (list == null || list.isEmpty()) {
					isCustomer = true;
					list = facade.getSignatures("C", req.getParameter("CUSTOMER"));
				}
				
				JBListRec beanImg = new JBListRec();
				int colNum = 7;
				beanImg.init(colNum);
				String myFlag = "";
				String myRow[] = new String[colNum];
				for (int k = 0; k < colNum; k++) {
					myRow[k] = "";
				}
				
				String infoFileName = null;
				
				list.initRow();
				while (list.getNextRow()) {
					SCNIMGViewSignature vo = (SCNIMGViewSignature) list.getRecord();
					if (list.getCurrentRow() == 0) {
						infoFileName = vo.getTBLTYP() + "_" + vo.getTBLNUM() + "_" + vo.getTBLTBN() + "_" + vo.getTBLSEQ();
					}

					myRow[0] = vo.getTBLDSC().trim();
					myRow[1] = "Imagen de Firma";
					myRow[2] = myRow[0].substring(myRow[0].lastIndexOf(".") + 1);
					myRow[3] = vo.getTBLLMM() + "/" + vo.getTBLLMD() + "/" + vo.getTBLLMY();
					myRow[4] = vo.getTBLSSQ().toString();
					myRow[5] = vo.getTBLUID().toString();
					
					String extTemp = myRow[2].toLowerCase();
					if (extTemp.equals("jpg") || extTemp.equals("gif")) {
						myFlag = "I";
					} else {
						myFlag = "";
					}
					beanImg.addRow(myFlag, myRow);
				}
				session.setAttribute("userPO", userPO);
				session.setAttribute("listImg", beanImg);
				if (isCustomer) {
					callPage(LangPath + "EDI0010_doc_viewer_signatures.jsp?DOC_NAME="+infoFileName, req, res);					
				} else {
					callPage(LangPath + "EDI0010_doc_viewer_container.jsp?DOC_NAME="+infoFileName, req, res);
				}

			} catch (Exception e) {
				e.printStackTrace();
				throw new ServletException(e);
			}

		}

	}
}
