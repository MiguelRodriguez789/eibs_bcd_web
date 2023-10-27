package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDL030502 physical file definition.
* 
* File level identifier is 1190220094053.
* Record format level identifier is 2BBAF1079E02F.
*/

public class EDL030502Message extends MessageRecord
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
                                     "E02PRIACC",
                                     "E02RELACC",
                                     "E02RELACD",
                                     "E02RELNME",
                                     "E02RELSTS",
                                     "E02RELODM",
                                     "E02RELODD",
                                     "E02RELODY",
                                     "E02RELMAM",
                                     "E02RELMAD",
                                     "E02RELMAY",
                                     "E02RELOAM",
                                     "E02RELPRI",
                                     "E02RELINT",
                                     "E02RELTOT",
                                     "E02RELRTE",
                                     "E02RELTYP",
                                     "E02DSCTYP",
                                     "E02RELUC1",
                                     "E02RELUC2",
                                     "E02RELUC3",
                                     "E02RELDS1",
                                     "E02RELDS2",
                                     "E02RELDS3",
                                     "E02RELAM1",
                                     "E02RELAM2",
                                     "E02RELAM3",
                                     "E02RELRT1",
                                     "E02RELRT2",
                                     "E02RELRT3",
                                     "E02ENDFLD"
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
                                   "E02PRIACC",
                                   "E02RELACC",
                                   "E02RELACD",
                                   "E02RELNME",
                                   "E02RELSTS",
                                   "E02RELODM",
                                   "E02RELODD",
                                   "E02RELODY",
                                   "E02RELMAM",
                                   "E02RELMAD",
                                   "E02RELMAY",
                                   "E02RELOAM",
                                   "E02RELPRI",
                                   "E02RELINT",
                                   "E02RELTOT",
                                   "E02RELRTE",
                                   "E02RELTYP",
                                   "E02DSCTYP",
                                   "E02RELUC1",
                                   "E02RELUC2",
                                   "E02RELUC3",
                                   "E02RELDS1",
                                   "E02RELDS2",
                                   "E02RELDS3",
                                   "E02RELAM1",
                                   "E02RELAM2",
                                   "E02RELAM3",
                                   "E02RELRT1",
                                   "E02RELRT2",
                                   "E02RELRT3",
                                   "E02ENDFLD"
                                 };
  final static String fid = "1190220094053";
  final static String rid = "2BBAF1079E02F";
  final static String fmtname = "EDL030502";
  final int FIELDCOUNT = 40;
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
  private DecimalField fieldE02PRIACC = null;
  private DecimalField fieldE02RELACC = null;
  private CharacterField fieldE02RELACD = null;
  private CharacterField fieldE02RELNME = null;
  private CharacterField fieldE02RELSTS = null;
  private DecimalField fieldE02RELODM = null;
  private DecimalField fieldE02RELODD = null;
  private DecimalField fieldE02RELODY = null;
  private DecimalField fieldE02RELMAM = null;
  private DecimalField fieldE02RELMAD = null;
  private DecimalField fieldE02RELMAY = null;
  private DecimalField fieldE02RELOAM = null;
  private DecimalField fieldE02RELPRI = null;
  private DecimalField fieldE02RELINT = null;
  private DecimalField fieldE02RELTOT = null;
  private DecimalField fieldE02RELRTE = null;
  private CharacterField fieldE02RELTYP = null;
  private CharacterField fieldE02DSCTYP = null;
  private CharacterField fieldE02RELUC1 = null;
  private CharacterField fieldE02RELUC2 = null;
  private CharacterField fieldE02RELUC3 = null;
  private CharacterField fieldE02RELDS1 = null;
  private CharacterField fieldE02RELDS2 = null;
  private CharacterField fieldE02RELDS3 = null;
  private DecimalField fieldE02RELAM1 = null;
  private DecimalField fieldE02RELAM2 = null;
  private DecimalField fieldE02RELAM3 = null;
  private DecimalField fieldE02RELRT1 = null;
  private DecimalField fieldE02RELRT2 = null;
  private DecimalField fieldE02RELRT3 = null;
  private CharacterField fieldE02ENDFLD = null;

  /**
  * Constructor for EDL030502Message.
  */
  public EDL030502Message()
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
    recordsize = 500;
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
    fields[9] = fieldE02PRIACC =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E02PRIACC");
    fields[10] = fieldE02RELACC =
    new DecimalField(message, HEADERSIZE + 55, 13, 0, "E02RELACC");
    fields[11] = fieldE02RELACD =
    new CharacterField(message, HEADERSIZE + 68, 2, "E02RELACD");
    fields[12] = fieldE02RELNME =
    new CharacterField(message, HEADERSIZE + 70, 60, "E02RELNME");
    fields[13] = fieldE02RELSTS =
    new CharacterField(message, HEADERSIZE + 130, 1, "E02RELSTS");
    fields[14] = fieldE02RELODM =
    new DecimalField(message, HEADERSIZE + 131, 3, 0, "E02RELODM");
    fields[15] = fieldE02RELODD =
    new DecimalField(message, HEADERSIZE + 134, 3, 0, "E02RELODD");
    fields[16] = fieldE02RELODY =
    new DecimalField(message, HEADERSIZE + 137, 5, 0, "E02RELODY");
    fields[17] = fieldE02RELMAM =
    new DecimalField(message, HEADERSIZE + 142, 3, 0, "E02RELMAM");
    fields[18] = fieldE02RELMAD =
    new DecimalField(message, HEADERSIZE + 145, 3, 0, "E02RELMAD");
    fields[19] = fieldE02RELMAY =
    new DecimalField(message, HEADERSIZE + 148, 5, 0, "E02RELMAY");
    fields[20] = fieldE02RELOAM =
    new DecimalField(message, HEADERSIZE + 153, 17, 2, "E02RELOAM");
    fields[21] = fieldE02RELPRI =
    new DecimalField(message, HEADERSIZE + 170, 17, 2, "E02RELPRI");
    fields[22] = fieldE02RELINT =
    new DecimalField(message, HEADERSIZE + 187, 17, 2, "E02RELINT");
    fields[23] = fieldE02RELTOT =
    new DecimalField(message, HEADERSIZE + 204, 17, 2, "E02RELTOT");
    fields[24] = fieldE02RELRTE =
    new DecimalField(message, HEADERSIZE + 221, 11, 6, "E02RELRTE");
    fields[25] = fieldE02RELTYP =
    new CharacterField(message, HEADERSIZE + 232, 1, "E02RELTYP");
    fields[26] = fieldE02DSCTYP =
    new CharacterField(message, HEADERSIZE + 233, 35, "E02DSCTYP");
    fields[27] = fieldE02RELUC1 =
    new CharacterField(message, HEADERSIZE + 268, 4, "E02RELUC1");
    fields[28] = fieldE02RELUC2 =
    new CharacterField(message, HEADERSIZE + 272, 4, "E02RELUC2");
    fields[29] = fieldE02RELUC3 =
    new CharacterField(message, HEADERSIZE + 276, 4, "E02RELUC3");
    fields[30] = fieldE02RELDS1 =
    new CharacterField(message, HEADERSIZE + 280, 45, "E02RELDS1");
    fields[31] = fieldE02RELDS2 =
    new CharacterField(message, HEADERSIZE + 325, 45, "E02RELDS2");
    fields[32] = fieldE02RELDS3 =
    new CharacterField(message, HEADERSIZE + 370, 45, "E02RELDS3");
    fields[33] = fieldE02RELAM1 =
    new DecimalField(message, HEADERSIZE + 415, 17, 2, "E02RELAM1");
    fields[34] = fieldE02RELAM2 =
    new DecimalField(message, HEADERSIZE + 432, 17, 2, "E02RELAM2");
    fields[35] = fieldE02RELAM3 =
    new DecimalField(message, HEADERSIZE + 449, 17, 2, "E02RELAM3");
    fields[36] = fieldE02RELRT1 =
    new DecimalField(message, HEADERSIZE + 466, 11, 6, "E02RELRT1");
    fields[37] = fieldE02RELRT2 =
    new DecimalField(message, HEADERSIZE + 477, 11, 6, "E02RELRT2");
    fields[38] = fieldE02RELRT3 =
    new DecimalField(message, HEADERSIZE + 488, 11, 6, "E02RELRT3");
    fields[39] = fieldE02ENDFLD =
    new CharacterField(message, HEADERSIZE + 499, 1, "E02ENDFLD");

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
  * Set field E02PRIACC using a String value.
  */
  public void setE02PRIACC(String newvalue)
  {
    fieldE02PRIACC.setString(newvalue);
  }

  /**
  * Get value of field E02PRIACC as a String.
  */
  public String getE02PRIACC()
  {
    return fieldE02PRIACC.getString();
  }

  /**
  * Set numeric field E02PRIACC using a BigDecimal value.
  */
  public void setE02PRIACC(BigDecimal newvalue)
  {
    fieldE02PRIACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02PRIACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02PRIACC()
  {
    return fieldE02PRIACC.getBigDecimal();
  }

  /**
  * Set field E02RELACC using a String value.
  */
  public void setE02RELACC(String newvalue)
  {
    fieldE02RELACC.setString(newvalue);
  }

  /**
  * Get value of field E02RELACC as a String.
  */
  public String getE02RELACC()
  {
    return fieldE02RELACC.getString();
  }

  /**
  * Set numeric field E02RELACC using a BigDecimal value.
  */
  public void setE02RELACC(BigDecimal newvalue)
  {
    fieldE02RELACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02RELACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02RELACC()
  {
    return fieldE02RELACC.getBigDecimal();
  }

  /**
  * Set field E02RELACD using a String value.
  */
  public void setE02RELACD(String newvalue)
  {
    fieldE02RELACD.setString(newvalue);
  }

  /**
  * Get value of field E02RELACD as a String.
  */
  public String getE02RELACD()
  {
    return fieldE02RELACD.getString();
  }

  /**
  * Set field E02RELNME using a String value.
  */
  public void setE02RELNME(String newvalue)
  {
    fieldE02RELNME.setString(newvalue);
  }

  /**
  * Get value of field E02RELNME as a String.
  */
  public String getE02RELNME()
  {
    return fieldE02RELNME.getString();
  }

  /**
  * Set field E02RELSTS using a String value.
  */
  public void setE02RELSTS(String newvalue)
  {
    fieldE02RELSTS.setString(newvalue);
  }

  /**
  * Get value of field E02RELSTS as a String.
  */
  public String getE02RELSTS()
  {
    return fieldE02RELSTS.getString();
  }

  /**
  * Set field E02RELODM using a String value.
  */
  public void setE02RELODM(String newvalue)
  {
    fieldE02RELODM.setString(newvalue);
  }

  /**
  * Get value of field E02RELODM as a String.
  */
  public String getE02RELODM()
  {
    return fieldE02RELODM.getString();
  }

  /**
  * Set numeric field E02RELODM using a BigDecimal value.
  */
  public void setE02RELODM(BigDecimal newvalue)
  {
    fieldE02RELODM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02RELODM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02RELODM()
  {
    return fieldE02RELODM.getBigDecimal();
  }

  /**
  * Set field E02RELODD using a String value.
  */
  public void setE02RELODD(String newvalue)
  {
    fieldE02RELODD.setString(newvalue);
  }

  /**
  * Get value of field E02RELODD as a String.
  */
  public String getE02RELODD()
  {
    return fieldE02RELODD.getString();
  }

  /**
  * Set numeric field E02RELODD using a BigDecimal value.
  */
  public void setE02RELODD(BigDecimal newvalue)
  {
    fieldE02RELODD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02RELODD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02RELODD()
  {
    return fieldE02RELODD.getBigDecimal();
  }

  /**
  * Set field E02RELODY using a String value.
  */
  public void setE02RELODY(String newvalue)
  {
    fieldE02RELODY.setString(newvalue);
  }

  /**
  * Get value of field E02RELODY as a String.
  */
  public String getE02RELODY()
  {
    return fieldE02RELODY.getString();
  }

  /**
  * Set numeric field E02RELODY using a BigDecimal value.
  */
  public void setE02RELODY(BigDecimal newvalue)
  {
    fieldE02RELODY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02RELODY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02RELODY()
  {
    return fieldE02RELODY.getBigDecimal();
  }

  /**
  * Set field E02RELMAM using a String value.
  */
  public void setE02RELMAM(String newvalue)
  {
    fieldE02RELMAM.setString(newvalue);
  }

  /**
  * Get value of field E02RELMAM as a String.
  */
  public String getE02RELMAM()
  {
    return fieldE02RELMAM.getString();
  }

  /**
  * Set numeric field E02RELMAM using a BigDecimal value.
  */
  public void setE02RELMAM(BigDecimal newvalue)
  {
    fieldE02RELMAM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02RELMAM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02RELMAM()
  {
    return fieldE02RELMAM.getBigDecimal();
  }

  /**
  * Set field E02RELMAD using a String value.
  */
  public void setE02RELMAD(String newvalue)
  {
    fieldE02RELMAD.setString(newvalue);
  }

  /**
  * Get value of field E02RELMAD as a String.
  */
  public String getE02RELMAD()
  {
    return fieldE02RELMAD.getString();
  }

  /**
  * Set numeric field E02RELMAD using a BigDecimal value.
  */
  public void setE02RELMAD(BigDecimal newvalue)
  {
    fieldE02RELMAD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02RELMAD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02RELMAD()
  {
    return fieldE02RELMAD.getBigDecimal();
  }

  /**
  * Set field E02RELMAY using a String value.
  */
  public void setE02RELMAY(String newvalue)
  {
    fieldE02RELMAY.setString(newvalue);
  }

  /**
  * Get value of field E02RELMAY as a String.
  */
  public String getE02RELMAY()
  {
    return fieldE02RELMAY.getString();
  }

  /**
  * Set numeric field E02RELMAY using a BigDecimal value.
  */
  public void setE02RELMAY(BigDecimal newvalue)
  {
    fieldE02RELMAY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02RELMAY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02RELMAY()
  {
    return fieldE02RELMAY.getBigDecimal();
  }

  /**
  * Set field E02RELOAM using a String value.
  */
  public void setE02RELOAM(String newvalue)
  {
    fieldE02RELOAM.setString(newvalue);
  }

  /**
  * Get value of field E02RELOAM as a String.
  */
  public String getE02RELOAM()
  {
    return fieldE02RELOAM.getString();
  }

  /**
  * Set numeric field E02RELOAM using a BigDecimal value.
  */
  public void setE02RELOAM(BigDecimal newvalue)
  {
    fieldE02RELOAM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02RELOAM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02RELOAM()
  {
    return fieldE02RELOAM.getBigDecimal();
  }

  /**
  * Set field E02RELPRI using a String value.
  */
  public void setE02RELPRI(String newvalue)
  {
    fieldE02RELPRI.setString(newvalue);
  }

  /**
  * Get value of field E02RELPRI as a String.
  */
  public String getE02RELPRI()
  {
    return fieldE02RELPRI.getString();
  }

  /**
  * Set numeric field E02RELPRI using a BigDecimal value.
  */
  public void setE02RELPRI(BigDecimal newvalue)
  {
    fieldE02RELPRI.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02RELPRI as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02RELPRI()
  {
    return fieldE02RELPRI.getBigDecimal();
  }

  /**
  * Set field E02RELINT using a String value.
  */
  public void setE02RELINT(String newvalue)
  {
    fieldE02RELINT.setString(newvalue);
  }

  /**
  * Get value of field E02RELINT as a String.
  */
  public String getE02RELINT()
  {
    return fieldE02RELINT.getString();
  }

  /**
  * Set numeric field E02RELINT using a BigDecimal value.
  */
  public void setE02RELINT(BigDecimal newvalue)
  {
    fieldE02RELINT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02RELINT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02RELINT()
  {
    return fieldE02RELINT.getBigDecimal();
  }

  /**
  * Set field E02RELTOT using a String value.
  */
  public void setE02RELTOT(String newvalue)
  {
    fieldE02RELTOT.setString(newvalue);
  }

  /**
  * Get value of field E02RELTOT as a String.
  */
  public String getE02RELTOT()
  {
    return fieldE02RELTOT.getString();
  }

  /**
  * Set numeric field E02RELTOT using a BigDecimal value.
  */
  public void setE02RELTOT(BigDecimal newvalue)
  {
    fieldE02RELTOT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02RELTOT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02RELTOT()
  {
    return fieldE02RELTOT.getBigDecimal();
  }

  /**
  * Set field E02RELRTE using a String value.
  */
  public void setE02RELRTE(String newvalue)
  {
    fieldE02RELRTE.setString(newvalue);
  }

  /**
  * Get value of field E02RELRTE as a String.
  */
  public String getE02RELRTE()
  {
    return fieldE02RELRTE.getString();
  }

  /**
  * Set numeric field E02RELRTE using a BigDecimal value.
  */
  public void setE02RELRTE(BigDecimal newvalue)
  {
    fieldE02RELRTE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02RELRTE as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02RELRTE()
  {
    return fieldE02RELRTE.getBigDecimal();
  }

  /**
  * Set field E02RELTYP using a String value.
  */
  public void setE02RELTYP(String newvalue)
  {
    fieldE02RELTYP.setString(newvalue);
  }

  /**
  * Get value of field E02RELTYP as a String.
  */
  public String getE02RELTYP()
  {
    return fieldE02RELTYP.getString();
  }

  /**
  * Set field E02DSCTYP using a String value.
  */
  public void setE02DSCTYP(String newvalue)
  {
    fieldE02DSCTYP.setString(newvalue);
  }

  /**
  * Get value of field E02DSCTYP as a String.
  */
  public String getE02DSCTYP()
  {
    return fieldE02DSCTYP.getString();
  }

  /**
  * Set field E02RELUC1 using a String value.
  */
  public void setE02RELUC1(String newvalue)
  {
    fieldE02RELUC1.setString(newvalue);
  }

  /**
  * Get value of field E02RELUC1 as a String.
  */
  public String getE02RELUC1()
  {
    return fieldE02RELUC1.getString();
  }

  /**
  * Set field E02RELUC2 using a String value.
  */
  public void setE02RELUC2(String newvalue)
  {
    fieldE02RELUC2.setString(newvalue);
  }

  /**
  * Get value of field E02RELUC2 as a String.
  */
  public String getE02RELUC2()
  {
    return fieldE02RELUC2.getString();
  }

  /**
  * Set field E02RELUC3 using a String value.
  */
  public void setE02RELUC3(String newvalue)
  {
    fieldE02RELUC3.setString(newvalue);
  }

  /**
  * Get value of field E02RELUC3 as a String.
  */
  public String getE02RELUC3()
  {
    return fieldE02RELUC3.getString();
  }

  /**
  * Set field E02RELDS1 using a String value.
  */
  public void setE02RELDS1(String newvalue)
  {
    fieldE02RELDS1.setString(newvalue);
  }

  /**
  * Get value of field E02RELDS1 as a String.
  */
  public String getE02RELDS1()
  {
    return fieldE02RELDS1.getString();
  }

  /**
  * Set field E02RELDS2 using a String value.
  */
  public void setE02RELDS2(String newvalue)
  {
    fieldE02RELDS2.setString(newvalue);
  }

  /**
  * Get value of field E02RELDS2 as a String.
  */
  public String getE02RELDS2()
  {
    return fieldE02RELDS2.getString();
  }

  /**
  * Set field E02RELDS3 using a String value.
  */
  public void setE02RELDS3(String newvalue)
  {
    fieldE02RELDS3.setString(newvalue);
  }

  /**
  * Get value of field E02RELDS3 as a String.
  */
  public String getE02RELDS3()
  {
    return fieldE02RELDS3.getString();
  }

  /**
  * Set field E02RELAM1 using a String value.
  */
  public void setE02RELAM1(String newvalue)
  {
    fieldE02RELAM1.setString(newvalue);
  }

  /**
  * Get value of field E02RELAM1 as a String.
  */
  public String getE02RELAM1()
  {
    return fieldE02RELAM1.getString();
  }

  /**
  * Set numeric field E02RELAM1 using a BigDecimal value.
  */
  public void setE02RELAM1(BigDecimal newvalue)
  {
    fieldE02RELAM1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02RELAM1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02RELAM1()
  {
    return fieldE02RELAM1.getBigDecimal();
  }

  /**
  * Set field E02RELAM2 using a String value.
  */
  public void setE02RELAM2(String newvalue)
  {
    fieldE02RELAM2.setString(newvalue);
  }

  /**
  * Get value of field E02RELAM2 as a String.
  */
  public String getE02RELAM2()
  {
    return fieldE02RELAM2.getString();
  }

  /**
  * Set numeric field E02RELAM2 using a BigDecimal value.
  */
  public void setE02RELAM2(BigDecimal newvalue)
  {
    fieldE02RELAM2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02RELAM2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02RELAM2()
  {
    return fieldE02RELAM2.getBigDecimal();
  }

  /**
  * Set field E02RELAM3 using a String value.
  */
  public void setE02RELAM3(String newvalue)
  {
    fieldE02RELAM3.setString(newvalue);
  }

  /**
  * Get value of field E02RELAM3 as a String.
  */
  public String getE02RELAM3()
  {
    return fieldE02RELAM3.getString();
  }

  /**
  * Set numeric field E02RELAM3 using a BigDecimal value.
  */
  public void setE02RELAM3(BigDecimal newvalue)
  {
    fieldE02RELAM3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02RELAM3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02RELAM3()
  {
    return fieldE02RELAM3.getBigDecimal();
  }

  /**
  * Set field E02RELRT1 using a String value.
  */
  public void setE02RELRT1(String newvalue)
  {
    fieldE02RELRT1.setString(newvalue);
  }

  /**
  * Get value of field E02RELRT1 as a String.
  */
  public String getE02RELRT1()
  {
    return fieldE02RELRT1.getString();
  }

  /**
  * Set numeric field E02RELRT1 using a BigDecimal value.
  */
  public void setE02RELRT1(BigDecimal newvalue)
  {
    fieldE02RELRT1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02RELRT1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02RELRT1()
  {
    return fieldE02RELRT1.getBigDecimal();
  }

  /**
  * Set field E02RELRT2 using a String value.
  */
  public void setE02RELRT2(String newvalue)
  {
    fieldE02RELRT2.setString(newvalue);
  }

  /**
  * Get value of field E02RELRT2 as a String.
  */
  public String getE02RELRT2()
  {
    return fieldE02RELRT2.getString();
  }

  /**
  * Set numeric field E02RELRT2 using a BigDecimal value.
  */
  public void setE02RELRT2(BigDecimal newvalue)
  {
    fieldE02RELRT2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02RELRT2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02RELRT2()
  {
    return fieldE02RELRT2.getBigDecimal();
  }

  /**
  * Set field E02RELRT3 using a String value.
  */
  public void setE02RELRT3(String newvalue)
  {
    fieldE02RELRT3.setString(newvalue);
  }

  /**
  * Get value of field E02RELRT3 as a String.
  */
  public String getE02RELRT3()
  {
    return fieldE02RELRT3.getString();
  }

  /**
  * Set numeric field E02RELRT3 using a BigDecimal value.
  */
  public void setE02RELRT3(BigDecimal newvalue)
  {
    fieldE02RELRT3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02RELRT3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02RELRT3()
  {
    return fieldE02RELRT3.getBigDecimal();
  }

  /**
  * Set field E02ENDFLD using a String value.
  */
  public void setE02ENDFLD(String newvalue)
  {
    fieldE02ENDFLD.setString(newvalue);
  }

  /**
  * Get value of field E02ENDFLD as a String.
  */
  public String getE02ENDFLD()
  {
    return fieldE02ENDFLD.getString();
  }

}
