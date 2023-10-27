package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDL087601 physical file definition.
* 
* File level identifier is 1170221162214.
* Record format level identifier is 320946C8C0E87.
*/

public class EDL087601Message extends MessageRecord
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
                                     "E01DLDNLN",
                                     "E01DLDNDR",
                                     "E01CUSCUN",
                                     "E01CUSNA1",
                                     "E01DEAACD",
                                     "E01DEATYP",
                                     "E01DEAPRO",
                                     "E01DLDDTP",
                                     "E01DLDDID",
                                     "E01DLDANM",
                                     "E01DLDBNK",
                                     "E01DLDBRN",
                                     "E01DLDGLN",
                                     "E01DLDCCY",
                                     "E01DEALCM",
                                     "E01DEALCD",
                                     "E01DEALCY",
                                     "E01DEAPRI",
                                     "E01DEAREA",
                                     "E01DEAINT",
                                     "E01DEAMOR",
                                     "E01DEADED",
                                     "E01DEACOM",
                                     "E01DEAIMP",
                                     "E01DEAIVA",
                                     "E01DEATOT",
                                     "E01TRNAIN",
                                     "E01TRNAIF",
                                     "E01TRNAMO",
                                     "E01TRNAMF",
                                     "E01TRNARE",
                                     "E01TRNARF",
                                     "E01TRNTOT",
                                     "E01TRNVDM",
                                     "E01TRNVDD",
                                     "E01TRNVDY",
                                     "E01TRNNAR",
                                     "E01TRNOPC",
                                     "E01TRNCON",
                                     "E01TRNBNK",
                                     "E01TRNBRN",
                                     "E01TRNCCY",
                                     "E01TRNGLN",
                                     "E01TRNACC",
                                     "E01TRNCCN"
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
                                   "E01DLDNLN",
                                   "E01DLDNDR",
                                   "E01CUSCUN",
                                   "E01CUSNA1",
                                   "E01DEAACD",
                                   "E01DEATYP",
                                   "E01DEAPRO",
                                   "E01DLDDTP",
                                   "E01DLDDID",
                                   "E01DLDANM",
                                   "E01DLDBNK",
                                   "E01DLDBRN",
                                   "E01DLDGLN",
                                   "E01DLDCCY",
                                   "E01DEALCM",
                                   "E01DEALCD",
                                   "E01DEALCY",
                                   "E01DEAPRI",
                                   "E01DEAREA",
                                   "E01DEAINT",
                                   "E01DEAMOR",
                                   "E01DEADED",
                                   "E01DEACOM",
                                   "E01DEAIMP",
                                   "E01DEAIVA",
                                   "E01DEATOT",
                                   "E01TRNAIN",
                                   "E01TRNAIF",
                                   "E01TRNAMO",
                                   "E01TRNAMF",
                                   "E01TRNARE",
                                   "E01TRNARF",
                                   "E01TRNTOT",
                                   "E01TRNVDM",
                                   "E01TRNVDD",
                                   "E01TRNVDY",
                                   "E01TRNNAR",
                                   "E01TRNOPC",
                                   "E01TRNCON",
                                   "E01TRNBNK",
                                   "E01TRNBRN",
                                   "E01TRNCCY",
                                   "E01TRNGLN",
                                   "E01TRNACC",
                                   "E01TRNCCN"
                                 };
  final static String fid = "1170221162214";
  final static String rid = "320946C8C0E87";
  final static String fmtname = "EDL087601";
  final int FIELDCOUNT = 54;
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
  private DecimalField fieldE01DLDNLN = null;
  private DecimalField fieldE01DLDNDR = null;
  private DecimalField fieldE01CUSCUN = null;
  private CharacterField fieldE01CUSNA1 = null;
  private CharacterField fieldE01DEAACD = null;
  private CharacterField fieldE01DEATYP = null;
  private CharacterField fieldE01DEAPRO = null;
  private CharacterField fieldE01DLDDTP = null;
  private CharacterField fieldE01DLDDID = null;
  private CharacterField fieldE01DLDANM = null;
  private CharacterField fieldE01DLDBNK = null;
  private DecimalField fieldE01DLDBRN = null;
  private DecimalField fieldE01DLDGLN = null;
  private CharacterField fieldE01DLDCCY = null;
  private DecimalField fieldE01DEALCM = null;
  private DecimalField fieldE01DEALCD = null;
  private DecimalField fieldE01DEALCY = null;
  private DecimalField fieldE01DEAPRI = null;
  private DecimalField fieldE01DEAREA = null;
  private DecimalField fieldE01DEAINT = null;
  private DecimalField fieldE01DEAMOR = null;
  private DecimalField fieldE01DEADED = null;
  private DecimalField fieldE01DEACOM = null;
  private DecimalField fieldE01DEAIMP = null;
  private DecimalField fieldE01DEAIVA = null;
  private DecimalField fieldE01DEATOT = null;
  private DecimalField fieldE01TRNAIN = null;
  private CharacterField fieldE01TRNAIF = null;
  private DecimalField fieldE01TRNAMO = null;
  private CharacterField fieldE01TRNAMF = null;
  private DecimalField fieldE01TRNARE = null;
  private CharacterField fieldE01TRNARF = null;
  private DecimalField fieldE01TRNTOT = null;
  private DecimalField fieldE01TRNVDM = null;
  private DecimalField fieldE01TRNVDD = null;
  private DecimalField fieldE01TRNVDY = null;
  private CharacterField fieldE01TRNNAR = null;
  private CharacterField fieldE01TRNOPC = null;
  private CharacterField fieldE01TRNCON = null;
  private CharacterField fieldE01TRNBNK = null;
  private DecimalField fieldE01TRNBRN = null;
  private CharacterField fieldE01TRNCCY = null;
  private DecimalField fieldE01TRNGLN = null;
  private DecimalField fieldE01TRNACC = null;
  private DecimalField fieldE01TRNCCN = null;

  /**
  * Constructor for EDL087601Message.
  */
  public EDL087601Message()
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
    recordsize = 640;
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
    fields[9] = fieldE01DLDNLN =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E01DLDNLN");
    fields[10] = fieldE01DLDNDR =
    new DecimalField(message, HEADERSIZE + 55, 10, 0, "E01DLDNDR");
    fields[11] = fieldE01CUSCUN =
    new DecimalField(message, HEADERSIZE + 65, 10, 0, "E01CUSCUN");
    fields[12] = fieldE01CUSNA1 =
    new CharacterField(message, HEADERSIZE + 75, 60, "E01CUSNA1");
    fields[13] = fieldE01DEAACD =
    new CharacterField(message, HEADERSIZE + 135, 2, "E01DEAACD");
    fields[14] = fieldE01DEATYP =
    new CharacterField(message, HEADERSIZE + 137, 4, "E01DEATYP");
    fields[15] = fieldE01DEAPRO =
    new CharacterField(message, HEADERSIZE + 141, 4, "E01DEAPRO");
    fields[16] = fieldE01DLDDTP =
    new CharacterField(message, HEADERSIZE + 145, 1, "E01DLDDTP");
    fields[17] = fieldE01DLDDID =
    new CharacterField(message, HEADERSIZE + 146, 25, "E01DLDDID");
    fields[18] = fieldE01DLDANM =
    new CharacterField(message, HEADERSIZE + 171, 60, "E01DLDANM");
    fields[19] = fieldE01DLDBNK =
    new CharacterField(message, HEADERSIZE + 231, 2, "E01DLDBNK");
    fields[20] = fieldE01DLDBRN =
    new DecimalField(message, HEADERSIZE + 233, 5, 0, "E01DLDBRN");
    fields[21] = fieldE01DLDGLN =
    new DecimalField(message, HEADERSIZE + 238, 17, 0, "E01DLDGLN");
    fields[22] = fieldE01DLDCCY =
    new CharacterField(message, HEADERSIZE + 255, 3, "E01DLDCCY");
    fields[23] = fieldE01DEALCM =
    new DecimalField(message, HEADERSIZE + 258, 3, 0, "E01DEALCM");
    fields[24] = fieldE01DEALCD =
    new DecimalField(message, HEADERSIZE + 261, 3, 0, "E01DEALCD");
    fields[25] = fieldE01DEALCY =
    new DecimalField(message, HEADERSIZE + 264, 5, 0, "E01DEALCY");
    fields[26] = fieldE01DEAPRI =
    new DecimalField(message, HEADERSIZE + 269, 17, 2, "E01DEAPRI");
    fields[27] = fieldE01DEAREA =
    new DecimalField(message, HEADERSIZE + 286, 17, 2, "E01DEAREA");
    fields[28] = fieldE01DEAINT =
    new DecimalField(message, HEADERSIZE + 303, 17, 2, "E01DEAINT");
    fields[29] = fieldE01DEAMOR =
    new DecimalField(message, HEADERSIZE + 320, 17, 2, "E01DEAMOR");
    fields[30] = fieldE01DEADED =
    new DecimalField(message, HEADERSIZE + 337, 17, 2, "E01DEADED");
    fields[31] = fieldE01DEACOM =
    new DecimalField(message, HEADERSIZE + 354, 17, 2, "E01DEACOM");
    fields[32] = fieldE01DEAIMP =
    new DecimalField(message, HEADERSIZE + 371, 17, 2, "E01DEAIMP");
    fields[33] = fieldE01DEAIVA =
    new DecimalField(message, HEADERSIZE + 388, 17, 2, "E01DEAIVA");
    fields[34] = fieldE01DEATOT =
    new DecimalField(message, HEADERSIZE + 405, 17, 2, "E01DEATOT");
    fields[35] = fieldE01TRNAIN =
    new DecimalField(message, HEADERSIZE + 422, 17, 2, "E01TRNAIN");
    fields[36] = fieldE01TRNAIF =
    new CharacterField(message, HEADERSIZE + 439, 1, "E01TRNAIF");
    fields[37] = fieldE01TRNAMO =
    new DecimalField(message, HEADERSIZE + 440, 17, 2, "E01TRNAMO");
    fields[38] = fieldE01TRNAMF =
    new CharacterField(message, HEADERSIZE + 457, 1, "E01TRNAMF");
    fields[39] = fieldE01TRNARE =
    new DecimalField(message, HEADERSIZE + 458, 17, 2, "E01TRNARE");
    fields[40] = fieldE01TRNARF =
    new CharacterField(message, HEADERSIZE + 475, 1, "E01TRNARF");
    fields[41] = fieldE01TRNTOT =
    new DecimalField(message, HEADERSIZE + 476, 17, 2, "E01TRNTOT");
    fields[42] = fieldE01TRNVDM =
    new DecimalField(message, HEADERSIZE + 493, 3, 0, "E01TRNVDM");
    fields[43] = fieldE01TRNVDD =
    new DecimalField(message, HEADERSIZE + 496, 3, 0, "E01TRNVDD");
    fields[44] = fieldE01TRNVDY =
    new DecimalField(message, HEADERSIZE + 499, 5, 0, "E01TRNVDY");
    fields[45] = fieldE01TRNNAR =
    new CharacterField(message, HEADERSIZE + 504, 60, "E01TRNNAR");
    fields[46] = fieldE01TRNOPC =
    new CharacterField(message, HEADERSIZE + 564, 2, "E01TRNOPC");
    fields[47] = fieldE01TRNCON =
    new CharacterField(message, HEADERSIZE + 566, 25, "E01TRNCON");
    fields[48] = fieldE01TRNBNK =
    new CharacterField(message, HEADERSIZE + 591, 2, "E01TRNBNK");
    fields[49] = fieldE01TRNBRN =
    new DecimalField(message, HEADERSIZE + 593, 5, 0, "E01TRNBRN");
    fields[50] = fieldE01TRNCCY =
    new CharacterField(message, HEADERSIZE + 598, 3, "E01TRNCCY");
    fields[51] = fieldE01TRNGLN =
    new DecimalField(message, HEADERSIZE + 601, 17, 0, "E01TRNGLN");
    fields[52] = fieldE01TRNACC =
    new DecimalField(message, HEADERSIZE + 618, 13, 0, "E01TRNACC");
    fields[53] = fieldE01TRNCCN =
    new DecimalField(message, HEADERSIZE + 631, 9, 0, "E01TRNCCN");

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
  * Set field E01DLDNLN using a String value.
  */
  public void setE01DLDNLN(String newvalue)
  {
    fieldE01DLDNLN.setString(newvalue);
  }

  /**
  * Get value of field E01DLDNLN as a String.
  */
  public String getE01DLDNLN()
  {
    return fieldE01DLDNLN.getString();
  }

  /**
  * Set numeric field E01DLDNLN using a BigDecimal value.
  */
  public void setE01DLDNLN(BigDecimal newvalue)
  {
    fieldE01DLDNLN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DLDNLN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DLDNLN()
  {
    return fieldE01DLDNLN.getBigDecimal();
  }

  /**
  * Set field E01DLDNDR using a String value.
  */
  public void setE01DLDNDR(String newvalue)
  {
    fieldE01DLDNDR.setString(newvalue);
  }

  /**
  * Get value of field E01DLDNDR as a String.
  */
  public String getE01DLDNDR()
  {
    return fieldE01DLDNDR.getString();
  }

  /**
  * Set numeric field E01DLDNDR using a BigDecimal value.
  */
  public void setE01DLDNDR(BigDecimal newvalue)
  {
    fieldE01DLDNDR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DLDNDR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DLDNDR()
  {
    return fieldE01DLDNDR.getBigDecimal();
  }

  /**
  * Set field E01CUSCUN using a String value.
  */
  public void setE01CUSCUN(String newvalue)
  {
    fieldE01CUSCUN.setString(newvalue);
  }

  /**
  * Get value of field E01CUSCUN as a String.
  */
  public String getE01CUSCUN()
  {
    return fieldE01CUSCUN.getString();
  }

  /**
  * Set numeric field E01CUSCUN using a BigDecimal value.
  */
  public void setE01CUSCUN(BigDecimal newvalue)
  {
    fieldE01CUSCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CUSCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CUSCUN()
  {
    return fieldE01CUSCUN.getBigDecimal();
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
  * Set field E01DEAACD using a String value.
  */
  public void setE01DEAACD(String newvalue)
  {
    fieldE01DEAACD.setString(newvalue);
  }

  /**
  * Get value of field E01DEAACD as a String.
  */
  public String getE01DEAACD()
  {
    return fieldE01DEAACD.getString();
  }

  /**
  * Set field E01DEATYP using a String value.
  */
  public void setE01DEATYP(String newvalue)
  {
    fieldE01DEATYP.setString(newvalue);
  }

  /**
  * Get value of field E01DEATYP as a String.
  */
  public String getE01DEATYP()
  {
    return fieldE01DEATYP.getString();
  }

  /**
  * Set field E01DEAPRO using a String value.
  */
  public void setE01DEAPRO(String newvalue)
  {
    fieldE01DEAPRO.setString(newvalue);
  }

  /**
  * Get value of field E01DEAPRO as a String.
  */
  public String getE01DEAPRO()
  {
    return fieldE01DEAPRO.getString();
  }

  /**
  * Set field E01DLDDTP using a String value.
  */
  public void setE01DLDDTP(String newvalue)
  {
    fieldE01DLDDTP.setString(newvalue);
  }

  /**
  * Get value of field E01DLDDTP as a String.
  */
  public String getE01DLDDTP()
  {
    return fieldE01DLDDTP.getString();
  }

  /**
  * Set field E01DLDDID using a String value.
  */
  public void setE01DLDDID(String newvalue)
  {
    fieldE01DLDDID.setString(newvalue);
  }

  /**
  * Get value of field E01DLDDID as a String.
  */
  public String getE01DLDDID()
  {
    return fieldE01DLDDID.getString();
  }

  /**
  * Set field E01DLDANM using a String value.
  */
  public void setE01DLDANM(String newvalue)
  {
    fieldE01DLDANM.setString(newvalue);
  }

  /**
  * Get value of field E01DLDANM as a String.
  */
  public String getE01DLDANM()
  {
    return fieldE01DLDANM.getString();
  }

  /**
  * Set field E01DLDBNK using a String value.
  */
  public void setE01DLDBNK(String newvalue)
  {
    fieldE01DLDBNK.setString(newvalue);
  }

  /**
  * Get value of field E01DLDBNK as a String.
  */
  public String getE01DLDBNK()
  {
    return fieldE01DLDBNK.getString();
  }

  /**
  * Set field E01DLDBRN using a String value.
  */
  public void setE01DLDBRN(String newvalue)
  {
    fieldE01DLDBRN.setString(newvalue);
  }

  /**
  * Get value of field E01DLDBRN as a String.
  */
  public String getE01DLDBRN()
  {
    return fieldE01DLDBRN.getString();
  }

  /**
  * Set numeric field E01DLDBRN using a BigDecimal value.
  */
  public void setE01DLDBRN(BigDecimal newvalue)
  {
    fieldE01DLDBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DLDBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DLDBRN()
  {
    return fieldE01DLDBRN.getBigDecimal();
  }

  /**
  * Set field E01DLDGLN using a String value.
  */
  public void setE01DLDGLN(String newvalue)
  {
    fieldE01DLDGLN.setString(newvalue);
  }

  /**
  * Get value of field E01DLDGLN as a String.
  */
  public String getE01DLDGLN()
  {
    return fieldE01DLDGLN.getString();
  }

  /**
  * Set numeric field E01DLDGLN using a BigDecimal value.
  */
  public void setE01DLDGLN(BigDecimal newvalue)
  {
    fieldE01DLDGLN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DLDGLN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DLDGLN()
  {
    return fieldE01DLDGLN.getBigDecimal();
  }

  /**
  * Set field E01DLDCCY using a String value.
  */
  public void setE01DLDCCY(String newvalue)
  {
    fieldE01DLDCCY.setString(newvalue);
  }

  /**
  * Get value of field E01DLDCCY as a String.
  */
  public String getE01DLDCCY()
  {
    return fieldE01DLDCCY.getString();
  }

  /**
  * Set field E01DEALCM using a String value.
  */
  public void setE01DEALCM(String newvalue)
  {
    fieldE01DEALCM.setString(newvalue);
  }

  /**
  * Get value of field E01DEALCM as a String.
  */
  public String getE01DEALCM()
  {
    return fieldE01DEALCM.getString();
  }

  /**
  * Set numeric field E01DEALCM using a BigDecimal value.
  */
  public void setE01DEALCM(BigDecimal newvalue)
  {
    fieldE01DEALCM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEALCM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEALCM()
  {
    return fieldE01DEALCM.getBigDecimal();
  }

  /**
  * Set field E01DEALCD using a String value.
  */
  public void setE01DEALCD(String newvalue)
  {
    fieldE01DEALCD.setString(newvalue);
  }

  /**
  * Get value of field E01DEALCD as a String.
  */
  public String getE01DEALCD()
  {
    return fieldE01DEALCD.getString();
  }

  /**
  * Set numeric field E01DEALCD using a BigDecimal value.
  */
  public void setE01DEALCD(BigDecimal newvalue)
  {
    fieldE01DEALCD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEALCD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEALCD()
  {
    return fieldE01DEALCD.getBigDecimal();
  }

  /**
  * Set field E01DEALCY using a String value.
  */
  public void setE01DEALCY(String newvalue)
  {
    fieldE01DEALCY.setString(newvalue);
  }

  /**
  * Get value of field E01DEALCY as a String.
  */
  public String getE01DEALCY()
  {
    return fieldE01DEALCY.getString();
  }

  /**
  * Set numeric field E01DEALCY using a BigDecimal value.
  */
  public void setE01DEALCY(BigDecimal newvalue)
  {
    fieldE01DEALCY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEALCY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEALCY()
  {
    return fieldE01DEALCY.getBigDecimal();
  }

  /**
  * Set field E01DEAPRI using a String value.
  */
  public void setE01DEAPRI(String newvalue)
  {
    fieldE01DEAPRI.setString(newvalue);
  }

  /**
  * Get value of field E01DEAPRI as a String.
  */
  public String getE01DEAPRI()
  {
    return fieldE01DEAPRI.getString();
  }

  /**
  * Set numeric field E01DEAPRI using a BigDecimal value.
  */
  public void setE01DEAPRI(BigDecimal newvalue)
  {
    fieldE01DEAPRI.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEAPRI as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEAPRI()
  {
    return fieldE01DEAPRI.getBigDecimal();
  }

  /**
  * Set field E01DEAREA using a String value.
  */
  public void setE01DEAREA(String newvalue)
  {
    fieldE01DEAREA.setString(newvalue);
  }

  /**
  * Get value of field E01DEAREA as a String.
  */
  public String getE01DEAREA()
  {
    return fieldE01DEAREA.getString();
  }

  /**
  * Set numeric field E01DEAREA using a BigDecimal value.
  */
  public void setE01DEAREA(BigDecimal newvalue)
  {
    fieldE01DEAREA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEAREA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEAREA()
  {
    return fieldE01DEAREA.getBigDecimal();
  }

  /**
  * Set field E01DEAINT using a String value.
  */
  public void setE01DEAINT(String newvalue)
  {
    fieldE01DEAINT.setString(newvalue);
  }

  /**
  * Get value of field E01DEAINT as a String.
  */
  public String getE01DEAINT()
  {
    return fieldE01DEAINT.getString();
  }

  /**
  * Set numeric field E01DEAINT using a BigDecimal value.
  */
  public void setE01DEAINT(BigDecimal newvalue)
  {
    fieldE01DEAINT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEAINT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEAINT()
  {
    return fieldE01DEAINT.getBigDecimal();
  }

  /**
  * Set field E01DEAMOR using a String value.
  */
  public void setE01DEAMOR(String newvalue)
  {
    fieldE01DEAMOR.setString(newvalue);
  }

  /**
  * Get value of field E01DEAMOR as a String.
  */
  public String getE01DEAMOR()
  {
    return fieldE01DEAMOR.getString();
  }

  /**
  * Set numeric field E01DEAMOR using a BigDecimal value.
  */
  public void setE01DEAMOR(BigDecimal newvalue)
  {
    fieldE01DEAMOR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEAMOR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEAMOR()
  {
    return fieldE01DEAMOR.getBigDecimal();
  }

  /**
  * Set field E01DEADED using a String value.
  */
  public void setE01DEADED(String newvalue)
  {
    fieldE01DEADED.setString(newvalue);
  }

  /**
  * Get value of field E01DEADED as a String.
  */
  public String getE01DEADED()
  {
    return fieldE01DEADED.getString();
  }

  /**
  * Set numeric field E01DEADED using a BigDecimal value.
  */
  public void setE01DEADED(BigDecimal newvalue)
  {
    fieldE01DEADED.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEADED as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEADED()
  {
    return fieldE01DEADED.getBigDecimal();
  }

  /**
  * Set field E01DEACOM using a String value.
  */
  public void setE01DEACOM(String newvalue)
  {
    fieldE01DEACOM.setString(newvalue);
  }

  /**
  * Get value of field E01DEACOM as a String.
  */
  public String getE01DEACOM()
  {
    return fieldE01DEACOM.getString();
  }

  /**
  * Set numeric field E01DEACOM using a BigDecimal value.
  */
  public void setE01DEACOM(BigDecimal newvalue)
  {
    fieldE01DEACOM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEACOM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEACOM()
  {
    return fieldE01DEACOM.getBigDecimal();
  }

  /**
  * Set field E01DEAIMP using a String value.
  */
  public void setE01DEAIMP(String newvalue)
  {
    fieldE01DEAIMP.setString(newvalue);
  }

  /**
  * Get value of field E01DEAIMP as a String.
  */
  public String getE01DEAIMP()
  {
    return fieldE01DEAIMP.getString();
  }

  /**
  * Set numeric field E01DEAIMP using a BigDecimal value.
  */
  public void setE01DEAIMP(BigDecimal newvalue)
  {
    fieldE01DEAIMP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEAIMP as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEAIMP()
  {
    return fieldE01DEAIMP.getBigDecimal();
  }

  /**
  * Set field E01DEAIVA using a String value.
  */
  public void setE01DEAIVA(String newvalue)
  {
    fieldE01DEAIVA.setString(newvalue);
  }

  /**
  * Get value of field E01DEAIVA as a String.
  */
  public String getE01DEAIVA()
  {
    return fieldE01DEAIVA.getString();
  }

  /**
  * Set numeric field E01DEAIVA using a BigDecimal value.
  */
  public void setE01DEAIVA(BigDecimal newvalue)
  {
    fieldE01DEAIVA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEAIVA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEAIVA()
  {
    return fieldE01DEAIVA.getBigDecimal();
  }

  /**
  * Set field E01DEATOT using a String value.
  */
  public void setE01DEATOT(String newvalue)
  {
    fieldE01DEATOT.setString(newvalue);
  }

  /**
  * Get value of field E01DEATOT as a String.
  */
  public String getE01DEATOT()
  {
    return fieldE01DEATOT.getString();
  }

  /**
  * Set numeric field E01DEATOT using a BigDecimal value.
  */
  public void setE01DEATOT(BigDecimal newvalue)
  {
    fieldE01DEATOT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEATOT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEATOT()
  {
    return fieldE01DEATOT.getBigDecimal();
  }

  /**
  * Set field E01TRNAIN using a String value.
  */
  public void setE01TRNAIN(String newvalue)
  {
    fieldE01TRNAIN.setString(newvalue);
  }

  /**
  * Get value of field E01TRNAIN as a String.
  */
  public String getE01TRNAIN()
  {
    return fieldE01TRNAIN.getString();
  }

  /**
  * Set numeric field E01TRNAIN using a BigDecimal value.
  */
  public void setE01TRNAIN(BigDecimal newvalue)
  {
    fieldE01TRNAIN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TRNAIN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TRNAIN()
  {
    return fieldE01TRNAIN.getBigDecimal();
  }

  /**
  * Set field E01TRNAIF using a String value.
  */
  public void setE01TRNAIF(String newvalue)
  {
    fieldE01TRNAIF.setString(newvalue);
  }

  /**
  * Get value of field E01TRNAIF as a String.
  */
  public String getE01TRNAIF()
  {
    return fieldE01TRNAIF.getString();
  }

  /**
  * Set field E01TRNAMO using a String value.
  */
  public void setE01TRNAMO(String newvalue)
  {
    fieldE01TRNAMO.setString(newvalue);
  }

  /**
  * Get value of field E01TRNAMO as a String.
  */
  public String getE01TRNAMO()
  {
    return fieldE01TRNAMO.getString();
  }

  /**
  * Set numeric field E01TRNAMO using a BigDecimal value.
  */
  public void setE01TRNAMO(BigDecimal newvalue)
  {
    fieldE01TRNAMO.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TRNAMO as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TRNAMO()
  {
    return fieldE01TRNAMO.getBigDecimal();
  }

  /**
  * Set field E01TRNAMF using a String value.
  */
  public void setE01TRNAMF(String newvalue)
  {
    fieldE01TRNAMF.setString(newvalue);
  }

  /**
  * Get value of field E01TRNAMF as a String.
  */
  public String getE01TRNAMF()
  {
    return fieldE01TRNAMF.getString();
  }

  /**
  * Set field E01TRNARE using a String value.
  */
  public void setE01TRNARE(String newvalue)
  {
    fieldE01TRNARE.setString(newvalue);
  }

  /**
  * Get value of field E01TRNARE as a String.
  */
  public String getE01TRNARE()
  {
    return fieldE01TRNARE.getString();
  }

  /**
  * Set numeric field E01TRNARE using a BigDecimal value.
  */
  public void setE01TRNARE(BigDecimal newvalue)
  {
    fieldE01TRNARE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TRNARE as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TRNARE()
  {
    return fieldE01TRNARE.getBigDecimal();
  }

  /**
  * Set field E01TRNARF using a String value.
  */
  public void setE01TRNARF(String newvalue)
  {
    fieldE01TRNARF.setString(newvalue);
  }

  /**
  * Get value of field E01TRNARF as a String.
  */
  public String getE01TRNARF()
  {
    return fieldE01TRNARF.getString();
  }

  /**
  * Set field E01TRNTOT using a String value.
  */
  public void setE01TRNTOT(String newvalue)
  {
    fieldE01TRNTOT.setString(newvalue);
  }

  /**
  * Get value of field E01TRNTOT as a String.
  */
  public String getE01TRNTOT()
  {
    return fieldE01TRNTOT.getString();
  }

  /**
  * Set numeric field E01TRNTOT using a BigDecimal value.
  */
  public void setE01TRNTOT(BigDecimal newvalue)
  {
    fieldE01TRNTOT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TRNTOT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TRNTOT()
  {
    return fieldE01TRNTOT.getBigDecimal();
  }

  /**
  * Set field E01TRNVDM using a String value.
  */
  public void setE01TRNVDM(String newvalue)
  {
    fieldE01TRNVDM.setString(newvalue);
  }

  /**
  * Get value of field E01TRNVDM as a String.
  */
  public String getE01TRNVDM()
  {
    return fieldE01TRNVDM.getString();
  }

  /**
  * Set numeric field E01TRNVDM using a BigDecimal value.
  */
  public void setE01TRNVDM(BigDecimal newvalue)
  {
    fieldE01TRNVDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TRNVDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TRNVDM()
  {
    return fieldE01TRNVDM.getBigDecimal();
  }

  /**
  * Set field E01TRNVDD using a String value.
  */
  public void setE01TRNVDD(String newvalue)
  {
    fieldE01TRNVDD.setString(newvalue);
  }

  /**
  * Get value of field E01TRNVDD as a String.
  */
  public String getE01TRNVDD()
  {
    return fieldE01TRNVDD.getString();
  }

  /**
  * Set numeric field E01TRNVDD using a BigDecimal value.
  */
  public void setE01TRNVDD(BigDecimal newvalue)
  {
    fieldE01TRNVDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TRNVDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TRNVDD()
  {
    return fieldE01TRNVDD.getBigDecimal();
  }

  /**
  * Set field E01TRNVDY using a String value.
  */
  public void setE01TRNVDY(String newvalue)
  {
    fieldE01TRNVDY.setString(newvalue);
  }

  /**
  * Get value of field E01TRNVDY as a String.
  */
  public String getE01TRNVDY()
  {
    return fieldE01TRNVDY.getString();
  }

  /**
  * Set numeric field E01TRNVDY using a BigDecimal value.
  */
  public void setE01TRNVDY(BigDecimal newvalue)
  {
    fieldE01TRNVDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TRNVDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TRNVDY()
  {
    return fieldE01TRNVDY.getBigDecimal();
  }

  /**
  * Set field E01TRNNAR using a String value.
  */
  public void setE01TRNNAR(String newvalue)
  {
    fieldE01TRNNAR.setString(newvalue);
  }

  /**
  * Get value of field E01TRNNAR as a String.
  */
  public String getE01TRNNAR()
  {
    return fieldE01TRNNAR.getString();
  }

  /**
  * Set field E01TRNOPC using a String value.
  */
  public void setE01TRNOPC(String newvalue)
  {
    fieldE01TRNOPC.setString(newvalue);
  }

  /**
  * Get value of field E01TRNOPC as a String.
  */
  public String getE01TRNOPC()
  {
    return fieldE01TRNOPC.getString();
  }

  /**
  * Set field E01TRNCON using a String value.
  */
  public void setE01TRNCON(String newvalue)
  {
    fieldE01TRNCON.setString(newvalue);
  }

  /**
  * Get value of field E01TRNCON as a String.
  */
  public String getE01TRNCON()
  {
    return fieldE01TRNCON.getString();
  }

  /**
  * Set field E01TRNBNK using a String value.
  */
  public void setE01TRNBNK(String newvalue)
  {
    fieldE01TRNBNK.setString(newvalue);
  }

  /**
  * Get value of field E01TRNBNK as a String.
  */
  public String getE01TRNBNK()
  {
    return fieldE01TRNBNK.getString();
  }

  /**
  * Set field E01TRNBRN using a String value.
  */
  public void setE01TRNBRN(String newvalue)
  {
    fieldE01TRNBRN.setString(newvalue);
  }

  /**
  * Get value of field E01TRNBRN as a String.
  */
  public String getE01TRNBRN()
  {
    return fieldE01TRNBRN.getString();
  }

  /**
  * Set numeric field E01TRNBRN using a BigDecimal value.
  */
  public void setE01TRNBRN(BigDecimal newvalue)
  {
    fieldE01TRNBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TRNBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TRNBRN()
  {
    return fieldE01TRNBRN.getBigDecimal();
  }

  /**
  * Set field E01TRNCCY using a String value.
  */
  public void setE01TRNCCY(String newvalue)
  {
    fieldE01TRNCCY.setString(newvalue);
  }

  /**
  * Get value of field E01TRNCCY as a String.
  */
  public String getE01TRNCCY()
  {
    return fieldE01TRNCCY.getString();
  }

  /**
  * Set field E01TRNGLN using a String value.
  */
  public void setE01TRNGLN(String newvalue)
  {
    fieldE01TRNGLN.setString(newvalue);
  }

  /**
  * Get value of field E01TRNGLN as a String.
  */
  public String getE01TRNGLN()
  {
    return fieldE01TRNGLN.getString();
  }

  /**
  * Set numeric field E01TRNGLN using a BigDecimal value.
  */
  public void setE01TRNGLN(BigDecimal newvalue)
  {
    fieldE01TRNGLN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TRNGLN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TRNGLN()
  {
    return fieldE01TRNGLN.getBigDecimal();
  }

  /**
  * Set field E01TRNACC using a String value.
  */
  public void setE01TRNACC(String newvalue)
  {
    fieldE01TRNACC.setString(newvalue);
  }

  /**
  * Get value of field E01TRNACC as a String.
  */
  public String getE01TRNACC()
  {
    return fieldE01TRNACC.getString();
  }

  /**
  * Set numeric field E01TRNACC using a BigDecimal value.
  */
  public void setE01TRNACC(BigDecimal newvalue)
  {
    fieldE01TRNACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TRNACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TRNACC()
  {
    return fieldE01TRNACC.getBigDecimal();
  }

  /**
  * Set field E01TRNCCN using a String value.
  */
  public void setE01TRNCCN(String newvalue)
  {
    fieldE01TRNCCN.setString(newvalue);
  }

  /**
  * Get value of field E01TRNCCN as a String.
  */
  public String getE01TRNCCN()
  {
    return fieldE01TRNCCN.getString();
  }

  /**
  * Set numeric field E01TRNCCN using a BigDecimal value.
  */
  public void setE01TRNCCN(BigDecimal newvalue)
  {
    fieldE01TRNCCN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TRNCCN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TRNCCN()
  {
    return fieldE01TRNCCN.getBigDecimal();
  }

}
