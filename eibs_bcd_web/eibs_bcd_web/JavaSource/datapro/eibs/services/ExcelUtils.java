package datapro.eibs.services;

import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import java.util.Vector;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.DataFormat;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import datapro.eibs.beans.ExcelColStyle;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.DecimalField;
import datapro.eibs.sockets.MessageField;
import datapro.eibs.sockets.MessageRecord;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class ExcelUtils {

	private static String getClassName(Class c){
		if (c.isArray()) {
			return c.getComponentType().getName() + "[]";
		} else {
			return c.getName();
		}
	}
	
	public static void populate(ResultSet rs, Object bean) throws IllegalArgumentException, SQLException {
		try {
			ResultSetMetaData md = rs.getMetaData();
			PropertyDescriptor[] pds = Introspector.getBeanInfo(bean.getClass()).getPropertyDescriptors();
			String type = "";
			int index = -1;
			String name = "";
			for (int i = 0; i < pds.length; i++) {
				name = pds[i].getName();
				if (name.equals("class")) continue;
				index = rs.findColumn(name);
				if (index >= 0) {
					type = getClassName(pds[i].getPropertyType());
					Method setter = pds[i].getWriteMethod();
					if (setter == null) continue;
					if (type.equals("java.math.BigInteger")) {
						if (rs.getBigDecimal(name) != null) {
							setter.invoke(bean, new Object[] { new BigInteger(rs.getBigDecimal(name).toString()) });
						}
					} else if (type.equals("java.math.BigDecimal")) {
						if (rs.getBigDecimal(name) != null) {
							setter.invoke(bean, new Object[] { rs.getBigDecimal(name) });
						}
					} else if (type.equals("boolean")) {
						if (md.getColumnClassName(index).equals("boolean")) {
							setter.invoke(bean, new Object[] { new Boolean(rs.getBoolean(name)) });
						}
					} else if (type.equals("short")) {
						if (rs.getBigDecimal(name) != null) {
							setter.invoke(bean, new Object[] { new Short(rs.getBigDecimal(name).toString()) });
						}
					} else if (type.equals("int") 
							|| type.equals("java.lang.Integer")) {
						if (rs.getBigDecimal(name) != null) {
							setter.invoke(bean, new Object[] { new Integer(rs.getBigDecimal(name).toString()) });
						}
					} else if (type.equals("long")
							|| type.equals("java.lang.Long")) {
						if (rs.getBigDecimal(name) != null) {
							setter.invoke(bean, new Object[] { new Long(rs.getBigDecimal(name).toString()) });
						}
					} else if (type.equals("float")) {
						if (rs.getBigDecimal(name) != null) {
							setter.invoke(bean, new Object[] { new Float(rs.getBigDecimal(name).floatValue()) });
						}
					} else if (type.equals("double")) {
						if (rs.getBigDecimal(name) != null) {
							setter.invoke(bean, new Object[] { new Double(rs.getBigDecimal(name).doubleValue()) });
						}
					} else if (type.equals("java.sql.Date")) {
						if (rs.getDate(name) != null) {
							setter.invoke(bean, new Object[] { rs.getDate(name) });
						}
					} else if (type.equals("java.sql.Time")) {
						if (rs.getDate(name) != null) {
							setter.invoke(bean, new Object[] { new Time(rs.getDate(name).getTime()) });
						}
					} else if (type.equals("java.sql.Timestamp")) {
						if (rs.getDate(name) != null) {
							setter.invoke(bean, new Object[] { new Timestamp(rs.getDate(name).getTime()) });
						}
					} else if (type.equals("java.lang.String")) {
						if (rs.getString(name) != null) {
							setter.invoke(bean, new Object[] { rs.getString(name) });
						}
					}
				}
			}
		} catch (Exception e) {
			System.out.println(e.getClass().getName() + ": " + e.getMessage());
		}	
	}
	
	public static void populate(ResultSet rs, MessageRecord message) throws Exception {
		String name = "";
		try {
			ResultSetMetaData md = rs.getMetaData();
			Enumeration enu = message.fieldEnumeration();
			MessageField field = null;
			int type = 0;
			int index = -1;
			while (enu.hasMoreElements()) {
				field = (MessageField) enu.nextElement();
				name = field.getTag();
				index = rs.findColumn(name);
				if (index >= 0) {
					type = field.getType();
					switch (type) {
						case MessageField.CHARACTERFIELD:
							if (md.getColumnClassName(index).equals("java.math.BigDecimal")) {
								if (rs.getBigDecimal(name) != null) {
									field.setString(Util.addLeftChar('0', field.getLength(), rs.getBigDecimal(name).toString()));
								} else {
									field.setString(Util.addLeftChar('0', field.getLength(), rs.getString(name)));
								}
							} else if (md.getColumnClassName(index).equals("java.sql.Date")) {
								if (rs.getDate(name) != null) {
									field.setString(rs.getDate(name).toString());
								}
							} else if (md.getColumnClassName(index).equals("boolean")) {
								field.setString(rs.getBoolean(name) ? "true" : "false");
							} else {
								if (rs.getString(name) != null) {
									field.setString(rs.getString(name));
								}
							}	
							break;
						case MessageField.DECIMALFIELD:
							if (rs.getBigDecimal(name) != null) {
								((DecimalField)field).setBigDecimal(rs.getBigDecimal(name));
							}
							break;
						default:
							break;
					}
				}
			}
		} catch (Exception e) {
			String error = "Error in row " + rs.getRow() + " on column " + name + ": "; 
			throw new Exception(error + e.getMessage());
		}	
	}
	
	private static String getFileExtension(String filename) {
		String extension = "";
		int i = filename.lastIndexOf('.');
		int p = Math.max(filename.lastIndexOf('/'), filename.lastIndexOf('\\'));
		if (i > p) {
			extension = filename.substring(i + 1);
		}
		return extension;
	}
	
	public static boolean isXLSXVersion(String filename) {
		return "xlsx".equalsIgnoreCase(getFileExtension(filename));
	}
	
	/**
	 * ConvertExcelToCSV
	 * @param fileName, fileOut
	 * @return csv file in memory
	 */
	public static OutputStream ConvertExcelToCSV(String xlsFile, OutputStream fileOut) throws IOException {
		return ConvertExcelToCSV(xlsFile, fileOut, ",");
	}
	
	public static OutputStream ConvertExcelToCSV(String xlsFile, OutputStream fileOut, String separator) throws IOException {
		try {
			File file = new File(xlsFile);
			FileInputStream xls = new FileInputStream(file);
			String encoding = "UTF8";
			OutputStreamWriter osw = new OutputStreamWriter(fileOut, encoding);
			BufferedWriter bw = new BufferedWriter(osw);
			
			Workbook workBook = null;
			Sheet sheet = null;
			Cell cell = null;
			try {
				workBook = WorkbookFactory.create(xls);
			} catch (Exception e) {
				throw new IOException(e);
			}
			sheet = workBook.getSheetAt(0);
			
			Iterator rows = sheet.rowIterator();
			while (rows.hasNext()) {
				  Iterator cells = ((Row) rows.next()).cellIterator();
				  String line = "";
				  boolean first = true;
				  while (cells.hasNext()) {
					  cell = (Cell) cells.next();
					  
					  String value = "";
					  switch (cell.getCellType()) {
						case Cell.CELL_TYPE_BLANK:
							value = " ";
							break;
						case Cell.CELL_TYPE_BOOLEAN:
							value = cell.getBooleanCellValue() ? "true" : "false";
							break;
						case Cell.CELL_TYPE_ERROR:
							value = (new Integer(cell.getErrorCellValue())).toString();
							break;
						case Cell.CELL_TYPE_FORMULA:
							value = cell.getCellFormula();
							break;
						case Cell.CELL_TYPE_NUMERIC:
							if (DateUtil.isCellDateFormatted(cell)) {
								value = cell.getDateCellValue().toString();
							} else {
								value = String.valueOf(cell.getNumericCellValue());
							}
							break;
						default:
							value = cell.getRichStringCellValue().toString();
							break;
					  }
					  if (first) {
						  line = value;
						  first = false;
					  } else {
						  line += separator + value;
					  }
				  }
				  bw.write(line);
				  bw.newLine();
			}
		
		} catch (FileNotFoundException e) {
			System.out.println("File not found: " + xlsFile);
		}
		return fileOut;
	}
	
	public static void setData(String xlsFile, int sheet, int row, int cell, Object data) throws IOException  {
		File file = new File(xlsFile);
		FileInputStream xls = new FileInputStream(file);
		
		Workbook workBook = null;
		try {
			workBook = WorkbookFactory.create(xls);
			setData(workBook, sheet, row, cell, data);
		} catch (Exception e) {
			throw new IOException(e);
		} finally {
			if (xls != null) xls.close();
		}
	}
	
	public static void writeData(OutputStream out, InputStream xls, int sheet, int row, int cell, Object data) throws IOException  {
		writeData(out, xls, sheet, row, cell, data, false);
	}
	
	public static void writeData(OutputStream out, InputStream xls, int sheet, int row, int cell, Object data, boolean xlsx) throws IOException  {
		Workbook workBook = null;
		try {
			workBook = WorkbookFactory.create(xls);
		} catch (Exception e) {
			throw new IOException(e);
		} finally {
			if (xls != null) {
				xls.close();
			}
		}
		setData(workBook, sheet, row, cell, data);
		workBook.write(out);
	}
	
	public static void writeData(OutputStream out, InputStream xls, InputStream data) throws IOException  {
		Workbook workBook = null;
		try {
			workBook = WorkbookFactory.create(xls);
		} catch (Exception e) {
			throw new IOException(e);
		} finally {
			if (xls != null) {
				xls.close();
			}
		}
		ExcelUtils.createSheet(workBook, data);
		workBook.write(out);
	}
	
	public static void setData(Workbook workBook, int sheet, int row, int cell, Object data) throws IOException  {
		if (data == null) {
			return;
		}
		Sheet s = workBook.getSheetAt(sheet);
		Row r = s.getRow(row);
		Cell c = r.getCell(cell);
		switch (c.getCellType()) {
			case Cell.CELL_TYPE_BOOLEAN:
				c.setCellValue(data.toString().equals("true"));
				break;
			case Cell.CELL_TYPE_ERROR:
				c.setCellErrorValue(((Integer)data).byteValue());
				break;
			case Cell.CELL_TYPE_FORMULA:
				c.setCellFormula((String)data);
				break;
			case Cell.CELL_TYPE_NUMERIC:
				if (DateUtil.isCellDateFormatted(c)) {
					c.setCellValue((Date)data);
				} else {
					c.setCellValue(((BigDecimal)data).doubleValue());
				}
				break;
			default:
				if (!data.toString().trim().equals("")) {
					c.setCellType(Cell.CELL_TYPE_STRING);
					c.setCellValue(workBook.getCreationHelper().createRichTextString((String)data));
				}
				break;
		}
	}
	
	public static Object getData(String xlsFile, int sheet, int row, int cell) throws IOException  {
		File file = new File(xlsFile);
		FileInputStream xls = new FileInputStream(file);
		Object result = null;
		try {
			result = getData(xls, sheet, row, cell);
		} finally {
			if (xls != null) xls.close();
		}
		return result;
	}
	
	public static Object getData(InputStream xls, int sheet, int row, int cell) throws IOException  {
		return getData(xls, sheet, row, cell, false);
	}
	
	public static Object getData(InputStream xls, int sheet, int row, int cell, boolean xlsx) throws IOException  {
		Workbook workBook = null;
		try {
			workBook = WorkbookFactory.create(xls);
		} catch (Exception e) {
			throw new IOException(e);
		}
		
		Sheet s = workBook.getSheetAt(sheet);
		Row r = s.getRow(row);
		Cell c = r.getCell(cell);
		Object result = null;
		switch (c.getCellType()) {
			case Cell.CELL_TYPE_BLANK:
				result = "";
				break;
			case Cell.CELL_TYPE_BOOLEAN:
				result = new Boolean(c.getBooleanCellValue());
				break;
			case Cell.CELL_TYPE_ERROR:
				result = new Byte(c.getErrorCellValue());
				break;
			case Cell.CELL_TYPE_FORMULA:
				result = c.getCellFormula();
				break;
			case Cell.CELL_TYPE_NUMERIC:
				if (DateUtil.isCellDateFormatted(c)) {
					result = c.getDateCellValue();
				} else {
					result = new BigDecimal(c.getNumericCellValue());
				}
				break;
			default:
				result = c.getRichStringCellValue().toString();
				break;
		}
		return result;
	}
	
	public static OutputStream getWorkBook(Workbook workBook, OutputStream fileWriter) {
		try {
			workBook.write(fileWriter);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return fileWriter;
	}
	
	public static Workbook createWorkBook(File file) throws IOException {
		Workbook workBook = null;
		try {
			workBook = WorkbookFactory.create(file);
		} catch (Exception e) {
			throw new IOException(e);
		}
		return workBook;
	}
	
	public static OutputStream getOutputStreamFromFile(String xlsFile, OutputStream fileWriter) {
		File file = new File(xlsFile);
		FileInputStream xls = null;
		try {
			xls = new FileInputStream(file);
			
			Workbook workBook = WorkbookFactory.create(xls);
			fileWriter = getWorkBook(workBook, fileWriter);
		} catch (Exception e) {
			System.out.println("File not found: " + xlsFile);
		} finally {
			if (xls != null)
				try {
					xls.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
		}
		return fileWriter;
	}
	
	public static Workbook createWorkBook(boolean xlsx) {
		if (xlsx) {
			return new XSSFWorkbook();
		} else {
			return new HSSFWorkbook();
		}
	}
	
	public static Workbook createWorkBook(Vector vector, boolean xlsx) {
		Workbook workBook = createWorkBook(xlsx);
		return createSheet(workBook, vector);
	}
	
	public static Workbook createWorkBook(String[] fields, boolean xlsx) {
		Workbook workBook = createWorkBook(xlsx);
		return createSheet(workBook, fields);
	}
	
	public static Workbook createSheet(Workbook workBook, Vector vector) {
		Sheet sheet = workBook.createSheet();
		Row row = sheet.createRow(0);
		sheet.createFreezePane(0, 1);
		
		//This is for Header Style   
		Font setFont = workBook.createFont();   
		//setFont.setFontHeightInPoints((short)10);   
		//setFont.setColor(HSSFColor.WHITE.index);   
		setFont.setBoldweight(Font.BOLDWEIGHT_BOLD);
		
		CellStyle headerCellStyle = workBook.createCellStyle();   
		headerCellStyle.setFillForegroundColor((short)43);
		headerCellStyle.setFillPattern(CellStyle.SOLID_FOREGROUND);
		headerCellStyle.setFont(setFont);
		headerCellStyle.setAlignment(CellStyle.ALIGN_CENTER);
		headerCellStyle.setLocked(true);
		
		int index = 0;
		for (Object object : vector) {
			ExcelColStyle style = (ExcelColStyle) object;
			int width = 256 * (style.getName().length() + 5);
			if (style.getWidth() > 0) {
				width = 256 * (style.getWidth() + 5);
			}
			sheet.setColumnWidth(index, width);
			Cell cell = row.createCell(index, Cell.CELL_TYPE_STRING);
			cell.setCellValue(workBook.getCreationHelper().createRichTextString(style.getName()));
			cell.setCellStyle(headerCellStyle); 
			index++;
		}
		
		return workBook;
	}
	
	public static Workbook createSheet(Workbook workBook, String[] fields) {
		Sheet sheet = workBook.createSheet();
		Row row = sheet.createRow(0);
		sheet.createFreezePane(0, 1);
		
		//This is for Header Style   
		Font setFont = workBook.createFont();   
		//setFont.setFontHeightInPoints((short)10);   
		//setFont.setColor(HSSFColor.WHITE.index);   
		setFont.setBoldweight(Font.BOLDWEIGHT_BOLD);
		
		CellStyle headerCellStyle = workBook.createCellStyle();   
		headerCellStyle.setFillForegroundColor((short)43);
		headerCellStyle.setFillPattern(CellStyle.SOLID_FOREGROUND);
		headerCellStyle.setFont(setFont);
		headerCellStyle.setAlignment(CellStyle.ALIGN_CENTER);
		headerCellStyle.setLocked(true);

		for (int i = 0; i < fields.length; i++) {
			int width = 256 * (fields[i].length() + 5);
			sheet.setColumnWidth(i, width);
		}
		
		for (int i = 0; i < fields.length; i++) {
			Cell cell = row.createCell(i, Cell.CELL_TYPE_STRING);
			cell.setCellValue(workBook.getCreationHelper().createRichTextString(fields[i]));
			cell.setCellStyle(headerCellStyle); 
		}
		
		return workBook;
	}
	
	public static Workbook createSheet(Workbook workBook, InputStream in) throws IOException {
	
		Sheet sheet = workBook.getSheetAt(0);
		CellStyle style = workBook.createCellStyle();
		int rowValue = 0;
		
		BufferedReader reader = null;
		try {
			reader = new BufferedReader(new InputStreamReader(in));
			String data = "";
			while((data = reader.readLine())!=null){
				Row row = sheet.createRow(rowValue++);
				insertCell(workBook, sheet, row, 0, data, style);
			}			
		} finally {
			reader.close();
		}
		return workBook;
	}
	
	private static int isValidField(String[] fields, String tag) {
		int result = -1;
		for (int i = 0; i < fields.length; i++) {
			if (fields[i].equals(tag)) {
				result = i;
				break;
			}
		}
		return result;
	}
	
	public static void insertCell(Workbook workbook, Sheet sheet, Row row, int index, Object data, Vector fields) {
		CellStyle style = null;
		if (row.getRowNum() > 1) {
			style = sheet.getColumnStyle(index);
		} else {
			ExcelColStyle st = (ExcelColStyle) fields.get(index);
			DataFormat fmt = workbook.createDataFormat();
			style = workbook.createCellStyle();
			short f = fmt.getFormat("General");
			if (st.getFormat() != null 
					&& st.getFormat().length() > 0) {
				f = fmt.getFormat(st.getFormat());
			}
			style.setDataFormat(f);
			if (st.getAlign() != null
					&& st.getAlign().length() > 0) {
				if ("left".equalsIgnoreCase(st.getAlign())) {
					style.setAlignment(CellStyle.ALIGN_LEFT);
				} else if ("right".equalsIgnoreCase(st.getAlign())) {
					style.setAlignment(CellStyle.ALIGN_RIGHT);
				} else if ("justify".equalsIgnoreCase(st.getAlign())) {
					style.setAlignment(CellStyle.ALIGN_JUSTIFY);
				} else if ("center".equalsIgnoreCase(st.getAlign())) {
					style.setAlignment(CellStyle.ALIGN_CENTER);
				} else {
					style.setAlignment(CellStyle.ALIGN_GENERAL);
				}
			}
			sheet.setDefaultColumnStyle(index, style);
		}
		insertCell(workbook, sheet, row, index, data, style);
	}
	
	public static void insertCell(Workbook workbook, Sheet sheet, Row row, int index, Object data) {
		CellStyle style = null;
		if (row.getRowNum() > 1) {
			style = sheet.getColumnStyle(index);
		} else {
			style = workbook.createCellStyle();
			sheet.setDefaultColumnStyle(index, style);
		}
		insertCell(workbook, sheet, row, index, data, style);
	}
	
	public static void insertCell(Workbook workbook, Sheet sheet, Row row, int index, Object data, CellStyle style) {
		if (data == null) {
			Cell cell = row.createCell(index, Cell.CELL_TYPE_STRING);
			cell.setCellStyle(style);
			cell.setCellValue("");
		} else {
			String type = data.getClass().getName();
			if (type.equals("java.math.BigInteger")) {
				BigInteger value = (BigInteger) data;
				Cell cell = row.createCell(index, Cell.CELL_TYPE_NUMERIC);
				cell.setCellStyle(style);
				cell.setCellValue(value.doubleValue());

			} else if (type.equals("java.math.BigDecimal")) {
				BigDecimal value = (BigDecimal) data;
				Cell cell = row.createCell(index, Cell.CELL_TYPE_NUMERIC);
				cell.setCellStyle(style);
				cell.setCellValue(value.doubleValue());
				
			} else if (type.equals("boolean")) {
				Boolean value = (Boolean) data;
				Cell cell = row.createCell(index, Cell.CELL_TYPE_BOOLEAN);
				cell.setCellStyle(style);
				cell.setCellValue(value.booleanValue());
				
			} else if (type.equals("short")) {
				Short value = (Short) data;
				Cell cell = row.createCell(index, Cell.CELL_TYPE_NUMERIC);
				cell.setCellStyle(style);
				cell.setCellValue(value.doubleValue());
				
			} else if (type.equals("int") 
					|| type.equals("java.lang.Integer")) {
				Integer value = (Integer) data;
				Cell cell = row.createCell(index, Cell.CELL_TYPE_NUMERIC);
				cell.setCellStyle(style);
				cell.setCellValue(value.doubleValue());
				
			} else if (type.equals("long")
					|| type.equals("java.lang.Long")) {
				Long value = (Long) data;
				Cell cell = row.createCell(index, Cell.CELL_TYPE_NUMERIC);
				cell.setCellStyle(style);
				cell.setCellValue(value.doubleValue());
				
			} else if (type.equals("float")) {
				Float value = (Float) data;
				Cell cell = row.createCell(index, Cell.CELL_TYPE_NUMERIC);
				cell.setCellStyle(style);
				cell.setCellValue(value.doubleValue());
				
			} else if (type.equals("double")) {
				Double value = (Double) data;
				Cell cell = row.createCell(index, Cell.CELL_TYPE_NUMERIC);
				cell.setCellStyle(style);
				cell.setCellValue(value.doubleValue());
				
			} else if (type.equals("java.sql.Date")) {
				Date value = (Date) data;
				Cell cell = row.createCell(index, Cell.CELL_TYPE_STRING);
				cell.setCellStyle(style);
				cell.setCellValue(value);
				
			} else if (type.equals("java.sql.Time")) {
				Time value = (Time) data;
				Cell cell = row.createCell(index, Cell.CELL_TYPE_STRING);
				cell.setCellStyle(style);
				cell.setCellValue(value);
				
			} else if (type.equals("java.sql.Timestamp")) {
				Timestamp value = (Timestamp) data;
				Cell cell = row.createCell(index, Cell.CELL_TYPE_STRING);
				cell.setCellStyle(style);
				cell.setCellValue(value);
				
			} else if (type.equals("java.lang.String")) {
				String value = (String) data;
				Cell cell = row.createCell(index, Cell.CELL_TYPE_STRING);
				cell.setCellStyle(style);
				cell.setCellValue(workbook.getCreationHelper().createRichTextString(value));
			}
		}
		
	}
	
	public static void insertRow(Workbook workbook, Sheet sheet, Vector fields, Object bean) {
		try {
			String[] fieldNames = new String[fields.size()];
			for (int i = 0; i < fieldNames.length; i++) {
				fieldNames[i] = ((ExcelColStyle)fields.get(i)).getTag() == null ? ((ExcelColStyle)fields.get(i)).getName() : ((ExcelColStyle)fields.get(i)).getTag();
			}
			Row row = sheet.createRow(sheet.getLastRowNum() + 1);
			PropertyDescriptor[] pds = Introspector.getBeanInfo(bean.getClass()).getPropertyDescriptors();
			//String type = "";
			int index = 0;
			String name = "";
			for (int i = 0; i < pds.length; i++) {
				name = pds[i].getName();
				if (name.equals("class")) continue;
				index = isValidField(fieldNames, name);
				if (index >= 0) {
					//type = getClassName(pds[i].getPropertyType());
					Method getter = pds[i].getReadMethod();
					if (getter == null) continue;
					insertCell(workbook, sheet, row, index, getter.invoke(bean, new Object[] {}), fields);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void insertRow(Workbook workbook, Sheet sheet, Object data) {
		Row row = sheet.createRow(sheet.getLastRowNum() + 1);
		insertCell(workbook, sheet, row, 0, data);
	}
	
	public static void insertRow(Workbook workbook, Sheet sheet, Vector fields, MessageRecord message) {
		String[] fieldNames = new String[fields.size()];
		for (int i = 0; i < fieldNames.length; i++) {
			fieldNames[i] = ((ExcelColStyle)fields.get(i)).getTag() == null ? ((ExcelColStyle)fields.get(i)).getName() : ((ExcelColStyle)fields.get(i)).getTag();
		}
		Row row = sheet.createRow(sheet.getLastRowNum() + 1);
		Enumeration enu = message.fieldEnumeration();
		while (enu.hasMoreElements()) {
			MessageField field = (MessageField) enu.nextElement();
			String name = field.getTag();
			int index = isValidField(fieldNames, name);
			if (index >= 0) {
				Cell cell = row.createCell(index, field.getType() == MessageField.DECIMALFIELD ? Cell.CELL_TYPE_NUMERIC : Cell.CELL_TYPE_STRING);
				CellStyle style = null;
				if (row.getRowNum() > 1) {
					style = sheet.getColumnStyle(index);
				} else {
					ExcelColStyle st = (ExcelColStyle) fields.get(index);
					DataFormat fmt = workbook.createDataFormat();
					style = workbook.createCellStyle();
					short f = fmt.getFormat("General");
					if (st.getFormat() != null 
							&& st.getFormat().length() > 0) {
						f = fmt.getFormat(st.getFormat());
					}
					if (st.getAlign() != null
							&& st.getAlign().length() > 0) {
						if ("left".equalsIgnoreCase(st.getAlign())) {
							style.setAlignment(CellStyle.ALIGN_LEFT);
						} else if ("right".equalsIgnoreCase(st.getAlign())) {
							style.setAlignment(CellStyle.ALIGN_RIGHT);
						} else if ("justify".equalsIgnoreCase(st.getAlign())) {
							style.setAlignment(CellStyle.ALIGN_JUSTIFY);
						} else if ("center".equalsIgnoreCase(st.getAlign())) {
							style.setAlignment(CellStyle.ALIGN_CENTER);
						} else {
							style.setAlignment(CellStyle.ALIGN_GENERAL);
						}
					}
					style.setDataFormat(f);
					sheet.setDefaultColumnStyle(index, style);
				}
				cell.setCellStyle(style);
				if (field.getType() == MessageField.DECIMALFIELD) {
					DecimalField decimal = (DecimalField) field;
					if (field.getDecimals() == 0 
							&& cell.getCellStyle().getDataFormat() == 0x31) { //Numeric Text
						cell.setCellType(Cell.CELL_TYPE_STRING);
						cell.setCellValue(workbook.getCreationHelper().createRichTextString(decimal.getString()));
					} else {
						cell.setCellType(Cell.CELL_TYPE_NUMERIC);
						cell.setCellValue(decimal.getBigDecimal().doubleValue());
					}
				} else {
					cell.setCellType(Cell.CELL_TYPE_STRING);
					cell.setCellValue(workbook.getCreationHelper().createRichTextString(field.getString()));
				}
			}
		}
	}
	
	private static void setColumnUnLocked(int column, Workbook workBook) {
		CellStyle lockedStyle = workBook.createCellStyle();   
		lockedStyle.setLocked(false);
		Sheet sheet = workBook.getSheetAt(0);
		for (int rowIndex = sheet.getFirstRowNum() + 1; rowIndex <= sheet.getLastRowNum(); rowIndex++) {
			Row row = sheet.getRow(rowIndex);
			Cell cell = row.getCell(column);
			cell.setCellStyle(lockedStyle);
		}
	}
	
	public static OutputStream getWorkBook(OutputStream fileWriter, Vector fields, List list) {
		return getWorkBook(fileWriter, fields, list, true);
	}

	public static OutputStream getWorkBook(OutputStream fileWriter, Vector fields, List list, boolean readonly) {
		return getWorkBook(fileWriter, fields, list, readonly, false);
	}
	
	public static OutputStream getWorkBook(OutputStream fileWriter, Vector fields, List list, boolean readonly, boolean xlsx) {
		
		String[] fieldNames = new String[fields.size()];
		for (int i = 0; i < fieldNames.length; i++) {
			fieldNames[i] = ((ExcelColStyle)fields.get(i)).getName();
		}
		
		Workbook workBook = createWorkBook(fieldNames, xlsx);
		Sheet sheet = workBook.getSheetAt(0);
		if (!list.isEmpty()) {
			Iterator iterator = list.iterator();
			while (iterator.hasNext()) {
				Object object = iterator.next();
				if (object instanceof MessageRecord) {
					insertRow(workBook, sheet, fields, (MessageRecord)object);
				} else {
					insertRow(workBook, sheet, fields, object);
				}
			}
			for (int i = 0; i < fieldNames.length; i++) {
				if (!((ExcelColStyle)fields.get(i)).isLocked()) setColumnUnLocked(i, workBook);
			}
			for (int i = 0; i < fieldNames.length; i++) {
				sheet.setColumnHidden(i, ((ExcelColStyle)fields.get(i)).isHidden());
			}
			if (readonly) sheet.protectSheet("datapro");
		}
		
		try {
			workBook.write(fileWriter);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return fileWriter;
	}
	
	public static OutputStream getWorkBook(OutputStream fileWriter, Vector fields, boolean xlsx) {
		String[] fieldNames = new String[fields.size()];
		for (int i = 0; i < fieldNames.length; i++) {
			fieldNames[i] = ((ExcelColStyle)fields.get(i)).getName();
		}
		
		Workbook workBook = createWorkBook(fieldNames, xlsx);
		try {
			workBook.write(fileWriter);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return fileWriter;
	}

}
