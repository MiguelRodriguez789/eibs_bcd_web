package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDD140001 physical file definition.
* 
* File level identifier is 1170113175514.
* Record format level identifier is 3A1EF6B73C5E2.
*/

public class EDD140001Message extends MessageRecord
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
                                     "E01SEGCDE",
                                     "D01SEGCDE",
                                     "E01FRODTM",
                                     "E01FRODTD",
                                     "E01FRODTY",
                                     "E01TODTEM",
                                     "E01TODTED",
                                     "E01TODTEY",
                                     "E01MONTH1",
                                     "E01MONTH2",
                                     "E01SEGBNK",
                                     "E01SEGBRN",
                                     "E01SEGCCY"
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
                                   "E01SEGCDE",
                                   "D01SEGCDE",
                                   "E01FRODTM",
                                   "E01FRODTD",
                                   "E01FRODTY",
                                   "E01TODTEM",
                                   "E01TODTED",
                                   "E01TODTEY",
                                   "E01MONTH1",
                                   "E01MONTH2",
                                   "E01SEGBNK",
                                   "E01SEGBRN",
                                   "E01SEGCCY"
                                 };
  final static String fid = "1170113175514";
  final static String rid = "3A1EF6B73C5E2";
  final static String fmtname = "EDD140001";
  final int FIELDCOUNT = 22;
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
  private CharacterField fieldE01SEGCDE = null;
  private CharacterField fieldD01SEGCDE = null;
  private DecimalField fieldE01FRODTM = null;
  private DecimalField fieldE01FRODTD = null;
  private DecimalField fieldE01FRODTY = null;
  private DecimalField fieldE01TODTEM = null;
  private DecimalField fieldE01TODTED = null;
  private DecimalField fieldE01TODTEY = null;
  private DecimalField fieldE01MONTH1 = null;
  private DecimalField fieldE01MONTH2 = null;
  private CharacterField fieldE01SEGBNK = null;
  private DecimalField fieldE01SEGBRN = null;
  private CharacterField fieldE01SEGCCY = null;

  /**
  * Constructor for EDD140001Message.
  */
  public EDD140001Message()
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
    recordsize = 129;
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
    fields[9] = fieldE01SEGCDE =
    new CharacterField(message, HEADERSIZE + 42, 4, "E01SEGCDE");
    fields[10] = fieldD01SEGCDE =
    new CharacterField(message, HEADERSIZE + 46, 45, "D01SEGCDE");
    fields[11] = fieldE01FRODTM =
    new DecimalField(message, HEADERSIZE + 91, 3, 0, "E01FRODTM");
    fields[12] = fieldE01FRODTD =
    new DecimalField(message, HEADERSIZE + 94, 3, 0, "E01FRODTD");
    fields[13] = fieldE01FRODTY =
    new DecimalField(message, HEADERSIZE + 97, 5, 0, "E01FRODTY");
    fields[14] = fieldE01TODTEM =
    new DecimalField(message, HEADERSIZE + 102, 3, 0, "E01TODTEM");
    fields[15] = fieldE01TODTED =
    new DecimalField(message, HEADERSIZE + 105, 3, 0, "E01TODTED");
    fields[16] = fieldE01TODTEY =
    new DecimalField(message, HEADERSIZE + 108, 5, 0, "E01TODTEY");
    fields[17] = fieldE01MONTH1 =
    new DecimalField(message, HEADERSIZE + 113, 3, 0, "E01MONTH1");
    fields[18] = fieldE01MONTH2 =
    new DecimalField(message, HEADERSIZE + 116, 3, 0, "E01MONTH2");
    fields[19] = fieldE01SEGBNK =
    new CharacterField(message, HEADERSIZE + 119, 2, "E01SEGBNK");
    fields[20] = fieldE01SEGBRN =
    new DecimalField(message, HEADERSIZE + 121, 5, 0, "E01SEGBRN");
    fields[21] = fieldE01SEGCCY =
    new CharacterField(message, HEADERSIZE + 126, 3, "E01SEGCCY");

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
  * Set field E01SEGCDE using a String value.
  */
  public void setE01SEGCDE(String newvalue)
  {
    fieldE01SEGCDE.setString(newvalue);
  }

  /**
  * Get value of field E01SEGCDE as a String.
  */
  public String getE01SEGCDE()
  {
    return fieldE01SEGCDE.getString();
  }

  /**
  * Set field D01SEGCDE using a String value.
  */
  public void setD01SEGCDE(String newvalue)
  {
    fieldD01SEGCDE.setString(newvalue);
  }

  /**
  * Get value of field D01SEGCDE as a String.
  */
  public String getD01SEGCDE()
  {
    return fieldD01SEGCDE.getString();
  }

  /**
  * Set field E01FRODTM using a String value.
  */
  public void setE01FRODTM(String newvalue)
  {
    fieldE01FRODTM.setString(newvalue);
  }

  /**
  * Get value of field E01FRODTM as a String.
  */
  public String getE01FRODTM()
  {
    return fieldE01FRODTM.getString();
  }

  /**
  * Set numeric field E01FRODTM using a BigDecimal value.
  */
  public void setE01FRODTM(BigDecimal newvalue)
  {
    fieldE01FRODTM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01FRODTM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01FRODTM()
  {
    return fieldE01FRODTM.getBigDecimal();
  }

  /**
  * Set field E01FRODTD using a String value.
  */
  public void setE01FRODTD(String newvalue)
  {
    fieldE01FRODTD.setString(newvalue);
  }

  /**
  * Get value of field E01FRODTD as a String.
  */
  public String getE01FRODTD()
  {
    return fieldE01FRODTD.getString();
  }

  /**
  * Set numeric field E01FRODTD using a BigDecimal value.
  */
  public void setE01FRODTD(BigDecimal newvalue)
  {
    fieldE01FRODTD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01FRODTD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01FRODTD()
  {
    return fieldE01FRODTD.getBigDecimal();
  }

  /**
  * Set field E01FRODTY using a String value.
  */
  public void setE01FRODTY(String newvalue)
  {
    fieldE01FRODTY.setString(newvalue);
  }

  /**
  * Get value of field E01FRODTY as a String.
  */
  public String getE01FRODTY()
  {
    return fieldE01FRODTY.getString();
  }

  /**
  * Set numeric field E01FRODTY using a BigDecimal value.
  */
  public void setE01FRODTY(BigDecimal newvalue)
  {
    fieldE01FRODTY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01FRODTY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01FRODTY()
  {
    return fieldE01FRODTY.getBigDecimal();
  }

  /**
  * Set field E01TODTEM using a String value.
  */
  public void setE01TODTEM(String newvalue)
  {
    fieldE01TODTEM.setString(newvalue);
  }

  /**
  * Get value of field E01TODTEM as a String.
  */
  public String getE01TODTEM()
  {
    return fieldE01TODTEM.getString();
  }

  /**
  * Set numeric field E01TODTEM using a BigDecimal value.
  */
  public void setE01TODTEM(BigDecimal newvalue)
  {
    fieldE01TODTEM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TODTEM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TODTEM()
  {
    return fieldE01TODTEM.getBigDecimal();
  }

  /**
  * Set field E01TODTED using a String value.
  */
  public void setE01TODTED(String newvalue)
  {
    fieldE01TODTED.setString(newvalue);
  }

  /**
  * Get value of field E01TODTED as a String.
  */
  public String getE01TODTED()
  {
    return fieldE01TODTED.getString();
  }

  /**
  * Set numeric field E01TODTED using a BigDecimal value.
  */
  public void setE01TODTED(BigDecimal newvalue)
  {
    fieldE01TODTED.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TODTED as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TODTED()
  {
    return fieldE01TODTED.getBigDecimal();
  }

  /**
  * Set field E01TODTEY using a String value.
  */
  public void setE01TODTEY(String newvalue)
  {
    fieldE01TODTEY.setString(newvalue);
  }

  /**
  * Get value of field E01TODTEY as a String.
  */
  public String getE01TODTEY()
  {
    return fieldE01TODTEY.getString();
  }

  /**
  * Set numeric field E01TODTEY using a BigDecimal value.
  */
  public void setE01TODTEY(BigDecimal newvalue)
  {
    fieldE01TODTEY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TODTEY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TODTEY()
  {
    return fieldE01TODTEY.getBigDecimal();
  }

  /**
  * Set field E01MONTH1 using a String value.
  */
  public void setE01MONTH1(String newvalue)
  {
    fieldE01MONTH1.setString(newvalue);
  }

  /**
  * Get value of field E01MONTH1 as a String.
  */
  public String getE01MONTH1()
  {
    return fieldE01MONTH1.getString();
  }

  /**
  * Set numeric field E01MONTH1 using a BigDecimal value.
  */
  public void setE01MONTH1(BigDecimal newvalue)
  {
    fieldE01MONTH1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01MONTH1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01MONTH1()
  {
    return fieldE01MONTH1.getBigDecimal();
  }

  /**
  * Set field E01MONTH2 using a String value.
  */
  public void setE01MONTH2(String newvalue)
  {
    fieldE01MONTH2.setString(newvalue);
  }

  /**
  * Get value of field E01MONTH2 as a String.
  */
  public String getE01MONTH2()
  {
    return fieldE01MONTH2.getString();
  }

  /**
  * Set numeric field E01MONTH2 using a BigDecimal value.
  */
  public void setE01MONTH2(BigDecimal newvalue)
  {
    fieldE01MONTH2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01MONTH2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01MONTH2()
  {
    return fieldE01MONTH2.getBigDecimal();
  }

  /**
  * Set field E01SEGBNK using a String value.
  */
  public void setE01SEGBNK(String newvalue)
  {
    fieldE01SEGBNK.setString(newvalue);
  }

  /**
  * Get value of field E01SEGBNK as a String.
  */
  public String getE01SEGBNK()
  {
    return fieldE01SEGBNK.getString();
  }

  /**
  * Set field E01SEGBRN using a String value.
  */
  public void setE01SEGBRN(String newvalue)
  {
    fieldE01SEGBRN.setString(newvalue);
  }

  /**
  * Get value of field E01SEGBRN as a String.
  */
  public String getE01SEGBRN()
  {
    return fieldE01SEGBRN.getString();
  }

  /**
  * Set numeric field E01SEGBRN using a BigDecimal value.
  */
  public void setE01SEGBRN(BigDecimal newvalue)
  {
    fieldE01SEGBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SEGBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SEGBRN()
  {
    return fieldE01SEGBRN.getBigDecimal();
  }

  /**
  * Set field E01SEGCCY using a String value.
  */
  public void setE01SEGCCY(String newvalue)
  {
    fieldE01SEGCCY.setString(newvalue);
  }

  /**
  * Get value of field E01SEGCCY as a String.
  */
  public String getE01SEGCCY()
  {
    return fieldE01SEGCCY.getString();
  }

}