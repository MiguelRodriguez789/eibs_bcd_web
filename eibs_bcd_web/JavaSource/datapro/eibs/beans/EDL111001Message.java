package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDL111001 physical file definition.
* 
* File level identifier is 1150316173348.
* Record format level identifier is 35613C397DB43.
*/

public class EDL111001Message extends MessageRecord
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
                                     "E01PRRTBL",
                                     "E01PRRPRT",
                                     "E01PRRSRT",
                                     "E01PRREFM",
                                     "E01PRREFD",
                                     "E01PRREFY",
                                     "E01PRRETM",
                                     "E01PRRETD",
                                     "E01PRRETY",
                                     "E01PRRPPR",
                                     "E01PRRPSR",
                                     "E01PRRPFM",
                                     "E01PRRPFD",
                                     "E01PRRPFY",
                                     "E01PRRPTM",
                                     "E01PRRPTD",
                                     "E01PRRPTY",
                                     "E01PRRNME",
                                     "E01PRRTYP",
                                     "E01PRRMOD",
                                     "E01PRRPER",
                                     "E01PRRBAS",
                                     "E01PRRTEA",
                                     "E01PRRTFR",
                                     "E01PRRTTO",
                                     "E01PRRTSL",
                                     "E01PRRAPP",
                                     "E01PRRDIB",
                                     "E01PRRUSR",
                                     "E01PRRRTY",
                                     "E01DSCRTY",
                                     "E01PRPOPE"
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
                                   "E01PRRTBL",
                                   "E01PRRPRT",
                                   "E01PRRSRT",
                                   "E01PRREFM",
                                   "E01PRREFD",
                                   "E01PRREFY",
                                   "E01PRRETM",
                                   "E01PRRETD",
                                   "E01PRRETY",
                                   "E01PRRPPR",
                                   "E01PRRPSR",
                                   "E01PRRPFM",
                                   "E01PRRPFD",
                                   "E01PRRPFY",
                                   "E01PRRPTM",
                                   "E01PRRPTD",
                                   "E01PRRPTY",
                                   "E01PRRNME",
                                   "E01PRRTYP",
                                   "E01PRRMOD",
                                   "E01PRRPER",
                                   "E01PRRBAS",
                                   "E01PRRTEA",
                                   "E01PRRTFR",
                                   "E01PRRTTO",
                                   "E01PRRTSL",
                                   "E01PRRAPP",
                                   "E01PRRDIB",
                                   "E01PRRUSR",
                                   "E01PRRRTY",
                                   "E01DSCRTY",
                                   "E01PRPOPE"
                                 };
  final static String fid = "1150316173348";
  final static String rid = "35613C397DB43";
  final static String fmtname = "EDL111001";
  final int FIELDCOUNT = 41;
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
  private CharacterField fieldE01PRRTBL = null;
  private DecimalField fieldE01PRRPRT = null;
  private DecimalField fieldE01PRRSRT = null;
  private DecimalField fieldE01PRREFM = null;
  private DecimalField fieldE01PRREFD = null;
  private DecimalField fieldE01PRREFY = null;
  private DecimalField fieldE01PRRETM = null;
  private DecimalField fieldE01PRRETD = null;
  private DecimalField fieldE01PRRETY = null;
  private DecimalField fieldE01PRRPPR = null;
  private DecimalField fieldE01PRRPSR = null;
  private DecimalField fieldE01PRRPFM = null;
  private DecimalField fieldE01PRRPFD = null;
  private DecimalField fieldE01PRRPFY = null;
  private DecimalField fieldE01PRRPTM = null;
  private DecimalField fieldE01PRRPTD = null;
  private DecimalField fieldE01PRRPTY = null;
  private CharacterField fieldE01PRRNME = null;
  private CharacterField fieldE01PRRTYP = null;
  private CharacterField fieldE01PRRMOD = null;
  private DecimalField fieldE01PRRPER = null;
  private DecimalField fieldE01PRRBAS = null;
  private DecimalField fieldE01PRRTEA = null;
  private CharacterField fieldE01PRRTFR = null;
  private CharacterField fieldE01PRRTTO = null;
  private CharacterField fieldE01PRRTSL = null;
  private CharacterField fieldE01PRRAPP = null;
  private DecimalField fieldE01PRRDIB = null;
  private CharacterField fieldE01PRRUSR = null;
  private CharacterField fieldE01PRRRTY = null;
  private CharacterField fieldE01DSCRTY = null;
  private CharacterField fieldE01PRPOPE = null;

  /**
  * Constructor for EDL111001Message.
  */
  public EDL111001Message()
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
    recordsize = 237;
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
    fields[9] = fieldE01PRRTBL =
    new CharacterField(message, HEADERSIZE + 42, 2, "E01PRRTBL");
    fields[10] = fieldE01PRRPRT =
    new DecimalField(message, HEADERSIZE + 44, 11, 6, "E01PRRPRT");
    fields[11] = fieldE01PRRSRT =
    new DecimalField(message, HEADERSIZE + 55, 11, 6, "E01PRRSRT");
    fields[12] = fieldE01PRREFM =
    new DecimalField(message, HEADERSIZE + 66, 3, 0, "E01PRREFM");
    fields[13] = fieldE01PRREFD =
    new DecimalField(message, HEADERSIZE + 69, 3, 0, "E01PRREFD");
    fields[14] = fieldE01PRREFY =
    new DecimalField(message, HEADERSIZE + 72, 5, 0, "E01PRREFY");
    fields[15] = fieldE01PRRETM =
    new DecimalField(message, HEADERSIZE + 77, 3, 0, "E01PRRETM");
    fields[16] = fieldE01PRRETD =
    new DecimalField(message, HEADERSIZE + 80, 3, 0, "E01PRRETD");
    fields[17] = fieldE01PRRETY =
    new DecimalField(message, HEADERSIZE + 83, 5, 0, "E01PRRETY");
    fields[18] = fieldE01PRRPPR =
    new DecimalField(message, HEADERSIZE + 88, 11, 6, "E01PRRPPR");
    fields[19] = fieldE01PRRPSR =
    new DecimalField(message, HEADERSIZE + 99, 11, 6, "E01PRRPSR");
    fields[20] = fieldE01PRRPFM =
    new DecimalField(message, HEADERSIZE + 110, 3, 0, "E01PRRPFM");
    fields[21] = fieldE01PRRPFD =
    new DecimalField(message, HEADERSIZE + 113, 3, 0, "E01PRRPFD");
    fields[22] = fieldE01PRRPFY =
    new DecimalField(message, HEADERSIZE + 116, 5, 0, "E01PRRPFY");
    fields[23] = fieldE01PRRPTM =
    new DecimalField(message, HEADERSIZE + 121, 3, 0, "E01PRRPTM");
    fields[24] = fieldE01PRRPTD =
    new DecimalField(message, HEADERSIZE + 124, 3, 0, "E01PRRPTD");
    fields[25] = fieldE01PRRPTY =
    new DecimalField(message, HEADERSIZE + 127, 5, 0, "E01PRRPTY");
    fields[26] = fieldE01PRRNME =
    new CharacterField(message, HEADERSIZE + 132, 45, "E01PRRNME");
    fields[27] = fieldE01PRRTYP =
    new CharacterField(message, HEADERSIZE + 177, 1, "E01PRRTYP");
    fields[28] = fieldE01PRRMOD =
    new CharacterField(message, HEADERSIZE + 178, 1, "E01PRRMOD");
    fields[29] = fieldE01PRRPER =
    new DecimalField(message, HEADERSIZE + 179, 4, 0, "E01PRRPER");
    fields[30] = fieldE01PRRBAS =
    new DecimalField(message, HEADERSIZE + 183, 4, 0, "E01PRRBAS");
    fields[31] = fieldE01PRRTEA =
    new DecimalField(message, HEADERSIZE + 187, 11, 6, "E01PRRTEA");
    fields[32] = fieldE01PRRTFR =
    new CharacterField(message, HEADERSIZE + 198, 2, "E01PRRTFR");
    fields[33] = fieldE01PRRTTO =
    new CharacterField(message, HEADERSIZE + 200, 2, "E01PRRTTO");
    fields[34] = fieldE01PRRTSL =
    new CharacterField(message, HEADERSIZE + 202, 1, "E01PRRTSL");
    fields[35] = fieldE01PRRAPP =
    new CharacterField(message, HEADERSIZE + 203, 1, "E01PRRAPP");
    fields[36] = fieldE01PRRDIB =
    new DecimalField(message, HEADERSIZE + 204, 6, 0, "E01PRRDIB");
    fields[37] = fieldE01PRRUSR =
    new CharacterField(message, HEADERSIZE + 210, 10, "E01PRRUSR");
    fields[38] = fieldE01PRRRTY =
    new CharacterField(message, HEADERSIZE + 220, 1, "E01PRRRTY");
    fields[39] = fieldE01DSCRTY =
    new CharacterField(message, HEADERSIZE + 221, 15, "E01DSCRTY");
    fields[40] = fieldE01PRPOPE =
    new CharacterField(message, HEADERSIZE + 236, 1, "E01PRPOPE");

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
  * Set field E01PRRTBL using a String value.
  */
  public void setE01PRRTBL(String newvalue)
  {
    fieldE01PRRTBL.setString(newvalue);
  }

  /**
  * Get value of field E01PRRTBL as a String.
  */
  public String getE01PRRTBL()
  {
    return fieldE01PRRTBL.getString();
  }

  /**
  * Set field E01PRRPRT using a String value.
  */
  public void setE01PRRPRT(String newvalue)
  {
    fieldE01PRRPRT.setString(newvalue);
  }

  /**
  * Get value of field E01PRRPRT as a String.
  */
  public String getE01PRRPRT()
  {
    return fieldE01PRRPRT.getString();
  }

  /**
  * Set numeric field E01PRRPRT using a BigDecimal value.
  */
  public void setE01PRRPRT(BigDecimal newvalue)
  {
    fieldE01PRRPRT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRRPRT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRRPRT()
  {
    return fieldE01PRRPRT.getBigDecimal();
  }

  /**
  * Set field E01PRRSRT using a String value.
  */
  public void setE01PRRSRT(String newvalue)
  {
    fieldE01PRRSRT.setString(newvalue);
  }

  /**
  * Get value of field E01PRRSRT as a String.
  */
  public String getE01PRRSRT()
  {
    return fieldE01PRRSRT.getString();
  }

  /**
  * Set numeric field E01PRRSRT using a BigDecimal value.
  */
  public void setE01PRRSRT(BigDecimal newvalue)
  {
    fieldE01PRRSRT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRRSRT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRRSRT()
  {
    return fieldE01PRRSRT.getBigDecimal();
  }

  /**
  * Set field E01PRREFM using a String value.
  */
  public void setE01PRREFM(String newvalue)
  {
    fieldE01PRREFM.setString(newvalue);
  }

  /**
  * Get value of field E01PRREFM as a String.
  */
  public String getE01PRREFM()
  {
    return fieldE01PRREFM.getString();
  }

  /**
  * Set numeric field E01PRREFM using a BigDecimal value.
  */
  public void setE01PRREFM(BigDecimal newvalue)
  {
    fieldE01PRREFM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRREFM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRREFM()
  {
    return fieldE01PRREFM.getBigDecimal();
  }

  /**
  * Set field E01PRREFD using a String value.
  */
  public void setE01PRREFD(String newvalue)
  {
    fieldE01PRREFD.setString(newvalue);
  }

  /**
  * Get value of field E01PRREFD as a String.
  */
  public String getE01PRREFD()
  {
    return fieldE01PRREFD.getString();
  }

  /**
  * Set numeric field E01PRREFD using a BigDecimal value.
  */
  public void setE01PRREFD(BigDecimal newvalue)
  {
    fieldE01PRREFD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRREFD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRREFD()
  {
    return fieldE01PRREFD.getBigDecimal();
  }

  /**
  * Set field E01PRREFY using a String value.
  */
  public void setE01PRREFY(String newvalue)
  {
    fieldE01PRREFY.setString(newvalue);
  }

  /**
  * Get value of field E01PRREFY as a String.
  */
  public String getE01PRREFY()
  {
    return fieldE01PRREFY.getString();
  }

  /**
  * Set numeric field E01PRREFY using a BigDecimal value.
  */
  public void setE01PRREFY(BigDecimal newvalue)
  {
    fieldE01PRREFY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRREFY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRREFY()
  {
    return fieldE01PRREFY.getBigDecimal();
  }

  /**
  * Set field E01PRRETM using a String value.
  */
  public void setE01PRRETM(String newvalue)
  {
    fieldE01PRRETM.setString(newvalue);
  }

  /**
  * Get value of field E01PRRETM as a String.
  */
  public String getE01PRRETM()
  {
    return fieldE01PRRETM.getString();
  }

  /**
  * Set numeric field E01PRRETM using a BigDecimal value.
  */
  public void setE01PRRETM(BigDecimal newvalue)
  {
    fieldE01PRRETM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRRETM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRRETM()
  {
    return fieldE01PRRETM.getBigDecimal();
  }

  /**
  * Set field E01PRRETD using a String value.
  */
  public void setE01PRRETD(String newvalue)
  {
    fieldE01PRRETD.setString(newvalue);
  }

  /**
  * Get value of field E01PRRETD as a String.
  */
  public String getE01PRRETD()
  {
    return fieldE01PRRETD.getString();
  }

  /**
  * Set numeric field E01PRRETD using a BigDecimal value.
  */
  public void setE01PRRETD(BigDecimal newvalue)
  {
    fieldE01PRRETD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRRETD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRRETD()
  {
    return fieldE01PRRETD.getBigDecimal();
  }

  /**
  * Set field E01PRRETY using a String value.
  */
  public void setE01PRRETY(String newvalue)
  {
    fieldE01PRRETY.setString(newvalue);
  }

  /**
  * Get value of field E01PRRETY as a String.
  */
  public String getE01PRRETY()
  {
    return fieldE01PRRETY.getString();
  }

  /**
  * Set numeric field E01PRRETY using a BigDecimal value.
  */
  public void setE01PRRETY(BigDecimal newvalue)
  {
    fieldE01PRRETY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRRETY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRRETY()
  {
    return fieldE01PRRETY.getBigDecimal();
  }

  /**
  * Set field E01PRRPPR using a String value.
  */
  public void setE01PRRPPR(String newvalue)
  {
    fieldE01PRRPPR.setString(newvalue);
  }

  /**
  * Get value of field E01PRRPPR as a String.
  */
  public String getE01PRRPPR()
  {
    return fieldE01PRRPPR.getString();
  }

  /**
  * Set numeric field E01PRRPPR using a BigDecimal value.
  */
  public void setE01PRRPPR(BigDecimal newvalue)
  {
    fieldE01PRRPPR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRRPPR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRRPPR()
  {
    return fieldE01PRRPPR.getBigDecimal();
  }

  /**
  * Set field E01PRRPSR using a String value.
  */
  public void setE01PRRPSR(String newvalue)
  {
    fieldE01PRRPSR.setString(newvalue);
  }

  /**
  * Get value of field E01PRRPSR as a String.
  */
  public String getE01PRRPSR()
  {
    return fieldE01PRRPSR.getString();
  }

  /**
  * Set numeric field E01PRRPSR using a BigDecimal value.
  */
  public void setE01PRRPSR(BigDecimal newvalue)
  {
    fieldE01PRRPSR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRRPSR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRRPSR()
  {
    return fieldE01PRRPSR.getBigDecimal();
  }

  /**
  * Set field E01PRRPFM using a String value.
  */
  public void setE01PRRPFM(String newvalue)
  {
    fieldE01PRRPFM.setString(newvalue);
  }

  /**
  * Get value of field E01PRRPFM as a String.
  */
  public String getE01PRRPFM()
  {
    return fieldE01PRRPFM.getString();
  }

  /**
  * Set numeric field E01PRRPFM using a BigDecimal value.
  */
  public void setE01PRRPFM(BigDecimal newvalue)
  {
    fieldE01PRRPFM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRRPFM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRRPFM()
  {
    return fieldE01PRRPFM.getBigDecimal();
  }

  /**
  * Set field E01PRRPFD using a String value.
  */
  public void setE01PRRPFD(String newvalue)
  {
    fieldE01PRRPFD.setString(newvalue);
  }

  /**
  * Get value of field E01PRRPFD as a String.
  */
  public String getE01PRRPFD()
  {
    return fieldE01PRRPFD.getString();
  }

  /**
  * Set numeric field E01PRRPFD using a BigDecimal value.
  */
  public void setE01PRRPFD(BigDecimal newvalue)
  {
    fieldE01PRRPFD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRRPFD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRRPFD()
  {
    return fieldE01PRRPFD.getBigDecimal();
  }

  /**
  * Set field E01PRRPFY using a String value.
  */
  public void setE01PRRPFY(String newvalue)
  {
    fieldE01PRRPFY.setString(newvalue);
  }

  /**
  * Get value of field E01PRRPFY as a String.
  */
  public String getE01PRRPFY()
  {
    return fieldE01PRRPFY.getString();
  }

  /**
  * Set numeric field E01PRRPFY using a BigDecimal value.
  */
  public void setE01PRRPFY(BigDecimal newvalue)
  {
    fieldE01PRRPFY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRRPFY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRRPFY()
  {
    return fieldE01PRRPFY.getBigDecimal();
  }

  /**
  * Set field E01PRRPTM using a String value.
  */
  public void setE01PRRPTM(String newvalue)
  {
    fieldE01PRRPTM.setString(newvalue);
  }

  /**
  * Get value of field E01PRRPTM as a String.
  */
  public String getE01PRRPTM()
  {
    return fieldE01PRRPTM.getString();
  }

  /**
  * Set numeric field E01PRRPTM using a BigDecimal value.
  */
  public void setE01PRRPTM(BigDecimal newvalue)
  {
    fieldE01PRRPTM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRRPTM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRRPTM()
  {
    return fieldE01PRRPTM.getBigDecimal();
  }

  /**
  * Set field E01PRRPTD using a String value.
  */
  public void setE01PRRPTD(String newvalue)
  {
    fieldE01PRRPTD.setString(newvalue);
  }

  /**
  * Get value of field E01PRRPTD as a String.
  */
  public String getE01PRRPTD()
  {
    return fieldE01PRRPTD.getString();
  }

  /**
  * Set numeric field E01PRRPTD using a BigDecimal value.
  */
  public void setE01PRRPTD(BigDecimal newvalue)
  {
    fieldE01PRRPTD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRRPTD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRRPTD()
  {
    return fieldE01PRRPTD.getBigDecimal();
  }

  /**
  * Set field E01PRRPTY using a String value.
  */
  public void setE01PRRPTY(String newvalue)
  {
    fieldE01PRRPTY.setString(newvalue);
  }

  /**
  * Get value of field E01PRRPTY as a String.
  */
  public String getE01PRRPTY()
  {
    return fieldE01PRRPTY.getString();
  }

  /**
  * Set numeric field E01PRRPTY using a BigDecimal value.
  */
  public void setE01PRRPTY(BigDecimal newvalue)
  {
    fieldE01PRRPTY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRRPTY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRRPTY()
  {
    return fieldE01PRRPTY.getBigDecimal();
  }

  /**
  * Set field E01PRRNME using a String value.
  */
  public void setE01PRRNME(String newvalue)
  {
    fieldE01PRRNME.setString(newvalue);
  }

  /**
  * Get value of field E01PRRNME as a String.
  */
  public String getE01PRRNME()
  {
    return fieldE01PRRNME.getString();
  }

  /**
  * Set field E01PRRTYP using a String value.
  */
  public void setE01PRRTYP(String newvalue)
  {
    fieldE01PRRTYP.setString(newvalue);
  }

  /**
  * Get value of field E01PRRTYP as a String.
  */
  public String getE01PRRTYP()
  {
    return fieldE01PRRTYP.getString();
  }

  /**
  * Set field E01PRRMOD using a String value.
  */
  public void setE01PRRMOD(String newvalue)
  {
    fieldE01PRRMOD.setString(newvalue);
  }

  /**
  * Get value of field E01PRRMOD as a String.
  */
  public String getE01PRRMOD()
  {
    return fieldE01PRRMOD.getString();
  }

  /**
  * Set field E01PRRPER using a String value.
  */
  public void setE01PRRPER(String newvalue)
  {
    fieldE01PRRPER.setString(newvalue);
  }

  /**
  * Get value of field E01PRRPER as a String.
  */
  public String getE01PRRPER()
  {
    return fieldE01PRRPER.getString();
  }

  /**
  * Set numeric field E01PRRPER using a BigDecimal value.
  */
  public void setE01PRRPER(BigDecimal newvalue)
  {
    fieldE01PRRPER.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRRPER as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRRPER()
  {
    return fieldE01PRRPER.getBigDecimal();
  }

  /**
  * Set field E01PRRBAS using a String value.
  */
  public void setE01PRRBAS(String newvalue)
  {
    fieldE01PRRBAS.setString(newvalue);
  }

  /**
  * Get value of field E01PRRBAS as a String.
  */
  public String getE01PRRBAS()
  {
    return fieldE01PRRBAS.getString();
  }

  /**
  * Set numeric field E01PRRBAS using a BigDecimal value.
  */
  public void setE01PRRBAS(BigDecimal newvalue)
  {
    fieldE01PRRBAS.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRRBAS as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRRBAS()
  {
    return fieldE01PRRBAS.getBigDecimal();
  }

  /**
  * Set field E01PRRTEA using a String value.
  */
  public void setE01PRRTEA(String newvalue)
  {
    fieldE01PRRTEA.setString(newvalue);
  }

  /**
  * Get value of field E01PRRTEA as a String.
  */
  public String getE01PRRTEA()
  {
    return fieldE01PRRTEA.getString();
  }

  /**
  * Set numeric field E01PRRTEA using a BigDecimal value.
  */
  public void setE01PRRTEA(BigDecimal newvalue)
  {
    fieldE01PRRTEA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRRTEA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRRTEA()
  {
    return fieldE01PRRTEA.getBigDecimal();
  }

  /**
  * Set field E01PRRTFR using a String value.
  */
  public void setE01PRRTFR(String newvalue)
  {
    fieldE01PRRTFR.setString(newvalue);
  }

  /**
  * Get value of field E01PRRTFR as a String.
  */
  public String getE01PRRTFR()
  {
    return fieldE01PRRTFR.getString();
  }

  /**
  * Set field E01PRRTTO using a String value.
  */
  public void setE01PRRTTO(String newvalue)
  {
    fieldE01PRRTTO.setString(newvalue);
  }

  /**
  * Get value of field E01PRRTTO as a String.
  */
  public String getE01PRRTTO()
  {
    return fieldE01PRRTTO.getString();
  }

  /**
  * Set field E01PRRTSL using a String value.
  */
  public void setE01PRRTSL(String newvalue)
  {
    fieldE01PRRTSL.setString(newvalue);
  }

  /**
  * Get value of field E01PRRTSL as a String.
  */
  public String getE01PRRTSL()
  {
    return fieldE01PRRTSL.getString();
  }

  /**
  * Set field E01PRRAPP using a String value.
  */
  public void setE01PRRAPP(String newvalue)
  {
    fieldE01PRRAPP.setString(newvalue);
  }

  /**
  * Get value of field E01PRRAPP as a String.
  */
  public String getE01PRRAPP()
  {
    return fieldE01PRRAPP.getString();
  }

  /**
  * Set field E01PRRDIB using a String value.
  */
  public void setE01PRRDIB(String newvalue)
  {
    fieldE01PRRDIB.setString(newvalue);
  }

  /**
  * Get value of field E01PRRDIB as a String.
  */
  public String getE01PRRDIB()
  {
    return fieldE01PRRDIB.getString();
  }

  /**
  * Set numeric field E01PRRDIB using a BigDecimal value.
  */
  public void setE01PRRDIB(BigDecimal newvalue)
  {
    fieldE01PRRDIB.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRRDIB as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRRDIB()
  {
    return fieldE01PRRDIB.getBigDecimal();
  }

  /**
  * Set field E01PRRUSR using a String value.
  */
  public void setE01PRRUSR(String newvalue)
  {
    fieldE01PRRUSR.setString(newvalue);
  }

  /**
  * Get value of field E01PRRUSR as a String.
  */
  public String getE01PRRUSR()
  {
    return fieldE01PRRUSR.getString();
  }

  /**
  * Set field E01PRRRTY using a String value.
  */
  public void setE01PRRRTY(String newvalue)
  {
    fieldE01PRRRTY.setString(newvalue);
  }

  /**
  * Get value of field E01PRRRTY as a String.
  */
  public String getE01PRRRTY()
  {
    return fieldE01PRRRTY.getString();
  }

  /**
  * Set field E01DSCRTY using a String value.
  */
  public void setE01DSCRTY(String newvalue)
  {
    fieldE01DSCRTY.setString(newvalue);
  }

  /**
  * Get value of field E01DSCRTY as a String.
  */
  public String getE01DSCRTY()
  {
    return fieldE01DSCRTY.getString();
  }

  /**
  * Set field E01PRPOPE using a String value.
  */
  public void setE01PRPOPE(String newvalue)
  {
    fieldE01PRPOPE.setString(newvalue);
  }

  /**
  * Get value of field E01PRPOPE as a String.
  */
  public String getE01PRPOPE()
  {
    return fieldE01PRPOPE.getString();
  }

}
