
package com.datapro.eibs.internet;

import datapro.eibs.beans.*;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.sockets.MessageContext;
import datapro.eibs.sockets.MessageRecord;
import java.io.*;
import java.net.Socket;
import javax.servlet.*;
import javax.servlet.http.*;

import com.jspsmart.upload.SmartUpload;

public class JSESS0035 extends SuperServlet{
	private ServletConfig config = null;
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		this.config = config;
	}
	
    public JSESS0035(){
        LangPath = "S";
    }

    public JSESS0035(int logType){
        super(logType);
        LangPath = "S";
    }
    
	protected String LangPath;
	protected static final int R_LIST = 100;
	protected static final int R_MTTO = 200;
	protected static final int A_MTTO = 300;
	
    public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException  {
        MessageContext mc = null;
        ESS0030DSMessage msgUser = null;
        HttpSession session = null;
        session = req.getSession(false);
        if(session == null){
            try{
                res.setContentType("text/html");
                printLogInAgain(res.getWriter());
            }catch(Exception e){
                e.printStackTrace();
                flexLog("Exception ocurred. Exception = " + e);
            }
        } else {
            int screen = 1;
            try {
                msgUser = (ESS0030DSMessage)session.getAttribute("currUser");
                LangPath = SuperServlet.rootPath + msgUser.getE01LAN() + "/";
                try
                {
                    flexLog("Opennig Socket Connection");
                    mc = new MessageContext(super.getMessageHandler("ESS0035", req));
                    try{
                        screen = Integer.parseInt(req.getParameter("SCREEN"));
                    }catch(Exception e){
                        flexLog("Screen set to default value");
                    }
                    switch(screen){
                    	case R_LIST: 
							GetWordList(mc, msgUser, req, res, session);
                        	break;
                        	
						case R_MTTO: 
							reqMttoWord(mc, msgUser, req, res, session);
							break;
							
						case A_MTTO: 
							String Action  = req.getParameter("ACTION");
							if(Action.trim().equals("U")){
								actUploadFile(mc, msgUser, req, res, session);
							}else{
								actMttoWord(mc, msgUser, req, res, session);	
							}							
							break;			
											                        	
                    default:
                        res.sendRedirect(SuperServlet.srctx + LangPath + SuperServlet.devPage);
                        break;
                    }
                }
                catch(Exception e){
                    e.printStackTrace();
                    flexLog("Socket not Open(" + mc.toString() + "). Error: " + e);
                    res.sendRedirect(SuperServlet.srctx + LangPath + SuperServlet.sckNotOpenPage);
                }finally {
                    mc.close();
                }
            }catch(Exception e){
                flexLog("Error: " + e);
                res.sendRedirect(SuperServlet.srctx + LangPath + SuperServlet.sckNotRespondPage);
            }
        }
    }

	protected void GetWordList(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses) throws ServletException, IOException {
		JBList beanList = null;
		ESS003501Message msg = null;
		MessageRecord newmessage = null;
		ELEERRMessage msgError = null;
		ESS0030DSMessage msgUser = user;
		String IWord =  "";
		try{
			IWord = req.getParameter("IWord");
			if(IWord==null) IWord="";	
		}catch(Exception e){}
		
		try {
			msg = (ESS003501Message) mc.getMessageRecord("ESS003501");
			msg.setH01USERID(msgUser.getH01USR());
			msg.setH01OPECOD("0015");
			msg.setE01PWRWRD(IWord);
			msg.send();
			msg.destroy();
			flexLog("ESSS003501 Message Sent");
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			res.sendRedirect(super.srctx + LangPath + super.sckNotRespondPage);
			return;
		}
		try
		  {
			  newmessage = mc.receiveMessage();
			  if(newmessage.getFormatName().equals("ELEERR"))  {
				  msgError = (ELEERRMessage)newmessage;
				  if(!msgError.getERRNUM().equals("0"))
				  	showERROR(msgError);
			  } else
			  {
				  flexLog("Message " + newmessage.getFormatName() + " received.");
			  }
		  }
		  catch(Exception e)
		  {
			  e.printStackTrace();
			  flexLog("Error: " + e);
			  throw new RuntimeException("Socket Communication Error");
		  }
		// Receiving List
		try {			
			newmessage = mc.receiveMessage();
			if (newmessage.getFormatName().equals("ESS003501")) {
				msg = (ESS003501Message)newmessage;
				beanList = new JBList();
				boolean firstTime = true;
				String marker = "";
				String myFlag = "";
				StringBuffer myRow = null;
				String chk = "";
				marker = msg.getH01FLGMAS();
				int MAX_RECORDS_PER_LINE = 5;
				int NumRec = 0;
				myRow = new StringBuffer("<TR>");
				String LastWord = "";
				while (msg.getE01INDOPE().trim().length()==0) {
					if(NumRec >= MAX_RECORDS_PER_LINE){
						myRow.append("<tr>");
						beanList.addRow(myFlag, myRow.toString());
						myRow = new StringBuffer("<TR>");
						NumRec = 0;
					}
					NumRec++;
					myRow.append("<td width=2%><input type=\"radio\" name=\"PWORD\" checked value=\"" + msg.getE01PWRWRD() + "\"></td>");
					myRow.append("<td nowrap>" + msg.getE01PWRWRD() + "</td>");
					LastWord = msg.getE01PWRWRD();
					if (msg.getE01INDOPE().equals("+")) {
						beanList.setShowNext(true);
					}
					newmessage = mc.receiveMessage();
					msg = (ESS003501Message)newmessage;
				}
				if(NumRec>0){
					myRow.append("<tr>");
					beanList.addRow(myFlag, myRow.toString());					
				}
				ses.setAttribute("ESS0035LastWord", LastWord);
				ses.setAttribute("ESS0035List", beanList);
				try {
					flexLog("About to call Page: "	+ LangPath	+ "ESS0035_reserved_word_list.jsp");
					callPage(LangPath + "ESS0035_reserved_word_list.jsp", req, res);
				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			res.sendRedirect(super.srctx + LangPath + super.sckNotRespondPage);
		}
			
	}

	protected void reqMttoWord(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses) throws ServletException, IOException {
		String Opt  = req.getParameter("ACTION");
		String Word = req.getParameter("PWORD");
		if(Opt.trim().equals("A")) Word = "";
		ses.setAttribute("ESS0035MttoWord",Word);
		ses.setAttribute("ESS0035Action",Opt);		
		callPage(LangPath + "ESS0035_reserved_word_mtto.jsp", req, res);
	}

	protected void actMttoWord(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses) throws ServletException, IOException {
		ESS003501Message msg = null;
		MessageRecord newmessage = null;
		ELEERRMessage msgError = null;
		
		boolean error = false;
		ESS0030DSMessage msgUser = (datapro.eibs.beans.ESS0030DSMessage) ses.getAttribute("currUser");

		String Action  = req.getParameter("ACTION");
		String Word = req.getParameter("RWORD");
		String OpCode = Action.trim().equals("D")?"0004":"0005";			
		try {
			msg = (ESS003501Message) mc.getMessageRecord("ESS003501");
			msg.setH01USERID(msgUser.getH01USR());
			msg.setH01OPECOD(OpCode);
			msg.setE01PWRWRD(Word);
			msg.send();
			msg.destroy();
			flexLog("ESSS003501 Message Sent");
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			res.sendRedirect(super.srctx + LangPath + super.sckNotRespondPage);
			return;
		}
		try {
			newmessage = mc.receiveMessage();
			if(newmessage.getFormatName().equals("ELEERR"))  {
			  msgError = (ELEERRMessage)newmessage;
			  if(!msgError.getERRNUM().equals("0")){
				error = true;
				showERROR(msgError);			  	
			  }
		  }else{
			  flexLog("Message " + newmessage.getFormatName() + " received.");
		  }
		}catch(Exception e){
		  e.printStackTrace();
		  flexLog("Error: " + e);
		  throw new RuntimeException("Socket Communication Error");
		}
		
		ses.setAttribute("error",msgError);
		if(error){
			callPage(LangPath + "ESS0035_reserved_word_mtto.jsp", req, res);	
		}else{
			res.sendRedirect(SuperServlet.srctx + "/servlet/com.datapro.eibs.internet.JSESS0035?SCREEN=100");	
		}
	}
	
	protected void actUploadFile(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses) throws ServletException, IOException {
		ESS003501Message msg = null;
		MessageRecord newmessage = null;
		ELEERRMessage msgError = null;
		SmartUpload mySmartUpload = new SmartUpload();
		ESS0030DSMessage msgUser = (datapro.eibs.beans.ESS0030DSMessage) ses.getAttribute("currUser");
		String FileName = "";
		String filest = "";
		String fileStr = "";
		
		String Action  = req.getParameter("ACTION");
		String Opt = req.getParameter("OPT");		
		if(Opt.trim().equals("R")){
			try {
				msg = (ESS003501Message) mc.getMessageRecord("ESS003501");
				msg.setH01USERID(msgUser.getH01USR());
				msg.setH01OPECOD("0888");
				msg.setE01PWRWRD("");
				msg.send();
				msg.destroy();
				flexLog("ESSS003501 Message Sent");
			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e);
				res.sendRedirect(super.srctx + LangPath + super.sckNotRespondPage);
				return;
			}
		}
		try {
			mySmartUpload.initialize(config, req, res);
			mySmartUpload.upload();
			com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(0);
			FileName = myFile.getFileName();
			byte[] bd = new byte[myFile.getSize()];
			for (int i = 0; i < myFile.getSize(); i++) {
				bd[i] = myFile.getBinaryData(i);
			}
			filest = new String(bd);
			fileStr = new String(bd);
			int oldpos=0;
			while(true){
				int poslf = fileStr.indexOf(13,oldpos); // line feed
				int posrt = fileStr.indexOf(10,oldpos); // carier return
				if(posrt == filest.length() || (poslf==-1 && posrt==-1)){
					 break;			
				}
				if(posrt>poslf) poslf=posrt;
				String Rline = fileStr.substring(oldpos,poslf);
				oldpos = posrt+1;
				uploadWord(mc, msgUser, req, res, ses, Rline);
			}
			if(oldpos<fileStr.length()){
				String Rline = fileStr.substring(oldpos);
				uploadWord(mc, msgUser, req, res, ses, Rline);
			}
		}catch(Exception Up){
			flexLog("Error Uploading Reserved Word File");
		}
										
		res.sendRedirect(SuperServlet.srctx + "/servlet/com.datapro.eibs.internet.JSESS0035?SCREEN=100");
	}
	
	protected void uploadWord(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses, String Word) throws ServletException, IOException {
		ESS003501Message msg = null;
		MessageRecord newmessage = null;
		ELEERRMessage msgError = null;

		try {
			msg = (ESS003501Message) mc.getMessageRecord("ESS003501");
			msg.setH01USERID(user.getH01USR());
			msg.setH01OPECOD("0005");
			msg.setE01PWRWRD(Word.trim().length()>10?Word.substring(0,10):Word);
			msg.send();
			msg.destroy();
			flexLog("ESSS003501 Message Sent");
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			res.sendRedirect(super.srctx + LangPath + super.sckNotRespondPage);
			return;
		}
		try {
			//Receive Error
			newmessage = mc.receiveMessage();
			if(newmessage.getFormatName().equals("ELEERR"))  {
			  msgError = (ELEERRMessage)newmessage;
			  if(!msgError.getERRNUM().equals("0")){
				showERROR(msgError);			  	
			  }
			 //Receive Data 
			 newmessage = mc.receiveMessage();  
		  }else{
			  flexLog("Message " + newmessage.getFormatName() + " received.");
		  }
		}catch(Exception e){
		  e.printStackTrace();
		  flexLog("Error: " + e);
		  throw new RuntimeException("Socket Communication Error");
		}						
	}
	
    protected void showERROR(ELEERRMessage m){
        if(SuperServlet.logType != 0) {
            flexLog("ERROR received.");
            flexLog("ERROR number:" + m.getERRNUM());
            flexLog("ERR001 = " + m.getERNU01() + " desc: " + m.getERDS01() + " code : " + m.getERDF01());
            flexLog("ERR002 = " + m.getERNU02() + " desc: " + m.getERDS02() + " code : " + m.getERDF02());
            flexLog("ERR003 = " + m.getERNU03() + " desc: " + m.getERDS03() + " code : " + m.getERDF03());
            flexLog("ERR004 = " + m.getERNU04() + " desc: " + m.getERDS04() + " code : " + m.getERDF04());
            flexLog("ERR005 = " + m.getERNU05() + " desc: " + m.getERDS05() + " code : " + m.getERDF05());
            flexLog("ERR006 = " + m.getERNU06() + " desc: " + m.getERDS06() + " code : " + m.getERDF06());
            flexLog("ERR007 = " + m.getERNU07() + " desc: " + m.getERDS07() + " code : " + m.getERDF07());
            flexLog("ERR008 = " + m.getERNU08() + " desc: " + m.getERDS08() + " code : " + m.getERDF08());
            flexLog("ERR009 = " + m.getERNU09() + " desc: " + m.getERDS09() + " code : " + m.getERDF09());
            flexLog("ERR010 = " + m.getERNU10() + " desc: " + m.getERDS10() + " code : " + m.getERDF10());
        }
    }
}
