package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ETX016001 physical file definition.
* 
* File level identifier is 1050809151047.
* Record format level identifier is 619C30FEFFBA1.
*/

public class ETX016001Message extends MessageRecord
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
                                     "E01T42CDE",
                                     "E01T42NME",
                                     "E01T42AMT",
                                     "E01T42QTY",
                                     "E01T42NUM",
                                     "E01OPECDE"
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
                                   "E01T42CDE",
                                   "E01T42NME",
                                   "E01T42AMT",
                                   "E01T42QTY",
                                   "E01T42NUM",
                                   "E01OPECDE"
                                 };
  final static String fid = "1050809151047";
  final static String rid = "619C30FEFFBA1";
  final static String fmtname = "ETX016001";
  final int FIELDCOUNT = 15;
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
  private CharacterField fieldE01T42CDE = null;
  private CharacterField fieldE01T42NME = null;
  private DecimalField fieldE01T42AMT = null;
  private DecimalField fieldE01T42QTY = null;
  private CharacterField fieldE01T42NUM = null;
  private CharacterField fieldE01OPECDE = null;

  /**
  * Constructor for ETX016001Message.
  */
  public ETX016001Message()
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
    recordsize = 117;
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
    fields[9] = fieldE01T42CDE =
    new CharacterField(message, HEADERSIZE + 42, 4, "E01T42CDE");
    fields[10] = fieldE01T42NME =
    new CharacterField(message, HEADERSIZE + 46, 30, "E01T42NME");
    fields[11] = fieldE01T42AMT =
    new DecimalField(message, HEADERSIZE + 76, 17, 2, "E01T42AMT");
    fields[12] = fieldE01T42QTY =
    new DecimalField(message, HEADERSIZE + 93, 8, 0, "E01T42QTY");
    fields[13] = fieldE01T42NUM =
    new CharacterField(message, HEADERSIZE + 101, 15, "E01T42NUM");
    fields[14] = fieldE01OPECDE =
    new CharacterField(message, HEADERSIZE + 116, 1, "E01OPECDE");

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
  * Set field E01T42CDE using a String value.
  */
  public void setE01T42CDE(String newvalue)
  {
    fieldE01T42CDE.setString(newvalue);
  }

  /**
  * Get value of field E01T42CDE as a String.
  */
  public String getE01T42CDE()
  {
    return fieldE01T42CDE.getString();
  }

  /**
  * Set field E01T42NME using a String value.
  */
  public void setE01T42NME(String newvalue)
  {
    fieldE01T42NME.setString(newvalue);
  }

  /**
  * Get value of field E01T42NME as a String.
  */
  public String getE01T42NME()
  {
    return fieldE01T42NME.getString();
  }

  /**
  * Set field E01T42AMT using a String value.
  */
  public void setE01T42AMT(String newvalue)
  {
    fieldE01T42AMT.setString(newvalue);
  }

  /**
  * Get value of field E01T42AMT as a String.
  */
  public String getE01T42AMT()
  {
    return fieldE01T42AMT.getString();
  }

  /**
  * Set numeric field E01T42AMT using a BigDecimal value.
  */
  public void setE01T42AMT(BigDecimal newvalue)
  {
    fieldE01T42AMT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01T42AMT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01T42AMT()
  {
    return fieldE01T42AMT.getBigDecimal();
  }

  /**
  * Set field E01T42QTY using a String value.
  */
  public void setE01T42QTY(String newvalue)
  {
    fieldE01T42QTY.setString(newvalue);
  }

  /**
  * Get value of field E01T42QTY as a String.
  */
  public String getE01T42QTY()
  {
    return fieldE01T42QTY.getString();
  }

  /**
  * Set numeric field E01T42QTY using a BigDecimal value.
  */
  public void setE01T42QTY(BigDecimal newvalue)
  {
    fieldE01T42QTY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01T42QTY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01T42QTY()
  {
    return fieldE01T42QTY.getBigDecimal();
  }

  /**
  * Set field E01T42NUM using a String value.
  */
  public void setE01T42NUM(String newvalue)
  {
    fieldE01T42NUM.setString(newvalue);
  }

  /**
  * Get value of field E01T42NUM as a String.
  */
  public String getE01T42NUM()
  {
    return fieldE01T42NUM.getString();
  }

  /**
  * Set field E01OPECDE using a String value.
  */
  public void setE01OPECDE(String newvalue)
  {
    fieldE01OPECDE.setString(newvalue);
  }

  /**
  * Get value of field E01OPECDE as a String.
  */
  public String getE01OPECDE()
  {
    return fieldE01OPECDE.getString();
  }

}
