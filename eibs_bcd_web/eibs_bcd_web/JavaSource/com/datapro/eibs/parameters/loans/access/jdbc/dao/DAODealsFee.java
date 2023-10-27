package com.datapro.eibs.parameters.loans.access.jdbc.dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

import org.apache.log4j.Category;

import com.datapro.eibs.exception.DAOException;
import com.datapro.generic.access.DAOSuper;
import com.datapro.eibs.parameters.loans.access.jdbc.bean.DLSFE;
import com.datapro.generic.beanutil.*;
import datapro.eibs.beans.JBObjList;

public class DAODealsFee extends DAOSuper {


    private static Category cat =
		Category.getInstance(DAODealsFee.class.getName());
			
	/**
	 * CNTRLDBADao constructor comment.
	 */

	public DAODealsFee(String DBID) {
		super(DBID);
	}
	
	/**
	 * Constructor for DAOUserEibs.
	 */
	public DAODealsFee() {
		super();
	}

	/**
	 * Constructor for DAOUserEibs.
	 * @param connection
	 */
	public DAODealsFee(Connection connection) {
		super(connection);
	}

	
	
	public DLSFE select(String key,BigDecimal cust) throws DAOException {

		DLSFE bean = null;

		try {
			String sql = "SELECT * FROM DLSFE WHERE DLSKEY=? AND DLSCUN =?";
			PreparedStatement ps = cnx.prepareStatement(sql);
			ps.setString(1, key.toUpperCase());
			ps.setBigDecimal(2,cust);
			ResultSet rs = ps.executeQuery();
			ResultSetMetaData md = rs.getMetaData();
			if (rs.next()) {
				bean = new DLSFE();
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
	
	public int delete (String key,BigDecimal cust) throws DAOException {

		int rt;

		try {
			String sql = "DELETE FROM DLSFE WHERE DLSKEY=? AND DLSCUN =?";
			PreparedStatement ps = cnx.prepareStatement(sql);
			ps.setString(1, key.toUpperCase());
			ps.setBigDecimal(2,cust);
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
			String sql = "DELETE FROM DLSFE WHERE DLSKEY=?";
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
	
	public int insert (DLSFE bean) throws DAOException {

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
	
	public int update (DLSFE bean) throws DAOException {

		int rt;

		try {
			BeanSql bs = new BeanSql(bean);
			String sql = bs.updatePrepareStatement() + " WHERE DLSKEY=? AND DLSCUN =?";
			PreparedStatement ps = cnx.prepareStatement(sql);
			bs.parsePrepareStatement(ps);
			ps.setString(bs.getNextParamIndex(), bean.getDLSKEY().toUpperCase());
			ps.setBigDecimal(bs.getNextParamIndex() + 1, bean.getDLSCUN());
			rt = ps.executeUpdate();
			ps.close();

		} catch (Exception e) {
			cat.error(e);
			throw new DAOException(e.toString());
		}

		return rt;
	}

}