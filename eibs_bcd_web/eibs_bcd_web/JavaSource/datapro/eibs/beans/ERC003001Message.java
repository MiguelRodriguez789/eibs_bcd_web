package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ERC003001 physical file definition.
* 
* File level identifier is 1161013153552.
* Record format level identifier is 35BFB34453FC8.
*/

public class ERC003001Message extends MessageRecord
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
                                     "E01RCIRBK",
                                     "E01RCICTA",
                                     "E01RCISTN",
                                     "E01RCISDM",
                                     "E01RCISDD",
                                     "E01RCISDY",
                                     "E01CUSNA1",
                                     "E01DSCRBK",
                                     "E01RCIACC",
                                     "E01RCSBBL",
                                     "E01RCSTRG"
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
                                   "E01RCIRBK",
                                   "E01RCICTA",
                                   "E01RCISTN",
                                   "E01RCISDM",
                                   "E01RCISDD",
                                   "E01RCISDY",
                                   "E01CUSNA1",
                                   "E01DSCRBK",
                                   "E01RCIACC",
                                   "E01RCSBBL",
                                   "E01RCSTRG"
                                 };
  final static String fid = "1161013153552";
  final static String rid = "35BFB34453FC8";
  final static String fmtname = "ERC003001";
  final int FIELDCOUNT = 20;
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
  private CharacterField fieldE01RCIRBK = null;
  private CharacterField fieldE01RCICTA = null;
  private DecimalField fieldE01RCISTN = null;
  private DecimalField fieldE01RCISDM = null;
  private DecimalField fieldE01RCISDD = null;
  private DecimalField fieldE01RCISDY = null;
  private CharacterField fieldE01CUSNA1 = null;
  private CharacterField fieldE01DSCRBK = null;
  private DecimalField fieldE01RCIACC = null;
  private DecimalField fieldE01RCSBBL = null;
  private DecimalField fieldE01RCSTRG = null;

  /**
  * Constructor for ERC003001Message.
  */
  public ERC003001Message()
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
    recordsize = 233;
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
    fields[9] = fieldE01RCIRBK =
    new CharacterField(message, HEADERSIZE + 42, 4, "E01RCIRBK");
    fields[10] = fieldE01RCICTA =
    new CharacterField(message, HEADERSIZE + 46, 20, "E01RCICTA");
    fields[11] = fieldE01RCISTN =
    new DecimalField(message, HEADERSIZE + 66, 13, 0, "E01RCISTN");
    fields[12] = fieldE01RCISDM =
    new DecimalField(message, HEADERSIZE + 79, 3, 0, "E01RCISDM");
    fields[13] = fieldE01RCISDD =
    new DecimalField(message, HEADERSIZE + 82, 3, 0, "E01RCISDD");
    fields[14] = fieldE01RCISDY =
    new DecimalField(message, HEADERSIZE + 85, 5, 0, "E01RCISDY");
    fields[15] = fieldE01CUSNA1 =
    new CharacterField(message, HEADERSIZE + 90, 60, "E01CUSNA1");
    fields[16] = fieldE01DSCRBK =
    new CharacterField(message, HEADERSIZE + 150, 45, "E01DSCRBK");
    fields[17] = fieldE01RCIACC =
    new DecimalField(message, HEADERSIZE + 195, 13, 0, "E01RCIACC");
    fields[18] = fieldE01RCSBBL =
    new DecimalField(message, HEADERSIZE + 208, 17, 2, "E01RCSBBL");
    fields[19] = fieldE01RCSTRG =
    new DecimalField(message, HEADERSIZE + 225, 8, 0, "E01RCSTRG");

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
  * Set field E01RCIRBK using a String value.
  */
  public void setE01RCIRBK(String newvalue)
  {
    fieldE01RCIRBK.setString(newvalue);
  }

  /**
  * Get value of field E01RCIRBK as a String.
  */
  public String getE01RCIRBK()
  {
    return fieldE01RCIRBK.getString();
  }

  /**
  * Set field E01RCICTA using a String value.
  */
  public void setE01RCICTA(String newvalue)
  {
    fieldE01RCICTA.setString(newvalue);
  }

  /**
  * Get value of field E01RCICTA as a String.
  */
  public String getE01RCICTA()
  {
    return fieldE01RCICTA.getString();
  }

  /**
  * Set field E01RCISTN using a String value.
  */
  public void setE01RCISTN(String newvalue)
  {
    fieldE01RCISTN.setString(newvalue);
  }

  /**
  * Get value of field E01RCISTN as a String.
  */
  public String getE01RCISTN()
  {
    return fieldE01RCISTN.getString();
  }

  /**
  * Set numeric field E01RCISTN using a BigDecimal value.
  */
  public void setE01RCISTN(BigDecimal newvalue)
  {
    fieldE01RCISTN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01RCISTN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01RCISTN()
  {
    return fieldE01RCISTN.getBigDecimal();
  }

  /**
  * Set field E01RCISDM using a String value.
  */
  public void setE01RCISDM(String newvalue)
  {
    fieldE01RCISDM.setString(newvalue);
  }

  /**
  * Get value of field E01RCISDM as a String.
  */
  public String getE01RCISDM()
  {
    return fieldE01RCISDM.getString();
  }

  /**
  * Set numeric field E01RCISDM using a BigDecimal value.
  */
  public void setE01RCISDM(BigDecimal newvalue)
  {
    fieldE01RCISDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01RCISDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01RCISDM()
  {
    return fieldE01RCISDM.getBigDecimal();
  }

  /**
  * Set field E01RCISDD using a String value.
  */
  public void setE01RCISDD(String newvalue)
  {
    fieldE01RCISDD.setString(newvalue);
  }

  /**
  * Get value of field E01RCISDD as a String.
  */
  public String getE01RCISDD()
  {
    return fieldE01RCISDD.getString();
  }

  /**
  * Set numeric field E01RCISDD using a BigDecimal value.
  */
  public void setE01RCISDD(BigDecimal newvalue)
  {
    fieldE01RCISDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01RCISDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01RCISDD()
  {
    return fieldE01RCISDD.getBigDecimal();
  }

  /**
  * Set field E01RCISDY using a String value.
  */
  public void setE01RCISDY(String newvalue)
  {
    fieldE01RCISDY.setString(newvalue);
  }

  /**
  * Get value of field E01RCISDY as a String.
  */
  public String getE01RCISDY()
  {
    return fieldE01RCISDY.getString();
  }

  /**
  * Set numeric field E01RCISDY using a BigDecimal value.
  */
  public void setE01RCISDY(BigDecimal newvalue)
  {
    fieldE01RCISDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01RCISDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01RCISDY()
  {
    return fieldE01RCISDY.getBigDecimal();
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

  /**
  * Set field E01DSCRBK using a String value.
  */
  public void setE01DSCRBK(String newvalue)
  {
    fieldE01DSCRBK.setString(newvalue);
  }

  /**
  * Get value of field E01DSCRBK as a String.
  */
  public String getE01DSCRBK()
  {
    return fieldE01DSCRBK.getString();
  }

  /**
  * Set field E01RCIACC using a String value.
  */
  public void setE01RCIACC(String newvalue)
  {
    fieldE01RCIACC.setString(newvalue);
  }

  /**
  * Get value of field E01RCIACC as a String.
  */
  public String getE01RCIACC()
  {
    return fieldE01RCIACC.getString();
  }

  /**
  * Set numeric field E01RCIACC using a BigDecimal value.
  */
  public void setE01RCIACC(BigDecimal newvalue)
  {
    fieldE01RCIACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01RCIACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01RCIACC()
  {
    return fieldE01RCIACC.getBigDecimal();
  }

  /**
  * Set field E01RCSBBL using a String value.
  */
  public void setE01RCSBBL(String newvalue)
  {
    fieldE01RCSBBL.setString(newvalue);
  }

  /**
  * Get value of field E01RCSBBL as a String.
  */
  public String getE01RCSBBL()
  {
    return fieldE01RCSBBL.getString();
  }

  /**
  * Set numeric field E01RCSBBL using a BigDecimal value.
  */
  public void setE01RCSBBL(BigDecimal newvalue)
  {
    fieldE01RCSBBL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01RCSBBL as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01RCSBBL()
  {
    return fieldE01RCSBBL.getBigDecimal();
  }

  /**
  * Set field E01RCSTRG using a String value.
  */
  public void setE01RCSTRG(String newvalue)
  {
    fieldE01RCSTRG.setString(newvalue);
  }

  /**
  * Get value of field E01RCSTRG as a String.
  */
  public String getE01RCSTRG()
  {
    return fieldE01RCSTRG.getString();
  }

  /**
  * Set numeric field E01RCSTRG using a BigDecimal value.
  */
  public void setE01RCSTRG(BigDecimal newvalue)
  {
    fieldE01RCSTRG.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01RCSTRG as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01RCSTRG()
  {
    return fieldE01RCSTRG.getBigDecimal();
  }

}
