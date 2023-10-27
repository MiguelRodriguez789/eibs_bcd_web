/*
 * Created on Feb 23, 2010
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package datapro.eibs.tools.io;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * @author fhernandez
 * 
 */
public class ReportReader extends BufferedReader {

	protected static final int MAXIMUM_HEADER_PAGES		= 5;
	protected static final int MAXIMUM_HEADER_SIZE 		= 12;
	
	private boolean bHeader;
	private int pageIndex = -1;
	private int lineIndex = 0;
	private int headerSize = 0;
	
	private Object currentLine;
	private String compare = "*";
	private String firstCountedLine = "";
	boolean firstCountedLineFlag;

	private List header = new ArrayList();
	private List body = new ArrayList();
	private List page;
	
	private Reader reader;

	/**
	 * PDFTextParser Constructor
	 *  
	 */
	public ReportReader(Reader reader) {
		super(reader);
		this.reader = reader;
	}
	
	
	public void reset() throws IOException {
		pageIndex = 0;
		firstCountedLineFlag = false;
	}
	
	public int getCurrentPageNumber() {
		return pageIndex+1;
	}

	public int getHeaderSize() {
		return headerSize;
	}


	private String setLine(int size){
		char [] line = new char[size];
		for (int j =0; j<size; j++){
			line[j] = '-';			
		}
		return new String(line);
	}	
	
	protected boolean matchLine(String line) {
		if (!line.trim().equals("")){
			compare =  setLine(line.length());
		}		
		return compare.equals(line);
	}
	
	protected CharSequence[] toCells(CharSequence line){
		CharSequence[] cells = new String[1];
		cells[0] = line;
		return cells;
	}
	
	protected CharSequence[] formatBody(String line){
		return toCells(line);
	}
	
	protected CharSequence[] formatHeader(String line){
		return toCells(line);
	}
	
	/**
	 * @author csepulveda
	 * @throws IOException 
	 */
	private void addHeader(CharSequence[] line){
		header.add(line);
		headerSize++;
	}	
	
	private void addLine(CharSequence[] line){
		page.add(line);
		lineIndex++;
	}
	
	/**
	 * @return true if the working line is in the header range or 
	 * false if we are not sure or the current line is not a header.
	 */
	public boolean onHeader() {
		return bHeader;
	}
	
	protected boolean matchHeader(String line) {
		if(headerSize == 0) 
			return false;
		Iterator iterator = header.iterator();
		while (iterator.hasNext()) {
			if(line.equals(iterator.next())){
				return true;
			}
		}
		return false;
	}
	
	private boolean checkHeader(String line){
		//We have to check if the current line is a header
		if (headerSize == 0 || !firstCountedLineFlag){
			if (!line.trim().equals("")){
				firstCountedLine = line;
				firstCountedLineFlag = true;
			}
			bHeader = true;
		} else if (lineIndex <= headerSize
			&& lineIndex < MAXIMUM_HEADER_SIZE) {
			bHeader = true;
		} else {
			bHeader = matchHeader(line);
		}
		return bHeader;
	}
	
	private Object readPageLine(int index) throws IOException {
		Object line = null;
		if (page != null){
			try {
				if (page.size() > index) {
					//Then line has been cached
					return page.get(index);
				}
			} catch (Exception e) {
			}
		}
		line = super.readLine();
		if (line == null) {
			return null;
		}
		checkHeader(line.toString());
		if (onHeader()) {
			if(getCurrentPageNumber() > 1 
				&& line.equals(firstCountedLine)){
				//If not the first page and the line matches the first line read
				lineIndex = lineIndex + headerSize;
				line = readPageLine(lineIndex);
			}
			if (headerSize >= MAXIMUM_HEADER_SIZE 	//the header size was exceeded
				|| matchLine(line.toString())) {	//the line it's repeated
				//Reading the next line
				line = readPageLine(lineIndex++);
			}
			if (line != null) {
				if (pageIndex >= body.size()){
					//Chaching page
					page = new ArrayList();
					body.add(page);
				}
				//Caching line
				page.add(line);
			}
		}
		return line;
	}
	
	private Object readPageLine() throws IOException {
		if (pageIndex == -1) {
			//If page index is not initialized, then force a nextPage
			if (nextPage()) {
				//and a header caching
				bufferHeader();
				reset();
			} else {
				return null;
			}
		}
		currentLine = readPageLine(lineIndex);
		if (currentLine != null) {
			lineIndex++;
		}
		return currentLine;
	}
	
	public String readLine() throws IOException {
		Object line = readPageLine();
		if (line == null) {
			return null;
		}
		return line.toString();
	}
	
	public CharSequence[] readRow() throws IOException {
		Object line = readPageLine();
		if (line == null) {
			return null;
		}
		if (line instanceof CharSequence[]) {
			return (CharSequence[]) line;
		} else {
			if (onHeader()) {
				return formatHeader(line.toString());
			} else {
				return formatBody(line.toString());
			}
		}
	}
	
	protected boolean isPageCached(){
		if (body.size() > pageIndex) {
			//Then page has been cached
			return true;
		}
		return false;
	}
	
	public boolean nextPage() throws IOException {
		page = null;
		lineIndex = 0;
		pageIndex++;
		if (isPageCached()) {
			page = (List) body.get(pageIndex);
			return true;
		}
		try {
			if (readLine() != null) {
				return true;
			}
		} catch (IOException e) {
			throw e;
		} catch (Exception e) {
			throw new IOException(e);
		}
		return false;
	}
	
	private void addLine(String line) {
		try {
			if (onHeader()) {
				if (header.size() == 0) {
					if(line.toString().trim().equals("")){
						addHeader(formatHeader(" "));
					} else if(lineIndex < MAXIMUM_HEADER_SIZE){
						addHeader(formatHeader(line));
					}
				} else if (header.size() < MAXIMUM_HEADER_SIZE) {
					addHeader(formatHeader(line));
				}
			} else {
				addLine(formatBody(line));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void bufferHeader() throws IOException {
		do {
			if (getCurrentPageNumber() > 1){
				break;
			}
			String line = null;
			while((line = readLine())!=null){
				addLine(line);
			}
		} while (nextPage());
	}
	
}