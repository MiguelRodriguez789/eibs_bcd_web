package datapro.eibs.tools;

/**
 * Insert the type's description here.
 * Creation date: (7/6/04 6:08:55 PM)
 * @author: Manuel Justo
 */
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datapro.exception.ServiceLocatorException;
import com.datapro.services.ServiceLocator;

import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.Forms;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSProp;
import datapro.eibs.master.JSEIBSServlet;

public class JSEFRMConf extends JSEIBSServlet {

	// Action
	public static HashMap actions;

	protected static final int LIST = 1;
	protected static final int NEW_FORM = 2;
	protected static final int READ_DETAIL = 3;
	protected static final int DELETE = 4;
	protected static final int SAVE=5;
	protected static final int RECORD_LIMIT=30;
	
	boolean isDataSource = false;

	public void init(ServletConfig config) {
		try {
			super.init(config);
			actions = new HashMap();
			actions.put("LIST", new Integer(LIST));
			actions.put("READ_DETAIL", new Integer(READ_DETAIL));
			actions.put("NEW_FORM", new Integer(NEW_FORM));
			actions.put("DELETE", new Integer(DELETE));
			actions.put("SAVE", new Integer(SAVE));
			
			isDataSource = JSEIBSProp.getEODDataSource();

		} catch (ServletException e) {
			flexLog("JSESS0110 init error: " + e.getMessage());
		}
	}

	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		// TODO Auto-generated method stub

		int action = 0;
		String command = req.getParameter("command");
		Integer selCommand = (Integer) actions.get(command);
		if (selCommand != null)
			action = selCommand.intValue();

		switch (action) {
		case LIST:
			list(user,req,res,session);
			break;
		case NEW_FORM:
			//this.listMenuUser(user, req, res, session);
			break;
		// END Entering
		case READ_DETAIL:
			//forward("ESS0110_user_menu.jsp", req, res);
			break;
		case DELETE:
			//this.listMenuUser(user, req, res, session);
			break;
		// END Entering
		case SAVE:
			//this.updateMenuUser(user, req, res, session);
			break;
		// END Entering	
		default:
			forward("MISC_not_available.jsp", req, res);
			break;
		}
	}

	/**
	 * JSEIE00000 constructor comment.
	 */
	public JSEFRMConf() {
		super();
	}

	/**
	 * This method was created by Orestes Garcia.
	 */
	public void destroy() {

		flexLog("free resources used by JSESS0110");
	}

	
	private void list(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session)throws ServletException, IOException {
		
		String ProductType=req.getParameter("ProdType")!=null?req.getParameter("ProdType"):"";
		String Product= req.getParameter("Product") != null?req.getParameter("Product"):"";
		String From = req.getParameter("From")!=null?req.getParameter("From"):"1";
		int finalRecord = 0;
		try{
		 finalRecord=  Integer.parseInt(From) + RECORD_LIMIT ;
		}catch(Exception e ){finalRecord=1000;}
		//String To = req.getParameter("To")!=null?req.getParameter("To"):null;
		
		// Define el tipo de busqueda
		/*
		 * SELECT * FROM
          ( SELECT
            ROW_NUMBER() OVER (ORDER BY sort_key ASC) AS ROW_NUMBER,
             COLUMNS
            FROM tablename
          ) foo
          WHERE ROW_NUMBER <= 10

		 */
		StringBuffer sb= new StringBuffer();
		sb.append("select * from ");
		sb.append("(select row_number() over (order by apfpro asc) as row_number, ");
		sb.append(" apfpro, apffty, apffcd, apfdsc, apfpth ");
		sb.append(" from apfrm");
		
		if (!ProductType.equals("")){
			sb.append(", apcpr ");
		}
		
		if (!ProductType.equals("") && !Product.equals("")){
			sb.append(" where apfpro='"+Product+ "' and apfpro=aprcde and");
			sb.append(" aprtyp'="+ProductType+"'");
		}else if ( !ProductType.equals("")){
		    sb.append(" where apfpro=aprcde and");
		    sb.append(" aprtyp'="+ProductType+"'");
		}else if ( !Product.equals("")){
			sb.append (" where apfpro='"+Product+ "'");
		}
		sb.append(" ) forms ");
		sb.append(" where row_number >= "+ From );
		sb.append(" and row_number <= "+ finalRecord);
		
		Connection cnx = null;
		try {
			cnx = getConnection();
			Statement st = cnx.createStatement();
			ResultSet rs =st.executeQuery(sb.toString());
			JBObjList lista = new JBObjList();
			lista.setShowNext(false);
			lista.setShowPrev(false);
			boolean firstTime=true;
			int count=0;
			while (rs.next()) {
				Forms form = new Forms();
				form.setRecnum(rs.getInt("row_number"));
				form.setApfpro(rs.getString("apfpro"));
				form.setApffty(rs.getString("apffty"));
				form.setApffcd(rs.getString("apffcd"));
				form.setApfdsc(rs.getString("apfdsc"));
				form.setApfpth(rs.getString("apfpth"));
				
				if (++count <= RECORD_LIMIT){
     				lista.addRow(form);
				}
				
				if (firstTime){
					if (form.getRecnum() > 1)
						lista.setShowPrev(true);
					else
						lista.setShowPrev(false);
					
					firstTime=false;
				}
			}
			
			if (count == (RECORD_LIMIT  + 1)){
				lista.setShowNext(true);
			}
			
			
			req.setAttribute("forms", lista);
			req.setAttribute("Product", Product);
			req.setAttribute("ProductType", ProductType);
			
			forward("EFRMConf_List.jsp", req, res);
			
		}catch (SQLException e) {
				flexLog("Error: " + e.getClass().getName() + " --> " + e);
				throw new ServletException(e.getMessage());
			} finally {
				try {
					if (cnx != null) cnx.close();
				} catch (SQLException e) {
					flexLog("Error: " + e);
				}
			}
		
	}
	
	
	protected Connection getConnection() throws ServletException {
		Connection cnx = null;
		try {
			if (isDataSource) {
				cnx = ServiceLocator.getInstance().getDBConn("eibs-server");
			} else {
				cnx = ServiceLocator.getInstance().newJDBCCon("eibs-server");
			}
			return cnx;
		} catch (ServiceLocatorException e) {
			flexLog("Error: " + e.getClass().getName() + " --> " + e);
			throw new ServletException(e.getMessage());
		}
	}

}
