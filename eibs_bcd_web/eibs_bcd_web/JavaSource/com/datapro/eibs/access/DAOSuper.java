package com.datapro.eibs.access;

import java.math.BigDecimal;
import java.sql.BatchUpdateException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.Arrays;

import org.apache.log4j.Logger;

import com.datapro.access.DataAccessObject;
import com.datapro.access.Key;
import com.datapro.access.ValueObject;
import com.datapro.eibs.cache.EibsCacheAdministrator;
import com.datapro.eibs.constants.DatabaseAccess;
import com.datapro.eibs.exception.CacheNeedsRefreshException;
import com.datapro.eibs.exception.ItemNotFoundException;
import com.datapro.eibs.exception.ItemNotUniqueException;
import com.datapro.eibs.exception.ItemUpdatedByAnotherUser;
import com.datapro.eibs.exception.NoCacheConfiguredException;
import com.datapro.eibs.exception.ValidationFailureException;
import com.datapro.exception.BeanSqlException;
import com.datapro.exception.DAOException;
import com.datapro.exception.VerboseSqlException;
import com.datapro.generic.beanutil.BeanCopier;
import com.datapro.generic.beanutil.BeanList;
import com.datapro.generic.beanutil.BeanParser;
import com.datapro.generic.tool.Util;
import com.datapro.sql.beanutil.BeanSql;
import com.datapro.sql.beanutil.DeleteSqlBean;
import com.datapro.sql.beanutil.ExecuteSqlBean;
import com.datapro.sql.beanutil.FunctionSqlBean;
import com.datapro.sql.beanutil.InsertSqlBean;
import com.datapro.sql.beanutil.SelectSqlBean;
import com.datapro.sql.beanutil.UpdateSqlBean;

/**
 * The DAOSuper is the central class for working with statements 
 * (select, insert, update, delete etc.), so it implements all methods involved 
 * with executing statements and batches in the Database.
 * It is the center piece of the persistence framework and generates SQL statements 
 * based on the bussiness classes. 
 * 
 * @author ogarcia, fhernandez, erodriguez
 *
 */
public abstract class DAOSuper extends DataAccessObject implements DISuper, DatabaseAccess {

	private final static Logger log = Logger.getLogger(DAOSuper.class);

	AccessSession session;
	Connection cnx = null;
	Statement s;
	ResultSet rs;
	ResultSetMetaData rMd;	
	String target = null;
	
	protected String user = "";
	protected BigDecimal year;
	protected BigDecimal month;
	protected BigDecimal day;
	protected Timestamp timestamp;
	private Class voCls = null;
	private Class keyCls = null;
	protected MDSuper md = null;

	private int MAX_ROW_RESULT = 2000;
	private int maxRows = 0;
	
	private boolean foundRecord;
	private BeanList foundRecords;

	protected boolean needsMonitor = true;

	private static EibsCacheAdministrator cadmin = new EibsCacheAdministrator();

	/**
	 * Constructor for DAOSuper.
	 */
	public DAOSuper() {
		super();
		cnx = null;
		user = "";
		voCls = null;
		keyCls = null;
		try {
			md = getMdByName();
		} catch (DAOException e) {
			log.error(e);
		}
	}

	public DAOSuper(AccessSession session) {
		this();
		open(session);
	}
	
	public void open(AccessSession session) {
		this.session = session;
		setUser(session.getUser());
		setConnection(session.getConnection());
	}

	public String getTarget() {
		return target;
	}
	
	public void setTarget(String target) {
		this.target = target;
	}
	
	/**
	 * Method init.
	 * @param cn
	 */
	public void setConnection(Connection cn) {
		cnx = cn;
		initAuditVar();
	}

	/**
	 * Method getConnection.
	 * @return Connection
	 */
	public Connection getConnection() {
		return cnx;
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
	 * Returns the TimeData.
	 * @return Timestamp
	 */
	public Timestamp getRunDate() {
		return session.getTime().toTime();
	}
	
	protected String prepareSql(BeanSql sqlBean, Object bean) throws BeanSqlException, DAOException {
		return sqlBean.prepareStatement();
	}
	
	protected void parsePreparedStatement(PreparedStatement s, BeanSql sqlBean, Object[] args) throws BeanSqlException, DAOException {
		if (args == null) {
			sqlBean.parsePreparedStatement((PreparedStatement) s);
		} else {
			sqlBean.parsePreparedStatement((PreparedStatement) s, args);
		}
	}
	
	public void execute(String sql) throws DAOException {

		try {
			s = cnx.createStatement();
			s.execute(sql);

		} catch (SQLException e) {
			log.error("", new VerboseSqlException(e));
			throw new DAOException(this.getClass().getName() + ".execute(): " + e.toString());
		} catch (Exception e) {
			log.error(e);
			throw new DAOException(this.getClass().getName() + ".execute(): " + e.toString());
		} finally {
			close();
		}
	}
	
	public void truncate(String table) throws DAOException {
		
		try {
			String dbName = cnx.getMetaData().getDatabaseProductName();
			
			s = cnx.createStatement();
			if(dbName.indexOf("AS/400") >= 0){
				String url = cnx.getMetaData().getURL();
				int pos = url.indexOf("libraries") + "libraries".length();
				int end = url.indexOf(";", pos);
				String library = url.substring(pos+1, end);
				String command = "QSYS/CLRPFM FILE(" + library + "/" + table + ")";
				s.execute("CALL QSYS.QCMDEXC('" + command + "', " + 
						Util.addLeftChar('0', 10, "" + command.length()) + ".00000)");
			} else if (dbName.indexOf("DB2") >= 0) {
				s.execute("ALTER TABLE " + table + " ACTIVATE NOT LOGGED INITIALLY WITH EMPTY TABLE ");
			} else {
				s.execute("TRUNCATE TABLE " + table);
			}

		} catch (SQLException e) {
			log.error("", new VerboseSqlException(e));
			throw new DAOException(this.getClass().getName() + ".truncate(): " + e.toString());
		} catch (Exception e) {
			log.error(e);
			throw new DAOException(this.getClass().getName() + ".truncate(): " + e.toString());
		} finally {
			close();
		}

		
	}
	
	/**
	 * @execute stored procedure
	 * @param store procedure 
	 * @return
	 * @throws DAOException
	 */
	public Object call(String procedure) throws DAOException {
		return callImpl(procedure, null, null);
	}

	/**
	 * @execute stored procedure
	 * @param store procedure 
	 * @param args input parameters
	 * @return
	 * @throws DAOException
	 */
	public Object call(String procedure, Object[] args) throws DAOException {
		return callImpl(procedure, args, null);
	}

	/**
	 * @execute stored procedure
	 * @param store procedure 
	 * @param args1 input parameters
	 * @param args2 output parameters
	 * @return
	 * @throws DAOException
	 */
	public Object call(String procedure, Object[] args1, Object[] args2) throws DAOException {
		return callImpl(procedure, args1, args2);
	}
	
	protected Object getResult() throws Exception {
		try {
			foundRecords = new BeanList();
			while (rs.next()) {
				Object vo = getVoClass().newInstance();
				BeanParser bp = new BeanParser(vo);
				bp.parseResultSet(rMd, rs);
				foundRecords.addRow(vo);
			}
			return getLastFound();
		} finally {
			close();
		}
	}

	private Object getResult(ExecuteSqlBean sqlBean, Object[] args2) throws Exception {
		try {
			Object result = null;
			if (args2 != null) {
				sqlBean.setParameterResults((PreparedStatement) s);
				for (int i = 0; i < args2.length; i++) {
					args2[i] = sqlBean.getResult(i);
				}
				result = args2[0];
			} else {
				result = sqlBean.getResult(0);
			}
			return result;
		} finally {
			close();
		}
	}
	
	private boolean execute(ExecuteSqlBean sqlBean) throws DAOException {
		try {
			String sql = sqlBean.prepareStatement();
			CallableStatement ps = cnx.prepareCall(sql);
			s = ps;
			// ps = cnx.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE,
			// ResultSet.CONCUR_UPDATABLE);
			ps.setMaxRows(maxRows);
			sqlBean.parsePreparedStatement(ps);
			boolean sucess = ps.execute();
			if (sucess) {
				rs = ps.getResultSet();
				rMd = rs.getMetaData();
			}
			return sucess;
		} catch (SQLException e) {
			close();
			log.error("", new VerboseSqlException(e));
			throw new DAOException(this.getClass().getName() + ".callImpl(): " + e.toString());
		} catch (Throwable e) {
			close();
			log.error(e);
			throw new DAOException(this.getClass().getName() + ".callImpl(): " + e.toString());
		}
	}

	/**
	 * @param store procedure 
	 * @param args
	 * @return
	 * @throws DAOException
	 */
	private Object callImpl(String procedure, Object[] args1, Object[] args2)
			throws DAOException {
		try {
			ExecuteSqlBean sqlBean = new ExecuteSqlBean();
			sqlBean.setTableName(procedure);
			sqlBean.setInputParameters(args1);
			sqlBean.setOutputParameters(args2);
			if (execute(sqlBean)) {
				return getResult();
			} else {
				return getResult(sqlBean, args2);
			}	
		} catch (Exception e) {
			log.error(e);
			throw new DAOException(this.getClass().getName() + ".callImpl(): " + e.toString());
		}
	}

	public BeanList find(Key kb) throws DAOException {
		Class voCls = getVoClass();
		return findImpl(kb, voCls);
	}

	public Object findByPrimaryKey(Key kb)
		throws ItemNotFoundException, ItemNotUniqueException, DAOException {
		if (EibsCacheAdministrator.isCacheActive()) {
			return findByPrimaryKeyCached(kb);
		} else {
			return findByPrimaryKeyImpl(kb, getVoClass());
		}
	}
	
	protected Object findByPrimaryKeyCached(Key kb, Class voCls)
		throws ItemNotFoundException, ItemNotUniqueException, DAOException {
		// Typical use without fail over
		boolean updated = false;
		Object obj = null;
		String key = (kb == null) ? "" : kb.toString();
		try {
			// Get from the cache
			obj = cadmin.getFromCache(this.getClass().getName(), key);
		} catch (CacheNeedsRefreshException e) {
			try {
				// Get the value
				obj = findByPrimaryKeyImpl(kb, voCls);
				// Store in the cache
				cadmin.putInCache(this.getClass().getName(), key, obj);
				updated = true;
			} finally {
				if (!updated) {
					// It is essential that cancelUpdate is called if the
					// cached content could not be rebuilt
					cadmin.cancelUpdate(
						this.getClass().getName(),
						kb.toString());
				}
			}
		} catch (NoCacheConfiguredException e) {
			// Get the value
			obj = findByPrimaryKeyImpl(kb, voCls);
		}
		return obj;
	}

	protected Object findByPrimaryKeyCached(Key kb)
		throws ItemNotFoundException, ItemNotUniqueException, DAOException {
		return findByPrimaryKeyCached(kb, getVoClass());
	}
	
	public int delete(Key key) throws DAOException {

		try {
			int rt = 0;
			DeleteSqlBean sqlBean = new DeleteSqlBean();
			sqlBean.setTableName(retrieveTableName());
			if (key != null) {
				checkKeyType(key);
				sqlBean.setKey(key);
				sqlBean.setMd(md);
				String sql = prepareSql(sqlBean, key);
				s = cnx.prepareStatement(sql);
				sqlBean.parsePreparedStatement((PreparedStatement) s);
				rt = ((PreparedStatement)s).executeUpdate();
				if (EibsCacheAdministrator.isCacheActive()) {
					cadmin.flushEntry(this.getClass().getName(), key.toString());
				}
			} else {
				s = cnx.createStatement();
				s.execute(sqlBean.prepareStatement());
				rt = s.getUpdateCount();
			}
			return rt;
		} catch (SQLException e) {
			log.error("", new VerboseSqlException(e));
			throw new DAOException(this.getClass().getName() + ".delete(): " + e.toString());
		} catch (Exception e) {
			log.error(e);
			throw new DAOException(this.getClass().getName() + ".delete(): " + e.toString());
		} finally {
			close();
		}
	}

	public int delete() throws DAOException {

		try {
			rs.deleteRow();
			return 1;
		} catch (SQLException e) {
			log.error("", new VerboseSqlException(e));
			throw new DAOException(this.getClass().getName() + ".delete(): " + e.toString());
		} catch (Exception e) {
			log.error(e);
			throw new DAOException(this.getClass().getName() + ".delete(): " + e.toString());
		}
	}

	public void validate(Key keyObj) throws ValidationFailureException {
		try {
			try {
				FunctionSqlBean sqlBean = new FunctionSqlBean();
				sqlBean.setMd(md);
				sqlBean.setKey(keyObj);
				sqlBean.setTableName(retrieveTableName());
				sqlBean.setFunction(FunctionSqlBean.FUNCTION_COUNT);
				String sql = prepareSql(sqlBean, keyObj);
				s = cnx.prepareStatement(sql, ResultSet.TYPE_FORWARD_ONLY,
						ResultSet.CONCUR_READ_ONLY);
				sqlBean.parsePreparedStatement((PreparedStatement) s);

				rs = ((PreparedStatement) s).executeQuery();
				rs.next();
				long found = rs.getLong(1);
				rs.close();
				
				if(found == 0) {
					throw new ItemNotFoundException();
				} else if (found > 1) {
					throw new ItemNotUniqueException();
				} 
			} catch (SQLException e) {
				log.error("", new VerboseSqlException(e));
				throw new DAOException(this.getClass().getName() + ".validate(): " + e.toString());
			} finally {
				close();
			}
		} catch (ItemNotFoundException e) {
			//log.error(e);
			throw new ValidationFailureException(e);
		} catch (ItemNotUniqueException e) {
			//log.error(e);
			throw new ValidationFailureException(e);
		} catch (Exception e) {
			log.error(e);
			throw new ValidationFailureException(e.toString());
		}
	}
	
	public Object newInstance(Class desiredClass) throws DAOException {
		Object object = null;
		
		try {
			object = desiredClass.newInstance();

		} catch (InstantiationException e) {
			throw new DAOException(this.getClass().getName() + ": " + e.toString());
		} catch (IllegalAccessException e) {
			throw new DAOException(this.getClass().getName() + ": " + e.toString());
		} catch (LinkageError e) {
			throw new DAOException(this.getClass().getName() + ": " + e.toString());
		} catch (Exception e) {
			throw new DAOException(this.getClass().getName() + ": " + e.toString());
		}
		return object;
	}

	public Class getVoClass() throws DAOException {
		if (voCls != null) {
			return voCls;
		} else {
			voCls = getClassByName(false);
		}
		return voCls;
	}

	public Class getKeyClass() throws DAOException {
		if (keyCls != null) {
			return keyCls;
		} else {
			keyCls = getClassByName(true);
		}
		return keyCls;
	}

	public void setVoClass(Class cls) {
		voCls = cls;
	}

	public void setKeyClass(Class cls) {
		keyCls = cls;
	}
	
	/**
	 * Initializes the DAO audit related variables. 
	 * This variables are protected fields that can be used 
	 * for setting the proper ValueObjects fields and should be for read only.
	 */
	protected void initAuditVar() {
		TimeData timeData = null;
		if (session != null){
			timeData = session.getTime();
		}
		if (timeData != null && ((""+timeData.intValue()).length()) == 8) {
			year = new BigDecimal(timeData.getYear().toString());
			month = new BigDecimal(timeData.getMonth().toString());
			day = new BigDecimal(timeData.getDay().toString());
		} else {
			year = new BigDecimal(Util.getYear() + "");
			month = new BigDecimal(Util.getMonth() + "");
			day = new BigDecimal(Util.getDay() + "");
		}	
		timestamp = Util.getTimestamp();
	}
	
	/** 
	 * Initializes the Object audit related fields. 
	 * You should override this method on a DAO that needs audition.
	 * @param bean - The Object with the updated data
	 */
	protected void initAuditFields(Object vo) {
	}
	
	protected String retrieveOrderBy() {
		return null;
	}

	public String retrieveTableName() {
		if (getTarget() == null) {
			String className = this.getClass().getName();
			return className.substring(
				className.lastIndexOf('.') + 1,
				className.indexOf(NAME_SUFIX_FOR_DAO));
		} else {
			return getTarget();
		}
	}
	
	/**
	 * Checks the Locking of a Record comparing the locking field values of each object.
	 * Should be abstract but it's actually implemented for compatibility reasons.
	 * @param vo The ValueObject with the updated data
	 * @param dbVo The readed database ValueObject with the data to update
	 * @return 
	 * <li><code>true</code> If the data field compared shows the record has the lock 
	 * <li><code>false</code> If the data field compared shows the record doesn't has the lock 
	 * or the lock couldn't be cheched.
	 */
	protected boolean checkRecordLock(Object vo, Object dbVo) {
		log.debug("checkRecordLock Method Not implemented for DAO : " + this.getClass().getName());
		return true;
	}
	
	/**
	 * Checks the data Locking when a DAO needs Optimistic Locking for a record, 
	 * if needed this method will query the database.  
	 * @param bean The Object with the updated data
	 * @return true If the DAO has the record lock - 
	 * false If the DAO doesn't have the lock
	 * @throws DAOException - When the updated record couldn't be found, 
	 * is not unique, a possible data error or some kind of Exception.
	 */
	private boolean checkRecordLock(Object vo) 
		throws DAOException {
		
		try {
			Key key = (Key) newInstance(getKeyClass());
			BeanCopier.populate(vo, key, false);
			
			Object dbVo = findByPrimaryKey(key);
			return checkRecordLock(vo, dbVo);

		} catch (ItemNotFoundException e) {
			log.error(e);
			throw new DAOException(this.getClass().getName() + ".checkRecordLock(): " + e.toString());
		} catch (ItemNotUniqueException e) {
			log.error(e);
			throw new DAOException(this.getClass().getName() + ".checkRecordLock(): " + e.toString());
		}
	}

	protected int insertImpl(ValueObject bean) throws DAOException {

		try {
			checkVoType(bean);
			InsertSqlBean insertSql = null;
			if (!isResultSetOpen()) {
				insertSql = new InsertSqlBean();
				insertSql.setVo(bean);
				insertSql.setMd(md);
				insertSql.setTableName(retrieveTableName());
				String sql = insertSql.prepareStatement();
				s = cnx.prepareStatement(sql);
				insertSql.parsePreparedStatement((PreparedStatement) s);
				int rt = ((PreparedStatement) s).executeUpdate();
				return rt;
			} else {
				rs.moveToInsertRow();
				insertSql = new InsertSqlBean();
				insertSql.setVo(bean);
				insertSql.updateResultSet(rs);
				rs.insertRow();
				return 1;
			}
		} catch (SQLException e) {
			log.error("", new VerboseSqlException(e));
			throw new DAOException(this.getClass().getName() + ".insertImpl(\n" +
					bean.toString() + "): " + e.toString());
		} catch (Exception e) {
			log.error(e);
			throw new DAOException(this.getClass().getName() + ".insertImpl(\n" +
					bean.toString() + "): " + e.toString());
		} finally {
			if (!isResultSetOpen())
				close();
		}
	}

	protected int insertImpl(String sql, Object[] args) throws DAOException {

		try {
			InsertSqlBean sqlBean = new InsertSqlBean();
			s = cnx.prepareStatement(sql);
			sqlBean.parsePreparedStatement((PreparedStatement) s, args);
			int rt = ((PreparedStatement) s).executeUpdate();
			return rt;
		} catch (SQLException e) {
			log.error("", new VerboseSqlException(e));
			throw new DAOException(this.getClass().getName() + ".insertImpl(\n" +
					args.toString() + "): " + e.toString());
		} catch (Exception e) {
			log.error(e);
			throw new DAOException(this.getClass().getName() + ".insertImpl(\n" +
					args.toString() + "): " + e.toString());
		} finally {
			close();
		}
	}
	
	public int insert(ValueObject vo) throws DAOException {
		initAuditFields(vo);
		return insertImpl(vo);
	}
	
	public int insertList(BeanList list) throws DAOException {

		int row = 0;
		PreparedStatement ps = null;
		try {
			boolean batchProcess = true;
			boolean firstTime = true;
			list.initRow();
			while (list.getNextRow()) {
				row = list.getCurrentRow() + 1;
				ValueObject bean = (ValueObject) list.getRecord();
				checkVoType(bean);
				InsertSqlBean sqlBean = new InsertSqlBean();
				sqlBean.setVo(bean);
				sqlBean.setMd(md);
				sqlBean.setTableName(retrieveTableName());
				String sql = sqlBean.prepareStatement();
				initAuditFields(bean);
				
				if (firstTime) {
					firstTime = false;
					ps = cnx.prepareStatement(sql);
					s = ps;
					sqlBean.parsePreparedStatement(ps);
					try {
						ps.addBatch();
					} catch (BatchUpdateException e) {
						//The JDBC Driver does't seems to implement Batch commands
						batchProcess = false;
						ps.executeUpdate();
					}
				} else {
					sqlBean.parsePreparedStatement(ps);
					if (batchProcess) {
						ps.addBatch();
					} else {
						ps.executeUpdate();
					}
				}
				if (batchProcess) {
					//Just a fixed number of rows at ones
					if (row%MAX_ROW_RESULT == 0 || row == list.size()) 
						ps.executeBatch();
				}
			} 
		
		} catch (BatchUpdateException e) {
			if (Statement.EXECUTE_FAILED != e.getUpdateCounts()[0])
				row = e.getUpdateCounts()[0];
			log.error("", new VerboseSqlException(e));
			throw new DAOException(this.getClass().getName() + ".insertList(): " + e.toString());
		} catch (SQLException e) {
			log.error("", new VerboseSqlException(e));
			throw new DAOException(this.getClass().getName() + ".insertList(): " + " Inserting row number " + row);
		} catch (Exception e) {
			log.error(e);
			throw new DAOException(this.getClass().getName() + ".insertList(): " + e.toString());
		} finally {
			close();
		}
		return row;
	}

	protected int updateImpl(ValueObject vo, Key key) throws DAOException {

		try {
			checkKeyType(key);
			checkVoType(vo);
			UpdateSqlBean sqlBean = new UpdateSqlBean();
			sqlBean.setMd(md);
			sqlBean.setKey(key);
			sqlBean.setVo(vo);
			sqlBean.setTableName(retrieveTableName());
			String sql = prepareSql(sqlBean, key);
			s = cnx.prepareStatement(sql);
			sqlBean.parsePreparedStatement((PreparedStatement) s);
			int rt = ((PreparedStatement) s).executeUpdate();
			if (EibsCacheAdministrator.isCacheActive()) {
				cadmin.flushEntry(this.getClass().getName(), key.toString());
			}
			return rt;
		} catch (SQLException e) {
			log.error("", new VerboseSqlException(e));
			throw new DAOException(this.getClass().getName() + ".updateImpl(): " + e.toString());
		} catch (Exception e) {
			log.error(e);
			throw new DAOException(this.getClass().getName() + ".updateImpl(): " + e.toString());
		} finally {
			close();
		}
	}

	protected int updateImpl(String sql, Object[] args) throws DAOException {

		try {
			UpdateSqlBean sqlBean = new UpdateSqlBean();
			s = cnx.prepareStatement(sql);
			sqlBean.parsePreparedStatement((PreparedStatement) s, args);
			int rt = ((PreparedStatement) s).executeUpdate();
			return rt;
		} catch (SQLException e) {
			log.error("", new VerboseSqlException(e));
			throw new DAOException(this.getClass().getName() + ".updateImpl(): " + e.toString());
		} catch (Exception e) {
			log.error(e);
			throw new DAOException(this.getClass().getName() + ".updateImpl(): " + e.toString());
		} finally {
			close();
		}
	}	

	protected int updateImpl(ValueObject vo) throws DAOException {

		try {
			checkVoType(vo);
			UpdateSqlBean updateSql = new UpdateSqlBean();
			updateSql.setVo(vo);
			rs.moveToCurrentRow();
			updateSql.updateResultSet(rs);
			rs.updateRow();
			return 1;
		} catch (SQLException e) {
			log.error("", new VerboseSqlException(e));
			throw new DAOException(this.getClass().getName() + ".updateImpl(): " + e.toString());
		} catch (Exception e) {
			log.error(e);
			throw new DAOException(this.getClass().getName() + ".updateImpl(): " + e.toString());
		}
	}

	public int update(ValueObject vo) throws ItemUpdatedByAnotherUser,
			DAOException {
		if (!isResultSetOpen()) {
			if (!checkRecordLock(vo)) {
				throw new ItemUpdatedByAnotherUser(
						EXCEPTION_ITEM_UPDATE_BY_ANOTHER_USER);
			}
			Key key = (Key) newInstance(getKeyClass());
			BeanCopier.populate(vo, key, false);
			initAuditFields(vo);
			return updateImpl(vo, key);
		} else {
			initAuditFields(vo);
			return updateImpl(vo);
		}
	}

	protected int deleteImpl(String sql, Object[] args) throws DAOException {

		try {
			DeleteSqlBean sqlBean = new DeleteSqlBean();
			s = cnx.prepareStatement(sql);
			sqlBean.parsePreparedStatement((PreparedStatement) s, args);
			int rt = ((PreparedStatement) s).executeUpdate();
			return rt;
		} catch (SQLException e) {
			log.error("", new VerboseSqlException(e));
			throw new DAOException(this.getClass().getName() + ".deleteImpl(): " + e.toString());
		} catch (Exception e) {
			log.error(e);
			throw new DAOException(this.getClass().getName() + ".deleteImpl(): " + e.toString());
		} finally {
			close();
		}
	}

	protected BeanList find(String sql, Object[] args) throws DAOException {
		Class voCls = getVoClass();
		return findImpl(sql, args, voCls);

	}

	protected Object findByPrimaryKey(String sql, Object[] args)
		throws DAOException, ItemNotFoundException, ItemNotUniqueException {
		Class voCls = getVoClass();
		return findByPrimaryKeyImpl(voCls, sql, args);
	}

	protected void validate(String sql, Object[] args)
		throws ValidationFailureException {

		try {
			Class keyCls = getKeyClass();
			findByPrimaryKeyImpl(keyCls, sql, args);
		} catch (DAOException e) {
			log.error(e);
			throw new ValidationFailureException(e.toString());
		} catch (ItemNotFoundException e) {
			log.error(e);
			throw new ValidationFailureException(e.toString());
		} catch (ItemNotUniqueException e) {
			log.error(e);
			throw new ValidationFailureException(e.toString());
		}

	}

	/**
	 * Checks if the related Resulset has more rows. You need to make a call to
	 * this method prior to call findNext. This method is a wrapper to
	 * ResultSet.next()
	 * 
	 * @return <code>true</code> if there are more rows; <code>false</code>
	 *         if there are no more rows
	 * @throws DAOException
	 *             if a database access error occurs
	 */
	public boolean hasNext() throws DAOException {
		try {
			foundRecord = rs.next();
			return foundRecord;
		} catch (SQLException e) {
			log.error("", new VerboseSqlException(e));
			throw new DAOException(this.getClass().getName() + ".hasNext(): " + e.toString());
		}
	}
	
	/**
	 * Checks if the related Resulset has more previous rows. You need to make a call to
	 * this method prior to call findPrevious. This method is a wrapper to
	 * ResultSet.previous()
	 * 
	 * @return <code>true</code> if there are more rows; <code>false</code>
	 *         if there are no more rows
	 * @throws DAOException
	 *             if a database access error occurs
	 */
	public boolean hasPrevious() throws DAOException {
		try {
			if (!foundRecord) 
				rs.afterLast();	
			foundRecord = rs.previous();
			return foundRecord;
		} catch (SQLException e) {
			log.error("", new VerboseSqlException(e));
			throw new DAOException(this.getClass().getName() + ".hasPrevious(): " + e.toString());
		}
	}

	/**
	 * @return The next record ValueObject. You must make a call to hasNext
	 *         before making a call to this method
	 * @throws ItemNotFoundException
	 *             If no record is found
	 * @throws DAOException
	 *             if a database access error occurs
	 */
	public Object findNext(Object vo) throws ItemNotFoundException, DAOException {
		if (foundRecord) {
			try {
				BeanParser bp = new BeanParser(vo);
				bp.parseResultSet(rMd, rs);
				if (foundRecords == null) {
					foundRecords = new BeanList();
				} else {
					foundRecords.init();
				}
				foundRecords.addRow(vo);
				return vo;
			} catch (Exception e) {
				throw new DAOException(this.getClass().getName() + ".findNext(): " + e.toString());
			}
		} else {
			throw new ItemNotFoundException();
		}
	}
	
	/**
	 * @return The next record ValueObject. You must make a call to hasNext
	 *         before making a call to this method
	 * @throws ItemNotFoundException
	 *             If no record is found
	 * @throws DAOException
	 *             if a database access error occurs
	 */
	public Object findNext() throws ItemNotFoundException, DAOException {
		if (foundRecord) {
			try {
				Object vo = voCls.newInstance();
				BeanParser bp = new BeanParser(vo);
				bp.parseResultSet(rMd, rs);
				if (foundRecords == null) {
					foundRecords = new BeanList();
				} else {
					foundRecords.init();
				}
				foundRecords.addRow(vo);
				return vo;
			} catch (Exception e) {
				throw new DAOException(this.getClass().getName() + ".findNext(): " + e.toString());
			}
		} else {
			throw new ItemNotFoundException();
		}
	}
	
	/**
	 * @return The previous record ValueObject. You must make a call to hasPrevious
	 *         before making a call to this method
	 * @throws ItemNotFoundException
	 *             If no record is found
	 * @throws DAOException
	 *             if a database access error occurs
	 */
	public Object findPrevious() throws ItemNotFoundException, DAOException {
		return findNext();
	}

	public Object findFirst(String sql, Object[] args) throws DAOException,
			ItemNotFoundException {
		try {
			SelectSqlBean sqlBean = new SelectSqlBean();
			sqlBean.setMd(md);
			sqlBean.setVoClass(getVoClass());
			s = cnx.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_UPDATABLE);
			if (args != null)
				sqlBean.parsePreparedStatement((PreparedStatement) s, args);

			s.setMaxRows(maxRows);
			rs = ((PreparedStatement) s).executeQuery();
			rMd = rs.getMetaData();

		} catch (SQLException e) {
			log.error("", new VerboseSqlException(e));
			throw new DAOException(this.getClass().getName() + ".findFirst(): " + e.toString());
		} catch (Exception e) {
			log.error(e);
			throw new DAOException(this.getClass().getName() + ".findFirst(): " + e.toString());
		}
		hasNext();
		return findNext();
	}
	
	/**
	 * @param kb
	 *            The Key object match the where clause of an SQL Statement
	 * @return The first record of the query performed
	 * @throws ItemNotFoundException
	 *             If no record is found
	 * @throws DAOException
	 *             if a database access error occurs
	 */
	public void openResultSet(Key kb, boolean readOnly) throws DAOException {
		try {
			if (isResultSetOpen()) 
				close();
			checkKeyType(kb);
			SelectSqlBean sqlBean = new SelectSqlBean();
			sqlBean.setMd(md);
			sqlBean.setKey(kb);
			sqlBean.setVoClass(getVoClass());
			sqlBean.setTableName(retrieveTableName());
			String sql = prepareSql(sqlBean, kb);
			int mode = readOnly ? ResultSet.CONCUR_READ_ONLY : ResultSet.CONCUR_UPDATABLE ;
			s = cnx.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, mode );
			if (kb != null)
				parsePreparedStatement((PreparedStatement) s, sqlBean, null);

			s.setMaxRows(maxRows);
			rs = ((PreparedStatement) s).executeQuery();
			rMd = rs.getMetaData();

		} catch (SQLException e) {
			log.error("", new VerboseSqlException(e));
			throw new DAOException(this.getClass().getName() + ".openResultSet(): " + e.toString());
		} catch (Exception e) {
			log.error(e);
			throw new DAOException(this.getClass().getName() + ".openResultSet(): " + e.toString());
		}
	}

	/**
	 * @param kb
	 *            The Key object match the where clause of an SQL Statement
	 * @return The first record of the query performed
	 * @throws ItemNotFoundException
	 *             If no record is found
	 * @throws DAOException
	 *             if a database access error occurs
	 */
	public void openResultSet(Key kb) throws DAOException {
		openResultSet(kb, false);
	}

	private BeanList findImpl(Key kb, Class voCls) throws DAOException {

		try {
			checkKeyType(kb);
			SelectSqlBean sqlBean = new SelectSqlBean();
			sqlBean.setMd(md);
			sqlBean.setKey(kb);
			sqlBean.setVoClass(voCls);
			sqlBean.setTableName(retrieveTableName());
			// sqlBean.setOrderBy(retrieveOrderBy());
			String sql = prepareSql(sqlBean, kb);
			s = cnx.prepareStatement(sql, ResultSet.TYPE_FORWARD_ONLY,
					ResultSet.CONCUR_READ_ONLY);
			if (kb != null)
				sqlBean.parsePreparedStatement((PreparedStatement) s);

			s.setMaxRows(MAX_ROW_RESULT);
			rs = ((PreparedStatement) s).executeQuery();
			rMd = rs.getMetaData();

			foundRecords = new BeanList();
			while (rs.next()) {
				Object vo = voCls.newInstance();
				BeanParser bp = new BeanParser(vo);
				bp.parseResultSet(rMd, rs);
				foundRecords.addRow(vo);
			}
			return foundRecords;
		} catch (SQLException e) {
			log.error("", new VerboseSqlException(e));
			throw new DAOException(this.getClass().getName() + ".findImpl(): " + e.toString());
		} catch (Exception e) {
			log.error(e);
			throw new DAOException(this.getClass().getName() + ".findImpl(): " + e.toString());
		} finally {
			close();
		}
	}

	private BeanList findImpl(String sql, Object[] args, Class voCls)
			throws DAOException {
		try {
			SelectSqlBean sqlBean = new SelectSqlBean();
			s = cnx.prepareStatement(sql, ResultSet.TYPE_FORWARD_ONLY,
					ResultSet.CONCUR_READ_ONLY);
			sqlBean.parsePreparedStatement((PreparedStatement) s, args);

			s.setMaxRows(MAX_ROW_RESULT);
			rs = ((PreparedStatement) s).executeQuery();
			rMd = rs.getMetaData();

			foundRecords = new BeanList();
			while (rs.next()) {
				Object vo = voCls.newInstance();
				BeanParser bp = new BeanParser(vo);
				bp.parseResultSet(rMd, rs);
				foundRecords.addRow(vo);
			}
			return foundRecords;
		} catch (SQLException e) {
			log.error("", new VerboseSqlException(e));
			throw new DAOException(this.getClass().getName() + ".findImpl(): " + e.toString());
		} catch (Exception e) {
			log.error(e);
			throw new DAOException(this.getClass().getName() + ".findImpl(): " + e.toString());
		} finally {
			close();
		}
	}

	private Object findByPrimaryKeyImpl(Key kb, Class cls)
		throws ItemNotFoundException, ItemNotUniqueException, DAOException {

		BeanList list = findImpl(kb, cls);

		if (list.isEmpty()) {
			throw (new ItemNotFoundException(
					"On : " + this.getClass().getName()));
		}

		if (!list.isUnique()) {
			throw (new ItemNotUniqueException(EXCEPTION_NOT_UNIQUE_VALUE
					+ "\nOn : " + this.getClass().getName() 
					+ "\nUsing : " + kb.toString()));
		}

		list.initRow();
		list.getNextRow();
		Object vo = list.getRecord();

		return vo;
	}

	private Object findByPrimaryKeyImpl(Class cls, String sql, Object[] args)
		throws DAOException, ItemNotFoundException, ItemNotUniqueException {

		BeanList list = findImpl(sql, args, cls);

		if (list.isEmpty()) {
			throw (new ItemNotFoundException(
					"On : " + this.getClass().getName()));
		}

		if (!list.isUnique()) {
			throw (new ItemNotUniqueException(EXCEPTION_NOT_UNIQUE_VALUE
					+ "\nOn : " + this.getClass().getName() 
					+ "\nUsing : " + (args == null ? "" : Arrays.asList(args).toString())));
		}

		list.initRow();
		list.getNextRow();
		Object vo = list.getRecord();

		return vo;
	}

	protected void checkKeyType(Key key) throws DAOException {
		Class keyCls = getKeyClass();
		checkObjType(key, keyCls);
	}

	protected void checkVoType(ValueObject vo) throws DAOException {
		Class voCls = getVoClass();
		checkObjType(vo, voCls);
	}

	private void checkObjType(Object obj, Class cls) throws DAOException {
		if (obj != null
			&& !(obj.getClass().isAssignableFrom(cls)
				|| cls.isInstance(obj))) {
			throw new DAOException(EXCEPTION_INCOMPATIBLE_TYPES);
		}
	}

	private Class getClassByName(boolean isKey) throws DAOException {

		String className = this.getClass().getName();

		className =
			Util.replaceString(
				className,
				PACKAGE_NAME_FOR_DAO,
				((isKey) ? (PACKAGE_NAME_FOR_KEY) : (PACKAGE_NAME_FOR_VO)));

		className =
			Util.replaceString(className, NAME_SUFIX_FOR_DAO, ((isKey) ? (NAME_SUFIX_FOR_KEY) : ("")));

		try {
			return Class.forName(className);
		} catch (ClassNotFoundException e) {
			log.error(e);
			throw new DAOException(this.getClass().getName() + ": " + e.toString());
		} catch (Exception e) {
			log.error(e);
			throw new DAOException(this.getClass().getName() + ": " + e.toString());
		}
	}

	protected MDSuper getMdByName() throws DAOException {

		String className = this.getClass().getName();

		className = Util.replaceString(className, PACKAGE_NAME_FOR_DAO, PACKAGE_NAME_FOR_MD);

		className = Util.replaceString(className, NAME_SUFIX_FOR_DAO, NAME_SUFIX_FOR_MD);

		MDSuper md = null;

		try {
			Class cls = Class.forName(className);
			// Method m = cls.getMethod("getInstance", null);
			// md = (MDSuper) m.invoke(null, null);
			// TODO review for optimal solution
			md = (MDSuper) cls.newInstance();
		} catch (InstantiationException e) {
			log.debug(e);
		} catch (IllegalAccessException e) {
			log.debug(e);
		} catch (ClassNotFoundException e) {
			log.debug(e);
		} catch (Exception e) {
			log.error(e);
			throw new DAOException(this.getClass().getName() + ": " + e.toString());
		}

		return md;
	}
	
	/*
	 * (non-Javadoc)
	 * 
	 * @see com.datapro.eibs.access.DISuper#close()
	 */
	public void close() {
		try {
			if (s != null) {
				s.close();
			}
		} catch (SQLException e) {
			log.error(e);
		} finally {
			s = null;
			rs = null;
			rMd = null;
		}
	}
	
	protected boolean isResultSetOpen() {
		return rs != null;
	}

	/**
	 * @return A BeanList for the last found records or a ValueObject if the result is just one record.
	 * We are holding the results of the findImpl for fearther use if needed.
	 */
	public Object getLastFound() {

		if (foundRecords == null || foundRecords.isEmpty()) 
			return null;

		if (foundRecords.isUnique()) {
			foundRecords.initRow();
			foundRecords.getNextRow();
			return foundRecords.getRecord();
		} else {
			return foundRecords;
		}
	}
	
	public boolean needsMonitor() {
		return needsMonitor;
	}
}
