package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EGL001002 physical file definition.
* 
* File level identifier is 1170209175054.
* Record format level identifier is 3D57F33150CCC.
*/

public class EGL001002Message extends MessageRecord
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
                                     "E02SLFILE",
                                     "E02SELBTH",
                                     "E02SELSEQ",
                                     "E02SELOBK",
                                     "E02SELOBR",
                                     "E02SELCCY",
                                     "E02SELVDM",
                                     "E02SELVDD",
                                     "E02SELVDY",
                                     "E02FLGSTS",
                                     "E02DSCSTS",
                                     "E02TOTDEB",
                                     "E02TOTCRE",
                                     "E02NUMREC"
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
                                   "E02SLFILE",
                                   "E02SELBTH",
                                   "E02SELSEQ",
                                   "E02SELOBK",
                                   "E02SELOBR",
                                   "E02SELCCY",
                                   "E02SELVDM",
                                   "E02SELVDD",
                                   "E02SELVDY",
                                   "E02FLGSTS",
                                   "E02DSCSTS",
                                   "E02TOTDEB",
                                   "E02TOTCRE",
                                   "E02NUMREC"
                                 };
  final static String fid = "1170209175054";
  final static String rid = "3D57F33150CCC";
  final static String fmtname = "EGL001002";
  final int FIELDCOUNT = 23;
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
  private CharacterField fieldE02SLFILE = null;
  private DecimalField fieldE02SELBTH = null;
  private DecimalField fieldE02SELSEQ = null;
  private CharacterField fieldE02SELOBK = null;
  private DecimalField fieldE02SELOBR = null;
  private CharacterField fieldE02SELCCY = null;
  private DecimalField fieldE02SELVDM = null;
  private DecimalField fieldE02SELVDD = null;
  private DecimalField fieldE02SELVDY = null;
  private CharacterField fieldE02FLGSTS = null;
  private CharacterField fieldE02DSCSTS = null;
  private DecimalField fieldE02TOTDEB = null;
  private DecimalField fieldE02TOTCRE = null;
  private DecimalField fieldE02NUMREC = null;

  /**
  * Constructor for EGL001002Message.
  */
  public EGL001002Message()
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
    recordsize = 141;
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
    fields[9] = fieldE02SLFILE =
    new CharacterField(message, HEADERSIZE + 42, 1, "E02SLFILE");
    fields[10] = fieldE02SELBTH =
    new DecimalField(message, HEADERSIZE + 43, 6, 0, "E02SELBTH");
    fields[11] = fieldE02SELSEQ =
    new DecimalField(message, HEADERSIZE + 49, 8, 0, "E02SELSEQ");
    fields[12] = fieldE02SELOBK =
    new CharacterField(message, HEADERSIZE + 57, 2, "E02SELOBK");
    fields[13] = fieldE02SELOBR =
    new DecimalField(message, HEADERSIZE + 59, 5, 0, "E02SELOBR");
    fields[14] = fieldE02SELCCY =
    new CharacterField(message, HEADERSIZE + 64, 3, "E02SELCCY");
    fields[15] = fieldE02SELVDM =
    new DecimalField(message, HEADERSIZE + 67, 3, 0, "E02SELVDM");
    fields[16] = fieldE02SELVDD =
    new DecimalField(message, HEADERSIZE + 70, 3, 0, "E02SELVDD");
    fields[17] = fieldE02SELVDY =
    new DecimalField(message, HEADERSIZE + 73, 5, 0, "E02SELVDY");
    fields[18] = fieldE02FLGSTS =
    new CharacterField(message, HEADERSIZE + 78, 1, "E02FLGSTS");
    fields[19] = fieldE02DSCSTS =
    new CharacterField(message, HEADERSIZE + 79, 20, "E02DSCSTS");
    fields[20] = fieldE02TOTDEB =
    new DecimalField(message, HEADERSIZE + 99, 17, 2, "E02TOTDEB");
    fields[21] = fieldE02TOTCRE =
    new DecimalField(message, HEADERSIZE + 116, 17, 2, "E02TOTCRE");
    fields[22] = fieldE02NUMREC =
    new DecimalField(message, HEADERSIZE + 133, 8, 0, "E02NUMREC");

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
  * Set field E02SLFILE using a String value.
  */
  public void setE02SLFILE(String newvalue)
  {
    fieldE02SLFILE.setString(newvalue);
  }

  /**
  * Get value of field E02SLFILE as a String.
  */
  public String getE02SLFILE()
  {
    return fieldE02SLFILE.getString();
  }

  /**
  * Set field E02SELBTH using a String value.
  */
  public void setE02SELBTH(String newvalue)
  {
    fieldE02SELBTH.setString(newvalue);
  }

  /**
  * Get value of field E02SELBTH as a String.
  */
  public String getE02SELBTH()
  {
    return fieldE02SELBTH.getString();
  }

  /**
  * Set numeric field E02SELBTH using a BigDecimal value.
  */
  public void setE02SELBTH(BigDecimal newvalue)
  {
    fieldE02SELBTH.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02SELBTH as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02SELBTH()
  {
    return fieldE02SELBTH.getBigDecimal();
  }

  /**
  * Set field E02SELSEQ using a String value.
  */
  public void setE02SELSEQ(String newvalue)
  {
    fieldE02SELSEQ.setString(newvalue);
  }

  /**
  * Get value of field E02SELSEQ as a String.
  */
  public String getE02SELSEQ()
  {
    return fieldE02SELSEQ.getString();
  }

  /**
  * Set numeric field E02SELSEQ using a BigDecimal value.
  */
  public void setE02SELSEQ(BigDecimal newvalue)
  {
    fieldE02SELSEQ.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02SELSEQ as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02SELSEQ()
  {
    return fieldE02SELSEQ.getBigDecimal();
  }

  /**
  * Set field E02SELOBK using a String value.
  */
  public void setE02SELOBK(String newvalue)
  {
    fieldE02SELOBK.setString(newvalue);
  }

  /**
  * Get value of field E02SELOBK as a String.
  */
  public String getE02SELOBK()
  {
    return fieldE02SELOBK.getString();
  }

  /**
  * Set field E02SELOBR using a String value.
  */
  public void setE02SELOBR(String newvalue)
  {
    fieldE02SELOBR.setString(newvalue);
  }

  /**
  * Get value of field E02SELOBR as a String.
  */
  public String getE02SELOBR()
  {
    return fieldE02SELOBR.getString();
  }

  /**
  * Set numeric field E02SELOBR using a BigDecimal value.
  */
  public void setE02SELOBR(BigDecimal newvalue)
  {
    fieldE02SELOBR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02SELOBR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02SELOBR()
  {
    return fieldE02SELOBR.getBigDecimal();
  }

  /**
  * Set field E02SELCCY using a String value.
  */
  public void setE02SELCCY(String newvalue)
  {
    fieldE02SELCCY.setString(newvalue);
  }

  /**
  * Get value of field E02SELCCY as a String.
  */
  public String getE02SELCCY()
  {
    return fieldE02SELCCY.getString();
  }

  /**
  * Set field E02SELVDM using a String value.
  */
  public void setE02SELVDM(String newvalue)
  {
    fieldE02SELVDM.setString(newvalue);
  }

  /**
  * Get value of field E02SELVDM as a String.
  */
  public String getE02SELVDM()
  {
    return fieldE02SELVDM.getString();
  }

  /**
  * Set numeric field E02SELVDM using a BigDecimal value.
  */
  public void setE02SELVDM(BigDecimal newvalue)
  {
    fieldE02SELVDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02SELVDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02SELVDM()
  {
    return fieldE02SELVDM.getBigDecimal();
  }

  /**
  * Set field E02SELVDD using a String value.
  */
  public void setE02SELVDD(String newvalue)
  {
    fieldE02SELVDD.setString(newvalue);
  }

  /**
  * Get value of field E02SELVDD as a String.
  */
  public String getE02SELVDD()
  {
    return fieldE02SELVDD.getString();
  }

  /**
  * Set numeric field E02SELVDD using a BigDecimal value.
  */
  public void setE02SELVDD(BigDecimal newvalue)
  {
    fieldE02SELVDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02SELVDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02SELVDD()
  {
    return fieldE02SELVDD.getBigDecimal();
  }

  /**
  * Set field E02SELVDY using a String value.
  */
  public void setE02SELVDY(String newvalue)
  {
    fieldE02SELVDY.setString(newvalue);
  }

  /**
  * Get value of field E02SELVDY as a String.
  */
  public String getE02SELVDY()
  {
    return fieldE02SELVDY.getString();
  }

  /**
  * Set numeric field E02SELVDY using a BigDecimal value.
  */
  public void setE02SELVDY(BigDecimal newvalue)
  {
    fieldE02SELVDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02SELVDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02SELVDY()
  {
    return fieldE02SELVDY.getBigDecimal();
  }

  /**
  * Set field E02FLGSTS using a String value.
  */
  public void setE02FLGSTS(String newvalue)
  {
    fieldE02FLGSTS.setString(newvalue);
  }

  /**
  * Get value of field E02FLGSTS as a String.
  */
  public String getE02FLGSTS()
  {
    return fieldE02FLGSTS.getString();
  }

  /**
  * Set field E02DSCSTS using a String value.
  */
  public void setE02DSCSTS(String newvalue)
  {
    fieldE02DSCSTS.setString(newvalue);
  }

  /**
  * Get value of field E02DSCSTS as a String.
  */
  public String getE02DSCSTS()
  {
    return fieldE02DSCSTS.getString();
  }

  /**
  * Set field E02TOTDEB using a String value.
  */
  public void setE02TOTDEB(String newvalue)
  {
    fieldE02TOTDEB.setString(newvalue);
  }

  /**
  * Get value of field E02TOTDEB as a String.
  */
  public String getE02TOTDEB()
  {
    return fieldE02TOTDEB.getString();
  }

  /**
  * Set numeric field E02TOTDEB using a BigDecimal value.
  */
  public void setE02TOTDEB(BigDecimal newvalue)
  {
    fieldE02TOTDEB.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02TOTDEB as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02TOTDEB()
  {
    return fieldE02TOTDEB.getBigDecimal();
  }

  /**
  * Set field E02TOTCRE using a String value.
  */
  public void setE02TOTCRE(String newvalue)
  {
    fieldE02TOTCRE.setString(newvalue);
  }

  /**
  * Get value of field E02TOTCRE as a String.
  */
  public String getE02TOTCRE()
  {
    return fieldE02TOTCRE.getString();
  }

  /**
  * Set numeric field E02TOTCRE using a BigDecimal value.
  */
  public void setE02TOTCRE(BigDecimal newvalue)
  {
    fieldE02TOTCRE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02TOTCRE as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02TOTCRE()
  {
    return fieldE02TOTCRE.getBigDecimal();
  }

  /**
  * Set field E02NUMREC using a String value.
  */
  public void setE02NUMREC(String newvalue)
  {
    fieldE02NUMREC.setString(newvalue);
  }

  /**
  * Get value of field E02NUMREC as a String.
  */
  public String getE02NUMREC()
  {
    return fieldE02NUMREC.getString();
  }

  /**
  * Set numeric field E02NUMREC using a BigDecimal value.
  */
  public void setE02NUMREC(BigDecimal newvalue)
  {
    fieldE02NUMREC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02NUMREC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02NUMREC()
  {
    return fieldE02NUMREC.getBigDecimal();
  }

}
