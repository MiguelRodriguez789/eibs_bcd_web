package com.datapro.eibs.parameters.loans.access.jdbc.dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

import org.apache.log4j.Category;

import com.datapro.eibs.exception.DAOException;
import com.datapro.generic.access.DAOSuper;
import com.datapro.eibs.parameters.loans.access.jdbc.bean.CNTRLPRR;
import com.datapro.generic.beanutil.*;
import datapro.eibs.beans.JBObjList;

public class DAORates extends DAOSuper {


    private static Category cat =
		Category.getInstance(DAORates.class.getName());
			
	/**
	 * CNTRLDBADao constructor comment.
	 */

	public DAORates(String DBID) {
		super(DBID);
	}
	
	/**
	 * Constructor for DAOUserEibs.
	 */
	public DAORates() {
		super();
	}

	/**
	 * Constructor for DAOUserEibs.
	 * @param connection
	 */
	public DAORates(Connection connection) {
		super(connection);
	}

	public JBObjList select() throws DAOException {
		
		JBObjList list = null;

		try {
			String sql = "SELECT * FROM CNTRLPRR ORDER BY PRRKEY";
			PreparedStatement ps = cnx.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			ResultSetMetaData md = rs.getMetaData();
			list = new JBObjList();
			while (rs.next()) {
				CNTRLPRR bean = new CNTRLPRR();
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
	
	public CNTRLPRR select(String key) throws DAOException {

		CNTRLPRR bean = null;

		try {
			String sql = "SELECT * FROM CNTRLPRR WHERE PRRKEY=?";
			PreparedStatement ps = cnx.prepareStatement(sql);
			ps.setString(1, key.toUpperCase());
			ResultSet rs = ps.executeQuery();
			ResultSetMetaData md = rs.getMetaData();
			if (rs.next()) {
				bean = new CNTRLPRR();
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
	
	
	public int delete (String key) throws DAOException {

		int rt;

		try {
			String sql = "DELETE FROM CNTRLPRR WHERE PRRKEY=?";
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
	
	public int insert (CNTRLPRR bean) throws DAOException {

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
	
	public int update (CNTRLPRR bean) throws DAOException {

		int rt;

		try {
			BeanSql bs = new BeanSql(bean);
			String sql = bs.updatePrepareStatement() + " WHERE PRRKEY=?";
			PreparedStatement ps = cnx.prepareStatement(sql);
			bs.parsePrepareStatement(ps);
			ps.setString(bs.getNextParamIndex(), bean.getPRRKEY().toUpperCase());
			rt = ps.executeUpdate();
			ps.close();

		} catch (Exception e) {
			cat.error(e);
			throw new DAOException(e.toString());
		}

		return rt;
	}

}