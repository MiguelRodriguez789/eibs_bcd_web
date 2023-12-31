package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDL205001 physical file definition.
* 
* File level identifier is 1170809141006.
* Record format level identifier is 2AE41BF788165.
*/

public class EDL205001Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H01USERID",
                                     "H01PROGRM",
                                     "H01TIMSYS",
                                     "H01SCRCOD",
                                     "H01OPECOD",
                                     "H01FLGMAS",
                                     "H01FLGWK1",
                                     "H01FLGWK2",
                                     "H01FLGWK3",
                                     "R01ACC",
                                     "R01REF",
                                     "R01UC1",
                                     "D01UC1",
                                     "E01ACC",
                                     "E01REF",
                                     "SWDFIL",
                                     "SWDSRD",
                                     "SWDDAT",
                                     "SWDTIM",
                                     "SWDPTH",
                                     "SWDOPE",
                                     "E01STS",
                                     "E01NUMREC",
                                     "E01INDOPE"
                                   };
  final static String tnames[] = {
                                   "H01USERID",
                                   "H01PROGRM",
                                   "H01TIMSYS",
                                   "H01SCRCOD",
                                   "H01OPECOD",
                                   "H01FLGMAS",
                                   "H01FLGWK1",
                                   "H01FLGWK2",
                                   "H01FLGWK3",
                                   "R01ACC",
                                   "R01REF",
                                   "R01UC1",
                                   "D01UC1",
                                   "E01ACC",
                                   "E01REF",
                                   "SWDFIL",
                                   "SWDSRD",
                                   "SWDDAT",
                                   "SWDTIM",
                                   "SWDPTH",
                                   "SWDOPE",
                                   "E01STS",
                                   "E01NUMREC",
                                   "E01INDOPE"
                                 };
  final static String fid = "1170809141006";
  final static String rid = "2AE41BF788165";
  final static String fmtname = "EDL205001";
  final int FIELDCOUNT = 24;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH01USERID = null;
  private CharacterField fieldH01PROGRM = null;
  private CharacterField fieldH01TIMSYS = null;
  private CharacterField fieldH01SCRCOD = null;
  private CharacterField fieldH01OPECOD = null;
  private CharacterField fieldH01FLGMAS = null;
  private CharacterField fieldH01FLGWK1 = null;
  private CharacterField fieldH01FLGWK2 = null;
  private CharacterField fieldH01FLGWK3 = null;
  private DecimalField fieldR01ACC = null;
  private CharacterField fieldR01REF = null;
  private CharacterField fieldR01UC1 = null;
  private CharacterField fieldD01UC1 = null;
  private DecimalField fieldE01ACC = null;
  private CharacterField fieldE01REF = null;
  private CharacterField fieldSWDFIL = null;
  private CharacterField fieldSWDSRD = null;
  private CharacterField fieldSWDDAT = null;
  private CharacterField fieldSWDTIM = null;
  private CharacterField fieldSWDPTH = null;
  private CharacterField fieldSWDOPE = null;
  private CharacterField fieldE01STS = null;
  private DecimalField fieldE01NUMREC = null;
  private CharacterField fieldE01INDOPE = null;

  /**
  * Constructor for EDL205001Message.
  */
  public EDL205001Message()
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
    recordsize = 383;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH01USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "H01USERID");
    fields[1] = fieldH01PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H01PROGRM");
    fields[2] = fieldH01TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "H01TIMSYS");
    fields[3] = fieldH01SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "H01SCRCOD");
    fields[4] = fieldH01OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "H01OPECOD");
    fields[5] = fieldH01FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H01FLGMAS");
    fields[6] = fieldH01FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H01FLGWK1");
    fields[7] = fieldH01FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H01FLGWK2");
    fields[8] = fieldH01FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H01FLGWK3");
    fields[9] = fieldR01ACC =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "R01ACC");
    fields[10] = fieldR01REF =
    new CharacterField(message, HEADERSIZE + 55, 25, "R01REF");
    fields[11] = fieldR01UC1 =
    new CharacterField(message, HEADERSIZE + 80, 4, "R01UC1");
    fields[12] = fieldD01UC1 =
    new CharacterField(message, HEADERSIZE + 84, 45, "D01UC1");
    fields[13] = fieldE01ACC =
    new DecimalField(message, HEADERSIZE + 129, 13, 0, "E01ACC");
    fields[14] = fieldE01REF =
    new CharacterField(message, HEADERSIZE + 142, 25, "E01REF");
    fields[15] = fieldSWDFIL =
    new CharacterField(message, HEADERSIZE + 167, 45, "SWDFIL");
    fields[16] = fieldSWDSRD =
    new CharacterField(message, HEADERSIZE + 212, 10, "SWDSRD");
    fields[17] = fieldSWDDAT =
    new CharacterField(message, HEADERSIZE + 222, 10, "SWDDAT");
    fields[18] = fieldSWDTIM =
    new CharacterField(message, HEADERSIZE + 232, 8, "SWDTIM");
    fields[19] = fieldSWDPTH =
    new CharacterField(message, HEADERSIZE + 240, 132, "SWDPTH");
    fields[20] = fieldSWDOPE =
    new CharacterField(message, HEADERSIZE + 372, 1, "SWDOPE");
    fields[21] = fieldE01STS =
    new CharacterField(message, HEADERSIZE + 373, 1, "E01STS");
    fields[22] = fieldE01NUMREC =
    new DecimalField(message, HEADERSIZE + 374, 8, 0, "E01NUMREC");
    fields[23] = fieldE01INDOPE =
    new CharacterField(message, HEADERSIZE + 382, 1, "E01INDOPE");

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
  * Set field H01USERID using a String value.
  */
  public void setH01USERID(String newvalue)
  {
    fieldH01USERID.setString(newvalue);
  }

  /**
  * Get value of field H01USERID as a String.
  */
  public String getH01USERID()
  {
    return fieldH01USERID.getString();
  }

  /**
  * Set field H01PROGRM using a String value.
  */
  public void setH01PROGRM(String newvalue)
  {
    fieldH01PROGRM.setString(newvalue);
  }

  /**
  * Get value of field H01PROGRM as a String.
  */
  public String getH01PROGRM()
  {
    return fieldH01PROGRM.getString();
  }

  /**
  * Set field H01TIMSYS using a String value.
  */
  public void setH01TIMSYS(String newvalue)
  {
    fieldH01TIMSYS.setString(newvalue);
  }

  /**
  * Get value of field H01TIMSYS as a String.
  */
  public String getH01TIMSYS()
  {
    return fieldH01TIMSYS.getString();
  }

  /**
  * Set field H01SCRCOD using a String value.
  */
  public void setH01SCRCOD(String newvalue)
  {
    fieldH01SCRCOD.setString(newvalue);
  }

  /**
  * Get value of field H01SCRCOD as a String.
  */
  public String getH01SCRCOD()
  {
    return fieldH01SCRCOD.getString();
  }

  /**
  * Set field H01OPECOD using a String value.
  */
  public void setH01OPECOD(String newvalue)
  {
    fieldH01OPECOD.setString(newvalue);
  }

  /**
  * Get value of field H01OPECOD as a String.
  */
  public String getH01OPECOD()
  {
    return fieldH01OPECOD.getString();
  }

  /**
  * Set field H01FLGMAS using a String value.
  */
  public void setH01FLGMAS(String newvalue)
  {
    fieldH01FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H01FLGMAS as a String.
  */
  public String getH01FLGMAS()
  {
    return fieldH01FLGMAS.getString();
  }

  /**
  * Set field H01FLGWK1 using a String value.
  */
  public void setH01FLGWK1(String newvalue)
  {
    fieldH01FLGWK1.setString(newvalue);
  }

  /**
  * Get value of field H01FLGWK1 as a String.
  */
  public String getH01FLGWK1()
  {
    return fieldH01FLGWK1.getString();
  }

  /**
  * Set field H01FLGWK2 using a String value.
  */
  public void setH01FLGWK2(String newvalue)
  {
    fieldH01FLGWK2.setString(newvalue);
  }

  /**
  * Get value of field H01FLGWK2 as a String.
  */
  public String getH01FLGWK2()
  {
    return fieldH01FLGWK2.getString();
  }

  /**
  * Set field H01FLGWK3 using a String value.
  */
  public void setH01FLGWK3(String newvalue)
  {
    fieldH01FLGWK3.setString(newvalue);
  }

  /**
  * Get value of field H01FLGWK3 as a String.
  */
  public String getH01FLGWK3()
  {
    return fieldH01FLGWK3.getString();
  }

  /**
  * Set field R01ACC using a String value.
  */
  public void setR01ACC(String newvalue)
  {
    fieldR01ACC.setString(newvalue);
  }

  /**
  * Get value of field R01ACC as a String.
  */
  public String getR01ACC()
  {
    return fieldR01ACC.getString();
  }

  /**
  * Set numeric field R01ACC using a BigDecimal value.
  */
  public void setR01ACC(BigDecimal newvalue)
  {
    fieldR01ACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field R01ACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalR01ACC()
  {
    return fieldR01ACC.getBigDecimal();
  }

  /**
  * Set field R01REF using a String value.
  */
  public void setR01REF(String newvalue)
  {
    fieldR01REF.setString(newvalue);
  }

  /**
  * Get value of field R01REF as a String.
  */
  public String getR01REF()
  {
    return fieldR01REF.getString();
  }

  /**
  * Set field R01UC1 using a String value.
  */
  public void setR01UC1(String newvalue)
  {
    fieldR01UC1.setString(newvalue);
  }

  /**
  * Get value of field R01UC1 as a String.
  */
  public String getR01UC1()
  {
    return fieldR01UC1.getString();
  }

  /**
  * Set field D01UC1 using a String value.
  */
  public void setD01UC1(String newvalue)
  {
    fieldD01UC1.setString(newvalue);
  }

  /**
  * Get value of field D01UC1 as a String.
  */
  public String getD01UC1()
  {
    return fieldD01UC1.getString();
  }

  /**
  * Set field E01ACC using a String value.
  */
  public void setE01ACC(String newvalue)
  {
    fieldE01ACC.setString(newvalue);
  }

  /**
  * Get value of field E01ACC as a String.
  */
  public String getE01ACC()
  {
    return fieldE01ACC.getString();
  }

  /**
  * Set numeric field E01ACC using a BigDecimal value.
  */
  public void setE01ACC(BigDecimal newvalue)
  {
    fieldE01ACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ACC()
  {
    return fieldE01ACC.getBigDecimal();
  }

  /**
  * Set field E01REF using a String value.
  */
  public void setE01REF(String newvalue)
  {
    fieldE01REF.setString(newvalue);
  }

  /**
  * Get value of field E01REF as a String.
  */
  public String getE01REF()
  {
    return fieldE01REF.getString();
  }

  /**
  * Set field SWDFIL using a String value.
  */
  public void setSWDFIL(String newvalue)
  {
    fieldSWDFIL.setString(newvalue);
  }

  /**
  * Get value of field SWDFIL as a String.
  */
  public String getSWDFIL()
  {
    return fieldSWDFIL.getString();
  }

  /**
  * Set field SWDSRD using a String value.
  */
  public void setSWDSRD(String newvalue)
  {
    fieldSWDSRD.setString(newvalue);
  }

  /**
  * Get value of field SWDSRD as a String.
  */
  public String getSWDSRD()
  {
    return fieldSWDSRD.getString();
  }

  /**
  * Set field SWDDAT using a String value.
  */
  public void setSWDDAT(String newvalue)
  {
    fieldSWDDAT.setString(newvalue);
  }

  /**
  * Get value of field SWDDAT as a String.
  */
  public String getSWDDAT()
  {
    return fieldSWDDAT.getString();
  }

  /**
  * Set field SWDTIM using a String value.
  */
  public void setSWDTIM(String newvalue)
  {
    fieldSWDTIM.setString(newvalue);
  }

  /**
  * Get value of field SWDTIM as a String.
  */
  public String getSWDTIM()
  {
    return fieldSWDTIM.getString();
  }

  /**
  * Set field SWDPTH using a String value.
  */
  public void setSWDPTH(String newvalue)
  {
    fieldSWDPTH.setString(newvalue);
  }

  /**
  * Get value of field SWDPTH as a String.
  */
  public String getSWDPTH()
  {
    return fieldSWDPTH.getString();
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

  /**
  * Set field E01STS using a String value.
  */
  public void setE01STS(String newvalue)
  {
    fieldE01STS.setString(newvalue);
  }

  /**
  * Get value of field E01STS as a String.
  */
  public String getE01STS()
  {
    return fieldE01STS.getString();
  }

  /**
  * Set field E01NUMREC using a String value.
  */
  public void setE01NUMREC(String newvalue)
  {
    fieldE01NUMREC.setString(newvalue);
  }

  /**
  * Get value of field E01NUMREC as a String.
  */
  public String getE01NUMREC()
  {
    return fieldE01NUMREC.getString();
  }

  /**
  * Set numeric field E01NUMREC using a BigDecimal value.
  */
  public void setE01NUMREC(BigDecimal newvalue)
  {
    fieldE01NUMREC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01NUMREC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01NUMREC()
  {
    return fieldE01NUMREC.getBigDecimal();
  }

  /**
  * Set field E01INDOPE using a String value.
  */
  public void setE01INDOPE(String newvalue)
  {
    fieldE01INDOPE.setString(newvalue);
  }

  /**
  * Get value of field E01INDOPE as a String.
  */
  public String getE01INDOPE()
  {
    return fieldE01INDOPE.getString();
  }

}
