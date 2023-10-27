package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ECH026501 physical file definition.
* 
* File level identifier is 1180531233448.
* Record format level identifier is 3B875614FE60C.
*/

public class ECH026501Message extends MessageRecord
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
                                     "E01SELBNK",
                                     "E01SELBRN",
                                     "E01SELBDS",
                                     "E01SELTCB",
                                     "E01SELACC",
                                     "E01CHUACC",
                                     "E01CHUNTC",
                                     "E01CHUICK",
                                     "E01CHUFCK",
                                     "E01CHUTCB",
                                     "E01CHUNCB",
                                     "E01CHUPRO",
                                     "E01CHURQM",
                                     "E01CHURQD",
                                     "E01CHURQY",
                                     "E01CHURCM",
                                     "E01CHURCD",
                                     "E01CHURCY",
                                     "E01CHUDET",
                                     "E01CHUDEM",
                                     "E01CHUDED",
                                     "E01CHUDEY",
                                     "E01CHUIBM",
                                     "E01CHUIBD",
                                     "E01CHUIBY",
                                     "E01CHUACM",
                                     "E01CHUACD",
                                     "E01CHUACY",
                                     "E01CHUSCP",
                                     "E01CHUSTS",
                                     "E01STSSOL",
                                     "E01STSRCV",
                                     "E01STSENV",
                                     "E01STSSUC",
                                     "E01STSENT",
                                     "E01CHUCCY"
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
                                   "E01SELBNK",
                                   "E01SELBRN",
                                   "E01SELBDS",
                                   "E01SELTCB",
                                   "E01SELACC",
                                   "E01CHUACC",
                                   "E01CHUNTC",
                                   "E01CHUICK",
                                   "E01CHUFCK",
                                   "E01CHUTCB",
                                   "E01CHUNCB",
                                   "E01CHUPRO",
                                   "E01CHURQM",
                                   "E01CHURQD",
                                   "E01CHURQY",
                                   "E01CHURCM",
                                   "E01CHURCD",
                                   "E01CHURCY",
                                   "E01CHUDET",
                                   "E01CHUDEM",
                                   "E01CHUDED",
                                   "E01CHUDEY",
                                   "E01CHUIBM",
                                   "E01CHUIBD",
                                   "E01CHUIBY",
                                   "E01CHUACM",
                                   "E01CHUACD",
                                   "E01CHUACY",
                                   "E01CHUSCP",
                                   "E01CHUSTS",
                                   "E01STSSOL",
                                   "E01STSRCV",
                                   "E01STSENV",
                                   "E01STSSUC",
                                   "E01STSENT",
                                   "E01CHUCCY"
                                 };
  final static String fid = "1180531233448";
  final static String rid = "3B875614FE60C";
  final static String fmtname = "ECH026501";
  final int FIELDCOUNT = 45;
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
  private CharacterField fieldE01SELBNK = null;
  private DecimalField fieldE01SELBRN = null;
  private CharacterField fieldE01SELBDS = null;
  private CharacterField fieldE01SELTCB = null;
  private DecimalField fieldE01SELACC = null;
  private DecimalField fieldE01CHUACC = null;
  private DecimalField fieldE01CHUNTC = null;
  private DecimalField fieldE01CHUICK = null;
  private DecimalField fieldE01CHUFCK = null;
  private CharacterField fieldE01CHUTCB = null;
  private DecimalField fieldE01CHUNCB = null;
  private DecimalField fieldE01CHUPRO = null;
  private DecimalField fieldE01CHURQM = null;
  private DecimalField fieldE01CHURQD = null;
  private DecimalField fieldE01CHURQY = null;
  private DecimalField fieldE01CHURCM = null;
  private DecimalField fieldE01CHURCD = null;
  private DecimalField fieldE01CHURCY = null;
  private DecimalField fieldE01CHUDET = null;
  private DecimalField fieldE01CHUDEM = null;
  private DecimalField fieldE01CHUDED = null;
  private DecimalField fieldE01CHUDEY = null;
  private DecimalField fieldE01CHUIBM = null;
  private DecimalField fieldE01CHUIBD = null;
  private DecimalField fieldE01CHUIBY = null;
  private DecimalField fieldE01CHUACM = null;
  private DecimalField fieldE01CHUACD = null;
  private DecimalField fieldE01CHUACY = null;
  private CharacterField fieldE01CHUSCP = null;
  private CharacterField fieldE01CHUSTS = null;
  private CharacterField fieldE01STSSOL = null;
  private CharacterField fieldE01STSRCV = null;
  private CharacterField fieldE01STSENV = null;
  private CharacterField fieldE01STSSUC = null;
  private CharacterField fieldE01STSENT = null;
  private CharacterField fieldE01CHUCCY = null;

  /**
  * Constructor for ECH026501Message.
  */
  public ECH026501Message()
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
    recordsize = 261;
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
    fields[9] = fieldE01SELBNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E01SELBNK");
    fields[10] = fieldE01SELBRN =
    new DecimalField(message, HEADERSIZE + 44, 5, 0, "E01SELBRN");
    fields[11] = fieldE01SELBDS =
    new CharacterField(message, HEADERSIZE + 49, 60, "E01SELBDS");
    fields[12] = fieldE01SELTCB =
    new CharacterField(message, HEADERSIZE + 109, 2, "E01SELTCB");
    fields[13] = fieldE01SELACC =
    new DecimalField(message, HEADERSIZE + 111, 13, 0, "E01SELACC");
    fields[14] = fieldE01CHUACC =
    new DecimalField(message, HEADERSIZE + 124, 13, 0, "E01CHUACC");
    fields[15] = fieldE01CHUNTC =
    new DecimalField(message, HEADERSIZE + 137, 5, 0, "E01CHUNTC");
    fields[16] = fieldE01CHUICK =
    new DecimalField(message, HEADERSIZE + 142, 12, 0, "E01CHUICK");
    fields[17] = fieldE01CHUFCK =
    new DecimalField(message, HEADERSIZE + 154, 12, 0, "E01CHUFCK");
    fields[18] = fieldE01CHUTCB =
    new CharacterField(message, HEADERSIZE + 166, 2, "E01CHUTCB");
    fields[19] = fieldE01CHUNCB =
    new DecimalField(message, HEADERSIZE + 168, 13, 0, "E01CHUNCB");
    fields[20] = fieldE01CHUPRO =
    new DecimalField(message, HEADERSIZE + 181, 10, 0, "E01CHUPRO");
    fields[21] = fieldE01CHURQM =
    new DecimalField(message, HEADERSIZE + 191, 3, 0, "E01CHURQM");
    fields[22] = fieldE01CHURQD =
    new DecimalField(message, HEADERSIZE + 194, 3, 0, "E01CHURQD");
    fields[23] = fieldE01CHURQY =
    new DecimalField(message, HEADERSIZE + 197, 5, 0, "E01CHURQY");
    fields[24] = fieldE01CHURCM =
    new DecimalField(message, HEADERSIZE + 202, 3, 0, "E01CHURCM");
    fields[25] = fieldE01CHURCD =
    new DecimalField(message, HEADERSIZE + 205, 3, 0, "E01CHURCD");
    fields[26] = fieldE01CHURCY =
    new DecimalField(message, HEADERSIZE + 208, 5, 0, "E01CHURCY");
    fields[27] = fieldE01CHUDET =
    new DecimalField(message, HEADERSIZE + 213, 5, 0, "E01CHUDET");
    fields[28] = fieldE01CHUDEM =
    new DecimalField(message, HEADERSIZE + 218, 3, 0, "E01CHUDEM");
    fields[29] = fieldE01CHUDED =
    new DecimalField(message, HEADERSIZE + 221, 3, 0, "E01CHUDED");
    fields[30] = fieldE01CHUDEY =
    new DecimalField(message, HEADERSIZE + 224, 5, 0, "E01CHUDEY");
    fields[31] = fieldE01CHUIBM =
    new DecimalField(message, HEADERSIZE + 229, 3, 0, "E01CHUIBM");
    fields[32] = fieldE01CHUIBD =
    new DecimalField(message, HEADERSIZE + 232, 3, 0, "E01CHUIBD");
    fields[33] = fieldE01CHUIBY =
    new DecimalField(message, HEADERSIZE + 235, 5, 0, "E01CHUIBY");
    fields[34] = fieldE01CHUACM =
    new DecimalField(message, HEADERSIZE + 240, 3, 0, "E01CHUACM");
    fields[35] = fieldE01CHUACD =
    new DecimalField(message, HEADERSIZE + 243, 3, 0, "E01CHUACD");
    fields[36] = fieldE01CHUACY =
    new DecimalField(message, HEADERSIZE + 246, 5, 0, "E01CHUACY");
    fields[37] = fieldE01CHUSCP =
    new CharacterField(message, HEADERSIZE + 251, 1, "E01CHUSCP");
    fields[38] = fieldE01CHUSTS =
    new CharacterField(message, HEADERSIZE + 252, 1, "E01CHUSTS");
    fields[39] = fieldE01STSSOL =
    new CharacterField(message, HEADERSIZE + 253, 1, "E01STSSOL");
    fields[40] = fieldE01STSRCV =
    new CharacterField(message, HEADERSIZE + 254, 1, "E01STSRCV");
    fields[41] = fieldE01STSENV =
    new CharacterField(message, HEADERSIZE + 255, 1, "E01STSENV");
    fields[42] = fieldE01STSSUC =
    new CharacterField(message, HEADERSIZE + 256, 1, "E01STSSUC");
    fields[43] = fieldE01STSENT =
    new CharacterField(message, HEADERSIZE + 257, 1, "E01STSENT");
    fields[44] = fieldE01CHUCCY =
    new CharacterField(message, HEADERSIZE + 258, 3, "E01CHUCCY");

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
  * Set field E01SELBNK using a String value.
  */
  public void setE01SELBNK(String newvalue)
  {
    fieldE01SELBNK.setString(newvalue);
  }

  /**
  * Get value of field E01SELBNK as a String.
  */
  public String getE01SELBNK()
  {
    return fieldE01SELBNK.getString();
  }

  /**
  * Set field E01SELBRN using a String value.
  */
  public void setE01SELBRN(String newvalue)
  {
    fieldE01SELBRN.setString(newvalue);
  }

  /**
  * Get value of field E01SELBRN as a String.
  */
  public String getE01SELBRN()
  {
    return fieldE01SELBRN.getString();
  }

  /**
  * Set numeric field E01SELBRN using a BigDecimal value.
  */
  public void setE01SELBRN(BigDecimal newvalue)
  {
    fieldE01SELBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SELBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SELBRN()
  {
    return fieldE01SELBRN.getBigDecimal();
  }

  /**
  * Set field E01SELBDS using a String value.
  */
  public void setE01SELBDS(String newvalue)
  {
    fieldE01SELBDS.setString(newvalue);
  }

  /**
  * Get value of field E01SELBDS as a String.
  */
  public String getE01SELBDS()
  {
    return fieldE01SELBDS.getString();
  }

  /**
  * Set field E01SELTCB using a String value.
  */
  public void setE01SELTCB(String newvalue)
  {
    fieldE01SELTCB.setString(newvalue);
  }

  /**
  * Get value of field E01SELTCB as a String.
  */
  public String getE01SELTCB()
  {
    return fieldE01SELTCB.getString();
  }

  /**
  * Set field E01SELACC using a String value.
  */
  public void setE01SELACC(String newvalue)
  {
    fieldE01SELACC.setString(newvalue);
  }

  /**
  * Get value of field E01SELACC as a String.
  */
  public String getE01SELACC()
  {
    return fieldE01SELACC.getString();
  }

  /**
  * Set numeric field E01SELACC using a BigDecimal value.
  */
  public void setE01SELACC(BigDecimal newvalue)
  {
    fieldE01SELACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SELACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SELACC()
  {
    return fieldE01SELACC.getBigDecimal();
  }

  /**
  * Set field E01CHUACC using a String value.
  */
  public void setE01CHUACC(String newvalue)
  {
    fieldE01CHUACC.setString(newvalue);
  }

  /**
  * Get value of field E01CHUACC as a String.
  */
  public String getE01CHUACC()
  {
    return fieldE01CHUACC.getString();
  }

  /**
  * Set numeric field E01CHUACC using a BigDecimal value.
  */
  public void setE01CHUACC(BigDecimal newvalue)
  {
    fieldE01CHUACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHUACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHUACC()
  {
    return fieldE01CHUACC.getBigDecimal();
  }

  /**
  * Set field E01CHUNTC using a String value.
  */
  public void setE01CHUNTC(String newvalue)
  {
    fieldE01CHUNTC.setString(newvalue);
  }

  /**
  * Get value of field E01CHUNTC as a String.
  */
  public String getE01CHUNTC()
  {
    return fieldE01CHUNTC.getString();
  }

  /**
  * Set numeric field E01CHUNTC using a BigDecimal value.
  */
  public void setE01CHUNTC(BigDecimal newvalue)
  {
    fieldE01CHUNTC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHUNTC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHUNTC()
  {
    return fieldE01CHUNTC.getBigDecimal();
  }

  /**
  * Set field E01CHUICK using a String value.
  */
  public void setE01CHUICK(String newvalue)
  {
    fieldE01CHUICK.setString(newvalue);
  }

  /**
  * Get value of field E01CHUICK as a String.
  */
  public String getE01CHUICK()
  {
    return fieldE01CHUICK.getString();
  }

  /**
  * Set numeric field E01CHUICK using a BigDecimal value.
  */
  public void setE01CHUICK(BigDecimal newvalue)
  {
    fieldE01CHUICK.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHUICK as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHUICK()
  {
    return fieldE01CHUICK.getBigDecimal();
  }

  /**
  * Set field E01CHUFCK using a String value.
  */
  public void setE01CHUFCK(String newvalue)
  {
    fieldE01CHUFCK.setString(newvalue);
  }

  /**
  * Get value of field E01CHUFCK as a String.
  */
  public String getE01CHUFCK()
  {
    return fieldE01CHUFCK.getString();
  }

  /**
  * Set numeric field E01CHUFCK using a BigDecimal value.
  */
  public void setE01CHUFCK(BigDecimal newvalue)
  {
    fieldE01CHUFCK.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHUFCK as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHUFCK()
  {
    return fieldE01CHUFCK.getBigDecimal();
  }

  /**
  * Set field E01CHUTCB using a String value.
  */
  public void setE01CHUTCB(String newvalue)
  {
    fieldE01CHUTCB.setString(newvalue);
  }

  /**
  * Get value of field E01CHUTCB as a String.
  */
  public String getE01CHUTCB()
  {
    return fieldE01CHUTCB.getString();
  }

  /**
  * Set field E01CHUNCB using a String value.
  */
  public void setE01CHUNCB(String newvalue)
  {
    fieldE01CHUNCB.setString(newvalue);
  }

  /**
  * Get value of field E01CHUNCB as a String.
  */
  public String getE01CHUNCB()
  {
    return fieldE01CHUNCB.getString();
  }

  /**
  * Set numeric field E01CHUNCB using a BigDecimal value.
  */
  public void setE01CHUNCB(BigDecimal newvalue)
  {
    fieldE01CHUNCB.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHUNCB as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHUNCB()
  {
    return fieldE01CHUNCB.getBigDecimal();
  }

  /**
  * Set field E01CHUPRO using a String value.
  */
  public void setE01CHUPRO(String newvalue)
  {
    fieldE01CHUPRO.setString(newvalue);
  }

  /**
  * Get value of field E01CHUPRO as a String.
  */
  public String getE01CHUPRO()
  {
    return fieldE01CHUPRO.getString();
  }

  /**
  * Set numeric field E01CHUPRO using a BigDecimal value.
  */
  public void setE01CHUPRO(BigDecimal newvalue)
  {
    fieldE01CHUPRO.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHUPRO as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHUPRO()
  {
    return fieldE01CHUPRO.getBigDecimal();
  }

  /**
  * Set field E01CHURQM using a String value.
  */
  public void setE01CHURQM(String newvalue)
  {
    fieldE01CHURQM.setString(newvalue);
  }

  /**
  * Get value of field E01CHURQM as a String.
  */
  public String getE01CHURQM()
  {
    return fieldE01CHURQM.getString();
  }

  /**
  * Set numeric field E01CHURQM using a BigDecimal value.
  */
  public void setE01CHURQM(BigDecimal newvalue)
  {
    fieldE01CHURQM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHURQM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHURQM()
  {
    return fieldE01CHURQM.getBigDecimal();
  }

  /**
  * Set field E01CHURQD using a String value.
  */
  public void setE01CHURQD(String newvalue)
  {
    fieldE01CHURQD.setString(newvalue);
  }

  /**
  * Get value of field E01CHURQD as a String.
  */
  public String getE01CHURQD()
  {
    return fieldE01CHURQD.getString();
  }

  /**
  * Set numeric field E01CHURQD using a BigDecimal value.
  */
  public void setE01CHURQD(BigDecimal newvalue)
  {
    fieldE01CHURQD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHURQD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHURQD()
  {
    return fieldE01CHURQD.getBigDecimal();
  }

  /**
  * Set field E01CHURQY using a String value.
  */
  public void setE01CHURQY(String newvalue)
  {
    fieldE01CHURQY.setString(newvalue);
  }

  /**
  * Get value of field E01CHURQY as a String.
  */
  public String getE01CHURQY()
  {
    return fieldE01CHURQY.getString();
  }

  /**
  * Set numeric field E01CHURQY using a BigDecimal value.
  */
  public void setE01CHURQY(BigDecimal newvalue)
  {
    fieldE01CHURQY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHURQY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHURQY()
  {
    return fieldE01CHURQY.getBigDecimal();
  }

  /**
  * Set field E01CHURCM using a String value.
  */
  public void setE01CHURCM(String newvalue)
  {
    fieldE01CHURCM.setString(newvalue);
  }

  /**
  * Get value of field E01CHURCM as a String.
  */
  public String getE01CHURCM()
  {
    return fieldE01CHURCM.getString();
  }

  /**
  * Set numeric field E01CHURCM using a BigDecimal value.
  */
  public void setE01CHURCM(BigDecimal newvalue)
  {
    fieldE01CHURCM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHURCM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHURCM()
  {
    return fieldE01CHURCM.getBigDecimal();
  }

  /**
  * Set field E01CHURCD using a String value.
  */
  public void setE01CHURCD(String newvalue)
  {
    fieldE01CHURCD.setString(newvalue);
  }

  /**
  * Get value of field E01CHURCD as a String.
  */
  public String getE01CHURCD()
  {
    return fieldE01CHURCD.getString();
  }

  /**
  * Set numeric field E01CHURCD using a BigDecimal value.
  */
  public void setE01CHURCD(BigDecimal newvalue)
  {
    fieldE01CHURCD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHURCD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHURCD()
  {
    return fieldE01CHURCD.getBigDecimal();
  }

  /**
  * Set field E01CHURCY using a String value.
  */
  public void setE01CHURCY(String newvalue)
  {
    fieldE01CHURCY.setString(newvalue);
  }

  /**
  * Get value of field E01CHURCY as a String.
  */
  public String getE01CHURCY()
  {
    return fieldE01CHURCY.getString();
  }

  /**
  * Set numeric field E01CHURCY using a BigDecimal value.
  */
  public void setE01CHURCY(BigDecimal newvalue)
  {
    fieldE01CHURCY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHURCY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHURCY()
  {
    return fieldE01CHURCY.getBigDecimal();
  }

  /**
  * Set field E01CHUDET using a String value.
  */
  public void setE01CHUDET(String newvalue)
  {
    fieldE01CHUDET.setString(newvalue);
  }

  /**
  * Get value of field E01CHUDET as a String.
  */
  public String getE01CHUDET()
  {
    return fieldE01CHUDET.getString();
  }

  /**
  * Set numeric field E01CHUDET using a BigDecimal value.
  */
  public void setE01CHUDET(BigDecimal newvalue)
  {
    fieldE01CHUDET.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHUDET as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHUDET()
  {
    return fieldE01CHUDET.getBigDecimal();
  }

  /**
  * Set field E01CHUDEM using a String value.
  */
  public void setE01CHUDEM(String newvalue)
  {
    fieldE01CHUDEM.setString(newvalue);
  }

  /**
  * Get value of field E01CHUDEM as a String.
  */
  public String getE01CHUDEM()
  {
    return fieldE01CHUDEM.getString();
  }

  /**
  * Set numeric field E01CHUDEM using a BigDecimal value.
  */
  public void setE01CHUDEM(BigDecimal newvalue)
  {
    fieldE01CHUDEM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHUDEM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHUDEM()
  {
    return fieldE01CHUDEM.getBigDecimal();
  }

  /**
  * Set field E01CHUDED using a String value.
  */
  public void setE01CHUDED(String newvalue)
  {
    fieldE01CHUDED.setString(newvalue);
  }

  /**
  * Get value of field E01CHUDED as a String.
  */
  public String getE01CHUDED()
  {
    return fieldE01CHUDED.getString();
  }

  /**
  * Set numeric field E01CHUDED using a BigDecimal value.
  */
  public void setE01CHUDED(BigDecimal newvalue)
  {
    fieldE01CHUDED.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHUDED as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHUDED()
  {
    return fieldE01CHUDED.getBigDecimal();
  }

  /**
  * Set field E01CHUDEY using a String value.
  */
  public void setE01CHUDEY(String newvalue)
  {
    fieldE01CHUDEY.setString(newvalue);
  }

  /**
  * Get value of field E01CHUDEY as a String.
  */
  public String getE01CHUDEY()
  {
    return fieldE01CHUDEY.getString();
  }

  /**
  * Set numeric field E01CHUDEY using a BigDecimal value.
  */
  public void setE01CHUDEY(BigDecimal newvalue)
  {
    fieldE01CHUDEY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHUDEY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHUDEY()
  {
    return fieldE01CHUDEY.getBigDecimal();
  }

  /**
  * Set field E01CHUIBM using a String value.
  */
  public void setE01CHUIBM(String newvalue)
  {
    fieldE01CHUIBM.setString(newvalue);
  }

  /**
  * Get value of field E01CHUIBM as a String.
  */
  public String getE01CHUIBM()
  {
    return fieldE01CHUIBM.getString();
  }

  /**
  * Set numeric field E01CHUIBM using a BigDecimal value.
  */
  public void setE01CHUIBM(BigDecimal newvalue)
  {
    fieldE01CHUIBM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHUIBM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHUIBM()
  {
    return fieldE01CHUIBM.getBigDecimal();
  }

  /**
  * Set field E01CHUIBD using a String value.
  */
  public void setE01CHUIBD(String newvalue)
  {
    fieldE01CHUIBD.setString(newvalue);
  }

  /**
  * Get value of field E01CHUIBD as a String.
  */
  public String getE01CHUIBD()
  {
    return fieldE01CHUIBD.getString();
  }

  /**
  * Set numeric field E01CHUIBD using a BigDecimal value.
  */
  public void setE01CHUIBD(BigDecimal newvalue)
  {
    fieldE01CHUIBD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHUIBD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHUIBD()
  {
    return fieldE01CHUIBD.getBigDecimal();
  }

  /**
  * Set field E01CHUIBY using a String value.
  */
  public void setE01CHUIBY(String newvalue)
  {
    fieldE01CHUIBY.setString(newvalue);
  }

  /**
  * Get value of field E01CHUIBY as a String.
  */
  public String getE01CHUIBY()
  {
    return fieldE01CHUIBY.getString();
  }

  /**
  * Set numeric field E01CHUIBY using a BigDecimal value.
  */
  public void setE01CHUIBY(BigDecimal newvalue)
  {
    fieldE01CHUIBY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHUIBY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHUIBY()
  {
    return fieldE01CHUIBY.getBigDecimal();
  }

  /**
  * Set field E01CHUACM using a String value.
  */
  public void setE01CHUACM(String newvalue)
  {
    fieldE01CHUACM.setString(newvalue);
  }

  /**
  * Get value of field E01CHUACM as a String.
  */
  public String getE01CHUACM()
  {
    return fieldE01CHUACM.getString();
  }

  /**
  * Set numeric field E01CHUACM using a BigDecimal value.
  */
  public void setE01CHUACM(BigDecimal newvalue)
  {
    fieldE01CHUACM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHUACM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHUACM()
  {
    return fieldE01CHUACM.getBigDecimal();
  }

  /**
  * Set field E01CHUACD using a String value.
  */
  public void setE01CHUACD(String newvalue)
  {
    fieldE01CHUACD.setString(newvalue);
  }

  /**
  * Get value of field E01CHUACD as a String.
  */
  public String getE01CHUACD()
  {
    return fieldE01CHUACD.getString();
  }

  /**
  * Set numeric field E01CHUACD using a BigDecimal value.
  */
  public void setE01CHUACD(BigDecimal newvalue)
  {
    fieldE01CHUACD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHUACD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHUACD()
  {
    return fieldE01CHUACD.getBigDecimal();
  }

  /**
  * Set field E01CHUACY using a String value.
  */
  public void setE01CHUACY(String newvalue)
  {
    fieldE01CHUACY.setString(newvalue);
  }

  /**
  * Get value of field E01CHUACY as a String.
  */
  public String getE01CHUACY()
  {
    return fieldE01CHUACY.getString();
  }

  /**
  * Set numeric field E01CHUACY using a BigDecimal value.
  */
  public void setE01CHUACY(BigDecimal newvalue)
  {
    fieldE01CHUACY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHUACY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHUACY()
  {
    return fieldE01CHUACY.getBigDecimal();
  }

  /**
  * Set field E01CHUSCP using a String value.
  */
  public void setE01CHUSCP(String newvalue)
  {
    fieldE01CHUSCP.setString(newvalue);
  }

  /**
  * Get value of field E01CHUSCP as a String.
  */
  public String getE01CHUSCP()
  {
    return fieldE01CHUSCP.getString();
  }

  /**
  * Set field E01CHUSTS using a String value.
  */
  public void setE01CHUSTS(String newvalue)
  {
    fieldE01CHUSTS.setString(newvalue);
  }

  /**
  * Get value of field E01CHUSTS as a String.
  */
  public String getE01CHUSTS()
  {
    return fieldE01CHUSTS.getString();
  }

  /**
  * Set field E01STSSOL using a String value.
  */
  public void setE01STSSOL(String newvalue)
  {
    fieldE01STSSOL.setString(newvalue);
  }

  /**
  * Get value of field E01STSSOL as a String.
  */
  public String getE01STSSOL()
  {
    return fieldE01STSSOL.getString();
  }

  /**
  * Set field E01STSRCV using a String value.
  */
  public void setE01STSRCV(String newvalue)
  {
    fieldE01STSRCV.setString(newvalue);
  }

  /**
  * Get value of field E01STSRCV as a String.
  */
  public String getE01STSRCV()
  {
    return fieldE01STSRCV.getString();
  }

  /**
  * Set field E01STSENV using a String value.
  */
  public void setE01STSENV(String newvalue)
  {
    fieldE01STSENV.setString(newvalue);
  }

  /**
  * Get value of field E01STSENV as a String.
  */
  public String getE01STSENV()
  {
    return fieldE01STSENV.getString();
  }

  /**
  * Set field E01STSSUC using a String value.
  */
  public void setE01STSSUC(String newvalue)
  {
    fieldE01STSSUC.setString(newvalue);
  }

  /**
  * Get value of field E01STSSUC as a String.
  */
  public String getE01STSSUC()
  {
    return fieldE01STSSUC.getString();
  }

  /**
  * Set field E01STSENT using a String value.
  */
  public void setE01STSENT(String newvalue)
  {
    fieldE01STSENT.setString(newvalue);
  }

  /**
  * Get value of field E01STSENT as a String.
  */
  public String getE01STSENT()
  {
    return fieldE01STSENT.getString();
  }

  /**
  * Set field E01CHUCCY using a String value.
  */
  public void setE01CHUCCY(String newvalue)
  {
    fieldE01CHUCCY.setString(newvalue);
  }

  /**
  * Get value of field E01CHUCCY as a String.
  */
  public String getE01CHUCCY()
  {
    return fieldE01CHUCCY.getString();
  }

}