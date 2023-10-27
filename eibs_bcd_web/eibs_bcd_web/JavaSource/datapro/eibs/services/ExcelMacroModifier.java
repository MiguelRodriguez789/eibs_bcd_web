/*
 * Created on Feb 23, 2010
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package datapro.eibs.services;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/**
 * @author Catalina
 * 
 * TODO To change the template for this generated type comment go to Window -
 * Preferences - Java - Code Style - Code Templates
 */
public class ExcelMacroModifier {
	
	/**
	 * pdfToCSV
	 * @param fileName
	 * @return
	 */
	public OutputStream pdfToExcel(String fileName, OutputStream fileOut, String absoluteURL) {
		File f = new File(fileName);
		//FileOutputStream fileOut = null;
		try {
		if (!f.isFile()) {
			System.out.println("File " + fileName + " does not exist.");
			return null;
		}		
			modifyMacro(new FileInputStream(f), fileOut, absoluteURL);
			
		} catch (java.io.FileNotFoundException e) {
			System.out.println("File not found");
		}
		return fileOut;

	}
	
	public OutputStream pdfToExcel(InputStream inputStream, OutputStream fileOut, String absoluteURL) {
		modifyMacro(inputStream, fileOut, absoluteURL);
		return fileOut;

	}

	
		
	/**
	 * pdfToCSV
	 * 
	 * @param file
	 * @param writer
	 */
	public void modifyMacro(InputStream file, OutputStream fileWriter, String absoluteURL) {

		try {
			ExcelUtils.writeData(fileWriter, file, 0, 99, 26, absoluteURL);
			
		} catch (IOException e2) {
			System.out.println("An exception occured in parsing the PDF Document.");
		} finally {
			if (file != null)
				try {
					file.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
		}
		System.out.println("Done.");
	}

	

	//Extracts text from a PDF Document and writes it to a text file
	public static void main(String args[]) {

		ExcelMacroModifier a = new ExcelMacroModifier();
		//a.pdfToCSV("C:\\Macro.xls");
		
	
	}

		
}