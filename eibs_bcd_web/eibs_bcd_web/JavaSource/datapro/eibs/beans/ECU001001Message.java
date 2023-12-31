package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ECU001001 physical file definition.
* 
* File level identifier is 1130611112853.
* Record format level identifier is 2DAE9611960A7.
*/

public class ECU001001Message extends MessageRecord
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
                                     "E01CUSBRA",
                                     "E01CUSOFC",
                                     "E01CUSCUN",
                                     "E01CUSNA1",
                                     "E01CUSV00",
                                     "E01CUSV60",
                                     "E01CUSV12",
                                     "E01CUSV18",
                                     "E01CUSLN3",
                                     "E01CUSID4",
                                     "E01CUFFIR",
                                     "E01CUFFIN",
                                     "E01CUFLGL",
                                     "E01CUFINT",
                                     "E01CUFRFM",
                                     "E01CUFTER",
                                     "E01CUFADM",
                                     "E01CUFADN",
                                     "E01CUSMD1",
                                     "E01CUSMD2",
                                     "E01CUSMD3",
                                     "E01CUFMPA",
                                     "E01CUFCIR",
                                     "E01CUFNDO",
                                     "E01CUFTOM",
                                     "E01CUSRD1",
                                     "E01CUSRD2",
                                     "E01CUSRD3",
                                     "E01CUSREN",
                                     "E01CUSOBS",
                                     "E01CUSVD1",
                                     "E01CUSVD2",
                                     "E01CUSVD3",
                                     "E01CUSTD1",
                                     "E01CUSTD2",
                                     "E01CUSTD3",
                                     "E01CUFABO"
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
                                   "E01CUSBRA",
                                   "E01CUSOFC",
                                   "E01CUSCUN",
                                   "E01CUSNA1",
                                   "E01CUSV00",
                                   "E01CUSV60",
                                   "E01CUSV12",
                                   "E01CUSV18",
                                   "E01CUSLN3",
                                   "E01CUSID4",
                                   "E01CUFFIR",
                                   "E01CUFFIN",
                                   "E01CUFLGL",
                                   "E01CUFINT",
                                   "E01CUFRFM",
                                   "E01CUFTER",
                                   "E01CUFADM",
                                   "E01CUFADN",
                                   "E01CUSMD1",
                                   "E01CUSMD2",
                                   "E01CUSMD3",
                                   "E01CUFMPA",
                                   "E01CUFCIR",
                                   "E01CUFNDO",
                                   "E01CUFTOM",
                                   "E01CUSRD1",
                                   "E01CUSRD2",
                                   "E01CUSRD3",
                                   "E01CUSREN",
                                   "E01CUSOBS",
                                   "E01CUSVD1",
                                   "E01CUSVD2",
                                   "E01CUSVD3",
                                   "E01CUSTD1",
                                   "E01CUSTD2",
                                   "E01CUSTD3",
                                   "E01CUFABO"
                                 };
  final static String fid = "1130611112853";
  final static String rid = "2DAE9611960A7";
  final static String fmtname = "ECU001001";
  final int FIELDCOUNT = 46;
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
  private DecimalField fieldE01CUSBRA = null;
  private CharacterField fieldE01CUSOFC = null;
  private DecimalField fieldE01CUSCUN = null;
  private CharacterField fieldE01CUSNA1 = null;
  private DecimalField fieldE01CUSV00 = null;
  private CharacterField fieldE01CUSV60 = null;
  private CharacterField fieldE01CUSV12 = null;
  private CharacterField fieldE01CUSV18 = null;
  private CharacterField fieldE01CUSLN3 = null;
  private CharacterField fieldE01CUSID4 = null;
  private CharacterField fieldE01CUFFIR = null;
  private CharacterField fieldE01CUFFIN = null;
  private CharacterField fieldE01CUFLGL = null;
  private CharacterField fieldE01CUFINT = null;
  private CharacterField fieldE01CUFRFM = null;
  private DecimalField fieldE01CUFTER = null;
  private CharacterField fieldE01CUFADM = null;
  private CharacterField fieldE01CUFADN = null;
  private DecimalField fieldE01CUSMD1 = null;
  private DecimalField fieldE01CUSMD2 = null;
  private DecimalField fieldE01CUSMD3 = null;
  private DecimalField fieldE01CUFMPA = null;
  private CharacterField fieldE01CUFCIR = null;
  private DecimalField fieldE01CUFNDO = null;
  private CharacterField fieldE01CUFTOM = null;
  private DecimalField fieldE01CUSRD1 = null;
  private DecimalField fieldE01CUSRD2 = null;
  private DecimalField fieldE01CUSRD3 = null;
  private CharacterField fieldE01CUSREN = null;
  private CharacterField fieldE01CUSOBS = null;
  private DecimalField fieldE01CUSVD1 = null;
  private DecimalField fieldE01CUSVD2 = null;
  private DecimalField fieldE01CUSVD3 = null;
  private DecimalField fieldE01CUSTD1 = null;
  private DecimalField fieldE01CUSTD2 = null;
  private DecimalField fieldE01CUSTD3 = null;
  private CharacterField fieldE01CUFABO = null;

  /**
  * Constructor for ECU001001Message.
  */
  public ECU001001Message()
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
    recordsize = 904;
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
    fields[9] = fieldE01CUSBRA =
    new DecimalField(message, HEADERSIZE + 42, 5, 0, "E01CUSBRA");
    fields[10] = fieldE01CUSOFC =
    new CharacterField(message, HEADERSIZE + 47, 4, "E01CUSOFC");
    fields[11] = fieldE01CUSCUN =
    new DecimalField(message, HEADERSIZE + 51, 10, 0, "E01CUSCUN");
    fields[12] = fieldE01CUSNA1 =
    new CharacterField(message, HEADERSIZE + 61, 60, "E01CUSNA1");
    fields[13] = fieldE01CUSV00 =
    new DecimalField(message, HEADERSIZE + 121, 8, 0, "E01CUSV00");
    fields[14] = fieldE01CUSV60 =
    new CharacterField(message, HEADERSIZE + 129, 1, "E01CUSV60");
    fields[15] = fieldE01CUSV12 =
    new CharacterField(message, HEADERSIZE + 130, 1, "E01CUSV12");
    fields[16] = fieldE01CUSV18 =
    new CharacterField(message, HEADERSIZE + 131, 1, "E01CUSV18");
    fields[17] = fieldE01CUSLN3 =
    new CharacterField(message, HEADERSIZE + 132, 30, "E01CUSLN3");
    fields[18] = fieldE01CUSID4 =
    new CharacterField(message, HEADERSIZE + 162, 25, "E01CUSID4");
    fields[19] = fieldE01CUFFIR =
    new CharacterField(message, HEADERSIZE + 187, 1, "E01CUFFIR");
    fields[20] = fieldE01CUFFIN =
    new CharacterField(message, HEADERSIZE + 188, 14, "E01CUFFIN");
    fields[21] = fieldE01CUFLGL =
    new CharacterField(message, HEADERSIZE + 202, 1, "E01CUFLGL");
    fields[22] = fieldE01CUFINT =
    new CharacterField(message, HEADERSIZE + 203, 1, "E01CUFINT");
    fields[23] = fieldE01CUFRFM =
    new CharacterField(message, HEADERSIZE + 204, 1, "E01CUFRFM");
    fields[24] = fieldE01CUFTER =
    new DecimalField(message, HEADERSIZE + 205, 6, 0, "E01CUFTER");
    fields[25] = fieldE01CUFADM =
    new CharacterField(message, HEADERSIZE + 211, 4, "E01CUFADM");
    fields[26] = fieldE01CUFADN =
    new CharacterField(message, HEADERSIZE + 215, 45, "E01CUFADN");
    fields[27] = fieldE01CUSMD1 =
    new DecimalField(message, HEADERSIZE + 260, 3, 0, "E01CUSMD1");
    fields[28] = fieldE01CUSMD2 =
    new DecimalField(message, HEADERSIZE + 263, 3, 0, "E01CUSMD2");
    fields[29] = fieldE01CUSMD3 =
    new DecimalField(message, HEADERSIZE + 266, 5, 0, "E01CUSMD3");
    fields[30] = fieldE01CUFMPA =
    new DecimalField(message, HEADERSIZE + 271, 3, 0, "E01CUFMPA");
    fields[31] = fieldE01CUFCIR =
    new CharacterField(message, HEADERSIZE + 274, 45, "E01CUFCIR");
    fields[32] = fieldE01CUFNDO =
    new DecimalField(message, HEADERSIZE + 319, 13, 0, "E01CUFNDO");
    fields[33] = fieldE01CUFTOM =
    new CharacterField(message, HEADERSIZE + 332, 8, "E01CUFTOM");
    fields[34] = fieldE01CUSRD1 =
    new DecimalField(message, HEADERSIZE + 340, 3, 0, "E01CUSRD1");
    fields[35] = fieldE01CUSRD2 =
    new DecimalField(message, HEADERSIZE + 343, 3, 0, "E01CUSRD2");
    fields[36] = fieldE01CUSRD3 =
    new DecimalField(message, HEADERSIZE + 346, 5, 0, "E01CUSRD3");
    fields[37] = fieldE01CUSREN =
    new CharacterField(message, HEADERSIZE + 351, 15, "E01CUSREN");
    fields[38] = fieldE01CUSOBS =
    new CharacterField(message, HEADERSIZE + 366, 512, "E01CUSOBS");
    fields[39] = fieldE01CUSVD1 =
    new DecimalField(message, HEADERSIZE + 878, 3, 0, "E01CUSVD1");
    fields[40] = fieldE01CUSVD2 =
    new DecimalField(message, HEADERSIZE + 881, 3, 0, "E01CUSVD2");
    fields[41] = fieldE01CUSVD3 =
    new DecimalField(message, HEADERSIZE + 884, 5, 0, "E01CUSVD3");
    fields[42] = fieldE01CUSTD1 =
    new DecimalField(message, HEADERSIZE + 889, 3, 0, "E01CUSTD1");
    fields[43] = fieldE01CUSTD2 =
    new DecimalField(message, HEADERSIZE + 892, 3, 0, "E01CUSTD2");
    fields[44] = fieldE01CUSTD3 =
    new DecimalField(message, HEADERSIZE + 895, 5, 0, "E01CUSTD3");
    fields[45] = fieldE01CUFABO =
    new CharacterField(message, HEADERSIZE + 900, 4, "E01CUFABO");

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
  * Set field E01CUSBRA using a String value.
  */
  public void setE01CUSBRA(String newvalue)
  {
    fieldE01CUSBRA.setString(newvalue);
  }

  /**
  * Get value of field E01CUSBRA as a String.
  */
  public String getE01CUSBRA()
  {
    return fieldE01CUSBRA.getString();
  }

  /**
  * Set numeric field E01CUSBRA using a BigDecimal value.
  */
  public void setE01CUSBRA(BigDecimal newvalue)
  {
    fieldE01CUSBRA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CUSBRA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CUSBRA()
  {
    return fieldE01CUSBRA.getBigDecimal();
  }

  /**
  * Set field E01CUSOFC using a String value.
  */
  public void setE01CUSOFC(String newvalue)
  {
    fieldE01CUSOFC.setString(newvalue);
  }

  /**
  * Get value of field E01CUSOFC as a String.
  */
  public String getE01CUSOFC()
  {
    return fieldE01CUSOFC.getString();
  }

  /**
  * Set field E01CUSCUN using a String value.
  */
  public void setE01CUSCUN(String newvalue)
  {
    fieldE01CUSCUN.setString(newvalue);
  }

  /**
  * Get value of field E01CUSCUN as a String.
  */
  public String getE01CUSCUN()
  {
    return fieldE01CUSCUN.getString();
  }

  /**
  * Set numeric field E01CUSCUN using a BigDecimal value.
  */
  public void setE01CUSCUN(BigDecimal newvalue)
  {
    fieldE01CUSCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CUSCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CUSCUN()
  {
    return fieldE01CUSCUN.getBigDecimal();
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
  * Set field E01CUSV00 using a String value.
  */
  public void setE01CUSV00(String newvalue)
  {
    fieldE01CUSV00.setString(newvalue);
  }

  /**
  * Get value of field E01CUSV00 as a String.
  */
  public String getE01CUSV00()
  {
    return fieldE01CUSV00.getString();
  }

  /**
  * Set numeric field E01CUSV00 using a BigDecimal value.
  */
  public void setE01CUSV00(BigDecimal newvalue)
  {
    fieldE01CUSV00.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CUSV00 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CUSV00()
  {
    return fieldE01CUSV00.getBigDecimal();
  }

  /**
  * Set field E01CUSV60 using a String value.
  */
  public void setE01CUSV60(String newvalue)
  {
    fieldE01CUSV60.setString(newvalue);
  }

  /**
  * Get value of field E01CUSV60 as a String.
  */
  public String getE01CUSV60()
  {
    return fieldE01CUSV60.getString();
  }

  /**
  * Set field E01CUSV12 using a String value.
  */
  public void setE01CUSV12(String newvalue)
  {
    fieldE01CUSV12.setString(newvalue);
  }

  /**
  * Get value of field E01CUSV12 as a String.
  */
  public String getE01CUSV12()
  {
    return fieldE01CUSV12.getString();
  }

  /**
  * Set field E01CUSV18 using a String value.
  */
  public void setE01CUSV18(String newvalue)
  {
    fieldE01CUSV18.setString(newvalue);
  }

  /**
  * Get value of field E01CUSV18 as a String.
  */
  public String getE01CUSV18()
  {
    return fieldE01CUSV18.getString();
  }

  /**
  * Set field E01CUSLN3 using a String value.
  */
  public void setE01CUSLN3(String newvalue)
  {
    fieldE01CUSLN3.setString(newvalue);
  }

  /**
  * Get value of field E01CUSLN3 as a String.
  */
  public String getE01CUSLN3()
  {
    return fieldE01CUSLN3.getString();
  }

  /**
  * Set field E01CUSID4 using a String value.
  */
  public void setE01CUSID4(String newvalue)
  {
    fieldE01CUSID4.setString(newvalue);
  }

  /**
  * Get value of field E01CUSID4 as a String.
  */
  public String getE01CUSID4()
  {
    return fieldE01CUSID4.getString();
  }

  /**
  * Set field E01CUFFIR using a String value.
  */
  public void setE01CUFFIR(String newvalue)
  {
    fieldE01CUFFIR.setString(newvalue);
  }

  /**
  * Get value of field E01CUFFIR as a String.
  */
  public String getE01CUFFIR()
  {
    return fieldE01CUFFIR.getString();
  }

  /**
  * Set field E01CUFFIN using a String value.
  */
  public void setE01CUFFIN(String newvalue)
  {
    fieldE01CUFFIN.setString(newvalue);
  }

  /**
  * Get value of field E01CUFFIN as a String.
  */
  public String getE01CUFFIN()
  {
    return fieldE01CUFFIN.getString();
  }

  /**
  * Set field E01CUFLGL using a String value.
  */
  public void setE01CUFLGL(String newvalue)
  {
    fieldE01CUFLGL.setString(newvalue);
  }

  /**
  * Get value of field E01CUFLGL as a String.
  */
  public String getE01CUFLGL()
  {
    return fieldE01CUFLGL.getString();
  }

  /**
  * Set field E01CUFINT using a String value.
  */
  public void setE01CUFINT(String newvalue)
  {
    fieldE01CUFINT.setString(newvalue);
  }

  /**
  * Get value of field E01CUFINT as a String.
  */
  public String getE01CUFINT()
  {
    return fieldE01CUFINT.getString();
  }

  /**
  * Set field E01CUFRFM using a String value.
  */
  public void setE01CUFRFM(String newvalue)
  {
    fieldE01CUFRFM.setString(newvalue);
  }

  /**
  * Get value of field E01CUFRFM as a String.
  */
  public String getE01CUFRFM()
  {
    return fieldE01CUFRFM.getString();
  }

  /**
  * Set field E01CUFTER using a String value.
  */
  public void setE01CUFTER(String newvalue)
  {
    fieldE01CUFTER.setString(newvalue);
  }

  /**
  * Get value of field E01CUFTER as a String.
  */
  public String getE01CUFTER()
  {
    return fieldE01CUFTER.getString();
  }

  /**
  * Set numeric field E01CUFTER using a BigDecimal value.
  */
  public void setE01CUFTER(BigDecimal newvalue)
  {
    fieldE01CUFTER.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CUFTER as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CUFTER()
  {
    return fieldE01CUFTER.getBigDecimal();
  }

  /**
  * Set field E01CUFADM using a String value.
  */
  public void setE01CUFADM(String newvalue)
  {
    fieldE01CUFADM.setString(newvalue);
  }

  /**
  * Get value of field E01CUFADM as a String.
  */
  public String getE01CUFADM()
  {
    return fieldE01CUFADM.getString();
  }

  /**
  * Set field E01CUFADN using a String value.
  */
  public void setE01CUFADN(String newvalue)
  {
    fieldE01CUFADN.setString(newvalue);
  }

  /**
  * Get value of field E01CUFADN as a String.
  */
  public String getE01CUFADN()
  {
    return fieldE01CUFADN.getString();
  }

  /**
  * Set field E01CUSMD1 using a String value.
  */
  public void setE01CUSMD1(String newvalue)
  {
    fieldE01CUSMD1.setString(newvalue);
  }

  /**
  * Get value of field E01CUSMD1 as a String.
  */
  public String getE01CUSMD1()
  {
    return fieldE01CUSMD1.getString();
  }

  /**
  * Set numeric field E01CUSMD1 using a BigDecimal value.
  */
  public void setE01CUSMD1(BigDecimal newvalue)
  {
    fieldE01CUSMD1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CUSMD1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CUSMD1()
  {
    return fieldE01CUSMD1.getBigDecimal();
  }

  /**
  * Set field E01CUSMD2 using a String value.
  */
  public void setE01CUSMD2(String newvalue)
  {
    fieldE01CUSMD2.setString(newvalue);
  }

  /**
  * Get value of field E01CUSMD2 as a String.
  */
  public String getE01CUSMD2()
  {
    return fieldE01CUSMD2.getString();
  }

  /**
  * Set numeric field E01CUSMD2 using a BigDecimal value.
  */
  public void setE01CUSMD2(BigDecimal newvalue)
  {
    fieldE01CUSMD2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CUSMD2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CUSMD2()
  {
    return fieldE01CUSMD2.getBigDecimal();
  }

  /**
  * Set field E01CUSMD3 using a String value.
  */
  public void setE01CUSMD3(String newvalue)
  {
    fieldE01CUSMD3.setString(newvalue);
  }

  /**
  * Get value of field E01CUSMD3 as a String.
  */
  public String getE01CUSMD3()
  {
    return fieldE01CUSMD3.getString();
  }

  /**
  * Set numeric field E01CUSMD3 using a BigDecimal value.
  */
  public void setE01CUSMD3(BigDecimal newvalue)
  {
    fieldE01CUSMD3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CUSMD3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CUSMD3()
  {
    return fieldE01CUSMD3.getBigDecimal();
  }

  /**
  * Set field E01CUFMPA using a String value.
  */
  public void setE01CUFMPA(String newvalue)
  {
    fieldE01CUFMPA.setString(newvalue);
  }

  /**
  * Get value of field E01CUFMPA as a String.
  */
  public String getE01CUFMPA()
  {
    return fieldE01CUFMPA.getString();
  }

  /**
  * Set numeric field E01CUFMPA using a BigDecimal value.
  */
  public void setE01CUFMPA(BigDecimal newvalue)
  {
    fieldE01CUFMPA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CUFMPA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CUFMPA()
  {
    return fieldE01CUFMPA.getBigDecimal();
  }

  /**
  * Set field E01CUFCIR using a String value.
  */
  public void setE01CUFCIR(String newvalue)
  {
    fieldE01CUFCIR.setString(newvalue);
  }

  /**
  * Get value of field E01CUFCIR as a String.
  */
  public String getE01CUFCIR()
  {
    return fieldE01CUFCIR.getString();
  }

  /**
  * Set field E01CUFNDO using a String value.
  */
  public void setE01CUFNDO(String newvalue)
  {
    fieldE01CUFNDO.setString(newvalue);
  }

  /**
  * Get value of field E01CUFNDO as a String.
  */
  public String getE01CUFNDO()
  {
    return fieldE01CUFNDO.getString();
  }

  /**
  * Set numeric field E01CUFNDO using a BigDecimal value.
  */
  public void setE01CUFNDO(BigDecimal newvalue)
  {
    fieldE01CUFNDO.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CUFNDO as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CUFNDO()
  {
    return fieldE01CUFNDO.getBigDecimal();
  }

  /**
  * Set field E01CUFTOM using a String value.
  */
  public void setE01CUFTOM(String newvalue)
  {
    fieldE01CUFTOM.setString(newvalue);
  }

  /**
  * Get value of field E01CUFTOM as a String.
  */
  public String getE01CUFTOM()
  {
    return fieldE01CUFTOM.getString();
  }

  /**
  * Set field E01CUSRD1 using a String value.
  */
  public void setE01CUSRD1(String newvalue)
  {
    fieldE01CUSRD1.setString(newvalue);
  }

  /**
  * Get value of field E01CUSRD1 as a String.
  */
  public String getE01CUSRD1()
  {
    return fieldE01CUSRD1.getString();
  }

  /**
  * Set numeric field E01CUSRD1 using a BigDecimal value.
  */
  public void setE01CUSRD1(BigDecimal newvalue)
  {
    fieldE01CUSRD1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CUSRD1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CUSRD1()
  {
    return fieldE01CUSRD1.getBigDecimal();
  }

  /**
  * Set field E01CUSRD2 using a String value.
  */
  public void setE01CUSRD2(String newvalue)
  {
    fieldE01CUSRD2.setString(newvalue);
  }

  /**
  * Get value of field E01CUSRD2 as a String.
  */
  public String getE01CUSRD2()
  {
    return fieldE01CUSRD2.getString();
  }

  /**
  * Set numeric field E01CUSRD2 using a BigDecimal value.
  */
  public void setE01CUSRD2(BigDecimal newvalue)
  {
    fieldE01CUSRD2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CUSRD2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CUSRD2()
  {
    return fieldE01CUSRD2.getBigDecimal();
  }

  /**
  * Set field E01CUSRD3 using a String value.
  */
  public void setE01CUSRD3(String newvalue)
  {
    fieldE01CUSRD3.setString(newvalue);
  }

  /**
  * Get value of field E01CUSRD3 as a String.
  */
  public String getE01CUSRD3()
  {
    return fieldE01CUSRD3.getString();
  }

  /**
  * Set numeric field E01CUSRD3 using a BigDecimal value.
  */
  public void setE01CUSRD3(BigDecimal newvalue)
  {
    fieldE01CUSRD3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CUSRD3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CUSRD3()
  {
    return fieldE01CUSRD3.getBigDecimal();
  }

  /**
  * Set field E01CUSREN using a String value.
  */
  public void setE01CUSREN(String newvalue)
  {
    fieldE01CUSREN.setString(newvalue);
  }

  /**
  * Get value of field E01CUSREN as a String.
  */
  public String getE01CUSREN()
  {
    return fieldE01CUSREN.getString();
  }

  /**
  * Set field E01CUSOBS using a String value.
  */
  public void setE01CUSOBS(String newvalue)
  {
    fieldE01CUSOBS.setString(newvalue);
  }

  /**
  * Get value of field E01CUSOBS as a String.
  */
  public String getE01CUSOBS()
  {
    return fieldE01CUSOBS.getString();
  }

  /**
  * Set field E01CUSVD1 using a String value.
  */
  public void setE01CUSVD1(String newvalue)
  {
    fieldE01CUSVD1.setString(newvalue);
  }

  /**
  * Get value of field E01CUSVD1 as a String.
  */
  public String getE01CUSVD1()
  {
    return fieldE01CUSVD1.getString();
  }

  /**
  * Set numeric field E01CUSVD1 using a BigDecimal value.
  */
  public void setE01CUSVD1(BigDecimal newvalue)
  {
    fieldE01CUSVD1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CUSVD1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CUSVD1()
  {
    return fieldE01CUSVD1.getBigDecimal();
  }

  /**
  * Set field E01CUSVD2 using a String value.
  */
  public void setE01CUSVD2(String newvalue)
  {
    fieldE01CUSVD2.setString(newvalue);
  }

  /**
  * Get value of field E01CUSVD2 as a String.
  */
  public String getE01CUSVD2()
  {
    return fieldE01CUSVD2.getString();
  }

  /**
  * Set numeric field E01CUSVD2 using a BigDecimal value.
  */
  public void setE01CUSVD2(BigDecimal newvalue)
  {
    fieldE01CUSVD2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CUSVD2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CUSVD2()
  {
    return fieldE01CUSVD2.getBigDecimal();
  }

  /**
  * Set field E01CUSVD3 using a String value.
  */
  public void setE01CUSVD3(String newvalue)
  {
    fieldE01CUSVD3.setString(newvalue);
  }

  /**
  * Get value of field E01CUSVD3 as a String.
  */
  public String getE01CUSVD3()
  {
    return fieldE01CUSVD3.getString();
  }

  /**
  * Set numeric field E01CUSVD3 using a BigDecimal value.
  */
  public void setE01CUSVD3(BigDecimal newvalue)
  {
    fieldE01CUSVD3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CUSVD3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CUSVD3()
  {
    return fieldE01CUSVD3.getBigDecimal();
  }

  /**
  * Set field E01CUSTD1 using a String value.
  */
  public void setE01CUSTD1(String newvalue)
  {
    fieldE01CUSTD1.setString(newvalue);
  }

  /**
  * Get value of field E01CUSTD1 as a String.
  */
  public String getE01CUSTD1()
  {
    return fieldE01CUSTD1.getString();
  }

  /**
  * Set numeric field E01CUSTD1 using a BigDecimal value.
  */
  public void setE01CUSTD1(BigDecimal newvalue)
  {
    fieldE01CUSTD1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CUSTD1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CUSTD1()
  {
    return fieldE01CUSTD1.getBigDecimal();
  }

  /**
  * Set field E01CUSTD2 using a String value.
  */
  public void setE01CUSTD2(String newvalue)
  {
    fieldE01CUSTD2.setString(newvalue);
  }

  /**
  * Get value of field E01CUSTD2 as a String.
  */
  public String getE01CUSTD2()
  {
    return fieldE01CUSTD2.getString();
  }

  /**
  * Set numeric field E01CUSTD2 using a BigDecimal value.
  */
  public void setE01CUSTD2(BigDecimal newvalue)
  {
    fieldE01CUSTD2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CUSTD2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CUSTD2()
  {
    return fieldE01CUSTD2.getBigDecimal();
  }

  /**
  * Set field E01CUSTD3 using a String value.
  */
  public void setE01CUSTD3(String newvalue)
  {
    fieldE01CUSTD3.setString(newvalue);
  }

  /**
  * Get value of field E01CUSTD3 as a String.
  */
  public String getE01CUSTD3()
  {
    return fieldE01CUSTD3.getString();
  }

  /**
  * Set numeric field E01CUSTD3 using a BigDecimal value.
  */
  public void setE01CUSTD3(BigDecimal newvalue)
  {
    fieldE01CUSTD3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CUSTD3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CUSTD3()
  {
    return fieldE01CUSTD3.getBigDecimal();
  }

  /**
  * Set field E01CUFABO using a String value.
  */
  public void setE01CUFABO(String newvalue)
  {
    fieldE01CUFABO.setString(newvalue);
  }

  /**
  * Get value of field E01CUFABO as a String.
  */
  public String getE01CUFABO()
  {
    return fieldE01CUFABO.getString();
  }

}
