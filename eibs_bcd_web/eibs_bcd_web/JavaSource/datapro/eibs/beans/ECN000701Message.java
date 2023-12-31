package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ECN000701 physical file definition.
* 
* File level identifier is 1151111123728.
* Record format level identifier is 3724A2B7E29D1.
*/

public class ECN000701Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H71USERID",
                                     "H71PROGRM",
                                     "H71TIMSYS",
                                     "H71SCRCOD",
                                     "H71OPECOD",
                                     "H71FLGMAS",
                                     "H71FLGWK1",
                                     "H71FLGWK2",
                                     "H71FLGWK3",
                                     "E71CDRRTB",
                                     "E71CDRCCY",
                                     "E71CDRSFL",
                                     "E71CDRSFD",
                                     "E71CDRDTM",
                                     "E71CDRDTD",
                                     "E71CDRDTY",
                                     "E71CDRDSC",
                                     "E71CDRNUM",
                                     "E71CDRIND"
                                   };
  final static String tnames[] = {
                                   "H71USERID",
                                   "H71PROGRM",
                                   "H71TIMSYS",
                                   "H71SCRCOD",
                                   "H71OPECOD",
                                   "H71FLGMAS",
                                   "H71FLGWK1",
                                   "H71FLGWK2",
                                   "H71FLGWK3",
                                   "E71CDRRTB",
                                   "E71CDRCCY",
                                   "E71CDRSFL",
                                   "E71CDRSFD",
                                   "E71CDRDTM",
                                   "E71CDRDTD",
                                   "E71CDRDTY",
                                   "E71CDRDSC",
                                   "E71CDRNUM",
                                   "E71CDRIND"
                                 };
  final static String fid = "1151111123728";
  final static String rid = "3724A2B7E29D1";
  final static String fmtname = "ECN000701";
  final int FIELDCOUNT = 19;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH71USERID = null;
  private CharacterField fieldH71PROGRM = null;
  private CharacterField fieldH71TIMSYS = null;
  private CharacterField fieldH71SCRCOD = null;
  private CharacterField fieldH71OPECOD = null;
  private CharacterField fieldH71FLGMAS = null;
  private CharacterField fieldH71FLGWK1 = null;
  private CharacterField fieldH71FLGWK2 = null;
  private CharacterField fieldH71FLGWK3 = null;
  private CharacterField fieldE71CDRRTB = null;
  private CharacterField fieldE71CDRCCY = null;
  private CharacterField fieldE71CDRSFL = null;
  private CharacterField fieldE71CDRSFD = null;
  private DecimalField fieldE71CDRDTM = null;
  private DecimalField fieldE71CDRDTD = null;
  private DecimalField fieldE71CDRDTY = null;
  private CharacterField fieldE71CDRDSC = null;
  private DecimalField fieldE71CDRNUM = null;
  private CharacterField fieldE71CDRIND = null;

  /**
  * Constructor for ECN000701Message.
  */
  public ECN000701Message()
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
    recordsize = 158;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH71USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "H71USERID");
    fields[1] = fieldH71PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H71PROGRM");
    fields[2] = fieldH71TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "H71TIMSYS");
    fields[3] = fieldH71SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "H71SCRCOD");
    fields[4] = fieldH71OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "H71OPECOD");
    fields[5] = fieldH71FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H71FLGMAS");
    fields[6] = fieldH71FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H71FLGWK1");
    fields[7] = fieldH71FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H71FLGWK2");
    fields[8] = fieldH71FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H71FLGWK3");
    fields[9] = fieldE71CDRRTB =
    new CharacterField(message, HEADERSIZE + 42, 2, "E71CDRRTB");
    fields[10] = fieldE71CDRCCY =
    new CharacterField(message, HEADERSIZE + 44, 3, "E71CDRCCY");
    fields[11] = fieldE71CDRSFL =
    new CharacterField(message, HEADERSIZE + 47, 1, "E71CDRSFL");
    fields[12] = fieldE71CDRSFD =
    new CharacterField(message, HEADERSIZE + 48, 45, "E71CDRSFD");
    fields[13] = fieldE71CDRDTM =
    new DecimalField(message, HEADERSIZE + 93, 3, 0, "E71CDRDTM");
    fields[14] = fieldE71CDRDTD =
    new DecimalField(message, HEADERSIZE + 96, 3, 0, "E71CDRDTD");
    fields[15] = fieldE71CDRDTY =
    new DecimalField(message, HEADERSIZE + 99, 5, 0, "E71CDRDTY");
    fields[16] = fieldE71CDRDSC =
    new CharacterField(message, HEADERSIZE + 104, 45, "E71CDRDSC");
    fields[17] = fieldE71CDRNUM =
    new DecimalField(message, HEADERSIZE + 149, 8, 0, "E71CDRNUM");
    fields[18] = fieldE71CDRIND =
    new CharacterField(message, HEADERSIZE + 157, 1, "E71CDRIND");

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
  * Set field H71USERID using a String value.
  */
  public void setH71USERID(String newvalue)
  {
    fieldH71USERID.setString(newvalue);
  }

  /**
  * Get value of field H71USERID as a String.
  */
  public String getH71USERID()
  {
    return fieldH71USERID.getString();
  }

  /**
  * Set field H71PROGRM using a String value.
  */
  public void setH71PROGRM(String newvalue)
  {
    fieldH71PROGRM.setString(newvalue);
  }

  /**
  * Get value of field H71PROGRM as a String.
  */
  public String getH71PROGRM()
  {
    return fieldH71PROGRM.getString();
  }

  /**
  * Set field H71TIMSYS using a String value.
  */
  public void setH71TIMSYS(String newvalue)
  {
    fieldH71TIMSYS.setString(newvalue);
  }

  /**
  * Get value of field H71TIMSYS as a String.
  */
  public String getH71TIMSYS()
  {
    return fieldH71TIMSYS.getString();
  }

  /**
  * Set field H71SCRCOD using a String value.
  */
  public void setH71SCRCOD(String newvalue)
  {
    fieldH71SCRCOD.setString(newvalue);
  }

  /**
  * Get value of field H71SCRCOD as a String.
  */
  public String getH71SCRCOD()
  {
    return fieldH71SCRCOD.getString();
  }

  /**
  * Set field H71OPECOD using a String value.
  */
  public void setH71OPECOD(String newvalue)
  {
    fieldH71OPECOD.setString(newvalue);
  }

  /**
  * Get value of field H71OPECOD as a String.
  */
  public String getH71OPECOD()
  {
    return fieldH71OPECOD.getString();
  }

  /**
  * Set field H71FLGMAS using a String value.
  */
  public void setH71FLGMAS(String newvalue)
  {
    fieldH71FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H71FLGMAS as a String.
  */
  public String getH71FLGMAS()
  {
    return fieldH71FLGMAS.getString();
  }

  /**
  * Set field H71FLGWK1 using a String value.
  */
  public void setH71FLGWK1(String newvalue)
  {
    fieldH71FLGWK1.setString(newvalue);
  }

  /**
  * Get value of field H71FLGWK1 as a String.
  */
  public String getH71FLGWK1()
  {
    return fieldH71FLGWK1.getString();
  }

  /**
  * Set field H71FLGWK2 using a String value.
  */
  public void setH71FLGWK2(String newvalue)
  {
    fieldH71FLGWK2.setString(newvalue);
  }

  /**
  * Get value of field H71FLGWK2 as a String.
  */
  public String getH71FLGWK2()
  {
    return fieldH71FLGWK2.getString();
  }

  /**
  * Set field H71FLGWK3 using a String value.
  */
  public void setH71FLGWK3(String newvalue)
  {
    fieldH71FLGWK3.setString(newvalue);
  }

  /**
  * Get value of field H71FLGWK3 as a String.
  */
  public String getH71FLGWK3()
  {
    return fieldH71FLGWK3.getString();
  }

  /**
  * Set field E71CDRRTB using a String value.
  */
  public void setE71CDRRTB(String newvalue)
  {
    fieldE71CDRRTB.setString(newvalue);
  }

  /**
  * Get value of field E71CDRRTB as a String.
  */
  public String getE71CDRRTB()
  {
    return fieldE71CDRRTB.getString();
  }

  /**
  * Set field E71CDRCCY using a String value.
  */
  public void setE71CDRCCY(String newvalue)
  {
    fieldE71CDRCCY.setString(newvalue);
  }

  /**
  * Get value of field E71CDRCCY as a String.
  */
  public String getE71CDRCCY()
  {
    return fieldE71CDRCCY.getString();
  }

  /**
  * Set field E71CDRSFL using a String value.
  */
  public void setE71CDRSFL(String newvalue)
  {
    fieldE71CDRSFL.setString(newvalue);
  }

  /**
  * Get value of field E71CDRSFL as a String.
  */
  public String getE71CDRSFL()
  {
    return fieldE71CDRSFL.getString();
  }

  /**
  * Set field E71CDRSFD using a String value.
  */
  public void setE71CDRSFD(String newvalue)
  {
    fieldE71CDRSFD.setString(newvalue);
  }

  /**
  * Get value of field E71CDRSFD as a String.
  */
  public String getE71CDRSFD()
  {
    return fieldE71CDRSFD.getString();
  }

  /**
  * Set field E71CDRDTM using a String value.
  */
  public void setE71CDRDTM(String newvalue)
  {
    fieldE71CDRDTM.setString(newvalue);
  }

  /**
  * Get value of field E71CDRDTM as a String.
  */
  public String getE71CDRDTM()
  {
    return fieldE71CDRDTM.getString();
  }

  /**
  * Set numeric field E71CDRDTM using a BigDecimal value.
  */
  public void setE71CDRDTM(BigDecimal newvalue)
  {
    fieldE71CDRDTM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E71CDRDTM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE71CDRDTM()
  {
    return fieldE71CDRDTM.getBigDecimal();
  }

  /**
  * Set field E71CDRDTD using a String value.
  */
  public void setE71CDRDTD(String newvalue)
  {
    fieldE71CDRDTD.setString(newvalue);
  }

  /**
  * Get value of field E71CDRDTD as a String.
  */
  public String getE71CDRDTD()
  {
    return fieldE71CDRDTD.getString();
  }

  /**
  * Set numeric field E71CDRDTD using a BigDecimal value.
  */
  public void setE71CDRDTD(BigDecimal newvalue)
  {
    fieldE71CDRDTD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E71CDRDTD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE71CDRDTD()
  {
    return fieldE71CDRDTD.getBigDecimal();
  }

  /**
  * Set field E71CDRDTY using a String value.
  */
  public void setE71CDRDTY(String newvalue)
  {
    fieldE71CDRDTY.setString(newvalue);
  }

  /**
  * Get value of field E71CDRDTY as a String.
  */
  public String getE71CDRDTY()
  {
    return fieldE71CDRDTY.getString();
  }

  /**
  * Set numeric field E71CDRDTY using a BigDecimal value.
  */
  public void setE71CDRDTY(BigDecimal newvalue)
  {
    fieldE71CDRDTY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E71CDRDTY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE71CDRDTY()
  {
    return fieldE71CDRDTY.getBigDecimal();
  }

  /**
  * Set field E71CDRDSC using a String value.
  */
  public void setE71CDRDSC(String newvalue)
  {
    fieldE71CDRDSC.setString(newvalue);
  }

  /**
  * Get value of field E71CDRDSC as a String.
  */
  public String getE71CDRDSC()
  {
    return fieldE71CDRDSC.getString();
  }

  /**
  * Set field E71CDRNUM using a String value.
  */
  public void setE71CDRNUM(String newvalue)
  {
    fieldE71CDRNUM.setString(newvalue);
  }

  /**
  * Get value of field E71CDRNUM as a String.
  */
  public String getE71CDRNUM()
  {
    return fieldE71CDRNUM.getString();
  }

  /**
  * Set numeric field E71CDRNUM using a BigDecimal value.
  */
  public void setE71CDRNUM(BigDecimal newvalue)
  {
    fieldE71CDRNUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E71CDRNUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE71CDRNUM()
  {
    return fieldE71CDRNUM.getBigDecimal();
  }

  /**
  * Set field E71CDRIND using a String value.
  */
  public void setE71CDRIND(String newvalue)
  {
    fieldE71CDRIND.setString(newvalue);
  }

  /**
  * Get value of field E71CDRIND as a String.
  */
  public String getE71CDRIND()
  {
    return fieldE71CDRIND.getString();
  }

}
