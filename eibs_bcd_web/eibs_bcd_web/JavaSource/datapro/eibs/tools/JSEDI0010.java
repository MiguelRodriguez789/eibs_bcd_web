/*
 * Created on Jan 23, 2009
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package datapro.eibs.tools;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.xml.sax.SAXException;

import com.datapro.eibs.exception.FacadeException;
import com.datapro.eibs.exception.ItemNotFoundException;
import com.datapro.eibs.facade.FAImage;
import com.datapro.eibs.images.vo.SCNDOCTBL;
import com.datapro.eibs.images.vo.SCNIMGView;
import com.datapro.generic.beanutil.BeanList;

import datapro.eibs.beans.EDI001001Message;
import datapro.eibs.beans.EDI001002Message;
import datapro.eibs.beans.EDI001003Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBListRec;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.generic.JBParseTree;
import datapro.eibs.master.JSEIBSProp;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageRecord;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSEDI0010 extends JSEIBSServlet {

	// Options
	protected static final int R_DOCUMENTS = 1;
	protected static final int A_DOCUMENTS = 2;
	protected static final int R_INQ_DOCS = 3;
	protected static final int A_INQ_DOCS = 4;
	protected static final int R_DOC_DELETE = 5;
	protected static final int A_VIEW_IMG = 6;     // Consulta de imagenes de firmas
	protected static final int R_DELETE_PAGE = 10;
	protected static final int R_IMAGE = 11;
	protected static final int R_HISTORY = 20;
	protected static final int R_ENTER = 100;
	protected static final int A_ENTER = 200;
	protected static final int R_ENTER_ACCOUNT = 300;
	protected static final int A_ENTER_ACCOUNT = 400;
	protected static final int R_DOCIMG = 500;
	
	/* (non-Javadoc)
	 * @see datapro.eibs.master.JSEIBSServlet#processRequest(datapro.eibs.beans.ESS0030DSMessage, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, javax.servlet.http.HttpSession, int)
	 */
	protected void processRequest(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession session,
		int screen)
		throws ServletException, IOException {

			switch (screen) {
				case R_DOCUMENTS :
					procReqDocList(user, req, res, session);
					break;
				case A_DOCUMENTS :
					procActionDocList(user, req, res, session);
					break;
				case R_INQ_DOCS :
					procReqInqDocList(user, req, res, session);
					break;
				case A_INQ_DOCS :
					procActionInqDocList(user, req, res, session);
					break;
				case R_ENTER :
					procReqEnter(user, req, res, session);
					break;
				case A_ENTER :
					procActionEnter(user, req, res, session);
					break;
				case R_DOC_DELETE :
					procReqDocDeleteJDBC(req.getParameter("CODE"), res);
					break;
				case R_DELETE_PAGE :
					procActionDocMarkDelete(user, req, res, session);
					//procActionDocDeletePage(user, req, res, session);
					break;					
				case R_IMAGE :
					procGetImageJDBC(user, req, res, session);
					break;
				case A_VIEW_IMG :
					viewImage(user, req, res, session);
					break;	
				case R_ENTER_ACCOUNT :
					procReqEnterAccount(user, req, res, session);
					break;
				case A_ENTER_ACCOUNT :
					procActionEnterAccount(user, req, res, session);
				case R_HISTORY :
					procReqHistory(user, req, res, session);
					break;
				case R_DOCIMG :
					procReqDocListSC(user, req, res, session);
					break;
				default :
					forward("MISC_not_available.jsp", req, res);
					break;
			}
	}
	
	private void procReqHistory(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
					throws IOException, ServletException {
		String imgNumber; String type;		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			imgNumber = Util.getReqParameter("NUMBER", req);
			type = Util.getReqParameter("Type", req);
			
			mp = getMessageProcessor("EDI0010", req);

			EDI001001Message msg = (EDI001001Message) mp.getMessageRecord("EDI001001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDI0010");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01FLGWK1("H"); // Operation (Historical)
			msg.setH01OPECOD("0004");
		 	
			if (type.equals("C") && !userPO.getCusNum().trim().equals("")) { //Cliente
				msg.setE01DCIACC(userPO.getCusNum());
				msg.setE01DCIACD("C1");
			} else if (type.equals("S")) {	//Propuesta
				msg.setE01DCIACC(userPO.getIdentifier());
				msg.setE01DCIACD("PC");
			} else if (type.equals("A")) { //Producto
				msg.setE01DCIACC(userPO.getAccNum());
			} else if (type.equals("F") 	   //?
						|| type.equals("P")    //?	
						|| type.equals("G")) { //Garantias
				msg.setE01DCIACC( Util.getReqParameter("IDENTIFIER", req, userPO.getIdentifier()));
				msg.setE01DCIACD("");
			} 
			
			mp.sendMessage(msg);
		 	
			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");
			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				forward("error_viewer.jsp", req, res);
			} else {
				if(!list.isEmpty()){
					msg = (EDI001001Message) list.get(0);
					userPO.setHeader18(Util.formatCell(msg.getE01DCITNU()));
					userPO.setHeader19(Util.formatCell(msg.getE01DCIDES()));
					msg.destroy(); 
				}
				session.setAttribute("userPO", userPO);
				session.setAttribute("list", list);
				forwardOnSuccess("EDI0010_historical_list.jsp", req, res);
			}	

		} finally {
			if (mp != null)	mp.close();
		}
	}

	/**
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 */
	private void procActionEnterAccount(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		UserPos userPO = (UserPos) session.getAttribute("userPO");
		try {
			userPO.setIdentifier(req.getParameter("E01DCIACC"));
		} catch (Exception e) {
			userPO.setIdentifier("0");
		}	
		session.setAttribute("userPO", userPO);
		if ("MAINTENANCE".equals(userPO.getPurpose())) {
			procReqDocList(user, req, res, session);			
		} else {
			procReqInqDocList(user, req, res, session);
		}
	}

	/**
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 */
	private void procReqEnterAccount(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		UserPos userPO = (UserPos) session.getAttribute("userPO");
		userPO.setOption("DOCUMENTATION");
		userPO.setPurpose(req.getParameter("Purpose") == null 
			? "INQUIRY" : (req.getParameter("Purpose").equals("M") ? "MAINTENANCE" : "INQUIRY"));
		try {
			userPO.setOption(req.getParameter("Type"));
		} catch (Exception e) {
			userPO.setOption("RT");
		}	
		userPO.setRedirect("/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=400&Type=A");
		userPO.setHeader1("E01DCIACC");
		userPO.setHeader2("H01FLGWK2");
		userPO.setHeader3("");
		userPO.setHeader22("A");
		
		session.setAttribute("userPO", userPO);
		ELEERRMessage msgError = new ELEERRMessage();
		session.setAttribute("error", msgError);
		forward("GENERIC_account_enter.jsp", req, res);
	}
	
	private void procActionDocMarkDelete(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		String pageName = "";
		BigDecimal uniqueId = null;
		try {
			uniqueId = new BigDecimal(req.getParameter("UID"));
		} catch (Exception e) {
			uniqueId = new BigDecimal("0");
		}
		FAImage facade = new FAImage();
		facade.setSessionUser(user);
		try {
			if (!JSEIBSProp.getImgToIFS()){
				SCNDOCTBL vo = facade.getDocTable(uniqueId);
				if ("P".equals(vo.getTBLSTS())) {
					procActionDocDeletePage(user, req, res, session);
				} else {
					facade.markForDeleteImage(uniqueId);
					forward("EDI0010_doc_viewer_deleted.jsp", req, res);
				}
			} else {
				procActionDocDeletePage(user, req, res, session);
			}
			procActionDocListUpdate(user, req, res, session);
			forward(pageName, req, res);
		} catch (Exception e) {
			e.printStackTrace();
			flexLog(e.getClass().getName() + "ocurred. Exception = " + e);
			throw new ServletException(e);
		}
	}
	
	/**
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 */
	private void procActionDocDeletePage(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		BigDecimal uniqueId = null;
		try {
			uniqueId = new BigDecimal(req.getParameter("UID"));
		} catch (Exception e) {
			uniqueId = new BigDecimal("0");
		}
		if (!JSEIBSProp.getImgToIFS()) {
				FAImage facade = new FAImage();
				try {
					facade.deleteImage(uniqueId);
					forward("EDI0010_doc_viewer_deleted.jsp", req, res);
					//redirectToPage("datapro.eibs.tools.JSEDI0010?SCREEN=2&opt=3&FLGDEL=1", res);
				} catch (FacadeException e) {
					e.printStackTrace();
					flexLog("FacadeException ocurred. Exception = " + e);
					throw new ServletException(e);
				}

		} else {
			String infoFileName = "";
			try {
				infoFileName = req.getParameter("DOC_NAME");
				if (infoFileName == null) infoFileName = "";
			} catch (Exception e) {
				infoFileName = "";
			}
			if (JSEIBSProp.getImgToIFS() && !infoFileName.equals("")) {
				String sPage = "";
				try {
					sPage = req.getParameter("PAGE_NAME");	
					if (sPage == null) sPage = "";
				} catch (Exception e) {
					sPage = "";
				}
				if (!sPage.equals("")) {
					int pos1 = sPage.lastIndexOf("/");
					sPage = sPage.substring(pos1 + 1);
					try {
						String xmlFileName = infoFileName + ".xml";
						//String xmlFile = JSEIBSProp.getImgTempPath() + xmlFileName;
						File xmlFile = new File(JSEIBSProp.getImgTempPath(), xmlFileName);
						
						DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();
						DocumentBuilder parser = builderFactory.newDocumentBuilder();
						org.w3c.dom.Document doc = parser.parse(xmlFile);

						org.w3c.dom.Node root = doc.getFirstChild();
						org.w3c.dom.NodeList list = root.getChildNodes();
						
						for (int i = 0; i < list.getLength(); i++) {
							org.w3c.dom.Node n = list.item(i);
							if (n.getNodeName().equals("Page")) {
								org.w3c.dom.NamedNodeMap m = n.getAttributes();
								org.w3c.dom.Node c = m.getNamedItem("Name");
								if (c.getNodeValue().equals(sPage)) {
									try {
										File fImage = new File(JSEIBSProp.getImgTempPath(), sPage);
										if (!fImage.delete()) {
											flexLog("Error in delete process for : " + sPage);	 
										}
									} catch (Exception ex) {
										flexLog("Exception = " + ex);
									}
									root.removeChild(n);
								}	
							}	
						}
						
						if (list.getLength() == 0) {
							xmlFile.delete();
						} else {
							TransformerFactory tFactory = TransformerFactory.newInstance();
							Transformer transformer = tFactory.newTransformer();
							StreamResult result = new StreamResult(xmlFile);
							DOMSource source = new DOMSource(doc);
							transformer.transform(source, result);
						}
						forward("EDI0010_doc_viewer_deleted.jsp?ROW=" + list.getLength(), req, res);
					} catch (Exception e) {
						flexLog("Exception = " + e);
					}
				}
			}
		}
	}

	/**
	 * @param string
	 * @param res
	 */
	private void procReqDocDeleteJDBC(String infoFileName, HttpServletResponse res) throws ServletException {
		if (!JSEIBSProp.getImgToIFS()) {
			FAImage facade = new FAImage();
			String params[] = com.datapro.generic.tool.Util.split(infoFileName, "_");
			try {
				facade.deleteImage(params[0].substring(params[0].length()-1), params[1], params[2], params[3]);
			} catch (FacadeException e) {
				throw new ServletException(e);
			}
		}
	}

	/**
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 */
	private void procActionEnter(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		// Type (either Account or Customer)
		String type = "";
		try {
			type = req.getParameter("Type").trim();
		} catch (Exception e) {
			type = "";
		}
		if (type.equalsIgnoreCase("C")) {
			procReqDocsTree(user, req, res, session);
		} else if (type.equalsIgnoreCase("A")) {
			procReqInqDocList(user, req, res, session);
		} else {
			procReqEnter(user, req, res, session);
		}
	}

	/**
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 */
	private void procReqDocsTree(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		String outParams = "";
		String firstLink = "";
		boolean firstTime = true;
		JBParseTree dataTree = new JBParseTree();
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDI0010", req);
			EDI001002Message msg = (EDI001002Message) mp.getMessageRecord("EDI001002", user.getH01USR(), "");
			msg.setH02FLGWK2("C");
			// Number
			String imgNumber = "";
			try {
				imgNumber = req.getParameter("NUMBER").trim();
			} catch (Exception e) {
				imgNumber = "";
			}
			msg.setE02DCICUN(imgNumber);
			// Doc Type
			String imgTyp = "";
			try {
				imgTyp = req.getParameter("TYP").trim();
			} catch (Exception e) {
				imgTyp = "";
			}
			msg.setE02DCITYP(imgTyp);
			
			mp.sendMessage(msg);
			
			MessageRecord newmessage = mp.receiveMessageRecord();
			
			if (newmessage.getFormatName().equals("EDI001002")) {
				msg = (EDI001002Message) newmessage;
				
				if (msg.getE02DCINIV().equals("0")) {
					String imageURL = getServerRoot(req) + webAppPath + "/images/";

					dataTree.init();

					dataTree.setRootFont("Dialog", "bold", "12", "0D23B5");
					dataTree.setFolderFont("Dialog", "plain", "10", "000033");
					dataTree.setItemFont("Small", "plain", "10", "000033");
					dataTree.setImageUrl(imageURL);

					dataTree.setRootImage("cube.gif", "cubeover.gif");
					dataTree.setFolderImage("cone.gif", "coneover.gif");
					dataTree.setItemImage("ball.gif", "ballover.gif");

					String titleFolder = msg.getE02DCICUN() + " - " + msg.getE02DCIDSC().trim();
					String titleDescription = msg.getE02DCICUN() + " - " + msg.getE02DCIDSC().trim();

					dataTree.setRootTitle(titleFolder, titleDescription);
					dataTree.setTargetLink("detail");

					String item = "";
					String itemLink = "";
					String folder = "";
					String folderLink = "";
					boolean shutIt = false;

					while (true) {
						msg = (EDI001002Message) mp.receiveMessageRecord();

						if (msg.getE02DCINIV().equals("1")) {
							if (shutIt) {
								folder = "";
							} else {
								shutIt = true;
							}
							folder =
								msg.getE02DCIATY().equalsIgnoreCase("*cus")
									? msg.getE02DCIDSC().trim()
									: msg.getE02DCIATY() + " - " + msg.getE02DCIDSC().trim();

							dataTree.addRow(folder, folder, folderLink, folderLink);

						} else if (msg.getE02DCINIV().equals("2")) {
							String number = msg.getH02FLGWK2().trim().equals("C")?msg.getE02DCICUN().trim():msg.getE02DCIACC().trim();
							if (firstTime) {
								firstTime = false;
								
								firstLink =
									webAppPath
										+ "/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=3&Type="
										+ msg.getH02FLGWK2().trim()
										+ "&NUMBER="
										+  number
										+ "&DocType="
										+ msg.getE02DCITYP().trim();
							}
							itemLink =
								getServerRoot(req)
									+ webAppPath
									+ "/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=3&Type="
									+ msg.getH02FLGWK2().trim()
									+ "&NUMBER="
									+ number
									+ "&DocType="
									+ msg.getE02DCITYP().trim();
							item =
								msg.getE02DCIPRO().equalsIgnoreCase("*cus")
									? msg.getE02DCIDSC().trim()
									: msg.getE02DCIACC().trim()
										+ " - "
										+ msg.getE02DCIPRO()
										+ " - "
										+ msg.getE02DCIDSC().trim();
										
							dataTree.addRow(item, folder, itemLink, folderLink);

						} else if (msg.getE02DCINIV().equals("*")) {
							break;
						}
					}
				}
			} else {
				flexLog("Message " + newmessage.getFormatName() + " received.");
			}

			if (firstTime) {
				forward("MISC_no_result.jsp", req, res);
			} else {
				ELEERRMessage msgError = new ELEERRMessage();
				session.setAttribute("error", msgError);
				outParams = dataTree.getTree();
				session.setAttribute("docsParams", outParams);

				res.setContentType("text/html");
				res.setHeader("Pragma", "No-cache");
				res.setDateHeader("Expires", 0);
				res.setHeader("Cache-Control", "no-cache");
				PrintWriter out = res.getWriter();
				out.println("<!-- frames -->");
				out.println("<frameset  cols=\"28%,*\">");
				out.println(
					"<frame name=\"list\" src=\""
						+ webAppPath
						+ getLangPath(user)
						+ "EDI0010_doc_inq_tree_view.jsp\" marginwidth=\"10\" marginheight=\"10\" scrolling=\"no\" frameborder=\"NO\">");
				out.println(
					"<frame name=\"detail\" src=\""
						+ firstLink
						+ "\" marginwidth=\"10\" marginheight=\"10\" scrolling=\"auto\" frameborder=\"NO\">");
				out.println("</frameset>");
				out.close();
			}
			
		} finally {
			if (mp != null)	mp.close();
		}
	}

	/**
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 */
	private void procReqEnter(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		UserPos userPO = getUserPos(req);
		userPO.setOption("DOCUMENTATION");
		userPO.setPurpose("INQUIRY");
		session.setAttribute("userPO", userPO);
		session.setAttribute("error", new ELEERRMessage());
		forward("EDI0010_doc_general_inq_enter.jsp", req, res);
	}

	/**
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 */
	private void procActionInqDocList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		JBListRec beanList = (JBListRec) session.getAttribute("docList");
		int row = 0;
		try {
			row = Integer.parseInt(req.getParameter("ROW"));
		} catch (Exception e) {
			row = 0;
		}
		beanList.setCurrentRow(row);
		if (JSEIBSProp.getImgToIFS()) {
			procReqDocInfoXML(user, beanList.getRecord(0), beanList.getRecord(3), session);
		} else {
			//procReqDocInfoJDBC(user, beanList.getRecord(0), beanList.getRecord(3), session);
			procReqDocListJDBC(user, beanList.getRecord(0), beanList.getRecord(3), session);
		}
		forward("EDI0010_doc_inq_list.jsp?ROW=" + row, req, res);
	}
	
	/**
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 */
	protected void procReqInqDocList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		UserPos userPO = getUserPos(req);
		
		int colNum = 13;
		JBListRec beanList = new JBListRec();
		beanList.init(colNum);
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDI0010", req);
			EDI001001Message msg = (EDI001001Message) mp.getMessageRecord("EDI001001", user.getH01USR(), "0004");
			try {
				msg.setE01DCITNU(req.getParameter("TABLE_NUM"));
			} catch (Exception e) {
				msg.setE01DCITNU("");
			}
			if ("MAINTENANCE".equals(userPO.getPurpose())) {
				msg.setH01SCRCOD("01");
			} else if (userPO.getPurpose().matches(".*(AppInquiry|APPROVAL_INQ|APPROVE|APPROVAL)")){
				msg.setH01SCRCOD("04");
			} else {
				msg.setH01SCRCOD("05");
			}
			msg.setH01FLGWK1("R"); // Operation (either Send or Receive)
			// Type
			String type = "";
			try {
				type = req.getParameter("Type").trim();
			} catch (Exception e) {
				type = "";
			}
			if (type.equals("R")) {
				msg.setH01FLGWK2("C");
			} else {
				msg.setH01FLGWK2(type);
			}
			// Number
			String imgNumber = "";
			try {
				imgNumber = req.getParameter("NUMBER").trim();
			} catch (Exception e) {
				imgNumber = "";
			}
			if (!imgNumber.equals("")) {
				msg.setE01DCIACC(imgNumber);
				if (type.equals("C")) {
					msg.setE01DCIACD("C1");
				} else {
					msg.setE01DCIACD("");
				}
			} else {
				if (type.equals("C")) {
					msg.setE01DCIACC(userPO.getCusNum());
					msg.setE01DCIACD("C1");
				} else if (type.equals("R")) {
					msg.setE01DCIACC(userPO.getHeader2());
				} else {
					msg.setE01DCIACC(userPO.getIdentifier());
					msg.setE01DCIACD("");
				}
			}
			if (type.equals("S")) {
				msg.setE01DCIACD("PC");
			}
			// Doc Type
			String imgTyp = "";
			try {
				imgTyp = req.getParameter("TYP").trim();
			} catch (Exception e) {
				imgTyp = "";
			}
			msg.setE01DCITYP(imgTyp);
			
			mp.sendMessage(msg);
			
			MessageRecord newmessage = mp.receiveMessageRecord();
			
			if (mp.hasError(newmessage)) {
				beanList.setNoResult(true);
				flexLog("Putting java beans into the session");
				session.setAttribute("error", newmessage);
				session.setAttribute("docList", beanList);
				session.setAttribute("userPO", userPO);
				forward("EDI0010_doc_inq_list.jsp", req, res);
			} else {
				boolean firstTime = true;
				String marker = "";
				String myFlag = "";
				if (newmessage.getFormatName().equals("EDI001001")) {
					String myRow[] = new String[colNum];
					for (int i = 0; i < colNum; i++) {
						myRow[i] = "";
					}
					while (true) {
						msg = (EDI001001Message) newmessage;

						marker = msg.getH01FLGMAS();
						if (marker.equals("*")) {
							break;
						} else {
							if (firstTime) {
								firstTime = false;
								userPO.setHeader18(Util.formatCell(msg.getE01DCITNU()));
								userPO.setHeader19(Util.formatCell(msg.getE01DCIDES()));
								userPO.setHeader20("");
								userPO.setHeader21("");
								userPO.setHeader22(type);
							} else {
								myRow[0] = type
										+ "_"
										+ msg.getE01DCIACC().trim()
										+ "_"
										+ msg.getE01DCITNU().trim()
										+ "_"
										+ msg.getE01DCISEQ().trim();
								myRow[1] = msg.getE01DCITNU();
								myRow[2] = msg.getE01DCISEQ();
								myRow[3] = msg.getE01DCIDES();
								myRow[4] = msg.getE01DCIFRE();
								myRow[5] = msg.getE01DCISTA();
								myRow[6] = msg.getE01DCIPAG();
								myRow[7] = msg.getE01DCITYP();
								myRow[8] = msg.getE01DCIDSQ();
								myRow[9] = msg.getE01DCIEXM();
								myRow[10] = msg.getE01DCIEXD();
								myRow[11] = msg.getE01DCIEXY();
								myRow[12] = msg.getE01DCICOM();
								beanList.addRow(myFlag, myRow);
							}
						}
						newmessage = mp.receiveMessageRecord();	
					}
					flexLog("Putting java beans into the session");
					session.setAttribute("docList", beanList);
					session.setAttribute("userPO", userPO);
					forward("EDI0010_doc_inq_list.jsp", req, res);
				} else {
					flexLog("Message " + newmessage.getFormatName() + " received.");	
				}
			}
		
		} finally {
			if (mp != null)	mp.close();
		}
	}
	/**
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 */
	private void procActionDocList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		UserPos userPO = getUserPos(req);
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
		
		String type = (req.getParameter("Type") == null ? userPO.getType() : req.getParameter("Type").trim());
		type = type.equals("") ? "C" : type;
		
		boolean getParams = (req.getParameter("FLGDEL") == null);
		
		JBListRec beanList  = (JBListRec) session.getAttribute("docList");
		
		if (getParams) {
			int numrow = 0;
			beanList.initRow();
			while (beanList.getNextRow()) {
				numrow++;
				try {				
					beanList.setRecord(
						req.getParameter("E01DCIFRE_" + beanList.getCurrentRow()).toUpperCase(),
						4,
						beanList.getCurrentRow());
					beanList.setRecord(
						req.getParameter("E01DCISTA_" + beanList.getCurrentRow()).toUpperCase(),
						5,
						beanList.getCurrentRow());
					//Maturity date
				   beanList.setRecord(
						req.getParameter("E01DCIEXM_" + beanList.getCurrentRow()).toUpperCase(),
						9,
						beanList.getCurrentRow());
				   beanList.setRecord(
						req.getParameter("E01DCIEXD_" + beanList.getCurrentRow()).toUpperCase(),
						10,
						beanList.getCurrentRow());
					beanList.setRecord(
						req.getParameter("E01DCIEXY_" + beanList.getCurrentRow()).toUpperCase(),
						11,
						beanList.getCurrentRow());
					beanList.setRecord(
						req.getParameter("E01DCICOM_" + beanList.getCurrentRow()).toUpperCase(),
						12,
						beanList.getCurrentRow());
				} catch (Exception e) {
				}
			}
			int totrow = 0;
			try {
				totrow = Integer.parseInt(req.getParameter("TOTALROW"));
			} catch (Exception e) {
				totrow = 0;
			}
			int k;
			if (numrow != totrow) {
				// add new documents
				String myRow[] = new String[13];
				for (int i = 0; i < 13; i++) {
					myRow[i] = "";
				}
				String Number = "";
				String myFlag = "";
				if (userPO.getHeader22().equals("C")) {
					Number = userPO.getCusNum();
				} else {
					Number = userPO.getIdentifier();
				}
				while (numrow < totrow) {
					k = numrow;
					myRow[0] = type
							+ "_"
							+ Number
							+ "_"
							+ userPO.getHeader18()
							+ "_"
							+ req.getParameter("E01DCISEQ_" + k).toUpperCase();
					myRow[1] = userPO.getHeader18();
					myRow[2] = req.getParameter("E01DCISEQ_" + k).toUpperCase();
					myRow[3] = req.getParameter("E01DCIDES_" + k).toUpperCase();
					myRow[4] = req.getParameter("E01DCIFRE_" + k).toUpperCase();
					myRow[5] = req.getParameter("E01DCISTA_" + k).toUpperCase();
					myRow[7] = req.getParameter("E01DCITYP_" + k).toUpperCase();
					myRow[8] = req.getParameter("E01DCIDSQ_" + k).toUpperCase();
					myRow[9] = req.getParameter("E01DCIEXM_" + k).toUpperCase();
					myRow[10] = req.getParameter("E01DCIEXD_" + k).toUpperCase();
					myRow[11] = req.getParameter("E01DCIEXY_" + k).toUpperCase();	
					myRow[12] = req.getParameter("E01DCICOM_" + k).toUpperCase();	
					beanList.addRow(myFlag, myRow);						
					numrow++;
				}
			}	
			session.setAttribute("docList", beanList);
		} else {
			// Si habia una sola imagen cambiar status
			JBListRec imgList = (JBListRec) session.getAttribute("listImg");
			int numImg = 0;
			imgList.initRow();
			while (imgList.getNextRow()) {
				numImg++;
			}
			if (numImg <= 1) {
				beanList.setCurrentRow(row);
				beanList.setRecord(	"",
									5,
									beanList.getCurrentRow());
			}
		}
		// Update for all options
		//procActionDocListUpdate(user, req, res, session);
		
		beanList.setCurrentRow(row);
		session.setAttribute("ROW", String.valueOf(row));
		
		switch (option) {
			case 1 : // Update
				procActionDocListUpdate(user, req, res, session);
				res.sendRedirect(srctx + "/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=1&Type=" + type + "&TABLE_NUM=" + userPO.getHeader18());
				break;
			case 2 : // Scan
				int k = 1;
				if (k==1) {
					procActionDocListUpdate(user, req, res, session);
					String Number = "";
					if (userPO.getHeader22().equals("C")) {
						Number = userPO.getCusNum();
					} else {
						Number = userPO.getIdentifier();
					}
					String url = "";
					if (JSEIBSProp.getImageRemote()) {
						url = JSEIBSProp.getScanURL();
					} else {
						url = getServerRoot(req) + webAppPath + "/servlet/datapro.eibs.tools.JSScanDocDone";
					}
					
					userPO.setRedirect("/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=1&Type=" + type);
					session.setAttribute("userPO", userPO);
					
					res.sendRedirect(srctx + 
						"/servlet/datapro.eibs.tools.JSScan?Name="
							+ beanList.getRecord(0)
							+ "&Desc="
							+ beanList.getRecord(3)
							+ "&URL="
							+ url
							+ "?USERID="
							+ user.getH01USR()
							+ "@NUMBER="
							+ Number
							+ "@TYPE="
							+ userPO.getHeader22()
							+ "@ADD="
							+ beanList.getRecord(0)
							+ "@TNU="
							+ beanList.getRecord(1)
							+ "@SEQ="
							+ beanList.getRecord(2)
							+ "@DES="
							+ beanList.getRecord(3).trim().replace(' ', '^')
							+ "@FRE="
							+ beanList.getRecord(4)
							+ "@TYP="
							+ beanList.getRecord(7)
							+ "@DSQ="
							+ beanList.getRecord(8)
							+ "@STATUS=P"
							//+ ("SC".equals(beanList.getRecord(7)) && !"0".equals(beanList.getRecord(8)) ? "P" : "A"));
							);
				} else {
					forward("EDI0010_doc_list.jsp?ROW=" + row, req, res);
				}
				break;
				//procReqDocInfoJDBC(user, beanList.getRecord(0), beanList.getRecord(3), session);
				//procReqDocListJDBC(user, beanList.getRecord(0), beanList.getRecord(3), session);

			case 3 : // View
				if (beanList.getRecord(5).equalsIgnoreCase("CO")) {
					if (JSEIBSProp.getImgToIFS())
						procReqDocInfoXML(user, beanList.getRecord(0), beanList.getRecord(3), session);
					else
						procReqDocListJDBC(user, beanList.getRecord(0), beanList.getRecord(3), session);
				}
				forward("EDI0010_doc_list.jsp?ROW=" + row, req, res);
				break;
			case 4 : // Delete
				procActionDocListUpdate(user, req, res, session);
				procActionDocDelete(user, req, res, session, beanList);
				procReqDocList(user, req, res, session);
				//forward("EDI0010_doc_list.jsp?ROW=" + row, req, res);
				break;
			case 5 : // Add
				procActionDocListUpdate(user, req, res, session);
				forward("EDI0010_doc_list.jsp?ROW=" + row, req, res);
				break;
			default :
				forward(bgPage, req, res);
		}
	}
	
	
	/**
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 * @param beanList
	 */
	private void procActionDocDelete(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, JBListRec beanList) {
		String infoFileName = beanList.getRecord(0);
		UserPos userPO = (UserPos) session.getAttribute("userPO");
		
		if (!JSEIBSProp.getImgToIFS()) {
			try {
				String number = "";
				if (userPO.getHeader22().equals("C")) {
					number = userPO.getCusNum();
				} else {
					number = userPO.getIdentifier();
				}	
				String table = userPO.getHeader18();
				String type = userPO.getHeader22();
					
				FAImage facade = new FAImage();
				facade.deleteImage(type, number, table, beanList.getRecord(2));
				
			} catch (FacadeException e) {
				e.printStackTrace();
				flexLog("FacadeException ocurred. Exception = " + e);
			}
		} else {
			if (JSEIBSProp.getImgToIFS() && infoFileName != null) {
				try {
					String xmlFileName = infoFileName + ".xml";
					//String xmlFile = JSEIBSProp.getImgTempPath() + xmlFileName;
					File xmlFile = new File(JSEIBSProp.getImgTempPath(), xmlFileName);
						
					DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();
					DocumentBuilder parser = builderFactory.newDocumentBuilder();
					org.w3c.dom.Document doc = parser.parse(xmlFile);

					org.w3c.dom.Node root = doc.getFirstChild();
					org.w3c.dom.NodeList list = root.getChildNodes();
						
					for (int i = 0; i < list.getLength(); i++) {
						org.w3c.dom.Node n = list.item(i);
						if (n.getNodeName().equals("Page")) {
							org.w3c.dom.NamedNodeMap m = n.getAttributes();
							org.w3c.dom.Node c = m.getNamedItem("Name");
							String sPage = c.getNodeValue();
							try {
								File fImage = new File(JSEIBSProp.getImgTempPath(), sPage);
								if (!fImage.delete()) {
									flexLog("Error in delete process for : " + sPage);	 
								}
							} catch (Exception ex) {
								flexLog("Exception = " + ex);
							}
						}	
					}
					
					xmlFile.delete();
					
				} catch (Exception e) {
					flexLog("Exception = " + e);
				}
			}	
		}
	}
	
	private void procReqDocListJDBC(ESS0030DSMessage user, String infoFileName, String docName, HttpSession session) throws ServletException, IOException {
		int i = 0; 
		String[] element = new String[4];
		for (StringTokenizer st = new StringTokenizer(infoFileName, "_"); st.hasMoreElements();) {
			element[i++] = (String) st.nextElement();
		}
		
		UserPos userPO = (UserPos) session.getAttribute("userPO");
		FAImage facade = new FAImage();
		try {
			BeanList list = null;			
			if ("INQUIRY".equals(userPO.getPurpose())) {
				list = facade.getDocTableInqList(element[0], element[1], element[2], element[3]);
			} else {
				list = facade.getDocTableList(element[0], element[1], element[2], element[3]);
			}
			list.initRow();
			JBListRec beanImg = new JBListRec();
			int colNum = 13;
			beanImg.init(colNum);
			String myFlag = "";
			String myRow[] = new String[colNum];
			for (int k=0; k < colNum; k++) {
				myRow[k] = "";
			}
			while (list.getNextRow()) {
				SCNIMGView vo = (SCNIMGView) list.getRecord();
				myRow[0] = vo.getTBLDSC().trim();
				String extTemp = myRow[0].substring(myRow[0].lastIndexOf(".")).toLowerCase();
				if (extTemp.equals(".jpg") || extTemp.equals(".gif")) {
					myFlag = "I";
				} else {
					myFlag = "";
				}					
				myRow[1]  = docName;
				myRow[2]  = myRow[0].substring(myRow[0].lastIndexOf(".") + 1);
				myRow[3]  = vo.getTBLLMM() + "/" + vo.getTBLLMD() + "/" + vo.getTBLLMY();
				myRow[4]  = vo.getTBLSSQ().toString();
				myRow[5]  = vo.getTBLUID().toString();
				myRow[6]  = vo.getIMGLEN().toString();
				myRow[7]  = element[0]; // element type
				myRow[8]  = element[1]; // client number
				myRow[9]  = element[2]; // table number
				myRow[10] = element[3]; // doc sequence
				if (vo.getTBLSTS().equals("A")){  // account status
					myRow[11] = "Activa";
				}else if (vo.getTBLSTS().equals("P")){
					myRow[11] = "Pendiente Aprobacion";
				}else if (vo.getTBLSTS().equals("D")){
					myRow[11] = "Pendiente Borrado";
				}else if (vo.getTBLSTS().equals("C")){
					myRow[11] = "Borrada";
				}
				myRow[12]  = vo.getTBLSTS().toString();
				beanImg.addRow(myFlag, myRow);
			}
			if (!list.isEmpty()) {
				userPO.setHeader20("DO_INQ");
				userPO.setHeader21(webAppPath + getLangPath(user) + "EDI0010_doc_viewer_container.jsp?DOC_NAME=" + infoFileName);
				session.setAttribute("userPO", userPO);
				//Descending sort
				//beanImg = sortList(beanImg, 4, colNum);
				session.setAttribute("listImg", beanImg);
			}
		} catch (FacadeException e) {
			e.printStackTrace();
			throw new ServletException(e);
		}
	}
	
	
	protected void viewImage(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {
		
		String tbltyp = null;
		String tblacc = null;
		String tbltnu = null;
		String tblseq = null;
		String infoFileName = null;

		try {
			tbltyp = req.getParameter("tbltyp").toString();
		} catch (Exception e) {
			tbltyp = "C";
		}
		try {
			tblacc = req.getParameter("tblacc").toString();
		} catch (Exception e) {
			tblacc = "";
		}
		try {
			tbltnu = req.getParameter("tbltnu").toString();
		} catch (Exception e) {
			tbltnu = "1";
		}
		try {
			tblseq = req.getParameter("tblseq").toString();
		} catch (Exception e) {
			tblseq = "1";
		}
		
		infoFileName = tbltyp + "_" + tblacc + "_" + tbltnu + "_" + tblseq;

		FAImage facade = new FAImage();
		try {
			BeanList list = facade.getDocTableList(tbltyp, tblacc, tbltnu, tblseq);
			list.initRow();
			JBListRec beanImg = new JBListRec();
			int colNum = 6;
			beanImg.init(colNum);
			String myFlag = "";
			String myRow[] = new String[colNum];
			for (int k = 0; k < colNum; k++) {
				myRow[k] = "";
			}
			while (list.getNextRow()) {
				SCNIMGView vo = (SCNIMGView) list.getRecord();
				myRow[0] = vo.getTBLDSC().trim();
				String extTemp = myRow[0].substring(myRow[0].lastIndexOf("."))
						.toLowerCase();
				if (extTemp.equals(".jpg") || extTemp.equals(".gif")) {
					myFlag = "I";
				} else {
					myFlag = "";
				}
				myRow[1] = "Imagen de Firma";
				myRow[2] = myRow[0].substring(myRow[0].lastIndexOf(".") + 1);
				myRow[3] = vo.getTBLLMM() + "/" + vo.getTBLLMD() + "/"
						+ vo.getTBLLMY();
				myRow[4] = vo.getTBLSSQ().toString();
				myRow[5] = vo.getTBLUID().toString();
				beanImg.addRow(myFlag, myRow);
			}
			if (!list.isEmpty()) {
				UserPos userPO = (UserPos) session.getAttribute("userPO");
				userPO.setHeader20("DO_INQ");
				userPO.setHeader21(webAppPath + getLangPath(user)
						+ "EDI0010_doc_viewer_container.jsp?DOC_NAME="
						+ infoFileName);
				session.setAttribute("userPO", userPO);
				// Descending sort
				// beanImg = sortList(beanImg, 4, colNum);
				session.setAttribute("listImg", beanImg);
				forward("EDI0010_doc_viewer_container.jsp?DOC_NAME="
						+ infoFileName, req, res);
			} else {
				ELEERRMessage msgError = new ELEERRMessage();
				msgError.setERRNUM("1");
				msgError.setERNU01("0099");
				msgError.setERDS01("No existen imagenes en la base de datos.");
				session.setAttribute("error", msgError);
				forward("error_viewer.jsp", req, res);
			}

		} catch (FacadeException e) {
			e.printStackTrace();
			throw new ServletException(e);
		}
	}
		
	
	
	private void procGetImageFile(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		String uid = (req.getParameter("DOC_UID") == null) ? "" : req.getParameter("DOC_UID").trim();
		String typ = (req.getParameter("TYP") == null) ? "" : req.getParameter("TYP").trim();
		String doc = (req.getParameter("DOC_NAME") == null) ? "" : req.getParameter("DOC_NAME").trim();
		String PageToCall = "";
		FAImage facade = new FAImage();
		try {
			flexLog("Image to View: " + uid);
			SCNIMGView vo = facade.getImage(uid);
			byte buf[] = vo.getIMGBIN();
			OutputStream osImage = new FileOutputStream(JSEIBSProp.getImgTempPath() + vo.getTBLDSC().trim());
			osImage.write(buf);
			osImage.close();
			
			String imgFileName = JSEIBSProp.getScanDataURL() + vo.getTBLDSC().trim();
			if (typ.equals("I")) {
				PageToCall = "EDI0010_doc_viewer_img_container.jsp?DOC_NAME=" + doc + "&PAGE_NAME=" + imgFileName + "&IMG_SIZE=370";
			} else {
				PageToCall = "EDI0010_doc_viewer_blank.jsp?PAGE_NAME=" + imgFileName;
			}
			forward(PageToCall, req, res);
					 
		} catch (FacadeException e) {
			e.printStackTrace();
			flexLog("FacadeException ocurred. Exception = " + e);
			throw new ServletException(e);
		} catch (ItemNotFoundException e) {
			e.printStackTrace();
			flexLog("ItemNotFoundException ocurred. Exception = " + e);
			throw new ServletException(e);
		}
	}
	
	private  void procGetImageJDBC(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		try {
			String uid = 
				req.getParameter("DOC_UID") == null ? "" : req.getParameter("DOC_UID").trim();
			String imgFileName = 
				req.getParameter("DOC_NAME") == null ? "" : req.getParameter("DOC_NAME").trim();
			
			byte buf[] = null;
			if (JSEIBSProp.getImgToIFS()) {
				if (imgFileName != null) {
					InputStream inImage = null;
					try {
						File file = new File(JSEIBSProp.getImgTempPath(), imgFileName);
						inImage = new FileInputStream(file);
						sendResponse(res, inImage, imgFileName);
					} finally {
						if (inImage != null) 
							inImage.close();
					}
				}
			} else {
				if (uid != null) {
					FAImage facade = new FAImage();
					uid = imgFileName.substring(0, imgFileName.indexOf('_'));
					SCNIMGView vo = facade.getImage(uid);
					imgFileName = vo.getTBLDSC().trim();
					buf = vo.getIMGBIN();
				}
			}
			
			res.reset();
			String ext = imgFileName.substring(imgFileName.lastIndexOf(".") + 1).toLowerCase();
			if (ext.equals("pdf")) {
				res.setContentType("application/pdf");
			} else {
				if (ext.equals("jpg") || ext.equals("jpeg")) {
					res.setContentType("image/jpeg");
				} else {
					if (ext.equals("doc")) {
						res.setContentType("eibs/form");
						res.setHeader("Content-disposition", "attachment; filename=\"" + imgFileName + "\"");
					} else {	
						if (ext.equals("xls")) {
							res.setContentType("application/vnd.ms-excel");
							res.setHeader("Content-disposition", "attachment; filename=\"" + imgFileName + "\"");
						} else {	
						if (ext.equals("tif") || ext.equals("tiff")) {
							res.setContentType("image/tiff");
						} else {	
							res.setContentType("image/" + ext);
						}
						}
					}
				}
			}
			res.setContentLength(buf.length);
			
			BufferedOutputStream output = null;
			try {
				output = new BufferedOutputStream(res.getOutputStream());
				output.write(buf);
				output.flush();
			} finally {
				output.close();
			}
					 
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServletException(e);
		}
	}	
	
	/**
	 * @param string
	 * @param string2
	 * @param session
	 */
	/*
	 private void procReqDocInfoJDBC(ESS0030DSMessage user, String infoFileName, String docName, HttpSession session) throws ServletException, IOException {
		int i = 0; 
		String[] element = new String[4];
		for (StringTokenizer st = new StringTokenizer(infoFileName, "_"); st.hasMoreElements();) {
			element[i++] = (String) st.nextElement();
		}
		FAImage facade = new FAImage();
		try {
			BeanList list = facade.getDocImageList(element[0], element[1], element[2], element[3]);
			list.initRow();
			JBListRec beanImg = new JBListRec();
			int colNum = 5;
			beanImg.init(colNum);
			String myFlag = "";
			String myRow[] = new String[colNum];
			for (int k=0; k<colNum; k++) {
				myRow[k] = "";
			}
			while (list.getNextRow()) {
				SCNDOCView vo = (SCNDOCView) list.getRecord();
				String imgFileName = vo.getTBLDSC().trim();
				myRow[0] = JSEIBSProp.getScanDataURL() + imgFileName;
				String extTemp = myRow[0].substring(myRow[0].lastIndexOf(".")).toLowerCase();
				if (extTemp.equals(".jpg") || extTemp.equals(".gif")) {
					myFlag = "I";
				} else {
					myFlag = "";
				}					
				myRow[1] = docName;
				myRow[2] = myRow[0].substring(myRow[0].lastIndexOf(".") + 1);
				myRow[3] = vo.getTBLLMM() + "/" + vo.getTBLLMD() + "/" + vo.getTBLLMY();
				myRow[4] = vo.getTBLSSQ().toString();
				beanImg.addRow(myFlag, myRow);
			
				byte buf[] = vo.getIMGBIN();
				OutputStream osImage = new FileOutputStream(JSEIBSProp.getImgTempPath() + imgFileName);
				osImage.write(buf);
				osImage.close();
			}	

			if (!list.isEmpty()) {
				UserPos userPO = (UserPos) session.getAttribute("userPO");
				userPO.setHeader20("DO_INQ");
				userPO.setHeader21(super.webAppPath + super.getLangPath(user) + "EDI0010_doc_viewer_container.jsp?DOC_NAME=" + infoFileName);
				session.setAttribute("userPO", userPO);
				//Descending sort
				beanImg = sortList(beanImg, 4, colNum);
				session.setAttribute("listImg", beanImg);
			}
			
		} catch (FacadeException e) {
			e.printStackTrace();
			flexLog("FacadeException ocurred. Exception = " + e);
			throw new ServletException(e);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			flexLog("FileNotFoundException ocurred. Exception = " + e);
			throw new ServletException(e);
		}
	}
	*/
	
	/**
	 * This method was created by Orestes Garcia.
	 */
	private JBListRec sortList(JBListRec list,int idx,int col)  {
		JBListRec slist = new JBListRec();
		int maxrow = list.getLastRec();
		list.setCurrentRow(maxrow);
		String flag = list.getRecord(idx);
		String myRow[] = new String[col];
		int count = 0;
		slist.init(col);	
		boolean oneElement = true;	
			
		for (int i = maxrow - 1 ; i > -2; i--) {
			
			if (!flag.equals(list.getRecord(idx))) {
				int pos = 0;
				flag = list.getRecord(idx);
				oneElement = false;
				if (i==-1) list.initRow();
				while (list.getNextRow() && pos < count) {
					for (int j = 0; j < col; j++) {
						myRow[j] = list.getRecord(j);
					}
					slist.addRow(list.getFlag(),myRow);
					pos++;
				}
				count = 0;
				if (i == -1) break;
				i++;
			} else {
				count++;
			}
			list.setCurrentRow(i);
			if (i==0) {
				flag = "@@@";
				count++;
			} 
		}
		
		if (oneElement) return list;
		else return slist;
	}

	/**
	 * @param string
	 * @param string2
	 * @param session
	 */
	private void procReqDocInfoXML(ESS0030DSMessage user, String infoFileName, String docName, HttpSession session) throws ServletException, IOException {
		try {
			DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder parser = builderFactory.newDocumentBuilder();
			
			File file = new File(JSEIBSProp.getImgTempPath(), infoFileName + ".xml");
			org.w3c.dom.Document doc = parser.parse(file);
			JBListRec beanImg = new JBListRec();
			int colNum = 6;
			beanImg.init(colNum);
			String myFlag = "";
			String myRow[] = new String[colNum];
			for (int i = 0; i < colNum; i++) {
				myRow[i] = "";
			}
			
			org.w3c.dom.Node docPages = doc.getFirstChild();
			org.w3c.dom.NodeList list = docPages.getChildNodes();
			for (int i = 0; i < list.getLength(); i++) {
				org.w3c.dom.Node n = list.item(i);
				if (n.getNodeName().equals("Page")) {
					org.w3c.dom.NamedNodeMap m = n.getAttributes();
					org.w3c.dom.Node c = m.getNamedItem("Name");
					myRow[0] = JSEIBSProp.getScanDataURL() + c.getNodeValue();
					String extTemp = myRow[0].substring(myRow[0].lastIndexOf(".")).toLowerCase();
					if (extTemp.equals(".jpg") || extTemp.equals(".gif")) {
						myFlag = "I";
					} else {
						myFlag = "";
					}
					myRow[1] = docName;
					myRow[2] = myRow[0].substring(myRow[0].lastIndexOf(".") + 1);
					c = m.getNamedItem("Date");
					if (c == null)
						myRow[3] = "";
					else
						myRow[3] = c.getNodeValue();
					c = m.getNamedItem("Seq");
					if (c == null)
						myRow[4] = "1";
					else
						myRow[4] = c.getNodeValue();
					myRow[5] = infoFileName; 
					beanImg.addRow(myFlag, myRow);
				}
			}

			UserPos userPO = (UserPos) session.getAttribute("userPO");
			userPO.setHeader20("DO_INQ");
			userPO.setHeader21(webAppPath + super.getLangPath(user) + "EDI0010_doc_viewer_container.jsp?DOC_NAME=" + infoFileName);
			session.setAttribute("userPO", userPO);
			//Descending sort
			beanImg = sortList(beanImg, 4, colNum);
			session.setAttribute("listImg", beanImg);
			
		} catch (ParserConfigurationException e) {
			e.printStackTrace();
			flexLog("ParserConfigurationException ocurred. Exception = " + e);
			throw new ServletException(e);
		} catch (SAXException e) {
			e.printStackTrace();
			flexLog("SAXException ocurred. Exception = " + e);
			throw new ServletException(e);
		}
		
	}
	
	
	private void prepareUpdate(int option, ESS0030DSMessage user, HttpServletRequest req, EDI001001Message msg,
			JBListRec beanList) 
		throws ServletException, IOException {
		UserPos userPO = getUserPos(req);
		
		msg.setH01USERID(user.getH01USR());
		msg.setH01SCRCOD("01");
		msg.setH01FLGWK1("S");
		msg.setH01FLGWK2(userPO.getHeader22());
		// LMCR When delete
		if (option == 4) {
			msg.setH01FLGWK3("D");
		}
		if (userPO.getHeader22().equals("C")) {
			msg.setE01DCIACC(userPO.getCusNum());
			msg.setE01DCIACD("C1");
		} else {
			if ("S".equals(userPO.getHeader22())){
				msg.setE01DCIACD("PC");
			}
			msg.setE01DCIACC(userPO.getIdentifier());
		}
		msg.setE01DCIADD(beanList.getRecord(0));
		msg.setE01DCITNU(beanList.getRecord(1));
		msg.setE01DCISEQ(beanList.getRecord(2));
		msg.setE01DCIDES(beanList.getRecord(3));
		msg.setE01DCIFRE(beanList.getRecord(4));
		msg.setE01DCISTA(beanList.getRecord(5));
		msg.setE01DCIPAG(beanList.getRecord(6));
		msg.setE01DCITYP(beanList.getRecord(7));
		msg.setE01DCIEXM(beanList.getRecord(9));
		msg.setE01DCIEXD(beanList.getRecord(10));
		msg.setE01DCIEXY(beanList.getRecord(11));
		msg.setE01DCICOM(beanList.getRecord(12));
	}
	
	/**
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 */
	private boolean procActionDocListUpdate(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		UserPos userPO = (UserPos) session.getAttribute("userPO");
		JBListRec beanList = (JBListRec) session.getAttribute("docList");
		MessageProcessor mp = null;
		EDI001001Message msg = null;
		ELEERRMessage msgError = null;
		boolean isNotError=true;
		
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
			throw new ServletException("There not any row selected.");
		}
		String reason = "";
		try {
			reason = req.getParameter("reason").trim();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		try {
			mp = getMessageProcessor("EDI0010", req);
			msg = (EDI001001Message) mp.getMessageRecord("EDI001001");
			beanList.initRow();
			if (option == 1) { //Update all items.
				while (beanList.getNextRow()) {
					prepareUpdate(option, user, req, msg, beanList);
				
					mp.sendMessage(msg);
				}
				beanList.setCurrentRow(row);
				// send end of list
				msg.setH01FLGMAS("*");
				mp.sendMessage(msg);
			} else { //Update only selected item.
				beanList.setCurrentRow(row);
				prepareUpdate(option, user, req, msg, beanList);
				msg.setH01FLGWK1("1");
				msg.setH01FLGWK3("R");
				
				if (option == 2 || option == 4) { //Add or Delete Document
					msg.setE01DCICOM(reason);
				}
				
				mp.sendMessage(msg);
			}
			
			msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			if (mp.hasError(msgError)) {
				beanList.setNoResult(true);
				session.setAttribute("error", msgError);
				session.setAttribute("docList", beanList);
				session.setAttribute("userPO", userPO);
				forward("EDI0010_doc_list.jsp", req, res);
				
				isNotError = false;
			}
			
		
		} finally {
			if (mp != null)	mp.close();
		}
		
		return isNotError;
	}
	
	/**
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 */
	private void procReqDocList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		String PageToCall = "";
		try {
			mp = getMessageProcessor("EDI0010", req);
			EDI001001Message msg = (EDI001001Message) mp.getMessageRecord("EDI001001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01OPECOD("0002");
			msg.setH01SCRCOD("01");
			msg.setH01FLGWK1("R"); // Operation (either Send or Receive)
			String type = "";
			try {
				type = req.getParameter("Type").trim();
			} catch (Exception e) {
				type = "";
			}
			msg.setH01FLGWK2(type);
			if (type.equals("C") && !userPO.getCusNum().trim().equals("")) { //Cliente
				msg.setE01DCIACC(userPO.getCusNum());
				msg.setE01DCIACD("C1");
			} else if (type.equals("S")) {	//Propuesta
				msg.setE01DCIACC(userPO.getIdentifier());
				msg.setE01DCIACD("PC");
			} else if (type.equals("A")) { //Producto
				msg.setE01DCIACC(userPO.getAccNum());
			} else if (type.equals("F") 	   //?
						|| type.equals("P")    //?	
						|| type.equals("G")) { //Garantias
				try {
					msg.setE01DCIACC(req.getParameter("IDENTIFIER"));
				} catch (Exception e) {
					msg.setE01DCIACC(userPO.getIdentifier());
				}
				msg.setE01DCIACD("");
			} 
			
			try {
				msg.setE01DCITNU(req.getParameter("TABLE_NUM").trim());
			} catch (Exception e) {
				msg.setE01DCITNU("");
			}
			
			mp.sendMessage(msg);
			
			ELEERRMessage msgError = new ELEERRMessage();
			
			MessageRecord newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				msgError = (ELEERRMessage) newmessage;
				PageToCall = "EDI0010_doc_list.jsp";
			} else {
				boolean firstTime = true;
				String marker = "";
				String myFlag = "";
				if (newmessage.getFormatName().equals("EDI001001")) {
					int colNum = 13;
					String myRow[] = new String[colNum];
					for (int i = 0; i < colNum; i++) {
						myRow[i] = "";
					}
					JBListRec jbList = new JBListRec(); 
					jbList.init(colNum);
					while (true) {
						msg = (EDI001001Message) newmessage;
						marker = msg.getH01FLGMAS();
						if (marker.equals("*")) {
							break;
						} else {
							if (firstTime) {
								firstTime = false;
								userPO.setHeader18(Util.formatCell(msg.getE01DCITNU()));
								userPO.setHeader19(Util.formatCell(msg.getE01DCIDES()));
								userPO.setHeader20("");
								userPO.setHeader21("");
								userPO.setHeader22(type);

							} else {
								myRow[0] = type
										+ "_"
										+ msg.getE01DCIACC().trim()
										+ "_"
										+ msg.getE01DCITNU().trim()
										+ "_"
										+ msg.getE01DCISEQ().trim();
								myRow[1] = msg.getE01DCITNU();
								myRow[2] = msg.getE01DCISEQ();
								myRow[3] = msg.getE01DCIDES();
								myRow[4] = msg.getE01DCIFRE();
								myRow[5] = msg.getE01DCISTA();
								myRow[6] = msg.getE01DCIPAG();
								myRow[7] = msg.getE01DCITYP();		
								myRow[8] = msg.getE01DCIDSQ();
								myRow[9] = msg.getE01DCIEXM();
								myRow[10] = msg.getE01DCIEXD();
								myRow[11] = msg.getE01DCIEXY();
								myRow[12] = msg.getE01DCICOM();
								
								jbList.addRow(myFlag, myRow);
								
							}	//first time
							
						} //endif *
						
						newmessage = mp.receiveMessageRecord();	
					}	//enddo
					
					session.setAttribute("docList", jbList);
					PageToCall = "EDI0010_doc_list.jsp";
				} else {
					if (newmessage.getFormatName().equals("EDI001003")) {
						StringBuffer myRow = null;
						String chk = "";
						JBList tableList = new JBList();
						while (true) {
							EDI001003Message msgTables = (EDI001003Message) newmessage;
							marker = msgTables.getH03FLGMAS();
							if (marker.equals("*")) {
								break;
							} else {
								if (firstTime) {
									firstTime = false;
									chk = "checked";
									userPO.setHeader22(type);
								} else {
									chk = "";	
								}
								myRow = new StringBuffer("<TR>");
								myRow.append("<TD NOWRAP><input type=\"radio\" name=\"TABLE_NUM\" value=\""
									+ msgTables.getE03DCITNU()
									+ "\" "
									+ chk
									+ "></TD>");
								myRow.append("<TD NOWRAP>" + Util.formatCell(msgTables.getE03DCITNU()) + "</TD>");
								myRow.append("<TD NOWRAP>" + Util.formatCell(msgTables.getE03DCIDSC()) + "</TD>");
								myRow.append("</TR>");

								tableList.addRow("", myRow.toString());
							}
							newmessage = mp.receiveMessageRecord();
						}	
						session.setAttribute("tblList", tableList);
						PageToCall = "EDI0010_doc_table_selection_list.jsp";
					} else {
						flexLog("Message " + newmessage.getFormatName() + " received.");
					}
				}
			}			
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			
			forward(PageToCall, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}
	
	private void procReqDocListSC(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String[] element = new String[3];
		try {
			element[0] = req.getParameter("TBLTYP").trim();
		} catch (Exception e) {
			element[0] = "A";
		}
		try {
			element[1] = req.getParameter("TBLNUM").trim();
		} catch (Exception e) {
			element[1] = "0";
		}
		try {
			element[2] = req.getParameter("TBLDTY").trim();
		} catch (Exception e) {
			element[2] = "SC";
		}
		
		FAImage facade = new FAImage();
		try {
			BeanList list = null;			
			
			list = facade.getDocTableInqListSC(element[0], element[1], element[2]);
			
			list.initRow();
			JBListRec beanImg = new JBListRec();
			int colNum = 13;
			beanImg.init(colNum);
			String myFlag = "";
			String myRow[] = new String[colNum];
			for (int k=0; k < colNum; k++) {
				myRow[k] = "";
			}
			while (list.getNextRow()) {
				SCNIMGView vo = (SCNIMGView) list.getRecord();
				myRow[0] = vo.getTBLDSC().trim();
				String extTemp = myRow[0].substring(myRow[0].lastIndexOf(".")).toLowerCase();
				if (extTemp.equals(".jpg") || extTemp.equals(".gif")) {
					myFlag = "I";
				} else {
					myFlag = "";
				}
				
				myRow[1]  = "FIRMAS";
				myRow[2]  = myRow[0].substring(myRow[0].lastIndexOf(".") + 1);
				myRow[3]  = vo.getTBLLMM() + "/" + vo.getTBLLMD() + "/" + vo.getTBLLMY();
				myRow[4]  = vo.getTBLSSQ().toString();
				myRow[5]  = vo.getTBLUID().toString();
				myRow[6]  = vo.getIMGLEN().toString();
				myRow[7]  = element[0]; // entity type (client=C, account=A)
				myRow[8]  = element[1]; // client/account number
				myRow[9]  = element[2]; // document type
				myRow[10] = vo.getTBLSSQ().toString(); // doc sequence
				if (vo.getTBLSTS().equals("A")){  // account status
					myRow[11] = "Activa";
				}else if (vo.getTBLSTS().equals("P")){
					myRow[11] = "Pendiente Aprobacion";
				}else if (vo.getTBLSTS().equals("D")){
					myRow[11] = "Pendiente Borrado";
				}else if (vo.getTBLSTS().equals("C")){
					myRow[11] = "Borrada";
				}
				myRow[12]  = vo.getTBLSTS().toString();
				beanImg.addRow(myFlag, myRow);
			}
			if (!list.isEmpty()) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("listImg", beanImg);
				forward("EDI0010_doc_viewer_container_help.jsp", req, res);
			}else{
				session.setAttribute("userPO", userPO);
				forward("EDI0010_doc_viewer_container_help_empty.jsp", req, res);
			}
		} catch (FacadeException e) {
			e.printStackTrace();
			throw new ServletException(e);
		}
	}
	
		
}
