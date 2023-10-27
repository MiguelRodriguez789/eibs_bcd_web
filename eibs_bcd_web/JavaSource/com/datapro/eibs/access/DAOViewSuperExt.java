package com.datapro.eibs.access;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.datapro.access.Key;
import com.datapro.exception.DAOException;
import com.datapro.generic.beanutil.BeanList;
import com.datapro.generic.beanutil.BeanParser;
import com.datapro.sql.beanutil.SelectSqlBean;


public abstract class DAOViewSuperExt extends DAOViewSuper {

	public BeanList find(Key kb) throws DAOException {
		Class voCls = getVoClass();
		try {
			SelectSqlBean sqlBean = new SelectSqlBean();
			s = cnx.prepareStatement(getFindSql(), ResultSet.TYPE_FORWARD_ONLY,
					ResultSet.CONCUR_READ_ONLY);
			sqlBean.parsePreparedStatement((PreparedStatement) s, getFindArguments(kb));

			rs = ((PreparedStatement) s).executeQuery();
			rMd = rs.getMetaData();

			BeanList foundRecords = new BeanList();
			while (rs.next()) {
				Object vo = voCls.newInstance();
				BeanParser bp = new BeanParser(vo);
				bp.parseResultSet(rMd, rs);
				foundRecords.addRow(vo);
			}
			return foundRecords;
		} catch (Exception e) {
			throw new DAOException(this.getClass().getName() + ".findImpl(): " + e.toString());
		} finally {
			close();
		}
	}

}
