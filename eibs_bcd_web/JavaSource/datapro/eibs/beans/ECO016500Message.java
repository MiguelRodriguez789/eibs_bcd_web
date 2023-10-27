package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ECO016500 physical file definition.
* 
* File level identifier is 1130611131009.
* Record format level identifier is 588A967321C04.
*/

public class ECO016500Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H00USERID",
                                     "H00PROGRM",
                                     "H00TIMSYS",
                                     "H00SCRCOD",
                                     "H00OPECOD",
                                     "H00FLGMAS",
                                     "H00FLGWK1",
                                     "H00FLGWK2",
                                     "H00FLGWK3",
                                     "E00PLHECU",
                                     "E00PLHEID",
                                     "E00PLHENM"
                                   };
  final static String tnames[] = {
                                   "H00USERID",
                                   "H00PROGRM",
                                   "H00TIMSYS",
                                   "H00SCRCOD",
                                   "H00OPECOD",
                                   "H00FLGMAS",
                                   "H00FLGWK1",
                                   "H00FLGWK2",
                                   "H00FLGWK3",
                                   "E00PLHECU",
                                   "E00PLHEID",
                                   "E00PLHENM"
                                 };
  final static String fid = "1130611131009";
  final static String rid = "588A967321C04";
  final static String fmtname = "ECO016500";
  final int FIELDCOUNT = 12;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH00USERID = null;
  private CharacterField fieldH00PROGRM = null;
  private CharacterField fieldH00TIMSYS = null;
  private CharacterField fieldH00SCRCOD = null;
  private CharacterField fieldH00OPECOD = null;
  private CharacterField fieldH00FLGMAS = null;
  private CharacterField fieldH00FLGWK1 = null;
  private CharacterField fieldH00FLGWK2 = null;
  private CharacterField fieldH00FLGWK3 = null;
  private DecimalField fieldE00PLHECU = null;
  private CharacterField fieldE00PLHEID = null;
  private CharacterField fieldE00PLHENM = null;

  /**
  * Constructor for ECO016500Message.
  */
  public ECO016500Message()
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
    recordsize = 137;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH00USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "H00USERID");
    fields[1] = fieldH00PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H00PROGRM");
    fields[2] = fieldH00TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "H00TIMSYS");
    fields[3] = fieldH00SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "H00SCRCOD");
    fields[4] = fieldH00OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "H00OPECOD");
    fields[5] = fieldH00FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H00FLGMAS");
    fields[6] = fieldH00FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H00FLGWK1");
    fields[7] = fieldH00FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H00FLGWK2");
    fields[8] = fieldH00FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H00FLGWK3");
    fields[9] = fieldE00PLHECU =
    new DecimalField(message, HEADERSIZE + 42, 10, 0, "E00PLHECU");
    fields[10] = fieldE00PLHEID =
    new CharacterField(message, HEADERSIZE + 52, 25, "E00PLHEID");
    fields[11] = fieldE00PLHENM =
    new CharacterField(message, HEADERSIZE + 77, 60, "E00PLHENM");

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
  * Set field H00USERID using a String value.
  */
  public void setH00USERID(String newvalue)
  {
    fieldH00USERID.setString(newvalue);
  }

  /**
  * Get value of field H00USERID as a String.
  */
  public String getH00USERID()
  {
    return fieldH00USERID.getString();
  }

  /**
  * Set field H00PROGRM using a String value.
  */
  public void setH00PROGRM(String newvalue)
  {
    fieldH00PROGRM.setString(newvalue);
  }

  /**
  * Get value of field H00PROGRM as a String.
  */
  public String getH00PROGRM()
  {
    return fieldH00PROGRM.getString();
  }

  /**
  * Set field H00TIMSYS using a String value.
  */
  public void setH00TIMSYS(String newvalue)
  {
    fieldH00TIMSYS.setString(newvalue);
  }

  /**
  * Get value of field H00TIMSYS as a String.
  */
  public String getH00TIMSYS()
  {
    return fieldH00TIMSYS.getString();
  }

  /**
  * Set field H00SCRCOD using a String value.
  */
  public void setH00SCRCOD(String newvalue)
  {
    fieldH00SCRCOD.setString(newvalue);
  }

  /**
  * Get value of field H00SCRCOD as a String.
  */
  public String getH00SCRCOD()
  {
    return fieldH00SCRCOD.getString();
  }

  /**
  * Set field H00OPECOD using a String value.
  */
  public void setH00OPECOD(String newvalue)
  {
    fieldH00OPECOD.setString(newvalue);
  }

  /**
  * Get value of field H00OPECOD as a String.
  */
  public String getH00OPECOD()
  {
    return fieldH00OPECOD.getString();
  }

  /**
  * Set field H00FLGMAS using a String value.
  */
  public void setH00FLGMAS(String newvalue)
  {
    fieldH00FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H00FLGMAS as a String.
  */
  public String getH00FLGMAS()
  {
    return fieldH00FLGMAS.getString();
  }

  /**
  * Set field H00FLGWK1 using a String value.
  */
  public void setH00FLGWK1(String newvalue)
  {
    fieldH00FLGWK1.setString(newvalue);
  }

  /**
  * Get value of field H00FLGWK1 as a String.
  */
  public String getH00FLGWK1()
  {
    return fieldH00FLGWK1.getString();
  }

  /**
  * Set field H00FLGWK2 using a String value.
  */
  public void setH00FLGWK2(String newvalue)
  {
    fieldH00FLGWK2.setString(newvalue);
  }

  /**
  * Get value of field H00FLGWK2 as a String.
  */
  public String getH00FLGWK2()
  {
    return fieldH00FLGWK2.getString();
  }

  /**
  * Set field H00FLGWK3 using a String value.
  */
  public void setH00FLGWK3(String newvalue)
  {
    fieldH00FLGWK3.setString(newvalue);
  }

  /**
  * Get value of field H00FLGWK3 as a String.
  */
  public String getH00FLGWK3()
  {
    return fieldH00FLGWK3.getString();
  }

  /**
  * Set field E00PLHECU using a String value.
  */
  public void setE00PLHECU(String newvalue)
  {
    fieldE00PLHECU.setString(newvalue);
  }

  /**
  * Get value of field E00PLHECU as a String.
  */
  public String getE00PLHECU()
  {
    return fieldE00PLHECU.getString();
  }

  /**
  * Set numeric field E00PLHECU using a BigDecimal value.
  */
  public void setE00PLHECU(BigDecimal newvalue)
  {
    fieldE00PLHECU.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E00PLHECU as a BigDecimal.
  */
  public BigDecimal getBigDecimalE00PLHECU()
  {
    return fieldE00PLHECU.getBigDecimal();
  }

  /**
  * Set field E00PLHEID using a String value.
  */
  public void setE00PLHEID(String newvalue)
  {
    fieldE00PLHEID.setString(newvalue);
  }

  /**
  * Get value of field E00PLHEID as a String.
  */
  public String getE00PLHEID()
  {
    return fieldE00PLHEID.getString();
  }

  /**
  * Set field E00PLHENM using a String value.
  */
  public void setE00PLHENM(String newvalue)
  {
    fieldE00PLHENM.setString(newvalue);
  }

  /**
  * Get value of field E00PLHENM as a String.
  */
  public String getE00PLHENM()
  {
    return fieldE00PLHENM.getString();
  }

}
