package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EST097001 physical file definition.
* 
* File level identifier is 1100706173700.
* Record format level identifier is 30B4EC8866B56.
*/

public class EST097001Message extends MessageRecord
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
                                     "E01REPSIS",
                                     "E01REPFDA",
                                     "E01REPFDM",
                                     "E01REPFDD",
                                     "E01REPFHA",
                                     "E01REPFHM",
                                     "E01REPFHD",
                                     "E01REPGLO",
                                     "E01REPMOD",
                                     "E01REPARC",
                                     "E01REPIMP",
                                     "E01REPBAN",
                                     "E01REPREG",
                                     "E01REPMTO",
                                     "E01REPBRN",
                                     "E01REPCUN",
                                     "E01REPACC",
                                     "E01REPTYP",
                                     "E01REPFCA",
                                     "E01REPFCM",
                                     "E01REPFCD",
                                     "E01REPFVA",
                                     "E01REPFVM",
                                     "E01REPFVD",
                                     "E01REPMON",
                                     "E01REPCCY",
                                     "E01REPINS",
                                     "E01REPTPR",
                                     "E01REPNOP",
                                     "E01REPNCU",
                                     "E01REPVCO",
                                     "E01REPGLS",
                                     "E01REPMTV",
                                     "E01REPRES",
                                     "E01REPCRE",
                                     "E01NOMCLI",
                                     "E01PRODUC",
                                     "E01GLSPRO",
                                     "E01GLSCMO",
                                     "E01OFICI1",
                                     "E01GLSOF1",
                                     "E01OFICI2",
                                     "E01GLSOF2",
                                     "E01GLSTIP",
                                     "E01GLSMOV",
                                     "E01GLSRES",
                                     "E01GLSCAU"
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
                                   "E01REPSIS",
                                   "E01REPFDA",
                                   "E01REPFDM",
                                   "E01REPFDD",
                                   "E01REPFHA",
                                   "E01REPFHM",
                                   "E01REPFHD",
                                   "E01REPGLO",
                                   "E01REPMOD",
                                   "E01REPARC",
                                   "E01REPIMP",
                                   "E01REPBAN",
                                   "E01REPREG",
                                   "E01REPMTO",
                                   "E01REPBRN",
                                   "E01REPCUN",
                                   "E01REPACC",
                                   "E01REPTYP",
                                   "E01REPFCA",
                                   "E01REPFCM",
                                   "E01REPFCD",
                                   "E01REPFVA",
                                   "E01REPFVM",
                                   "E01REPFVD",
                                   "E01REPMON",
                                   "E01REPCCY",
                                   "E01REPINS",
                                   "E01REPTPR",
                                   "E01REPNOP",
                                   "E01REPNCU",
                                   "E01REPVCO",
                                   "E01REPGLS",
                                   "E01REPMTV",
                                   "E01REPRES",
                                   "E01REPCRE",
                                   "E01NOMCLI",
                                   "E01PRODUC",
                                   "E01GLSPRO",
                                   "E01GLSCMO",
                                   "E01OFICI1",
                                   "E01GLSOF1",
                                   "E01OFICI2",
                                   "E01GLSOF2",
                                   "E01GLSTIP",
                                   "E01GLSMOV",
                                   "E01GLSRES",
                                   "E01GLSCAU"
                                 };
  final static String fid = "1100706173700";
  final static String rid = "30B4EC8866B56";
  final static String fmtname = "EST097001";
  final int FIELDCOUNT = 56;
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
  private CharacterField fieldE01REPSIS = null;
  private DecimalField fieldE01REPFDA = null;
  private DecimalField fieldE01REPFDM = null;
  private DecimalField fieldE01REPFDD = null;
  private DecimalField fieldE01REPFHA = null;
  private DecimalField fieldE01REPFHM = null;
  private DecimalField fieldE01REPFHD = null;
  private CharacterField fieldE01REPGLO = null;
  private CharacterField fieldE01REPMOD = null;
  private CharacterField fieldE01REPARC = null;
  private CharacterField fieldE01REPIMP = null;
  private CharacterField fieldE01REPBAN = null;
  private DecimalField fieldE01REPREG = null;
  private DecimalField fieldE01REPMTO = null;
  private DecimalField fieldE01REPBRN = null;
  private DecimalField fieldE01REPCUN = null;
  private DecimalField fieldE01REPACC = null;
  private DecimalField fieldE01REPTYP = null;
  private DecimalField fieldE01REPFCA = null;
  private DecimalField fieldE01REPFCM = null;
  private DecimalField fieldE01REPFCD = null;
  private DecimalField fieldE01REPFVA = null;
  private DecimalField fieldE01REPFVM = null;
  private DecimalField fieldE01REPFVD = null;
  private DecimalField fieldE01REPMON = null;
  private CharacterField fieldE01REPCCY = null;
  private DecimalField fieldE01REPINS = null;
  private CharacterField fieldE01REPTPR = null;
  private CharacterField fieldE01REPNOP = null;
  private CharacterField fieldE01REPNCU = null;
  private DecimalField fieldE01REPVCO = null;
  private CharacterField fieldE01REPGLS = null;
  private DecimalField fieldE01REPMTV = null;
  private CharacterField fieldE01REPRES = null;
  private CharacterField fieldE01REPCRE = null;
  private CharacterField fieldE01NOMCLI = null;
  private CharacterField fieldE01PRODUC = null;
  private CharacterField fieldE01GLSPRO = null;
  private CharacterField fieldE01GLSCMO = null;
  private CharacterField fieldE01OFICI1 = null;
  private CharacterField fieldE01GLSOF1 = null;
  private CharacterField fieldE01OFICI2 = null;
  private CharacterField fieldE01GLSOF2 = null;
  private CharacterField fieldE01GLSTIP = null;
  private CharacterField fieldE01GLSMOV = null;
  private CharacterField fieldE01GLSRES = null;
  private CharacterField fieldE01GLSCAU = null;

  /**
  * Constructor for EST097001Message.
  */
  public EST097001Message()
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
    recordsize = 495;
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
    fields[9] = fieldE01REPSIS =
    new CharacterField(message, HEADERSIZE + 42, 4, "E01REPSIS");
    fields[10] = fieldE01REPFDA =
    new DecimalField(message, HEADERSIZE + 46, 5, 0, "E01REPFDA");
    fields[11] = fieldE01REPFDM =
    new DecimalField(message, HEADERSIZE + 51, 3, 0, "E01REPFDM");
    fields[12] = fieldE01REPFDD =
    new DecimalField(message, HEADERSIZE + 54, 3, 0, "E01REPFDD");
    fields[13] = fieldE01REPFHA =
    new DecimalField(message, HEADERSIZE + 57, 5, 0, "E01REPFHA");
    fields[14] = fieldE01REPFHM =
    new DecimalField(message, HEADERSIZE + 62, 3, 0, "E01REPFHM");
    fields[15] = fieldE01REPFHD =
    new DecimalField(message, HEADERSIZE + 65, 3, 0, "E01REPFHD");
    fields[16] = fieldE01REPGLO =
    new CharacterField(message, HEADERSIZE + 68, 30, "E01REPGLO");
    fields[17] = fieldE01REPMOD =
    new CharacterField(message, HEADERSIZE + 98, 1, "E01REPMOD");
    fields[18] = fieldE01REPARC =
    new CharacterField(message, HEADERSIZE + 99, 10, "E01REPARC");
    fields[19] = fieldE01REPIMP =
    new CharacterField(message, HEADERSIZE + 109, 2, "E01REPIMP");
    fields[20] = fieldE01REPBAN =
    new CharacterField(message, HEADERSIZE + 111, 2, "E01REPBAN");
    fields[21] = fieldE01REPREG =
    new DecimalField(message, HEADERSIZE + 113, 13, 0, "E01REPREG");
    fields[22] = fieldE01REPMTO =
    new DecimalField(message, HEADERSIZE + 126, 17, 2, "E01REPMTO");
    fields[23] = fieldE01REPBRN =
    new DecimalField(message, HEADERSIZE + 143, 4, 0, "E01REPBRN");
    fields[24] = fieldE01REPCUN =
    new DecimalField(message, HEADERSIZE + 147, 10, 0, "E01REPCUN");
    fields[25] = fieldE01REPACC =
    new DecimalField(message, HEADERSIZE + 157, 13, 0, "E01REPACC");
    fields[26] = fieldE01REPTYP =
    new DecimalField(message, HEADERSIZE + 170, 3, 0, "E01REPTYP");
    fields[27] = fieldE01REPFCA =
    new DecimalField(message, HEADERSIZE + 173, 5, 0, "E01REPFCA");
    fields[28] = fieldE01REPFCM =
    new DecimalField(message, HEADERSIZE + 178, 3, 0, "E01REPFCM");
    fields[29] = fieldE01REPFCD =
    new DecimalField(message, HEADERSIZE + 181, 3, 0, "E01REPFCD");
    fields[30] = fieldE01REPFVA =
    new DecimalField(message, HEADERSIZE + 184, 5, 0, "E01REPFVA");
    fields[31] = fieldE01REPFVM =
    new DecimalField(message, HEADERSIZE + 189, 3, 0, "E01REPFVM");
    fields[32] = fieldE01REPFVD =
    new DecimalField(message, HEADERSIZE + 192, 3, 0, "E01REPFVD");
    fields[33] = fieldE01REPMON =
    new DecimalField(message, HEADERSIZE + 195, 17, 2, "E01REPMON");
    fields[34] = fieldE01REPCCY =
    new CharacterField(message, HEADERSIZE + 212, 3, "E01REPCCY");
    fields[35] = fieldE01REPINS =
    new DecimalField(message, HEADERSIZE + 215, 2, 0, "E01REPINS");
    fields[36] = fieldE01REPTPR =
    new CharacterField(message, HEADERSIZE + 217, 4, "E01REPTPR");
    fields[37] = fieldE01REPNOP =
    new CharacterField(message, HEADERSIZE + 221, 15, "E01REPNOP");
    fields[38] = fieldE01REPNCU =
    new CharacterField(message, HEADERSIZE + 236, 6, "E01REPNCU");
    fields[39] = fieldE01REPVCO =
    new DecimalField(message, HEADERSIZE + 242, 9, 0, "E01REPVCO");
    fields[40] = fieldE01REPGLS =
    new CharacterField(message, HEADERSIZE + 251, 30, "E01REPGLS");
    fields[41] = fieldE01REPMTV =
    new DecimalField(message, HEADERSIZE + 281, 5, 0, "E01REPMTV");
    fields[42] = fieldE01REPRES =
    new CharacterField(message, HEADERSIZE + 286, 1, "E01REPRES");
    fields[43] = fieldE01REPCRE =
    new CharacterField(message, HEADERSIZE + 287, 1, "E01REPCRE");
    fields[44] = fieldE01NOMCLI =
    new CharacterField(message, HEADERSIZE + 288, 35, "E01NOMCLI");
    fields[45] = fieldE01PRODUC =
    new CharacterField(message, HEADERSIZE + 323, 4, "E01PRODUC");
    fields[46] = fieldE01GLSPRO =
    new CharacterField(message, HEADERSIZE + 327, 20, "E01GLSPRO");
    fields[47] = fieldE01GLSCMO =
    new CharacterField(message, HEADERSIZE + 347, 20, "E01GLSCMO");
    fields[48] = fieldE01OFICI1 =
    new CharacterField(message, HEADERSIZE + 367, 4, "E01OFICI1");
    fields[49] = fieldE01GLSOF1 =
    new CharacterField(message, HEADERSIZE + 371, 20, "E01GLSOF1");
    fields[50] = fieldE01OFICI2 =
    new CharacterField(message, HEADERSIZE + 391, 4, "E01OFICI2");
    fields[51] = fieldE01GLSOF2 =
    new CharacterField(message, HEADERSIZE + 395, 20, "E01GLSOF2");
    fields[52] = fieldE01GLSTIP =
    new CharacterField(message, HEADERSIZE + 415, 20, "E01GLSTIP");
    fields[53] = fieldE01GLSMOV =
    new CharacterField(message, HEADERSIZE + 435, 20, "E01GLSMOV");
    fields[54] = fieldE01GLSRES =
    new CharacterField(message, HEADERSIZE + 455, 20, "E01GLSRES");
    fields[55] = fieldE01GLSCAU =
    new CharacterField(message, HEADERSIZE + 475, 20, "E01GLSCAU");

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
  * Set field E01REPSIS using a String value.
  */
  public void setE01REPSIS(String newvalue)
  {
    fieldE01REPSIS.setString(newvalue);
  }

  /**
  * Get value of field E01REPSIS as a String.
  */
  public String getE01REPSIS()
  {
    return fieldE01REPSIS.getString();
  }

  /**
  * Set field E01REPFDA using a String value.
  */
  public void setE01REPFDA(String newvalue)
  {
    fieldE01REPFDA.setString(newvalue);
  }

  /**
  * Get value of field E01REPFDA as a String.
  */
  public String getE01REPFDA()
  {
    return fieldE01REPFDA.getString();
  }

  /**
  * Set numeric field E01REPFDA using a BigDecimal value.
  */
  public void setE01REPFDA(BigDecimal newvalue)
  {
    fieldE01REPFDA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01REPFDA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01REPFDA()
  {
    return fieldE01REPFDA.getBigDecimal();
  }

  /**
  * Set field E01REPFDM using a String value.
  */
  public void setE01REPFDM(String newvalue)
  {
    fieldE01REPFDM.setString(newvalue);
  }

  /**
  * Get value of field E01REPFDM as a String.
  */
  public String getE01REPFDM()
  {
    return fieldE01REPFDM.getString();
  }

  /**
  * Set numeric field E01REPFDM using a BigDecimal value.
  */
  public void setE01REPFDM(BigDecimal newvalue)
  {
    fieldE01REPFDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01REPFDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01REPFDM()
  {
    return fieldE01REPFDM.getBigDecimal();
  }

  /**
  * Set field E01REPFDD using a String value.
  */
  public void setE01REPFDD(String newvalue)
  {
    fieldE01REPFDD.setString(newvalue);
  }

  /**
  * Get value of field E01REPFDD as a String.
  */
  public String getE01REPFDD()
  {
    return fieldE01REPFDD.getString();
  }

  /**
  * Set numeric field E01REPFDD using a BigDecimal value.
  */
  public void setE01REPFDD(BigDecimal newvalue)
  {
    fieldE01REPFDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01REPFDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01REPFDD()
  {
    return fieldE01REPFDD.getBigDecimal();
  }

  /**
  * Set field E01REPFHA using a String value.
  */
  public void setE01REPFHA(String newvalue)
  {
    fieldE01REPFHA.setString(newvalue);
  }

  /**
  * Get value of field E01REPFHA as a String.
  */
  public String getE01REPFHA()
  {
    return fieldE01REPFHA.getString();
  }

  /**
  * Set numeric field E01REPFHA using a BigDecimal value.
  */
  public void setE01REPFHA(BigDecimal newvalue)
  {
    fieldE01REPFHA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01REPFHA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01REPFHA()
  {
    return fieldE01REPFHA.getBigDecimal();
  }

  /**
  * Set field E01REPFHM using a String value.
  */
  public void setE01REPFHM(String newvalue)
  {
    fieldE01REPFHM.setString(newvalue);
  }

  /**
  * Get value of field E01REPFHM as a String.
  */
  public String getE01REPFHM()
  {
    return fieldE01REPFHM.getString();
  }

  /**
  * Set numeric field E01REPFHM using a BigDecimal value.
  */
  public void setE01REPFHM(BigDecimal newvalue)
  {
    fieldE01REPFHM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01REPFHM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01REPFHM()
  {
    return fieldE01REPFHM.getBigDecimal();
  }

  /**
  * Set field E01REPFHD using a String value.
  */
  public void setE01REPFHD(String newvalue)
  {
    fieldE01REPFHD.setString(newvalue);
  }

  /**
  * Get value of field E01REPFHD as a String.
  */
  public String getE01REPFHD()
  {
    return fieldE01REPFHD.getString();
  }

  /**
  * Set numeric field E01REPFHD using a BigDecimal value.
  */
  public void setE01REPFHD(BigDecimal newvalue)
  {
    fieldE01REPFHD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01REPFHD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01REPFHD()
  {
    return fieldE01REPFHD.getBigDecimal();
  }

  /**
  * Set field E01REPGLO using a String value.
  */
  public void setE01REPGLO(String newvalue)
  {
    fieldE01REPGLO.setString(newvalue);
  }

  /**
  * Get value of field E01REPGLO as a String.
  */
  public String getE01REPGLO()
  {
    return fieldE01REPGLO.getString();
  }

  /**
  * Set field E01REPMOD using a String value.
  */
  public void setE01REPMOD(String newvalue)
  {
    fieldE01REPMOD.setString(newvalue);
  }

  /**
  * Get value of field E01REPMOD as a String.
  */
  public String getE01REPMOD()
  {
    return fieldE01REPMOD.getString();
  }

  /**
  * Set field E01REPARC using a String value.
  */
  public void setE01REPARC(String newvalue)
  {
    fieldE01REPARC.setString(newvalue);
  }

  /**
  * Get value of field E01REPARC as a String.
  */
  public String getE01REPARC()
  {
    return fieldE01REPARC.getString();
  }

  /**
  * Set field E01REPIMP using a String value.
  */
  public void setE01REPIMP(String newvalue)
  {
    fieldE01REPIMP.setString(newvalue);
  }

  /**
  * Get value of field E01REPIMP as a String.
  */
  public String getE01REPIMP()
  {
    return fieldE01REPIMP.getString();
  }

  /**
  * Set field E01REPBAN using a String value.
  */
  public void setE01REPBAN(String newvalue)
  {
    fieldE01REPBAN.setString(newvalue);
  }

  /**
  * Get value of field E01REPBAN as a String.
  */
  public String getE01REPBAN()
  {
    return fieldE01REPBAN.getString();
  }

  /**
  * Set field E01REPREG using a String value.
  */
  public void setE01REPREG(String newvalue)
  {
    fieldE01REPREG.setString(newvalue);
  }

  /**
  * Get value of field E01REPREG as a String.
  */
  public String getE01REPREG()
  {
    return fieldE01REPREG.getString();
  }

  /**
  * Set numeric field E01REPREG using a BigDecimal value.
  */
  public void setE01REPREG(BigDecimal newvalue)
  {
    fieldE01REPREG.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01REPREG as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01REPREG()
  {
    return fieldE01REPREG.getBigDecimal();
  }

  /**
  * Set field E01REPMTO using a String value.
  */
  public void setE01REPMTO(String newvalue)
  {
    fieldE01REPMTO.setString(newvalue);
  }

  /**
  * Get value of field E01REPMTO as a String.
  */
  public String getE01REPMTO()
  {
    return fieldE01REPMTO.getString();
  }

  /**
  * Set numeric field E01REPMTO using a BigDecimal value.
  */
  public void setE01REPMTO(BigDecimal newvalue)
  {
    fieldE01REPMTO.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01REPMTO as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01REPMTO()
  {
    return fieldE01REPMTO.getBigDecimal();
  }

  /**
  * Set field E01REPBRN using a String value.
  */
  public void setE01REPBRN(String newvalue)
  {
    fieldE01REPBRN.setString(newvalue);
  }

  /**
  * Get value of field E01REPBRN as a String.
  */
  public String getE01REPBRN()
  {
    return fieldE01REPBRN.getString();
  }

  /**
  * Set numeric field E01REPBRN using a BigDecimal value.
  */
  public void setE01REPBRN(BigDecimal newvalue)
  {
    fieldE01REPBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01REPBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01REPBRN()
  {
    return fieldE01REPBRN.getBigDecimal();
  }

  /**
  * Set field E01REPCUN using a String value.
  */
  public void setE01REPCUN(String newvalue)
  {
    fieldE01REPCUN.setString(newvalue);
  }

  /**
  * Get value of field E01REPCUN as a String.
  */
  public String getE01REPCUN()
  {
    return fieldE01REPCUN.getString();
  }

  /**
  * Set numeric field E01REPCUN using a BigDecimal value.
  */
  public void setE01REPCUN(BigDecimal newvalue)
  {
    fieldE01REPCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01REPCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01REPCUN()
  {
    return fieldE01REPCUN.getBigDecimal();
  }

  /**
  * Set field E01REPACC using a String value.
  */
  public void setE01REPACC(String newvalue)
  {
    fieldE01REPACC.setString(newvalue);
  }

  /**
  * Get value of field E01REPACC as a String.
  */
  public String getE01REPACC()
  {
    return fieldE01REPACC.getString();
  }

  /**
  * Set numeric field E01REPACC using a BigDecimal value.
  */
  public void setE01REPACC(BigDecimal newvalue)
  {
    fieldE01REPACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01REPACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01REPACC()
  {
    return fieldE01REPACC.getBigDecimal();
  }

  /**
  * Set field E01REPTYP using a String value.
  */
  public void setE01REPTYP(String newvalue)
  {
    fieldE01REPTYP.setString(newvalue);
  }

  /**
  * Get value of field E01REPTYP as a String.
  */
  public String getE01REPTYP()
  {
    return fieldE01REPTYP.getString();
  }

  /**
  * Set numeric field E01REPTYP using a BigDecimal value.
  */
  public void setE01REPTYP(BigDecimal newvalue)
  {
    fieldE01REPTYP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01REPTYP as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01REPTYP()
  {
    return fieldE01REPTYP.getBigDecimal();
  }

  /**
  * Set field E01REPFCA using a String value.
  */
  public void setE01REPFCA(String newvalue)
  {
    fieldE01REPFCA.setString(newvalue);
  }

  /**
  * Get value of field E01REPFCA as a String.
  */
  public String getE01REPFCA()
  {
    return fieldE01REPFCA.getString();
  }

  /**
  * Set numeric field E01REPFCA using a BigDecimal value.
  */
  public void setE01REPFCA(BigDecimal newvalue)
  {
    fieldE01REPFCA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01REPFCA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01REPFCA()
  {
    return fieldE01REPFCA.getBigDecimal();
  }

  /**
  * Set field E01REPFCM using a String value.
  */
  public void setE01REPFCM(String newvalue)
  {
    fieldE01REPFCM.setString(newvalue);
  }

  /**
  * Get value of field E01REPFCM as a String.
  */
  public String getE01REPFCM()
  {
    return fieldE01REPFCM.getString();
  }

  /**
  * Set numeric field E01REPFCM using a BigDecimal value.
  */
  public void setE01REPFCM(BigDecimal newvalue)
  {
    fieldE01REPFCM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01REPFCM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01REPFCM()
  {
    return fieldE01REPFCM.getBigDecimal();
  }

  /**
  * Set field E01REPFCD using a String value.
  */
  public void setE01REPFCD(String newvalue)
  {
    fieldE01REPFCD.setString(newvalue);
  }

  /**
  * Get value of field E01REPFCD as a String.
  */
  public String getE01REPFCD()
  {
    return fieldE01REPFCD.getString();
  }

  /**
  * Set numeric field E01REPFCD using a BigDecimal value.
  */
  public void setE01REPFCD(BigDecimal newvalue)
  {
    fieldE01REPFCD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01REPFCD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01REPFCD()
  {
    return fieldE01REPFCD.getBigDecimal();
  }

  /**
  * Set field E01REPFVA using a String value.
  */
  public void setE01REPFVA(String newvalue)
  {
    fieldE01REPFVA.setString(newvalue);
  }

  /**
  * Get value of field E01REPFVA as a String.
  */
  public String getE01REPFVA()
  {
    return fieldE01REPFVA.getString();
  }

  /**
  * Set numeric field E01REPFVA using a BigDecimal value.
  */
  public void setE01REPFVA(BigDecimal newvalue)
  {
    fieldE01REPFVA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01REPFVA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01REPFVA()
  {
    return fieldE01REPFVA.getBigDecimal();
  }

  /**
  * Set field E01REPFVM using a String value.
  */
  public void setE01REPFVM(String newvalue)
  {
    fieldE01REPFVM.setString(newvalue);
  }

  /**
  * Get value of field E01REPFVM as a String.
  */
  public String getE01REPFVM()
  {
    return fieldE01REPFVM.getString();
  }

  /**
  * Set numeric field E01REPFVM using a BigDecimal value.
  */
  public void setE01REPFVM(BigDecimal newvalue)
  {
    fieldE01REPFVM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01REPFVM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01REPFVM()
  {
    return fieldE01REPFVM.getBigDecimal();
  }

  /**
  * Set field E01REPFVD using a String value.
  */
  public void setE01REPFVD(String newvalue)
  {
    fieldE01REPFVD.setString(newvalue);
  }

  /**
  * Get value of field E01REPFVD as a String.
  */
  public String getE01REPFVD()
  {
    return fieldE01REPFVD.getString();
  }

  /**
  * Set numeric field E01REPFVD using a BigDecimal value.
  */
  public void setE01REPFVD(BigDecimal newvalue)
  {
    fieldE01REPFVD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01REPFVD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01REPFVD()
  {
    return fieldE01REPFVD.getBigDecimal();
  }

  /**
  * Set field E01REPMON using a String value.
  */
  public void setE01REPMON(String newvalue)
  {
    fieldE01REPMON.setString(newvalue);
  }

  /**
  * Get value of field E01REPMON as a String.
  */
  public String getE01REPMON()
  {
    return fieldE01REPMON.getString();
  }

  /**
  * Set numeric field E01REPMON using a BigDecimal value.
  */
  public void setE01REPMON(BigDecimal newvalue)
  {
    fieldE01REPMON.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01REPMON as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01REPMON()
  {
    return fieldE01REPMON.getBigDecimal();
  }

  /**
  * Set field E01REPCCY using a String value.
  */
  public void setE01REPCCY(String newvalue)
  {
    fieldE01REPCCY.setString(newvalue);
  }

  /**
  * Get value of field E01REPCCY as a String.
  */
  public String getE01REPCCY()
  {
    return fieldE01REPCCY.getString();
  }

  /**
  * Set field E01REPINS using a String value.
  */
  public void setE01REPINS(String newvalue)
  {
    fieldE01REPINS.setString(newvalue);
  }

  /**
  * Get value of field E01REPINS as a String.
  */
  public String getE01REPINS()
  {
    return fieldE01REPINS.getString();
  }

  /**
  * Set numeric field E01REPINS using a BigDecimal value.
  */
  public void setE01REPINS(BigDecimal newvalue)
  {
    fieldE01REPINS.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01REPINS as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01REPINS()
  {
    return fieldE01REPINS.getBigDecimal();
  }

  /**
  * Set field E01REPTPR using a String value.
  */
  public void setE01REPTPR(String newvalue)
  {
    fieldE01REPTPR.setString(newvalue);
  }

  /**
  * Get value of field E01REPTPR as a String.
  */
  public String getE01REPTPR()
  {
    return fieldE01REPTPR.getString();
  }

  /**
  * Set field E01REPNOP using a String value.
  */
  public void setE01REPNOP(String newvalue)
  {
    fieldE01REPNOP.setString(newvalue);
  }

  /**
  * Get value of field E01REPNOP as a String.
  */
  public String getE01REPNOP()
  {
    return fieldE01REPNOP.getString();
  }

  /**
  * Set field E01REPNCU using a String value.
  */
  public void setE01REPNCU(String newvalue)
  {
    fieldE01REPNCU.setString(newvalue);
  }

  /**
  * Get value of field E01REPNCU as a String.
  */
  public String getE01REPNCU()
  {
    return fieldE01REPNCU.getString();
  }

  /**
  * Set field E01REPVCO using a String value.
  */
  public void setE01REPVCO(String newvalue)
  {
    fieldE01REPVCO.setString(newvalue);
  }

  /**
  * Get value of field E01REPVCO as a String.
  */
  public String getE01REPVCO()
  {
    return fieldE01REPVCO.getString();
  }

  /**
  * Set numeric field E01REPVCO using a BigDecimal value.
  */
  public void setE01REPVCO(BigDecimal newvalue)
  {
    fieldE01REPVCO.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01REPVCO as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01REPVCO()
  {
    return fieldE01REPVCO.getBigDecimal();
  }

  /**
  * Set field E01REPGLS using a String value.
  */
  public void setE01REPGLS(String newvalue)
  {
    fieldE01REPGLS.setString(newvalue);
  }

  /**
  * Get value of field E01REPGLS as a String.
  */
  public String getE01REPGLS()
  {
    return fieldE01REPGLS.getString();
  }

  /**
  * Set field E01REPMTV using a String value.
  */
  public void setE01REPMTV(String newvalue)
  {
    fieldE01REPMTV.setString(newvalue);
  }

  /**
  * Get value of field E01REPMTV as a String.
  */
  public String getE01REPMTV()
  {
    return fieldE01REPMTV.getString();
  }

  /**
  * Set numeric field E01REPMTV using a BigDecimal value.
  */
  public void setE01REPMTV(BigDecimal newvalue)
  {
    fieldE01REPMTV.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01REPMTV as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01REPMTV()
  {
    return fieldE01REPMTV.getBigDecimal();
  }

  /**
  * Set field E01REPRES using a String value.
  */
  public void setE01REPRES(String newvalue)
  {
    fieldE01REPRES.setString(newvalue);
  }

  /**
  * Get value of field E01REPRES as a String.
  */
  public String getE01REPRES()
  {
    return fieldE01REPRES.getString();
  }

  /**
  * Set field E01REPCRE using a String value.
  */
  public void setE01REPCRE(String newvalue)
  {
    fieldE01REPCRE.setString(newvalue);
  }

  /**
  * Get value of field E01REPCRE as a String.
  */
  public String getE01REPCRE()
  {
    return fieldE01REPCRE.getString();
  }

  /**
  * Set field E01NOMCLI using a String value.
  */
  public void setE01NOMCLI(String newvalue)
  {
    fieldE01NOMCLI.setString(newvalue);
  }

  /**
  * Get value of field E01NOMCLI as a String.
  */
  public String getE01NOMCLI()
  {
    return fieldE01NOMCLI.getString();
  }

  /**
  * Set field E01PRODUC using a String value.
  */
  public void setE01PRODUC(String newvalue)
  {
    fieldE01PRODUC.setString(newvalue);
  }

  /**
  * Get value of field E01PRODUC as a String.
  */
  public String getE01PRODUC()
  {
    return fieldE01PRODUC.getString();
  }

  /**
  * Set field E01GLSPRO using a String value.
  */
  public void setE01GLSPRO(String newvalue)
  {
    fieldE01GLSPRO.setString(newvalue);
  }

  /**
  * Get value of field E01GLSPRO as a String.
  */
  public String getE01GLSPRO()
  {
    return fieldE01GLSPRO.getString();
  }

  /**
  * Set field E01GLSCMO using a String value.
  */
  public void setE01GLSCMO(String newvalue)
  {
    fieldE01GLSCMO.setString(newvalue);
  }

  /**
  * Get value of field E01GLSCMO as a String.
  */
  public String getE01GLSCMO()
  {
    return fieldE01GLSCMO.getString();
  }

  /**
  * Set field E01OFICI1 using a String value.
  */
  public void setE01OFICI1(String newvalue)
  {
    fieldE01OFICI1.setString(newvalue);
  }

  /**
  * Get value of field E01OFICI1 as a String.
  */
  public String getE01OFICI1()
  {
    return fieldE01OFICI1.getString();
  }

  /**
  * Set field E01GLSOF1 using a String value.
  */
  public void setE01GLSOF1(String newvalue)
  {
    fieldE01GLSOF1.setString(newvalue);
  }

  /**
  * Get value of field E01GLSOF1 as a String.
  */
  public String getE01GLSOF1()
  {
    return fieldE01GLSOF1.getString();
  }

  /**
  * Set field E01OFICI2 using a String value.
  */
  public void setE01OFICI2(String newvalue)
  {
    fieldE01OFICI2.setString(newvalue);
  }

  /**
  * Get value of field E01OFICI2 as a String.
  */
  public String getE01OFICI2()
  {
    return fieldE01OFICI2.getString();
  }

  /**
  * Set field E01GLSOF2 using a String value.
  */
  public void setE01GLSOF2(String newvalue)
  {
    fieldE01GLSOF2.setString(newvalue);
  }

  /**
  * Get value of field E01GLSOF2 as a String.
  */
  public String getE01GLSOF2()
  {
    return fieldE01GLSOF2.getString();
  }

  /**
  * Set field E01GLSTIP using a String value.
  */
  public void setE01GLSTIP(String newvalue)
  {
    fieldE01GLSTIP.setString(newvalue);
  }

  /**
  * Get value of field E01GLSTIP as a String.
  */
  public String getE01GLSTIP()
  {
    return fieldE01GLSTIP.getString();
  }

  /**
  * Set field E01GLSMOV using a String value.
  */
  public void setE01GLSMOV(String newvalue)
  {
    fieldE01GLSMOV.setString(newvalue);
  }

  /**
  * Get value of field E01GLSMOV as a String.
  */
  public String getE01GLSMOV()
  {
    return fieldE01GLSMOV.getString();
  }

  /**
  * Set field E01GLSRES using a String value.
  */
  public void setE01GLSRES(String newvalue)
  {
    fieldE01GLSRES.setString(newvalue);
  }

  /**
  * Get value of field E01GLSRES as a String.
  */
  public String getE01GLSRES()
  {
    return fieldE01GLSRES.getString();
  }

  /**
  * Set field E01GLSCAU using a String value.
  */
  public void setE01GLSCAU(String newvalue)
  {
    fieldE01GLSCAU.setString(newvalue);
  }

  /**
  * Get value of field E01GLSCAU as a String.
  */
  public String getE01GLSCAU()
  {
    return fieldE01GLSCAU.getString();
  }

}
