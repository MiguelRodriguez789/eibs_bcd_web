package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EWD0316DS physical file definition.
* 
* File level identifier is 1130611113452.
* Record format level identifier is 5009A94346668.
*/

public class EWD0316DSMessage extends MessageRecord
{
  final static String fldnames[] = {
                                     "RWDUSR",
                                     "RWDTYP",
                                     "RWDFRC",
                                     "SWDSTS",
                                     "SWDSDS",
                                     "SWDIIC",
                                     "SWDCUC",
                                     "SWDCNM",
                                     "SWDTYP",
                                     "SWDPDS",
                                     "SWDPM1",
                                     "SWDPM2",
                                     "SWDPM3",
                                     "SWDPMT",
                                     "SWDFR1",
                                     "SWDFR2",
                                     "SWDFR3",
                                     "SWDTO1",
                                     "SWDTO2",
                                     "SWDTO3",
                                     "SWDAMT",
                                     "SWDCOM",
                                     "SWDPAM",
                                     "SWDDAM",
                                     "SWDIDS",
                                     "SWDPTY",
                                     "SWDISI",
                                     "SWDCCY",
                                     "SWDRCD",
                                     "SWDREC",
                                     "SWDOPE"
                                   };
  final static String tnames[] = {
                                   "RWDUSR",
                                   "RWDTYP",
                                   "RWDFRC",
                                   "SWDSTS",
                                   "SWDSDS",
                                   "SWDIIC",
                                   "SWDCUC",
                                   "SWDCNM",
                                   "SWDTYP",
                                   "SWDPDS",
                                   "SWDPM1",
                                   "SWDPM2",
                                   "SWDPM3",
                                   "SWDPMT",
                                   "SWDFR1",
                                   "SWDFR2",
                                   "SWDFR3",
                                   "SWDTO1",
                                   "SWDTO2",
                                   "SWDTO3",
                                   "SWDAMT",
                                   "SWDCOM",
                                   "SWDPAM",
                                   "SWDDAM",
                                   "SWDIDS",
                                   "SWDPTY",
                                   "SWDISI",
                                   "SWDCCY",
                                   "SWDRCD",
                                   "SWDREC",
                                   "SWDOPE"
                                 };
  final static String fid = "1130611113452";
  final static String rid = "5009A94346668";
  final static String fmtname = "EWD0316DS";
  final int FIELDCOUNT = 31;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldRWDUSR = null;
  private CharacterField fieldRWDTYP = null;
  private DecimalField fieldRWDFRC = null;
  private CharacterField fieldSWDSTS = null;
  private CharacterField fieldSWDSDS = null;
  private DecimalField fieldSWDIIC = null;
  private CharacterField fieldSWDCUC = null;
  private CharacterField fieldSWDCNM = null;
  private CharacterField fieldSWDTYP = null;
  private CharacterField fieldSWDPDS = null;
  private DecimalField fieldSWDPM1 = null;
  private DecimalField fieldSWDPM2 = null;
  private DecimalField fieldSWDPM3 = null;
  private DecimalField fieldSWDPMT = null;
  private DecimalField fieldSWDFR1 = null;
  private DecimalField fieldSWDFR2 = null;
  private DecimalField fieldSWDFR3 = null;
  private DecimalField fieldSWDTO1 = null;
  private DecimalField fieldSWDTO2 = null;
  private DecimalField fieldSWDTO3 = null;
  private DecimalField fieldSWDAMT = null;
  private DecimalField fieldSWDCOM = null;
  private DecimalField fieldSWDPAM = null;
  private DecimalField fieldSWDDAM = null;
  private CharacterField fieldSWDIDS = null;
  private CharacterField fieldSWDPTY = null;
  private CharacterField fieldSWDISI = null;
  private CharacterField fieldSWDCCY = null;
  private DecimalField fieldSWDRCD = null;
  private DecimalField fieldSWDREC = null;
  private CharacterField fieldSWDOPE = null;

  /**
  * Constructor for EWD0316DSMessage.
  */
  public EWD0316DSMessage()
  {
    createFields();
    initialize();
  }

  /**
  * Create fields for this message.
  * This method implements the abstract method in the MessageRecord superclass.
  */
  protected void createFields()
  {
    recordsize = 375;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldRWDUSR =
    new CharacterField(message, HEADERSIZE + 0, 10, "RWDUSR");
    fields[1] = fieldRWDTYP =
    new CharacterField(message, HEADERSIZE + 10, 1, "RWDTYP");
    fields[2] = fieldRWDFRC =
    new DecimalField(message, HEADERSIZE + 11, 8, 0, "RWDFRC");
    fields[3] = fieldSWDSTS =
    new CharacterField(message, HEADERSIZE + 19, 1, "SWDSTS");
    fields[4] = fieldSWDSDS =
    new CharacterField(message, HEADERSIZE + 20, 45, "SWDSDS");
    fields[5] = fieldSWDIIC =
    new DecimalField(message, HEADERSIZE + 65, 13, 0, "SWDIIC");
    fields[6] = fieldSWDCUC =
    new CharacterField(message, HEADERSIZE + 78, 4, "SWDCUC");
    fields[7] = fieldSWDCNM =
    new CharacterField(message, HEADERSIZE + 82, 45, "SWDCNM");
    fields[8] = fieldSWDTYP =
    new CharacterField(message, HEADERSIZE + 127, 1, "SWDTYP");
    fields[9] = fieldSWDPDS =
    new CharacterField(message, HEADERSIZE + 128, 45, "SWDPDS");
    fields[10] = fieldSWDPM1 =
    new DecimalField(message, HEADERSIZE + 173, 3, 0, "SWDPM1");
    fields[11] = fieldSWDPM2 =
    new DecimalField(message, HEADERSIZE + 176, 3, 0, "SWDPM2");
    fields[12] = fieldSWDPM3 =
    new DecimalField(message, HEADERSIZE + 179, 5, 0, "SWDPM3");
    fields[13] = fieldSWDPMT =
    new DecimalField(message, HEADERSIZE + 184, 7, 0, "SWDPMT");
    fields[14] = fieldSWDFR1 =
    new DecimalField(message, HEADERSIZE + 191, 3, 0, "SWDFR1");
    fields[15] = fieldSWDFR2 =
    new DecimalField(message, HEADERSIZE + 194, 3, 0, "SWDFR2");
    fields[16] = fieldSWDFR3 =
    new DecimalField(message, HEADERSIZE + 197, 5, 0, "SWDFR3");
    fields[17] = fieldSWDTO1 =
    new DecimalField(message, HEADERSIZE + 202, 3, 0, "SWDTO1");
    fields[18] = fieldSWDTO2 =
    new DecimalField(message, HEADERSIZE + 205, 3, 0, "SWDTO2");
    fields[19] = fieldSWDTO3 =
    new DecimalField(message, HEADERSIZE + 208, 5, 0, "SWDTO3");
    fields[20] = fieldSWDAMT =
    new DecimalField(message, HEADERSIZE + 213, 17, 2, "SWDAMT");
    fields[21] = fieldSWDCOM =
    new DecimalField(message, HEADERSIZE + 230, 17, 2, "SWDCOM");
    fields[22] = fieldSWDPAM =
    new DecimalField(message, HEADERSIZE + 247, 17, 2, "SWDPAM");
    fields[23] = fieldSWDDAM =
    new DecimalField(message, HEADERSIZE + 264, 17, 2, "SWDDAM");
    fields[24] = fieldSWDIDS =
    new CharacterField(message, HEADERSIZE + 281, 60, "SWDIDS");
    fields[25] = fieldSWDPTY =
    new CharacterField(message, HEADERSIZE + 341, 4, "SWDPTY");
    fields[26] = fieldSWDISI =
    new CharacterField(message, HEADERSIZE + 345, 12, "SWDISI");
    fields[27] = fieldSWDCCY =
    new CharacterField(message, HEADERSIZE + 357, 3, "SWDCCY");
    fields[28] = fieldSWDRCD =
    new DecimalField(message, HEADERSIZE + 360, 6, 0, "SWDRCD");
    fields[29] = fieldSWDREC =
    new DecimalField(message, HEADERSIZE + 366, 8, 0, "SWDREC");
    fields[30] = fieldSWDOPE =
    new CharacterField(message, HEADERSIZE + 374, 1, "SWDOPE");

    synchronized (tlookup)
    {
      if (tlookup.isEmpty())
      {
        for (int i = 0; i < tnames.length; i++)
          tlookup.put(tnames[i], new Integer(i));
      }
    }

    taglookup = tlookup;
  }

  /**
  * Set field RWDUSR using a String value.
  */
  public void setRWDUSR(String newvalue)
  {
    fieldRWDUSR.setString(newvalue);
  }

  /**
  * Get value of field RWDUSR as a String.
  */
  public String getRWDUSR()
  {
    return fieldRWDUSR.getString();
  }

  /**
  * Set field RWDTYP using a String value.
  */
  public void setRWDTYP(String newvalue)
  {
    fieldRWDTYP.setString(newvalue);
  }

  /**
  * Get value of field RWDTYP as a String.
  */
  public String getRWDTYP()
  {
    return fieldRWDTYP.getString();
  }

  /**
  * Set field RWDFRC using a String value.
  */
  public void setRWDFRC(String newvalue)
  {
    fieldRWDFRC.setString(newvalue);
  }

  /**
  * Get value of field RWDFRC as a String.
  */
  public String getRWDFRC()
  {
    return fieldRWDFRC.getString();
  }

  /**
  * Set numeric field RWDFRC using a BigDecimal value.
  */
  public void setRWDFRC(BigDecimal newvalue)
  {
    fieldRWDFRC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field RWDFRC as a BigDecimal.
  */
  public BigDecimal getBigDecimalRWDFRC()
  {
    return fieldRWDFRC.getBigDecimal();
  }

  /**
  * Set field SWDSTS using a String value.
  */
  public void setSWDSTS(String newvalue)
  {
    fieldSWDSTS.setString(newvalue);
  }

  /**
  * Get value of field SWDSTS as a String.
  */
  public String getSWDSTS()
  {
    return fieldSWDSTS.getString();
  }

  /**
  * Set field SWDSDS using a String value.
  */
  public void setSWDSDS(String newvalue)
  {
    fieldSWDSDS.setString(newvalue);
  }

  /**
  * Get value of field SWDSDS as a String.
  */
  public String getSWDSDS()
  {
    return fieldSWDSDS.getString();
  }

  /**
  * Set field SWDIIC using a String value.
  */
  public void setSWDIIC(String newvalue)
  {
    fieldSWDIIC.setString(newvalue);
  }

  /**
  * Get value of field SWDIIC as a String.
  */
  public String getSWDIIC()
  {
    return fieldSWDIIC.getString();
  }

  /**
  * Set numeric field SWDIIC using a BigDecimal value.
  */
  public void setSWDIIC(BigDecimal newvalue)
  {
    fieldSWDIIC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDIIC as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDIIC()
  {
    return fieldSWDIIC.getBigDecimal();
  }

  /**
  * Set field SWDCUC using a String value.
  */
  public void setSWDCUC(String newvalue)
  {
    fieldSWDCUC.setString(newvalue);
  }

  /**
  * Get value of field SWDCUC as a String.
  */
  public String getSWDCUC()
  {
    return fieldSWDCUC.getString();
  }

  /**
  * Set field SWDCNM using a String value.
  */
  public void setSWDCNM(String newvalue)
  {
    fieldSWDCNM.setString(newvalue);
  }

  /**
  * Get value of field SWDCNM as a String.
  */
  public String getSWDCNM()
  {
    return fieldSWDCNM.getString();
  }

  /**
  * Set field SWDTYP using a String value.
  */
  public void setSWDTYP(String newvalue)
  {
    fieldSWDTYP.setString(newvalue);
  }

  /**
  * Get value of field SWDTYP as a String.
  */
  public String getSWDTYP()
  {
    return fieldSWDTYP.getString();
  }

  /**
  * Set field SWDPDS using a String value.
  */
  public void setSWDPDS(String newvalue)
  {
    fieldSWDPDS.setString(newvalue);
  }

  /**
  * Get value of field SWDPDS as a String.
  */
  public String getSWDPDS()
  {
    return fieldSWDPDS.getString();
  }

  /**
  * Set field SWDPM1 using a String value.
  */
  public void setSWDPM1(String newvalue)
  {
    fieldSWDPM1.setString(newvalue);
  }

  /**
  * Get value of field SWDPM1 as a String.
  */
  public String getSWDPM1()
  {
    return fieldSWDPM1.getString();
  }

  /**
  * Set numeric field SWDPM1 using a BigDecimal value.
  */
  public void setSWDPM1(BigDecimal newvalue)
  {
    fieldSWDPM1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDPM1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDPM1()
  {
    return fieldSWDPM1.getBigDecimal();
  }

  /**
  * Set field SWDPM2 using a String value.
  */
  public void setSWDPM2(String newvalue)
  {
    fieldSWDPM2.setString(newvalue);
  }

  /**
  * Get value of field SWDPM2 as a String.
  */
  public String getSWDPM2()
  {
    return fieldSWDPM2.getString();
  }

  /**
  * Set numeric field SWDPM2 using a BigDecimal value.
  */
  public void setSWDPM2(BigDecimal newvalue)
  {
    fieldSWDPM2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDPM2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDPM2()
  {
    return fieldSWDPM2.getBigDecimal();
  }

  /**
  * Set field SWDPM3 using a String value.
  */
  public void setSWDPM3(String newvalue)
  {
    fieldSWDPM3.setString(newvalue);
  }

  /**
  * Get value of field SWDPM3 as a String.
  */
  public String getSWDPM3()
  {
    return fieldSWDPM3.getString();
  }

  /**
  * Set numeric field SWDPM3 using a BigDecimal value.
  */
  public void setSWDPM3(BigDecimal newvalue)
  {
    fieldSWDPM3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDPM3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDPM3()
  {
    return fieldSWDPM3.getBigDecimal();
  }

  /**
  * Set field SWDPMT using a String value.
  */
  public void setSWDPMT(String newvalue)
  {
    fieldSWDPMT.setString(newvalue);
  }

  /**
  * Get value of field SWDPMT as a String.
  */
  public String getSWDPMT()
  {
    return fieldSWDPMT.getString();
  }

  /**
  * Set numeric field SWDPMT using a BigDecimal value.
  */
  public void setSWDPMT(BigDecimal newvalue)
  {
    fieldSWDPMT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDPMT as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDPMT()
  {
    return fieldSWDPMT.getBigDecimal();
  }

  /**
  * Set field SWDFR1 using a String value.
  */
  public void setSWDFR1(String newvalue)
  {
    fieldSWDFR1.setString(newvalue);
  }

  /**
  * Get value of field SWDFR1 as a String.
  */
  public String getSWDFR1()
  {
    return fieldSWDFR1.getString();
  }

  /**
  * Set numeric field SWDFR1 using a BigDecimal value.
  */
  public void setSWDFR1(BigDecimal newvalue)
  {
    fieldSWDFR1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDFR1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDFR1()
  {
    return fieldSWDFR1.getBigDecimal();
  }

  /**
  * Set field SWDFR2 using a String value.
  */
  public void setSWDFR2(String newvalue)
  {
    fieldSWDFR2.setString(newvalue);
  }

  /**
  * Get value of field SWDFR2 as a String.
  */
  public String getSWDFR2()
  {
    return fieldSWDFR2.getString();
  }

  /**
  * Set numeric field SWDFR2 using a BigDecimal value.
  */
  public void setSWDFR2(BigDecimal newvalue)
  {
    fieldSWDFR2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDFR2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDFR2()
  {
    return fieldSWDFR2.getBigDecimal();
  }

  /**
  * Set field SWDFR3 using a String value.
  */
  public void setSWDFR3(String newvalue)
  {
    fieldSWDFR3.setString(newvalue);
  }

  /**
  * Get value of field SWDFR3 as a String.
  */
  public String getSWDFR3()
  {
    return fieldSWDFR3.getString();
  }

  /**
  * Set numeric field SWDFR3 using a BigDecimal value.
  */
  public void setSWDFR3(BigDecimal newvalue)
  {
    fieldSWDFR3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDFR3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDFR3()
  {
    return fieldSWDFR3.getBigDecimal();
  }

  /**
  * Set field SWDTO1 using a String value.
  */
  public void setSWDTO1(String newvalue)
  {
    fieldSWDTO1.setString(newvalue);
  }

  /**
  * Get value of field SWDTO1 as a String.
  */
  public String getSWDTO1()
  {
    return fieldSWDTO1.getString();
  }

  /**
  * Set numeric field SWDTO1 using a BigDecimal value.
  */
  public void setSWDTO1(BigDecimal newvalue)
  {
    fieldSWDTO1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDTO1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDTO1()
  {
    return fieldSWDTO1.getBigDecimal();
  }

  /**
  * Set field SWDTO2 using a String value.
  */
  public void setSWDTO2(String newvalue)
  {
    fieldSWDTO2.setString(newvalue);
  }

  /**
  * Get value of field SWDTO2 as a String.
  */
  public String getSWDTO2()
  {
    return fieldSWDTO2.getString();
  }

  /**
  * Set numeric field SWDTO2 using a BigDecimal value.
  */
  public void setSWDTO2(BigDecimal newvalue)
  {
    fieldSWDTO2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDTO2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDTO2()
  {
    return fieldSWDTO2.getBigDecimal();
  }

  /**
  * Set field SWDTO3 using a String value.
  */
  public void setSWDTO3(String newvalue)
  {
    fieldSWDTO3.setString(newvalue);
  }

  /**
  * Get value of field SWDTO3 as a String.
  */
  public String getSWDTO3()
  {
    return fieldSWDTO3.getString();
  }

  /**
  * Set numeric field SWDTO3 using a BigDecimal value.
  */
  public void setSWDTO3(BigDecimal newvalue)
  {
    fieldSWDTO3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDTO3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDTO3()
  {
    return fieldSWDTO3.getBigDecimal();
  }

  /**
  * Set field SWDAMT using a String value.
  */
  public void setSWDAMT(String newvalue)
  {
    fieldSWDAMT.setString(newvalue);
  }

  /**
  * Get value of field SWDAMT as a String.
  */
  public String getSWDAMT()
  {
    return fieldSWDAMT.getString();
  }

  /**
  * Set numeric field SWDAMT using a BigDecimal value.
  */
  public void setSWDAMT(BigDecimal newvalue)
  {
    fieldSWDAMT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDAMT as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDAMT()
  {
    return fieldSWDAMT.getBigDecimal();
  }

  /**
  * Set field SWDCOM using a String value.
  */
  public void setSWDCOM(String newvalue)
  {
    fieldSWDCOM.setString(newvalue);
  }

  /**
  * Get value of field SWDCOM as a String.
  */
  public String getSWDCOM()
  {
    return fieldSWDCOM.getString();
  }

  /**
  * Set numeric field SWDCOM using a BigDecimal value.
  */
  public void setSWDCOM(BigDecimal newvalue)
  {
    fieldSWDCOM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDCOM as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDCOM()
  {
    return fieldSWDCOM.getBigDecimal();
  }

  /**
  * Set field SWDPAM using a String value.
  */
  public void setSWDPAM(String newvalue)
  {
    fieldSWDPAM.setString(newvalue);
  }

  /**
  * Get value of field SWDPAM as a String.
  */
  public String getSWDPAM()
  {
    return fieldSWDPAM.getString();
  }

  /**
  * Set numeric field SWDPAM using a BigDecimal value.
  */
  public void setSWDPAM(BigDecimal newvalue)
  {
    fieldSWDPAM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDPAM as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDPAM()
  {
    return fieldSWDPAM.getBigDecimal();
  }

  /**
  * Set field SWDDAM using a String value.
  */
  public void setSWDDAM(String newvalue)
  {
    fieldSWDDAM.setString(newvalue);
  }

  /**
  * Get value of field SWDDAM as a String.
  */
  public String getSWDDAM()
  {
    return fieldSWDDAM.getString();
  }

  /**
  * Set numeric field SWDDAM using a BigDecimal value.
  */
  public void setSWDDAM(BigDecimal newvalue)
  {
    fieldSWDDAM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDDAM as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDDAM()
  {
    return fieldSWDDAM.getBigDecimal();
  }

  /**
  * Set field SWDIDS using a String value.
  */
  public void setSWDIDS(String newvalue)
  {
    fieldSWDIDS.setString(newvalue);
  }

  /**
  * Get value of field SWDIDS as a String.
  */
  public String getSWDIDS()
  {
    return fieldSWDIDS.getString();
  }

  /**
  * Set field SWDPTY using a String value.
  */
  public void setSWDPTY(String newvalue)
  {
    fieldSWDPTY.setString(newvalue);
  }

  /**
  * Get value of field SWDPTY as a String.
  */
  public String getSWDPTY()
  {
    return fieldSWDPTY.getString();
  }

  /**
  * Set field SWDISI using a String value.
  */
  public void setSWDISI(String newvalue)
  {
    fieldSWDISI.setString(newvalue);
  }

  /**
  * Get value of field SWDISI as a String.
  */
  public String getSWDISI()
  {
    return fieldSWDISI.getString();
  }

  /**
  * Set field SWDCCY using a String value.
  */
  public void setSWDCCY(String newvalue)
  {
    fieldSWDCCY.setString(newvalue);
  }

  /**
  * Get value of field SWDCCY as a String.
  */
  public String getSWDCCY()
  {
    return fieldSWDCCY.getString();
  }

  /**
  * Set field SWDRCD using a String value.
  */
  public void setSWDRCD(String newvalue)
  {
    fieldSWDRCD.setString(newvalue);
  }

  /**
  * Get value of field SWDRCD as a String.
  */
  public String getSWDRCD()
  {
    return fieldSWDRCD.getString();
  }

  /**
  * Set numeric field SWDRCD using a BigDecimal value.
  */
  public void setSWDRCD(BigDecimal newvalue)
  {
    fieldSWDRCD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDRCD as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDRCD()
  {
    return fieldSWDRCD.getBigDecimal();
  }

  /**
  * Set field SWDREC using a String value.
  */
  public void setSWDREC(String newvalue)
  {
    fieldSWDREC.setString(newvalue);
  }

  /**
  * Get value of field SWDREC as a String.
  */
  public String getSWDREC()
  {
    return fieldSWDREC.getString();
  }

  /**
  * Set numeric field SWDREC using a BigDecimal value.
  */
  public void setSWDREC(BigDecimal newvalue)
  {
    fieldSWDREC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDREC as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDREC()
  {
    return fieldSWDREC.getBigDecimal();
  }

  /**
  * Set field SWDOPE using a String value.
  */
  public void setSWDOPE(String newvalue)
  {
    fieldSWDOPE.setString(newvalue);
  }

  /**
  * Get value of field SWDOPE as a String.
  */
  public String getSWDOPE()
  {
    return fieldSWDOPE.getString();
  }

}
