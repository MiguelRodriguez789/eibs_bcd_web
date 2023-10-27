package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EWD0158DS physical file definition.
* 
* File level identifier is 1180530164358.
* Record format level identifier is 3B98666C1DE1D.
*/

public class EWD0158DSMessage extends MessageRecord
{
  final static String fldnames[] = {
                                     "RWDUSERID",
                                     "RWDPROGRM",
                                     "RWDTIMSYS",
                                     "RWDSCRCOD",
                                     "RWDOPECOD",
                                     "RWDFLGMAS",
                                     "RWDFLGWK1",
                                     "RWDFLGWK2",
                                     "RWDFLGWK3",
                                     "EWDCDE",
                                     "EWDCTY",
                                     "EWDRUT",
                                     "EWDDES",
                                     "EWDFIM",
                                     "EWDFID",
                                     "EWDFIY",
                                     "EWDFVM",
                                     "EWDFVD",
                                     "EWDFVY",
                                     "EWDSTA",
                                     "EWDUSR",
                                     "EWDFUM",
                                     "EWDFUD",
                                     "EWDFUY",
                                     "EWDOFC",
                                     "EWDBRN",
                                     "EWDFL1",
                                     "EWDOPE"
                                   };
  final static String tnames[] = {
                                   "RWDUSERID",
                                   "RWDPROGRM",
                                   "RWDTIMSYS",
                                   "RWDSCRCOD",
                                   "RWDOPECOD",
                                   "RWDFLGMAS",
                                   "RWDFLGWK1",
                                   "RWDFLGWK2",
                                   "RWDFLGWK3",
                                   "EWDCDE",
                                   "EWDCTY",
                                   "EWDRUT",
                                   "EWDDES",
                                   "EWDFIM",
                                   "EWDFID",
                                   "EWDFIY",
                                   "EWDFVM",
                                   "EWDFVD",
                                   "EWDFVY",
                                   "EWDSTA",
                                   "EWDUSR",
                                   "EWDFUM",
                                   "EWDFUD",
                                   "EWDFUY",
                                   "EWDOFC",
                                   "EWDBRN",
                                   "EWDFL1",
                                   "EWDOPE"
                                 };
  final static String fid = "1180530164358";
  final static String rid = "3B98666C1DE1D";
  final static String fmtname = "EWD0158DS";
  final int FIELDCOUNT = 28;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldRWDUSERID = null;
  private CharacterField fieldRWDPROGRM = null;
  private CharacterField fieldRWDTIMSYS = null;
  private CharacterField fieldRWDSCRCOD = null;
  private CharacterField fieldRWDOPECOD = null;
  private CharacterField fieldRWDFLGMAS = null;
  private CharacterField fieldRWDFLGWK1 = null;
  private CharacterField fieldRWDFLGWK2 = null;
  private CharacterField fieldRWDFLGWK3 = null;
  private CharacterField fieldEWDCDE = null;
  private CharacterField fieldEWDCTY = null;
  private CharacterField fieldEWDRUT = null;
  private CharacterField fieldEWDDES = null;
  private DecimalField fieldEWDFIM = null;
  private DecimalField fieldEWDFID = null;
  private DecimalField fieldEWDFIY = null;
  private DecimalField fieldEWDFVM = null;
  private DecimalField fieldEWDFVD = null;
  private DecimalField fieldEWDFVY = null;
  private CharacterField fieldEWDSTA = null;
  private CharacterField fieldEWDUSR = null;
  private DecimalField fieldEWDFUM = null;
  private DecimalField fieldEWDFUD = null;
  private DecimalField fieldEWDFUY = null;
  private CharacterField fieldEWDOFC = null;
  private DecimalField fieldEWDBRN = null;
  private CharacterField fieldEWDFL1 = null;
  private CharacterField fieldEWDOPE = null;

  /**
  * Constructor for EWD0158DSMessage.
  */
  public EWD0158DSMessage()
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
    recordsize = 220;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldRWDUSERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "RWDUSERID");
    fields[1] = fieldRWDPROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "RWDPROGRM");
    fields[2] = fieldRWDTIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "RWDTIMSYS");
    fields[3] = fieldRWDSCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "RWDSCRCOD");
    fields[4] = fieldRWDOPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "RWDOPECOD");
    fields[5] = fieldRWDFLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "RWDFLGMAS");
    fields[6] = fieldRWDFLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "RWDFLGWK1");
    fields[7] = fieldRWDFLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "RWDFLGWK2");
    fields[8] = fieldRWDFLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "RWDFLGWK3");
    fields[9] = fieldEWDCDE =
    new CharacterField(message, HEADERSIZE + 42, 4, "EWDCDE");
    fields[10] = fieldEWDCTY =
    new CharacterField(message, HEADERSIZE + 46, 4, "EWDCTY");
    fields[11] = fieldEWDRUT =
    new CharacterField(message, HEADERSIZE + 50, 25, "EWDRUT");
    fields[12] = fieldEWDDES =
    new CharacterField(message, HEADERSIZE + 75, 90, "EWDDES");
    fields[13] = fieldEWDFIM =
    new DecimalField(message, HEADERSIZE + 165, 3, 0, "EWDFIM");
    fields[14] = fieldEWDFID =
    new DecimalField(message, HEADERSIZE + 168, 3, 0, "EWDFID");
    fields[15] = fieldEWDFIY =
    new DecimalField(message, HEADERSIZE + 171, 5, 0, "EWDFIY");
    fields[16] = fieldEWDFVM =
    new DecimalField(message, HEADERSIZE + 176, 3, 0, "EWDFVM");
    fields[17] = fieldEWDFVD =
    new DecimalField(message, HEADERSIZE + 179, 3, 0, "EWDFVD");
    fields[18] = fieldEWDFVY =
    new DecimalField(message, HEADERSIZE + 182, 5, 0, "EWDFVY");
    fields[19] = fieldEWDSTA =
    new CharacterField(message, HEADERSIZE + 187, 1, "EWDSTA");
    fields[20] = fieldEWDUSR =
    new CharacterField(message, HEADERSIZE + 188, 10, "EWDUSR");
    fields[21] = fieldEWDFUM =
    new DecimalField(message, HEADERSIZE + 198, 3, 0, "EWDFUM");
    fields[22] = fieldEWDFUD =
    new DecimalField(message, HEADERSIZE + 201, 3, 0, "EWDFUD");
    fields[23] = fieldEWDFUY =
    new DecimalField(message, HEADERSIZE + 204, 5, 0, "EWDFUY");
    fields[24] = fieldEWDOFC =
    new CharacterField(message, HEADERSIZE + 209, 4, "EWDOFC");
    fields[25] = fieldEWDBRN =
    new DecimalField(message, HEADERSIZE + 213, 5, 0, "EWDBRN");
    fields[26] = fieldEWDFL1 =
    new CharacterField(message, HEADERSIZE + 218, 1, "EWDFL1");
    fields[27] = fieldEWDOPE =
    new CharacterField(message, HEADERSIZE + 219, 1, "EWDOPE");

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
  * Set field RWDUSERID using a String value.
  */
  public void setRWDUSERID(String newvalue)
  {
    fieldRWDUSERID.setString(newvalue);
  }

  /**
  * Get value of field RWDUSERID as a String.
  */
  public String getRWDUSERID()
  {
    return fieldRWDUSERID.getString();
  }

  /**
  * Set field RWDPROGRM using a String value.
  */
  public void setRWDPROGRM(String newvalue)
  {
    fieldRWDPROGRM.setString(newvalue);
  }

  /**
  * Get value of field RWDPROGRM as a String.
  */
  public String getRWDPROGRM()
  {
    return fieldRWDPROGRM.getString();
  }

  /**
  * Set field RWDTIMSYS using a String value.
  */
  public void setRWDTIMSYS(String newvalue)
  {
    fieldRWDTIMSYS.setString(newvalue);
  }

  /**
  * Get value of field RWDTIMSYS as a String.
  */
  public String getRWDTIMSYS()
  {
    return fieldRWDTIMSYS.getString();
  }

  /**
  * Set field RWDSCRCOD using a String value.
  */
  public void setRWDSCRCOD(String newvalue)
  {
    fieldRWDSCRCOD.setString(newvalue);
  }

  /**
  * Get value of field RWDSCRCOD as a String.
  */
  public String getRWDSCRCOD()
  {
    return fieldRWDSCRCOD.getString();
  }

  /**
  * Set field RWDOPECOD using a String value.
  */
  public void setRWDOPECOD(String newvalue)
  {
    fieldRWDOPECOD.setString(newvalue);
  }

  /**
  * Get value of field RWDOPECOD as a String.
  */
  public String getRWDOPECOD()
  {
    return fieldRWDOPECOD.getString();
  }

  /**
  * Set field RWDFLGMAS using a String value.
  */
  public void setRWDFLGMAS(String newvalue)
  {
    fieldRWDFLGMAS.setString(newvalue);
  }

  /**
  * Get value of field RWDFLGMAS as a String.
  */
  public String getRWDFLGMAS()
  {
    return fieldRWDFLGMAS.getString();
  }

  /**
  * Set field RWDFLGWK1 using a String value.
  */
  public void setRWDFLGWK1(String newvalue)
  {
    fieldRWDFLGWK1.setString(newvalue);
  }

  /**
  * Get value of field RWDFLGWK1 as a String.
  */
  public String getRWDFLGWK1()
  {
    return fieldRWDFLGWK1.getString();
  }

  /**
  * Set field RWDFLGWK2 using a String value.
  */
  public void setRWDFLGWK2(String newvalue)
  {
    fieldRWDFLGWK2.setString(newvalue);
  }

  /**
  * Get value of field RWDFLGWK2 as a String.
  */
  public String getRWDFLGWK2()
  {
    return fieldRWDFLGWK2.getString();
  }

  /**
  * Set field RWDFLGWK3 using a String value.
  */
  public void setRWDFLGWK3(String newvalue)
  {
    fieldRWDFLGWK3.setString(newvalue);
  }

  /**
  * Get value of field RWDFLGWK3 as a String.
  */
  public String getRWDFLGWK3()
  {
    return fieldRWDFLGWK3.getString();
  }

  /**
  * Set field EWDCDE using a String value.
  */
  public void setEWDCDE(String newvalue)
  {
    fieldEWDCDE.setString(newvalue);
  }

  /**
  * Get value of field EWDCDE as a String.
  */
  public String getEWDCDE()
  {
    return fieldEWDCDE.getString();
  }

  /**
  * Set field EWDCTY using a String value.
  */
  public void setEWDCTY(String newvalue)
  {
    fieldEWDCTY.setString(newvalue);
  }

  /**
  * Get value of field EWDCTY as a String.
  */
  public String getEWDCTY()
  {
    return fieldEWDCTY.getString();
  }

  /**
  * Set field EWDRUT using a String value.
  */
  public void setEWDRUT(String newvalue)
  {
    fieldEWDRUT.setString(newvalue);
  }

  /**
  * Get value of field EWDRUT as a String.
  */
  public String getEWDRUT()
  {
    return fieldEWDRUT.getString();
  }

  /**
  * Set field EWDDES using a String value.
  */
  public void setEWDDES(String newvalue)
  {
    fieldEWDDES.setString(newvalue);
  }

  /**
  * Get value of field EWDDES as a String.
  */
  public String getEWDDES()
  {
    return fieldEWDDES.getString();
  }

  /**
  * Set field EWDFIM using a String value.
  */
  public void setEWDFIM(String newvalue)
  {
    fieldEWDFIM.setString(newvalue);
  }

  /**
  * Get value of field EWDFIM as a String.
  */
  public String getEWDFIM()
  {
    return fieldEWDFIM.getString();
  }

  /**
  * Set numeric field EWDFIM using a BigDecimal value.
  */
  public void setEWDFIM(BigDecimal newvalue)
  {
    fieldEWDFIM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EWDFIM as a BigDecimal.
  */
  public BigDecimal getBigDecimalEWDFIM()
  {
    return fieldEWDFIM.getBigDecimal();
  }

  /**
  * Set field EWDFID using a String value.
  */
  public void setEWDFID(String newvalue)
  {
    fieldEWDFID.setString(newvalue);
  }

  /**
  * Get value of field EWDFID as a String.
  */
  public String getEWDFID()
  {
    return fieldEWDFID.getString();
  }

  /**
  * Set numeric field EWDFID using a BigDecimal value.
  */
  public void setEWDFID(BigDecimal newvalue)
  {
    fieldEWDFID.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EWDFID as a BigDecimal.
  */
  public BigDecimal getBigDecimalEWDFID()
  {
    return fieldEWDFID.getBigDecimal();
  }

  /**
  * Set field EWDFIY using a String value.
  */
  public void setEWDFIY(String newvalue)
  {
    fieldEWDFIY.setString(newvalue);
  }

  /**
  * Get value of field EWDFIY as a String.
  */
  public String getEWDFIY()
  {
    return fieldEWDFIY.getString();
  }

  /**
  * Set numeric field EWDFIY using a BigDecimal value.
  */
  public void setEWDFIY(BigDecimal newvalue)
  {
    fieldEWDFIY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EWDFIY as a BigDecimal.
  */
  public BigDecimal getBigDecimalEWDFIY()
  {
    return fieldEWDFIY.getBigDecimal();
  }

  /**
  * Set field EWDFVM using a String value.
  */
  public void setEWDFVM(String newvalue)
  {
    fieldEWDFVM.setString(newvalue);
  }

  /**
  * Get value of field EWDFVM as a String.
  */
  public String getEWDFVM()
  {
    return fieldEWDFVM.getString();
  }

  /**
  * Set numeric field EWDFVM using a BigDecimal value.
  */
  public void setEWDFVM(BigDecimal newvalue)
  {
    fieldEWDFVM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EWDFVM as a BigDecimal.
  */
  public BigDecimal getBigDecimalEWDFVM()
  {
    return fieldEWDFVM.getBigDecimal();
  }

  /**
  * Set field EWDFVD using a String value.
  */
  public void setEWDFVD(String newvalue)
  {
    fieldEWDFVD.setString(newvalue);
  }

  /**
  * Get value of field EWDFVD as a String.
  */
  public String getEWDFVD()
  {
    return fieldEWDFVD.getString();
  }

  /**
  * Set numeric field EWDFVD using a BigDecimal value.
  */
  public void setEWDFVD(BigDecimal newvalue)
  {
    fieldEWDFVD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EWDFVD as a BigDecimal.
  */
  public BigDecimal getBigDecimalEWDFVD()
  {
    return fieldEWDFVD.getBigDecimal();
  }

  /**
  * Set field EWDFVY using a String value.
  */
  public void setEWDFVY(String newvalue)
  {
    fieldEWDFVY.setString(newvalue);
  }

  /**
  * Get value of field EWDFVY as a String.
  */
  public String getEWDFVY()
  {
    return fieldEWDFVY.getString();
  }

  /**
  * Set numeric field EWDFVY using a BigDecimal value.
  */
  public void setEWDFVY(BigDecimal newvalue)
  {
    fieldEWDFVY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EWDFVY as a BigDecimal.
  */
  public BigDecimal getBigDecimalEWDFVY()
  {
    return fieldEWDFVY.getBigDecimal();
  }

  /**
  * Set field EWDSTA using a String value.
  */
  public void setEWDSTA(String newvalue)
  {
    fieldEWDSTA.setString(newvalue);
  }

  /**
  * Get value of field EWDSTA as a String.
  */
  public String getEWDSTA()
  {
    return fieldEWDSTA.getString();
  }

  /**
  * Set field EWDUSR using a String value.
  */
  public void setEWDUSR(String newvalue)
  {
    fieldEWDUSR.setString(newvalue);
  }

  /**
  * Get value of field EWDUSR as a String.
  */
  public String getEWDUSR()
  {
    return fieldEWDUSR.getString();
  }

  /**
  * Set field EWDFUM using a String value.
  */
  public void setEWDFUM(String newvalue)
  {
    fieldEWDFUM.setString(newvalue);
  }

  /**
  * Get value of field EWDFUM as a String.
  */
  public String getEWDFUM()
  {
    return fieldEWDFUM.getString();
  }

  /**
  * Set numeric field EWDFUM using a BigDecimal value.
  */
  public void setEWDFUM(BigDecimal newvalue)
  {
    fieldEWDFUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EWDFUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalEWDFUM()
  {
    return fieldEWDFUM.getBigDecimal();
  }

  /**
  * Set field EWDFUD using a String value.
  */
  public void setEWDFUD(String newvalue)
  {
    fieldEWDFUD.setString(newvalue);
  }

  /**
  * Get value of field EWDFUD as a String.
  */
  public String getEWDFUD()
  {
    return fieldEWDFUD.getString();
  }

  /**
  * Set numeric field EWDFUD using a BigDecimal value.
  */
  public void setEWDFUD(BigDecimal newvalue)
  {
    fieldEWDFUD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EWDFUD as a BigDecimal.
  */
  public BigDecimal getBigDecimalEWDFUD()
  {
    return fieldEWDFUD.getBigDecimal();
  }

  /**
  * Set field EWDFUY using a String value.
  */
  public void setEWDFUY(String newvalue)
  {
    fieldEWDFUY.setString(newvalue);
  }

  /**
  * Get value of field EWDFUY as a String.
  */
  public String getEWDFUY()
  {
    return fieldEWDFUY.getString();
  }

  /**
  * Set numeric field EWDFUY using a BigDecimal value.
  */
  public void setEWDFUY(BigDecimal newvalue)
  {
    fieldEWDFUY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EWDFUY as a BigDecimal.
  */
  public BigDecimal getBigDecimalEWDFUY()
  {
    return fieldEWDFUY.getBigDecimal();
  }

  /**
  * Set field EWDOFC using a String value.
  */
  public void setEWDOFC(String newvalue)
  {
    fieldEWDOFC.setString(newvalue);
  }

  /**
  * Get value of field EWDOFC as a String.
  */
  public String getEWDOFC()
  {
    return fieldEWDOFC.getString();
  }

  /**
  * Set field EWDBRN using a String value.
  */
  public void setEWDBRN(String newvalue)
  {
    fieldEWDBRN.setString(newvalue);
  }

  /**
  * Get value of field EWDBRN as a String.
  */
  public String getEWDBRN()
  {
    return fieldEWDBRN.getString();
  }

  /**
  * Set numeric field EWDBRN using a BigDecimal value.
  */
  public void setEWDBRN(BigDecimal newvalue)
  {
    fieldEWDBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EWDBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalEWDBRN()
  {
    return fieldEWDBRN.getBigDecimal();
  }

  /**
  * Set field EWDFL1 using a String value.
  */
  public void setEWDFL1(String newvalue)
  {
    fieldEWDFL1.setString(newvalue);
  }

  /**
  * Get value of field EWDFL1 as a String.
  */
  public String getEWDFL1()
  {
    return fieldEWDFL1.getString();
  }

  /**
  * Set field EWDOPE using a String value.
  */
  public void setEWDOPE(String newvalue)
  {
    fieldEWDOPE.setString(newvalue);
  }

  /**
  * Get value of field EWDOPE as a String.
  */
  public String getEWDOPE()
  {
    return fieldEWDOPE.getString();
  }

}
