package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ETLR20001 physical file definition.
* 
* File level identifier is 1130611113410.
* Record format level identifier is 436B6DD97B256.
*/

public class ETLR20001Message extends MessageRecord
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
                                     "E01TLRBNK",
                                     "E01TLRCCY",
                                     "E01TLRMDP",
                                     "E01TLRLDDE",
                                     "E01TLRLTDE",
                                     "E01TLRLDWE",
                                     "E01TLRLTWE",
                                     "E01TLRLMWE",
                                     "E01TLRDAY",
                                     "E01TLRMAV",
                                     "E01TLRCAV",
                                     "E01TLRMCK",
                                     "E01TLRCCK",
                                     "E01TLRMIN",
                                     "E01TLRCIN",
                                     "E01TLRMUN",
                                     "E01TLRCUN",
                                     "E01TLRMOV",
                                     "E01TLRCOV",
                                     "E01OPECDE"
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
                                   "E01TLRBNK",
                                   "E01TLRCCY",
                                   "E01TLRMDP",
                                   "E01TLRLDDE",
                                   "E01TLRLTDE",
                                   "E01TLRLDWE",
                                   "E01TLRLTWE",
                                   "E01TLRLMWE",
                                   "E01TLRDAY",
                                   "E01TLRMAV",
                                   "E01TLRCAV",
                                   "E01TLRMCK",
                                   "E01TLRCCK",
                                   "E01TLRMIN",
                                   "E01TLRCIN",
                                   "E01TLRMUN",
                                   "E01TLRCUN",
                                   "E01TLRMOV",
                                   "E01TLRCOV",
                                   "E01OPECDE"
                                 };
  final static String fid = "1130611113410";
  final static String rid = "436B6DD97B256";
  final static String fmtname = "ETLR20001";
  final int FIELDCOUNT = 29;
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
  private CharacterField fieldE01TLRBNK = null;
  private CharacterField fieldE01TLRCCY = null;
  private DecimalField fieldE01TLRMDP = null;
  private DecimalField fieldE01TLRLDDE = null;
  private DecimalField fieldE01TLRLTDE = null;
  private DecimalField fieldE01TLRLDWE = null;
  private DecimalField fieldE01TLRLTWE = null;
  private DecimalField fieldE01TLRLMWE = null;
  private DecimalField fieldE01TLRDAY = null;
  private DecimalField fieldE01TLRMAV = null;
  private CharacterField fieldE01TLRCAV = null;
  private DecimalField fieldE01TLRMCK = null;
  private CharacterField fieldE01TLRCCK = null;
  private DecimalField fieldE01TLRMIN = null;
  private CharacterField fieldE01TLRCIN = null;
  private DecimalField fieldE01TLRMUN = null;
  private CharacterField fieldE01TLRCUN = null;
  private DecimalField fieldE01TLRMOV = null;
  private CharacterField fieldE01TLRCOV = null;
  private CharacterField fieldE01OPECDE = null;

  /**
  * Constructor for ETLR20001Message.
  */
  public ETLR20001Message()
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
    recordsize = 253;
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
    fields[9] = fieldE01TLRBNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E01TLRBNK");
    fields[10] = fieldE01TLRCCY =
    new CharacterField(message, HEADERSIZE + 44, 3, "E01TLRCCY");
    fields[11] = fieldE01TLRMDP =
    new DecimalField(message, HEADERSIZE + 47, 17, 2, "E01TLRMDP");
    fields[12] = fieldE01TLRLDDE =
    new DecimalField(message, HEADERSIZE + 64, 17, 2, "E01TLRLDDE");
    fields[13] = fieldE01TLRLTDE =
    new DecimalField(message, HEADERSIZE + 81, 17, 2, "E01TLRLTDE");
    fields[14] = fieldE01TLRLDWE =
    new DecimalField(message, HEADERSIZE + 98, 17, 2, "E01TLRLDWE");
    fields[15] = fieldE01TLRLTWE =
    new DecimalField(message, HEADERSIZE + 115, 17, 2, "E01TLRLTWE");
    fields[16] = fieldE01TLRLMWE =
    new DecimalField(message, HEADERSIZE + 132, 17, 2, "E01TLRLMWE");
    fields[17] = fieldE01TLRDAY =
    new DecimalField(message, HEADERSIZE + 149, 3, 0, "E01TLRDAY");
    fields[18] = fieldE01TLRMAV =
    new DecimalField(message, HEADERSIZE + 152, 17, 2, "E01TLRMAV");
    fields[19] = fieldE01TLRCAV =
    new CharacterField(message, HEADERSIZE + 169, 3, "E01TLRCAV");
    fields[20] = fieldE01TLRMCK =
    new DecimalField(message, HEADERSIZE + 172, 17, 2, "E01TLRMCK");
    fields[21] = fieldE01TLRCCK =
    new CharacterField(message, HEADERSIZE + 189, 3, "E01TLRCCK");
    fields[22] = fieldE01TLRMIN =
    new DecimalField(message, HEADERSIZE + 192, 17, 2, "E01TLRMIN");
    fields[23] = fieldE01TLRCIN =
    new CharacterField(message, HEADERSIZE + 209, 3, "E01TLRCIN");
    fields[24] = fieldE01TLRMUN =
    new DecimalField(message, HEADERSIZE + 212, 17, 2, "E01TLRMUN");
    fields[25] = fieldE01TLRCUN =
    new CharacterField(message, HEADERSIZE + 229, 3, "E01TLRCUN");
    fields[26] = fieldE01TLRMOV =
    new DecimalField(message, HEADERSIZE + 232, 17, 2, "E01TLRMOV");
    fields[27] = fieldE01TLRCOV =
    new CharacterField(message, HEADERSIZE + 249, 3, "E01TLRCOV");
    fields[28] = fieldE01OPECDE =
    new CharacterField(message, HEADERSIZE + 252, 1, "E01OPECDE");

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
  * Set field E01TLRBNK using a String value.
  */
  public void setE01TLRBNK(String newvalue)
  {
    fieldE01TLRBNK.setString(newvalue);
  }

  /**
  * Get value of field E01TLRBNK as a String.
  */
  public String getE01TLRBNK()
  {
    return fieldE01TLRBNK.getString();
  }

  /**
  * Set field E01TLRCCY using a String value.
  */
  public void setE01TLRCCY(String newvalue)
  {
    fieldE01TLRCCY.setString(newvalue);
  }

  /**
  * Get value of field E01TLRCCY as a String.
  */
  public String getE01TLRCCY()
  {
    return fieldE01TLRCCY.getString();
  }

  /**
  * Set field E01TLRMDP using a String value.
  */
  public void setE01TLRMDP(String newvalue)
  {
    fieldE01TLRMDP.setString(newvalue);
  }

  /**
  * Get value of field E01TLRMDP as a String.
  */
  public String getE01TLRMDP()
  {
    return fieldE01TLRMDP.getString();
  }

  /**
  * Set numeric field E01TLRMDP using a BigDecimal value.
  */
  public void setE01TLRMDP(BigDecimal newvalue)
  {
    fieldE01TLRMDP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TLRMDP as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TLRMDP()
  {
    return fieldE01TLRMDP.getBigDecimal();
  }

  /**
  * Set field E01TLRLDDE using a String value.
  */
  public void setE01TLRLDDE(String newvalue)
  {
    fieldE01TLRLDDE.setString(newvalue);
  }

  /**
  * Get value of field E01TLRLDDE as a String.
  */
  public String getE01TLRLDDE()
  {
    return fieldE01TLRLDDE.getString();
  }

  /**
  * Set numeric field E01TLRLDDE using a BigDecimal value.
  */
  public void setE01TLRLDDE(BigDecimal newvalue)
  {
    fieldE01TLRLDDE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TLRLDDE as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TLRLDDE()
  {
    return fieldE01TLRLDDE.getBigDecimal();
  }

  /**
  * Set field E01TLRLTDE using a String value.
  */
  public void setE01TLRLTDE(String newvalue)
  {
    fieldE01TLRLTDE.setString(newvalue);
  }

  /**
  * Get value of field E01TLRLTDE as a String.
  */
  public String getE01TLRLTDE()
  {
    return fieldE01TLRLTDE.getString();
  }

  /**
  * Set numeric field E01TLRLTDE using a BigDecimal value.
  */
  public void setE01TLRLTDE(BigDecimal newvalue)
  {
    fieldE01TLRLTDE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TLRLTDE as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TLRLTDE()
  {
    return fieldE01TLRLTDE.getBigDecimal();
  }

  /**
  * Set field E01TLRLDWE using a String value.
  */
  public void setE01TLRLDWE(String newvalue)
  {
    fieldE01TLRLDWE.setString(newvalue);
  }

  /**
  * Get value of field E01TLRLDWE as a String.
  */
  public String getE01TLRLDWE()
  {
    return fieldE01TLRLDWE.getString();
  }

  /**
  * Set numeric field E01TLRLDWE using a BigDecimal value.
  */
  public void setE01TLRLDWE(BigDecimal newvalue)
  {
    fieldE01TLRLDWE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TLRLDWE as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TLRLDWE()
  {
    return fieldE01TLRLDWE.getBigDecimal();
  }

  /**
  * Set field E01TLRLTWE using a String value.
  */
  public void setE01TLRLTWE(String newvalue)
  {
    fieldE01TLRLTWE.setString(newvalue);
  }

  /**
  * Get value of field E01TLRLTWE as a String.
  */
  public String getE01TLRLTWE()
  {
    return fieldE01TLRLTWE.getString();
  }

  /**
  * Set numeric field E01TLRLTWE using a BigDecimal value.
  */
  public void setE01TLRLTWE(BigDecimal newvalue)
  {
    fieldE01TLRLTWE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TLRLTWE as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TLRLTWE()
  {
    return fieldE01TLRLTWE.getBigDecimal();
  }

  /**
  * Set field E01TLRLMWE using a String value.
  */
  public void setE01TLRLMWE(String newvalue)
  {
    fieldE01TLRLMWE.setString(newvalue);
  }

  /**
  * Get value of field E01TLRLMWE as a String.
  */
  public String getE01TLRLMWE()
  {
    return fieldE01TLRLMWE.getString();
  }

  /**
  * Set numeric field E01TLRLMWE using a BigDecimal value.
  */
  public void setE01TLRLMWE(BigDecimal newvalue)
  {
    fieldE01TLRLMWE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TLRLMWE as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TLRLMWE()
  {
    return fieldE01TLRLMWE.getBigDecimal();
  }

  /**
  * Set field E01TLRDAY using a String value.
  */
  public void setE01TLRDAY(String newvalue)
  {
    fieldE01TLRDAY.setString(newvalue);
  }

  /**
  * Get value of field E01TLRDAY as a String.
  */
  public String getE01TLRDAY()
  {
    return fieldE01TLRDAY.getString();
  }

  /**
  * Set numeric field E01TLRDAY using a BigDecimal value.
  */
  public void setE01TLRDAY(BigDecimal newvalue)
  {
    fieldE01TLRDAY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TLRDAY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TLRDAY()
  {
    return fieldE01TLRDAY.getBigDecimal();
  }

  /**
  * Set field E01TLRMAV using a String value.
  */
  public void setE01TLRMAV(String newvalue)
  {
    fieldE01TLRMAV.setString(newvalue);
  }

  /**
  * Get value of field E01TLRMAV as a String.
  */
  public String getE01TLRMAV()
  {
    return fieldE01TLRMAV.getString();
  }

  /**
  * Set numeric field E01TLRMAV using a BigDecimal value.
  */
  public void setE01TLRMAV(BigDecimal newvalue)
  {
    fieldE01TLRMAV.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TLRMAV as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TLRMAV()
  {
    return fieldE01TLRMAV.getBigDecimal();
  }

  /**
  * Set field E01TLRCAV using a String value.
  */
  public void setE01TLRCAV(String newvalue)
  {
    fieldE01TLRCAV.setString(newvalue);
  }

  /**
  * Get value of field E01TLRCAV as a String.
  */
  public String getE01TLRCAV()
  {
    return fieldE01TLRCAV.getString();
  }

  /**
  * Set field E01TLRMCK using a String value.
  */
  public void setE01TLRMCK(String newvalue)
  {
    fieldE01TLRMCK.setString(newvalue);
  }

  /**
  * Get value of field E01TLRMCK as a String.
  */
  public String getE01TLRMCK()
  {
    return fieldE01TLRMCK.getString();
  }

  /**
  * Set numeric field E01TLRMCK using a BigDecimal value.
  */
  public void setE01TLRMCK(BigDecimal newvalue)
  {
    fieldE01TLRMCK.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TLRMCK as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TLRMCK()
  {
    return fieldE01TLRMCK.getBigDecimal();
  }

  /**
  * Set field E01TLRCCK using a String value.
  */
  public void setE01TLRCCK(String newvalue)
  {
    fieldE01TLRCCK.setString(newvalue);
  }

  /**
  * Get value of field E01TLRCCK as a String.
  */
  public String getE01TLRCCK()
  {
    return fieldE01TLRCCK.getString();
  }

  /**
  * Set field E01TLRMIN using a String value.
  */
  public void setE01TLRMIN(String newvalue)
  {
    fieldE01TLRMIN.setString(newvalue);
  }

  /**
  * Get value of field E01TLRMIN as a String.
  */
  public String getE01TLRMIN()
  {
    return fieldE01TLRMIN.getString();
  }

  /**
  * Set numeric field E01TLRMIN using a BigDecimal value.
  */
  public void setE01TLRMIN(BigDecimal newvalue)
  {
    fieldE01TLRMIN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TLRMIN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TLRMIN()
  {
    return fieldE01TLRMIN.getBigDecimal();
  }

  /**
  * Set field E01TLRCIN using a String value.
  */
  public void setE01TLRCIN(String newvalue)
  {
    fieldE01TLRCIN.setString(newvalue);
  }

  /**
  * Get value of field E01TLRCIN as a String.
  */
  public String getE01TLRCIN()
  {
    return fieldE01TLRCIN.getString();
  }

  /**
  * Set field E01TLRMUN using a String value.
  */
  public void setE01TLRMUN(String newvalue)
  {
    fieldE01TLRMUN.setString(newvalue);
  }

  /**
  * Get value of field E01TLRMUN as a String.
  */
  public String getE01TLRMUN()
  {
    return fieldE01TLRMUN.getString();
  }

  /**
  * Set numeric field E01TLRMUN using a BigDecimal value.
  */
  public void setE01TLRMUN(BigDecimal newvalue)
  {
    fieldE01TLRMUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TLRMUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TLRMUN()
  {
    return fieldE01TLRMUN.getBigDecimal();
  }

  /**
  * Set field E01TLRCUN using a String value.
  */
  public void setE01TLRCUN(String newvalue)
  {
    fieldE01TLRCUN.setString(newvalue);
  }

  /**
  * Get value of field E01TLRCUN as a String.
  */
  public String getE01TLRCUN()
  {
    return fieldE01TLRCUN.getString();
  }

  /**
  * Set field E01TLRMOV using a String value.
  */
  public void setE01TLRMOV(String newvalue)
  {
    fieldE01TLRMOV.setString(newvalue);
  }

  /**
  * Get value of field E01TLRMOV as a String.
  */
  public String getE01TLRMOV()
  {
    return fieldE01TLRMOV.getString();
  }

  /**
  * Set numeric field E01TLRMOV using a BigDecimal value.
  */
  public void setE01TLRMOV(BigDecimal newvalue)
  {
    fieldE01TLRMOV.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TLRMOV as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TLRMOV()
  {
    return fieldE01TLRMOV.getBigDecimal();
  }

  /**
  * Set field E01TLRCOV using a String value.
  */
  public void setE01TLRCOV(String newvalue)
  {
    fieldE01TLRCOV.setString(newvalue);
  }

  /**
  * Get value of field E01TLRCOV as a String.
  */
  public String getE01TLRCOV()
  {
    return fieldE01TLRCOV.getString();
  }

  /**
  * Set field E01OPECDE using a String value.
  */
  public void setE01OPECDE(String newvalue)
  {
    fieldE01OPECDE.setString(newvalue);
  }

  /**
  * Get value of field E01OPECDE as a String.
  */
  public String getE01OPECDE()
  {
    return fieldE01OPECDE.getString();
  }

}
