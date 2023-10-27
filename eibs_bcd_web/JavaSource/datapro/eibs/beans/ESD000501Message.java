package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ESD000501 physical file definition.
* 
* File level identifier is 1130611113340.
* Record format level identifier is 3055818986C5D.
*/

public class ESD000501Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H01USR",
                                     "H01PGM",
                                     "H01TIM",
                                     "H01SCR",
                                     "H01OPE",
                                     "H01MAS",
                                     "H01WK1",
                                     "H01WK2",
                                     "H01WK3",
                                     "E01CNTBNK",
                                     "E01CNTGLR",
                                     "E01CNTDEM",
                                     "E01CNTAPI",
                                     "E01CNTGRF",
                                     "E01CNTGRT",
                                     "E01CNTMDB",
                                     "E01CNTMDF",
                                     "E01CNTOCT",
                                     "E01CNTMOD",
                                     "E01CNTCLC",
                                     "E01CNTCLN",
                                     "E01CNTCOD",
                                     "E01CNTDTF",
                                     "E01CNTLAN",
                                     "E01CNTMBR",
                                     "E01CNTTLM",
                                     "E01CNTDGA",
                                     "E01CNTMUL",
                                     "E01CNTFLA",
                                     "E01CNTNME",
                                     "E01CNTONM",
                                     "E01CNTADR",
                                     "E01CNTAD2",
                                     "E01CNTAD3",
                                     "E01CNTCTD",
                                     "E01CNTCID",
                                     "E01CNTBID",
                                     "E01CNTBI2",
                                     "E01CNTPHN",
                                     "E01CNTEMA",
                                     "E01CNTWEB",
                                     "E01CNTFYM",
                                     "E01CNTFYY",
                                     "E01CNTMCU",
                                     "E01CNTNPA",
                                     "E01CNTIBF",
                                     "E01CNTMFP",
                                     "E01CNTSEC",
                                     "E01CNTBUM",
                                     "E01CNTFSL",
                                     "E01CNTINT",
                                     "E01CNTGPD",
                                     "E01CNTPDP",
                                     "E01CNTCAT",
                                     "E01CNTANG",
                                     "E01CNTFL1",
                                     "E01CNTFL3",
                                     "E01CNTFL4",
                                     "E01CNTPVF",
                                     "E01CNTFG5",
                                     "E01CNTCTR",
                                     "E01CNTCTY"
                                   };
  final static String tnames[] = {
                                   "H01USR",
                                   "H01PGM",
                                   "H01TIM",
                                   "H01SCR",
                                   "H01OPE",
                                   "H01MAS",
                                   "H01WK1",
                                   "H01WK2",
                                   "H01WK3",
                                   "E01CNTBNK",
                                   "E01CNTGLR",
                                   "E01CNTDEM",
                                   "E01CNTAPI",
                                   "E01CNTGRF",
                                   "E01CNTGRT",
                                   "E01CNTMDB",
                                   "E01CNTMDF",
                                   "E01CNTOCT",
                                   "E01CNTMOD",
                                   "E01CNTCLC",
                                   "E01CNTCLN",
                                   "E01CNTCOD",
                                   "E01CNTDTF",
                                   "E01CNTLAN",
                                   "E01CNTMBR",
                                   "E01CNTTLM",
                                   "E01CNTDGA",
                                   "E01CNTMUL",
                                   "E01CNTFLA",
                                   "E01CNTNME",
                                   "E01CNTONM",
                                   "E01CNTADR",
                                   "E01CNTAD2",
                                   "E01CNTAD3",
                                   "E01CNTCTD",
                                   "E01CNTCID",
                                   "E01CNTBID",
                                   "E01CNTBI2",
                                   "E01CNTPHN",
                                   "E01CNTEMA",
                                   "E01CNTWEB",
                                   "E01CNTFYM",
                                   "E01CNTFYY",
                                   "E01CNTMCU",
                                   "E01CNTNPA",
                                   "E01CNTIBF",
                                   "E01CNTMFP",
                                   "E01CNTSEC",
                                   "E01CNTBUM",
                                   "E01CNTFSL",
                                   "E01CNTINT",
                                   "E01CNTGPD",
                                   "E01CNTPDP",
                                   "E01CNTCAT",
                                   "E01CNTANG",
                                   "E01CNTFL1",
                                   "E01CNTFL3",
                                   "E01CNTFL4",
                                   "E01CNTPVF",
                                   "E01CNTFG5",
                                   "E01CNTCTR",
                                   "E01CNTCTY"
                                 };
  final static String fid = "1130611113340";
  final static String rid = "3055818986C5D";
  final static String fmtname = "ESD000501";
  final int FIELDCOUNT = 62;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH01USR = null;
  private CharacterField fieldH01PGM = null;
  private CharacterField fieldH01TIM = null;
  private CharacterField fieldH01SCR = null;
  private CharacterField fieldH01OPE = null;
  private CharacterField fieldH01MAS = null;
  private CharacterField fieldH01WK1 = null;
  private CharacterField fieldH01WK2 = null;
  private CharacterField fieldH01WK3 = null;
  private CharacterField fieldE01CNTBNK = null;
  private CharacterField fieldE01CNTGLR = null;
  private DecimalField fieldE01CNTDEM = null;
  private CharacterField fieldE01CNTAPI = null;
  private DecimalField fieldE01CNTGRF = null;
  private DecimalField fieldE01CNTGRT = null;
  private DecimalField fieldE01CNTMDB = null;
  private DecimalField fieldE01CNTMDF = null;
  private CharacterField fieldE01CNTOCT = null;
  private CharacterField fieldE01CNTMOD = null;
  private CharacterField fieldE01CNTCLC = null;
  private CharacterField fieldE01CNTCLN = null;
  private CharacterField fieldE01CNTCOD = null;
  private CharacterField fieldE01CNTDTF = null;
  private CharacterField fieldE01CNTLAN = null;
  private CharacterField fieldE01CNTMBR = null;
  private CharacterField fieldE01CNTTLM = null;
  private DecimalField fieldE01CNTDGA = null;
  private CharacterField fieldE01CNTMUL = null;
  private CharacterField fieldE01CNTFLA = null;
  private CharacterField fieldE01CNTNME = null;
  private CharacterField fieldE01CNTONM = null;
  private CharacterField fieldE01CNTADR = null;
  private CharacterField fieldE01CNTAD2 = null;
  private CharacterField fieldE01CNTAD3 = null;
  private CharacterField fieldE01CNTCTD = null;
  private CharacterField fieldE01CNTCID = null;
  private CharacterField fieldE01CNTBID = null;
  private CharacterField fieldE01CNTBI2 = null;
  private DecimalField fieldE01CNTPHN = null;
  private CharacterField fieldE01CNTEMA = null;
  private CharacterField fieldE01CNTWEB = null;
  private DecimalField fieldE01CNTFYM = null;
  private DecimalField fieldE01CNTFYY = null;
  private CharacterField fieldE01CNTMCU = null;
  private CharacterField fieldE01CNTNPA = null;
  private CharacterField fieldE01CNTIBF = null;
  private CharacterField fieldE01CNTMFP = null;
  private CharacterField fieldE01CNTSEC = null;
  private CharacterField fieldE01CNTBUM = null;
  private CharacterField fieldE01CNTFSL = null;
  private CharacterField fieldE01CNTINT = null;
  private DecimalField fieldE01CNTGPD = null;
  private CharacterField fieldE01CNTPDP = null;
  private CharacterField fieldE01CNTCAT = null;
  private CharacterField fieldE01CNTANG = null;
  private CharacterField fieldE01CNTFL1 = null;
  private CharacterField fieldE01CNTFL3 = null;
  private CharacterField fieldE01CNTFL4 = null;
  private CharacterField fieldE01CNTPVF = null;
  private CharacterField fieldE01CNTFG5 = null;
  private CharacterField fieldE01CNTCTR = null;
  private CharacterField fieldE01CNTCTY = null;

  /**
  * Constructor for ESD000501Message.
  */
  public ESD000501Message()
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
    recordsize = 629;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH01USR =
    new CharacterField(message, HEADERSIZE + 0, 10, "H01USR");
    fields[1] = fieldH01PGM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H01PGM");
    fields[2] = fieldH01TIM =
    new CharacterField(message, HEADERSIZE + 20, 12, "H01TIM");
    fields[3] = fieldH01SCR =
    new CharacterField(message, HEADERSIZE + 32, 2, "H01SCR");
    fields[4] = fieldH01OPE =
    new CharacterField(message, HEADERSIZE + 34, 4, "H01OPE");
    fields[5] = fieldH01MAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H01MAS");
    fields[6] = fieldH01WK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H01WK1");
    fields[7] = fieldH01WK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H01WK2");
    fields[8] = fieldH01WK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H01WK3");
    fields[9] = fieldE01CNTBNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E01CNTBNK");
    fields[10] = fieldE01CNTGLR =
    new CharacterField(message, HEADERSIZE + 44, 1, "E01CNTGLR");
    fields[11] = fieldE01CNTDEM =
    new DecimalField(message, HEADERSIZE + 45, 2, 0, "E01CNTDEM");
    fields[12] = fieldE01CNTAPI =
    new CharacterField(message, HEADERSIZE + 47, 1, "E01CNTAPI");
    fields[13] = fieldE01CNTGRF =
    new DecimalField(message, HEADERSIZE + 48, 6, 0, "E01CNTGRF");
    fields[14] = fieldE01CNTGRT =
    new DecimalField(message, HEADERSIZE + 54, 6, 0, "E01CNTGRT");
    fields[15] = fieldE01CNTMDB =
    new DecimalField(message, HEADERSIZE + 60, 4, 0, "E01CNTMDB");
    fields[16] = fieldE01CNTMDF =
    new DecimalField(message, HEADERSIZE + 64, 4, 0, "E01CNTMDF");
    fields[17] = fieldE01CNTOCT =
    new CharacterField(message, HEADERSIZE + 68, 1, "E01CNTOCT");
    fields[18] = fieldE01CNTMOD =
    new CharacterField(message, HEADERSIZE + 69, 1, "E01CNTMOD");
    fields[19] = fieldE01CNTCLC =
    new CharacterField(message, HEADERSIZE + 70, 1, "E01CNTCLC");
    fields[20] = fieldE01CNTCLN =
    new CharacterField(message, HEADERSIZE + 71, 1, "E01CNTCLN");
    fields[21] = fieldE01CNTCOD =
    new CharacterField(message, HEADERSIZE + 72, 1, "E01CNTCOD");
    fields[22] = fieldE01CNTDTF =
    new CharacterField(message, HEADERSIZE + 73, 3, "E01CNTDTF");
    fields[23] = fieldE01CNTLAN =
    new CharacterField(message, HEADERSIZE + 76, 1, "E01CNTLAN");
    fields[24] = fieldE01CNTMBR =
    new CharacterField(message, HEADERSIZE + 77, 1, "E01CNTMBR");
    fields[25] = fieldE01CNTTLM =
    new CharacterField(message, HEADERSIZE + 78, 1, "E01CNTTLM");
    fields[26] = fieldE01CNTDGA =
    new DecimalField(message, HEADERSIZE + 79, 17, 0, "E01CNTDGA");
    fields[27] = fieldE01CNTMUL =
    new CharacterField(message, HEADERSIZE + 96, 1, "E01CNTMUL");
    fields[28] = fieldE01CNTFLA =
    new CharacterField(message, HEADERSIZE + 97, 1, "E01CNTFLA");
    fields[29] = fieldE01CNTNME =
    new CharacterField(message, HEADERSIZE + 98, 35, "E01CNTNME");
    fields[30] = fieldE01CNTONM =
    new CharacterField(message, HEADERSIZE + 133, 60, "E01CNTONM");
    fields[31] = fieldE01CNTADR =
    new CharacterField(message, HEADERSIZE + 193, 45, "E01CNTADR");
    fields[32] = fieldE01CNTAD2 =
    new CharacterField(message, HEADERSIZE + 238, 45, "E01CNTAD2");
    fields[33] = fieldE01CNTAD3 =
    new CharacterField(message, HEADERSIZE + 283, 45, "E01CNTAD3");
    fields[34] = fieldE01CNTCTD =
    new CharacterField(message, HEADERSIZE + 328, 35, "E01CNTCTD");
    fields[35] = fieldE01CNTCID =
    new CharacterField(message, HEADERSIZE + 363, 35, "E01CNTCID");
    fields[36] = fieldE01CNTBID =
    new CharacterField(message, HEADERSIZE + 398, 25, "E01CNTBID");
    fields[37] = fieldE01CNTBI2 =
    new CharacterField(message, HEADERSIZE + 423, 25, "E01CNTBI2");
    fields[38] = fieldE01CNTPHN =
    new DecimalField(message, HEADERSIZE + 448, 16, 0, "E01CNTPHN");
    fields[39] = fieldE01CNTEMA =
    new CharacterField(message, HEADERSIZE + 464, 60, "E01CNTEMA");
    fields[40] = fieldE01CNTWEB =
    new CharacterField(message, HEADERSIZE + 524, 60, "E01CNTWEB");
    fields[41] = fieldE01CNTFYM =
    new DecimalField(message, HEADERSIZE + 584, 3, 0, "E01CNTFYM");
    fields[42] = fieldE01CNTFYY =
    new DecimalField(message, HEADERSIZE + 587, 3, 0, "E01CNTFYY");
    fields[43] = fieldE01CNTMCU =
    new CharacterField(message, HEADERSIZE + 590, 1, "E01CNTMCU");
    fields[44] = fieldE01CNTNPA =
    new CharacterField(message, HEADERSIZE + 591, 2, "E01CNTNPA");
    fields[45] = fieldE01CNTIBF =
    new CharacterField(message, HEADERSIZE + 593, 1, "E01CNTIBF");
    fields[46] = fieldE01CNTMFP =
    new CharacterField(message, HEADERSIZE + 594, 1, "E01CNTMFP");
    fields[47] = fieldE01CNTSEC =
    new CharacterField(message, HEADERSIZE + 595, 1, "E01CNTSEC");
    fields[48] = fieldE01CNTBUM =
    new CharacterField(message, HEADERSIZE + 596, 10, "E01CNTBUM");
    fields[49] = fieldE01CNTFSL =
    new CharacterField(message, HEADERSIZE + 606, 1, "E01CNTFSL");
    fields[50] = fieldE01CNTINT =
    new CharacterField(message, HEADERSIZE + 607, 2, "E01CNTINT");
    fields[51] = fieldE01CNTGPD =
    new DecimalField(message, HEADERSIZE + 609, 4, 0, "E01CNTGPD");
    fields[52] = fieldE01CNTPDP =
    new CharacterField(message, HEADERSIZE + 613, 1, "E01CNTPDP");
    fields[53] = fieldE01CNTCAT =
    new CharacterField(message, HEADERSIZE + 614, 1, "E01CNTCAT");
    fields[54] = fieldE01CNTANG =
    new CharacterField(message, HEADERSIZE + 615, 1, "E01CNTANG");
    fields[55] = fieldE01CNTFL1 =
    new CharacterField(message, HEADERSIZE + 616, 1, "E01CNTFL1");
    fields[56] = fieldE01CNTFL3 =
    new CharacterField(message, HEADERSIZE + 617, 1, "E01CNTFL3");
    fields[57] = fieldE01CNTFL4 =
    new CharacterField(message, HEADERSIZE + 618, 1, "E01CNTFL4");
    fields[58] = fieldE01CNTPVF =
    new CharacterField(message, HEADERSIZE + 619, 1, "E01CNTPVF");
    fields[59] = fieldE01CNTFG5 =
    new CharacterField(message, HEADERSIZE + 620, 1, "E01CNTFG5");
    fields[60] = fieldE01CNTCTR =
    new CharacterField(message, HEADERSIZE + 621, 4, "E01CNTCTR");
    fields[61] = fieldE01CNTCTY =
    new CharacterField(message, HEADERSIZE + 625, 4, "E01CNTCTY");

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
  * Set field H01USR using a String value.
  */
  public void setH01USR(String newvalue)
  {
    fieldH01USR.setString(newvalue);
  }

  /**
  * Get value of field H01USR as a String.
  */
  public String getH01USR()
  {
    return fieldH01USR.getString();
  }

  /**
  * Set field H01PGM using a String value.
  */
  public void setH01PGM(String newvalue)
  {
    fieldH01PGM.setString(newvalue);
  }

  /**
  * Get value of field H01PGM as a String.
  */
  public String getH01PGM()
  {
    return fieldH01PGM.getString();
  }

  /**
  * Set field H01TIM using a String value.
  */
  public void setH01TIM(String newvalue)
  {
    fieldH01TIM.setString(newvalue);
  }

  /**
  * Get value of field H01TIM as a String.
  */
  public String getH01TIM()
  {
    return fieldH01TIM.getString();
  }

  /**
  * Set field H01SCR using a String value.
  */
  public void setH01SCR(String newvalue)
  {
    fieldH01SCR.setString(newvalue);
  }

  /**
  * Get value of field H01SCR as a String.
  */
  public String getH01SCR()
  {
    return fieldH01SCR.getString();
  }

  /**
  * Set field H01OPE using a String value.
  */
  public void setH01OPE(String newvalue)
  {
    fieldH01OPE.setString(newvalue);
  }

  /**
  * Get value of field H01OPE as a String.
  */
  public String getH01OPE()
  {
    return fieldH01OPE.getString();
  }

  /**
  * Set field H01MAS using a String value.
  */
  public void setH01MAS(String newvalue)
  {
    fieldH01MAS.setString(newvalue);
  }

  /**
  * Get value of field H01MAS as a String.
  */
  public String getH01MAS()
  {
    return fieldH01MAS.getString();
  }

  /**
  * Set field H01WK1 using a String value.
  */
  public void setH01WK1(String newvalue)
  {
    fieldH01WK1.setString(newvalue);
  }

  /**
  * Get value of field H01WK1 as a String.
  */
  public String getH01WK1()
  {
    return fieldH01WK1.getString();
  }

  /**
  * Set field H01WK2 using a String value.
  */
  public void setH01WK2(String newvalue)
  {
    fieldH01WK2.setString(newvalue);
  }

  /**
  * Get value of field H01WK2 as a String.
  */
  public String getH01WK2()
  {
    return fieldH01WK2.getString();
  }

  /**
  * Set field H01WK3 using a String value.
  */
  public void setH01WK3(String newvalue)
  {
    fieldH01WK3.setString(newvalue);
  }

  /**
  * Get value of field H01WK3 as a String.
  */
  public String getH01WK3()
  {
    return fieldH01WK3.getString();
  }

  /**
  * Set field E01CNTBNK using a String value.
  */
  public void setE01CNTBNK(String newvalue)
  {
    fieldE01CNTBNK.setString(newvalue);
  }

  /**
  * Get value of field E01CNTBNK as a String.
  */
  public String getE01CNTBNK()
  {
    return fieldE01CNTBNK.getString();
  }

  /**
  * Set field E01CNTGLR using a String value.
  */
  public void setE01CNTGLR(String newvalue)
  {
    fieldE01CNTGLR.setString(newvalue);
  }

  /**
  * Get value of field E01CNTGLR as a String.
  */
  public String getE01CNTGLR()
  {
    return fieldE01CNTGLR.getString();
  }

  /**
  * Set field E01CNTDEM using a String value.
  */
  public void setE01CNTDEM(String newvalue)
  {
    fieldE01CNTDEM.setString(newvalue);
  }

  /**
  * Get value of field E01CNTDEM as a String.
  */
  public String getE01CNTDEM()
  {
    return fieldE01CNTDEM.getString();
  }

  /**
  * Set numeric field E01CNTDEM using a BigDecimal value.
  */
  public void setE01CNTDEM(BigDecimal newvalue)
  {
    fieldE01CNTDEM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CNTDEM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CNTDEM()
  {
    return fieldE01CNTDEM.getBigDecimal();
  }

  /**
  * Set field E01CNTAPI using a String value.
  */
  public void setE01CNTAPI(String newvalue)
  {
    fieldE01CNTAPI.setString(newvalue);
  }

  /**
  * Get value of field E01CNTAPI as a String.
  */
  public String getE01CNTAPI()
  {
    return fieldE01CNTAPI.getString();
  }

  /**
  * Set field E01CNTGRF using a String value.
  */
  public void setE01CNTGRF(String newvalue)
  {
    fieldE01CNTGRF.setString(newvalue);
  }

  /**
  * Get value of field E01CNTGRF as a String.
  */
  public String getE01CNTGRF()
  {
    return fieldE01CNTGRF.getString();
  }

  /**
  * Set numeric field E01CNTGRF using a BigDecimal value.
  */
  public void setE01CNTGRF(BigDecimal newvalue)
  {
    fieldE01CNTGRF.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CNTGRF as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CNTGRF()
  {
    return fieldE01CNTGRF.getBigDecimal();
  }

  /**
  * Set field E01CNTGRT using a String value.
  */
  public void setE01CNTGRT(String newvalue)
  {
    fieldE01CNTGRT.setString(newvalue);
  }

  /**
  * Get value of field E01CNTGRT as a String.
  */
  public String getE01CNTGRT()
  {
    return fieldE01CNTGRT.getString();
  }

  /**
  * Set numeric field E01CNTGRT using a BigDecimal value.
  */
  public void setE01CNTGRT(BigDecimal newvalue)
  {
    fieldE01CNTGRT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CNTGRT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CNTGRT()
  {
    return fieldE01CNTGRT.getBigDecimal();
  }

  /**
  * Set field E01CNTMDB using a String value.
  */
  public void setE01CNTMDB(String newvalue)
  {
    fieldE01CNTMDB.setString(newvalue);
  }

  /**
  * Get value of field E01CNTMDB as a String.
  */
  public String getE01CNTMDB()
  {
    return fieldE01CNTMDB.getString();
  }

  /**
  * Set numeric field E01CNTMDB using a BigDecimal value.
  */
  public void setE01CNTMDB(BigDecimal newvalue)
  {
    fieldE01CNTMDB.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CNTMDB as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CNTMDB()
  {
    return fieldE01CNTMDB.getBigDecimal();
  }

  /**
  * Set field E01CNTMDF using a String value.
  */
  public void setE01CNTMDF(String newvalue)
  {
    fieldE01CNTMDF.setString(newvalue);
  }

  /**
  * Get value of field E01CNTMDF as a String.
  */
  public String getE01CNTMDF()
  {
    return fieldE01CNTMDF.getString();
  }

  /**
  * Set numeric field E01CNTMDF using a BigDecimal value.
  */
  public void setE01CNTMDF(BigDecimal newvalue)
  {
    fieldE01CNTMDF.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CNTMDF as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CNTMDF()
  {
    return fieldE01CNTMDF.getBigDecimal();
  }

  /**
  * Set field E01CNTOCT using a String value.
  */
  public void setE01CNTOCT(String newvalue)
  {
    fieldE01CNTOCT.setString(newvalue);
  }

  /**
  * Get value of field E01CNTOCT as a String.
  */
  public String getE01CNTOCT()
  {
    return fieldE01CNTOCT.getString();
  }

  /**
  * Set field E01CNTMOD using a String value.
  */
  public void setE01CNTMOD(String newvalue)
  {
    fieldE01CNTMOD.setString(newvalue);
  }

  /**
  * Get value of field E01CNTMOD as a String.
  */
  public String getE01CNTMOD()
  {
    return fieldE01CNTMOD.getString();
  }

  /**
  * Set field E01CNTCLC using a String value.
  */
  public void setE01CNTCLC(String newvalue)
  {
    fieldE01CNTCLC.setString(newvalue);
  }

  /**
  * Get value of field E01CNTCLC as a String.
  */
  public String getE01CNTCLC()
  {
    return fieldE01CNTCLC.getString();
  }

  /**
  * Set field E01CNTCLN using a String value.
  */
  public void setE01CNTCLN(String newvalue)
  {
    fieldE01CNTCLN.setString(newvalue);
  }

  /**
  * Get value of field E01CNTCLN as a String.
  */
  public String getE01CNTCLN()
  {
    return fieldE01CNTCLN.getString();
  }

  /**
  * Set field E01CNTCOD using a String value.
  */
  public void setE01CNTCOD(String newvalue)
  {
    fieldE01CNTCOD.setString(newvalue);
  }

  /**
  * Get value of field E01CNTCOD as a String.
  */
  public String getE01CNTCOD()
  {
    return fieldE01CNTCOD.getString();
  }

  /**
  * Set field E01CNTDTF using a String value.
  */
  public void setE01CNTDTF(String newvalue)
  {
    fieldE01CNTDTF.setString(newvalue);
  }

  /**
  * Get value of field E01CNTDTF as a String.
  */
  public String getE01CNTDTF()
  {
    return fieldE01CNTDTF.getString();
  }

  /**
  * Set field E01CNTLAN using a String value.
  */
  public void setE01CNTLAN(String newvalue)
  {
    fieldE01CNTLAN.setString(newvalue);
  }

  /**
  * Get value of field E01CNTLAN as a String.
  */
  public String getE01CNTLAN()
  {
    return fieldE01CNTLAN.getString();
  }

  /**
  * Set field E01CNTMBR using a String value.
  */
  public void setE01CNTMBR(String newvalue)
  {
    fieldE01CNTMBR.setString(newvalue);
  }

  /**
  * Get value of field E01CNTMBR as a String.
  */
  public String getE01CNTMBR()
  {
    return fieldE01CNTMBR.getString();
  }

  /**
  * Set field E01CNTTLM using a String value.
  */
  public void setE01CNTTLM(String newvalue)
  {
    fieldE01CNTTLM.setString(newvalue);
  }

  /**
  * Get value of field E01CNTTLM as a String.
  */
  public String getE01CNTTLM()
  {
    return fieldE01CNTTLM.getString();
  }

  /**
  * Set field E01CNTDGA using a String value.
  */
  public void setE01CNTDGA(String newvalue)
  {
    fieldE01CNTDGA.setString(newvalue);
  }

  /**
  * Get value of field E01CNTDGA as a String.
  */
  public String getE01CNTDGA()
  {
    return fieldE01CNTDGA.getString();
  }

  /**
  * Set numeric field E01CNTDGA using a BigDecimal value.
  */
  public void setE01CNTDGA(BigDecimal newvalue)
  {
    fieldE01CNTDGA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CNTDGA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CNTDGA()
  {
    return fieldE01CNTDGA.getBigDecimal();
  }

  /**
  * Set field E01CNTMUL using a String value.
  */
  public void setE01CNTMUL(String newvalue)
  {
    fieldE01CNTMUL.setString(newvalue);
  }

  /**
  * Get value of field E01CNTMUL as a String.
  */
  public String getE01CNTMUL()
  {
    return fieldE01CNTMUL.getString();
  }

  /**
  * Set field E01CNTFLA using a String value.
  */
  public void setE01CNTFLA(String newvalue)
  {
    fieldE01CNTFLA.setString(newvalue);
  }

  /**
  * Get value of field E01CNTFLA as a String.
  */
  public String getE01CNTFLA()
  {
    return fieldE01CNTFLA.getString();
  }

  /**
  * Set field E01CNTNME using a String value.
  */
  public void setE01CNTNME(String newvalue)
  {
    fieldE01CNTNME.setString(newvalue);
  }

  /**
  * Get value of field E01CNTNME as a String.
  */
  public String getE01CNTNME()
  {
    return fieldE01CNTNME.getString();
  }

  /**
  * Set field E01CNTONM using a String value.
  */
  public void setE01CNTONM(String newvalue)
  {
    fieldE01CNTONM.setString(newvalue);
  }

  /**
  * Get value of field E01CNTONM as a String.
  */
  public String getE01CNTONM()
  {
    return fieldE01CNTONM.getString();
  }

  /**
  * Set field E01CNTADR using a String value.
  */
  public void setE01CNTADR(String newvalue)
  {
    fieldE01CNTADR.setString(newvalue);
  }

  /**
  * Get value of field E01CNTADR as a String.
  */
  public String getE01CNTADR()
  {
    return fieldE01CNTADR.getString();
  }

  /**
  * Set field E01CNTAD2 using a String value.
  */
  public void setE01CNTAD2(String newvalue)
  {
    fieldE01CNTAD2.setString(newvalue);
  }

  /**
  * Get value of field E01CNTAD2 as a String.
  */
  public String getE01CNTAD2()
  {
    return fieldE01CNTAD2.getString();
  }

  /**
  * Set field E01CNTAD3 using a String value.
  */
  public void setE01CNTAD3(String newvalue)
  {
    fieldE01CNTAD3.setString(newvalue);
  }

  /**
  * Get value of field E01CNTAD3 as a String.
  */
  public String getE01CNTAD3()
  {
    return fieldE01CNTAD3.getString();
  }

  /**
  * Set field E01CNTCTD using a String value.
  */
  public void setE01CNTCTD(String newvalue)
  {
    fieldE01CNTCTD.setString(newvalue);
  }

  /**
  * Get value of field E01CNTCTD as a String.
  */
  public String getE01CNTCTD()
  {
    return fieldE01CNTCTD.getString();
  }

  /**
  * Set field E01CNTCID using a String value.
  */
  public void setE01CNTCID(String newvalue)
  {
    fieldE01CNTCID.setString(newvalue);
  }

  /**
  * Get value of field E01CNTCID as a String.
  */
  public String getE01CNTCID()
  {
    return fieldE01CNTCID.getString();
  }

  /**
  * Set field E01CNTBID using a String value.
  */
  public void setE01CNTBID(String newvalue)
  {
    fieldE01CNTBID.setString(newvalue);
  }

  /**
  * Get value of field E01CNTBID as a String.
  */
  public String getE01CNTBID()
  {
    return fieldE01CNTBID.getString();
  }

  /**
  * Set field E01CNTBI2 using a String value.
  */
  public void setE01CNTBI2(String newvalue)
  {
    fieldE01CNTBI2.setString(newvalue);
  }

  /**
  * Get value of field E01CNTBI2 as a String.
  */
  public String getE01CNTBI2()
  {
    return fieldE01CNTBI2.getString();
  }

  /**
  * Set field E01CNTPHN using a String value.
  */
  public void setE01CNTPHN(String newvalue)
  {
    fieldE01CNTPHN.setString(newvalue);
  }

  /**
  * Get value of field E01CNTPHN as a String.
  */
  public String getE01CNTPHN()
  {
    return fieldE01CNTPHN.getString();
  }

  /**
  * Set numeric field E01CNTPHN using a BigDecimal value.
  */
  public void setE01CNTPHN(BigDecimal newvalue)
  {
    fieldE01CNTPHN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CNTPHN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CNTPHN()
  {
    return fieldE01CNTPHN.getBigDecimal();
  }

  /**
  * Set field E01CNTEMA using a String value.
  */
  public void setE01CNTEMA(String newvalue)
  {
    fieldE01CNTEMA.setString(newvalue);
  }

  /**
  * Get value of field E01CNTEMA as a String.
  */
  public String getE01CNTEMA()
  {
    return fieldE01CNTEMA.getString();
  }

  /**
  * Set field E01CNTWEB using a String value.
  */
  public void setE01CNTWEB(String newvalue)
  {
    fieldE01CNTWEB.setString(newvalue);
  }

  /**
  * Get value of field E01CNTWEB as a String.
  */
  public String getE01CNTWEB()
  {
    return fieldE01CNTWEB.getString();
  }

  /**
  * Set field E01CNTFYM using a String value.
  */
  public void setE01CNTFYM(String newvalue)
  {
    fieldE01CNTFYM.setString(newvalue);
  }

  /**
  * Get value of field E01CNTFYM as a String.
  */
  public String getE01CNTFYM()
  {
    return fieldE01CNTFYM.getString();
  }

  /**
  * Set numeric field E01CNTFYM using a BigDecimal value.
  */
  public void setE01CNTFYM(BigDecimal newvalue)
  {
    fieldE01CNTFYM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CNTFYM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CNTFYM()
  {
    return fieldE01CNTFYM.getBigDecimal();
  }

  /**
  * Set field E01CNTFYY using a String value.
  */
  public void setE01CNTFYY(String newvalue)
  {
    fieldE01CNTFYY.setString(newvalue);
  }

  /**
  * Get value of field E01CNTFYY as a String.
  */
  public String getE01CNTFYY()
  {
    return fieldE01CNTFYY.getString();
  }

  /**
  * Set numeric field E01CNTFYY using a BigDecimal value.
  */
  public void setE01CNTFYY(BigDecimal newvalue)
  {
    fieldE01CNTFYY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CNTFYY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CNTFYY()
  {
    return fieldE01CNTFYY.getBigDecimal();
  }

  /**
  * Set field E01CNTMCU using a String value.
  */
  public void setE01CNTMCU(String newvalue)
  {
    fieldE01CNTMCU.setString(newvalue);
  }

  /**
  * Get value of field E01CNTMCU as a String.
  */
  public String getE01CNTMCU()
  {
    return fieldE01CNTMCU.getString();
  }

  /**
  * Set field E01CNTNPA using a String value.
  */
  public void setE01CNTNPA(String newvalue)
  {
    fieldE01CNTNPA.setString(newvalue);
  }

  /**
  * Get value of field E01CNTNPA as a String.
  */
  public String getE01CNTNPA()
  {
    return fieldE01CNTNPA.getString();
  }

  /**
  * Set field E01CNTIBF using a String value.
  */
  public void setE01CNTIBF(String newvalue)
  {
    fieldE01CNTIBF.setString(newvalue);
  }

  /**
  * Get value of field E01CNTIBF as a String.
  */
  public String getE01CNTIBF()
  {
    return fieldE01CNTIBF.getString();
  }

  /**
  * Set field E01CNTMFP using a String value.
  */
  public void setE01CNTMFP(String newvalue)
  {
    fieldE01CNTMFP.setString(newvalue);
  }

  /**
  * Get value of field E01CNTMFP as a String.
  */
  public String getE01CNTMFP()
  {
    return fieldE01CNTMFP.getString();
  }

  /**
  * Set field E01CNTSEC using a String value.
  */
  public void setE01CNTSEC(String newvalue)
  {
    fieldE01CNTSEC.setString(newvalue);
  }

  /**
  * Get value of field E01CNTSEC as a String.
  */
  public String getE01CNTSEC()
  {
    return fieldE01CNTSEC.getString();
  }

  /**
  * Set field E01CNTBUM using a String value.
  */
  public void setE01CNTBUM(String newvalue)
  {
    fieldE01CNTBUM.setString(newvalue);
  }

  /**
  * Get value of field E01CNTBUM as a String.
  */
  public String getE01CNTBUM()
  {
    return fieldE01CNTBUM.getString();
  }

  /**
  * Set field E01CNTFSL using a String value.
  */
  public void setE01CNTFSL(String newvalue)
  {
    fieldE01CNTFSL.setString(newvalue);
  }

  /**
  * Get value of field E01CNTFSL as a String.
  */
  public String getE01CNTFSL()
  {
    return fieldE01CNTFSL.getString();
  }

  /**
  * Set field E01CNTINT using a String value.
  */
  public void setE01CNTINT(String newvalue)
  {
    fieldE01CNTINT.setString(newvalue);
  }

  /**
  * Get value of field E01CNTINT as a String.
  */
  public String getE01CNTINT()
  {
    return fieldE01CNTINT.getString();
  }

  /**
  * Set field E01CNTGPD using a String value.
  */
  public void setE01CNTGPD(String newvalue)
  {
    fieldE01CNTGPD.setString(newvalue);
  }

  /**
  * Get value of field E01CNTGPD as a String.
  */
  public String getE01CNTGPD()
  {
    return fieldE01CNTGPD.getString();
  }

  /**
  * Set numeric field E01CNTGPD using a BigDecimal value.
  */
  public void setE01CNTGPD(BigDecimal newvalue)
  {
    fieldE01CNTGPD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CNTGPD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CNTGPD()
  {
    return fieldE01CNTGPD.getBigDecimal();
  }

  /**
  * Set field E01CNTPDP using a String value.
  */
  public void setE01CNTPDP(String newvalue)
  {
    fieldE01CNTPDP.setString(newvalue);
  }

  /**
  * Get value of field E01CNTPDP as a String.
  */
  public String getE01CNTPDP()
  {
    return fieldE01CNTPDP.getString();
  }

  /**
  * Set field E01CNTCAT using a String value.
  */
  public void setE01CNTCAT(String newvalue)
  {
    fieldE01CNTCAT.setString(newvalue);
  }

  /**
  * Get value of field E01CNTCAT as a String.
  */
  public String getE01CNTCAT()
  {
    return fieldE01CNTCAT.getString();
  }

  /**
  * Set field E01CNTANG using a String value.
  */
  public void setE01CNTANG(String newvalue)
  {
    fieldE01CNTANG.setString(newvalue);
  }

  /**
  * Get value of field E01CNTANG as a String.
  */
  public String getE01CNTANG()
  {
    return fieldE01CNTANG.getString();
  }

  /**
  * Set field E01CNTFL1 using a String value.
  */
  public void setE01CNTFL1(String newvalue)
  {
    fieldE01CNTFL1.setString(newvalue);
  }

  /**
  * Get value of field E01CNTFL1 as a String.
  */
  public String getE01CNTFL1()
  {
    return fieldE01CNTFL1.getString();
  }

  /**
  * Set field E01CNTFL3 using a String value.
  */
  public void setE01CNTFL3(String newvalue)
  {
    fieldE01CNTFL3.setString(newvalue);
  }

  /**
  * Get value of field E01CNTFL3 as a String.
  */
  public String getE01CNTFL3()
  {
    return fieldE01CNTFL3.getString();
  }

  /**
  * Set field E01CNTFL4 using a String value.
  */
  public void setE01CNTFL4(String newvalue)
  {
    fieldE01CNTFL4.setString(newvalue);
  }

  /**
  * Get value of field E01CNTFL4 as a String.
  */
  public String getE01CNTFL4()
  {
    return fieldE01CNTFL4.getString();
  }

  /**
  * Set field E01CNTPVF using a String value.
  */
  public void setE01CNTPVF(String newvalue)
  {
    fieldE01CNTPVF.setString(newvalue);
  }

  /**
  * Get value of field E01CNTPVF as a String.
  */
  public String getE01CNTPVF()
  {
    return fieldE01CNTPVF.getString();
  }

  /**
  * Set field E01CNTFG5 using a String value.
  */
  public void setE01CNTFG5(String newvalue)
  {
    fieldE01CNTFG5.setString(newvalue);
  }

  /**
  * Get value of field E01CNTFG5 as a String.
  */
  public String getE01CNTFG5()
  {
    return fieldE01CNTFG5.getString();
  }

  /**
  * Set field E01CNTCTR using a String value.
  */
  public void setE01CNTCTR(String newvalue)
  {
    fieldE01CNTCTR.setString(newvalue);
  }

  /**
  * Get value of field E01CNTCTR as a String.
  */
  public String getE01CNTCTR()
  {
    return fieldE01CNTCTR.getString();
  }

  /**
  * Set field E01CNTCTY using a String value.
  */
  public void setE01CNTCTY(String newvalue)
  {
    fieldE01CNTCTY.setString(newvalue);
  }

  /**
  * Get value of field E01CNTCTY as a String.
  */
  public String getE01CNTCTY()
  {
    return fieldE01CNTCTY.getString();
  }

}
