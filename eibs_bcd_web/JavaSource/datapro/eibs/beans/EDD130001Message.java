package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDD130001 physical file definition.
* 
* File level identifier is 1100706173552.
* Record format level identifier is 4D6D13EC7E9F8.
*/

public class EDD130001Message extends MessageRecord
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
                                     "E01ACTION",
                                     "E01ODAOFC",
                                     "E01ODAACC",
                                     "E01ODACKN",
                                     "E01ODARFN",
                                     "E01ODATR1",
                                     "E01ODATR2",
                                     "E01ODATR3",
                                     "E01ODATIM",
                                     "E01ODATLR",
                                     "E01ODAUSR",
                                     "E01ODAAMT",
                                     "E01ODAOF1",
                                     "E01ODAOF2",
                                     "E01ODAAP1",
                                     "E01ODAAP2",
                                     "E01ODAAP3",
                                     "E01ODAAPT",
                                     "E01ODAFLG",
                                     "E01CUSNA1"
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
                                   "E01ACTION",
                                   "E01ODAOFC",
                                   "E01ODAACC",
                                   "E01ODACKN",
                                   "E01ODARFN",
                                   "E01ODATR1",
                                   "E01ODATR2",
                                   "E01ODATR3",
                                   "E01ODATIM",
                                   "E01ODATLR",
                                   "E01ODAUSR",
                                   "E01ODAAMT",
                                   "E01ODAOF1",
                                   "E01ODAOF2",
                                   "E01ODAAP1",
                                   "E01ODAAP2",
                                   "E01ODAAP3",
                                   "E01ODAAPT",
                                   "E01ODAFLG",
                                   "E01CUSNA1"
                                 };
  final static String fid = "1100706173552";
  final static String rid = "4D6D13EC7E9F8";
  final static String fmtname = "EDD130001";
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
  private CharacterField fieldE01ACTION = null;
  private CharacterField fieldE01ODAOFC = null;
  private DecimalField fieldE01ODAACC = null;
  private DecimalField fieldE01ODACKN = null;
  private DecimalField fieldE01ODARFN = null;
  private DecimalField fieldE01ODATR1 = null;
  private DecimalField fieldE01ODATR2 = null;
  private DecimalField fieldE01ODATR3 = null;
  private DecimalField fieldE01ODATIM = null;
  private CharacterField fieldE01ODATLR = null;
  private CharacterField fieldE01ODAUSR = null;
  private DecimalField fieldE01ODAAMT = null;
  private CharacterField fieldE01ODAOF1 = null;
  private CharacterField fieldE01ODAOF2 = null;
  private DecimalField fieldE01ODAAP1 = null;
  private DecimalField fieldE01ODAAP2 = null;
  private DecimalField fieldE01ODAAP3 = null;
  private DecimalField fieldE01ODAAPT = null;
  private CharacterField fieldE01ODAFLG = null;
  private CharacterField fieldE01CUSNA1 = null;

  /**
  * Constructor for EDD130001Message.
  */
  public EDD130001Message()
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
    recordsize = 199;
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
    fields[9] = fieldE01ACTION =
    new CharacterField(message, HEADERSIZE + 42, 1, "E01ACTION");
    fields[10] = fieldE01ODAOFC =
    new CharacterField(message, HEADERSIZE + 43, 4, "E01ODAOFC");
    fields[11] = fieldE01ODAACC =
    new DecimalField(message, HEADERSIZE + 47, 13, 0, "E01ODAACC");
    fields[12] = fieldE01ODACKN =
    new DecimalField(message, HEADERSIZE + 60, 10, 0, "E01ODACKN");
    fields[13] = fieldE01ODARFN =
    new DecimalField(message, HEADERSIZE + 70, 9, 0, "E01ODARFN");
    fields[14] = fieldE01ODATR1 =
    new DecimalField(message, HEADERSIZE + 79, 3, 0, "E01ODATR1");
    fields[15] = fieldE01ODATR2 =
    new DecimalField(message, HEADERSIZE + 82, 3, 0, "E01ODATR2");
    fields[16] = fieldE01ODATR3 =
    new DecimalField(message, HEADERSIZE + 85, 3, 0, "E01ODATR3");
    fields[17] = fieldE01ODATIM =
    new DecimalField(message, HEADERSIZE + 88, 7, 0, "E01ODATIM");
    fields[18] = fieldE01ODATLR =
    new CharacterField(message, HEADERSIZE + 95, 7, "E01ODATLR");
    fields[19] = fieldE01ODAUSR =
    new CharacterField(message, HEADERSIZE + 102, 10, "E01ODAUSR");
    fields[20] = fieldE01ODAAMT =
    new DecimalField(message, HEADERSIZE + 112, 17, 2, "E01ODAAMT");
    fields[21] = fieldE01ODAOF1 =
    new CharacterField(message, HEADERSIZE + 129, 4, "E01ODAOF1");
    fields[22] = fieldE01ODAOF2 =
    new CharacterField(message, HEADERSIZE + 133, 4, "E01ODAOF2");
    fields[23] = fieldE01ODAAP1 =
    new DecimalField(message, HEADERSIZE + 137, 3, 0, "E01ODAAP1");
    fields[24] = fieldE01ODAAP2 =
    new DecimalField(message, HEADERSIZE + 140, 3, 0, "E01ODAAP2");
    fields[25] = fieldE01ODAAP3 =
    new DecimalField(message, HEADERSIZE + 143, 3, 0, "E01ODAAP3");
    fields[26] = fieldE01ODAAPT =
    new DecimalField(message, HEADERSIZE + 146, 7, 0, "E01ODAAPT");
    fields[27] = fieldE01ODAFLG =
    new CharacterField(message, HEADERSIZE + 153, 1, "E01ODAFLG");
    fields[28] = fieldE01CUSNA1 =
    new CharacterField(message, HEADERSIZE + 154, 45, "E01CUSNA1");

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
  * Set field E01ACTION using a String value.
  */
  public void setE01ACTION(String newvalue)
  {
    fieldE01ACTION.setString(newvalue);
  }

  /**
  * Get value of field E01ACTION as a String.
  */
  public String getE01ACTION()
  {
    return fieldE01ACTION.getString();
  }

  /**
  * Set field E01ODAOFC using a String value.
  */
  public void setE01ODAOFC(String newvalue)
  {
    fieldE01ODAOFC.setString(newvalue);
  }

  /**
  * Get value of field E01ODAOFC as a String.
  */
  public String getE01ODAOFC()
  {
    return fieldE01ODAOFC.getString();
  }

  /**
  * Set field E01ODAACC using a String value.
  */
  public void setE01ODAACC(String newvalue)
  {
    fieldE01ODAACC.setString(newvalue);
  }

  /**
  * Get value of field E01ODAACC as a String.
  */
  public String getE01ODAACC()
  {
    return fieldE01ODAACC.getString();
  }

  /**
  * Set numeric field E01ODAACC using a BigDecimal value.
  */
  public void setE01ODAACC(BigDecimal newvalue)
  {
    fieldE01ODAACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ODAACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ODAACC()
  {
    return fieldE01ODAACC.getBigDecimal();
  }

  /**
  * Set field E01ODACKN using a String value.
  */
  public void setE01ODACKN(String newvalue)
  {
    fieldE01ODACKN.setString(newvalue);
  }

  /**
  * Get value of field E01ODACKN as a String.
  */
  public String getE01ODACKN()
  {
    return fieldE01ODACKN.getString();
  }

  /**
  * Set numeric field E01ODACKN using a BigDecimal value.
  */
  public void setE01ODACKN(BigDecimal newvalue)
  {
    fieldE01ODACKN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ODACKN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ODACKN()
  {
    return fieldE01ODACKN.getBigDecimal();
  }

  /**
  * Set field E01ODARFN using a String value.
  */
  public void setE01ODARFN(String newvalue)
  {
    fieldE01ODARFN.setString(newvalue);
  }

  /**
  * Get value of field E01ODARFN as a String.
  */
  public String getE01ODARFN()
  {
    return fieldE01ODARFN.getString();
  }

  /**
  * Set numeric field E01ODARFN using a BigDecimal value.
  */
  public void setE01ODARFN(BigDecimal newvalue)
  {
    fieldE01ODARFN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ODARFN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ODARFN()
  {
    return fieldE01ODARFN.getBigDecimal();
  }

  /**
  * Set field E01ODATR1 using a String value.
  */
  public void setE01ODATR1(String newvalue)
  {
    fieldE01ODATR1.setString(newvalue);
  }

  /**
  * Get value of field E01ODATR1 as a String.
  */
  public String getE01ODATR1()
  {
    return fieldE01ODATR1.getString();
  }

  /**
  * Set numeric field E01ODATR1 using a BigDecimal value.
  */
  public void setE01ODATR1(BigDecimal newvalue)
  {
    fieldE01ODATR1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ODATR1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ODATR1()
  {
    return fieldE01ODATR1.getBigDecimal();
  }

  /**
  * Set field E01ODATR2 using a String value.
  */
  public void setE01ODATR2(String newvalue)
  {
    fieldE01ODATR2.setString(newvalue);
  }

  /**
  * Get value of field E01ODATR2 as a String.
  */
  public String getE01ODATR2()
  {
    return fieldE01ODATR2.getString();
  }

  /**
  * Set numeric field E01ODATR2 using a BigDecimal value.
  */
  public void setE01ODATR2(BigDecimal newvalue)
  {
    fieldE01ODATR2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ODATR2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ODATR2()
  {
    return fieldE01ODATR2.getBigDecimal();
  }

  /**
  * Set field E01ODATR3 using a String value.
  */
  public void setE01ODATR3(String newvalue)
  {
    fieldE01ODATR3.setString(newvalue);
  }

  /**
  * Get value of field E01ODATR3 as a String.
  */
  public String getE01ODATR3()
  {
    return fieldE01ODATR3.getString();
  }

  /**
  * Set numeric field E01ODATR3 using a BigDecimal value.
  */
  public void setE01ODATR3(BigDecimal newvalue)
  {
    fieldE01ODATR3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ODATR3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ODATR3()
  {
    return fieldE01ODATR3.getBigDecimal();
  }

  /**
  * Set field E01ODATIM using a String value.
  */
  public void setE01ODATIM(String newvalue)
  {
    fieldE01ODATIM.setString(newvalue);
  }

  /**
  * Get value of field E01ODATIM as a String.
  */
  public String getE01ODATIM()
  {
    return fieldE01ODATIM.getString();
  }

  /**
  * Set numeric field E01ODATIM using a BigDecimal value.
  */
  public void setE01ODATIM(BigDecimal newvalue)
  {
    fieldE01ODATIM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ODATIM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ODATIM()
  {
    return fieldE01ODATIM.getBigDecimal();
  }

  /**
  * Set field E01ODATLR using a String value.
  */
  public void setE01ODATLR(String newvalue)
  {
    fieldE01ODATLR.setString(newvalue);
  }

  /**
  * Get value of field E01ODATLR as a String.
  */
  public String getE01ODATLR()
  {
    return fieldE01ODATLR.getString();
  }

  /**
  * Set field E01ODAUSR using a String value.
  */
  public void setE01ODAUSR(String newvalue)
  {
    fieldE01ODAUSR.setString(newvalue);
  }

  /**
  * Get value of field E01ODAUSR as a String.
  */
  public String getE01ODAUSR()
  {
    return fieldE01ODAUSR.getString();
  }

  /**
  * Set field E01ODAAMT using a String value.
  */
  public void setE01ODAAMT(String newvalue)
  {
    fieldE01ODAAMT.setString(newvalue);
  }

  /**
  * Get value of field E01ODAAMT as a String.
  */
  public String getE01ODAAMT()
  {
    return fieldE01ODAAMT.getString();
  }

  /**
  * Set numeric field E01ODAAMT using a BigDecimal value.
  */
  public void setE01ODAAMT(BigDecimal newvalue)
  {
    fieldE01ODAAMT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ODAAMT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ODAAMT()
  {
    return fieldE01ODAAMT.getBigDecimal();
  }

  /**
  * Set field E01ODAOF1 using a String value.
  */
  public void setE01ODAOF1(String newvalue)
  {
    fieldE01ODAOF1.setString(newvalue);
  }

  /**
  * Get value of field E01ODAOF1 as a String.
  */
  public String getE01ODAOF1()
  {
    return fieldE01ODAOF1.getString();
  }

  /**
  * Set field E01ODAOF2 using a String value.
  */
  public void setE01ODAOF2(String newvalue)
  {
    fieldE01ODAOF2.setString(newvalue);
  }

  /**
  * Get value of field E01ODAOF2 as a String.
  */
  public String getE01ODAOF2()
  {
    return fieldE01ODAOF2.getString();
  }

  /**
  * Set field E01ODAAP1 using a String value.
  */
  public void setE01ODAAP1(String newvalue)
  {
    fieldE01ODAAP1.setString(newvalue);
  }

  /**
  * Get value of field E01ODAAP1 as a String.
  */
  public String getE01ODAAP1()
  {
    return fieldE01ODAAP1.getString();
  }

  /**
  * Set numeric field E01ODAAP1 using a BigDecimal value.
  */
  public void setE01ODAAP1(BigDecimal newvalue)
  {
    fieldE01ODAAP1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ODAAP1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ODAAP1()
  {
    return fieldE01ODAAP1.getBigDecimal();
  }

  /**
  * Set field E01ODAAP2 using a String value.
  */
  public void setE01ODAAP2(String newvalue)
  {
    fieldE01ODAAP2.setString(newvalue);
  }

  /**
  * Get value of field E01ODAAP2 as a String.
  */
  public String getE01ODAAP2()
  {
    return fieldE01ODAAP2.getString();
  }

  /**
  * Set numeric field E01ODAAP2 using a BigDecimal value.
  */
  public void setE01ODAAP2(BigDecimal newvalue)
  {
    fieldE01ODAAP2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ODAAP2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ODAAP2()
  {
    return fieldE01ODAAP2.getBigDecimal();
  }

  /**
  * Set field E01ODAAP3 using a String value.
  */
  public void setE01ODAAP3(String newvalue)
  {
    fieldE01ODAAP3.setString(newvalue);
  }

  /**
  * Get value of field E01ODAAP3 as a String.
  */
  public String getE01ODAAP3()
  {
    return fieldE01ODAAP3.getString();
  }

  /**
  * Set numeric field E01ODAAP3 using a BigDecimal value.
  */
  public void setE01ODAAP3(BigDecimal newvalue)
  {
    fieldE01ODAAP3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ODAAP3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ODAAP3()
  {
    return fieldE01ODAAP3.getBigDecimal();
  }

  /**
  * Set field E01ODAAPT using a String value.
  */
  public void setE01ODAAPT(String newvalue)
  {
    fieldE01ODAAPT.setString(newvalue);
  }

  /**
  * Get value of field E01ODAAPT as a String.
  */
  public String getE01ODAAPT()
  {
    return fieldE01ODAAPT.getString();
  }

  /**
  * Set numeric field E01ODAAPT using a BigDecimal value.
  */
  public void setE01ODAAPT(BigDecimal newvalue)
  {
    fieldE01ODAAPT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ODAAPT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ODAAPT()
  {
    return fieldE01ODAAPT.getBigDecimal();
  }

  /**
  * Set field E01ODAFLG using a String value.
  */
  public void setE01ODAFLG(String newvalue)
  {
    fieldE01ODAFLG.setString(newvalue);
  }

  /**
  * Get value of field E01ODAFLG as a String.
  */
  public String getE01ODAFLG()
  {
    return fieldE01ODAFLG.getString();
  }

  /**
  * Set field E01CUSNA1 using a String value.
  */
  public void setE01CUSNA1(String newvalue)
  {
    fieldE01CUSNA1.setString(newvalue);
  }

  /**
  * Get value of field E01CUSNA1 as a String.
  */
  public String getE01CUSNA1()
  {
    return fieldE01CUSNA1.getString();
  }

}
