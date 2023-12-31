package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDL015802 physical file definition.
* 
* File level identifier is 1131028180735.
* Record format level identifier is 4494DEC3C979A.
*/

public class EDL015802Message extends MessageRecord
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
                                     "E02DEAACC",
                                     "E02DEAACD",
                                     "E02DEABNK",
                                     "E02DEABRN",
                                     "E02DEACCY",
                                     "E02DEACUN",
                                     "E02DEAPRO",
                                     "E02CUSNA1",
                                     "E02DEAPDM",
                                     "E02DEAPDD",
                                     "E02DEAPDY",
                                     "E02STATUS",
                                     "E02MORDYS",
                                     "E02DLCFCB",
                                     "E02DLCFCM",
                                     "E02DLCFCD",
                                     "E02DLCFCY",
                                     "E02DLCRES",
                                     "E02DSCRES"
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
                                   "E02DEAACC",
                                   "E02DEAACD",
                                   "E02DEABNK",
                                   "E02DEABRN",
                                   "E02DEACCY",
                                   "E02DEACUN",
                                   "E02DEAPRO",
                                   "E02CUSNA1",
                                   "E02DEAPDM",
                                   "E02DEAPDD",
                                   "E02DEAPDY",
                                   "E02STATUS",
                                   "E02MORDYS",
                                   "E02DLCFCB",
                                   "E02DLCFCM",
                                   "E02DLCFCD",
                                   "E02DLCFCY",
                                   "E02DLCRES",
                                   "E02DSCRES"
                                 };
  final static String fid = "1131028180735";
  final static String rid = "4494DEC3C979A";
  final static String fmtname = "EDL015802";
  final int FIELDCOUNT = 28;
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
  private DecimalField fieldE02DEAACC = null;
  private CharacterField fieldE02DEAACD = null;
  private CharacterField fieldE02DEABNK = null;
  private DecimalField fieldE02DEABRN = null;
  private CharacterField fieldE02DEACCY = null;
  private DecimalField fieldE02DEACUN = null;
  private CharacterField fieldE02DEAPRO = null;
  private CharacterField fieldE02CUSNA1 = null;
  private DecimalField fieldE02DEAPDM = null;
  private DecimalField fieldE02DEAPDD = null;
  private DecimalField fieldE02DEAPDY = null;
  private CharacterField fieldE02STATUS = null;
  private DecimalField fieldE02MORDYS = null;
  private CharacterField fieldE02DLCFCB = null;
  private DecimalField fieldE02DLCFCM = null;
  private DecimalField fieldE02DLCFCD = null;
  private DecimalField fieldE02DLCFCY = null;
  private CharacterField fieldE02DLCRES = null;
  private CharacterField fieldE02DSCRES = null;

  /**
  * Constructor for EDL015802Message.
  */
  public EDL015802Message()
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
    recordsize = 243;
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
    fields[9] = fieldE02DEAACC =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E02DEAACC");
    fields[10] = fieldE02DEAACD =
    new CharacterField(message, HEADERSIZE + 55, 2, "E02DEAACD");
    fields[11] = fieldE02DEABNK =
    new CharacterField(message, HEADERSIZE + 57, 2, "E02DEABNK");
    fields[12] = fieldE02DEABRN =
    new DecimalField(message, HEADERSIZE + 59, 5, 0, "E02DEABRN");
    fields[13] = fieldE02DEACCY =
    new CharacterField(message, HEADERSIZE + 64, 3, "E02DEACCY");
    fields[14] = fieldE02DEACUN =
    new DecimalField(message, HEADERSIZE + 67, 10, 0, "E02DEACUN");
    fields[15] = fieldE02DEAPRO =
    new CharacterField(message, HEADERSIZE + 77, 4, "E02DEAPRO");
    fields[16] = fieldE02CUSNA1 =
    new CharacterField(message, HEADERSIZE + 81, 60, "E02CUSNA1");
    fields[17] = fieldE02DEAPDM =
    new DecimalField(message, HEADERSIZE + 141, 3, 0, "E02DEAPDM");
    fields[18] = fieldE02DEAPDD =
    new DecimalField(message, HEADERSIZE + 144, 3, 0, "E02DEAPDD");
    fields[19] = fieldE02DEAPDY =
    new DecimalField(message, HEADERSIZE + 147, 5, 0, "E02DEAPDY");
    fields[20] = fieldE02STATUS =
    new CharacterField(message, HEADERSIZE + 152, 25, "E02STATUS");
    fields[21] = fieldE02MORDYS =
    new DecimalField(message, HEADERSIZE + 177, 5, 0, "E02MORDYS");
    fields[22] = fieldE02DLCFCB =
    new CharacterField(message, HEADERSIZE + 182, 1, "E02DLCFCB");
    fields[23] = fieldE02DLCFCM =
    new DecimalField(message, HEADERSIZE + 183, 3, 0, "E02DLCFCM");
    fields[24] = fieldE02DLCFCD =
    new DecimalField(message, HEADERSIZE + 186, 3, 0, "E02DLCFCD");
    fields[25] = fieldE02DLCFCY =
    new DecimalField(message, HEADERSIZE + 189, 5, 0, "E02DLCFCY");
    fields[26] = fieldE02DLCRES =
    new CharacterField(message, HEADERSIZE + 194, 4, "E02DLCRES");
    fields[27] = fieldE02DSCRES =
    new CharacterField(message, HEADERSIZE + 198, 45, "E02DSCRES");

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
  * Set field E02DEAACD using a String value.
  */
  public void setE02DEAACD(String newvalue)
  {
    fieldE02DEAACD.setString(newvalue);
  }

  /**
  * Get value of field E02DEAACD as a String.
  */
  public String getE02DEAACD()
  {
    return fieldE02DEAACD.getString();
  }

  /**
  * Set field E02DEABNK using a String value.
  */
  public void setE02DEABNK(String newvalue)
  {
    fieldE02DEABNK.setString(newvalue);
  }

  /**
  * Get value of field E02DEABNK as a String.
  */
  public String getE02DEABNK()
  {
    return fieldE02DEABNK.getString();
  }

  /**
  * Set field E02DEABRN using a String value.
  */
  public void setE02DEABRN(String newvalue)
  {
    fieldE02DEABRN.setString(newvalue);
  }

  /**
  * Get value of field E02DEABRN as a String.
  */
  public String getE02DEABRN()
  {
    return fieldE02DEABRN.getString();
  }

  /**
  * Set numeric field E02DEABRN using a BigDecimal value.
  */
  public void setE02DEABRN(BigDecimal newvalue)
  {
    fieldE02DEABRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DEABRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DEABRN()
  {
    return fieldE02DEABRN.getBigDecimal();
  }

  /**
  * Set field E02DEACCY using a String value.
  */
  public void setE02DEACCY(String newvalue)
  {
    fieldE02DEACCY.setString(newvalue);
  }

  /**
  * Get value of field E02DEACCY as a String.
  */
  public String getE02DEACCY()
  {
    return fieldE02DEACCY.getString();
  }

  /**
  * Set field E02DEACUN using a String value.
  */
  public void setE02DEACUN(String newvalue)
  {
    fieldE02DEACUN.setString(newvalue);
  }

  /**
  * Get value of field E02DEACUN as a String.
  */
  public String getE02DEACUN()
  {
    return fieldE02DEACUN.getString();
  }

  /**
  * Set numeric field E02DEACUN using a BigDecimal value.
  */
  public void setE02DEACUN(BigDecimal newvalue)
  {
    fieldE02DEACUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DEACUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DEACUN()
  {
    return fieldE02DEACUN.getBigDecimal();
  }

  /**
  * Set field E02DEAPRO using a String value.
  */
  public void setE02DEAPRO(String newvalue)
  {
    fieldE02DEAPRO.setString(newvalue);
  }

  /**
  * Get value of field E02DEAPRO as a String.
  */
  public String getE02DEAPRO()
  {
    return fieldE02DEAPRO.getString();
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
  * Set field E02DEAPDM using a String value.
  */
  public void setE02DEAPDM(String newvalue)
  {
    fieldE02DEAPDM.setString(newvalue);
  }

  /**
  * Get value of field E02DEAPDM as a String.
  */
  public String getE02DEAPDM()
  {
    return fieldE02DEAPDM.getString();
  }

  /**
  * Set numeric field E02DEAPDM using a BigDecimal value.
  */
  public void setE02DEAPDM(BigDecimal newvalue)
  {
    fieldE02DEAPDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DEAPDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DEAPDM()
  {
    return fieldE02DEAPDM.getBigDecimal();
  }

  /**
  * Set field E02DEAPDD using a String value.
  */
  public void setE02DEAPDD(String newvalue)
  {
    fieldE02DEAPDD.setString(newvalue);
  }

  /**
  * Get value of field E02DEAPDD as a String.
  */
  public String getE02DEAPDD()
  {
    return fieldE02DEAPDD.getString();
  }

  /**
  * Set numeric field E02DEAPDD using a BigDecimal value.
  */
  public void setE02DEAPDD(BigDecimal newvalue)
  {
    fieldE02DEAPDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DEAPDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DEAPDD()
  {
    return fieldE02DEAPDD.getBigDecimal();
  }

  /**
  * Set field E02DEAPDY using a String value.
  */
  public void setE02DEAPDY(String newvalue)
  {
    fieldE02DEAPDY.setString(newvalue);
  }

  /**
  * Get value of field E02DEAPDY as a String.
  */
  public String getE02DEAPDY()
  {
    return fieldE02DEAPDY.getString();
  }

  /**
  * Set numeric field E02DEAPDY using a BigDecimal value.
  */
  public void setE02DEAPDY(BigDecimal newvalue)
  {
    fieldE02DEAPDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DEAPDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DEAPDY()
  {
    return fieldE02DEAPDY.getBigDecimal();
  }

  /**
  * Set field E02STATUS using a String value.
  */
  public void setE02STATUS(String newvalue)
  {
    fieldE02STATUS.setString(newvalue);
  }

  /**
  * Get value of field E02STATUS as a String.
  */
  public String getE02STATUS()
  {
    return fieldE02STATUS.getString();
  }

  /**
  * Set field E02MORDYS using a String value.
  */
  public void setE02MORDYS(String newvalue)
  {
    fieldE02MORDYS.setString(newvalue);
  }

  /**
  * Get value of field E02MORDYS as a String.
  */
  public String getE02MORDYS()
  {
    return fieldE02MORDYS.getString();
  }

  /**
  * Set numeric field E02MORDYS using a BigDecimal value.
  */
  public void setE02MORDYS(BigDecimal newvalue)
  {
    fieldE02MORDYS.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02MORDYS as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02MORDYS()
  {
    return fieldE02MORDYS.getBigDecimal();
  }

  /**
  * Set field E02DLCFCB using a String value.
  */
  public void setE02DLCFCB(String newvalue)
  {
    fieldE02DLCFCB.setString(newvalue);
  }

  /**
  * Get value of field E02DLCFCB as a String.
  */
  public String getE02DLCFCB()
  {
    return fieldE02DLCFCB.getString();
  }

  /**
  * Set field E02DLCFCM using a String value.
  */
  public void setE02DLCFCM(String newvalue)
  {
    fieldE02DLCFCM.setString(newvalue);
  }

  /**
  * Get value of field E02DLCFCM as a String.
  */
  public String getE02DLCFCM()
  {
    return fieldE02DLCFCM.getString();
  }

  /**
  * Set numeric field E02DLCFCM using a BigDecimal value.
  */
  public void setE02DLCFCM(BigDecimal newvalue)
  {
    fieldE02DLCFCM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DLCFCM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DLCFCM()
  {
    return fieldE02DLCFCM.getBigDecimal();
  }

  /**
  * Set field E02DLCFCD using a String value.
  */
  public void setE02DLCFCD(String newvalue)
  {
    fieldE02DLCFCD.setString(newvalue);
  }

  /**
  * Get value of field E02DLCFCD as a String.
  */
  public String getE02DLCFCD()
  {
    return fieldE02DLCFCD.getString();
  }

  /**
  * Set numeric field E02DLCFCD using a BigDecimal value.
  */
  public void setE02DLCFCD(BigDecimal newvalue)
  {
    fieldE02DLCFCD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DLCFCD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DLCFCD()
  {
    return fieldE02DLCFCD.getBigDecimal();
  }

  /**
  * Set field E02DLCFCY using a String value.
  */
  public void setE02DLCFCY(String newvalue)
  {
    fieldE02DLCFCY.setString(newvalue);
  }

  /**
  * Get value of field E02DLCFCY as a String.
  */
  public String getE02DLCFCY()
  {
    return fieldE02DLCFCY.getString();
  }

  /**
  * Set numeric field E02DLCFCY using a BigDecimal value.
  */
  public void setE02DLCFCY(BigDecimal newvalue)
  {
    fieldE02DLCFCY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DLCFCY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DLCFCY()
  {
    return fieldE02DLCFCY.getBigDecimal();
  }

  /**
  * Set field E02DLCRES using a String value.
  */
  public void setE02DLCRES(String newvalue)
  {
    fieldE02DLCRES.setString(newvalue);
  }

  /**
  * Get value of field E02DLCRES as a String.
  */
  public String getE02DLCRES()
  {
    return fieldE02DLCRES.getString();
  }

  /**
  * Set field E02DSCRES using a String value.
  */
  public void setE02DSCRES(String newvalue)
  {
    fieldE02DSCRES.setString(newvalue);
  }

  /**
  * Get value of field E02DSCRES as a String.
  */
  public String getE02DSCRES()
  {
    return fieldE02DSCRES.getString();
  }

}
