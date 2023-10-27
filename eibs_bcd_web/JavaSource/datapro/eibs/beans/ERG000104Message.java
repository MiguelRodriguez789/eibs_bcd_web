package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ERG000104 physical file definition.
* 
* File level identifier is 1100706173647.
* Record format level identifier is 3E5ED447C050E.
*/

public class ERG000104Message extends MessageRecord
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
                                     "CODACC",
                                     "ERGNRP",
                                     "ERGPER",
                                     "ERGREG"
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
                                   "CODACC",
                                   "ERGNRP",
                                   "ERGPER",
                                   "ERGREG"
                                 };
  final static String fid = "1100706173647";
  final static String rid = "3E5ED447C050E";
  final static String fmtname = "ERG000104";
  final int FIELDCOUNT = 13;
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
  private CharacterField fieldCODACC = null;
  private DecimalField fieldERGNRP = null;
  private DecimalField fieldERGPER = null;
  private CharacterField fieldERGREG = null;

  /**
  * Constructor for ERG000104Message.
  */
  public ERG000104Message()
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
    recordsize = 259;
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
    fields[9] = fieldCODACC =
    new CharacterField(message, HEADERSIZE + 42, 1, "CODACC");
    fields[10] = fieldERGNRP =
    new DecimalField(message, HEADERSIZE + 43, 9, 0, "ERGNRP");
    fields[11] = fieldERGPER =
    new DecimalField(message, HEADERSIZE + 52, 7, 0, "ERGPER");
    fields[12] = fieldERGREG =
    new CharacterField(message, HEADERSIZE + 59, 200, "ERGREG");

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
  * Set field CODACC using a String value.
  */
  public void setCODACC(String newvalue)
  {
    fieldCODACC.setString(newvalue);
  }

  /**
  * Get value of field CODACC as a String.
  */
  public String getCODACC()
  {
    return fieldCODACC.getString();
  }

  /**
  * Set field ERGNRP using a String value.
  */
  public void setERGNRP(String newvalue)
  {
    fieldERGNRP.setString(newvalue);
  }

  /**
  * Get value of field ERGNRP as a String.
  */
  public String getERGNRP()
  {
    return fieldERGNRP.getString();
  }

  /**
  * Set numeric field ERGNRP using a BigDecimal value.
  */
  public void setERGNRP(BigDecimal newvalue)
  {
    fieldERGNRP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field ERGNRP as a BigDecimal.
  */
  public BigDecimal getBigDecimalERGNRP()
  {
    return fieldERGNRP.getBigDecimal();
  }

  /**
  * Set field ERGPER using a String value.
  */
  public void setERGPER(String newvalue)
  {
    fieldERGPER.setString(newvalue);
  }

  /**
  * Get value of field ERGPER as a String.
  */
  public String getERGPER()
  {
    return fieldERGPER.getString();
  }

  /**
  * Set numeric field ERGPER using a BigDecimal value.
  */
  public void setERGPER(BigDecimal newvalue)
  {
    fieldERGPER.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field ERGPER as a BigDecimal.
  */
  public BigDecimal getBigDecimalERGPER()
  {
    return fieldERGPER.getBigDecimal();
  }

  /**
  * Set field ERGREG using a String value.
  */
  public void setERGREG(String newvalue)
  {
    fieldERGREG.setString(newvalue);
  }

  /**
  * Get value of field ERGREG as a String.
  */
  public String getERGREG()
  {
    return fieldERGREG.getString();
  }

}