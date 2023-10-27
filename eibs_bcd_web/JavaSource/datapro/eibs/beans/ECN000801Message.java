package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ECN000801 physical file definition.
* 
* File level identifier is 1151112064736.
* Record format level identifier is 316F4E6FFF582.
*/

public class ECN000801Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H81USERID",
                                     "H81PROGRM",
                                     "H81TIMSYS",
                                     "H81SCRCOD",
                                     "H81OPECOD",
                                     "H81FLGMAS",
                                     "H81FLGWK1",
                                     "H81FLGWK2",
                                     "H81FLGWK3",
                                     "E81RTEBNK",
                                     "E81RTEATY",
                                     "E81RTETID",
                                     "E81RTEIDN",
                                     "E81RTEACC",
                                     "E81RTEOPM",
                                     "E81RTEOPD",
                                     "E81RTEOPY",
                                     "E81RTEMAM",
                                     "E81RTEMAD",
                                     "E81RTEMAY",
                                     "E81C1001",
                                     "E81C2001",
                                     "E81C1002",
                                     "E81C2002",
                                     "E81C1003",
                                     "E81C2003",
                                     "E81C1004",
                                     "E81C2004",
                                     "E81C1005",
                                     "E81C2005",
                                     "E81C1006",
                                     "E81C2006",
                                     "E81C1007",
                                     "E81C2007",
                                     "E81C1008",
                                     "E81C2008",
                                     "E81C1009",
                                     "E81C2009",
                                     "E81C1010",
                                     "E81C2010",
                                     "E81C1011",
                                     "E81C2011",
                                     "E81C1012",
                                     "E81C2012",
                                     "E81RTEFTL",
                                     "E81RTEFYL",
                                     "E81RTEFCL",
                                     "E81RTEFFL",
                                     "E81RTEDBC",
                                     "E81RTEBTY"
                                   };
  final static String tnames[] = {
                                   "H81USERID",
                                   "H81PROGRM",
                                   "H81TIMSYS",
                                   "H81SCRCOD",
                                   "H81OPECOD",
                                   "H81FLGMAS",
                                   "H81FLGWK1",
                                   "H81FLGWK2",
                                   "H81FLGWK3",
                                   "E81RTEBNK",
                                   "E81RTEATY",
                                   "E81RTETID",
                                   "E81RTEIDN",
                                   "E81RTEACC",
                                   "E81RTEOPM",
                                   "E81RTEOPD",
                                   "E81RTEOPY",
                                   "E81RTEMAM",
                                   "E81RTEMAD",
                                   "E81RTEMAY",
                                   "E81C1001",
                                   "E81C2001",
                                   "E81C1002",
                                   "E81C2002",
                                   "E81C1003",
                                   "E81C2003",
                                   "E81C1004",
                                   "E81C2004",
                                   "E81C1005",
                                   "E81C2005",
                                   "E81C1006",
                                   "E81C2006",
                                   "E81C1007",
                                   "E81C2007",
                                   "E81C1008",
                                   "E81C2008",
                                   "E81C1009",
                                   "E81C2009",
                                   "E81C1010",
                                   "E81C2010",
                                   "E81C1011",
                                   "E81C2011",
                                   "E81C1012",
                                   "E81C2012",
                                   "E81RTEFTL",
                                   "E81RTEFYL",
                                   "E81RTEFCL",
                                   "E81RTEFFL",
                                   "E81RTEDBC",
                                   "E81RTEBTY"
                                 };
  final static String fid = "1151112064736";
  final static String rid = "316F4E6FFF582";
  final static String fmtname = "ECN000801";
  final int FIELDCOUNT = 50;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH81USERID = null;
  private CharacterField fieldH81PROGRM = null;
  private CharacterField fieldH81TIMSYS = null;
  private CharacterField fieldH81SCRCOD = null;
  private CharacterField fieldH81OPECOD = null;
  private CharacterField fieldH81FLGMAS = null;
  private CharacterField fieldH81FLGWK1 = null;
  private CharacterField fieldH81FLGWK2 = null;
  private CharacterField fieldH81FLGWK3 = null;
  private CharacterField fieldE81RTEBNK = null;
  private CharacterField fieldE81RTEATY = null;
  private CharacterField fieldE81RTETID = null;
  private CharacterField fieldE81RTEIDN = null;
  private DecimalField fieldE81RTEACC = null;
  private DecimalField fieldE81RTEOPM = null;
  private DecimalField fieldE81RTEOPD = null;
  private DecimalField fieldE81RTEOPY = null;
  private DecimalField fieldE81RTEMAM = null;
  private DecimalField fieldE81RTEMAD = null;
  private DecimalField fieldE81RTEMAY = null;
  private DecimalField fieldE81C1001 = null;
  private DecimalField fieldE81C2001 = null;
  private DecimalField fieldE81C1002 = null;
  private DecimalField fieldE81C2002 = null;
  private DecimalField fieldE81C1003 = null;
  private DecimalField fieldE81C2003 = null;
  private DecimalField fieldE81C1004 = null;
  private DecimalField fieldE81C2004 = null;
  private DecimalField fieldE81C1005 = null;
  private DecimalField fieldE81C2005 = null;
  private DecimalField fieldE81C1006 = null;
  private DecimalField fieldE81C2006 = null;
  private DecimalField fieldE81C1007 = null;
  private DecimalField fieldE81C2007 = null;
  private DecimalField fieldE81C1008 = null;
  private DecimalField fieldE81C2008 = null;
  private DecimalField fieldE81C1009 = null;
  private DecimalField fieldE81C2009 = null;
  private DecimalField fieldE81C1010 = null;
  private DecimalField fieldE81C2010 = null;
  private DecimalField fieldE81C1011 = null;
  private DecimalField fieldE81C2011 = null;
  private DecimalField fieldE81C1012 = null;
  private DecimalField fieldE81C2012 = null;
  private CharacterField fieldE81RTEFTL = null;
  private CharacterField fieldE81RTEFYL = null;
  private DecimalField fieldE81RTEFCL = null;
  private CharacterField fieldE81RTEFFL = null;
  private CharacterField fieldE81RTEDBC = null;
  private CharacterField fieldE81RTEBTY = null;

  /**
  * Constructor for ECN000801Message.
  */
  public ECN000801Message()
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
    recordsize = 440;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH81USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "H81USERID");
    fields[1] = fieldH81PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H81PROGRM");
    fields[2] = fieldH81TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "H81TIMSYS");
    fields[3] = fieldH81SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "H81SCRCOD");
    fields[4] = fieldH81OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "H81OPECOD");
    fields[5] = fieldH81FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H81FLGMAS");
    fields[6] = fieldH81FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H81FLGWK1");
    fields[7] = fieldH81FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H81FLGWK2");
    fields[8] = fieldH81FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H81FLGWK3");
    fields[9] = fieldE81RTEBNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E81RTEBNK");
    fields[10] = fieldE81RTEATY =
    new CharacterField(message, HEADERSIZE + 44, 4, "E81RTEATY");
    fields[11] = fieldE81RTETID =
    new CharacterField(message, HEADERSIZE + 48, 4, "E81RTETID");
    fields[12] = fieldE81RTEIDN =
    new CharacterField(message, HEADERSIZE + 52, 25, "E81RTEIDN");
    fields[13] = fieldE81RTEACC =
    new DecimalField(message, HEADERSIZE + 77, 13, 0, "E81RTEACC");
    fields[14] = fieldE81RTEOPM =
    new DecimalField(message, HEADERSIZE + 90, 3, 0, "E81RTEOPM");
    fields[15] = fieldE81RTEOPD =
    new DecimalField(message, HEADERSIZE + 93, 3, 0, "E81RTEOPD");
    fields[16] = fieldE81RTEOPY =
    new DecimalField(message, HEADERSIZE + 96, 5, 0, "E81RTEOPY");
    fields[17] = fieldE81RTEMAM =
    new DecimalField(message, HEADERSIZE + 101, 3, 0, "E81RTEMAM");
    fields[18] = fieldE81RTEMAD =
    new DecimalField(message, HEADERSIZE + 104, 3, 0, "E81RTEMAD");
    fields[19] = fieldE81RTEMAY =
    new DecimalField(message, HEADERSIZE + 107, 5, 0, "E81RTEMAY");
    fields[20] = fieldE81C1001 =
    new DecimalField(message, HEADERSIZE + 112, 15, 2, "E81C1001");
    fields[21] = fieldE81C2001 =
    new DecimalField(message, HEADERSIZE + 127, 11, 6, "E81C2001");
    fields[22] = fieldE81C1002 =
    new DecimalField(message, HEADERSIZE + 138, 15, 2, "E81C1002");
    fields[23] = fieldE81C2002 =
    new DecimalField(message, HEADERSIZE + 153, 11, 6, "E81C2002");
    fields[24] = fieldE81C1003 =
    new DecimalField(message, HEADERSIZE + 164, 15, 2, "E81C1003");
    fields[25] = fieldE81C2003 =
    new DecimalField(message, HEADERSIZE + 179, 11, 6, "E81C2003");
    fields[26] = fieldE81C1004 =
    new DecimalField(message, HEADERSIZE + 190, 15, 2, "E81C1004");
    fields[27] = fieldE81C2004 =
    new DecimalField(message, HEADERSIZE + 205, 11, 6, "E81C2004");
    fields[28] = fieldE81C1005 =
    new DecimalField(message, HEADERSIZE + 216, 15, 2, "E81C1005");
    fields[29] = fieldE81C2005 =
    new DecimalField(message, HEADERSIZE + 231, 11, 6, "E81C2005");
    fields[30] = fieldE81C1006 =
    new DecimalField(message, HEADERSIZE + 242, 15, 2, "E81C1006");
    fields[31] = fieldE81C2006 =
    new DecimalField(message, HEADERSIZE + 257, 11, 6, "E81C2006");
    fields[32] = fieldE81C1007 =
    new DecimalField(message, HEADERSIZE + 268, 15, 2, "E81C1007");
    fields[33] = fieldE81C2007 =
    new DecimalField(message, HEADERSIZE + 283, 11, 6, "E81C2007");
    fields[34] = fieldE81C1008 =
    new DecimalField(message, HEADERSIZE + 294, 15, 2, "E81C1008");
    fields[35] = fieldE81C2008 =
    new DecimalField(message, HEADERSIZE + 309, 11, 6, "E81C2008");
    fields[36] = fieldE81C1009 =
    new DecimalField(message, HEADERSIZE + 320, 15, 2, "E81C1009");
    fields[37] = fieldE81C2009 =
    new DecimalField(message, HEADERSIZE + 335, 11, 6, "E81C2009");
    fields[38] = fieldE81C1010 =
    new DecimalField(message, HEADERSIZE + 346, 15, 2, "E81C1010");
    fields[39] = fieldE81C2010 =
    new DecimalField(message, HEADERSIZE + 361, 11, 6, "E81C2010");
    fields[40] = fieldE81C1011 =
    new DecimalField(message, HEADERSIZE + 372, 15, 2, "E81C1011");
    fields[41] = fieldE81C2011 =
    new DecimalField(message, HEADERSIZE + 387, 11, 6, "E81C2011");
    fields[42] = fieldE81C1012 =
    new DecimalField(message, HEADERSIZE + 398, 15, 2, "E81C1012");
    fields[43] = fieldE81C2012 =
    new DecimalField(message, HEADERSIZE + 413, 11, 6, "E81C2012");
    fields[44] = fieldE81RTEFTL =
    new CharacterField(message, HEADERSIZE + 424, 2, "E81RTEFTL");
    fields[45] = fieldE81RTEFYL =
    new CharacterField(message, HEADERSIZE + 426, 2, "E81RTEFYL");
    fields[46] = fieldE81RTEFCL =
    new DecimalField(message, HEADERSIZE + 428, 8, 3, "E81RTEFCL");
    fields[47] = fieldE81RTEFFL =
    new CharacterField(message, HEADERSIZE + 436, 1, "E81RTEFFL");
    fields[48] = fieldE81RTEDBC =
    new CharacterField(message, HEADERSIZE + 437, 1, "E81RTEDBC");
    fields[49] = fieldE81RTEBTY =
    new CharacterField(message, HEADERSIZE + 438, 2, "E81RTEBTY");

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
  * Set field H81USERID using a String value.
  */
  public void setH81USERID(String newvalue)
  {
    fieldH81USERID.setString(newvalue);
  }

  /**
  * Get value of field H81USERID as a String.
  */
  public String getH81USERID()
  {
    return fieldH81USERID.getString();
  }

  /**
  * Set field H81PROGRM using a String value.
  */
  public void setH81PROGRM(String newvalue)
  {
    fieldH81PROGRM.setString(newvalue);
  }

  /**
  * Get value of field H81PROGRM as a String.
  */
  public String getH81PROGRM()
  {
    return fieldH81PROGRM.getString();
  }

  /**
  * Set field H81TIMSYS using a String value.
  */
  public void setH81TIMSYS(String newvalue)
  {
    fieldH81TIMSYS.setString(newvalue);
  }

  /**
  * Get value of field H81TIMSYS as a String.
  */
  public String getH81TIMSYS()
  {
    return fieldH81TIMSYS.getString();
  }

  /**
  * Set field H81SCRCOD using a String value.
  */
  public void setH81SCRCOD(String newvalue)
  {
    fieldH81SCRCOD.setString(newvalue);
  }

  /**
  * Get value of field H81SCRCOD as a String.
  */
  public String getH81SCRCOD()
  {
    return fieldH81SCRCOD.getString();
  }

  /**
  * Set field H81OPECOD using a String value.
  */
  public void setH81OPECOD(String newvalue)
  {
    fieldH81OPECOD.setString(newvalue);
  }

  /**
  * Get value of field H81OPECOD as a String.
  */
  public String getH81OPECOD()
  {
    return fieldH81OPECOD.getString();
  }

  /**
  * Set field H81FLGMAS using a String value.
  */
  public void setH81FLGMAS(String newvalue)
  {
    fieldH81FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H81FLGMAS as a String.
  */
  public String getH81FLGMAS()
  {
    return fieldH81FLGMAS.getString();
  }

  /**
  * Set field H81FLGWK1 using a String value.
  */
  public void setH81FLGWK1(String newvalue)
  {
    fieldH81FLGWK1.setString(newvalue);
  }

  /**
  * Get value of field H81FLGWK1 as a String.
  */
  public String getH81FLGWK1()
  {
    return fieldH81FLGWK1.getString();
  }

  /**
  * Set field H81FLGWK2 using a String value.
  */
  public void setH81FLGWK2(String newvalue)
  {
    fieldH81FLGWK2.setString(newvalue);
  }

  /**
  * Get value of field H81FLGWK2 as a String.
  */
  public String getH81FLGWK2()
  {
    return fieldH81FLGWK2.getString();
  }

  /**
  * Set field H81FLGWK3 using a String value.
  */
  public void setH81FLGWK3(String newvalue)
  {
    fieldH81FLGWK3.setString(newvalue);
  }

  /**
  * Get value of field H81FLGWK3 as a String.
  */
  public String getH81FLGWK3()
  {
    return fieldH81FLGWK3.getString();
  }

  /**
  * Set field E81RTEBNK using a String value.
  */
  public void setE81RTEBNK(String newvalue)
  {
    fieldE81RTEBNK.setString(newvalue);
  }

  /**
  * Get value of field E81RTEBNK as a String.
  */
  public String getE81RTEBNK()
  {
    return fieldE81RTEBNK.getString();
  }

  /**
  * Set field E81RTEATY using a String value.
  */
  public void setE81RTEATY(String newvalue)
  {
    fieldE81RTEATY.setString(newvalue);
  }

  /**
  * Get value of field E81RTEATY as a String.
  */
  public String getE81RTEATY()
  {
    return fieldE81RTEATY.getString();
  }

  /**
  * Set field E81RTETID using a String value.
  */
  public void setE81RTETID(String newvalue)
  {
    fieldE81RTETID.setString(newvalue);
  }

  /**
  * Get value of field E81RTETID as a String.
  */
  public String getE81RTETID()
  {
    return fieldE81RTETID.getString();
  }

  /**
  * Set field E81RTEIDN using a String value.
  */
  public void setE81RTEIDN(String newvalue)
  {
    fieldE81RTEIDN.setString(newvalue);
  }

  /**
  * Get value of field E81RTEIDN as a String.
  */
  public String getE81RTEIDN()
  {
    return fieldE81RTEIDN.getString();
  }

  /**
  * Set field E81RTEACC using a String value.
  */
  public void setE81RTEACC(String newvalue)
  {
    fieldE81RTEACC.setString(newvalue);
  }

  /**
  * Get value of field E81RTEACC as a String.
  */
  public String getE81RTEACC()
  {
    return fieldE81RTEACC.getString();
  }

  /**
  * Set numeric field E81RTEACC using a BigDecimal value.
  */
  public void setE81RTEACC(BigDecimal newvalue)
  {
    fieldE81RTEACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E81RTEACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE81RTEACC()
  {
    return fieldE81RTEACC.getBigDecimal();
  }

  /**
  * Set field E81RTEOPM using a String value.
  */
  public void setE81RTEOPM(String newvalue)
  {
    fieldE81RTEOPM.setString(newvalue);
  }

  /**
  * Get value of field E81RTEOPM as a String.
  */
  public String getE81RTEOPM()
  {
    return fieldE81RTEOPM.getString();
  }

  /**
  * Set numeric field E81RTEOPM using a BigDecimal value.
  */
  public void setE81RTEOPM(BigDecimal newvalue)
  {
    fieldE81RTEOPM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E81RTEOPM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE81RTEOPM()
  {
    return fieldE81RTEOPM.getBigDecimal();
  }

  /**
  * Set field E81RTEOPD using a String value.
  */
  public void setE81RTEOPD(String newvalue)
  {
    fieldE81RTEOPD.setString(newvalue);
  }

  /**
  * Get value of field E81RTEOPD as a String.
  */
  public String getE81RTEOPD()
  {
    return fieldE81RTEOPD.getString();
  }

  /**
  * Set numeric field E81RTEOPD using a BigDecimal value.
  */
  public void setE81RTEOPD(BigDecimal newvalue)
  {
    fieldE81RTEOPD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E81RTEOPD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE81RTEOPD()
  {
    return fieldE81RTEOPD.getBigDecimal();
  }

  /**
  * Set field E81RTEOPY using a String value.
  */
  public void setE81RTEOPY(String newvalue)
  {
    fieldE81RTEOPY.setString(newvalue);
  }

  /**
  * Get value of field E81RTEOPY as a String.
  */
  public String getE81RTEOPY()
  {
    return fieldE81RTEOPY.getString();
  }

  /**
  * Set numeric field E81RTEOPY using a BigDecimal value.
  */
  public void setE81RTEOPY(BigDecimal newvalue)
  {
    fieldE81RTEOPY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E81RTEOPY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE81RTEOPY()
  {
    return fieldE81RTEOPY.getBigDecimal();
  }

  /**
  * Set field E81RTEMAM using a String value.
  */
  public void setE81RTEMAM(String newvalue)
  {
    fieldE81RTEMAM.setString(newvalue);
  }

  /**
  * Get value of field E81RTEMAM as a String.
  */
  public String getE81RTEMAM()
  {
    return fieldE81RTEMAM.getString();
  }

  /**
  * Set numeric field E81RTEMAM using a BigDecimal value.
  */
  public void setE81RTEMAM(BigDecimal newvalue)
  {
    fieldE81RTEMAM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E81RTEMAM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE81RTEMAM()
  {
    return fieldE81RTEMAM.getBigDecimal();
  }

  /**
  * Set field E81RTEMAD using a String value.
  */
  public void setE81RTEMAD(String newvalue)
  {
    fieldE81RTEMAD.setString(newvalue);
  }

  /**
  * Get value of field E81RTEMAD as a String.
  */
  public String getE81RTEMAD()
  {
    return fieldE81RTEMAD.getString();
  }

  /**
  * Set numeric field E81RTEMAD using a BigDecimal value.
  */
  public void setE81RTEMAD(BigDecimal newvalue)
  {
    fieldE81RTEMAD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E81RTEMAD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE81RTEMAD()
  {
    return fieldE81RTEMAD.getBigDecimal();
  }

  /**
  * Set field E81RTEMAY using a String value.
  */
  public void setE81RTEMAY(String newvalue)
  {
    fieldE81RTEMAY.setString(newvalue);
  }

  /**
  * Get value of field E81RTEMAY as a String.
  */
  public String getE81RTEMAY()
  {
    return fieldE81RTEMAY.getString();
  }

  /**
  * Set numeric field E81RTEMAY using a BigDecimal value.
  */
  public void setE81RTEMAY(BigDecimal newvalue)
  {
    fieldE81RTEMAY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E81RTEMAY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE81RTEMAY()
  {
    return fieldE81RTEMAY.getBigDecimal();
  }

  /**
  * Set field E81C1001 using a String value.
  */
  public void setE81C1001(String newvalue)
  {
    fieldE81C1001.setString(newvalue);
  }

  /**
  * Get value of field E81C1001 as a String.
  */
  public String getE81C1001()
  {
    return fieldE81C1001.getString();
  }

  /**
  * Set numeric field E81C1001 using a BigDecimal value.
  */
  public void setE81C1001(BigDecimal newvalue)
  {
    fieldE81C1001.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E81C1001 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE81C1001()
  {
    return fieldE81C1001.getBigDecimal();
  }

  /**
  * Set field E81C2001 using a String value.
  */
  public void setE81C2001(String newvalue)
  {
    fieldE81C2001.setString(newvalue);
  }

  /**
  * Get value of field E81C2001 as a String.
  */
  public String getE81C2001()
  {
    return fieldE81C2001.getString();
  }

  /**
  * Set numeric field E81C2001 using a BigDecimal value.
  */
  public void setE81C2001(BigDecimal newvalue)
  {
    fieldE81C2001.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E81C2001 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE81C2001()
  {
    return fieldE81C2001.getBigDecimal();
  }

  /**
  * Set field E81C1002 using a String value.
  */
  public void setE81C1002(String newvalue)
  {
    fieldE81C1002.setString(newvalue);
  }

  /**
  * Get value of field E81C1002 as a String.
  */
  public String getE81C1002()
  {
    return fieldE81C1002.getString();
  }

  /**
  * Set numeric field E81C1002 using a BigDecimal value.
  */
  public void setE81C1002(BigDecimal newvalue)
  {
    fieldE81C1002.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E81C1002 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE81C1002()
  {
    return fieldE81C1002.getBigDecimal();
  }

  /**
  * Set field E81C2002 using a String value.
  */
  public void setE81C2002(String newvalue)
  {
    fieldE81C2002.setString(newvalue);
  }

  /**
  * Get value of field E81C2002 as a String.
  */
  public String getE81C2002()
  {
    return fieldE81C2002.getString();
  }

  /**
  * Set numeric field E81C2002 using a BigDecimal value.
  */
  public void setE81C2002(BigDecimal newvalue)
  {
    fieldE81C2002.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E81C2002 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE81C2002()
  {
    return fieldE81C2002.getBigDecimal();
  }

  /**
  * Set field E81C1003 using a String value.
  */
  public void setE81C1003(String newvalue)
  {
    fieldE81C1003.setString(newvalue);
  }

  /**
  * Get value of field E81C1003 as a String.
  */
  public String getE81C1003()
  {
    return fieldE81C1003.getString();
  }

  /**
  * Set numeric field E81C1003 using a BigDecimal value.
  */
  public void setE81C1003(BigDecimal newvalue)
  {
    fieldE81C1003.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E81C1003 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE81C1003()
  {
    return fieldE81C1003.getBigDecimal();
  }

  /**
  * Set field E81C2003 using a String value.
  */
  public void setE81C2003(String newvalue)
  {
    fieldE81C2003.setString(newvalue);
  }

  /**
  * Get value of field E81C2003 as a String.
  */
  public String getE81C2003()
  {
    return fieldE81C2003.getString();
  }

  /**
  * Set numeric field E81C2003 using a BigDecimal value.
  */
  public void setE81C2003(BigDecimal newvalue)
  {
    fieldE81C2003.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E81C2003 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE81C2003()
  {
    return fieldE81C2003.getBigDecimal();
  }

  /**
  * Set field E81C1004 using a String value.
  */
  public void setE81C1004(String newvalue)
  {
    fieldE81C1004.setString(newvalue);
  }

  /**
  * Get value of field E81C1004 as a String.
  */
  public String getE81C1004()
  {
    return fieldE81C1004.getString();
  }

  /**
  * Set numeric field E81C1004 using a BigDecimal value.
  */
  public void setE81C1004(BigDecimal newvalue)
  {
    fieldE81C1004.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E81C1004 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE81C1004()
  {
    return fieldE81C1004.getBigDecimal();
  }

  /**
  * Set field E81C2004 using a String value.
  */
  public void setE81C2004(String newvalue)
  {
    fieldE81C2004.setString(newvalue);
  }

  /**
  * Get value of field E81C2004 as a String.
  */
  public String getE81C2004()
  {
    return fieldE81C2004.getString();
  }

  /**
  * Set numeric field E81C2004 using a BigDecimal value.
  */
  public void setE81C2004(BigDecimal newvalue)
  {
    fieldE81C2004.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E81C2004 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE81C2004()
  {
    return fieldE81C2004.getBigDecimal();
  }

  /**
  * Set field E81C1005 using a String value.
  */
  public void setE81C1005(String newvalue)
  {
    fieldE81C1005.setString(newvalue);
  }

  /**
  * Get value of field E81C1005 as a String.
  */
  public String getE81C1005()
  {
    return fieldE81C1005.getString();
  }

  /**
  * Set numeric field E81C1005 using a BigDecimal value.
  */
  public void setE81C1005(BigDecimal newvalue)
  {
    fieldE81C1005.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E81C1005 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE81C1005()
  {
    return fieldE81C1005.getBigDecimal();
  }

  /**
  * Set field E81C2005 using a String value.
  */
  public void setE81C2005(String newvalue)
  {
    fieldE81C2005.setString(newvalue);
  }

  /**
  * Get value of field E81C2005 as a String.
  */
  public String getE81C2005()
  {
    return fieldE81C2005.getString();
  }

  /**
  * Set numeric field E81C2005 using a BigDecimal value.
  */
  public void setE81C2005(BigDecimal newvalue)
  {
    fieldE81C2005.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E81C2005 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE81C2005()
  {
    return fieldE81C2005.getBigDecimal();
  }

  /**
  * Set field E81C1006 using a String value.
  */
  public void setE81C1006(String newvalue)
  {
    fieldE81C1006.setString(newvalue);
  }

  /**
  * Get value of field E81C1006 as a String.
  */
  public String getE81C1006()
  {
    return fieldE81C1006.getString();
  }

  /**
  * Set numeric field E81C1006 using a BigDecimal value.
  */
  public void setE81C1006(BigDecimal newvalue)
  {
    fieldE81C1006.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E81C1006 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE81C1006()
  {
    return fieldE81C1006.getBigDecimal();
  }

  /**
  * Set field E81C2006 using a String value.
  */
  public void setE81C2006(String newvalue)
  {
    fieldE81C2006.setString(newvalue);
  }

  /**
  * Get value of field E81C2006 as a String.
  */
  public String getE81C2006()
  {
    return fieldE81C2006.getString();
  }

  /**
  * Set numeric field E81C2006 using a BigDecimal value.
  */
  public void setE81C2006(BigDecimal newvalue)
  {
    fieldE81C2006.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E81C2006 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE81C2006()
  {
    return fieldE81C2006.getBigDecimal();
  }

  /**
  * Set field E81C1007 using a String value.
  */
  public void setE81C1007(String newvalue)
  {
    fieldE81C1007.setString(newvalue);
  }

  /**
  * Get value of field E81C1007 as a String.
  */
  public String getE81C1007()
  {
    return fieldE81C1007.getString();
  }

  /**
  * Set numeric field E81C1007 using a BigDecimal value.
  */
  public void setE81C1007(BigDecimal newvalue)
  {
    fieldE81C1007.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E81C1007 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE81C1007()
  {
    return fieldE81C1007.getBigDecimal();
  }

  /**
  * Set field E81C2007 using a String value.
  */
  public void setE81C2007(String newvalue)
  {
    fieldE81C2007.setString(newvalue);
  }

  /**
  * Get value of field E81C2007 as a String.
  */
  public String getE81C2007()
  {
    return fieldE81C2007.getString();
  }

  /**
  * Set numeric field E81C2007 using a BigDecimal value.
  */
  public void setE81C2007(BigDecimal newvalue)
  {
    fieldE81C2007.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E81C2007 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE81C2007()
  {
    return fieldE81C2007.getBigDecimal();
  }

  /**
  * Set field E81C1008 using a String value.
  */
  public void setE81C1008(String newvalue)
  {
    fieldE81C1008.setString(newvalue);
  }

  /**
  * Get value of field E81C1008 as a String.
  */
  public String getE81C1008()
  {
    return fieldE81C1008.getString();
  }

  /**
  * Set numeric field E81C1008 using a BigDecimal value.
  */
  public void setE81C1008(BigDecimal newvalue)
  {
    fieldE81C1008.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E81C1008 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE81C1008()
  {
    return fieldE81C1008.getBigDecimal();
  }

  /**
  * Set field E81C2008 using a String value.
  */
  public void setE81C2008(String newvalue)
  {
    fieldE81C2008.setString(newvalue);
  }

  /**
  * Get value of field E81C2008 as a String.
  */
  public String getE81C2008()
  {
    return fieldE81C2008.getString();
  }

  /**
  * Set numeric field E81C2008 using a BigDecimal value.
  */
  public void setE81C2008(BigDecimal newvalue)
  {
    fieldE81C2008.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E81C2008 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE81C2008()
  {
    return fieldE81C2008.getBigDecimal();
  }

  /**
  * Set field E81C1009 using a String value.
  */
  public void setE81C1009(String newvalue)
  {
    fieldE81C1009.setString(newvalue);
  }

  /**
  * Get value of field E81C1009 as a String.
  */
  public String getE81C1009()
  {
    return fieldE81C1009.getString();
  }

  /**
  * Set numeric field E81C1009 using a BigDecimal value.
  */
  public void setE81C1009(BigDecimal newvalue)
  {
    fieldE81C1009.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E81C1009 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE81C1009()
  {
    return fieldE81C1009.getBigDecimal();
  }

  /**
  * Set field E81C2009 using a String value.
  */
  public void setE81C2009(String newvalue)
  {
    fieldE81C2009.setString(newvalue);
  }

  /**
  * Get value of field E81C2009 as a String.
  */
  public String getE81C2009()
  {
    return fieldE81C2009.getString();
  }

  /**
  * Set numeric field E81C2009 using a BigDecimal value.
  */
  public void setE81C2009(BigDecimal newvalue)
  {
    fieldE81C2009.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E81C2009 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE81C2009()
  {
    return fieldE81C2009.getBigDecimal();
  }

  /**
  * Set field E81C1010 using a String value.
  */
  public void setE81C1010(String newvalue)
  {
    fieldE81C1010.setString(newvalue);
  }

  /**
  * Get value of field E81C1010 as a String.
  */
  public String getE81C1010()
  {
    return fieldE81C1010.getString();
  }

  /**
  * Set numeric field E81C1010 using a BigDecimal value.
  */
  public void setE81C1010(BigDecimal newvalue)
  {
    fieldE81C1010.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E81C1010 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE81C1010()
  {
    return fieldE81C1010.getBigDecimal();
  }

  /**
  * Set field E81C2010 using a String value.
  */
  public void setE81C2010(String newvalue)
  {
    fieldE81C2010.setString(newvalue);
  }

  /**
  * Get value of field E81C2010 as a String.
  */
  public String getE81C2010()
  {
    return fieldE81C2010.getString();
  }

  /**
  * Set numeric field E81C2010 using a BigDecimal value.
  */
  public void setE81C2010(BigDecimal newvalue)
  {
    fieldE81C2010.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E81C2010 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE81C2010()
  {
    return fieldE81C2010.getBigDecimal();
  }

  /**
  * Set field E81C1011 using a String value.
  */
  public void setE81C1011(String newvalue)
  {
    fieldE81C1011.setString(newvalue);
  }

  /**
  * Get value of field E81C1011 as a String.
  */
  public String getE81C1011()
  {
    return fieldE81C1011.getString();
  }

  /**
  * Set numeric field E81C1011 using a BigDecimal value.
  */
  public void setE81C1011(BigDecimal newvalue)
  {
    fieldE81C1011.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E81C1011 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE81C1011()
  {
    return fieldE81C1011.getBigDecimal();
  }

  /**
  * Set field E81C2011 using a String value.
  */
  public void setE81C2011(String newvalue)
  {
    fieldE81C2011.setString(newvalue);
  }

  /**
  * Get value of field E81C2011 as a String.
  */
  public String getE81C2011()
  {
    return fieldE81C2011.getString();
  }

  /**
  * Set numeric field E81C2011 using a BigDecimal value.
  */
  public void setE81C2011(BigDecimal newvalue)
  {
    fieldE81C2011.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E81C2011 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE81C2011()
  {
    return fieldE81C2011.getBigDecimal();
  }

  /**
  * Set field E81C1012 using a String value.
  */
  public void setE81C1012(String newvalue)
  {
    fieldE81C1012.setString(newvalue);
  }

  /**
  * Get value of field E81C1012 as a String.
  */
  public String getE81C1012()
  {
    return fieldE81C1012.getString();
  }

  /**
  * Set numeric field E81C1012 using a BigDecimal value.
  */
  public void setE81C1012(BigDecimal newvalue)
  {
    fieldE81C1012.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E81C1012 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE81C1012()
  {
    return fieldE81C1012.getBigDecimal();
  }

  /**
  * Set field E81C2012 using a String value.
  */
  public void setE81C2012(String newvalue)
  {
    fieldE81C2012.setString(newvalue);
  }

  /**
  * Get value of field E81C2012 as a String.
  */
  public String getE81C2012()
  {
    return fieldE81C2012.getString();
  }

  /**
  * Set numeric field E81C2012 using a BigDecimal value.
  */
  public void setE81C2012(BigDecimal newvalue)
  {
    fieldE81C2012.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E81C2012 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE81C2012()
  {
    return fieldE81C2012.getBigDecimal();
  }

  /**
  * Set field E81RTEFTL using a String value.
  */
  public void setE81RTEFTL(String newvalue)
  {
    fieldE81RTEFTL.setString(newvalue);
  }

  /**
  * Get value of field E81RTEFTL as a String.
  */
  public String getE81RTEFTL()
  {
    return fieldE81RTEFTL.getString();
  }

  /**
  * Set field E81RTEFYL using a String value.
  */
  public void setE81RTEFYL(String newvalue)
  {
    fieldE81RTEFYL.setString(newvalue);
  }

  /**
  * Get value of field E81RTEFYL as a String.
  */
  public String getE81RTEFYL()
  {
    return fieldE81RTEFYL.getString();
  }

  /**
  * Set field E81RTEFCL using a String value.
  */
  public void setE81RTEFCL(String newvalue)
  {
    fieldE81RTEFCL.setString(newvalue);
  }

  /**
  * Get value of field E81RTEFCL as a String.
  */
  public String getE81RTEFCL()
  {
    return fieldE81RTEFCL.getString();
  }

  /**
  * Set numeric field E81RTEFCL using a BigDecimal value.
  */
  public void setE81RTEFCL(BigDecimal newvalue)
  {
    fieldE81RTEFCL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E81RTEFCL as a BigDecimal.
  */
  public BigDecimal getBigDecimalE81RTEFCL()
  {
    return fieldE81RTEFCL.getBigDecimal();
  }

  /**
  * Set field E81RTEFFL using a String value.
  */
  public void setE81RTEFFL(String newvalue)
  {
    fieldE81RTEFFL.setString(newvalue);
  }

  /**
  * Get value of field E81RTEFFL as a String.
  */
  public String getE81RTEFFL()
  {
    return fieldE81RTEFFL.getString();
  }

  /**
  * Set field E81RTEDBC using a String value.
  */
  public void setE81RTEDBC(String newvalue)
  {
    fieldE81RTEDBC.setString(newvalue);
  }

  /**
  * Get value of field E81RTEDBC as a String.
  */
  public String getE81RTEDBC()
  {
    return fieldE81RTEDBC.getString();
  }

  /**
  * Set field E81RTEBTY using a String value.
  */
  public void setE81RTEBTY(String newvalue)
  {
    fieldE81RTEBTY.setString(newvalue);
  }

  /**
  * Get value of field E81RTEBTY as a String.
  */
  public String getE81RTEBTY()
  {
    return fieldE81RTEBTY.getString();
  }

}
