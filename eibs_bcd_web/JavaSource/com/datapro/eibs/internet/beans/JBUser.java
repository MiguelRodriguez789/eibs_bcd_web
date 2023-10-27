/**
*  This Class was created By Luis Velando
*  Copyright Datapro Inc. 1999
**/

package com.datapro.eibs.internet.beans; 

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

import com.datapro.eibs.exception.DAOException;
import com.datapro.eibs.internet.dao.DAOUser;
import com.datapro.eibs.internet.databeans.DC_LOG;
import com.datapro.eibs.internet.databeans.DC_USRPROFILE;
import com.datapro.exception.ServiceLocatorException;
import com.datapro.generic.beanutil.BeanList;
import com.datapro.generic.beanutil.BeanParser;
import com.datapro.generic.beanutil.BeanSql;
import com.datapro.services.ServiceLocator;

public class JBUser {

	public JBUser() {
	}

	public BeanList getListUsers(String ENTITYID) {

		DC_USRPROFILE usersdatabean = new DC_USRPROFILE(); 
		BeanList lsUsers = new BeanList();
		Connection cnx = null;

		try {
			cnx = ServiceLocator.getInstance().getDBConn("MSS");

			String STM = "SELECT * from DC_USRPROFILE WHERE ENTITYID = '" + ENTITYID + "'";

			PreparedStatement ps = cnx.prepareStatement(STM);
			ResultSet rs = ps.executeQuery();
			ResultSetMetaData md = rs.getMetaData();

			while (rs.next()) {
				usersdatabean = new DC_USRPROFILE();
				BeanParser bp = new BeanParser(usersdatabean);
				bp.parseResultSet(md, rs);
				lsUsers.addRow(usersdatabean);
			}
			rs.close();
			ps.close();

		}
		catch (SQLException e) {
			System.out.println("Exception e : " + e);
		}
		catch (ServiceLocatorException e) {
			System.out.println("Exception e : " + e);
		}
		finally {
			try {
				cnx.close();
			}
			catch (SQLException e) {
				System.out.println("Exception e : " + e);
			}
		}

		return lsUsers;

	}

	public BeanList getListEntity() {

		DC_LOG usersdatabean = new DC_LOG(); 
		BeanList lsEntity = new BeanList();
		Connection cnx = null;

		try {
			cnx = ServiceLocator.getInstance().getDBConn("MSS");

			String STM = "SELECT DISTINCT ENTITYID FROM DC_LOG where ENTITYID <> 'NO' and ENTITYID <> '' order by ENTITYID DESC";

			PreparedStatement ps = cnx.prepareStatement(STM);
			ResultSet rs = ps.executeQuery();
			ResultSetMetaData md = rs.getMetaData();

			while (rs.next()) {
				usersdatabean = new DC_LOG();
				BeanParser bp = new BeanParser(usersdatabean);
				bp.parseResultSet(md, rs);
				lsEntity.addRow(usersdatabean);
			}
			rs.close();
			ps.close();

		}
		catch (SQLException e) {
			System.out.println("Exception e : " + e);
		}
		catch (ServiceLocatorException e) {
			System.out.println("Exception e : " + e);
		}
		finally {
			try {
				cnx.close();
			}
			catch (SQLException e) {
				System.out.println("Exception e : " + e);
			}
		}

		return lsEntity;

	}
	
	public BeanList getListEntitydif() {

			DC_LOG usersdatabean = new DC_LOG();
			BeanList lsEntity = new BeanList();
			Connection cnx = null;

			try {
				cnx = ServiceLocator.getInstance().getDBConn("MSS");

				String STM = "SELECT DISTINCT ENTITYID FROM DC_LOG where ENTITYID <> 'NO' and ENTITYID <> '' and ENTITYID <> USERID  order by ENTITYID DESC";

				PreparedStatement ps = cnx.prepareStatement(STM);
				ResultSet rs = ps.executeQuery();
				ResultSetMetaData md = rs.getMetaData();

				while (rs.next()) {
					usersdatabean = new DC_LOG();
					BeanParser bp = new BeanParser(usersdatabean);
					bp.parseResultSet(md, rs);
					lsEntity.addRow(usersdatabean);
				}
				rs.close();
				ps.close();

			}
			catch (SQLException e) {
				System.out.println("Exception e : " + e);
			}
			catch (ServiceLocatorException e) {
				System.out.println("Exception e : " + e);
			}
			finally {
				try {
					cnx.close();
				}
				catch (SQLException e) {
					System.out.println("Exception e : " + e);
				}
			}

			return lsEntity;

		}

	public BeanList getListEntities() {

		DC_USRPROFILE usersdatabean = new DC_USRPROFILE(); 
		BeanList lsEntity = new BeanList();
		Connection cnx = null;

		try {
			cnx = ServiceLocator.getInstance().getDBConn("MSS");

			String STM = "SELECT DISTINCT ENTITYID FROM DC_USRPROFILE";

			PreparedStatement ps = cnx.prepareStatement(STM);
			ResultSet rs = ps.executeQuery();
			ResultSetMetaData md = rs.getMetaData();

			while (rs.next()) {
				usersdatabean = new DC_USRPROFILE();
				BeanParser bp = new BeanParser(usersdatabean);
				bp.parseResultSet(md, rs);
				lsEntity.addRow(usersdatabean);
			}
			rs.close();
			ps.close();

		}
		catch (SQLException e) {
			System.out.println("Exception e : " + e);
		}
		catch (ServiceLocatorException e) {
			System.out.println("Exception e : " + e);
		}
		finally {
			try {
				cnx.close();
			}
			catch (SQLException e) {
				System.out.println("Exception e : " + e);
			}
		}

		return lsEntity;

	}

	
	public DC_USRPROFILE getUser(String ENTITYID, String USERID) {

		DC_USRPROFILE usersdatabean = new DC_USRPROFILE();
		Connection cnx = null;

		try {
			cnx = ServiceLocator.getInstance().getDBConn("MSS");

			String STM = "SELECT * from DC_USRPROFILE WHERE ENTITYID = '" + ENTITYID + "' and USERID = '" + USERID + "'";

			PreparedStatement ps = cnx.prepareStatement(STM);
			ResultSet rs = ps.executeQuery();
			ResultSetMetaData md = rs.getMetaData();

			if (rs.next()) {
				usersdatabean = new DC_USRPROFILE();
				BeanParser bp = new BeanParser(usersdatabean);
				bp.parseResultSet(md, rs);
			}
			rs.close();
			ps.close();

		}
		catch (SQLException e) {
			System.out.println("Exception e : " + e);
		}
		catch (ServiceLocatorException e) {
			System.out.println("Exception e : " + e);
		}
		finally {
			try {
				cnx.close();
			}
			catch (SQLException e) {
				System.out.println("Exception e : " + e);
			}
		}

		return usersdatabean;

	}

	public boolean setDeleteUser(DC_USRPROFILE usersdatabean) {

		boolean sqlerror = false;

		Connection cnx = null;

		try {
			cnx = ServiceLocator.getInstance().getDBConn("MSS");
			Statement st = cnx.createStatement();

			st.execute("delete from DC_USRPROFILE WHERE ENTITYID = '" + usersdatabean.getENTITYID() + "' and USERID = '" + usersdatabean.getUSERID() + "'");
		}
		catch (SQLException e) {
			System.out.println("Exception e : " + e);
			sqlerror = true;
		}
		catch (ServiceLocatorException e) {
			System.out.println("Exception e : " + e);
			sqlerror = true;
		}
		finally {
			try {
				cnx.close();
			}
			catch (SQLException e) {
				System.out.println("Exception e : " + e);
				sqlerror = true;
			}
		}

		return (sqlerror);
	}

	public boolean setAddUser(DC_USRPROFILE usersdatabean) {

		boolean sqlerror = false;

		Connection cnx = null;

		try {

			cnx = ServiceLocator.getInstance().getDBConn("MSS");

			BeanSql bs = new BeanSql(usersdatabean);

			String STM = bs.insertPrepareStatement();
			PreparedStatement ps = cnx.prepareStatement(STM);
			bs.parsePrepareStatement(ps);
			ps.executeUpdate();
			ps.close();

		}
		catch (SQLException e) {
			System.out.println("Exception e : " + e);
			sqlerror = true;
		}
		catch (ServiceLocatorException e) {
			System.out.println("Exception e : " + e);
		}
		finally {
			try {
				cnx.close();
			}
			catch (SQLException e) {
				System.out.println("Exception e : " + e);
			}
		}

		return sqlerror;
	}

	public boolean setUpdateUser(DC_USRPROFILE usersdatabean) {

		boolean sqlerror = false;

		Connection cnx = null;

		try {

			cnx = ServiceLocator.getInstance().getDBConn("MSS");

			BeanSql bs = new BeanSql(usersdatabean);
			String sql = bs.updatePrepareStatement() + " WHERE ENTITYID=? AND USERID=?";
			PreparedStatement ps = cnx.prepareStatement(sql);
			bs.parsePrepareStatement(ps);
			ps.setString(bs.getNextParamIndex(), usersdatabean.getENTITYID());
			ps.setString(bs.getNextParamIndex() + 1, String.valueOf(usersdatabean.getUSERID()));
			ps.executeUpdate();
			ps.close();

		}
		catch (SQLException e) {
			System.out.println("Exception e : " + e);
			sqlerror = true;
		}
		catch (ServiceLocatorException e) {
			System.out.println("Exception e : " + e);
		}
		finally {
			try {
				cnx.close();
			}
			catch (SQLException e) {
				System.out.println("Exception e : " + e);
			}
		}

		return sqlerror;

	}
	
	public DC_USRPROFILE getEntity(String ENTITYID) {

			DC_USRPROFILE usersdatabean = new DC_USRPROFILE();
			Connection cnx = null;

			try {
				cnx = ServiceLocator.getInstance().getDBConn("MSS");

				String STM = "SELECT * from DC_USRPROFILE WHERE ENTITYID = '" + ENTITYID + "'";

				PreparedStatement ps = cnx.prepareStatement(STM);
				ResultSet rs = ps.executeQuery();
				ResultSetMetaData md = rs.getMetaData();

				if (rs.next()) {
					usersdatabean = new DC_USRPROFILE();
					BeanParser bp = new BeanParser(usersdatabean);
					bp.parseResultSet(md, rs);
				}
				rs.close();
				ps.close();

			}
			catch (SQLException e) {
				System.out.println("Exception e : " + e);
			}
			catch (ServiceLocatorException e) {
				System.out.println("Exception e : " + e);
			}
			finally {
				try {
					cnx.close();
				}
				catch (SQLException e) {
					System.out.println("Exception e : " + e);
				}
			}

			return usersdatabean;

		}
		
	public int deleteUserPassword(String user) throws DAOException {
		DAOUser dao = new DAOUser("MSS");
		try {			
			return dao.deleteUserPassword(user);

		} finally {
			try {
				dao.close();
			} catch (DAOException e) {
				System.out.println("Exception e : " + e);
			}
		}
	}

}