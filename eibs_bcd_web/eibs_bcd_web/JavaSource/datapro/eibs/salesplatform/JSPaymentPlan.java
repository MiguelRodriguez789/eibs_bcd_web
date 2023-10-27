package datapro.eibs.salesplatform;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.MessageRecord;
import datapro.eibs.tools.BufferedHttpResponseWrapper;

@SuppressWarnings("serial")
public class JSPaymentPlan extends JSEIBSServlet {

	@Override
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		BufferedHttpResponseWrapper wrapper =new BufferedHttpResponseWrapper(res);		
		MessageRecord mr = null;
		
		String messageName = Util.getReqParameter("messageName", req); 
		String planFlag = Util.getReqParameter("planFlag", req); 
		LoanPayPlanBean payBean = session.getAttribute("paybean") == null ? new LoanPayPlanBean() :(LoanPayPlanBean) session.getAttribute("paybean");
		
		if(!messageName.equals("")){		
			mr = (MessageRecord) session.getAttribute(messageName);
			payBean.populate(mr);
		}

		payBean.setE01FLGFPG(planFlag);
		payBean.setTitle();
		payBean.setuserEnabled(isEnabled(mr)) ;
		
		session.setAttribute("paybean", payBean);
			
		ServletContext context = req.getSession().getServletContext();
		String templatePage = "LoanPaymentPlan.jsp";
		String url = res.encodeRedirectURL(getLangPath(user) + templatePage);
		RequestDispatcher dispatcher = context.getRequestDispatcher(url.toString()); 
	
		/* must use include. With forward the reqDispatcher seems to hold an internal state
		which prevents to do a forward after this to return to the webclient */
		dispatcher.include(req, wrapper);
	
		/* ... add other stuff like returning something to the webclient ... */
		StringBuffer buffer = new StringBuffer(); 
		buffer.append("<?xml version=\"1.0\" encoding=\"ISO-8859-1\" ?>");
		buffer.append(wrapper.getOutput());
			
		sendXMLResponse(res, buffer.toString());		
			
	}
	

	private boolean isEnabled(MessageRecord mr) {
		boolean bool = false;
		
		//Loan Simulation Module
		if(mr instanceof EPV090001Message){
			bool = !"".equals(mr.getField("E01DEAPRO").getString()) ? false : true;
			
		} else if(mr instanceof EPV015001Message){
		//NEW.MAINT LOANS
			bool = false;
			
		} else if(mr instanceof EDL091001Message){
		//RENEWAL LOANS
			bool = true;
			
		} else if(mr instanceof EDL016002Message){
		//LOAN INQUIRY LOANS
			bool = false;
		}
		return bool;

	}
}
