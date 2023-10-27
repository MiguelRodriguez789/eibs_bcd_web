package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDD095002 physical file definition.
* 
* File level identifier is 1170113165553.
* Record format level identifier is 5192C3FF7413B.
*/

public class EDD095002Message extends MessageRecord
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
                                     "E02CNTFEM",
                                     "E02CNTFED",
                                     "E02CNTFEY",
                                     "E02CODBNK",
                                     "E02CODSUC",
                                     "E02CODCCY",
                                     "E02ACTION"
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
                                   "E02CNTFEM",
                                   "E02CNTFED",
                                   "E02CNTFEY",
                                   "E02CODBNK",
                                   "E02CODSUC",
                                   "E02CODCCY",
                                   "E02ACTION"
                                 };
  final static String fid = "1170113165553";
  final static String rid = "5192C3FF7413B";
  final static String fmtname = "EDD095002";
  final int FIELDCOUNT = 16;
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
  private DecimalField fieldE02CNTFEM = null;
  private DecimalField fieldE02CNTFED = null;
  private DecimalField fieldE02CNTFEY = null;
  private CharacterField fieldE02CODBNK = null;
  private DecimalField fieldE02CODSUC = null;
  private CharacterField fieldE02CODCCY = null;
  private CharacterField fieldE02ACTION = null;

  /**
  * Constructor for EDD095002Message.
  */
  public EDD095002Message()
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
    recordsize = 64;
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
    fields[9] = fieldE02CNTFEM =
    new DecimalField(message, HEADERSIZE + 42, 3, 0, "E02CNTFEM");
    fields[10] = fieldE02CNTFED =
    new DecimalField(message, HEADERSIZE + 45, 3, 0, "E02CNTFED");
    fields[11] = fieldE02CNTFEY =
    new DecimalField(message, HEADERSIZE + 48, 5, 0, "E02CNTFEY");
    fields[12] = fieldE02CODBNK =
    new CharacterField(message, HEADERSIZE + 53, 2, "E02CODBNK");
    fields[13] = fieldE02CODSUC =
    new DecimalField(message, HEADERSIZE + 55, 5, 0, "E02CODSUC");
    fields[14] = fieldE02CODCCY =
    new CharacterField(message, HEADERSIZE + 60, 3, "E02CODCCY");
    fields[15] = fieldE02ACTION =
    new CharacterField(message, HEADERSIZE + 63, 1, "E02ACTION");

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
  * Set field E02CNTFEM using a String value.
  */
  public void setE02CNTFEM(String newvalue)
  {
    fieldE02CNTFEM.setString(newvalue);
  }

  /**
  * Get value of field E02CNTFEM as a String.
  */
  public String getE02CNTFEM()
  {
    return fieldE02CNTFEM.getString();
  }

  /**
  * Set numeric field E02CNTFEM using a BigDecimal value.
  */
  public void setE02CNTFEM(BigDecimal newvalue)
  {
    fieldE02CNTFEM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CNTFEM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CNTFEM()
  {
    return fieldE02CNTFEM.getBigDecimal();
  }

  /**
  * Set field E02CNTFED using a String value.
  */
  public void setE02CNTFED(String newvalue)
  {
    fieldE02CNTFED.setString(newvalue);
  }

  /**
  * Get value of field E02CNTFED as a String.
  */
  public String getE02CNTFED()
  {
    return fieldE02CNTFED.getString();
  }

  /**
  * Set numeric field E02CNTFED using a BigDecimal value.
  */
  public void setE02CNTFED(BigDecimal newvalue)
  {
    fieldE02CNTFED.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CNTFED as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CNTFED()
  {
    return fieldE02CNTFED.getBigDecimal();
  }

  /**
  * Set field E02CNTFEY using a String value.
  */
  public void setE02CNTFEY(String newvalue)
  {
    fieldE02CNTFEY.setString(newvalue);
  }

  /**
  * Get value of field E02CNTFEY as a String.
  */
  public String getE02CNTFEY()
  {
    return fieldE02CNTFEY.getString();
  }

  /**
  * Set numeric field E02CNTFEY using a BigDecimal value.
  */
  public void setE02CNTFEY(BigDecimal newvalue)
  {
    fieldE02CNTFEY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CNTFEY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CNTFEY()
  {
    return fieldE02CNTFEY.getBigDecimal();
  }

  /**
  * Set field E02CODBNK using a String value.
  */
  public void setE02CODBNK(String newvalue)
  {
    fieldE02CODBNK.setString(newvalue);
  }

  /**
  * Get value of field E02CODBNK as a String.
  */
  public String getE02CODBNK()
  {
    return fieldE02CODBNK.getString();
  }

  /**
  * Set field E02CODSUC using a String value.
  */
  public void setE02CODSUC(String newvalue)
  {
    fieldE02CODSUC.setString(newvalue);
  }

  /**
  * Get value of field E02CODSUC as a String.
  */
  public String getE02CODSUC()
  {
    return fieldE02CODSUC.getString();
  }

  /**
  * Set numeric field E02CODSUC using a BigDecimal value.
  */
  public void setE02CODSUC(BigDecimal newvalue)
  {
    fieldE02CODSUC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CODSUC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CODSUC()
  {
    return fieldE02CODSUC.getBigDecimal();
  }

  /**
  * Set field E02CODCCY using a String value.
  */
  public void setE02CODCCY(String newvalue)
  {
    fieldE02CODCCY.setString(newvalue);
  }

  /**
  * Get value of field E02CODCCY as a String.
  */
  public String getE02CODCCY()
  {
    return fieldE02CODCCY.getString();
  }

  /**
  * Set field E02ACTION using a String value.
  */
  public void setE02ACTION(String newvalue)
  {
    fieldE02ACTION.setString(newvalue);
  }

  /**
  * Get value of field E02ACTION as a String.
  */
  public String getE02ACTION()
  {
    return fieldE02ACTION.getString();
  }

}
