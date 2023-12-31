package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ESD074501 physical file definition.
* 
* File level identifier is 1130611113359.
* Record format level identifier is 26945C0C6FEC6.
*/

public class ESD074501Message extends MessageRecord
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
                                     "E01EPRBNK",
                                     "E01EPRDSC",
                                     "E01EPREXP",
                                     "E01EPRPSL",
                                     "E01EPRRPC",
                                     "E01EPRLET",
                                     "E01EPRETM",
                                     "E01EPRSDS",
                                     "E01EPRDPI",
                                     "E01EPRCHG",
                                     "E01EPRSK1",
                                     "E01EPRSK2",
                                     "E01EPRSK3",
                                     "E01EPRTOU",
                                     "E01EPRTRC",
                                     "E01EPRFG1",
                                     "E01EPRFG2",
                                     "E01EPRFG3",
                                     "E01EPROPE"
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
                                   "E01EPRBNK",
                                   "E01EPRDSC",
                                   "E01EPREXP",
                                   "E01EPRPSL",
                                   "E01EPRRPC",
                                   "E01EPRLET",
                                   "E01EPRETM",
                                   "E01EPRSDS",
                                   "E01EPRDPI",
                                   "E01EPRCHG",
                                   "E01EPRSK1",
                                   "E01EPRSK2",
                                   "E01EPRSK3",
                                   "E01EPRTOU",
                                   "E01EPRTRC",
                                   "E01EPRFG1",
                                   "E01EPRFG2",
                                   "E01EPRFG3",
                                   "E01EPROPE"
                                 };
  final static String fid = "1130611113359";
  final static String rid = "26945C0C6FEC6";
  final static String fmtname = "ESD074501";
  final int FIELDCOUNT = 28;
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
  private CharacterField fieldE01EPRBNK = null;
  private CharacterField fieldE01EPRDSC = null;
  private DecimalField fieldE01EPREXP = null;
  private DecimalField fieldE01EPRPSL = null;
  private DecimalField fieldE01EPRRPC = null;
  private DecimalField fieldE01EPRLET = null;
  private DecimalField fieldE01EPRETM = null;
  private DecimalField fieldE01EPRSDS = null;
  private DecimalField fieldE01EPRDPI = null;
  private DecimalField fieldE01EPRCHG = null;
  private DecimalField fieldE01EPRSK1 = null;
  private DecimalField fieldE01EPRSK2 = null;
  private DecimalField fieldE01EPRSK3 = null;
  private DecimalField fieldE01EPRTOU = null;
  private CharacterField fieldE01EPRTRC = null;
  private CharacterField fieldE01EPRFG1 = null;
  private CharacterField fieldE01EPRFG2 = null;
  private CharacterField fieldE01EPRFG3 = null;
  private CharacterField fieldE01EPROPE = null;

  /**
  * Constructor for ESD074501Message.
  */
  public ESD074501Message()
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
    recordsize = 148;
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
    fields[9] = fieldE01EPRBNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E01EPRBNK");
    fields[10] = fieldE01EPRDSC =
    new CharacterField(message, HEADERSIZE + 44, 45, "E01EPRDSC");
    fields[11] = fieldE01EPREXP =
    new DecimalField(message, HEADERSIZE + 89, 4, 0, "E01EPREXP");
    fields[12] = fieldE01EPRPSL =
    new DecimalField(message, HEADERSIZE + 93, 3, 0, "E01EPRPSL");
    fields[13] = fieldE01EPRRPC =
    new DecimalField(message, HEADERSIZE + 96, 3, 0, "E01EPRRPC");
    fields[14] = fieldE01EPRLET =
    new DecimalField(message, HEADERSIZE + 99, 3, 0, "E01EPRLET");
    fields[15] = fieldE01EPRETM =
    new DecimalField(message, HEADERSIZE + 102, 3, 0, "E01EPRETM");
    fields[16] = fieldE01EPRSDS =
    new DecimalField(message, HEADERSIZE + 105, 6, 2, "E01EPRSDS");
    fields[17] = fieldE01EPRDPI =
    new DecimalField(message, HEADERSIZE + 111, 4, 0, "E01EPRDPI");
    fields[18] = fieldE01EPRCHG =
    new DecimalField(message, HEADERSIZE + 115, 4, 0, "E01EPRCHG");
    fields[19] = fieldE01EPRSK1 =
    new DecimalField(message, HEADERSIZE + 119, 6, 0, "E01EPRSK1");
    fields[20] = fieldE01EPRSK2 =
    new DecimalField(message, HEADERSIZE + 125, 6, 0, "E01EPRSK2");
    fields[21] = fieldE01EPRSK3 =
    new DecimalField(message, HEADERSIZE + 131, 6, 0, "E01EPRSK3");
    fields[22] = fieldE01EPRTOU =
    new DecimalField(message, HEADERSIZE + 137, 6, 0, "E01EPRTOU");
    fields[23] = fieldE01EPRTRC =
    new CharacterField(message, HEADERSIZE + 143, 1, "E01EPRTRC");
    fields[24] = fieldE01EPRFG1 =
    new CharacterField(message, HEADERSIZE + 144, 1, "E01EPRFG1");
    fields[25] = fieldE01EPRFG2 =
    new CharacterField(message, HEADERSIZE + 145, 1, "E01EPRFG2");
    fields[26] = fieldE01EPRFG3 =
    new CharacterField(message, HEADERSIZE + 146, 1, "E01EPRFG3");
    fields[27] = fieldE01EPROPE =
    new CharacterField(message, HEADERSIZE + 147, 1, "E01EPROPE");

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
  * Set field E01EPRBNK using a String value.
  */
  public void setE01EPRBNK(String newvalue)
  {
    fieldE01EPRBNK.setString(newvalue);
  }

  /**
  * Get value of field E01EPRBNK as a String.
  */
  public String getE01EPRBNK()
  {
    return fieldE01EPRBNK.getString();
  }

  /**
  * Set field E01EPRDSC using a String value.
  */
  public void setE01EPRDSC(String newvalue)
  {
    fieldE01EPRDSC.setString(newvalue);
  }

  /**
  * Get value of field E01EPRDSC as a String.
  */
  public String getE01EPRDSC()
  {
    return fieldE01EPRDSC.getString();
  }

  /**
  * Set field E01EPREXP using a String value.
  */
  public void setE01EPREXP(String newvalue)
  {
    fieldE01EPREXP.setString(newvalue);
  }

  /**
  * Get value of field E01EPREXP as a String.
  */
  public String getE01EPREXP()
  {
    return fieldE01EPREXP.getString();
  }

  /**
  * Set numeric field E01EPREXP using a BigDecimal value.
  */
  public void setE01EPREXP(BigDecimal newvalue)
  {
    fieldE01EPREXP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01EPREXP as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01EPREXP()
  {
    return fieldE01EPREXP.getBigDecimal();
  }

  /**
  * Set field E01EPRPSL using a String value.
  */
  public void setE01EPRPSL(String newvalue)
  {
    fieldE01EPRPSL.setString(newvalue);
  }

  /**
  * Get value of field E01EPRPSL as a String.
  */
  public String getE01EPRPSL()
  {
    return fieldE01EPRPSL.getString();
  }

  /**
  * Set numeric field E01EPRPSL using a BigDecimal value.
  */
  public void setE01EPRPSL(BigDecimal newvalue)
  {
    fieldE01EPRPSL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01EPRPSL as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01EPRPSL()
  {
    return fieldE01EPRPSL.getBigDecimal();
  }

  /**
  * Set field E01EPRRPC using a String value.
  */
  public void setE01EPRRPC(String newvalue)
  {
    fieldE01EPRRPC.setString(newvalue);
  }

  /**
  * Get value of field E01EPRRPC as a String.
  */
  public String getE01EPRRPC()
  {
    return fieldE01EPRRPC.getString();
  }

  /**
  * Set numeric field E01EPRRPC using a BigDecimal value.
  */
  public void setE01EPRRPC(BigDecimal newvalue)
  {
    fieldE01EPRRPC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01EPRRPC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01EPRRPC()
  {
    return fieldE01EPRRPC.getBigDecimal();
  }

  /**
  * Set field E01EPRLET using a String value.
  */
  public void setE01EPRLET(String newvalue)
  {
    fieldE01EPRLET.setString(newvalue);
  }

  /**
  * Get value of field E01EPRLET as a String.
  */
  public String getE01EPRLET()
  {
    return fieldE01EPRLET.getString();
  }

  /**
  * Set numeric field E01EPRLET using a BigDecimal value.
  */
  public void setE01EPRLET(BigDecimal newvalue)
  {
    fieldE01EPRLET.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01EPRLET as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01EPRLET()
  {
    return fieldE01EPRLET.getBigDecimal();
  }

  /**
  * Set field E01EPRETM using a String value.
  */
  public void setE01EPRETM(String newvalue)
  {
    fieldE01EPRETM.setString(newvalue);
  }

  /**
  * Get value of field E01EPRETM as a String.
  */
  public String getE01EPRETM()
  {
    return fieldE01EPRETM.getString();
  }

  /**
  * Set numeric field E01EPRETM using a BigDecimal value.
  */
  public void setE01EPRETM(BigDecimal newvalue)
  {
    fieldE01EPRETM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01EPRETM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01EPRETM()
  {
    return fieldE01EPRETM.getBigDecimal();
  }

  /**
  * Set field E01EPRSDS using a String value.
  */
  public void setE01EPRSDS(String newvalue)
  {
    fieldE01EPRSDS.setString(newvalue);
  }

  /**
  * Get value of field E01EPRSDS as a String.
  */
  public String getE01EPRSDS()
  {
    return fieldE01EPRSDS.getString();
  }

  /**
  * Set numeric field E01EPRSDS using a BigDecimal value.
  */
  public void setE01EPRSDS(BigDecimal newvalue)
  {
    fieldE01EPRSDS.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01EPRSDS as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01EPRSDS()
  {
    return fieldE01EPRSDS.getBigDecimal();
  }

  /**
  * Set field E01EPRDPI using a String value.
  */
  public void setE01EPRDPI(String newvalue)
  {
    fieldE01EPRDPI.setString(newvalue);
  }

  /**
  * Get value of field E01EPRDPI as a String.
  */
  public String getE01EPRDPI()
  {
    return fieldE01EPRDPI.getString();
  }

  /**
  * Set numeric field E01EPRDPI using a BigDecimal value.
  */
  public void setE01EPRDPI(BigDecimal newvalue)
  {
    fieldE01EPRDPI.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01EPRDPI as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01EPRDPI()
  {
    return fieldE01EPRDPI.getBigDecimal();
  }

  /**
  * Set field E01EPRCHG using a String value.
  */
  public void setE01EPRCHG(String newvalue)
  {
    fieldE01EPRCHG.setString(newvalue);
  }

  /**
  * Get value of field E01EPRCHG as a String.
  */
  public String getE01EPRCHG()
  {
    return fieldE01EPRCHG.getString();
  }

  /**
  * Set numeric field E01EPRCHG using a BigDecimal value.
  */
  public void setE01EPRCHG(BigDecimal newvalue)
  {
    fieldE01EPRCHG.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01EPRCHG as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01EPRCHG()
  {
    return fieldE01EPRCHG.getBigDecimal();
  }

  /**
  * Set field E01EPRSK1 using a String value.
  */
  public void setE01EPRSK1(String newvalue)
  {
    fieldE01EPRSK1.setString(newvalue);
  }

  /**
  * Get value of field E01EPRSK1 as a String.
  */
  public String getE01EPRSK1()
  {
    return fieldE01EPRSK1.getString();
  }

  /**
  * Set numeric field E01EPRSK1 using a BigDecimal value.
  */
  public void setE01EPRSK1(BigDecimal newvalue)
  {
    fieldE01EPRSK1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01EPRSK1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01EPRSK1()
  {
    return fieldE01EPRSK1.getBigDecimal();
  }

  /**
  * Set field E01EPRSK2 using a String value.
  */
  public void setE01EPRSK2(String newvalue)
  {
    fieldE01EPRSK2.setString(newvalue);
  }

  /**
  * Get value of field E01EPRSK2 as a String.
  */
  public String getE01EPRSK2()
  {
    return fieldE01EPRSK2.getString();
  }

  /**
  * Set numeric field E01EPRSK2 using a BigDecimal value.
  */
  public void setE01EPRSK2(BigDecimal newvalue)
  {
    fieldE01EPRSK2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01EPRSK2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01EPRSK2()
  {
    return fieldE01EPRSK2.getBigDecimal();
  }

  /**
  * Set field E01EPRSK3 using a String value.
  */
  public void setE01EPRSK3(String newvalue)
  {
    fieldE01EPRSK3.setString(newvalue);
  }

  /**
  * Get value of field E01EPRSK3 as a String.
  */
  public String getE01EPRSK3()
  {
    return fieldE01EPRSK3.getString();
  }

  /**
  * Set numeric field E01EPRSK3 using a BigDecimal value.
  */
  public void setE01EPRSK3(BigDecimal newvalue)
  {
    fieldE01EPRSK3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01EPRSK3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01EPRSK3()
  {
    return fieldE01EPRSK3.getBigDecimal();
  }

  /**
  * Set field E01EPRTOU using a String value.
  */
  public void setE01EPRTOU(String newvalue)
  {
    fieldE01EPRTOU.setString(newvalue);
  }

  /**
  * Get value of field E01EPRTOU as a String.
  */
  public String getE01EPRTOU()
  {
    return fieldE01EPRTOU.getString();
  }

  /**
  * Set numeric field E01EPRTOU using a BigDecimal value.
  */
  public void setE01EPRTOU(BigDecimal newvalue)
  {
    fieldE01EPRTOU.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01EPRTOU as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01EPRTOU()
  {
    return fieldE01EPRTOU.getBigDecimal();
  }

  /**
  * Set field E01EPRTRC using a String value.
  */
  public void setE01EPRTRC(String newvalue)
  {
    fieldE01EPRTRC.setString(newvalue);
  }

  /**
  * Get value of field E01EPRTRC as a String.
  */
  public String getE01EPRTRC()
  {
    return fieldE01EPRTRC.getString();
  }

  /**
  * Set field E01EPRFG1 using a String value.
  */
  public void setE01EPRFG1(String newvalue)
  {
    fieldE01EPRFG1.setString(newvalue);
  }

  /**
  * Get value of field E01EPRFG1 as a String.
  */
  public String getE01EPRFG1()
  {
    return fieldE01EPRFG1.getString();
  }

  /**
  * Set field E01EPRFG2 using a String value.
  */
  public void setE01EPRFG2(String newvalue)
  {
    fieldE01EPRFG2.setString(newvalue);
  }

  /**
  * Get value of field E01EPRFG2 as a String.
  */
  public String getE01EPRFG2()
  {
    return fieldE01EPRFG2.getString();
  }

  /**
  * Set field E01EPRFG3 using a String value.
  */
  public void setE01EPRFG3(String newvalue)
  {
    fieldE01EPRFG3.setString(newvalue);
  }

  /**
  * Get value of field E01EPRFG3 as a String.
  */
  public String getE01EPRFG3()
  {
    return fieldE01EPRFG3.getString();
  }

  /**
  * Set field E01EPROPE using a String value.
  */
  public void setE01EPROPE(String newvalue)
  {
    fieldE01EPROPE.setString(newvalue);
  }

  /**
  * Get value of field E01EPROPE as a String.
  */
  public String getE01EPROPE()
  {
    return fieldE01EPROPE.getString();
  }

}
