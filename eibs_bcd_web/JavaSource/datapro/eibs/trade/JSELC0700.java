package datapro.eibs.trade;

/**
 * Insert the type's description here.
 * Creation date: (4/23/14 15:30:26 PM)
 * @author: Gustavo Adolfo Villarroel
 */
import java.io.IOException;
import java.io.OutputStream;
import java.util.Enumeration;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELC070001Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.ExcelColStyle;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.JBSortList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.services.ExcelUtils;
import datapro.eibs.sockets.MessageField;
import datapro.eibs.sockets.MessageRecord;

public class JSELC0700 extends JSEIBSServlet {

    protected static final int R_LIST = 100;
    protected static final int A_LIST = 200;
    protected static final int A_SORT = 201;
    protected static final int A_SORT_DATETIME = 202;
    protected static final int R_EXCEL = 300;

    protected String LangPath = "S";

    @Override
    protected void processRequest(ESS0030DSMessage user,
            HttpServletRequest req, HttpServletResponse res,
            HttpSession session, int screen) throws ServletException,
            IOException {
        switch (screen) {
            case R_LIST:
                procReqList(user, req, res, session, screen);
                break;
            case A_LIST:
                procActionList(user, req, res, session, screen);
                break;
            case A_SORT:
                procActionSort(req, res, session);
                break;
            case A_SORT_DATETIME:
                procActionSortDateTime(req, res, session);
                break;
            case R_EXCEL:
            	procReqGenerateExcel(user, req, res, session, screen);
            	break;
        }
    }

    /**
     * GVillarroel
     */
    protected void procReqList(ESS0030DSMessage user,
        HttpServletRequest req, HttpServletResponse res,
        HttpSession session, int screen) throws ServletException,
        IOException {

        String PageToCall = "";

        MessageProcessor mp = null;

        try {
            mp = getMessageProcessor("ELC0700", req);

            ELC070001Message msgList = (ELC070001Message) mp.getMessageRecord(
                    "ELC070001", user.getH01USR(), "0015");
            msgList.setH01OPECOD("0015");
            msgList.setH01USERID(user.getH01USR());
            //setMessageRecord(req, msgList);

            mp.sendMessage(msgList);

            //ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
            JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");

            if (mp.hasError(list)) {
                session.setAttribute("error", mp.getError(list));
                PageToCall = "error_viewer.jsp";
            } else {
				JBSortList lista = new JBSortList();
				//String priNum = req.getParameter("E01LCMACC");
				//boolean firstTime = (priNum == null);
				//int indexRow = 0;
				lista.setDisplaySize(0);
				list.initRow();
				while (list.getNextRow()) {
					msgList = (ELC070001Message) list.getRecord();
					lista.add(msgList);
				}
				if (lista.getSize() == 0) {
					PageToCall = "MISC_no_result.jsp";
				} else {
					PageToCall = "ELC0700_comex_inquiry_list.jsp";
					lista.setDisplaySize(lista.getSize());
					session.setAttribute("lista", lista);
				}
				session.setAttribute("userPO", new UserPos());
            }
            
            forward(PageToCall, req, res);

        } finally {
            if (mp != null) {
                mp.close();
            }
        }
    }

	/**
	 * GVillarroel
	 */
	protected void procActionList(ESS0030DSMessage user,
	    HttpServletRequest req, HttpServletResponse res,
	    HttpSession session, int screen) throws ServletException,
	    IOException {
	
	    UserPos userPO = getUserPos(req);
	
	    MessageProcessor mp = null;
	    String PageToCall = "";
	
	    try {
	        mp = getMessageProcessor("ELC0700", req);
	
	        ELC070001Message msgList = (ELC070001Message) mp.getMessageRecord("ELC070001", user.getH01USR(), "0015");
	        msgList.setH01OPECOD("0015");
	        msgList.setH01USERID(user.getH01USR());
	        setMessageRecord(req, msgList);
	        
	        userPO.setAccNum(msgList.getE01SCHACC());
	        userPO.setHeader1(msgList.getE01SCHORI());
	        userPO.setIdentifier(msgList.getE01SCHIDN());
	        userPO.setCusNum(msgList.getE01SCHCUN());
	        userPO.setProdCode(msgList.getE01SCHATY());
	        userPO.setHeader2(msgList.getE01SCHTTP());
	        userPO.setCurrency(msgList.getE01SCHCCY());
	        userPO.setHeader3(msgList.getE01SCHSTS());
	        userPO.setHeader4(msgList.getE01SCHAMF());
	        userPO.setHeader5(msgList.getE01SCHAMT());
	        userPO.setHeader6(msgList.getE01SCHOFI());
	        userPO.setHeader7(msgList.getE01SCHOF2());
	        userPO.setHeader8(msgList.getE01SCHOPR());
	        userPO.setHeader9(msgList.getE01SCHSUP());
	
	        mp.sendMessage(msgList);
	
	        //ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
	        JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");
	
	        if (mp.hasError(list)) {
	            session.setAttribute("error", mp.getError(list));
                PageToCall = "error_viewer.jsp";
	        } else {
				JBSortList lista = new JBSortList();
				//String priNum = req.getParameter("E01LCMACC");
				//boolean firstTime = (priNum == null);
				//int indexRow = 0;
				//lista.setDisplaySize(25);
				list.initRow();
				while (list.getNextRow()) {
					msgList = (ELC070001Message) list.getRecord();
					lista.add(msgList);
				}
				if (lista.getSize() == 0) {
					PageToCall = "MISC_no_result.jsp";
				} else {
					PageToCall = "ELC0700_comex_inquiry_list.jsp";
					lista.setDisplaySize(lista.getSize());
					session.setAttribute("lista", lista);
				}
	        }
            forward(PageToCall, req, res);
	
	    } finally {
	        if (mp != null) {
	            mp.close();
	        }
	    }
	}

	/**
	 * @param req
	 * @param res
	 */
	protected void procActionSort(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
	    UserPos userPO = getUserPos(req);
		JBSortList lista = (JBSortList) session.getAttribute("lista");

		String fieldName = (req.getParameter("FIELD") == null) ? "" : req.getParameter("FIELD");
		if (!fieldName.equals("")) {
			String[] sortFlds = { "" };
			sortFlds[0] = fieldName;
			lista.setSortKey(sortFlds);
			int orden = lista.getSortOrder();
			if (orden == JBSortList.ASCENDENTE) {
				lista.setSortOrder(JBSortList.DESCENDENTE);
			} else {
				lista.setSortOrder(JBSortList.ASCENDENTE);
			}
			lista.sort();
		}
		session.setAttribute("lista", lista); 
		forward("ELC0700_comex_inquiry_list.jsp", req, res);
	}

	/**
	 * @param req
	 * @param res
	 */
	protected void procActionSortDateTime(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
	    UserPos userPO = getUserPos(req);
		JBSortList lista = (JBSortList) session.getAttribute("lista");

		String day = (req.getParameter("DAY") == null) ? "" : req.getParameter("DAY");
		String month = (req.getParameter("MONTH") == null) ? "" : req.getParameter("MONTH");
		String year = (req.getParameter("YEAR") == null) ? "" : req.getParameter("YEAR");
		if (!day.equals("")) {
			String[] sortFlds = { "" };
			sortFlds[0] = day;
			sortFlds[1] = month;
			sortFlds[2] = year;
			lista.setDateKey(sortFlds[0], sortFlds[1], sortFlds[2]);
			int orden = lista.getSortOrder();
			if (orden == JBSortList.ASCENDENTE) {
				lista.setSortOrder(JBSortList.DESCENDENTE);
			} else {
				lista.setSortOrder(JBSortList.ASCENDENTE);
			}
			lista.sort();
		}
		session.setAttribute("lista", lista); 
		forward("ELC0700_comex_inquiry_list.jsp", req, res);
	}

	/**
	 * GVillarroel
	 */
	protected void procReqGenerateExcel(ESS0030DSMessage user,
	    HttpServletRequest req, HttpServletResponse res,
	    HttpSession session, int screen) throws ServletException,
	    IOException {
	
	    UserPos userPO = getUserPos(req);
	    		
	    JBSortList lista = (JBSortList) session.getAttribute("lista");
	    
	    if (lista != null && lista.getSize() > 0) {
		    JBObjList list = new JBObjList();
	    	for (int indexRow = lista.getBaseIdx(); indexRow < lista.getSize() && indexRow < lista.getBaseIdx() + lista.getDisplaySize(); indexRow++) {
	    		ELC070001Message msg = (ELC070001Message) lista.getData(indexRow);
	    		list.add(msg);
			}
	    	
			Vector fields = new Vector();
			Enumeration enu = ((MessageRecord)list.get(0)).fieldEnumeration();
			while (enu.hasMoreElements()) {
				MessageField field = (MessageField) enu.nextElement();
				String name = field.getTag();
				//flexLog(name);
				if ("USUARIO".equals(name) || "FLAGMAS".equals(name)) continue;
				
				if (name.equals("E01APPOPR")) {
					ExcelColStyle style = new ExcelColStyle();
					style.setTag(name);
					style.setHidden(false);
					style.setLocked(false);
					style.setName("OPERADOR");
					fields.add(style);
				} else if (name.equals("E01APPACC")) {
					ExcelColStyle style = new ExcelColStyle();
					style.setTag(name);
					style.setHidden(false);
					style.setLocked(false);
					style.setName("OPERACION IBS");
					fields.add(style);
				} else if (name.equals("E01APPRFN")) {
					ExcelColStyle style = new ExcelColStyle();
					style.setTag(name);
					style.setHidden(false);
					style.setLocked(false);
					style.setName("OPERACION CANAL");
					fields.add(style);
				} else if (name.equals("E01DSCORI")) {
					ExcelColStyle style = new ExcelColStyle();
					style.setTag(name);
					style.setHidden(false);
					style.setLocked(false);
					style.setName("CANAL DE ORIGEN");
					fields.add(style);
				} else if (name.equals("E01CUSIDN")) {
					ExcelColStyle style = new ExcelColStyle();
					style.setTag(name);
					style.setHidden(false);
					style.setLocked(false);
					style.setName("RUT");
					fields.add(style);
				} else if (name.equals("E01CUSNME")) {
					ExcelColStyle style = new ExcelColStyle();
					style.setTag(name);
					style.setHidden(false);
					style.setLocked(false);
					style.setName("CLIENTE");
					fields.add(style);
				} else if (name.equals("E01DSCPRO")) {
					ExcelColStyle style = new ExcelColStyle();
					style.setTag(name);
					style.setHidden(false);
					style.setLocked(false);
					style.setName("PRODUCTO");
					fields.add(style);
				} else if (name.equals("E01DSCTTP")) {
					ExcelColStyle style = new ExcelColStyle();
					style.setTag(name);
					style.setHidden(false);
					style.setLocked(false);
					style.setName("EVENTO");
					fields.add(style);
				} else if (name.equals("E01APPCCY")) {
					ExcelColStyle style = new ExcelColStyle();
					style.setTag(name);
					style.setHidden(false);
					style.setLocked(false);
					style.setName("MONEDA");
					fields.add(style);
				} else if (name.equals("E01APPAMN")) {
					ExcelColStyle style = new ExcelColStyle();
					style.setTag(name);
					style.setHidden(false);
					style.setLocked(false);
					style.setName("MONTO");
					style.setFormat("\"$\"#,##0_);(\"$\"#,##0)");
					fields.add(style);
				} else if (name.equals("E01APPOFI")) {
					ExcelColStyle style = new ExcelColStyle();
					style.setTag(name);
					style.setHidden(false);
					style.setLocked(false);
					style.setName("EJECUTIVO COMERCIAL");
					fields.add(style);
				} else if (name.equals("E01APPOF2")) {
					ExcelColStyle style = new ExcelColStyle();
					style.setTag(name);
					style.setHidden(false);
					style.setLocked(false);
					style.setName("EJECUTIVO COMEX");
					fields.add(style);
				} else if (name.equals("E01STATUS")) {
					ExcelColStyle style = new ExcelColStyle();
					style.setTag(name);
					style.setHidden(false);
					style.setLocked(false);
					style.setName("ESTADO");
					fields.add(style);
				} else if (name.equals("E01APPTDT")) {
					ExcelColStyle style = new ExcelColStyle();
					style.setTag(name);
					style.setHidden(false);
					style.setLocked(false);
					style.setName("FECHA INGRESO");
					fields.add(style);
				} else if (name.equals("E01APPTTA")) {
					ExcelColStyle style = new ExcelColStyle();
					style.setTag(name);
					style.setHidden(false);
					style.setLocked(false);
					style.setName("HORA INGRESO");
					fields.add(style);
				} else if (name.equals("E01APPADT")) {
					ExcelColStyle style = new ExcelColStyle();
					style.setTag(name);
					style.setHidden(false);
					style.setLocked(false);
					style.setName("FECHA APROBACION");
					fields.add(style);
				} else if (name.equals("E01APPATA")) {
					ExcelColStyle style = new ExcelColStyle();
					style.setTag(name);
					style.setHidden(false);
					style.setLocked(false);
					style.setName("HORA APROBACION");
					fields.add(style);
				} else if (name.equals("E01APPSUP")) {
					ExcelColStyle style = new ExcelColStyle();
					style.setTag(name);
					style.setHidden(false);
					style.setLocked(false);
					style.setName("SUPERVISOR");
					fields.add(style);
				}
			}
			String fileName = user.getH01USR() + "_" + getTimeStamp() + ".xls";
			String excelName = "attachment; filename=\"" + fileName + "\"";
			res.setContentType("application/vnd.ms-excel");			
			res.setHeader("Content-disposition", excelName);
			OutputStream out = ExcelUtils.getWorkBook(res.getOutputStream(), fields, list, false);
			out.flush();
		}	
	}	
}