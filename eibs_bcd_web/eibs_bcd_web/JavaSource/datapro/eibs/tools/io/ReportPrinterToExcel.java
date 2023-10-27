/*
 * Created on Feb 23, 2010
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package datapro.eibs.tools.io;

import java.io.BufferedReader;
import java.io.PrintWriter;

import datapro.eibs.tools.io.ExcelWriter;
import datapro.eibs.tools.io.ReportReader;

/**
 * @author fhernandez
 * 
 */
public class ReportPrinterToExcel extends PrintWriter {
	
	private ExcelWriter writer;

	public ReportPrinterToExcel(ExcelWriter writer) {
		super(writer);
		this.writer = writer;
	}
	
	public void println(String line){
		writer.writeRow(line);
	}
	
	public void println(Object object) {
		try {
			if (object instanceof BufferedReader) {
				ReportReader reader = (ReportReader) object;
				CharSequence[] cells = reader.readRow();
				if (cells != null) {
					writer.writeRow(cells);
				}
			} else if (object instanceof CharSequence[]) {
				writer.writeRow((CharSequence[]) object);
			} else {
				println(object.toString());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void print(Object object) {
		if (object instanceof BufferedReader) {
			ReportReader reader = (ReportReader) object; 
			try {	
				CharSequence[] cells = null;
				while((cells = reader.readRow())!=null){
					writer.setHeader(reader.onHeader());
					writer.writeRow(cells);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (reader != null)
						reader.close();
				} catch (Exception e) {
				}
			}
		} else {
			try {
				write(object.toString());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public void close() {
		try {
			writer = null;
			writer.close();			
		} catch (Exception e) {
		}
	}

}