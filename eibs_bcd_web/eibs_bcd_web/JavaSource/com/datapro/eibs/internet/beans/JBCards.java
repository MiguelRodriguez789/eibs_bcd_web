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

import com.datapro.eibs.internet.databeans.DC_CARDS;
import com.datapro.exception.ServiceLocatorException;
import com.datapro.generic.beanutil.BeanList;
import com.datapro.generic.beanutil.BeanParser;
import com.datapro.generic.beanutil.BeanSql;
import com.datapro.services.ServiceLocator;

public class JBCards {

	public JBCards() {
	}

	public BeanList getListCardsforEntity(String ENTITYID) {

		DC_CARDS cardsdatabean = new DC_CARDS();
		BeanList lsCardsEntity = new BeanList();
		Connection cnx = null;

		try {
			cnx = ServiceLocator.getInstance().getDBConn("MSS");

			String STM = "SELECT * from DC_CARDS WHERE ENTITYID = '" + ENTITYID + "'";

			PreparedStatement ps = cnx.prepareStatement(STM);
			ResultSet rs = ps.executeQuery();
			ResultSetMetaData md = rs.getMetaData();

			while (rs.next()) {
				cardsdatabean = new DC_CARDS();
				BeanParser bp = new BeanParser(cardsdatabean);
				bp.parseResultSet(md, rs);
				lsCardsEntity.addRow(cardsdatabean);
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

		return lsCardsEntity;

	}

	public DC_CARDS getCardSerial(String SERIAL) {

		DC_CARDS cardsdatabean = new DC_CARDS();
		Connection cnx = null;

		try {
			cnx = ServiceLocator.getInstance().getDBConn("MSS");

			String STM = "SELECT * from DC_CARDS WHERE SERIAL = '" + SERIAL + "'";

			PreparedStatement ps = cnx.prepareStatement(STM);
			ResultSet rs = ps.executeQuery();
			ResultSetMetaData md = rs.getMetaData();

			if (rs.next()) {
				cardsdatabean = new DC_CARDS();
				BeanParser bp = new BeanParser(cardsdatabean);
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

		return cardsdatabean;

	}

	public DC_CARDS getCardEntity(String ENTITYID, String STS) {

		DC_CARDS cardsdatabean = new DC_CARDS();
		Connection cnx = null;

		try {
			cnx = ServiceLocator.getInstance().getDBConn("MSS");

			String STM = "SELECT * from DC_CARDS WHERE ENTITYID = '" + ENTITYID + "' and STS='" + STS + "'";

			PreparedStatement ps = cnx.prepareStatement(STM);
			ResultSet rs = ps.executeQuery();
			ResultSetMetaData md = rs.getMetaData();

			if (rs.next()) {
				cardsdatabean = new DC_CARDS();
				BeanParser bp = new BeanParser(cardsdatabean);
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

		return cardsdatabean;

	}

	public boolean setAddCard(DC_CARDS cardsdatabean, Connection cnx) {

		boolean sqlerror = false;

		try {
			BeanSql bs = new BeanSql(cardsdatabean);

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

		return sqlerror;
	}

	public boolean setUpdateCard(DC_CARDS cardsdatabean) {

		boolean sqlerror = false;

		Connection cnx = null;

		try {

			cnx = ServiceLocator.getInstance().getDBConn("MSS");

			BeanSql bs = new BeanSql(cardsdatabean);
			String sql = bs.updatePrepareStatement() + " WHERE SERIAL=?";
			PreparedStatement ps = cnx.prepareStatement(sql);
			bs.parsePrepareStatement(ps);
			ps.setString(bs.getNextParamIndex(), cardsdatabean.getSERIAL());
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

	public boolean setCardEntity(DC_CARDS cardsdatabean) {

		boolean sqlerror = false;

		Connection cnx = null;

		try {

			cnx = ServiceLocator.getInstance().getDBConn("MSS");

			BeanSql bs = new BeanSql(cardsdatabean);
			String sql = bs.updatePrepareStatement() + " WHERE SERIAL=?";
			PreparedStatement ps = cnx.prepareStatement(sql);
			bs.parsePrepareStatement(ps);
			ps.setString(bs.getNextParamIndex(), cardsdatabean.getSERIAL());
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

	public String getLastCard() {

		String lastcard = "";

		DC_CARDS cardsdatabean = new DC_CARDS();
		Connection cnx = null;

		try {
			cnx = ServiceLocator.getInstance().getDBConn("MSS");

			String STM = "SELECT * from DC_CARDS order by SERIAL desc";

			PreparedStatement ps = cnx.prepareStatement(STM);
			ResultSet rs = ps.executeQuery();
			ResultSetMetaData md = rs.getMetaData();

			if (rs.next()) {
				cardsdatabean = new DC_CARDS();
				BeanParser bp = new BeanParser(cardsdatabean);
				bp.parseResultSet(md, rs);

				lastcard = cardsdatabean.getSERIAL();
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

		return lastcard;

	}

	public BeanList getListCardstoAsign(int number) {

		DC_CARDS cardsdatabean = new DC_CARDS();
		BeanList lsCardsA = new BeanList();
		Connection cnx = null;

		try {
			cnx = ServiceLocator.getInstance().getDBConn("MSS");

			String STM = "SELECT * from DC_CARDS WHERE STS='P' order by SERIAL";

			PreparedStatement ps = cnx.prepareStatement(STM);
			ResultSet rs = ps.executeQuery();
			ResultSetMetaData md = rs.getMetaData();

			while (rs.next()) {
				cardsdatabean = new DC_CARDS();
				BeanParser bp = new BeanParser(cardsdatabean);
				bp.parseResultSet(md, rs);
				lsCardsA.addRow(cardsdatabean);
				number--;
				if (number == 0) {
					break;
				}
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

		return lsCardsA;

	}

	public BeanList getListEntity() {

		DC_CARDS cardsdatabean = new DC_CARDS();
		BeanList lsInqEntity = new BeanList();
		Connection cnx = null;

		try {
			cnx = ServiceLocator.getInstance().getDBConn("MSS");

			String STM = "SELECT DISTINCT ENTITYID FROM DC_CARDS where ENTITYID <> 'NO' and ENTITYID <> '' order by ENTITYID DESC";

			PreparedStatement ps = cnx.prepareStatement(STM);
			ResultSet rs = ps.executeQuery();
			ResultSetMetaData md = rs.getMetaData();

			while (rs.next()) {
				cardsdatabean = new DC_CARDS();
				BeanParser bp = new BeanParser(cardsdatabean);
				bp.parseResultSet(md, rs);
				lsInqEntity.addRow(cardsdatabean);
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

		return lsInqEntity;

	}

}