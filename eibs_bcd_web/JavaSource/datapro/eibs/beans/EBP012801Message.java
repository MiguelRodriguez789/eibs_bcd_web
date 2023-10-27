package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EBP012801 physical file definition.
* 
* File level identifier is 1130611112828.
* Record format level identifier is 448B22C6FDAF7.
*/

public class EBP012801Message extends MessageRecord
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
                                     "E01BDPNUM",
                                     "E01BDPSEQ",
                                     "E01BDPREF",
                                     "E01BDPPVI",
                                     "E01BDPAMT",
                                     "E01BDPPD1",
                                     "E01BDPPD2",
                                     "E01BDPPD3",
                                     "E01BDPUSR",
                                     "E01BDPAUS",
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
                                   "E01BDPNUM",
                                   "E01BDPSEQ",
                                   "E01BDPREF",
                                   "E01BDPPVI",
                                   "E01BDPAMT",
                                   "E01BDPPD1",
                                   "E01BDPPD2",
                                   "E01BDPPD3",
                                   "E01BDPUSR",
                                   "E01BDPAUS",
                                   "E01ACT",
                                   "E01NUMREC",
                                   "E01INDOPE"
                                 };
  final static String fid = "1130611112828";
  final static String rid = "448B22C6FDAF7";
  final static String fmtname = "EBP012801";
  final int FIELDCOUNT = 22;
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
  private DecimalField fieldE01BDPNUM = null;
  private DecimalField fieldE01BDPSEQ = null;
  private CharacterField fieldE01BDPREF = null;
  private CharacterField fieldE01BDPPVI = null;
  private DecimalField fieldE01BDPAMT = null;
  private DecimalField fieldE01BDPPD1 = null;
  private DecimalField fieldE01BDPPD2 = null;
  private DecimalField fieldE01BDPPD3 = null;
  private CharacterField fieldE01BDPUSR = null;
  private CharacterField fieldE01BDPAUS = null;
  private CharacterField fieldE01ACT = null;
  private DecimalField fieldE01NUMREC = null;
  private CharacterField fieldE01INDOPE = null;

  /**
  * Constructor for EBP012801Message.
  */
  public EBP012801Message()
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
    recordsize = 143;
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
    fields[9] = fieldE01BDPNUM =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E01BDPNUM");
    fields[10] = fieldE01BDPSEQ =
    new DecimalField(message, HEADERSIZE + 55, 4, 0, "E01BDPSEQ");
    fields[11] = fieldE01BDPREF =
    new CharacterField(message, HEADERSIZE + 59, 25, "E01BDPREF");
    fields[12] = fieldE01BDPPVI =
    new CharacterField(message, HEADERSIZE + 84, 1, "E01BDPPVI");
    fields[13] = fieldE01BDPAMT =
    new DecimalField(message, HEADERSIZE + 85, 17, 2, "E01BDPAMT");
    fields[14] = fieldE01BDPPD1 =
    new DecimalField(message, HEADERSIZE + 102, 3, 0, "E01BDPPD1");
    fields[15] = fieldE01BDPPD2 =
    new DecimalField(message, HEADERSIZE + 105, 3, 0, "E01BDPPD2");
    fields[16] = fieldE01BDPPD3 =
    new DecimalField(message, HEADERSIZE + 108, 5, 0, "E01BDPPD3");
    fields[17] = fieldE01BDPUSR =
    new CharacterField(message, HEADERSIZE + 113, 10, "E01BDPUSR");
    fields[18] = fieldE01BDPAUS =
    new CharacterField(message, HEADERSIZE + 123, 10, "E01BDPAUS");
    fields[19] = fieldE01ACT =
    new CharacterField(message, HEADERSIZE + 133, 1, "E01ACT");
    fields[20] = fieldE01NUMREC =
    new DecimalField(message, HEADERSIZE + 134, 8, 0, "E01NUMREC");
    fields[21] = fieldE01INDOPE =
    new CharacterField(message, HEADERSIZE + 142, 1, "E01INDOPE");

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
  * Set field E01BDPNUM using a String value.
  */
  public void setE01BDPNUM(String newvalue)
  {
    fieldE01BDPNUM.setString(newvalue);
  }

  /**
  * Get value of field E01BDPNUM as a String.
  */
  public String getE01BDPNUM()
  {
    return fieldE01BDPNUM.getString();
  }

  /**
  * Set numeric field E01BDPNUM using a BigDecimal value.
  */
  public void setE01BDPNUM(BigDecimal newvalue)
  {
    fieldE01BDPNUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BDPNUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BDPNUM()
  {
    return fieldE01BDPNUM.getBigDecimal();
  }

  /**
  * Set field E01BDPSEQ using a String value.
  */
  public void setE01BDPSEQ(String newvalue)
  {
    fieldE01BDPSEQ.setString(newvalue);
  }

  /**
  * Get value of field E01BDPSEQ as a String.
  */
  public String getE01BDPSEQ()
  {
    return fieldE01BDPSEQ.getString();
  }

  /**
  * Set numeric field E01BDPSEQ using a BigDecimal value.
  */
  public void setE01BDPSEQ(BigDecimal newvalue)
  {
    fieldE01BDPSEQ.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BDPSEQ as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BDPSEQ()
  {
    return fieldE01BDPSEQ.getBigDecimal();
  }

  /**
  * Set field E01BDPREF using a String value.
  */
  public void setE01BDPREF(String newvalue)
  {
    fieldE01BDPREF.setString(newvalue);
  }

  /**
  * Get value of field E01BDPREF as a String.
  */
  public String getE01BDPREF()
  {
    return fieldE01BDPREF.getString();
  }

  /**
  * Set field E01BDPPVI using a String value.
  */
  public void setE01BDPPVI(String newvalue)
  {
    fieldE01BDPPVI.setString(newvalue);
  }

  /**
  * Get value of field E01BDPPVI as a String.
  */
  public String getE01BDPPVI()
  {
    return fieldE01BDPPVI.getString();
  }

  /**
  * Set field E01BDPAMT using a String value.
  */
  public void setE01BDPAMT(String newvalue)
  {
    fieldE01BDPAMT.setString(newvalue);
  }

  /**
  * Get value of field E01BDPAMT as a String.
  */
  public String getE01BDPAMT()
  {
    return fieldE01BDPAMT.getString();
  }

  /**
  * Set numeric field E01BDPAMT using a BigDecimal value.
  */
  public void setE01BDPAMT(BigDecimal newvalue)
  {
    fieldE01BDPAMT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BDPAMT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BDPAMT()
  {
    return fieldE01BDPAMT.getBigDecimal();
  }

  /**
  * Set field E01BDPPD1 using a String value.
  */
  public void setE01BDPPD1(String newvalue)
  {
    fieldE01BDPPD1.setString(newvalue);
  }

  /**
  * Get value of field E01BDPPD1 as a String.
  */
  public String getE01BDPPD1()
  {
    return fieldE01BDPPD1.getString();
  }

  /**
  * Set numeric field E01BDPPD1 using a BigDecimal value.
  */
  public void setE01BDPPD1(BigDecimal newvalue)
  {
    fieldE01BDPPD1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BDPPD1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BDPPD1()
  {
    return fieldE01BDPPD1.getBigDecimal();
  }

  /**
  * Set field E01BDPPD2 using a String value.
  */
  public void setE01BDPPD2(String newvalue)
  {
    fieldE01BDPPD2.setString(newvalue);
  }

  /**
  * Get value of field E01BDPPD2 as a String.
  */
  public String getE01BDPPD2()
  {
    return fieldE01BDPPD2.getString();
  }

  /**
  * Set numeric field E01BDPPD2 using a BigDecimal value.
  */
  public void setE01BDPPD2(BigDecimal newvalue)
  {
    fieldE01BDPPD2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BDPPD2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BDPPD2()
  {
    return fieldE01BDPPD2.getBigDecimal();
  }

  /**
  * Set field E01BDPPD3 using a String value.
  */
  public void setE01BDPPD3(String newvalue)
  {
    fieldE01BDPPD3.setString(newvalue);
  }

  /**
  * Get value of field E01BDPPD3 as a String.
  */
  public String getE01BDPPD3()
  {
    return fieldE01BDPPD3.getString();
  }

  /**
  * Set numeric field E01BDPPD3 using a BigDecimal value.
  */
  public void setE01BDPPD3(BigDecimal newvalue)
  {
    fieldE01BDPPD3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BDPPD3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BDPPD3()
  {
    return fieldE01BDPPD3.getBigDecimal();
  }

  /**
  * Set field E01BDPUSR using a String value.
  */
  public void setE01BDPUSR(String newvalue)
  {
    fieldE01BDPUSR.setString(newvalue);
  }

  /**
  * Get value of field E01BDPUSR as a String.
  */
  public String getE01BDPUSR()
  {
    return fieldE01BDPUSR.getString();
  }

  /**
  * Set field E01BDPAUS using a String value.
  */
  public void setE01BDPAUS(String newvalue)
  {
    fieldE01BDPAUS.setString(newvalue);
  }

  /**
  * Get value of field E01BDPAUS as a String.
  */
  public String getE01BDPAUS()
  {
    return fieldE01BDPAUS.getString();
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