package datapro.eibs.client;

import java.io.IOException;
import java.io.OutputStream;
import java.util.Enumeration;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ECO016001Message;
import datapro.eibs.beans.ECO016002Message;
import datapro.eibs.beans.ECO016004Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.ExcelColStyle;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSProp;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.services.ExcelUtils;
import datapro.eibs.sockets.MessageField;

/**
 * 
 * @author evargas
 *
 */
public class JSECO0160 extends JSEIBSServlet {

	protected static final int COVENANT_SEARCH = 100;
	protected static final int COVENANT_LIST = 200;
	protected static final int COVENANT_DETAIL = 300;
	protected static final int A_EXCEL_FILE = 400;

		

	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		switch (screen) {
			case COVENANT_SEARCH:
				procSearchCovenant(user, req, res, session);
				break;		
			case COVENANT_LIST:
				procCovenantList(user, req, res, session);
				break;	
			case COVENANT_DETAIL:
				procCovenantDetails(user, req, res, session);
				break;					
			case A_EXCEL_FILE :
				generateExcelDocument(user, req, res, session);
				break;
			default :
				forward(devPage, req, res);
				break;
		}		
	}
	
	
	private void generateExcelDocument(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ECO0160", req);
			ECO016004Message msgList = (ECO016004Message) mp.getMessageRecord("ECO016004");
			msgList.setUSUARIO(user.getH01USR());
			try {
				msgList.setCONVENIO(req.getParameter("CONV").trim());
			} catch (Exception e) {
				msgList.setCONVENIO("0");
			}
			try {
				msgList.setPLANILLA(req.getParameter("PLAN").trim());
			} catch (Exception e) {
				msgList.setPLANILLA("0");
			}
			try {
				msgList.setMONEDA(req.getParameter("CURR").trim());
			} catch (Exception e) {
				msgList.setMONEDA("CLP");
			}
			
			mp.sendMessage(msgList);
			JBObjList list = mp.receiveMessageRecordList("FLAGMAS");
			
			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				forward("error_viewer.jsp", req, res);					
			} else {
				String fileName = req.getParameter("CONV").trim() + "_" + req.getParameter("PLAN").trim() + "." + JSEIBSProp.getExcelFormat();
				String excelName = "attachment; filename=\"" + fileName + "\"";
				res.setContentType("application/vnd.ms-excel");			
				res.setHeader("Content-disposition", excelName);
				
				Vector fields = new Vector();
				msgList = new ECO016004Message();
				Enumeration enu = msgList.fieldEnumeration();
				while (enu.hasMoreElements()) {
					MessageField field = (MessageField) enu.nextElement();
					String name = field.getTag();
					if ("USUARIO".equals(name) || "FLAGMAS".equals(name)) continue;
					ExcelColStyle style = new ExcelColStyle();
					style.setName(name);
					style.setHidden(false);
					style.setLocked(false);
					fields.add(style);
				}
				OutputStream out = ExcelUtils.getWorkBook(res.getOutputStream(), fields, list, false, ExcelUtils.isXLSXVersion(fileName));
				out.flush();
			}
			
		} finally {
			if (mp != null)	mp.close();
		}
	}


	protected void procSearchCovenant(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

		forward("ECO0160_covenant_search.jsp", req, res);			
	}
	

	protected void procCovenantList(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession session)
			throws ServletException, IOException {
			
			MessageProcessor mp = null;
			try {
				mp = getMessageProcessor("ECO0160", req);

				ECO016001Message msgList = (ECO016001Message) mp.getMessageRecord("ECO016001");
				msgList.setH01USERID(user.getH01USR());
				msgList.setH01PROGRM("ECO0160");
				msgList.setH01TIMSYS(getTimeStamp());
				msgList.setH01SCRCOD("01");
				msgList.setH01OPECOD("0015");
				
				//filtros de primera pantalla
				if (req.getParameter("Type")!=null && !"".equals(req.getParameter("Type").trim())){
					String type = req.getParameter("Type");
					if ("B".equals(type)){//Codigo banco / Sucursal 
						if (req.getParameter("bank")!=null && !"".equals(req.getParameter("bank"))){
							msgList.setE01SELBNK(req.getParameter("bank"));
						}
						if (req.getParameter("branch")!=null && !"".equals(req.getParameter("branch"))){
							msgList.setE01SELBRN(req.getParameter("branch"));
						}							
					}else if ("O".equals(type)){//Código de Oficial
						if (req.getParameter("officer")!=null && !"".equals(req.getParameter("officer").trim())){
							msgList.setE01SELOFC(req.getParameter("officer"));
						}
					}else if ("E".equals(type)){//Custumer number
						if (req.getParameter("customer_number")!=null && !"".equals(req.getParameter("customer_number").trim())){
							msgList.setE01SELECU(req.getParameter("customer_number"));
						}												
					}else if ("P".equals(type)){//Numero de Planilla
						if (req.getParameter("pln_number")!=null && !"".equals(req.getParameter("pln_number").trim())){
							msgList.setE01SELNUM(req.getParameter("pln_number"));
						}						
					}else if ("C".equals(type)){//Codigo convenio
						if (req.getParameter("cod_conv")!=null && !"".equals(req.getParameter("cod_conv").trim())){
							msgList.setE01SELCDE(req.getParameter("cod_conv"));
						}
					}
				}

				//filtros de segunda pantalla
				if (req.getParameter("dddesde")!=null && !"".equals(req.getParameter("dddesde").trim())){
					msgList.setE01SELFID(req.getParameter("dddesde"));
					req.setAttribute("dddesde1", req.getParameter("dddesde"));
				}
				if (req.getParameter("mmdesde")!=null && !"".equals(req.getParameter("mmdesde").trim())){
					msgList.setE01SELFIM(req.getParameter("mmdesde"));
					req.setAttribute("mmdesde1", req.getParameter("mmdesde"));
				}	
				if (req.getParameter("aadesde")!=null && !"".equals(req.getParameter("aadesde").trim())){
					msgList.setE01SELFIY(req.getParameter("aadesde"));
					req.setAttribute("aadesde1", req.getParameter("aadesde"));
				}	
				if (req.getParameter("ddhasta")!=null && !"".equals(req.getParameter("ddhasta").trim())){
					msgList.setE01SELFFD(req.getParameter("ddhasta"));
					req.setAttribute("ddhasta1", req.getParameter("ddhasta"));
				}	
				if (req.getParameter("mmhasta")!=null && !"".equals(req.getParameter("mmhasta").trim())){
					msgList.setE01SELFFM(req.getParameter("mmhasta"));
					req.setAttribute("mmhasta1", req.getParameter("mmhasta"));
				}
				if (req.getParameter("aahasta")!=null && !"".equals(req.getParameter("aahasta").trim())){
					msgList.setE01SELFFY(req.getParameter("aahasta"));
					req.setAttribute("aahasta1", req.getParameter("aahasta"));
				}
				if (req.getParameter("estado_pln")!=null && !"".equals(req.getParameter("estado_pln").trim())){
					msgList.setE01SELSTA(req.getParameter("estado_pln"));
					req.setAttribute("estado_pln1", req.getParameter("estado_pln"));
				}
				
			 	mp.sendMessage(msgList);
			 	
				JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");

				if (mp.hasError(list)) {
					session.setAttribute("error", mp.getError(list));
					forward("ECO0160_covenant_search.jsp", req, res);					
				} else {
					session.setAttribute("cnvList", list);
					forwardOnSuccess("ECO0160_covenant_list.jsp", req, res);
				}	

			} finally {
				if (mp != null)	mp.close();
			}
		}
	

	protected void procCovenantDetails(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res, 
			HttpSession session)
			throws ServletException, IOException {
			
			MessageProcessor mp = null;
			try {
				mp = getMessageProcessor("ECO0160", req);

				ECO016002Message msgList = (ECO016002Message) mp.getMessageRecord("ECO016002");
				
				msgList.setH02USERID(user.getH01USR());
				msgList.setH02PROGRM("ECO0160");
				msgList.setH02TIMSYS(getTimeStamp());
			
				if (req.getParameter("PLDCDE")!=null)
					msgList.setE02PLDCDE(req.getParameter("PLDCDE"));
				
				if (req.getParameter("PLDNUM")!=null)
					msgList.setE02PLDNUM(req.getParameter("PLDNUM"));
				
				if (req.getParameter("PLDRCY")!=null)
					msgList.setE02PLDRCY(req.getParameter("PLDRCY"));
			 	
			 	mp.sendMessage(msgList);
			 	
				JBObjList listDetail = mp.receiveMessageRecordList("H02FLGMAS");

				if (mp.hasError(listDetail)) {
					session.setAttribute("error", mp.getError(listDetail));
					forward("ECO0160_covenant_list.jsp", req, res);					
				} else {
					//search ECO016001
					JBObjList list = (JBObjList)session.getAttribute("cnvList");
					list.initRow();
					while (list.getNextRow()) {
						ECO016001Message convObj = (ECO016001Message) list.getRecord();
						if (convObj.getE01PLHNUM().equals(req.getParameter("PLDNUM")) 
								&& convObj.getE01PLHCDE().equals(req.getParameter("PLDCDE"))
								&& convObj.getE01PLHRCY().equals(req.getParameter("PLDRCY"))){
							req.setAttribute("objHead", convObj);
							break;
						}
					}//EoW
					req.setAttribute("cnvListDetails", listDetail);
					forwardOnSuccess("ECO0160_covenant_list_details.jsp", req, res);
				}	

			} finally {
				if (mp != null)	mp.close();
			}
		}		

 }