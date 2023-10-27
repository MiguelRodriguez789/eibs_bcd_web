package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDI001003 physical file definition.
* 
* File level identifier is 1161004133318.
* Record format level identifier is 59D553EBBD8BA.
*/

public class EDI001003Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H03USERID",
                                     "H03PROGRM",
                                     "H03TIMSYS",
                                     "H03SCRCOD",
                                     "H03OPECOD",
                                     "H03FLGMAS",
                                     "H03FLGWK1",
                                     "H03FLGWK2",
                                     "H03FLGWK3",
                                     "E03DCIACD",
                                     "E03DCITNU",
                                     "E03DCIDSC"
                                   };
  final static String tnames[] = {
                                   "H03USERID",
                                   "H03PROGRM",
                                   "H03TIMSYS",
                                   "H03SCRCOD",
                                   "H03OPECOD",
                                   "H03FLGMAS",
                                   "H03FLGWK1",
                                   "H03FLGWK2",
                                   "H03FLGWK3",
                                   "E03DCIACD",
                                   "E03DCITNU",
                                   "E03DCIDSC"
                                 };
  final static String fid = "1161004133318";
  final static String rid = "59D553EBBD8BA";
  final static String fmtname = "EDI001003";
  final int FIELDCOUNT = 12;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH03USERID = null;
  private CharacterField fieldH03PROGRM = null;
  private CharacterField fieldH03TIMSYS = null;
  private CharacterField fieldH03SCRCOD = null;
  private CharacterField fieldH03OPECOD = null;
  private CharacterField fieldH03FLGMAS = null;
  private CharacterField fieldH03FLGWK1 = null;
  private CharacterField fieldH03FLGWK2 = null;
  private CharacterField fieldH03FLGWK3 = null;
  private CharacterField fieldE03DCIACD = null;
  private CharacterField fieldE03DCITNU = null;
  private CharacterField fieldE03DCIDSC = null;

  /**
  * Constructor for EDI001003Message.
  */
  public EDI001003Message()
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
    recordsize = 106;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH03USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "H03USERID");
    fields[1] = fieldH03PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H03PROGRM");
    fields[2] = fieldH03TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "H03TIMSYS");
    fields[3] = fieldH03SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "H03SCRCOD");
    fields[4] = fieldH03OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "H03OPECOD");
    fields[5] = fieldH03FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H03FLGMAS");
    fields[6] = fieldH03FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H03FLGWK1");
    fields[7] = fieldH03FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H03FLGWK2");
    fields[8] = fieldH03FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H03FLGWK3");
    fields[9] = fieldE03DCIACD =
    new CharacterField(message, HEADERSIZE + 42, 2, "E03DCIACD");
    fields[10] = fieldE03DCITNU =
    new CharacterField(message, HEADERSIZE + 44, 2, "E03DCITNU");
    fields[11] = fieldE03DCIDSC =
    new CharacterField(message, HEADERSIZE + 46, 60, "E03DCIDSC");

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
  * Set field H03USERID using a String value.
  */
  public void setH03USERID(String newvalue)
  {
    fieldH03USERID.setString(newvalue);
  }

  /**
  * Get value of field H03USERID as a String.
  */
  public String getH03USERID()
  {
    return fieldH03USERID.getString();
  }

  /**
  * Set field H03PROGRM using a String value.
  */
  public void setH03PROGRM(String newvalue)
  {
    fieldH03PROGRM.setString(newvalue);
  }

  /**
  * Get value of field H03PROGRM as a String.
  */
  public String getH03PROGRM()
  {
    return fieldH03PROGRM.getString();
  }

  /**
  * Set field H03TIMSYS using a String value.
  */
  public void setH03TIMSYS(String newvalue)
  {
    fieldH03TIMSYS.setString(newvalue);
  }

  /**
  * Get value of field H03TIMSYS as a String.
  */
  public String getH03TIMSYS()
  {
    return fieldH03TIMSYS.getString();
  }

  /**
  * Set field H03SCRCOD using a String value.
  */
  public void setH03SCRCOD(String newvalue)
  {
    fieldH03SCRCOD.setString(newvalue);
  }

  /**
  * Get value of field H03SCRCOD as a String.
  */
  public String getH03SCRCOD()
  {
    return fieldH03SCRCOD.getString();
  }

  /**
  * Set field H03OPECOD using a String value.
  */
  public void setH03OPECOD(String newvalue)
  {
    fieldH03OPECOD.setString(newvalue);
  }

  /**
  * Get value of field H03OPECOD as a String.
  */
  public String getH03OPECOD()
  {
    return fieldH03OPECOD.getString();
  }

  /**
  * Set field H03FLGMAS using a String value.
  */
  public void setH03FLGMAS(String newvalue)
  {
    fieldH03FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H03FLGMAS as a String.
  */
  public String getH03FLGMAS()
  {
    return fieldH03FLGMAS.getString();
  }

  /**
  * Set field H03FLGWK1 using a String value.
  */
  public void setH03FLGWK1(String newvalue)
  {
    fieldH03FLGWK1.setString(newvalue);
  }

  /**
  * Get value of field H03FLGWK1 as a String.
  */
  public String getH03FLGWK1()
  {
    return fieldH03FLGWK1.getString();
  }

  /**
  * Set field H03FLGWK2 using a String value.
  */
  public void setH03FLGWK2(String newvalue)
  {
    fieldH03FLGWK2.setString(newvalue);
  }

  /**
  * Get value of field H03FLGWK2 as a String.
  */
  public String getH03FLGWK2()
  {
    return fieldH03FLGWK2.getString();
  }

  /**
  * Set field H03FLGWK3 using a String value.
  */
  public void setH03FLGWK3(String newvalue)
  {
    fieldH03FLGWK3.setString(newvalue);
  }

  /**
  * Get value of field H03FLGWK3 as a String.
  */
  public String getH03FLGWK3()
  {
    return fieldH03FLGWK3.getString();
  }

  /**
  * Set field E03DCIACD using a String value.
  */
  public void setE03DCIACD(String newvalue)
  {
    fieldE03DCIACD.setString(newvalue);
  }

  /**
  * Get value of field E03DCIACD as a String.
  */
  public String getE03DCIACD()
  {
    return fieldE03DCIACD.getString();
  }

  /**
  * Set field E03DCITNU using a String value.
  */
  public void setE03DCITNU(String newvalue)
  {
    fieldE03DCITNU.setString(newvalue);
  }

  /**
  * Get value of field E03DCITNU as a String.
  */
  public String getE03DCITNU()
  {
    return fieldE03DCITNU.getString();
  }

  /**
  * Set field E03DCIDSC using a String value.
  */
  public void setE03DCIDSC(String newvalue)
  {
    fieldE03DCIDSC.setString(newvalue);
  }

  /**
  * Get value of field E03DCIDSC as a String.
  */
  public String getE03DCIDSC()
  {
    return fieldE03DCIDSC.getString();
  }

}
