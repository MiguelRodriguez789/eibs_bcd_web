package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EBP013401 physical file definition.
* 
* File level identifier is 1130611112840.
* Record format level identifier is 53E760325D624.
*/

public class EBP013401Message extends MessageRecord
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
                                     "E01BBDNUM",
                                     "E01BBDSEQ",
                                     "E01BBDKIN",
                                     "D01BBDKIN",
                                     "E01BBDREF",
                                     "E01BBDCRT",
                                     "D01BBDCRT",
                                     "E01BBDQTY",
                                     "E01BBDUAM",
                                     "E01BBDAMT",
                                     "E01BBDPTX",
                                     "E01BBDVTX",
                                     "E01BBDDS1",
                                     "E01BBDDS2",
                                     "E01BBDDS3",
                                     "E01BBDDS4",
                                     "E01ACT",
                                     "E01NUMREC",
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
                                   "E01BBDNUM",
                                   "E01BBDSEQ",
                                   "E01BBDKIN",
                                   "D01BBDKIN",
                                   "E01BBDREF",
                                   "E01BBDCRT",
                                   "D01BBDCRT",
                                   "E01BBDQTY",
                                   "E01BBDUAM",
                                   "E01BBDAMT",
                                   "E01BBDPTX",
                                   "E01BBDVTX",
                                   "E01BBDDS1",
                                   "E01BBDDS2",
                                   "E01BBDDS3",
                                   "E01BBDDS4",
                                   "E01ACT",
                                   "E01NUMREC",
                                   "E01INDOPE"
                                 };
  final static String fid = "1130611112840";
  final static String rid = "53E760325D624";
  final static String fmtname = "EBP013401";
  final int FIELDCOUNT = 28;
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
  private DecimalField fieldE01BBDNUM = null;
  private DecimalField fieldE01BBDSEQ = null;
  private CharacterField fieldE01BBDKIN = null;
  private CharacterField fieldD01BBDKIN = null;
  private CharacterField fieldE01BBDREF = null;
  private CharacterField fieldE01BBDCRT = null;
  private CharacterField fieldD01BBDCRT = null;
  private DecimalField fieldE01BBDQTY = null;
  private DecimalField fieldE01BBDUAM = null;
  private DecimalField fieldE01BBDAMT = null;
  private DecimalField fieldE01BBDPTX = null;
  private DecimalField fieldE01BBDVTX = null;
  private CharacterField fieldE01BBDDS1 = null;
  private CharacterField fieldE01BBDDS2 = null;
  private CharacterField fieldE01BBDDS3 = null;
  private CharacterField fieldE01BBDDS4 = null;
  private CharacterField fieldE01ACT = null;
  private DecimalField fieldE01NUMREC = null;
  private CharacterField fieldE01INDOPE = null;

  /**
  * Constructor for EBP013401Message.
  */
  public EBP013401Message()
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
    recordsize = 533;
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
    fields[9] = fieldE01BBDNUM =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E01BBDNUM");
    fields[10] = fieldE01BBDSEQ =
    new DecimalField(message, HEADERSIZE + 55, 5, 0, "E01BBDSEQ");
    fields[11] = fieldE01BBDKIN =
    new CharacterField(message, HEADERSIZE + 60, 4, "E01BBDKIN");
    fields[12] = fieldD01BBDKIN =
    new CharacterField(message, HEADERSIZE + 64, 60, "D01BBDKIN");
    fields[13] = fieldE01BBDREF =
    new CharacterField(message, HEADERSIZE + 124, 25, "E01BBDREF");
    fields[14] = fieldE01BBDCRT =
    new CharacterField(message, HEADERSIZE + 149, 4, "E01BBDCRT");
    fields[15] = fieldD01BBDCRT =
    new CharacterField(message, HEADERSIZE + 153, 60, "D01BBDCRT");
    fields[16] = fieldE01BBDQTY =
    new DecimalField(message, HEADERSIZE + 213, 11, 2, "E01BBDQTY");
    fields[17] = fieldE01BBDUAM =
    new DecimalField(message, HEADERSIZE + 224, 17, 2, "E01BBDUAM");
    fields[18] = fieldE01BBDAMT =
    new DecimalField(message, HEADERSIZE + 241, 17, 2, "E01BBDAMT");
    fields[19] = fieldE01BBDPTX =
    new DecimalField(message, HEADERSIZE + 258, 8, 3, "E01BBDPTX");
    fields[20] = fieldE01BBDVTX =
    new DecimalField(message, HEADERSIZE + 266, 17, 2, "E01BBDVTX");
    fields[21] = fieldE01BBDDS1 =
    new CharacterField(message, HEADERSIZE + 283, 60, "E01BBDDS1");
    fields[22] = fieldE01BBDDS2 =
    new CharacterField(message, HEADERSIZE + 343, 60, "E01BBDDS2");
    fields[23] = fieldE01BBDDS3 =
    new CharacterField(message, HEADERSIZE + 403, 60, "E01BBDDS3");
    fields[24] = fieldE01BBDDS4 =
    new CharacterField(message, HEADERSIZE + 463, 60, "E01BBDDS4");
    fields[25] = fieldE01ACT =
    new CharacterField(message, HEADERSIZE + 523, 1, "E01ACT");
    fields[26] = fieldE01NUMREC =
    new DecimalField(message, HEADERSIZE + 524, 8, 0, "E01NUMREC");
    fields[27] = fieldE01INDOPE =
    new CharacterField(message, HEADERSIZE + 532, 1, "E01INDOPE");

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
  * Set field E01BBDNUM using a String value.
  */
  public void setE01BBDNUM(String newvalue)
  {
    fieldE01BBDNUM.setString(newvalue);
  }

  /**
  * Get value of field E01BBDNUM as a String.
  */
  public String getE01BBDNUM()
  {
    return fieldE01BBDNUM.getString();
  }

  /**
  * Set numeric field E01BBDNUM using a BigDecimal value.
  */
  public void setE01BBDNUM(BigDecimal newvalue)
  {
    fieldE01BBDNUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BBDNUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BBDNUM()
  {
    return fieldE01BBDNUM.getBigDecimal();
  }

  /**
  * Set field E01BBDSEQ using a String value.
  */
  public void setE01BBDSEQ(String newvalue)
  {
    fieldE01BBDSEQ.setString(newvalue);
  }

  /**
  * Get value of field E01BBDSEQ as a String.
  */
  public String getE01BBDSEQ()
  {
    return fieldE01BBDSEQ.getString();
  }

  /**
  * Set numeric field E01BBDSEQ using a BigDecimal value.
  */
  public void setE01BBDSEQ(BigDecimal newvalue)
  {
    fieldE01BBDSEQ.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BBDSEQ as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BBDSEQ()
  {
    return fieldE01BBDSEQ.getBigDecimal();
  }

  /**
  * Set field E01BBDKIN using a String value.
  */
  public void setE01BBDKIN(String newvalue)
  {
    fieldE01BBDKIN.setString(newvalue);
  }

  /**
  * Get value of field E01BBDKIN as a String.
  */
  public String getE01BBDKIN()
  {
    return fieldE01BBDKIN.getString();
  }

  /**
  * Set field D01BBDKIN using a String value.
  */
  public void setD01BBDKIN(String newvalue)
  {
    fieldD01BBDKIN.setString(newvalue);
  }

  /**
  * Get value of field D01BBDKIN as a String.
  */
  public String getD01BBDKIN()
  {
    return fieldD01BBDKIN.getString();
  }

  /**
  * Set field E01BBDREF using a String value.
  */
  public void setE01BBDREF(String newvalue)
  {
    fieldE01BBDREF.setString(newvalue);
  }

  /**
  * Get value of field E01BBDREF as a String.
  */
  public String getE01BBDREF()
  {
    return fieldE01BBDREF.getString();
  }

  /**
  * Set field E01BBDCRT using a String value.
  */
  public void setE01BBDCRT(String newvalue)
  {
    fieldE01BBDCRT.setString(newvalue);
  }

  /**
  * Get value of field E01BBDCRT as a String.
  */
  public String getE01BBDCRT()
  {
    return fieldE01BBDCRT.getString();
  }

  /**
  * Set field D01BBDCRT using a String value.
  */
  public void setD01BBDCRT(String newvalue)
  {
    fieldD01BBDCRT.setString(newvalue);
  }

  /**
  * Get value of field D01BBDCRT as a String.
  */
  public String getD01BBDCRT()
  {
    return fieldD01BBDCRT.getString();
  }

  /**
  * Set field E01BBDQTY using a String value.
  */
  public void setE01BBDQTY(String newvalue)
  {
    fieldE01BBDQTY.setString(newvalue);
  }

  /**
  * Get value of field E01BBDQTY as a String.
  */
  public String getE01BBDQTY()
  {
    return fieldE01BBDQTY.getString();
  }

  /**
  * Set numeric field E01BBDQTY using a BigDecimal value.
  */
  public void setE01BBDQTY(BigDecimal newvalue)
  {
    fieldE01BBDQTY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BBDQTY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BBDQTY()
  {
    return fieldE01BBDQTY.getBigDecimal();
  }

  /**
  * Set field E01BBDUAM using a String value.
  */
  public void setE01BBDUAM(String newvalue)
  {
    fieldE01BBDUAM.setString(newvalue);
  }

  /**
  * Get value of field E01BBDUAM as a String.
  */
  public String getE01BBDUAM()
  {
    return fieldE01BBDUAM.getString();
  }

  /**
  * Set numeric field E01BBDUAM using a BigDecimal value.
  */
  public void setE01BBDUAM(BigDecimal newvalue)
  {
    fieldE01BBDUAM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BBDUAM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BBDUAM()
  {
    return fieldE01BBDUAM.getBigDecimal();
  }

  /**
  * Set field E01BBDAMT using a String value.
  */
  public void setE01BBDAMT(String newvalue)
  {
    fieldE01BBDAMT.setString(newvalue);
  }

  /**
  * Get value of field E01BBDAMT as a String.
  */
  public String getE01BBDAMT()
  {
    return fieldE01BBDAMT.getString();
  }

  /**
  * Set numeric field E01BBDAMT using a BigDecimal value.
  */
  public void setE01BBDAMT(BigDecimal newvalue)
  {
    fieldE01BBDAMT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BBDAMT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BBDAMT()
  {
    return fieldE01BBDAMT.getBigDecimal();
  }

  /**
  * Set field E01BBDPTX using a String value.
  */
  public void setE01BBDPTX(String newvalue)
  {
    fieldE01BBDPTX.setString(newvalue);
  }

  /**
  * Get value of field E01BBDPTX as a String.
  */
  public String getE01BBDPTX()
  {
    return fieldE01BBDPTX.getString();
  }

  /**
  * Set numeric field E01BBDPTX using a BigDecimal value.
  */
  public void setE01BBDPTX(BigDecimal newvalue)
  {
    fieldE01BBDPTX.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BBDPTX as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BBDPTX()
  {
    return fieldE01BBDPTX.getBigDecimal();
  }

  /**
  * Set field E01BBDVTX using a String value.
  */
  public void setE01BBDVTX(String newvalue)
  {
    fieldE01BBDVTX.setString(newvalue);
  }

  /**
  * Get value of field E01BBDVTX as a String.
  */
  public String getE01BBDVTX()
  {
    return fieldE01BBDVTX.getString();
  }

  /**
  * Set numeric field E01BBDVTX using a BigDecimal value.
  */
  public void setE01BBDVTX(BigDecimal newvalue)
  {
    fieldE01BBDVTX.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BBDVTX as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BBDVTX()
  {
    return fieldE01BBDVTX.getBigDecimal();
  }

  /**
  * Set field E01BBDDS1 using a String value.
  */
  public void setE01BBDDS1(String newvalue)
  {
    fieldE01BBDDS1.setString(newvalue);
  }

  /**
  * Get value of field E01BBDDS1 as a String.
  */
  public String getE01BBDDS1()
  {
    return fieldE01BBDDS1.getString();
  }

  /**
  * Set field E01BBDDS2 using a String value.
  */
  public void setE01BBDDS2(String newvalue)
  {
    fieldE01BBDDS2.setString(newvalue);
  }

  /**
  * Get value of field E01BBDDS2 as a String.
  */
  public String getE01BBDDS2()
  {
    return fieldE01BBDDS2.getString();
  }

  /**
  * Set field E01BBDDS3 using a String value.
  */
  public void setE01BBDDS3(String newvalue)
  {
    fieldE01BBDDS3.setString(newvalue);
  }

  /**
  * Get value of field E01BBDDS3 as a String.
  */
  public String getE01BBDDS3()
  {
    return fieldE01BBDDS3.getString();
  }

  /**
  * Set field E01BBDDS4 using a String value.
  */
  public void setE01BBDDS4(String newvalue)
  {
    fieldE01BBDDS4.setString(newvalue);
  }

  /**
  * Get value of field E01BBDDS4 as a String.
  */
  public String getE01BBDDS4()
  {
    return fieldE01BBDDS4.getString();
  }

  /**
  * Set field E01ACT using a String value.
  */
  public void setE01ACT(String newvalue)
  {
    fieldE01ACT.setString(newvalue);
  }

  /**
  * Get value of field E01ACT as a String.
  */
  public String getE01ACT()
  {
    return fieldE01ACT.getString();
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
