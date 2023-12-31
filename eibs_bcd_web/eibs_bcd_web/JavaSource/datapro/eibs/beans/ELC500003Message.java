package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ELC500003 physical file definition.
* 
* File level identifier is 1160930132949.
* Record format level identifier is 33B6B979A469B.
*/

public class ELC500003Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H03USERID",
                                     "H03PROGRM",
                                     "H03TIMSYS",
                                     "H03SCRCOD",
                                     "H03OPECOD",
                                     "H03FLGMAS",
                                     "H03FLGWK1",
                                     "H03FLGWK2",
                                     "H03FLGWK3",
                                     "E03LCMACC",
                                     "E03LCMPRO",
                                     "E03LCMEEM",
                                     "E03LCMEED",
                                     "E03LCMEEY",
                                     "E03LCMEXM",
                                     "E03LCMEXD",
                                     "E03LCMEXY",
                                     "E03LCMIRT",
                                     "E03LCMC10",
                                     "E03LCMC11",
                                     "E03LCMC12",
                                     "E03PAGFLG",
                                     "F03LCMACC",
                                     "F03LCMEEM",
                                     "F03LCMEED",
                                     "F03LCMEEY",
                                     "F03LCMEXM",
                                     "F03LCMEXD",
                                     "F03LCMEXY",
                                     "F03LCMIRT",
                                     "F03LCMC10",
                                     "F03LCMC11",
                                     "F03LCMC12",
                                     "E03LCMEVF"
                                   };
  final static String tnames[] = {
                                   "H03USERID",
                                   "H03PROGRM",
                                   "H03TIMSYS",
                                   "H03SCRCOD",
                                   "H03OPECOD",
                                   "H03FLGMAS",
                                   "H03FLGWK1",
                                   "H03FLGWK2",
                                   "H03FLGWK3",
                                   "E03LCMACC",
                                   "E03LCMPRO",
                                   "E03LCMEEM",
                                   "E03LCMEED",
                                   "E03LCMEEY",
                                   "E03LCMEXM",
                                   "E03LCMEXD",
                                   "E03LCMEXY",
                                   "E03LCMIRT",
                                   "E03LCMC10",
                                   "E03LCMC11",
                                   "E03LCMC12",
                                   "E03PAGFLG",
                                   "F03LCMACC",
                                   "F03LCMEEM",
                                   "F03LCMEED",
                                   "F03LCMEEY",
                                   "F03LCMEXM",
                                   "F03LCMEXD",
                                   "F03LCMEXY",
                                   "F03LCMIRT",
                                   "F03LCMC10",
                                   "F03LCMC11",
                                   "F03LCMC12",
                                   "E03LCMEVF"
                                 };
  final static String fid = "1160930132949";
  final static String rid = "33B6B979A469B";
  final static String fmtname = "ELC500003";
  final int FIELDCOUNT = 34;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH03USERID = null;
  private CharacterField fieldH03PROGRM = null;
  private CharacterField fieldH03TIMSYS = null;
  private CharacterField fieldH03SCRCOD = null;
  private CharacterField fieldH03OPECOD = null;
  private CharacterField fieldH03FLGMAS = null;
  private CharacterField fieldH03FLGWK1 = null;
  private CharacterField fieldH03FLGWK2 = null;
  private CharacterField fieldH03FLGWK3 = null;
  private DecimalField fieldE03LCMACC = null;
  private CharacterField fieldE03LCMPRO = null;
  private DecimalField fieldE03LCMEEM = null;
  private DecimalField fieldE03LCMEED = null;
  private DecimalField fieldE03LCMEEY = null;
  private DecimalField fieldE03LCMEXM = null;
  private DecimalField fieldE03LCMEXD = null;
  private DecimalField fieldE03LCMEXY = null;
  private DecimalField fieldE03LCMIRT = null;
  private DecimalField fieldE03LCMC10 = null;
  private DecimalField fieldE03LCMC11 = null;
  private DecimalField fieldE03LCMC12 = null;
  private CharacterField fieldE03PAGFLG = null;
  private CharacterField fieldF03LCMACC = null;
  private CharacterField fieldF03LCMEEM = null;
  private CharacterField fieldF03LCMEED = null;
  private CharacterField fieldF03LCMEEY = null;
  private CharacterField fieldF03LCMEXM = null;
  private CharacterField fieldF03LCMEXD = null;
  private CharacterField fieldF03LCMEXY = null;
  private CharacterField fieldF03LCMIRT = null;
  private CharacterField fieldF03LCMC10 = null;
  private CharacterField fieldF03LCMC11 = null;
  private CharacterField fieldF03LCMC12 = null;
  private CharacterField fieldE03LCMEVF = null;

  /**
  * Constructor for ELC500003Message.
  */
  public ELC500003Message()
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
    recordsize = 156;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH03USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "H03USERID");
    fields[1] = fieldH03PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H03PROGRM");
    fields[2] = fieldH03TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "H03TIMSYS");
    fields[3] = fieldH03SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "H03SCRCOD");
    fields[4] = fieldH03OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "H03OPECOD");
    fields[5] = fieldH03FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H03FLGMAS");
    fields[6] = fieldH03FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H03FLGWK1");
    fields[7] = fieldH03FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H03FLGWK2");
    fields[8] = fieldH03FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H03FLGWK3");
    fields[9] = fieldE03LCMACC =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E03LCMACC");
    fields[10] = fieldE03LCMPRO =
    new CharacterField(message, HEADERSIZE + 55, 4, "E03LCMPRO");
    fields[11] = fieldE03LCMEEM =
    new DecimalField(message, HEADERSIZE + 59, 3, 0, "E03LCMEEM");
    fields[12] = fieldE03LCMEED =
    new DecimalField(message, HEADERSIZE + 62, 3, 0, "E03LCMEED");
    fields[13] = fieldE03LCMEEY =
    new DecimalField(message, HEADERSIZE + 65, 5, 0, "E03LCMEEY");
    fields[14] = fieldE03LCMEXM =
    new DecimalField(message, HEADERSIZE + 70, 3, 0, "E03LCMEXM");
    fields[15] = fieldE03LCMEXD =
    new DecimalField(message, HEADERSIZE + 73, 3, 0, "E03LCMEXD");
    fields[16] = fieldE03LCMEXY =
    new DecimalField(message, HEADERSIZE + 76, 5, 0, "E03LCMEXY");
    fields[17] = fieldE03LCMIRT =
    new DecimalField(message, HEADERSIZE + 81, 11, 6, "E03LCMIRT");
    fields[18] = fieldE03LCMC10 =
    new DecimalField(message, HEADERSIZE + 92, 17, 2, "E03LCMC10");
    fields[19] = fieldE03LCMC11 =
    new DecimalField(message, HEADERSIZE + 109, 17, 2, "E03LCMC11");
    fields[20] = fieldE03LCMC12 =
    new DecimalField(message, HEADERSIZE + 126, 17, 2, "E03LCMC12");
    fields[21] = fieldE03PAGFLG =
    new CharacterField(message, HEADERSIZE + 143, 1, "E03PAGFLG");
    fields[22] = fieldF03LCMACC =
    new CharacterField(message, HEADERSIZE + 144, 1, "F03LCMACC");
    fields[23] = fieldF03LCMEEM =
    new CharacterField(message, HEADERSIZE + 145, 1, "F03LCMEEM");
    fields[24] = fieldF03LCMEED =
    new CharacterField(message, HEADERSIZE + 146, 1, "F03LCMEED");
    fields[25] = fieldF03LCMEEY =
    new CharacterField(message, HEADERSIZE + 147, 1, "F03LCMEEY");
    fields[26] = fieldF03LCMEXM =
    new CharacterField(message, HEADERSIZE + 148, 1, "F03LCMEXM");
    fields[27] = fieldF03LCMEXD =
    new CharacterField(message, HEADERSIZE + 149, 1, "F03LCMEXD");
    fields[28] = fieldF03LCMEXY =
    new CharacterField(message, HEADERSIZE + 150, 1, "F03LCMEXY");
    fields[29] = fieldF03LCMIRT =
    new CharacterField(message, HEADERSIZE + 151, 1, "F03LCMIRT");
    fields[30] = fieldF03LCMC10 =
    new CharacterField(message, HEADERSIZE + 152, 1, "F03LCMC10");
    fields[31] = fieldF03LCMC11 =
    new CharacterField(message, HEADERSIZE + 153, 1, "F03LCMC11");
    fields[32] = fieldF03LCMC12 =
    new CharacterField(message, HEADERSIZE + 154, 1, "F03LCMC12");
    fields[33] = fieldE03LCMEVF =
    new CharacterField(message, HEADERSIZE + 155, 1, "E03LCMEVF");

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
  * Set field H03USERID using a String value.
  */
  public void setH03USERID(String newvalue)
  {
    fieldH03USERID.setString(newvalue);
  }

  /**
  * Get value of field H03USERID as a String.
  */
  public String getH03USERID()
  {
    return fieldH03USERID.getString();
  }

  /**
  * Set field H03PROGRM using a String value.
  */
  public void setH03PROGRM(String newvalue)
  {
    fieldH03PROGRM.setString(newvalue);
  }

  /**
  * Get value of field H03PROGRM as a String.
  */
  public String getH03PROGRM()
  {
    return fieldH03PROGRM.getString();
  }

  /**
  * Set field H03TIMSYS using a String value.
  */
  public void setH03TIMSYS(String newvalue)
  {
    fieldH03TIMSYS.setString(newvalue);
  }

  /**
  * Get value of field H03TIMSYS as a String.
  */
  public String getH03TIMSYS()
  {
    return fieldH03TIMSYS.getString();
  }

  /**
  * Set field H03SCRCOD using a String value.
  */
  public void setH03SCRCOD(String newvalue)
  {
    fieldH03SCRCOD.setString(newvalue);
  }

  /**
  * Get value of field H03SCRCOD as a String.
  */
  public String getH03SCRCOD()
  {
    return fieldH03SCRCOD.getString();
  }

  /**
  * Set field H03OPECOD using a String value.
  */
  public void setH03OPECOD(String newvalue)
  {
    fieldH03OPECOD.setString(newvalue);
  }

  /**
  * Get value of field H03OPECOD as a String.
  */
  public String getH03OPECOD()
  {
    return fieldH03OPECOD.getString();
  }

  /**
  * Set field H03FLGMAS using a String value.
  */
  public void setH03FLGMAS(String newvalue)
  {
    fieldH03FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H03FLGMAS as a String.
  */
  public String getH03FLGMAS()
  {
    return fieldH03FLGMAS.getString();
  }

  /**
  * Set field H03FLGWK1 using a String value.
  */
  public void setH03FLGWK1(String newvalue)
  {
    fieldH03FLGWK1.setString(newvalue);
  }

  /**
  * Get value of field H03FLGWK1 as a String.
  */
  public String getH03FLGWK1()
  {
    return fieldH03FLGWK1.getString();
  }

  /**
  * Set field H03FLGWK2 using a String value.
  */
  public void setH03FLGWK2(String newvalue)
  {
    fieldH03FLGWK2.setString(newvalue);
  }

  /**
  * Get value of field H03FLGWK2 as a String.
  */
  public String getH03FLGWK2()
  {
    return fieldH03FLGWK2.getString();
  }

  /**
  * Set field H03FLGWK3 using a String value.
  */
  public void setH03FLGWK3(String newvalue)
  {
    fieldH03FLGWK3.setString(newvalue);
  }

  /**
  * Get value of field H03FLGWK3 as a String.
  */
  public String getH03FLGWK3()
  {
    return fieldH03FLGWK3.getString();
  }

  /**
  * Set field E03LCMACC using a String value.
  */
  public void setE03LCMACC(String newvalue)
  {
    fieldE03LCMACC.setString(newvalue);
  }

  /**
  * Get value of field E03LCMACC as a String.
  */
  public String getE03LCMACC()
  {
    return fieldE03LCMACC.getString();
  }

  /**
  * Set numeric field E03LCMACC using a BigDecimal value.
  */
  public void setE03LCMACC(BigDecimal newvalue)
  {
    fieldE03LCMACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03LCMACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03LCMACC()
  {
    return fieldE03LCMACC.getBigDecimal();
  }

  /**
  * Set field E03LCMPRO using a String value.
  */
  public void setE03LCMPRO(String newvalue)
  {
    fieldE03LCMPRO.setString(newvalue);
  }

  /**
  * Get value of field E03LCMPRO as a String.
  */
  public String getE03LCMPRO()
  {
    return fieldE03LCMPRO.getString();
  }

  /**
  * Set field E03LCMEEM using a String value.
  */
  public void setE03LCMEEM(String newvalue)
  {
    fieldE03LCMEEM.setString(newvalue);
  }

  /**
  * Get value of field E03LCMEEM as a String.
  */
  public String getE03LCMEEM()
  {
    return fieldE03LCMEEM.getString();
  }

  /**
  * Set numeric field E03LCMEEM using a BigDecimal value.
  */
  public void setE03LCMEEM(BigDecimal newvalue)
  {
    fieldE03LCMEEM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03LCMEEM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03LCMEEM()
  {
    return fieldE03LCMEEM.getBigDecimal();
  }

  /**
  * Set field E03LCMEED using a String value.
  */
  public void setE03LCMEED(String newvalue)
  {
    fieldE03LCMEED.setString(newvalue);
  }

  /**
  * Get value of field E03LCMEED as a String.
  */
  public String getE03LCMEED()
  {
    return fieldE03LCMEED.getString();
  }

  /**
  * Set numeric field E03LCMEED using a BigDecimal value.
  */
  public void setE03LCMEED(BigDecimal newvalue)
  {
    fieldE03LCMEED.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03LCMEED as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03LCMEED()
  {
    return fieldE03LCMEED.getBigDecimal();
  }

  /**
  * Set field E03LCMEEY using a String value.
  */
  public void setE03LCMEEY(String newvalue)
  {
    fieldE03LCMEEY.setString(newvalue);
  }

  /**
  * Get value of field E03LCMEEY as a String.
  */
  public String getE03LCMEEY()
  {
    return fieldE03LCMEEY.getString();
  }

  /**
  * Set numeric field E03LCMEEY using a BigDecimal value.
  */
  public void setE03LCMEEY(BigDecimal newvalue)
  {
    fieldE03LCMEEY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03LCMEEY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03LCMEEY()
  {
    return fieldE03LCMEEY.getBigDecimal();
  }

  /**
  * Set field E03LCMEXM using a String value.
  */
  public void setE03LCMEXM(String newvalue)
  {
    fieldE03LCMEXM.setString(newvalue);
  }

  /**
  * Get value of field E03LCMEXM as a String.
  */
  public String getE03LCMEXM()
  {
    return fieldE03LCMEXM.getString();
  }

  /**
  * Set numeric field E03LCMEXM using a BigDecimal value.
  */
  public void setE03LCMEXM(BigDecimal newvalue)
  {
    fieldE03LCMEXM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03LCMEXM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03LCMEXM()
  {
    return fieldE03LCMEXM.getBigDecimal();
  }

  /**
  * Set field E03LCMEXD using a String value.
  */
  public void setE03LCMEXD(String newvalue)
  {
    fieldE03LCMEXD.setString(newvalue);
  }

  /**
  * Get value of field E03LCMEXD as a String.
  */
  public String getE03LCMEXD()
  {
    return fieldE03LCMEXD.getString();
  }

  /**
  * Set numeric field E03LCMEXD using a BigDecimal value.
  */
  public void setE03LCMEXD(BigDecimal newvalue)
  {
    fieldE03LCMEXD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03LCMEXD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03LCMEXD()
  {
    return fieldE03LCMEXD.getBigDecimal();
  }

  /**
  * Set field E03LCMEXY using a String value.
  */
  public void setE03LCMEXY(String newvalue)
  {
    fieldE03LCMEXY.setString(newvalue);
  }

  /**
  * Get value of field E03LCMEXY as a String.
  */
  public String getE03LCMEXY()
  {
    return fieldE03LCMEXY.getString();
  }

  /**
  * Set numeric field E03LCMEXY using a BigDecimal value.
  */
  public void setE03LCMEXY(BigDecimal newvalue)
  {
    fieldE03LCMEXY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03LCMEXY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03LCMEXY()
  {
    return fieldE03LCMEXY.getBigDecimal();
  }

  /**
  * Set field E03LCMIRT using a String value.
  */
  public void setE03LCMIRT(String newvalue)
  {
    fieldE03LCMIRT.setString(newvalue);
  }

  /**
  * Get value of field E03LCMIRT as a String.
  */
  public String getE03LCMIRT()
  {
    return fieldE03LCMIRT.getString();
  }

  /**
  * Set numeric field E03LCMIRT using a BigDecimal value.
  */
  public void setE03LCMIRT(BigDecimal newvalue)
  {
    fieldE03LCMIRT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03LCMIRT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03LCMIRT()
  {
    return fieldE03LCMIRT.getBigDecimal();
  }

  /**
  * Set field E03LCMC10 using a String value.
  */
  public void setE03LCMC10(String newvalue)
  {
    fieldE03LCMC10.setString(newvalue);
  }

  /**
  * Get value of field E03LCMC10 as a String.
  */
  public String getE03LCMC10()
  {
    return fieldE03LCMC10.getString();
  }

  /**
  * Set numeric field E03LCMC10 using a BigDecimal value.
  */
  public void setE03LCMC10(BigDecimal newvalue)
  {
    fieldE03LCMC10.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03LCMC10 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03LCMC10()
  {
    return fieldE03LCMC10.getBigDecimal();
  }

  /**
  * Set field E03LCMC11 using a String value.
  */
  public void setE03LCMC11(String newvalue)
  {
    fieldE03LCMC11.setString(newvalue);
  }

  /**
  * Get value of field E03LCMC11 as a String.
  */
  public String getE03LCMC11()
  {
    return fieldE03LCMC11.getString();
  }

  /**
  * Set numeric field E03LCMC11 using a BigDecimal value.
  */
  public void setE03LCMC11(BigDecimal newvalue)
  {
    fieldE03LCMC11.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03LCMC11 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03LCMC11()
  {
    return fieldE03LCMC11.getBigDecimal();
  }

  /**
  * Set field E03LCMC12 using a String value.
  */
  public void setE03LCMC12(String newvalue)
  {
    fieldE03LCMC12.setString(newvalue);
  }

  /**
  * Get value of field E03LCMC12 as a String.
  */
  public String getE03LCMC12()
  {
    return fieldE03LCMC12.getString();
  }

  /**
  * Set numeric field E03LCMC12 using a BigDecimal value.
  */
  public void setE03LCMC12(BigDecimal newvalue)
  {
    fieldE03LCMC12.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03LCMC12 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03LCMC12()
  {
    return fieldE03LCMC12.getBigDecimal();
  }

  /**
  * Set field E03PAGFLG using a String value.
  */
  public void setE03PAGFLG(String newvalue)
  {
    fieldE03PAGFLG.setString(newvalue);
  }

  /**
  * Get value of field E03PAGFLG as a String.
  */
  public String getE03PAGFLG()
  {
    return fieldE03PAGFLG.getString();
  }

  /**
  * Set field F03LCMACC using a String value.
  */
  public void setF03LCMACC(String newvalue)
  {
    fieldF03LCMACC.setString(newvalue);
  }

  /**
  * Get value of field F03LCMACC as a String.
  */
  public String getF03LCMACC()
  {
    return fieldF03LCMACC.getString();
  }

  /**
  * Set field F03LCMEEM using a String value.
  */
  public void setF03LCMEEM(String newvalue)
  {
    fieldF03LCMEEM.setString(newvalue);
  }

  /**
  * Get value of field F03LCMEEM as a String.
  */
  public String getF03LCMEEM()
  {
    return fieldF03LCMEEM.getString();
  }

  /**
  * Set field F03LCMEED using a String value.
  */
  public void setF03LCMEED(String newvalue)
  {
    fieldF03LCMEED.setString(newvalue);
  }

  /**
  * Get value of field F03LCMEED as a String.
  */
  public String getF03LCMEED()
  {
    return fieldF03LCMEED.getString();
  }

  /**
  * Set field F03LCMEEY using a String value.
  */
  public void setF03LCMEEY(String newvalue)
  {
    fieldF03LCMEEY.setString(newvalue);
  }

  /**
  * Get value of field F03LCMEEY as a String.
  */
  public String getF03LCMEEY()
  {
    return fieldF03LCMEEY.getString();
  }

  /**
  * Set field F03LCMEXM using a String value.
  */
  public void setF03LCMEXM(String newvalue)
  {
    fieldF03LCMEXM.setString(newvalue);
  }

  /**
  * Get value of field F03LCMEXM as a String.
  */
  public String getF03LCMEXM()
  {
    return fieldF03LCMEXM.getString();
  }

  /**
  * Set field F03LCMEXD using a String value.
  */
  public void setF03LCMEXD(String newvalue)
  {
    fieldF03LCMEXD.setString(newvalue);
  }

  /**
  * Get value of field F03LCMEXD as a String.
  */
  public String getF03LCMEXD()
  {
    return fieldF03LCMEXD.getString();
  }

  /**
  * Set field F03LCMEXY using a String value.
  */
  public void setF03LCMEXY(String newvalue)
  {
    fieldF03LCMEXY.setString(newvalue);
  }

  /**
  * Get value of field F03LCMEXY as a String.
  */
  public String getF03LCMEXY()
  {
    return fieldF03LCMEXY.getString();
  }

  /**
  * Set field F03LCMIRT using a String value.
  */
  public void setF03LCMIRT(String newvalue)
  {
    fieldF03LCMIRT.setString(newvalue);
  }

  /**
  * Get value of field F03LCMIRT as a String.
  */
  public String getF03LCMIRT()
  {
    return fieldF03LCMIRT.getString();
  }

  /**
  * Set field F03LCMC10 using a String value.
  */
  public void setF03LCMC10(String newvalue)
  {
    fieldF03LCMC10.setString(newvalue);
  }

  /**
  * Get value of field F03LCMC10 as a String.
  */
  public String getF03LCMC10()
  {
    return fieldF03LCMC10.getString();
  }

  /**
  * Set field F03LCMC11 using a String value.
  */
  public void setF03LCMC11(String newvalue)
  {
    fieldF03LCMC11.setString(newvalue);
  }

  /**
  * Get value of field F03LCMC11 as a String.
  */
  public String getF03LCMC11()
  {
    return fieldF03LCMC11.getString();
  }

  /**
  * Set field F03LCMC12 using a String value.
  */
  public void setF03LCMC12(String newvalue)
  {
    fieldF03LCMC12.setString(newvalue);
  }

  /**
  * Get value of field F03LCMC12 as a String.
  */
  public String getF03LCMC12()
  {
    return fieldF03LCMC12.getString();
  }

  /**
  * Set field E03LCMEVF using a String value.
  */
  public void setE03LCMEVF(String newvalue)
  {
    fieldE03LCMEVF.setString(newvalue);
  }

  /**
  * Get value of field E03LCMEVF as a String.
  */
  public String getE03LCMEVF()
  {
    return fieldE03LCMEVF.getString();
  }

}
