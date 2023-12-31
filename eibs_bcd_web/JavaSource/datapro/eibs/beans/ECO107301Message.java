package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ECO107301 physical file definition.
* 
* File level identifier is 1150825122008.
* Record format level identifier is 48D87044C416D. 
*/

public class ECO107301Message extends MessageRecord
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
                                     "E01CCLBNK",
                                     "E01CCLCCO",
                                     "E01CCLRDM",
                                     "E01CCLRDD",
                                     "E01CCLRDY",
                                     "E01CCLTIM",
                                     "E01CCLUSR"
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
                                   "E01CCLBNK",
                                   "E01CCLCCO",
                                   "E01CCLRDM",
                                   "E01CCLRDD",
                                   "E01CCLRDY",
                                   "E01CCLTIM",
                                   "E01CCLUSR"
                                 };
  final static String fid = "1150825122008";
  final static String rid = "48D87044C416D";
  final static String fmtname = "ECO107301";
  final int FIELDCOUNT = 16;
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
  private CharacterField fieldE01CCLBNK = null;
  private CharacterField fieldE01CCLCCO = null;
  private DecimalField fieldE01CCLRDM = null;
  private DecimalField fieldE01CCLRDD = null;
  private DecimalField fieldE01CCLRDY = null;
  private CharacterField fieldE01CCLTIM = null;
  private CharacterField fieldE01CCLUSR = null;

  /**
  * Constructor for ECO107301Message.
  */
  public ECO107301Message()
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
    recordsize = 116;
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
    fields[9] = fieldE01CCLBNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E01CCLBNK");
    fields[10] = fieldE01CCLCCO =
    new CharacterField(message, HEADERSIZE + 44, 25, "E01CCLCCO");
    fields[11] = fieldE01CCLRDM =
    new DecimalField(message, HEADERSIZE + 69, 3, 0, "E01CCLRDM");
    fields[12] = fieldE01CCLRDD =
    new DecimalField(message, HEADERSIZE + 72, 3, 0, "E01CCLRDD");
    fields[13] = fieldE01CCLRDY =
    new DecimalField(message, HEADERSIZE + 75, 5, 0, "E01CCLRDY");
    fields[14] = fieldE01CCLTIM =
    new CharacterField(message, HEADERSIZE + 80, 26, "E01CCLTIM");
    fields[15] = fieldE01CCLUSR =
    new CharacterField(message, HEADERSIZE + 106, 10, "E01CCLUSR");

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
  * Set field E01CCLBNK using a String value.
  */
  public void setE01CCLBNK(String newvalue)
  {
    fieldE01CCLBNK.setString(newvalue);
  }

  /**
  * Get value of field E01CCLBNK as a String.
  */
  public String getE01CCLBNK()
  {
    return fieldE01CCLBNK.getString();
  }

  /**
  * Set field E01CCLCCO using a String value.
  */
  public void setE01CCLCCO(String newvalue)
  {
    fieldE01CCLCCO.setString(newvalue);
  }

  /**
  * Get value of field E01CCLCCO as a String.
  */
  public String getE01CCLCCO()
  {
    return fieldE01CCLCCO.getString();
  }

  /**
  * Set field E01CCLRDM using a String value.
  */
  public void setE01CCLRDM(String newvalue)
  {
    fieldE01CCLRDM.setString(newvalue);
  }

  /**
  * Get value of field E01CCLRDM as a String.
  */
  public String getE01CCLRDM()
  {
    return fieldE01CCLRDM.getString();
  }

  /**
  * Set numeric field E01CCLRDM using a BigDecimal value.
  */
  public void setE01CCLRDM(BigDecimal newvalue)
  {
    fieldE01CCLRDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CCLRDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CCLRDM()
  {
    return fieldE01CCLRDM.getBigDecimal();
  }

  /**
  * Set field E01CCLRDD using a String value.
  */
  public void setE01CCLRDD(String newvalue)
  {
    fieldE01CCLRDD.setString(newvalue);
  }

  /**
  * Get value of field E01CCLRDD as a String.
  */
  public String getE01CCLRDD()
  {
    return fieldE01CCLRDD.getString();
  }

  /**
  * Set numeric field E01CCLRDD using a BigDecimal value.
  */
  public void setE01CCLRDD(BigDecimal newvalue)
  {
    fieldE01CCLRDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CCLRDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CCLRDD()
  {
    return fieldE01CCLRDD.getBigDecimal();
  }

  /**
  * Set field E01CCLRDY using a String value.
  */
  public void setE01CCLRDY(String newvalue)
  {
    fieldE01CCLRDY.setString(newvalue);
  }

  /**
  * Get value of field E01CCLRDY as a String.
  */
  public String getE01CCLRDY()
  {
    return fieldE01CCLRDY.getString();
  }

  /**
  * Set numeric field E01CCLRDY using a BigDecimal value.
  */
  public void setE01CCLRDY(BigDecimal newvalue)
  {
    fieldE01CCLRDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CCLRDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CCLRDY()
  {
    return fieldE01CCLRDY.getBigDecimal();
  }

  /**
  * Set field E01CCLTIM using a String value.
  */
  public void setE01CCLTIM(String newvalue)
  {
    fieldE01CCLTIM.setString(newvalue);
  }

  /**
  * Get value of field E01CCLTIM as a String.
  */
  public String getE01CCLTIM()
  {
    return fieldE01CCLTIM.getString();
  }

  /**
  * Set field E01CCLUSR using a String value.
  */
  public void setE01CCLUSR(String newvalue)
  {
    fieldE01CCLUSR.setString(newvalue);
  }

  /**
  * Get value of field E01CCLUSR as a String.
  */
  public String getE01CCLUSR()
  {
    return fieldE01CCLUSR.getString();
  }

}
