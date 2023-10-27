package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EVL002002 physical file definition.
* 
* File level identifier is 1130611113445.
* Record format level identifier is 4F89F37AFA560.
*/

public class EVL002002Message extends MessageRecord
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
                                     "E02REQBNK",
                                     "E02REQBRN",
                                     "E02REQTIP",
                                     "E02REQTIN",
                                     "E02REQSUB",
                                     "E02REQSUN",
                                     "E02REQREF",
                                     "E02REQRQT",
                                     "E02REQAQT",
                                     "E02REQAD1",
                                     "E02REQAD2",
                                     "E02REQAD3",
                                     "E02REQAST",
                                     "E02REQASU"
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
                                   "E02REQBNK",
                                   "E02REQBRN",
                                   "E02REQTIP",
                                   "E02REQTIN",
                                   "E02REQSUB",
                                   "E02REQSUN",
                                   "E02REQREF",
                                   "E02REQRQT",
                                   "E02REQAQT",
                                   "E02REQAD1",
                                   "E02REQAD2",
                                   "E02REQAD3",
                                   "E02REQAST",
                                   "E02REQASU"
                                 };
  final static String fid = "1130611113445";
  final static String rid = "4F89F37AFA560";
  final static String fmtname = "EVL002002";
  final int FIELDCOUNT = 23;
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
  private CharacterField fieldE02REQBNK = null;
  private DecimalField fieldE02REQBRN = null;
  private CharacterField fieldE02REQTIP = null;
  private CharacterField fieldE02REQTIN = null;
  private CharacterField fieldE02REQSUB = null;
  private CharacterField fieldE02REQSUN = null;
  private DecimalField fieldE02REQREF = null;
  private DecimalField fieldE02REQRQT = null;
  private DecimalField fieldE02REQAQT = null;
  private DecimalField fieldE02REQAD1 = null;
  private DecimalField fieldE02REQAD2 = null;
  private DecimalField fieldE02REQAD3 = null;
  private CharacterField fieldE02REQAST = null;
  private CharacterField fieldE02REQASU = null;

  /**
  * Constructor for EVL002002Message.
  */
  public EVL002002Message()
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
    recordsize = 233;
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
    fields[9] = fieldE02REQBNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E02REQBNK");
    fields[10] = fieldE02REQBRN =
    new DecimalField(message, HEADERSIZE + 44, 5, 0, "E02REQBRN");
    fields[11] = fieldE02REQTIP =
    new CharacterField(message, HEADERSIZE + 49, 4, "E02REQTIP");
    fields[12] = fieldE02REQTIN =
    new CharacterField(message, HEADERSIZE + 53, 45, "E02REQTIN");
    fields[13] = fieldE02REQSUB =
    new CharacterField(message, HEADERSIZE + 98, 4, "E02REQSUB");
    fields[14] = fieldE02REQSUN =
    new CharacterField(message, HEADERSIZE + 102, 45, "E02REQSUN");
    fields[15] = fieldE02REQREF =
    new DecimalField(message, HEADERSIZE + 147, 13, 0, "E02REQREF");
    fields[16] = fieldE02REQRQT =
    new DecimalField(message, HEADERSIZE + 160, 13, 0, "E02REQRQT");
    fields[17] = fieldE02REQAQT =
    new DecimalField(message, HEADERSIZE + 173, 13, 0, "E02REQAQT");
    fields[18] = fieldE02REQAD1 =
    new DecimalField(message, HEADERSIZE + 186, 3, 0, "E02REQAD1");
    fields[19] = fieldE02REQAD2 =
    new DecimalField(message, HEADERSIZE + 189, 3, 0, "E02REQAD2");
    fields[20] = fieldE02REQAD3 =
    new DecimalField(message, HEADERSIZE + 192, 5, 0, "E02REQAD3");
    fields[21] = fieldE02REQAST =
    new CharacterField(message, HEADERSIZE + 197, 26, "E02REQAST");
    fields[22] = fieldE02REQASU =
    new CharacterField(message, HEADERSIZE + 223, 10, "E02REQASU");

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
  * Set field E02REQBNK using a String value.
  */
  public void setE02REQBNK(String newvalue)
  {
    fieldE02REQBNK.setString(newvalue);
  }

  /**
  * Get value of field E02REQBNK as a String.
  */
  public String getE02REQBNK()
  {
    return fieldE02REQBNK.getString();
  }

  /**
  * Set field E02REQBRN using a String value.
  */
  public void setE02REQBRN(String newvalue)
  {
    fieldE02REQBRN.setString(newvalue);
  }

  /**
  * Get value of field E02REQBRN as a String.
  */
  public String getE02REQBRN()
  {
    return fieldE02REQBRN.getString();
  }

  /**
  * Set numeric field E02REQBRN using a BigDecimal value.
  */
  public void setE02REQBRN(BigDecimal newvalue)
  {
    fieldE02REQBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02REQBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02REQBRN()
  {
    return fieldE02REQBRN.getBigDecimal();
  }

  /**
  * Set field E02REQTIP using a String value.
  */
  public void setE02REQTIP(String newvalue)
  {
    fieldE02REQTIP.setString(newvalue);
  }

  /**
  * Get value of field E02REQTIP as a String.
  */
  public String getE02REQTIP()
  {
    return fieldE02REQTIP.getString();
  }

  /**
  * Set field E02REQTIN using a String value.
  */
  public void setE02REQTIN(String newvalue)
  {
    fieldE02REQTIN.setString(newvalue);
  }

  /**
  * Get value of field E02REQTIN as a String.
  */
  public String getE02REQTIN()
  {
    return fieldE02REQTIN.getString();
  }

  /**
  * Set field E02REQSUB using a String value.
  */
  public void setE02REQSUB(String newvalue)
  {
    fieldE02REQSUB.setString(newvalue);
  }

  /**
  * Get value of field E02REQSUB as a String.
  */
  public String getE02REQSUB()
  {
    return fieldE02REQSUB.getString();
  }

  /**
  * Set field E02REQSUN using a String value.
  */
  public void setE02REQSUN(String newvalue)
  {
    fieldE02REQSUN.setString(newvalue);
  }

  /**
  * Get value of field E02REQSUN as a String.
  */
  public String getE02REQSUN()
  {
    return fieldE02REQSUN.getString();
  }

  /**
  * Set field E02REQREF using a String value.
  */
  public void setE02REQREF(String newvalue)
  {
    fieldE02REQREF.setString(newvalue);
  }

  /**
  * Get value of field E02REQREF as a String.
  */
  public String getE02REQREF()
  {
    return fieldE02REQREF.getString();
  }

  /**
  * Set numeric field E02REQREF using a BigDecimal value.
  */
  public void setE02REQREF(BigDecimal newvalue)
  {
    fieldE02REQREF.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02REQREF as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02REQREF()
  {
    return fieldE02REQREF.getBigDecimal();
  }

  /**
  * Set field E02REQRQT using a String value.
  */
  public void setE02REQRQT(String newvalue)
  {
    fieldE02REQRQT.setString(newvalue);
  }

  /**
  * Get value of field E02REQRQT as a String.
  */
  public String getE02REQRQT()
  {
    return fieldE02REQRQT.getString();
  }

  /**
  * Set numeric field E02REQRQT using a BigDecimal value.
  */
  public void setE02REQRQT(BigDecimal newvalue)
  {
    fieldE02REQRQT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02REQRQT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02REQRQT()
  {
    return fieldE02REQRQT.getBigDecimal();
  }

  /**
  * Set field E02REQAQT using a String value.
  */
  public void setE02REQAQT(String newvalue)
  {
    fieldE02REQAQT.setString(newvalue);
  }

  /**
  * Get value of field E02REQAQT as a String.
  */
  public String getE02REQAQT()
  {
    return fieldE02REQAQT.getString();
  }

  /**
  * Set numeric field E02REQAQT using a BigDecimal value.
  */
  public void setE02REQAQT(BigDecimal newvalue)
  {
    fieldE02REQAQT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02REQAQT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02REQAQT()
  {
    return fieldE02REQAQT.getBigDecimal();
  }

  /**
  * Set field E02REQAD1 using a String value.
  */
  public void setE02REQAD1(String newvalue)
  {
    fieldE02REQAD1.setString(newvalue);
  }

  /**
  * Get value of field E02REQAD1 as a String.
  */
  public String getE02REQAD1()
  {
    return fieldE02REQAD1.getString();
  }

  /**
  * Set numeric field E02REQAD1 using a BigDecimal value.
  */
  public void setE02REQAD1(BigDecimal newvalue)
  {
    fieldE02REQAD1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02REQAD1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02REQAD1()
  {
    return fieldE02REQAD1.getBigDecimal();
  }

  /**
  * Set field E02REQAD2 using a String value.
  */
  public void setE02REQAD2(String newvalue)
  {
    fieldE02REQAD2.setString(newvalue);
  }

  /**
  * Get value of field E02REQAD2 as a String.
  */
  public String getE02REQAD2()
  {
    return fieldE02REQAD2.getString();
  }

  /**
  * Set numeric field E02REQAD2 using a BigDecimal value.
  */
  public void setE02REQAD2(BigDecimal newvalue)
  {
    fieldE02REQAD2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02REQAD2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02REQAD2()
  {
    return fieldE02REQAD2.getBigDecimal();
  }

  /**
  * Set field E02REQAD3 using a String value.
  */
  public void setE02REQAD3(String newvalue)
  {
    fieldE02REQAD3.setString(newvalue);
  }

  /**
  * Get value of field E02REQAD3 as a String.
  */
  public String getE02REQAD3()
  {
    return fieldE02REQAD3.getString();
  }

  /**
  * Set numeric field E02REQAD3 using a BigDecimal value.
  */
  public void setE02REQAD3(BigDecimal newvalue)
  {
    fieldE02REQAD3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02REQAD3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02REQAD3()
  {
    return fieldE02REQAD3.getBigDecimal();
  }

  /**
  * Set field E02REQAST using a String value.
  */
  public void setE02REQAST(String newvalue)
  {
    fieldE02REQAST.setString(newvalue);
  }

  /**
  * Get value of field E02REQAST as a String.
  */
  public String getE02REQAST()
  {
    return fieldE02REQAST.getString();
  }

  /**
  * Set field E02REQASU using a String value.
  */
  public void setE02REQASU(String newvalue)
  {
    fieldE02REQASU.setString(newvalue);
  }

  /**
  * Get value of field E02REQASU as a String.
  */
  public String getE02REQASU()
  {
    return fieldE02REQASU.getString();
  }

}
