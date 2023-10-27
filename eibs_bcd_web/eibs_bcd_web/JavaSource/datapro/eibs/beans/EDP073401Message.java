package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDP073401 physical file definition.
* 
* File level identifier is 1130611113113.
* Record format level identifier is 4B449FAFAAFAC.
*/

public class EDP073401Message extends MessageRecord
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
                                     "E01CNTLAN",
                                     "E01DPIIND",
                                     "E01DPIDSC",
                                     "E01DPIFOR",
                                     "E01DPIAM1",
                                     "E01DPIAM2",
                                     "E01DPIAM3",
                                     "E01IFMCUN",
                                     "E01IFMFEY",
                                     "E01IFMFEM",
                                     "E01IFMCFO",
                                     "E01IFMCFA",
                                     "E01IFMFY2",
                                     "E01IFMFM2",
                                     "E01IFMCF2",
                                     "E01IFMCA2",
                                     "E01IFMFY3",
                                     "E01IFMFM3",
                                     "E01IFMCF3",
                                     "E01IFMCA3",
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
                                   "E01CNTLAN",
                                   "E01DPIIND",
                                   "E01DPIDSC",
                                   "E01DPIFOR",
                                   "E01DPIAM1",
                                   "E01DPIAM2",
                                   "E01DPIAM3",
                                   "E01IFMCUN",
                                   "E01IFMFEY",
                                   "E01IFMFEM",
                                   "E01IFMCFO",
                                   "E01IFMCFA",
                                   "E01IFMFY2",
                                   "E01IFMFM2",
                                   "E01IFMCF2",
                                   "E01IFMCA2",
                                   "E01IFMFY3",
                                   "E01IFMFM3",
                                   "E01IFMCF3",
                                   "E01IFMCA3",
                                   "E01OPECDE"
                                 };
  final static String fid = "1130611113113";
  final static String rid = "4B449FAFAAFAC";
  final static String fmtname = "EDP073401";
  final int FIELDCOUNT = 30;
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
  private CharacterField fieldE01CNTLAN = null;
  private CharacterField fieldE01DPIIND = null;
  private CharacterField fieldE01DPIDSC = null;
  private CharacterField fieldE01DPIFOR = null;
  private DecimalField fieldE01DPIAM1 = null;
  private DecimalField fieldE01DPIAM2 = null;
  private DecimalField fieldE01DPIAM3 = null;
  private DecimalField fieldE01IFMCUN = null;
  private DecimalField fieldE01IFMFEY = null;
  private DecimalField fieldE01IFMFEM = null;
  private CharacterField fieldE01IFMCFO = null;
  private CharacterField fieldE01IFMCFA = null;
  private DecimalField fieldE01IFMFY2 = null;
  private DecimalField fieldE01IFMFM2 = null;
  private CharacterField fieldE01IFMCF2 = null;
  private CharacterField fieldE01IFMCA2 = null;
  private DecimalField fieldE01IFMFY3 = null;
  private DecimalField fieldE01IFMFM3 = null;
  private CharacterField fieldE01IFMCF3 = null;
  private CharacterField fieldE01IFMCA3 = null;
  private CharacterField fieldE01OPECDE = null;

  /**
  * Constructor for EDP073401Message.
  */
  public EDP073401Message()
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
    recordsize = 501;
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
    fields[9] = fieldE01CNTLAN =
    new CharacterField(message, HEADERSIZE + 42, 1, "E01CNTLAN");
    fields[10] = fieldE01DPIIND =
    new CharacterField(message, HEADERSIZE + 43, 4, "E01DPIIND");
    fields[11] = fieldE01DPIDSC =
    new CharacterField(message, HEADERSIZE + 47, 34, "E01DPIDSC");
    fields[12] = fieldE01DPIFOR =
    new CharacterField(message, HEADERSIZE + 81, 300, "E01DPIFOR");
    fields[13] = fieldE01DPIAM1 =
    new DecimalField(message, HEADERSIZE + 381, 23, 6, "E01DPIAM1");
    fields[14] = fieldE01DPIAM2 =
    new DecimalField(message, HEADERSIZE + 404, 23, 6, "E01DPIAM2");
    fields[15] = fieldE01DPIAM3 =
    new DecimalField(message, HEADERSIZE + 427, 23, 6, "E01DPIAM3");
    fields[16] = fieldE01IFMCUN =
    new DecimalField(message, HEADERSIZE + 450, 10, 0, "E01IFMCUN");
    fields[17] = fieldE01IFMFEY =
    new DecimalField(message, HEADERSIZE + 460, 5, 0, "E01IFMFEY");
    fields[18] = fieldE01IFMFEM =
    new DecimalField(message, HEADERSIZE + 465, 3, 0, "E01IFMFEM");
    fields[19] = fieldE01IFMCFO =
    new CharacterField(message, HEADERSIZE + 468, 2, "E01IFMCFO");
    fields[20] = fieldE01IFMCFA =
    new CharacterField(message, HEADERSIZE + 470, 4, "E01IFMCFA");
    fields[21] = fieldE01IFMFY2 =
    new DecimalField(message, HEADERSIZE + 474, 5, 0, "E01IFMFY2");
    fields[22] = fieldE01IFMFM2 =
    new DecimalField(message, HEADERSIZE + 479, 3, 0, "E01IFMFM2");
    fields[23] = fieldE01IFMCF2 =
    new CharacterField(message, HEADERSIZE + 482, 1, "E01IFMCF2");
    fields[24] = fieldE01IFMCA2 =
    new CharacterField(message, HEADERSIZE + 483, 4, "E01IFMCA2");
    fields[25] = fieldE01IFMFY3 =
    new DecimalField(message, HEADERSIZE + 487, 5, 0, "E01IFMFY3");
    fields[26] = fieldE01IFMFM3 =
    new DecimalField(message, HEADERSIZE + 492, 3, 0, "E01IFMFM3");
    fields[27] = fieldE01IFMCF3 =
    new CharacterField(message, HEADERSIZE + 495, 1, "E01IFMCF3");
    fields[28] = fieldE01IFMCA3 =
    new CharacterField(message, HEADERSIZE + 496, 4, "E01IFMCA3");
    fields[29] = fieldE01OPECDE =
    new CharacterField(message, HEADERSIZE + 500, 1, "E01OPECDE");

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
  * Set field E01CNTLAN using a String value.
  */
  public void setE01CNTLAN(String newvalue)
  {
    fieldE01CNTLAN.setString(newvalue);
  }

  /**
  * Get value of field E01CNTLAN as a String.
  */
  public String getE01CNTLAN()
  {
    return fieldE01CNTLAN.getString();
  }

  /**
  * Set field E01DPIIND using a String value.
  */
  public void setE01DPIIND(String newvalue)
  {
    fieldE01DPIIND.setString(newvalue);
  }

  /**
  * Get value of field E01DPIIND as a String.
  */
  public String getE01DPIIND()
  {
    return fieldE01DPIIND.getString();
  }

  /**
  * Set field E01DPIDSC using a String value.
  */
  public void setE01DPIDSC(String newvalue)
  {
    fieldE01DPIDSC.setString(newvalue);
  }

  /**
  * Get value of field E01DPIDSC as a String.
  */
  public String getE01DPIDSC()
  {
    return fieldE01DPIDSC.getString();
  }

  /**
  * Set field E01DPIFOR using a String value.
  */
  public void setE01DPIFOR(String newvalue)
  {
    fieldE01DPIFOR.setString(newvalue);
  }

  /**
  * Get value of field E01DPIFOR as a String.
  */
  public String getE01DPIFOR()
  {
    return fieldE01DPIFOR.getString();
  }

  /**
  * Set field E01DPIAM1 using a String value.
  */
  public void setE01DPIAM1(String newvalue)
  {
    fieldE01DPIAM1.setString(newvalue);
  }

  /**
  * Get value of field E01DPIAM1 as a String.
  */
  public String getE01DPIAM1()
  {
    return fieldE01DPIAM1.getString();
  }

  /**
  * Set numeric field E01DPIAM1 using a BigDecimal value.
  */
  public void setE01DPIAM1(BigDecimal newvalue)
  {
    fieldE01DPIAM1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DPIAM1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DPIAM1()
  {
    return fieldE01DPIAM1.getBigDecimal();
  }

  /**
  * Set field E01DPIAM2 using a String value.
  */
  public void setE01DPIAM2(String newvalue)
  {
    fieldE01DPIAM2.setString(newvalue);
  }

  /**
  * Get value of field E01DPIAM2 as a String.
  */
  public String getE01DPIAM2()
  {
    return fieldE01DPIAM2.getString();
  }

  /**
  * Set numeric field E01DPIAM2 using a BigDecimal value.
  */
  public void setE01DPIAM2(BigDecimal newvalue)
  {
    fieldE01DPIAM2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DPIAM2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DPIAM2()
  {
    return fieldE01DPIAM2.getBigDecimal();
  }

  /**
  * Set field E01DPIAM3 using a String value.
  */
  public void setE01DPIAM3(String newvalue)
  {
    fieldE01DPIAM3.setString(newvalue);
  }

  /**
  * Get value of field E01DPIAM3 as a String.
  */
  public String getE01DPIAM3()
  {
    return fieldE01DPIAM3.getString();
  }

  /**
  * Set numeric field E01DPIAM3 using a BigDecimal value.
  */
  public void setE01DPIAM3(BigDecimal newvalue)
  {
    fieldE01DPIAM3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DPIAM3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DPIAM3()
  {
    return fieldE01DPIAM3.getBigDecimal();
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
  * Set field E01IFMCFA using a String value.
  */
  public void setE01IFMCFA(String newvalue)
  {
    fieldE01IFMCFA.setString(newvalue);
  }

  /**
  * Get value of field E01IFMCFA as a String.
  */
  public String getE01IFMCFA()
  {
    return fieldE01IFMCFA.getString();
  }

  /**
  * Set field E01IFMFY2 using a String value.
  */
  public void setE01IFMFY2(String newvalue)
  {
    fieldE01IFMFY2.setString(newvalue);
  }

  /**
  * Get value of field E01IFMFY2 as a String.
  */
  public String getE01IFMFY2()
  {
    return fieldE01IFMFY2.getString();
  }

  /**
  * Set numeric field E01IFMFY2 using a BigDecimal value.
  */
  public void setE01IFMFY2(BigDecimal newvalue)
  {
    fieldE01IFMFY2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01IFMFY2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01IFMFY2()
  {
    return fieldE01IFMFY2.getBigDecimal();
  }

  /**
  * Set field E01IFMFM2 using a String value.
  */
  public void setE01IFMFM2(String newvalue)
  {
    fieldE01IFMFM2.setString(newvalue);
  }

  /**
  * Get value of field E01IFMFM2 as a String.
  */
  public String getE01IFMFM2()
  {
    return fieldE01IFMFM2.getString();
  }

  /**
  * Set numeric field E01IFMFM2 using a BigDecimal value.
  */
  public void setE01IFMFM2(BigDecimal newvalue)
  {
    fieldE01IFMFM2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01IFMFM2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01IFMFM2()
  {
    return fieldE01IFMFM2.getBigDecimal();
  }

  /**
  * Set field E01IFMCF2 using a String value.
  */
  public void setE01IFMCF2(String newvalue)
  {
    fieldE01IFMCF2.setString(newvalue);
  }

  /**
  * Get value of field E01IFMCF2 as a String.
  */
  public String getE01IFMCF2()
  {
    return fieldE01IFMCF2.getString();
  }

  /**
  * Set field E01IFMCA2 using a String value.
  */
  public void setE01IFMCA2(String newvalue)
  {
    fieldE01IFMCA2.setString(newvalue);
  }

  /**
  * Get value of field E01IFMCA2 as a String.
  */
  public String getE01IFMCA2()
  {
    return fieldE01IFMCA2.getString();
  }

  /**
  * Set field E01IFMFY3 using a String value.
  */
  public void setE01IFMFY3(String newvalue)
  {
    fieldE01IFMFY3.setString(newvalue);
  }

  /**
  * Get value of field E01IFMFY3 as a String.
  */
  public String getE01IFMFY3()
  {
    return fieldE01IFMFY3.getString();
  }

  /**
  * Set numeric field E01IFMFY3 using a BigDecimal value.
  */
  public void setE01IFMFY3(BigDecimal newvalue)
  {
    fieldE01IFMFY3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01IFMFY3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01IFMFY3()
  {
    return fieldE01IFMFY3.getBigDecimal();
  }

  /**
  * Set field E01IFMFM3 using a String value.
  */
  public void setE01IFMFM3(String newvalue)
  {
    fieldE01IFMFM3.setString(newvalue);
  }

  /**
  * Get value of field E01IFMFM3 as a String.
  */
  public String getE01IFMFM3()
  {
    return fieldE01IFMFM3.getString();
  }

  /**
  * Set numeric field E01IFMFM3 using a BigDecimal value.
  */
  public void setE01IFMFM3(BigDecimal newvalue)
  {
    fieldE01IFMFM3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01IFMFM3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01IFMFM3()
  {
    return fieldE01IFMFM3.getBigDecimal();
  }

  /**
  * Set field E01IFMCF3 using a String value.
  */
  public void setE01IFMCF3(String newvalue)
  {
    fieldE01IFMCF3.setString(newvalue);
  }

  /**
  * Get value of field E01IFMCF3 as a String.
  */
  public String getE01IFMCF3()
  {
    return fieldE01IFMCF3.getString();
  }

  /**
  * Set field E01IFMCA3 using a String value.
  */
  public void setE01IFMCA3(String newvalue)
  {
    fieldE01IFMCA3.setString(newvalue);
  }

  /**
  * Get value of field E01IFMCA3 as a String.
  */
  public String getE01IFMCA3()
  {
    return fieldE01IFMCA3.getString();
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
