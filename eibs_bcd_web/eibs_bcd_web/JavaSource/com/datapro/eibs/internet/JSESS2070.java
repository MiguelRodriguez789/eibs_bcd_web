package com.datapro.eibs.internet;

import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.io.IOException;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datapro.eibs.internet.beans.JBCards;
import com.datapro.eibs.internet.databeans.DC_CARDS;
import com.datapro.eibs.internet.generics.Util;
import com.datapro.exception.ServiceLocatorException;
import com.datapro.generic.beanutil.BeanList;
import com.datapro.security.SHA1;
import com.datapro.services.ServiceLocator;

import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.master.JSEIBSServlet;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 * Comercial Letter Of Credit Maintenance
 */
public class JSESS2070 extends JSEIBSServlet {

	protected static final int R_GEN_CARDS = 1;
	protected static final int A_GEN_CARDS = 11;
	protected static final int R_INQ_CARDS = 2;
	protected static final int A_INQ_CARDS = 21;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			case R_GEN_CARDS :
				forward("ESS2070_cards_generate_number.jsp", req, res);
				break;
			case A_GEN_CARDS :
				procGenerate_Cards(user, req, res, session);
				break;							
			case R_INQ_CARDS :
				reqInquiry_Cards(user, req, res, session);
				break;
			case A_INQ_CARDS :
				actInquiry_Cards(user, req, res, session);
				break;
			default :
				forward(devPage, req, res);
				break;
		}
	}

	private void actInquiry_Cards(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String ENTITYID = req.getParameter("ENTITYID") == null ? "" : req.getParameter("ENTITYID").toUpperCase();
		JBCards cardbean = new JBCards();
		BeanList lsCardsInq = cardbean.getListCardsforEntity(ENTITYID);		
		
		session.setAttribute("lsCardsInq", lsCardsInq);
		session.setAttribute("ENTITYID", ENTITYID);
		
		forward("ESS2070_cards_inq_entity_asigned.jsp", req, res);
	}

	private void reqInquiry_Cards(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		forward("ESS2070_cards_inq_entity_list.jsp", req, res);
	}

	private void procGenerate_Cards(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		Connection cnx = null;
		try {
			cnx = ServiceLocator.getInstance().getDBConn("MSS");
		
			int nCards;
			try {
				nCards = Integer.parseInt(req.getParameter("NCARDS"));
			} catch (Exception e) {
				nCards = 0;
			}
			String USRKEYEncrip = "";
			
			SHA1 secpsw = new SHA1();
			if (!secpsw.selfTest()) {
				throw new ServletException("Test unsuccessful.");
			}
			
			PropertyDescriptor[] pds = null;
			try {
				pds = Introspector.getBeanInfo(DC_CARDS.class).getPropertyDescriptors();
			} catch (IntrospectionException e) {
				e.printStackTrace();
				throw new ServletException(e);
			}
			
			JBCards cardbean = new JBCards();
			BeanList lsCards = new BeanList();
			
			for (int w = 0; w < nCards; w++) {
				DC_CARDS cardsdatabean = new DC_CARDS();
				DC_CARDS cardsdatabeanreport = new DC_CARDS();
				int k = 1;
				while (k < 51) {
					String NumKey = datapro.eibs.master.Util.addLeftZeros(2, String.valueOf(k));
					String USRKEY = "";
					String KEYVAL = "";
					for (int i = 0; i < 2; i++) {
						int NUM = Util.generator.nextInt(34) + 1; 	// random number for letter(A-Z) and numbers(1-9)
						KEYVAL = Util.getKEYVAL(NUM); 				// getting the letter or number for that random number
						USRKEY = USRKEY + KEYVAL; 					// this is the key
					}
					secpsw.clear();
					secpsw.update(USRKEY.trim());
					secpsw.finalize();
					USRKEYEncrip = secpsw.toString().trim();
					
					for (int i = 0; i < pds.length; i++) {
						String name = pds[i].getName();
						if (name.equals("KEY" + NumKey)) {
							Method setter = pds[i].getWriteMethod();
							if (setter != null) {
								try {
									setter.invoke(cardsdatabean, new Object[] { USRKEYEncrip });
									setter.invoke(cardsdatabeanreport, new Object[] { USRKEY.trim() });
								} catch (Exception e) {
									e.printStackTrace();
								}
							}
							break;
						}
					}
					k++;
				}
				cardsdatabean.setSTS("P");
				String newcardnum = cardbean.getLastCard();
				
				newcardnum = "".equals(newcardnum) ? "10000" : newcardnum;
				String Serial = "";
				try {
					Serial = String.valueOf(Integer.parseInt(newcardnum) + 1);
				} catch (Exception e) {
					Serial = "10001";
				}
				cardsdatabean.setSERIAL(Serial);
				cardbean.setAddCard(cardsdatabean, cnx);
				cardsdatabeanreport.setSERIAL(Serial);
				lsCards.addRow(cardsdatabeanreport);
			} //end for loop
			
			session.setAttribute("lsCards", lsCards);
			
			forward("ESS2070_cards_generate_report.jsp", req, res);

		} catch (ServiceLocatorException e) {
			e.printStackTrace();
			throw new ServletException(e);
		} finally {
			try {
				cnx.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

}
