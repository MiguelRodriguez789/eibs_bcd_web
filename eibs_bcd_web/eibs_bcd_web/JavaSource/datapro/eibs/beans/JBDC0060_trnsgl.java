package datapro.eibs.beans;

import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Inserte aquí la descripción del tipo. Fecha de creación: (02-05-2007
 * 11:58:54)
 * 
 * @author: William Alfaro
 */

public class JBDC0060_trnsgl {
	
	private Logger logger = Logger.getLogger(this.getClass().getName());
	
	private int size = 140;
	
	private String TRNCCY;
	private String TRNGLN;
	private String TRNACC;
	private String TRNDSC;
	private double TRNAMT;
	private String TRNTYP;
	private String TRNTCD;
	private double TRNEXR;
	private String TRNBRN;
	private double TRNEQV;
	private String TRNRTY;
	private String TRNFCD;
	private String TRNCOA;
	private String TRNCCR;

	public JBDC0060_trnsgl(String pData) {
		if (pData != null && pData.length() == size) {
			TRNCCY = pData.substring(0, 3);
			TRNGLN = pData.substring(3, 19);
			TRNACC = pData.substring(19, 31);
			TRNDSC = pData.substring(31, 61);
			try {
				TRNAMT = Double.valueOf(pData.substring(61, 76)).doubleValue() / 100;
			} catch (Exception e) {
				TRNAMT = 0.00;
				logger.log(Level.INFO, "JBDC0060_trnsgl: Failed to process TRNAMT. TRNAMT set to 0.00. \n " + e.getMessage());
			}
			TRNTYP = pData.substring(76, 77);
			TRNTCD = pData.substring(77, 79);
			try {
				TRNEXR = Double.valueOf(pData.substring(79, 94)).doubleValue() / 1000000;
			} catch (Exception e) {
				TRNEXR = 0.00000;
				logger.log(Level.INFO, "JBDC0060_trnsgl: Failed to process TRNEXR. TRNEXR set to 0.00. \n " + e.getMessage());
			}
			try {
				TRNEQV = Double.valueOf(pData.substring(94, 109)).doubleValue() / 100;
			} catch (Exception e) {
				TRNEQV = 0.00;
				logger.log(Level.INFO, "JBDC0060_trnsgl: Failed to process TRNEQV. TRNEQV set to 0.00. \n " + e.getMessage());
			}
			TRNRTY = pData.substring(109, 110);
			TRNBRN = pData.substring(110, 114);
			TRNFCD = pData.substring(114, 117);
			TRNCOA = pData.substring(117, 132);
			TRNCCR = pData.substring(132, 140);
		} else {
			TRNAMT = 0.00;
			TRNEXR = 0.00000;
			TRNEQV = 0.00;
		}

	}

	public String getTRNRTY() {
		return TRNRTY;
	}

	public String getTRNCOA() {
		return TRNCOA;
	}

	public String getTRNCCY() {
		return TRNCCY;
	}

	public String getTRNGLN() {
		return TRNGLN;
	}

	public String getTRNACC() {
		return TRNACC;
	}

	public String getTRNDSC() {
		return TRNDSC;
	}

	public double getTRNAMT() {
		return TRNAMT;
	}

	public String getTRNTYP() {
		return TRNTYP;
	}

	public String getTRNTCD() {
		return TRNTCD;
	}

	public double getTRNEXR() {
		return TRNEXR;
	}

	public String getTRNBRN() {
		return TRNBRN;
	}

	public double getTRNEQV() {
		return TRNEQV;
	}

	public String getTRNFCD() {
		return TRNFCD;
	}
	
	public String getTRNCCR() {
		return TRNCCR;
	}

}