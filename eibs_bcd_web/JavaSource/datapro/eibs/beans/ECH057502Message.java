package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ECH057502 physical file definition.
* 
* File level identifier is 1130611112845.
* Record format level identifier is 405B26602B312.
*/

public class ECH057502Message extends MessageRecord
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
                                     "E02ACMCUN",
                                     "E02ACMACC",
                                     "E02ACMPRO",
                                     "E02ACMATY",
                                     "E02ACMCCY",
                                     "E02CUSNA1",
                                     "E02CHPNO1",
                                     "E02CHPNO2",
                                     "E02CHPRE1",
                                     "E02CHPDBR",
                                     "E02CHPCON",
                                     "E02ACMMSK",
                                     "E02ACMTCB",
                                     "E02ACMCBC",
                                     "E02APCCCY"
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
                                   "E02ACMCUN",
                                   "E02ACMACC",
                                   "E02ACMPRO",
                                   "E02ACMATY",
                                   "E02ACMCCY",
                                   "E02CUSNA1",
                                   "E02CHPNO1",
                                   "E02CHPNO2",
                                   "E02CHPRE1",
                                   "E02CHPDBR",
                                   "E02CHPCON",
                                   "E02ACMMSK",
                                   "E02ACMTCB",
                                   "E02ACMCBC",
                                   "E02APCCCY"
                                 };
  final static String fid = "1130611112845";
  final static String rid = "405B26602B312";
  final static String fmtname = "ECH057502";
  final int FIELDCOUNT = 24;
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
  private DecimalField fieldE02ACMCUN = null;
  private DecimalField fieldE02ACMACC = null;
  private CharacterField fieldE02ACMPRO = null;
  private CharacterField fieldE02ACMATY = null;
  private CharacterField fieldE02ACMCCY = null;
  private CharacterField fieldE02CUSNA1 = null;
  private CharacterField fieldE02CHPNO1 = null;
  private CharacterField fieldE02CHPNO2 = null;
  private CharacterField fieldE02CHPRE1 = null;
  private DecimalField fieldE02CHPDBR = null;
  private CharacterField fieldE02CHPCON = null;
  private DecimalField fieldE02ACMMSK = null;
  private CharacterField fieldE02ACMTCB = null;
  private CharacterField fieldE02ACMCBC = null;
  private CharacterField fieldE02APCCCY = null;

  /**
  * Constructor for ECH057502Message.
  */
  public ECH057502Message()
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
    recordsize = 227;
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
    fields[9] = fieldE02ACMCUN =
    new DecimalField(message, HEADERSIZE + 42, 10, 0, "E02ACMCUN");
    fields[10] = fieldE02ACMACC =
    new DecimalField(message, HEADERSIZE + 52, 13, 0, "E02ACMACC");
    fields[11] = fieldE02ACMPRO =
    new CharacterField(message, HEADERSIZE + 65, 4, "E02ACMPRO");
    fields[12] = fieldE02ACMATY =
    new CharacterField(message, HEADERSIZE + 69, 4, "E02ACMATY");
    fields[13] = fieldE02ACMCCY =
    new CharacterField(message, HEADERSIZE + 73, 3, "E02ACMCCY");
    fields[14] = fieldE02CUSNA1 =
    new CharacterField(message, HEADERSIZE + 76, 45, "E02CUSNA1");
    fields[15] = fieldE02CHPNO1 =
    new CharacterField(message, HEADERSIZE + 121, 45, "E02CHPNO1");
    fields[16] = fieldE02CHPNO2 =
    new CharacterField(message, HEADERSIZE + 166, 45, "E02CHPNO2");
    fields[17] = fieldE02CHPRE1 =
    new CharacterField(message, HEADERSIZE + 211, 1, "E02CHPRE1");
    fields[18] = fieldE02CHPDBR =
    new DecimalField(message, HEADERSIZE + 212, 5, 0, "E02CHPDBR");
    fields[19] = fieldE02CHPCON =
    new CharacterField(message, HEADERSIZE + 217, 1, "E02CHPCON");
    fields[20] = fieldE02ACMMSK =
    new DecimalField(message, HEADERSIZE + 218, 3, 0, "E02ACMMSK");
    fields[21] = fieldE02ACMTCB =
    new CharacterField(message, HEADERSIZE + 221, 2, "E02ACMTCB");
    fields[22] = fieldE02ACMCBC =
    new CharacterField(message, HEADERSIZE + 223, 1, "E02ACMCBC");
    fields[23] = fieldE02APCCCY =
    new CharacterField(message, HEADERSIZE + 224, 3, "E02APCCCY");

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
  * Set field E02ACMCUN using a String value.
  */
  public void setE02ACMCUN(String newvalue)
  {
    fieldE02ACMCUN.setString(newvalue);
  }

  /**
  * Get value of field E02ACMCUN as a String.
  */
  public String getE02ACMCUN()
  {
    return fieldE02ACMCUN.getString();
  }

  /**
  * Set numeric field E02ACMCUN using a BigDecimal value.
  */
  public void setE02ACMCUN(BigDecimal newvalue)
  {
    fieldE02ACMCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02ACMCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02ACMCUN()
  {
    return fieldE02ACMCUN.getBigDecimal();
  }

  /**
  * Set field E02ACMACC using a String value.
  */
  public void setE02ACMACC(String newvalue)
  {
    fieldE02ACMACC.setString(newvalue);
  }

  /**
  * Get value of field E02ACMACC as a String.
  */
  public String getE02ACMACC()
  {
    return fieldE02ACMACC.getString();
  }

  /**
  * Set numeric field E02ACMACC using a BigDecimal value.
  */
  public void setE02ACMACC(BigDecimal newvalue)
  {
    fieldE02ACMACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02ACMACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02ACMACC()
  {
    return fieldE02ACMACC.getBigDecimal();
  }

  /**
  * Set field E02ACMPRO using a String value.
  */
  public void setE02ACMPRO(String newvalue)
  {
    fieldE02ACMPRO.setString(newvalue);
  }

  /**
  * Get value of field E02ACMPRO as a String.
  */
  public String getE02ACMPRO()
  {
    return fieldE02ACMPRO.getString();
  }

  /**
  * Set field E02ACMATY using a String value.
  */
  public void setE02ACMATY(String newvalue)
  {
    fieldE02ACMATY.setString(newvalue);
  }

  /**
  * Get value of field E02ACMATY as a String.
  */
  public String getE02ACMATY()
  {
    return fieldE02ACMATY.getString();
  }

  /**
  * Set field E02ACMCCY using a String value.
  */
  public void setE02ACMCCY(String newvalue)
  {
    fieldE02ACMCCY.setString(newvalue);
  }

  /**
  * Get value of field E02ACMCCY as a String.
  */
  public String getE02ACMCCY()
  {
    return fieldE02ACMCCY.getString();
  }

  /**
  * Set field E02CUSNA1 using a String value.
  */
  public void setE02CUSNA1(String newvalue)
  {
    fieldE02CUSNA1.setString(newvalue);
  }

  /**
  * Get value of field E02CUSNA1 as a String.
  */
  public String getE02CUSNA1()
  {
    return fieldE02CUSNA1.getString();
  }

  /**
  * Set field E02CHPNO1 using a String value.
  */
  public void setE02CHPNO1(String newvalue)
  {
    fieldE02CHPNO1.setString(newvalue);
  }

  /**
  * Get value of field E02CHPNO1 as a String.
  */
  public String getE02CHPNO1()
  {
    return fieldE02CHPNO1.getString();
  }

  /**
  * Set field E02CHPNO2 using a String value.
  */
  public void setE02CHPNO2(String newvalue)
  {
    fieldE02CHPNO2.setString(newvalue);
  }

  /**
  * Get value of field E02CHPNO2 as a String.
  */
  public String getE02CHPNO2()
  {
    return fieldE02CHPNO2.getString();
  }

  /**
  * Set field E02CHPRE1 using a String value.
  */
  public void setE02CHPRE1(String newvalue)
  {
    fieldE02CHPRE1.setString(newvalue);
  }

  /**
  * Get value of field E02CHPRE1 as a String.
  */
  public String getE02CHPRE1()
  {
    return fieldE02CHPRE1.getString();
  }

  /**
  * Set field E02CHPDBR using a String value.
  */
  public void setE02CHPDBR(String newvalue)
  {
    fieldE02CHPDBR.setString(newvalue);
  }

  /**
  * Get value of field E02CHPDBR as a String.
  */
  public String getE02CHPDBR()
  {
    return fieldE02CHPDBR.getString();
  }

  /**
  * Set numeric field E02CHPDBR using a BigDecimal value.
  */
  public void setE02CHPDBR(BigDecimal newvalue)
  {
    fieldE02CHPDBR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CHPDBR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CHPDBR()
  {
    return fieldE02CHPDBR.getBigDecimal();
  }

  /**
  * Set field E02CHPCON using a String value.
  */
  public void setE02CHPCON(String newvalue)
  {
    fieldE02CHPCON.setString(newvalue);
  }

  /**
  * Get value of field E02CHPCON as a String.
  */
  public String getE02CHPCON()
  {
    return fieldE02CHPCON.getString();
  }

  /**
  * Set field E02ACMMSK using a String value.
  */
  public void setE02ACMMSK(String newvalue)
  {
    fieldE02ACMMSK.setString(newvalue);
  }

  /**
  * Get value of field E02ACMMSK as a String.
  */
  public String getE02ACMMSK()
  {
    return fieldE02ACMMSK.getString();
  }

  /**
  * Set numeric field E02ACMMSK using a BigDecimal value.
  */
  public void setE02ACMMSK(BigDecimal newvalue)
  {
    fieldE02ACMMSK.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02ACMMSK as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02ACMMSK()
  {
    return fieldE02ACMMSK.getBigDecimal();
  }

  /**
  * Set field E02ACMTCB using a String value.
  */
  public void setE02ACMTCB(String newvalue)
  {
    fieldE02ACMTCB.setString(newvalue);
  }

  /**
  * Get value of field E02ACMTCB as a String.
  */
  public String getE02ACMTCB()
  {
    return fieldE02ACMTCB.getString();
  }

  /**
  * Set field E02ACMCBC using a String value.
  */
  public void setE02ACMCBC(String newvalue)
  {
    fieldE02ACMCBC.setString(newvalue);
  }

  /**
  * Get value of field E02ACMCBC as a String.
  */
  public String getE02ACMCBC()
  {
    return fieldE02ACMCBC.getString();
  }

  /**
  * Set field E02APCCCY using a String value.
  */
  public void setE02APCCCY(String newvalue)
  {
    fieldE02APCCCY.setString(newvalue);
  }

  /**
  * Get value of field E02APCCCY as a String.
  */
  public String getE02APCCCY()
  {
    return fieldE02APCCCY.getString();
  }

}
