package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EWD0333DS physical file definition.
* 
* File level identifier is 1130611113453.
* Record format level identifier is 3EF14C3BEED17.
*/

public class EWD0333DSMessage extends MessageRecord
{
  final static String fldnames[] = {
                                     "RWDUSR",
                                     "RWDTYP",
                                     "RWDFRC",
                                     "SWDBNK",
                                     "SWDBRN",
                                     "SWDCCY",
                                     "SWDDCY",
                                     "SWDACC",
                                     "SWDTYP",
                                     "SWDSBT",
                                     "SWDCLS",
                                     "SWDTRA",
                                     "SWDVAL",
                                     "SWDMAT",
                                     "SWDCUN",
                                     "SWDMSA",
                                     "SWDMDA",
                                     "SWDMEQ",
                                     "SWDEXR",
                                     "SWDDSC",
                                     "SWDSTS",
                                     "SWDREC",
                                     "SWDOPE"
                                   };
  final static String tnames[] = {
                                   "RWDUSR",
                                   "RWDTYP",
                                   "RWDFRC",
                                   "SWDBNK",
                                   "SWDBRN",
                                   "SWDCCY",
                                   "SWDDCY",
                                   "SWDACC",
                                   "SWDTYP",
                                   "SWDSBT",
                                   "SWDCLS",
                                   "SWDTRA",
                                   "SWDVAL",
                                   "SWDMAT",
                                   "SWDCUN",
                                   "SWDMSA",
                                   "SWDMDA",
                                   "SWDMEQ",
                                   "SWDEXR",
                                   "SWDDSC",
                                   "SWDSTS",
                                   "SWDREC",
                                   "SWDOPE"
                                 };
  final static String fid = "1130611113453";
  final static String rid = "3EF14C3BEED17";
  final static String fmtname = "EWD0333DS";
  final int FIELDCOUNT = 23;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldRWDUSR = null;
  private CharacterField fieldRWDTYP = null;
  private DecimalField fieldRWDFRC = null;
  private CharacterField fieldSWDBNK = null;
  private DecimalField fieldSWDBRN = null;
  private CharacterField fieldSWDCCY = null;
  private CharacterField fieldSWDDCY = null;
  private DecimalField fieldSWDACC = null;
  private CharacterField fieldSWDTYP = null;
  private CharacterField fieldSWDSBT = null;
  private CharacterField fieldSWDCLS = null;
  private DecimalField fieldSWDTRA = null;
  private DecimalField fieldSWDVAL = null;
  private DecimalField fieldSWDMAT = null;
  private DecimalField fieldSWDCUN = null;
  private DecimalField fieldSWDMSA = null;
  private DecimalField fieldSWDMDA = null;
  private DecimalField fieldSWDMEQ = null;
  private DecimalField fieldSWDEXR = null;
  private CharacterField fieldSWDDSC = null;
  private CharacterField fieldSWDSTS = null;
  private DecimalField fieldSWDREC = null;
  private CharacterField fieldSWDOPE = null;

  /**
  * Constructor for EWD0333DSMessage.
  */
  public EWD0333DSMessage()
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
    recordsize = 271;
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
    fields[3] = fieldSWDBNK =
    new CharacterField(message, HEADERSIZE + 19, 2, "SWDBNK");
    fields[4] = fieldSWDBRN =
    new DecimalField(message, HEADERSIZE + 21, 5, 0, "SWDBRN");
    fields[5] = fieldSWDCCY =
    new CharacterField(message, HEADERSIZE + 26, 3, "SWDCCY");
    fields[6] = fieldSWDDCY =
    new CharacterField(message, HEADERSIZE + 29, 3, "SWDDCY");
    fields[7] = fieldSWDACC =
    new DecimalField(message, HEADERSIZE + 32, 13, 0, "SWDACC");
    fields[8] = fieldSWDTYP =
    new CharacterField(message, HEADERSIZE + 45, 4, "SWDTYP");
    fields[9] = fieldSWDSBT =
    new CharacterField(message, HEADERSIZE + 49, 4, "SWDSBT");
    fields[10] = fieldSWDCLS =
    new CharacterField(message, HEADERSIZE + 53, 3, "SWDCLS");
    fields[11] = fieldSWDTRA =
    new DecimalField(message, HEADERSIZE + 56, 9, 0, "SWDTRA");
    fields[12] = fieldSWDVAL =
    new DecimalField(message, HEADERSIZE + 65, 9, 0, "SWDVAL");
    fields[13] = fieldSWDMAT =
    new DecimalField(message, HEADERSIZE + 74, 9, 0, "SWDMAT");
    fields[14] = fieldSWDCUN =
    new DecimalField(message, HEADERSIZE + 83, 10, 0, "SWDCUN");
    fields[15] = fieldSWDMSA =
    new DecimalField(message, HEADERSIZE + 93, 17, 2, "SWDMSA");
    fields[16] = fieldSWDMDA =
    new DecimalField(message, HEADERSIZE + 110, 17, 2, "SWDMDA");
    fields[17] = fieldSWDMEQ =
    new DecimalField(message, HEADERSIZE + 127, 17, 2, "SWDMEQ");
    fields[18] = fieldSWDEXR =
    new DecimalField(message, HEADERSIZE + 144, 13, 6, "SWDEXR");
    fields[19] = fieldSWDDSC =
    new CharacterField(message, HEADERSIZE + 157, 60, "SWDDSC");
    fields[20] = fieldSWDSTS =
    new CharacterField(message, HEADERSIZE + 217, 45, "SWDSTS");
    fields[21] = fieldSWDREC =
    new DecimalField(message, HEADERSIZE + 262, 8, 0, "SWDREC");
    fields[22] = fieldSWDOPE =
    new CharacterField(message, HEADERSIZE + 270, 1, "SWDOPE");

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
  * Set field SWDBRN using a String value.
  */
  public void setSWDBRN(String newvalue)
  {
    fieldSWDBRN.setString(newvalue);
  }

  /**
  * Get value of field SWDBRN as a String.
  */
  public String getSWDBRN()
  {
    return fieldSWDBRN.getString();
  }

  /**
  * Set numeric field SWDBRN using a BigDecimal value.
  */
  public void setSWDBRN(BigDecimal newvalue)
  {
    fieldSWDBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDBRN()
  {
    return fieldSWDBRN.getBigDecimal();
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
  * Set field SWDDCY using a String value.
  */
  public void setSWDDCY(String newvalue)
  {
    fieldSWDDCY.setString(newvalue);
  }

  /**
  * Get value of field SWDDCY as a String.
  */
  public String getSWDDCY()
  {
    return fieldSWDDCY.getString();
  }

  /**
  * Set field SWDACC using a String value.
  */
  public void setSWDACC(String newvalue)
  {
    fieldSWDACC.setString(newvalue);
  }

  /**
  * Get value of field SWDACC as a String.
  */
  public String getSWDACC()
  {
    return fieldSWDACC.getString();
  }

  /**
  * Set numeric field SWDACC using a BigDecimal value.
  */
  public void setSWDACC(BigDecimal newvalue)
  {
    fieldSWDACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDACC()
  {
    return fieldSWDACC.getBigDecimal();
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
  * Set field SWDSBT using a String value.
  */
  public void setSWDSBT(String newvalue)
  {
    fieldSWDSBT.setString(newvalue);
  }

  /**
  * Get value of field SWDSBT as a String.
  */
  public String getSWDSBT()
  {
    return fieldSWDSBT.getString();
  }

  /**
  * Set field SWDCLS using a String value.
  */
  public void setSWDCLS(String newvalue)
  {
    fieldSWDCLS.setString(newvalue);
  }

  /**
  * Get value of field SWDCLS as a String.
  */
  public String getSWDCLS()
  {
    return fieldSWDCLS.getString();
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
  * Set numeric field SWDTRA using a BigDecimal value.
  */
  public void setSWDTRA(BigDecimal newvalue)
  {
    fieldSWDTRA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDTRA as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDTRA()
  {
    return fieldSWDTRA.getBigDecimal();
  }

  /**
  * Set field SWDVAL using a String value.
  */
  public void setSWDVAL(String newvalue)
  {
    fieldSWDVAL.setString(newvalue);
  }

  /**
  * Get value of field SWDVAL as a String.
  */
  public String getSWDVAL()
  {
    return fieldSWDVAL.getString();
  }

  /**
  * Set numeric field SWDVAL using a BigDecimal value.
  */
  public void setSWDVAL(BigDecimal newvalue)
  {
    fieldSWDVAL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDVAL as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDVAL()
  {
    return fieldSWDVAL.getBigDecimal();
  }

  /**
  * Set field SWDMAT using a String value.
  */
  public void setSWDMAT(String newvalue)
  {
    fieldSWDMAT.setString(newvalue);
  }

  /**
  * Get value of field SWDMAT as a String.
  */
  public String getSWDMAT()
  {
    return fieldSWDMAT.getString();
  }

  /**
  * Set numeric field SWDMAT using a BigDecimal value.
  */
  public void setSWDMAT(BigDecimal newvalue)
  {
    fieldSWDMAT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDMAT as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDMAT()
  {
    return fieldSWDMAT.getBigDecimal();
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
  * Set field SWDMSA using a String value.
  */
  public void setSWDMSA(String newvalue)
  {
    fieldSWDMSA.setString(newvalue);
  }

  /**
  * Get value of field SWDMSA as a String.
  */
  public String getSWDMSA()
  {
    return fieldSWDMSA.getString();
  }

  /**
  * Set numeric field SWDMSA using a BigDecimal value.
  */
  public void setSWDMSA(BigDecimal newvalue)
  {
    fieldSWDMSA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDMSA as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDMSA()
  {
    return fieldSWDMSA.getBigDecimal();
  }

  /**
  * Set field SWDMDA using a String value.
  */
  public void setSWDMDA(String newvalue)
  {
    fieldSWDMDA.setString(newvalue);
  }

  /**
  * Get value of field SWDMDA as a String.
  */
  public String getSWDMDA()
  {
    return fieldSWDMDA.getString();
  }

  /**
  * Set numeric field SWDMDA using a BigDecimal value.
  */
  public void setSWDMDA(BigDecimal newvalue)
  {
    fieldSWDMDA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDMDA as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDMDA()
  {
    return fieldSWDMDA.getBigDecimal();
  }

  /**
  * Set field SWDMEQ using a String value.
  */
  public void setSWDMEQ(String newvalue)
  {
    fieldSWDMEQ.setString(newvalue);
  }

  /**
  * Get value of field SWDMEQ as a String.
  */
  public String getSWDMEQ()
  {
    return fieldSWDMEQ.getString();
  }

  /**
  * Set numeric field SWDMEQ using a BigDecimal value.
  */
  public void setSWDMEQ(BigDecimal newvalue)
  {
    fieldSWDMEQ.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDMEQ as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDMEQ()
  {
    return fieldSWDMEQ.getBigDecimal();
  }

  /**
  * Set field SWDEXR using a String value.
  */
  public void setSWDEXR(String newvalue)
  {
    fieldSWDEXR.setString(newvalue);
  }

  /**
  * Get value of field SWDEXR as a String.
  */
  public String getSWDEXR()
  {
    return fieldSWDEXR.getString();
  }

  /**
  * Set numeric field SWDEXR using a BigDecimal value.
  */
  public void setSWDEXR(BigDecimal newvalue)
  {
    fieldSWDEXR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDEXR as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDEXR()
  {
    return fieldSWDEXR.getBigDecimal();
  }

  /**
  * Set field SWDDSC using a String value.
  */
  public void setSWDDSC(String newvalue)
  {
    fieldSWDDSC.setString(newvalue);
  }

  /**
  * Get value of field SWDDSC as a String.
  */
  public String getSWDDSC()
  {
    return fieldSWDDSC.getString();
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