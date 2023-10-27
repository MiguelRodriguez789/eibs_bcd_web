package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EATM00102 physical file definition.
* 
* File level identifier is 1180130174918.
* Record format level identifier is 46FF2ACDC5008.
*/

public class EATM00102Message extends MessageRecord
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
                                     "E02PBABNK",
                                     "E02PBATID",
                                     "E02PBABTY",
                                     "D02PBABTY",
                                     "E02PBABAN",
                                     "E02PBADEN",
                                     "E02PBACMM",
                                     "E02PBACDD",
                                     "E02PBACYY",
                                     "E02PBACMU",
                                     "E02PBALMM",
                                     "E02PBALDD",
                                     "E02PBALYY",
                                     "E02PBALMU",
                                     "E02NUMREC",
                                     "E02INDOPE"
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
                                   "E02PBABNK",
                                   "E02PBATID",
                                   "E02PBABTY",
                                   "D02PBABTY",
                                   "E02PBABAN",
                                   "E02PBADEN",
                                   "E02PBACMM",
                                   "E02PBACDD",
                                   "E02PBACYY",
                                   "E02PBACMU",
                                   "E02PBALMM",
                                   "E02PBALDD",
                                   "E02PBALYY",
                                   "E02PBALMU",
                                   "E02NUMREC",
                                   "E02INDOPE"
                                 };
  final static String fid = "1180130174918";
  final static String rid = "46FF2ACDC5008";
  final static String fmtname = "EATM00102";
  final int FIELDCOUNT = 25;
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
  private CharacterField fieldE02PBABNK = null;
  private CharacterField fieldE02PBATID = null;
  private CharacterField fieldE02PBABTY = null;
  private CharacterField fieldD02PBABTY = null;
  private DecimalField fieldE02PBABAN = null;
  private DecimalField fieldE02PBADEN = null;
  private DecimalField fieldE02PBACMM = null;
  private DecimalField fieldE02PBACDD = null;
  private DecimalField fieldE02PBACYY = null;
  private CharacterField fieldE02PBACMU = null;
  private DecimalField fieldE02PBALMM = null;
  private DecimalField fieldE02PBALDD = null;
  private DecimalField fieldE02PBALYY = null;
  private CharacterField fieldE02PBALMU = null;
  private DecimalField fieldE02NUMREC = null;
  private CharacterField fieldE02INDOPE = null;

  /**
  * Constructor for EATM00102Message.
  */
  public EATM00102Message()
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
    recordsize = 144;
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
    fields[9] = fieldE02PBABNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E02PBABNK");
    fields[10] = fieldE02PBATID =
    new CharacterField(message, HEADERSIZE + 44, 10, "E02PBATID");
    fields[11] = fieldE02PBABTY =
    new CharacterField(message, HEADERSIZE + 54, 1, "E02PBABTY");
    fields[12] = fieldD02PBABTY =
    new CharacterField(message, HEADERSIZE + 55, 25, "D02PBABTY");
    fields[13] = fieldE02PBABAN =
    new DecimalField(message, HEADERSIZE + 80, 5, 0, "E02PBABAN");
    fields[14] = fieldE02PBADEN =
    new DecimalField(message, HEADERSIZE + 85, 8, 0, "E02PBADEN");
    fields[15] = fieldE02PBACMM =
    new DecimalField(message, HEADERSIZE + 93, 3, 0, "E02PBACMM");
    fields[16] = fieldE02PBACDD =
    new DecimalField(message, HEADERSIZE + 96, 3, 0, "E02PBACDD");
    fields[17] = fieldE02PBACYY =
    new DecimalField(message, HEADERSIZE + 99, 5, 0, "E02PBACYY");
    fields[18] = fieldE02PBACMU =
    new CharacterField(message, HEADERSIZE + 104, 10, "E02PBACMU");
    fields[19] = fieldE02PBALMM =
    new DecimalField(message, HEADERSIZE + 114, 3, 0, "E02PBALMM");
    fields[20] = fieldE02PBALDD =
    new DecimalField(message, HEADERSIZE + 117, 3, 0, "E02PBALDD");
    fields[21] = fieldE02PBALYY =
    new DecimalField(message, HEADERSIZE + 120, 5, 0, "E02PBALYY");
    fields[22] = fieldE02PBALMU =
    new CharacterField(message, HEADERSIZE + 125, 10, "E02PBALMU");
    fields[23] = fieldE02NUMREC =
    new DecimalField(message, HEADERSIZE + 135, 8, 0, "E02NUMREC");
    fields[24] = fieldE02INDOPE =
    new CharacterField(message, HEADERSIZE + 143, 1, "E02INDOPE");

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
  * Set field E02PBABNK using a String value.
  */
  public void setE02PBABNK(String newvalue)
  {
    fieldE02PBABNK.setString(newvalue);
  }

  /**
  * Get value of field E02PBABNK as a String.
  */
  public String getE02PBABNK()
  {
    return fieldE02PBABNK.getString();
  }

  /**
  * Set field E02PBATID using a String value.
  */
  public void setE02PBATID(String newvalue)
  {
    fieldE02PBATID.setString(newvalue);
  }

  /**
  * Get value of field E02PBATID as a String.
  */
  public String getE02PBATID()
  {
    return fieldE02PBATID.getString();
  }

  /**
  * Set field E02PBABTY using a String value.
  */
  public void setE02PBABTY(String newvalue)
  {
    fieldE02PBABTY.setString(newvalue);
  }

  /**
  * Get value of field E02PBABTY as a String.
  */
  public String getE02PBABTY()
  {
    return fieldE02PBABTY.getString();
  }

  /**
  * Set field D02PBABTY using a String value.
  */
  public void setD02PBABTY(String newvalue)
  {
    fieldD02PBABTY.setString(newvalue);
  }

  /**
  * Get value of field D02PBABTY as a String.
  */
  public String getD02PBABTY()
  {
    return fieldD02PBABTY.getString();
  }

  /**
  * Set field E02PBABAN using a String value.
  */
  public void setE02PBABAN(String newvalue)
  {
    fieldE02PBABAN.setString(newvalue);
  }

  /**
  * Get value of field E02PBABAN as a String.
  */
  public String getE02PBABAN()
  {
    return fieldE02PBABAN.getString();
  }

  /**
  * Set numeric field E02PBABAN using a BigDecimal value.
  */
  public void setE02PBABAN(BigDecimal newvalue)
  {
    fieldE02PBABAN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02PBABAN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02PBABAN()
  {
    return fieldE02PBABAN.getBigDecimal();
  }

  /**
  * Set field E02PBADEN using a String value.
  */
  public void setE02PBADEN(String newvalue)
  {
    fieldE02PBADEN.setString(newvalue);
  }

  /**
  * Get value of field E02PBADEN as a String.
  */
  public String getE02PBADEN()
  {
    return fieldE02PBADEN.getString();
  }

  /**
  * Set numeric field E02PBADEN using a BigDecimal value.
  */
  public void setE02PBADEN(BigDecimal newvalue)
  {
    fieldE02PBADEN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02PBADEN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02PBADEN()
  {
    return fieldE02PBADEN.getBigDecimal();
  }

  /**
  * Set field E02PBACMM using a String value.
  */
  public void setE02PBACMM(String newvalue)
  {
    fieldE02PBACMM.setString(newvalue);
  }

  /**
  * Get value of field E02PBACMM as a String.
  */
  public String getE02PBACMM()
  {
    return fieldE02PBACMM.getString();
  }

  /**
  * Set numeric field E02PBACMM using a BigDecimal value.
  */
  public void setE02PBACMM(BigDecimal newvalue)
  {
    fieldE02PBACMM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02PBACMM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02PBACMM()
  {
    return fieldE02PBACMM.getBigDecimal();
  }

  /**
  * Set field E02PBACDD using a String value.
  */
  public void setE02PBACDD(String newvalue)
  {
    fieldE02PBACDD.setString(newvalue);
  }

  /**
  * Get value of field E02PBACDD as a String.
  */
  public String getE02PBACDD()
  {
    return fieldE02PBACDD.getString();
  }

  /**
  * Set numeric field E02PBACDD using a BigDecimal value.
  */
  public void setE02PBACDD(BigDecimal newvalue)
  {
    fieldE02PBACDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02PBACDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02PBACDD()
  {
    return fieldE02PBACDD.getBigDecimal();
  }

  /**
  * Set field E02PBACYY using a String value.
  */
  public void setE02PBACYY(String newvalue)
  {
    fieldE02PBACYY.setString(newvalue);
  }

  /**
  * Get value of field E02PBACYY as a String.
  */
  public String getE02PBACYY()
  {
    return fieldE02PBACYY.getString();
  }

  /**
  * Set numeric field E02PBACYY using a BigDecimal value.
  */
  public void setE02PBACYY(BigDecimal newvalue)
  {
    fieldE02PBACYY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02PBACYY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02PBACYY()
  {
    return fieldE02PBACYY.getBigDecimal();
  }

  /**
  * Set field E02PBACMU using a String value.
  */
  public void setE02PBACMU(String newvalue)
  {
    fieldE02PBACMU.setString(newvalue);
  }

  /**
  * Get value of field E02PBACMU as a String.
  */
  public String getE02PBACMU()
  {
    return fieldE02PBACMU.getString();
  }

  /**
  * Set field E02PBALMM using a String value.
  */
  public void setE02PBALMM(String newvalue)
  {
    fieldE02PBALMM.setString(newvalue);
  }

  /**
  * Get value of field E02PBALMM as a String.
  */
  public String getE02PBALMM()
  {
    return fieldE02PBALMM.getString();
  }

  /**
  * Set numeric field E02PBALMM using a BigDecimal value.
  */
  public void setE02PBALMM(BigDecimal newvalue)
  {
    fieldE02PBALMM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02PBALMM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02PBALMM()
  {
    return fieldE02PBALMM.getBigDecimal();
  }

  /**
  * Set field E02PBALDD using a String value.
  */
  public void setE02PBALDD(String newvalue)
  {
    fieldE02PBALDD.setString(newvalue);
  }

  /**
  * Get value of field E02PBALDD as a String.
  */
  public String getE02PBALDD()
  {
    return fieldE02PBALDD.getString();
  }

  /**
  * Set numeric field E02PBALDD using a BigDecimal value.
  */
  public void setE02PBALDD(BigDecimal newvalue)
  {
    fieldE02PBALDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02PBALDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02PBALDD()
  {
    return fieldE02PBALDD.getBigDecimal();
  }

  /**
  * Set field E02PBALYY using a String value.
  */
  public void setE02PBALYY(String newvalue)
  {
    fieldE02PBALYY.setString(newvalue);
  }

  /**
  * Get value of field E02PBALYY as a String.
  */
  public String getE02PBALYY()
  {
    return fieldE02PBALYY.getString();
  }

  /**
  * Set numeric field E02PBALYY using a BigDecimal value.
  */
  public void setE02PBALYY(BigDecimal newvalue)
  {
    fieldE02PBALYY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02PBALYY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02PBALYY()
  {
    return fieldE02PBALYY.getBigDecimal();
  }

  /**
  * Set field E02PBALMU using a String value.
  */
  public void setE02PBALMU(String newvalue)
  {
    fieldE02PBALMU.setString(newvalue);
  }

  /**
  * Get value of field E02PBALMU as a String.
  */
  public String getE02PBALMU()
  {
    return fieldE02PBALMU.getString();
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

  /**
  * Set field E02INDOPE using a String value.
  */
  public void setE02INDOPE(String newvalue)
  {
    fieldE02INDOPE.setString(newvalue);
  }

  /**
  * Get value of field E02INDOPE as a String.
  */
  public String getE02INDOPE()
  {
    return fieldE02INDOPE.getString();
  }

}
