package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ESG010503 physical file definition.
* 
* File level identifier is 1151125123750.
* Record format level identifier is 3E401FCF994D5.
*/

public class ESG010503Message extends MessageRecord
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
                                     "E03SREFOL",
                                     "E03SRENM1",
                                     "E03SRECIA",
                                     "E03SRENA1",
                                     "E03SREIDN",
                                     "E03SREHPN",
                                     "E03SREPHN",
                                     "E03SREPH1",
                                     "E03SREIAD",
                                     "E03SREPLZ",
                                     "E03SREPAC",
                                     "E03SRECO1",
                                     "E03SREDS1",
                                     "E03SRESO1",
                                     "E03SRECO2",
                                     "E03SREDS2",
                                     "E03SRESO2",
                                     "E03SRECO3",
                                     "E03SREDS3",
                                     "E03SRESO3",
                                     "E03SRECO4",
                                     "E03SREDS4",
                                     "E03SRESO4",
                                     "E03SRECO5",
                                     "E03SREDS5",
                                     "E03SRESO5",
                                     "E03SRECO6",
                                     "E03SREDS6",
                                     "E03SRESO6",
                                     "E03SRECO7",
                                     "E03SREDS7",
                                     "E03SRESO7",
                                     "E03SRECO8",
                                     "E03SREDS8",
                                     "E03SRESO8",
                                     "E03SRECO9",
                                     "E03SREDS9",
                                     "E03SRESO9",
                                     "E03SRECO0",
                                     "E03SREDS0",
                                     "E03SRESO0"
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
                                   "E03SREFOL",
                                   "E03SRENM1",
                                   "E03SRECIA",
                                   "E03SRENA1",
                                   "E03SREIDN",
                                   "E03SREHPN",
                                   "E03SREPHN",
                                   "E03SREPH1",
                                   "E03SREIAD",
                                   "E03SREPLZ",
                                   "E03SREPAC",
                                   "E03SRECO1",
                                   "E03SREDS1",
                                   "E03SRESO1",
                                   "E03SRECO2",
                                   "E03SREDS2",
                                   "E03SRESO2",
                                   "E03SRECO3",
                                   "E03SREDS3",
                                   "E03SRESO3",
                                   "E03SRECO4",
                                   "E03SREDS4",
                                   "E03SRESO4",
                                   "E03SRECO5",
                                   "E03SREDS5",
                                   "E03SRESO5",
                                   "E03SRECO6",
                                   "E03SREDS6",
                                   "E03SRESO6",
                                   "E03SRECO7",
                                   "E03SREDS7",
                                   "E03SRESO7",
                                   "E03SRECO8",
                                   "E03SREDS8",
                                   "E03SRESO8",
                                   "E03SRECO9",
                                   "E03SREDS9",
                                   "E03SRESO9",
                                   "E03SRECO0",
                                   "E03SREDS0",
                                   "E03SRESO0"
                                 };
  final static String fid = "1151125123750";
  final static String rid = "3E401FCF994D5";
  final static String fmtname = "ESG010503";
  final int FIELDCOUNT = 50;
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
  private DecimalField fieldE03SREFOL = null;
  private CharacterField fieldE03SRENM1 = null;
  private CharacterField fieldE03SRECIA = null;
  private CharacterField fieldE03SRENA1 = null;
  private CharacterField fieldE03SREIDN = null;
  private DecimalField fieldE03SREHPN = null;
  private DecimalField fieldE03SREPHN = null;
  private DecimalField fieldE03SREPH1 = null;
  private CharacterField fieldE03SREIAD = null;
  private CharacterField fieldE03SREPLZ = null;
  private DecimalField fieldE03SREPAC = null;
  private CharacterField fieldE03SRECO1 = null;
  private CharacterField fieldE03SREDS1 = null;
  private DecimalField fieldE03SRESO1 = null;
  private CharacterField fieldE03SRECO2 = null;
  private CharacterField fieldE03SREDS2 = null;
  private DecimalField fieldE03SRESO2 = null;
  private CharacterField fieldE03SRECO3 = null;
  private CharacterField fieldE03SREDS3 = null;
  private DecimalField fieldE03SRESO3 = null;
  private CharacterField fieldE03SRECO4 = null;
  private CharacterField fieldE03SREDS4 = null;
  private DecimalField fieldE03SRESO4 = null;
  private CharacterField fieldE03SRECO5 = null;
  private CharacterField fieldE03SREDS5 = null;
  private DecimalField fieldE03SRESO5 = null;
  private CharacterField fieldE03SRECO6 = null;
  private CharacterField fieldE03SREDS6 = null;
  private DecimalField fieldE03SRESO6 = null;
  private CharacterField fieldE03SRECO7 = null;
  private CharacterField fieldE03SREDS7 = null;
  private DecimalField fieldE03SRESO7 = null;
  private CharacterField fieldE03SRECO8 = null;
  private CharacterField fieldE03SREDS8 = null;
  private DecimalField fieldE03SRESO8 = null;
  private CharacterField fieldE03SRECO9 = null;
  private CharacterField fieldE03SREDS9 = null;
  private DecimalField fieldE03SRESO9 = null;
  private CharacterField fieldE03SRECO0 = null;
  private CharacterField fieldE03SREDS0 = null;
  private DecimalField fieldE03SRESO0 = null;

  /**
  * Constructor for ESG010503Message.
  */
  public ESG010503Message()
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
    recordsize = 955;
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
    fields[9] = fieldE03SREFOL =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E03SREFOL");
    fields[10] = fieldE03SRENM1 =
    new CharacterField(message, HEADERSIZE + 55, 45, "E03SRENM1");
    fields[11] = fieldE03SRECIA =
    new CharacterField(message, HEADERSIZE + 100, 4, "E03SRECIA");
    fields[12] = fieldE03SRENA1 =
    new CharacterField(message, HEADERSIZE + 104, 60, "E03SRENA1");
    fields[13] = fieldE03SREIDN =
    new CharacterField(message, HEADERSIZE + 164, 25, "E03SREIDN");
    fields[14] = fieldE03SREHPN =
    new DecimalField(message, HEADERSIZE + 189, 16, 0, "E03SREHPN");
    fields[15] = fieldE03SREPHN =
    new DecimalField(message, HEADERSIZE + 205, 16, 0, "E03SREPHN");
    fields[16] = fieldE03SREPH1 =
    new DecimalField(message, HEADERSIZE + 221, 16, 0, "E03SREPH1");
    fields[17] = fieldE03SREIAD =
    new CharacterField(message, HEADERSIZE + 237, 25, "E03SREIAD");
    fields[18] = fieldE03SREPLZ =
    new CharacterField(message, HEADERSIZE + 262, 20, "E03SREPLZ");
    fields[19] = fieldE03SREPAC =
    new DecimalField(message, HEADERSIZE + 282, 13, 0, "E03SREPAC");
    fields[20] = fieldE03SRECO1 =
    new CharacterField(message, HEADERSIZE + 295, 4, "E03SRECO1");
    fields[21] = fieldE03SREDS1 =
    new CharacterField(message, HEADERSIZE + 299, 45, "E03SREDS1");
    fields[22] = fieldE03SRESO1 =
    new DecimalField(message, HEADERSIZE + 344, 17, 2, "E03SRESO1");
    fields[23] = fieldE03SRECO2 =
    new CharacterField(message, HEADERSIZE + 361, 4, "E03SRECO2");
    fields[24] = fieldE03SREDS2 =
    new CharacterField(message, HEADERSIZE + 365, 45, "E03SREDS2");
    fields[25] = fieldE03SRESO2 =
    new DecimalField(message, HEADERSIZE + 410, 17, 2, "E03SRESO2");
    fields[26] = fieldE03SRECO3 =
    new CharacterField(message, HEADERSIZE + 427, 4, "E03SRECO3");
    fields[27] = fieldE03SREDS3 =
    new CharacterField(message, HEADERSIZE + 431, 45, "E03SREDS3");
    fields[28] = fieldE03SRESO3 =
    new DecimalField(message, HEADERSIZE + 476, 17, 2, "E03SRESO3");
    fields[29] = fieldE03SRECO4 =
    new CharacterField(message, HEADERSIZE + 493, 4, "E03SRECO4");
    fields[30] = fieldE03SREDS4 =
    new CharacterField(message, HEADERSIZE + 497, 45, "E03SREDS4");
    fields[31] = fieldE03SRESO4 =
    new DecimalField(message, HEADERSIZE + 542, 17, 2, "E03SRESO4");
    fields[32] = fieldE03SRECO5 =
    new CharacterField(message, HEADERSIZE + 559, 4, "E03SRECO5");
    fields[33] = fieldE03SREDS5 =
    new CharacterField(message, HEADERSIZE + 563, 45, "E03SREDS5");
    fields[34] = fieldE03SRESO5 =
    new DecimalField(message, HEADERSIZE + 608, 17, 2, "E03SRESO5");
    fields[35] = fieldE03SRECO6 =
    new CharacterField(message, HEADERSIZE + 625, 4, "E03SRECO6");
    fields[36] = fieldE03SREDS6 =
    new CharacterField(message, HEADERSIZE + 629, 45, "E03SREDS6");
    fields[37] = fieldE03SRESO6 =
    new DecimalField(message, HEADERSIZE + 674, 17, 2, "E03SRESO6");
    fields[38] = fieldE03SRECO7 =
    new CharacterField(message, HEADERSIZE + 691, 4, "E03SRECO7");
    fields[39] = fieldE03SREDS7 =
    new CharacterField(message, HEADERSIZE + 695, 45, "E03SREDS7");
    fields[40] = fieldE03SRESO7 =
    new DecimalField(message, HEADERSIZE + 740, 17, 2, "E03SRESO7");
    fields[41] = fieldE03SRECO8 =
    new CharacterField(message, HEADERSIZE + 757, 4, "E03SRECO8");
    fields[42] = fieldE03SREDS8 =
    new CharacterField(message, HEADERSIZE + 761, 45, "E03SREDS8");
    fields[43] = fieldE03SRESO8 =
    new DecimalField(message, HEADERSIZE + 806, 17, 2, "E03SRESO8");
    fields[44] = fieldE03SRECO9 =
    new CharacterField(message, HEADERSIZE + 823, 4, "E03SRECO9");
    fields[45] = fieldE03SREDS9 =
    new CharacterField(message, HEADERSIZE + 827, 45, "E03SREDS9");
    fields[46] = fieldE03SRESO9 =
    new DecimalField(message, HEADERSIZE + 872, 17, 2, "E03SRESO9");
    fields[47] = fieldE03SRECO0 =
    new CharacterField(message, HEADERSIZE + 889, 4, "E03SRECO0");
    fields[48] = fieldE03SREDS0 =
    new CharacterField(message, HEADERSIZE + 893, 45, "E03SREDS0");
    fields[49] = fieldE03SRESO0 =
    new DecimalField(message, HEADERSIZE + 938, 17, 2, "E03SRESO0");

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
  * Set field E03SREFOL using a String value.
  */
  public void setE03SREFOL(String newvalue)
  {
    fieldE03SREFOL.setString(newvalue);
  }

  /**
  * Get value of field E03SREFOL as a String.
  */
  public String getE03SREFOL()
  {
    return fieldE03SREFOL.getString();
  }

  /**
  * Set numeric field E03SREFOL using a BigDecimal value.
  */
  public void setE03SREFOL(BigDecimal newvalue)
  {
    fieldE03SREFOL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03SREFOL as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03SREFOL()
  {
    return fieldE03SREFOL.getBigDecimal();
  }

  /**
  * Set field E03SRENM1 using a String value.
  */
  public void setE03SRENM1(String newvalue)
  {
    fieldE03SRENM1.setString(newvalue);
  }

  /**
  * Get value of field E03SRENM1 as a String.
  */
  public String getE03SRENM1()
  {
    return fieldE03SRENM1.getString();
  }

  /**
  * Set field E03SRECIA using a String value.
  */
  public void setE03SRECIA(String newvalue)
  {
    fieldE03SRECIA.setString(newvalue);
  }

  /**
  * Get value of field E03SRECIA as a String.
  */
  public String getE03SRECIA()
  {
    return fieldE03SRECIA.getString();
  }

  /**
  * Set field E03SRENA1 using a String value.
  */
  public void setE03SRENA1(String newvalue)
  {
    fieldE03SRENA1.setString(newvalue);
  }

  /**
  * Get value of field E03SRENA1 as a String.
  */
  public String getE03SRENA1()
  {
    return fieldE03SRENA1.getString();
  }

  /**
  * Set field E03SREIDN using a String value.
  */
  public void setE03SREIDN(String newvalue)
  {
    fieldE03SREIDN.setString(newvalue);
  }

  /**
  * Get value of field E03SREIDN as a String.
  */
  public String getE03SREIDN()
  {
    return fieldE03SREIDN.getString();
  }

  /**
  * Set field E03SREHPN using a String value.
  */
  public void setE03SREHPN(String newvalue)
  {
    fieldE03SREHPN.setString(newvalue);
  }

  /**
  * Get value of field E03SREHPN as a String.
  */
  public String getE03SREHPN()
  {
    return fieldE03SREHPN.getString();
  }

  /**
  * Set numeric field E03SREHPN using a BigDecimal value.
  */
  public void setE03SREHPN(BigDecimal newvalue)
  {
    fieldE03SREHPN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03SREHPN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03SREHPN()
  {
    return fieldE03SREHPN.getBigDecimal();
  }

  /**
  * Set field E03SREPHN using a String value.
  */
  public void setE03SREPHN(String newvalue)
  {
    fieldE03SREPHN.setString(newvalue);
  }

  /**
  * Get value of field E03SREPHN as a String.
  */
  public String getE03SREPHN()
  {
    return fieldE03SREPHN.getString();
  }

  /**
  * Set numeric field E03SREPHN using a BigDecimal value.
  */
  public void setE03SREPHN(BigDecimal newvalue)
  {
    fieldE03SREPHN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03SREPHN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03SREPHN()
  {
    return fieldE03SREPHN.getBigDecimal();
  }

  /**
  * Set field E03SREPH1 using a String value.
  */
  public void setE03SREPH1(String newvalue)
  {
    fieldE03SREPH1.setString(newvalue);
  }

  /**
  * Get value of field E03SREPH1 as a String.
  */
  public String getE03SREPH1()
  {
    return fieldE03SREPH1.getString();
  }

  /**
  * Set numeric field E03SREPH1 using a BigDecimal value.
  */
  public void setE03SREPH1(BigDecimal newvalue)
  {
    fieldE03SREPH1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03SREPH1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03SREPH1()
  {
    return fieldE03SREPH1.getBigDecimal();
  }

  /**
  * Set field E03SREIAD using a String value.
  */
  public void setE03SREIAD(String newvalue)
  {
    fieldE03SREIAD.setString(newvalue);
  }

  /**
  * Get value of field E03SREIAD as a String.
  */
  public String getE03SREIAD()
  {
    return fieldE03SREIAD.getString();
  }

  /**
  * Set field E03SREPLZ using a String value.
  */
  public void setE03SREPLZ(String newvalue)
  {
    fieldE03SREPLZ.setString(newvalue);
  }

  /**
  * Get value of field E03SREPLZ as a String.
  */
  public String getE03SREPLZ()
  {
    return fieldE03SREPLZ.getString();
  }

  /**
  * Set field E03SREPAC using a String value.
  */
  public void setE03SREPAC(String newvalue)
  {
    fieldE03SREPAC.setString(newvalue);
  }

  /**
  * Get value of field E03SREPAC as a String.
  */
  public String getE03SREPAC()
  {
    return fieldE03SREPAC.getString();
  }

  /**
  * Set numeric field E03SREPAC using a BigDecimal value.
  */
  public void setE03SREPAC(BigDecimal newvalue)
  {
    fieldE03SREPAC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03SREPAC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03SREPAC()
  {
    return fieldE03SREPAC.getBigDecimal();
  }

  /**
  * Set field E03SRECO1 using a String value.
  */
  public void setE03SRECO1(String newvalue)
  {
    fieldE03SRECO1.setString(newvalue);
  }

  /**
  * Get value of field E03SRECO1 as a String.
  */
  public String getE03SRECO1()
  {
    return fieldE03SRECO1.getString();
  }

  /**
  * Set field E03SREDS1 using a String value.
  */
  public void setE03SREDS1(String newvalue)
  {
    fieldE03SREDS1.setString(newvalue);
  }

  /**
  * Get value of field E03SREDS1 as a String.
  */
  public String getE03SREDS1()
  {
    return fieldE03SREDS1.getString();
  }

  /**
  * Set field E03SRESO1 using a String value.
  */
  public void setE03SRESO1(String newvalue)
  {
    fieldE03SRESO1.setString(newvalue);
  }

  /**
  * Get value of field E03SRESO1 as a String.
  */
  public String getE03SRESO1()
  {
    return fieldE03SRESO1.getString();
  }

  /**
  * Set numeric field E03SRESO1 using a BigDecimal value.
  */
  public void setE03SRESO1(BigDecimal newvalue)
  {
    fieldE03SRESO1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03SRESO1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03SRESO1()
  {
    return fieldE03SRESO1.getBigDecimal();
  }

  /**
  * Set field E03SRECO2 using a String value.
  */
  public void setE03SRECO2(String newvalue)
  {
    fieldE03SRECO2.setString(newvalue);
  }

  /**
  * Get value of field E03SRECO2 as a String.
  */
  public String getE03SRECO2()
  {
    return fieldE03SRECO2.getString();
  }

  /**
  * Set field E03SREDS2 using a String value.
  */
  public void setE03SREDS2(String newvalue)
  {
    fieldE03SREDS2.setString(newvalue);
  }

  /**
  * Get value of field E03SREDS2 as a String.
  */
  public String getE03SREDS2()
  {
    return fieldE03SREDS2.getString();
  }

  /**
  * Set field E03SRESO2 using a String value.
  */
  public void setE03SRESO2(String newvalue)
  {
    fieldE03SRESO2.setString(newvalue);
  }

  /**
  * Get value of field E03SRESO2 as a String.
  */
  public String getE03SRESO2()
  {
    return fieldE03SRESO2.getString();
  }

  /**
  * Set numeric field E03SRESO2 using a BigDecimal value.
  */
  public void setE03SRESO2(BigDecimal newvalue)
  {
    fieldE03SRESO2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03SRESO2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03SRESO2()
  {
    return fieldE03SRESO2.getBigDecimal();
  }

  /**
  * Set field E03SRECO3 using a String value.
  */
  public void setE03SRECO3(String newvalue)
  {
    fieldE03SRECO3.setString(newvalue);
  }

  /**
  * Get value of field E03SRECO3 as a String.
  */
  public String getE03SRECO3()
  {
    return fieldE03SRECO3.getString();
  }

  /**
  * Set field E03SREDS3 using a String value.
  */
  public void setE03SREDS3(String newvalue)
  {
    fieldE03SREDS3.setString(newvalue);
  }

  /**
  * Get value of field E03SREDS3 as a String.
  */
  public String getE03SREDS3()
  {
    return fieldE03SREDS3.getString();
  }

  /**
  * Set field E03SRESO3 using a String value.
  */
  public void setE03SRESO3(String newvalue)
  {
    fieldE03SRESO3.setString(newvalue);
  }

  /**
  * Get value of field E03SRESO3 as a String.
  */
  public String getE03SRESO3()
  {
    return fieldE03SRESO3.getString();
  }

  /**
  * Set numeric field E03SRESO3 using a BigDecimal value.
  */
  public void setE03SRESO3(BigDecimal newvalue)
  {
    fieldE03SRESO3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03SRESO3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03SRESO3()
  {
    return fieldE03SRESO3.getBigDecimal();
  }

  /**
  * Set field E03SRECO4 using a String value.
  */
  public void setE03SRECO4(String newvalue)
  {
    fieldE03SRECO4.setString(newvalue);
  }

  /**
  * Get value of field E03SRECO4 as a String.
  */
  public String getE03SRECO4()
  {
    return fieldE03SRECO4.getString();
  }

  /**
  * Set field E03SREDS4 using a String value.
  */
  public void setE03SREDS4(String newvalue)
  {
    fieldE03SREDS4.setString(newvalue);
  }

  /**
  * Get value of field E03SREDS4 as a String.
  */
  public String getE03SREDS4()
  {
    return fieldE03SREDS4.getString();
  }

  /**
  * Set field E03SRESO4 using a String value.
  */
  public void setE03SRESO4(String newvalue)
  {
    fieldE03SRESO4.setString(newvalue);
  }

  /**
  * Get value of field E03SRESO4 as a String.
  */
  public String getE03SRESO4()
  {
    return fieldE03SRESO4.getString();
  }

  /**
  * Set numeric field E03SRESO4 using a BigDecimal value.
  */
  public void setE03SRESO4(BigDecimal newvalue)
  {
    fieldE03SRESO4.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03SRESO4 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03SRESO4()
  {
    return fieldE03SRESO4.getBigDecimal();
  }

  /**
  * Set field E03SRECO5 using a String value.
  */
  public void setE03SRECO5(String newvalue)
  {
    fieldE03SRECO5.setString(newvalue);
  }

  /**
  * Get value of field E03SRECO5 as a String.
  */
  public String getE03SRECO5()
  {
    return fieldE03SRECO5.getString();
  }

  /**
  * Set field E03SREDS5 using a String value.
  */
  public void setE03SREDS5(String newvalue)
  {
    fieldE03SREDS5.setString(newvalue);
  }

  /**
  * Get value of field E03SREDS5 as a String.
  */
  public String getE03SREDS5()
  {
    return fieldE03SREDS5.getString();
  }

  /**
  * Set field E03SRESO5 using a String value.
  */
  public void setE03SRESO5(String newvalue)
  {
    fieldE03SRESO5.setString(newvalue);
  }

  /**
  * Get value of field E03SRESO5 as a String.
  */
  public String getE03SRESO5()
  {
    return fieldE03SRESO5.getString();
  }

  /**
  * Set numeric field E03SRESO5 using a BigDecimal value.
  */
  public void setE03SRESO5(BigDecimal newvalue)
  {
    fieldE03SRESO5.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03SRESO5 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03SRESO5()
  {
    return fieldE03SRESO5.getBigDecimal();
  }

  /**
  * Set field E03SRECO6 using a String value.
  */
  public void setE03SRECO6(String newvalue)
  {
    fieldE03SRECO6.setString(newvalue);
  }

  /**
  * Get value of field E03SRECO6 as a String.
  */
  public String getE03SRECO6()
  {
    return fieldE03SRECO6.getString();
  }

  /**
  * Set field E03SREDS6 using a String value.
  */
  public void setE03SREDS6(String newvalue)
  {
    fieldE03SREDS6.setString(newvalue);
  }

  /**
  * Get value of field E03SREDS6 as a String.
  */
  public String getE03SREDS6()
  {
    return fieldE03SREDS6.getString();
  }

  /**
  * Set field E03SRESO6 using a String value.
  */
  public void setE03SRESO6(String newvalue)
  {
    fieldE03SRESO6.setString(newvalue);
  }

  /**
  * Get value of field E03SRESO6 as a String.
  */
  public String getE03SRESO6()
  {
    return fieldE03SRESO6.getString();
  }

  /**
  * Set numeric field E03SRESO6 using a BigDecimal value.
  */
  public void setE03SRESO6(BigDecimal newvalue)
  {
    fieldE03SRESO6.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03SRESO6 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03SRESO6()
  {
    return fieldE03SRESO6.getBigDecimal();
  }

  /**
  * Set field E03SRECO7 using a String value.
  */
  public void setE03SRECO7(String newvalue)
  {
    fieldE03SRECO7.setString(newvalue);
  }

  /**
  * Get value of field E03SRECO7 as a String.
  */
  public String getE03SRECO7()
  {
    return fieldE03SRECO7.getString();
  }

  /**
  * Set field E03SREDS7 using a String value.
  */
  public void setE03SREDS7(String newvalue)
  {
    fieldE03SREDS7.setString(newvalue);
  }

  /**
  * Get value of field E03SREDS7 as a String.
  */
  public String getE03SREDS7()
  {
    return fieldE03SREDS7.getString();
  }

  /**
  * Set field E03SRESO7 using a String value.
  */
  public void setE03SRESO7(String newvalue)
  {
    fieldE03SRESO7.setString(newvalue);
  }

  /**
  * Get value of field E03SRESO7 as a String.
  */
  public String getE03SRESO7()
  {
    return fieldE03SRESO7.getString();
  }

  /**
  * Set numeric field E03SRESO7 using a BigDecimal value.
  */
  public void setE03SRESO7(BigDecimal newvalue)
  {
    fieldE03SRESO7.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03SRESO7 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03SRESO7()
  {
    return fieldE03SRESO7.getBigDecimal();
  }

  /**
  * Set field E03SRECO8 using a String value.
  */
  public void setE03SRECO8(String newvalue)
  {
    fieldE03SRECO8.setString(newvalue);
  }

  /**
  * Get value of field E03SRECO8 as a String.
  */
  public String getE03SRECO8()
  {
    return fieldE03SRECO8.getString();
  }

  /**
  * Set field E03SREDS8 using a String value.
  */
  public void setE03SREDS8(String newvalue)
  {
    fieldE03SREDS8.setString(newvalue);
  }

  /**
  * Get value of field E03SREDS8 as a String.
  */
  public String getE03SREDS8()
  {
    return fieldE03SREDS8.getString();
  }

  /**
  * Set field E03SRESO8 using a String value.
  */
  public void setE03SRESO8(String newvalue)
  {
    fieldE03SRESO8.setString(newvalue);
  }

  /**
  * Get value of field E03SRESO8 as a String.
  */
  public String getE03SRESO8()
  {
    return fieldE03SRESO8.getString();
  }

  /**
  * Set numeric field E03SRESO8 using a BigDecimal value.
  */
  public void setE03SRESO8(BigDecimal newvalue)
  {
    fieldE03SRESO8.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03SRESO8 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03SRESO8()
  {
    return fieldE03SRESO8.getBigDecimal();
  }

  /**
  * Set field E03SRECO9 using a String value.
  */
  public void setE03SRECO9(String newvalue)
  {
    fieldE03SRECO9.setString(newvalue);
  }

  /**
  * Get value of field E03SRECO9 as a String.
  */
  public String getE03SRECO9()
  {
    return fieldE03SRECO9.getString();
  }

  /**
  * Set field E03SREDS9 using a String value.
  */
  public void setE03SREDS9(String newvalue)
  {
    fieldE03SREDS9.setString(newvalue);
  }

  /**
  * Get value of field E03SREDS9 as a String.
  */
  public String getE03SREDS9()
  {
    return fieldE03SREDS9.getString();
  }

  /**
  * Set field E03SRESO9 using a String value.
  */
  public void setE03SRESO9(String newvalue)
  {
    fieldE03SRESO9.setString(newvalue);
  }

  /**
  * Get value of field E03SRESO9 as a String.
  */
  public String getE03SRESO9()
  {
    return fieldE03SRESO9.getString();
  }

  /**
  * Set numeric field E03SRESO9 using a BigDecimal value.
  */
  public void setE03SRESO9(BigDecimal newvalue)
  {
    fieldE03SRESO9.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03SRESO9 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03SRESO9()
  {
    return fieldE03SRESO9.getBigDecimal();
  }

  /**
  * Set field E03SRECO0 using a String value.
  */
  public void setE03SRECO0(String newvalue)
  {
    fieldE03SRECO0.setString(newvalue);
  }

  /**
  * Get value of field E03SRECO0 as a String.
  */
  public String getE03SRECO0()
  {
    return fieldE03SRECO0.getString();
  }

  /**
  * Set field E03SREDS0 using a String value.
  */
  public void setE03SREDS0(String newvalue)
  {
    fieldE03SREDS0.setString(newvalue);
  }

  /**
  * Get value of field E03SREDS0 as a String.
  */
  public String getE03SREDS0()
  {
    return fieldE03SREDS0.getString();
  }

  /**
  * Set field E03SRESO0 using a String value.
  */
  public void setE03SRESO0(String newvalue)
  {
    fieldE03SRESO0.setString(newvalue);
  }

  /**
  * Get value of field E03SRESO0 as a String.
  */
  public String getE03SRESO0()
  {
    return fieldE03SRESO0.getString();
  }

  /**
  * Set numeric field E03SRESO0 using a BigDecimal value.
  */
  public void setE03SRESO0(BigDecimal newvalue)
  {
    fieldE03SRESO0.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03SRESO0 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03SRESO0()
  {
    return fieldE03SRESO0.getBigDecimal();
  }

}