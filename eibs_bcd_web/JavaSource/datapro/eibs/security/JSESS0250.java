package datapro.eibs.security;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Enumeration;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import datapro.eibs.beans.ECO016004Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.ESS025001Message;
import datapro.eibs.beans.ESS025002Message;
import datapro.eibs.beans.ESS025003Message;
import datapro.eibs.beans.ESS025004Message;
import datapro.eibs.beans.ExcelColStyle;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSProp;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.services.ExcelUtils;
import datapro.eibs.sockets.MessageField;

public class JSESS0250 extends JSEIBSServlet {

	protected static final int R_ENTER 			= 100;
	protected static final int R_LIST 			= 200;
	protected static final int R_LIST_DETAIL	= 300;
	protected static final int R_EXCEL      	= 400;
	
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {

		switch (screen) {
			case R_ENTER :
				 procReqEnter(user, req, res, session);							
				 break;
			case R_LIST :
				procReqList(user, req, res, session);
				break;
			case R_LIST_DETAIL :
				procReqListDetail(user, req, res, session);
				break;
			case R_EXCEL :
				generateExcel(user, req, res, session);
				break;
			default :
				forward(devPage, req, res);
				break;
		}
	}

	private void procReqEnter(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		forward("ESS0250_base_datos_search.jsp", req, res);
	}

	private void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			//Set userPO for Page Next and Page Back Features
			userPO.setCusNum(Util.getReqParameter("E01SELCUN", req , userPO.getCusNum()) );			
			userPO.setApplicationCode(Util.getReqParameter("E01SELACD", req , userPO.getApplicationCode()) );			
			userPO.setAccNum( Util.getReqParameter("E01SELACC", req , userPO.getAccNum()) );			
			userPO.setHeader1( Util.getReqParameter("E01SELMOD", req , userPO.getHeader1()) ); 
			userPO.setHeader2( Util.getReqParameter("E01SELIPA", req , userPO.getHeader2()) ); 
			userPO.setHeader3( Util.getReqParameter("E01SELUSR", req , userPO.getHeader3()) ); 
			userPO.setHeader4( Util.getReqParameter("E01SELUSA", req , userPO.getHeader4()) ); 
			userPO.setHeader5( Util.getReqParameter("E01TODTEY", req , userPO.getHeader5()) ); 
			userPO.setHeader6( Util.getReqParameter("E01TODTED", req , userPO.getHeader6()) ); 
			userPO.setHeader7( Util.getReqParameter("E01TODTEM", req , userPO.getHeader7()) ); 
			userPO.setHeader8( Util.getReqParameter("E01FRDTEY", req , userPO.getHeader8()) ); 
			userPO.setHeader9( Util.getReqParameter("E01FRDTED", req , userPO.getHeader9()) ); 
			userPO.setHeader10( Util.getReqParameter("E01FRDTEM", req , userPO.getHeader10()) ); 
			userPO.setHeader11( Util.getReqParameter("E01SELFIL", req , userPO.getHeader11()) ); 
			
			
			mp = getMessageProcessor("ESS0250", req);
			ESS025001Message msgHeader = (ESS025001Message) mp.getMessageRecord("ESS025001");
			msgHeader.setH01USERID(user.getH01USR());
			msgHeader.setH01PROGRM("ESS0250");
			msgHeader.setH01TIMSYS(getTimeStamp());
			msgHeader.setH01SCRCOD("01");

			msgHeader.setE01SELCUN( userPO.getCusNum());            //Customer Number
			msgHeader.setE01SELACD( userPO.getApplicationCode());   //ACD
			msgHeader.setE01SELACC( userPO.getAccNum());            //Account Number
			msgHeader.setE01SELMOD( userPO.getHeader1());           //SELMOD
			msgHeader.setE01SELIPA( userPO.getHeader2());			//SELIPA
			msgHeader.setE01SELUSR( userPO.getHeader3());           //SELUSR
			msgHeader.setE01SELUSA( userPO.getHeader4());			//SELUSA
			msgHeader.setE01TODTEY( userPO.getHeader5());			//To Year
			msgHeader.setE01TODTED( userPO.getHeader6());			//To Day
			msgHeader.setE01TODTEM( userPO.getHeader7());			//To Month
			msgHeader.setE01FRDTEY( userPO.getHeader8());			//From Year
			msgHeader.setE01FRDTED( userPO.getHeader9());			//From Day
			msgHeader.setE01FRDTEM( userPO.getHeader10());			//From Month
			msgHeader.setE01SELFIL( userPO.getHeader11());			//SelFil
			msgHeader.setE01NUMREC( Util.getReqParameter("POS", req, "0") );

			mp.sendMessage(msgHeader);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();

			msgHeader = (ESS025001Message) mp.receiveMessageRecord();

			if (mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				forward("ESS0250_base_datos_search.jsp", req, res);
			} else {
				JBObjList list = mp.receiveMessageRecordList("H02FLGMAS","E02NUMREC");

				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				session.setAttribute("list", list);
				session.setAttribute("header", msgHeader);
				forward("ESS0250_base_datos_list.jsp", req, res);
			}
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqListDetail(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESS025003", req);
			ESS025003Message msgList = (ESS025003Message) mp.getMessageRecord("ESS025003");
			msgList.setH03USERID(user.getH01USR());
			msgList.setH03PROGRM("ESS0240");
			msgList.setH03TIMSYS(getTimeStamp());
			msgList.setH03SCRCOD("01");				
			msgList.setE03NUMREF(req.getParameter("ACCREF"));

			mp.sendMessage(msgList);
			
			ESS025002Message msgHeader = (ESS025002Message) mp.getMessageRecord("ESS025002");
			msgHeader = (ESS025002Message) mp.receiveMessageRecord();

			ELEERRMessage msgError = new ELEERRMessage();
			JBObjList list = mp.receiveMessageRecordList("H03FLGMAS");

			if (mp.hasError(list)) {
				msgError = (ELEERRMessage) mp.getError(list);
				forward(devPage, req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("header", msgHeader);
				session.setAttribute("dList", list);
				session.setAttribute("error", msgError);
				forward("ESS0250_base_datos_detail_list.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void generateExcel(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESS0250", req);
			ESS025001Message msgHeader = (ESS025001Message) mp.getMessageRecord("ESS025001");
			msgHeader.setH01USERID(user.getH01USR());
			msgHeader.setH01PROGRM("ESS0250");
			msgHeader.setH01TIMSYS(getTimeStamp());
			msgHeader.setH01SCRCOD("01");
			msgHeader.setH01FLGWK1("E");
			try {
				msgHeader.setE01SELCUN(req.getParameter("E01SELCUN"));
			} catch (Exception e) {
				msgHeader.setE01SELCUN("");
			}
			try {
				msgHeader.setE01SELACD(req.getParameter("E01SELACD"));
			} catch (Exception e) {
				msgHeader.setE01SELACD("");
			}
			try {
				msgHeader.setE01SELMOD(req.getParameter("E01SELMOD"));
			} catch (Exception e) {
				msgHeader.setE01SELMOD("");
			} 
			try {
				msgHeader.setE01SELIPA(req.getParameter("E01SELIPA"));
			} catch (Exception e) {
				msgHeader.setE01SELIPA("");
			}
			try {
				msgHeader.setE01SELUSR(req.getParameter("E01SELUSR"));
			} catch (Exception e) {
				msgHeader.setE01SELUSR("");
			}
			try {
				msgHeader.setE01SELUSA(req.getParameter("E01SELUSA"));
			} catch (Exception e) {
				msgHeader.setE01SELUSA("");
			}
			try {
				msgHeader.setE01TODTEY(req.getParameter("E01TODTEY"));
			} catch (Exception e) {
				msgHeader.setE01TODTEY("");
			}
			try {
				msgHeader.setE01TODTED(req.getParameter("E01TODTED"));
			} catch (Exception e) {
				msgHeader.setE01TODTED("");
			}
			try {
				msgHeader.setE01TODTEM(req.getParameter("E01TODTEM"));
			} catch (Exception e) {
				msgHeader.setE01TODTEM("");
			}
			try {
				msgHeader.setE01FRDTEY(req.getParameter("E01FRDTEY"));
			} catch (Exception e) {
				msgHeader.setE01FRDTEY("");
			}
			try {
				msgHeader.setE01FRDTED(req.getParameter("E01FRDTED"));
			} catch (Exception e) {
				msgHeader.setE01FRDTED("");
			}
			try {
				msgHeader.setE01FRDTEM(req.getParameter("E01FRDTEM"));
			} catch (Exception e) {
				msgHeader.setE01FRDTEM("");
			}
			try {
				msgHeader.setE01SELACC(req.getParameter("E01SELACC"));
			} catch (Exception e) {
				msgHeader.setE01SELACC("");
			}
			try {
				msgHeader.setE01SELFIL(req.getParameter("E01SELFIL"));
			} catch (Exception e) {
				msgHeader.setE01SELFIL("");
			}

			setMessageRecord(req, msgHeader);

			mp.sendMessage(msgHeader);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgHeader = (ESS025001Message) mp.receiveMessageRecord("ESS025001");

			if (mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				forward("ESS0250_base_datos_search.jsp", req, res);
			} else {
				JBObjList list = mp.receiveMessageRecordList("FLAGMAS");

				String fileName = "Base de Datos." + JSEIBSProp.getExcelFormat();
				String excelName = "attachment; filename=\"" + fileName + "\"";
				res.setContentType("application/vnd.ms-excel");			
				res.setHeader("Content-disposition", excelName);
				
				Vector fields = new Vector();
				ESS025004Message msg = new ESS025004Message();
				msg.setUSUARIO(user.getH01USR());

				Enumeration enu = msg.fieldEnumeration();
				while (enu.hasMoreElements()) {
					MessageField field = (MessageField) enu.nextElement();
					String name = field.getTag();
					if ("USUARIO".equals(name) || "FLAGMAS".equals(name)){
						continue;
					}
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
			if (mp != null)
				mp.close();
		}
	}

}
