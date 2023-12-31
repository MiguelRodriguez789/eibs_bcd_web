package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EAV00030 physical file definition.
* 
* File level identifier is 1100706173515.
* Record format level identifier is 4A0E1688D9673.
*/

public class EAV00030Message extends MessageRecord
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
                                     "EAVACC",
                                     "EAVIFM",
                                     "EAVRFM",
                                     "EAVICR",
                                     "EAVRCR",
                                     "EAVCAP",
                                     "EAVXRT"
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
                                   "EAVACC",
                                   "EAVIFM",
                                   "EAVRFM",
                                   "EAVICR",
                                   "EAVRCR",
                                   "EAVCAP",
                                   "EAVXRT"
                                 };
  final static String fid = "1100706173515";
  final static String rid = "4A0E1688D9673";
  final static String fmtname = "EAV00030";
  final int FIELDCOUNT = 16;
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
  private DecimalField fieldEAVACC = null;
  private DecimalField fieldEAVIFM = null;
  private DecimalField fieldEAVRFM = null;
  private DecimalField fieldEAVICR = null;
  private DecimalField fieldEAVRCR = null;
  private DecimalField fieldEAVCAP = null;
  private DecimalField fieldEAVXRT = null;

  /**
  * Constructor for EAV00030Message.
  */
  public EAV00030Message()
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
    recordsize = 127;
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
    fields[9] = fieldEAVACC =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "EAVACC");
    fields[10] = fieldEAVIFM =
    new DecimalField(message, HEADERSIZE + 55, 14, 2, "EAVIFM");
    fields[11] = fieldEAVRFM =
    new DecimalField(message, HEADERSIZE + 69, 14, 2, "EAVRFM");
    fields[12] = fieldEAVICR =
    new DecimalField(message, HEADERSIZE + 83, 14, 2, "EAVICR");
    fields[13] = fieldEAVRCR =
    new DecimalField(message, HEADERSIZE + 97, 14, 2, "EAVRCR");
    fields[14] = fieldEAVCAP =
    new DecimalField(message, HEADERSIZE + 111, 14, 2, "EAVCAP");
    fields[15] = fieldEAVXRT =
    new DecimalField(message, HEADERSIZE + 125, 2, 0, "EAVXRT");

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
  * Set field EAVACC using a String value.
  */
  public void setEAVACC(String newvalue)
  {
    fieldEAVACC.setString(newvalue);
  }

  /**
  * Get value of field EAVACC as a String.
  */
  public String getEAVACC()
  {
    return fieldEAVACC.getString();
  }

  /**
  * Set numeric field EAVACC using a BigDecimal value.
  */
  public void setEAVACC(BigDecimal newvalue)
  {
    fieldEAVACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EAVACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalEAVACC()
  {
    return fieldEAVACC.getBigDecimal();
  }

  /**
  * Set field EAVIFM using a String value.
  */
  public void setEAVIFM(String newvalue)
  {
    fieldEAVIFM.setString(newvalue);
  }

  /**
  * Get value of field EAVIFM as a String.
  */
  public String getEAVIFM()
  {
    return fieldEAVIFM.getString();
  }

  /**
  * Set numeric field EAVIFM using a BigDecimal value.
  */
  public void setEAVIFM(BigDecimal newvalue)
  {
    fieldEAVIFM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EAVIFM as a BigDecimal.
  */
  public BigDecimal getBigDecimalEAVIFM()
  {
    return fieldEAVIFM.getBigDecimal();
  }

  /**
  * Set field EAVRFM using a String value.
  */
  public void setEAVRFM(String newvalue)
  {
    fieldEAVRFM.setString(newvalue);
  }

  /**
  * Get value of field EAVRFM as a String.
  */
  public String getEAVRFM()
  {
    return fieldEAVRFM.getString();
  }

  /**
  * Set numeric field EAVRFM using a BigDecimal value.
  */
  public void setEAVRFM(BigDecimal newvalue)
  {
    fieldEAVRFM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EAVRFM as a BigDecimal.
  */
  public BigDecimal getBigDecimalEAVRFM()
  {
    return fieldEAVRFM.getBigDecimal();
  }

  /**
  * Set field EAVICR using a String value.
  */
  public void setEAVICR(String newvalue)
  {
    fieldEAVICR.setString(newvalue);
  }

  /**
  * Get value of field EAVICR as a String.
  */
  public String getEAVICR()
  {
    return fieldEAVICR.getString();
  }

  /**
  * Set numeric field EAVICR using a BigDecimal value.
  */
  public void setEAVICR(BigDecimal newvalue)
  {
    fieldEAVICR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EAVICR as a BigDecimal.
  */
  public BigDecimal getBigDecimalEAVICR()
  {
    return fieldEAVICR.getBigDecimal();
  }

  /**
  * Set field EAVRCR using a String value.
  */
  public void setEAVRCR(String newvalue)
  {
    fieldEAVRCR.setString(newvalue);
  }

  /**
  * Get value of field EAVRCR as a String.
  */
  public String getEAVRCR()
  {
    return fieldEAVRCR.getString();
  }

  /**
  * Set numeric field EAVRCR using a BigDecimal value.
  */
  public void setEAVRCR(BigDecimal newvalue)
  {
    fieldEAVRCR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EAVRCR as a BigDecimal.
  */
  public BigDecimal getBigDecimalEAVRCR()
  {
    return fieldEAVRCR.getBigDecimal();
  }

  /**
  * Set field EAVCAP using a String value.
  */
  public void setEAVCAP(String newvalue)
  {
    fieldEAVCAP.setString(newvalue);
  }

  /**
  * Get value of field EAVCAP as a String.
  */
  public String getEAVCAP()
  {
    return fieldEAVCAP.getString();
  }

  /**
  * Set numeric field EAVCAP using a BigDecimal value.
  */
  public void setEAVCAP(BigDecimal newvalue)
  {
    fieldEAVCAP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EAVCAP as a BigDecimal.
  */
  public BigDecimal getBigDecimalEAVCAP()
  {
    return fieldEAVCAP.getBigDecimal();
  }

  /**
  * Set field EAVXRT using a String value.
  */
  public void setEAVXRT(String newvalue)
  {
    fieldEAVXRT.setString(newvalue);
  }

  /**
  * Get value of field EAVXRT as a String.
  */
  public String getEAVXRT()
  {
    return fieldEAVXRT.getString();
  }

  /**
  * Set numeric field EAVXRT using a BigDecimal value.
  */
  public void setEAVXRT(BigDecimal newvalue)
  {
    fieldEAVXRT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EAVXRT as a BigDecimal.
  */
  public BigDecimal getBigDecimalEAVXRT()
  {
    return fieldEAVXRT.getBigDecimal();
  }

}
