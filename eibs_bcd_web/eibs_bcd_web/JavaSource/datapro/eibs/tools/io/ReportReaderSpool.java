/*
 * Created on Feb 23, 2010
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package datapro.eibs.tools.io;

import java.io.IOException;
import java.io.InputStreamReader;

import com.ibm.as400.access.PrintObjectPageInputStream;

/**
 * @author fhernandez
 * 
 */
public class ReportReaderSpool extends ReportReader {

	private PrintObjectPageInputStream inputStream;

	public ReportReaderSpool(PrintObjectPageInputStream inputStream) {
		super(new InputStreamReader(inputStream));
		this.inputStream = inputStream;
	}

	public int getCurrentPageNumber() {
		return inputStream.getCurrentPageNumber();
	}

	public int getNumberOfPages() {
		return inputStream.getNumberOfPages();
	}

	public boolean isPagesEstimated() {
		return inputStream.isPagesEstimated();
	}

	protected boolean isPageCached(){
		if (super.isPageCached() 
			&& super.getCurrentPageNumber() <= inputStream.getCurrentPageNumber()) {
			return true;
		}
		return false;
	}

	public boolean nextPage() throws IOException {
		boolean nextPage = super.nextPage();
		if (isPageCached()) {
			return nextPage;
		}
		return nextPage && inputStream.nextPage();
	}

	public boolean previousPage() throws IOException {
		return inputStream.previousPage();
	}

	public boolean selectPage(int arg0) throws IOException,
			IllegalArgumentException {
		return inputStream.selectPage(arg0);
	}

	public void close() throws IOException {
		inputStream = null;
		super.close();
	}

}