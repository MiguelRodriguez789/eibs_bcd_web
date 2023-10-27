package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EPV116001 physical file definition.
* 
* File level identifier is 1161101092420.
* Record format level identifier is 42E3C74D87C3E.
*/

public class EPV116001Message extends MessageRecord
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
                                     "E01PVTCUN",
                                     "E01PVTNUM",
                                     "E01PVTSEQ",
                                     "E01PVTCOD",
                                     "E01PVTNTR",
                                     "E01PVTCAN",
                                     "E01PVTVAU",
                                     "E01PVTAMT",
                                     "E01NOMBRE",
                                     "E01DESCRI",
                                     "E01NUMREC"
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
                                   "E01PVTCUN",
                                   "E01PVTNUM",
                                   "E01PVTSEQ",
                                   "E01PVTCOD",
                                   "E01PVTNTR",
                                   "E01PVTCAN",
                                   "E01PVTVAU",
                                   "E01PVTAMT",
                                   "E01NOMBRE",
                                   "E01DESCRI",
                                   "E01NUMREC"
                                 };
  final static String fid = "1161101092420";
  final static String rid = "42E3C74D87C3E";
  final static String fmtname = "EPV116001";
  final int FIELDCOUNT = 20;
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
  private DecimalField fieldE01PVTCUN = null;
  private DecimalField fieldE01PVTNUM = null;
  private DecimalField fieldE01PVTSEQ = null;
  private CharacterField fieldE01PVTCOD = null;
  private CharacterField fieldE01PVTNTR = null;
  private DecimalField fieldE01PVTCAN = null;
  private DecimalField fieldE01PVTVAU = null;
  private DecimalField fieldE01PVTAMT = null;
  private CharacterField fieldE01NOMBRE = null;
  private CharacterField fieldE01DESCRI = null;
  private DecimalField fieldE01NUMREC = null;

  /**
  * Constructor for EPV116001Message.
  */
  public EPV116001Message()
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
    recordsize = 228;
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
    fields[9] = fieldE01PVTCUN =
    new DecimalField(message, HEADERSIZE + 42, 10, 0, "E01PVTCUN");
    fields[10] = fieldE01PVTNUM =
    new DecimalField(message, HEADERSIZE + 52, 13, 0, "E01PVTNUM");
    fields[11] = fieldE01PVTSEQ =
    new DecimalField(message, HEADERSIZE + 65, 3, 0, "E01PVTSEQ");
    fields[12] = fieldE01PVTCOD =
    new CharacterField(message, HEADERSIZE + 68, 4, "E01PVTCOD");
    fields[13] = fieldE01PVTNTR =
    new CharacterField(message, HEADERSIZE + 72, 20, "E01PVTNTR");
    fields[14] = fieldE01PVTCAN =
    new DecimalField(message, HEADERSIZE + 92, 6, 0, "E01PVTCAN");
    fields[15] = fieldE01PVTVAU =
    new DecimalField(message, HEADERSIZE + 98, 17, 2, "E01PVTVAU");
    fields[16] = fieldE01PVTAMT =
    new DecimalField(message, HEADERSIZE + 115, 17, 2, "E01PVTAMT");
    fields[17] = fieldE01NOMBRE =
    new CharacterField(message, HEADERSIZE + 132, 45, "E01NOMBRE");
    fields[18] = fieldE01DESCRI =
    new CharacterField(message, HEADERSIZE + 177, 45, "E01DESCRI");
    fields[19] = fieldE01NUMREC =
    new DecimalField(message, HEADERSIZE + 222, 6, 0, "E01NUMREC");

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
  * Set field E01PVTCUN using a String value.
  */
  public void setE01PVTCUN(String newvalue)
  {
    fieldE01PVTCUN.setString(newvalue);
  }

  /**
  * Get value of field E01PVTCUN as a String.
  */
  public String getE01PVTCUN()
  {
    return fieldE01PVTCUN.getString();
  }

  /**
  * Set numeric field E01PVTCUN using a BigDecimal value.
  */
  public void setE01PVTCUN(BigDecimal newvalue)
  {
    fieldE01PVTCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PVTCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PVTCUN()
  {
    return fieldE01PVTCUN.getBigDecimal();
  }

  /**
  * Set field E01PVTNUM using a String value.
  */
  public void setE01PVTNUM(String newvalue)
  {
    fieldE01PVTNUM.setString(newvalue);
  }

  /**
  * Get value of field E01PVTNUM as a String.
  */
  public String getE01PVTNUM()
  {
    return fieldE01PVTNUM.getString();
  }

  /**
  * Set numeric field E01PVTNUM using a BigDecimal value.
  */
  public void setE01PVTNUM(BigDecimal newvalue)
  {
    fieldE01PVTNUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PVTNUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PVTNUM()
  {
    return fieldE01PVTNUM.getBigDecimal();
  }

  /**
  * Set field E01PVTSEQ using a String value.
  */
  public void setE01PVTSEQ(String newvalue)
  {
    fieldE01PVTSEQ.setString(newvalue);
  }

  /**
  * Get value of field E01PVTSEQ as a String.
  */
  public String getE01PVTSEQ()
  {
    return fieldE01PVTSEQ.getString();
  }

  /**
  * Set numeric field E01PVTSEQ using a BigDecimal value.
  */
  public void setE01PVTSEQ(BigDecimal newvalue)
  {
    fieldE01PVTSEQ.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PVTSEQ as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PVTSEQ()
  {
    return fieldE01PVTSEQ.getBigDecimal();
  }

  /**
  * Set field E01PVTCOD using a String value.
  */
  public void setE01PVTCOD(String newvalue)
  {
    fieldE01PVTCOD.setString(newvalue);
  }

  /**
  * Get value of field E01PVTCOD as a String.
  */
  public String getE01PVTCOD()
  {
    return fieldE01PVTCOD.getString();
  }

  /**
  * Set field E01PVTNTR using a String value.
  */
  public void setE01PVTNTR(String newvalue)
  {
    fieldE01PVTNTR.setString(newvalue);
  }

  /**
  * Get value of field E01PVTNTR as a String.
  */
  public String getE01PVTNTR()
  {
    return fieldE01PVTNTR.getString();
  }

  /**
  * Set field E01PVTCAN using a String value.
  */
  public void setE01PVTCAN(String newvalue)
  {
    fieldE01PVTCAN.setString(newvalue);
  }

  /**
  * Get value of field E01PVTCAN as a String.
  */
  public String getE01PVTCAN()
  {
    return fieldE01PVTCAN.getString();
  }

  /**
  * Set numeric field E01PVTCAN using a BigDecimal value.
  */
  public void setE01PVTCAN(BigDecimal newvalue)
  {
    fieldE01PVTCAN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PVTCAN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PVTCAN()
  {
    return fieldE01PVTCAN.getBigDecimal();
  }

  /**
  * Set field E01PVTVAU using a String value.
  */
  public void setE01PVTVAU(String newvalue)
  {
    fieldE01PVTVAU.setString(newvalue);
  }

  /**
  * Get value of field E01PVTVAU as a String.
  */
  public String getE01PVTVAU()
  {
    return fieldE01PVTVAU.getString();
  }

  /**
  * Set numeric field E01PVTVAU using a BigDecimal value.
  */
  public void setE01PVTVAU(BigDecimal newvalue)
  {
    fieldE01PVTVAU.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PVTVAU as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PVTVAU()
  {
    return fieldE01PVTVAU.getBigDecimal();
  }

  /**
  * Set field E01PVTAMT using a String value.
  */
  public void setE01PVTAMT(String newvalue)
  {
    fieldE01PVTAMT.setString(newvalue);
  }

  /**
  * Get value of field E01PVTAMT as a String.
  */
  public String getE01PVTAMT()
  {
    return fieldE01PVTAMT.getString();
  }

  /**
  * Set numeric field E01PVTAMT using a BigDecimal value.
  */
  public void setE01PVTAMT(BigDecimal newvalue)
  {
    fieldE01PVTAMT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PVTAMT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PVTAMT()
  {
    return fieldE01PVTAMT.getBigDecimal();
  }

  /**
  * Set field E01NOMBRE using a String value.
  */
  public void setE01NOMBRE(String newvalue)
  {
    fieldE01NOMBRE.setString(newvalue);
  }

  /**
  * Get value of field E01NOMBRE as a String.
  */
  public String getE01NOMBRE()
  {
    return fieldE01NOMBRE.getString();
  }

  /**
  * Set field E01DESCRI using a String value.
  */
  public void setE01DESCRI(String newvalue)
  {
    fieldE01DESCRI.setString(newvalue);
  }

  /**
  * Get value of field E01DESCRI as a String.
  */
  public String getE01DESCRI()
  {
    return fieldE01DESCRI.getString();
  }

  /**
  * Set field E01NUMREC using a String value.
  */
  public void setE01NUMREC(String newvalue)
  {
    fieldE01NUMREC.setString(newvalue);
  }

  /**
  * Get value of field E01NUMREC as a String.
  */
  public String getE01NUMREC()
  {
    return fieldE01NUMREC.getString();
  }

  /**
  * Set numeric field E01NUMREC using a BigDecimal value.
  */
  public void setE01NUMREC(BigDecimal newvalue)
  {
    fieldE01NUMREC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01NUMREC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01NUMREC()
  {
    return fieldE01NUMREC.getBigDecimal();
  }

}
