package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDD009201 physical file definition.
* 
* File level identifier is 1170113101617.
* Record format level identifier is 2F23347873265.
*/

public class EDD009201Message extends MessageRecord
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
                                     "E01ACMACC",
                                     "E01ACMACD",
                                     "E01ACMPRO",
                                     "E01ACMCUN",
                                     "E01CUSNA1",
                                     "E01ACMBNK",
                                     "E01ACMBRN",
                                     "E01ACMCCY",
                                     "E01ACMGLN",
                                     "E01BALDTM",
                                     "E01BALDTD",
                                     "E01BALDTY",
                                     "E01GRSBAL",
                                     "E01UNCOLL",
                                     "E01HOLDIN",
                                     "E01DISPON"
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
                                   "E01ACMACC",
                                   "E01ACMACD",
                                   "E01ACMPRO",
                                   "E01ACMCUN",
                                   "E01CUSNA1",
                                   "E01ACMBNK",
                                   "E01ACMBRN",
                                   "E01ACMCCY",
                                   "E01ACMGLN",
                                   "E01BALDTM",
                                   "E01BALDTD",
                                   "E01BALDTY",
                                   "E01GRSBAL",
                                   "E01UNCOLL",
                                   "E01HOLDIN",
                                   "E01DISPON"
                                 };
  final static String fid = "1170113101617";
  final static String rid = "2F23347873265";
  final static String fmtname = "EDD009201";
  final int FIELDCOUNT = 25;
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
  private DecimalField fieldE01ACMACC = null;
  private CharacterField fieldE01ACMACD = null;
  private CharacterField fieldE01ACMPRO = null;
  private DecimalField fieldE01ACMCUN = null;
  private CharacterField fieldE01CUSNA1 = null;
  private CharacterField fieldE01ACMBNK = null;
  private DecimalField fieldE01ACMBRN = null;
  private CharacterField fieldE01ACMCCY = null;
  private DecimalField fieldE01ACMGLN = null;
  private DecimalField fieldE01BALDTM = null;
  private DecimalField fieldE01BALDTD = null;
  private DecimalField fieldE01BALDTY = null;
  private DecimalField fieldE01GRSBAL = null;
  private DecimalField fieldE01UNCOLL = null;
  private DecimalField fieldE01HOLDIN = null;
  private DecimalField fieldE01DISPON = null;

  /**
  * Constructor for EDD009201Message.
  */
  public EDD009201Message()
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
    recordsize = 237;
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
    fields[9] = fieldE01ACMACC =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E01ACMACC");
    fields[10] = fieldE01ACMACD =
    new CharacterField(message, HEADERSIZE + 55, 2, "E01ACMACD");
    fields[11] = fieldE01ACMPRO =
    new CharacterField(message, HEADERSIZE + 57, 4, "E01ACMPRO");
    fields[12] = fieldE01ACMCUN =
    new DecimalField(message, HEADERSIZE + 61, 10, 0, "E01ACMCUN");
    fields[13] = fieldE01CUSNA1 =
    new CharacterField(message, HEADERSIZE + 71, 60, "E01CUSNA1");
    fields[14] = fieldE01ACMBNK =
    new CharacterField(message, HEADERSIZE + 131, 2, "E01ACMBNK");
    fields[15] = fieldE01ACMBRN =
    new DecimalField(message, HEADERSIZE + 133, 5, 0, "E01ACMBRN");
    fields[16] = fieldE01ACMCCY =
    new CharacterField(message, HEADERSIZE + 138, 3, "E01ACMCCY");
    fields[17] = fieldE01ACMGLN =
    new DecimalField(message, HEADERSIZE + 141, 17, 0, "E01ACMGLN");
    fields[18] = fieldE01BALDTM =
    new DecimalField(message, HEADERSIZE + 158, 3, 0, "E01BALDTM");
    fields[19] = fieldE01BALDTD =
    new DecimalField(message, HEADERSIZE + 161, 3, 0, "E01BALDTD");
    fields[20] = fieldE01BALDTY =
    new DecimalField(message, HEADERSIZE + 164, 5, 0, "E01BALDTY");
    fields[21] = fieldE01GRSBAL =
    new DecimalField(message, HEADERSIZE + 169, 17, 2, "E01GRSBAL");
    fields[22] = fieldE01UNCOLL =
    new DecimalField(message, HEADERSIZE + 186, 17, 2, "E01UNCOLL");
    fields[23] = fieldE01HOLDIN =
    new DecimalField(message, HEADERSIZE + 203, 17, 2, "E01HOLDIN");
    fields[24] = fieldE01DISPON =
    new DecimalField(message, HEADERSIZE + 220, 17, 2, "E01DISPON");

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
  * Set field E01ACMACC using a String value.
  */
  public void setE01ACMACC(String newvalue)
  {
    fieldE01ACMACC.setString(newvalue);
  }

  /**
  * Get value of field E01ACMACC as a String.
  */
  public String getE01ACMACC()
  {
    return fieldE01ACMACC.getString();
  }

  /**
  * Set numeric field E01ACMACC using a BigDecimal value.
  */
  public void setE01ACMACC(BigDecimal newvalue)
  {
    fieldE01ACMACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ACMACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ACMACC()
  {
    return fieldE01ACMACC.getBigDecimal();
  }

  /**
  * Set field E01ACMACD using a String value.
  */
  public void setE01ACMACD(String newvalue)
  {
    fieldE01ACMACD.setString(newvalue);
  }

  /**
  * Get value of field E01ACMACD as a String.
  */
  public String getE01ACMACD()
  {
    return fieldE01ACMACD.getString();
  }

  /**
  * Set field E01ACMPRO using a String value.
  */
  public void setE01ACMPRO(String newvalue)
  {
    fieldE01ACMPRO.setString(newvalue);
  }

  /**
  * Get value of field E01ACMPRO as a String.
  */
  public String getE01ACMPRO()
  {
    return fieldE01ACMPRO.getString();
  }

  /**
  * Set field E01ACMCUN using a String value.
  */
  public void setE01ACMCUN(String newvalue)
  {
    fieldE01ACMCUN.setString(newvalue);
  }

  /**
  * Get value of field E01ACMCUN as a String.
  */
  public String getE01ACMCUN()
  {
    return fieldE01ACMCUN.getString();
  }

  /**
  * Set numeric field E01ACMCUN using a BigDecimal value.
  */
  public void setE01ACMCUN(BigDecimal newvalue)
  {
    fieldE01ACMCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ACMCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ACMCUN()
  {
    return fieldE01ACMCUN.getBigDecimal();
  }

  /**
  * Set field E01CUSNA1 using a String value.
  */
  public void setE01CUSNA1(String newvalue)
  {
    fieldE01CUSNA1.setString(newvalue);
  }

  /**
  * Get value of field E01CUSNA1 as a String.
  */
  public String getE01CUSNA1()
  {
    return fieldE01CUSNA1.getString();
  }

  /**
  * Set field E01ACMBNK using a String value.
  */
  public void setE01ACMBNK(String newvalue)
  {
    fieldE01ACMBNK.setString(newvalue);
  }

  /**
  * Get value of field E01ACMBNK as a String.
  */
  public String getE01ACMBNK()
  {
    return fieldE01ACMBNK.getString();
  }

  /**
  * Set field E01ACMBRN using a String value.
  */
  public void setE01ACMBRN(String newvalue)
  {
    fieldE01ACMBRN.setString(newvalue);
  }

  /**
  * Get value of field E01ACMBRN as a String.
  */
  public String getE01ACMBRN()
  {
    return fieldE01ACMBRN.getString();
  }

  /**
  * Set numeric field E01ACMBRN using a BigDecimal value.
  */
  public void setE01ACMBRN(BigDecimal newvalue)
  {
    fieldE01ACMBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ACMBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ACMBRN()
  {
    return fieldE01ACMBRN.getBigDecimal();
  }

  /**
  * Set field E01ACMCCY using a String value.
  */
  public void setE01ACMCCY(String newvalue)
  {
    fieldE01ACMCCY.setString(newvalue);
  }

  /**
  * Get value of field E01ACMCCY as a String.
  */
  public String getE01ACMCCY()
  {
    return fieldE01ACMCCY.getString();
  }

  /**
  * Set field E01ACMGLN using a String value.
  */
  public void setE01ACMGLN(String newvalue)
  {
    fieldE01ACMGLN.setString(newvalue);
  }

  /**
  * Get value of field E01ACMGLN as a String.
  */
  public String getE01ACMGLN()
  {
    return fieldE01ACMGLN.getString();
  }

  /**
  * Set numeric field E01ACMGLN using a BigDecimal value.
  */
  public void setE01ACMGLN(BigDecimal newvalue)
  {
    fieldE01ACMGLN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ACMGLN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ACMGLN()
  {
    return fieldE01ACMGLN.getBigDecimal();
  }

  /**
  * Set field E01BALDTM using a String value.
  */
  public void setE01BALDTM(String newvalue)
  {
    fieldE01BALDTM.setString(newvalue);
  }

  /**
  * Get value of field E01BALDTM as a String.
  */
  public String getE01BALDTM()
  {
    return fieldE01BALDTM.getString();
  }

  /**
  * Set numeric field E01BALDTM using a BigDecimal value.
  */
  public void setE01BALDTM(BigDecimal newvalue)
  {
    fieldE01BALDTM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BALDTM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BALDTM()
  {
    return fieldE01BALDTM.getBigDecimal();
  }

  /**
  * Set field E01BALDTD using a String value.
  */
  public void setE01BALDTD(String newvalue)
  {
    fieldE01BALDTD.setString(newvalue);
  }

  /**
  * Get value of field E01BALDTD as a String.
  */
  public String getE01BALDTD()
  {
    return fieldE01BALDTD.getString();
  }

  /**
  * Set numeric field E01BALDTD using a BigDecimal value.
  */
  public void setE01BALDTD(BigDecimal newvalue)
  {
    fieldE01BALDTD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BALDTD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BALDTD()
  {
    return fieldE01BALDTD.getBigDecimal();
  }

  /**
  * Set field E01BALDTY using a String value.
  */
  public void setE01BALDTY(String newvalue)
  {
    fieldE01BALDTY.setString(newvalue);
  }

  /**
  * Get value of field E01BALDTY as a String.
  */
  public String getE01BALDTY()
  {
    return fieldE01BALDTY.getString();
  }

  /**
  * Set numeric field E01BALDTY using a BigDecimal value.
  */
  public void setE01BALDTY(BigDecimal newvalue)
  {
    fieldE01BALDTY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BALDTY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BALDTY()
  {
    return fieldE01BALDTY.getBigDecimal();
  }

  /**
  * Set field E01GRSBAL using a String value.
  */
  public void setE01GRSBAL(String newvalue)
  {
    fieldE01GRSBAL.setString(newvalue);
  }

  /**
  * Get value of field E01GRSBAL as a String.
  */
  public String getE01GRSBAL()
  {
    return fieldE01GRSBAL.getString();
  }

  /**
  * Set numeric field E01GRSBAL using a BigDecimal value.
  */
  public void setE01GRSBAL(BigDecimal newvalue)
  {
    fieldE01GRSBAL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01GRSBAL as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01GRSBAL()
  {
    return fieldE01GRSBAL.getBigDecimal();
  }

  /**
  * Set field E01UNCOLL using a String value.
  */
  public void setE01UNCOLL(String newvalue)
  {
    fieldE01UNCOLL.setString(newvalue);
  }

  /**
  * Get value of field E01UNCOLL as a String.
  */
  public String getE01UNCOLL()
  {
    return fieldE01UNCOLL.getString();
  }

  /**
  * Set numeric field E01UNCOLL using a BigDecimal value.
  */
  public void setE01UNCOLL(BigDecimal newvalue)
  {
    fieldE01UNCOLL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01UNCOLL as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01UNCOLL()
  {
    return fieldE01UNCOLL.getBigDecimal();
  }

  /**
  * Set field E01HOLDIN using a String value.
  */
  public void setE01HOLDIN(String newvalue)
  {
    fieldE01HOLDIN.setString(newvalue);
  }

  /**
  * Get value of field E01HOLDIN as a String.
  */
  public String getE01HOLDIN()
  {
    return fieldE01HOLDIN.getString();
  }

  /**
  * Set numeric field E01HOLDIN using a BigDecimal value.
  */
  public void setE01HOLDIN(BigDecimal newvalue)
  {
    fieldE01HOLDIN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01HOLDIN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01HOLDIN()
  {
    return fieldE01HOLDIN.getBigDecimal();
  }

  /**
  * Set field E01DISPON using a String value.
  */
  public void setE01DISPON(String newvalue)
  {
    fieldE01DISPON.setString(newvalue);
  }

  /**
  * Get value of field E01DISPON as a String.
  */
  public String getE01DISPON()
  {
    return fieldE01DISPON.getString();
  }

  /**
  * Set numeric field E01DISPON using a BigDecimal value.
  */
  public void setE01DISPON(BigDecimal newvalue)
  {
    fieldE01DISPON.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DISPON as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DISPON()
  {
    return fieldE01DISPON.getBigDecimal();
  }

}
