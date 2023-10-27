package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EGL810001 physical file definition.
* 
* File level identifier is 1160518140256.
* Record format level identifier is 3F49D4C22810F.
*/

public class EGL810001Message extends MessageRecord
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
                                     "E01REPNAM",
                                     "E01JOBNUM",
                                     "E01MONTH",
                                     "E01YEAR",
                                     "E01PRCTYP",
                                     "E01TYPSOL",
                                     "E01NUMORD",
                                     "E01NUMTRA",
                                     "E01FILE1",
                                     "E01FILE2",
                                     "E01FILE3",
                                     "E01FILE4",
                                     "E01FILE5",
                                     "E01FILE6",
                                     "E01FILE7",
                                     "E01FILE8",
                                     "E01FILE9",
                                     "E01FILE",
                                     "E01SEQ",
                                     "E01DATA"
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
                                   "E01REPNAM",
                                   "E01JOBNUM",
                                   "E01MONTH",
                                   "E01YEAR",
                                   "E01PRCTYP",
                                   "E01TYPSOL",
                                   "E01NUMORD",
                                   "E01NUMTRA",
                                   "E01FILE1",
                                   "E01FILE2",
                                   "E01FILE3",
                                   "E01FILE4",
                                   "E01FILE5",
                                   "E01FILE6",
                                   "E01FILE7",
                                   "E01FILE8",
                                   "E01FILE9",
                                   "E01FILE",
                                   "E01SEQ",
                                   "E01DATA"
                                 };
  final static String fid = "1160518140256";
  final static String rid = "3F49D4C22810F";
  final static String fmtname = "EGL810001";
  final int FIELDCOUNT = 29;
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
  private CharacterField fieldE01REPNAM = null;
  private CharacterField fieldE01JOBNUM = null;
  private DecimalField fieldE01MONTH = null;
  private DecimalField fieldE01YEAR = null;
  private CharacterField fieldE01PRCTYP = null;
  private CharacterField fieldE01TYPSOL = null;
  private CharacterField fieldE01NUMORD = null;
  private CharacterField fieldE01NUMTRA = null;
  private CharacterField fieldE01FILE1 = null;
  private CharacterField fieldE01FILE2 = null;
  private CharacterField fieldE01FILE3 = null;
  private CharacterField fieldE01FILE4 = null;
  private CharacterField fieldE01FILE5 = null;
  private CharacterField fieldE01FILE6 = null;
  private CharacterField fieldE01FILE7 = null;
  private CharacterField fieldE01FILE8 = null;
  private CharacterField fieldE01FILE9 = null;
  private CharacterField fieldE01FILE = null;
  private DecimalField fieldE01SEQ = null;
  private CharacterField fieldE01DATA = null;

  /**
  * Constructor for EGL810001Message.
  */
  public EGL810001Message()
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
    recordsize = 4473;
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
    fields[9] = fieldE01REPNAM =
    new CharacterField(message, HEADERSIZE + 42, 10, "E01REPNAM");
    fields[10] = fieldE01JOBNUM =
    new CharacterField(message, HEADERSIZE + 52, 6, "E01JOBNUM");
    fields[11] = fieldE01MONTH =
    new DecimalField(message, HEADERSIZE + 58, 3, 0, "E01MONTH");
    fields[12] = fieldE01YEAR =
    new DecimalField(message, HEADERSIZE + 61, 5, 0, "E01YEAR");
    fields[13] = fieldE01PRCTYP =
    new CharacterField(message, HEADERSIZE + 66, 1, "E01PRCTYP");
    fields[14] = fieldE01TYPSOL =
    new CharacterField(message, HEADERSIZE + 67, 2, "E01TYPSOL");
    fields[15] = fieldE01NUMORD =
    new CharacterField(message, HEADERSIZE + 69, 13, "E01NUMORD");
    fields[16] = fieldE01NUMTRA =
    new CharacterField(message, HEADERSIZE + 82, 10, "E01NUMTRA");
    fields[17] = fieldE01FILE1 =
    new CharacterField(message, HEADERSIZE + 92, 1, "E01FILE1");
    fields[18] = fieldE01FILE2 =
    new CharacterField(message, HEADERSIZE + 93, 1, "E01FILE2");
    fields[19] = fieldE01FILE3 =
    new CharacterField(message, HEADERSIZE + 94, 1, "E01FILE3");
    fields[20] = fieldE01FILE4 =
    new CharacterField(message, HEADERSIZE + 95, 1, "E01FILE4");
    fields[21] = fieldE01FILE5 =
    new CharacterField(message, HEADERSIZE + 96, 1, "E01FILE5");
    fields[22] = fieldE01FILE6 =
    new CharacterField(message, HEADERSIZE + 97, 1, "E01FILE6");
    fields[23] = fieldE01FILE7 =
    new CharacterField(message, HEADERSIZE + 98, 1, "E01FILE7");
    fields[24] = fieldE01FILE8 =
    new CharacterField(message, HEADERSIZE + 99, 1, "E01FILE8");
    fields[25] = fieldE01FILE9 =
    new CharacterField(message, HEADERSIZE + 100, 1, "E01FILE9");
    fields[26] = fieldE01FILE =
    new CharacterField(message, HEADERSIZE + 101, 270, "E01FILE");
    fields[27] = fieldE01SEQ =
    new DecimalField(message, HEADERSIZE + 371, 6, 0, "E01SEQ");
    fields[28] = fieldE01DATA =
    new CharacterField(message, HEADERSIZE + 377, 4096, "E01DATA");

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
  * Set field E01REPNAM using a String value.
  */
  public void setE01REPNAM(String newvalue)
  {
    fieldE01REPNAM.setString(newvalue);
  }

  /**
  * Get value of field E01REPNAM as a String.
  */
  public String getE01REPNAM()
  {
    return fieldE01REPNAM.getString();
  }

  /**
  * Set field E01JOBNUM using a String value.
  */
  public void setE01JOBNUM(String newvalue)
  {
    fieldE01JOBNUM.setString(newvalue);
  }

  /**
  * Get value of field E01JOBNUM as a String.
  */
  public String getE01JOBNUM()
  {
    return fieldE01JOBNUM.getString();
  }

  /**
  * Set field E01MONTH using a String value.
  */
  public void setE01MONTH(String newvalue)
  {
    fieldE01MONTH.setString(newvalue);
  }

  /**
  * Get value of field E01MONTH as a String.
  */
  public String getE01MONTH()
  {
    return fieldE01MONTH.getString();
  }

  /**
  * Set numeric field E01MONTH using a BigDecimal value.
  */
  public void setE01MONTH(BigDecimal newvalue)
  {
    fieldE01MONTH.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01MONTH as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01MONTH()
  {
    return fieldE01MONTH.getBigDecimal();
  }

  /**
  * Set field E01YEAR using a String value.
  */
  public void setE01YEAR(String newvalue)
  {
    fieldE01YEAR.setString(newvalue);
  }

  /**
  * Get value of field E01YEAR as a String.
  */
  public String getE01YEAR()
  {
    return fieldE01YEAR.getString();
  }

  /**
  * Set numeric field E01YEAR using a BigDecimal value.
  */
  public void setE01YEAR(BigDecimal newvalue)
  {
    fieldE01YEAR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01YEAR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01YEAR()
  {
    return fieldE01YEAR.getBigDecimal();
  }

  /**
  * Set field E01PRCTYP using a String value.
  */
  public void setE01PRCTYP(String newvalue)
  {
    fieldE01PRCTYP.setString(newvalue);
  }

  /**
  * Get value of field E01PRCTYP as a String.
  */
  public String getE01PRCTYP()
  {
    return fieldE01PRCTYP.getString();
  }

  /**
  * Set field E01TYPSOL using a String value.
  */
  public void setE01TYPSOL(String newvalue)
  {
    fieldE01TYPSOL.setString(newvalue);
  }

  /**
  * Get value of field E01TYPSOL as a String.
  */
  public String getE01TYPSOL()
  {
    return fieldE01TYPSOL.getString();
  }

  /**
  * Set field E01NUMORD using a String value.
  */
  public void setE01NUMORD(String newvalue)
  {
    fieldE01NUMORD.setString(newvalue);
  }

  /**
  * Get value of field E01NUMORD as a String.
  */
  public String getE01NUMORD()
  {
    return fieldE01NUMORD.getString();
  }

  /**
  * Set field E01NUMTRA using a String value.
  */
  public void setE01NUMTRA(String newvalue)
  {
    fieldE01NUMTRA.setString(newvalue);
  }

  /**
  * Get value of field E01NUMTRA as a String.
  */
  public String getE01NUMTRA()
  {
    return fieldE01NUMTRA.getString();
  }

  /**
  * Set field E01FILE1 using a String value.
  */
  public void setE01FILE1(String newvalue)
  {
    fieldE01FILE1.setString(newvalue);
  }

  /**
  * Get value of field E01FILE1 as a String.
  */
  public String getE01FILE1()
  {
    return fieldE01FILE1.getString();
  }

  /**
  * Set field E01FILE2 using a String value.
  */
  public void setE01FILE2(String newvalue)
  {
    fieldE01FILE2.setString(newvalue);
  }

  /**
  * Get value of field E01FILE2 as a String.
  */
  public String getE01FILE2()
  {
    return fieldE01FILE2.getString();
  }

  /**
  * Set field E01FILE3 using a String value.
  */
  public void setE01FILE3(String newvalue)
  {
    fieldE01FILE3.setString(newvalue);
  }

  /**
  * Get value of field E01FILE3 as a String.
  */
  public String getE01FILE3()
  {
    return fieldE01FILE3.getString();
  }

  /**
  * Set field E01FILE4 using a String value.
  */
  public void setE01FILE4(String newvalue)
  {
    fieldE01FILE4.setString(newvalue);
  }

  /**
  * Get value of field E01FILE4 as a String.
  */
  public String getE01FILE4()
  {
    return fieldE01FILE4.getString();
  }

  /**
  * Set field E01FILE5 using a String value.
  */
  public void setE01FILE5(String newvalue)
  {
    fieldE01FILE5.setString(newvalue);
  }

  /**
  * Get value of field E01FILE5 as a String.
  */
  public String getE01FILE5()
  {
    return fieldE01FILE5.getString();
  }

  /**
  * Set field E01FILE6 using a String value.
  */
  public void setE01FILE6(String newvalue)
  {
    fieldE01FILE6.setString(newvalue);
  }

  /**
  * Get value of field E01FILE6 as a String.
  */
  public String getE01FILE6()
  {
    return fieldE01FILE6.getString();
  }

  /**
  * Set field E01FILE7 using a String value.
  */
  public void setE01FILE7(String newvalue)
  {
    fieldE01FILE7.setString(newvalue);
  }

  /**
  * Get value of field E01FILE7 as a String.
  */
  public String getE01FILE7()
  {
    return fieldE01FILE7.getString();
  }

  /**
  * Set field E01FILE8 using a String value.
  */
  public void setE01FILE8(String newvalue)
  {
    fieldE01FILE8.setString(newvalue);
  }

  /**
  * Get value of field E01FILE8 as a String.
  */
  public String getE01FILE8()
  {
    return fieldE01FILE8.getString();
  }

  /**
  * Set field E01FILE9 using a String value.
  */
  public void setE01FILE9(String newvalue)
  {
    fieldE01FILE9.setString(newvalue);
  }

  /**
  * Get value of field E01FILE9 as a String.
  */
  public String getE01FILE9()
  {
    return fieldE01FILE9.getString();
  }

  /**
  * Set field E01FILE using a String value.
  */
  public void setE01FILE(String newvalue)
  {
    fieldE01FILE.setString(newvalue);
  }

  /**
  * Get value of field E01FILE as a String.
  */
  public String getE01FILE()
  {
    return fieldE01FILE.getString();
  }

  /**
  * Set field E01SEQ using a String value.
  */
  public void setE01SEQ(String newvalue)
  {
    fieldE01SEQ.setString(newvalue);
  }

  /**
  * Get value of field E01SEQ as a String.
  */
  public String getE01SEQ()
  {
    return fieldE01SEQ.getString();
  }

  /**
  * Set numeric field E01SEQ using a BigDecimal value.
  */
  public void setE01SEQ(BigDecimal newvalue)
  {
    fieldE01SEQ.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SEQ as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SEQ()
  {
    return fieldE01SEQ.getBigDecimal();
  }

  /**
  * Set field E01DATA using a String value.
  */
  public void setE01DATA(String newvalue)
  {
    fieldE01DATA.setString(newvalue);
  }

  /**
  * Get value of field E01DATA as a String.
  */
  public String getE01DATA()
  {
    return fieldE01DATA.getString();
  }

}
