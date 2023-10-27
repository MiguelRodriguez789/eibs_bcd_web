package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EPV014003 physical file definition.
* 
* File level identifier is 1130611113304.
* Record format level identifier is 46FD8E2E3CCFD.
*/

public class EPV014003Message extends MessageRecord
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
                                     "E03ACCNUM",
                                     "E03PRDCDE",
                                     "E03ACTION",
                                     "E03TRFUSR",
                                     "E03MSGTXT"
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
                                   "E03ACCNUM",
                                   "E03PRDCDE",
                                   "E03ACTION",
                                   "E03TRFUSR",
                                   "E03MSGTXT"
                                 };
  final static String fid = "1130611113304";
  final static String rid = "46FD8E2E3CCFD";
  final static String fmtname = "EPV014003";
  final int FIELDCOUNT = 14;
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
  private DecimalField fieldE03ACCNUM = null;
  private CharacterField fieldE03PRDCDE = null;
  private CharacterField fieldE03ACTION = null;
  private CharacterField fieldE03TRFUSR = null;
  private CharacterField fieldE03MSGTXT = null;

  /**
  * Constructor for EPV014003Message.
  */
  public EPV014003Message()
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
    recordsize = 582;
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
    fields[9] = fieldE03ACCNUM =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E03ACCNUM");
    fields[10] = fieldE03PRDCDE =
    new CharacterField(message, HEADERSIZE + 55, 4, "E03PRDCDE");
    fields[11] = fieldE03ACTION =
    new CharacterField(message, HEADERSIZE + 59, 1, "E03ACTION");
    fields[12] = fieldE03TRFUSR =
    new CharacterField(message, HEADERSIZE + 60, 10, "E03TRFUSR");
    fields[13] = fieldE03MSGTXT =
    new CharacterField(message, HEADERSIZE + 70, 512, "E03MSGTXT");

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
  * Set field E03ACCNUM using a String value.
  */
  public void setE03ACCNUM(String newvalue)
  {
    fieldE03ACCNUM.setString(newvalue);
  }

  /**
  * Get value of field E03ACCNUM as a String.
  */
  public String getE03ACCNUM()
  {
    return fieldE03ACCNUM.getString();
  }

  /**
  * Set numeric field E03ACCNUM using a BigDecimal value.
  */
  public void setE03ACCNUM(BigDecimal newvalue)
  {
    fieldE03ACCNUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03ACCNUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03ACCNUM()
  {
    return fieldE03ACCNUM.getBigDecimal();
  }

  /**
  * Set field E03PRDCDE using a String value.
  */
  public void setE03PRDCDE(String newvalue)
  {
    fieldE03PRDCDE.setString(newvalue);
  }

  /**
  * Get value of field E03PRDCDE as a String.
  */
  public String getE03PRDCDE()
  {
    return fieldE03PRDCDE.getString();
  }

  /**
  * Set field E03ACTION using a String value.
  */
  public void setE03ACTION(String newvalue)
  {
    fieldE03ACTION.setString(newvalue);
  }

  /**
  * Get value of field E03ACTION as a String.
  */
  public String getE03ACTION()
  {
    return fieldE03ACTION.getString();
  }

  /**
  * Set field E03TRFUSR using a String value.
  */
  public void setE03TRFUSR(String newvalue)
  {
    fieldE03TRFUSR.setString(newvalue);
  }

  /**
  * Get value of field E03TRFUSR as a String.
  */
  public String getE03TRFUSR()
  {
    return fieldE03TRFUSR.getString();
  }

  /**
  * Set field E03MSGTXT using a String value.
  */
  public void setE03MSGTXT(String newvalue)
  {
    fieldE03MSGTXT.setString(newvalue);
  }

  /**
  * Get value of field E03MSGTXT as a String.
  */
  public String getE03MSGTXT()
  {
    return fieldE03MSGTXT.getString();
  }

}
