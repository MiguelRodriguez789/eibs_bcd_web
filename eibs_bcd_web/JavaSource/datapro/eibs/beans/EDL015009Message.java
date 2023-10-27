package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDL015009 physical file definition.
* 
* File level identifier is 1130611112913.
* Record format level identifier is 4488F6E288D40.
*/

public class EDL015009Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H09USERID",
                                     "H09PROGRM",
                                     "H09TIMSYS",
                                     "H09SCRCOD",
                                     "H09OPECOD",
                                     "H09FLGMAS",
                                     "H09FLGWK1",
                                     "H09FLGWK2",
                                     "H09FLGWK3",
                                     "E09DEAACC"
                                   };
  final static String tnames[] = {
                                   "H09USERID",
                                   "H09PROGRM",
                                   "H09TIMSYS",
                                   "H09SCRCOD",
                                   "H09OPECOD",
                                   "H09FLGMAS",
                                   "H09FLGWK1",
                                   "H09FLGWK2",
                                   "H09FLGWK3",
                                   "E09DEAACC"
                                 };
  final static String fid = "1130611112913";
  final static String rid = "4488F6E288D40";
  final static String fmtname = "EDL015009";
  final int FIELDCOUNT = 10;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH09USERID = null;
  private CharacterField fieldH09PROGRM = null;
  private CharacterField fieldH09TIMSYS = null;
  private CharacterField fieldH09SCRCOD = null;
  private CharacterField fieldH09OPECOD = null;
  private CharacterField fieldH09FLGMAS = null;
  private CharacterField fieldH09FLGWK1 = null;
  private CharacterField fieldH09FLGWK2 = null;
  private CharacterField fieldH09FLGWK3 = null;
  private DecimalField fieldE09DEAACC = null;

  /**
  * Constructor for EDL015009Message.
  */
  public EDL015009Message()
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
    recordsize = 55;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH09USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "H09USERID");
    fields[1] = fieldH09PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H09PROGRM");
    fields[2] = fieldH09TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "H09TIMSYS");
    fields[3] = fieldH09SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "H09SCRCOD");
    fields[4] = fieldH09OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "H09OPECOD");
    fields[5] = fieldH09FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H09FLGMAS");
    fields[6] = fieldH09FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H09FLGWK1");
    fields[7] = fieldH09FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H09FLGWK2");
    fields[8] = fieldH09FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H09FLGWK3");
    fields[9] = fieldE09DEAACC =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E09DEAACC");

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
  * Set field H09USERID using a String value.
  */
  public void setH09USERID(String newvalue)
  {
    fieldH09USERID.setString(newvalue);
  }

  /**
  * Get value of field H09USERID as a String.
  */
  public String getH09USERID()
  {
    return fieldH09USERID.getString();
  }

  /**
  * Set field H09PROGRM using a String value.
  */
  public void setH09PROGRM(String newvalue)
  {
    fieldH09PROGRM.setString(newvalue);
  }

  /**
  * Get value of field H09PROGRM as a String.
  */
  public String getH09PROGRM()
  {
    return fieldH09PROGRM.getString();
  }

  /**
  * Set field H09TIMSYS using a String value.
  */
  public void setH09TIMSYS(String newvalue)
  {
    fieldH09TIMSYS.setString(newvalue);
  }

  /**
  * Get value of field H09TIMSYS as a String.
  */
  public String getH09TIMSYS()
  {
    return fieldH09TIMSYS.getString();
  }

  /**
  * Set field H09SCRCOD using a String value.
  */
  public void setH09SCRCOD(String newvalue)
  {
    fieldH09SCRCOD.setString(newvalue);
  }

  /**
  * Get value of field H09SCRCOD as a String.
  */
  public String getH09SCRCOD()
  {
    return fieldH09SCRCOD.getString();
  }

  /**
  * Set field H09OPECOD using a String value.
  */
  public void setH09OPECOD(String newvalue)
  {
    fieldH09OPECOD.setString(newvalue);
  }

  /**
  * Get value of field H09OPECOD as a String.
  */
  public String getH09OPECOD()
  {
    return fieldH09OPECOD.getString();
  }

  /**
  * Set field H09FLGMAS using a String value.
  */
  public void setH09FLGMAS(String newvalue)
  {
    fieldH09FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H09FLGMAS as a String.
  */
  public String getH09FLGMAS()
  {
    return fieldH09FLGMAS.getString();
  }

  /**
  * Set field H09FLGWK1 using a String value.
  */
  public void setH09FLGWK1(String newvalue)
  {
    fieldH09FLGWK1.setString(newvalue);
  }

  /**
  * Get value of field H09FLGWK1 as a String.
  */
  public String getH09FLGWK1()
  {
    return fieldH09FLGWK1.getString();
  }

  /**
  * Set field H09FLGWK2 using a String value.
  */
  public void setH09FLGWK2(String newvalue)
  {
    fieldH09FLGWK2.setString(newvalue);
  }

  /**
  * Get value of field H09FLGWK2 as a String.
  */
  public String getH09FLGWK2()
  {
    return fieldH09FLGWK2.getString();
  }

  /**
  * Set field H09FLGWK3 using a String value.
  */
  public void setH09FLGWK3(String newvalue)
  {
    fieldH09FLGWK3.setString(newvalue);
  }

  /**
  * Get value of field H09FLGWK3 as a String.
  */
  public String getH09FLGWK3()
  {
    return fieldH09FLGWK3.getString();
  }

  /**
  * Set field E09DEAACC using a String value.
  */
  public void setE09DEAACC(String newvalue)
  {
    fieldE09DEAACC.setString(newvalue);
  }

  /**
  * Get value of field E09DEAACC as a String.
  */
  public String getE09DEAACC()
  {
    return fieldE09DEAACC.getString();
  }

  /**
  * Set numeric field E09DEAACC using a BigDecimal value.
  */
  public void setE09DEAACC(BigDecimal newvalue)
  {
    fieldE09DEAACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E09DEAACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE09DEAACC()
  {
    return fieldE09DEAACC.getBigDecimal();
  }

}