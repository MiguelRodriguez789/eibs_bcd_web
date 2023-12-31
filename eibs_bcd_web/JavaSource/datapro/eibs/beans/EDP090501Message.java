package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDP090501 physical file definition.
* 
* File level identifier is 1160308060017.
* Record format level identifier is 4915C50E96F28.
*/

public class EDP090501Message extends MessageRecord
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
                                     "E01MVCCUN",
                                     "E01CUSNA1",
                                     "E01MVCTYP",
                                     "E01MVCMON",
                                     "E01MVCDM1",
                                     "E01MVCDM2",
                                     "E01MVCDM3",
                                     "E01MVCDM4",
                                     "E01MVCDM5",
                                     "E01MVCDM6",
                                     "E01MVCINS",
                                     "E01MVCACC",
                                     "E01MVCDIN",
                                     "E01MVCAM1",
                                     "E01MVCAM2",
                                     "E01MVCAM3",
                                     "E01MVCAM4",
                                     "E01MVCAM5",
                                     "E01MVCAM6",
                                     "E01MVCAMT",
                                     "E01MVCAAM",
                                     "E01MVCAAQ",
                                     "E01MVCYPR",
                                     "E01MVCPVT",
                                     "E01TIPREG",
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
                                   "E01MVCCUN",
                                   "E01CUSNA1",
                                   "E01MVCTYP",
                                   "E01MVCMON",
                                   "E01MVCDM1",
                                   "E01MVCDM2",
                                   "E01MVCDM3",
                                   "E01MVCDM4",
                                   "E01MVCDM5",
                                   "E01MVCDM6",
                                   "E01MVCINS",
                                   "E01MVCACC",
                                   "E01MVCDIN",
                                   "E01MVCAM1",
                                   "E01MVCAM2",
                                   "E01MVCAM3",
                                   "E01MVCAM4",
                                   "E01MVCAM5",
                                   "E01MVCAM6",
                                   "E01MVCAMT",
                                   "E01MVCAAM",
                                   "E01MVCAAQ",
                                   "E01MVCYPR",
                                   "E01MVCPVT",
                                   "E01TIPREG",
                                   "E01OPECDE"
                                 };
  final static String fid = "1160308060017";
  final static String rid = "4915C50E96F28";
  final static String fmtname = "EDP090501";
  final int FIELDCOUNT = 36;
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
  private DecimalField fieldE01MVCCUN = null;
  private CharacterField fieldE01CUSNA1 = null;
  private CharacterField fieldE01MVCTYP = null;
  private DecimalField fieldE01MVCMON = null;
  private CharacterField fieldE01MVCDM1 = null;
  private CharacterField fieldE01MVCDM2 = null;
  private CharacterField fieldE01MVCDM3 = null;
  private CharacterField fieldE01MVCDM4 = null;
  private CharacterField fieldE01MVCDM5 = null;
  private CharacterField fieldE01MVCDM6 = null;
  private CharacterField fieldE01MVCINS = null;
  private DecimalField fieldE01MVCACC = null;
  private CharacterField fieldE01MVCDIN = null;
  private DecimalField fieldE01MVCAM1 = null;
  private DecimalField fieldE01MVCAM2 = null;
  private DecimalField fieldE01MVCAM3 = null;
  private DecimalField fieldE01MVCAM4 = null;
  private DecimalField fieldE01MVCAM5 = null;
  private DecimalField fieldE01MVCAM6 = null;
  private DecimalField fieldE01MVCAMT = null;
  private DecimalField fieldE01MVCAAM = null;
  private DecimalField fieldE01MVCAAQ = null;
  private DecimalField fieldE01MVCYPR = null;
  private DecimalField fieldE01MVCPVT = null;
  private CharacterField fieldE01TIPREG = null;
  private CharacterField fieldE01OPECDE = null;

  /**
  * Constructor for EDP090501Message.
  */
  public EDP090501Message()
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
    recordsize = 528;
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
    fields[10] = fieldE01MVCCUN =
    new DecimalField(message, HEADERSIZE + 43, 10, 0, "E01MVCCUN");
    fields[11] = fieldE01CUSNA1 =
    new CharacterField(message, HEADERSIZE + 53, 60, "E01CUSNA1");
    fields[12] = fieldE01MVCTYP =
    new CharacterField(message, HEADERSIZE + 113, 1, "E01MVCTYP");
    fields[13] = fieldE01MVCMON =
    new DecimalField(message, HEADERSIZE + 114, 3, 0, "E01MVCMON");
    fields[14] = fieldE01MVCDM1 =
    new CharacterField(message, HEADERSIZE + 117, 25, "E01MVCDM1");
    fields[15] = fieldE01MVCDM2 =
    new CharacterField(message, HEADERSIZE + 142, 25, "E01MVCDM2");
    fields[16] = fieldE01MVCDM3 =
    new CharacterField(message, HEADERSIZE + 167, 25, "E01MVCDM3");
    fields[17] = fieldE01MVCDM4 =
    new CharacterField(message, HEADERSIZE + 192, 25, "E01MVCDM4");
    fields[18] = fieldE01MVCDM5 =
    new CharacterField(message, HEADERSIZE + 217, 25, "E01MVCDM5");
    fields[19] = fieldE01MVCDM6 =
    new CharacterField(message, HEADERSIZE + 242, 25, "E01MVCDM6");
    fields[20] = fieldE01MVCINS =
    new CharacterField(message, HEADERSIZE + 267, 4, "E01MVCINS");
    fields[21] = fieldE01MVCACC =
    new DecimalField(message, HEADERSIZE + 271, 13, 0, "E01MVCACC");
    fields[22] = fieldE01MVCDIN =
    new CharacterField(message, HEADERSIZE + 284, 45, "E01MVCDIN");
    fields[23] = fieldE01MVCAM1 =
    new DecimalField(message, HEADERSIZE + 329, 19, 2, "E01MVCAM1");
    fields[24] = fieldE01MVCAM2 =
    new DecimalField(message, HEADERSIZE + 348, 19, 2, "E01MVCAM2");
    fields[25] = fieldE01MVCAM3 =
    new DecimalField(message, HEADERSIZE + 367, 19, 2, "E01MVCAM3");
    fields[26] = fieldE01MVCAM4 =
    new DecimalField(message, HEADERSIZE + 386, 19, 2, "E01MVCAM4");
    fields[27] = fieldE01MVCAM5 =
    new DecimalField(message, HEADERSIZE + 405, 19, 2, "E01MVCAM5");
    fields[28] = fieldE01MVCAM6 =
    new DecimalField(message, HEADERSIZE + 424, 19, 2, "E01MVCAM6");
    fields[29] = fieldE01MVCAMT =
    new DecimalField(message, HEADERSIZE + 443, 19, 2, "E01MVCAMT");
    fields[30] = fieldE01MVCAAM =
    new DecimalField(message, HEADERSIZE + 462, 19, 2, "E01MVCAAM");
    fields[31] = fieldE01MVCAAQ =
    new DecimalField(message, HEADERSIZE + 481, 19, 2, "E01MVCAAQ");
    fields[32] = fieldE01MVCYPR =
    new DecimalField(message, HEADERSIZE + 500, 19, 2, "E01MVCYPR");
    fields[33] = fieldE01MVCPVT =
    new DecimalField(message, HEADERSIZE + 519, 7, 2, "E01MVCPVT");
    fields[34] = fieldE01TIPREG =
    new CharacterField(message, HEADERSIZE + 526, 1, "E01TIPREG");
    fields[35] = fieldE01OPECDE =
    new CharacterField(message, HEADERSIZE + 527, 1, "E01OPECDE");

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
  * Set field E01MVCCUN using a String value.
  */
  public void setE01MVCCUN(String newvalue)
  {
    fieldE01MVCCUN.setString(newvalue);
  }

  /**
  * Get value of field E01MVCCUN as a String.
  */
  public String getE01MVCCUN()
  {
    return fieldE01MVCCUN.getString();
  }

  /**
  * Set numeric field E01MVCCUN using a BigDecimal value.
  */
  public void setE01MVCCUN(BigDecimal newvalue)
  {
    fieldE01MVCCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01MVCCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01MVCCUN()
  {
    return fieldE01MVCCUN.getBigDecimal();
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
  * Set field E01MVCTYP using a String value.
  */
  public void setE01MVCTYP(String newvalue)
  {
    fieldE01MVCTYP.setString(newvalue);
  }

  /**
  * Get value of field E01MVCTYP as a String.
  */
  public String getE01MVCTYP()
  {
    return fieldE01MVCTYP.getString();
  }

  /**
  * Set field E01MVCMON using a String value.
  */
  public void setE01MVCMON(String newvalue)
  {
    fieldE01MVCMON.setString(newvalue);
  }

  /**
  * Get value of field E01MVCMON as a String.
  */
  public String getE01MVCMON()
  {
    return fieldE01MVCMON.getString();
  }

  /**
  * Set numeric field E01MVCMON using a BigDecimal value.
  */
  public void setE01MVCMON(BigDecimal newvalue)
  {
    fieldE01MVCMON.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01MVCMON as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01MVCMON()
  {
    return fieldE01MVCMON.getBigDecimal();
  }

  /**
  * Set field E01MVCDM1 using a String value.
  */
  public void setE01MVCDM1(String newvalue)
  {
    fieldE01MVCDM1.setString(newvalue);
  }

  /**
  * Get value of field E01MVCDM1 as a String.
  */
  public String getE01MVCDM1()
  {
    return fieldE01MVCDM1.getString();
  }

  /**
  * Set field E01MVCDM2 using a String value.
  */
  public void setE01MVCDM2(String newvalue)
  {
    fieldE01MVCDM2.setString(newvalue);
  }

  /**
  * Get value of field E01MVCDM2 as a String.
  */
  public String getE01MVCDM2()
  {
    return fieldE01MVCDM2.getString();
  }

  /**
  * Set field E01MVCDM3 using a String value.
  */
  public void setE01MVCDM3(String newvalue)
  {
    fieldE01MVCDM3.setString(newvalue);
  }

  /**
  * Get value of field E01MVCDM3 as a String.
  */
  public String getE01MVCDM3()
  {
    return fieldE01MVCDM3.getString();
  }

  /**
  * Set field E01MVCDM4 using a String value.
  */
  public void setE01MVCDM4(String newvalue)
  {
    fieldE01MVCDM4.setString(newvalue);
  }

  /**
  * Get value of field E01MVCDM4 as a String.
  */
  public String getE01MVCDM4()
  {
    return fieldE01MVCDM4.getString();
  }

  /**
  * Set field E01MVCDM5 using a String value.
  */
  public void setE01MVCDM5(String newvalue)
  {
    fieldE01MVCDM5.setString(newvalue);
  }

  /**
  * Get value of field E01MVCDM5 as a String.
  */
  public String getE01MVCDM5()
  {
    return fieldE01MVCDM5.getString();
  }

  /**
  * Set field E01MVCDM6 using a String value.
  */
  public void setE01MVCDM6(String newvalue)
  {
    fieldE01MVCDM6.setString(newvalue);
  }

  /**
  * Get value of field E01MVCDM6 as a String.
  */
  public String getE01MVCDM6()
  {
    return fieldE01MVCDM6.getString();
  }

  /**
  * Set field E01MVCINS using a String value.
  */
  public void setE01MVCINS(String newvalue)
  {
    fieldE01MVCINS.setString(newvalue);
  }

  /**
  * Get value of field E01MVCINS as a String.
  */
  public String getE01MVCINS()
  {
    return fieldE01MVCINS.getString();
  }

  /**
  * Set field E01MVCACC using a String value.
  */
  public void setE01MVCACC(String newvalue)
  {
    fieldE01MVCACC.setString(newvalue);
  }

  /**
  * Get value of field E01MVCACC as a String.
  */
  public String getE01MVCACC()
  {
    return fieldE01MVCACC.getString();
  }

  /**
  * Set numeric field E01MVCACC using a BigDecimal value.
  */
  public void setE01MVCACC(BigDecimal newvalue)
  {
    fieldE01MVCACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01MVCACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01MVCACC()
  {
    return fieldE01MVCACC.getBigDecimal();
  }

  /**
  * Set field E01MVCDIN using a String value.
  */
  public void setE01MVCDIN(String newvalue)
  {
    fieldE01MVCDIN.setString(newvalue);
  }

  /**
  * Get value of field E01MVCDIN as a String.
  */
  public String getE01MVCDIN()
  {
    return fieldE01MVCDIN.getString();
  }

  /**
  * Set field E01MVCAM1 using a String value.
  */
  public void setE01MVCAM1(String newvalue)
  {
    fieldE01MVCAM1.setString(newvalue);
  }

  /**
  * Get value of field E01MVCAM1 as a String.
  */
  public String getE01MVCAM1()
  {
    return fieldE01MVCAM1.getString();
  }

  /**
  * Set numeric field E01MVCAM1 using a BigDecimal value.
  */
  public void setE01MVCAM1(BigDecimal newvalue)
  {
    fieldE01MVCAM1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01MVCAM1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01MVCAM1()
  {
    return fieldE01MVCAM1.getBigDecimal();
  }

  /**
  * Set field E01MVCAM2 using a String value.
  */
  public void setE01MVCAM2(String newvalue)
  {
    fieldE01MVCAM2.setString(newvalue);
  }

  /**
  * Get value of field E01MVCAM2 as a String.
  */
  public String getE01MVCAM2()
  {
    return fieldE01MVCAM2.getString();
  }

  /**
  * Set numeric field E01MVCAM2 using a BigDecimal value.
  */
  public void setE01MVCAM2(BigDecimal newvalue)
  {
    fieldE01MVCAM2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01MVCAM2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01MVCAM2()
  {
    return fieldE01MVCAM2.getBigDecimal();
  }

  /**
  * Set field E01MVCAM3 using a String value.
  */
  public void setE01MVCAM3(String newvalue)
  {
    fieldE01MVCAM3.setString(newvalue);
  }

  /**
  * Get value of field E01MVCAM3 as a String.
  */
  public String getE01MVCAM3()
  {
    return fieldE01MVCAM3.getString();
  }

  /**
  * Set numeric field E01MVCAM3 using a BigDecimal value.
  */
  public void setE01MVCAM3(BigDecimal newvalue)
  {
    fieldE01MVCAM3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01MVCAM3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01MVCAM3()
  {
    return fieldE01MVCAM3.getBigDecimal();
  }

  /**
  * Set field E01MVCAM4 using a String value.
  */
  public void setE01MVCAM4(String newvalue)
  {
    fieldE01MVCAM4.setString(newvalue);
  }

  /**
  * Get value of field E01MVCAM4 as a String.
  */
  public String getE01MVCAM4()
  {
    return fieldE01MVCAM4.getString();
  }

  /**
  * Set numeric field E01MVCAM4 using a BigDecimal value.
  */
  public void setE01MVCAM4(BigDecimal newvalue)
  {
    fieldE01MVCAM4.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01MVCAM4 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01MVCAM4()
  {
    return fieldE01MVCAM4.getBigDecimal();
  }

  /**
  * Set field E01MVCAM5 using a String value.
  */
  public void setE01MVCAM5(String newvalue)
  {
    fieldE01MVCAM5.setString(newvalue);
  }

  /**
  * Get value of field E01MVCAM5 as a String.
  */
  public String getE01MVCAM5()
  {
    return fieldE01MVCAM5.getString();
  }

  /**
  * Set numeric field E01MVCAM5 using a BigDecimal value.
  */
  public void setE01MVCAM5(BigDecimal newvalue)
  {
    fieldE01MVCAM5.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01MVCAM5 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01MVCAM5()
  {
    return fieldE01MVCAM5.getBigDecimal();
  }

  /**
  * Set field E01MVCAM6 using a String value.
  */
  public void setE01MVCAM6(String newvalue)
  {
    fieldE01MVCAM6.setString(newvalue);
  }

  /**
  * Get value of field E01MVCAM6 as a String.
  */
  public String getE01MVCAM6()
  {
    return fieldE01MVCAM6.getString();
  }

  /**
  * Set numeric field E01MVCAM6 using a BigDecimal value.
  */
  public void setE01MVCAM6(BigDecimal newvalue)
  {
    fieldE01MVCAM6.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01MVCAM6 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01MVCAM6()
  {
    return fieldE01MVCAM6.getBigDecimal();
  }

  /**
  * Set field E01MVCAMT using a String value.
  */
  public void setE01MVCAMT(String newvalue)
  {
    fieldE01MVCAMT.setString(newvalue);
  }

  /**
  * Get value of field E01MVCAMT as a String.
  */
  public String getE01MVCAMT()
  {
    return fieldE01MVCAMT.getString();
  }

  /**
  * Set numeric field E01MVCAMT using a BigDecimal value.
  */
  public void setE01MVCAMT(BigDecimal newvalue)
  {
    fieldE01MVCAMT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01MVCAMT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01MVCAMT()
  {
    return fieldE01MVCAMT.getBigDecimal();
  }

  /**
  * Set field E01MVCAAM using a String value.
  */
  public void setE01MVCAAM(String newvalue)
  {
    fieldE01MVCAAM.setString(newvalue);
  }

  /**
  * Get value of field E01MVCAAM as a String.
  */
  public String getE01MVCAAM()
  {
    return fieldE01MVCAAM.getString();
  }

  /**
  * Set numeric field E01MVCAAM using a BigDecimal value.
  */
  public void setE01MVCAAM(BigDecimal newvalue)
  {
    fieldE01MVCAAM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01MVCAAM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01MVCAAM()
  {
    return fieldE01MVCAAM.getBigDecimal();
  }

  /**
  * Set field E01MVCAAQ using a String value.
  */
  public void setE01MVCAAQ(String newvalue)
  {
    fieldE01MVCAAQ.setString(newvalue);
  }

  /**
  * Get value of field E01MVCAAQ as a String.
  */
  public String getE01MVCAAQ()
  {
    return fieldE01MVCAAQ.getString();
  }

  /**
  * Set numeric field E01MVCAAQ using a BigDecimal value.
  */
  public void setE01MVCAAQ(BigDecimal newvalue)
  {
    fieldE01MVCAAQ.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01MVCAAQ as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01MVCAAQ()
  {
    return fieldE01MVCAAQ.getBigDecimal();
  }

  /**
  * Set field E01MVCYPR using a String value.
  */
  public void setE01MVCYPR(String newvalue)
  {
    fieldE01MVCYPR.setString(newvalue);
  }

  /**
  * Get value of field E01MVCYPR as a String.
  */
  public String getE01MVCYPR()
  {
    return fieldE01MVCYPR.getString();
  }

  /**
  * Set numeric field E01MVCYPR using a BigDecimal value.
  */
  public void setE01MVCYPR(BigDecimal newvalue)
  {
    fieldE01MVCYPR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01MVCYPR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01MVCYPR()
  {
    return fieldE01MVCYPR.getBigDecimal();
  }

  /**
  * Set field E01MVCPVT using a String value.
  */
  public void setE01MVCPVT(String newvalue)
  {
    fieldE01MVCPVT.setString(newvalue);
  }

  /**
  * Get value of field E01MVCPVT as a String.
  */
  public String getE01MVCPVT()
  {
    return fieldE01MVCPVT.getString();
  }

  /**
  * Set numeric field E01MVCPVT using a BigDecimal value.
  */
  public void setE01MVCPVT(BigDecimal newvalue)
  {
    fieldE01MVCPVT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01MVCPVT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01MVCPVT()
  {
    return fieldE01MVCPVT.getBigDecimal();
  }

  /**
  * Set field E01TIPREG using a String value.
  */
  public void setE01TIPREG(String newvalue)
  {
    fieldE01TIPREG.setString(newvalue);
  }

  /**
  * Get value of field E01TIPREG as a String.
  */
  public String getE01TIPREG()
  {
    return fieldE01TIPREG.getString();
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
