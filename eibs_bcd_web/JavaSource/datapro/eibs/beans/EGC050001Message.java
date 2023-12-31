package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EGC050001 physical file definition.
* 
* File level identifier is 1130611113200.
* Record format level identifier is 4C00C42CEE14D.
*/

public class EGC050001Message extends MessageRecord
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
                                     "H01CODACC",
                                     "E01GCRUT",
                                     "E01GCNMBC",
                                     "E01GCACNO",
                                     "E01GCGSTP",
                                     "E01GCESTA",
                                     "E01GCSDSP",
                                     "E01GCSDPT",
                                     "E01GCSDPS",
                                     "E01GCSDPA",
                                     "E01GCAPRY",
                                     "E01GCAPRM",
                                     "E01GCAPRD",
                                     "E01GCNLNS",
                                     "E01GCNCKP",
                                     "E01GCNCKA",
                                     "E01GCNPAC",
                                     "E01GCSCNT",
                                     "E01GCPCBR",
                                     "E01GCVNPY",
                                     "E01GCVNPM",
                                     "E01GCVNPD",
                                     "E01GCTPRT",
                                     "E01GCDCRT",
                                     "E01INDOPE"
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
                                   "H01CODACC",
                                   "E01GCRUT",
                                   "E01GCNMBC",
                                   "E01GCACNO",
                                   "E01GCGSTP",
                                   "E01GCESTA",
                                   "E01GCSDSP",
                                   "E01GCSDPT",
                                   "E01GCSDPS",
                                   "E01GCSDPA",
                                   "E01GCAPRY",
                                   "E01GCAPRM",
                                   "E01GCAPRD",
                                   "E01GCNLNS",
                                   "E01GCNCKP",
                                   "E01GCNCKA",
                                   "E01GCNPAC",
                                   "E01GCSCNT",
                                   "E01GCPCBR",
                                   "E01GCVNPY",
                                   "E01GCVNPM",
                                   "E01GCVNPD",
                                   "E01GCTPRT",
                                   "E01GCDCRT",
                                   "E01INDOPE"
                                 };
  final static String fid = "1130611113200";
  final static String rid = "4C00C42CEE14D";
  final static String fmtname = "EGC050001";
  final int FIELDCOUNT = 34;
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
  private CharacterField fieldH01CODACC = null;
  private CharacterField fieldE01GCRUT = null;
  private CharacterField fieldE01GCNMBC = null;
  private DecimalField fieldE01GCACNO = null;
  private CharacterField fieldE01GCGSTP = null;
  private CharacterField fieldE01GCESTA = null;
  private DecimalField fieldE01GCSDSP = null;
  private DecimalField fieldE01GCSDPT = null;
  private DecimalField fieldE01GCSDPS = null;
  private DecimalField fieldE01GCSDPA = null;
  private DecimalField fieldE01GCAPRY = null;
  private DecimalField fieldE01GCAPRM = null;
  private DecimalField fieldE01GCAPRD = null;
  private DecimalField fieldE01GCNLNS = null;
  private DecimalField fieldE01GCNCKP = null;
  private DecimalField fieldE01GCNCKA = null;
  private DecimalField fieldE01GCNPAC = null;
  private DecimalField fieldE01GCSCNT = null;
  private DecimalField fieldE01GCPCBR = null;
  private DecimalField fieldE01GCVNPY = null;
  private DecimalField fieldE01GCVNPM = null;
  private DecimalField fieldE01GCVNPD = null;
  private CharacterField fieldE01GCTPRT = null;
  private CharacterField fieldE01GCDCRT = null;
  private CharacterField fieldE01INDOPE = null;

  /**
  * Constructor for EGC050001Message.
  */
  public EGC050001Message()
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
    recordsize = 359;
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
    fields[9] = fieldH01CODACC =
    new CharacterField(message, HEADERSIZE + 42, 4, "H01CODACC");
    fields[10] = fieldE01GCRUT =
    new CharacterField(message, HEADERSIZE + 46, 25, "E01GCRUT");
    fields[11] = fieldE01GCNMBC =
    new CharacterField(message, HEADERSIZE + 71, 45, "E01GCNMBC");
    fields[12] = fieldE01GCACNO =
    new DecimalField(message, HEADERSIZE + 116, 13, 0, "E01GCACNO");
    fields[13] = fieldE01GCGSTP =
    new CharacterField(message, HEADERSIZE + 129, 45, "E01GCGSTP");
    fields[14] = fieldE01GCESTA =
    new CharacterField(message, HEADERSIZE + 174, 45, "E01GCESTA");
    fields[15] = fieldE01GCSDSP =
    new DecimalField(message, HEADERSIZE + 219, 17, 2, "E01GCSDSP");
    fields[16] = fieldE01GCSDPT =
    new DecimalField(message, HEADERSIZE + 236, 17, 2, "E01GCSDPT");
    fields[17] = fieldE01GCSDPS =
    new DecimalField(message, HEADERSIZE + 253, 17, 2, "E01GCSDPS");
    fields[18] = fieldE01GCSDPA =
    new DecimalField(message, HEADERSIZE + 270, 17, 2, "E01GCSDPA");
    fields[19] = fieldE01GCAPRY =
    new DecimalField(message, HEADERSIZE + 287, 5, 0, "E01GCAPRY");
    fields[20] = fieldE01GCAPRM =
    new DecimalField(message, HEADERSIZE + 292, 3, 0, "E01GCAPRM");
    fields[21] = fieldE01GCAPRD =
    new DecimalField(message, HEADERSIZE + 295, 3, 0, "E01GCAPRD");
    fields[22] = fieldE01GCNLNS =
    new DecimalField(message, HEADERSIZE + 298, 6, 0, "E01GCNLNS");
    fields[23] = fieldE01GCNCKP =
    new DecimalField(message, HEADERSIZE + 304, 6, 0, "E01GCNCKP");
    fields[24] = fieldE01GCNCKA =
    new DecimalField(message, HEADERSIZE + 310, 6, 0, "E01GCNCKA");
    fields[25] = fieldE01GCNPAC =
    new DecimalField(message, HEADERSIZE + 316, 6, 0, "E01GCNPAC");
    fields[26] = fieldE01GCSCNT =
    new DecimalField(message, HEADERSIZE + 322, 17, 2, "E01GCSCNT");
    fields[27] = fieldE01GCPCBR =
    new DecimalField(message, HEADERSIZE + 339, 6, 0, "E01GCPCBR");
    fields[28] = fieldE01GCVNPY =
    new DecimalField(message, HEADERSIZE + 345, 5, 0, "E01GCVNPY");
    fields[29] = fieldE01GCVNPM =
    new DecimalField(message, HEADERSIZE + 350, 3, 0, "E01GCVNPM");
    fields[30] = fieldE01GCVNPD =
    new DecimalField(message, HEADERSIZE + 353, 3, 0, "E01GCVNPD");
    fields[31] = fieldE01GCTPRT =
    new CharacterField(message, HEADERSIZE + 356, 1, "E01GCTPRT");
    fields[32] = fieldE01GCDCRT =
    new CharacterField(message, HEADERSIZE + 357, 1, "E01GCDCRT");
    fields[33] = fieldE01INDOPE =
    new CharacterField(message, HEADERSIZE + 358, 1, "E01INDOPE");

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
  * Set field H01CODACC using a String value.
  */
  public void setH01CODACC(String newvalue)
  {
    fieldH01CODACC.setString(newvalue);
  }

  /**
  * Get value of field H01CODACC as a String.
  */
  public String getH01CODACC()
  {
    return fieldH01CODACC.getString();
  }

  /**
  * Set field E01GCRUT using a String value.
  */
  public void setE01GCRUT(String newvalue)
  {
    fieldE01GCRUT.setString(newvalue);
  }

  /**
  * Get value of field E01GCRUT as a String.
  */
  public String getE01GCRUT()
  {
    return fieldE01GCRUT.getString();
  }

  /**
  * Set field E01GCNMBC using a String value.
  */
  public void setE01GCNMBC(String newvalue)
  {
    fieldE01GCNMBC.setString(newvalue);
  }

  /**
  * Get value of field E01GCNMBC as a String.
  */
  public String getE01GCNMBC()
  {
    return fieldE01GCNMBC.getString();
  }

  /**
  * Set field E01GCACNO using a String value.
  */
  public void setE01GCACNO(String newvalue)
  {
    fieldE01GCACNO.setString(newvalue);
  }

  /**
  * Get value of field E01GCACNO as a String.
  */
  public String getE01GCACNO()
  {
    return fieldE01GCACNO.getString();
  }

  /**
  * Set numeric field E01GCACNO using a BigDecimal value.
  */
  public void setE01GCACNO(BigDecimal newvalue)
  {
    fieldE01GCACNO.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01GCACNO as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01GCACNO()
  {
    return fieldE01GCACNO.getBigDecimal();
  }

  /**
  * Set field E01GCGSTP using a String value.
  */
  public void setE01GCGSTP(String newvalue)
  {
    fieldE01GCGSTP.setString(newvalue);
  }

  /**
  * Get value of field E01GCGSTP as a String.
  */
  public String getE01GCGSTP()
  {
    return fieldE01GCGSTP.getString();
  }

  /**
  * Set field E01GCESTA using a String value.
  */
  public void setE01GCESTA(String newvalue)
  {
    fieldE01GCESTA.setString(newvalue);
  }

  /**
  * Get value of field E01GCESTA as a String.
  */
  public String getE01GCESTA()
  {
    return fieldE01GCESTA.getString();
  }

  /**
  * Set field E01GCSDSP using a String value.
  */
  public void setE01GCSDSP(String newvalue)
  {
    fieldE01GCSDSP.setString(newvalue);
  }

  /**
  * Get value of field E01GCSDSP as a String.
  */
  public String getE01GCSDSP()
  {
    return fieldE01GCSDSP.getString();
  }

  /**
  * Set numeric field E01GCSDSP using a BigDecimal value.
  */
  public void setE01GCSDSP(BigDecimal newvalue)
  {
    fieldE01GCSDSP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01GCSDSP as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01GCSDSP()
  {
    return fieldE01GCSDSP.getBigDecimal();
  }

  /**
  * Set field E01GCSDPT using a String value.
  */
  public void setE01GCSDPT(String newvalue)
  {
    fieldE01GCSDPT.setString(newvalue);
  }

  /**
  * Get value of field E01GCSDPT as a String.
  */
  public String getE01GCSDPT()
  {
    return fieldE01GCSDPT.getString();
  }

  /**
  * Set numeric field E01GCSDPT using a BigDecimal value.
  */
  public void setE01GCSDPT(BigDecimal newvalue)
  {
    fieldE01GCSDPT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01GCSDPT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01GCSDPT()
  {
    return fieldE01GCSDPT.getBigDecimal();
  }

  /**
  * Set field E01GCSDPS using a String value.
  */
  public void setE01GCSDPS(String newvalue)
  {
    fieldE01GCSDPS.setString(newvalue);
  }

  /**
  * Get value of field E01GCSDPS as a String.
  */
  public String getE01GCSDPS()
  {
    return fieldE01GCSDPS.getString();
  }

  /**
  * Set numeric field E01GCSDPS using a BigDecimal value.
  */
  public void setE01GCSDPS(BigDecimal newvalue)
  {
    fieldE01GCSDPS.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01GCSDPS as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01GCSDPS()
  {
    return fieldE01GCSDPS.getBigDecimal();
  }

  /**
  * Set field E01GCSDPA using a String value.
  */
  public void setE01GCSDPA(String newvalue)
  {
    fieldE01GCSDPA.setString(newvalue);
  }

  /**
  * Get value of field E01GCSDPA as a String.
  */
  public String getE01GCSDPA()
  {
    return fieldE01GCSDPA.getString();
  }

  /**
  * Set numeric field E01GCSDPA using a BigDecimal value.
  */
  public void setE01GCSDPA(BigDecimal newvalue)
  {
    fieldE01GCSDPA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01GCSDPA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01GCSDPA()
  {
    return fieldE01GCSDPA.getBigDecimal();
  }

  /**
  * Set field E01GCAPRY using a String value.
  */
  public void setE01GCAPRY(String newvalue)
  {
    fieldE01GCAPRY.setString(newvalue);
  }

  /**
  * Get value of field E01GCAPRY as a String.
  */
  public String getE01GCAPRY()
  {
    return fieldE01GCAPRY.getString();
  }

  /**
  * Set numeric field E01GCAPRY using a BigDecimal value.
  */
  public void setE01GCAPRY(BigDecimal newvalue)
  {
    fieldE01GCAPRY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01GCAPRY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01GCAPRY()
  {
    return fieldE01GCAPRY.getBigDecimal();
  }

  /**
  * Set field E01GCAPRM using a String value.
  */
  public void setE01GCAPRM(String newvalue)
  {
    fieldE01GCAPRM.setString(newvalue);
  }

  /**
  * Get value of field E01GCAPRM as a String.
  */
  public String getE01GCAPRM()
  {
    return fieldE01GCAPRM.getString();
  }

  /**
  * Set numeric field E01GCAPRM using a BigDecimal value.
  */
  public void setE01GCAPRM(BigDecimal newvalue)
  {
    fieldE01GCAPRM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01GCAPRM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01GCAPRM()
  {
    return fieldE01GCAPRM.getBigDecimal();
  }

  /**
  * Set field E01GCAPRD using a String value.
  */
  public void setE01GCAPRD(String newvalue)
  {
    fieldE01GCAPRD.setString(newvalue);
  }

  /**
  * Get value of field E01GCAPRD as a String.
  */
  public String getE01GCAPRD()
  {
    return fieldE01GCAPRD.getString();
  }

  /**
  * Set numeric field E01GCAPRD using a BigDecimal value.
  */
  public void setE01GCAPRD(BigDecimal newvalue)
  {
    fieldE01GCAPRD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01GCAPRD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01GCAPRD()
  {
    return fieldE01GCAPRD.getBigDecimal();
  }

  /**
  * Set field E01GCNLNS using a String value.
  */
  public void setE01GCNLNS(String newvalue)
  {
    fieldE01GCNLNS.setString(newvalue);
  }

  /**
  * Get value of field E01GCNLNS as a String.
  */
  public String getE01GCNLNS()
  {
    return fieldE01GCNLNS.getString();
  }

  /**
  * Set numeric field E01GCNLNS using a BigDecimal value.
  */
  public void setE01GCNLNS(BigDecimal newvalue)
  {
    fieldE01GCNLNS.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01GCNLNS as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01GCNLNS()
  {
    return fieldE01GCNLNS.getBigDecimal();
  }

  /**
  * Set field E01GCNCKP using a String value.
  */
  public void setE01GCNCKP(String newvalue)
  {
    fieldE01GCNCKP.setString(newvalue);
  }

  /**
  * Get value of field E01GCNCKP as a String.
  */
  public String getE01GCNCKP()
  {
    return fieldE01GCNCKP.getString();
  }

  /**
  * Set numeric field E01GCNCKP using a BigDecimal value.
  */
  public void setE01GCNCKP(BigDecimal newvalue)
  {
    fieldE01GCNCKP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01GCNCKP as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01GCNCKP()
  {
    return fieldE01GCNCKP.getBigDecimal();
  }

  /**
  * Set field E01GCNCKA using a String value.
  */
  public void setE01GCNCKA(String newvalue)
  {
    fieldE01GCNCKA.setString(newvalue);
  }

  /**
  * Get value of field E01GCNCKA as a String.
  */
  public String getE01GCNCKA()
  {
    return fieldE01GCNCKA.getString();
  }

  /**
  * Set numeric field E01GCNCKA using a BigDecimal value.
  */
  public void setE01GCNCKA(BigDecimal newvalue)
  {
    fieldE01GCNCKA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01GCNCKA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01GCNCKA()
  {
    return fieldE01GCNCKA.getBigDecimal();
  }

  /**
  * Set field E01GCNPAC using a String value.
  */
  public void setE01GCNPAC(String newvalue)
  {
    fieldE01GCNPAC.setString(newvalue);
  }

  /**
  * Get value of field E01GCNPAC as a String.
  */
  public String getE01GCNPAC()
  {
    return fieldE01GCNPAC.getString();
  }

  /**
  * Set numeric field E01GCNPAC using a BigDecimal value.
  */
  public void setE01GCNPAC(BigDecimal newvalue)
  {
    fieldE01GCNPAC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01GCNPAC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01GCNPAC()
  {
    return fieldE01GCNPAC.getBigDecimal();
  }

  /**
  * Set field E01GCSCNT using a String value.
  */
  public void setE01GCSCNT(String newvalue)
  {
    fieldE01GCSCNT.setString(newvalue);
  }

  /**
  * Get value of field E01GCSCNT as a String.
  */
  public String getE01GCSCNT()
  {
    return fieldE01GCSCNT.getString();
  }

  /**
  * Set numeric field E01GCSCNT using a BigDecimal value.
  */
  public void setE01GCSCNT(BigDecimal newvalue)
  {
    fieldE01GCSCNT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01GCSCNT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01GCSCNT()
  {
    return fieldE01GCSCNT.getBigDecimal();
  }

  /**
  * Set field E01GCPCBR using a String value.
  */
  public void setE01GCPCBR(String newvalue)
  {
    fieldE01GCPCBR.setString(newvalue);
  }

  /**
  * Get value of field E01GCPCBR as a String.
  */
  public String getE01GCPCBR()
  {
    return fieldE01GCPCBR.getString();
  }

  /**
  * Set numeric field E01GCPCBR using a BigDecimal value.
  */
  public void setE01GCPCBR(BigDecimal newvalue)
  {
    fieldE01GCPCBR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01GCPCBR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01GCPCBR()
  {
    return fieldE01GCPCBR.getBigDecimal();
  }

  /**
  * Set field E01GCVNPY using a String value.
  */
  public void setE01GCVNPY(String newvalue)
  {
    fieldE01GCVNPY.setString(newvalue);
  }

  /**
  * Get value of field E01GCVNPY as a String.
  */
  public String getE01GCVNPY()
  {
    return fieldE01GCVNPY.getString();
  }

  /**
  * Set numeric field E01GCVNPY using a BigDecimal value.
  */
  public void setE01GCVNPY(BigDecimal newvalue)
  {
    fieldE01GCVNPY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01GCVNPY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01GCVNPY()
  {
    return fieldE01GCVNPY.getBigDecimal();
  }

  /**
  * Set field E01GCVNPM using a String value.
  */
  public void setE01GCVNPM(String newvalue)
  {
    fieldE01GCVNPM.setString(newvalue);
  }

  /**
  * Get value of field E01GCVNPM as a String.
  */
  public String getE01GCVNPM()
  {
    return fieldE01GCVNPM.getString();
  }

  /**
  * Set numeric field E01GCVNPM using a BigDecimal value.
  */
  public void setE01GCVNPM(BigDecimal newvalue)
  {
    fieldE01GCVNPM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01GCVNPM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01GCVNPM()
  {
    return fieldE01GCVNPM.getBigDecimal();
  }

  /**
  * Set field E01GCVNPD using a String value.
  */
  public void setE01GCVNPD(String newvalue)
  {
    fieldE01GCVNPD.setString(newvalue);
  }

  /**
  * Get value of field E01GCVNPD as a String.
  */
  public String getE01GCVNPD()
  {
    return fieldE01GCVNPD.getString();
  }

  /**
  * Set numeric field E01GCVNPD using a BigDecimal value.
  */
  public void setE01GCVNPD(BigDecimal newvalue)
  {
    fieldE01GCVNPD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01GCVNPD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01GCVNPD()
  {
    return fieldE01GCVNPD.getBigDecimal();
  }

  /**
  * Set field E01GCTPRT using a String value.
  */
  public void setE01GCTPRT(String newvalue)
  {
    fieldE01GCTPRT.setString(newvalue);
  }

  /**
  * Get value of field E01GCTPRT as a String.
  */
  public String getE01GCTPRT()
  {
    return fieldE01GCTPRT.getString();
  }

  /**
  * Set field E01GCDCRT using a String value.
  */
  public void setE01GCDCRT(String newvalue)
  {
    fieldE01GCDCRT.setString(newvalue);
  }

  /**
  * Get value of field E01GCDCRT as a String.
  */
  public String getE01GCDCRT()
  {
    return fieldE01GCDCRT.getString();
  }

  /**
  * Set field E01INDOPE using a String value.
  */
  public void setE01INDOPE(String newvalue)
  {
    fieldE01INDOPE.setString(newvalue);
  }

  /**
  * Get value of field E01INDOPE as a String.
  */
  public String getE01INDOPE()
  {
    return fieldE01INDOPE.getString();
  }

}
