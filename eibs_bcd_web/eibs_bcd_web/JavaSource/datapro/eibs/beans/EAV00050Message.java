package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EAV00050 physical file definition.
* 
* File level identifier is 1100706173515.
* Record format level identifier is 3AEB4C2C08959.
*/

public class EAV00050Message extends MessageRecord
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
                                     "AVCFLG",
                                     "AVCACC",
                                     "AVCUSR",
                                     "AVCPZO",
                                     "AVCMMO",
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
                                   "AVCFLG",
                                   "AVCACC",
                                   "AVCUSR",
                                   "AVCPZO",
                                   "AVCMMO",
                                   "EAVXRT"
                                 };
  final static String fid = "1100706173515";
  final static String rid = "3AEB4C2C08959";
  final static String fmtname = "EAV00050";
  final int FIELDCOUNT = 15;
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
  private CharacterField fieldAVCFLG = null;
  private DecimalField fieldAVCACC = null;
  private CharacterField fieldAVCUSR = null;
  private DecimalField fieldAVCPZO = null;
  private DecimalField fieldAVCMMO = null;
  private DecimalField fieldEAVXRT = null;

  /**
  * Constructor for EAV00050Message.
  */
  public EAV00050Message()
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
    recordsize = 83;
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
    fields[9] = fieldAVCFLG =
    new CharacterField(message, HEADERSIZE + 42, 1, "AVCFLG");
    fields[10] = fieldAVCACC =
    new DecimalField(message, HEADERSIZE + 43, 13, 0, "AVCACC");
    fields[11] = fieldAVCUSR =
    new CharacterField(message, HEADERSIZE + 56, 10, "AVCUSR");
    fields[12] = fieldAVCPZO =
    new DecimalField(message, HEADERSIZE + 66, 5, 0, "AVCPZO");
    fields[13] = fieldAVCMMO =
    new DecimalField(message, HEADERSIZE + 71, 10, 2, "AVCMMO");
    fields[14] = fieldEAVXRT =
    new DecimalField(message, HEADERSIZE + 81, 2, 0, "EAVXRT");

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
  * Set field AVCFLG using a String value.
  */
  public void setAVCFLG(String newvalue)
  {
    fieldAVCFLG.setString(newvalue);
  }

  /**
  * Get value of field AVCFLG as a String.
  */
  public String getAVCFLG()
  {
    return fieldAVCFLG.getString();
  }

  /**
  * Set field AVCACC using a String value.
  */
  public void setAVCACC(String newvalue)
  {
    fieldAVCACC.setString(newvalue);
  }

  /**
  * Get value of field AVCACC as a String.
  */
  public String getAVCACC()
  {
    return fieldAVCACC.getString();
  }

  /**
  * Set numeric field AVCACC using a BigDecimal value.
  */
  public void setAVCACC(BigDecimal newvalue)
  {
    fieldAVCACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field AVCACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalAVCACC()
  {
    return fieldAVCACC.getBigDecimal();
  }

  /**
  * Set field AVCUSR using a String value.
  */
  public void setAVCUSR(String newvalue)
  {
    fieldAVCUSR.setString(newvalue);
  }

  /**
  * Get value of field AVCUSR as a String.
  */
  public String getAVCUSR()
  {
    return fieldAVCUSR.getString();
  }

  /**
  * Set field AVCPZO using a String value.
  */
  public void setAVCPZO(String newvalue)
  {
    fieldAVCPZO.setString(newvalue);
  }

  /**
  * Get value of field AVCPZO as a String.
  */
  public String getAVCPZO()
  {
    return fieldAVCPZO.getString();
  }

  /**
  * Set numeric field AVCPZO using a BigDecimal value.
  */
  public void setAVCPZO(BigDecimal newvalue)
  {
    fieldAVCPZO.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field AVCPZO as a BigDecimal.
  */
  public BigDecimal getBigDecimalAVCPZO()
  {
    return fieldAVCPZO.getBigDecimal();
  }

  /**
  * Set field AVCMMO using a String value.
  */
  public void setAVCMMO(String newvalue)
  {
    fieldAVCMMO.setString(newvalue);
  }

  /**
  * Get value of field AVCMMO as a String.
  */
  public String getAVCMMO()
  {
    return fieldAVCMMO.getString();
  }

  /**
  * Set numeric field AVCMMO using a BigDecimal value.
  */
  public void setAVCMMO(BigDecimal newvalue)
  {
    fieldAVCMMO.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field AVCMMO as a BigDecimal.
  */
  public BigDecimal getBigDecimalAVCMMO()
  {
    return fieldAVCMMO.getBigDecimal();
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
