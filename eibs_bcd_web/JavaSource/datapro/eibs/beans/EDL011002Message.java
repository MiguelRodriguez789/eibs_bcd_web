package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDL011002 physical file definition.
* 
* File level identifier is 1150316142649.
* Record format level identifier is 2D5F7A41F37D3.
*/

public class EDL011002Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H02USERID",
                                     "H02PROGRM",
                                     "H02TIMSYS",
                                     "H02SCRCOD",
                                     "H02OPECOD",
                                     "H02FLGMAS",
                                     "H02FLGWK1",
                                     "H02FLGWK2",
                                     "H02FLGWK3",
                                     "E02PRRTBL",
                                     "E02PRRPRT",
                                     "E02PRRSRT",
                                     "E02PRREFM",
                                     "E02PRREFD",
                                     "E02PRREFY",
                                     "E02PRRETM",
                                     "E02PRRETD",
                                     "E02PRRETY",
                                     "E02PRRPPR",
                                     "E02PRRPSR",
                                     "E02PRRPFM",
                                     "E02PRRPFD",
                                     "E02PRRPFY",
                                     "E02PRRPTM",
                                     "E02PRRPTD",
                                     "E02PRRPTY",
                                     "E02PRRNME",
                                     "E02PRRTFR",
                                     "E02PRRTTO",
                                     "E02PRRTSL",
                                     "E02PRRTYP",
                                     "E02PRRMOD",
                                     "E02PRRPER",
                                     "E02PRRBAS",
                                     "E02PRRTEA",
                                     "E02PRRAPP",
                                     "E02PRRRTY",
                                     "E02DSCRTY",
                                     "E02PRPOPE"
                                   };
  final static String tnames[] = {
                                   "H02USERID",
                                   "H02PROGRM",
                                   "H02TIMSYS",
                                   "H02SCRCOD",
                                   "H02OPECOD",
                                   "H02FLGMAS",
                                   "H02FLGWK1",
                                   "H02FLGWK2",
                                   "H02FLGWK3",
                                   "E02PRRTBL",
                                   "E02PRRPRT",
                                   "E02PRRSRT",
                                   "E02PRREFM",
                                   "E02PRREFD",
                                   "E02PRREFY",
                                   "E02PRRETM",
                                   "E02PRRETD",
                                   "E02PRRETY",
                                   "E02PRRPPR",
                                   "E02PRRPSR",
                                   "E02PRRPFM",
                                   "E02PRRPFD",
                                   "E02PRRPFY",
                                   "E02PRRPTM",
                                   "E02PRRPTD",
                                   "E02PRRPTY",
                                   "E02PRRNME",
                                   "E02PRRTFR",
                                   "E02PRRTTO",
                                   "E02PRRTSL",
                                   "E02PRRTYP",
                                   "E02PRRMOD",
                                   "E02PRRPER",
                                   "E02PRRBAS",
                                   "E02PRRTEA",
                                   "E02PRRAPP",
                                   "E02PRRRTY",
                                   "E02DSCRTY",
                                   "E02PRPOPE"
                                 };
  final static String fid = "1150316142649";
  final static String rid = "2D5F7A41F37D3";
  final static String fmtname = "EDL011002";
  final int FIELDCOUNT = 39;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH02USERID = null;
  private CharacterField fieldH02PROGRM = null;
  private CharacterField fieldH02TIMSYS = null;
  private CharacterField fieldH02SCRCOD = null;
  private CharacterField fieldH02OPECOD = null;
  private CharacterField fieldH02FLGMAS = null;
  private CharacterField fieldH02FLGWK1 = null;
  private CharacterField fieldH02FLGWK2 = null;
  private CharacterField fieldH02FLGWK3 = null;
  private CharacterField fieldE02PRRTBL = null;
  private DecimalField fieldE02PRRPRT = null;
  private DecimalField fieldE02PRRSRT = null;
  private DecimalField fieldE02PRREFM = null;
  private DecimalField fieldE02PRREFD = null;
  private DecimalField fieldE02PRREFY = null;
  private DecimalField fieldE02PRRETM = null;
  private DecimalField fieldE02PRRETD = null;
  private DecimalField fieldE02PRRETY = null;
  private DecimalField fieldE02PRRPPR = null;
  private DecimalField fieldE02PRRPSR = null;
  private DecimalField fieldE02PRRPFM = null;
  private DecimalField fieldE02PRRPFD = null;
  private DecimalField fieldE02PRRPFY = null;
  private DecimalField fieldE02PRRPTM = null;
  private DecimalField fieldE02PRRPTD = null;
  private DecimalField fieldE02PRRPTY = null;
  private CharacterField fieldE02PRRNME = null;
  private CharacterField fieldE02PRRTFR = null;
  private CharacterField fieldE02PRRTTO = null;
  private CharacterField fieldE02PRRTSL = null;
  private CharacterField fieldE02PRRTYP = null;
  private CharacterField fieldE02PRRMOD = null;
  private DecimalField fieldE02PRRPER = null;
  private DecimalField fieldE02PRRBAS = null;
  private DecimalField fieldE02PRRTEA = null;
  private CharacterField fieldE02PRRAPP = null;
  private CharacterField fieldE02PRRRTY = null;
  private CharacterField fieldE02DSCRTY = null;
  private CharacterField fieldE02PRPOPE = null;

  /**
  * Constructor for EDL011002Message.
  */
  public EDL011002Message()
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
    recordsize = 221;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH02USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "H02USERID");
    fields[1] = fieldH02PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H02PROGRM");
    fields[2] = fieldH02TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "H02TIMSYS");
    fields[3] = fieldH02SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "H02SCRCOD");
    fields[4] = fieldH02OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "H02OPECOD");
    fields[5] = fieldH02FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H02FLGMAS");
    fields[6] = fieldH02FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H02FLGWK1");
    fields[7] = fieldH02FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H02FLGWK2");
    fields[8] = fieldH02FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H02FLGWK3");
    fields[9] = fieldE02PRRTBL =
    new CharacterField(message, HEADERSIZE + 42, 2, "E02PRRTBL");
    fields[10] = fieldE02PRRPRT =
    new DecimalField(message, HEADERSIZE + 44, 11, 6, "E02PRRPRT");
    fields[11] = fieldE02PRRSRT =
    new DecimalField(message, HEADERSIZE + 55, 11, 6, "E02PRRSRT");
    fields[12] = fieldE02PRREFM =
    new DecimalField(message, HEADERSIZE + 66, 3, 0, "E02PRREFM");
    fields[13] = fieldE02PRREFD =
    new DecimalField(message, HEADERSIZE + 69, 3, 0, "E02PRREFD");
    fields[14] = fieldE02PRREFY =
    new DecimalField(message, HEADERSIZE + 72, 5, 0, "E02PRREFY");
    fields[15] = fieldE02PRRETM =
    new DecimalField(message, HEADERSIZE + 77, 3, 0, "E02PRRETM");
    fields[16] = fieldE02PRRETD =
    new DecimalField(message, HEADERSIZE + 80, 3, 0, "E02PRRETD");
    fields[17] = fieldE02PRRETY =
    new DecimalField(message, HEADERSIZE + 83, 5, 0, "E02PRRETY");
    fields[18] = fieldE02PRRPPR =
    new DecimalField(message, HEADERSIZE + 88, 11, 6, "E02PRRPPR");
    fields[19] = fieldE02PRRPSR =
    new DecimalField(message, HEADERSIZE + 99, 11, 6, "E02PRRPSR");
    fields[20] = fieldE02PRRPFM =
    new DecimalField(message, HEADERSIZE + 110, 3, 0, "E02PRRPFM");
    fields[21] = fieldE02PRRPFD =
    new DecimalField(message, HEADERSIZE + 113, 3, 0, "E02PRRPFD");
    fields[22] = fieldE02PRRPFY =
    new DecimalField(message, HEADERSIZE + 116, 5, 0, "E02PRRPFY");
    fields[23] = fieldE02PRRPTM =
    new DecimalField(message, HEADERSIZE + 121, 3, 0, "E02PRRPTM");
    fields[24] = fieldE02PRRPTD =
    new DecimalField(message, HEADERSIZE + 124, 3, 0, "E02PRRPTD");
    fields[25] = fieldE02PRRPTY =
    new DecimalField(message, HEADERSIZE + 127, 5, 0, "E02PRRPTY");
    fields[26] = fieldE02PRRNME =
    new CharacterField(message, HEADERSIZE + 132, 45, "E02PRRNME");
    fields[27] = fieldE02PRRTFR =
    new CharacterField(message, HEADERSIZE + 177, 2, "E02PRRTFR");
    fields[28] = fieldE02PRRTTO =
    new CharacterField(message, HEADERSIZE + 179, 2, "E02PRRTTO");
    fields[29] = fieldE02PRRTSL =
    new CharacterField(message, HEADERSIZE + 181, 1, "E02PRRTSL");
    fields[30] = fieldE02PRRTYP =
    new CharacterField(message, HEADERSIZE + 182, 1, "E02PRRTYP");
    fields[31] = fieldE02PRRMOD =
    new CharacterField(message, HEADERSIZE + 183, 1, "E02PRRMOD");
    fields[32] = fieldE02PRRPER =
    new DecimalField(message, HEADERSIZE + 184, 4, 0, "E02PRRPER");
    fields[33] = fieldE02PRRBAS =
    new DecimalField(message, HEADERSIZE + 188, 4, 0, "E02PRRBAS");
    fields[34] = fieldE02PRRTEA =
    new DecimalField(message, HEADERSIZE + 192, 11, 6, "E02PRRTEA");
    fields[35] = fieldE02PRRAPP =
    new CharacterField(message, HEADERSIZE + 203, 1, "E02PRRAPP");
    fields[36] = fieldE02PRRRTY =
    new CharacterField(message, HEADERSIZE + 204, 1, "E02PRRRTY");
    fields[37] = fieldE02DSCRTY =
    new CharacterField(message, HEADERSIZE + 205, 15, "E02DSCRTY");
    fields[38] = fieldE02PRPOPE =
    new CharacterField(message, HEADERSIZE + 220, 1, "E02PRPOPE");

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
  * Set field H02USERID using a String value.
  */
  public void setH02USERID(String newvalue)
  {
    fieldH02USERID.setString(newvalue);
  }

  /**
  * Get value of field H02USERID as a String.
  */
  public String getH02USERID()
  {
    return fieldH02USERID.getString();
  }

  /**
  * Set field H02PROGRM using a String value.
  */
  public void setH02PROGRM(String newvalue)
  {
    fieldH02PROGRM.setString(newvalue);
  }

  /**
  * Get value of field H02PROGRM as a String.
  */
  public String getH02PROGRM()
  {
    return fieldH02PROGRM.getString();
  }

  /**
  * Set field H02TIMSYS using a String value.
  */
  public void setH02TIMSYS(String newvalue)
  {
    fieldH02TIMSYS.setString(newvalue);
  }

  /**
  * Get value of field H02TIMSYS as a String.
  */
  public String getH02TIMSYS()
  {
    return fieldH02TIMSYS.getString();
  }

  /**
  * Set field H02SCRCOD using a String value.
  */
  public void setH02SCRCOD(String newvalue)
  {
    fieldH02SCRCOD.setString(newvalue);
  }

  /**
  * Get value of field H02SCRCOD as a String.
  */
  public String getH02SCRCOD()
  {
    return fieldH02SCRCOD.getString();
  }

  /**
  * Set field H02OPECOD using a String value.
  */
  public void setH02OPECOD(String newvalue)
  {
    fieldH02OPECOD.setString(newvalue);
  }

  /**
  * Get value of field H02OPECOD as a String.
  */
  public String getH02OPECOD()
  {
    return fieldH02OPECOD.getString();
  }

  /**
  * Set field H02FLGMAS using a String value.
  */
  public void setH02FLGMAS(String newvalue)
  {
    fieldH02FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H02FLGMAS as a String.
  */
  public String getH02FLGMAS()
  {
    return fieldH02FLGMAS.getString();
  }

  /**
  * Set field H02FLGWK1 using a String value.
  */
  public void setH02FLGWK1(String newvalue)
  {
    fieldH02FLGWK1.setString(newvalue);
  }

  /**
  * Get value of field H02FLGWK1 as a String.
  */
  public String getH02FLGWK1()
  {
    return fieldH02FLGWK1.getString();
  }

  /**
  * Set field H02FLGWK2 using a String value.
  */
  public void setH02FLGWK2(String newvalue)
  {
    fieldH02FLGWK2.setString(newvalue);
  }

  /**
  * Get value of field H02FLGWK2 as a String.
  */
  public String getH02FLGWK2()
  {
    return fieldH02FLGWK2.getString();
  }

  /**
  * Set field H02FLGWK3 using a String value.
  */
  public void setH02FLGWK3(String newvalue)
  {
    fieldH02FLGWK3.setString(newvalue);
  }

  /**
  * Get value of field H02FLGWK3 as a String.
  */
  public String getH02FLGWK3()
  {
    return fieldH02FLGWK3.getString();
  }

  /**
  * Set field E02PRRTBL using a String value.
  */
  public void setE02PRRTBL(String newvalue)
  {
    fieldE02PRRTBL.setString(newvalue);
  }

  /**
  * Get value of field E02PRRTBL as a String.
  */
  public String getE02PRRTBL()
  {
    return fieldE02PRRTBL.getString();
  }

  /**
  * Set field E02PRRPRT using a String value.
  */
  public void setE02PRRPRT(String newvalue)
  {
    fieldE02PRRPRT.setString(newvalue);
  }

  /**
  * Get value of field E02PRRPRT as a String.
  */
  public String getE02PRRPRT()
  {
    return fieldE02PRRPRT.getString();
  }

  /**
  * Set numeric field E02PRRPRT using a BigDecimal value.
  */
  public void setE02PRRPRT(BigDecimal newvalue)
  {
    fieldE02PRRPRT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02PRRPRT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02PRRPRT()
  {
    return fieldE02PRRPRT.getBigDecimal();
  }

  /**
  * Set field E02PRRSRT using a String value.
  */
  public void setE02PRRSRT(String newvalue)
  {
    fieldE02PRRSRT.setString(newvalue);
  }

  /**
  * Get value of field E02PRRSRT as a String.
  */
  public String getE02PRRSRT()
  {
    return fieldE02PRRSRT.getString();
  }

  /**
  * Set numeric field E02PRRSRT using a BigDecimal value.
  */
  public void setE02PRRSRT(BigDecimal newvalue)
  {
    fieldE02PRRSRT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02PRRSRT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02PRRSRT()
  {
    return fieldE02PRRSRT.getBigDecimal();
  }

  /**
  * Set field E02PRREFM using a String value.
  */
  public void setE02PRREFM(String newvalue)
  {
    fieldE02PRREFM.setString(newvalue);
  }

  /**
  * Get value of field E02PRREFM as a String.
  */
  public String getE02PRREFM()
  {
    return fieldE02PRREFM.getString();
  }

  /**
  * Set numeric field E02PRREFM using a BigDecimal value.
  */
  public void setE02PRREFM(BigDecimal newvalue)
  {
    fieldE02PRREFM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02PRREFM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02PRREFM()
  {
    return fieldE02PRREFM.getBigDecimal();
  }

  /**
  * Set field E02PRREFD using a String value.
  */
  public void setE02PRREFD(String newvalue)
  {
    fieldE02PRREFD.setString(newvalue);
  }

  /**
  * Get value of field E02PRREFD as a String.
  */
  public String getE02PRREFD()
  {
    return fieldE02PRREFD.getString();
  }

  /**
  * Set numeric field E02PRREFD using a BigDecimal value.
  */
  public void setE02PRREFD(BigDecimal newvalue)
  {
    fieldE02PRREFD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02PRREFD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02PRREFD()
  {
    return fieldE02PRREFD.getBigDecimal();
  }

  /**
  * Set field E02PRREFY using a String value.
  */
  public void setE02PRREFY(String newvalue)
  {
    fieldE02PRREFY.setString(newvalue);
  }

  /**
  * Get value of field E02PRREFY as a String.
  */
  public String getE02PRREFY()
  {
    return fieldE02PRREFY.getString();
  }

  /**
  * Set numeric field E02PRREFY using a BigDecimal value.
  */
  public void setE02PRREFY(BigDecimal newvalue)
  {
    fieldE02PRREFY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02PRREFY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02PRREFY()
  {
    return fieldE02PRREFY.getBigDecimal();
  }

  /**
  * Set field E02PRRETM using a String value.
  */
  public void setE02PRRETM(String newvalue)
  {
    fieldE02PRRETM.setString(newvalue);
  }

  /**
  * Get value of field E02PRRETM as a String.
  */
  public String getE02PRRETM()
  {
    return fieldE02PRRETM.getString();
  }

  /**
  * Set numeric field E02PRRETM using a BigDecimal value.
  */
  public void setE02PRRETM(BigDecimal newvalue)
  {
    fieldE02PRRETM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02PRRETM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02PRRETM()
  {
    return fieldE02PRRETM.getBigDecimal();
  }

  /**
  * Set field E02PRRETD using a String value.
  */
  public void setE02PRRETD(String newvalue)
  {
    fieldE02PRRETD.setString(newvalue);
  }

  /**
  * Get value of field E02PRRETD as a String.
  */
  public String getE02PRRETD()
  {
    return fieldE02PRRETD.getString();
  }

  /**
  * Set numeric field E02PRRETD using a BigDecimal value.
  */
  public void setE02PRRETD(BigDecimal newvalue)
  {
    fieldE02PRRETD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02PRRETD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02PRRETD()
  {
    return fieldE02PRRETD.getBigDecimal();
  }

  /**
  * Set field E02PRRETY using a String value.
  */
  public void setE02PRRETY(String newvalue)
  {
    fieldE02PRRETY.setString(newvalue);
  }

  /**
  * Get value of field E02PRRETY as a String.
  */
  public String getE02PRRETY()
  {
    return fieldE02PRRETY.getString();
  }

  /**
  * Set numeric field E02PRRETY using a BigDecimal value.
  */
  public void setE02PRRETY(BigDecimal newvalue)
  {
    fieldE02PRRETY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02PRRETY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02PRRETY()
  {
    return fieldE02PRRETY.getBigDecimal();
  }

  /**
  * Set field E02PRRPPR using a String value.
  */
  public void setE02PRRPPR(String newvalue)
  {
    fieldE02PRRPPR.setString(newvalue);
  }

  /**
  * Get value of field E02PRRPPR as a String.
  */
  public String getE02PRRPPR()
  {
    return fieldE02PRRPPR.getString();
  }

  /**
  * Set numeric field E02PRRPPR using a BigDecimal value.
  */
  public void setE02PRRPPR(BigDecimal newvalue)
  {
    fieldE02PRRPPR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02PRRPPR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02PRRPPR()
  {
    return fieldE02PRRPPR.getBigDecimal();
  }

  /**
  * Set field E02PRRPSR using a String value.
  */
  public void setE02PRRPSR(String newvalue)
  {
    fieldE02PRRPSR.setString(newvalue);
  }

  /**
  * Get value of field E02PRRPSR as a String.
  */
  public String getE02PRRPSR()
  {
    return fieldE02PRRPSR.getString();
  }

  /**
  * Set numeric field E02PRRPSR using a BigDecimal value.
  */
  public void setE02PRRPSR(BigDecimal newvalue)
  {
    fieldE02PRRPSR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02PRRPSR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02PRRPSR()
  {
    return fieldE02PRRPSR.getBigDecimal();
  }

  /**
  * Set field E02PRRPFM using a String value.
  */
  public void setE02PRRPFM(String newvalue)
  {
    fieldE02PRRPFM.setString(newvalue);
  }

  /**
  * Get value of field E02PRRPFM as a String.
  */
  public String getE02PRRPFM()
  {
    return fieldE02PRRPFM.getString();
  }

  /**
  * Set numeric field E02PRRPFM using a BigDecimal value.
  */
  public void setE02PRRPFM(BigDecimal newvalue)
  {
    fieldE02PRRPFM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02PRRPFM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02PRRPFM()
  {
    return fieldE02PRRPFM.getBigDecimal();
  }

  /**
  * Set field E02PRRPFD using a String value.
  */
  public void setE02PRRPFD(String newvalue)
  {
    fieldE02PRRPFD.setString(newvalue);
  }

  /**
  * Get value of field E02PRRPFD as a String.
  */
  public String getE02PRRPFD()
  {
    return fieldE02PRRPFD.getString();
  }

  /**
  * Set numeric field E02PRRPFD using a BigDecimal value.
  */
  public void setE02PRRPFD(BigDecimal newvalue)
  {
    fieldE02PRRPFD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02PRRPFD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02PRRPFD()
  {
    return fieldE02PRRPFD.getBigDecimal();
  }

  /**
  * Set field E02PRRPFY using a String value.
  */
  public void setE02PRRPFY(String newvalue)
  {
    fieldE02PRRPFY.setString(newvalue);
  }

  /**
  * Get value of field E02PRRPFY as a String.
  */
  public String getE02PRRPFY()
  {
    return fieldE02PRRPFY.getString();
  }

  /**
  * Set numeric field E02PRRPFY using a BigDecimal value.
  */
  public void setE02PRRPFY(BigDecimal newvalue)
  {
    fieldE02PRRPFY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02PRRPFY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02PRRPFY()
  {
    return fieldE02PRRPFY.getBigDecimal();
  }

  /**
  * Set field E02PRRPTM using a String value.
  */
  public void setE02PRRPTM(String newvalue)
  {
    fieldE02PRRPTM.setString(newvalue);
  }

  /**
  * Get value of field E02PRRPTM as a String.
  */
  public String getE02PRRPTM()
  {
    return fieldE02PRRPTM.getString();
  }

  /**
  * Set numeric field E02PRRPTM using a BigDecimal value.
  */
  public void setE02PRRPTM(BigDecimal newvalue)
  {
    fieldE02PRRPTM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02PRRPTM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02PRRPTM()
  {
    return fieldE02PRRPTM.getBigDecimal();
  }

  /**
  * Set field E02PRRPTD using a String value.
  */
  public void setE02PRRPTD(String newvalue)
  {
    fieldE02PRRPTD.setString(newvalue);
  }

  /**
  * Get value of field E02PRRPTD as a String.
  */
  public String getE02PRRPTD()
  {
    return fieldE02PRRPTD.getString();
  }

  /**
  * Set numeric field E02PRRPTD using a BigDecimal value.
  */
  public void setE02PRRPTD(BigDecimal newvalue)
  {
    fieldE02PRRPTD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02PRRPTD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02PRRPTD()
  {
    return fieldE02PRRPTD.getBigDecimal();
  }

  /**
  * Set field E02PRRPTY using a String value.
  */
  public void setE02PRRPTY(String newvalue)
  {
    fieldE02PRRPTY.setString(newvalue);
  }

  /**
  * Get value of field E02PRRPTY as a String.
  */
  public String getE02PRRPTY()
  {
    return fieldE02PRRPTY.getString();
  }

  /**
  * Set numeric field E02PRRPTY using a BigDecimal value.
  */
  public void setE02PRRPTY(BigDecimal newvalue)
  {
    fieldE02PRRPTY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02PRRPTY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02PRRPTY()
  {
    return fieldE02PRRPTY.getBigDecimal();
  }

  /**
  * Set field E02PRRNME using a String value.
  */
  public void setE02PRRNME(String newvalue)
  {
    fieldE02PRRNME.setString(newvalue);
  }

  /**
  * Get value of field E02PRRNME as a String.
  */
  public String getE02PRRNME()
  {
    return fieldE02PRRNME.getString();
  }

  /**
  * Set field E02PRRTFR using a String value.
  */
  public void setE02PRRTFR(String newvalue)
  {
    fieldE02PRRTFR.setString(newvalue);
  }

  /**
  * Get value of field E02PRRTFR as a String.
  */
  public String getE02PRRTFR()
  {
    return fieldE02PRRTFR.getString();
  }

  /**
  * Set field E02PRRTTO using a String value.
  */
  public void setE02PRRTTO(String newvalue)
  {
    fieldE02PRRTTO.setString(newvalue);
  }

  /**
  * Get value of field E02PRRTTO as a String.
  */
  public String getE02PRRTTO()
  {
    return fieldE02PRRTTO.getString();
  }

  /**
  * Set field E02PRRTSL using a String value.
  */
  public void setE02PRRTSL(String newvalue)
  {
    fieldE02PRRTSL.setString(newvalue);
  }

  /**
  * Get value of field E02PRRTSL as a String.
  */
  public String getE02PRRTSL()
  {
    return fieldE02PRRTSL.getString();
  }

  /**
  * Set field E02PRRTYP using a String value.
  */
  public void setE02PRRTYP(String newvalue)
  {
    fieldE02PRRTYP.setString(newvalue);
  }

  /**
  * Get value of field E02PRRTYP as a String.
  */
  public String getE02PRRTYP()
  {
    return fieldE02PRRTYP.getString();
  }

  /**
  * Set field E02PRRMOD using a String value.
  */
  public void setE02PRRMOD(String newvalue)
  {
    fieldE02PRRMOD.setString(newvalue);
  }

  /**
  * Get value of field E02PRRMOD as a String.
  */
  public String getE02PRRMOD()
  {
    return fieldE02PRRMOD.getString();
  }

  /**
  * Set field E02PRRPER using a String value.
  */
  public void setE02PRRPER(String newvalue)
  {
    fieldE02PRRPER.setString(newvalue);
  }

  /**
  * Get value of field E02PRRPER as a String.
  */
  public String getE02PRRPER()
  {
    return fieldE02PRRPER.getString();
  }

  /**
  * Set numeric field E02PRRPER using a BigDecimal value.
  */
  public void setE02PRRPER(BigDecimal newvalue)
  {
    fieldE02PRRPER.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02PRRPER as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02PRRPER()
  {
    return fieldE02PRRPER.getBigDecimal();
  }

  /**
  * Set field E02PRRBAS using a String value.
  */
  public void setE02PRRBAS(String newvalue)
  {
    fieldE02PRRBAS.setString(newvalue);
  }

  /**
  * Get value of field E02PRRBAS as a String.
  */
  public String getE02PRRBAS()
  {
    return fieldE02PRRBAS.getString();
  }

  /**
  * Set numeric field E02PRRBAS using a BigDecimal value.
  */
  public void setE02PRRBAS(BigDecimal newvalue)
  {
    fieldE02PRRBAS.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02PRRBAS as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02PRRBAS()
  {
    return fieldE02PRRBAS.getBigDecimal();
  }

  /**
  * Set field E02PRRTEA using a String value.
  */
  public void setE02PRRTEA(String newvalue)
  {
    fieldE02PRRTEA.setString(newvalue);
  }

  /**
  * Get value of field E02PRRTEA as a String.
  */
  public String getE02PRRTEA()
  {
    return fieldE02PRRTEA.getString();
  }

  /**
  * Set numeric field E02PRRTEA using a BigDecimal value.
  */
  public void setE02PRRTEA(BigDecimal newvalue)
  {
    fieldE02PRRTEA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02PRRTEA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02PRRTEA()
  {
    return fieldE02PRRTEA.getBigDecimal();
  }

  /**
  * Set field E02PRRAPP using a String value.
  */
  public void setE02PRRAPP(String newvalue)
  {
    fieldE02PRRAPP.setString(newvalue);
  }

  /**
  * Get value of field E02PRRAPP as a String.
  */
  public String getE02PRRAPP()
  {
    return fieldE02PRRAPP.getString();
  }

  /**
  * Set field E02PRRRTY using a String value.
  */
  public void setE02PRRRTY(String newvalue)
  {
    fieldE02PRRRTY.setString(newvalue);
  }

  /**
  * Get value of field E02PRRRTY as a String.
  */
  public String getE02PRRRTY()
  {
    return fieldE02PRRRTY.getString();
  }

  /**
  * Set field E02DSCRTY using a String value.
  */
  public void setE02DSCRTY(String newvalue)
  {
    fieldE02DSCRTY.setString(newvalue);
  }

  /**
  * Get value of field E02DSCRTY as a String.
  */
  public String getE02DSCRTY()
  {
    return fieldE02DSCRTY.getString();
  }

  /**
  * Set field E02PRPOPE using a String value.
  */
  public void setE02PRPOPE(String newvalue)
  {
    fieldE02PRPOPE.setString(newvalue);
  }

  /**
  * Get value of field E02PRPOPE as a String.
  */
  public String getE02PRPOPE()
  {
    return fieldE02PRPOPE.getString();
  }

}