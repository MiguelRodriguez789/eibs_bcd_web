package datapro.eibs.approval;

/**
 * Insert the type's description here.
 * Creation date: (1/31/2016 11:28:15 AM)
 * @author: Frank Hernandez
 */
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datapro.eibs.facade.FAImage;

import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.master.SuperServlet;

public class JOApprovalRedirect {
	private HttpServletRequest request;
	private HttpServletResponse response;
	private int appCode;
	private String numberId;
	private String sequence;

	/**
	 * JOApprovalRedirect constructor comment.
	 */
	public JOApprovalRedirect(
		HttpServletRequest req, HttpServletResponse res, String app, String numberId, String sequence) {
		super();
		request = req;
		response = res;
		try {
			appCode = Integer.parseInt(app);			
		} catch (Exception e) {}
		this.numberId = numberId;
		this.sequence = sequence;
	}
	
	public JOApprovalRedirect(
		HttpServletRequest req, HttpServletResponse res, String app, String numberId) {
		super();
		request = req;
		response = res;
		try {
			appCode = Integer.parseInt(app);
		} catch (Exception e) {}
		this.numberId = numberId;
	}
	
	public JOApprovalRedirect(
		HttpServletRequest req, HttpServletResponse res, String numberId) {
		super();
		request = req;
		response = res;
		this.numberId = numberId;
	}
	
	private ESS0030DSMessage getCurrentUser() throws RuntimeException {
		HttpSession session = request.getSession(false);
		ESS0030DSMessage sessionUser = (ESS0030DSMessage) session.getAttribute("currUser");
		return sessionUser;
	}
	
	private void approveDocuments(String type, String number){
		try {
			FAImage fa = new FAImage();
			fa.setSessionUser(getCurrentUser());
			fa.approvePendingDocuments(type, number);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
	private void deleteDocuments(String type, String number){
		try {
			FAImage fa = new FAImage();
			fa.setSessionUser(getCurrentUser());
			fa.deletePendingDocuments(type, number);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
	private void approveDocumentsSignatures(String type, String number, String seq, String rule,
			String idt, String edt){
		try {
			FAImage fa = new FAImage();
			fa.setSessionUser(getCurrentUser());
			fa.approvePendingDocumentsSignatures(type, number, seq, rule, idt, edt);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
	public void action(String type, String action, String path) throws IOException {
		if ("C".equals(type)) {
			customerAction(action, path);
		} else {
			accountAction(action, path);
		}
		
	}
	public void action(String type, String action, String seq, String rule, String path, 
			String idt, String edt) throws IOException {
		if ("A".equals(type)) {
			accountAction(action, seq, rule, path,
					idt, edt);
		}
		
	}
	
	public void customerAction(String action, String path) throws IOException {
		if ("A".equals(action)) {//Approval
			approveDocuments("C", numberId);
		} else if ("D".equals(action)) {//Delete
			deleteDocuments("C", numberId);
		}
		response.sendRedirect(request.getContextPath() + path);
	}
	
	public void accountAction(String action, String path) {

		if ("A".equals(action)) {//Approval
			approveDocuments("A", numberId);
		} else if ("D".equals(action)) {//Delete
			deleteDocuments("A", numberId);
		} 

		try {
			switch (appCode) {
				case 1 : // Retail Accounts
				case 2 :
				case 3 :
				case 5 : //Call Account
					response.sendRedirect(request.getContextPath() + path);
					break;
				case 4 : // Saving Accounts
					response.sendRedirect(request.getContextPath() + path);
					break;
				case 10 : // Loans Accounts
					response.sendRedirect(request.getContextPath() + path);
					break;
				case 11 : // CDs
				case 12 : // Time Deposits
				case 14 : // Aceptaciones Descontadas
				case 15 : // Inversiones 24 horas
				case 95 : // Fondos de Retiro?
					response.sendRedirect(request.getContextPath() + path);
					break;
				case 13: // Inversiones
					response.sendRedirect(request.getContextPath() + path);
					break;
				case 40 : // Letter of Credit
				case 41 : // Bank acceptances
				case 42 : // Future Payments
				case 43 : // Stand By
					response.sendRedirect(request.getContextPath() + path);
					break;	
				case 31: // Spot
				case 32: // Forwards
				case 33: // SWAPS
				case 34: // Options
				case 35: // FRA
					response.sendRedirect(request.getContextPath() + path);
					break;
				case 50: // Cobranza Simple
				case 51: // Cobranza Documentaria
				case 52:
					response.sendRedirect(request.getContextPath() + path);
					break;					
					
				case 90 : // Credit Line
					response.sendRedirect(request.getContextPath() + path);
					break;
					
				case 91 : // None Account Collateral
					response.sendRedirect(request.getContextPath() + path);
					break;
	
				case 94 : //Credit Cards
					response.sendRedirect(request.getContextPath() + path);
					break;
					
					// Trade Tickets
				case 96 : // Fondos de Inversiones
				case 97 : // Fondo Mutuo
				case 98 : // Bonos
				case 99 : // Acciones Preferenciales
					break;
											
				default :
					if (path != null && !path.equals("")) {
						response.sendRedirect(request.getContextPath() + path);
					} else {
						response.sendRedirect(request.getContextPath() + "/pages/s/" + SuperServlet.devPage);
					}
			}
		} catch (Exception ex) {
			System.out.println("Error: " + ex);
		}
	}

	public void accountAction(String action, String seq,String rule, String path, 
			String idt, String edt) {

		if ("S".equals(action)) {//Approval, Only for signatures.
			approveDocumentsSignatures("A", numberId, seq, rule,idt, edt);
		}

		try {
			switch (appCode) {
				case 1 : // Retail Accounts
				case 2 :
				case 3 :
				case 5 : //Call Account
					response.sendRedirect(request.getContextPath() + path);
					break;
				case 4 : // Saving Accounts
					response.sendRedirect(request.getContextPath() + path);
					break;
				case 10 : // Loans Accounts
					response.sendRedirect(request.getContextPath() + path);
					break;
				case 11 : // CDs
				case 12 : // Time Deposits
				case 14 : // Aceptaciones Descontadas
				case 15 : // Inversiones 24 horas
				case 95 : // Fondos de Retiro?
					response.sendRedirect(request.getContextPath() + path);
					break;
				case 13: // Inversiones
					response.sendRedirect(request.getContextPath() + path);
					break;
				case 40 : // Letter of Credit
				case 41 : // Bank acceptances
				case 42 : // Future Payments
				case 43 : // Stand By
					response.sendRedirect(request.getContextPath() + path);
					break;	
				case 31: // Spot
				case 32: // Forwards
				case 33: // SWAPS
				case 34: // Options
				case 35: // FRA
					response.sendRedirect(request.getContextPath() + path);
					break;
				case 50: // Cobranza Simple
				case 51: // Cobranza Documentaria
				case 52:
					response.sendRedirect(request.getContextPath() + path);
					break;					
					
				case 90 : // Credit Line
					response.sendRedirect(request.getContextPath() + path);
					break;
					
				case 91 : // None Account Collateral
					response.sendRedirect(request.getContextPath() + path);
					break;
	
				case 94 : //Credit Cards
					response.sendRedirect(request.getContextPath() + path);
					break;
					
					// Trade Tickets
				case 96 : // Fondos de Inversiones
				case 97 : // Fondo Mutuo
				case 98 : // Bonos
				case 99 : // Acciones Preferenciales
					break;
											
				default :
					if (path != null && !path.equals("")) {
						response.sendRedirect(request.getContextPath() + path);
					} else {
						response.sendRedirect(request.getContextPath() + "/pages/s/" + SuperServlet.devPage);
					}
			}
		} catch (Exception ex) {
			System.out.println("Error: " + ex);
		}
	}

	
}