package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDL013006 physical file definition.
* 
* File level identifier is 1181029173324.
* Record format level identifier is 54B7536EC966A.
*/

public class EDL013006Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H06USERID",
                                     "H06PROGRM",
                                     "H06TIMSYS",
                                     "H06SCRCOD",
                                     "H06OPECOD",
                                     "H06FLGMAS",
                                     "H06FLGWK1",
                                     "H06FLGWK2",
                                     "H06FLGWK3",
                                     "E06DEAACC",
                                     "E06DEACUN",
                                     "E06CUSNA1",
                                     "E06DEAACD",
                                     "E06DEAPRO",
                                     "E06STATUS",
                                     "E06DEATRM",
                                     "E06DEATRC",
                                     "E06DEAROY",
                                     "E06DEAODA",
                                     "E06DSCODA",
                                     "E06DEAODM",
                                     "E06DEAODD",
                                     "E06DEAODY",
                                     "E06DEAMAM",
                                     "E06DEAMAD",
                                     "E06DEAMAY",
                                     "E06DEAICT",
                                     "E06DSCICT",
                                     "E06DEABAS",
                                     "E06DEAFTB",
                                     "E06DEAFTY",
                                     "E06FLTDSC",
                                     "E06DEAFRT",
                                     "E06DEARTB",
                                     "E06DEARTE",
                                     "E06OLDRTE",
                                     "E06DEASPR",
                                     "E06NEWFTB",
                                     "E06NEWFTY",
                                     "E06NEWDSC",
                                     "E06FLTORG",
                                     "E06DEAFLX",
                                     "E06DEARTX",
                                     "E06NEWFRT",
                                     "E06NEWRTE",
                                     "E06RATE",
                                     "E06NEWSPR",
                                     "E06FLGFLT",
                                     "E06TRNVDM",
                                     "E06TRNVDD",
                                     "E06TRNVDY",
                                     "E06DEANR1",
                                     "E06DEANR2"
                                   };
  final static String tnames[] = {
                                   "H06USERID",
                                   "H06PROGRM",
                                   "H06TIMSYS",
                                   "H06SCRCOD",
                                   "H06OPECOD",
                                   "H06FLGMAS",
                                   "H06FLGWK1",
                                   "H06FLGWK2",
                                   "H06FLGWK3",
                                   "E06DEAACC",
                                   "E06DEACUN",
                                   "E06CUSNA1",
                                   "E06DEAACD",
                                   "E06DEAPRO",
                                   "E06STATUS",
                                   "E06DEATRM",
                                   "E06DEATRC",
                                   "E06DEAROY",
                                   "E06DEAODA",
                                   "E06DSCODA",
                                   "E06DEAODM",
                                   "E06DEAODD",
                                   "E06DEAODY",
                                   "E06DEAMAM",
                                   "E06DEAMAD",
                                   "E06DEAMAY",
                                   "E06DEAICT",
                                   "E06DSCICT",
                                   "E06DEABAS",
                                   "E06DEAFTB",
                                   "E06DEAFTY",
                                   "E06FLTDSC",
                                   "E06DEAFRT",
                                   "E06DEARTB",
                                   "E06DEARTE",
                                   "E06OLDRTE",
                                   "E06DEASPR",
                                   "E06NEWFTB",
                                   "E06NEWFTY",
                                   "E06NEWDSC",
                                   "E06FLTORG",
                                   "E06DEAFLX",
                                   "E06DEARTX",
                                   "E06NEWFRT",
                                   "E06NEWRTE",
                                   "E06RATE",
                                   "E06NEWSPR",
                                   "E06FLGFLT",
                                   "E06TRNVDM",
                                   "E06TRNVDD",
                                   "E06TRNVDY",
                                   "E06DEANR1",
                                   "E06DEANR2"
                                 };
  final static String fid = "1181029173324";
  final static String rid = "54B7536EC966A";
  final static String fmtname = "EDL013006";
  final int FIELDCOUNT = 53;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH06USERID = null;
  private CharacterField fieldH06PROGRM = null;
  private CharacterField fieldH06TIMSYS = null;
  private CharacterField fieldH06SCRCOD = null;
  private CharacterField fieldH06OPECOD = null;
  private CharacterField fieldH06FLGMAS = null;
  private CharacterField fieldH06FLGWK1 = null;
  private CharacterField fieldH06FLGWK2 = null;
  private CharacterField fieldH06FLGWK3 = null;
  private DecimalField fieldE06DEAACC = null;
  private DecimalField fieldE06DEACUN = null;
  private CharacterField fieldE06CUSNA1 = null;
  private CharacterField fieldE06DEAACD = null;
  private CharacterField fieldE06DEAPRO = null;
  private CharacterField fieldE06STATUS = null;
  private DecimalField fieldE06DEATRM = null;
  private CharacterField fieldE06DEATRC = null;
  private DecimalField fieldE06DEAROY = null;
  private CharacterField fieldE06DEAODA = null;
  private CharacterField fieldE06DSCODA = null;
  private DecimalField fieldE06DEAODM = null;
  private DecimalField fieldE06DEAODD = null;
  private DecimalField fieldE06DEAODY = null;
  private DecimalField fieldE06DEAMAM = null;
  private DecimalField fieldE06DEAMAD = null;
  private DecimalField fieldE06DEAMAY = null;
  private CharacterField fieldE06DEAICT = null;
  private CharacterField fieldE06DSCICT = null;
  private DecimalField fieldE06DEABAS = null;
  private CharacterField fieldE06DEAFTB = null;
  private CharacterField fieldE06DEAFTY = null;
  private CharacterField fieldE06FLTDSC = null;
  private DecimalField fieldE06DEAFRT = null;
  private CharacterField fieldE06DEARTB = null;
  private DecimalField fieldE06DEARTE = null;
  private DecimalField fieldE06OLDRTE = null;
  private DecimalField fieldE06DEASPR = null;
  private CharacterField fieldE06NEWFTB = null;
  private CharacterField fieldE06NEWFTY = null;
  private CharacterField fieldE06NEWDSC = null;
  private DecimalField fieldE06FLTORG = null;
  private CharacterField fieldE06DEAFLX = null;
  private DecimalField fieldE06DEARTX = null;
  private DecimalField fieldE06NEWFRT = null;
  private DecimalField fieldE06NEWRTE = null;
  private DecimalField fieldE06RATE = null;
  private DecimalField fieldE06NEWSPR = null;
  private CharacterField fieldE06FLGFLT = null;
  private DecimalField fieldE06TRNVDM = null;
  private DecimalField fieldE06TRNVDD = null;
  private DecimalField fieldE06TRNVDY = null;
  private CharacterField fieldE06DEANR1 = null;
  private CharacterField fieldE06DEANR2 = null;

  /**
  * Constructor for EDL013006Message.
  */
  public EDL013006Message()
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
    recordsize = 648;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH06USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "H06USERID");
    fields[1] = fieldH06PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H06PROGRM");
    fields[2] = fieldH06TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "H06TIMSYS");
    fields[3] = fieldH06SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "H06SCRCOD");
    fields[4] = fieldH06OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "H06OPECOD");
    fields[5] = fieldH06FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H06FLGMAS");
    fields[6] = fieldH06FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H06FLGWK1");
    fields[7] = fieldH06FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H06FLGWK2");
    fields[8] = fieldH06FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H06FLGWK3");
    fields[9] = fieldE06DEAACC =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E06DEAACC");
    fields[10] = fieldE06DEACUN =
    new DecimalField(message, HEADERSIZE + 55, 10, 0, "E06DEACUN");
    fields[11] = fieldE06CUSNA1 =
    new CharacterField(message, HEADERSIZE + 65, 60, "E06CUSNA1");
    fields[12] = fieldE06DEAACD =
    new CharacterField(message, HEADERSIZE + 125, 2, "E06DEAACD");
    fields[13] = fieldE06DEAPRO =
    new CharacterField(message, HEADERSIZE + 127, 4, "E06DEAPRO");
    fields[14] = fieldE06STATUS =
    new CharacterField(message, HEADERSIZE + 131, 45, "E06STATUS");
    fields[15] = fieldE06DEATRM =
    new DecimalField(message, HEADERSIZE + 176, 6, 0, "E06DEATRM");
    fields[16] = fieldE06DEATRC =
    new CharacterField(message, HEADERSIZE + 182, 1, "E06DEATRC");
    fields[17] = fieldE06DEAROY =
    new DecimalField(message, HEADERSIZE + 183, 4, 0, "E06DEAROY");
    fields[18] = fieldE06DEAODA =
    new CharacterField(message, HEADERSIZE + 187, 1, "E06DEAODA");
    fields[19] = fieldE06DSCODA =
    new CharacterField(message, HEADERSIZE + 188, 45, "E06DSCODA");
    fields[20] = fieldE06DEAODM =
    new DecimalField(message, HEADERSIZE + 233, 3, 0, "E06DEAODM");
    fields[21] = fieldE06DEAODD =
    new DecimalField(message, HEADERSIZE + 236, 3, 0, "E06DEAODD");
    fields[22] = fieldE06DEAODY =
    new DecimalField(message, HEADERSIZE + 239, 5, 0, "E06DEAODY");
    fields[23] = fieldE06DEAMAM =
    new DecimalField(message, HEADERSIZE + 244, 3, 0, "E06DEAMAM");
    fields[24] = fieldE06DEAMAD =
    new DecimalField(message, HEADERSIZE + 247, 3, 0, "E06DEAMAD");
    fields[25] = fieldE06DEAMAY =
    new DecimalField(message, HEADERSIZE + 250, 5, 0, "E06DEAMAY");
    fields[26] = fieldE06DEAICT =
    new CharacterField(message, HEADERSIZE + 255, 1, "E06DEAICT");
    fields[27] = fieldE06DSCICT =
    new CharacterField(message, HEADERSIZE + 256, 45, "E06DSCICT");
    fields[28] = fieldE06DEABAS =
    new DecimalField(message, HEADERSIZE + 301, 4, 0, "E06DEABAS");
    fields[29] = fieldE06DEAFTB =
    new CharacterField(message, HEADERSIZE + 305, 2, "E06DEAFTB");
    fields[30] = fieldE06DEAFTY =
    new CharacterField(message, HEADERSIZE + 307, 2, "E06DEAFTY");
    fields[31] = fieldE06FLTDSC =
    new CharacterField(message, HEADERSIZE + 309, 45, "E06FLTDSC");
    fields[32] = fieldE06DEAFRT =
    new DecimalField(message, HEADERSIZE + 354, 11, 6, "E06DEAFRT");
    fields[33] = fieldE06DEARTB =
    new CharacterField(message, HEADERSIZE + 365, 2, "E06DEARTB");
    fields[34] = fieldE06DEARTE =
    new DecimalField(message, HEADERSIZE + 367, 11, 6, "E06DEARTE");
    fields[35] = fieldE06OLDRTE =
    new DecimalField(message, HEADERSIZE + 378, 11, 6, "E06OLDRTE");
    fields[36] = fieldE06DEASPR =
    new DecimalField(message, HEADERSIZE + 389, 11, 6, "E06DEASPR");
    fields[37] = fieldE06NEWFTB =
    new CharacterField(message, HEADERSIZE + 400, 2, "E06NEWFTB");
    fields[38] = fieldE06NEWFTY =
    new CharacterField(message, HEADERSIZE + 402, 2, "E06NEWFTY");
    fields[39] = fieldE06NEWDSC =
    new CharacterField(message, HEADERSIZE + 404, 45, "E06NEWDSC");
    fields[40] = fieldE06FLTORG =
    new DecimalField(message, HEADERSIZE + 449, 11, 6, "E06FLTORG");
    fields[41] = fieldE06DEAFLX =
    new CharacterField(message, HEADERSIZE + 460, 1, "E06DEAFLX");
    fields[42] = fieldE06DEARTX =
    new DecimalField(message, HEADERSIZE + 461, 11, 6, "E06DEARTX");
    fields[43] = fieldE06NEWFRT =
    new DecimalField(message, HEADERSIZE + 472, 11, 6, "E06NEWFRT");
    fields[44] = fieldE06NEWRTE =
    new DecimalField(message, HEADERSIZE + 483, 11, 6, "E06NEWRTE");
    fields[45] = fieldE06RATE =
    new DecimalField(message, HEADERSIZE + 494, 11, 6, "E06RATE");
    fields[46] = fieldE06NEWSPR =
    new DecimalField(message, HEADERSIZE + 505, 11, 6, "E06NEWSPR");
    fields[47] = fieldE06FLGFLT =
    new CharacterField(message, HEADERSIZE + 516, 1, "E06FLGFLT");
    fields[48] = fieldE06TRNVDM =
    new DecimalField(message, HEADERSIZE + 517, 3, 0, "E06TRNVDM");
    fields[49] = fieldE06TRNVDD =
    new DecimalField(message, HEADERSIZE + 520, 3, 0, "E06TRNVDD");
    fields[50] = fieldE06TRNVDY =
    new DecimalField(message, HEADERSIZE + 523, 5, 0, "E06TRNVDY");
    fields[51] = fieldE06DEANR1 =
    new CharacterField(message, HEADERSIZE + 528, 60, "E06DEANR1");
    fields[52] = fieldE06DEANR2 =
    new CharacterField(message, HEADERSIZE + 588, 60, "E06DEANR2");

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
  * Set field H06USERID using a String value.
  */
  public void setH06USERID(String newvalue)
  {
    fieldH06USERID.setString(newvalue);
  }

  /**
  * Get value of field H06USERID as a String.
  */
  public String getH06USERID()
  {
    return fieldH06USERID.getString();
  }

  /**
  * Set field H06PROGRM using a String value.
  */
  public void setH06PROGRM(String newvalue)
  {
    fieldH06PROGRM.setString(newvalue);
  }

  /**
  * Get value of field H06PROGRM as a String.
  */
  public String getH06PROGRM()
  {
    return fieldH06PROGRM.getString();
  }

  /**
  * Set field H06TIMSYS using a String value.
  */
  public void setH06TIMSYS(String newvalue)
  {
    fieldH06TIMSYS.setString(newvalue);
  }

  /**
  * Get value of field H06TIMSYS as a String.
  */
  public String getH06TIMSYS()
  {
    return fieldH06TIMSYS.getString();
  }

  /**
  * Set field H06SCRCOD using a String value.
  */
  public void setH06SCRCOD(String newvalue)
  {
    fieldH06SCRCOD.setString(newvalue);
  }

  /**
  * Get value of field H06SCRCOD as a String.
  */
  public String getH06SCRCOD()
  {
    return fieldH06SCRCOD.getString();
  }

  /**
  * Set field H06OPECOD using a String value.
  */
  public void setH06OPECOD(String newvalue)
  {
    fieldH06OPECOD.setString(newvalue);
  }

  /**
  * Get value of field H06OPECOD as a String.
  */
  public String getH06OPECOD()
  {
    return fieldH06OPECOD.getString();
  }

  /**
  * Set field H06FLGMAS using a String value.
  */
  public void setH06FLGMAS(String newvalue)
  {
    fieldH06FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H06FLGMAS as a String.
  */
  public String getH06FLGMAS()
  {
    return fieldH06FLGMAS.getString();
  }

  /**
  * Set field H06FLGWK1 using a String value.
  */
  public void setH06FLGWK1(String newvalue)
  {
    fieldH06FLGWK1.setString(newvalue);
  }

  /**
  * Get value of field H06FLGWK1 as a String.
  */
  public String getH06FLGWK1()
  {
    return fieldH06FLGWK1.getString();
  }

  /**
  * Set field H06FLGWK2 using a String value.
  */
  public void setH06FLGWK2(String newvalue)
  {
    fieldH06FLGWK2.setString(newvalue);
  }

  /**
  * Get value of field H06FLGWK2 as a String.
  */
  public String getH06FLGWK2()
  {
    return fieldH06FLGWK2.getString();
  }

  /**
  * Set field H06FLGWK3 using a String value.
  */
  public void setH06FLGWK3(String newvalue)
  {
    fieldH06FLGWK3.setString(newvalue);
  }

  /**
  * Get value of field H06FLGWK3 as a String.
  */
  public String getH06FLGWK3()
  {
    return fieldH06FLGWK3.getString();
  }

  /**
  * Set field E06DEAACC using a String value.
  */
  public void setE06DEAACC(String newvalue)
  {
    fieldE06DEAACC.setString(newvalue);
  }

  /**
  * Get value of field E06DEAACC as a String.
  */
  public String getE06DEAACC()
  {
    return fieldE06DEAACC.getString();
  }

  /**
  * Set numeric field E06DEAACC using a BigDecimal value.
  */
  public void setE06DEAACC(BigDecimal newvalue)
  {
    fieldE06DEAACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06DEAACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06DEAACC()
  {
    return fieldE06DEAACC.getBigDecimal();
  }

  /**
  * Set field E06DEACUN using a String value.
  */
  public void setE06DEACUN(String newvalue)
  {
    fieldE06DEACUN.setString(newvalue);
  }

  /**
  * Get value of field E06DEACUN as a String.
  */
  public String getE06DEACUN()
  {
    return fieldE06DEACUN.getString();
  }

  /**
  * Set numeric field E06DEACUN using a BigDecimal value.
  */
  public void setE06DEACUN(BigDecimal newvalue)
  {
    fieldE06DEACUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06DEACUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06DEACUN()
  {
    return fieldE06DEACUN.getBigDecimal();
  }

  /**
  * Set field E06CUSNA1 using a String value.
  */
  public void setE06CUSNA1(String newvalue)
  {
    fieldE06CUSNA1.setString(newvalue);
  }

  /**
  * Get value of field E06CUSNA1 as a String.
  */
  public String getE06CUSNA1()
  {
    return fieldE06CUSNA1.getString();
  }

  /**
  * Set field E06DEAACD using a String value.
  */
  public void setE06DEAACD(String newvalue)
  {
    fieldE06DEAACD.setString(newvalue);
  }

  /**
  * Get value of field E06DEAACD as a String.
  */
  public String getE06DEAACD()
  {
    return fieldE06DEAACD.getString();
  }

  /**
  * Set field E06DEAPRO using a String value.
  */
  public void setE06DEAPRO(String newvalue)
  {
    fieldE06DEAPRO.setString(newvalue);
  }

  /**
  * Get value of field E06DEAPRO as a String.
  */
  public String getE06DEAPRO()
  {
    return fieldE06DEAPRO.getString();
  }

  /**
  * Set field E06STATUS using a String value.
  */
  public void setE06STATUS(String newvalue)
  {
    fieldE06STATUS.setString(newvalue);
  }

  /**
  * Get value of field E06STATUS as a String.
  */
  public String getE06STATUS()
  {
    return fieldE06STATUS.getString();
  }

  /**
  * Set field E06DEATRM using a String value.
  */
  public void setE06DEATRM(String newvalue)
  {
    fieldE06DEATRM.setString(newvalue);
  }

  /**
  * Get value of field E06DEATRM as a String.
  */
  public String getE06DEATRM()
  {
    return fieldE06DEATRM.getString();
  }

  /**
  * Set numeric field E06DEATRM using a BigDecimal value.
  */
  public void setE06DEATRM(BigDecimal newvalue)
  {
    fieldE06DEATRM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06DEATRM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06DEATRM()
  {
    return fieldE06DEATRM.getBigDecimal();
  }

  /**
  * Set field E06DEATRC using a String value.
  */
  public void setE06DEATRC(String newvalue)
  {
    fieldE06DEATRC.setString(newvalue);
  }

  /**
  * Get value of field E06DEATRC as a String.
  */
  public String getE06DEATRC()
  {
    return fieldE06DEATRC.getString();
  }

  /**
  * Set field E06DEAROY using a String value.
  */
  public void setE06DEAROY(String newvalue)
  {
    fieldE06DEAROY.setString(newvalue);
  }

  /**
  * Get value of field E06DEAROY as a String.
  */
  public String getE06DEAROY()
  {
    return fieldE06DEAROY.getString();
  }

  /**
  * Set numeric field E06DEAROY using a BigDecimal value.
  */
  public void setE06DEAROY(BigDecimal newvalue)
  {
    fieldE06DEAROY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06DEAROY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06DEAROY()
  {
    return fieldE06DEAROY.getBigDecimal();
  }

  /**
  * Set field E06DEAODA using a String value.
  */
  public void setE06DEAODA(String newvalue)
  {
    fieldE06DEAODA.setString(newvalue);
  }

  /**
  * Get value of field E06DEAODA as a String.
  */
  public String getE06DEAODA()
  {
    return fieldE06DEAODA.getString();
  }

  /**
  * Set field E06DSCODA using a String value.
  */
  public void setE06DSCODA(String newvalue)
  {
    fieldE06DSCODA.setString(newvalue);
  }

  /**
  * Get value of field E06DSCODA as a String.
  */
  public String getE06DSCODA()
  {
    return fieldE06DSCODA.getString();
  }

  /**
  * Set field E06DEAODM using a String value.
  */
  public void setE06DEAODM(String newvalue)
  {
    fieldE06DEAODM.setString(newvalue);
  }

  /**
  * Get value of field E06DEAODM as a String.
  */
  public String getE06DEAODM()
  {
    return fieldE06DEAODM.getString();
  }

  /**
  * Set numeric field E06DEAODM using a BigDecimal value.
  */
  public void setE06DEAODM(BigDecimal newvalue)
  {
    fieldE06DEAODM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06DEAODM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06DEAODM()
  {
    return fieldE06DEAODM.getBigDecimal();
  }

  /**
  * Set field E06DEAODD using a String value.
  */
  public void setE06DEAODD(String newvalue)
  {
    fieldE06DEAODD.setString(newvalue);
  }

  /**
  * Get value of field E06DEAODD as a String.
  */
  public String getE06DEAODD()
  {
    return fieldE06DEAODD.getString();
  }

  /**
  * Set numeric field E06DEAODD using a BigDecimal value.
  */
  public void setE06DEAODD(BigDecimal newvalue)
  {
    fieldE06DEAODD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06DEAODD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06DEAODD()
  {
    return fieldE06DEAODD.getBigDecimal();
  }

  /**
  * Set field E06DEAODY using a String value.
  */
  public void setE06DEAODY(String newvalue)
  {
    fieldE06DEAODY.setString(newvalue);
  }

  /**
  * Get value of field E06DEAODY as a String.
  */
  public String getE06DEAODY()
  {
    return fieldE06DEAODY.getString();
  }

  /**
  * Set numeric field E06DEAODY using a BigDecimal value.
  */
  public void setE06DEAODY(BigDecimal newvalue)
  {
    fieldE06DEAODY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06DEAODY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06DEAODY()
  {
    return fieldE06DEAODY.getBigDecimal();
  }

  /**
  * Set field E06DEAMAM using a String value.
  */
  public void setE06DEAMAM(String newvalue)
  {
    fieldE06DEAMAM.setString(newvalue);
  }

  /**
  * Get value of field E06DEAMAM as a String.
  */
  public String getE06DEAMAM()
  {
    return fieldE06DEAMAM.getString();
  }

  /**
  * Set numeric field E06DEAMAM using a BigDecimal value.
  */
  public void setE06DEAMAM(BigDecimal newvalue)
  {
    fieldE06DEAMAM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06DEAMAM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06DEAMAM()
  {
    return fieldE06DEAMAM.getBigDecimal();
  }

  /**
  * Set field E06DEAMAD using a String value.
  */
  public void setE06DEAMAD(String newvalue)
  {
    fieldE06DEAMAD.setString(newvalue);
  }

  /**
  * Get value of field E06DEAMAD as a String.
  */
  public String getE06DEAMAD()
  {
    return fieldE06DEAMAD.getString();
  }

  /**
  * Set numeric field E06DEAMAD using a BigDecimal value.
  */
  public void setE06DEAMAD(BigDecimal newvalue)
  {
    fieldE06DEAMAD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06DEAMAD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06DEAMAD()
  {
    return fieldE06DEAMAD.getBigDecimal();
  }

  /**
  * Set field E06DEAMAY using a String value.
  */
  public void setE06DEAMAY(String newvalue)
  {
    fieldE06DEAMAY.setString(newvalue);
  }

  /**
  * Get value of field E06DEAMAY as a String.
  */
  public String getE06DEAMAY()
  {
    return fieldE06DEAMAY.getString();
  }

  /**
  * Set numeric field E06DEAMAY using a BigDecimal value.
  */
  public void setE06DEAMAY(BigDecimal newvalue)
  {
    fieldE06DEAMAY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06DEAMAY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06DEAMAY()
  {
    return fieldE06DEAMAY.getBigDecimal();
  }

  /**
  * Set field E06DEAICT using a String value.
  */
  public void setE06DEAICT(String newvalue)
  {
    fieldE06DEAICT.setString(newvalue);
  }

  /**
  * Get value of field E06DEAICT as a String.
  */
  public String getE06DEAICT()
  {
    return fieldE06DEAICT.getString();
  }

  /**
  * Set field E06DSCICT using a String value.
  */
  public void setE06DSCICT(String newvalue)
  {
    fieldE06DSCICT.setString(newvalue);
  }

  /**
  * Get value of field E06DSCICT as a String.
  */
  public String getE06DSCICT()
  {
    return fieldE06DSCICT.getString();
  }

  /**
  * Set field E06DEABAS using a String value.
  */
  public void setE06DEABAS(String newvalue)
  {
    fieldE06DEABAS.setString(newvalue);
  }

  /**
  * Get value of field E06DEABAS as a String.
  */
  public String getE06DEABAS()
  {
    return fieldE06DEABAS.getString();
  }

  /**
  * Set numeric field E06DEABAS using a BigDecimal value.
  */
  public void setE06DEABAS(BigDecimal newvalue)
  {
    fieldE06DEABAS.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06DEABAS as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06DEABAS()
  {
    return fieldE06DEABAS.getBigDecimal();
  }

  /**
  * Set field E06DEAFTB using a String value.
  */
  public void setE06DEAFTB(String newvalue)
  {
    fieldE06DEAFTB.setString(newvalue);
  }

  /**
  * Get value of field E06DEAFTB as a String.
  */
  public String getE06DEAFTB()
  {
    return fieldE06DEAFTB.getString();
  }

  /**
  * Set field E06DEAFTY using a String value.
  */
  public void setE06DEAFTY(String newvalue)
  {
    fieldE06DEAFTY.setString(newvalue);
  }

  /**
  * Get value of field E06DEAFTY as a String.
  */
  public String getE06DEAFTY()
  {
    return fieldE06DEAFTY.getString();
  }

  /**
  * Set field E06FLTDSC using a String value.
  */
  public void setE06FLTDSC(String newvalue)
  {
    fieldE06FLTDSC.setString(newvalue);
  }

  /**
  * Get value of field E06FLTDSC as a String.
  */
  public String getE06FLTDSC()
  {
    return fieldE06FLTDSC.getString();
  }

  /**
  * Set field E06DEAFRT using a String value.
  */
  public void setE06DEAFRT(String newvalue)
  {
    fieldE06DEAFRT.setString(newvalue);
  }

  /**
  * Get value of field E06DEAFRT as a String.
  */
  public String getE06DEAFRT()
  {
    return fieldE06DEAFRT.getString();
  }

  /**
  * Set numeric field E06DEAFRT using a BigDecimal value.
  */
  public void setE06DEAFRT(BigDecimal newvalue)
  {
    fieldE06DEAFRT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06DEAFRT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06DEAFRT()
  {
    return fieldE06DEAFRT.getBigDecimal();
  }

  /**
  * Set field E06DEARTB using a String value.
  */
  public void setE06DEARTB(String newvalue)
  {
    fieldE06DEARTB.setString(newvalue);
  }

  /**
  * Get value of field E06DEARTB as a String.
  */
  public String getE06DEARTB()
  {
    return fieldE06DEARTB.getString();
  }

  /**
  * Set field E06DEARTE using a String value.
  */
  public void setE06DEARTE(String newvalue)
  {
    fieldE06DEARTE.setString(newvalue);
  }

  /**
  * Get value of field E06DEARTE as a String.
  */
  public String getE06DEARTE()
  {
    return fieldE06DEARTE.getString();
  }

  /**
  * Set numeric field E06DEARTE using a BigDecimal value.
  */
  public void setE06DEARTE(BigDecimal newvalue)
  {
    fieldE06DEARTE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06DEARTE as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06DEARTE()
  {
    return fieldE06DEARTE.getBigDecimal();
  }

  /**
  * Set field E06OLDRTE using a String value.
  */
  public void setE06OLDRTE(String newvalue)
  {
    fieldE06OLDRTE.setString(newvalue);
  }

  /**
  * Get value of field E06OLDRTE as a String.
  */
  public String getE06OLDRTE()
  {
    return fieldE06OLDRTE.getString();
  }

  /**
  * Set numeric field E06OLDRTE using a BigDecimal value.
  */
  public void setE06OLDRTE(BigDecimal newvalue)
  {
    fieldE06OLDRTE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06OLDRTE as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06OLDRTE()
  {
    return fieldE06OLDRTE.getBigDecimal();
  }

  /**
  * Set field E06DEASPR using a String value.
  */
  public void setE06DEASPR(String newvalue)
  {
    fieldE06DEASPR.setString(newvalue);
  }

  /**
  * Get value of field E06DEASPR as a String.
  */
  public String getE06DEASPR()
  {
    return fieldE06DEASPR.getString();
  }

  /**
  * Set numeric field E06DEASPR using a BigDecimal value.
  */
  public void setE06DEASPR(BigDecimal newvalue)
  {
    fieldE06DEASPR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06DEASPR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06DEASPR()
  {
    return fieldE06DEASPR.getBigDecimal();
  }

  /**
  * Set field E06NEWFTB using a String value.
  */
  public void setE06NEWFTB(String newvalue)
  {
    fieldE06NEWFTB.setString(newvalue);
  }

  /**
  * Get value of field E06NEWFTB as a String.
  */
  public String getE06NEWFTB()
  {
    return fieldE06NEWFTB.getString();
  }

  /**
  * Set field E06NEWFTY using a String value.
  */
  public void setE06NEWFTY(String newvalue)
  {
    fieldE06NEWFTY.setString(newvalue);
  }

  /**
  * Get value of field E06NEWFTY as a String.
  */
  public String getE06NEWFTY()
  {
    return fieldE06NEWFTY.getString();
  }

  /**
  * Set field E06NEWDSC using a String value.
  */
  public void setE06NEWDSC(String newvalue)
  {
    fieldE06NEWDSC.setString(newvalue);
  }

  /**
  * Get value of field E06NEWDSC as a String.
  */
  public String getE06NEWDSC()
  {
    return fieldE06NEWDSC.getString();
  }

  /**
  * Set field E06FLTORG using a String value.
  */
  public void setE06FLTORG(String newvalue)
  {
    fieldE06FLTORG.setString(newvalue);
  }

  /**
  * Get value of field E06FLTORG as a String.
  */
  public String getE06FLTORG()
  {
    return fieldE06FLTORG.getString();
  }

  /**
  * Set numeric field E06FLTORG using a BigDecimal value.
  */
  public void setE06FLTORG(BigDecimal newvalue)
  {
    fieldE06FLTORG.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06FLTORG as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06FLTORG()
  {
    return fieldE06FLTORG.getBigDecimal();
  }

  /**
  * Set field E06DEAFLX using a String value.
  */
  public void setE06DEAFLX(String newvalue)
  {
    fieldE06DEAFLX.setString(newvalue);
  }

  /**
  * Get value of field E06DEAFLX as a String.
  */
  public String getE06DEAFLX()
  {
    return fieldE06DEAFLX.getString();
  }

  /**
  * Set field E06DEARTX using a String value.
  */
  public void setE06DEARTX(String newvalue)
  {
    fieldE06DEARTX.setString(newvalue);
  }

  /**
  * Get value of field E06DEARTX as a String.
  */
  public String getE06DEARTX()
  {
    return fieldE06DEARTX.getString();
  }

  /**
  * Set numeric field E06DEARTX using a BigDecimal value.
  */
  public void setE06DEARTX(BigDecimal newvalue)
  {
    fieldE06DEARTX.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06DEARTX as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06DEARTX()
  {
    return fieldE06DEARTX.getBigDecimal();
  }

  /**
  * Set field E06NEWFRT using a String value.
  */
  public void setE06NEWFRT(String newvalue)
  {
    fieldE06NEWFRT.setString(newvalue);
  }

  /**
  * Get value of field E06NEWFRT as a String.
  */
  public String getE06NEWFRT()
  {
    return fieldE06NEWFRT.getString();
  }

  /**
  * Set numeric field E06NEWFRT using a BigDecimal value.
  */
  public void setE06NEWFRT(BigDecimal newvalue)
  {
    fieldE06NEWFRT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06NEWFRT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06NEWFRT()
  {
    return fieldE06NEWFRT.getBigDecimal();
  }

  /**
  * Set field E06NEWRTE using a String value.
  */
  public void setE06NEWRTE(String newvalue)
  {
    fieldE06NEWRTE.setString(newvalue);
  }

  /**
  * Get value of field E06NEWRTE as a String.
  */
  public String getE06NEWRTE()
  {
    return fieldE06NEWRTE.getString();
  }

  /**
  * Set numeric field E06NEWRTE using a BigDecimal value.
  */
  public void setE06NEWRTE(BigDecimal newvalue)
  {
    fieldE06NEWRTE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06NEWRTE as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06NEWRTE()
  {
    return fieldE06NEWRTE.getBigDecimal();
  }

  /**
  * Set field E06RATE using a String value.
  */
  public void setE06RATE(String newvalue)
  {
    fieldE06RATE.setString(newvalue);
  }

  /**
  * Get value of field E06RATE as a String.
  */
  public String getE06RATE()
  {
    return fieldE06RATE.getString();
  }

  /**
  * Set numeric field E06RATE using a BigDecimal value.
  */
  public void setE06RATE(BigDecimal newvalue)
  {
    fieldE06RATE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06RATE as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06RATE()
  {
    return fieldE06RATE.getBigDecimal();
  }

  /**
  * Set field E06NEWSPR using a String value.
  */
  public void setE06NEWSPR(String newvalue)
  {
    fieldE06NEWSPR.setString(newvalue);
  }

  /**
  * Get value of field E06NEWSPR as a String.
  */
  public String getE06NEWSPR()
  {
    return fieldE06NEWSPR.getString();
  }

  /**
  * Set numeric field E06NEWSPR using a BigDecimal value.
  */
  public void setE06NEWSPR(BigDecimal newvalue)
  {
    fieldE06NEWSPR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06NEWSPR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06NEWSPR()
  {
    return fieldE06NEWSPR.getBigDecimal();
  }

  /**
  * Set field E06FLGFLT using a String value.
  */
  public void setE06FLGFLT(String newvalue)
  {
    fieldE06FLGFLT.setString(newvalue);
  }

  /**
  * Get value of field E06FLGFLT as a String.
  */
  public String getE06FLGFLT()
  {
    return fieldE06FLGFLT.getString();
  }

  /**
  * Set field E06TRNVDM using a String value.
  */
  public void setE06TRNVDM(String newvalue)
  {
    fieldE06TRNVDM.setString(newvalue);
  }

  /**
  * Get value of field E06TRNVDM as a String.
  */
  public String getE06TRNVDM()
  {
    return fieldE06TRNVDM.getString();
  }

  /**
  * Set numeric field E06TRNVDM using a BigDecimal value.
  */
  public void setE06TRNVDM(BigDecimal newvalue)
  {
    fieldE06TRNVDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06TRNVDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06TRNVDM()
  {
    return fieldE06TRNVDM.getBigDecimal();
  }

  /**
  * Set field E06TRNVDD using a String value.
  */
  public void setE06TRNVDD(String newvalue)
  {
    fieldE06TRNVDD.setString(newvalue);
  }

  /**
  * Get value of field E06TRNVDD as a String.
  */
  public String getE06TRNVDD()
  {
    return fieldE06TRNVDD.getString();
  }

  /**
  * Set numeric field E06TRNVDD using a BigDecimal value.
  */
  public void setE06TRNVDD(BigDecimal newvalue)
  {
    fieldE06TRNVDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06TRNVDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06TRNVDD()
  {
    return fieldE06TRNVDD.getBigDecimal();
  }

  /**
  * Set field E06TRNVDY using a String value.
  */
  public void setE06TRNVDY(String newvalue)
  {
    fieldE06TRNVDY.setString(newvalue);
  }

  /**
  * Get value of field E06TRNVDY as a String.
  */
  public String getE06TRNVDY()
  {
    return fieldE06TRNVDY.getString();
  }

  /**
  * Set numeric field E06TRNVDY using a BigDecimal value.
  */
  public void setE06TRNVDY(BigDecimal newvalue)
  {
    fieldE06TRNVDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06TRNVDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06TRNVDY()
  {
    return fieldE06TRNVDY.getBigDecimal();
  }

  /**
  * Set field E06DEANR1 using a String value.
  */
  public void setE06DEANR1(String newvalue)
  {
    fieldE06DEANR1.setString(newvalue);
  }

  /**
  * Get value of field E06DEANR1 as a String.
  */
  public String getE06DEANR1()
  {
    return fieldE06DEANR1.getString();
  }

  /**
  * Set field E06DEANR2 using a String value.
  */
  public void setE06DEANR2(String newvalue)
  {
    fieldE06DEANR2.setString(newvalue);
  }

  /**
  * Get value of field E06DEANR2 as a String.
  */
  public String getE06DEANR2()
  {
    return fieldE06DEANR2.getString();
  }

}
