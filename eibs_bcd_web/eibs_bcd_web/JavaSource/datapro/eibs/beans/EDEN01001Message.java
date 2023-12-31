package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDEN01001 physical file definition.
* 
* File level identifier is 1150504144336.
* Record format level identifier is 3B986C33A25BD.
*/

public class EDEN01001Message extends MessageRecord
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
                                     "E01SRCHTP",
                                     "E01NROWOR",
                                     "E01NROWOJ",
                                     "E01NROWOP",
                                     "E01NROMAT",
                                     "E01INCIDN",
                                     "E01DFTEXS",
                                     "E01DFTINS",
                                     "E01RSNBLK",
                                     "E01MTVBLK",
                                     "E01SRCBL1",
                                     "E01SRCBL2",
                                     "E01SRCBL3",
                                     "E01SRCBL4",
                                     "E01SRCBL5",
                                     "E01SRCBL6",
                                     "E01SRCBL7",
                                     "E01SRCBL8",
                                     "E01SRCBL9",
                                     "E01SRCBL10",
                                     "E01SRCBL11",
                                     "E01SRCBL12",
                                     "E01SRCBL13",
                                     "E01SRCBL14",
                                     "E01SRCBL15",
                                     "E01SRCBL16",
                                     "E01SRCBL17",
                                     "E01SRCBL18",
                                     "E01SRCBL19",
                                     "E01SRCBL20"
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
                                   "E01SRCHTP",
                                   "E01NROWOR",
                                   "E01NROWOJ",
                                   "E01NROWOP",
                                   "E01NROMAT",
                                   "E01INCIDN",
                                   "E01DFTEXS",
                                   "E01DFTINS",
                                   "E01RSNBLK",
                                   "E01MTVBLK",
                                   "E01SRCBL1",
                                   "E01SRCBL2",
                                   "E01SRCBL3", 
                                   "E01SRCBL4",
                                   "E01SRCBL5",
                                   "E01SRCBL6",
                                   "E01SRCBL7",
                                   "E01SRCBL8",
                                   "E01SRCBL9",
                                   "E01SRCBL10",
                                   "E01SRCBL11",
                                   "E01SRCBL12",
                                   "E01SRCBL13",
                                   "E01SRCBL14",
                                   "E01SRCBL15",
                                   "E01SRCBL16",
                                   "E01SRCBL17",
                                   "E01SRCBL18",
                                   "E01SRCBL19",
                                   "E01SRCBL20"
                                 };
  final static String fid = "1150504144336";
  final static String rid = "3B986C33A25BD";
  final static String fmtname = "EDEN01001";
  final int FIELDCOUNT = 39;
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
  private CharacterField fieldE01SRCHTP = null;
  private DecimalField fieldE01NROWOR = null;
  private DecimalField fieldE01NROWOJ = null;
  private DecimalField fieldE01NROWOP = null;
  private DecimalField fieldE01NROMAT = null;
  private CharacterField fieldE01INCIDN = null;
  private CharacterField fieldE01DFTEXS = null;
  private CharacterField fieldE01DFTINS = null;
  private CharacterField fieldE01RSNBLK = null;
  private CharacterField fieldE01MTVBLK = null;
  private CharacterField fieldE01SRCBL1 = null;
  private CharacterField fieldE01SRCBL2 = null;
  private CharacterField fieldE01SRCBL3 = null;
  private CharacterField fieldE01SRCBL4 = null;
  private CharacterField fieldE01SRCBL5 = null;
  private CharacterField fieldE01SRCBL6 = null;
  private CharacterField fieldE01SRCBL7 = null;
  private CharacterField fieldE01SRCBL8 = null;
  private CharacterField fieldE01SRCBL9 = null;
  private CharacterField fieldE01SRCBL10 = null;
  private CharacterField fieldE01SRCBL11 = null;
  private CharacterField fieldE01SRCBL12 = null;
  private CharacterField fieldE01SRCBL13 = null;
  private CharacterField fieldE01SRCBL14 = null;
  private CharacterField fieldE01SRCBL15 = null;
  private CharacterField fieldE01SRCBL16 = null;
  private CharacterField fieldE01SRCBL17 = null;
  private CharacterField fieldE01SRCBL18 = null;
  private CharacterField fieldE01SRCBL19 = null;
  private CharacterField fieldE01SRCBL20 = null;

  /**
  * Constructor for EDEN01001Message.
  */
  public EDEN01001Message()
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
    recordsize = 152;
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
    fields[9] = fieldE01SRCHTP =
    new CharacterField(message, HEADERSIZE + 42, 1, "E01SRCHTP");
    fields[10] = fieldE01NROWOR =
    new DecimalField(message, HEADERSIZE + 43, 3, 0, "E01NROWOR");
    fields[11] = fieldE01NROWOJ =
    new DecimalField(message, HEADERSIZE + 46, 3, 0, "E01NROWOJ");
    fields[12] = fieldE01NROWOP =
    new DecimalField(message, HEADERSIZE + 49, 3, 0, "E01NROWOP");
    fields[13] = fieldE01NROMAT =
    new DecimalField(message, HEADERSIZE + 52, 3, 0, "E01NROMAT");
    fields[14] = fieldE01INCIDN =
    new CharacterField(message, HEADERSIZE + 55, 1, "E01INCIDN");
    fields[15] = fieldE01DFTEXS =
    new CharacterField(message, HEADERSIZE + 56, 4, "E01DFTEXS");
    fields[16] = fieldE01DFTINS =
    new CharacterField(message, HEADERSIZE + 60, 4, "E01DFTINS");
    fields[17] = fieldE01RSNBLK =
    new CharacterField(message, HEADERSIZE + 64, 4, "E01RSNBLK");
    fields[18] = fieldE01MTVBLK =
    new CharacterField(message, HEADERSIZE + 68, 4, "E01MTVBLK");
    fields[19] = fieldE01SRCBL1 =
    new CharacterField(message, HEADERSIZE + 72, 4, "E01SRCBL1");
    fields[20] = fieldE01SRCBL2 =
    new CharacterField(message, HEADERSIZE + 76, 4, "E01SRCBL2");
    fields[21] = fieldE01SRCBL3 =
    new CharacterField(message, HEADERSIZE + 80, 4, "E01SRCBL3");
    fields[22] = fieldE01SRCBL4 =
    new CharacterField(message, HEADERSIZE + 84, 4, "E01SRCBL4");
    fields[23] = fieldE01SRCBL5 =
    new CharacterField(message, HEADERSIZE + 88, 4, "E01SRCBL5");
    fields[24] = fieldE01SRCBL6 =
    new CharacterField(message, HEADERSIZE + 92, 4, "E01SRCBL6");
    fields[25] = fieldE01SRCBL7 =
    new CharacterField(message, HEADERSIZE + 96, 4, "E01SRCBL7");
    fields[26] = fieldE01SRCBL8 =
    new CharacterField(message, HEADERSIZE + 100, 4, "E01SRCBL8");
    fields[27] = fieldE01SRCBL9 =
    new CharacterField(message, HEADERSIZE + 104, 4, "E01SRCBL9");
    fields[28] = fieldE01SRCBL10 =
    new CharacterField(message, HEADERSIZE + 108, 4, "E01SRCBL10");
    fields[29] = fieldE01SRCBL11 =
    new CharacterField(message, HEADERSIZE + 112, 4, "E01SRCBL11");
    fields[30] = fieldE01SRCBL12 =
    new CharacterField(message, HEADERSIZE + 116, 4, "E01SRCBL12");
    fields[31] = fieldE01SRCBL13 =
    new CharacterField(message, HEADERSIZE + 120, 4, "E01SRCBL13");
    fields[32] = fieldE01SRCBL14 =
    new CharacterField(message, HEADERSIZE + 124, 4, "E01SRCBL14");
    fields[33] = fieldE01SRCBL15 =
    new CharacterField(message, HEADERSIZE + 128, 4, "E01SRCBL15");
    fields[34] = fieldE01SRCBL16 =
    new CharacterField(message, HEADERSIZE + 132, 4, "E01SRCBL16");
    fields[35] = fieldE01SRCBL17 =
    new CharacterField(message, HEADERSIZE + 136, 4, "E01SRCBL17");
    fields[36] = fieldE01SRCBL18 =
    new CharacterField(message, HEADERSIZE + 140, 4, "E01SRCBL18");
    fields[37] = fieldE01SRCBL19 =
    new CharacterField(message, HEADERSIZE + 144, 4, "E01SRCBL19");
    fields[38] = fieldE01SRCBL20 =
    new CharacterField(message, HEADERSIZE + 148, 4, "E01SRCBL20");

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
  * Set field E01SRCHTP using a String value.
  */
  public void setE01SRCHTP(String newvalue)
  {
    fieldE01SRCHTP.setString(newvalue);
  }

  /**
  * Get value of field E01SRCHTP as a String.
  */
  public String getE01SRCHTP()
  {
    return fieldE01SRCHTP.getString();
  }

  /**
  * Set field E01NROWOR using a String value.
  */
  public void setE01NROWOR(String newvalue)
  {
    fieldE01NROWOR.setString(newvalue);
  }

  /**
  * Get value of field E01NROWOR as a String.
  */
  public String getE01NROWOR()
  {
    return fieldE01NROWOR.getString();
  }

  /**
  * Set numeric field E01NROWOR using a BigDecimal value.
  */
  public void setE01NROWOR(BigDecimal newvalue)
  {
    fieldE01NROWOR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01NROWOR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01NROWOR()
  {
    return fieldE01NROWOR.getBigDecimal();
  }

  /**
  * Set field E01NROWOJ using a String value.
  */
  public void setE01NROWOJ(String newvalue)
  {
    fieldE01NROWOJ.setString(newvalue);
  }

  /**
  * Get value of field E01NROWOJ as a String.
  */
  public String getE01NROWOJ()
  {
    return fieldE01NROWOJ.getString();
  }

  /**
  * Set numeric field E01NROWOJ using a BigDecimal value.
  */
  public void setE01NROWOJ(BigDecimal newvalue)
  {
    fieldE01NROWOJ.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01NROWOJ as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01NROWOJ()
  {
    return fieldE01NROWOJ.getBigDecimal();
  }

  /**
  * Set field E01NROWOP using a String value.
  */
  public void setE01NROWOP(String newvalue)
  {
    fieldE01NROWOP.setString(newvalue);
  }

  /**
  * Get value of field E01NROWOP as a String.
  */
  public String getE01NROWOP()
  {
    return fieldE01NROWOP.getString();
  }

  /**
  * Set numeric field E01NROWOP using a BigDecimal value.
  */
  public void setE01NROWOP(BigDecimal newvalue)
  {
    fieldE01NROWOP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01NROWOP as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01NROWOP()
  {
    return fieldE01NROWOP.getBigDecimal();
  }

  /**
  * Set field E01NROMAT using a String value.
  */
  public void setE01NROMAT(String newvalue)
  {
    fieldE01NROMAT.setString(newvalue);
  }

  /**
  * Get value of field E01NROMAT as a String.
  */
  public String getE01NROMAT()
  {
    return fieldE01NROMAT.getString();
  }

  /**
  * Set numeric field E01NROMAT using a BigDecimal value.
  */
  public void setE01NROMAT(BigDecimal newvalue)
  {
    fieldE01NROMAT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01NROMAT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01NROMAT()
  {
    return fieldE01NROMAT.getBigDecimal();
  }

  /**
  * Set field E01INCIDN using a String value.
  */
  public void setE01INCIDN(String newvalue)
  {
    fieldE01INCIDN.setString(newvalue);
  }

  /**
  * Get value of field E01INCIDN as a String.
  */
  public String getE01INCIDN()
  {
    return fieldE01INCIDN.getString();
  }

  /**
  * Set field E01DFTEXS using a String value.
  */
  public void setE01DFTEXS(String newvalue)
  {
    fieldE01DFTEXS.setString(newvalue);
  }

  /**
  * Get value of field E01DFTEXS as a String.
  */
  public String getE01DFTEXS()
  {
    return fieldE01DFTEXS.getString();
  }

  /**
  * Set field E01DFTINS using a String value.
  */
  public void setE01DFTINS(String newvalue)
  {
    fieldE01DFTINS.setString(newvalue);
  }

  /**
  * Get value of field E01DFTINS as a String.
  */
  public String getE01DFTINS()
  {
    return fieldE01DFTINS.getString();
  }

  /**
  * Set field E01RSNBLK using a String value.
  */
  public void setE01RSNBLK(String newvalue)
  {
    fieldE01RSNBLK.setString(newvalue);
  }

  /**
  * Get value of field E01RSNBLK as a String.
  */
  public String getE01RSNBLK()
  {
    return fieldE01RSNBLK.getString();
  }

  /**
  * Set field E01MTVBLK using a String value.
  */
  public void setE01MTVBLK(String newvalue)
  {
    fieldE01MTVBLK.setString(newvalue);
  }

  /**
  * Get value of field E01MTVBLK as a String.
  */
  public String getE01MTVBLK()
  {
    return fieldE01MTVBLK.getString();
  }

  /**
  * Set field E01SRCBL1 using a String value.
  */
  public void setE01SRCBL1(String newvalue)
  {
    fieldE01SRCBL1.setString(newvalue);
  }

  /**
  * Get value of field E01SRCBL1 as a String.
  */
  public String getE01SRCBL1()
  {
    return fieldE01SRCBL1.getString();
  }

  /**
  * Set field E01SRCBL2 using a String value.
  */
  public void setE01SRCBL2(String newvalue)
  {
    fieldE01SRCBL2.setString(newvalue);
  }

  /**
  * Get value of field E01SRCBL2 as a String.
  */
  public String getE01SRCBL2()
  {
    return fieldE01SRCBL2.getString();
  }

  /**
  * Set field E01SRCBL3 using a String value.
  */
  public void setE01SRCBL3(String newvalue)
  {
    fieldE01SRCBL3.setString(newvalue);
  }

  /**
  * Get value of field E01SRCBL3 as a String.
  */
  public String getE01SRCBL3()
  {
    return fieldE01SRCBL3.getString();
  }

  /**
  * Set field E01SRCBL4 using a String value.
  */
  public void setE01SRCBL4(String newvalue)
  {
    fieldE01SRCBL4.setString(newvalue);
  }

  /**
  * Get value of field E01SRCBL4 as a String.
  */
  public String getE01SRCBL4()
  {
    return fieldE01SRCBL4.getString();
  }

  /**
  * Set field E01SRCBL5 using a String value.
  */
  public void setE01SRCBL5(String newvalue)
  {
    fieldE01SRCBL5.setString(newvalue);
  }

  /**
  * Get value of field E01SRCBL5 as a String.
  */
  public String getE01SRCBL5()
  {
    return fieldE01SRCBL5.getString();
  }

  /**
  * Set field E01SRCBL6 using a String value.
  */
  public void setE01SRCBL6(String newvalue)
  {
    fieldE01SRCBL6.setString(newvalue);
  }

  /**
  * Get value of field E01SRCBL6 as a String.
  */
  public String getE01SRCBL6()
  {
    return fieldE01SRCBL6.getString();
  }

  /**
  * Set field E01SRCBL7 using a String value.
  */
  public void setE01SRCBL7(String newvalue)
  {
    fieldE01SRCBL7.setString(newvalue);
  }

  /**
  * Get value of field E01SRCBL7 as a String.
  */
  public String getE01SRCBL7()
  {
    return fieldE01SRCBL7.getString();
  }

  /**
  * Set field E01SRCBL8 using a String value.
  */
  public void setE01SRCBL8(String newvalue)
  {
    fieldE01SRCBL8.setString(newvalue);
  }

  /**
  * Get value of field E01SRCBL8 as a String.
  */
  public String getE01SRCBL8()
  {
    return fieldE01SRCBL8.getString();
  }

  /**
  * Set field E01SRCBL9 using a String value.
  */
  public void setE01SRCBL9(String newvalue)
  {
    fieldE01SRCBL9.setString(newvalue);
  }

  /**
  * Get value of field E01SRCBL9 as a String.
  */
  public String getE01SRCBL9()
  {
    return fieldE01SRCBL9.getString();
  }

  /**
  * Set field E01SRCBL10 using a String value.
  */
  public void setE01SRCBL10(String newvalue)
  {
    fieldE01SRCBL10.setString(newvalue);
  }

  /**
  * Get value of field E01SRCBL10 as a String.
  */
  public String getE01SRCBL10()
  {
    return fieldE01SRCBL10.getString();
  }

  /**
  * Set field E01SRCBL11 using a String value.
  */
  public void setE01SRCBL11(String newvalue)
  {
    fieldE01SRCBL11.setString(newvalue);
  }

  /**
  * Get value of field E01SRCBL11 as a String.
  */
  public String getE01SRCBL11()
  {
    return fieldE01SRCBL11.getString();
  }

  /**
  * Set field E01SRCBL12 using a String value.
  */
  public void setE01SRCBL12(String newvalue)
  {
    fieldE01SRCBL12.setString(newvalue);
  }

  /**
  * Get value of field E01SRCBL12 as a String.
  */
  public String getE01SRCBL12()
  {
    return fieldE01SRCBL12.getString();
  }

  /**
  * Set field E01SRCBL13 using a String value.
  */
  public void setE01SRCBL13(String newvalue)
  {
    fieldE01SRCBL13.setString(newvalue);
  }

  /**
  * Get value of field E01SRCBL13 as a String.
  */
  public String getE01SRCBL13()
  {
    return fieldE01SRCBL13.getString();
  }

  /**
  * Set field E01SRCBL14 using a String value.
  */
  public void setE01SRCBL14(String newvalue)
  {
    fieldE01SRCBL14.setString(newvalue);
  }

  /**
  * Get value of field E01SRCBL14 as a String.
  */
  public String getE01SRCBL14()
  {
    return fieldE01SRCBL14.getString();
  }

  /**
  * Set field E01SRCBL15 using a String value.
  */
  public void setE01SRCBL15(String newvalue)
  {
    fieldE01SRCBL15.setString(newvalue);
  }

  /**
  * Get value of field E01SRCBL15 as a String.
  */
  public String getE01SRCBL15()
  {
    return fieldE01SRCBL15.getString();
  }

  /**
  * Set field E01SRCBL16 using a String value.
  */
  public void setE01SRCBL16(String newvalue)
  {
    fieldE01SRCBL16.setString(newvalue);
  }

  /**
  * Get value of field E01SRCBL16 as a String.
  */
  public String getE01SRCBL16()
  {
    return fieldE01SRCBL16.getString();
  }

  /**
  * Set field E01SRCBL17 using a String value.
  */
  public void setE01SRCBL17(String newvalue)
  {
    fieldE01SRCBL17.setString(newvalue);
  }

  /**
  * Get value of field E01SRCBL17 as a String.
  */
  public String getE01SRCBL17()
  {
    return fieldE01SRCBL17.getString();
  }

  /**
  * Set field E01SRCBL18 using a String value.
  */
  public void setE01SRCBL18(String newvalue)
  {
    fieldE01SRCBL18.setString(newvalue);
  }

  /**
  * Get value of field E01SRCBL18 as a String.
  */
  public String getE01SRCBL18()
  {
    return fieldE01SRCBL18.getString();
  }

  /**
  * Set field E01SRCBL19 using a String value.
  */
  public void setE01SRCBL19(String newvalue)
  {
    fieldE01SRCBL19.setString(newvalue);
  }

  /**
  * Get value of field E01SRCBL19 as a String.
  */
  public String getE01SRCBL19()
  {
    return fieldE01SRCBL19.getString();
  }

  /**
  * Set field E01SRCBL20 using a String value.
  */
  public void setE01SRCBL20(String newvalue)
  {
    fieldE01SRCBL20.setString(newvalue);
  }

  /**
  * Get value of field E01SRCBL20 as a String.
  */
  public String getE01SRCBL20()
  {
    return fieldE01SRCBL20.getString();
  }

}
