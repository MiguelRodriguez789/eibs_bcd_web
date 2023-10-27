package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDD093801 physical file definition.
* 
* File level identifier is 1130611112904.
* Record format level identifier is 3FE121DBC34E2.
*/

public class EDD093801Message extends MessageRecord
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
                                     "E01CDVCAU",
                                     "E01CDVCCY",
                                     "E01CDVDSC",
                                     "E01CDVDE1",
                                     "E01CDVDE2",
                                     "E01CDVDE3",
                                     "E01CDVDE4",
                                     "E01CDVCA1",
                                     "E01CDVCA2",
                                     "E01CDVCA3",
                                     "E01CDVCA4",
                                     "E01CDVCF1",
                                     "E01CDVCF2",
                                     "E01CDVCF3",
                                     "E01CDVCF4",
                                     "E01CDVMX1",
                                     "E01CDVMX2",
                                     "E01CDVMX3",
                                     "E01CDVMX4",
                                     "E01CDVMN1",
                                     "E01CDVMN2",
                                     "E01CDVMN3",
                                     "E01CDVMN4",
                                     "E01CDVGL1",
                                     "E01CDVGL2",
                                     "E01CDVGL3",
                                     "E01CDVGL4",
                                     "E01CDVGF1",
                                     "E01CDVGF2",
                                     "E01CDVGF3",
                                     "E01CDVGF4",
                                     "E01CDVAP1",
                                     "E01CDVAP2",
                                     "E01CDVAP3",
                                     "E01CDVAP4",
                                     "E01CDVIV1",
                                     "E01CDVIV2",
                                     "E01CDVIV3",
                                     "E01CDVIV4",
                                     "E01CDVDEB",
                                     "E01CDVFLG",
                                     "E01CDVRES",
                                     "E01CDVALT",
                                     "E01CDVUC1",
                                     "E01CDVUC2",
                                     "E01CDVFL1",
                                     "E01CDVFL2"
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
                                   "E01CDVCAU",
                                   "E01CDVCCY",
                                   "E01CDVDSC",
                                   "E01CDVDE1",
                                   "E01CDVDE2",
                                   "E01CDVDE3",
                                   "E01CDVDE4",
                                   "E01CDVCA1",
                                   "E01CDVCA2",
                                   "E01CDVCA3",
                                   "E01CDVCA4",
                                   "E01CDVCF1",
                                   "E01CDVCF2",
                                   "E01CDVCF3",
                                   "E01CDVCF4",
                                   "E01CDVMX1",
                                   "E01CDVMX2",
                                   "E01CDVMX3",
                                   "E01CDVMX4",
                                   "E01CDVMN1",
                                   "E01CDVMN2",
                                   "E01CDVMN3",
                                   "E01CDVMN4",
                                   "E01CDVGL1",
                                   "E01CDVGL2",
                                   "E01CDVGL3",
                                   "E01CDVGL4",
                                   "E01CDVGF1",
                                   "E01CDVGF2",
                                   "E01CDVGF3",
                                   "E01CDVGF4",
                                   "E01CDVAP1",
                                   "E01CDVAP2",
                                   "E01CDVAP3",
                                   "E01CDVAP4",
                                   "E01CDVIV1",
                                   "E01CDVIV2",
                                   "E01CDVIV3",
                                   "E01CDVIV4",
                                   "E01CDVDEB",
                                   "E01CDVFLG",
                                   "E01CDVRES",
                                   "E01CDVALT",
                                   "E01CDVUC1",
                                   "E01CDVUC2",
                                   "E01CDVFL1",
                                   "E01CDVFL2"
                                 };
  final static String fid = "1130611112904";
  final static String rid = "3FE121DBC34E2";
  final static String fmtname = "EDD093801";
  final int FIELDCOUNT = 56;
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
  private CharacterField fieldE01CDVCAU = null;
  private CharacterField fieldE01CDVCCY = null;
  private CharacterField fieldE01CDVDSC = null;
  private CharacterField fieldE01CDVDE1 = null;
  private CharacterField fieldE01CDVDE2 = null;
  private CharacterField fieldE01CDVDE3 = null;
  private CharacterField fieldE01CDVDE4 = null;
  private DecimalField fieldE01CDVCA1 = null;
  private DecimalField fieldE01CDVCA2 = null;
  private DecimalField fieldE01CDVCA3 = null;
  private DecimalField fieldE01CDVCA4 = null;
  private CharacterField fieldE01CDVCF1 = null;
  private CharacterField fieldE01CDVCF2 = null;
  private CharacterField fieldE01CDVCF3 = null;
  private CharacterField fieldE01CDVCF4 = null;
  private DecimalField fieldE01CDVMX1 = null;
  private DecimalField fieldE01CDVMX2 = null;
  private DecimalField fieldE01CDVMX3 = null;
  private DecimalField fieldE01CDVMX4 = null;
  private DecimalField fieldE01CDVMN1 = null;
  private DecimalField fieldE01CDVMN2 = null;
  private DecimalField fieldE01CDVMN3 = null;
  private DecimalField fieldE01CDVMN4 = null;
  private DecimalField fieldE01CDVGL1 = null;
  private DecimalField fieldE01CDVGL2 = null;
  private DecimalField fieldE01CDVGL3 = null;
  private DecimalField fieldE01CDVGL4 = null;
  private CharacterField fieldE01CDVGF1 = null;
  private CharacterField fieldE01CDVGF2 = null;
  private CharacterField fieldE01CDVGF3 = null;
  private CharacterField fieldE01CDVGF4 = null;
  private CharacterField fieldE01CDVAP1 = null;
  private CharacterField fieldE01CDVAP2 = null;
  private CharacterField fieldE01CDVAP3 = null;
  private CharacterField fieldE01CDVAP4 = null;
  private CharacterField fieldE01CDVIV1 = null;
  private CharacterField fieldE01CDVIV2 = null;
  private CharacterField fieldE01CDVIV3 = null;
  private CharacterField fieldE01CDVIV4 = null;
  private CharacterField fieldE01CDVDEB = null;
  private CharacterField fieldE01CDVFLG = null;
  private CharacterField fieldE01CDVRES = null;
  private CharacterField fieldE01CDVALT = null;
  private CharacterField fieldE01CDVUC1 = null;
  private CharacterField fieldE01CDVUC2 = null;
  private CharacterField fieldE01CDVFL1 = null;
  private CharacterField fieldE01CDVFL2 = null;

  /**
  * Constructor for EDD093801Message.
  */
  public EDD093801Message()
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
    recordsize = 633;
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
    fields[9] = fieldE01CDVCAU =
    new CharacterField(message, HEADERSIZE + 42, 4, "E01CDVCAU");
    fields[10] = fieldE01CDVCCY =
    new CharacterField(message, HEADERSIZE + 46, 3, "E01CDVCCY");
    fields[11] = fieldE01CDVDSC =
    new CharacterField(message, HEADERSIZE + 49, 45, "E01CDVDSC");
    fields[12] = fieldE01CDVDE1 =
    new CharacterField(message, HEADERSIZE + 94, 60, "E01CDVDE1");
    fields[13] = fieldE01CDVDE2 =
    new CharacterField(message, HEADERSIZE + 154, 60, "E01CDVDE2");
    fields[14] = fieldE01CDVDE3 =
    new CharacterField(message, HEADERSIZE + 214, 60, "E01CDVDE3");
    fields[15] = fieldE01CDVDE4 =
    new CharacterField(message, HEADERSIZE + 274, 60, "E01CDVDE4");
    fields[16] = fieldE01CDVCA1 =
    new DecimalField(message, HEADERSIZE + 334, 19, 4, "E01CDVCA1");
    fields[17] = fieldE01CDVCA2 =
    new DecimalField(message, HEADERSIZE + 353, 19, 4, "E01CDVCA2");
    fields[18] = fieldE01CDVCA3 =
    new DecimalField(message, HEADERSIZE + 372, 19, 4, "E01CDVCA3");
    fields[19] = fieldE01CDVCA4 =
    new DecimalField(message, HEADERSIZE + 391, 19, 4, "E01CDVCA4");
    fields[20] = fieldE01CDVCF1 =
    new CharacterField(message, HEADERSIZE + 410, 1, "E01CDVCF1");
    fields[21] = fieldE01CDVCF2 =
    new CharacterField(message, HEADERSIZE + 411, 1, "E01CDVCF2");
    fields[22] = fieldE01CDVCF3 =
    new CharacterField(message, HEADERSIZE + 412, 1, "E01CDVCF3");
    fields[23] = fieldE01CDVCF4 =
    new CharacterField(message, HEADERSIZE + 413, 1, "E01CDVCF4");
    fields[24] = fieldE01CDVMX1 =
    new DecimalField(message, HEADERSIZE + 414, 15, 2, "E01CDVMX1");
    fields[25] = fieldE01CDVMX2 =
    new DecimalField(message, HEADERSIZE + 429, 15, 2, "E01CDVMX2");
    fields[26] = fieldE01CDVMX3 =
    new DecimalField(message, HEADERSIZE + 444, 15, 2, "E01CDVMX3");
    fields[27] = fieldE01CDVMX4 =
    new DecimalField(message, HEADERSIZE + 459, 15, 2, "E01CDVMX4");
    fields[28] = fieldE01CDVMN1 =
    new DecimalField(message, HEADERSIZE + 474, 15, 2, "E01CDVMN1");
    fields[29] = fieldE01CDVMN2 =
    new DecimalField(message, HEADERSIZE + 489, 15, 2, "E01CDVMN2");
    fields[30] = fieldE01CDVMN3 =
    new DecimalField(message, HEADERSIZE + 504, 15, 2, "E01CDVMN3");
    fields[31] = fieldE01CDVMN4 =
    new DecimalField(message, HEADERSIZE + 519, 15, 2, "E01CDVMN4");
    fields[32] = fieldE01CDVGL1 =
    new DecimalField(message, HEADERSIZE + 534, 17, 0, "E01CDVGL1");
    fields[33] = fieldE01CDVGL2 =
    new DecimalField(message, HEADERSIZE + 551, 17, 0, "E01CDVGL2");
    fields[34] = fieldE01CDVGL3 =
    new DecimalField(message, HEADERSIZE + 568, 17, 0, "E01CDVGL3");
    fields[35] = fieldE01CDVGL4 =
    new DecimalField(message, HEADERSIZE + 585, 17, 0, "E01CDVGL4");
    fields[36] = fieldE01CDVGF1 =
    new CharacterField(message, HEADERSIZE + 602, 1, "E01CDVGF1");
    fields[37] = fieldE01CDVGF2 =
    new CharacterField(message, HEADERSIZE + 603, 1, "E01CDVGF2");
    fields[38] = fieldE01CDVGF3 =
    new CharacterField(message, HEADERSIZE + 604, 1, "E01CDVGF3");
    fields[39] = fieldE01CDVGF4 =
    new CharacterField(message, HEADERSIZE + 605, 1, "E01CDVGF4");
    fields[40] = fieldE01CDVAP1 =
    new CharacterField(message, HEADERSIZE + 606, 1, "E01CDVAP1");
    fields[41] = fieldE01CDVAP2 =
    new CharacterField(message, HEADERSIZE + 607, 1, "E01CDVAP2");
    fields[42] = fieldE01CDVAP3 =
    new CharacterField(message, HEADERSIZE + 608, 1, "E01CDVAP3");
    fields[43] = fieldE01CDVAP4 =
    new CharacterField(message, HEADERSIZE + 609, 1, "E01CDVAP4");
    fields[44] = fieldE01CDVIV1 =
    new CharacterField(message, HEADERSIZE + 610, 1, "E01CDVIV1");
    fields[45] = fieldE01CDVIV2 =
    new CharacterField(message, HEADERSIZE + 611, 1, "E01CDVIV2");
    fields[46] = fieldE01CDVIV3 =
    new CharacterField(message, HEADERSIZE + 612, 1, "E01CDVIV3");
    fields[47] = fieldE01CDVIV4 =
    new CharacterField(message, HEADERSIZE + 613, 1, "E01CDVIV4");
    fields[48] = fieldE01CDVDEB =
    new CharacterField(message, HEADERSIZE + 614, 1, "E01CDVDEB");
    fields[49] = fieldE01CDVFLG =
    new CharacterField(message, HEADERSIZE + 615, 1, "E01CDVFLG");
    fields[50] = fieldE01CDVRES =
    new CharacterField(message, HEADERSIZE + 616, 1, "E01CDVRES");
    fields[51] = fieldE01CDVALT =
    new CharacterField(message, HEADERSIZE + 617, 6, "E01CDVALT");
    fields[52] = fieldE01CDVUC1 =
    new CharacterField(message, HEADERSIZE + 623, 4, "E01CDVUC1");
    fields[53] = fieldE01CDVUC2 =
    new CharacterField(message, HEADERSIZE + 627, 4, "E01CDVUC2");
    fields[54] = fieldE01CDVFL1 =
    new CharacterField(message, HEADERSIZE + 631, 1, "E01CDVFL1");
    fields[55] = fieldE01CDVFL2 =
    new CharacterField(message, HEADERSIZE + 632, 1, "E01CDVFL2");

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
  * Set field E01CDVCAU using a String value.
  */
  public void setE01CDVCAU(String newvalue)
  {
    fieldE01CDVCAU.setString(newvalue);
  }

  /**
  * Get value of field E01CDVCAU as a String.
  */
  public String getE01CDVCAU()
  {
    return fieldE01CDVCAU.getString();
  }

  /**
  * Set field E01CDVCCY using a String value.
  */
  public void setE01CDVCCY(String newvalue)
  {
    fieldE01CDVCCY.setString(newvalue);
  }

  /**
  * Get value of field E01CDVCCY as a String.
  */
  public String getE01CDVCCY()
  {
    return fieldE01CDVCCY.getString();
  }

  /**
  * Set field E01CDVDSC using a String value.
  */
  public void setE01CDVDSC(String newvalue)
  {
    fieldE01CDVDSC.setString(newvalue);
  }

  /**
  * Get value of field E01CDVDSC as a String.
  */
  public String getE01CDVDSC()
  {
    return fieldE01CDVDSC.getString();
  }

  /**
  * Set field E01CDVDE1 using a String value.
  */
  public void setE01CDVDE1(String newvalue)
  {
    fieldE01CDVDE1.setString(newvalue);
  }

  /**
  * Get value of field E01CDVDE1 as a String.
  */
  public String getE01CDVDE1()
  {
    return fieldE01CDVDE1.getString();
  }

  /**
  * Set field E01CDVDE2 using a String value.
  */
  public void setE01CDVDE2(String newvalue)
  {
    fieldE01CDVDE2.setString(newvalue);
  }

  /**
  * Get value of field E01CDVDE2 as a String.
  */
  public String getE01CDVDE2()
  {
    return fieldE01CDVDE2.getString();
  }

  /**
  * Set field E01CDVDE3 using a String value.
  */
  public void setE01CDVDE3(String newvalue)
  {
    fieldE01CDVDE3.setString(newvalue);
  }

  /**
  * Get value of field E01CDVDE3 as a String.
  */
  public String getE01CDVDE3()
  {
    return fieldE01CDVDE3.getString();
  }

  /**
  * Set field E01CDVDE4 using a String value.
  */
  public void setE01CDVDE4(String newvalue)
  {
    fieldE01CDVDE4.setString(newvalue);
  }

  /**
  * Get value of field E01CDVDE4 as a String.
  */
  public String getE01CDVDE4()
  {
    return fieldE01CDVDE4.getString();
  }

  /**
  * Set field E01CDVCA1 using a String value.
  */
  public void setE01CDVCA1(String newvalue)
  {
    fieldE01CDVCA1.setString(newvalue);
  }

  /**
  * Get value of field E01CDVCA1 as a String.
  */
  public String getE01CDVCA1()
  {
    return fieldE01CDVCA1.getString();
  }

  /**
  * Set numeric field E01CDVCA1 using a BigDecimal value.
  */
  public void setE01CDVCA1(BigDecimal newvalue)
  {
    fieldE01CDVCA1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDVCA1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDVCA1()
  {
    return fieldE01CDVCA1.getBigDecimal();
  }

  /**
  * Set field E01CDVCA2 using a String value.
  */
  public void setE01CDVCA2(String newvalue)
  {
    fieldE01CDVCA2.setString(newvalue);
  }

  /**
  * Get value of field E01CDVCA2 as a String.
  */
  public String getE01CDVCA2()
  {
    return fieldE01CDVCA2.getString();
  }

  /**
  * Set numeric field E01CDVCA2 using a BigDecimal value.
  */
  public void setE01CDVCA2(BigDecimal newvalue)
  {
    fieldE01CDVCA2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDVCA2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDVCA2()
  {
    return fieldE01CDVCA2.getBigDecimal();
  }

  /**
  * Set field E01CDVCA3 using a String value.
  */
  public void setE01CDVCA3(String newvalue)
  {
    fieldE01CDVCA3.setString(newvalue);
  }

  /**
  * Get value of field E01CDVCA3 as a String.
  */
  public String getE01CDVCA3()
  {
    return fieldE01CDVCA3.getString();
  }

  /**
  * Set numeric field E01CDVCA3 using a BigDecimal value.
  */
  public void setE01CDVCA3(BigDecimal newvalue)
  {
    fieldE01CDVCA3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDVCA3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDVCA3()
  {
    return fieldE01CDVCA3.getBigDecimal();
  }

  /**
  * Set field E01CDVCA4 using a String value.
  */
  public void setE01CDVCA4(String newvalue)
  {
    fieldE01CDVCA4.setString(newvalue);
  }

  /**
  * Get value of field E01CDVCA4 as a String.
  */
  public String getE01CDVCA4()
  {
    return fieldE01CDVCA4.getString();
  }

  /**
  * Set numeric field E01CDVCA4 using a BigDecimal value.
  */
  public void setE01CDVCA4(BigDecimal newvalue)
  {
    fieldE01CDVCA4.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDVCA4 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDVCA4()
  {
    return fieldE01CDVCA4.getBigDecimal();
  }

  /**
  * Set field E01CDVCF1 using a String value.
  */
  public void setE01CDVCF1(String newvalue)
  {
    fieldE01CDVCF1.setString(newvalue);
  }

  /**
  * Get value of field E01CDVCF1 as a String.
  */
  public String getE01CDVCF1()
  {
    return fieldE01CDVCF1.getString();
  }

  /**
  * Set field E01CDVCF2 using a String value.
  */
  public void setE01CDVCF2(String newvalue)
  {
    fieldE01CDVCF2.setString(newvalue);
  }

  /**
  * Get value of field E01CDVCF2 as a String.
  */
  public String getE01CDVCF2()
  {
    return fieldE01CDVCF2.getString();
  }

  /**
  * Set field E01CDVCF3 using a String value.
  */
  public void setE01CDVCF3(String newvalue)
  {
    fieldE01CDVCF3.setString(newvalue);
  }

  /**
  * Get value of field E01CDVCF3 as a String.
  */
  public String getE01CDVCF3()
  {
    return fieldE01CDVCF3.getString();
  }

  /**
  * Set field E01CDVCF4 using a String value.
  */
  public void setE01CDVCF4(String newvalue)
  {
    fieldE01CDVCF4.setString(newvalue);
  }

  /**
  * Get value of field E01CDVCF4 as a String.
  */
  public String getE01CDVCF4()
  {
    return fieldE01CDVCF4.getString();
  }

  /**
  * Set field E01CDVMX1 using a String value.
  */
  public void setE01CDVMX1(String newvalue)
  {
    fieldE01CDVMX1.setString(newvalue);
  }

  /**
  * Get value of field E01CDVMX1 as a String.
  */
  public String getE01CDVMX1()
  {
    return fieldE01CDVMX1.getString();
  }

  /**
  * Set numeric field E01CDVMX1 using a BigDecimal value.
  */
  public void setE01CDVMX1(BigDecimal newvalue)
  {
    fieldE01CDVMX1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDVMX1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDVMX1()
  {
    return fieldE01CDVMX1.getBigDecimal();
  }

  /**
  * Set field E01CDVMX2 using a String value.
  */
  public void setE01CDVMX2(String newvalue)
  {
    fieldE01CDVMX2.setString(newvalue);
  }

  /**
  * Get value of field E01CDVMX2 as a String.
  */
  public String getE01CDVMX2()
  {
    return fieldE01CDVMX2.getString();
  }

  /**
  * Set numeric field E01CDVMX2 using a BigDecimal value.
  */
  public void setE01CDVMX2(BigDecimal newvalue)
  {
    fieldE01CDVMX2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDVMX2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDVMX2()
  {
    return fieldE01CDVMX2.getBigDecimal();
  }

  /**
  * Set field E01CDVMX3 using a String value.
  */
  public void setE01CDVMX3(String newvalue)
  {
    fieldE01CDVMX3.setString(newvalue);
  }

  /**
  * Get value of field E01CDVMX3 as a String.
  */
  public String getE01CDVMX3()
  {
    return fieldE01CDVMX3.getString();
  }

  /**
  * Set numeric field E01CDVMX3 using a BigDecimal value.
  */
  public void setE01CDVMX3(BigDecimal newvalue)
  {
    fieldE01CDVMX3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDVMX3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDVMX3()
  {
    return fieldE01CDVMX3.getBigDecimal();
  }

  /**
  * Set field E01CDVMX4 using a String value.
  */
  public void setE01CDVMX4(String newvalue)
  {
    fieldE01CDVMX4.setString(newvalue);
  }

  /**
  * Get value of field E01CDVMX4 as a String.
  */
  public String getE01CDVMX4()
  {
    return fieldE01CDVMX4.getString();
  }

  /**
  * Set numeric field E01CDVMX4 using a BigDecimal value.
  */
  public void setE01CDVMX4(BigDecimal newvalue)
  {
    fieldE01CDVMX4.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDVMX4 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDVMX4()
  {
    return fieldE01CDVMX4.getBigDecimal();
  }

  /**
  * Set field E01CDVMN1 using a String value.
  */
  public void setE01CDVMN1(String newvalue)
  {
    fieldE01CDVMN1.setString(newvalue);
  }

  /**
  * Get value of field E01CDVMN1 as a String.
  */
  public String getE01CDVMN1()
  {
    return fieldE01CDVMN1.getString();
  }

  /**
  * Set numeric field E01CDVMN1 using a BigDecimal value.
  */
  public void setE01CDVMN1(BigDecimal newvalue)
  {
    fieldE01CDVMN1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDVMN1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDVMN1()
  {
    return fieldE01CDVMN1.getBigDecimal();
  }

  /**
  * Set field E01CDVMN2 using a String value.
  */
  public void setE01CDVMN2(String newvalue)
  {
    fieldE01CDVMN2.setString(newvalue);
  }

  /**
  * Get value of field E01CDVMN2 as a String.
  */
  public String getE01CDVMN2()
  {
    return fieldE01CDVMN2.getString();
  }

  /**
  * Set numeric field E01CDVMN2 using a BigDecimal value.
  */
  public void setE01CDVMN2(BigDecimal newvalue)
  {
    fieldE01CDVMN2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDVMN2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDVMN2()
  {
    return fieldE01CDVMN2.getBigDecimal();
  }

  /**
  * Set field E01CDVMN3 using a String value.
  */
  public void setE01CDVMN3(String newvalue)
  {
    fieldE01CDVMN3.setString(newvalue);
  }

  /**
  * Get value of field E01CDVMN3 as a String.
  */
  public String getE01CDVMN3()
  {
    return fieldE01CDVMN3.getString();
  }

  /**
  * Set numeric field E01CDVMN3 using a BigDecimal value.
  */
  public void setE01CDVMN3(BigDecimal newvalue)
  {
    fieldE01CDVMN3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDVMN3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDVMN3()
  {
    return fieldE01CDVMN3.getBigDecimal();
  }

  /**
  * Set field E01CDVMN4 using a String value.
  */
  public void setE01CDVMN4(String newvalue)
  {
    fieldE01CDVMN4.setString(newvalue);
  }

  /**
  * Get value of field E01CDVMN4 as a String.
  */
  public String getE01CDVMN4()
  {
    return fieldE01CDVMN4.getString();
  }

  /**
  * Set numeric field E01CDVMN4 using a BigDecimal value.
  */
  public void setE01CDVMN4(BigDecimal newvalue)
  {
    fieldE01CDVMN4.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDVMN4 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDVMN4()
  {
    return fieldE01CDVMN4.getBigDecimal();
  }

  /**
  * Set field E01CDVGL1 using a String value.
  */
  public void setE01CDVGL1(String newvalue)
  {
    fieldE01CDVGL1.setString(newvalue);
  }

  /**
  * Get value of field E01CDVGL1 as a String.
  */
  public String getE01CDVGL1()
  {
    return fieldE01CDVGL1.getString();
  }

  /**
  * Set numeric field E01CDVGL1 using a BigDecimal value.
  */
  public void setE01CDVGL1(BigDecimal newvalue)
  {
    fieldE01CDVGL1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDVGL1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDVGL1()
  {
    return fieldE01CDVGL1.getBigDecimal();
  }

  /**
  * Set field E01CDVGL2 using a String value.
  */
  public void setE01CDVGL2(String newvalue)
  {
    fieldE01CDVGL2.setString(newvalue);
  }

  /**
  * Get value of field E01CDVGL2 as a String.
  */
  public String getE01CDVGL2()
  {
    return fieldE01CDVGL2.getString();
  }

  /**
  * Set numeric field E01CDVGL2 using a BigDecimal value.
  */
  public void setE01CDVGL2(BigDecimal newvalue)
  {
    fieldE01CDVGL2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDVGL2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDVGL2()
  {
    return fieldE01CDVGL2.getBigDecimal();
  }

  /**
  * Set field E01CDVGL3 using a String value.
  */
  public void setE01CDVGL3(String newvalue)
  {
    fieldE01CDVGL3.setString(newvalue);
  }

  /**
  * Get value of field E01CDVGL3 as a String.
  */
  public String getE01CDVGL3()
  {
    return fieldE01CDVGL3.getString();
  }

  /**
  * Set numeric field E01CDVGL3 using a BigDecimal value.
  */
  public void setE01CDVGL3(BigDecimal newvalue)
  {
    fieldE01CDVGL3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDVGL3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDVGL3()
  {
    return fieldE01CDVGL3.getBigDecimal();
  }

  /**
  * Set field E01CDVGL4 using a String value.
  */
  public void setE01CDVGL4(String newvalue)
  {
    fieldE01CDVGL4.setString(newvalue);
  }

  /**
  * Get value of field E01CDVGL4 as a String.
  */
  public String getE01CDVGL4()
  {
    return fieldE01CDVGL4.getString();
  }

  /**
  * Set numeric field E01CDVGL4 using a BigDecimal value.
  */
  public void setE01CDVGL4(BigDecimal newvalue)
  {
    fieldE01CDVGL4.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDVGL4 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDVGL4()
  {
    return fieldE01CDVGL4.getBigDecimal();
  }

  /**
  * Set field E01CDVGF1 using a String value.
  */
  public void setE01CDVGF1(String newvalue)
  {
    fieldE01CDVGF1.setString(newvalue);
  }

  /**
  * Get value of field E01CDVGF1 as a String.
  */
  public String getE01CDVGF1()
  {
    return fieldE01CDVGF1.getString();
  }

  /**
  * Set field E01CDVGF2 using a String value.
  */
  public void setE01CDVGF2(String newvalue)
  {
    fieldE01CDVGF2.setString(newvalue);
  }

  /**
  * Get value of field E01CDVGF2 as a String.
  */
  public String getE01CDVGF2()
  {
    return fieldE01CDVGF2.getString();
  }

  /**
  * Set field E01CDVGF3 using a String value.
  */
  public void setE01CDVGF3(String newvalue)
  {
    fieldE01CDVGF3.setString(newvalue);
  }

  /**
  * Get value of field E01CDVGF3 as a String.
  */
  public String getE01CDVGF3()
  {
    return fieldE01CDVGF3.getString();
  }

  /**
  * Set field E01CDVGF4 using a String value.
  */
  public void setE01CDVGF4(String newvalue)
  {
    fieldE01CDVGF4.setString(newvalue);
  }

  /**
  * Get value of field E01CDVGF4 as a String.
  */
  public String getE01CDVGF4()
  {
    return fieldE01CDVGF4.getString();
  }

  /**
  * Set field E01CDVAP1 using a String value.
  */
  public void setE01CDVAP1(String newvalue)
  {
    fieldE01CDVAP1.setString(newvalue);
  }

  /**
  * Get value of field E01CDVAP1 as a String.
  */
  public String getE01CDVAP1()
  {
    return fieldE01CDVAP1.getString();
  }

  /**
  * Set field E01CDVAP2 using a String value.
  */
  public void setE01CDVAP2(String newvalue)
  {
    fieldE01CDVAP2.setString(newvalue);
  }

  /**
  * Get value of field E01CDVAP2 as a String.
  */
  public String getE01CDVAP2()
  {
    return fieldE01CDVAP2.getString();
  }

  /**
  * Set field E01CDVAP3 using a String value.
  */
  public void setE01CDVAP3(String newvalue)
  {
    fieldE01CDVAP3.setString(newvalue);
  }

  /**
  * Get value of field E01CDVAP3 as a String.
  */
  public String getE01CDVAP3()
  {
    return fieldE01CDVAP3.getString();
  }

  /**
  * Set field E01CDVAP4 using a String value.
  */
  public void setE01CDVAP4(String newvalue)
  {
    fieldE01CDVAP4.setString(newvalue);
  }

  /**
  * Get value of field E01CDVAP4 as a String.
  */
  public String getE01CDVAP4()
  {
    return fieldE01CDVAP4.getString();
  }

  /**
  * Set field E01CDVIV1 using a String value.
  */
  public void setE01CDVIV1(String newvalue)
  {
    fieldE01CDVIV1.setString(newvalue);
  }

  /**
  * Get value of field E01CDVIV1 as a String.
  */
  public String getE01CDVIV1()
  {
    return fieldE01CDVIV1.getString();
  }

  /**
  * Set field E01CDVIV2 using a String value.
  */
  public void setE01CDVIV2(String newvalue)
  {
    fieldE01CDVIV2.setString(newvalue);
  }

  /**
  * Get value of field E01CDVIV2 as a String.
  */
  public String getE01CDVIV2()
  {
    return fieldE01CDVIV2.getString();
  }

  /**
  * Set field E01CDVIV3 using a String value.
  */
  public void setE01CDVIV3(String newvalue)
  {
    fieldE01CDVIV3.setString(newvalue);
  }

  /**
  * Get value of field E01CDVIV3 as a String.
  */
  public String getE01CDVIV3()
  {
    return fieldE01CDVIV3.getString();
  }

  /**
  * Set field E01CDVIV4 using a String value.
  */
  public void setE01CDVIV4(String newvalue)
  {
    fieldE01CDVIV4.setString(newvalue);
  }

  /**
  * Get value of field E01CDVIV4 as a String.
  */
  public String getE01CDVIV4()
  {
    return fieldE01CDVIV4.getString();
  }

  /**
  * Set field E01CDVDEB using a String value.
  */
  public void setE01CDVDEB(String newvalue)
  {
    fieldE01CDVDEB.setString(newvalue);
  }

  /**
  * Get value of field E01CDVDEB as a String.
  */
  public String getE01CDVDEB()
  {
    return fieldE01CDVDEB.getString();
  }

  /**
  * Set field E01CDVFLG using a String value.
  */
  public void setE01CDVFLG(String newvalue)
  {
    fieldE01CDVFLG.setString(newvalue);
  }

  /**
  * Get value of field E01CDVFLG as a String.
  */
  public String getE01CDVFLG()
  {
    return fieldE01CDVFLG.getString();
  }

  /**
  * Set field E01CDVRES using a String value.
  */
  public void setE01CDVRES(String newvalue)
  {
    fieldE01CDVRES.setString(newvalue);
  }

  /**
  * Get value of field E01CDVRES as a String.
  */
  public String getE01CDVRES()
  {
    return fieldE01CDVRES.getString();
  }

  /**
  * Set field E01CDVALT using a String value.
  */
  public void setE01CDVALT(String newvalue)
  {
    fieldE01CDVALT.setString(newvalue);
  }

  /**
  * Get value of field E01CDVALT as a String.
  */
  public String getE01CDVALT()
  {
    return fieldE01CDVALT.getString();
  }

  /**
  * Set field E01CDVUC1 using a String value.
  */
  public void setE01CDVUC1(String newvalue)
  {
    fieldE01CDVUC1.setString(newvalue);
  }

  /**
  * Get value of field E01CDVUC1 as a String.
  */
  public String getE01CDVUC1()
  {
    return fieldE01CDVUC1.getString();
  }

  /**
  * Set field E01CDVUC2 using a String value.
  */
  public void setE01CDVUC2(String newvalue)
  {
    fieldE01CDVUC2.setString(newvalue);
  }

  /**
  * Get value of field E01CDVUC2 as a String.
  */
  public String getE01CDVUC2()
  {
    return fieldE01CDVUC2.getString();
  }

  /**
  * Set field E01CDVFL1 using a String value.
  */
  public void setE01CDVFL1(String newvalue)
  {
    fieldE01CDVFL1.setString(newvalue);
  }

  /**
  * Get value of field E01CDVFL1 as a String.
  */
  public String getE01CDVFL1()
  {
    return fieldE01CDVFL1.getString();
  }

  /**
  * Set field E01CDVFL2 using a String value.
  */
  public void setE01CDVFL2(String newvalue)
  {
    fieldE01CDVFL2.setString(newvalue);
  }

  /**
  * Get value of field E01CDVFL2 as a String.
  */
  public String getE01CDVFL2()
  {
    return fieldE01CDVFL2.getString();
  }

}
