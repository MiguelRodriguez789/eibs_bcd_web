package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EWD0335DS physical file definition.
* 
* File level identifier is 1130611113454.
* Record format level identifier is 48C1E8C57A857.
*/

public class EWD0335DSMessage extends MessageRecord
{
  final static String fldnames[] = {
                                     "RWDUSR",
                                     "RWDTYP",
                                     "RWDTYD",
                                     "RWDCUN",
                                     "RWDFD1",
                                     "RWDFD2",
                                     "RWDFD3",
                                     "RWDTD1",
                                     "RWDTD2",
                                     "RWDTD3",
                                     "RWDFDL",
                                     "RWDTDL",
                                     "RWDFRC",
                                     "SWDBNK",
                                     "SWDBRN",
                                     "SWDCCY",
                                     "SWDACC",
                                     "SWDTYP",
                                     "SWDSBT",
                                     "SWDPRO",
                                     "SWDTRA",
                                     "SWDVAL",
                                     "SWDMAT",
                                     "SWDCUN",
                                     "SWDAMT",
                                     "SWDOAM",
                                     "SWDDSC",
                                     "SWDSTS",
                                     "SWDIPR",
                                     "SWDREC",
                                     "SWDOPE"
                                   };
  final static String tnames[] = {
                                   "RWDUSR",
                                   "RWDTYP",
                                   "RWDTYD",
                                   "RWDCUN",
                                   "RWDFD1",
                                   "RWDFD2",
                                   "RWDFD3",
                                   "RWDTD1",
                                   "RWDTD2",
                                   "RWDTD3",
                                   "RWDFDL",
                                   "RWDTDL",
                                   "RWDFRC",
                                   "SWDBNK",
                                   "SWDBRN",
                                   "SWDCCY",
                                   "SWDACC",
                                   "SWDTYP",
                                   "SWDSBT",
                                   "SWDPRO",
                                   "SWDTRA",
                                   "SWDVAL",
                                   "SWDMAT",
                                   "SWDCUN",
                                   "SWDAMT",
                                   "SWDOAM",
                                   "SWDDSC",
                                   "SWDSTS",
                                   "SWDIPR",
                                   "SWDREC",
                                   "SWDOPE"
                                 };
  final static String fid = "1130611113454";
  final static String rid = "48C1E8C57A857";
  final static String fmtname = "EWD0335DS";
  final int FIELDCOUNT = 31;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldRWDUSR = null;
  private CharacterField fieldRWDTYP = null;
  private CharacterField fieldRWDTYD = null;
  private DecimalField fieldRWDCUN = null;
  private DecimalField fieldRWDFD1 = null;
  private DecimalField fieldRWDFD2 = null;
  private DecimalField fieldRWDFD3 = null;
  private DecimalField fieldRWDTD1 = null;
  private DecimalField fieldRWDTD2 = null;
  private DecimalField fieldRWDTD3 = null;
  private DecimalField fieldRWDFDL = null;
  private DecimalField fieldRWDTDL = null;
  private DecimalField fieldRWDFRC = null;
  private CharacterField fieldSWDBNK = null;
  private DecimalField fieldSWDBRN = null;
  private CharacterField fieldSWDCCY = null;
  private DecimalField fieldSWDACC = null;
  private CharacterField fieldSWDTYP = null;
  private CharacterField fieldSWDSBT = null;
  private CharacterField fieldSWDPRO = null;
  private DecimalField fieldSWDTRA = null;
  private DecimalField fieldSWDVAL = null;
  private DecimalField fieldSWDMAT = null;
  private DecimalField fieldSWDCUN = null;
  private DecimalField fieldSWDAMT = null;
  private DecimalField fieldSWDOAM = null;
  private CharacterField fieldSWDDSC = null;
  private CharacterField fieldSWDSTS = null;
  private CharacterField fieldSWDIPR = null;
  private DecimalField fieldSWDREC = null;
  private CharacterField fieldSWDOPE = null;

  /**
  * Constructor for EWD0335DSMessage.
  */
  public EWD0335DSMessage()
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
    recordsize = 308;
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
    fields[2] = fieldRWDTYD =
    new CharacterField(message, HEADERSIZE + 11, 1, "RWDTYD");
    fields[3] = fieldRWDCUN =
    new DecimalField(message, HEADERSIZE + 12, 10, 0, "RWDCUN");
    fields[4] = fieldRWDFD1 =
    new DecimalField(message, HEADERSIZE + 22, 3, 0, "RWDFD1");
    fields[5] = fieldRWDFD2 =
    new DecimalField(message, HEADERSIZE + 25, 3, 0, "RWDFD2");
    fields[6] = fieldRWDFD3 =
    new DecimalField(message, HEADERSIZE + 28, 5, 0, "RWDFD3");
    fields[7] = fieldRWDTD1 =
    new DecimalField(message, HEADERSIZE + 33, 3, 0, "RWDTD1");
    fields[8] = fieldRWDTD2 =
    new DecimalField(message, HEADERSIZE + 36, 3, 0, "RWDTD2");
    fields[9] = fieldRWDTD3 =
    new DecimalField(message, HEADERSIZE + 39, 5, 0, "RWDTD3");
    fields[10] = fieldRWDFDL =
    new DecimalField(message, HEADERSIZE + 44, 13, 0, "RWDFDL");
    fields[11] = fieldRWDTDL =
    new DecimalField(message, HEADERSIZE + 57, 13, 0, "RWDTDL");
    fields[12] = fieldRWDFRC =
    new DecimalField(message, HEADERSIZE + 70, 8, 0, "RWDFRC");
    fields[13] = fieldSWDBNK =
    new CharacterField(message, HEADERSIZE + 78, 2, "SWDBNK");
    fields[14] = fieldSWDBRN =
    new DecimalField(message, HEADERSIZE + 80, 5, 0, "SWDBRN");
    fields[15] = fieldSWDCCY =
    new CharacterField(message, HEADERSIZE + 85, 3, "SWDCCY");
    fields[16] = fieldSWDACC =
    new DecimalField(message, HEADERSIZE + 88, 13, 0, "SWDACC");
    fields[17] = fieldSWDTYP =
    new CharacterField(message, HEADERSIZE + 101, 4, "SWDTYP");
    fields[18] = fieldSWDSBT =
    new CharacterField(message, HEADERSIZE + 105, 4, "SWDSBT");
    fields[19] = fieldSWDPRO =
    new CharacterField(message, HEADERSIZE + 109, 4, "SWDPRO");
    fields[20] = fieldSWDTRA =
    new DecimalField(message, HEADERSIZE + 113, 9, 0, "SWDTRA");
    fields[21] = fieldSWDVAL =
    new DecimalField(message, HEADERSIZE + 122, 9, 0, "SWDVAL");
    fields[22] = fieldSWDMAT =
    new DecimalField(message, HEADERSIZE + 131, 9, 0, "SWDMAT");
    fields[23] = fieldSWDCUN =
    new DecimalField(message, HEADERSIZE + 140, 10, 0, "SWDCUN");
    fields[24] = fieldSWDAMT =
    new DecimalField(message, HEADERSIZE + 150, 17, 2, "SWDAMT");
    fields[25] = fieldSWDOAM =
    new DecimalField(message, HEADERSIZE + 167, 17, 2, "SWDOAM");
    fields[26] = fieldSWDDSC =
    new CharacterField(message, HEADERSIZE + 184, 60, "SWDDSC");
    fields[27] = fieldSWDSTS =
    new CharacterField(message, HEADERSIZE + 244, 45, "SWDSTS");
    fields[28] = fieldSWDIPR =
    new CharacterField(message, HEADERSIZE + 289, 10, "SWDIPR");
    fields[29] = fieldSWDREC =
    new DecimalField(message, HEADERSIZE + 299, 8, 0, "SWDREC");
    fields[30] = fieldSWDOPE =
    new CharacterField(message, HEADERSIZE + 307, 1, "SWDOPE");

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
  * Set field RWDTYD using a String value.
  */
  public void setRWDTYD(String newvalue)
  {
    fieldRWDTYD.setString(newvalue);
  }

  /**
  * Get value of field RWDTYD as a String.
  */
  public String getRWDTYD()
  {
    return fieldRWDTYD.getString();
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
  * Set field RWDFD1 using a String value.
  */
  public void setRWDFD1(String newvalue)
  {
    fieldRWDFD1.setString(newvalue);
  }

  /**
  * Get value of field RWDFD1 as a String.
  */
  public String getRWDFD1()
  {
    return fieldRWDFD1.getString();
  }

  /**
  * Set numeric field RWDFD1 using a BigDecimal value.
  */
  public void setRWDFD1(BigDecimal newvalue)
  {
    fieldRWDFD1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field RWDFD1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalRWDFD1()
  {
    return fieldRWDFD1.getBigDecimal();
  }

  /**
  * Set field RWDFD2 using a String value.
  */
  public void setRWDFD2(String newvalue)
  {
    fieldRWDFD2.setString(newvalue);
  }

  /**
  * Get value of field RWDFD2 as a String.
  */
  public String getRWDFD2()
  {
    return fieldRWDFD2.getString();
  }

  /**
  * Set numeric field RWDFD2 using a BigDecimal value.
  */
  public void setRWDFD2(BigDecimal newvalue)
  {
    fieldRWDFD2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field RWDFD2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalRWDFD2()
  {
    return fieldRWDFD2.getBigDecimal();
  }

  /**
  * Set field RWDFD3 using a String value.
  */
  public void setRWDFD3(String newvalue)
  {
    fieldRWDFD3.setString(newvalue);
  }

  /**
  * Get value of field RWDFD3 as a String.
  */
  public String getRWDFD3()
  {
    return fieldRWDFD3.getString();
  }

  /**
  * Set numeric field RWDFD3 using a BigDecimal value.
  */
  public void setRWDFD3(BigDecimal newvalue)
  {
    fieldRWDFD3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field RWDFD3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalRWDFD3()
  {
    return fieldRWDFD3.getBigDecimal();
  }

  /**
  * Set field RWDTD1 using a String value.
  */
  public void setRWDTD1(String newvalue)
  {
    fieldRWDTD1.setString(newvalue);
  }

  /**
  * Get value of field RWDTD1 as a String.
  */
  public String getRWDTD1()
  {
    return fieldRWDTD1.getString();
  }

  /**
  * Set numeric field RWDTD1 using a BigDecimal value.
  */
  public void setRWDTD1(BigDecimal newvalue)
  {
    fieldRWDTD1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field RWDTD1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalRWDTD1()
  {
    return fieldRWDTD1.getBigDecimal();
  }

  /**
  * Set field RWDTD2 using a String value.
  */
  public void setRWDTD2(String newvalue)
  {
    fieldRWDTD2.setString(newvalue);
  }

  /**
  * Get value of field RWDTD2 as a String.
  */
  public String getRWDTD2()
  {
    return fieldRWDTD2.getString();
  }

  /**
  * Set numeric field RWDTD2 using a BigDecimal value.
  */
  public void setRWDTD2(BigDecimal newvalue)
  {
    fieldRWDTD2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field RWDTD2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalRWDTD2()
  {
    return fieldRWDTD2.getBigDecimal();
  }

  /**
  * Set field RWDTD3 using a String value.
  */
  public void setRWDTD3(String newvalue)
  {
    fieldRWDTD3.setString(newvalue);
  }

  /**
  * Get value of field RWDTD3 as a String.
  */
  public String getRWDTD3()
  {
    return fieldRWDTD3.getString();
  }

  /**
  * Set numeric field RWDTD3 using a BigDecimal value.
  */
  public void setRWDTD3(BigDecimal newvalue)
  {
    fieldRWDTD3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field RWDTD3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalRWDTD3()
  {
    return fieldRWDTD3.getBigDecimal();
  }

  /**
  * Set field RWDFDL using a String value.
  */
  public void setRWDFDL(String newvalue)
  {
    fieldRWDFDL.setString(newvalue);
  }

  /**
  * Get value of field RWDFDL as a String.
  */
  public String getRWDFDL()
  {
    return fieldRWDFDL.getString();
  }

  /**
  * Set numeric field RWDFDL using a BigDecimal value.
  */
  public void setRWDFDL(BigDecimal newvalue)
  {
    fieldRWDFDL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field RWDFDL as a BigDecimal.
  */
  public BigDecimal getBigDecimalRWDFDL()
  {
    return fieldRWDFDL.getBigDecimal();
  }

  /**
  * Set field RWDTDL using a String value.
  */
  public void setRWDTDL(String newvalue)
  {
    fieldRWDTDL.setString(newvalue);
  }

  /**
  * Get value of field RWDTDL as a String.
  */
  public String getRWDTDL()
  {
    return fieldRWDTDL.getString();
  }

  /**
  * Set numeric field RWDTDL using a BigDecimal value.
  */
  public void setRWDTDL(BigDecimal newvalue)
  {
    fieldRWDTDL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field RWDTDL as a BigDecimal.
  */
  public BigDecimal getBigDecimalRWDTDL()
  {
    return fieldRWDTDL.getBigDecimal();
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
  * Set field SWDPRO using a String value.
  */
  public void setSWDPRO(String newvalue)
  {
    fieldSWDPRO.setString(newvalue);
  }

  /**
  * Get value of field SWDPRO as a String.
  */
  public String getSWDPRO()
  {
    return fieldSWDPRO.getString();
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
  * Set field SWDOAM using a String value.
  */
  public void setSWDOAM(String newvalue)
  {
    fieldSWDOAM.setString(newvalue);
  }

  /**
  * Get value of field SWDOAM as a String.
  */
  public String getSWDOAM()
  {
    return fieldSWDOAM.getString();
  }

  /**
  * Set numeric field SWDOAM using a BigDecimal value.
  */
  public void setSWDOAM(BigDecimal newvalue)
  {
    fieldSWDOAM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDOAM as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDOAM()
  {
    return fieldSWDOAM.getBigDecimal();
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
  * Set field SWDIPR using a String value.
  */
  public void setSWDIPR(String newvalue)
  {
    fieldSWDIPR.setString(newvalue);
  }

  /**
  * Get value of field SWDIPR as a String.
  */
  public String getSWDIPR()
  {
    return fieldSWDIPR.getString();
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