package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDL055302 physical file definition.
* 
* File level identifier is 1180523201631.
* Record format level identifier is 5005C7ECBA4AE.
*/

public class EDL055302Message extends MessageRecord
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
                                     "E02SIMCDE",
                                     "E02DEAACC",
                                     "E02CUSCUN",
                                     "E02MODALI",
                                     "E02ACTION",
                                     "E02MSGTXT"
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
                                   "E02SIMCDE",
                                   "E02DEAACC",
                                   "E02CUSCUN",
                                   "E02MODALI",
                                   "E02ACTION",
                                   "E02MSGTXT"
                                 };
  final static String fid = "1180523201631";
  final static String rid = "5005C7ECBA4AE";
  final static String fmtname = "EDL055302";
  final int FIELDCOUNT = 15;
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
  private CharacterField fieldE02SIMCDE = null;
  private DecimalField fieldE02DEAACC = null;
  private DecimalField fieldE02CUSCUN = null;
  private CharacterField fieldE02MODALI = null;
  private CharacterField fieldE02ACTION = null;
  private CharacterField fieldE02MSGTXT = null;

  /**
  * Constructor for EDL055302Message.
  */
  public EDL055302Message()
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
    recordsize = 583;
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
    fields[9] = fieldE02SIMCDE =
    new CharacterField(message, HEADERSIZE + 42, 4, "E02SIMCDE");
    fields[10] = fieldE02DEAACC =
    new DecimalField(message, HEADERSIZE + 46, 13, 0, "E02DEAACC");
    fields[11] = fieldE02CUSCUN =
    new DecimalField(message, HEADERSIZE + 59, 10, 0, "E02CUSCUN");
    fields[12] = fieldE02MODALI =
    new CharacterField(message, HEADERSIZE + 69, 1, "E02MODALI");
    fields[13] = fieldE02ACTION =
    new CharacterField(message, HEADERSIZE + 70, 1, "E02ACTION");
    fields[14] = fieldE02MSGTXT =
    new CharacterField(message, HEADERSIZE + 71, 512, "E02MSGTXT");

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
  * Set field E02SIMCDE using a String value.
  */
  public void setE02SIMCDE(String newvalue)
  {
    fieldE02SIMCDE.setString(newvalue);
  }

  /**
  * Get value of field E02SIMCDE as a String.
  */
  public String getE02SIMCDE()
  {
    return fieldE02SIMCDE.getString();
  }

  /**
  * Set field E02DEAACC using a String value.
  */
  public void setE02DEAACC(String newvalue)
  {
    fieldE02DEAACC.setString(newvalue);
  }

  /**
  * Get value of field E02DEAACC as a String.
  */
  public String getE02DEAACC()
  {
    return fieldE02DEAACC.getString();
  }

  /**
  * Set numeric field E02DEAACC using a BigDecimal value.
  */
  public void setE02DEAACC(BigDecimal newvalue)
  {
    fieldE02DEAACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DEAACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DEAACC()
  {
    return fieldE02DEAACC.getBigDecimal();
  }

  /**
  * Set field E02CUSCUN using a String value.
  */
  public void setE02CUSCUN(String newvalue)
  {
    fieldE02CUSCUN.setString(newvalue);
  }

  /**
  * Get value of field E02CUSCUN as a String.
  */
  public String getE02CUSCUN()
  {
    return fieldE02CUSCUN.getString();
  }

  /**
  * Set numeric field E02CUSCUN using a BigDecimal value.
  */
  public void setE02CUSCUN(BigDecimal newvalue)
  {
    fieldE02CUSCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CUSCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CUSCUN()
  {
    return fieldE02CUSCUN.getBigDecimal();
  }

  /**
  * Set field E02MODALI using a String value.
  */
  public void setE02MODALI(String newvalue)
  {
    fieldE02MODALI.setString(newvalue);
  }

  /**
  * Get value of field E02MODALI as a String.
  */
  public String getE02MODALI()
  {
    return fieldE02MODALI.getString();
  }

  /**
  * Set field E02ACTION using a String value.
  */
  public void setE02ACTION(String newvalue)
  {
    fieldE02ACTION.setString(newvalue);
  }

  /**
  * Get value of field E02ACTION as a String.
  */
  public String getE02ACTION()
  {
    return fieldE02ACTION.getString();
  }

  /**
  * Set field E02MSGTXT using a String value.
  */
  public void setE02MSGTXT(String newvalue)
  {
    fieldE02MSGTXT.setString(newvalue);
  }

  /**
  * Get value of field E02MSGTXT as a String.
  */
  public String getE02MSGTXT()
  {
    return fieldE02MSGTXT.getString();
  }

}
