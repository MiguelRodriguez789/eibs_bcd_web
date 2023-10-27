package datapro.eibs.tools.io;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Writer;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;

import com.datapro.generic.tool.UDecimalFormat;

/**
 * @author fhernandez
 */
public class ExcelWriter extends Writer {
	
	private OutputStream out;
	
	private Workbook workBook;
	
	private Sheet sheet;
	
	private Row row;
	
	private CellStyle HEADING_CELL_STYLE;
	
	private CellStyle PLAIN_CELL_STYLE;
	
	private boolean header;
	
	public ExcelWriter(OutputStream out, Workbook workBook) {
		this.out = out;
		this.workBook = workBook;
		// create a new sheet
		this.sheet = workBook.createSheet();
	}
	
	public ExcelWriter(OutputStream out, InputStream templateIn) throws IOException {
		this.out = out;
		try {
			this.workBook = WorkbookFactory.create(templateIn);			
		} catch (Exception e) {
			throw new IOException(e);
		} finally {
			if(templateIn != null) templateIn.close();			
		}
		// create a new sheet
		this.sheet = workBook.createSheet();
	}
	
	private CellStyle headingCellStyle(){
		Font font = workBook.createFont(); // defaults to Arial on windows 
		font.setBoldweight(Font.BOLDWEIGHT_BOLD); // bold 
		CellStyle style = workBook.createCellStyle(); // make style 
		style.setFont(font); // set font 
		style.setAlignment(CellStyle.ALIGN_CENTER); // set alignment to centered
		HEADING_CELL_STYLE = style;
		return style;
	} 

		 
	private CellStyle plainCellStyle(){
		Font font = workBook.createFont(); // defaults to Arial on windows 
		font.setBoldweight(Font.DEFAULT_CHARSET); // bold 
		CellStyle style = workBook.createCellStyle(); // make style 
		style.setFont(font); // set font 
		style.setAlignment(CellStyle.ALIGN_LEFT); // set alignment to centered
		PLAIN_CELL_STYLE = plainCellStyle();
		return style; 
	} 
	
	public boolean isHeader() {
		return header;
	}

	public void setHeader(boolean header) {
		this.header = header;
	}
	
	/**
	 * @author csepulveda
	 * @param String test
	 * 
	 * Returns true if the tested string is a number, false if it's not
	 */
	protected boolean isNumber(String test) {
		boolean rst = true;
		try {
			UDecimalFormat.parse(test);
		} catch (NumberFormatException e) {
			rst = false;
		}
		return rst;
	}
	
	public void addRow() {
		row = sheet.createRow(sheet.getLastRowNum());
	}
	
	/**
	 * 
	 * @return
	 */
	public void writeCell(String line) {
		int column = row.getLastCellNum();
		if (column < 0) {
			column = 0;
		}
		Cell cell = row.createCell(column);
		if (isHeader()) {
			cell.setCellStyle(HEADING_CELL_STYLE);
		} else {
			cell.setCellStyle(PLAIN_CELL_STYLE);
		}
		if(isNumber(line.trim())){
			//line = String.valueOf(UDecimalFormat.parse(line.trim()));
		}	
		cell.setCellValue(workBook.getCreationHelper().createRichTextString(
				line.trim()));
	}
	
	public void writeRow(CharSequence[] cells) {
		//Write the cells to the workbook
		addRow();
		for (int i = 0; i < cells.length; i++) {
			writeCell(cells[i].toString());
		}
	}
	
	public void writeRow(String line) {
		addRow();
		if(line.trim().equals("")){
			writeCell(" ");
		} else {
			writeCell(line);
		}
	}
	
	public void close() throws IOException {
		if (out != null) {
			out.close();
		}
		out = null;
	}

	public void flush() throws IOException {
		if (workBook != null && out != null) {
			workBook.write(out);
		}
		out.flush();
	}
	
	public void write(String str, int off, int len) throws IOException {
		writeCell(str.substring(off, len));
	}

	public void write(String str) throws IOException {
		writeCell(str);
	}

	public void write(char[] cbuf) throws IOException {
		writeCell(new String(cbuf));
	}

	@Override
	public void write(char[] cbuf, int off, int len) throws IOException {
		writeCell(new String(cbuf, off, len));
	}

	@Override
	public void write(int c) throws IOException {
		throw new IOException("Writing of single bytes to an Excel File are not permitted");
	}

	
}