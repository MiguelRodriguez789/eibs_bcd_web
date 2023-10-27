package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ELC508003 physical file definition.
* 
* File level identifier is 1160930132950.
* Record format level identifier is 5031BE90D1295.
*/

public class ELC508003Message extends MessageRecord
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
                                     "E03LCMACD",
                                     "E03LCMPRO",
                                     "E03LCMATY",
                                     "E03LCMCUN",
                                     "E03LCMBNK",
                                     "E03LCMBRN",
                                     "E03LCMCCY",
                                     "E03LCMGLN",
                                     "E03DSCPRO",
                                     "E03CUSNA1",
                                     "E03CUSNA2",
                                     "E03CUSNA3",
                                     "E03CUSNA4",
                                     "E03CUSIDN",
                                     "E03CUSLGT",
                                     "E03DCCACC",
                                     "E03DCCPDM",
                                     "E03DCCPDD",
                                     "E03DCCPDY",
                                     "E03DCCSEQ",
                                     "E03DCCCDE",
                                     "E03DCCPVI",
                                     "E03DCCNAR",
                                     "E03DCCPFL",
                                     "E03DCCCAM",
                                     "E03DCCCPG",
                                     "E03DCCIAM",
                                     "E03DCCIPG",
                                     "E03DCCGAM",
                                     "E03DCCGPG",
                                     "E03DCCPGM",
                                     "E03DCCPGD",
                                     "E03DCCPGY",
                                     "E03DCCOBK",
                                     "E03DCCOBR",
                                     "E03DCCOCY",
                                     "E03DCCOGL",
                                     "E03DCCOAC",
                                     "E03DCCIVA",
                                     "E03DCCIVP",
                                     "E03DCCIVB",
                                     "E03DDCMTH",
                                     "E03DDCCOA",
                                     "E03DDCCHN",
                                     "E03DCCDVE"
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
                                   "E03LCMACD",
                                   "E03LCMPRO",
                                   "E03LCMATY",
                                   "E03LCMCUN",
                                   "E03LCMBNK",
                                   "E03LCMBRN",
                                   "E03LCMCCY",
                                   "E03LCMGLN",
                                   "E03DSCPRO",
                                   "E03CUSNA1",
                                   "E03CUSNA2",
                                   "E03CUSNA3",
                                   "E03CUSNA4",
                                   "E03CUSIDN",
                                   "E03CUSLGT",
                                   "E03DCCACC",
                                   "E03DCCPDM",
                                   "E03DCCPDD",
                                   "E03DCCPDY",
                                   "E03DCCSEQ",
                                   "E03DCCCDE",
                                   "E03DCCPVI",
                                   "E03DCCNAR",
                                   "E03DCCPFL",
                                   "E03DCCCAM",
                                   "E03DCCCPG",
                                   "E03DCCIAM",
                                   "E03DCCIPG",
                                   "E03DCCGAM",
                                   "E03DCCGPG",
                                   "E03DCCPGM",
                                   "E03DCCPGD",
                                   "E03DCCPGY",
                                   "E03DCCOBK",
                                   "E03DCCOBR",
                                   "E03DCCOCY",
                                   "E03DCCOGL",
                                   "E03DCCOAC",
                                   "E03DCCIVA",
                                   "E03DCCIVP",
                                   "E03DCCIVB",
                                   "E03DDCMTH",
                                   "E03DDCCOA",
                                   "E03DDCCHN",
                                   "E03DCCDVE"
                                 };
  final static String fid = "1160930132950";
  final static String rid = "5031BE90D1295";
  final static String fmtname = "ELC508003";
  final int FIELDCOUNT = 55;
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
  private CharacterField fieldE03LCMACD = null;
  private CharacterField fieldE03LCMPRO = null;
  private CharacterField fieldE03LCMATY = null;
  private DecimalField fieldE03LCMCUN = null;
  private CharacterField fieldE03LCMBNK = null;
  private DecimalField fieldE03LCMBRN = null;
  private CharacterField fieldE03LCMCCY = null;
  private DecimalField fieldE03LCMGLN = null;
  private CharacterField fieldE03DSCPRO = null;
  private CharacterField fieldE03CUSNA1 = null;
  private CharacterField fieldE03CUSNA2 = null;
  private CharacterField fieldE03CUSNA3 = null;
  private CharacterField fieldE03CUSNA4 = null;
  private CharacterField fieldE03CUSIDN = null;
  private CharacterField fieldE03CUSLGT = null;
  private DecimalField fieldE03DCCACC = null;
  private DecimalField fieldE03DCCPDM = null;
  private DecimalField fieldE03DCCPDD = null;
  private DecimalField fieldE03DCCPDY = null;
  private DecimalField fieldE03DCCSEQ = null;
  private CharacterField fieldE03DCCCDE = null;
  private CharacterField fieldE03DCCPVI = null;
  private CharacterField fieldE03DCCNAR = null;
  private CharacterField fieldE03DCCPFL = null;
  private DecimalField fieldE03DCCCAM = null;
  private DecimalField fieldE03DCCCPG = null;
  private DecimalField fieldE03DCCIAM = null;
  private DecimalField fieldE03DCCIPG = null;
  private DecimalField fieldE03DCCGAM = null;
  private DecimalField fieldE03DCCGPG = null;
  private DecimalField fieldE03DCCPGM = null;
  private DecimalField fieldE03DCCPGD = null;
  private DecimalField fieldE03DCCPGY = null;
  private CharacterField fieldE03DCCOBK = null;
  private DecimalField fieldE03DCCOBR = null;
  private CharacterField fieldE03DCCOCY = null;
  private DecimalField fieldE03DCCOGL = null;
  private DecimalField fieldE03DCCOAC = null;
  private CharacterField fieldE03DCCIVA = null;
  private DecimalField fieldE03DCCIVP = null;
  private DecimalField fieldE03DCCIVB = null;
  private CharacterField fieldE03DDCMTH = null;
  private DecimalField fieldE03DDCCOA = null;
  private CharacterField fieldE03DDCCHN = null;
  private DecimalField fieldE03DCCDVE = null;

  /**
  * Constructor for ELC508003Message.
  */
  public ELC508003Message()
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
    recordsize = 669;
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
    fields[10] = fieldE03LCMACD =
    new CharacterField(message, HEADERSIZE + 55, 2, "E03LCMACD");
    fields[11] = fieldE03LCMPRO =
    new CharacterField(message, HEADERSIZE + 57, 4, "E03LCMPRO");
    fields[12] = fieldE03LCMATY =
    new CharacterField(message, HEADERSIZE + 61, 4, "E03LCMATY");
    fields[13] = fieldE03LCMCUN =
    new DecimalField(message, HEADERSIZE + 65, 10, 0, "E03LCMCUN");
    fields[14] = fieldE03LCMBNK =
    new CharacterField(message, HEADERSIZE + 75, 2, "E03LCMBNK");
    fields[15] = fieldE03LCMBRN =
    new DecimalField(message, HEADERSIZE + 77, 5, 0, "E03LCMBRN");
    fields[16] = fieldE03LCMCCY =
    new CharacterField(message, HEADERSIZE + 82, 3, "E03LCMCCY");
    fields[17] = fieldE03LCMGLN =
    new DecimalField(message, HEADERSIZE + 85, 17, 0, "E03LCMGLN");
    fields[18] = fieldE03DSCPRO =
    new CharacterField(message, HEADERSIZE + 102, 45, "E03DSCPRO");
    fields[19] = fieldE03CUSNA1 =
    new CharacterField(message, HEADERSIZE + 147, 60, "E03CUSNA1");
    fields[20] = fieldE03CUSNA2 =
    new CharacterField(message, HEADERSIZE + 207, 45, "E03CUSNA2");
    fields[21] = fieldE03CUSNA3 =
    new CharacterField(message, HEADERSIZE + 252, 45, "E03CUSNA3");
    fields[22] = fieldE03CUSNA4 =
    new CharacterField(message, HEADERSIZE + 297, 45, "E03CUSNA4");
    fields[23] = fieldE03CUSIDN =
    new CharacterField(message, HEADERSIZE + 342, 25, "E03CUSIDN");
    fields[24] = fieldE03CUSLGT =
    new CharacterField(message, HEADERSIZE + 367, 1, "E03CUSLGT");
    fields[25] = fieldE03DCCACC =
    new DecimalField(message, HEADERSIZE + 368, 13, 0, "E03DCCACC");
    fields[26] = fieldE03DCCPDM =
    new DecimalField(message, HEADERSIZE + 381, 3, 0, "E03DCCPDM");
    fields[27] = fieldE03DCCPDD =
    new DecimalField(message, HEADERSIZE + 384, 3, 0, "E03DCCPDD");
    fields[28] = fieldE03DCCPDY =
    new DecimalField(message, HEADERSIZE + 387, 5, 0, "E03DCCPDY");
    fields[29] = fieldE03DCCSEQ =
    new DecimalField(message, HEADERSIZE + 392, 3, 0, "E03DCCSEQ");
    fields[30] = fieldE03DCCCDE =
    new CharacterField(message, HEADERSIZE + 395, 4, "E03DCCCDE");
    fields[31] = fieldE03DCCPVI =
    new CharacterField(message, HEADERSIZE + 399, 1, "E03DCCPVI");
    fields[32] = fieldE03DCCNAR =
    new CharacterField(message, HEADERSIZE + 400, 60, "E03DCCNAR");
    fields[33] = fieldE03DCCPFL =
    new CharacterField(message, HEADERSIZE + 460, 1, "E03DCCPFL");
    fields[34] = fieldE03DCCCAM =
    new DecimalField(message, HEADERSIZE + 461, 17, 2, "E03DCCCAM");
    fields[35] = fieldE03DCCCPG =
    new DecimalField(message, HEADERSIZE + 478, 17, 2, "E03DCCCPG");
    fields[36] = fieldE03DCCIAM =
    new DecimalField(message, HEADERSIZE + 495, 17, 2, "E03DCCIAM");
    fields[37] = fieldE03DCCIPG =
    new DecimalField(message, HEADERSIZE + 512, 17, 2, "E03DCCIPG");
    fields[38] = fieldE03DCCGAM =
    new DecimalField(message, HEADERSIZE + 529, 17, 2, "E03DCCGAM");
    fields[39] = fieldE03DCCGPG =
    new DecimalField(message, HEADERSIZE + 546, 17, 2, "E03DCCGPG");
    fields[40] = fieldE03DCCPGM =
    new DecimalField(message, HEADERSIZE + 563, 3, 0, "E03DCCPGM");
    fields[41] = fieldE03DCCPGD =
    new DecimalField(message, HEADERSIZE + 566, 3, 0, "E03DCCPGD");
    fields[42] = fieldE03DCCPGY =
    new DecimalField(message, HEADERSIZE + 569, 5, 0, "E03DCCPGY");
    fields[43] = fieldE03DCCOBK =
    new CharacterField(message, HEADERSIZE + 574, 2, "E03DCCOBK");
    fields[44] = fieldE03DCCOBR =
    new DecimalField(message, HEADERSIZE + 576, 5, 0, "E03DCCOBR");
    fields[45] = fieldE03DCCOCY =
    new CharacterField(message, HEADERSIZE + 581, 3, "E03DCCOCY");
    fields[46] = fieldE03DCCOGL =
    new DecimalField(message, HEADERSIZE + 584, 17, 0, "E03DCCOGL");
    fields[47] = fieldE03DCCOAC =
    new DecimalField(message, HEADERSIZE + 601, 13, 0, "E03DCCOAC");
    fields[48] = fieldE03DCCIVA =
    new CharacterField(message, HEADERSIZE + 614, 1, "E03DCCIVA");
    fields[49] = fieldE03DCCIVP =
    new DecimalField(message, HEADERSIZE + 615, 8, 3, "E03DCCIVP");
    fields[50] = fieldE03DCCIVB =
    new DecimalField(message, HEADERSIZE + 623, 17, 2, "E03DCCIVB");
    fields[51] = fieldE03DDCMTH =
    new CharacterField(message, HEADERSIZE + 640, 1, "E03DDCMTH");
    fields[52] = fieldE03DDCCOA =
    new DecimalField(message, HEADERSIZE + 641, 19, 4, "E03DDCCOA");
    fields[53] = fieldE03DDCCHN =
    new CharacterField(message, HEADERSIZE + 660, 4, "E03DDCCHN");
    fields[54] = fieldE03DCCDVE =
    new DecimalField(message, HEADERSIZE + 664, 5, 0, "E03DCCDVE");

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
  * Set field E03LCMACD using a String value.
  */
  public void setE03LCMACD(String newvalue)
  {
    fieldE03LCMACD.setString(newvalue);
  }

  /**
  * Get value of field E03LCMACD as a String.
  */
  public String getE03LCMACD()
  {
    return fieldE03LCMACD.getString();
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
  * Set field E03LCMATY using a String value.
  */
  public void setE03LCMATY(String newvalue)
  {
    fieldE03LCMATY.setString(newvalue);
  }

  /**
  * Get value of field E03LCMATY as a String.
  */
  public String getE03LCMATY()
  {
    return fieldE03LCMATY.getString();
  }

  /**
  * Set field E03LCMCUN using a String value.
  */
  public void setE03LCMCUN(String newvalue)
  {
    fieldE03LCMCUN.setString(newvalue);
  }

  /**
  * Get value of field E03LCMCUN as a String.
  */
  public String getE03LCMCUN()
  {
    return fieldE03LCMCUN.getString();
  }

  /**
  * Set numeric field E03LCMCUN using a BigDecimal value.
  */
  public void setE03LCMCUN(BigDecimal newvalue)
  {
    fieldE03LCMCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03LCMCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03LCMCUN()
  {
    return fieldE03LCMCUN.getBigDecimal();
  }

  /**
  * Set field E03LCMBNK using a String value.
  */
  public void setE03LCMBNK(String newvalue)
  {
    fieldE03LCMBNK.setString(newvalue);
  }

  /**
  * Get value of field E03LCMBNK as a String.
  */
  public String getE03LCMBNK()
  {
    return fieldE03LCMBNK.getString();
  }

  /**
  * Set field E03LCMBRN using a String value.
  */
  public void setE03LCMBRN(String newvalue)
  {
    fieldE03LCMBRN.setString(newvalue);
  }

  /**
  * Get value of field E03LCMBRN as a String.
  */
  public String getE03LCMBRN()
  {
    return fieldE03LCMBRN.getString();
  }

  /**
  * Set numeric field E03LCMBRN using a BigDecimal value.
  */
  public void setE03LCMBRN(BigDecimal newvalue)
  {
    fieldE03LCMBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03LCMBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03LCMBRN()
  {
    return fieldE03LCMBRN.getBigDecimal();
  }

  /**
  * Set field E03LCMCCY using a String value.
  */
  public void setE03LCMCCY(String newvalue)
  {
    fieldE03LCMCCY.setString(newvalue);
  }

  /**
  * Get value of field E03LCMCCY as a String.
  */
  public String getE03LCMCCY()
  {
    return fieldE03LCMCCY.getString();
  }

  /**
  * Set field E03LCMGLN using a String value.
  */
  public void setE03LCMGLN(String newvalue)
  {
    fieldE03LCMGLN.setString(newvalue);
  }

  /**
  * Get value of field E03LCMGLN as a String.
  */
  public String getE03LCMGLN()
  {
    return fieldE03LCMGLN.getString();
  }

  /**
  * Set numeric field E03LCMGLN using a BigDecimal value.
  */
  public void setE03LCMGLN(BigDecimal newvalue)
  {
    fieldE03LCMGLN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03LCMGLN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03LCMGLN()
  {
    return fieldE03LCMGLN.getBigDecimal();
  }

  /**
  * Set field E03DSCPRO using a String value.
  */
  public void setE03DSCPRO(String newvalue)
  {
    fieldE03DSCPRO.setString(newvalue);
  }

  /**
  * Get value of field E03DSCPRO as a String.
  */
  public String getE03DSCPRO()
  {
    return fieldE03DSCPRO.getString();
  }

  /**
  * Set field E03CUSNA1 using a String value.
  */
  public void setE03CUSNA1(String newvalue)
  {
    fieldE03CUSNA1.setString(newvalue);
  }

  /**
  * Get value of field E03CUSNA1 as a String.
  */
  public String getE03CUSNA1()
  {
    return fieldE03CUSNA1.getString();
  }

  /**
  * Set field E03CUSNA2 using a String value.
  */
  public void setE03CUSNA2(String newvalue)
  {
    fieldE03CUSNA2.setString(newvalue);
  }

  /**
  * Get value of field E03CUSNA2 as a String.
  */
  public String getE03CUSNA2()
  {
    return fieldE03CUSNA2.getString();
  }

  /**
  * Set field E03CUSNA3 using a String value.
  */
  public void setE03CUSNA3(String newvalue)
  {
    fieldE03CUSNA3.setString(newvalue);
  }

  /**
  * Get value of field E03CUSNA3 as a String.
  */
  public String getE03CUSNA3()
  {
    return fieldE03CUSNA3.getString();
  }

  /**
  * Set field E03CUSNA4 using a String value.
  */
  public void setE03CUSNA4(String newvalue)
  {
    fieldE03CUSNA4.setString(newvalue);
  }

  /**
  * Get value of field E03CUSNA4 as a String.
  */
  public String getE03CUSNA4()
  {
    return fieldE03CUSNA4.getString();
  }

  /**
  * Set field E03CUSIDN using a String value.
  */
  public void setE03CUSIDN(String newvalue)
  {
    fieldE03CUSIDN.setString(newvalue);
  }

  /**
  * Get value of field E03CUSIDN as a String.
  */
  public String getE03CUSIDN()
  {
    return fieldE03CUSIDN.getString();
  }

  /**
  * Set field E03CUSLGT using a String value.
  */
  public void setE03CUSLGT(String newvalue)
  {
    fieldE03CUSLGT.setString(newvalue);
  }

  /**
  * Get value of field E03CUSLGT as a String.
  */
  public String getE03CUSLGT()
  {
    return fieldE03CUSLGT.getString();
  }

  /**
  * Set field E03DCCACC using a String value.
  */
  public void setE03DCCACC(String newvalue)
  {
    fieldE03DCCACC.setString(newvalue);
  }

  /**
  * Get value of field E03DCCACC as a String.
  */
  public String getE03DCCACC()
  {
    return fieldE03DCCACC.getString();
  }

  /**
  * Set numeric field E03DCCACC using a BigDecimal value.
  */
  public void setE03DCCACC(BigDecimal newvalue)
  {
    fieldE03DCCACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03DCCACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03DCCACC()
  {
    return fieldE03DCCACC.getBigDecimal();
  }

  /**
  * Set field E03DCCPDM using a String value.
  */
  public void setE03DCCPDM(String newvalue)
  {
    fieldE03DCCPDM.setString(newvalue);
  }

  /**
  * Get value of field E03DCCPDM as a String.
  */
  public String getE03DCCPDM()
  {
    return fieldE03DCCPDM.getString();
  }

  /**
  * Set numeric field E03DCCPDM using a BigDecimal value.
  */
  public void setE03DCCPDM(BigDecimal newvalue)
  {
    fieldE03DCCPDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03DCCPDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03DCCPDM()
  {
    return fieldE03DCCPDM.getBigDecimal();
  }

  /**
  * Set field E03DCCPDD using a String value.
  */
  public void setE03DCCPDD(String newvalue)
  {
    fieldE03DCCPDD.setString(newvalue);
  }

  /**
  * Get value of field E03DCCPDD as a String.
  */
  public String getE03DCCPDD()
  {
    return fieldE03DCCPDD.getString();
  }

  /**
  * Set numeric field E03DCCPDD using a BigDecimal value.
  */
  public void setE03DCCPDD(BigDecimal newvalue)
  {
    fieldE03DCCPDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03DCCPDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03DCCPDD()
  {
    return fieldE03DCCPDD.getBigDecimal();
  }

  /**
  * Set field E03DCCPDY using a String value.
  */
  public void setE03DCCPDY(String newvalue)
  {
    fieldE03DCCPDY.setString(newvalue);
  }

  /**
  * Get value of field E03DCCPDY as a String.
  */
  public String getE03DCCPDY()
  {
    return fieldE03DCCPDY.getString();
  }

  /**
  * Set numeric field E03DCCPDY using a BigDecimal value.
  */
  public void setE03DCCPDY(BigDecimal newvalue)
  {
    fieldE03DCCPDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03DCCPDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03DCCPDY()
  {
    return fieldE03DCCPDY.getBigDecimal();
  }

  /**
  * Set field E03DCCSEQ using a String value.
  */
  public void setE03DCCSEQ(String newvalue)
  {
    fieldE03DCCSEQ.setString(newvalue);
  }

  /**
  * Get value of field E03DCCSEQ as a String.
  */
  public String getE03DCCSEQ()
  {
    return fieldE03DCCSEQ.getString();
  }

  /**
  * Set numeric field E03DCCSEQ using a BigDecimal value.
  */
  public void setE03DCCSEQ(BigDecimal newvalue)
  {
    fieldE03DCCSEQ.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03DCCSEQ as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03DCCSEQ()
  {
    return fieldE03DCCSEQ.getBigDecimal();
  }

  /**
  * Set field E03DCCCDE using a String value.
  */
  public void setE03DCCCDE(String newvalue)
  {
    fieldE03DCCCDE.setString(newvalue);
  }

  /**
  * Get value of field E03DCCCDE as a String.
  */
  public String getE03DCCCDE()
  {
    return fieldE03DCCCDE.getString();
  }

  /**
  * Set field E03DCCPVI using a String value.
  */
  public void setE03DCCPVI(String newvalue)
  {
    fieldE03DCCPVI.setString(newvalue);
  }

  /**
  * Get value of field E03DCCPVI as a String.
  */
  public String getE03DCCPVI()
  {
    return fieldE03DCCPVI.getString();
  }

  /**
  * Set field E03DCCNAR using a String value.
  */
  public void setE03DCCNAR(String newvalue)
  {
    fieldE03DCCNAR.setString(newvalue);
  }

  /**
  * Get value of field E03DCCNAR as a String.
  */
  public String getE03DCCNAR()
  {
    return fieldE03DCCNAR.getString();
  }

  /**
  * Set field E03DCCPFL using a String value.
  */
  public void setE03DCCPFL(String newvalue)
  {
    fieldE03DCCPFL.setString(newvalue);
  }

  /**
  * Get value of field E03DCCPFL as a String.
  */
  public String getE03DCCPFL()
  {
    return fieldE03DCCPFL.getString();
  }

  /**
  * Set field E03DCCCAM using a String value.
  */
  public void setE03DCCCAM(String newvalue)
  {
    fieldE03DCCCAM.setString(newvalue);
  }

  /**
  * Get value of field E03DCCCAM as a String.
  */
  public String getE03DCCCAM()
  {
    return fieldE03DCCCAM.getString();
  }

  /**
  * Set numeric field E03DCCCAM using a BigDecimal value.
  */
  public void setE03DCCCAM(BigDecimal newvalue)
  {
    fieldE03DCCCAM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03DCCCAM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03DCCCAM()
  {
    return fieldE03DCCCAM.getBigDecimal();
  }

  /**
  * Set field E03DCCCPG using a String value.
  */
  public void setE03DCCCPG(String newvalue)
  {
    fieldE03DCCCPG.setString(newvalue);
  }

  /**
  * Get value of field E03DCCCPG as a String.
  */
  public String getE03DCCCPG()
  {
    return fieldE03DCCCPG.getString();
  }

  /**
  * Set numeric field E03DCCCPG using a BigDecimal value.
  */
  public void setE03DCCCPG(BigDecimal newvalue)
  {
    fieldE03DCCCPG.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03DCCCPG as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03DCCCPG()
  {
    return fieldE03DCCCPG.getBigDecimal();
  }

  /**
  * Set field E03DCCIAM using a String value.
  */
  public void setE03DCCIAM(String newvalue)
  {
    fieldE03DCCIAM.setString(newvalue);
  }

  /**
  * Get value of field E03DCCIAM as a String.
  */
  public String getE03DCCIAM()
  {
    return fieldE03DCCIAM.getString();
  }

  /**
  * Set numeric field E03DCCIAM using a BigDecimal value.
  */
  public void setE03DCCIAM(BigDecimal newvalue)
  {
    fieldE03DCCIAM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03DCCIAM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03DCCIAM()
  {
    return fieldE03DCCIAM.getBigDecimal();
  }

  /**
  * Set field E03DCCIPG using a String value.
  */
  public void setE03DCCIPG(String newvalue)
  {
    fieldE03DCCIPG.setString(newvalue);
  }

  /**
  * Get value of field E03DCCIPG as a String.
  */
  public String getE03DCCIPG()
  {
    return fieldE03DCCIPG.getString();
  }

  /**
  * Set numeric field E03DCCIPG using a BigDecimal value.
  */
  public void setE03DCCIPG(BigDecimal newvalue)
  {
    fieldE03DCCIPG.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03DCCIPG as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03DCCIPG()
  {
    return fieldE03DCCIPG.getBigDecimal();
  }

  /**
  * Set field E03DCCGAM using a String value.
  */
  public void setE03DCCGAM(String newvalue)
  {
    fieldE03DCCGAM.setString(newvalue);
  }

  /**
  * Get value of field E03DCCGAM as a String.
  */
  public String getE03DCCGAM()
  {
    return fieldE03DCCGAM.getString();
  }

  /**
  * Set numeric field E03DCCGAM using a BigDecimal value.
  */
  public void setE03DCCGAM(BigDecimal newvalue)
  {
    fieldE03DCCGAM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03DCCGAM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03DCCGAM()
  {
    return fieldE03DCCGAM.getBigDecimal();
  }

  /**
  * Set field E03DCCGPG using a String value.
  */
  public void setE03DCCGPG(String newvalue)
  {
    fieldE03DCCGPG.setString(newvalue);
  }

  /**
  * Get value of field E03DCCGPG as a String.
  */
  public String getE03DCCGPG()
  {
    return fieldE03DCCGPG.getString();
  }

  /**
  * Set numeric field E03DCCGPG using a BigDecimal value.
  */
  public void setE03DCCGPG(BigDecimal newvalue)
  {
    fieldE03DCCGPG.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03DCCGPG as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03DCCGPG()
  {
    return fieldE03DCCGPG.getBigDecimal();
  }

  /**
  * Set field E03DCCPGM using a String value.
  */
  public void setE03DCCPGM(String newvalue)
  {
    fieldE03DCCPGM.setString(newvalue);
  }

  /**
  * Get value of field E03DCCPGM as a String.
  */
  public String getE03DCCPGM()
  {
    return fieldE03DCCPGM.getString();
  }

  /**
  * Set numeric field E03DCCPGM using a BigDecimal value.
  */
  public void setE03DCCPGM(BigDecimal newvalue)
  {
    fieldE03DCCPGM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03DCCPGM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03DCCPGM()
  {
    return fieldE03DCCPGM.getBigDecimal();
  }

  /**
  * Set field E03DCCPGD using a String value.
  */
  public void setE03DCCPGD(String newvalue)
  {
    fieldE03DCCPGD.setString(newvalue);
  }

  /**
  * Get value of field E03DCCPGD as a String.
  */
  public String getE03DCCPGD()
  {
    return fieldE03DCCPGD.getString();
  }

  /**
  * Set numeric field E03DCCPGD using a BigDecimal value.
  */
  public void setE03DCCPGD(BigDecimal newvalue)
  {
    fieldE03DCCPGD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03DCCPGD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03DCCPGD()
  {
    return fieldE03DCCPGD.getBigDecimal();
  }

  /**
  * Set field E03DCCPGY using a String value.
  */
  public void setE03DCCPGY(String newvalue)
  {
    fieldE03DCCPGY.setString(newvalue);
  }

  /**
  * Get value of field E03DCCPGY as a String.
  */
  public String getE03DCCPGY()
  {
    return fieldE03DCCPGY.getString();
  }

  /**
  * Set numeric field E03DCCPGY using a BigDecimal value.
  */
  public void setE03DCCPGY(BigDecimal newvalue)
  {
    fieldE03DCCPGY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03DCCPGY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03DCCPGY()
  {
    return fieldE03DCCPGY.getBigDecimal();
  }

  /**
  * Set field E03DCCOBK using a String value.
  */
  public void setE03DCCOBK(String newvalue)
  {
    fieldE03DCCOBK.setString(newvalue);
  }

  /**
  * Get value of field E03DCCOBK as a String.
  */
  public String getE03DCCOBK()
  {
    return fieldE03DCCOBK.getString();
  }

  /**
  * Set field E03DCCOBR using a String value.
  */
  public void setE03DCCOBR(String newvalue)
  {
    fieldE03DCCOBR.setString(newvalue);
  }

  /**
  * Get value of field E03DCCOBR as a String.
  */
  public String getE03DCCOBR()
  {
    return fieldE03DCCOBR.getString();
  }

  /**
  * Set numeric field E03DCCOBR using a BigDecimal value.
  */
  public void setE03DCCOBR(BigDecimal newvalue)
  {
    fieldE03DCCOBR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03DCCOBR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03DCCOBR()
  {
    return fieldE03DCCOBR.getBigDecimal();
  }

  /**
  * Set field E03DCCOCY using a String value.
  */
  public void setE03DCCOCY(String newvalue)
  {
    fieldE03DCCOCY.setString(newvalue);
  }

  /**
  * Get value of field E03DCCOCY as a String.
  */
  public String getE03DCCOCY()
  {
    return fieldE03DCCOCY.getString();
  }

  /**
  * Set field E03DCCOGL using a String value.
  */
  public void setE03DCCOGL(String newvalue)
  {
    fieldE03DCCOGL.setString(newvalue);
  }

  /**
  * Get value of field E03DCCOGL as a String.
  */
  public String getE03DCCOGL()
  {
    return fieldE03DCCOGL.getString();
  }

  /**
  * Set numeric field E03DCCOGL using a BigDecimal value.
  */
  public void setE03DCCOGL(BigDecimal newvalue)
  {
    fieldE03DCCOGL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03DCCOGL as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03DCCOGL()
  {
    return fieldE03DCCOGL.getBigDecimal();
  }

  /**
  * Set field E03DCCOAC using a String value.
  */
  public void setE03DCCOAC(String newvalue)
  {
    fieldE03DCCOAC.setString(newvalue);
  }

  /**
  * Get value of field E03DCCOAC as a String.
  */
  public String getE03DCCOAC()
  {
    return fieldE03DCCOAC.getString();
  }

  /**
  * Set numeric field E03DCCOAC using a BigDecimal value.
  */
  public void setE03DCCOAC(BigDecimal newvalue)
  {
    fieldE03DCCOAC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03DCCOAC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03DCCOAC()
  {
    return fieldE03DCCOAC.getBigDecimal();
  }

  /**
  * Set field E03DCCIVA using a String value.
  */
  public void setE03DCCIVA(String newvalue)
  {
    fieldE03DCCIVA.setString(newvalue);
  }

  /**
  * Get value of field E03DCCIVA as a String.
  */
  public String getE03DCCIVA()
  {
    return fieldE03DCCIVA.getString();
  }

  /**
  * Set field E03DCCIVP using a String value.
  */
  public void setE03DCCIVP(String newvalue)
  {
    fieldE03DCCIVP.setString(newvalue);
  }

  /**
  * Get value of field E03DCCIVP as a String.
  */
  public String getE03DCCIVP()
  {
    return fieldE03DCCIVP.getString();
  }

  /**
  * Set numeric field E03DCCIVP using a BigDecimal value.
  */
  public void setE03DCCIVP(BigDecimal newvalue)
  {
    fieldE03DCCIVP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03DCCIVP as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03DCCIVP()
  {
    return fieldE03DCCIVP.getBigDecimal();
  }

  /**
  * Set field E03DCCIVB using a String value.
  */
  public void setE03DCCIVB(String newvalue)
  {
    fieldE03DCCIVB.setString(newvalue);
  }

  /**
  * Get value of field E03DCCIVB as a String.
  */
  public String getE03DCCIVB()
  {
    return fieldE03DCCIVB.getString();
  }

  /**
  * Set numeric field E03DCCIVB using a BigDecimal value.
  */
  public void setE03DCCIVB(BigDecimal newvalue)
  {
    fieldE03DCCIVB.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03DCCIVB as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03DCCIVB()
  {
    return fieldE03DCCIVB.getBigDecimal();
  }

  /**
  * Set field E03DDCMTH using a String value.
  */
  public void setE03DDCMTH(String newvalue)
  {
    fieldE03DDCMTH.setString(newvalue);
  }

  /**
  * Get value of field E03DDCMTH as a String.
  */
  public String getE03DDCMTH()
  {
    return fieldE03DDCMTH.getString();
  }

  /**
  * Set field E03DDCCOA using a String value.
  */
  public void setE03DDCCOA(String newvalue)
  {
    fieldE03DDCCOA.setString(newvalue);
  }

  /**
  * Get value of field E03DDCCOA as a String.
  */
  public String getE03DDCCOA()
  {
    return fieldE03DDCCOA.getString();
  }

  /**
  * Set numeric field E03DDCCOA using a BigDecimal value.
  */
  public void setE03DDCCOA(BigDecimal newvalue)
  {
    fieldE03DDCCOA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03DDCCOA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03DDCCOA()
  {
    return fieldE03DDCCOA.getBigDecimal();
  }

  /**
  * Set field E03DDCCHN using a String value.
  */
  public void setE03DDCCHN(String newvalue)
  {
    fieldE03DDCCHN.setString(newvalue);
  }

  /**
  * Get value of field E03DDCCHN as a String.
  */
  public String getE03DDCCHN()
  {
    return fieldE03DDCCHN.getString();
  }

  /**
  * Set field E03DCCDVE using a String value.
  */
  public void setE03DCCDVE(String newvalue)
  {
    fieldE03DCCDVE.setString(newvalue);
  }

  /**
  * Get value of field E03DCCDVE as a String.
  */
  public String getE03DCCDVE()
  {
    return fieldE03DCCDVE.getString();
  }

  /**
  * Set numeric field E03DCCDVE using a BigDecimal value.
  */
  public void setE03DCCDVE(BigDecimal newvalue)
  {
    fieldE03DCCDVE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03DCCDVE as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03DCCDVE()
  {
    return fieldE03DCCDVE.getBigDecimal();
  }

}
