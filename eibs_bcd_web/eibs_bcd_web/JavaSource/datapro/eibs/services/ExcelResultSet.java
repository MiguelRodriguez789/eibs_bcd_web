package datapro.eibs.services;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.io.StringReader;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.Array;
import java.sql.Blob;
import java.sql.Clob;
import java.sql.Date;
import java.sql.NClob;
import java.sql.Ref;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.RowId;
import java.sql.SQLException;
import java.sql.SQLWarning;
import java.sql.SQLXML;
import java.sql.Statement;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Iterator;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class ExcelResultSet implements ResultSet, ExcelTypes {
	
	private int ROW_READED 		= 0;
	
	private int ROW_INSERTED 	= 1;
	
	private int ROW_UPDATED 	= 2;
	
	private int ROW_DELETED 	= 3;
	
	private HSSFWorkbook workBook = null;
	
	private HSSFSheet sheet = null;
	
	protected String[] fields = {};
	
	protected String[] types = {};
	
	private int cursor = 0;
	
	private String schema = "";
	
	private String table = "";
	
	private HSSFRow record = null;
	
	private int action = CONCUR_READ_ONLY;
	
	private SQLWarning warnings = null; 
	
	public ExcelResultSet(InputStream xls, int sheet) throws IOException {
		super();
		this.workBook = new HSSFWorkbook(xls);
		this.table = workBook.getSheetName(sheet);
		this.sheet = workBook.getSheetAt(sheet);
		this.fields = getFields();
		this.types = getTypes();
	}

	public ExcelResultSet(String xlsfile, int sheet) throws IOException {
		try {
			File file = new File(xlsfile);
			FileInputStream xls = new FileInputStream(file);
			HSSFWorkbook workBook = new HSSFWorkbook(xls);
			this.schema = xlsfile;
			this.table = workBook.getSheetName(sheet);
			this.sheet = workBook.getSheetAt(sheet);
			this.fields = getFields();
			this.types = getTypes();
		} catch (FileNotFoundException e) {
			System.out.println("File not found: " + xlsfile);
			throw new IOException(e.toString());
		}
	}

	public ExcelResultSet(HSSFWorkbook workBook, int sheet) throws IOException {
		super();
		this.table = workBook.getSheetName(sheet);
		this.sheet = workBook.getSheetAt(sheet);
		this.fields = getFields();
		this.types = getTypes();
	}

	private String[] getFields() {
		HSSFRow row = sheet.getRow(sheet.getFirstRowNum());
		String[] result = new String[row.getPhysicalNumberOfCells()];
		Iterator cells = row.cellIterator();
		while (cells.hasNext()) {
			HSSFCell cell = (HSSFCell) cells.next();
			result[cell.getColumnIndex()] = cell.getRichStringCellValue().getString();
		}
		return result;
	}

	private String[] getTypes() {
		HSSFRow row = sheet.getRow(sheet.getFirstRowNum() + 1);
		String[] result = new String[sheet.getRow(sheet.getFirstRowNum()).getPhysicalNumberOfCells()];
		for (int cellnum = 0; cellnum < result.length; cellnum++) {
			HSSFCell cell = row.getCell(cellnum) == null ? sheet.getRow(sheet.getFirstRowNum()).getCell(cellnum) : row.getCell(cellnum);
			switch (cell.getCellType()) {
				case HSSFCell.CELL_TYPE_BLANK:
					result[cell.getColumnIndex()] = BLANK;
					break;
				case HSSFCell.CELL_TYPE_BOOLEAN:
					result[cell.getColumnIndex()] = BOOLEAN;
					break;
				case HSSFCell.CELL_TYPE_ERROR:
					result[cell.getColumnIndex()] = ERROR;
					break;
				case HSSFCell.CELL_TYPE_FORMULA:
					result[cell.getColumnIndex()] = FORMULA;
					break;
				case HSSFCell.CELL_TYPE_NUMERIC:
					if (HSSFDateUtil.isCellDateFormatted(cell)) {
						result[cell.getColumnIndex()] = DATE;
					} else if (cell.getCellStyle().getDataFormat() == TEXT_FORMAT) {
						result[cell.getColumnIndex()] = STRING;
					} else {
						result[cell.getColumnIndex()] = NUMERIC;
					}
					break;
				default:
					result[cell.getColumnIndex()] = STRING;
					break;
			}
		}
		return result;
	}
	
	public void init() {
		cursor = sheet.getFirstRowNum() + 1;
	}
	
	public boolean absolute(int row) throws SQLException {
		if (row > sheet.getFirstRowNum() && row < sheet.getLastRowNum()) {
			cursor = row;
			return true;
		} else {
			return false;
		}	
	}

	public void afterLast() throws SQLException {
		cursor = sheet.getLastRowNum() - 1;
	}

	public void beforeFirst() throws SQLException {
		cursor = sheet.getFirstRowNum();
	}

	public void cancelRowUpdates() throws SQLException {
		// TODO Auto-generated method stub
		
	}

	public void clearWarnings() throws SQLException {
		this.warnings = null;
	}

	public void close() throws SQLException {
		// TODO Auto-generated method stub
	}

	public void deleteRow() throws SQLException {
		if (action == ROW_READED) {
			if (cursor > sheet.getFirstRowNum()) {
				HSSFRow row = sheet.getRow(cursor--);
				sheet.removeRow(row);
				action = ROW_DELETED;
			}
		}
	}

	public int findColumn(String columnName) throws SQLException {
		int result = -1;
		for (int i = 0; i < fields.length; i++) {
			if (fields[i].toUpperCase().trim().equals(columnName)) {
				result = i;
				break;
			}
		}
		return result;
	}

	public boolean first() throws SQLException {
		init();
		return next();
	}

	public Array getArray(int i) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	public Array getArray(String colName) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	public InputStream getAsciiStream(int columnIndex) throws SQLException {
		return getAsciiStream(fields[columnIndex]); 
	}

	public InputStream getAsciiStream(String columnName) throws SQLException {
		try {
			return new ByteArrayInputStream(getString(columnName).getBytes("UTF-8"));
		} catch (UnsupportedEncodingException e) {
			throw new SQLException(e.getClass().getName() + ": " + e.getMessage());
		} 
	}

	public BigDecimal getBigDecimal(int columnIndex) throws SQLException {
		HSSFCell cell = record.getCell(columnIndex);
		if (cell == null) {
			return  new BigDecimal("0.00");
		} else if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
			return new BigDecimal(cell.getNumericCellValue()); 
		} else if (cell.getCellType() == HSSFCell.CELL_TYPE_BOOLEAN) {
			return null;
		} else if (cell.getCellType() == HSSFCell.CELL_TYPE_ERROR) {
			return new BigDecimal(cell.getErrorCellValue());
		} else if (cell.getCellType() == HSSFCell.CELL_TYPE_FORMULA) {
			try {
				BigDecimal result = null;
				switch (cell.getCachedFormulaResultType()) {
				case HSSFCell.CELL_TYPE_NUMERIC:
					result = new BigDecimal(cell.getNumericCellValue());
					break;
				case HSSFCell.CELL_TYPE_BOOLEAN:
					result = null;
					break;
				case HSSFCell.CELL_TYPE_ERROR:
					result = new BigDecimal(cell.getErrorCellValue());
					break;
	
				default:
					result = new BigDecimal(cell.getRichStringCellValue().getString());
					break;
				}
				return result;
			} catch (Exception e) {
				return null;
			}	
		} else {
			try {
				return new BigDecimal(cell.getRichStringCellValue().getString());
			} catch (Exception e) {
				return null;
			}	
		}
	}

	public BigDecimal getBigDecimal(String columnName) throws SQLException {
		return getBigDecimal(findColumn(columnName));
	}

	public BigDecimal getBigDecimal(int columnIndex, int scale)
			throws SQLException {
		BigInteger number = new BigInteger(getString(columnIndex));
		return new BigDecimal(number, scale);
	}

	public BigDecimal getBigDecimal(String columnName, int scale)
			throws SQLException {
		return getBigDecimal(findColumn(columnName), scale);
	}

	public InputStream getBinaryStream(int columnIndex) throws SQLException {
		return new ByteArrayInputStream(getString(columnIndex).getBytes());
	}

	public InputStream getBinaryStream(String columnName) throws SQLException {
		return getBinaryStream(findColumn(columnName));
	}

	public Blob getBlob(int i) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	public Blob getBlob(String colName) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	public boolean getBoolean(int columnIndex) throws SQLException {
		HSSFCell cell = record.getCell(columnIndex);
		return cell.getBooleanCellValue();
	}

	public boolean getBoolean(String columnName) throws SQLException {
		return getBoolean(findColumn(columnName));
	}

	public byte getByte(int columnIndex) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	public byte getByte(String columnName) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	public byte[] getBytes(int columnIndex) throws SQLException {
		return getString(columnIndex).getBytes();
	}

	public byte[] getBytes(String columnName) throws SQLException {
		return getBytes(findColumn(columnName));
	}

	public Reader getCharacterStream(int columnIndex) throws SQLException {
		return new StringReader(getString(columnIndex));
	}

	public Reader getCharacterStream(String columnName) throws SQLException {
		return getCharacterStream(findColumn(columnName));
	}

	public Clob getClob(int i) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	public Clob getClob(String colName) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	public int getConcurrency() throws SQLException {
		return CONCUR_UPDATABLE;
	}

	public String getCursorName() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	public Date getDate(int columnIndex) throws SQLException {
		HSSFCell cell = record.getCell(columnIndex);
		if (cell == null) {
			return new Date(Calendar.getInstance().getTimeInMillis());
		} else {
			return new Date(cell.getDateCellValue().getTime());
		}
	}

	public Date getDate(String columnName) throws SQLException {
		return getDate(findColumn(columnName));
	}

	public Date getDate(int columnIndex, Calendar cal) throws SQLException {
		Date date = getDate(columnIndex);
		cal.setTime(date);
		return new Date(cal.getTime().getTime());
	}

	public Date getDate(String columnName, Calendar cal) throws SQLException {
		return getDate(findColumn(columnName), cal);
	}

	public double getDouble(int columnIndex) throws SQLException {
		HSSFCell cell = record.getCell(columnIndex);
		return cell == null ? 0.00 : cell.getNumericCellValue();
	}

	public double getDouble(String columnName) throws SQLException {
		return getDouble(findColumn(columnName));
	}

	public int getFetchDirection() throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	public int getFetchSize() throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	public float getFloat(int columnIndex) throws SQLException {
		HSSFCell cell = record.getCell(columnIndex);
		return cell == null ? (float) 0.00 : (float) cell.getNumericCellValue();
	}

	public float getFloat(String columnName) throws SQLException {
		return getFloat(findColumn(columnName));
	}

	public int getInt(int columnIndex) throws SQLException {
		HSSFCell cell = record.getCell(columnIndex);
		return cell == null ? 0 : (int) cell.getNumericCellValue();
	}

	public int getInt(String columnName) throws SQLException {
		return getInt(findColumn(columnName));
	}

	public long getLong(int columnIndex) throws SQLException {
		HSSFCell cell = record.getCell(columnIndex);
		return cell == null ? 0 : (long) cell.getNumericCellValue();
	}

	public long getLong(String columnName) throws SQLException {
		return getLong(findColumn(columnName));
	}

	public ResultSetMetaData getMetaData() throws SQLException {
		
		class ResultSetMetaData implements java.sql.ResultSetMetaData {
			
			public String getCatalogName(int column) throws SQLException  {
				// TODO Auto-generated method stub
				return null;
			}

			public String getColumnClassName(int column) throws SQLException  {
				String type = getColumnTypeName(column);
				if (type.equals(BOOLEAN)) {
					return "boolean";
				} else if (type.equals(STRING)) {
					return "java.lang.String";
				} else if (type.equals(NUMERIC)) {
					return "java.math.BigDecimal";
				} else if (type.equals(DATE)) {
					return "java.sql.Date";
				} else {
					return "";
				}	
			}

			public int getColumnCount() throws SQLException  {
				return fields.length;
			}

			public int getColumnDisplaySize(int column) throws SQLException  {
				return sheet.getColumnWidth(column);
			}

			public String getColumnLabel(int column) throws SQLException  {
				return getColumnName(column);
			}

			public String getColumnName(int column) throws SQLException  {
				return fields[column];
			}

			public int getColumnType(int column) throws SQLException  {
				String type = getColumnTypeName(column);
				
				if (type.equals(BOOLEAN)) {
					return java.sql.Types.BOOLEAN;
				} else if (type.equals(DATE)) {
					return java.sql.Types.DATE;
				} else if (type.equals(NUMERIC)) {
					return java.sql.Types.NUMERIC;
				} else if (type.equals(STRING)) {
					return java.sql.Types.VARCHAR;
				} else {
					return java.sql.Types.NULL;
				}	
			}

			public String getColumnTypeName(int column) throws SQLException  {
				return types[column];
			}

			public int getPrecision(int column) throws SQLException  {
				// TODO Auto-generated method stub
				return 0;
			}

			public int getScale(int column) throws SQLException  {
				// TODO Auto-generated method stub
				return 0;
			}

			public String getSchemaName(int column) throws SQLException  {
				// TODO Auto-generated method stub
				return null;
			}

			public String getTableName(int column) throws SQLException  {
				return table;
			}

			public boolean isAutoIncrement(int column) throws SQLException  {
				// TODO Auto-generated method stub
				return false;
			}

			public boolean isCaseSensitive(int column) throws SQLException  {
				// TODO Auto-generated method stub
				return false;
			}

			public boolean isCurrency(int column) throws SQLException  {
				// TODO Auto-generated method stub
				return false;
			}

			public boolean isDefinitelyWritable(int column) throws SQLException  {
				// TODO Auto-generated method stub
				return false;
			}

			public int isNullable(int column) throws SQLException  {
				// TODO Auto-generated method stub
				return 0;
			}

			public boolean isReadOnly(int column) throws SQLException  {
				// TODO Auto-generated method stub
				return false;
			}

			public boolean isSearchable(int column) throws SQLException  {
				// TODO Auto-generated method stub
				return false;
			}

			public boolean isSigned(int column) throws SQLException  {
				// TODO Auto-generated method stub
				return false;
			}

			public boolean isWritable(int column) throws SQLException  {
				// TODO Auto-generated method stub
				return false;
			}

			public boolean isWrapperFor(Class arg0) throws SQLException {
				// TODO Auto-generated method stub
				return false;
			}

			public Object unwrap(Class arg0) throws SQLException {
				// TODO Auto-generated method stub
				return null;
			}
			
		}
		
		return new ResultSetMetaData();
	}

	public Object getObject(int columnIndex) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	public Object getObject(String columnName) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	public Ref getRef(int i) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	public Ref getRef(String colName) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	public int getRow() throws SQLException {
		return cursor;
	}

	public short getShort(int columnIndex) throws SQLException {
		HSSFCell cell = record.getCell(columnIndex);
		return (short) cell.getNumericCellValue();
	}

	public short getShort(String columnName) throws SQLException {
		return getShort(findColumn(columnName));
	}

	public Statement getStatement() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	public String getString(int columnIndex) throws SQLException {
		HSSFCell cell = record.getCell(columnIndex);
		if (cell == null) {
			return "";
		} else if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
			BigDecimal number = new BigDecimal(cell.getNumericCellValue());
			return  number.toString(); 
		} else if (cell.getCellType() == HSSFCell.CELL_TYPE_BOOLEAN) {
			return cell.getBooleanCellValue() ? "true" : "false";
		} else if (cell.getCellType() == HSSFCell.CELL_TYPE_ERROR) {
			return "" + cell.getErrorCellValue();
		} else if (cell.getCellType() == HSSFCell.CELL_TYPE_FORMULA) {
			String result = "";
			switch (cell.getCachedFormulaResultType()) {
			case HSSFCell.CELL_TYPE_NUMERIC:
				BigDecimal number = new BigDecimal(cell.getNumericCellValue());
				result = number.toString();
				break;
			case HSSFCell.CELL_TYPE_BOOLEAN:
				result = cell.getBooleanCellValue() ? "true" : "false";
				break;
			case HSSFCell.CELL_TYPE_ERROR:
				result = "" + cell.getErrorCellValue();
				break;

			default:
				result = cell.getRichStringCellValue().getString();
				break;
			}
			return result;
		} else {
			return cell.getRichStringCellValue().getString();
		}
	}

	public String getString(String columnName) throws SQLException {
		return getString(findColumn(columnName));
	}

	public Time getTime(int columnIndex) throws SQLException {
		HSSFCell cell = record.getCell(columnIndex);
		return new Time(cell.getDateCellValue().getTime());
	}

	public Time getTime(String columnName) throws SQLException {
		return getTime(findColumn(columnName));
	}

	public Time getTime(int columnIndex, Calendar cal) throws SQLException {
		Time time = getTime(columnIndex);
		cal.setTime(time);
		return new Time(cal.getTime().getTime());
	}

	public Time getTime(String columnName, Calendar cal) throws SQLException {
		return getTime(findColumn(columnName), cal);
	}

	public Timestamp getTimestamp(int columnIndex) throws SQLException {
		HSSFCell cell = record.getCell(columnIndex);
		return new Timestamp(cell.getDateCellValue().getTime());
	}

	public Timestamp getTimestamp(String columnName) throws SQLException {
		return getTimestamp(findColumn(columnName));
	}

	public Timestamp getTimestamp(int columnIndex, Calendar cal)
			throws SQLException {
		Timestamp time = getTimestamp(columnIndex);
		cal.setTime(time);
		return new Timestamp(cal.getTime().getTime());
	}

	public Timestamp getTimestamp(String columnName, Calendar cal)
			throws SQLException {
		return getTimestamp(findColumn(columnName), cal);
	}

	public int getType() throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	public URL getURL(int columnIndex) throws SQLException {
		HSSFCell cell = record.getCell(columnIndex);
		URL url;
		try {
			url = new URL(cell.getHyperlink().getAddress());
		} catch (MalformedURLException e) {
			url = null;
			e.printStackTrace();
		} 
		return url;
	}

	public URL getURL(String columnName) throws SQLException {
		return getURL(findColumn(columnName));
	}

	public InputStream getUnicodeStream(int columnIndex) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	public InputStream getUnicodeStream(String columnName) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	public SQLWarning getWarnings() throws SQLException {
		return this.warnings;
	}

	public void insertRow() throws SQLException {
		if (action == ROW_READED) {
			sheet.shiftRows(cursor, sheet.getLastRowNum(), 1);
			sheet.createRow(cursor);
			action = ROW_INSERTED;
		}
	}

	public boolean isAfterLast() throws SQLException {
		return cursor > sheet.getLastRowNum();
	}

	public boolean isBeforeFirst() throws SQLException {
		return cursor == sheet.getFirstRowNum();
	}

	public boolean isFirst() throws SQLException {
		return cursor == sheet.getFirstRowNum() + 1;
	}

	public boolean isLast() throws SQLException {
		return cursor == sheet.getLastRowNum();
	}

	public boolean last() throws SQLException {
		cursor = sheet.getLastRowNum();
		return next();
	}

	public void moveToCurrentRow() throws SQLException {
		record  = sheet.getRow(cursor);  
	}

	public void moveToInsertRow() throws SQLException {
		if (action == ROW_INSERTED) {
			record  = sheet.getRow(cursor);  
		}
	}

	public boolean next() throws SQLException {
		if (cursor <= sheet.getLastRowNum()) {
			record  = sheet.getRow(cursor++);  
			return record != null;
		} else {
			return false;
		}	
	}

	public boolean previous() throws SQLException {
		if (cursor > sheet.getFirstRowNum() + 1) {
			record  = sheet.getRow(--cursor);  
			return true;
		} else {
			return false;
		}	
	}

	public void refreshRow() throws SQLException {
		record = sheet.getRow(cursor);

	}

	public boolean relative(int rows) throws SQLException {
		return (cursor + rows <= sheet.getLastRowNum());
	}

	public boolean rowDeleted() throws SQLException {
		return action == ROW_DELETED;
	}

	public boolean rowInserted() throws SQLException {
		return action == ROW_INSERTED;
	}

	public boolean rowUpdated() throws SQLException {
		return action == ROW_UPDATED;
	}

	public void setFetchDirection(int direction) throws SQLException {
		// TODO Auto-generated method stub

	}

	public void setFetchSize(int rows) throws SQLException {
		// TODO Auto-generated method stub

	}

	public void updateArray(int columnIndex, Array x) throws SQLException {
		// TODO Auto-generated method stub

	}

	public void updateArray(String columnName, Array x) throws SQLException {
		// TODO Auto-generated method stub

	}

	public void updateAsciiStream(int columnIndex, InputStream x, int length)
			throws SQLException {
		// TODO Auto-generated method stub

	}

	public void updateAsciiStream(String columnName, InputStream x, int length)
			throws SQLException {
		// TODO Auto-generated method stub

	}

	public void updateBigDecimal(int columnIndex, BigDecimal x)
			throws SQLException {
		HSSFCell cell = record.getCell(columnIndex);
		cell.setCellValue(x.doubleValue());
	}

	public void updateBigDecimal(String columnName, BigDecimal x)
			throws SQLException {
		updateBigDecimal(findColumn(columnName), x);
	}

	public void updateBinaryStream(int columnIndex, InputStream x, int length)
			throws SQLException {
		// TODO Auto-generated method stub

	}

	public void updateBinaryStream(String columnName, InputStream x, int length)
			throws SQLException {
		// TODO Auto-generated method stub

	}

	public void updateBlob(int columnIndex, Blob x) throws SQLException {
		// TODO Auto-generated method stub

	}

	public void updateBlob(String columnName, Blob x) throws SQLException {
		// TODO Auto-generated method stub

	}

	public void updateBoolean(int columnIndex, boolean x) throws SQLException {
		
		HSSFCell cell = record.getCell(columnIndex);
		cell.setCellValue(x);
	}

	public void updateBoolean(String columnName, boolean x) throws SQLException {
		
		updateBoolean(findColumn(columnName), x);
	}

	public void updateByte(int columnIndex, byte x) throws SQLException {
		// TODO Auto-generated method stub

	}

	public void updateByte(String columnName, byte x) throws SQLException {
		// TODO Auto-generated method stub

	}

	public void updateBytes(int columnIndex, byte[] x) throws SQLException {

		HSSFCell cell = record.getCell(columnIndex);
		cell.setCellValue(new HSSFRichTextString(x.toString()));
	}

	public void updateBytes(String columnName, byte[] x) throws SQLException {

		updateBytes(findColumn(columnName), x);
	}

	public void updateCharacterStream(int columnIndex, Reader x, int length)
			throws SQLException {
		// TODO Auto-generated method stub

	}

	public void updateCharacterStream(String columnName, Reader reader,
			int length) throws SQLException {
		// TODO Auto-generated method stub

	}

	public void updateClob(int columnIndex, Clob x) throws SQLException {
		// TODO Auto-generated method stub

	}

	public void updateClob(String columnName, Clob x) throws SQLException {
		// TODO Auto-generated method stub

	}

	public void updateDate(int columnIndex, Date x) throws SQLException {

		HSSFCell cell = record.getCell(columnIndex);
		cell.setCellValue(x);
	}

	public void updateDate(String columnName, Date x) throws SQLException {

		updateDate(findColumn(columnName), x);
	}

	public void updateDouble(int columnIndex, double x) throws SQLException {

		HSSFCell cell = record.getCell(columnIndex);
		cell.setCellValue(x);
	}

	public void updateDouble(String columnName, double x) throws SQLException {

		updateDouble(findColumn(columnName), x);
	}

	public void updateFloat(int columnIndex, float x) throws SQLException {

		HSSFCell cell = record.getCell(columnIndex);
		cell.setCellValue(x);
	}

	public void updateFloat(String columnName, float x) throws SQLException {

		updateFloat(findColumn(columnName), x);
	}

	public void updateInt(int columnIndex, int x) throws SQLException {

		HSSFCell cell = record.getCell(columnIndex);
		cell.setCellValue(x);
	}

	public void updateInt(String columnName, int x) throws SQLException {

		updateInt(findColumn(columnName), x);
	}

	public void updateLong(int columnIndex, long x) throws SQLException {

		HSSFCell cell = record.getCell(columnIndex);
		cell.setCellValue(x);
	}

	public void updateLong(String columnName, long x) throws SQLException {

		updateLong(findColumn(columnName), x);
	}

	public void updateNull(int columnIndex) throws SQLException {

		HSSFCell cell = record.getCell(columnIndex);
		cell.setCellValue(new HSSFRichTextString());
	}

	public void updateNull(String columnName) throws SQLException {

		updateNull(findColumn(columnName));
	}

	public void updateObject(int columnIndex, Object x) throws SQLException {
		// TODO Auto-generated method stub

	}

	public void updateObject(String columnName, Object x) throws SQLException {
		// TODO Auto-generated method stub

	}

	public void updateObject(int columnIndex, Object x, int scale)
			throws SQLException {
		// TODO Auto-generated method stub

	}

	public void updateObject(String columnName, Object x, int scale)
			throws SQLException {
		// TODO Auto-generated method stub

	}

	public void updateRef(int columnIndex, Ref x) throws SQLException {
		// TODO Auto-generated method stub

	}

	public void updateRef(String columnName, Ref x) throws SQLException {
		// TODO Auto-generated method stub

	}

	public void updateRow() throws SQLException {
		if (action != ROW_READED) {
			try {
				FileOutputStream xls = new FileOutputStream(this.schema);
				workBook.write(xls);
				action = ROW_READED;
			} catch (Exception e) {
				throw new SQLException(e);
			}
		}
	}

	public void updateShort(int columnIndex, short x) throws SQLException {

		HSSFCell cell = record.getCell(columnIndex);
		cell.setCellValue(x);
	}

	public void updateShort(String columnName, short x) throws SQLException {

		updateShort(findColumn(columnName), x);
	}

	public void updateString(int columnIndex, String x) throws SQLException {

		HSSFCell cell = record.getCell(columnIndex);
		cell.setCellValue(new HSSFRichTextString(x));
	}

	public void updateString(String columnName, String x) throws SQLException {

		updateString(findColumn(columnName), x);
	}

	public void updateTime(int columnIndex, Time x) throws SQLException {

		HSSFCell cell = record.getCell(columnIndex);
		cell.setCellValue(x);
	}

	public void updateTime(String columnName, Time x) throws SQLException {

		updateTime(findColumn(columnName), x);
	}

	public void updateTimestamp(int columnIndex, Timestamp x)
			throws SQLException {

		HSSFCell cell = record.getCell(columnIndex);
		cell.setCellValue(x);
	}

	public void updateTimestamp(String columnName, Timestamp x)
			throws SQLException {

		updateTimestamp(findColumn(columnName), x);
	}

	public boolean wasNull() throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	public int getHoldability() throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	public Reader getNCharacterStream(int columnIndex) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	public Reader getNCharacterStream(String columnLabel) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	public NClob getNClob(int columnIndex) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	public NClob getNClob(String columnLabel) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	public String getNString(int columnIndex) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	public String getNString(String columnLabel) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	public RowId getRowId(int columnIndex) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	public RowId getRowId(String columnLabel) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	public SQLXML getSQLXML(int columnIndex) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	public SQLXML getSQLXML(String columnLabel) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	public boolean isClosed() throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	public void updateAsciiStream(int columnIndex, InputStream x)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	public void updateAsciiStream(String columnLabel, InputStream x)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	public void updateAsciiStream(int columnIndex, InputStream x, long length)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	public void updateAsciiStream(String columnLabel, InputStream x, long length)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	public void updateBinaryStream(int columnIndex, InputStream x)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	public void updateBinaryStream(String columnLabel, InputStream x)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	public void updateBinaryStream(int columnIndex, InputStream x, long length)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	public void updateBinaryStream(String columnLabel, InputStream x,
			long length) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	public void updateBlob(int columnIndex, InputStream inputStream)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	public void updateBlob(String columnLabel, InputStream inputStream)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	public void updateBlob(int columnIndex, InputStream inputStream, long length)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	public void updateBlob(String columnLabel, InputStream inputStream,
			long length) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	public void updateCharacterStream(int columnIndex, Reader x)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	public void updateCharacterStream(String columnLabel, Reader reader)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	public void updateCharacterStream(int columnIndex, Reader x, long length)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	public void updateCharacterStream(String columnLabel, Reader reader,
			long length) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	public void updateClob(int columnIndex, Reader reader) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	public void updateClob(String columnLabel, Reader reader)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	public void updateClob(int columnIndex, Reader reader, long length)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	public void updateClob(String columnLabel, Reader reader, long length)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	public void updateNCharacterStream(int columnIndex, Reader x)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	public void updateNCharacterStream(String columnLabel, Reader reader)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	public void updateNCharacterStream(int columnIndex, Reader x, long length)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	public void updateNCharacterStream(String columnLabel, Reader reader,
			long length) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	public void updateNClob(int columnIndex, NClob clob) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	public void updateNClob(String columnLabel, NClob clob) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	public void updateNClob(int columnIndex, Reader reader) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	public void updateNClob(String columnLabel, Reader reader)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	public void updateNClob(int columnIndex, Reader reader, long length)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	public void updateNClob(String columnLabel, Reader reader, long length)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	public void updateNString(int columnIndex, String string)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	public void updateNString(String columnLabel, String string)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	public void updateRowId(int columnIndex, RowId x) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	public void updateRowId(String columnLabel, RowId x) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	public void updateSQLXML(int columnIndex, SQLXML xmlObject)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	public void updateSQLXML(String columnLabel, SQLXML xmlObject)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	public boolean isWrapperFor(Class<?> arg0) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	public <T> T unwrap(Class<T> arg0) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	public Object getObject(int arg0, Map<String, Class<?>> arg1)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	public Object getObject(String arg0, Map<String, Class<?>> arg1)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	public <T> T getObject(int arg0, Class<T> arg1) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	public <T> T getObject(String arg0, Class<T> arg1) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}


}
