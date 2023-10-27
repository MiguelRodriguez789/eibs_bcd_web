package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EPV112001 physical file definition.
* 
* File level identifier is 1170119172352.
* Record format level identifier is 460A720BADB5B.
*/

public class EPV112001Message extends MessageRecord
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
                                     "E01ORLCUN",
                                     "E01ORLNUM",
                                     "E01ORLSEQ",
                                     "E01ORLOPC",
                                     "E01ORLDSC",
                                     "E01ORLTYP",
                                     "E01ORLOBK",
                                     "E01ORLOBR",
                                     "E01ORLOCY",
                                     "E01ORLOGL",
                                     "E01ORLOAC",
                                     "E01ORLOAM",
                                     "E01ORLMAF",
                                     "E01ORLRTE",
                                     "E01ORLNMH",
                                     "E01ORLTMH",
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
                                   "E01ORLCUN",
                                   "E01ORLNUM",
                                   "E01ORLSEQ",
                                   "E01ORLOPC",
                                   "E01ORLDSC",
                                   "E01ORLTYP",
                                   "E01ORLOBK",
                                   "E01ORLOBR",
                                   "E01ORLOCY",
                                   "E01ORLOGL",
                                   "E01ORLOAC",
                                   "E01ORLOAM",
                                   "E01ORLMAF",
                                   "E01ORLRTE",
                                   "E01ORLNMH",
                                   "E01ORLTMH",
                                   "E01NUMREC"
                                 };
  final static String fid = "1170119172352";
  final static String rid = "460A720BADB5B";
  final static String fmtname = "EPV112001";
  final int FIELDCOUNT = 26;
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
  private DecimalField fieldE01ORLCUN = null;
  private DecimalField fieldE01ORLNUM = null;
  private DecimalField fieldE01ORLSEQ = null;
  private CharacterField fieldE01ORLOPC = null;
  private CharacterField fieldE01ORLDSC = null;
  private CharacterField fieldE01ORLTYP = null;
  private CharacterField fieldE01ORLOBK = null;
  private DecimalField fieldE01ORLOBR = null;
  private CharacterField fieldE01ORLOCY = null;
  private DecimalField fieldE01ORLOGL = null;
  private DecimalField fieldE01ORLOAC = null;
  private DecimalField fieldE01ORLOAM = null;
  private DecimalField fieldE01ORLMAF = null;
  private DecimalField fieldE01ORLRTE = null;
  private DecimalField fieldE01ORLNMH = null;
  private DecimalField fieldE01ORLTMH = null;
  private DecimalField fieldE01NUMREC = null;

  /**
  * Constructor for EPV112001Message.
  */
  public EPV112001Message()
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
    recordsize = 215;
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
    fields[9] = fieldE01ORLCUN =
    new DecimalField(message, HEADERSIZE + 42, 10, 0, "E01ORLCUN");
    fields[10] = fieldE01ORLNUM =
    new DecimalField(message, HEADERSIZE + 52, 13, 0, "E01ORLNUM");
    fields[11] = fieldE01ORLSEQ =
    new DecimalField(message, HEADERSIZE + 65, 3, 0, "E01ORLSEQ");
    fields[12] = fieldE01ORLOPC =
    new CharacterField(message, HEADERSIZE + 68, 2, "E01ORLOPC");
    fields[13] = fieldE01ORLDSC =
    new CharacterField(message, HEADERSIZE + 70, 45, "E01ORLDSC");
    fields[14] = fieldE01ORLTYP =
    new CharacterField(message, HEADERSIZE + 115, 1, "E01ORLTYP");
    fields[15] = fieldE01ORLOBK =
    new CharacterField(message, HEADERSIZE + 116, 2, "E01ORLOBK");
    fields[16] = fieldE01ORLOBR =
    new DecimalField(message, HEADERSIZE + 118, 5, 0, "E01ORLOBR");
    fields[17] = fieldE01ORLOCY =
    new CharacterField(message, HEADERSIZE + 123, 3, "E01ORLOCY");
    fields[18] = fieldE01ORLOGL =
    new DecimalField(message, HEADERSIZE + 126, 17, 0, "E01ORLOGL");
    fields[19] = fieldE01ORLOAC =
    new DecimalField(message, HEADERSIZE + 143, 13, 0, "E01ORLOAC");
    fields[20] = fieldE01ORLOAM =
    new DecimalField(message, HEADERSIZE + 156, 17, 2, "E01ORLOAM");
    fields[21] = fieldE01ORLMAF =
    new DecimalField(message, HEADERSIZE + 173, 17, 2, "E01ORLMAF");
    fields[22] = fieldE01ORLRTE =
    new DecimalField(message, HEADERSIZE + 190, 11, 6, "E01ORLRTE");
    fields[23] = fieldE01ORLNMH =
    new DecimalField(message, HEADERSIZE + 201, 4, 0, "E01ORLNMH");
    fields[24] = fieldE01ORLTMH =
    new DecimalField(message, HEADERSIZE + 205, 4, 0, "E01ORLTMH");
    fields[25] = fieldE01NUMREC =
    new DecimalField(message, HEADERSIZE + 209, 6, 0, "E01NUMREC");

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
  * Set field E01ORLCUN using a String value.
  */
  public void setE01ORLCUN(String newvalue)
  {
    fieldE01ORLCUN.setString(newvalue);
  }

  /**
  * Get value of field E01ORLCUN as a String.
  */
  public String getE01ORLCUN()
  {
    return fieldE01ORLCUN.getString();
  }

  /**
  * Set numeric field E01ORLCUN using a BigDecimal value.
  */
  public void setE01ORLCUN(BigDecimal newvalue)
  {
    fieldE01ORLCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ORLCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ORLCUN()
  {
    return fieldE01ORLCUN.getBigDecimal();
  }

  /**
  * Set field E01ORLNUM using a String value.
  */
  public void setE01ORLNUM(String newvalue)
  {
    fieldE01ORLNUM.setString(newvalue);
  }

  /**
  * Get value of field E01ORLNUM as a String.
  */
  public String getE01ORLNUM()
  {
    return fieldE01ORLNUM.getString();
  }

  /**
  * Set numeric field E01ORLNUM using a BigDecimal value.
  */
  public void setE01ORLNUM(BigDecimal newvalue)
  {
    fieldE01ORLNUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ORLNUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ORLNUM()
  {
    return fieldE01ORLNUM.getBigDecimal();
  }

  /**
  * Set field E01ORLSEQ using a String value.
  */
  public void setE01ORLSEQ(String newvalue)
  {
    fieldE01ORLSEQ.setString(newvalue);
  }

  /**
  * Get value of field E01ORLSEQ as a String.
  */
  public String getE01ORLSEQ()
  {
    return fieldE01ORLSEQ.getString();
  }

  /**
  * Set numeric field E01ORLSEQ using a BigDecimal value.
  */
  public void setE01ORLSEQ(BigDecimal newvalue)
  {
    fieldE01ORLSEQ.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ORLSEQ as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ORLSEQ()
  {
    return fieldE01ORLSEQ.getBigDecimal();
  }

  /**
  * Set field E01ORLOPC using a String value.
  */
  public void setE01ORLOPC(String newvalue)
  {
    fieldE01ORLOPC.setString(newvalue);
  }

  /**
  * Get value of field E01ORLOPC as a String.
  */
  public String getE01ORLOPC()
  {
    return fieldE01ORLOPC.getString();
  }

  /**
  * Set field E01ORLDSC using a String value.
  */
  public void setE01ORLDSC(String newvalue)
  {
    fieldE01ORLDSC.setString(newvalue);
  }

  /**
  * Get value of field E01ORLDSC as a String.
  */
  public String getE01ORLDSC()
  {
    return fieldE01ORLDSC.getString();
  }

  /**
  * Set field E01ORLTYP using a String value.
  */
  public void setE01ORLTYP(String newvalue)
  {
    fieldE01ORLTYP.setString(newvalue);
  }

  /**
  * Get value of field E01ORLTYP as a String.
  */
  public String getE01ORLTYP()
  {
    return fieldE01ORLTYP.getString();
  }

  /**
  * Set field E01ORLOBK using a String value.
  */
  public void setE01ORLOBK(String newvalue)
  {
    fieldE01ORLOBK.setString(newvalue);
  }

  /**
  * Get value of field E01ORLOBK as a String.
  */
  public String getE01ORLOBK()
  {
    return fieldE01ORLOBK.getString();
  }

  /**
  * Set field E01ORLOBR using a String value.
  */
  public void setE01ORLOBR(String newvalue)
  {
    fieldE01ORLOBR.setString(newvalue);
  }

  /**
  * Get value of field E01ORLOBR as a String.
  */
  public String getE01ORLOBR()
  {
    return fieldE01ORLOBR.getString();
  }

  /**
  * Set numeric field E01ORLOBR using a BigDecimal value.
  */
  public void setE01ORLOBR(BigDecimal newvalue)
  {
    fieldE01ORLOBR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ORLOBR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ORLOBR()
  {
    return fieldE01ORLOBR.getBigDecimal();
  }

  /**
  * Set field E01ORLOCY using a String value.
  */
  public void setE01ORLOCY(String newvalue)
  {
    fieldE01ORLOCY.setString(newvalue);
  }

  /**
  * Get value of field E01ORLOCY as a String.
  */
  public String getE01ORLOCY()
  {
    return fieldE01ORLOCY.getString();
  }

  /**
  * Set field E01ORLOGL using a String value.
  */
  public void setE01ORLOGL(String newvalue)
  {
    fieldE01ORLOGL.setString(newvalue);
  }

  /**
  * Get value of field E01ORLOGL as a String.
  */
  public String getE01ORLOGL()
  {
    return fieldE01ORLOGL.getString();
  }

  /**
  * Set numeric field E01ORLOGL using a BigDecimal value.
  */
  public void setE01ORLOGL(BigDecimal newvalue)
  {
    fieldE01ORLOGL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ORLOGL as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ORLOGL()
  {
    return fieldE01ORLOGL.getBigDecimal();
  }

  /**
  * Set field E01ORLOAC using a String value.
  */
  public void setE01ORLOAC(String newvalue)
  {
    fieldE01ORLOAC.setString(newvalue);
  }

  /**
  * Get value of field E01ORLOAC as a String.
  */
  public String getE01ORLOAC()
  {
    return fieldE01ORLOAC.getString();
  }

  /**
  * Set numeric field E01ORLOAC using a BigDecimal value.
  */
  public void setE01ORLOAC(BigDecimal newvalue)
  {
    fieldE01ORLOAC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ORLOAC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ORLOAC()
  {
    return fieldE01ORLOAC.getBigDecimal();
  }

  /**
  * Set field E01ORLOAM using a String value.
  */
  public void setE01ORLOAM(String newvalue)
  {
    fieldE01ORLOAM.setString(newvalue);
  }

  /**
  * Get value of field E01ORLOAM as a String.
  */
  public String getE01ORLOAM()
  {
    return fieldE01ORLOAM.getString();
  }

  /**
  * Set numeric field E01ORLOAM using a BigDecimal value.
  */
  public void setE01ORLOAM(BigDecimal newvalue)
  {
    fieldE01ORLOAM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ORLOAM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ORLOAM()
  {
    return fieldE01ORLOAM.getBigDecimal();
  }

  /**
  * Set field E01ORLMAF using a String value.
  */
  public void setE01ORLMAF(String newvalue)
  {
    fieldE01ORLMAF.setString(newvalue);
  }

  /**
  * Get value of field E01ORLMAF as a String.
  */
  public String getE01ORLMAF()
  {
    return fieldE01ORLMAF.getString();
  }

  /**
  * Set numeric field E01ORLMAF using a BigDecimal value.
  */
  public void setE01ORLMAF(BigDecimal newvalue)
  {
    fieldE01ORLMAF.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ORLMAF as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ORLMAF()
  {
    return fieldE01ORLMAF.getBigDecimal();
  }

  /**
  * Set field E01ORLRTE using a String value.
  */
  public void setE01ORLRTE(String newvalue)
  {
    fieldE01ORLRTE.setString(newvalue);
  }

  /**
  * Get value of field E01ORLRTE as a String.
  */
  public String getE01ORLRTE()
  {
    return fieldE01ORLRTE.getString();
  }

  /**
  * Set numeric field E01ORLRTE using a BigDecimal value.
  */
  public void setE01ORLRTE(BigDecimal newvalue)
  {
    fieldE01ORLRTE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ORLRTE as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ORLRTE()
  {
    return fieldE01ORLRTE.getBigDecimal();
  }

  /**
  * Set field E01ORLNMH using a String value.
  */
  public void setE01ORLNMH(String newvalue)
  {
    fieldE01ORLNMH.setString(newvalue);
  }

  /**
  * Get value of field E01ORLNMH as a String.
  */
  public String getE01ORLNMH()
  {
    return fieldE01ORLNMH.getString();
  }

  /**
  * Set numeric field E01ORLNMH using a BigDecimal value.
  */
  public void setE01ORLNMH(BigDecimal newvalue)
  {
    fieldE01ORLNMH.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ORLNMH as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ORLNMH()
  {
    return fieldE01ORLNMH.getBigDecimal();
  }

  /**
  * Set field E01ORLTMH using a String value.
  */
  public void setE01ORLTMH(String newvalue)
  {
    fieldE01ORLTMH.setString(newvalue);
  }

  /**
  * Get value of field E01ORLTMH as a String.
  */
  public String getE01ORLTMH()
  {
    return fieldE01ORLTMH.getString();
  }

  /**
  * Set numeric field E01ORLTMH using a BigDecimal value.
  */
  public void setE01ORLTMH(BigDecimal newvalue)
  {
    fieldE01ORLTMH.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ORLTMH as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ORLTMH()
  {
    return fieldE01ORLTMH.getBigDecimal();
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
