package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ESD001801 physical file definition.
* 
* File level identifier is 1120906115737.
* Record format level identifier is 409D54CD16CA3.
*/

public class ESD001801Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H01USERID",
                                     "H01PROGRM",
                                     "H01TIMSYS",
                                     "H01SCR",
                                     "H01OPECOD",
                                     "H01FLGMAS",
                                     "H01FLGWK1",
                                     "H01FLGWK2",
                                     "H01FLGWK3",
                                     "E01USR",
                                     "E01BNK",
                                     "E01BRN",
                                     "E01ALL",
                                     "E01STS",
                                     "D01USR",
                                     "D01BRN",
                                     "F01USR",
                                     "F01BNK",
                                     "F01BRN",
                                     "F01ALL",
                                     "E01ACT",
                                     "E01NUMREC",
                                     "E01INDOPE"
                                   };
  final static String tnames[] = {
                                   "H01USERID",
                                   "H01PROGRM",
                                   "H01TIMSYS",
                                   "H01SCR",
                                   "H01OPECOD",
                                   "H01FLGMAS",
                                   "H01FLGWK1",
                                   "H01FLGWK2",
                                   "H01FLGWK3",
                                   "E01USR",
                                   "E01BNK",
                                   "E01BRN",
                                   "E01ALL",
                                   "E01STS",
                                   "D01USR",
                                   "D01BRN",
                                   "F01USR",
                                   "F01BNK",
                                   "F01BRN",
                                   "F01ALL",
                                   "E01ACT",
                                   "E01NUMREC",
                                   "E01INDOPE"
                                 };
  final static String fid = "1120906115737";
  final static String rid = "409D54CD16CA3";
  final static String fmtname = "ESD001801";
  final int FIELDCOUNT = 23;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH01USERID = null;
  private CharacterField fieldH01PROGRM = null;
  private CharacterField fieldH01TIMSYS = null;
  private CharacterField fieldH01SCR = null;
  private CharacterField fieldH01OPECOD = null;
  private CharacterField fieldH01FLGMAS = null;
  private CharacterField fieldH01FLGWK1 = null;
  private CharacterField fieldH01FLGWK2 = null;
  private CharacterField fieldH01FLGWK3 = null;
  private CharacterField fieldE01USR = null;
  private CharacterField fieldE01BNK = null;
  private DecimalField fieldE01BRN = null;
  private CharacterField fieldE01ALL = null;
  private CharacterField fieldE01STS = null;
  private CharacterField fieldD01USR = null;
  private CharacterField fieldD01BRN = null;
  private CharacterField fieldF01USR = null;
  private CharacterField fieldF01BNK = null;
  private CharacterField fieldF01BRN = null;
  private CharacterField fieldF01ALL = null;
  private CharacterField fieldE01ACT = null;
  private DecimalField fieldE01NUMREC = null;
  private CharacterField fieldE01INDOPE = null;

  /**
  * Constructor for ESD001801Message.
  */
  public ESD001801Message()
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
    recordsize = 145;
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
    fields[3] = fieldH01SCR =
    new CharacterField(message, HEADERSIZE + 32, 2, "H01SCR");
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
    fields[9] = fieldE01USR =
    new CharacterField(message, HEADERSIZE + 42, 10, "E01USR");
    fields[10] = fieldE01BNK =
    new CharacterField(message, HEADERSIZE + 52, 2, "E01BNK");
    fields[11] = fieldE01BRN =
    new DecimalField(message, HEADERSIZE + 54, 5, 0, "E01BRN");
    fields[12] = fieldE01ALL =
    new CharacterField(message, HEADERSIZE + 59, 1, "E01ALL");
    fields[13] = fieldE01STS =
    new CharacterField(message, HEADERSIZE + 60, 1, "E01STS");
    fields[14] = fieldD01USR =
    new CharacterField(message, HEADERSIZE + 61, 35, "D01USR");
    fields[15] = fieldD01BRN =
    new CharacterField(message, HEADERSIZE + 96, 35, "D01BRN");
    fields[16] = fieldF01USR =
    new CharacterField(message, HEADERSIZE + 131, 1, "F01USR");
    fields[17] = fieldF01BNK =
    new CharacterField(message, HEADERSIZE + 132, 1, "F01BNK");
    fields[18] = fieldF01BRN =
    new CharacterField(message, HEADERSIZE + 133, 1, "F01BRN");
    fields[19] = fieldF01ALL =
    new CharacterField(message, HEADERSIZE + 134, 1, "F01ALL");
    fields[20] = fieldE01ACT =
    new CharacterField(message, HEADERSIZE + 135, 1, "E01ACT");
    fields[21] = fieldE01NUMREC =
    new DecimalField(message, HEADERSIZE + 136, 8, 0, "E01NUMREC");
    fields[22] = fieldE01INDOPE =
    new CharacterField(message, HEADERSIZE + 144, 1, "E01INDOPE");

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
  * Set field H01SCR using a String value.
  */
  public void setH01SCR(String newvalue)
  {
    fieldH01SCR.setString(newvalue);
  }

  /**
  * Get value of field H01SCR as a String.
  */
  public String getH01SCR()
  {
    return fieldH01SCR.getString();
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
  * Set field E01USR using a String value.
  */
  public void setE01USR(String newvalue)
  {
    fieldE01USR.setString(newvalue);
  }

  /**
  * Get value of field E01USR as a String.
  */
  public String getE01USR()
  {
    return fieldE01USR.getString();
  }

  /**
  * Set field E01BNK using a String value.
  */
  public void setE01BNK(String newvalue)
  {
    fieldE01BNK.setString(newvalue);
  }

  /**
  * Get value of field E01BNK as a String.
  */
  public String getE01BNK()
  {
    return fieldE01BNK.getString();
  }

  /**
  * Set field E01BRN using a String value.
  */
  public void setE01BRN(String newvalue)
  {
    fieldE01BRN.setString(newvalue);
  }

  /**
  * Get value of field E01BRN as a String.
  */
  public String getE01BRN()
  {
    return fieldE01BRN.getString();
  }

  /**
  * Set numeric field E01BRN using a BigDecimal value.
  */
  public void setE01BRN(BigDecimal newvalue)
  {
    fieldE01BRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BRN()
  {
    return fieldE01BRN.getBigDecimal();
  }

  /**
  * Set field E01ALL using a String value.
  */
  public void setE01ALL(String newvalue)
  {
    fieldE01ALL.setString(newvalue);
  }

  /**
  * Get value of field E01ALL as a String.
  */
  public String getE01ALL()
  {
    return fieldE01ALL.getString();
  }

  /**
  * Set field E01STS using a String value.
  */
  public void setE01STS(String newvalue)
  {
    fieldE01STS.setString(newvalue);
  }

  /**
  * Get value of field E01STS as a String.
  */
  public String getE01STS()
  {
    return fieldE01STS.getString();
  }

  /**
  * Set field D01USR using a String value.
  */
  public void setD01USR(String newvalue)
  {
    fieldD01USR.setString(newvalue);
  }

  /**
  * Get value of field D01USR as a String.
  */
  public String getD01USR()
  {
    return fieldD01USR.getString();
  }

  /**
  * Set field D01BRN using a String value.
  */
  public void setD01BRN(String newvalue)
  {
    fieldD01BRN.setString(newvalue);
  }

  /**
  * Get value of field D01BRN as a String.
  */
  public String getD01BRN()
  {
    return fieldD01BRN.getString();
  }

  /**
  * Set field F01USR using a String value.
  */
  public void setF01USR(String newvalue)
  {
    fieldF01USR.setString(newvalue);
  }

  /**
  * Get value of field F01USR as a String.
  */
  public String getF01USR()
  {
    return fieldF01USR.getString();
  }

  /**
  * Set field F01BNK using a String value.
  */
  public void setF01BNK(String newvalue)
  {
    fieldF01BNK.setString(newvalue);
  }

  /**
  * Get value of field F01BNK as a String.
  */
  public String getF01BNK()
  {
    return fieldF01BNK.getString();
  }

  /**
  * Set field F01BRN using a String value.
  */
  public void setF01BRN(String newvalue)
  {
    fieldF01BRN.setString(newvalue);
  }

  /**
  * Get value of field F01BRN as a String.
  */
  public String getF01BRN()
  {
    return fieldF01BRN.getString();
  }

  /**
  * Set field F01ALL using a String value.
  */
  public void setF01ALL(String newvalue)
  {
    fieldF01ALL.setString(newvalue);
  }

  /**
  * Get value of field F01ALL as a String.
  */
  public String getF01ALL()
  {
    return fieldF01ALL.getString();
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
