package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ECO105502 physical file definition.
* 
* File level identifier is 1150630114306.
* Record format level identifier is 2BC353C8086AC.
*/

public class ECO105502Message extends MessageRecord
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
                                     "E02REQBNN",
                                     "E02REQBRN",
                                     "E02REQBRM",
                                     "E02REQTIP",
                                     "E02REQTIN",
                                     "E02REQSUB",
                                     "E02REQSUN",
                                     "E02REQCSN",
                                     "E02REQCSM",
                                     "E02REQRQT",
                                     "E02REQVEN",
                                     "E02REQVNN"
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
                                   "E02REQBNN",
                                   "E02REQBRN",
                                   "E02REQBRM",
                                   "E02REQTIP",
                                   "E02REQTIN",
                                   "E02REQSUB",
                                   "E02REQSUN",
                                   "E02REQCSN",
                                   "E02REQCSM",
                                   "E02REQRQT",
                                   "E02REQVEN",
                                   "E02REQVNN"
                                 };
  final static String fid = "1150630114306";
  final static String rid = "2BC353C8086AC";
  final static String fmtname = "ECO105502";
  final int FIELDCOUNT = 22;
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
  private CharacterField fieldE02REQBNN = null;
  private DecimalField fieldE02REQBRN = null;
  private CharacterField fieldE02REQBRM = null;
  private CharacterField fieldE02REQTIP = null;
  private CharacterField fieldE02REQTIN = null;
  private CharacterField fieldE02REQSUB = null;
  private CharacterField fieldE02REQSUN = null;
  private DecimalField fieldE02REQCSN = null;
  private CharacterField fieldE02REQCSM = null;
  private DecimalField fieldE02REQRQT = null;
  private DecimalField fieldE02REQVEN = null;
  private CharacterField fieldE02REQVNN = null;

  /**
  * Constructor for ECO105502Message.
  */
  public ECO105502Message()
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
    recordsize = 353;
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
    fields[10] = fieldE02REQBNN =
    new CharacterField(message, HEADERSIZE + 44, 45, "E02REQBNN");
    fields[11] = fieldE02REQBRN =
    new DecimalField(message, HEADERSIZE + 89, 5, 0, "E02REQBRN");
    fields[12] = fieldE02REQBRM =
    new CharacterField(message, HEADERSIZE + 94, 45, "E02REQBRM");
    fields[13] = fieldE02REQTIP =
    new CharacterField(message, HEADERSIZE + 139, 4, "E02REQTIP");
    fields[14] = fieldE02REQTIN =
    new CharacterField(message, HEADERSIZE + 143, 45, "E02REQTIN");
    fields[15] = fieldE02REQSUB =
    new CharacterField(message, HEADERSIZE + 188, 4, "E02REQSUB");
    fields[16] = fieldE02REQSUN =
    new CharacterField(message, HEADERSIZE + 192, 45, "E02REQSUN");
    fields[17] = fieldE02REQCSN =
    new DecimalField(message, HEADERSIZE + 237, 3, 0, "E02REQCSN");
    fields[18] = fieldE02REQCSM =
    new CharacterField(message, HEADERSIZE + 240, 45, "E02REQCSM");
    fields[19] = fieldE02REQRQT =
    new DecimalField(message, HEADERSIZE + 285, 13, 0, "E02REQRQT");
    fields[20] = fieldE02REQVEN =
    new DecimalField(message, HEADERSIZE + 298, 10, 0, "E02REQVEN");
    fields[21] = fieldE02REQVNN =
    new CharacterField(message, HEADERSIZE + 308, 45, "E02REQVNN");

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
  * Set field E02REQBNN using a String value.
  */
  public void setE02REQBNN(String newvalue)
  {
    fieldE02REQBNN.setString(newvalue);
  }

  /**
  * Get value of field E02REQBNN as a String.
  */
  public String getE02REQBNN()
  {
    return fieldE02REQBNN.getString();
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
  * Set field E02REQBRM using a String value.
  */
  public void setE02REQBRM(String newvalue)
  {
    fieldE02REQBRM.setString(newvalue);
  }

  /**
  * Get value of field E02REQBRM as a String.
  */
  public String getE02REQBRM()
  {
    return fieldE02REQBRM.getString();
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
  * Set field E02REQCSN using a String value.
  */
  public void setE02REQCSN(String newvalue)
  {
    fieldE02REQCSN.setString(newvalue);
  }

  /**
  * Get value of field E02REQCSN as a String.
  */
  public String getE02REQCSN()
  {
    return fieldE02REQCSN.getString();
  }

  /**
  * Set numeric field E02REQCSN using a BigDecimal value.
  */
  public void setE02REQCSN(BigDecimal newvalue)
  {
    fieldE02REQCSN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02REQCSN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02REQCSN()
  {
    return fieldE02REQCSN.getBigDecimal();
  }

  /**
  * Set field E02REQCSM using a String value.
  */
  public void setE02REQCSM(String newvalue)
  {
    fieldE02REQCSM.setString(newvalue);
  }

  /**
  * Get value of field E02REQCSM as a String.
  */
  public String getE02REQCSM()
  {
    return fieldE02REQCSM.getString();
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
  * Set field E02REQVEN using a String value.
  */
  public void setE02REQVEN(String newvalue)
  {
    fieldE02REQVEN.setString(newvalue);
  }

  /**
  * Get value of field E02REQVEN as a String.
  */
  public String getE02REQVEN()
  {
    return fieldE02REQVEN.getString();
  }

  /**
  * Set numeric field E02REQVEN using a BigDecimal value.
  */
  public void setE02REQVEN(BigDecimal newvalue)
  {
    fieldE02REQVEN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02REQVEN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02REQVEN()
  {
    return fieldE02REQVEN.getBigDecimal();
  }

  /**
  * Set field E02REQVNN using a String value.
  */
  public void setE02REQVNN(String newvalue)
  {
    fieldE02REQVNN.setString(newvalue);
  }

  /**
  * Get value of field E02REQVNN as a String.
  */
  public String getE02REQVNN()
  {
    return fieldE02REQVNN.getString();
  }

}
