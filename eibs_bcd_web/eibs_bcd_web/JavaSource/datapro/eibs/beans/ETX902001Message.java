package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ETX902001 physical file definition.
* 
* File level identifier is 1160518133058.
* Record format level identifier is 43743FAD72498.
*/

public class ETX902001Message extends MessageRecord
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
                                     "E01TXUVDY",
                                     "E01TXUVDM",
                                     "E01TXUVDD",
                                     "E01TXUBAS",
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
                                   "E01TXUVDY",
                                   "E01TXUVDM",
                                   "E01TXUVDD",
                                   "E01TXUBAS",
                                   "E01ACT",
                                   "E01NUMREC",
                                   "E01INDOPE"
                                 };
  final static String fid = "1160518133058";
  final static String rid = "43743FAD72498";
  final static String fmtname = "ETX902001";
  final int FIELDCOUNT = 16;
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
  private DecimalField fieldE01TXUVDY = null;
  private DecimalField fieldE01TXUVDM = null;
  private DecimalField fieldE01TXUVDD = null;
  private DecimalField fieldE01TXUBAS = null;
  private CharacterField fieldE01ACT = null;
  private DecimalField fieldE01NUMREC = null;
  private CharacterField fieldE01INDOPE = null;

  /**
  * Constructor for ETX902001Message.
  */
  public ETX902001Message()
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
    recordsize = 80;
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
    fields[9] = fieldE01TXUVDY =
    new DecimalField(message, HEADERSIZE + 42, 5, 0, "E01TXUVDY");
    fields[10] = fieldE01TXUVDM =
    new DecimalField(message, HEADERSIZE + 47, 3, 0, "E01TXUVDM");
    fields[11] = fieldE01TXUVDD =
    new DecimalField(message, HEADERSIZE + 50, 3, 0, "E01TXUVDD");
    fields[12] = fieldE01TXUBAS =
    new DecimalField(message, HEADERSIZE + 53, 17, 2, "E01TXUBAS");
    fields[13] = fieldE01ACT =
    new CharacterField(message, HEADERSIZE + 70, 1, "E01ACT");
    fields[14] = fieldE01NUMREC =
    new DecimalField(message, HEADERSIZE + 71, 8, 0, "E01NUMREC");
    fields[15] = fieldE01INDOPE =
    new CharacterField(message, HEADERSIZE + 79, 1, "E01INDOPE");

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
  * Set field E01TXUVDY using a String value.
  */
  public void setE01TXUVDY(String newvalue)
  {
    fieldE01TXUVDY.setString(newvalue);
  }

  /**
  * Get value of field E01TXUVDY as a String.
  */
  public String getE01TXUVDY()
  {
    return fieldE01TXUVDY.getString();
  }

  /**
  * Set numeric field E01TXUVDY using a BigDecimal value.
  */
  public void setE01TXUVDY(BigDecimal newvalue)
  {
    fieldE01TXUVDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TXUVDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TXUVDY()
  {
    return fieldE01TXUVDY.getBigDecimal();
  }

  /**
  * Set field E01TXUVDM using a String value.
  */
  public void setE01TXUVDM(String newvalue)
  {
    fieldE01TXUVDM.setString(newvalue);
  }

  /**
  * Get value of field E01TXUVDM as a String.
  */
  public String getE01TXUVDM()
  {
    return fieldE01TXUVDM.getString();
  }

  /**
  * Set numeric field E01TXUVDM using a BigDecimal value.
  */
  public void setE01TXUVDM(BigDecimal newvalue)
  {
    fieldE01TXUVDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TXUVDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TXUVDM()
  {
    return fieldE01TXUVDM.getBigDecimal();
  }

  /**
  * Set field E01TXUVDD using a String value.
  */
  public void setE01TXUVDD(String newvalue)
  {
    fieldE01TXUVDD.setString(newvalue);
  }

  /**
  * Get value of field E01TXUVDD as a String.
  */
  public String getE01TXUVDD()
  {
    return fieldE01TXUVDD.getString();
  }

  /**
  * Set numeric field E01TXUVDD using a BigDecimal value.
  */
  public void setE01TXUVDD(BigDecimal newvalue)
  {
    fieldE01TXUVDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TXUVDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TXUVDD()
  {
    return fieldE01TXUVDD.getBigDecimal();
  }

  /**
  * Set field E01TXUBAS using a String value.
  */
  public void setE01TXUBAS(String newvalue)
  {
    fieldE01TXUBAS.setString(newvalue);
  }

  /**
  * Get value of field E01TXUBAS as a String.
  */
  public String getE01TXUBAS()
  {
    return fieldE01TXUBAS.getString();
  }

  /**
  * Set numeric field E01TXUBAS using a BigDecimal value.
  */
  public void setE01TXUBAS(BigDecimal newvalue)
  {
    fieldE01TXUBAS.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TXUBAS as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TXUBAS()
  {
    return fieldE01TXUBAS.getBigDecimal();
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
 