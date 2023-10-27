package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ECL000112 physical file definition.
* 
* File level identifier is 1100706173537.
* Record format level identifier is 3BB42C1C6F1AF.
*/

public class ECL000112Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H02USERID",
                                     "H02PROGRM",
                                     "H02TIMSYS",
                                     "H02SCRCOD",
                                     "H02OPECOD",
                                     "H02FLGMAS",
                                     "H02FLGWK1",
                                     "H02FLGWK2",
                                     "H02FLGWK3",
                                     "CODEJE",
                                     "CODALA",
                                     "DESALA",
                                     "CATALA",
                                     "CALIDA",
                                     "ORIALA",
                                     "PRIALA"
                                   };
  final static String tnames[] = {
                                   "H02USERID",
                                   "H02PROGRM",
                                   "H02TIMSYS",
                                   "H02SCRCOD",
                                   "H02OPECOD",
                                   "H02FLGMAS",
                                   "H02FLGWK1",
                                   "H02FLGWK2",
                                   "H02FLGWK3",
                                   "CODEJE",
                                   "CODALA",
                                   "DESALA",
                                   "CATALA",
                                   "CALIDA",
                                   "ORIALA",
                                   "PRIALA"
                                 };
  final static String fid = "1100706173537";
  final static String rid = "3BB42C1C6F1AF";
  final static String fmtname = "ECL000112";
  final int FIELDCOUNT = 16;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH02USERID = null;
  private CharacterField fieldH02PROGRM = null;
  private CharacterField fieldH02TIMSYS = null;
  private CharacterField fieldH02SCRCOD = null;
  private CharacterField fieldH02OPECOD = null;
  private CharacterField fieldH02FLGMAS = null;
  private CharacterField fieldH02FLGWK1 = null;
  private CharacterField fieldH02FLGWK2 = null;
  private CharacterField fieldH02FLGWK3 = null;
  private CharacterField fieldCODEJE = null;
  private CharacterField fieldCODALA = null;
  private CharacterField fieldDESALA = null;
  private CharacterField fieldCATALA = null;
  private CharacterField fieldCALIDA = null;
  private CharacterField fieldORIALA = null;
  private DecimalField fieldPRIALA = null;

  /**
  * Constructor for ECL000112Message.
  */
  public ECL000112Message()
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
    recordsize = 84;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH02USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "H02USERID");
    fields[1] = fieldH02PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H02PROGRM");
    fields[2] = fieldH02TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "H02TIMSYS");
    fields[3] = fieldH02SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "H02SCRCOD");
    fields[4] = fieldH02OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "H02OPECOD");
    fields[5] = fieldH02FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H02FLGMAS");
    fields[6] = fieldH02FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H02FLGWK1");
    fields[7] = fieldH02FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H02FLGWK2");
    fields[8] = fieldH02FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H02FLGWK3");
    fields[9] = fieldCODEJE =
    new CharacterField(message, HEADERSIZE + 42, 10, "CODEJE");
    fields[10] = fieldCODALA =
    new CharacterField(message, HEADERSIZE + 52, 4, "CODALA");
    fields[11] = fieldDESALA =
    new CharacterField(message, HEADERSIZE + 56, 20, "DESALA");
    fields[12] = fieldCATALA =
    new CharacterField(message, HEADERSIZE + 76, 2, "CATALA");
    fields[13] = fieldCALIDA =
    new CharacterField(message, HEADERSIZE + 78, 2, "CALIDA");
    fields[14] = fieldORIALA =
    new CharacterField(message, HEADERSIZE + 80, 2, "ORIALA");
    fields[15] = fieldPRIALA =
    new DecimalField(message, HEADERSIZE + 82, 2, 0, "PRIALA");

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
  * Set field H02USERID using a String value.
  */
  public void setH02USERID(String newvalue)
  {
    fieldH02USERID.setString(newvalue);
  }

  /**
  * Get value of field H02USERID as a String.
  */
  public String getH02USERID()
  {
    return fieldH02USERID.getString();
  }

  /**
  * Set field H02PROGRM using a String value.
  */
  public void setH02PROGRM(String newvalue)
  {
    fieldH02PROGRM.setString(newvalue);
  }

  /**
  * Get value of field H02PROGRM as a String.
  */
  public String getH02PROGRM()
  {
    return fieldH02PROGRM.getString();
  }

  /**
  * Set field H02TIMSYS using a String value.
  */
  public void setH02TIMSYS(String newvalue)
  {
    fieldH02TIMSYS.setString(newvalue);
  }

  /**
  * Get value of field H02TIMSYS as a String.
  */
  public String getH02TIMSYS()
  {
    return fieldH02TIMSYS.getString();
  }

  /**
  * Set field H02SCRCOD using a String value.
  */
  public void setH02SCRCOD(String newvalue)
  {
    fieldH02SCRCOD.setString(newvalue);
  }

  /**
  * Get value of field H02SCRCOD as a String.
  */
  public String getH02SCRCOD()
  {
    return fieldH02SCRCOD.getString();
  }

  /**
  * Set field H02OPECOD using a String value.
  */
  public void setH02OPECOD(String newvalue)
  {
    fieldH02OPECOD.setString(newvalue);
  }

  /**
  * Get value of field H02OPECOD as a String.
  */
  public String getH02OPECOD()
  {
    return fieldH02OPECOD.getString();
  }

  /**
  * Set field H02FLGMAS using a String value.
  */
  public void setH02FLGMAS(String newvalue)
  {
    fieldH02FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H02FLGMAS as a String.
  */
  public String getH02FLGMAS()
  {
    return fieldH02FLGMAS.getString();
  }

  /**
  * Set field H02FLGWK1 using a String value.
  */
  public void setH02FLGWK1(String newvalue)
  {
    fieldH02FLGWK1.setString(newvalue);
  }

  /**
  * Get value of field H02FLGWK1 as a String.
  */
  public String getH02FLGWK1()
  {
    return fieldH02FLGWK1.getString();
  }

  /**
  * Set field H02FLGWK2 using a String value.
  */
  public void setH02FLGWK2(String newvalue)
  {
    fieldH02FLGWK2.setString(newvalue);
  }

  /**
  * Get value of field H02FLGWK2 as a String.
  */
  public String getH02FLGWK2()
  {
    return fieldH02FLGWK2.getString();
  }

  /**
  * Set field H02FLGWK3 using a String value.
  */
  public void setH02FLGWK3(String newvalue)
  {
    fieldH02FLGWK3.setString(newvalue);
  }

  /**
  * Get value of field H02FLGWK3 as a String.
  */
  public String getH02FLGWK3()
  {
    return fieldH02FLGWK3.getString();
  }

  /**
  * Set field CODEJE using a String value.
  */
  public void setCODEJE(String newvalue)
  {
    fieldCODEJE.setString(newvalue);
  }

  /**
  * Get value of field CODEJE as a String.
  */
  public String getCODEJE()
  {
    return fieldCODEJE.getString();
  }

  /**
  * Set field CODALA using a String value.
  */
  public void setCODALA(String newvalue)
  {
    fieldCODALA.setString(newvalue);
  }

  /**
  * Get value of field CODALA as a String.
  */
  public String getCODALA()
  {
    return fieldCODALA.getString();
  }

  /**
  * Set field DESALA using a String value.
  */
  public void setDESALA(String newvalue)
  {
    fieldDESALA.setString(newvalue);
  }

  /**
  * Get value of field DESALA as a String.
  */
  public String getDESALA()
  {
    return fieldDESALA.getString();
  }

  /**
  * Set field CATALA using a String value.
  */
  public void setCATALA(String newvalue)
  {
    fieldCATALA.setString(newvalue);
  }

  /**
  * Get value of field CATALA as a String.
  */
  public String getCATALA()
  {
    return fieldCATALA.getString();
  }

  /**
  * Set field CALIDA using a String value.
  */
  public void setCALIDA(String newvalue)
  {
    fieldCALIDA.setString(newvalue);
  }

  /**
  * Get value of field CALIDA as a String.
  */
  public String getCALIDA()
  {
    return fieldCALIDA.getString();
  }

  /**
  * Set field ORIALA using a String value.
  */
  public void setORIALA(String newvalue)
  {
    fieldORIALA.setString(newvalue);
  }

  /**
  * Get value of field ORIALA as a String.
  */
  public String getORIALA()
  {
    return fieldORIALA.getString();
  }

  /**
  * Set field PRIALA using a String value.
  */
  public void setPRIALA(String newvalue)
  {
    fieldPRIALA.setString(newvalue);
  }

  /**
  * Get value of field PRIALA as a String.
  */
  public String getPRIALA()
  {
    return fieldPRIALA.getString();
  }

  /**
  * Set numeric field PRIALA using a BigDecimal value.
  */
  public void setPRIALA(BigDecimal newvalue)
  {
    fieldPRIALA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field PRIALA as a BigDecimal.
  */
  public BigDecimal getBigDecimalPRIALA()
  {
    return fieldPRIALA.getBigDecimal();
  }

}