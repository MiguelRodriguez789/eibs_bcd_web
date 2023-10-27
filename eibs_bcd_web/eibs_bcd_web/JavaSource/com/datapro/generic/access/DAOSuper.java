package com.datapro.generic.access;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.logging.Logger;

import com.datapro.eibs.constants.General;
import com.datapro.eibs.exception.DAOException;
import com.datapro.generic.tool.Util;
import com.datapro.services.ServiceLocator;

/**
 * @author ogarcia
 *
 */
public class DAOSuper {

	private final static Logger cat = Logger.getLogger(DAOSuper.class.getName());

	protected Connection cnx = null;

	protected String user = "";
	protected BigDecimal year;
	protected BigDecimal month;
	protected BigDecimal day;
	protected Timestamp timestamp;

	/**
	 * Constructor for DAOSuper.
	 * @param dbid
	 */
	public DAOSuper(String dbid) {

		init(dbid);

	}
	
	/**
	 * Constructor for DAOSuper.
	 * @param dbid
	 */
	public DAOSuper(String dbid, boolean isDataSource) {
		init(dbid, isDataSource);
	}

	/**
	 * Constructor for DAOSuper.
	 */
	public DAOSuper() {

		init(General.DBID_CURRENT_YEAR);

	}

	/**
	 * Method DAOSuper.
	 * @param connection
	 */
	public DAOSuper(Connection connection) {

		cnx = connection;
		setAuditVar();
		
	}
	
	/**
	 * Method init.
	 * @param DBID for DBConnector
	 */
	protected void init(String dbid, boolean isDataSource) {
		
		try {
			if (isDataSource) {
				cnx = ServiceLocator.getInstance().getDBConn(dbid);
			} else {
				cnx = ServiceLocator.getInstance().newJDBCCon(dbid);
			}
		} catch (Exception e) {
			cat.severe(e.getMessage());
			e.printStackTrace();
		}
		setAuditVar();
		
	}

	/**
	 * Method init.
	 * @param DBID for DBConnector
	 */
	protected void init(String dbid) {
		
		try {
			cnx = ServiceLocator.getInstance().getDBConn(dbid);
		} catch (Exception e) {
			cat.severe(e.getMessage());
			e.printStackTrace();
		}
		setAuditVar();
		
	}

	/**
	 * Method close.
	 * @throws DAOException
	 */
	public void close() throws DAOException {

		try {
			cnx.close();
		} catch (SQLException e) {
			cat.severe(e.getMessage());
			throw new DAOException(e.toString());
		}

	}

	/**
	 * Method setAutoCommit.
	 * @param ac
	 * @throws DAOException
	 */
	public void setAutoCommit(boolean ac) throws DAOException {

		try {
			cnx.setAutoCommit(ac);
		} catch (SQLException e) {
			cat.severe(e.getMessage());
			throw new DAOException(e.toString());
		}

	}

	/**
	 * Method start.
	 * @throws DAOException
	 */
	public void start() throws DAOException {

		try {
			cnx.setAutoCommit(false);
		} catch (SQLException e) {
			cat.severe(e.getMessage());
			throw new DAOException(e.toString());
		}

	}

	/**
	 * Method end.
	 * @throws DAOException
	 */
	public void end() throws DAOException {

		try {
			cnx.setAutoCommit(true);
		} catch (SQLException e) {
			cat.severe(e.getMessage());
			throw new DAOException(e.toString());
		}

	}

	/**
	 * Method commit.
	 * @throws DAOException
	 */
	public void commit() throws DAOException {

		try {
			cnx.commit();
		} catch (SQLException e) {
			cat.severe(e.getMessage());
			throw new DAOException(e.toString());
		}

	}

	/**
	 * Method rollback.
	 * @throws DAOException
	 */
	public void rollback() throws DAOException {

		try {
			cnx.rollback();
		} catch (SQLException e) {
			cat.severe(e.getMessage());
			throw new DAOException(e.toString());
		}

	}

	/**
	 * Method getConnection.
	 * @return Connection
	 */
	public Connection getConnection() {

		return cnx;

	}

	protected void setAuditVar() {
		year = new BigDecimal(Util.getYear() + "");
		month = new BigDecimal(Util.getMonth() + "");
		day = new BigDecimal(Util.getDay() + "");
		timestamp = Util.getTimestamp();
	}

	/**
	 * Returns the day.
	 * @return BigDecimal
	 */
	public BigDecimal getDay() {
		return day;
	}

	/**
	 * Returns the month.
	 * @return BigDecimal
	 */
	public BigDecimal getMonth() {
		return month;
	}

	/**
	 * Returns the user.
	 * @return String
	 */
	public String getUser() {
		return user;
	}

	/**
	 * Returns the year.
	 * @return BigDecimal
	 */
	public BigDecimal getYear() {
		return year;
	}

	/**
	 * Sets the day.
	 * @param day The day to set
	 */
	public void setDay(BigDecimal day) {
		this.day = day;
	}

	/**
	 * Sets the month.
	 * @param month The month to set
	 */
	public void setMonth(BigDecimal month) {
		this.month = month;
	}

	/**
	 * Sets the user.
	 * @param user The user to set
	 */
	public void setUser(String user) {
		this.user = user;
	}

	/**
	 * Sets the year.
	 * @param year The year to set
	 */
	public void setYear(BigDecimal year) {
		this.year = year;
	}

	/**
	 * Returns the timestamp.
	 * @return Timestamp
	 */
	public Timestamp getTimestamp() {
		return timestamp;
	}

	/**
	 * Sets the timestamp.
	 * @param timestamp The timestamp to set
	 */
	public void setTimestamp(Timestamp timestamp) {
		this.timestamp = timestamp;
	}

}
