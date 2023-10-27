package com.datapro.eibs.parameters.loans.access.jdbc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

import org.apache.log4j.Category;

import com.datapro.eibs.exception.DAOException;
import com.datapro.generic.access.DAOSuper;
import com.datapro.eibs.parameters.loans.access.jdbc.bean.CNTRLDLS;
import com.datapro.generic.beanutil.*;
import datapro.eibs.beans.JBObjList;

public class DAODealsCntrl extends DAOSuper {


    private static Category cat =
		Category.getInstance(DAODealsCntrl.class.getName());
			
	/**
	 * CNTRLBTHDao constructor comment.
	 */

	public DAODealsCntrl(String DBID) {
		super(DBID);
	}
	
	/**
	 * Constructor for DAOUserEibs.
	 */
	public DAODealsCntrl() {
		super();
	}

	/**
	 * Constructor for DAOUserEibs.
	 * @param connection
	 */
	public DAODealsCntrl(Connection connection) {
		super(connection);
	}
	
	
	
	public JBObjList select(String selBNK,String selPRD) throws DAOException {
		
		JBObjList list = null;

		try {
			String likeKey = selBNK.trim().toUpperCase() + "%"+selPRD.trim().toUpperCase();
			String sql = "SELECT * FROM CNTRLDLS WHERE DLSKEY LIKE '"+likeKey+"' ORDER BY DLSKEY";
			PreparedStatement ps = cnx.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			ResultSetMetaData md = rs.getMetaData();
			list = new JBObjList();
			while (rs.next()) {
				CNTRLDLS bean = new CNTRLDLS();
				BeanParser bp = new BeanParser(bean);
				bp.parseResultSet(md, rs);
				list.addRow(bean);
			}
			rs.close();
			ps.close();

		} catch (Exception e) {
			cat.error(e);
			throw new DAOException(e.toString());
		}

		return list;
				
	}
	
	public CNTRLDLS select (String key) throws DAOException {
		
		CNTRLDLS bean = null;
		
		try {
			String sql = "SELECT * FROM CNTRLDLS WHERE DLSKEY=?";
			PreparedStatement ps = cnx.prepareStatement(sql);
			ps.setString(1, key.toUpperCase());
			ResultSet rs = ps.executeQuery();
			ResultSetMetaData md = rs.getMetaData();
			if (rs.next()) {
				bean = new CNTRLDLS();
				BeanParser bp = new BeanParser(bean);
				bp.parseResultSet(md, rs);
			} 
			rs.close();
			ps.close();

		} catch (Exception e) {
			cat.error(e);
			throw new DAOException(e.toString());
		}

		return bean;
	}

	public int update (CNTRLDLS bean) throws DAOException {
		
		int rt;

		try {
			BeanSql bs = new BeanSql(bean);
			String sql = bs.updatePrepareStatement() + " WHERE DLSKEY = ?";
			PreparedStatement ps = cnx.prepareStatement(sql);
			bs.parsePrepareStatement(ps);
			ps.setString(bs.getNextParamIndex(), bean.getDLSKEY().toUpperCase());
			rt = ps.executeUpdate();
			ps.close();

		} catch (Exception e) {
			cat.error(e);
			throw new DAOException(e.toString());
		}

		return rt;
		
		
	}
	
	public int insert (CNTRLDLS bean) throws DAOException {
		
		int rt;

		try {
			BeanSql bs = new BeanSql(bean);
			String sql = bs.insertPrepareStatement();
			PreparedStatement ps = cnx.prepareStatement(sql);
			bs.parsePrepareStatement(ps);
			rt = ps.executeUpdate();
			ps.close();
			
		} catch (Exception e) {
			cat.error(e);			
			throw new DAOException(e.toString());
		}

		return rt;		
		
	}

	public int delete (String key) throws DAOException {
		int rt;

		try {
			String sql = "DELETE FROM CNTRLDLS WHERE DLSKEY=?";
			PreparedStatement ps = cnx.prepareStatement(sql);
			ps.setString(1, key.toUpperCase());
			rt = ps.executeUpdate();
			ps.close();

		} catch (Exception e) {
			cat.error(e);
			throw new DAOException(e.toString());
		}

		return rt;
	}
	
}