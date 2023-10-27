package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ECA001201 physical file definition.
* 
* File level identifier is 1160525144013.
* Record format level identifier is 40276B18CD962.
*/

public class ECA001201Message extends MessageRecord
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
                                     "E01ITSIBS",
                                     "E01ITSACD",
                                     "E01ITSAPC",
                                     "E01ITSDSC",
                                     "E01ITSEXD",
                                     "E01ITSEXC",
                                     "E01ITSEST",
                                     "E01ITSCUS",
                                     "E01ITSCDM",
                                     "E01ITSCDD",
                                     "E01ITSCDY",
                                     "E01ITSCTM",
                                     "E01ITSMUS",
                                     "E01ITSRDM",
                                     "E01ITSRDD",
                                     "E01ITSRDY",
                                     "E01ITSMTM",
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
                                   "E01ITSIBS",
                                   "E01ITSACD",
                                   "E01ITSAPC",
                                   "E01ITSDSC",
                                   "E01ITSEXD",
                                   "E01ITSEXC",
                                   "E01ITSEST",
                                   "E01ITSCUS",
                                   "E01ITSCDM",
                                   "E01ITSCDD",
                                   "E01ITSCDY",
                                   "E01ITSCTM",
                                   "E01ITSMUS",
                                   "E01ITSRDM",
                                   "E01ITSRDD",
                                   "E01ITSRDY",
                                   "E01ITSMTM",
                                   "E01NUMREC",
                                   "E01INDOPE"
                                 };
  final static String fid = "1160525144013";
  final static String rid = "40276B18CD962";
  final static String fmtname = "ECA001201";
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
  private CharacterField fieldE01ITSIBS = null;
  private CharacterField fieldE01ITSACD = null;
  private CharacterField fieldE01ITSAPC = null;
  private CharacterField fieldE01ITSDSC = null;
  private DecimalField fieldE01ITSEXD = null;
  private DecimalField fieldE01ITSEXC = null;
  private CharacterField fieldE01ITSEST = null;
  private CharacterField fieldE01ITSCUS = null;
  private DecimalField fieldE01ITSCDM = null;
  private DecimalField fieldE01ITSCDD = null;
  private DecimalField fieldE01ITSCDY = null;
  private CharacterField fieldE01ITSCTM = null;
  private CharacterField fieldE01ITSMUS = null;
  private DecimalField fieldE01ITSRDM = null;
  private DecimalField fieldE01ITSRDD = null;
  private DecimalField fieldE01ITSRDY = null;
  private CharacterField fieldE01ITSMTM = null;
  private DecimalField fieldE01NUMREC = null;
  private CharacterField fieldE01INDOPE = null;

  /**
  * Constructor for ECA001201Message.
  */
  public ECA001201Message()
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
    recordsize = 211;
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
    fields[9] = fieldE01ITSIBS =
    new CharacterField(message, HEADERSIZE + 42, 4, "E01ITSIBS");
    fields[10] = fieldE01ITSACD =
    new CharacterField(message, HEADERSIZE + 46, 2, "E01ITSACD");
    fields[11] = fieldE01ITSAPC =
    new CharacterField(message, HEADERSIZE + 48, 2, "E01ITSAPC");
    fields[12] = fieldE01ITSDSC =
    new CharacterField(message, HEADERSIZE + 50, 45, "E01ITSDSC");
    fields[13] = fieldE01ITSEXD =
    new DecimalField(message, HEADERSIZE + 95, 6, 0, "E01ITSEXD");
    fields[14] = fieldE01ITSEXC =
    new DecimalField(message, HEADERSIZE + 101, 6, 0, "E01ITSEXC");
    fields[15] = fieldE01ITSEST =
    new CharacterField(message, HEADERSIZE + 107, 1, "E01ITSEST");
    fields[16] = fieldE01ITSCUS =
    new CharacterField(message, HEADERSIZE + 108, 10, "E01ITSCUS");
    fields[17] = fieldE01ITSCDM =
    new DecimalField(message, HEADERSIZE + 118, 3, 0, "E01ITSCDM");
    fields[18] = fieldE01ITSCDD =
    new DecimalField(message, HEADERSIZE + 121, 3, 0, "E01ITSCDD");
    fields[19] = fieldE01ITSCDY =
    new DecimalField(message, HEADERSIZE + 124, 5, 0, "E01ITSCDY");
    fields[20] = fieldE01ITSCTM =
    new CharacterField(message, HEADERSIZE + 129, 26, "E01ITSCTM");
    fields[21] = fieldE01ITSMUS =
    new CharacterField(message, HEADERSIZE + 155, 10, "E01ITSMUS");
    fields[22] = fieldE01ITSRDM =
    new DecimalField(message, HEADERSIZE + 165, 3, 0, "E01ITSRDM");
    fields[23] = fieldE01ITSRDD =
    new DecimalField(message, HEADERSIZE + 168, 3, 0, "E01ITSRDD");
    fields[24] = fieldE01ITSRDY =
    new DecimalField(message, HEADERSIZE + 171, 5, 0, "E01ITSRDY");
    fields[25] = fieldE01ITSMTM =
    new CharacterField(message, HEADERSIZE + 176, 26, "E01ITSMTM");
    fields[26] = fieldE01NUMREC =
    new DecimalField(message, HEADERSIZE + 202, 8, 0, "E01NUMREC");
    fields[27] = fieldE01INDOPE =
    new CharacterField(message, HEADERSIZE + 210, 1, "E01INDOPE");

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
  * Set field E01ITSIBS using a String value.
  */
  public void setE01ITSIBS(String newvalue)
  {
    fieldE01ITSIBS.setString(newvalue);
  }

  /**
  * Get value of field E01ITSIBS as a String.
  */
  public String getE01ITSIBS()
  {
    return fieldE01ITSIBS.getString();
  }

  /**
  * Set field E01ITSACD using a String value.
  */
  public void setE01ITSACD(String newvalue)
  {
    fieldE01ITSACD.setString(newvalue);
  }

  /**
  * Get value of field E01ITSACD as a String.
  */
  public String getE01ITSACD()
  {
    return fieldE01ITSACD.getString();
  }

  /**
  * Set field E01ITSAPC using a String value.
  */
  public void setE01ITSAPC(String newvalue)
  {
    fieldE01ITSAPC.setString(newvalue);
  }

  /**
  * Get value of field E01ITSAPC as a String.
  */
  public String getE01ITSAPC()
  {
    return fieldE01ITSAPC.getString();
  }

  /**
  * Set field E01ITSDSC using a String value.
  */
  public void setE01ITSDSC(String newvalue)
  {
    fieldE01ITSDSC.setString(newvalue);
  }

  /**
  * Get value of field E01ITSDSC as a String.
  */
  public String getE01ITSDSC()
  {
    return fieldE01ITSDSC.getString();
  }

  /**
  * Set field E01ITSEXD using a String value.
  */
  public void setE01ITSEXD(String newvalue)
  {
    fieldE01ITSEXD.setString(newvalue);
  }

  /**
  * Get value of field E01ITSEXD as a String.
  */
  public String getE01ITSEXD()
  {
    return fieldE01ITSEXD.getString();
  }

  /**
  * Set numeric field E01ITSEXD using a BigDecimal value.
  */
  public void setE01ITSEXD(BigDecimal newvalue)
  {
    fieldE01ITSEXD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ITSEXD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ITSEXD()
  {
    return fieldE01ITSEXD.getBigDecimal();
  }

  /**
  * Set field E01ITSEXC using a String value.
  */
  public void setE01ITSEXC(String newvalue)
  {
    fieldE01ITSEXC.setString(newvalue);
  }

  /**
  * Get value of field E01ITSEXC as a String.
  */
  public String getE01ITSEXC()
  {
    return fieldE01ITSEXC.getString();
  }

  /**
  * Set numeric field E01ITSEXC using a BigDecimal value.
  */
  public void setE01ITSEXC(BigDecimal newvalue)
  {
    fieldE01ITSEXC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ITSEXC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ITSEXC()
  {
    return fieldE01ITSEXC.getBigDecimal();
  }

  /**
  * Set field E01ITSEST using a String value.
  */
  public void setE01ITSEST(String newvalue)
  {
    fieldE01ITSEST.setString(newvalue);
  }

  /**
  * Get value of field E01ITSEST as a String.
  */
  public String getE01ITSEST()
  {
    return fieldE01ITSEST.getString();
  }

  /**
  * Set field E01ITSCUS using a String value.
  */
  public void setE01ITSCUS(String newvalue)
  {
    fieldE01ITSCUS.setString(newvalue);
  }

  /**
  * Get value of field E01ITSCUS as a String.
  */
  public String getE01ITSCUS()
  {
    return fieldE01ITSCUS.getString();
  }

  /**
  * Set field E01ITSCDM using a String value.
  */
  public void setE01ITSCDM(String newvalue)
  {
    fieldE01ITSCDM.setString(newvalue);
  }

  /**
  * Get value of field E01ITSCDM as a String.
  */
  public String getE01ITSCDM()
  {
    return fieldE01ITSCDM.getString();
  }

  /**
  * Set numeric field E01ITSCDM using a BigDecimal value.
  */
  public void setE01ITSCDM(BigDecimal newvalue)
  {
    fieldE01ITSCDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ITSCDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ITSCDM()
  {
    return fieldE01ITSCDM.getBigDecimal();
  }

  /**
  * Set field E01ITSCDD using a String value.
  */
  public void setE01ITSCDD(String newvalue)
  {
    fieldE01ITSCDD.setString(newvalue);
  }

  /**
  * Get value of field E01ITSCDD as a String.
  */
  public String getE01ITSCDD()
  {
    return fieldE01ITSCDD.getString();
  }

  /**
  * Set numeric field E01ITSCDD using a BigDecimal value.
  */
  public void setE01ITSCDD(BigDecimal newvalue)
  {
    fieldE01ITSCDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ITSCDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ITSCDD()
  {
    return fieldE01ITSCDD.getBigDecimal();
  }

  /**
  * Set field E01ITSCDY using a String value.
  */
  public void setE01ITSCDY(String newvalue)
  {
    fieldE01ITSCDY.setString(newvalue);
  }

  /**
  * Get value of field E01ITSCDY as a String.
  */
  public String getE01ITSCDY()
  {
    return fieldE01ITSCDY.getString();
  }

  /**
  * Set numeric field E01ITSCDY using a BigDecimal value.
  */
  public void setE01ITSCDY(BigDecimal newvalue)
  {
    fieldE01ITSCDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ITSCDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ITSCDY()
  {
    return fieldE01ITSCDY.getBigDecimal();
  }

  /**
  * Set field E01ITSCTM using a String value.
  */
  public void setE01ITSCTM(String newvalue)
  {
    fieldE01ITSCTM.setString(newvalue);
  }

  /**
  * Get value of field E01ITSCTM as a String.
  */
  public String getE01ITSCTM()
  {
    return fieldE01ITSCTM.getString();
  }

  /**
  * Set field E01ITSMUS using a String value.
  */
  public void setE01ITSMUS(String newvalue)
  {
    fieldE01ITSMUS.setString(newvalue);
  }

  /**
  * Get value of field E01ITSMUS as a String.
  */
  public String getE01ITSMUS()
  {
    return fieldE01ITSMUS.getString();
  }

  /**
  * Set field E01ITSRDM using a String value.
  */
  public void setE01ITSRDM(String newvalue)
  {
    fieldE01ITSRDM.setString(newvalue);
  }

  /**
  * Get value of field E01ITSRDM as a String.
  */
  public String getE01ITSRDM()
  {
    return fieldE01ITSRDM.getString();
  }

  /**
  * Set numeric field E01ITSRDM using a BigDecimal value.
  */
  public void setE01ITSRDM(BigDecimal newvalue)
  {
    fieldE01ITSRDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ITSRDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ITSRDM()
  {
    return fieldE01ITSRDM.getBigDecimal();
  }

  /**
  * Set field E01ITSRDD using a String value.
  */
  public void setE01ITSRDD(String newvalue)
  {
    fieldE01ITSRDD.setString(newvalue);
  }

  /**
  * Get value of field E01ITSRDD as a String.
  */
  public String getE01ITSRDD()
  {
    return fieldE01ITSRDD.getString();
  }

  /**
  * Set numeric field E01ITSRDD using a BigDecimal value.
  */
  public void setE01ITSRDD(BigDecimal newvalue)
  {
    fieldE01ITSRDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ITSRDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ITSRDD()
  {
    return fieldE01ITSRDD.getBigDecimal();
  }

  /**
  * Set field E01ITSRDY using a String value.
  */
  public void setE01ITSRDY(String newvalue)
  {
    fieldE01ITSRDY.setString(newvalue);
  }

  /**
  * Get value of field E01ITSRDY as a String.
  */
  public String getE01ITSRDY()
  {
    return fieldE01ITSRDY.getString();
  }

  /**
  * Set numeric field E01ITSRDY using a BigDecimal value.
  */
  public void setE01ITSRDY(BigDecimal newvalue)
  {
    fieldE01ITSRDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ITSRDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ITSRDY()
  {
    return fieldE01ITSRDY.getBigDecimal();
  }

  /**
  * Set field E01ITSMTM using a String value.
  */
  public void setE01ITSMTM(String newvalue)
  {
    fieldE01ITSMTM.setString(newvalue);
  }

  /**
  * Get value of field E01ITSMTM as a String.
  */
  public String getE01ITSMTM()
  {
    return fieldE01ITSMTM.getString();
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
