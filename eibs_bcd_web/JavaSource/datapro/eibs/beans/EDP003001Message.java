package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDP003001 physical file definition.
* 
* File level identifier is 1130611113109.
* Record format level identifier is 4A4CA4476FFA4.
*/

public class EDP003001Message extends MessageRecord
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
                                     "E01IFMCUN",
                                     "E01IFMFEY",
                                     "E01IFMFEM",
                                     "E01IFMCFO",
                                     "E01IFMNA1",
                                     "E01IFMCIN",
                                     "E01IFMLNE",
                                     "E01IFMTYP",
                                     "E01IFMGLN",
                                     "E01IFMDSC",
                                     "E01IFMOPR",
                                     "E01IFMAMT"
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
                                   "E01IFMCUN",
                                   "E01IFMFEY",
                                   "E01IFMFEM",
                                   "E01IFMCFO",
                                   "E01IFMNA1",
                                   "E01IFMCIN",
                                   "E01IFMLNE",
                                   "E01IFMTYP",
                                   "E01IFMGLN",
                                   "E01IFMDSC",
                                   "E01IFMOPR",
                                   "E01IFMAMT"
                                 };
  final static String fid = "1130611113109";
  final static String rid = "4A4CA4476FFA4";
  final static String fmtname = "EDP003001";
  final int FIELDCOUNT = 21;
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
  private DecimalField fieldE01IFMCUN = null;
  private DecimalField fieldE01IFMFEY = null;
  private DecimalField fieldE01IFMFEM = null;
  private CharacterField fieldE01IFMCFO = null;
  private CharacterField fieldE01IFMNA1 = null;
  private CharacterField fieldE01IFMCIN = null;
  private CharacterField fieldE01IFMLNE = null;
  private CharacterField fieldE01IFMTYP = null;
  private DecimalField fieldE01IFMGLN = null;
  private CharacterField fieldE01IFMDSC = null;
  private CharacterField fieldE01IFMOPR = null;
  private DecimalField fieldE01IFMAMT = null;

  /**
  * Constructor for EDP003001Message.
  */
  public EDP003001Message()
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
    recordsize = 218;
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
    fields[9] = fieldE01IFMCUN =
    new DecimalField(message, HEADERSIZE + 42, 10, 0, "E01IFMCUN");
    fields[10] = fieldE01IFMFEY =
    new DecimalField(message, HEADERSIZE + 52, 5, 0, "E01IFMFEY");
    fields[11] = fieldE01IFMFEM =
    new DecimalField(message, HEADERSIZE + 57, 3, 0, "E01IFMFEM");
    fields[12] = fieldE01IFMCFO =
    new CharacterField(message, HEADERSIZE + 60, 2, "E01IFMCFO");
    fields[13] = fieldE01IFMNA1 =
    new CharacterField(message, HEADERSIZE + 62, 45, "E01IFMNA1");
    fields[14] = fieldE01IFMCIN =
    new CharacterField(message, HEADERSIZE + 107, 15, "E01IFMCIN");
    fields[15] = fieldE01IFMLNE =
    new CharacterField(message, HEADERSIZE + 122, 15, "E01IFMLNE");
    fields[16] = fieldE01IFMTYP =
    new CharacterField(message, HEADERSIZE + 137, 1, "E01IFMTYP");
    fields[17] = fieldE01IFMGLN =
    new DecimalField(message, HEADERSIZE + 138, 17, 0, "E01IFMGLN");
    fields[18] = fieldE01IFMDSC =
    new CharacterField(message, HEADERSIZE + 155, 45, "E01IFMDSC");
    fields[19] = fieldE01IFMOPR =
    new CharacterField(message, HEADERSIZE + 200, 1, "E01IFMOPR");
    fields[20] = fieldE01IFMAMT =
    new DecimalField(message, HEADERSIZE + 201, 17, 2, "E01IFMAMT");

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
  * Set field E01IFMCUN using a String value.
  */
  public void setE01IFMCUN(String newvalue)
  {
    fieldE01IFMCUN.setString(newvalue);
  }

  /**
  * Get value of field E01IFMCUN as a String.
  */
  public String getE01IFMCUN()
  {
    return fieldE01IFMCUN.getString();
  }

  /**
  * Set numeric field E01IFMCUN using a BigDecimal value.
  */
  public void setE01IFMCUN(BigDecimal newvalue)
  {
    fieldE01IFMCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01IFMCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01IFMCUN()
  {
    return fieldE01IFMCUN.getBigDecimal();
  }

  /**
  * Set field E01IFMFEY using a String value.
  */
  public void setE01IFMFEY(String newvalue)
  {
    fieldE01IFMFEY.setString(newvalue);
  }

  /**
  * Get value of field E01IFMFEY as a String.
  */
  public String getE01IFMFEY()
  {
    return fieldE01IFMFEY.getString();
  }

  /**
  * Set numeric field E01IFMFEY using a BigDecimal value.
  */
  public void setE01IFMFEY(BigDecimal newvalue)
  {
    fieldE01IFMFEY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01IFMFEY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01IFMFEY()
  {
    return fieldE01IFMFEY.getBigDecimal();
  }

  /**
  * Set field E01IFMFEM using a String value.
  */
  public void setE01IFMFEM(String newvalue)
  {
    fieldE01IFMFEM.setString(newvalue);
  }

  /**
  * Get value of field E01IFMFEM as a String.
  */
  public String getE01IFMFEM()
  {
    return fieldE01IFMFEM.getString();
  }

  /**
  * Set numeric field E01IFMFEM using a BigDecimal value.
  */
  public void setE01IFMFEM(BigDecimal newvalue)
  {
    fieldE01IFMFEM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01IFMFEM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01IFMFEM()
  {
    return fieldE01IFMFEM.getBigDecimal();
  }

  /**
  * Set field E01IFMCFO using a String value.
  */
  public void setE01IFMCFO(String newvalue)
  {
    fieldE01IFMCFO.setString(newvalue);
  }

  /**
  * Get value of field E01IFMCFO as a String.
  */
  public String getE01IFMCFO()
  {
    return fieldE01IFMCFO.getString();
  }

  /**
  * Set field E01IFMNA1 using a String value.
  */
  public void setE01IFMNA1(String newvalue)
  {
    fieldE01IFMNA1.setString(newvalue);
  }

  /**
  * Get value of field E01IFMNA1 as a String.
  */
  public String getE01IFMNA1()
  {
    return fieldE01IFMNA1.getString();
  }

  /**
  * Set field E01IFMCIN using a String value.
  */
  public void setE01IFMCIN(String newvalue)
  {
    fieldE01IFMCIN.setString(newvalue);
  }

  /**
  * Get value of field E01IFMCIN as a String.
  */
  public String getE01IFMCIN()
  {
    return fieldE01IFMCIN.getString();
  }

  /**
  * Set field E01IFMLNE using a String value.
  */
  public void setE01IFMLNE(String newvalue)
  {
    fieldE01IFMLNE.setString(newvalue);
  }

  /**
  * Get value of field E01IFMLNE as a String.
  */
  public String getE01IFMLNE()
  {
    return fieldE01IFMLNE.getString();
  }

  /**
  * Set field E01IFMTYP using a String value.
  */
  public void setE01IFMTYP(String newvalue)
  {
    fieldE01IFMTYP.setString(newvalue);
  }

  /**
  * Get value of field E01IFMTYP as a String.
  */
  public String getE01IFMTYP()
  {
    return fieldE01IFMTYP.getString();
  }

  /**
  * Set field E01IFMGLN using a String value.
  */
  public void setE01IFMGLN(String newvalue)
  {
    fieldE01IFMGLN.setString(newvalue);
  }

  /**
  * Get value of field E01IFMGLN as a String.
  */
  public String getE01IFMGLN()
  {
    return fieldE01IFMGLN.getString();
  }

  /**
  * Set numeric field E01IFMGLN using a BigDecimal value.
  */
  public void setE01IFMGLN(BigDecimal newvalue)
  {
    fieldE01IFMGLN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01IFMGLN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01IFMGLN()
  {
    return fieldE01IFMGLN.getBigDecimal();
  }

  /**
  * Set field E01IFMDSC using a String value.
  */
  public void setE01IFMDSC(String newvalue)
  {
    fieldE01IFMDSC.setString(newvalue);
  }

  /**
  * Get value of field E01IFMDSC as a String.
  */
  public String getE01IFMDSC()
  {
    return fieldE01IFMDSC.getString();
  }

  /**
  * Set field E01IFMOPR using a String value.
  */
  public void setE01IFMOPR(String newvalue)
  {
    fieldE01IFMOPR.setString(newvalue);
  }

  /**
  * Get value of field E01IFMOPR as a String.
  */
  public String getE01IFMOPR()
  {
    return fieldE01IFMOPR.getString();
  }

  /**
  * Set field E01IFMAMT using a String value.
  */
  public void setE01IFMAMT(String newvalue)
  {
    fieldE01IFMAMT.setString(newvalue);
  }

  /**
  * Get value of field E01IFMAMT as a String.
  */
  public String getE01IFMAMT()
  {
    return fieldE01IFMAMT.getString();
  }

  /**
  * Set numeric field E01IFMAMT using a BigDecimal value.
  */
  public void setE01IFMAMT(BigDecimal newvalue)
  {
    fieldE01IFMAMT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01IFMAMT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01IFMAMT()
  {
    return fieldE01IFMAMT.getBigDecimal();
  }

}