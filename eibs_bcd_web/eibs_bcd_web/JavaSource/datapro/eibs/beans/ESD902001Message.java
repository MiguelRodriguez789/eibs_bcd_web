package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ESD902001 physical file definition.
* 
* File level identifier is 1170601112147.
* Record format level identifier is 45975942C44DB.
*/

public class ESD902001Message extends MessageRecord
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
                                     "E01APRBNK",
                                     "E01APRCDE",
                                     "E01APRLMM",
                                     "E01APRLMD",
                                     "E01APRLMY",
                                     "E01APRLMT",
                                     "E01APRLMU",
                                     "D01APRCDE",
                                     "E01CUESTS",
                                     "E01ACT",
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
                                   "E01APRBNK",
                                   "E01APRCDE",
                                   "E01APRLMM",
                                   "E01APRLMD",
                                   "E01APRLMY",
                                   "E01APRLMT",
                                   "E01APRLMU",
                                   "D01APRCDE",
                                   "E01CUESTS",
                                   "E01ACT",
                                   "E01NUMREC",
                                   "E01INDOPE"
                                 };
  final static String fid = "1170601112147";
  final static String rid = "45975942C44DB";
  final static String fmtname = "ESD902001";
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
  private CharacterField fieldE01APRBNK = null;
  private CharacterField fieldE01APRCDE = null;
  private DecimalField fieldE01APRLMM = null;
  private DecimalField fieldE01APRLMD = null;
  private DecimalField fieldE01APRLMY = null;
  private CharacterField fieldE01APRLMT = null;
  private CharacterField fieldE01APRLMU = null;
  private CharacterField fieldD01APRCDE = null;
  private CharacterField fieldE01CUESTS = null;
  private CharacterField fieldE01ACT = null;
  private DecimalField fieldE01NUMREC = null;
  private CharacterField fieldE01INDOPE = null;

  /**
  * Constructor for ESD902001Message.
  */
  public ESD902001Message()
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
    recordsize = 166;
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
    fields[9] = fieldE01APRBNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E01APRBNK");
    fields[10] = fieldE01APRCDE =
    new CharacterField(message, HEADERSIZE + 44, 4, "E01APRCDE");
    fields[11] = fieldE01APRLMM =
    new DecimalField(message, HEADERSIZE + 48, 3, 0, "E01APRLMM");
    fields[12] = fieldE01APRLMD =
    new DecimalField(message, HEADERSIZE + 51, 3, 0, "E01APRLMD");
    fields[13] = fieldE01APRLMY =
    new DecimalField(message, HEADERSIZE + 54, 5, 0, "E01APRLMY");
    fields[14] = fieldE01APRLMT =
    new CharacterField(message, HEADERSIZE + 59, 26, "E01APRLMT");
    fields[15] = fieldE01APRLMU =
    new CharacterField(message, HEADERSIZE + 85, 10, "E01APRLMU");
    fields[16] = fieldD01APRCDE =
    new CharacterField(message, HEADERSIZE + 95, 60, "D01APRCDE");
    fields[17] = fieldE01CUESTS =
    new CharacterField(message, HEADERSIZE + 155, 1, "E01CUESTS");
    fields[18] = fieldE01ACT =
    new CharacterField(message, HEADERSIZE + 156, 1, "E01ACT");
    fields[19] = fieldE01NUMREC =
    new DecimalField(message, HEADERSIZE + 157, 8, 0, "E01NUMREC");
    fields[20] = fieldE01INDOPE =
    new CharacterField(message, HEADERSIZE + 165, 1, "E01INDOPE");

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
  * Set field E01APRBNK using a String value.
  */
  public void setE01APRBNK(String newvalue)
  {
    fieldE01APRBNK.setString(newvalue);
  }

  /**
  * Get value of field E01APRBNK as a String.
  */
  public String getE01APRBNK()
  {
    return fieldE01APRBNK.getString();
  }

  /**
  * Set field E01APRCDE using a String value.
  */
  public void setE01APRCDE(String newvalue)
  {
    fieldE01APRCDE.setString(newvalue);
  }

  /**
  * Get value of field E01APRCDE as a String.
  */
  public String getE01APRCDE()
  {
    return fieldE01APRCDE.getString();
  }

  /**
  * Set field E01APRLMM using a String value.
  */
  public void setE01APRLMM(String newvalue)
  {
    fieldE01APRLMM.setString(newvalue);
  }

  /**
  * Get value of field E01APRLMM as a String.
  */
  public String getE01APRLMM()
  {
    return fieldE01APRLMM.getString();
  }

  /**
  * Set numeric field E01APRLMM using a BigDecimal value.
  */
  public void setE01APRLMM(BigDecimal newvalue)
  {
    fieldE01APRLMM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01APRLMM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01APRLMM()
  {
    return fieldE01APRLMM.getBigDecimal();
  }

  /**
  * Set field E01APRLMD using a String value.
  */
  public void setE01APRLMD(String newvalue)
  {
    fieldE01APRLMD.setString(newvalue);
  }

  /**
  * Get value of field E01APRLMD as a String.
  */
  public String getE01APRLMD()
  {
    return fieldE01APRLMD.getString();
  }

  /**
  * Set numeric field E01APRLMD using a BigDecimal value.
  */
  public void setE01APRLMD(BigDecimal newvalue)
  {
    fieldE01APRLMD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01APRLMD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01APRLMD()
  {
    return fieldE01APRLMD.getBigDecimal();
  }

  /**
  * Set field E01APRLMY using a String value.
  */
  public void setE01APRLMY(String newvalue)
  {
    fieldE01APRLMY.setString(newvalue);
  }

  /**
  * Get value of field E01APRLMY as a String.
  */
  public String getE01APRLMY()
  {
    return fieldE01APRLMY.getString();
  }

  /**
  * Set numeric field E01APRLMY using a BigDecimal value.
  */
  public void setE01APRLMY(BigDecimal newvalue)
  {
    fieldE01APRLMY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01APRLMY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01APRLMY()
  {
    return fieldE01APRLMY.getBigDecimal();
  }

  /**
  * Set field E01APRLMT using a String value.
  */
  public void setE01APRLMT(String newvalue)
  {
    fieldE01APRLMT.setString(newvalue);
  }

  /**
  * Get value of field E01APRLMT as a String.
  */
  public String getE01APRLMT()
  {
    return fieldE01APRLMT.getString();
  }

  /**
  * Set field E01APRLMU using a String value.
  */
  public void setE01APRLMU(String newvalue)
  {
    fieldE01APRLMU.setString(newvalue);
  }

  /**
  * Get value of field E01APRLMU as a String.
  */
  public String getE01APRLMU()
  {
    return fieldE01APRLMU.getString();
  }

  /**
  * Set field D01APRCDE using a String value.
  */
  public void setD01APRCDE(String newvalue)
  {
    fieldD01APRCDE.setString(newvalue);
  }

  /**
  * Get value of field D01APRCDE as a String.
  */
  public String getD01APRCDE()
  {
    return fieldD01APRCDE.getString();
  }

  /**
  * Set field E01CUESTS using a String value.
  */
  public void setE01CUESTS(String newvalue)
  {
    fieldE01CUESTS.setString(newvalue);
  }

  /**
  * Get value of field E01CUESTS as a String.
  */
  public String getE01CUESTS()
  {
    return fieldE01CUESTS.getString();
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