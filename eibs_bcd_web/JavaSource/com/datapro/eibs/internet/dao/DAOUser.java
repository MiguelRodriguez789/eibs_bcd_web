package com.datapro.eibs.internet.dao;

import java.sql.PreparedStatement;

import com.datapro.eibs.exception.DAOException;
import com.datapro.generic.access.DAOSuper;


/**
 * @author fhernandez
 *
 */
public class DAOUser extends DAOSuper {

	/**
	 * Constructor for DAOUserEibs.
	 * @param dbid
	 */
	public DAOUser(String dbid) {
		super(dbid);
	}
	
	public int deleteUserPassword(String user) throws DAOException {
		int rt;
		try {
			String sql = "DELETE FROM DC_USER_OPASS WHERE USERID=?";
			PreparedStatement ps = cnx.prepareStatement(sql);
			ps.setString(1, user.toUpperCase());
			rt = ps.executeUpdate();
			ps.close();

		} catch (Exception e) {
			throw new DAOException(e.toString());
		}

		return rt;
		
	}

}
