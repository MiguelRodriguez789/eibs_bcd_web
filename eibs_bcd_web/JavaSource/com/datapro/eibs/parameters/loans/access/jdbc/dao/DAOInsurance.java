package com.datapro.eibs.parameters.loans.access.jdbc.dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

import org.apache.log4j.Category;

import com.datapro.eibs.exception.DAOException;
import com.datapro.generic.access.DAOSuper;
import com.datapro.eibs.parameters.loans.access.jdbc.bean.CNTRLINS;
import com.datapro.generic.beanutil.*;
import datapro.eibs.beans.JBObjList;

public class DAOInsurance extends DAOSuper {


    private static Category cat =
		Category.getInstance(DAOInsurance.class.getName());
			
	/**
	 * CNTRLDBADao constructor comment.
	 */

	public DAOInsurance(String DBID) {
		super(DBID);
	}
	
	/**
	 * Constructor for DAOUserEibs.
	 */
	public DAOInsurance() {
		super();
	}

	/**
	 * Constructor for DAOUserEibs.
	 * @param connection
	 */
	public DAOInsurance(Connection connection) {
		super(connection);
	}

	public JBObjList select(String cls) throws DAOException {
		
		JBObjList list = null;

		try {
			String sql = "SELECT * FROM CNTRLINS WHERE INSCLS =? ORDER BY INSTYP";
			PreparedStatement ps = cnx.prepareStatement(sql);
			ps.setString(1, cls.toUpperCase());
			ResultSet rs = ps.executeQuery();
			ResultSetMetaData md = rs.getMetaData();
			list = new JBObjList();
			while (rs.next()) {
				CNTRLINS bean = new CNTRLINS();
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
	
	public CNTRLINS select(String typ, String cls) throws DAOException {

		CNTRLINS bean = null;

		try {
			String sql = "SELECT * FROM CNTRLINS WHERE INSTYP=? AND INSCLS =?";
			PreparedStatement ps = cnx.prepareStatement(sql);
			ps.setString(1, typ.toUpperCase());
			ps.setString(2, cls.toUpperCase());
			ResultSet rs = ps.executeQuery();
			ResultSetMetaData md = rs.getMetaData();
			if (rs.next()) {
				bean = new CNTRLINS();
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
		
	
	public int delete (String typ, String cls) throws DAOException {

		int rt;

		try {
			String sql = "DELETE FROM CNTRLINS WHERE INSTYP=? AND INSCLS =?";
			PreparedStatement ps = cnx.prepareStatement(sql);
			ps.setString(1, typ.toUpperCase());
			ps.setString(2, cls.toUpperCase());
			rt = ps.executeUpdate();
			ps.close();

		} catch (Exception e) {
			cat.error(e);
			throw new DAOException(e.toString());
		}

		return rt;
	}
	
	public int insert (CNTRLINS bean) throws DAOException {

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
	
	public int update (CNTRLINS bean) throws DAOException {

		int rt;

		try {
			BeanSql bs = new BeanSql(bean);
			String sql = bs.updatePrepareStatement() + " WHERE INSTYP=? AND INSCLS =?";
			PreparedStatement ps = cnx.prepareStatement(sql);
			bs.parsePrepareStatement(ps);
			ps.setString(bs.getNextParamIndex(), bean.getINSTYP().toUpperCase());
			ps.setString(bs.getNextParamIndex() + 1, bean.getINSCLS().toUpperCase());
			rt = ps.executeUpdate();
			ps.close();

		} catch (Exception e) {
			cat.error(e);
			throw new DAOException(e.toString());
		}

		return rt;
	}

}