package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EWD9017DS physical file definition.
* 
* File level identifier is 1190219114232.
* Record format level identifier is 4B34FA900F59A.
*/

public class EWD9017DSMessage extends MessageRecord
{
  final static String fldnames[] = {
                                     "RWDUSR",
                                     "RWDCUN",
                                     "RWDTYP",
                                     "RWDFRC",
                                     "SWDBNK",
                                     "SWDCUN",
                                     "SWDOFC",
                                     "SWDNUC",
                                     "SWDLNE",
                                     "SWDIMM",
                                     "SWDIDD",
                                     "SWDIYY",
                                     "SWDUMM",
                                     "SWDUDD",
                                     "SWDUYY",
                                     "SWDPAV",
                                     "SWDENL",
                                     "SWDNUT",
                                     "SWDVND",
                                     "SWDSTS",
                                     "SWDCAU",
                                     "SWDVRC",
                                     "SWDVRA",
                                     "SWDVRD",
                                     "SWDBMM",
                                     "SWDBDD",
                                     "SWDBYY",
                                     "SWDTRA",
                                     "SWDSEQ",
                                     "SWDRE1",
                                     "SWDRE2",
                                     "SWDRE3",
                                     "SWDRE4",
                                     "SWDCMM",
                                     "SWDCDD",
                                     "SWDCYY",
                                     "SWDCTT",
                                     "SWDCMU",
                                     "SWDLMM",
                                     "SWDLDD",
                                     "SWDLYY",
                                     "SWDLTT",
                                     "SWDLMU",
                                     "SWDREC",
                                     "SWDOPE"
                                   };
  final static String tnames[] = {
                                   "RWDUSR",
                                   "RWDCUN",
                                   "RWDTYP",
                                   "RWDFRC",
                                   "SWDBNK",
                                   "SWDCUN",
                                   "SWDOFC",
                                   "SWDNUC",
                                   "SWDLNE",
                                   "SWDIMM",
                                   "SWDIDD",
                                   "SWDIYY",
                                   "SWDUMM",
                                   "SWDUDD",
                                   "SWDUYY",
                                   "SWDPAV",
                                   "SWDENL",
                                   "SWDNUT",
                                   "SWDVND",
                                   "SWDSTS",
                                   "SWDCAU",
                                   "SWDVRC",
                                   "SWDVRA",
                                   "SWDVRD",
                                   "SWDBMM",
                                   "SWDBDD",
                                   "SWDBYY",
                                   "SWDTRA",
                                   "SWDSEQ",
                                   "SWDRE1",
                                   "SWDRE2",
                                   "SWDRE3",
                                   "SWDRE4",
                                   "SWDCMM",
                                   "SWDCDD",
                                   "SWDCYY",
                                   "SWDCTT",
                                   "SWDCMU",
                                   "SWDLMM",
                                   "SWDLDD",
                                   "SWDLYY",
                                   "SWDLTT",
                                   "SWDLMU",
                                   "SWDREC",
                                   "SWDOPE"
                                 };
  final static String fid = "1190219114232";
  final static String rid = "4B34FA900F59A";
  final static String fmtname = "EWD9017DS";
  final int FIELDCOUNT = 45;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldRWDUSR = null;
  private DecimalField fieldRWDCUN = null;
  private CharacterField fieldRWDTYP = null;
  private DecimalField fieldRWDFRC = null;
  private CharacterField fieldSWDBNK = null;
  private DecimalField fieldSWDCUN = null;
  private DecimalField fieldSWDOFC = null;
  private DecimalField fieldSWDNUC = null;
  private DecimalField fieldSWDLNE = null;
  private DecimalField fieldSWDIMM = null;
  private DecimalField fieldSWDIDD = null;
  private DecimalField fieldSWDIYY = null;
  private DecimalField fieldSWDUMM = null;
  private DecimalField fieldSWDUDD = null;
  private DecimalField fieldSWDUYY = null;
  private CharacterField fieldSWDPAV = null;
  private CharacterField fieldSWDENL = null;
  private CharacterField fieldSWDNUT = null;
  private CharacterField fieldSWDVND = null;
  private CharacterField fieldSWDSTS = null;
  private CharacterField fieldSWDCAU = null;
  private DecimalField fieldSWDVRC = null;
  private DecimalField fieldSWDVRA = null;
  private DecimalField fieldSWDVRD = null;
  private DecimalField fieldSWDBMM = null;
  private DecimalField fieldSWDBDD = null;
  private DecimalField fieldSWDBYY = null;
  private CharacterField fieldSWDTRA = null;
  private DecimalField fieldSWDSEQ = null;
  private CharacterField fieldSWDRE1 = null;
  private CharacterField fieldSWDRE2 = null;
  private CharacterField fieldSWDRE3 = null;
  private CharacterField fieldSWDRE4 = null;
  private DecimalField fieldSWDCMM = null;
  private DecimalField fieldSWDCDD = null;
  private DecimalField fieldSWDCYY = null;
  private CharacterField fieldSWDCTT = null;
  private CharacterField fieldSWDCMU = null;
  private DecimalField fieldSWDLMM = null;
  private DecimalField fieldSWDLDD = null;
  private DecimalField fieldSWDLYY = null;
  private CharacterField fieldSWDLTT = null;
  private CharacterField fieldSWDLMU = null;
  private DecimalField fieldSWDREC = null;
  private CharacterField fieldSWDOPE = null;

  /**
  * Constructor for EWD9017DSMessage.
  */
  public EWD9017DSMessage()
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
    recordsize = 414;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldRWDUSR =
    new CharacterField(message, HEADERSIZE + 0, 10, "RWDUSR");
    fields[1] = fieldRWDCUN =
    new DecimalField(message, HEADERSIZE + 10, 10, 0, "RWDCUN");
    fields[2] = fieldRWDTYP =
    new CharacterField(message, HEADERSIZE + 20, 1, "RWDTYP");
    fields[3] = fieldRWDFRC =
    new DecimalField(message, HEADERSIZE + 21, 8, 0, "RWDFRC");
    fields[4] = fieldSWDBNK =
    new CharacterField(message, HEADERSIZE + 29, 2, "SWDBNK");
    fields[5] = fieldSWDCUN =
    new DecimalField(message, HEADERSIZE + 31, 10, 0, "SWDCUN");
    fields[6] = fieldSWDOFC =
    new DecimalField(message, HEADERSIZE + 41, 6, 0, "SWDOFC");
    fields[7] = fieldSWDNUC =
    new DecimalField(message, HEADERSIZE + 47, 13, 0, "SWDNUC");
    fields[8] = fieldSWDLNE =
    new DecimalField(message, HEADERSIZE + 60, 5, 0, "SWDLNE");
    fields[9] = fieldSWDIMM =
    new DecimalField(message, HEADERSIZE + 65, 3, 0, "SWDIMM");
    fields[10] = fieldSWDIDD =
    new DecimalField(message, HEADERSIZE + 68, 3, 0, "SWDIDD");
    fields[11] = fieldSWDIYY =
    new DecimalField(message, HEADERSIZE + 71, 5, 0, "SWDIYY");
    fields[12] = fieldSWDUMM =
    new DecimalField(message, HEADERSIZE + 76, 3, 0, "SWDUMM");
    fields[13] = fieldSWDUDD =
    new DecimalField(message, HEADERSIZE + 79, 3, 0, "SWDUDD");
    fields[14] = fieldSWDUYY =
    new DecimalField(message, HEADERSIZE + 82, 5, 0, "SWDUYY");
    fields[15] = fieldSWDPAV =
    new CharacterField(message, HEADERSIZE + 87, 20, "SWDPAV");
    fields[16] = fieldSWDENL =
    new CharacterField(message, HEADERSIZE + 107, 15, "SWDENL");
    fields[17] = fieldSWDNUT =
    new CharacterField(message, HEADERSIZE + 122, 12, "SWDNUT");
    fields[18] = fieldSWDVND =
    new CharacterField(message, HEADERSIZE + 134, 4, "SWDVND");
    fields[19] = fieldSWDSTS =
    new CharacterField(message, HEADERSIZE + 138, 1, "SWDSTS");
    fields[20] = fieldSWDCAU =
    new CharacterField(message, HEADERSIZE + 139, 4, "SWDCAU");
    fields[21] = fieldSWDVRC =
    new DecimalField(message, HEADERSIZE + 143, 17, 2, "SWDVRC");
    fields[22] = fieldSWDVRA =
    new DecimalField(message, HEADERSIZE + 160, 17, 2, "SWDVRA");
    fields[23] = fieldSWDVRD =
    new DecimalField(message, HEADERSIZE + 177, 17, 2, "SWDVRD");
    fields[24] = fieldSWDBMM =
    new DecimalField(message, HEADERSIZE + 194, 3, 0, "SWDBMM");
    fields[25] = fieldSWDBDD =
    new DecimalField(message, HEADERSIZE + 197, 3, 0, "SWDBDD");
    fields[26] = fieldSWDBYY =
    new DecimalField(message, HEADERSIZE + 200, 5, 0, "SWDBYY");
    fields[27] = fieldSWDTRA =
    new CharacterField(message, HEADERSIZE + 205, 1, "SWDTRA");
    fields[28] = fieldSWDSEQ =
    new DecimalField(message, HEADERSIZE + 206, 5, 0, "SWDSEQ");
    fields[29] = fieldSWDRE1 =
    new CharacterField(message, HEADERSIZE + 211, 25, "SWDRE1");
    fields[30] = fieldSWDRE2 =
    new CharacterField(message, HEADERSIZE + 236, 25, "SWDRE2");
    fields[31] = fieldSWDRE3 =
    new CharacterField(message, HEADERSIZE + 261, 25, "SWDRE3");
    fields[32] = fieldSWDRE4 =
    new CharacterField(message, HEADERSIZE + 286, 25, "SWDRE4");
    fields[33] = fieldSWDCMM =
    new DecimalField(message, HEADERSIZE + 311, 3, 0, "SWDCMM");
    fields[34] = fieldSWDCDD =
    new DecimalField(message, HEADERSIZE + 314, 3, 0, "SWDCDD");
    fields[35] = fieldSWDCYY =
    new DecimalField(message, HEADERSIZE + 317, 5, 0, "SWDCYY");
    fields[36] = fieldSWDCTT =
    new CharacterField(message, HEADERSIZE + 322, 26, "SWDCTT");
    fields[37] = fieldSWDCMU =
    new CharacterField(message, HEADERSIZE + 348, 10, "SWDCMU");
    fields[38] = fieldSWDLMM =
    new DecimalField(message, HEADERSIZE + 358, 3, 0, "SWDLMM");
    fields[39] = fieldSWDLDD =
    new DecimalField(message, HEADERSIZE + 361, 3, 0, "SWDLDD");
    fields[40] = fieldSWDLYY =
    new DecimalField(message, HEADERSIZE + 364, 5, 0, "SWDLYY");
    fields[41] = fieldSWDLTT =
    new CharacterField(message, HEADERSIZE + 369, 26, "SWDLTT");
    fields[42] = fieldSWDLMU =
    new CharacterField(message, HEADERSIZE + 395, 10, "SWDLMU");
    fields[43] = fieldSWDREC =
    new DecimalField(message, HEADERSIZE + 405, 8, 0, "SWDREC");
    fields[44] = fieldSWDOPE =
    new CharacterField(message, HEADERSIZE + 413, 1, "SWDOPE");

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
  * Set field RWDCUN using a String value.
  */
  public void setRWDCUN(String newvalue)
  {
    fieldRWDCUN.setString(newvalue);
  }

  /**
  * Get value of field RWDCUN as a String.
  */
  public String getRWDCUN()
  {
    return fieldRWDCUN.getString();
  }

  /**
  * Set numeric field RWDCUN using a BigDecimal value.
  */
  public void setRWDCUN(BigDecimal newvalue)
  {
    fieldRWDCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field RWDCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalRWDCUN()
  {
    return fieldRWDCUN.getBigDecimal();
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
  * Set field SWDBNK using a String value.
  */
  public void setSWDBNK(String newvalue)
  {
    fieldSWDBNK.setString(newvalue);
  }

  /**
  * Get value of field SWDBNK as a String.
  */
  public String getSWDBNK()
  {
    return fieldSWDBNK.getString();
  }

  /**
  * Set field SWDCUN using a String value.
  */
  public void setSWDCUN(String newvalue)
  {
    fieldSWDCUN.setString(newvalue);
  }

  /**
  * Get value of field SWDCUN as a String.
  */
  public String getSWDCUN()
  {
    return fieldSWDCUN.getString();
  }

  /**
  * Set numeric field SWDCUN using a BigDecimal value.
  */
  public void setSWDCUN(BigDecimal newvalue)
  {
    fieldSWDCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDCUN()
  {
    return fieldSWDCUN.getBigDecimal();
  }

  /**
  * Set field SWDOFC using a String value.
  */
  public void setSWDOFC(String newvalue)
  {
    fieldSWDOFC.setString(newvalue);
  }

  /**
  * Get value of field SWDOFC as a String.
  */
  public String getSWDOFC()
  {
    return fieldSWDOFC.getString();
  }

  /**
  * Set numeric field SWDOFC using a BigDecimal value.
  */
  public void setSWDOFC(BigDecimal newvalue)
  {
    fieldSWDOFC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDOFC as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDOFC()
  {
    return fieldSWDOFC.getBigDecimal();
  }

  /**
  * Set field SWDNUC using a String value.
  */
  public void setSWDNUC(String newvalue)
  {
    fieldSWDNUC.setString(newvalue);
  }

  /**
  * Get value of field SWDNUC as a String.
  */
  public String getSWDNUC()
  {
    return fieldSWDNUC.getString();
  }

  /**
  * Set numeric field SWDNUC using a BigDecimal value.
  */
  public void setSWDNUC(BigDecimal newvalue)
  {
    fieldSWDNUC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDNUC as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDNUC()
  {
    return fieldSWDNUC.getBigDecimal();
  }

  /**
  * Set field SWDLNE using a String value.
  */
  public void setSWDLNE(String newvalue)
  {
    fieldSWDLNE.setString(newvalue);
  }

  /**
  * Get value of field SWDLNE as a String.
  */
  public String getSWDLNE()
  {
    return fieldSWDLNE.getString();
  }

  /**
  * Set numeric field SWDLNE using a BigDecimal value.
  */
  public void setSWDLNE(BigDecimal newvalue)
  {
    fieldSWDLNE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDLNE as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDLNE()
  {
    return fieldSWDLNE.getBigDecimal();
  }

  /**
  * Set field SWDIMM using a String value.
  */
  public void setSWDIMM(String newvalue)
  {
    fieldSWDIMM.setString(newvalue);
  }

  /**
  * Get value of field SWDIMM as a String.
  */
  public String getSWDIMM()
  {
    return fieldSWDIMM.getString();
  }

  /**
  * Set numeric field SWDIMM using a BigDecimal value.
  */
  public void setSWDIMM(BigDecimal newvalue)
  {
    fieldSWDIMM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDIMM as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDIMM()
  {
    return fieldSWDIMM.getBigDecimal();
  }

  /**
  * Set field SWDIDD using a String value.
  */
  public void setSWDIDD(String newvalue)
  {
    fieldSWDIDD.setString(newvalue);
  }

  /**
  * Get value of field SWDIDD as a String.
  */
  public String getSWDIDD()
  {
    return fieldSWDIDD.getString();
  }

  /**
  * Set numeric field SWDIDD using a BigDecimal value.
  */
  public void setSWDIDD(BigDecimal newvalue)
  {
    fieldSWDIDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDIDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDIDD()
  {
    return fieldSWDIDD.getBigDecimal();
  }

  /**
  * Set field SWDIYY using a String value.
  */
  public void setSWDIYY(String newvalue)
  {
    fieldSWDIYY.setString(newvalue);
  }

  /**
  * Get value of field SWDIYY as a String.
  */
  public String getSWDIYY()
  {
    return fieldSWDIYY.getString();
  }

  /**
  * Set numeric field SWDIYY using a BigDecimal value.
  */
  public void setSWDIYY(BigDecimal newvalue)
  {
    fieldSWDIYY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDIYY as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDIYY()
  {
    return fieldSWDIYY.getBigDecimal();
  }

  /**
  * Set field SWDUMM using a String value.
  */
  public void setSWDUMM(String newvalue)
  {
    fieldSWDUMM.setString(newvalue);
  }

  /**
  * Get value of field SWDUMM as a String.
  */
  public String getSWDUMM()
  {
    return fieldSWDUMM.getString();
  }

  /**
  * Set numeric field SWDUMM using a BigDecimal value.
  */
  public void setSWDUMM(BigDecimal newvalue)
  {
    fieldSWDUMM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDUMM as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDUMM()
  {
    return fieldSWDUMM.getBigDecimal();
  }

  /**
  * Set field SWDUDD using a String value.
  */
  public void setSWDUDD(String newvalue)
  {
    fieldSWDUDD.setString(newvalue);
  }

  /**
  * Get value of field SWDUDD as a String.
  */
  public String getSWDUDD()
  {
    return fieldSWDUDD.getString();
  }

  /**
  * Set numeric field SWDUDD using a BigDecimal value.
  */
  public void setSWDUDD(BigDecimal newvalue)
  {
    fieldSWDUDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDUDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDUDD()
  {
    return fieldSWDUDD.getBigDecimal();
  }

  /**
  * Set field SWDUYY using a String value.
  */
  public void setSWDUYY(String newvalue)
  {
    fieldSWDUYY.setString(newvalue);
  }

  /**
  * Get value of field SWDUYY as a String.
  */
  public String getSWDUYY()
  {
    return fieldSWDUYY.getString();
  }

  /**
  * Set numeric field SWDUYY using a BigDecimal value.
  */
  public void setSWDUYY(BigDecimal newvalue)
  {
    fieldSWDUYY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDUYY as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDUYY()
  {
    return fieldSWDUYY.getBigDecimal();
  }

  /**
  * Set field SWDPAV using a String value.
  */
  public void setSWDPAV(String newvalue)
  {
    fieldSWDPAV.setString(newvalue);
  }

  /**
  * Get value of field SWDPAV as a String.
  */
  public String getSWDPAV()
  {
    return fieldSWDPAV.getString();
  }

  /**
  * Set field SWDENL using a String value.
  */
  public void setSWDENL(String newvalue)
  {
    fieldSWDENL.setString(newvalue);
  }

  /**
  * Get value of field SWDENL as a String.
  */
  public String getSWDENL()
  {
    return fieldSWDENL.getString();
  }

  /**
  * Set field SWDNUT using a String value.
  */
  public void setSWDNUT(String newvalue)
  {
    fieldSWDNUT.setString(newvalue);
  }

  /**
  * Get value of field SWDNUT as a String.
  */
  public String getSWDNUT()
  {
    return fieldSWDNUT.getString();
  }

  /**
  * Set field SWDVND using a String value.
  */
  public void setSWDVND(String newvalue)
  {
    fieldSWDVND.setString(newvalue);
  }

  /**
  * Get value of field SWDVND as a String.
  */
  public String getSWDVND()
  {
    return fieldSWDVND.getString();
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
  * Set field SWDCAU using a String value.
  */
  public void setSWDCAU(String newvalue)
  {
    fieldSWDCAU.setString(newvalue);
  }

  /**
  * Get value of field SWDCAU as a String.
  */
  public String getSWDCAU()
  {
    return fieldSWDCAU.getString();
  }

  /**
  * Set field SWDVRC using a String value.
  */
  public void setSWDVRC(String newvalue)
  {
    fieldSWDVRC.setString(newvalue);
  }

  /**
  * Get value of field SWDVRC as a String.
  */
  public String getSWDVRC()
  {
    return fieldSWDVRC.getString();
  }

  /**
  * Set numeric field SWDVRC using a BigDecimal value.
  */
  public void setSWDVRC(BigDecimal newvalue)
  {
    fieldSWDVRC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDVRC as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDVRC()
  {
    return fieldSWDVRC.getBigDecimal();
  }

  /**
  * Set field SWDVRA using a String value.
  */
  public void setSWDVRA(String newvalue)
  {
    fieldSWDVRA.setString(newvalue);
  }

  /**
  * Get value of field SWDVRA as a String.
  */
  public String getSWDVRA()
  {
    return fieldSWDVRA.getString();
  }

  /**
  * Set numeric field SWDVRA using a BigDecimal value.
  */
  public void setSWDVRA(BigDecimal newvalue)
  {
    fieldSWDVRA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDVRA as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDVRA()
  {
    return fieldSWDVRA.getBigDecimal();
  }

  /**
  * Set field SWDVRD using a String value.
  */
  public void setSWDVRD(String newvalue)
  {
    fieldSWDVRD.setString(newvalue);
  }

  /**
  * Get value of field SWDVRD as a String.
  */
  public String getSWDVRD()
  {
    return fieldSWDVRD.getString();
  }

  /**
  * Set numeric field SWDVRD using a BigDecimal value.
  */
  public void setSWDVRD(BigDecimal newvalue)
  {
    fieldSWDVRD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDVRD as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDVRD()
  {
    return fieldSWDVRD.getBigDecimal();
  }

  /**
  * Set field SWDBMM using a String value.
  */
  public void setSWDBMM(String newvalue)
  {
    fieldSWDBMM.setString(newvalue);
  }

  /**
  * Get value of field SWDBMM as a String.
  */
  public String getSWDBMM()
  {
    return fieldSWDBMM.getString();
  }

  /**
  * Set numeric field SWDBMM using a BigDecimal value.
  */
  public void setSWDBMM(BigDecimal newvalue)
  {
    fieldSWDBMM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDBMM as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDBMM()
  {
    return fieldSWDBMM.getBigDecimal();
  }

  /**
  * Set field SWDBDD using a String value.
  */
  public void setSWDBDD(String newvalue)
  {
    fieldSWDBDD.setString(newvalue);
  }

  /**
  * Get value of field SWDBDD as a String.
  */
  public String getSWDBDD()
  {
    return fieldSWDBDD.getString();
  }

  /**
  * Set numeric field SWDBDD using a BigDecimal value.
  */
  public void setSWDBDD(BigDecimal newvalue)
  {
    fieldSWDBDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDBDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDBDD()
  {
    return fieldSWDBDD.getBigDecimal();
  }

  /**
  * Set field SWDBYY using a String value.
  */
  public void setSWDBYY(String newvalue)
  {
    fieldSWDBYY.setString(newvalue);
  }

  /**
  * Get value of field SWDBYY as a String.
  */
  public String getSWDBYY()
  {
    return fieldSWDBYY.getString();
  }

  /**
  * Set numeric field SWDBYY using a BigDecimal value.
  */
  public void setSWDBYY(BigDecimal newvalue)
  {
    fieldSWDBYY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDBYY as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDBYY()
  {
    return fieldSWDBYY.getBigDecimal();
  }

  /**
  * Set field SWDTRA using a String value.
  */
  public void setSWDTRA(String newvalue)
  {
    fieldSWDTRA.setString(newvalue);
  }

  /**
  * Get value of field SWDTRA as a String.
  */
  public String getSWDTRA()
  {
    return fieldSWDTRA.getString();
  }

  /**
  * Set field SWDSEQ using a String value.
  */
  public void setSWDSEQ(String newvalue)
  {
    fieldSWDSEQ.setString(newvalue);
  }

  /**
  * Get value of field SWDSEQ as a String.
  */
  public String getSWDSEQ()
  {
    return fieldSWDSEQ.getString();
  }

  /**
  * Set numeric field SWDSEQ using a BigDecimal value.
  */
  public void setSWDSEQ(BigDecimal newvalue)
  {
    fieldSWDSEQ.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDSEQ as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDSEQ()
  {
    return fieldSWDSEQ.getBigDecimal();
  }

  /**
  * Set field SWDRE1 using a String value.
  */
  public void setSWDRE1(String newvalue)
  {
    fieldSWDRE1.setString(newvalue);
  }

  /**
  * Get value of field SWDRE1 as a String.
  */
  public String getSWDRE1()
  {
    return fieldSWDRE1.getString();
  }

  /**
  * Set field SWDRE2 using a String value.
  */
  public void setSWDRE2(String newvalue)
  {
    fieldSWDRE2.setString(newvalue);
  }

  /**
  * Get value of field SWDRE2 as a String.
  */
  public String getSWDRE2()
  {
    return fieldSWDRE2.getString();
  }

  /**
  * Set field SWDRE3 using a String value.
  */
  public void setSWDRE3(String newvalue)
  {
    fieldSWDRE3.setString(newvalue);
  }

  /**
  * Get value of field SWDRE3 as a String.
  */
  public String getSWDRE3()
  {
    return fieldSWDRE3.getString();
  }

  /**
  * Set field SWDRE4 using a String value.
  */
  public void setSWDRE4(String newvalue)
  {
    fieldSWDRE4.setString(newvalue);
  }

  /**
  * Get value of field SWDRE4 as a String.
  */
  public String getSWDRE4()
  {
    return fieldSWDRE4.getString();
  }

  /**
  * Set field SWDCMM using a String value.
  */
  public void setSWDCMM(String newvalue)
  {
    fieldSWDCMM.setString(newvalue);
  }

  /**
  * Get value of field SWDCMM as a String.
  */
  public String getSWDCMM()
  {
    return fieldSWDCMM.getString();
  }

  /**
  * Set numeric field SWDCMM using a BigDecimal value.
  */
  public void setSWDCMM(BigDecimal newvalue)
  {
    fieldSWDCMM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDCMM as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDCMM()
  {
    return fieldSWDCMM.getBigDecimal();
  }

  /**
  * Set field SWDCDD using a String value.
  */
  public void setSWDCDD(String newvalue)
  {
    fieldSWDCDD.setString(newvalue);
  }

  /**
  * Get value of field SWDCDD as a String.
  */
  public String getSWDCDD()
  {
    return fieldSWDCDD.getString();
  }

  /**
  * Set numeric field SWDCDD using a BigDecimal value.
  */
  public void setSWDCDD(BigDecimal newvalue)
  {
    fieldSWDCDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDCDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDCDD()
  {
    return fieldSWDCDD.getBigDecimal();
  }

  /**
  * Set field SWDCYY using a String value.
  */
  public void setSWDCYY(String newvalue)
  {
    fieldSWDCYY.setString(newvalue);
  }

  /**
  * Get value of field SWDCYY as a String.
  */
  public String getSWDCYY()
  {
    return fieldSWDCYY.getString();
  }

  /**
  * Set numeric field SWDCYY using a BigDecimal value.
  */
  public void setSWDCYY(BigDecimal newvalue)
  {
    fieldSWDCYY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDCYY as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDCYY()
  {
    return fieldSWDCYY.getBigDecimal();
  }

  /**
  * Set field SWDCTT using a String value.
  */
  public void setSWDCTT(String newvalue)
  {
    fieldSWDCTT.setString(newvalue);
  }

  /**
  * Get value of field SWDCTT as a String.
  */
  public String getSWDCTT()
  {
    return fieldSWDCTT.getString();
  }

  /**
  * Set field SWDCMU using a String value.
  */
  public void setSWDCMU(String newvalue)
  {
    fieldSWDCMU.setString(newvalue);
  }

  /**
  * Get value of field SWDCMU as a String.
  */
  public String getSWDCMU()
  {
    return fieldSWDCMU.getString();
  }

  /**
  * Set field SWDLMM using a String value.
  */
  public void setSWDLMM(String newvalue)
  {
    fieldSWDLMM.setString(newvalue);
  }

  /**
  * Get value of field SWDLMM as a String.
  */
  public String getSWDLMM()
  {
    return fieldSWDLMM.getString();
  }

  /**
  * Set numeric field SWDLMM using a BigDecimal value.
  */
  public void setSWDLMM(BigDecimal newvalue)
  {
    fieldSWDLMM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDLMM as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDLMM()
  {
    return fieldSWDLMM.getBigDecimal();
  }

  /**
  * Set field SWDLDD using a String value.
  */
  public void setSWDLDD(String newvalue)
  {
    fieldSWDLDD.setString(newvalue);
  }

  /**
  * Get value of field SWDLDD as a String.
  */
  public String getSWDLDD()
  {
    return fieldSWDLDD.getString();
  }

  /**
  * Set numeric field SWDLDD using a BigDecimal value.
  */
  public void setSWDLDD(BigDecimal newvalue)
  {
    fieldSWDLDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDLDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDLDD()
  {
    return fieldSWDLDD.getBigDecimal();
  }

  /**
  * Set field SWDLYY using a String value.
  */
  public void setSWDLYY(String newvalue)
  {
    fieldSWDLYY.setString(newvalue);
  }

  /**
  * Get value of field SWDLYY as a String.
  */
  public String getSWDLYY()
  {
    return fieldSWDLYY.getString();
  }

  /**
  * Set numeric field SWDLYY using a BigDecimal value.
  */
  public void setSWDLYY(BigDecimal newvalue)
  {
    fieldSWDLYY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDLYY as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDLYY()
  {
    return fieldSWDLYY.getBigDecimal();
  }

  /**
  * Set field SWDLTT using a String value.
  */
  public void setSWDLTT(String newvalue)
  {
    fieldSWDLTT.setString(newvalue);
  }

  /**
  * Get value of field SWDLTT as a String.
  */
  public String getSWDLTT()
  {
    return fieldSWDLTT.getString();
  }

  /**
  * Set field SWDLMU using a String value.
  */
  public void setSWDLMU(String newvalue)
  {
    fieldSWDLMU.setString(newvalue);
  }

  /**
  * Get value of field SWDLMU as a String.
  */
  public String getSWDLMU()
  {
    return fieldSWDLMU.getString();
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
